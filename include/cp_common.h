#ifndef GUARD_CP_COMMON_H
#define GUARD_CP_COMMON_H

struct AiState
{
    /* 00 */ u8 units[116];
    /* 74 */ u8* unitIt;
    /* 78 */ u8 orderState;
    /* 79 */ u8 decideState;
    /* 7A */ i8 dangerMapFilled; // bool
    /* 7B */ u8 flags;
    /* 7C */ u8 unk7C;
    /* 7D */ u8 combatWeightTableId;
    /* 7E */ u8 unk7E;
    /* 7F */ u8 unk7F;
    /* 80 */ u32 specialItemFlags;
    /* 84 */ u8 unk84;
    /* 85 */ u8 bestBlueMov;
    /* 86 */ u8 unk86[8];
};

struct AiDecision
{
    /* 00 */ u8 actionId;

    /* 01 */ u8 unit_id;
    /* 02 */ u8 xMove;
    /* 03 */ u8 yMove;
    /* 04 */ u8 unk04;
    /* 05 */ u8 unk05;
    /* 06 */ u8 targetId;
    /* 07 */ u8 itemSlot;
    /* 08 */ u8 xTarget;
    /* 09 */ u8 yTarget;

    /* 0A */ i8 actionPerformed;
};

enum
{
    AI_FLAGS_NONE = 0,

    AI_FLAG_0 = (1 << 0),
    AI_FLAG_1 = (1 << 1),
    AI_FLAG_BERSERKED = (1 << 2),
};

enum
{
    AI_UNIT_FLAG_0 = (1 << 0),
    AI_UNIT_FLAG_1 = (1 << 1),
    AI_UNIT_FLAG_2 = (1 << 2),
    AI_UNIT_FLAG_3 = (1 << 3),
};

enum
{
    AI_ACTION_NONE = 0, // move only
};

extern struct AiState gAiSt;
extern struct AiDecision gAiDecision;

extern void(*AiDecideMainFunc)(void);

extern struct ProcScr CONST_DATA ProcScr_CpPhase[];
extern struct ProcScr CONST_DATA ProcScr_BerserkCpPhase[];
extern struct ProcScr CONST_DATA ProcScr_CpOrder[];
extern struct ProcScr CONST_DATA ProcScr_BerserkCpOrder[];
extern struct ProcScr CONST_DATA ProcScr_CpDecide[];
extern struct ProcScr CONST_DATA ProcScr_CpPerform[];

void ClearAiDecision(void);
void AiSetDecision(u8 xMove, u8 yMove, u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget);
void AiUpdateDecision(u8 actionId, u8 targetId, u8 itemSlot, u8 xTarget, u8 yTarget);
void AiMasterDecisionMaker(void);

#endif // GUARD_CP_COMMON_H
