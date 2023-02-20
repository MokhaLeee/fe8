#include "item-use.h"

#include "m4a.h"
#include "sound.h"
#include "hardware.h"
#include "oam.h"
#include "sprite.h"
#include "text.h"
#include "sprite-anim.h"
#include "item.h"
#include "unit.h"
#include "map.h"
#include "battle.h"
#include "trap.h"
#include "uiutils.h"
#include "uimenu.h"
#include "mapselect.h"

#include "constants/pids.h"
#include "constants/iids.h"
#include "constants/terrains.h"

struct WarpSelectProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad_warp_select_proc_29[0x4A - 0x29];
    /* 4A */ short prev_warp_allowed;
    /* 4C */ u8 pad_warp_select_proc_4C[0x54 - 0x4C];
    /* 54 */ SpriteAnim_t* sprite_anim;
};

extern Unit_t gStatGainSimUnit;

extern struct ProcScr CONST_DATA ProcScr_0859B600[]; // go back to unit menu proc

extern struct MenuInfo const MenuInfo_RepairItems;

extern SelectInfo_t CONST_DATA SelectInfo_AttackStaff;
extern SelectInfo_t CONST_DATA SelectInfo_Barrier;
extern SelectInfo_t CONST_DATA SelectInfo_Restore;
extern SelectInfo_t CONST_DATA SelectInfo_Heal;
extern SelectInfo_t CONST_DATA SelectInfo_PutTrap;
extern SelectInfo_t CONST_DATA SelectInfo_Staff;
extern SelectInfo_t CONST_DATA SelectInfo_Repair;

extern u16 CONST_DATA SpriteAnim_Unknown_085A0EA0[];

static void WarpSelect_OnEnd(struct WarpSelectProc* proc);
static void WarpSelect_OnInit(struct WarpSelectProc* proc);
static void WarpSelect_OnIdle(struct WarpSelectProc* proc);
static void WarpSelect_OnConfirm(struct WarpSelectProc* proc);
static void WarpSelect_OnCancel(struct WarpSelectProc* proc);

static void TorchSelect_OnInit(struct WarpSelectProc* proc);
static void TorchSelect_OnIdle(struct WarpSelectProc* proc);

struct ProcScr CONST_DATA ProcScr_WarpSelect[] =
{
    PROC_ONEND(WarpSelect_OnEnd),

    PROC_CALL(LockGameLogic),

    PROC_WHILE_EXISTS(ProcScr_CameraPan),

    PROC_CALL(WarpSelect_OnInit),
    PROC_WHILE_EXISTS(ProcScr_CameraPan),

    PROC_REPEAT(WarpSelect_OnIdle),

    PROC_CALL(WarpSelect_OnConfirm),
    PROC_SLEEP(0),

    PROC_CALL(UnlockGameLogic),

    PROC_GOTO(100),

PROC_LABEL(99),
    PROC_CALL(WarpSelect_OnCancel),
    PROC_SLEEP(0),

    PROC_CALL(UnlockGameLogic),

PROC_LABEL(100),
    PROC_END,
};

struct ProcScr CONST_DATA ProcScr_TorchSelect[] =
{
    PROC_CALL(LockGameLogic),

    PROC_CALL(TorchSelect_OnInit),
    PROC_WHILE_EXISTS(ProcScr_CameraPan),

    PROC_REPEAT(TorchSelect_OnIdle),

    PROC_CALL(WarpSelect_OnConfirm),

    PROC_GOTO(100),

PROC_LABEL(99),
    PROC_CALL(WarpSelect_OnCancel),

PROC_LABEL(100),
    PROC_CALL(UnlockGameLogic),

    PROC_END,
};

