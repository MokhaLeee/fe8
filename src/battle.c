#include "battle.h"

// TODO [2021-10-02]: clean up and update to stan standards

#include "constants/iids.h"
#include "constants/jids.h"
#include "constants/pids.h"
#include "constants/terrains.h"

#include "random.h"
#include "item.h"
#include "unit.h"
#include "map.h"
#include "support.h"
#include "chapterdata.h"
#include "trap.h"
#include "m4a.h"
#include "sound.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"

struct WeaponTriangleRule {
    i8 attackerWeaponType;
    i8 defenderWeaponType;
    i8 hitBonus;
    i8 atkBonus;
};

static CONST_DATA struct WeaponTriangleRule sWeaponTriangleRules[] = {
    { ITEM_KIND_SWORD, ITEM_KIND_LANCE, -15, -1 },
    { ITEM_KIND_SWORD, ITEM_KIND_AXE,   +15, +1 },

    { ITEM_KIND_LANCE, ITEM_KIND_AXE,   -15, -1 },
    { ITEM_KIND_LANCE, ITEM_KIND_SWORD, +15, +1 },

    { ITEM_KIND_AXE,   ITEM_KIND_SWORD, -15, -1 },
    { ITEM_KIND_AXE,   ITEM_KIND_LANCE, +15, +1 },

    { ITEM_KIND_ANIMA, ITEM_KIND_DARK,  -15, -1 },
    { ITEM_KIND_ANIMA, ITEM_KIND_LIGHT, +15, +1 },

    { ITEM_KIND_LIGHT, ITEM_KIND_ANIMA, -15, -1 },
    { ITEM_KIND_LIGHT, ITEM_KIND_DARK,  +15, +1 },

    { ITEM_KIND_DARK,  ITEM_KIND_LIGHT, -15, -1 },
    { ITEM_KIND_DARK,  ITEM_KIND_ANIMA, +15, +1 },

    { -1 },
};

static void UpdateActorFromBattle(void);

static CONST_DATA struct ProcScr sProcScr_BattleAnimSimpleLock[] = {
    PROC_SLEEP(1),
    PROC_CALL(UpdateActorFromBattle),
    PROC_END
};

EWRAM_DATA BattleStats_t gBattleStats = {};

EWRAM_DATA BattleUnit_t gBattleUnitA = {};
EWRAM_DATA BattleUnit_t gBattleUnitB = {};

EWRAM_DATA BattleHit_t gBattleHitArray[BATTLE_HIT_MAX] = {};
EWRAM_DATA BattleHit_t* gBattleHitIterator = 0;

static EWRAM_DATA struct {
    u8 unk00;
    u8 unk01;
    u8 unk02;
} sUnknown_0203A60C = {};

static void BattleGenerateSimulationInternal(Unit_t* actor, Unit_t* target, int x, int y, int actorWpnSlot);
static void BattleGenerateRealInternal(Unit_t* actor, Unit_t* target);

static i8 BattleRandRoll(u16 threshold, i8 simResult);
static i8 BattleRandRoll2Rn(u16 threshold, i8 simResult);

static void ComputeBattleUnitStats(BattleUnit_t* attacker, BattleUnit_t* defender);
static void ComputeBattleUnitEffectiveStats(BattleUnit_t* attacker, BattleUnit_t* defender);
static void ComputeBattleUnitSupportBonuses(BattleUnit_t* attacker, BattleUnit_t* defender);
static void ComputeBattleUnitDefense(BattleUnit_t* attacker, BattleUnit_t* defender);
static void ComputeBattleUnitBaseDefense(BattleUnit_t* bu);
static void ComputeBattleUnitAttack(BattleUnit_t* attacker, BattleUnit_t* defender);
static void ComputeBattleUnitSpeed(BattleUnit_t* bu);
static void ComputeBattleUnitHitRate(BattleUnit_t* bu);
static void ComputeBattleUnitAvoidRate(BattleUnit_t* bu);
static void ComputeBattleUnitCritRate(BattleUnit_t* bu);
static void ComputeBattleUnitDodgeRate(BattleUnit_t* bu);
static void ComputeBattleUnitEffectiveHitRate(BattleUnit_t* attacker, BattleUnit_t* defender);
static void ComputeBattleUnitEffectiveCritRate(BattleUnit_t* attacker, BattleUnit_t* defender);
static void ComputeBattleUnitSilencerRate(BattleUnit_t* attacker, BattleUnit_t* defender);
static void ComputeBattleUnitWeaponRankBonuses(BattleUnit_t* bu);
static void ComputeBattleUnitStatusBonuses(BattleUnit_t* bu);
static void ComputeBattleUnitSpecialWeaponStats(BattleUnit_t* attacker, BattleUnit_t* defender);

static i8 BattleGenerateRoundHits(BattleUnit_t* attacker, BattleUnit_t* defender);
static int GetBattleUnitHitCount(BattleUnit_t* attacker);
static int BattleCheckBraveEffect(BattleUnit_t* bu);

static i8 BattleCheckTriangleAttack(BattleUnit_t* attacker, BattleUnit_t* defender);
static void BattleUpdateBattleStats(BattleUnit_t* attacker, BattleUnit_t* defender);
static void BattleCheckSureShot(BattleUnit_t* attacker);
static void BattleCheckPierce(BattleUnit_t* attacker, BattleUnit_t* defender);
static void BattleCheckGreatShield(BattleUnit_t* attacker, BattleUnit_t* defender);
static i8 BattleCheckSilencer(BattleUnit_t* attacker, BattleUnit_t* defender);
static void BattleCheckPetrify(BattleUnit_t* attacker, BattleUnit_t* defender);
static void BattleGenerateHitAttributes(BattleUnit_t* attacker, BattleUnit_t* defender);
static void BattleGenerateHitTriangleAttack(BattleUnit_t* attacker, BattleUnit_t* defender);
static void BattleGenerateHitEffects(BattleUnit_t* attacker, BattleUnit_t* defender);
static i8 BattleGenerateHit(BattleUnit_t* attacker, BattleUnit_t* defender);

static int GetStatIncrease(int growth);

static int GetBattleUnitUpdatedWeaponExp(BattleUnit_t* bu);

static int GetUnitExpLevel(Unit_t* unit);
static int GetUnitRoundExp(Unit_t* actor, Unit_t* target);
static int GetUnitPowerLevel(Unit_t* unit);
static int GetUnitClassKillExpBonus(Unit_t* actor, Unit_t* target);
static int GetUnitExpMultiplier(Unit_t* actor, Unit_t* target);
static int GetUnitKillExpBonus(Unit_t* actor, Unit_t* target);
static void ModifyUnitSpecialExp(Unit_t* actor, Unit_t* target, int* exp);
static int GetBattleUnitExpGain(BattleUnit_t* actor, BattleUnit_t* target);
static void BattleApplyItemExpGains(void);
static int GetBattleUnitStaffExp(BattleUnit_t* bu);
static void BattleApplyMiscActionExpGains(void);

static void BattleApplyReaverEffect(BattleUnit_t* attacker, BattleUnit_t* defender);

static void ComputeBattleObstacleStats(void);

static void BattlePrintDebugUnitInfo(BattleUnit_t* actor, BattleUnit_t* target);
static void BattlePrintDebugHitInfo(void);

static void BattleGenerateHitScriptedDamage(BattleUnit_t* bu);
static void BattleUnwindScripted(void);

void BattleGenerateSimulationInternal(Unit_t* actor, Unit_t* target, int x, int y, int actorWpnSlot) {
    InitBattleUnit(&gBattleUnitA, actor);
    InitBattleUnit(&gBattleUnitB, target);

    gBattleUnitA.unit.x = x;
    gBattleUnitA.unit.y = y;

    gBattleStats.range = RECT_DISTANCE(
        gBattleUnitA.unit.x, gBattleUnitA.unit.y,
        gBattleUnitB.unit.x, gBattleUnitB.unit.y
    );

    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA)
        SetBattleUnitWeaponBallista(&gBattleUnitA);
    else
        SetBattleUnitWeapon(&gBattleUnitA, actorWpnSlot);

    SetBattleUnitWeapon(&gBattleUnitB, BATTLE_UNIT_WEAPON_SLOT_AUTO);

    BattleInitTargetCanCounter();
    BattleApplyWeaponTriangleEffect(&gBattleUnitA, &gBattleUnitB);

    RevertEnabledLightRunes();

    SetBattleUnitTerrainBonusesAuto(&gBattleUnitA);
    SetBattleUnitTerrainBonusesAuto(&gBattleUnitB);

    BattleGenerate(actor, target);

    RestoreEnabledLightRunes();
}

void BattleGenerateRealInternal(Unit_t* actor, Unit_t* target) {
    InitBattleUnit(&gBattleUnitA, actor);
    InitBattleUnit(&gBattleUnitB, target);

    gBattleStats.range = RECT_DISTANCE(
        gBattleUnitA.unit.x, gBattleUnitA.unit.y,
        gBattleUnitB.unit.x, gBattleUnitB.unit.y
    );

    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA)
        SetBattleUnitWeaponBallista(&gBattleUnitA);
    else
        SetBattleUnitWeapon(&gBattleUnitA, BATTLE_UNIT_WEAPON_SLOT_AUTO);

    SetBattleUnitWeapon(&gBattleUnitB, BATTLE_UNIT_WEAPON_SLOT_AUTO);

    BattleInitTargetCanCounter();
    BattleApplyWeaponTriangleEffect(&gBattleUnitA, &gBattleUnitB);

    RevertEnabledLightRunes();

    SetBattleUnitTerrainBonusesAuto(&gBattleUnitA);
    SetBattleUnitTerrainBonusesAuto(&gBattleUnitB);

    BattleGenerate(actor, target);

    RestoreEnabledLightRunes();

    BattleUnitTargetCheckCanCounter(&gBattleUnitB);
    BattleUnitTargetSetEquippedWeapon(&gBattleUnitB);

    if (gBattleUnitB.unit.id != 0)
    {
        BattleApplyExpGains();
        func_080A4AA4();

        BWL_AddBattle(actor);
        BWL_AddBattle(target);
    }
}

void BattleApplyGameStateUpdates(void) {
    BattleApplyUnitUpdates();
    BattleApplyBallistaUpdates();

    BattlePrintDebugUnitInfo(&gBattleUnitA, &gBattleUnitB);
    BattlePrintDebugHitInfo();
}

void BattleGenerateSimulation(Unit_t* actor, Unit_t* target, int x, int y, int actorWpnSlot) {
    if (x < 0 && y < 0) {
        x = actor->x;
        y = actor->y;
    }

    gBattleStats.config = BATTLE_CONFIG_SIMULATE;
    BattleGenerateSimulationInternal(actor, target, x, y, actorWpnSlot);
}

void BattleGenerateReal(Unit_t* actor, Unit_t* target) {
    gBattleStats.config = BATTLE_CONFIG_REAL;
    BattleGenerateRealInternal(actor, target);
}

void BattleGenerateBallistaSimulation(Unit_t* actor, Unit_t* target, int x, int y) {
    gBattleStats.config = BATTLE_CONFIG_SIMULATE | BATTLE_CONFIG_BALLISTA;
    BattleGenerateSimulationInternal(actor, target, x, y, 0);
}

void BattleGenerateBallistaReal(Unit_t* actor, Unit_t* target) {
    gBattleStats.config = BATTLE_CONFIG_REAL | BATTLE_CONFIG_BALLISTA;
    BattleGenerateRealInternal(actor, target);
}

void BattleGenerate(Unit_t* actor, Unit_t* target) {
    ComputeBattleUnitStats(&gBattleUnitA, &gBattleUnitB);
    ComputeBattleUnitStats(&gBattleUnitB, &gBattleUnitA);

    ComputeBattleUnitEffectiveStats(&gBattleUnitA, &gBattleUnitB);
    ComputeBattleUnitEffectiveStats(&gBattleUnitB, &gBattleUnitA);

    if (target == NULL)
        ComputeBattleObstacleStats();

    if ((gBattleStats.config & BATTLE_CONFIG_REAL) && (gAction.scriptedBattleHits))
        BattleUnwindScripted();
    else
        BattleUnwind();
}

