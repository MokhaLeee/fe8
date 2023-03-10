#include "global.h"

#include "constants/iids.h"

#include "proc.h"
#include "hardware.h"
#include "icon.h"
#include "text.h"
#include "uiutils.h"
#include "statscreen.h"

#include "item.h"
#include "unit.h"

#include "m4a.h"
#include "sound.h"
#include "event.h"

enum
{
    // MAGIC CONSTANTS

    UNIT_PANEL_WIDTH = 6,

    IID_PANEL_WIDTH = 7,

    IID_PANEL_LEFT_X = 1,
    IID_PANEL_LEFT_Y = 8,

    IID_PANEL_RIGHT_X = 15,
    IID_PANEL_RIGHT_Y = 8,
};

enum
{
    TRADEMENU_UNIT_UNDEFINED = 0xFF,

    TRADEMENU_UNIT_LEFT  = 0,
    TRADEMENU_UNIT_RIGHT = 1,
};

struct TradeMenuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ Unit_t* units[2];

    /* 34 */ i8 hasItem[2][UNIT_ITEM_COUNT + 1];

    /* 40 */ i8 hasTraded;

    /* 41 */ u8 hoverColumn;
    /* 42 */ u8 hoverRow;

    /* 43 */ u8 selectedColumn;
    /* 44 */ u8 selectedRow;

    /* 45 */ i8 extraCellEnabled;

    /* 46 */ u8 extraColumn;
    /* 47 */ u8 extraRow;

    /* 48 */ u8 tradeTutorialState;

    /* 49 */ u8 pad[0x4C - 0x49];
    /* 4C */ short timer;
};

static void TradeMenu_InitUnitNameDisplay(struct TradeMenuProc* proc);

static void TradeMenu_HighlightUpdater_OnInit(struct TradeMenuProc* proc);
static void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc* proc);

static int  TradeMenu_GetAdjustedRow(struct TradeMenuProc* proc, int col, int row);
static void TradeMenu_InitItemText(struct TradeMenuProc* proc);
static void TradeMenu_RefreshItemText(struct TradeMenuProc* proc);
static void TradeMenu_RefreshSelectableCells(struct TradeMenuProc* proc);
static i8   TradeMenu_UpdateSelection(struct TradeMenuProc* proc);
static void TradeMenu_ApplyItemSwap(struct TradeMenuProc* proc);
static void TradeMenu_InitItemDisplay(struct TradeMenuProc* proc);
static void TradeMenu_OnInitUnselected(struct TradeMenuProc* proc);
static void TradeMenu_OnLoopUnselected(struct TradeMenuProc* proc);
static void TradeMenu_OnInitSelected(struct TradeMenuProc* proc);
static void TradeMenu_OnLoopSelected(struct TradeMenuProc* proc);
static void TradeMenu_OnEndSelected(struct TradeMenuProc* proc);
static i8   TradeMenu_LoadForcedInitialHover(struct TradeMenuProc* proc);
static void TradeMenu_ClearDisplay(struct TradeMenuProc* proc);

static void TradeMenu_HelpBox_OnInit(Proc_t* proc);
static void TradeMenu_HelpBox_OnLoop(Proc_t* proc);
static void TradeMenu_HelpBox_OnEnd(Proc_t* proc);

static void TradeMenu_TutorialHandCursor_Update(void);
static void TradeMenu_DoubleTutorialHandCursor_Update(void);

static void StartTradeMenuTutorialHandCursor(void);
static void StartDoubleTradeMenuTutorialHandCursor(void);
static void EndTradeMenuTutorialHandCursor(void);
static void EndDoubleTradeMenuTutorialHandCursor(void);
static void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc* proc);
static void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc* proc);

static i8 TradeMenu_UpdateTutorial(struct TradeMenuProc* proc);

