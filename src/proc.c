
#include "global.h"
#include "proc.h"

enum
{
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};

#define MAX_PROC_COUNT 64

EWRAM_DATA static Proc_t sProcArray[MAX_PROC_COUNT] = {0}; 

EWRAM_DATA static Proc_t *sProcAllocList[MAX_PROC_COUNT + 1] = {0};
EWRAM_DATA static Proc_t **sProcAllocListHead = NULL; // pointer to next entry in sProcAllocList

ProcPtr EWRAM_DATA gProcTreeRootArray[8] = {0};

static Proc_t* AllocateProcess(void);
static void FreeProcess(Proc_t *proc);
static void InsertRootProcess(Proc_t *proc, int rootIndex);
static void InsertChildProcess(Proc_t *proc, Proc_t *parent);
static void UnlinkProcess(Proc_t *proc);
static void RunProcessScript(Proc_t *proc);

void InitProcs(void)
{
    int i;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        Proc_t *proc = &sProcArray[i];

        proc->proc_script = NULL;
        proc->proc_scrCur = NULL;
        proc->proc_endFunc = NULL;
        proc->proc_repeatFunc = NULL;
        proc->proc_name = NULL;
        proc->proc_parent = NULL;
        proc->proc_child = NULL;
        proc->proc_next = NULL;
        proc->proc_prev = NULL;
        proc->proc_sleepTime = 0;
        proc->proc_mark = 0;
        proc->proc_flags = 0;
        proc->proc_lockCnt = 0;

        sProcAllocList[i] = proc;
    }

    sProcAllocList[MAX_PROC_COUNT] = NULL;
    sProcAllocListHead = sProcAllocList;

    for (i = 0; i < 8; i++)
        ROOT_PROC(i) = NULL;
}

ProcPtr SpawnProc(const struct ProcScr* script, ProcPtr parent)
{
    Proc_t* proc = AllocateProcess();

    proc->proc_script = script;
    proc->proc_scrCur = script;
    proc->proc_endFunc = NULL;
    proc->proc_repeatFunc = NULL;
    proc->proc_parent = NULL;
    proc->proc_child = NULL;
    proc->proc_next = NULL;
    proc->proc_prev = NULL;
    proc->proc_sleepTime = 0;
    proc->proc_mark = 0;
    proc->proc_lockCnt = 0;

    proc->proc_flags = PROC_FLAG_STARTING;

    if ((int) parent < 8) // If this is an integer less than 8, then add a root proc
        InsertRootProcess(proc, (int) parent);
    else
        InsertChildProcess(proc, parent);

    RunProcessScript(proc);

    proc->proc_flags &= ~PROC_FLAG_STARTING;

    return proc;
}

// Creates a child process and puts the parent into a wait state
ProcPtr SpawnProcLocking(const struct ProcScr *script, ProcPtr parent)
{
    Proc_t *proc = SpawnProc(script, parent);

    if (proc->proc_script == NULL)
        return NULL;

    proc->proc_flags |= PROC_FLAG_BLOCKING;
    ((Proc_t*) proc->proc_parent)->proc_lockCnt++;

    return proc;
}

static void DeleteProcessRecursive(Proc_t *proc)
{
    if (proc->proc_prev)
        DeleteProcessRecursive(proc->proc_prev);

    if (proc->proc_child)
        DeleteProcessRecursive(proc->proc_child);

    if (proc->proc_flags & PROC_FLAG_ENDED)
        return;

    if (proc->proc_endFunc)
        proc->proc_endFunc(proc);

    FreeProcess(proc);

    proc->proc_script = NULL;
    proc->proc_repeatFunc = NULL;
    proc->proc_flags |= PROC_FLAG_ENDED;

    if (proc->proc_flags & PROC_FLAG_BLOCKING)
        ((Proc_t*) proc->proc_parent)->proc_lockCnt--;
}

void Proc_End(ProcPtr proc)
{
    Proc_t* casted = (Proc_t*) proc;

    if (proc != NULL)
    {
        UnlinkProcess(casted);
        DeleteProcessRecursive(casted);
    }
}