bool CanUnitUseItem(Unit_t* unit, int item)
{
    if ((GetItemAttributes(item) & ITEM_ATTR_STAFF) && !CanUnitUseStaff(unit, item))
        return FALSE;

    switch (GetItemIid(item))
    {

    case IID_HEAL_STAFF:
    case IID_MEND_STAFF:
    case IID_RECOVER_STAFF:
        return HasSelectTarget(unit, MakeTargetListForAdjacentHeal);

    case IID_PHYSIC_STAFF:
        return HasSelectTarget(unit, MakeTargetListForRangedHeal);

    case IID_FORTIFY_STAFF:
        return HasSelectTarget(unit, MakeTargetListForRangedHeal);

    case IID_RESTORE_STAFF:
        return HasSelectTarget(unit, MakeTargetListForRestore);

    case IID_RESCUE_STAFF:
        return HasSelectTarget(unit, MakeTargetListForRescueStaff);

    case IID_BARRIER_STAFF:
        return HasSelectTarget(unit, MakeTargetListForBarrier);

    case IID_SILENCE_STAFF:
        return HasSelectTarget(unit, MakeTargetListForSilence);

    case IID_SLEEP_STAFF:
        return HasSelectTarget(unit, MakeTargetListForSleep);

    case IID_BERSERK_STAFF:
        return HasSelectTarget(unit, MakeTargetListForBerserk);

    case IID_WARP_STAFF:
        return HasSelectTarget(unit, MakeTargetListForWarp);

    case IID_REPAIR_STAFF:
        return HasSelectTarget(unit, MakeTargetListForHammerne);

    case IID_UNLOCK_STAFF:
        return HasSelectTarget(unit, MakeTargetListForUnlock);

    case IID_BOOSTER_HP:
    case IID_BOOSTER_POW:
    case IID_BOOSTER_SKL:
    case IID_BOOSTER_SPD:
    case IID_BOOSTER_LCK:
    case IID_BOOSTER_DEF:
    case IID_BOOSTER_RES:
    case IID_BOOSTER_MOV:
    case IID_BOOSTER_CON:
        return CanUnitUseStatGainItem(unit, item);

    case IID_HEROCREST:
    case IID_KNIGHTCREST:
    case IID_ORIONSBOLT:
    case IID_ELYSIANWHIP:
    case IID_GUIDINGRING:
    case IID_MASTERSEAL:
    case IID_HEAVENSEAL:
    case IID_OCEANSEAL:
    case IID_LUNARBRACE:
    case IID_SOLARBRACE:
    case IID_UNK_C1:
        return CanUnitUsePromotionItem(unit, item);

    case IID_VULNERARY:
    case IID_ELIXIR:
    case IID_VULNERARY_2:
        return CanUnitUseHealItem(unit);

    case IID_PUREWATER:
        return CanUnitUsePureWaterItem(unit);

    case IID_TORCH:
        return CanUnitUseTorchItem(unit);

    case IID_ANTITOXIN:
        return CanUnitUseAntitoxinItem(unit);

    case IID_CHESTKEY:
    case IID_CHESTKEY_BUNDLE:
        return CanUnitUseChestKeyItem(unit);

    case IID_DOORKEY:
        return CanUnitUseDoorKeyItem(unit);

    case IID_LOCKPICK:
        return CanUnitUseLockpickItem(unit);

    case IID_LATONA_STAFF:
        return HasSelectTarget(unit, MakeTargetListForLatona);

    case IID_MINE:
        return HasSelectTarget(unit, MakeTargetListForMine);

    case IID_LIGHTRUNE:
        return HasSelectTarget(unit, MakeTargetListForLightRune);

    case IID_TORCH_STAFF:
        return gPlaySt.chapterVisionRange != 0;

    case IID_FILLAS_MIGHT:
    case IID_NINISS_GRACE:
    case IID_THORS_IRE:
    case IID_SETS_LITANY:
        return HasSelectTarget(unit, MakeTargetListForDanceRing);

    case IID_METISSTOME:
        if (unit->flags & UNIT_FLAG_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    case IID_JUNAFRUIT:
        return CanUnitUseJunaFruitItem(unit);

    default:
        return FALSE;

    }
}

int GetUnitItemCantUseMsg(Unit_t* unit, int item)
{
    switch (GetItemIid(item))
    {

    case IID_TORCH_STAFF:
    case IID_BOOSTER_HP:
    case IID_BOOSTER_POW:
    case IID_BOOSTER_SKL:
    case IID_BOOSTER_SPD:
    case IID_BOOSTER_LCK:
    case IID_BOOSTER_DEF:
    case IID_BOOSTER_RES:
    case IID_BOOSTER_MOV:
    case IID_BOOSTER_CON:
    case IID_VULNERARY:
    case IID_ELIXIR:
    case IID_PUREWATER:
    case IID_ANTITOXIN:
    case IID_TORCH:
    case IID_VULNERARY_2:
        return 0x859; // TODO: msgid "There's no need for that."

    case IID_CHESTKEY:
    case IID_CHESTKEY_BUNDLE:
        return 0x85E; // TODO: msgid "There's no chest."

    case IID_DOORKEY:
        return 0x85D; // TODO: msgid "There's no door."

    case IID_LOCKPICK:
        if (UNIT_ATTRIBUTES(gActiveUnit) & UNIT_ATTR_THIEF)
            return 0x861; // TODO: msgid "No doors or chests."

        return 0x85F; // TODO: msgid "For thieves only."

    case IID_HEROCREST:
    case IID_KNIGHTCREST:
    case IID_ORIONSBOLT:
    case IID_ELYSIANWHIP:
    case IID_GUIDINGRING:
    case IID_MASTERSEAL:
    case IID_HEAVENSEAL:
    case IID_OCEANSEAL:
    case IID_LUNARBRACE:
    case IID_SOLARBRACE:
    case IID_UNK_C1:
    {
        int level = gActiveUnit->level;
        i8 boolval;

        gActiveUnit->level = 10;
        boolval = CanUnitUsePromotionItem(gActiveUnit, item);
        gActiveUnit->level = level;

        if (boolval)
            return 0x85B; // TODO: msgid "Must be above level 10."

        return 0x85A; // TODO: msgid "This can't be used."
    }

    case IID_JUNAFRUIT:
        return 0x85C; // TODO: msgid "Must be above level 10."

    default:
        return 0x85A; // TODO: msgid "This can't be used."

    }
}

void DoUseUnitItem(Unit_t* unit, int item)
{
    ClearBg0Bg1();
    EndFaceById(0);

    switch (GetItemIid(item))
    {

    case IID_HEAL_STAFF:
    case IID_MEND_STAFF:
    case IID_RECOVER_STAFF:
        DoUseHealStaff(unit, MakeTargetListForAdjacentHeal);
        break;

    case IID_PHYSIC_STAFF:
        DoUseHealStaff(unit, MakeTargetListForRangedHeal);
        break;

    case IID_RESCUE_STAFF:
        DoUseRescueStaff(unit, MakeTargetListForRescueStaff);
        break;

    case IID_RESTORE_STAFF:
        DoUseRestoreStaff(unit, MakeTargetListForRestore);
        break;

    case IID_SILENCE_STAFF:
        DoUseAttackStaff(unit, MakeTargetListForSilence);
        break;

    case IID_SLEEP_STAFF:
        DoUseAttackStaff(unit, MakeTargetListForSleep);
        break;

    case IID_BERSERK_STAFF:
        DoUseAttackStaff(unit, MakeTargetListForBerserk);
        break;

    case IID_BARRIER_STAFF:
        DoUseBarrierStaff(unit);
        break;

    case IID_UNLOCK_STAFF:
        DoUsePutTrap(unit, MakeTargetListForUnlock, 0x87A); // TODO: msgid "Select a door to open."
        break;

    case IID_WARP_STAFF:
        DoUseWarpStaff(unit);
        break;

    case IID_REPAIR_STAFF:
        DoUseRepairStaff(unit);
        break;

    case IID_FORTIFY_STAFF:
    case IID_LATONA_STAFF:
        SetStaffUseAction(unit);
        break;

    case IID_MINE:
        DoUsePutTrap(unit, MakeTargetListForMine, 0x87D); // TODO: msgid "Select an area to trap."
        break;

    case IID_LIGHTRUNE:
        DoUsePutTrap(unit, MakeTargetListForLightRune, 0x87E); // TODO: msgid "Select an area to trap."
        break;

    case IID_TORCH_STAFF:
        DoUseTorchStaff(unit);
        break;

    case IID_FILLAS_MIGHT:
    case IID_NINISS_GRACE:
    case IID_THORS_IRE:
    case IID_SETS_LITANY:
        DoUseSpecialDance(unit, MakeTargetListForDanceRing, 0x87F); // TODO: msgid "Select a character to bless."
        break;

    default:
        SetItemUseAction(unit);
        break;

    }
}

bool HasSelectTarget(Unit_t* unit, void(*list_targets)(Unit_t* unit))
{
    list_targets(unit);

    return GetTargetListSize() != 0;
}

bool CanUnitUseHealItem(Unit_t* unit)
{
    if (GetUnitCurrentHp(unit) == GetUnitMaxHp(unit))
        return FALSE;

    return TRUE;
}

bool CanUnitUseBindingBladeToHeal(Unit_t* unit)
{
    return FALSE;
}

bool CanUnitUsePureWaterItem(Unit_t* unit)
{
    if (unit->barrierDuration == 7)
        return FALSE;

    return TRUE;
}

bool CanUnitUseTorchItem(Unit_t* unit)
{
    if (gPlaySt.chapterVisionRange != 0 && unit->torchDuration != 4)
        return TRUE;

    return FALSE;
}

bool CanUnitUseAntitoxinItem(Unit_t* unit)
{
    if (unit->statusId != UNIT_STATUS_POISON)
        return FALSE;

    return TRUE;
}

bool CanUnitUseChestKeyItem(Unit_t* unit)
{
    if (gMapTerrain[unit->y][unit->x] != TERRAIN_CHEST_21)
        return FALSE;

    if (!IsThereClosedChestAt(unit->x, unit->y))
        return FALSE;

    return TRUE;
}

bool CanUnitUseDoorKeyItem(Unit_t* unit)
{
    MakeTargetListForDoorAndBridges(unit, TERRAIN_DOOR);
    return GetTargetListSize();
}

bool CanUnitUseBridgeKeyItem(Unit_t* unit)
{
    MakeTargetListForDoorAndBridges(unit, TERRAIN_BRIDGE_14);
    return GetTargetListSize();
}

bool CanUnitUseLockpickItem(Unit_t* unit)
{
    if (!(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_THIEF))
        return FALSE;

    if (!CanUnitUseChestKeyItem(unit) && !CanUnitUseDoorKeyItem(unit) && !CanUnitUseBridgeKeyItem(unit))
        return FALSE;

    return TRUE;
}

bool CanUnitUsePromotionItem(Unit_t* unit, int item)
{
    #define CHECK_LIST(it)          \
    while (*it)                     \
    {                               \
        if (unit->jinfo->id == *it) \
            return TRUE;            \
        it++;                       \
    }

    u8 const* jlist = NULL;

    if (unit->pinfo->id == PID_EIRIKA || unit->pinfo->id == PID_EPHRAIM)
    {
        switch (GetItemIid(item))
        {

        case IID_LUNARBRACE:
            jlist = JList_LunarBracePromotion;
            break;

        case IID_SOLARBRACE:
            jlist = JList_SolarBracePromotion;
            break;

        }

        if (jlist)
            CHECK_LIST(jlist);
    }

    if (unit->level < 10)
        return FALSE;

    switch (GetItemIid(item))
    {

    case IID_HEROCREST:
        jlist = JList_HeroCrestPromotion;
        break;

    case IID_KNIGHTCREST:
        jlist = JList_KnightCrestPromotion;
        break;

    case IID_ORIONSBOLT:
        jlist = JList_OrionsBoltPromotion;
        break;

    case IID_ELYSIANWHIP:
        jlist = JList_ElysianWhipPromotion;
        break;

    case IID_GUIDINGRING:
        jlist = JList_GuidingRingPromotion;
        break;

    case IID_MASTERSEAL:
        jlist = JList_MasterSealPromotion;
        break;

    case IID_LUNARBRACE:
        jlist = JList_LunarBracePromotion;
        break;

    case IID_SOLARBRACE:
        jlist = JList_SolarBracePromotion;
        break;

    case IID_HEAVENSEAL:
        jlist = JList_HeavenSealPromotion;
        break;

    case IID_UNK_C1:
        jlist = JList_UnkC1Promotion;
        break;

    case IID_OCEANSEAL:
        jlist = JList_OceanSealPromotion;
        break;

    }

    CHECK_LIST(jlist);

    return FALSE;

    #undef CHECK_LIST
}

bool CanUnitUseStatGainItem(Unit_t* unit, int item)
{
    i8 result;

    ItemBonuses_t const* bonuses = GetItemBonuses(item);

    ClearUnit(&gStatGainSimUnit);

    gStatGainSimUnit.pinfo = unit->pinfo;
    gStatGainSimUnit.jinfo = unit->jinfo;

    gStatGainSimUnit.maxHP = unit->maxHP + bonuses->hp_bonus;
    gStatGainSimUnit.pow = unit->pow + bonuses->pow_bonus;
    gStatGainSimUnit.skl = unit->skl + bonuses->skl_bonus;
    gStatGainSimUnit.spd = unit->spd + bonuses->spd_bonus;
    gStatGainSimUnit.def = unit->def + bonuses->def_bonus;
    gStatGainSimUnit.res = unit->res + bonuses->res_bonus;
    gStatGainSimUnit.lck = unit->lck + bonuses->lck_bonus;
    gStatGainSimUnit.mov_bonus = unit->mov_bonus + bonuses->mov_bonus;
    gStatGainSimUnit.con_bonus = unit->con_bonus + bonuses->con_bonus;

    UnitCheckStatOverflow(&gStatGainSimUnit);

    result = gStatGainSimUnit.maxHP != unit->maxHP;

    if (gStatGainSimUnit.pow != unit->pow)
        result = TRUE;

    if (gStatGainSimUnit.skl != unit->skl)
        result = TRUE;

    if (gStatGainSimUnit.spd != unit->spd)
        result = TRUE;

    if (gStatGainSimUnit.def != unit->def)
        result = TRUE;

    if (gStatGainSimUnit.res != unit->res)
        result = TRUE;

    if (gStatGainSimUnit.lck != unit->lck)
        result = TRUE;

    if (gStatGainSimUnit.mov_bonus != unit->mov_bonus)
        result = TRUE;

    if (gStatGainSimUnit.con_bonus != unit->con_bonus)
        result = TRUE;

    return result;
}

bool CanUnitUseJunaFruitItem(Unit_t* unit)
{
    return (unit->level >= 10)
        ? TRUE
        : FALSE;
}

void SetStaffUseAction(Unit_t* unit)
{
    HideMoveRangeGraphics();

    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    gAction.unitActionType = UNIT_ACTION_STAFF;
}

void SetItemUseAction(Unit_t* unit)
{
    gAction.unitActionType = UNIT_ACTION_USE_ITEM;
}

int StaffSelectOnSelect(ProcPtr proc, SelectTarget_t* target)
{
    gAction.targetIndex = target->uid;
    SetStaffUseAction(NULL);

    return 0x17; // TODO: Select Return Constants
}

void DoUseRescueStaff(Unit_t* unit, void(*list_targets)(Unit_t* unit))
{
    list_targets(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelectionExt(&SelectInfo_Staff, StaffSelectOnSelect),
        GetMsg(0x876)); // TODO: msgid "Select which character to bring next to you."
}

void DoUseSpecialDance(Unit_t* unit, void(*list_targets)(Unit_t* unit), int help_msg)
{
    list_targets(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelectionExt(&SelectInfo_Staff, StaffSelectOnSelect),
        GetMsg(help_msg));
}

void WarpSelect_OnInit(struct WarpSelectProc* proc)
{
    SpriteAnim_t* sprite_anim;

    StartBottomHelpText(proc, GetMsg(0x871)); // TODO: msgid "Select warp point."

    EnsureCameraOntoPosition(proc,
        GetUnit(gAction.targetIndex)->x,
        GetUnit(gAction.targetIndex)->y);

    HideMoveRangeGraphics();

    FillWarpRangeMap(gActiveUnit, GetUnit(gAction.targetIndex));

    gBmSt.gameStateBits &= ~GMAP_STATE_BIT1;

    DisplayMoveRangeGraphics(1);

    SetCursorMapPosition(
        GetUnit(gAction.targetIndex)->x,
        GetUnit(gAction.targetIndex)->y);

    sprite_anim = StartSpriteAnim(SpriteAnim_Unknown_085A0EA0, 0);

    sprite_anim->oam2 = OAM2_CHR(0) + OAM2_PAL(0);
    SetSpriteAnimId(sprite_anim, 0);

    proc->sprite_anim = sprite_anim;
    proc->prev_warp_allowed = 2; // neither TRUE nor FALSE
}

void WarpSelect_OnIdle(struct WarpSelectProc* proc)
{
    // TODO: gMapMovementSigned
    bool warp_allowed = ((i8**) gMapMovement)[gBmSt.playerCursor.y][gBmSt.playerCursor.x] != -1;

    HandlePlayerCursorMovement();

    if (gKeySt->pressed & A_BUTTON)
    {
        if (warp_allowed)
        {
            Proc_Break(proc);

            gAction.xOther = gBmSt.playerCursor.x;
            gAction.yOther = gBmSt.playerCursor.y;

            SetStaffUseAction(gActiveUnit);

            TmFill(gBg2Tm, 0);
            EnableBgSync(BG2_SYNC_BIT);

            PlaySe(0x6A); // TODO: song ids

            return;
        }
        else
        {
            PlaySe(0x6C); // TODO: song ids
        }
    }

    if (gKeySt->pressed & B_BUTTON)
    {
        Proc_Goto(proc, 99);

        TmFill(gBg2Tm, 0);
        EnableBgSync(BG2_SYNC_BIT);

        PlaySe(0x6B); // TODO: song ids
    }

    if (warp_allowed != proc->prev_warp_allowed)
    {
        SetSpriteAnimId(proc->sprite_anim, warp_allowed ? 0 : 1);
    }

    DisplaySpriteAnim(proc->sprite_anim,
        gBmSt.playerCursorDisplay.x - gBmSt.camera.x,
        gBmSt.playerCursorDisplay.y - gBmSt.camera.y);

    proc->prev_warp_allowed = warp_allowed;
}

void WarpSelect_OnConfirm(struct WarpSelectProc* proc)
{
    ResetTextFont();
    HideMoveRangeGraphics();
    EndBottomHelpText();

    SetCursorMapPosition(
        gActiveUnit->x,
        gActiveUnit->y);

    EnsureCameraOntoPosition(proc,
        gActiveUnit->x,
        gActiveUnit->y);
}

void WarpSelect_OnCancel(struct WarpSelectProc* proc)
{
    ResetTextFont();
    HideMoveRangeGraphics();
    EndBottomHelpText();

    SetCursorMapPosition(
        gActiveUnit->x,
        gActiveUnit->y);

    SpawnProc(ProcScr_0859B600, PROC_TREE_3);
}

void WarpSelect_OnEnd(struct WarpSelectProc* proc)
{
    HideMoveRangeGraphics();
    EndSpriteAnim(proc->sprite_anim);
}

static int WarpSelectOnSelect(ProcPtr proc, SelectTarget_t* target)
{
    EndTargetSelection(proc);

    gAction.targetIndex = target->uid;

    SpawnProc(ProcScr_WarpSelect, PROC_TREE_3);

    return 4; // TODO: Map Select Return Constants
}

void DoUseWarpStaff(Unit_t* unit)
{
    MakeTargetListForWarp(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelectionExt(&SelectInfo_Staff, WarpSelectOnSelect),
        GetMsg(0x875)); // TODO: msgid "Select character to warp."

    PlaySe(0x6A); // TODO: song ids
}

static int OnSelectPutTrap(ProcPtr proc, SelectTarget_t* target)
{
    gAction.xOther = target->x;
    gAction.yOther = target->y;

    SetStaffUseAction(NULL);

    return 0x17; // TODO: Map Select Return Constants
}

void DoUsePutTrap(Unit_t* unit, void(*list_targets)(Unit_t* unit), int help_msg)
{
    list_targets(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelectionExt(&SelectInfo_PutTrap, OnSelectPutTrap),
        GetMsg(help_msg));

    PlaySe(0x6A); // TODO: song ids
}

int RepairSelectOnSelect(ProcPtr proc, SelectTarget_t* target)
{
    ResetTextFont();

    gAction.targetIndex = target->uid;

    ForceMenuItemPanel(
        StartMenu(&MenuInfo_RepairItems),
        GetUnit(gAction.targetIndex),
        16, 11);

    // TODO: UNIT_HAS_PORTRAIT macro?
    if (GetFaceInfo(GetUnitFid(GetUnit(gAction.targetIndex)))->img != NULL)
    {
        StartFace(0, GetUnitFid(GetUnit(gAction.targetIndex)), 184, 12, 2);
        SetFaceBlinkControlById(0, 5);
    }

    return 0x17; // TODO: Map Select Return Constants
}

void DoUseRepairStaff(Unit_t* unit)
{
    MakeTargetListForHammerne(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelection(&SelectInfo_Repair),
        GetMsg(0x878)); // TODO: msgid "Select the character whose weapon needs repair."

    PlaySe(0x6A); // TODO: song ids
}

int RepairSelectOnChange(ProcPtr proc, SelectTarget_t* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    DrawHammerneUnitInfoWindow(GetUnit(target->uid));
}

void RepairSelectOnInit(ProcPtr proc)
{
    NewUnitInfoWindow_WithAllLines(proc);
}

int RepairMenuItemOnChange(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    UpdateMenuItemPanel(menu_item->itemNumber);
}

int nullsub_24(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
}

u8 RepairMenuItemIsAvailable(const struct MenuItemDef* def, int id)
{
    int item = GetUnit(gAction.targetIndex)->items[id];

    if (!item)
        return MENU_NOTSHOWN;

    if (!IsItemRepairable(item))
        return MENU_DISABLED;

    return MENU_ENABLED;
}

int RepairMenuItemDraw(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    int item = GetUnit(gAction.targetIndex)->items[menu_item->itemNumber];
    int isRepairable = IsItemRepairable(item);

    PutItemMenuLineLong(
        &menu_item->text, item, isRepairable,
        gBg0Tm + TM_OFFSET(menu_item->xTile, menu_item->yTile));

    EnableBgSync(BG0_SYNC_BIT);

    return 0;
}

u8 RepairMenuItemSelect(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    if (menu_item->availability == MENU_DISABLED)
    {
        int msgId = 0;

        int item = GetUnit(gAction.targetIndex)->items[menu_item->itemNumber];

        if (GetItemAttributes(item) & (ITEM_ATTR_UNBREAKABLE | ITEM_ATTR_UNREPAIRABLE | ITEM_ATTR_LOCK_MONSTER))
            msgId = 0x863; // TODO: msgid "Item cannot be repaired."
        else if (!(GetItemAttributes(item) & (ITEM_ATTR_STAFF | ITEM_ATTR_WEAPON)))
            msgId = 0x857; // TODO: msgid "Only weapons, tomes, and[N]staves can be repaired."
        else if (GetItemUses(item) == GetItemMaxUses(item))
            msgId = 0x856; // TODO: msgid "There's nothing to repair."

        if (msgId != 0)
            MenuCallHelpBox(menu, msgId);

        return MENU_ACT_SND6B;
    }

    gAction.trapType = menu_item->itemNumber;
    SetStaffUseAction(gActiveUnit);

    return MENU_ACT_SKIPCURSOR + MENU_ACT_END + MENU_ACT_SND6A + MENU_ACT_CLEAR + MENU_ACT_ENDFACE;
}

void DoUseHealStaff(Unit_t* unit, void(*list_targets)(Unit_t* unit))
{
    list_targets(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelection(&SelectInfo_Heal),
        GetMsg(0x874)); // TODO: msgid "Select a character to restore HP to."
}

void DoUseRestoreStaff(Unit_t* unit, void(*list_targets)(Unit_t* unit))
{
    list_targets(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelection(&SelectInfo_Restore),
        GetMsg(0x877)); // TODO: msgid "Select a character to restore to normal."
}

int RestoreSelectOnInit(ProcPtr proc)
{
    func_08034FFC(proc);
}

int RestoreSelectOnChange(ProcPtr proc, SelectTarget_t* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    func_0803501C(GetUnit(target->uid));
}

void DoUseBarrierStaff(Unit_t* unit)
{
    MakeTargetListForBarrier(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelection(&SelectInfo_Barrier),
        GetMsg(0x879)); // TODO: msgid "Select a character to restore to normal."
}

int BarrierSelectOnInit(ProcPtr proc)
{
    func_08035090(proc);
}

int BarrierSelectOnChange(ProcPtr proc, SelectTarget_t* target)
{
    ChangeActiveUnitFacing(target->x, target->y);
    func_080350A4(GetUnit(target->uid));
}

void DoUseAttackStaff(Unit_t* unit, void(*list_targets)(Unit_t* unit))
{
    list_targets(unit);

    MapFill(gMapMovement, -1);

    StartBottomHelpText(
        StartTargetSelection(&SelectInfo_AttackStaff),
        GetMsg(0x87B)); // TODO: msgid "Select a unit to use the staff on."
}

int AttackStaffSelectOnInit(ProcPtr proc)
{
    func_080350FC(proc);
}

int AttackStaffSelectOnChange(ProcPtr proc, SelectTarget_t* target)
{
    ChangeActiveUnitFacing(target->x, target->y);

    func_0803511C(
        GetUnit(target->uid),
        GetOffensiveStaffAccuracy(gActiveUnit, GetUnit(target->uid)));
}

void GenericSelection_DeleteBBAndBG(ProcPtr proc)
{
    EndBottomHelpText();
    ClearBg0Bg1();
}

int func_08029D38(Unit_t* unit)
{
    if ((UNIT_ATTRIBUTES(unit) & UNIT_ATTR_ASSASSIN) && GetTrapAt(unit->x, unit->y) == NULL)
        return TRUE;

    return FALSE;
}

void func_08029D6C(void)
{
    StartBottomHelpText(
        StartTargetSelectionExt(&SelectInfo_Staff, StaffSelectOnSelect),
        GetMsg(0x876)); // TODO: msgid "Select which character to bring next to you."
}

void TorchSelect_OnInit(struct WarpSelectProc* proc)
{
    gBmSt.gameStateBits |= GMAP_STATE_BIT0;

    StartBottomHelpText(proc,
        GetMsg(0x87C)); // TODO: msgid "Select an area to light up."

    if (ShouldMoveCameraPosSomething(gActiveUnit->x, gActiveUnit->y))
        EnsureCameraOntoPosition(proc, gActiveUnit->x, gActiveUnit->y);
}

void TorchSelect_OnIdle(struct WarpSelectProc* proc)
{
    int xTorch = gBmSt.playerCursor.x;
    int yTorch = gBmSt.playerCursor.y;

    i8 canTorch = ((i8**) gMapRange)[yTorch][xTorch];

    HandlePlayerCursorMovement();

    if (gKeySt->pressed & A_BUTTON)
    {
        if (canTorch)
        {
            PlaySe(0x6A); // TODO: song ids

            Proc_Break(proc);

            gAction.xOther = gBmSt.playerCursor.x;
            gAction.yOther = gBmSt.playerCursor.y;

            SetStaffUseAction(gActiveUnit);

            return;
        }
        else
        {
            PlaySe(0x6C); // TODO: song ids
        }
    }

    if (gKeySt->pressed & B_BUTTON)
    {
        TmFill(gBg2Tm, 0);
        EnableBgSync(BG2_SYNC_BIT);

        Proc_Goto(proc, 99);

        PlaySe(0x6B); // TODO: song ids
    }

    DisplayCursor(
        gBmSt.playerCursorDisplay.x,
        gBmSt.playerCursorDisplay.y,
        TRUE);
}

void DoUseTorchStaff(Unit_t* unit)
{
    SpawnProc(ProcScr_TorchSelect, PROC_TREE_3);
    PlaySe(0x6A); // TODO: song ids
}

bool CanUnitUseItemPrepScreen(Unit_t* unit, int item)
{
    if (GetItemAttributes(item) & ITEM_ATTR_STAFF)
        return FALSE;

    switch (GetItemIid(item))
    {

    case IID_BOOSTER_HP:
    case IID_BOOSTER_POW:
    case IID_BOOSTER_SKL:
    case IID_BOOSTER_SPD:
    case IID_BOOSTER_LCK:
    case IID_BOOSTER_DEF:
    case IID_BOOSTER_RES:
    case IID_BOOSTER_MOV:
    case IID_BOOSTER_CON:
        return CanUnitUseStatGainItem(unit, item);

    case IID_HEROCREST:
    case IID_KNIGHTCREST:
    case IID_ORIONSBOLT:
    case IID_ELYSIANWHIP:
    case IID_GUIDINGRING:
    case IID_MASTERSEAL:
    case IID_HEAVENSEAL:
    case IID_OCEANSEAL:
    case IID_LUNARBRACE:
    case IID_SOLARBRACE:
    case IID_UNK_C1:
        return CanUnitUsePromotionItem(unit, item);

    case IID_METISSTOME:
        if (unit->flags & UNIT_FLAG_GROWTH_BOOST)
            return FALSE;

        return TRUE;

    case IID_JUNAFRUIT:
        return CanUnitUseJunaFruitItem(unit);

    default:
        return FALSE;

    }
}

bool DoesUnitHoldItemCC(Unit_t* unit)
{
    int i, count = GetUnitItemCount(unit);

    for (i = 0; i < count; ++i)
    {
        if (GetItemIid(unit->items[i]) == IID_UNK_CC)
            return TRUE;
    }

    return FALSE;
}