// ASMCs
void func_0802DEDC(Proc_t* ee);
void func_0802E0A0(void);
void func_0802E0B0(void);
void func_0802E0C0(void);
void func_0802E0D0(void);
void func_0802E0E0(void);
void func_0802E0F0(void);
void func_0802E100(void);

static i8 AreKeysHeld(void);

static void TradeMenu_StartTutorialEventLock(struct TradeMenuProc* proc);
static void TradeMenu_InitTradeTutorial(struct TradeMenuProc* proc);
static void func_0802E168(struct TradeMenuProc* proc);
static void func_0802E188(struct TradeMenuProc* proc);
static void func_0802E1A8(struct TradeMenuProc* proc);

enum
{
    L_TRADEMENU_UNSELECTED = 0,
    L_TRADEMENU_SELECTED   = 1,
    L_TRADEMENU_END        = 2,

    L_TRADEMENU_LOADFORCED = 101,
};

// TODO: BM_OVERLAY_DATA?
extern struct Text gTradeMenuText[2][UNIT_ITEM_COUNT];

EWRAM_DATA static struct TradeMenuProc* sTradeMenuProc = NULL;

CONST_DATA
static struct Vec2 sItemDisplayTileLocation[2][UNIT_ITEM_COUNT] = {
    [TRADEMENU_UNIT_LEFT] = {
        { IID_PANEL_LEFT_X + 1, IID_PANEL_LEFT_Y + 1 },
        { IID_PANEL_LEFT_X + 1, IID_PANEL_LEFT_Y + 3 },
        { IID_PANEL_LEFT_X + 1, IID_PANEL_LEFT_Y + 5 },
        { IID_PANEL_LEFT_X + 1, IID_PANEL_LEFT_Y + 7 },
        { IID_PANEL_LEFT_X + 1, IID_PANEL_LEFT_Y + 9 },
    },

    [TRADEMENU_UNIT_RIGHT] = {
        { IID_PANEL_RIGHT_X + 1, IID_PANEL_RIGHT_Y + 1 },
        { IID_PANEL_RIGHT_X + 1, IID_PANEL_RIGHT_Y + 3 },
        { IID_PANEL_RIGHT_X + 1, IID_PANEL_RIGHT_Y + 5 },
        { IID_PANEL_RIGHT_X + 1, IID_PANEL_RIGHT_Y + 7 },
        { IID_PANEL_RIGHT_X + 1, IID_PANEL_RIGHT_Y + 9 },
    }
};

CONST_DATA
static struct ProcScr sProcScr_TradeMenu_HighlightUpdater[] = {
    PROC_CALL(TradeMenu_HighlightUpdater_OnInit),
    PROC_REPEAT(TradeMenu_HighlightUpdater_OnLoop),

    PROC_END
};

CONST_DATA
static struct ProcScr sProcScr_TradeMenu[] = {
    PROC_CALL(LockGameLogic),
    PROC_SLEEP(0),

    PROC_WHILE_EXISTS(ProcScr_CameraPan),

    PROC_CALL(TradeMenu_InitItemDisplay),
    PROC_CALL(TradeMenu_InitUnitNameDisplay),

    PROC_START_CHILD(sProcScr_TradeMenu_HighlightUpdater),

PROC_LABEL(L_TRADEMENU_LOADFORCED),
    PROC_CALL(TradeMenu_InitTradeTutorial),
    PROC_CALL_2(TradeMenu_LoadForcedInitialHover),
    PROC_SLEEP(0),

PROC_LABEL(L_TRADEMENU_UNSELECTED),
    PROC_CALL(TradeMenu_OnInitUnselected),
    PROC_REPEAT(TradeMenu_OnLoopUnselected),

PROC_LABEL(L_TRADEMENU_SELECTED),
    PROC_CALL(TradeMenu_OnInitSelected),
    PROC_REPEAT(TradeMenu_OnLoopSelected),

    PROC_CALL(TradeMenu_OnEndSelected),