void BattleGenerateUiStats(Unit_t* unit, i8 itemSlot) {
    gBattleStats.config = BATTLE_CONFIG_BIT2;

    gBattleUnitB.weapon = 0;
    gBattleUnitB.weapon_attrs = 0;
    gBattleUnitB.weapon_kind = 0xFF;

    gBattleUnitB.unit.jinfo = NULL;

    gBattleUnitA.advantage_hit_bonus = 0;
    gBattleUnitA.advantage_dmg_bonus = 0;

    if ((itemSlot >= 0) && (itemSlot < UNIT_ITEM_COUNT)) {
        Unit_t tmpUnit = *unit;

        UnitEquipItemSlot(&tmpUnit, itemSlot);
        itemSlot = 0;

        InitBattleUnit(&gBattleUnitA, &tmpUnit);
    } else
        InitBattleUnit(&gBattleUnitA, unit);

    if (gGmData.state & GMAP_STATE_BIT0)
        SetBattleUnitTerrainBonuses(&gBattleUnitA, 0); // TODO: TERRAIN ID DEFINITIONS
    else
        SetBattleUnitTerrainBonusesAuto(&gBattleUnitA);

    SetBattleUnitWeapon(&gBattleUnitA, itemSlot);
    ComputeBattleUnitStats(&gBattleUnitA, &gBattleUnitB);

    if (GetItemIid(gBattleUnitA.weapon) == IID_RUNESWORD) {
        gBattleUnitA.attack -= gBattleUnitA.unit.pow / 2;

        gBattleUnitA.crit_raw = 0;
        gBattleUnitA.crit = 0;
    }

    if (!gBattleUnitA.weapon) {
        gBattleUnitA.attack = 0xFF;
        gBattleUnitA.hit_raw = 0xFF;
        gBattleUnitA.crit_raw = 0xFF;
    }

    if (GetItemWeaponEffect(gBattleUnitA.weapon) == WEAPON_EFFECT_HPHALVE)
        gBattleUnitA.attack = 0xFF;

    if (GetItemIid(gBattleUnitA.weapon) == IID_MONSTER_STONE) {
        gBattleUnitA.attack = 0xFF;
        gBattleUnitA.crit_raw = 0xFF;
    }
}

i8 BattleRandRoll(u16 threshold, i8 simResult) {
    if (gBattleStats.config & BATTLE_CONFIG_SIMULATE)
        return simResult;

    return RandRoll(threshold);
}

i8 BattleRandRoll2Rn(u16 threshold, i8 simResult) {
    if (gBattleStats.config & BATTLE_CONFIG_SIMULATE)
        return simResult;

    return RandRoll2Rn(threshold);
}

void InitBattleUnit(BattleUnit_t* bu, Unit_t* unit) {
    if (!unit)
        return;

    bu->unit = *unit;

    bu->unit.maxHP = GetUnitMaxHp(unit);
    bu->unit.pow = GetUnitPower(unit);
    bu->unit.skl = GetUnitSkill(unit);
    bu->unit.spd = GetUnitSpeed(unit);
    bu->unit.def = GetUnitDefense(unit);
    bu->unit.lck = GetUnitLuck(unit);
    bu->unit.res = GetUnitResistance(unit);
    bu->unit.con_bonus = UNIT_CON(unit);
    bu->unit.mov_bonus = UNIT_MOV(unit);

    bu->level_before = bu->unit.level;
    bu->exp_before = bu->unit.exp;

    bu->hp_before = bu->unit.curHP;
    bu->new_status = 0xFF;

    bu->stat_gain_hp = 0;
    bu->stat_gain_pow = 0;
    bu->stat_gain_skl = 0;
    bu->stat_gain_spd = 0;
    bu->stat_gain_def = 0;
    bu->stat_gain_res = 0;
    bu->stat_gain_lck = 0;
    bu->stat_gain_con = 0;

    gBattleUnitA.weapon_exp_gained = 0;
    gBattleUnitB.weapon_exp_gained = 0;

    bu->advantage_hit_bonus = 0;
    bu->advantage_dmg_bonus = 0;

    bu->took_damage = FALSE;

    gBattleUnitA.weapon_broke = FALSE;
    gBattleUnitB.weapon_broke = FALSE;

    gBattleUnitA.exp_gained = 0;
    gBattleUnitB.exp_gained = 0;
}

void InitBattleUnitWithoutBonuses(BattleUnit_t* bu, Unit_t* unit) {
    InitBattleUnit(bu, unit);

    bu->unit.maxHP = unit->maxHP;
    bu->unit.pow = unit->pow;
    bu->unit.skl = unit->skl;
    bu->unit.spd = unit->spd;
    bu->unit.def = unit->def;
    bu->unit.lck = unit->lck;
    bu->unit.res = unit->res;

    bu->unit.con_bonus = UNIT_CON_BASE(unit);
}

void SetBattleUnitTerrainBonuses(BattleUnit_t* bu, int terrain) {
    bu->terrain = terrain;

    bu->terrain_avoid      = bu->unit.jinfo->pTerrainAvoidLookup[bu->terrain];
    bu->terrain_defense    = bu->unit.jinfo->pTerrainDefenseLookup[bu->terrain];
    bu->terrain_resistance = bu->unit.jinfo->pTerrainResistanceLookup[bu->terrain];
}

void SetBattleUnitTerrainBonusesAuto(BattleUnit_t* bu) {
    bu->terrain = gMapTerrain[bu->unit.y][bu->unit.x];

    bu->terrain_avoid      = bu->unit.jinfo->pTerrainAvoidLookup[bu->terrain];
    bu->terrain_defense    = bu->unit.jinfo->pTerrainDefenseLookup[bu->terrain];
    bu->terrain_resistance = bu->unit.jinfo->pTerrainResistanceLookup[bu->terrain];
}

void SetBattleUnitWeapon(BattleUnit_t* bu, int itemSlot) {
    if (itemSlot == BATTLE_UNIT_WEAPON_SLOT_AUTO)
        itemSlot = GetUnitEquippedWeaponSlot(&bu->unit);

    if (bu->unit.flags & UNIT_FLAG_IN_BALLISTA)
        itemSlot = BATTLE_UNIT_WEAPON_SLOT_BALLISTA;

    bu->has_real_weapon = TRUE;

    switch (itemSlot) {

    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
        // regular item slots

        bu->weapon_slot = itemSlot;
        bu->weapon = bu->unit.items[bu->weapon_slot];

        break;

    case BATTLE_UNIT_WEAPON_SLOT_5:
        // borrowed item?

        bu->weapon_slot = 0xFF;
        bu->weapon = gBmSt.itemUnk2C;

        break;

    case BATTLE_UNIT_WEAPON_SLOT_ARENA_PLAYER:
        // arena player weapon

        bu->weapon_slot = 0;

        bu->weapon = gArenaSt.playerWeapon;
        bu->has_real_weapon = FALSE;

        break;

    case BATTLE_UNIT_WEAPON_SLOT_ARENA_OPPONENT:
        // arena opponent weapon

        bu->weapon_slot = 0;

        bu->weapon = gArenaSt.opponentWeapon;
        bu->has_real_weapon = FALSE;

        break;

    case BATTLE_UNIT_WEAPON_SLOT_BALLISTA:
        // riding ballista

        bu->weapon_slot = 0xFF;

        bu->weapon = GetBallistaItemAt(bu->unit.x, bu->unit.y);
        bu->has_real_weapon = FALSE;

        break;

    default:
        bu->weapon_slot = 0xFF;

        bu->weapon = 0;
        bu->has_real_weapon = FALSE;

        break;

    } // switch (itemSlot)

    bu->weapon_before = bu->weapon;
    bu->weapon_attrs = GetItemAttributes(bu->weapon);
    bu->weapon_kind = GetItemKind(bu->weapon);

    if (!(gBattleStats.config & BATTLE_CONFIG_BIT2)) {
        if (bu->weapon_attrs & ITEM_ATTR_MAGICSWORD) {
            switch (GetItemIid(bu->weapon)) {

            case IID_WIND_SWORD:
                if (gBattleStats.range == 2)
                    bu->weapon_kind = ITEM_KIND_ANIMA;
                else
                    bu->weapon_attrs = bu->weapon_attrs &~ ITEM_ATTR_MAGICSWORD;

                break;

            case IID_LIGHTBRAND:
                if (gBattleStats.range == 2)
                    bu->weapon_kind = ITEM_KIND_LIGHT;
                else
                    bu->weapon_attrs = bu->weapon_attrs &~ ITEM_ATTR_MAGICSWORD;

                break;

            case IID_RUNESWORD:
                bu->weapon_kind = ITEM_KIND_DARK;
                break;

            } // switch (GetItemIid(bu->weapon))
        } // if (bu->weapon_attrs & ITEM_ATTR_MAGICSWORD)

        if (!CanItemReachDistance(bu->weapon, gBattleStats.range) || bu->weapon_slot == 0xFF) {
            bu->weapon = 0;
            bu->has_real_weapon = FALSE;
        }

        switch (bu->unit.statusId) {

        case UNIT_STATUS_SLEEP:
        case UNIT_STATUS_PETRIFY:
        case UNIT_STATUS_PETRIFY_2:
            bu->weapon = 0;
            bu->has_real_weapon = FALSE;

            break;

        } // switch (bu->unit.statusId)
    }
}

void SetBattleUnitWeaponBallista(BattleUnit_t* bu) {
    bu->weapon = GetBallistaItemAt(bu->unit.x, bu->unit.y);

    bu->weapon_before = bu->weapon;
    bu->weapon_attrs = GetItemAttributes(bu->weapon);
    bu->weapon_kind = GetItemKind(bu->weapon);

    bu->has_real_weapon = FALSE;
}

void func_0802A958(void) {} // unused

void ComputeBattleUnitStats(BattleUnit_t* attacker, BattleUnit_t* defender) {
    ComputeBattleUnitDefense(attacker, defender);
    ComputeBattleUnitAttack(attacker, defender);
    ComputeBattleUnitSpeed(attacker);
    ComputeBattleUnitHitRate(attacker);
    ComputeBattleUnitAvoidRate(attacker);
    ComputeBattleUnitCritRate(attacker);
    ComputeBattleUnitDodgeRate(attacker);
    ComputeBattleUnitSupportBonuses(attacker, defender);
    ComputeBattleUnitWeaponRankBonuses(attacker);
    ComputeBattleUnitStatusBonuses(attacker);
}

void ComputeBattleUnitEffectiveStats(BattleUnit_t* attacker, BattleUnit_t* defender) {
    ComputeBattleUnitEffectiveHitRate(attacker, defender);
    ComputeBattleUnitEffectiveCritRate(attacker, defender);
    ComputeBattleUnitSilencerRate(attacker, defender);
    ComputeBattleUnitSpecialWeaponStats(attacker, defender);
}

void ComputeBattleUnitSupportBonuses(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (!(gBattleStats.config & BATTLE_CONFIG_ARENA) || gPlaySt.chapterWeatherId) {
        struct SupportBonuses tmpBonuses;

        GetUnitSupportBonuses(&attacker->unit, &tmpBonuses);

        attacker->attack    += tmpBonuses.bonus_attack;
        attacker->defense   += tmpBonuses.bonus_defense;
        attacker->hit_raw   += tmpBonuses.bonus_hit;
        attacker->avoid += tmpBonuses.bonus_avoid;
        attacker->crit_raw  += tmpBonuses.bonus_crit;
        attacker->dodge += tmpBonuses.bonus_dodge;
    }
}

void ComputeBattleUnitDefense(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (GetItemAttributes(defender->weapon) & ITEM_ATTR_MAGICSWORD)
        attacker->defense = attacker->terrain_resistance + attacker->unit.res;
    else if (GetItemAttributes(defender->weapon) & ITEM_ATTR_MAGIC)
        attacker->defense = attacker->terrain_resistance + attacker->unit.res;
    else
        attacker->defense = attacker->terrain_defense + attacker->unit.def;
}

