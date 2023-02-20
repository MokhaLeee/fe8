#include "global.h"

struct LutItem_080D7964
{
    ProcPtr(*spawn_proc)(struct ProcScr const*, ProcPtr);
    void(*unk_04)(i8);
    int unit;
};

void func_080018E4(i8);
void func_08001860(i8);
void func_080019E8(i8);
void func_08001964(i8);

char const gUnknown_080D7954[] = "@@LWFOVDBK@@";

struct LutItem_080D7964 const gLut_080D7964[] =
{
    { SpawnProc,        func_080018E4, +1 },
    { SpawnProc,        func_08001860, -1 },
    { SpawnProcLocking, func_080018E4, +1 },
    { SpawnProcLocking, func_08001860, -1 },
    { SpawnProc,        func_080019E8, -1 },
    { SpawnProc,        func_08001964, +1 },
    { SpawnProcLocking, func_080019E8, -1 },
    { SpawnProcLocking, func_08001964, +1 },
};