    PROC_GOTO(L_TRADEMENU_UNSELECTED),

PROC_LABEL(L_TRADEMENU_END),
    PROC_CALL(TradeMenu_ClearDisplay),
    PROC_CALL(ClearBg0Bg1),

    PROC_CALL(UnlockGameLogic),

    PROC_END
};

CONST_DATA
static struct ProcScr sProcScr_TradeMenu_HelpBox[] = {
    PROC_CALL(TradeMenu_HelpBox_OnInit),
    PROC_REPEAT(TradeMenu_HelpBox_OnLoop),

    PROC_CALL(TradeMenu_HelpBox_OnEnd),

    PROC_END
};

CONST_DATA
static struct ProcScr sProcScr_TradeMenu_TutorialHandCursor[] = {
    PROC_ONEND(TradeMenu_TutorialHandCursor_Update),
    PROC_REPEAT(TradeMenu_TutorialHandCursor_Update),

    PROC_END
};

CONST_DATA
static struct ProcScr sProcScr_TradeMenu_DoubleTutorialHandCursor[] = {
    PROC_ONEND(TradeMenu_DoubleTutorialHandCursor_Update),
    PROC_REPEAT(TradeMenu_DoubleTutorialHandCursor_Update),

    PROC_END
};

CONST_DATA
static struct ProcScr sProcScr_TradeMenu_TutorialWait[] = {
    PROC_CALL(TradeMenu_TutorialWait_OnInit),
    PROC_REPEAT(TradeMenu_TutorialWait_OnLoop),

    PROC_END
};

CONST_DATA
static struct ProcScr sProcScr_TradeMenu_TutorialEventLock[] = {
    PROC_WHILE(EventEngineExists),
    PROC_WHILE(AreKeysHeld),

    PROC_CALL(EndTradeMenuTutorialHandCursor),
    PROC_CALL(EndDoubleTradeMenuTutorialHandCursor),

    PROC_END
};

// TODO: actual events!
extern const u16 gUnknown_0859BC64[];
extern const u16 gUnknown_0859BCA8[];
extern const u16 gUnknown_0859BCF4[];
extern const u16 gUnknown_0859BD40[];