void ComputeBattleUnitBaseDefense(BattleUnit_t* bu) {
    bu->defense = bu->terrain_defense + bu->unit.def;
}

void ComputeBattleUnitAttack(BattleUnit_t* attacker, BattleUnit_t* defender) {
    short attack;

    attacker->attack = GetItemMight(attacker->weapon) + attacker->advantage_dmg_bonus;
    attack = attacker->attack;

    if (IsUnitEffectiveAgainst(&attacker->unit, &defender->unit) == TRUE)
        attack = attacker->attack * 3;

    if (IsItemEffectiveAgainst(attacker->weapon, &defender->unit) == TRUE) {
        attack = attacker->attack;

        switch (GetItemIid(attacker->weapon)) {

        case IID_AUDHULMA:
        case IID_VIDOFNIR:
        case IID_GARM:
        case IID_NIDHOGG:
        case IID_EXCALIBUR:
        case IID_IVALDI:
        case IID_SIEGLINDE:
        case IID_SIEGMUND:
            attack *= 2;
            break;

        default:
            attack *= 3;
            break;

        } // switch (GetItemIid(attacker->weapon))
    }

    attacker->attack = attack;
    attacker->attack += attacker->unit.pow;

    if (GetItemIid(attacker->weapon) == IID_MONSTER_STONE)
        attacker->attack = 0;
}

void ComputeBattleUnitSpeed(BattleUnit_t* bu) {
    int effWt = GetItemWeight(bu->weapon_before);

    effWt -= bu->unit.con_bonus;

    if (effWt < 0)
        effWt = 0;

    bu->attack_speed = bu->unit.spd - effWt;

    if (bu->attack_speed < 0)
        bu->attack_speed = 0;
}

void ComputeBattleUnitHitRate(BattleUnit_t* bu) {
    bu->hit_raw = (bu->unit.skl * 2) + GetItemHit(bu->weapon) + (bu->unit.lck / 2) + bu->advantage_hit_bonus;
}

void ComputeBattleUnitAvoidRate(BattleUnit_t* bu) {
    bu->avoid = (bu->attack_speed * 2) + bu->terrain_avoid + (bu->unit.lck);

    if (bu->avoid < 0)
        bu->avoid = 0;
}

void ComputeBattleUnitCritRate(BattleUnit_t* bu) {
    bu->crit_raw = GetItemCrit(bu->weapon) + (bu->unit.skl / 2);

    if (UNIT_ATTRIBUTES(&bu->unit) & UNIT_ATTR_CRITBONUS)
        bu->crit_raw += 15;
}

void ComputeBattleUnitDodgeRate(BattleUnit_t* bu) {
    bu->dodge = bu->unit.lck;
}

void ComputeBattleUnitEffectiveHitRate(BattleUnit_t* attacker, BattleUnit_t* defender) {
    attacker->hit = attacker->hit_raw - defender->avoid;

    if (attacker->hit > 100)
        attacker->hit = 100;

    if (attacker->hit < 0)
        attacker->hit = 0;
}

void ComputeBattleUnitEffectiveCritRate(BattleUnit_t* attacker, BattleUnit_t* defender) {
    int item, i;

    attacker->crit = attacker->crit_raw - defender->dodge;

    if (GetItemIid(attacker->weapon) == IID_MONSTER_STONE)
        attacker->crit = 0;

    if (attacker->crit < 0)
        attacker->crit = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && (item = defender->unit.items[i]); ++i) {
        if (GetItemAttributes(item) & ITEM_ATTR_NEGATE_CRIT) {
            attacker->crit = 0;
            break;
        }
    }
}

void ComputeBattleUnitSilencerRate(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (!(UNIT_ATTRIBUTES(&attacker->unit) & UNIT_ATTR_ASSASSIN))
        attacker->silencer_rate = 0;
    else {
        attacker->silencer_rate = 50;

        if (UNIT_ATTRIBUTES(&defender->unit) & UNIT_ATTR_BOSS)
            attacker->silencer_rate = 25;

        if (UNIT_ATTRIBUTES(&defender->unit) & UNIT_ATTR_FINAL_BOSS)
            attacker->silencer_rate = 0;
    }
}

void ComputeBattleUnitWeaponRankBonuses(BattleUnit_t* bu) {
    if (bu->weapon) {
        int wType = GetItemKind(bu->weapon);

        if (wType < 8 && bu->unit.wexp[wType] >= WEAPON_EXP_S) {
            bu->hit_raw += 5;
            bu->crit_raw += 5;
        }
    }
}

void ComputeBattleUnitStatusBonuses(BattleUnit_t* bu) {
    switch (bu->unit.statusId) {

    case UNIT_STATUS_ATTACK:
        bu->attack += 10;
        break;

    case UNIT_STATUS_DEFENSE:
        bu->defense += 10;
        break;

    case UNIT_STATUS_CRIT:
        bu->crit_raw += 10;
        break;

    case UNIT_STATUS_AVOID:
        bu->avoid += 10;
        break;

    } // switch (bu->unit.statusId)
}

void ComputeBattleUnitSpecialWeaponStats(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (attacker->weapon_attrs & ITEM_ATTR_MAGICSWORD) {
        switch (GetItemIid(attacker->weapon)) {

        case IID_LIGHTBRAND:
        case IID_RUNESWORD:
        case IID_WIND_SWORD:
            attacker->attack -= attacker->unit.pow / 2;

            attacker->crit_raw = 0;
            attacker->crit = 0;

            break;

        } // switch (GetItemIid(attacker->weapon))
    } else {
        if (GetItemWeaponEffect(attacker->weapon_before) == WEAPON_EFFECT_HPHALVE) {
            attacker->attack = (defender->unit.curHP + 1) >> 1;

            if (attacker->attack == 0)
                attacker->attack = 1;

            defender->defense = 0;

            attacker->crit_raw = 0;
            attacker->crit = 0;
        }

        if (attacker->weapon_attrs & ITEM_ATTR_NEGATE_DEFENSE)
            defender->defense = 0;

        if (defender->unit.statusId == UNIT_STATUS_PETRIFY || defender->unit.statusId == UNIT_STATUS_PETRIFY_2) {
            attacker->hit = 100;

            attacker->crit += 30;

            if (attacker->crit > 100)
                attacker->crit = 100;
        }
    }
}

void ClearBattleHits(void) {
    int i;

    for (i = 0; i < BATTLE_HIT_MAX; ++i) {
        gBattleHitArray[i].attributes = 0;
        gBattleHitArray[i].info = 0;
        gBattleHitArray[i].hp_difference = 0;
    }

    gBattleHitIterator = gBattleHitArray;
}

void BattleUnwind(void) {
    ClearBattleHits();

    // this do { ... } while (0); is required for match
    // which is kind of neat because it implies scrapped plans for supporting some accost kind of thing

    do {
        BattleUnit_t* attacker;
        BattleUnit_t* defender;

        BattleGetBattleUnitOrder(&attacker, &defender);

        gBattleHitIterator->info |= BATTLE_HIT_INFO_BEGIN;

        if (!BattleGenerateRoundHits(attacker, defender)) {
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_RETALIATE;

            if (!BattleGenerateRoundHits(defender, attacker) && BattleGetFollowUpOrder(&attacker, &defender)) {
                gBattleHitIterator->attributes = BATTLE_HIT_ATTR_FOLLOWUP;

                BattleGenerateRoundHits(attacker, defender);
            }
        }
    } while (FALSE);

    gBattleHitIterator->info |= BATTLE_HIT_INFO_END;
}

void BattleGetBattleUnitOrder(BattleUnit_t** outAttacker, BattleUnit_t** outDefender) {
    *outAttacker = &gBattleUnitA;
    *outDefender = &gBattleUnitB;
}

i8 BattleGetFollowUpOrder(BattleUnit_t** outAttacker, BattleUnit_t** outDefender) {
    if (gBattleUnitB.attack_speed > 250)
        return FALSE;

    if (ABS(gBattleUnitA.attack_speed - gBattleUnitB.attack_speed) < BATTLE_FOLLOWUP_SPEED_THRESHOLD)
        return FALSE;

    if (gBattleUnitA.attack_speed > gBattleUnitB.attack_speed) {
        *outAttacker = &gBattleUnitA;
        *outDefender = &gBattleUnitB;
    } else {
        *outAttacker = &gBattleUnitB;
        *outDefender = &gBattleUnitA;
    }

    if (GetItemWeaponEffect((*outAttacker)->weapon_before) == WEAPON_EFFECT_HPHALVE)
        return FALSE;

    if (GetItemIid((*outAttacker)->weapon) == IID_MONSTER_STONE)
        return FALSE;

    return TRUE;
}

i8 BattleGenerateRoundHits(BattleUnit_t* attacker, BattleUnit_t* defender) {
    int i, count;
    u16 attrs; // NOTE: this is a bug! attrs are 19 bits in FE8 (they're 16 bits in previous games)

    if (!attacker->weapon)
        return FALSE;

    attrs = gBattleHitIterator->attributes;
    count = GetBattleUnitHitCount(attacker);

    for (i = 0; i < count; ++i) {
        gBattleHitIterator->attributes |= attrs;

        if (BattleGenerateHit(attacker, defender))
            return TRUE;
    }

    return FALSE;
}

int GetBattleUnitHitCount(BattleUnit_t* attacker) {
    int result = 1;

    result <<= BattleCheckBraveEffect(attacker);

    return result;
}

int BattleCheckBraveEffect(BattleUnit_t* attacker) {
    if (!(attacker->weapon_attrs & ITEM_ATTR_BRAVE))
        return FALSE;

    gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_BRAVE;
    return TRUE;
}

i8 BattleCheckTriangleAttack(BattleUnit_t* attacker, BattleUnit_t* defender) {
    i8 adjacentLookup[] = {
        -1, 0,
        0, -1,
        +1, 0,
        0, +1
    };

    int i, count = 0;

    int triangleAttackAttr = UNIT_ATTRS_TRIANGLEATTACK_ANY & UNIT_ATTRIBUTES(&attacker->unit);

    int x = defender->unit.x;
    int y = defender->unit.y;

    int faction = UNIT_FACTION(&attacker->unit);

    gBattleStats.triatk_other_unit_a = NULL;
    gBattleStats.triatk_other_unit_b = NULL;

    for (i = 0; i < 4; ++i) {
        int uId = gMapUnit[adjacentLookup[i*2 + 1] + y][adjacentLookup[i*2 + 0] + x];
        Unit_t* unit;

        if (!uId)
            continue;

        unit = GetUnit(uId);

        if ((uId & 0xC0) != faction)
            continue;

        if (unit->statusId == UNIT_STATUS_SLEEP)
            continue;

        if (unit->statusId == UNIT_STATUS_PETRIFY)
            continue;

        if (unit->statusId == UNIT_STATUS_PETRIFY_2)
            continue;

        if (unit->jinfo->id == JID_WYVERN_KNIGHT_F)
            continue;

        if (UNIT_ATTRIBUTES(unit) & triangleAttackAttr) {
            ++count;

            if (!gBattleStats.triatk_other_unit_a)
                gBattleStats.triatk_other_unit_a = unit;
            else if (!gBattleStats.triatk_other_unit_b)
                gBattleStats.triatk_other_unit_b = unit;
        }
    }

    return count >= 2 ? TRUE : FALSE;
}

void BattleUpdateBattleStats(BattleUnit_t* attacker, BattleUnit_t* defender) {
    gBattleStats.attack = attacker->attack;
    gBattleStats.defense = defender->defense;
    gBattleStats.hit_rate = attacker->hit;
    gBattleStats.crit_rate = attacker->crit;
    gBattleStats.silencer_rate = attacker->silencer_rate;
}

