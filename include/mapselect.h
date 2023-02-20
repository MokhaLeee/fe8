#pragma once

#include "global.h"
#include "proc.h"

struct SelectTarget
{
    /* 00 */ i8 x, y;
    /* 02 */ i8 uid;
    /* 03 */ u8 extra;

    /* 04 */ struct SelectTarget* next;
    /* 08 */ struct SelectTarget* prev;
};

typedef struct SelectTarget SelectTarget_t;

struct SelectInfo
{
    /* 00 */ int(*on_init)(ProcPtr proc);
    /* 04 */ int(*on_end)(ProcPtr proc);

    /* 08 */ int(*onUnk08)();

    /* 0C */ int(*on_switch_in)(ProcPtr proc, SelectTarget_t* target);
    /* 10 */ int(*on_switch_out)(ProcPtr proc, SelectTarget_t* target);

    /* 14 */ int(*on_select)(ProcPtr proc, SelectTarget_t* target);
    /* 18 */ int(*on_cancel)(ProcPtr proc, SelectTarget_t* target);
    /* 1C */ int(*on_help)(ProcPtr proc, SelectTarget_t* target);
};

typedef struct SelectInfo SelectInfo_t;

void InitTargets(int xRoot, int yRoot);
void AddTarget(int x, int y, int uId, int tId);
// ??? LinkTargets(???);
// ??? TargetSelection_GetRealCursorPosition(???);
// ??? TargetSelection_Loop(???);
ProcPtr StartTargetSelection(SelectInfo_t const* info);
ProcPtr StartTargetSelectionExt(SelectInfo_t const* info, int(*on_select)(ProcPtr, SelectTarget_t*));
void EndTargetSelection(ProcPtr proc);
// ??? TargetSelection_HandleMoveInput(???);
// ??? TargetSelection_HandleSelectInput(???);
// ??? func_0804FBBC(???);
// ??? func_0804FBDC(???);
// ??? GetFarthestTargetIndex(???);
// ??? LinkTargetsOrdered(???);
// ??? GetLinkedTargetList(???);
// ??? GetFirstTargetPointer(???);
int GetTargetListSize(void);
// ??? GetTarget(???);