void TradeMenu_InitUnitNameDisplay(struct TradeMenuProc* proc)
{
    char* str;
    int xStart;

    // TODO: constants
    StartSmallBrownNameBoxes(6, 0x4800, 0x08, 0x800, 0x400, (Proc_t*) (proc));

    func_080ADBFC(0, -40, -1, 1);
    func_080ADBFC(1, 184, -1, 0);

    // TODO: special effect constants
    SetBlendConfig(1, 12, 6, 0);

    // TODO: name functions
    SetBlendTargetA(FALSE, FALSE, FALSE, FALSE, FALSE);
    SetBlendTargetB(TRUE,  TRUE,  TRUE,  TRUE,  TRUE);

    // TODO: text color constants

    str = GetMsg(UNIT_NAME_ID(proc->units[0]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextLen(str)) / 2;

    PutDrawText(NULL, gBg0Tm + TM_OFFSET(0, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    str = GetMsg(UNIT_NAME_ID(proc->units[1]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextLen(str)) / 2;

    PutDrawText(NULL, gBg0Tm + TM_OFFSET(24, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    EnableBgSync(BG0_SYNC_BIT);
}

void TradeMenu_HighlightUpdater_OnInit(struct TradeMenuProc* proc)
{
    proc->hoverColumn = TRADEMENU_UNIT_UNDEFINED;
}

void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc* proc)
{
    struct TradeMenuProc* tradeMenu = proc->proc_parent;

    if (proc->hoverColumn == tradeMenu->hoverColumn && proc->hoverRow == tradeMenu->hoverRow)
        return;

    if (proc->hoverColumn != TRADEMENU_UNIT_UNDEFINED)
    {
        ClearUiItemHover(
            sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y,
            12);
    }

    DrawUiItemHover(
        sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        12);

    proc->hoverColumn = tradeMenu->hoverColumn;
    proc->hoverRow = tradeMenu->hoverRow;
}

int TradeMenu_GetAdjustedRow(struct TradeMenuProc* proc, int col, int row)
{
    while (proc->hasItem[col][row] == 0 && row >= 0)
        row--;

    return row;
}

void TradeMenu_InitItemText(struct TradeMenuProc* proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            InitTextDb(&gTradeMenuText[col][row], IID_PANEL_WIDTH);
        }
    }
}

void TradeMenu_RefreshItemText(struct TradeMenuProc* proc)
{
    u8 xLookup[] = { IID_PANEL_LEFT_X, IID_PANEL_RIGHT_X };
    u8 yLookup[] = { IID_PANEL_LEFT_Y, IID_PANEL_RIGHT_Y };

    int col, row;

    CpuFastFill(0, gBg0Tm + TM_OFFSET(0, 9), 11 * 0x20 * sizeof(u16));

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            int item = proc->units[col]->items[row];

            ClearText(&gTradeMenuText[col][row]);

            if (item)
            {
                PutItemMenuLine(&gTradeMenuText[col][row], item, IsItemDisplayUsable(proc->units[col], item),
                    gBg0Tm + TM_OFFSET(xLookup[col] + 1, yLookup[col] + row * 2 + 1));
            }
        }
    }

    EnableBgSync(BG0_SYNC_BIT);
}

void TradeMenu_RefreshSelectableCells(struct TradeMenuProc* proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            u16 item = proc->units[col]->items[row];
            proc->hasItem[col][row] = (item ? TRUE : FALSE);
        }
    }

    proc->hasItem[0][UNIT_ITEM_COUNT] = 0;
    proc->hasItem[1][UNIT_ITEM_COUNT] = 0;
}

i8 TradeMenu_UpdateSelection(struct TradeMenuProc* proc)
{
    i8 changedSelection = FALSE;
    int newSelectedRow;

    if ((gKeySt->repeated & DPAD_LEFT) && proc->hoverColumn == TRADEMENU_UNIT_RIGHT)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, TRADEMENU_UNIT_LEFT, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = TRADEMENU_UNIT_LEFT;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySe(0x67);
    }

    if ((gKeySt->repeated & DPAD_RIGHT) && proc->hoverColumn == TRADEMENU_UNIT_LEFT)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, TRADEMENU_UNIT_RIGHT, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = TRADEMENU_UNIT_RIGHT;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySe(0x67);
    }

    if ((gKeySt->repeated & DPAD_UP))
    {
        if (proc->hoverRow == 0)
        {
            if (gKeySt->repeated != gKeySt->pressed)
                goto end;

            proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, UNIT_ITEM_COUNT - 1) + 1;
        }

        proc->hoverRow--;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySe(0x66);
    }

    if ((gKeySt->repeated & DPAD_DOWN))
    {
        if (!proc->hasItem[proc->hoverColumn][proc->hoverRow + 1])
        {
            if (gKeySt->repeated != gKeySt->pressed)
                goto end;

            proc->hoverRow = -1;
        }

        proc->hoverRow++;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySe(0x66);
    }

end:
    return changedSelection;
}

void TradeMenu_ApplyItemSwap(struct TradeMenuProc* proc)
{
    u16* pItemA = &proc->units[proc->hoverColumn]->items[proc->hoverRow];
    u16* pItemB = &proc->units[proc->selectedColumn]->items[proc->selectedRow];

    u16 swp = *pItemA;
    *pItemA = *pItemB;
    *pItemB = swp;

    proc->hasTraded = TRUE;

    gAction.unitActionType = UNIT_ACTION_TRADED;

    UnitRemoveInvalidItems(proc->units[0]);
    UnitRemoveInvalidItems(proc->units[1]);

    TradeMenu_RefreshItemText(proc);
}