void BattleCheckSureShot(BattleUnit_t* attacker) {
    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_SURESHOT)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_PIERCE)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_GREATSHLD)
        return;

    switch (attacker->unit.jinfo->id) {

    case JID_SNIPER:
    case JID_SNIPER_F:
        switch (GetItemIid(attacker->weapon)) {

        case IID_BALLISTA:
        case IID_BALLISTA_LONG:
        case IID_BALLISTA_KILLER:
            break;

        default:
            if (BattleRandRoll(attacker->unit.level, FALSE) == TRUE)
                gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_SURESHOT;

            break;

        } // switch (GetItemIid(attacker->weapon))

        break;

    } // switch (attacker->unit.jinfo->id)
}

void BattleCheckPierce(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_SURESHOT)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_PIERCE)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_GREATSHLD)
        return;

    switch (attacker->unit.jinfo->id) {

    case JID_WYVERN_KNIGHT:
    case JID_WYVERN_KNIGHT_F:
        if (BattleRandRoll(attacker->unit.level, FALSE) == TRUE)
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_PIERCE;

        break;

    } // switch (attacker->unit.jinfo->id)
}

void BattleCheckGreatShield(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_SURESHOT)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_PIERCE)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_GREATSHLD)
        return;

    if (GetItemWeaponEffect(attacker->weapon) == WEAPON_EFFECT_POISON)
        return;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)
        return;

    switch (defender->unit.jinfo->id) {

    case JID_GENERAL:
    case JID_GENERAL_F:
        if (BattleRandRoll(attacker->unit.level, FALSE) == TRUE)
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_GREATSHLD;

        break;

    } // switch (defender->unit.jinfo->id)
}

i8 BattleCheckSilencer(BattleUnit_t* attacker, BattleUnit_t* defender) {
    switch (defender->unit.jinfo->id) {

    case JID_DEMON_KING:
        return FALSE;

    case JID_NECROMANCER:
        if (gPlaySt.chapter == 0x15) // TODO: CHAPTER ID CONSTANTS
            return FALSE;

        if (gPlaySt.chapter == 0x22) // TODO: CHAPTER ID CONSTANTS
            return FALSE;

    } // switch (defender->unit.jinfo->id)

    if (BattleRandRoll(gBattleStats.silencer_rate, FALSE) == TRUE)
        return TRUE;

    return FALSE;
}

void BattleCheckPetrify(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (GetItemIid(attacker->weapon) == IID_MONSTER_STONE)
        gBattleStats.damage = 0;
}

void BattleGenerateHitAttributes(BattleUnit_t* attacker, BattleUnit_t* defender) {
    short attack, defense;

    gBattleStats.damage = 0;

    BattleCheckSureShot(attacker);

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_SURESHOT)) {
        if (!BattleRandRoll2Rn(gBattleStats.hit_rate, TRUE)) {
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_MISS;
            return;
        }
    }

    attack = gBattleStats.attack;
    defense = gBattleStats.defense;

    BattleCheckGreatShield(attacker, defender);

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_GREATSHLD))
        BattleCheckPierce(attacker, defender);

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_PIERCE)
        defense = 0;

    gBattleStats.damage = attack - defense;

    if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_GREATSHLD)
        gBattleStats.damage = 0;

    if (BattleRandRoll(gBattleStats.crit_rate, FALSE) == TRUE) {
        if (BattleCheckSilencer(attacker, defender)) {
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_SILENCER;

            gBattleStats.damage = BATTLE_MAX_DAMAGE;

            gBattleHitIterator->attributes = gBattleHitIterator->attributes &~ BATTLE_HIT_ATTR_GREATSHLD;
        } else {
            gBattleHitIterator->attributes = gBattleHitIterator->attributes | BATTLE_HIT_ATTR_CRIT;
            gBattleStats.damage = gBattleStats.damage * 3;
        }
    }

    if (gBattleStats.damage > BATTLE_MAX_DAMAGE)
        gBattleStats.damage = BATTLE_MAX_DAMAGE;

    if (gBattleStats.damage < 0)
        gBattleStats.damage = 0;

    BattleCheckPetrify(attacker, defender);

    if (gBattleStats.damage != 0)
        attacker->took_damage = TRUE;
}

void BattleGenerateHitTriangleAttack(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (!(UNIT_ATTRIBUTES(&attacker->unit) & UNIT_ATTRS_TRIANGLEATTACK_ANY))
        return;

    if (gBattleStats.range != 1)
        return;

    if (!(gBattleHitIterator->info & BATTLE_HIT_INFO_BEGIN))
        return;

    if (attacker->unit.statusId == UNIT_STATUS_BERSERK)
        return;

    if (gBattleStats.config & BATTLE_CONFIG_ARENA)
        return;

    if (!BattleCheckTriangleAttack(attacker, defender))
        return;

    gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_TATTACK;

    gBattleStats.crit_rate = 100;
    gBattleStats.hit_rate  = 100;
}

void BattleGenerateHitEffects(BattleUnit_t* attacker, BattleUnit_t* defender) {
    attacker->weapon_exp_gained++;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)) {
        if (defender->unit.jinfo->id != JID_DEMON_KING) {
            switch (GetItemWeaponEffect(attacker->weapon)) {

            case WEAPON_EFFECT_POISON:
                // Poison defender

                defender->new_status = UNIT_STATUS_POISON;
                gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_POISON;

                // "Ungray" defender if it was petrified (as it won't be anymore)
                if (defender->unit.statusId == UNIT_STATUS_PETRIFY || defender->unit.statusId == UNIT_STATUS_PETRIFY_2)
                    defender->unit.flags = defender->unit.flags &~ UNIT_FLAG_TURN_ENDED;

                break;

            case WEAPON_EFFECT_HPHALVE:
                gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_HPHALVE;
                break;

            } // switch (GetItemWeaponEffect(attacker->weapon))
        }

        if ((GetItemWeaponEffect(attacker->weapon) == WEAPON_EFFECT_DEVIL) && (BattleRandRoll(31 - attacker->unit.lck, FALSE))) {
            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_DEVIL;

            attacker->unit.curHP -= gBattleStats.damage;

            if (attacker->unit.curHP < 0)
                attacker->unit.curHP = 0;
        } else {
            if (gBattleStats.damage > defender->unit.curHP)
                gBattleStats.damage = defender->unit.curHP;

            defender->unit.curHP -= gBattleStats.damage;

            if (defender->unit.curHP < 0)
                defender->unit.curHP = 0;
        }

        if (GetItemWeaponEffect(attacker->weapon) == WEAPON_EFFECT_HPDRAIN) {
            if (attacker->unit.maxHP < (attacker->unit.curHP + gBattleStats.damage))
                attacker->unit.curHP = attacker->unit.maxHP;
            else
                attacker->unit.curHP += gBattleStats.damage;

            gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_HPSTEAL;
        }

        if (defender->unit.jinfo->id != JID_DEMON_KING) {
            if (GetItemWeaponEffect(attacker->weapon) == WEAPON_EFFECT_PETRIFY) {
                switch (gPlaySt.chapterPhaseIndex) {

                case FACTION_BLUE:
                    if (UNIT_FACTION(&defender->unit) == FACTION_BLUE)
                        defender->new_status = UNIT_STATUS_PETRIFY_2;
                    else
                        defender->new_status = UNIT_STATUS_PETRIFY;

                    break;

                case FACTION_RED:
                    if (UNIT_FACTION(&defender->unit) == FACTION_RED)
                        defender->new_status = UNIT_STATUS_PETRIFY_2;
                    else
                        defender->new_status = UNIT_STATUS_PETRIFY;

                    break;

                case FACTION_GREEN:
                    if (UNIT_FACTION(&defender->unit) == FACTION_GREEN)
                        defender->new_status = UNIT_STATUS_PETRIFY_2;
                    else
                        defender->new_status = UNIT_STATUS_PETRIFY;

                    break;

                } // switch (gPlaySt.chapterPhaseIndex)

                gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_PETRIFY;
            }
        }
    }

    gBattleHitIterator->hp_difference = gBattleStats.damage;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS) || attacker->weapon_attrs & (ITEM_ATTR_UNCOUNTERABLE | ITEM_ATTR_MAGIC)) {
        attacker->weapon = GetItemAfterUse(attacker->weapon);

        if (!attacker->weapon)
            attacker->weapon_broke = TRUE;
    }
}

i8 BattleGenerateHit(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (attacker == &gBattleUnitB)
        gBattleHitIterator->info |= BATTLE_HIT_INFO_RETALIATION;

    BattleUpdateBattleStats(attacker, defender);

    BattleGenerateHitTriangleAttack(attacker, defender);
    BattleGenerateHitAttributes(attacker, defender);
    BattleGenerateHitEffects(attacker, defender);

    if (attacker->unit.curHP == 0 || defender->unit.curHP == 0) {
        attacker->weapon_exp_gained++;

        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

        if (gBattleUnitB.unit.curHP != 0) {
            gBattleHitIterator++;
            return TRUE;
        }

        gBattleHitIterator->info |= BATTLE_HIT_INFO_KILLS_TARGET;

        gBattleHitIterator++;
        return TRUE;
    } else if (defender->new_status == UNIT_STATUS_PETRIFY || defender->new_status == UNIT_STATUS_PETRIFY_2) {
        gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

        gBattleHitIterator++;
        return TRUE;
    }

    gBattleHitIterator++;
    return FALSE;
}

void BattleApplyExpGains(void) {
    if ((UNIT_FACTION(&gBattleUnitA.unit) != FACTION_BLUE) || (UNIT_FACTION(&gBattleUnitB.unit) != FACTION_BLUE)) {
        if (!(gPlaySt.chapterStateBits & CHAPTER_FLAG_7)) {
            gBattleUnitA.exp_gained  = GetBattleUnitExpGain(&gBattleUnitA, &gBattleUnitB);
            gBattleUnitB.exp_gained = GetBattleUnitExpGain(&gBattleUnitB, &gBattleUnitA);

            gBattleUnitA.unit.exp  += gBattleUnitA.exp_gained;
            gBattleUnitB.unit.exp += gBattleUnitB.exp_gained;

            CheckBattleUnitLevelUp(&gBattleUnitA);
            CheckBattleUnitLevelUp(&gBattleUnitB);
        }
    }
}

int GetStatIncrease(int growth) {
    int result = 0;

    while (growth > 100) {
        result++;
        growth -= 100;
    }

    if (RandRoll(growth))
        result++;

    return result;
}

int GetAutoleveledStatIncrease(int growth, int levelCount) {
    return GetStatIncrease((growth * levelCount) + (RandNext((growth * levelCount) / 4) - (growth * levelCount) / 8));
}

i8 CanBattleUnitGainLevels(BattleUnit_t* bu) {
    if (gBmSt.gameStateBits & 0x40)
        return TRUE;

    if (bu->unit.exp == UNIT_EXP_DISABLED)
        return FALSE;

    if (UNIT_FACTION(&bu->unit) != FACTION_BLUE)
        return FALSE;

    return TRUE;
}

