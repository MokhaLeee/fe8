#pragma once

#include "global.h"
#include "unit.h"

// Maximum amount of hits that can happen in a battle (-1, because of the terminating "hit")
enum { BATTLE_HIT_MAX = 7 };

// Followup attack (double attack) attack speed difference threshold
enum { BATTLE_FOLLOWUP_SPEED_THRESHOLD = 4 };

// Maximum battle damage
enum { BATTLE_MAX_DAMAGE = 127 };

struct BattleUnit
{
    /* 00 */ Unit_t unit;

    /* 48 */ u16 weapon;
    /* 4A */ u16 weapon_before;
    /* 4C */ u32 weapon_attrs;
    /* 50 */ u8 weapon_kind;
    /* 51 */ u8 weapon_slot;
    /* 52 */ bool has_real_weapon;

    /* 53 */ i8 advantage_hit_bonus;
    /* 54 */ i8 advantage_dmg_bonus;

    /* 55 */ u8 terrain;
    /* 56 */ i8 terrain_defense;
    /* 57 */ i8 terrain_avoid;
    /* 58 */ i8 terrain_resistance;

    /* 59 */ u8 pad_battle_unit_59;

    /* 5A */ i16 attack;
    /* 5C */ i16 defense;
    /* 5E */ i16 attack_speed;
    /* 60 */ i16 hit_raw;
    /* 62 */ i16 avoid;
    /* 64 */ i16 hit;
    /* 66 */ i16 crit_raw;
    /* 68 */ i16 dodge;
    /* 6A */ i16 crit;
    /* 6C */ i16 silencer_rate;

    /* 6E */ i8 exp_gained;
    /* 6F */ i8 new_status;

    /* 70 */ u8 level_before;
    /* 71 */ u8 exp_before;
    /* 72 */ u8 hp_before;

    /* 73 */ i8 stat_gain_hp;
    /* 74 */ i8 stat_gain_pow;
    /* 75 */ i8 stat_gain_skl;
    /* 76 */ i8 stat_gain_spd;
    /* 77 */ i8 stat_gain_def;
    /* 78 */ i8 stat_gain_res;
    /* 79 */ i8 stat_gain_lck;
    /* 7A */ i8 stat_gain_con;

    /* 7B */ i8 weapon_exp_gained;
    /* 7C */ bool took_damage;
    /* 7D */ bool weapon_broke;

    /* 7E */ bool is_item_effect_target;

    /* 7F */ u8 pad_battle_unit_7F;
};

typedef struct BattleUnit BattleUnit_t;

struct BattleStats
{
    /* 00 */ u16 config;

    /* 02 */ u8 range;

    /* 04 */ i16 damage;
    /* 06 */ i16 attack;
    /* 08 */ i16 defense;
    /* 0A */ i16 hit_rate;
    /* 0C */ i16 crit_rate;
    /* 0E */ i16 silencer_rate;

    /* 10 */ Unit_t* triatk_other_unit_a;
    /* 14 */ Unit_t* triatk_other_unit_b;
};

typedef struct BattleStats BattleStats_t;

enum
{
    BATTLE_CONFIG_REAL = (1 << 0),
    BATTLE_CONFIG_SIMULATE = (1 << 1),
    BATTLE_CONFIG_BIT2 = (1 << 2),
    BATTLE_CONFIG_BALLISTA = (1 << 3),
    BATTLE_CONFIG_BIT4 = (1 << 4),
    BATTLE_CONFIG_ARENA = (1 << 5),
    BATTLE_CONFIG_REFRESH = (1 << 6),
    BATTLE_CONFIG_MAPANIMS = (1 << 7),
    BATTLE_CONFIG_PROMOTION = (1 << 8),
    BATTLE_CONFIG_DANCERING = (1 << 9),
};

struct BattleHit
{
    /* 00:18 */ unsigned attributes    : 19;
    /* 19:23 */ unsigned info          : 5;
    /* 24:31 */ signed   hp_difference : 8;
};

typedef struct BattleHit BattleHit_t;

enum
{
    BATTLE_HIT_ATTR_CRIT      = (1 << 0),
    BATTLE_HIT_ATTR_MISS      = (1 << 1),
    BATTLE_HIT_ATTR_FOLLOWUP  = (1 << 2),
    BATTLE_HIT_ATTR_RETALIATE = (1 << 3),
    BATTLE_HIT_ATTR_BRAVE     = (1 << 4),
    BATTLE_HIT_ATTR_5         = (1 << 5), // unused?
    BATTLE_HIT_ATTR_POISON    = (1 << 6),
    BATTLE_HIT_ATTR_DEVIL     = (1 << 7),
    BATTLE_HIT_ATTR_HPSTEAL   = (1 << 8),
    BATTLE_HIT_ATTR_HPHALVE   = (1 << 9),
    BATTLE_HIT_ATTR_TATTACK   = (1 << 10), // triangle attack!
    BATTLE_HIT_ATTR_SILENCER  = (1 << 11),
    BATTLE_HIT_ATTR_12        = (1 << 12), // unused?
    BATTLE_HIT_ATTR_PETRIFY   = (1 << 13),
    BATTLE_HIT_ATTR_SURESHOT  = (1 << 14),
    BATTLE_HIT_ATTR_GREATSHLD = (1 << 15),
    BATTLE_HIT_ATTR_PIERCE    = (1 << 16),
    BATTLE_HIT_ATTR_17        = (1 << 17), // unused?
    BATTLE_HIT_ATTR_18        = (1 << 18), // unused?
};