void TradeMenu_InitItemDisplay(struct TradeMenuProc* proc)
{
    DrawUiFrame2(1,  8, 14, 12, 0);
    DrawUiFrame2(15, 8, 14, 12, 0);

    ResetTextFont();

    ClearIcons();
    ApplyIconPalettes(4); // TODO: palette id constant

    TradeMenu_InitItemText(proc);
    TradeMenu_RefreshItemText(proc);

    // TODO: face display type (arg 5) constants
    StartFace(0, GetUnitFid(proc->units[0]), 64,  -4, 3);
    StartFace(1, GetUnitFid(proc->units[1]), 176, -4, 2);

    SetFaceBlinkControlById(0, 5);
    SetFaceBlinkControlById(1, 5);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void TradeMenu_OnInitUnselected(struct TradeMenuProc* proc)
{
    TradeMenu_RefreshSelectableCells(proc);
    proc->extraCellEnabled = FALSE;
}

void TradeMenu_OnLoopUnselected(struct TradeMenuProc* proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        DisplayUiHand(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        DisplayUiHand(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        if (gKeySt->pressed & A_BUTTON)
        {
            Proc_Goto(proc, L_TRADEMENU_SELECTED);
            PlaySe(0x6A); // TODO: SONG ID DEFINITIONS
        }
        else if (gKeySt->pressed & B_BUTTON)
        {
            Proc_Goto(proc, L_TRADEMENU_END);
            PlaySe(0x6B); // TODO: SONG ID DEFINITIONS
        }
        else if (gKeySt->pressed & R_BUTTON)
        {
            SpawnProcLocking(sProcScr_TradeMenu_HelpBox, proc);
        }
    }
}

void TradeMenu_OnInitSelected(struct TradeMenuProc* proc)
{
    int lastRow;

    proc->selectedColumn = proc->hoverColumn;
    proc->selectedRow = proc->hoverRow;

    proc->hoverColumn = proc->hoverColumn ^ 1;

    lastRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, (UNIT_ITEM_COUNT - 1));

    if (lastRow != (UNIT_ITEM_COUNT - 1))
    {
        proc->hoverRow = lastRow + 1;
        proc->hasItem[proc->hoverColumn][proc->hoverRow] = TRUE;

        proc->extraCellEnabled = TRUE;

        proc->extraColumn = proc->hoverColumn;
        proc->extraRow = proc->hoverRow;
    }
}

void TradeMenu_OnLoopSelected(struct TradeMenuProc* proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        DisplayUiHand(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        DisplayUiHand(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);

        if (gKeySt->pressed & A_BUTTON)
        {
            TradeMenu_ApplyItemSwap(proc);

            PlaySe(0x6A); // TODO: SONG ID DEFINITIONS
            Proc_Break(proc);
        }
        else if (gKeySt->pressed & B_BUTTON)
        {
            PlaySe(0x6B); // TODO: SONG ID DEFINITIONS
            Proc_Break(proc);
        }
        else if (gKeySt->pressed & R_BUTTON)
        {
            SpawnProcLocking(sProcScr_TradeMenu_HelpBox, proc);
        }
    }
}

void TradeMenu_OnEndSelected(struct TradeMenuProc* proc)
{
    proc->hoverColumn = proc->selectedColumn;
    proc->hoverRow = proc->selectedRow;

    TradeMenu_RefreshSelectableCells(proc);

    if (!proc->hasItem[proc->hoverColumn][0])
        proc->hoverColumn = proc->hoverColumn ^ 1;

    proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, proc->hoverRow);
}

i8 TradeMenu_LoadForcedInitialHover(struct TradeMenuProc* proc)
{
    if (gBmSt.unk3F < 0)
        return TRUE;

    proc->hoverColumn = gBmSt.unk3F / UNIT_ITEM_COUNT;
    proc->hoverRow   = gBmSt.unk3F % UNIT_ITEM_COUNT;

    TradeMenu_RefreshSelectableCells(proc);
    Proc_Goto(proc, L_TRADEMENU_SELECTED);

    return FALSE;
}