void CheckBattleUnitLevelUp(BattleUnit_t* bu) {
    if (CanBattleUnitGainLevels(bu) && bu->unit.exp >= 100) {
        int growthBonus, statGainTotal;

        bu->unit.exp -= 100;
        bu->unit.level++;

        if (UNIT_ATTRIBUTES(&bu->unit) & UNIT_ATTR_TRAINEE) {
            if (bu->unit.level == 10) {
                bu->exp_gained -= bu->unit.exp;
                bu->unit.exp = UNIT_EXP_DISABLED;
            }
        } else if (bu->unit.level == 20) {
            bu->exp_gained -= bu->unit.exp;
            bu->unit.exp = UNIT_EXP_DISABLED;
        }

        growthBonus = (bu->unit.flags & UNIT_FLAG_GROWTH_BOOST) ? 5: 0;
        statGainTotal = 0;

        bu->stat_gain_hp  = GetStatIncrease(bu->unit.pinfo->growthHP + growthBonus);
        statGainTotal += bu->stat_gain_hp;

        bu->stat_gain_pow = GetStatIncrease(bu->unit.pinfo->growthPow + growthBonus);
        statGainTotal += bu->stat_gain_pow;

        bu->stat_gain_skl = GetStatIncrease(bu->unit.pinfo->growthSkl + growthBonus);
        statGainTotal += bu->stat_gain_skl;

        bu->stat_gain_spd = GetStatIncrease(bu->unit.pinfo->growthSpd + growthBonus);
        statGainTotal += bu->stat_gain_spd;

        bu->stat_gain_def = GetStatIncrease(bu->unit.pinfo->growthDef + growthBonus);
        statGainTotal += bu->stat_gain_def;

        bu->stat_gain_res = GetStatIncrease(bu->unit.pinfo->growthRes + growthBonus);
        statGainTotal += bu->stat_gain_res;

        bu->stat_gain_lck = GetStatIncrease(bu->unit.pinfo->growthLck + growthBonus);
        statGainTotal += bu->stat_gain_lck;

        if (statGainTotal == 0) {
            for (statGainTotal = 0; statGainTotal < 2; ++statGainTotal) {
                bu->stat_gain_hp = GetStatIncrease(bu->unit.pinfo->growthHP);

                if (bu->stat_gain_hp)
                    break;

                bu->stat_gain_pow = GetStatIncrease(bu->unit.pinfo->growthPow);

                if (bu->stat_gain_pow)
                    break;

                bu->stat_gain_skl = GetStatIncrease(bu->unit.pinfo->growthSkl);

                if (bu->stat_gain_skl)
                    break;

                bu->stat_gain_spd = GetStatIncrease(bu->unit.pinfo->growthSpd);

                if (bu->stat_gain_spd)
                    break;

                bu->stat_gain_def = GetStatIncrease(bu->unit.pinfo->growthDef);

                if (bu->stat_gain_def)
                    break;

                bu->stat_gain_res = GetStatIncrease(bu->unit.pinfo->growthRes);

                if (bu->stat_gain_res)
                    break;

                bu->stat_gain_lck = GetStatIncrease(bu->unit.pinfo->growthLck);

                if (bu->stat_gain_lck)
                    break;
            }
        }

        CheckBattleUnitStatCaps(GetUnit(bu->unit.id), bu);
    }
}

void ApplyUnitDefaultPromotion(Unit_t* unit) {
    const struct JInfo* promotedClass = GetJInfo(unit->jinfo->jidPromotion);

    int baseClassId = unit->jinfo->id;
    int promClassId = promotedClass->id;

    int i;

    // Apply stat ups

    unit->maxHP += promotedClass->promotionHp;

    if (unit->maxHP > promotedClass->maxHP)
        unit->maxHP = promotedClass->maxHP;

    unit->pow += promotedClass->promotionPow;

    if (unit->pow > promotedClass->maxPow)
        unit->pow = promotedClass->maxPow;

    unit->skl += promotedClass->promotionSkl;

    if (unit->skl > promotedClass->maxSkl)
        unit->skl = promotedClass->maxSkl;

    unit->spd += promotedClass->promotionSpd;

    if (unit->spd > promotedClass->maxSpd)
        unit->spd = promotedClass->maxSpd;

    unit->def += promotedClass->promotionDef;

    if (unit->def > promotedClass->maxDef)
        unit->def = promotedClass->maxDef;

    unit->res += promotedClass->promotionRes;

    if (unit->res > promotedClass->maxRes)
        unit->res = promotedClass->maxRes;

    // Remove base class' base wexp from unit wexp
    for (i = 0; i < 8; ++i)
        unit->wexp[i] -= unit->jinfo->baseWexp[i];

    // Update unit class
    unit->jinfo = promotedClass;

    // Add promoted class' base wexp to unit wexp
    for (i = 0; i < 8; ++i) {
        int wexp = unit->wexp[i];

        wexp += unit->jinfo->baseWexp[i];

        if (wexp > WEAPON_EXP_S)
            wexp = WEAPON_EXP_S;

        unit->wexp[i] = wexp;
    }

    // If Pupil -> Shaman jidPromotion, set Anima rank to 0
    if (baseClassId == JID_PUPIL && promClassId == JID_SHAMAN)
        unit->wexp[ITEM_KIND_ANIMA] = 0;

    unit->level = 1;
    unit->exp   = 0;

    unit->curHP += promotedClass->promotionHp;

    if (unit->curHP > GetUnitMaxHp(unit))
        unit->curHP = GetUnitMaxHp(unit);
}

void ApplyUnitPromotion(Unit_t* unit, u8 jid) {
    const struct JInfo* promotedClass = GetJInfo(jid);

    int baseClassId = unit->jinfo->id;
    int promClassId = promotedClass->id;

    int i;

    // Apply stat ups

    unit->maxHP += promotedClass->promotionHp;

    if (unit->maxHP > promotedClass->maxHP)
        unit->maxHP = promotedClass->maxHP;

    unit->pow += promotedClass->promotionPow;

    if (unit->pow > promotedClass->maxPow)
        unit->pow = promotedClass->maxPow;

    unit->skl += promotedClass->promotionSkl;

    if (unit->skl > promotedClass->maxSkl)
        unit->skl = promotedClass->maxSkl;

    unit->spd += promotedClass->promotionSpd;

    if (unit->spd > promotedClass->maxSpd)
        unit->spd = promotedClass->maxSpd;

    unit->def += promotedClass->promotionDef;

    if (unit->def > promotedClass->maxDef)
        unit->def = promotedClass->maxDef;

    unit->res += promotedClass->promotionRes;

    if (unit->res > promotedClass->maxRes)
        unit->res = promotedClass->maxRes;

    // Remove base class' base wexp from unit wexp
    for (i = 0; i < 8; ++i)
        unit->wexp[i] -= unit->jinfo->baseWexp[i];

    // Update unit class
    unit->jinfo = promotedClass;

    // Add promoted class' base wexp to unit wexp
    for (i = 0; i < 8; ++i) {
        int wexp = unit->wexp[i];

        wexp += unit->jinfo->baseWexp[i];

        if (wexp > WEAPON_EXP_S)
            wexp = WEAPON_EXP_S;

        unit->wexp[i] = wexp;
    }

    // If Pupil -> Shaman jidPromotion, set Anima rank to 0
    if (baseClassId == JID_PUPIL && promClassId == JID_SHAMAN)
        unit->wexp[ITEM_KIND_ANIMA] = 0;

    unit->level = 1;
    unit->exp   = 0;

    unit->curHP += promotedClass->promotionHp;

    if (unit->curHP > GetUnitMaxHp(unit))
        unit->curHP = GetUnitMaxHp(unit);
}

void MakeBattleUnitPromoteGains(BattleUnit_t* bu, Unit_t* unit) {
    bu->stat_gain_hp  = bu->unit.maxHP - unit->maxHP;
    bu->stat_gain_pow = bu->unit.pow   - unit->pow;
    bu->stat_gain_skl = bu->unit.skl   - unit->skl;
    bu->stat_gain_spd = bu->unit.spd   - unit->spd;
    bu->stat_gain_def = bu->unit.def   - unit->def;
    bu->stat_gain_res = bu->unit.res   - unit->res;
    bu->stat_gain_lck = bu->unit.lck   - unit->lck;

    if (bu->unit.con_bonus != unit->con_bonus)
        bu->stat_gain_con = bu->unit.con_bonus - unit->con_bonus;
    else {
        bu->stat_gain_con = 0;
        bu->unit.con_bonus = unit->con_bonus;
    }
}

void CheckBattleUnitStatCaps(Unit_t* unit, BattleUnit_t* bu) {
    if ((unit->maxHP + bu->stat_gain_hp) > UNIT_MHP_MAX(unit))
        bu->stat_gain_hp = UNIT_MHP_MAX(unit) - unit->maxHP;

    if ((unit->pow + bu->stat_gain_pow) > UNIT_POW_MAX(unit))
        bu->stat_gain_pow = UNIT_POW_MAX(unit) - unit->pow;

    if ((unit->skl + bu->stat_gain_skl) > UNIT_SKL_MAX(unit))
        bu->stat_gain_skl = UNIT_SKL_MAX(unit) - unit->skl;

    if ((unit->spd + bu->stat_gain_spd) > UNIT_SPD_MAX(unit))
        bu->stat_gain_spd = UNIT_SPD_MAX(unit) - unit->spd;

    if ((unit->def + bu->stat_gain_def) > UNIT_DEF_MAX(unit))
        bu->stat_gain_def = UNIT_DEF_MAX(unit) - unit->def;

    if ((unit->res + bu->stat_gain_res) > UNIT_RES_MAX(unit))
        bu->stat_gain_res = UNIT_RES_MAX(unit) - unit->res;

    if ((unit->lck + bu->stat_gain_lck) > UNIT_LCK_MAX(unit))
        bu->stat_gain_lck = UNIT_LCK_MAX(unit) - unit->lck;
}

void BattleApplyUnitUpdates(void) {
    Unit_t* actor  = GetUnit(gBattleUnitA.unit.id);
    Unit_t* target = GetUnit(gBattleUnitB.unit.id);

    if (gBattleUnitA.has_real_weapon)
        gBattleUnitA.unit.items[gBattleUnitA.weapon_slot] = gBattleUnitA.weapon;

    if (gBattleUnitB.has_real_weapon)
        gBattleUnitB.unit.items[gBattleUnitB.weapon_slot] = gBattleUnitB.weapon;

    UpdateUnitFromBattle(actor, &gBattleUnitA);

    if (target)
        UpdateUnitFromBattle(target, &gBattleUnitB);
    else
        UpdateObstacleFromBattle(&gBattleUnitB);
}

// unused?
i8 func_0802C0B0(void) {
    return TRUE;
}

int GetBattleUnitUpdatedWeaponExp(BattleUnit_t* bu) {
    int i, result;

    if (UNIT_FACTION(&bu->unit) != FACTION_BLUE)
        return -1;

    if (bu->unit.curHP == 0)
        return -1;

    if (gPlaySt.chapterStateBits & CHAPTER_FLAG_7)
        return -1;

    if (gBmSt.gameStateBits & 0x40) // TODO: GAME STATE BITS CONSTANTS
        return -1;

    if (!(gBattleStats.config & BATTLE_CONFIG_ARENA)) {
        if (!bu->has_real_weapon)
            return -1;

        if (!(bu->weapon_attrs & ITEM_ATTR_REQUIRES_WEXP))
            return -1;

        if (bu->weapon_attrs & (ITEM_ATTR_MAGICSWORD | ITEM_ATTR_LOCK_MONSTER))
            return -1;
    }

    result = bu->unit.wexp[bu->weapon_kind];
    result += GetItemExpCoefficient(bu->weapon) * bu->weapon_exp_gained;

    for (i = 0; i < 8; ++i) {
        if (i == bu->weapon_kind)
            continue;

        if (bu->unit.jinfo->baseWexp[i] == WEAPON_EXP_S)
            continue;

        if (bu->unit.wexp[i] < WEAPON_EXP_S)
            continue;

        if (result >= WEAPON_EXP_S)
            result = (WEAPON_EXP_S - 1);

        break;
    }

    if (UNIT_ATTRIBUTES(&bu->unit) & UNIT_ATTR_PROMOTED) {
        if (result > WEAPON_EXP_S)
            result = WEAPON_EXP_S;
    } else if (UNIT_ATTRIBUTES(&bu->unit) & UNIT_ATTR_TRAINEE) {
        if (result > WEAPON_EXP_C)
            result = WEAPON_EXP_C;
    } else {
        if (result > WEAPON_EXP_A)
            result = WEAPON_EXP_A;
    }

    return result;
}

i8 HasBattleUnitGainedWeaponLevel(BattleUnit_t* bu) {
    int oldWexp = bu->unit.wexp[bu->weapon_kind];
    int newWexp = GetBattleUnitUpdatedWeaponExp(bu);

    if (newWexp < 0)
        return FALSE;

    return GetWeaponLevelFromExp(oldWexp) != GetWeaponLevelFromExp(newWexp);
}

