#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "text.h"
#include "uiutils.h"
#include "mu.h"
#include "chapter.h"
#include "unit.h"
#include "map.h"
#include "uimenu.h"

#include "event.h"

// TODO: move those where they belong when possible
void func_0800E640(struct EventEngineProc*);
u8 Event00_Nop(struct EventEngineProc* proc);
u8 Event01_End(struct EventEngineProc* proc);
u8 Event02_EvBitAndIdMod(struct EventEngineProc* proc);
u8 Event03_CheckEvBitOrId(struct EventEngineProc* proc);
u8 Event04_CheckRandom(struct EventEngineProc* proc);
u8 Event05_SetSlot(struct EventEngineProc* proc);
u8 Event06_SlotOperation(struct EventEngineProc* proc);
u8 Event07_QueueOperation(struct EventEngineProc* proc);
u8 Event08_Label(struct EventEngineProc* proc);
u8 Event09_Goto(struct EventEngineProc* proc);
u8 Event0A_Call(struct EventEngineProc* proc);
u8 Event0B_EnqueueCall(struct EventEngineProc* proc);
u8 Event0C_Branch(struct EventEngineProc* proc);
u8 Event0D_AsmCall(struct EventEngineProc* proc);
u8 Event0E_STAL(struct EventEngineProc* proc);
u8 Event0F_CounterOperation(struct EventEngineProc* proc);
u8 Event10_ModifyEvBit(struct EventEngineProc* proc);
u8 Event11_SetIgnoredKeys(struct EventEngineProc* proc);
u8 Event12_SetBGM(struct EventEngineProc* proc);
u8 Event13_SetBGM2(struct EventEngineProc* proc);
u8 Event14_OverwriteBGM(struct EventEngineProc* proc);
u8 Event15_QuietBGM(struct EventEngineProc* proc);
u8 Event16_PlaySound(struct EventEngineProc* proc);
u8 Event17_Fade(struct EventEngineProc* proc);
u8 Event18_ColorEffects(struct EventEngineProc* proc);
u8 Event19_(struct EventEngineProc* proc);
u8 Event1A_TEXTSTART(struct EventEngineProc* proc);
u8 Event1B_TEXTSHOW(struct EventEngineProc* proc);
u8 Event1C_TEXTCONT(struct EventEngineProc* proc);
u8 Event1D_TEXTEND(struct EventEngineProc* proc);
u8 Event1E_(struct EventEngineProc* proc);
u8 Event1F_(struct EventEngineProc* proc);
u8 Event20_(struct EventEngineProc* proc);
u8 Event21_TextBGStuff(struct EventEngineProc* proc);
u8 Event22_CLEAN(struct EventEngineProc* proc);
u8 Event23_BlockGameGraphics(struct EventEngineProc* proc);
u8 Event24_UnblockGameGraphics(struct EventEngineProc* proc);
u8 Event25_LOMA(struct EventEngineProc* proc);
u8 Event26_CameraControlMaybe(struct EventEngineProc* proc);
u8 Event27_MapChange(struct EventEngineProc* proc);
u8 Event28_ChangeWeather(struct EventEngineProc* proc);
u8 Event29_SetFogVision(struct EventEngineProc* proc);
u8 Event2A_MoveToChapter(struct EventEngineProc* proc);
u8 Event2B_(struct EventEngineProc* proc);
u8 Event2C_LoadUnits(struct EventEngineProc* proc);
u8 Event2D_(struct EventEngineProc* proc);
u8 Event2E_CheckAt(struct EventEngineProc* proc);
u8 Event2F_MoveUnit(struct EventEngineProc* proc);
u8 Event30_WaitForUnitMovement(struct EventEngineProc* proc);
u8 Event31_DisplayEffectRange(struct EventEngineProc* proc);
u8 Event32_SpawnSingleUnit(struct EventEngineProc* proc);
u8 Event33_CheckUnitVarious(struct EventEngineProc* proc);
u8 Event34_MessWithUnitState(struct EventEngineProc* proc);
u8 Event35_UnitClassChanging(struct EventEngineProc* proc);
u8 Event36_CheckInArea(struct EventEngineProc* proc);
u8 Event37_GiveItem(struct EventEngineProc* proc);
u8 Event38_ChangeActiveUnit(struct EventEngineProc* proc);
u8 Event39_CHAI(struct EventEngineProc* proc);
u8 Event3A_(struct EventEngineProc* proc);
u8 Event3B_DisplayCursor(struct EventEngineProc* proc);
u8 Event3C_GetSetCursor(struct EventEngineProc* proc);
u8 Event3D_DisableMenuCommands(struct EventEngineProc* proc);
u8 Event3E_PrepScreenCall(struct EventEngineProc* proc);
u8 Event3F_(struct EventEngineProc* proc);
u8 Event40_PROM(struct EventEngineProc* proc);
u8 Event41_WarpAnim(struct EventEngineProc* proc);
u8 Event42_(struct EventEngineProc* proc);
u8 Event43_(struct EventEngineProc* proc);
u8 Event44_(struct EventEngineProc* proc);
u8 Event45_(struct EventEngineProc* proc);
void func_0800CCE8(void);
void nullsub_32(void);
void func_0800CD40(void);
void func_0800CD38(void);
void nullsub_34(void);
u8 Event80_WmSkip_Unsure(struct EventEngineProc* proc);
u8 Event81_WmFadeOut(struct EventEngineProc* proc);
u8 Event82_WmEnd(struct EventEngineProc* proc);
u8 Event83_WmSetCamera(struct EventEngineProc* proc);
u8 Event84_WmSetCameraOntoNode(struct EventEngineProc* proc);
u8 Event85_WmSetCameraOntoUnit(struct EventEngineProc* proc);
u8 Event86_WmScrollCamera(struct EventEngineProc* proc);
u8 Event87_WmScrollCameraOntoNode(struct EventEngineProc* proc);
u8 Event88_WmScrollCameraOntoUnit(struct EventEngineProc* proc);
u8 Event89_WmScrollWait(struct EventEngineProc* proc);
u8 Event8A_WmShowCursor_Unsure(struct EventEngineProc* proc);
u8 Event8B_WmHideCursor_Unsure(struct EventEngineProc* proc);
u8 Event8C_WmSetCursor_Unsure(struct EventEngineProc* proc);
u8 Event8D_WmNop(struct EventEngineProc* proc);
u8 Event8E_WmNop(struct EventEngineProc* proc);
u8 Event8F_WmNop(struct EventEngineProc* proc);
u8 Event90_WmAddPathDisplayed(struct EventEngineProc* proc);
u8 Event91_WmAddPath(struct EventEngineProc* proc);
u8 Event92_WmRemovePath(struct EventEngineProc* proc);
u8 Event93_WmEnableNode(struct EventEngineProc* proc);
u8 Event94_WmDisableNode(struct EventEngineProc* proc);
u8 Event95_WmEnableNodeDisplayed(struct EventEngineProc* proc);
u8 Event96_WmEnablePathTargetDisplayed(struct EventEngineProc* proc);
u8 Event97_WmInitNextStoryNode(struct EventEngineProc* proc);
u8 Event98_WmSetNextStoryNodePath(struct EventEngineProc* proc);
u8 Event99_GmNodeDisplayWait(struct EventEngineProc* proc);
u8 Event9A_WmSetStoryNodeSilent(struct EventEngineProc* proc);
u8 Event9B_WmSetNextStoryNodeSilentNoFlag(struct EventEngineProc* proc);
u8 Event9C_(struct EventEngineProc* proc);
u8 Event9D_(struct EventEngineProc* proc);
u8 Event9E_WmSetClassUnit(struct EventEngineProc* proc);
u8 Event9F_WmSetCharUnit(struct EventEngineProc* proc);
u8 EventA0_WmRemoveUnit(struct EventEngineProc* proc);
u8 EventA1_WmShowUnit(struct EventEngineProc* proc);
u8 EventA2_WmHideUnit(struct EventEngineProc* proc);
u8 EventA3_WmShowUnitFaded(struct EventEngineProc* proc);
u8 EventA4_WmHideUnitFaded(struct EventEngineProc* proc);
u8 EventA5_WmUnitFadeWait(struct EventEngineProc* proc);
u8 EventA6_WmUnitSetOnNode(struct EventEngineProc* proc);
u8 EventA7_WmUnitSetPosition(struct EventEngineProc* proc);
u8 EventA8_WmUnitMoveFree(struct EventEngineProc* proc);
u8 EventA9_WmUnitMovePaths(struct EventEngineProc* proc);
u8 EventAA_WmUnitPauseMove(struct EventEngineProc* proc);
u8 EventAB_WmUnitResumeMove(struct EventEngineProc* proc);
u8 EventAC_WmUnitMoveWait(struct EventEngineProc* proc);
u8 EventAD_WmFadeToDarker(struct EventEngineProc* proc);
u8 EventAE_WmFadeToDarkerWait(struct EventEngineProc* proc);
u8 EventAF_WmShowTextBox(struct EventEngineProc* proc);
u8 EventB0_WmHideTextBox_Bugged(struct EventEngineProc* proc);
u8 EventB1_WmTextBoxWait(struct EventEngineProc* proc);
u8 EventB2_WmFancyFade(struct EventEngineProc* proc);
u8 EventB3_WmFancyFadeWait(struct EventEngineProc* proc);
u8 EventB4_WmDisplayBigMap(struct EventEngineProc* proc);
u8 EventB5_WmHideBigMap(struct EventEngineProc* proc);
u8 EventB6_WmMoveBigMap(struct EventEngineProc* proc);
u8 EventB7_WmBigMapWait(struct EventEngineProc* proc);
u8 EventB8_WmShowBigMapHighlight(struct EventEngineProc* proc);
u8 EventB9_(struct EventEngineProc* proc);
u8 EventBA_(struct EventEngineProc* proc);
u8 EventBB_(struct EventEngineProc* proc);
u8 EventBC_(struct EventEngineProc* proc);
u8 EventBD_(struct EventEngineProc* proc);
u8 EventBE_(struct EventEngineProc* proc);
u8 EventBF_(struct EventEngineProc* proc);
u8 EventC0_(struct EventEngineProc* proc);
u8 EventC1_SKIPWM(struct EventEngineProc* proc);
u8 EventC2_(struct EventEngineProc* proc);
u8 EventC3_(struct EventEngineProc* proc);
u8 EventC4_(struct EventEngineProc* proc);
u8 EventC5_(struct EventEngineProc* proc);
u8 EventC6_(struct EventEngineProc* proc);
u8 EventC7_(struct EventEngineProc* proc);
u8 EventC8_(struct EventEngineProc* proc);
u8 EventC9_(struct EventEngineProc* proc);
u8 EventCA_(struct EventEngineProc* proc);
u8 EventCB_(struct EventEngineProc* proc);
u8 EventCC_(struct EventEngineProc* proc);
u8 EventCD_(struct EventEngineProc* proc);
u8 EventCE_(struct EventEngineProc* proc);
u8 EventCF_(struct EventEngineProc* proc);