void TradeMenu_ClearDisplay(struct TradeMenuProc* proc)
{
    EndFaceById(0);
    EndFaceById(1);
}

void TradeMenu_HelpBox_OnInit(Proc_t* proc)
{
    struct TradeMenuProc* tradeMenu = proc->proc_parent;

    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverRow];

    if (!item)
    {
        Proc_End(proc);
        return;
    }

    if (tradeMenu->extraCellEnabled)
    {
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = FALSE;
    }

    LoadHelpBoxGfx(NULL, -1);

    ShowItemHelpBox(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        item);

    gKeySt->pressed = gKeySt->pressed &~ (B_BUTTON | R_BUTTON);
}

void TradeMenu_HelpBox_OnLoop(Proc_t* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->proc_parent;

    i8 changedSelection = TradeMenu_UpdateSelection(tradeMenu);
    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverRow];

    if (changedSelection)
    {
        ShowItemHelpBox(
            8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
            8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
            item);
    }

    if (gKeySt->pressed & (B_BUTTON | R_BUTTON))
    {
        Proc_Break(proc);
    }

    DisplayUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

void TradeMenu_HelpBox_OnEnd(Proc_t* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->proc_parent;

    if (tradeMenu->extraCellEnabled)
    {
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = TRUE;
    }

    MoveableHelpBox_OnEnd();

    DisplayUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

Proc_t* StartTradeMenu(Unit_t* lUnit, Unit_t* rUnit, int unused)
{
    int itemCount;

    struct TradeMenuProc* proc = SpawnProc(sProcScr_TradeMenu, PROC_TREE_3);

    proc->units[0] = lUnit;
    proc->units[1] = rUnit;

    proc->hasTraded = FALSE;

    proc->hoverColumn = TRADEMENU_UNIT_LEFT;
    proc->hoverRow = 0;

    proc->tradeTutorialState = 0;

    sTradeMenuProc = proc;

    if (func_080837F8())
    {
        SetKeyIgnore(A_BUTTON | START_BUTTON | DPAD_DOWN | DPAD_UP);
        proc->tradeTutorialState = 1;
    }

    if (GetUnitItemCount(lUnit) == 0)
    {
        proc->hoverColumn = TRADEMENU_UNIT_RIGHT;
    }
}

void TradeMenu_TutorialHandCursor_Update(void)
{
    struct TradeMenuProc* tradeMenu = sTradeMenuProc;

    DisplayFrozenUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);
}

void TradeMenu_DoubleTutorialHandCursor_Update(void)
{
    struct TradeMenuProc* tradeMenu = sTradeMenuProc;

    DisplayFrozenUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    DisplayFrozenUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
}

void StartTradeMenuTutorialHandCursor(void)
{
    SpawnProc(sProcScr_TradeMenu_TutorialHandCursor, PROC_TREE_3);
}

void StartDoubleTradeMenuTutorialHandCursor(void)
{
    SpawnProc(sProcScr_TradeMenu_DoubleTutorialHandCursor, PROC_TREE_3);
}

void EndTradeMenuTutorialHandCursor(void)
{
    EndEachProc(sProcScr_TradeMenu_TutorialHandCursor);
}

void EndDoubleTradeMenuTutorialHandCursor(void)
{
    EndEachProc(sProcScr_TradeMenu_DoubleTutorialHandCursor);
}

void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc* proc)
{
    proc->timer = 20;
}