void UpdateUnitFromBattle(Unit_t* unit, BattleUnit_t* bu) {
    int tmp;

    unit->level = bu->unit.level;
    unit->exp   = bu->unit.exp;
    unit->curHP = bu->unit.curHP;
    unit->flags = bu->unit.flags;

    gUnknown_03003060 = UNIT_ARENA_LEVEL(unit);

    if (bu->new_status >= 0)
        SetUnitStatus(unit, bu->new_status);

    unit->maxHP += bu->stat_gain_hp;
    unit->pow   += bu->stat_gain_pow;
    unit->skl   += bu->stat_gain_skl;
    unit->spd   += bu->stat_gain_spd;
    unit->def   += bu->stat_gain_def;
    unit->res   += bu->stat_gain_res;
    unit->lck   += bu->stat_gain_lck;

    UnitCheckStatOverflow(unit);

    tmp = GetBattleUnitUpdatedWeaponExp(bu);

    if (tmp > 0)
        unit->wexp[bu->weapon_kind] = tmp;

    for (tmp = 0; tmp < UNIT_ITEM_COUNT; ++tmp)
        unit->items[tmp] = bu->unit.items[tmp];

    UnitRemoveInvalidItems(unit);

    if (bu->exp_gained)
        BWL_AddExpGained(unit->pinfo->id, bu->exp_gained);
}

void UpdateUnitDuringBattle(Unit_t* unit, BattleUnit_t* bu) {
    int wexp;

    unit->curHP = bu->unit.curHP;

    wexp = GetBattleUnitUpdatedWeaponExp(bu);

    if (wexp > 0)
        unit->wexp[bu->weapon_kind] = wexp;
}

void BattleApplyBallistaUpdates(void) {
    if (gBattleStats.config & BATTLE_CONFIG_BALLISTA) {
        int uses = GetItemUses(gBattleUnitA.weapon);
        GetTrap(gBattleUnitA.unit.ballistaId)->data[TRAP_D_BLST_ITEMUSES] = uses;
    }
}

// ???
void func_0802C334(void) {
    sUnknown_0203A60C.unk00 = 0;
    sUnknown_0203A60C.unk01 = 0;
    sUnknown_0203A60C.unk02 = 0;
}

int GetUnitExpLevel(Unit_t* unit) {
    int result = unit->level;

    if (UNIT_ATTRIBUTES(unit) & UNIT_ATTR_PROMOTED)
        result += 20;

    return result;
}

int GetUnitRoundExp(Unit_t* actor, Unit_t* target) {
    int expLevel;

    expLevel = GetUnitExpLevel(actor);
    expLevel = expLevel - GetUnitExpLevel(target);
    expLevel = 31 - expLevel;

    if (expLevel < 0)
        expLevel = 0;

    return expLevel / actor->jinfo->classRelativePower;
}

int GetUnitPowerLevel(Unit_t* unit) {
    int result = unit->level * unit->jinfo->classRelativePower;

    if ((UNIT_ATTRIBUTES(unit) & UNIT_ATTR_PROMOTED) && unit->jinfo->jidPromotion)
        result = result + 20 * GetJInfo(unit->jinfo->jidPromotion)->classRelativePower;

    return result;
}

int GetUnitClassKillExpBonus(Unit_t* actor, Unit_t* target) {
    int result = 0;

    if (UNIT_ATTRIBUTES(target) & UNIT_ATTR_THIEF)
        result += 20;

    if (UNIT_ATTRIBUTES(target) & UNIT_ATTR_BOSS)
        result += 40;

    if (target->jinfo->id == JID_ENTOUMBED)
        result += 40;

    return result;
}

int GetUnitExpMultiplier(Unit_t* actor, Unit_t* target) {
    int i;

    if (!(UNIT_ATTRIBUTES(actor) & UNIT_ATTR_ASSASSIN))
        return 1;

    for (i = 0; i < BATTLE_HIT_MAX; ++i)
        if (gBattleHitArray[i].attributes & BATTLE_HIT_ATTR_SILENCER)
            return 2;

    return 1;
}

int GetUnitKillExpBonus(Unit_t* actor, Unit_t* target) {
    int result;

    if (target->curHP != 0)
        return 0;

    result = 20;

    // TODO: All the definitions
    if ((gBmSt.gameStateBits & 0x40) || (gPlaySt.chapterModeIndex != 1)) {
        result = GetUnitPowerLevel(target);

        result += 20;
        result -= GetUnitPowerLevel(actor);
    } else {
        int local = GetUnitPowerLevel(target);

        if (local <= GetUnitPowerLevel(actor))
            local = GetUnitPowerLevel(target) - GetUnitPowerLevel(actor) / 2;
        else
            local = GetUnitPowerLevel(target) - GetUnitPowerLevel(actor);

        result += local;
    }

    result += GetUnitClassKillExpBonus(actor, target);
    result *= GetUnitExpMultiplier(actor, target);

    if (result < 0)
        result = 0;

    return result;
}

void ModifyUnitSpecialExp(Unit_t* actor, Unit_t* target, int* exp) {
    if (UNIT_IS_GORGON_EGG(target)) {
        if (target->curHP == 0)
            *exp = 50;
        else
            *exp = 0;
    }

    if (target->jinfo->id == JID_DEMON_KING)
        if (target->curHP == 0)
            *exp = 0;

    if (actor->jinfo->id == JID_PHANTOM)
        *exp = 0;
}

int GetBattleUnitExpGain(BattleUnit_t* actor, BattleUnit_t* target) {
    int result;

    if (!CanBattleUnitGainLevels(actor) || (actor->unit.curHP == 0) || UNIT_ATTRIBUTES(&target->unit) & UNIT_ATTR_FINAL_BOSS)
        return 0;

    if (!actor->took_damage)
        return 1;

    result = GetUnitRoundExp(&actor->unit, &target->unit);
    result += GetUnitKillExpBonus(&actor->unit, &target->unit);

    if (result > 100)
        result = 100;

    if (result < 1)
        result = 1;

    ModifyUnitSpecialExp(&actor->unit, &target->unit, &result);

    return result;
}

void BattleApplyItemExpGains(void) {
    if (!(gPlaySt.chapterStateBits & CHAPTER_FLAG_7)) {
        if (gBattleUnitA.weapon_attrs & ITEM_ATTR_STAFF) {
            if (UNIT_FACTION(&gBattleUnitA.unit) == FACTION_BLUE)
                gBattleUnitA.weapon_exp_gained++;

            gBattleUnitA.exp_gained = GetBattleUnitStaffExp(&gBattleUnitA);
            gBattleUnitA.unit.exp += gBattleUnitA.exp_gained;

            CheckBattleUnitLevelUp(&gBattleUnitA);
        } else if ((gBattleUnitA.weapon_kind == ITEM_KIND_12) && (gBattleUnitA.unit.exp != UNIT_EXP_DISABLED)) {
            gBattleUnitA.exp_gained = 20;
            gBattleUnitA.unit.exp += 20;

            CheckBattleUnitLevelUp(&gBattleUnitA);
        }
    }
}

int GetBattleUnitStaffExp(BattleUnit_t* bu) {
    int result;

    if (!CanBattleUnitGainLevels(bu))
        return 0;

    if (gBattleHitArray->attributes & BATTLE_HIT_ATTR_MISS)
        return 1;

    result = 10 + GetItemCostPerUse(bu->weapon) / 20;

    if (UNIT_ATTRIBUTES(&bu->unit) & UNIT_ATTR_PROMOTED)
        result = result / 2;

    if (result > 100)
        result = 100;

    return result;
}

void BattleApplyMiscActionExpGains(void) {
    if (UNIT_FACTION(&gBattleUnitA.unit) != FACTION_BLUE)
        return;

    if (!CanBattleUnitGainLevels(&gBattleUnitA))
        return;

    if (gPlaySt.chapterStateBits & CHAPTER_FLAG_7)
        return;

    gBattleUnitA.exp_gained = 10;
    gBattleUnitA.unit.exp += 10;

    CheckBattleUnitLevelUp(&gBattleUnitA);
}

void BattleUnitTargetSetEquippedWeapon(BattleUnit_t* bu) {
    int i;

    if (bu->weapon_before)
        return;

    bu->weapon_before = GetUnitEquippedWeapon(&bu->unit);

    if (bu->weapon_before)
        return;

    if (!UnitKnowsMagic(&bu->unit))
        return;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
        if (CanUnitUseStaff(&bu->unit, bu->unit.items[i]) == TRUE) {
            bu->weapon_before = bu->unit.items[i];
            break;
        }
    }
}

void BattleUnitTargetCheckCanCounter(BattleUnit_t* bu) {
    if (!bu->has_real_weapon) {
        bu->attack = 0xFF;
        bu->hit_raw = 0xFF;
        bu->hit = 0xFF;
        bu->crit_raw = 0xFF;
        bu->crit = 0xFF;
    }
}

void BattleApplyReaverEffect(BattleUnit_t* attacker, BattleUnit_t* defender) {
    if (!(attacker->weapon_attrs & ITEM_ATTR_REVERTS_ADVANTAGE) || !(defender->weapon_attrs & ITEM_ATTR_REVERTS_ADVANTAGE)) {
        attacker->advantage_hit_bonus = -(attacker->advantage_hit_bonus * 2);
        attacker->advantage_dmg_bonus = -(attacker->advantage_dmg_bonus * 2);
        defender->advantage_hit_bonus = -(defender->advantage_hit_bonus * 2);
        defender->advantage_dmg_bonus = -(defender->advantage_dmg_bonus * 2);
    }
}

void BattleApplyWeaponTriangleEffect(BattleUnit_t* attacker, BattleUnit_t* defender) {
    const struct WeaponTriangleRule* it;

    for (it = sWeaponTriangleRules; it->attackerWeaponType >= 0; ++it) {
        if ((attacker->weapon_kind == it->attackerWeaponType) && (defender->weapon_kind == it->defenderWeaponType)) {
            attacker->advantage_hit_bonus = it->hitBonus;
            attacker->advantage_dmg_bonus = it->atkBonus;

            defender->advantage_hit_bonus = -it->hitBonus;
            defender->advantage_dmg_bonus = -it->atkBonus;

            break;
        }
    }

    if (attacker->weapon_attrs & ITEM_ATTR_REVERTS_ADVANTAGE)
        BattleApplyReaverEffect(attacker, defender);

    if (defender->weapon_attrs & ITEM_ATTR_REVERTS_ADVANTAGE)
        BattleApplyReaverEffect(attacker, defender);
}

void BattleInitTargetCanCounter(void) {
    // Target cannot counter if it is a gorgon egg

    if (UNIT_IS_GORGON_EGG(&gBattleUnitB.unit)) {
        gBattleUnitB.weapon = 0;
        gBattleUnitB.has_real_weapon = FALSE;
    }

    // Target cannot counter if either units are using "uncounterable" weapons

    if ((gBattleUnitA.weapon_attrs | gBattleUnitB.weapon_attrs) & ITEM_ATTR_UNCOUNTERABLE) {
        gBattleUnitB.weapon = 0;
        gBattleUnitB.has_real_weapon = FALSE;
    }

    // Target cannot counter if a berserked player unit is attacking another player unit

    if (gBattleUnitA.unit.statusId == UNIT_STATUS_BERSERK) {
        if ((UNIT_FACTION(&gBattleUnitA.unit) == FACTION_BLUE) && (UNIT_FACTION(&gBattleUnitB.unit) == FACTION_BLUE)) {
            gBattleUnitB.weapon = 0;
            gBattleUnitB.has_real_weapon = FALSE;
        }
    }
}

void InitObstacleBattleUnit(void) {
    ClearUnit(&gBattleUnitB.unit);

    gBattleUnitB.unit.id = 0;

    gBattleUnitB.unit.jinfo = GetJInfo(JID_OBSTACLE);

    gBattleUnitB.unit.maxHP = GetChapterInfo(gPlaySt.chapter)->mapCrackedWallHeath;
    gBattleUnitB.unit.curHP = gAction.trapType; // TODO: better

    gBattleUnitB.unit.x  = gAction.xOther;
    gBattleUnitB.unit.y  = gAction.yOther;

    switch (gMapTerrain[gBattleUnitB.unit.y][gBattleUnitB.unit.x]) {

    case TERRAIN_WALL_1B:
        gBattleUnitB.unit.pinfo = GetPInfo(PID_WALL);

        break;

    case TERRAIN_SNAG:
        gBattleUnitB.unit.pinfo = GetPInfo(PID_SNAG);
        gBattleUnitB.unit.maxHP = 20;

        break;

    } // switch (gMapTerrain[gBattleUnitB.unit.y][gBattleUnitB.unit.x])
}

