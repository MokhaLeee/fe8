
#include "global.h"

#include "proc.h"

#include "cp_common.h"

extern const u32 gUnknown_080D8538[];

static void AiPhaseInit(Proc_t* proc);
static void AiPhaseBerserkInit(Proc_t* proc);
static void AiPhaseCleanup(Proc_t* proc);

CONST_DATA
struct ProcScr ProcScr_CpPhase[] =
{
    PROC_NAME("E_CPPHASE"),

    PROC_CALL(AiPhaseInit),
    PROC_SLEEP(0),

    PROC_CALL(AiPhaseCleanup),

    PROC_END,
};

CONST_DATA
struct ProcScr ProcScr_BerserkCpPhase[] =
{
    PROC_NAME("E_BSKPHASE"),

    PROC_CALL(AiPhaseBerserkInit),
    PROC_SLEEP(0),

    PROC_CALL(AiPhaseCleanup),

    PROC_END,
};

static void AiPhaseInit(Proc_t* proc)
{
    int i;

    gAiSt.flags = AI_FLAG_0;
    gAiSt.unk7E = -1;

    gAiSt.orderState = 0;

    for (i = 0; i < 8; ++i)
        gAiSt.unk86[i] = 0;

    gAiSt.specialItemFlags = gUnknown_080D8538[gPlaySt.chapter];
    gAiSt.unk84 = 0;

    AiUpdateAllUnitHealAi();
    GenBlueUnitAiStats();

    SpawnProcLocking(ProcScr_CpOrder, proc);
}

static void AiPhaseBerserkInit(Proc_t* proc)
{
    int i;

    gAiSt.flags = AI_FLAG_BERSERKED;
    gAiSt.unk7E = -1;

    for (i = 0; i < 8; ++i)
        gAiSt.unk86[i] = 0;

    gAiSt.specialItemFlags = gUnknown_080D8538[gPlaySt.chapter];

    AiUpdateAllUnitHealAi();
    GenBlueUnitAiStats();

    SpawnProcLocking(ProcScr_BerserkCpOrder, proc);
}

static void AiPhaseCleanup(Proc_t* proc)
{
    gAiSt.flags = AI_FLAGS_NONE;
}