static Proc_t *AllocateProcess(void)
{
    // retrieve the next entry in the allocation list
    Proc_t *proc = *sProcAllocListHead;
    sProcAllocListHead++;
    return proc;
}

static void FreeProcess(Proc_t *proc)
{
    // place the process back into the allocation list
    sProcAllocListHead--;
    *sProcAllocListHead = proc;
}

// adds the process as a root process
static void InsertRootProcess(Proc_t *proc, i32 rootIndex)
{
    Proc_t* root = ROOT_PROC(rootIndex);

    if (root) // root process already exists
    {
        // add this process as a sibling
        root->proc_next = proc;
        proc->proc_prev = root;
    }

    proc->proc_parent = (ProcPtr) rootIndex;
    ROOT_PROC(rootIndex) = proc;
}

// adds the process to the tree as a child of 'parent'
static void InsertChildProcess(Proc_t *proc, Proc_t *parent)
{
    if (parent->proc_child != NULL)  // parent already has a child
    {
        // add this process as a sibling
        ((Proc_t*) parent->proc_child)->proc_next = proc;
        proc->proc_prev = parent->proc_child;
    }
    parent->proc_child = proc;
    proc->proc_parent = parent;
}

// removes the process from the tree
static void UnlinkProcess(Proc_t *proc)
{
    int rootIndex;

    // remove sibling links to this process
    if (proc->proc_next != NULL)
        ((Proc_t*) proc->proc_next)->proc_prev = proc->proc_prev;
    if (proc->proc_prev != NULL)
        ((Proc_t*) proc->proc_prev)->proc_next = proc->proc_next;

    // remove parent links to this process
    rootIndex = (int) proc->proc_parent;
    if (rootIndex > 8)  // child proc
    {
        if (((Proc_t*) proc->proc_parent)->proc_child == proc)
            ((Proc_t*) proc->proc_parent)->proc_child = proc->proc_prev;
    }
    else  // root proc
    {
        if (ROOT_PROC(rootIndex) == proc)
            ROOT_PROC(rootIndex) = proc->proc_prev;
    }
    proc->proc_next = NULL;
    proc->proc_prev = NULL;
}

// Runs all processes using a pre-order traversal.
static void RunProcessRecursive(Proc_t* proc)
{
    // Run previous sibling process
    if (proc->proc_prev != NULL)
        RunProcessRecursive(proc->proc_prev);
    // Run this process
    if (proc->proc_lockCnt == 0 && !(proc->proc_flags & PROC_FLAG_STARTING))
    {
        if (proc->proc_repeatFunc == NULL)
            RunProcessScript(proc);
        if (proc->proc_repeatFunc != NULL)
            proc->proc_repeatFunc(proc);
        if (proc->proc_flags & PROC_FLAG_ENDED)
            return;
    }
    // Run child process
    if (proc->proc_child != NULL)
        RunProcessRecursive(proc->proc_child);
}

void Proc_Run(ProcPtr proc)
{
    if (proc)
        RunProcessRecursive(proc);
}

void Proc_Break(ProcPtr proc)
{
    Proc_t* casted = (Proc_t*) proc;
    casted->proc_repeatFunc = NULL;
}

ProcPtr FindProc(const struct ProcScr* script)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script == script)
            return proc;
    }

    return NULL;
}

// unreferenced
static ProcPtr Proc_FindNonBlocked(struct ProcScr* script)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script == script && proc->proc_lockCnt == 0)
            return proc;
    }

    return NULL;
}

// unreferenced
static ProcPtr Proc_FindWithMark(u32 mark)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script != NULL && proc->proc_mark == mark)
            return proc;
    }

    return NULL;
}

void Proc_Goto(ProcPtr proc, int label)
{
    Proc_t* casted = (Proc_t*) proc;
    const struct ProcScr* cmd;

    for (cmd = casted->proc_script; cmd->cmd != 0; cmd++)
    {
        if (cmd->cmd == 11 && cmd->imm == label)
        {
            casted->proc_scrCur = cmd;
            casted->proc_repeatFunc = NULL;

            return;
        }
    }
}

