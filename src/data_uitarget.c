#include "global.h"

#include "proc.h"
#include "chapter.h"

// this is only here to hold data for now
// source needs to be decompiled from asm/ui_targetselection.s

void TargetSelection_Loop();

struct ProcScr CONST_DATA gUnknown_085B655C[] =
{
PROC_LABEL(0),
    PROC_REPEAT(TargetSelection_Loop),
    PROC_SLEEP(1),

    PROC_CALL(InitBmDisplay),
    PROC_GOTO(0),

    PROC_END,
};

struct Unk_085B658C
{
    i8 x, y;
};

struct Unk_085B658C CONST_DATA gUnknown_085B658C[] =
{
    {  0,  0 },
    {  0, -2 },
    {  0, -1 },
    { +1, -1 },
    { +1,  0 },
    { +2,  0 },
    { +1, +1 },
    {  0, +1 },
    {  0, +2 },
    { -1, +1 },
    { -1,  0 },
    { -2,  0 },
    { -1, -1 },
};