void ComputeBattleObstacleStats(void) {
    gBattleUnitA.hit = 100;
    gBattleUnitA.crit = 0;

    gBattleUnitB.attack_speed = 0xFF;
    gBattleUnitB.hp_before = gBattleUnitB.unit.curHP;

    gBattleUnitB.advantage_hit_bonus = 0;
    gBattleUnitB.advantage_dmg_bonus = 0;
}

void UpdateObstacleFromBattle(BattleUnit_t* bu) {
    Trap_t* trap = GetTrapAt(bu->unit.x, bu->unit.y);

    trap->extra = bu->unit.curHP;

    if (trap->extra == 0) {
        int mapChangeId = GetMapChangeIdAt(bu->unit.x, bu->unit.y);

        if (gMapTerrain[bu->unit.y][bu->unit.x] == TERRAIN_SNAG)
            PlaySe(0x2D7); // TODO: Sound id constants

        RenderMapForFade();

        ApplyMapChange(mapChangeId);

        // This is kind of jank: it sets trap kind to 0 (TRAP_NONE) which should be the terminating id
        // But then immediately calls the map change trap adding routine, which would effectively replace
        // the 0-id trap with the new map change trap, even if it is not actually the end of the trap array

        trap->kind = TRAP_NONE;
        AddMapChangeTrap(mapChangeId);

        RefreshTerrainMap();
        UpdateRoofedUnits();
        RenderMap();

        StartBMXFADE(FALSE);
    }
}

void BeginBattleAnimations(void) {
    TmFill(gBg2Tm, 0);
    EnableBgSync(BG2_SYNC_BIT);

    SetBackdropColor(0);

    RenderMap();

    if (func_08055BC4()) {
        SetBattleAnimLinkArenaFlag(0);
        BeginAnimsOnBattleAnimations();
    } else {
        MU_EndAll();
        RenderMap();
        BeginBattleMapAnims();

        gBattleStats.config |= BATTLE_CONFIG_MAPANIMS;
    }
}

int GetUnitSoloBattleAnimType(Unit_t* unit) {
    // TODO: battle anim type constants

    if (unit->flags & UNIT_FLAG_SOLOANIM_A)
        return 0;

    if (unit->flags & UNIT_FLAG_SOLOANIM_B)
        return 3;

    return 1;
}

int GetBattleAnimType(void) {
    // TODO: battle anim type constants

    // If not solo anim, return global type
    if (gPlaySt.configBattleAnim != 2)
        return gPlaySt.configBattleAnim;

    // If both units are players, use actor solo anim type
    if (UNIT_FACTION(&gBattleUnitA.unit) == FACTION_BLUE)
        if (UNIT_FACTION(&gBattleUnitB.unit) == FACTION_BLUE)
            return GetUnitSoloBattleAnimType(&gBattleUnitA.unit);

    // If neither are players, return 1
    if (UNIT_FACTION(&gBattleUnitA.unit) != FACTION_BLUE)
        if (UNIT_FACTION(&gBattleUnitB.unit) != FACTION_BLUE)
            return 1;

    // Return solo anim type for the one that is a player unit
    if (UNIT_FACTION(&gBattleUnitA.unit) == FACTION_BLUE)
        return GetUnitSoloBattleAnimType(&gBattleUnitA.unit);
    else
        return GetUnitSoloBattleAnimType(&gBattleUnitB.unit);
}

void BattlePrintDebugUnitInfo(BattleUnit_t* actor, BattleUnit_t* target) {
    // prints battle unit information to debug output
}

void BattlePrintDebugHitInfo(void) {
    BattleHit_t* it;

    for (it = gBattleHitArray; !(it->info & BATTLE_HIT_INFO_END); ++it) {
        // prints battle rounds information to debug output
    }
}

void BattleInitItemEffect(Unit_t* actor, int itemSlot) {
    int item = actor->items[itemSlot];

    if (itemSlot < 0)
        item = 0;

    gBattleStats.config = 0;

    InitBattleUnit(&gBattleUnitA, actor);

    SetBattleUnitTerrainBonusesAuto(&gBattleUnitA);
    ComputeBattleUnitBaseDefense(&gBattleUnitA);
    ComputeBattleUnitSupportBonuses(&gBattleUnitA, NULL);

    gBattleUnitA.attack = 0xFF;
    gBattleUnitA.hit = 100;
    gBattleUnitA.crit = 0xFF;

    gBattleUnitA.weapon = item;
    gBattleUnitA.weapon_before = item;
    gBattleUnitA.weapon_slot = itemSlot;
    gBattleUnitA.weapon_kind = GetItemKind(item);
    gBattleUnitA.weapon_attrs = GetItemAttributes(item);

    gBattleUnitA.has_real_weapon = TRUE;
    gBattleUnitA.is_item_effect_target = FALSE;

    gBattleUnitA.new_status = -1;
    gBattleUnitB.new_status = -1;

    ClearBattleHits();
}

void BattleInitItemEffectTarget(Unit_t* unit) {
    InitBattleUnit(&gBattleUnitB, unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleUnitB);
    ComputeBattleUnitBaseDefense(&gBattleUnitB);
    ComputeBattleUnitSupportBonuses(&gBattleUnitB, NULL);

    gBattleUnitB.attack = 0xFF;
    gBattleUnitB.hit = 0xFF;
    gBattleUnitB.crit = 0xFF;

    gBattleUnitB.weapon_before = 0;

    BattleUnitTargetSetEquippedWeapon(&gBattleUnitB);

    gBattleUnitA.is_item_effect_target = TRUE;
}

void UpdateActorFromBattle(void) {
    UpdateUnitFromBattle(GetUnit(gBattleUnitA.unit.id), &gBattleUnitA);
}

void BattleApplyMiscAction(Proc_t* proc) {
    BattleApplyMiscActionExpGains();
    SpawnProcLocking(sProcScr_BattleAnimSimpleLock, proc);
}

void BattleApplyItemEffect(Proc_t* proc) {
    (++gBattleHitIterator)->info = BATTLE_HIT_INFO_END;

    BattleApplyItemExpGains();

    if (gBattleUnitA.has_real_weapon) {
        if (GetItemAttributes(gBattleUnitA.weapon) & ITEM_ATTR_STAFF)
            gBattleUnitA.weapon_broke = TRUE;

        gBattleUnitA.weapon = GetItemAfterUse(gBattleUnitA.weapon);
        gBattleUnitA.unit.items[gBattleUnitA.weapon_slot] = gBattleUnitA.weapon;

        if (gBattleUnitA.weapon)
            gBattleUnitA.weapon_broke = FALSE;
    }

    SpawnProcLocking(sProcScr_BattleAnimSimpleLock, proc);
}

int GetOffensiveStaffAccuracy(Unit_t* actor, Unit_t* target) {
    int baseAccuracy = (GetUnitPower(actor) - GetUnitResistance(target)) * 5;
    int unitSkill = GetUnitSkill(actor);
    int distance = RECT_DISTANCE(actor->x, actor->y, target->x, target->y);

    int result;

    if (actor->jinfo->id == JID_DEMON_KING)
        result = (baseAccuracy + unitSkill) - distance * 2;
    else
        result = (baseAccuracy + 30 + unitSkill) - distance * 2;

    if ((target->jinfo->id == JID_DEMON_KING) || (target->pinfo->id == PID_LYON) || (target->pinfo->id == PID_LYON_FINAL))
        return 0;

    if (result < 0)
        result = 0;

    if (result > 100)
        result = 100;

    return result;
}

void BattleGenerateArena(Unit_t* actor) {
    Unit_t* target = gArenaSt.opponentUnit;
    int something = gBmSt.unk3C;

    gBattleStats.config = BATTLE_CONFIG_REAL | BATTLE_CONFIG_ARENA;

    InitBattleUnit(&gBattleUnitA, actor);
    InitBattleUnit(&gBattleUnitB, target);

    if (gAction.trapType) {
        gBattleUnitB.unit.curHP = gAction.trapType;
        gBattleUnitB.hp_before = gAction.trapType;
    }

    gBattleStats.range = gArenaSt.range;

    gBattleUnitB.unit.x = gBattleUnitA.unit.x + gArenaSt.range;
    gBattleUnitB.unit.y = gBattleUnitA.unit.y;

    SetBattleUnitWeapon(&gBattleUnitA, BATTLE_UNIT_WEAPON_SLOT_ARENA_PLAYER);
    SetBattleUnitWeapon(&gBattleUnitB, BATTLE_UNIT_WEAPON_SLOT_ARENA_OPPONENT);

    BattleApplyWeaponTriangleEffect(&gBattleUnitA, &gBattleUnitB);

    gAction.suspendPointType = SUSPEND_POINT_DURINGARENA;
    SaveSuspendedGame(SAVE_BLOCK_SUSPEND_BASE);

    SetBattleUnitTerrainBonusesAuto(&gBattleUnitA);
    SetBattleUnitTerrainBonuses(&gBattleUnitB, 8); // TODO: terrain id constants

    BattleGenerate(actor, target);

    if (gBattleUnitB.unit.curHP == 0)
        BattleApplyExpGains();

    UpdateUnitDuringBattle(actor, &gBattleUnitA);

    if (!something || (gBattleUnitB.unit.curHP == 0)) {
        func_080A4AA4();

        actor->flags = (actor->flags &~ (UNIT_FLAG_ARENA_A | UNIT_FLAG_ARENA_B | UNIT_FLAG_ARENA_C))
            + ((((UNIT_ARENA_LEVEL(actor) + 1) <= 7) ? (UNIT_ARENA_LEVEL(actor) + 1) << 17 : 7 << 17));

        gUnknown_03003060 = UNIT_ARENA_LEVEL(actor);
    }

    BattlePrintDebugUnitInfo(&gBattleUnitA, &gBattleUnitB);
}

i8 BattleIsTriangleAttack(void) {
    return (gBattleHitArray->attributes & BATTLE_HIT_ATTR_TATTACK) != 0;
}

i8 DidBattleUnitBreakWeapon(BattleUnit_t* bu) {
    if (bu->unit.curHP == 0)
        return FALSE;

    return bu->weapon_broke;
}

void SetScriptedBattle(BattleHit_t* hits) {
    gAction.scriptedBattleHits = hits;
}

void BattleGenerateHitScriptedDamage(BattleUnit_t* bu) {
    gBattleStats.damage = 0;

    if (!(gBattleHitIterator->attributes & BATTLE_HIT_ATTR_MISS)) {
        if (gBattleHitIterator->hp_difference == 0) {
            gBattleStats.damage = gBattleStats.attack - gBattleStats.defense;

            if (gBattleHitIterator->attributes & BATTLE_HIT_ATTR_CRIT)
                gBattleStats.damage = 3 * gBattleStats.damage;
        } else
            gBattleStats.damage = gBattleHitIterator->hp_difference;

        if (gBattleStats.damage > BATTLE_MAX_DAMAGE)
            gBattleStats.damage = BATTLE_MAX_DAMAGE;

        if (gBattleStats.damage < 0)
            gBattleStats.damage = 0;

        if (gBattleStats.damage != 0)
            bu->took_damage = TRUE;
    }
}

#if NONMATCHING