void Proc_GotoScript(ProcPtr proc, const struct ProcScr* script)
{
    Proc_t* casted = (Proc_t*) proc;

    casted->proc_scrCur = script;
    casted->proc_repeatFunc = NULL;
}

void Proc_SetMark(ProcPtr proc, int mark)
{
    Proc_t* casted = (Proc_t*) proc;

    casted->proc_mark = mark;
}

void Proc_SetEndCb(ProcPtr proc, ProcFunc func)
{
    Proc_t* casted = (Proc_t*) proc;

    casted->proc_endFunc = func;
}

void ForEveryProc(ProcFunc func)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script)
            func(proc);
    }
}

void ForEachProc(const struct ProcScr* script, ProcFunc func)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script == script)
            func(proc);
    }
}

void ForEachMarkedProc(int mark, ProcFunc func)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_mark == mark)
            func(proc);
    }
}

void LockEachMarkedProc(int mark)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_mark == mark)
            proc->proc_lockCnt++;
    }
}

void ReleaseEachMarkedProc(int mark)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_mark == mark && proc->proc_lockCnt > 0)
            proc->proc_lockCnt--;
    }
}

void EndEachMarkedProc(int mark)
{
    int i;
    Proc_t* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_mark == mark)
            Proc_End(proc);
    }
}

static void Delete(ProcPtr proc)
{
    Proc_End(proc);
}

void EndEachProc(const struct ProcScr* script)
{
    ForEachProc(script, Delete);
}

static void ClearNativeCallback(ProcPtr proc)
{
    Proc_Break(proc);
}

void BreakEachProc(const struct ProcScr* script)
{
    ForEachProc(script, ClearNativeCallback);
}

static void ForAllFollowingProcs(Proc_t* proc, ProcFunc func)
{
    if (proc->proc_prev)
        ForAllFollowingProcs(proc->proc_prev, func);

    func(proc);

    if (proc->proc_child)
        ForAllFollowingProcs(proc->proc_child, func);
}

// unreferenced
static void func_080030CC(ProcPtr proc, ProcFunc func)
{
    Proc_t* casted = (Proc_t*) proc;

    func(casted);

    if (casted->proc_child)
        ForAllFollowingProcs(casted->proc_child, func);
}

static i8 ProcCmd_DELETE(Proc_t *proc)
{
    Proc_End(proc);

    return FALSE;
}