static bool EventEngine_CanStartSkip(struct EventEngineProc*);
static void EventEngine_StartSkip(struct EventEngineProc*);
static void func_0800D488(struct EventEngineProc*);
static void CallNextQueuedEvent(void); // local

enum { EVENT_SLOT_COUNT = 0xE };

struct EnqueuedEventCall {
    const u16* events;
    u8 execType;
    i8 isUsed;
};

extern u32 gEventSlots[EVENT_SLOT_COUNT]; // event slot values (Null (0), Vars (1-A) + Position (B) + Check (C) + QP (D))
extern u32 gEventSlotQueue[]; // event slot queue (just an array)

extern u32 gEventSlotCounter;

// TODO: better
extern struct EnqueuedEventCall gEventCallQueue[]; // gEventCallQueue

extern struct ProcScr gUnknown_030005B0[4];

struct ProcScr CONST_DATA ProcScr_EventScript[] =
{
    PROC_MARK(PROC_MARK_6),
    PROC_ONEND(EventEngine_OnEnd),
    PROC_SLEEP(0),
    PROC_CALL(_MarkSomethingInMenu),
    PROC_REPEAT(EventEngine_OnUpdate),
    PROC_SLEEP(0),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_BattleEventScript[] =
{
    PROC_MARK(PROC_MARK_6),
    PROC_ONEND(EventEngine_OnEnd),
    PROC_SLEEP(0),
    PROC_REPEAT(EventEngine_OnUpdate),
    PROC_SLEEP(0),
    PROC_END,
};

EventFuncType CONST_DATA gEventScrLoFuncLut[] =
{
    Event00_Nop,
    Event01_End,
    Event02_EvBitAndIdMod,
    Event03_CheckEvBitOrId,
    Event04_CheckRandom,
    Event05_SetSlot,
    Event06_SlotOperation,
    Event07_QueueOperation,
    Event08_Label,
    Event09_Goto,
    Event0A_Call,
    Event0B_EnqueueCall,
    Event0C_Branch,
    Event0D_AsmCall,
    Event0E_STAL,
    Event0F_CounterOperation,
    Event10_ModifyEvBit,
    Event11_SetIgnoredKeys,
    Event12_SetBGM,
    Event13_SetBGM2,
    Event14_OverwriteBGM,
    Event15_QuietBGM,
    Event16_PlaySound,
    Event17_Fade,
    Event18_ColorEffects,
    Event19_,
    Event1A_TEXTSTART,
    Event1B_TEXTSHOW,
    Event1C_TEXTCONT,
    Event1D_TEXTEND,
    Event1E_,
    Event1F_,
    Event20_,
    Event21_TextBGStuff,
    Event22_CLEAN,
    Event23_BlockGameGraphics,
    Event24_UnblockGameGraphics,
    Event25_LOMA,
    Event26_CameraControlMaybe,
    Event27_MapChange,
    Event28_ChangeWeather,
    Event29_SetFogVision,
    Event2A_MoveToChapter,
    Event2B_,
    Event2C_LoadUnits,
    Event2D_,
    Event2E_CheckAt,
    Event2F_MoveUnit,
    Event30_WaitForUnitMovement,
    Event31_DisplayEffectRange,
    Event32_SpawnSingleUnit,
    Event33_CheckUnitVarious,
    Event34_MessWithUnitState,
    Event35_UnitClassChanging,
    Event36_CheckInArea,
    Event37_GiveItem,
    Event38_ChangeActiveUnit,
    Event39_CHAI,
    Event3A_,
    Event3B_DisplayCursor,
    Event3C_GetSetCursor,
    Event3D_DisableMenuCommands,
    Event3E_PrepScreenCall,
    Event3F_,
    Event40_PROM,
    Event41_WarpAnim,
    Event42_,
    Event43_,
    Event44_,
    Event45_,
};

struct ProcScr CONST_DATA ProcScr_Unk_08591C40[] =
{
    PROC_MARK(PROC_MARK_8),
    PROC_SLEEP(0),
    PROC_CALL(func_0800CCE8),
    PROC_REPEAT(nullsub_32),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_Unk_08591C68[] =
{
    PROC_MARK(PROC_MARK_8),
    PROC_ONEND(func_0800CD40),
    PROC_SLEEP(0),
    PROC_CALL(func_0800CD38),
    PROC_REPEAT(nullsub_34),
    PROC_END,
};

EventFuncType CONST_DATA gEventScrHiFuncLut[] =
{
    Event80_WmSkip_Unsure,
    Event81_WmFadeOut,
    Event82_WmEnd,
    Event83_WmSetCamera,
    Event84_WmSetCameraOntoNode,
    Event85_WmSetCameraOntoUnit,
    Event86_WmScrollCamera,
    Event87_WmScrollCameraOntoNode,
    Event88_WmScrollCameraOntoUnit,
    Event89_WmScrollWait,
    Event8A_WmShowCursor_Unsure,
    Event8B_WmHideCursor_Unsure,
    Event8C_WmSetCursor_Unsure,
    Event8D_WmNop,
    Event8E_WmNop,
    Event8F_WmNop,
    Event90_WmAddPathDisplayed,
    Event91_WmAddPath,
    Event92_WmRemovePath,
    Event93_WmEnableNode,
    Event94_WmDisableNode,
    Event95_WmEnableNodeDisplayed,
    Event96_WmEnablePathTargetDisplayed,
    Event97_WmInitNextStoryNode,
    Event98_WmSetNextStoryNodePath,
    Event99_GmNodeDisplayWait,
    Event9A_WmSetStoryNodeSilent,
    Event9B_WmSetNextStoryNodeSilentNoFlag,
    Event9C_,
    Event9D_,
    Event9E_WmSetClassUnit,
    Event9F_WmSetCharUnit,
    EventA0_WmRemoveUnit,
    EventA1_WmShowUnit,
    EventA2_WmHideUnit,
    EventA3_WmShowUnitFaded,
    EventA4_WmHideUnitFaded,
    EventA5_WmUnitFadeWait,
    EventA6_WmUnitSetOnNode,
    EventA7_WmUnitSetPosition,
    EventA8_WmUnitMoveFree,
    EventA9_WmUnitMovePaths,
    EventAA_WmUnitPauseMove,
    EventAB_WmUnitResumeMove,
    EventAC_WmUnitMoveWait,
    EventAD_WmFadeToDarker,
    EventAE_WmFadeToDarkerWait,
    EventAF_WmShowTextBox,
    EventB0_WmHideTextBox_Bugged,
    EventB1_WmTextBoxWait,
    EventB2_WmFancyFade,
    EventB3_WmFancyFadeWait,
    EventB4_WmDisplayBigMap,
    EventB5_WmHideBigMap,
    EventB6_WmMoveBigMap,
    EventB7_WmBigMapWait,
    EventB8_WmShowBigMapHighlight,
    EventB9_,
    EventBA_,
    EventBB_,
    EventBC_,
    EventBD_,
    EventBE_,
    EventBF_,
    EventC0_,
    EventC1_SKIPWM,
    EventC2_,
    EventC3_,
    EventC4_,
    EventC5_,
    EventC6_,
    EventC7_,
    EventC8_,
    EventC9_,
    EventCA_,
    EventCB_,
    EventCC_,
    EventCD_,
    EventCE_,
    EventCF_,
};

struct ProcScr CONST_DATA ProcScr_Unk_08591DD8[] = // map event engine "witness lock" (alive while map event engine is)
{
    PROC_WHILE(EventEngineExists),
    PROC_END,
};

// TODO: actual events

extern const u16 gEvent_DisplayBattleQuote[]; /*
    1020 0003 | EVBIT_MODIFY 3  // modifies event state bits (how?)
    1B20 FFFF | TEXTSHOW 0xFFFF // Show text in event slot 2
    1D20 0000 | TEXTEND         // Ends text
    1B22 0000 | REMA            // deletes all text-related procs (or something)
    0120 0000 | ENDA            // ends event execution
*/

extern const u16 gEvent_TriggerQueuedTileChanges[]; /*
    1020 0001 | EVBIT_MODIFY 1    // modifies event state bits (how?)
    2720 FFFD | TILECHANGE 0xFFFD // Changes tile by tile change id in event slot Queue (or something)
    0120 0000 | ENDA              // ends event execution
*/

extern const u16 gEvent_OpenChest[]; /*
    1020 0001           | EVBIT_MODIFY 1
    2720 FFFD           | TILECHANGE 0xFFFD
    0540 0007 000000FF  | SVAL s7 0xFF
    0C43 0000 0003 0007 | BGT 0 s3 s7
    3720 FFFF           | GIVEITEMTO 0xFFFF
    0920 0001           | GOTO 1
    0820 0000           | LABEL 0
    3721 FFFF           | GIVEITEMTOMAIN 0xFFFF
    0820 0001           | LABEL 1
    0120 0000           | ENDA
*/

extern const u16 gEvent_MapSupportConversation[]; /*
    1020 0003           | EVBIT_MODIFY 3
    0C40 0000 0002 0000 | BEQ 0 s2 s0
    1220 FFFF           | MUSC 0xFFFF
    0920 0001           | GOTO 1
    0820 0000           | LABEL 0
    1520 0000           | MUSI
    0820 0001           | LABEL 1
    0620 0032           | SADD $032
    1B20 FFFF           | TEXTSHOW 0xFFFF
    1D20 0000           | TEXTEND
    1B22 0000           | REMA
    3A40 000C 005A 0000 | NOTIFY 0xC 0x5A 0
    0228 0007           | EVBIT_T 7 // NoFade
    0120 0000           | ENDA
*/

extern const u16 gEvent_SupportViewerConversation[]; /*
    1020 0003           | EVBIT_MODIFY 3
    1A21 0000           | REMOVEPORTRAITS
    2140 0037 0000 0000 | BACG 0x37
    1720 0010           | FADU 16
    1B20 FFFF           | TEXTSHOW 0xFFFF
    1D20 0000           | TEXTEND
    1B22 0000           | REMA
    1721 0010           | FADI 16
    0120 0000           | ENDA
*/

extern const u16 gEvent_SkirmishRetreat[]; /*
    EVBIT_MODIFY 4
    TUTORIALTEXTBOXSTART
    SVAL sB (-1)
    TEXTSHOW 0x8FC // "Retreat?        [NL][No][X]"
    TEXTEND
    SVAL s7 TRUE
    BNE 0 sC s7
    MUSCMID 0x7FFF
    FADI 4
    MNCH 0xFFFF
    CHECK_SKIRMISH
    SVAL s1 1
    BNE 0 sC s1
    ASMC 0x37D59
    LABEL 0
    REMA
    EVBIT_T 7 // NoFade
    ENDA
*/

extern const u16 gEvent_SuspendPrompt[]; /*
    EVBIT_MODIFY 4
    TEXTSTART
    TEXTSHOW 0x8FE
    TEXTEND
    SVAL s7 TRUE
    BNE 0 sC s7
    ASMC 0xB5D5D // Save Suspended game
    TEXTSHOW2 0x8FF
    TEXTEND
    MUSCMID 0x7FFF
    FADI 4
    MNTS 0
    LABEL 0
    REMA
    EVBIT_T 7
    ENDA
*/

extern const u16 gEvent_GameOver[]; /* Game Over Events?
    1020 0004           | EVBIT_MODIFY 4
    0D40 0000 08085375  | ASMC StartGameOver // game over
    0120 0000           | ENDA
*/

extern const struct ProcScr gUnknown_08591540[]; // extern

void _MarkSomethingInMenu(void) {
    MarkSomethingInMenu();
}

void EventEngine_OnUpdate(struct EventEngineProc* proc) {
    if (BMXFADEExists())
        return;
    
    if (EventEngine_CanStartSkip(proc) && (gKeySt->pressed & START_BUTTON)) {
        EventEngine_StartSkip(proc);
        return;
    }

    if (proc->execType != EV_EXEC_WORLDMAP && proc->execType != EV_EXEC_UNK4) {
        SetDispEnable(1, 1, 1, 1, 1);
    }

    if (proc->pCallback) {
        proc->pCallback(proc);
        return;
    }

    proc->evStateBits |= EV_STATE_0002;

    while (TRUE) {
        unsigned evCode;
        EventFuncType evFunc;

        // Event Slot 0
        gEventSlots[0] = 0;

        evCode = (*proc->pEventCurrent) >> 8;
        evFunc = (evCode < 0x80) ? gEventScrLoFuncLut[evCode] : gEventScrHiFuncLut[evCode - 0x80];

        switch (evFunc(proc)) {
        case 0:
            proc->pEventCurrent += ((*proc->pEventCurrent) >> 4)&0xF;
        case 1:
        case 4:
        case 6:
            break;
        
        case 2:
            proc->pEventCurrent += ((*proc->pEventCurrent) >> 4)&0xF;
        case 3:
            return;
        
        case 5:
            Proc_Break(proc);
            return;
        }
    }
}

void EventEngine_OnEnd(struct EventEngineProc* proc) {
    SetTextFont(NULL);
    InitSystemTextFont();
    LoadUiFrameGraphics();

    switch (proc->execType) {
    case EV_EXEC_UNK4:
        break;
    
    case EV_EXEC_UNK5:
        ApplySystemGraphics();
        ApplyChapterMapPalettes();
        func_0800BCDC(proc->mapSpritePalIdOverride);

        if (proc->evStateBits & EV_STATE_CHANGEGM) {
            MU_EndAll();
            EndMapMain();
            memset((u8*)(gEventCallQueue), 0, 0x80);
        }

    case EV_EXEC_GAMEPLAY:
        UnlockGameLogic();
        UnMarkSomethingInMenu();
        func_0800BB98();
        ClearCutsceneUnits();

        break;
    }

    if (proc->execType != EV_EXEC_QUIET) {
        EndTalk(); // EndDialogueInterpreter
        func_0808F270(); // End some thing
        func_0808BB74(); // End some more things

        if (proc->execType == EV_EXEC_CUTSCENE)
            func_0800BCDC(proc->mapSpritePalIdOverride);
        
        func_0800E640(proc);
    }

    if (!(proc->evStateBits & EV_STATE_ABORT))
        CallNextQueuedEvent();
}

void EnqueueEventCall(const u16* events, u8 execType) {
    struct EnqueuedEventCall* it;
    u8 i;

    it = gEventCallQueue;

    for (i = -1; ++i <= 0xf;) {
        if (!it->isUsed) {
            it->events   = events;
            it->execType = execType;
            it->isUsed   = TRUE;

            break;
        }

        ++it;
    }
}

void CallNextQueuedEvent(void) {
    struct EnqueuedEventCall* it;
    u8 i;

    it = gEventCallQueue;

    if (it->isUsed == 1)
        EventEngine_Create(it->events, it->execType);
    
    for (i = 0; i < 15; ++i, ++it)
        *it = *(it + 1);
    
    it->events   = NULL;
    it->execType = 0;
    it->isUsed   = 0;
}

void CallEvent(const u16* events, u8 execType) {
    bool found = FindProc(ProcScr_EventScript) != 0;

    if (found)
        EnqueueEventCall(events, execType);
    else
        EventEngine_Create(events, execType);
}

struct EventEngineProc* EventEngine_Create(const u16* events, u8 execType) {
    struct EventEngineProc* proc = SpawnProc(ProcScr_EventScript, PROC_TREE_3);