void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc* proc)
{
    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void func_0802DEDC(Proc_t* ee)
{
    if (sTradeMenuProc->tradeTutorialState != 3 && sTradeMenuProc->tradeTutorialState != 5 && sTradeMenuProc->tradeTutorialState != 8)
    {
        SpawnProcLocking(sProcScr_TradeMenu_TutorialWait, ee);
    }
}

i8 TradeMenu_UpdateTutorial(struct TradeMenuProc* proc)
{
    if (proc->tradeTutorialState != 4 && (gKeySt->pressed == 0))
        return FALSE;

    switch (sTradeMenuProc->tradeTutorialState)
    {

    case 2:
        if (gKeySt->pressed & DPAD_RIGHT)
        {
            SetKeyIgnore(START_BUTTON | DPAD_UP | DPAD_DOWN);
            func_0802E168(proc);

            return FALSE;
        }

        PlaySe(0x6C); // TODO: SONG ID DEFINITIONS

        Proc_Goto(proc, L_TRADEMENU_LOADFORCED);

        return TRUE;

    case 3:
        if (!(gKeySt->pressed & (B_BUTTON | DPAD_LEFT | R_BUTTON)))
        {
            if (!(gKeySt->pressed & A_BUTTON))
                return FALSE;

            if (!(gKeySt->pressed & (DPAD_UP | DPAD_DOWN)))
            {
                if (GetItemIid(proc->units[proc->hoverColumn]->items[proc->hoverRow]) == IID_VULNERARY)
                {
                    SetKeyIgnore(START_BUTTON | DPAD_UP | DPAD_DOWN);
                    func_0802E0C0();

                    return FALSE;
                }
            }
        }

        PlaySe(0x6C); // TODO: SONG ID DEFINITIONS

        func_0802E168(proc);

        return TRUE;

    case 5:
        if (gKeySt->pressed & A_BUTTON)
        {
            func_0802E1A8(proc);

            return FALSE;
        }

        PlaySe(0x6C); // TODO: SONG ID DEFINITIONS

        func_0802E188(proc);

        return TRUE;

    case 4:
        func_0802E188(proc);

        return TRUE;

    case 8:
        if (gKeySt->pressed & B_BUTTON)
        {
            SetKeyIgnore(0);
            ClearFlag(0x87); // TODO: EID/FLAG DEFINTIONS

            return FALSE;
        }

        PlaySe(0x6C); // TODO: SONG ID DEFINITIONS

        func_0802E1A8(proc);

        return TRUE;

    default:
        return FALSE;

    } // switch (sTradeMenuProc->tradeTutorialState)
}

void func_0802E0A0(void)
{
    sTradeMenuProc->tradeTutorialState = 2;
}

void func_0802E0B0(void)
{
    sTradeMenuProc->tradeTutorialState = 3;
}

void func_0802E0C0(void)
{
    sTradeMenuProc->tradeTutorialState = 4;
}

void func_0802E0D0(void)
{
    sTradeMenuProc->tradeTutorialState = 5;
}

void func_0802E0E0(void)
{
    sTradeMenuProc->tradeTutorialState = 6;
}

void func_0802E0F0(void)
{
    sTradeMenuProc->tradeTutorialState = 7;
}

void func_0802E100(void)
{
    sTradeMenuProc->tradeTutorialState = 8;
}

i8 AreKeysHeld(void)
{
    if (!gKeySt->held)
        return FALSE;

    return TRUE;
}

void TradeMenu_StartTutorialEventLock(struct TradeMenuProc* proc)
{
    SpawnProcLocking(sProcScr_TradeMenu_TutorialEventLock, proc);
}

void TradeMenu_InitTradeTutorial(struct TradeMenuProc* proc)
{
    if (proc->tradeTutorialState)
    {
        CallEvent(gUnknown_0859BC64, EV_EXEC_QUIET);
        TradeMenu_StartTutorialEventLock(proc);

        StartTradeMenuTutorialHandCursor();
    }
}

void func_0802E168(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BCA8, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartTradeMenuTutorialHandCursor();
}

void func_0802E188(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BCF4, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartDoubleTradeMenuTutorialHandCursor();
}

void func_0802E1A8(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BD40, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartTradeMenuTutorialHandCursor();
}