static i8 ProcCmd_SET_NAME(Proc_t *proc)
{
    proc->proc_name = proc->proc_scrCur->ptr;
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_CALL_ROUTINE(Proc_t *proc)
{
    ProcFunc func = proc->proc_scrCur->ptr;

    proc->proc_scrCur++;
    func(proc);

    return TRUE;
}

static i8 ProcCmd_CALL_ROUTINE_2(Proc_t *proc)
{
    i8(*func)(ProcPtr) = proc->proc_scrCur->ptr;

    proc->proc_scrCur++;
    return func(proc);
}

static i8 ProcCmd_CALL_ROUTINE_ARG(Proc_t *proc)
{
    short arg = proc->proc_scrCur->imm;
    i8(*func)(short, ProcPtr) = proc->proc_scrCur->ptr;

    proc->proc_scrCur++;
    return func(arg, proc);
}

static i8 ProcCmd_WHILE_ROUTINE(Proc_t *proc)
{
    i8(*func)(ProcPtr) = proc->proc_scrCur->ptr;

    proc->proc_scrCur++;

    if (func(proc) == TRUE)
    {
        proc->proc_scrCur--;
        return FALSE;
    }

    return TRUE;
}

static i8 ProcCmd_LOOP_ROUTINE(Proc_t *proc)
{
    proc->proc_repeatFunc = proc->proc_scrCur->ptr;
    proc->proc_scrCur++;

    return FALSE;
}

static i8 ProcCmd_SET_DESTRUCTOR(Proc_t *proc)
{
    Proc_SetEndCb(proc, proc->proc_scrCur->ptr);
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_NEW_CHILD(Proc_t* proc)
{
    SpawnProc(proc->proc_scrCur->ptr, proc);
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_NEW_CHILD_BLOCKING(Proc_t* proc)
{
    SpawnProcLocking(proc->proc_scrCur->ptr, proc);
    proc->proc_scrCur++;

    return FALSE;
}

static i8 ProcCmd_NEW_MAIN_BUGGED(Proc_t *proc)
{
    SpawnProc(proc->proc_scrCur->ptr, (Proc_t *)(u32) proc->proc_sleepTime);  // Why are we using sleepTime here?
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_WHILE_EXISTS(Proc_t *proc)
{
    i8 exists = (FindProc(proc->proc_scrCur->ptr) != NULL);

    if (exists)
        return FALSE;

    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_END_ALL(Proc_t *proc)
{
    EndEachProc(proc->proc_scrCur->ptr);
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_BREAK_ALL_LOOP(Proc_t *proc)
{
    BreakEachProc(proc->proc_scrCur->ptr);
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_NOP(Proc_t *proc)
{
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_JUMP(Proc_t *proc)
{
    Proc_GotoScript(proc, proc->proc_scrCur->ptr);

    return TRUE;
}

static i8 ProcCmd_GOTO(Proc_t *proc)
{
    Proc_Goto(proc, proc->proc_scrCur->imm);

    return TRUE;
}

static void UpdateSleep(ProcPtr proc)
{
    ((Proc_t*) proc)->proc_sleepTime--;

    if (((Proc_t*) proc)->proc_sleepTime == 0)
        Proc_Break(proc);
}

static i8 ProcCmd_SLEEP(Proc_t *proc)
{
    if (proc->proc_scrCur->imm != 0)
    {
        proc->proc_sleepTime = proc->proc_scrCur->imm;
        proc->proc_repeatFunc = UpdateSleep;
    }

    proc->proc_scrCur++;

    return FALSE;
}

static i8 ProcCmd_SET_MARK(Proc_t *proc)
{
    proc->proc_mark = proc->proc_scrCur->imm;
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_NOP2(Proc_t *proc)
{
    proc->proc_scrCur++;
    return TRUE;
}

static i8 ProcCmd_BLOCK(Proc_t *proc)
{
    return FALSE;
}

static i8 ProcCmd_END_IF_DUPLICATE(Proc_t *proc)
{
    int i;
    Proc_t *it = sProcArray;
    int count = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, it++)
    {
        if (it->proc_script == proc->proc_script)
            count++;
    }

    if (count > 1)
    {
        Proc_End(proc);
        return FALSE;
    }

    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_END_DUPLICATES(Proc_t *proc)
{
    int i;
    Proc_t* it = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, it++)
    {
        if (it != proc && it->proc_script == proc->proc_script)
        {
            Proc_End(it);
            break;
        }
    }

    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_NOP3(Proc_t *proc)
{
    proc->proc_scrCur++;

    return TRUE;
}

static i8 ProcCmd_SET_BIT4(Proc_t *proc)
{
    proc->proc_flags |= PROC_FLAG_UNK2;
    proc->proc_scrCur++;

    return TRUE;
}

static i8(*sProcessCmdTable[])(Proc_t*) =
{
    ProcCmd_DELETE,
    ProcCmd_SET_NAME,
    ProcCmd_CALL_ROUTINE,
    ProcCmd_LOOP_ROUTINE,
    ProcCmd_SET_DESTRUCTOR,
    ProcCmd_NEW_CHILD,
    ProcCmd_NEW_CHILD_BLOCKING,
    ProcCmd_NEW_MAIN_BUGGED,
    ProcCmd_WHILE_EXISTS,
    ProcCmd_END_ALL,
    ProcCmd_BREAK_ALL_LOOP,
    ProcCmd_NOP,
    ProcCmd_GOTO,
    ProcCmd_JUMP,
    ProcCmd_SLEEP,
    ProcCmd_SET_MARK,
    ProcCmd_BLOCK,
    ProcCmd_END_IF_DUPLICATE,
    ProcCmd_SET_BIT4,
    ProcCmd_NOP2,
    ProcCmd_WHILE_ROUTINE,
    ProcCmd_NOP3,
    ProcCmd_CALL_ROUTINE_2,
    ProcCmd_END_DUPLICATES,
    ProcCmd_CALL_ROUTINE_ARG,
    ProcCmd_NOP,
};

static void RunProcessScript(Proc_t* proc)
{
    if (proc->proc_script == NULL)
        return;

    if (proc->proc_lockCnt > 0)
        return;

    if (proc->proc_repeatFunc != NULL)
        return;

    while (sProcessCmdTable[proc->proc_scrCur->cmd](proc))
    {
        if (proc->proc_script == NULL)
            return;
    }
}

// This was likely used to print the process list in the debug version of the game,
// but does nothing in the release version.

static void PrintProcessName(Proc_t* proc)
{
}

static void PrintProcessNameRecursive(Proc_t* proc, int* indent)
{
    if (proc->proc_prev != NULL)
        PrintProcessNameRecursive(proc->proc_prev, indent);

    PrintProcessName(proc);

    if (proc->proc_child != NULL)
    {
        *indent += 2;
        PrintProcessNameRecursive(proc->proc_child, indent);
        *indent -= 2;
    }
}

// unreferenced
static void PrintProcessTree(Proc_t* proc)
{
    int indent = 4;

    PrintProcessName(proc);

    if (proc->proc_child != NULL)
    {
        indent += 2;
        PrintProcessNameRecursive(proc->proc_child, &indent);
        indent -= 2;
    }
}

// unreferenced
static void func_0800344C(void)
{
}

void Proc_SetRepeatFunc(ProcPtr proc, ProcFunc func)
{
    Proc_t* casted = (Proc_t*) proc;

    casted->proc_repeatFunc = func;
}

void Proc_Lock(ProcPtr proc)
{
    ((Proc_t*) proc)->proc_lockCnt++;
}

void Proc_Release(ProcPtr proc)
{
    ((Proc_t*) proc)->proc_lockCnt--;
}

ProcPtr Proc_FindAfter(struct ProcScr* script, Proc_t* proc)
{
    if (proc == NULL)
        proc = sProcArray;
    else
        proc++;

    while (proc < sProcArray + MAX_PROC_COUNT)
    {
        if (proc->proc_script == script)
            return proc;

        proc++;
    }

    return NULL;
}

Proc_t *Proc_FindAfterWithParent(Proc_t* proc, Proc_t* parent)
{
    if (proc == NULL)
        proc = sProcArray;
    else
        proc++;

    while (proc < sProcArray + MAX_PROC_COUNT)
    {
        if (proc->proc_parent == parent)
            return proc;

        proc++;
    }

    return NULL;
}

// unreferenced
static int func_080034D4(void)
{
    int i, result = MAX_PROC_COUNT;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        if (sProcArray[i].proc_script)
            result--;
    }

    return result;
}

int func_080034FC(const struct ProcScr* script)
{
    Proc_t* proc = sProcArray;
    int i, result = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (script == NULL)
        {
            if (proc->proc_script != NULL)
                result++;
        }
        else
        {
            if (proc->proc_script == script)
                result++;
        }
    }

    return result;
}

void BeginFindProc(struct ProcFindIterator* it, const struct ProcScr* script)
{
    it->proc = sProcArray;
    it->script = script;
    it->count = 0;
}

ProcPtr NextFindProc(struct ProcFindIterator* it)
{
    Proc_t* result = NULL;

    while (it->count < MAX_PROC_COUNT)
    {
        if (it->proc->proc_script == it->script)
            result = it->proc;

        it->count++;
        it->proc++;

        if (result)
            return result;
    }

    return NULL;
}