enum
{
    BATTLE_HIT_INFO_BEGIN        = (1 << 0),
    BATTLE_HIT_INFO_FINISHES     = (1 << 1),
    BATTLE_HIT_INFO_KILLS_TARGET = (1 << 2),
    BATTLE_HIT_INFO_RETALIATION  = (1 << 3),
    BATTLE_HIT_INFO_END          = (1 << 4),
};

enum
{
    // Special item slot identifiers understood by SetBattleUnitWeapon and other functions

    BATTLE_UNIT_WEAPON_SLOT_AUTO           = -1,
    BATTLE_UNIT_WEAPON_SLOT_5              = UNIT_ITEM_COUNT + 0,
    BATTLE_UNIT_WEAPON_SLOT_ARENA_PLAYER   = UNIT_ITEM_COUNT + 1,
    BATTLE_UNIT_WEAPON_SLOT_ARENA_OPPONENT = UNIT_ITEM_COUNT + 2,
    BATTLE_UNIT_WEAPON_SLOT_BALLISTA       = UNIT_ITEM_COUNT + 3,
};

// Public objects

extern BattleStats_t gBattleStats;

extern BattleUnit_t gBattleUnitA;
extern BattleUnit_t gBattleUnitB;

extern BattleHit_t gBattleHitArray[BATTLE_HIT_MAX];
extern BattleHit_t* gBattleHitIterator;

// Public functions

void BattleApplyGameStateUpdates(void);
void BattleGenerateSimulation(Unit_t* actor, Unit_t* target, int x, int y, int actorWpnSlot);
void BattleGenerateReal(Unit_t* actor, Unit_t* target);
void BattleGenerateBallistaSimulation(Unit_t* actor, Unit_t* target, int x, int y);
void BattleGenerateBallistaReal(Unit_t* actor, Unit_t* target);
void BattleGenerate(Unit_t* actor, Unit_t* target);
void BattleGenerateUiStats(Unit_t* unit, i8 itemSlot);
void InitBattleUnit(BattleUnit_t* bUnit, Unit_t* unit);
void InitBattleUnitWithoutBonuses(BattleUnit_t* bu, Unit_t* unit);
void SetBattleUnitTerrainBonuses(BattleUnit_t* bu, int terrain);
void SetBattleUnitTerrainBonusesAuto(BattleUnit_t* bu);
void SetBattleUnitWeapon(BattleUnit_t* bu, int itemSlot);
void SetBattleUnitWeaponBallista(BattleUnit_t* bu);
void func_0802A958(void); // unused?
void ClearBattleHits(void);
void BattleUnwind(void);
void BattleGetBattleUnitOrder(BattleUnit_t** outAttacker, BattleUnit_t** outDefender);
i8 BattleGetFollowUpOrder(BattleUnit_t** outAttacker, BattleUnit_t** outDefender);
void BattleApplyExpGains(void);
int GetAutoleveledStatIncrease(int growth, int levelCount);
i8 CanBattleUnitGainLevels(BattleUnit_t* bu);
void CheckBattleUnitLevelUp(BattleUnit_t* bu);
void ApplyUnitDefaultPromotion(Unit_t* unit);
void ApplyUnitPromotion(Unit_t* unit, u8 jid);
void MakeBattleUnitPromoteGains(BattleUnit_t* bu, Unit_t* unit);
void CheckBattleUnitStatCaps(Unit_t* unit, BattleUnit_t* bu);
void BattleApplyUnitUpdates(void);
i8 func_0802C0B0(void); // unused?
i8 HasBattleUnitGainedWeaponLevel(BattleUnit_t* bu);
void UpdateUnitFromBattle(Unit_t* unit, BattleUnit_t* bu);
void UpdateUnitDuringBattle(Unit_t* unit, BattleUnit_t* bu);
void BattleApplyBallistaUpdates(void);
void func_0802C334(void);
void BattleUnitTargetSetEquippedWeapon(BattleUnit_t* bu);
void BattleUnitTargetCheckCanCounter(BattleUnit_t* bu);
void BattleApplyWeaponTriangleEffect(BattleUnit_t* actor, BattleUnit_t* target);
void BattleInitTargetCanCounter(void);
void InitObstacleBattleUnit(void);
void UpdateObstacleFromBattle(BattleUnit_t* bu);
void BeginBattleAnimations(void);
int GetUnitSoloBattleAnimType(Unit_t* unit);
int GetBattleAnimType(void);
void BattleInitItemEffect(Unit_t* actor, int itemSlot);
void BattleInitItemEffectTarget(Unit_t* unit);
void BattleApplyMiscAction(Proc_t* proc);
void BattleApplyItemEffect(Proc_t* proc);
int GetOffensiveStaffAccuracy(Unit_t* actor, Unit_t* target);
void BattleGenerateArena(Unit_t* unit);
i8 BattleIsTriangleAttack(void);
i8 DidBattleUnitBreakWeapon(BattleUnit_t* bu);
void SetScriptedBattle(BattleHit_t* hits);
void UnitLevelUp_unused(Unit_t* unit);
void BattleHitAdvance(void);
void BattleHitTerminate(void);