    proc->pCallback      = NULL;

    proc->pEventStart    = events;
    proc->pEventIdk      = events;
    proc->pEventCurrent  = events;

    proc->evStateBits    = EV_STATE_NONE;
    proc->evStallTimer   = 0;

    proc->overwrittenTextSpeed = -1;
    proc->execType       = execType;
    proc->activeTextType = 0;
    proc->chapter   = -1;

    proc->mapSpritePalIdOverride = 0x000;

    proc->pUnitLoadData  = NULL;
    proc->unitLoadCount  = 0;
    proc->idk4E          = 0;

    if (gDispIo.blendY == 0x10)
        proc->evStateBits |= EV_STATE_FADEDIN;

    switch (execType) {
    case EV_EXEC_WORLDMAP:
        break;

    case EV_EXEC_CUTSCENE:
    case EV_EXEC_GAMEPLAY:
        proc->chapter = gPlaySt.chapter;
        LockGameLogic();
        break;
    }

    return proc;
}

void EventEngine_CreateBattle(const u16* events) {
    struct EventEngineProc* proc = SpawnProc(ProcScr_BattleEventScript, PROC_TREE_3);

    proc->pCallback     = NULL;

    proc->pEventStart    = events;
    proc->pEventIdk      = events;
    proc->pEventCurrent  = events;

    proc->evStateBits    = EV_STATE_NONE;
    proc->evStallTimer   = 0;

    proc->overwrittenTextSpeed = -1;
    proc->execType       = EV_EXEC_QUIET;
    proc->activeTextType = 0;
    
    proc->mapSpritePalIdOverride = 0x000;

    proc->pUnitLoadData  = NULL;
    proc->unitLoadCount  = 0;
    proc->idk4E          = 0;

    proc->evStateBits |= EV_STATE_ABORT;
}

int EventEngineExists(void) {
    return FindProc(ProcScr_EventScript) ? TRUE : FALSE;
}

int BattleEventEngineExists(void) {
    return FindProc(ProcScr_BattleEventScript) ? TRUE : FALSE;
}

void DeleteEventEngines(void) {
    EndEachProc(ProcScr_EventScript);
    EndEachProc(ProcScr_BattleEventScript);
}

void func_0800D1E4(Proc_t* proc) {
    SpawnProcLocking(ProcScr_Unk_08591DD8, proc);
}

void SetEventSlotC(unsigned value) {
    gEventSlots[0xC] = value;
}

void func_0800D204(void) {} // nullsub

int func_0800D208(void) {
    struct EventEngineProc* proc;

    if (!(proc = FindProc(ProcScr_EventScript)))
        if (!(proc = FindProc(ProcScr_BattleEventScript)))
            return FALSE;
    
    switch (proc->activeTextType) {

    case 0:
        return FALSE;

    case 1:
        return TRUE;

    case 2:
        return TRUE;

    case 3:
        return FALSE;

    case 4:
        return FALSE;

    case 5:
        return FALSE;

    }

    return FALSE;
}

void CallBattleQuoteEvent(u16 textIndex) {
    // Battle quote (unused?)
    CallEvent(gEvent_DisplayBattleQuote, EV_EXEC_GAMEPLAY);

    gEventSlots[0x02] = textIndex;
}

void CallBattleQuoteEventInBattle(u16 textIndex) {
    // Battle quote
    EventEngine_CreateBattle(gEvent_DisplayBattleQuote);

    gEventSlots[0x2] = textIndex;
}

void CallTileChangeEvent(u16 tileChangeIndex) {
    // Generic tile change events?
    CallEvent(gEvent_TriggerQueuedTileChanges, EV_EXEC_GAMEPLAY);

    gEventSlots[0xD] = 1; // qp
    gEventSlotQueue[0]   = tileChangeIndex;
}

void CallChestOpeningEvent(u16 tileChangeIndex, u16 idr) {
    // Chest opening events?
    CallEvent(gEvent_OpenChest, EV_EXEC_GAMEPLAY);

    gEventSlots[0xD] = 1; // qp
    gEventSlotQueue[0]   = tileChangeIndex;
    gEventSlots[0x3] = idr;
}

void CallMapSupportEvent(u16 musicIndex, u16 textIndex) {
    // Calls text with music (just quiets music when id is 0)
    // On-map supports?
    CallEvent(gEvent_MapSupportConversation, EV_EXEC_CUTSCENE);

    gEventSlots[0x2] = musicIndex;
    gEventSlots[0x3] = textIndex;
}

void CallSupportViewerEvent(u16 textIndex) {
    // Calls text with random background (support viewer?)
    CallEvent(gEvent_SupportViewerConversation, EV_EXEC_QUIET);

    gEventSlots[0x2] = textIndex;
}

void CallRetreatPromptEvent(void) {
    // Calls Retreat events
    CallEvent(gEvent_SkirmishRetreat, EV_EXEC_CUTSCENE);
    
    gEventSlots[0x2] = gPlaySt.chapter;
}

void CallSuspendPromptEvent(void) {
    // Calls Suspend events
    CallEvent(gEvent_SuspendPrompt, EV_EXEC_CUTSCENE);
}

void CallGameOverEvent(void) {
    // Calls Game Over
    EventEngine_Create(gEvent_GameOver, EV_EXEC_GAMEPLAY);
}

bool EventEngine_CanStartSkip(struct EventEngineProc* proc) { // Events_CanSkip
    if (!(proc->evStateBits & EV_STATE_0002))
        return FALSE;

    // Why is this check so different??
    if (((proc->evStateBits >> 2) & 1)) // & EV_STATE_SKIPPING
        return FALSE;

    if ((proc->evStateBits & EV_STATE_NOSKIP))
        return FALSE;

    if (IsBattleDeamonActive())
        return FALSE;

    if (FindProc(ProcScr_MUDeathFade))
        return FALSE;

    return TRUE;
}

void func_0800D3E4(void) {
    struct EventEngineProc* proc;

    if (!(proc = FindProc(ProcScr_EventScript)))
        if (!(proc = FindProc(ProcScr_BattleEventScript)))
            return;
    
    proc->evStateBits |= EV_STATE_0008;
}

void EventEngine_StartSkip(struct EventEngineProc* proc) {
    proc->evStateBits |= EV_STATE_SKIPPING;

    if (!GetZero()) {
        if (func_080BA054() == TRUE) // World Map check
            func_0800D488(proc);
        else if (!(proc->evStateBits & EV_STATE_NOFADE)) {
            if (proc->evStateBits & EV_STATE_FADEDIN)
                func_0800D488(proc);
            else
                StartBlockingFadeInBlack(0x40, (Proc_t*)(proc));
            
            proc->evStateBits |= EV_STATE_FADEDIN;
        }
    }

    if (proc->execType == EV_EXEC_WORLDMAP)
        func_080BA424();
    
    LockEachMarkedProc(5);
}

void func_0800D488(struct EventEngineProc* unused) {
    BlackenScreen(); // disables layers
    EndEachProc(gUnknown_08591540);
}

void SetEventTriggerState(u16 triggerId, bool value) {
    if (!value)
        ClearFlag(triggerId);
    else
        SetFlag(triggerId);
}

int GetEventTriggerState(u16 triggerId) {
    if (!CheckFlag(triggerId))
        return FALSE;
    return TRUE;
}

Proc_t* func_0800D4D4(Proc_t* parent, ProcFunc init, ProcFunc loop, ProcFunc dest) {
    struct ProcScr code[] = {
        PROC_ONEND(dest),
        PROC_CALL(init),
        PROC_REPEAT(loop),
        PROC_END
    };
    
    memcpy(gUnknown_030005B0, code, sizeof code);
    return SpawnProc(gUnknown_030005B0, parent);
}

void func_0800D524(void) {} // nullsub

void SlotQueuePush(unsigned value) {
    gEventSlotQueue[gEventSlots[0xD]] = value;
    gEventSlots[0xD]++;
}

unsigned SlotQueuePop(void) {
    i16 i;
    unsigned result;
    
    result = gEventSlotQueue[0];

    gEventSlots[0xD]--;

    for (i = 0; i < gEventSlots[0xD]; ++i)
        gEventSlotQueue[i] = gEventSlotQueue[i+1];

    return result;
}

void SetEventCounter(unsigned value) {
    gEventSlotCounter = value;
}

unsigned GetEventCounter(void) {
    return gEventSlotCounter;
}