void BattleUnwindScripted(void) {
    BattleUnit_t* attacker;
    BattleUnit_t* defender;

    BattleHit_t* itIn;
    BattleHit_t* itOut;

    itIn = gAction.scriptedBattleHits;
    itOut = gBattleHitArray;

    while (!(itIn->info & BATTLE_HIT_INFO_END))
        *itOut++ = *itIn++;

    *itOut = *itIn;

    for (gBattleHitIterator = gBattleHitArray; !(gBattleHitIterator->info & BATTLE_HIT_INFO_END); ++gBattleHitIterator) {
        if (gBattleHitIterator->info & BATTLE_HIT_INFO_RETALIATION) {
            attacker = &gBattleUnitB;
            defender = &gBattleUnitA;
        } else {
            attacker = &gBattleUnitA;
            defender = &gBattleUnitB;
        }

        BattleUpdateBattleStats(attacker, defender);
        BattleGenerateHitScriptedDamage(attacker);
        BattleGenerateHitEffects(attacker, defender);

        if ((attacker->unit.curHP == 0) || (defender->unit.curHP == 0)) {
            attacker->weapon_exp_gained++;

            gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

            if (gBattleUnitB.unit.curHP == 0)
                gBattleHitIterator->info |= BATTLE_HIT_INFO_KILLS_TARGET;

            (gBattleHitIterator + 1)->info = BATTLE_HIT_INFO_END;

            break;
        }

        if (
            (defender->unit.statusId == UNIT_STATUS_PETRIFY) ||
            (defender->unit.statusId == UNIT_STATUS_PETRIFY_2) ||
            (defender->new_status == UNIT_STATUS_PETRIFY) ||
            (defender->new_status == UNIT_STATUS_PETRIFY_2)
        ) {
            attacker->weapon_exp_gained++;

            gBattleHitIterator->info |= BATTLE_HIT_INFO_FINISHES;

            (gBattleHitIterator + 1)->info = BATTLE_HIT_INFO_END;

            break;
        }
    }

    gAction.scriptedBattleHits = NULL;
}

#else // if !NONMATCHING

__attribute__((naked))
void BattleUnwindScripted(void) {
    /* :( */

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        ldr r0, .L0802CFA4  @ gAction\n\
        ldr r3, [r0, #0x18]\n\
        ldr r4, .L0802CFA8  @ gBattleHitArray\n\
        ldr r2, [r3]\n\
        lsls r0, r2, #8\n\
        lsrs r0, r0, #0x1b\n\
        movs r1, #0x10\n\
        ands r0, r1\n\
        adds r5, r4, #0\n\
        ldr r6, .L0802CFAC  @ gBattleHitIterator\n\
        cmp r0, #0\n\
        bne .L0802CF76\n\
    .L0802CF66:\n\
        stm r4!, {r2}\n\
        adds r3, #4\n\
        ldr r2, [r3]\n\
        lsls r0, r2, #8\n\
        lsrs r0, r0, #0x1b\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq .L0802CF66\n\
    .L0802CF76:\n\
        ldr r0, [r3]\n\
        str r0, [r4]\n\
        str r5, [r6]\n\
        ldr r0, [r5]\n\
        lsls r0, r0, #8\n\
        lsrs r0, r0, #0x1b\n\
        movs r1, #0x10\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq .L0802CF8C\n\
        b .L0802D0AC\n\
    .L0802CF8C:\n\
        movs r7, #7\n\
    .L0802CF8E:\n\
        ldr r0, [r6]\n\
        ldr r0, [r0]\n\
        lsls r0, r0, #8\n\
        lsrs r0, r0, #0x1b\n\
        movs r1, #8\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq .L0802CFB8\n\
        ldr r4, .L0802CFB0  @ gBattleUnitB\n\
        ldr r5, .L0802CFB4  @ gBattleUnitA\n\
        b .L0802CFBC\n\
        .align 2, 0\n\
    .L0802CFA4: .4byte gAction\n\
    .L0802CFA8: .4byte gBattleHitArray\n\
    .L0802CFAC: .4byte gBattleHitIterator\n\
    .L0802CFB0: .4byte gBattleUnitB\n\
    .L0802CFB4: .4byte gBattleUnitA\n\
    .L0802CFB8:\n\
        ldr r4, .L0802D034  @ gBattleUnitA\n\
        ldr r5, .L0802D038  @ gBattleUnitB\n\
    .L0802CFBC:\n\
        adds r0, r4, #0\n\
        adds r1, r5, #0\n\
        bl BattleUpdateBattleStats\n\
        adds r0, r4, #0\n\
        bl BattleGenerateHitScriptedDamage\n\
        adds r0, r4, #0\n\
        adds r1, r5, #0\n\
        bl BattleGenerateHitEffects\n\
        movs r0, #0x13\n\
        ldrsb r0, [r4, r0]\n\
        cmp r0, #0\n\
        beq .L0802CFE2\n\
        movs r0, #0x13\n\
        ldrsb r0, [r5, r0]\n\
        cmp r0, #0\n\
        bne .L0802D040\n\
    .L0802CFE2:\n\
        adds r1, r4, #0\n\
        adds r1, #0x7b\n\
        ldrb r0, [r1]\n\
        adds r0, #1\n\
        strb r0, [r1]\n\
        ldr r5, .L0802D03C  @ gBattleHitIterator\n\
        ldr r3, [r5]\n\
        ldr r1, [r3]\n\
        lsls r1, r1, #8\n\
        lsrs r1, r1, #0x1b\n\
        movs r0, #2\n\
        orrs r1, r0\n\
        lsls r1, r1, #3\n\
        ldrb r2, [r3, #2]\n\
        movs r4, #7\n\
        adds r0, r4, #0\n\
        ands r0, r2\n\
        orrs r0, r1\n\
        strb r0, [r3, #2]\n\
        ldr r0, .L0802D038  @ gBattleUnitB\n\
        ldrb r0, [r0, #0x13]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        cmp r0, #0\n\
        bne .L0802D02C\n\
        ldr r3, [r5]\n\
        ldr r1, [r3]\n\
        lsls r1, r1, #8\n\
        lsrs r1, r1, #0x1b\n\
        movs r0, #4\n\
        orrs r1, r0\n\
        lsls r1, r1, #3\n\
        ldrb r2, [r3, #2]\n\
        adds r0, r4, #0\n\
        ands r0, r2\n\
        orrs r0, r1\n\
        strb r0, [r3, #2]\n\
    .L0802D02C:\n\
        ldr r2, [r5]\n\
        ldrb r1, [r2, #6]\n\
        adds r0, r4, #0\n\
        b .L0802D08C\n\
        .align 2, 0\n\
    .L0802D034: .4byte gBattleUnitA\n\
    .L0802D038: .4byte gBattleUnitB\n\
    .L0802D03C: .4byte gBattleHitIterator\n\
    .L0802D040:\n\
        adds r0, r5, #0\n\
        adds r0, #0x30\n\
        ldrb r0, [r0]\n\
        movs r1, #0xf\n\
        ands r1, r0\n\
        cmp r1, #0xb\n\
        beq .L0802D064\n\
        cmp r1, #0xd\n\
        beq .L0802D064\n\
        adds r0, r5, #0\n\
        adds r0, #0x6f\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        cmp r0, #0xb\n\
        beq .L0802D064\n\
        cmp r0, #0xd\n\
        bne .L0802D096\n\
    .L0802D064:\n\
        adds r1, r4, #0\n\
        adds r1, #0x7b\n\
        ldrb r0, [r1]\n\
        adds r0, #1\n\
        strb r0, [r1]\n\
        ldr r3, [r6]\n\
        ldr r1, [r3]\n\
        lsls r1, r1, #8\n\
        lsrs r1, r1, #0x1b\n\
        movs r0, #2\n\
        orrs r1, r0\n\
        lsls r1, r1, #3\n\
        ldrb r2, [r3, #2]\n\
        adds r0, r7, #0\n\
        ands r0, r2\n\
        orrs r0, r1\n\
        strb r0, [r3, #2]\n\
        ldr r2, [r6]\n\
        ldrb r1, [r2, #6]\n\
        adds r0, r7, #0\n\
    .L0802D08C:\n\
        ands r0, r1\n\
        movs r1, #0x80\n\
        orrs r0, r1\n\
        strb r0, [r2, #6]\n\
        b .L0802D0AC\n\
    .L0802D096:\n\
        ldr r1, [r6]\n\
        adds r0, r1, #4\n\
        str r0, [r6]\n\
        ldr r0, [r1, #4]\n\
        lsls r0, r0, #8\n\
        lsrs r0, r0, #0x1b\n\
        movs r1, #0x10\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        bne .L0802D0AC\n\
        b .L0802CF8E\n\
    .L0802D0AC:\n\
        ldr r1, .L0802D0B8  @ gAction\n\
        movs r0, #0\n\
        str r0, [r1, #0x18]\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    .L0802D0B8: .4byte gAction\n\
        .syntax divided\n\
    ");
}

#endif // !NONMATCHING

void UnitLevelUp_unused(Unit_t* unit) {
    if (unit->level != 20) {
        int hpGain, powGain, sklGain, spdGain, defGain, resGain, lckGain;
        int growthBonus;
        int totalGain;

        unit->exp = 0;
        unit->level++;

        if (unit->level == 20)
            unit->exp = UNIT_EXP_DISABLED;

        growthBonus = (unit->flags & UNIT_FLAG_GROWTH_BOOST) ? 5: 0;
        totalGain = 0;

        hpGain  = GetStatIncrease(growthBonus + unit->pinfo->growthHP);
        totalGain += hpGain;

        powGain = GetStatIncrease(growthBonus + unit->pinfo->growthPow);
        totalGain += powGain;

        sklGain = GetStatIncrease(growthBonus + unit->pinfo->growthSkl);
        totalGain += sklGain;

        spdGain = GetStatIncrease(growthBonus + unit->pinfo->growthSpd);
        totalGain += spdGain;

        defGain = GetStatIncrease(growthBonus + unit->pinfo->growthDef);
        totalGain += defGain;

        resGain = GetStatIncrease(growthBonus + unit->pinfo->growthRes);
        totalGain += resGain;

        lckGain = GetStatIncrease(growthBonus + unit->pinfo->growthLck);
        totalGain += lckGain;

        if (totalGain == 0) {
            for (totalGain = 0; totalGain < 2; ++totalGain) {
                hpGain = GetStatIncrease(unit->pinfo->growthHP);

                if (hpGain)
                    break;

                powGain = GetStatIncrease(unit->pinfo->growthPow);

                if (powGain)
                    break;

                sklGain = GetStatIncrease(unit->pinfo->growthSkl);

                if (sklGain)
                    break;

                spdGain = GetStatIncrease(unit->pinfo->growthSpd);

                if (spdGain)
                    break;

                defGain = GetStatIncrease(unit->pinfo->growthDef);

                if (defGain)
                    break;

                resGain = GetStatIncrease(unit->pinfo->growthRes);

                if (resGain)
                    break;

                lckGain = GetStatIncrease(unit->pinfo->growthLck);

                if (lckGain)
                    break;
            }
        }

        if ((unit->maxHP + hpGain) > UNIT_MHP_MAX(unit))
            hpGain = UNIT_MHP_MAX(unit) - unit->maxHP;

        if ((unit->pow + powGain) > UNIT_POW_MAX(unit))
            powGain = UNIT_POW_MAX(unit) - unit->pow;

        if ((unit->skl + sklGain) > UNIT_SKL_MAX(unit))
            sklGain = UNIT_SKL_MAX(unit) - unit->skl;

        if ((unit->spd + spdGain) > UNIT_SPD_MAX(unit))
            spdGain = UNIT_SPD_MAX(unit) - unit->spd;

        if ((unit->def + defGain) > UNIT_DEF_MAX(unit))
            defGain = UNIT_DEF_MAX(unit) - unit->def;

        if ((unit->res + resGain) > UNIT_RES_MAX(unit))
            resGain = UNIT_RES_MAX(unit) - unit->res;

        if ((unit->lck + lckGain) > UNIT_LCK_MAX(unit))
            lckGain = UNIT_LCK_MAX(unit) - unit->lck;

        unit->maxHP += hpGain;
        unit->pow += powGain;
        unit->skl += sklGain;
        unit->spd += spdGain;
        unit->def += defGain;
        unit->res += resGain;
        unit->lck += lckGain;
    }
}

void BattleHitAdvance(void) {
    gBattleHitIterator++;
}

void BattleHitTerminate(void) {
    gBattleHitIterator++;
    gBattleHitIterator->info = BATTLE_HIT_INFO_END;
}
