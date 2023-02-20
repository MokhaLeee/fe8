
#pragma once

#include "global.h"

struct SupportInfo;

// Config
enum { UNIT_LEVEL_MAX = 20 };
enum { UNIT_ITEM_COUNT = 5 };
enum { UNIT_DEFINITION_ITEM_COUNT = 4 };

// Meaningful constants
enum { UNIT_EXP_DISABLED = 0xFF };

struct PInfo
{
    /* 00 */ u16 name_msg;
    /* 02 */ u16 desc_msg;
    /* 04 */ u8 id;
    /* 05 */ u8 jidDefault;
    /* 06 */ u16 fid;
    /* 08 */ u8 fidMini;
    /* 09 */ u8 affinity;
    /* 0A */ u8 _u0A;

    /* 0B */ i8 baseLevel;
    /* 0C */ i8 baseHP;
    /* 0D */ i8 basePow;
    /* 0E */ i8 baseSkl;
    /* 0F */ i8 baseSpd;
    /* 10 */ i8 baseDef;
    /* 11 */ i8 baseRes;
    /* 12 */ i8 baseLck;
    /* 13 */ i8 baseCon;

    /* 14 */ u8 baseWexp[8];

    /* 1C */ u8 growthHP;
    /* 1D */ u8 growthPow;
    /* 1E */ u8 growthSkl;
    /* 1F */ u8 growthSpd;
    /* 20 */ u8 growthDef;
    /* 21 */ u8 growthRes;
    /* 22 */ u8 growthLck;

    /* 23 */ u8 _u23;
    /* 24 */ u8 _u24;
    /* 25 */ u8 _u25;
    /* 26 */ u8 _u26;
    /* 27 */ u8 _u27;

    /* 28 */ u32 attributes;

    /* 2C */ struct SupportInfo const* supportInfo;
    /* 30 */ void* _pU30;
};

struct JInfo
{
    /* 00 */ u16 name_msg;
    /* 02 */ u16 desc_msg;
    /* 04 */ u8 id;
    /* 05 */ u8 jidPromotion;
    /* 06 */ u8 mapSprite;
    /* 07 */ u8 slowWalking;
    /* 08 */ u16 fidDefault;
    /* 0A */ u8 _u0A;

    /* 0B */ i8 baseHP;
    /* 0C */ i8 basePow;
    /* 0D */ i8 baseSkl;
    /* 0E */ i8 baseSpd;
    /* 0F */ i8 baseDef;
    /* 10 */ i8 baseRes;
    /* 11 */ i8 baseCon;
    /* 12 */ i8 baseMov;

    /* 13 */ i8 maxHP;
    /* 14 */ i8 maxPow;
    /* 15 */ i8 maxSkl;
    /* 16 */ i8 maxSpd;
    /* 17 */ i8 maxDef;
    /* 18 */ i8 maxRes;
    /* 19 */ i8 maxCon;

    /* 1A */ i8 classRelativePower;

    /* 1B */ i8 growthHP;
    /* 1C */ i8 growthPow;
    /* 1D */ i8 growthSkl;
    /* 1E */ i8 growthSpd;
    /* 1F */ i8 growthDef;
    /* 20 */ i8 growthRes;
    /* 21 */ i8 growthLck;

    /* 22 */ u8 promotionHp;
    /* 23 */ u8 promotionPow;
    /* 24 */ u8 promotionSkl;
    /* 25 */ u8 promotionSpd;
    /* 26 */ u8 promotionDef;
    /* 27 */ u8 promotionRes;

    /* 28 */ u32 attributes;

    /* 2C */ u8 baseWexp[8];

    /* 34 */ void const* pBattleAnimDef;
    /* 38 */ i8 const* moveTable[3]; // standard, rain, snow

    /* 44 */ i8 const* pTerrainAvoidLookup;
    /* 48 */ i8 const* pTerrainDefenseLookup;
    /* 4C */ i8 const* pTerrainResistanceLookup;

    /* 50 */ void const* _pU50;
};

struct Unit
{
    /* 00 */ struct PInfo const* pinfo;
    /* 04 */ struct JInfo const* jinfo;

    /* 08 */ i8 level;
    /* 09 */ u8 exp;

    /* 0A */ u8 aiFlags;

    /* 0B */ i8 id;

    /* 0C */ u32 flags;

    /* 10 */ i8 x;
    /* 11 */ i8 y;

    /* 12 */ i8 maxHP;
    /* 13 */ i8 curHP;
    /* 14 */ i8 pow;
    /* 15 */ i8 skl;
    /* 16 */ i8 spd;
    /* 17 */ i8 def;
    /* 18 */ i8 res;
    /* 19 */ i8 lck;

    /* 1A */ i8 con_bonus;
    /* 1B */ u8 rescue;
    /* 1C */ u8 ballistaId;
    /* 1D */ i8 mov_bonus;

    /* 1E */ u16 items[UNIT_ITEM_COUNT];
    /* 28 */ u8 wexp[8];

    /* 30 */ u8 statusId : 4;
    /* 30 */ u8 statusDuration : 4;

    /* 31 */ u8 torchDuration : 4;
    /* 31 */ u8 barrierDuration : 4;

    /* 32 */ u8 supports[UNIT_SUPPORT_COUNT];
    /* 39 */ i8 supportBits;

    /* 3A */ u8 pad_3A[2];

    /* 3C */ struct MapSprite* mapSprite;

    /* 40 */ u16 aiConfig;
    /* 42 */ u8 aiA;
    /* 43 */ u8 aiApc;
    /* 44 */ u8 aiB;
    /* 45 */ u8 aiBpc;
    /* 46 */ u8 unk_46;
    /* 47 */ u8 unk_47;
};

typedef struct Unit Unit_t;

struct UnitInfo
{
    /* 00 */ u8 pid;
    /* 01 */ u8 jid;
    /* 02 */ u8 pidLead;

    /* 03 */ u8 autolevel  : 1;
    /* 03 */ u8 allegiance : 2;
    /* 03 */ u8 level      : 5;

    /* 04 */ u16 xPosition  : 6; /* 04:0 to 04:5 */
    /* 04 */ u16 yPosition  : 6; /* 04:6 to 05:3 */
    /* 05 */ u16 genMonster : 1; /* 05:4 */
    /* 05 */ u16 itemDrop   : 1; /* 05:5 */
    /* 05 */ u16 sumFlag    : 1; /* 05:6 */
    /* 05 */ u16 extraData  : 9; /* 05:7 to 06:7 */
    /* 07 */ u16 redaCount  : 8;

    /* 08 */ void const* redas;

    /* 0C */ u8 items[UNIT_DEFINITION_ITEM_COUNT];
    /* 10 */ u8 ai[4];
};

enum
{
    // Unit::flags constants

    UNIT_FLAG_NONE         = 0,

    UNIT_FLAG_HIDDEN         = (1 << 0),
    UNIT_FLAG_TURN_ENDED     = (1 << 1),
    UNIT_FLAG_DEAD           = (1 << 2),
    UNIT_FLAG_UNDEPLOYED     = (1 << 3),
    UNIT_FLAG_RESCUING       = (1 << 4),
    UNIT_FLAG_RESCUED        = (1 << 5),
    UNIT_FLAG_HAD_ACTION     = (1 << 6),
    UNIT_FLAG_UNDER_ROOF     = (1 << 7),
    UNIT_FLAG_SEEN           = (1 << 8),
    UNIT_FLAG_UNSEEN         = (1 << 9), // hidden by fog
    UNIT_FLAG_AI_PROCESSED   = (1 << 10),
    UNIT_FLAG_IN_BALLISTA    = (1 << 11),
    UNIT_FLAG_DROPS_ITEM     = (1 << 12),
    UNIT_FLAG_GROWTH_BOOST   = (1 << 13),
    UNIT_FLAG_SOLOANIM_A     = (1 << 14),
    UNIT_FLAG_SOLOANIM_B     = (1 << 15),
    UNIT_FLAG_AWAY           = (1 << 16),
    UNIT_FLAG_ARENA_A        = (1 << 17),
    UNIT_FLAG_ARENA_B        = (1 << 18),
    UNIT_FLAG_ARENA_C        = (1 << 19),
    UNIT_FLAG_20             = (1 << 20),
    UNIT_FLAG_WAS_UNDEPLOYED = (1 << 21),
    UNIT_FLAG_CUTSCENE       = (1 << 22),
    UNIT_FLAG_ALTERNATE_FACE = (1 << 23),
    UNIT_FLAG_24             = (1 << 24), // unused?
    UNIT_FLAG_25             = (1 << 25),
    UNIT_FLAG_WAS_AWAY       = (1 << 26),

    // Helpers
    UNIT_FLAGS_UNAVAILABLE = UNIT_FLAG_DEAD | UNIT_FLAG_UNDEPLOYED | UNIT_FLAG_AWAY,
};

enum
{
    // Unit status identifiers

    UNIT_STATUS_NONE = 0,

    UNIT_STATUS_POISON = 1,
    UNIT_STATUS_SLEEP = 2,
    UNIT_STATUS_SILENCED = 3,
    UNIT_STATUS_BERSERK = 4,

    UNIT_STATUS_ATTACK = 5,
    UNIT_STATUS_DEFENSE = 6,
    UNIT_STATUS_CRIT = 7,
    UNIT_STATUS_AVOID = 8,

    UNIT_STATUS_SICK = 9,
    UNIT_STATUS_RECOVER = 10,

    UNIT_STATUS_PETRIFY = 11,
    UNIT_STATUS_12 = 12,
    UNIT_STATUS_PETRIFY_2 = 13,
};

enum
{
    FACTION_BLUE   = 0x00, // player units
    FACTION_GREEN  = 0x40, // ally npc units
    FACTION_RED    = 0x80, // enemy units
    FACTION_PURPLE = 0xC0, // link arena 4th team
};

enum
{
    // Character/Class attributes

    UNIT_ATTR_NONE = 0,

    UNIT_ATTR_MOUNTED = (1 << 0),
    UNIT_ATTR_CANTO = (1 << 1),
    UNIT_ATTR_2 = (1 << 2), // steal?
    UNIT_ATTR_THIEF = (1 << 3),
    UNIT_ATTR_DANCE = (1 << 4),
    UNIT_ATTR_PLAY = (1 << 5),
    UNIT_ATTR_CRITBONUS = (1 << 6),
    UNIT_ATTR_BALLISTAE = (1 << 7),
    UNIT_ATTR_PROMOTED = (1 << 8),
    UNIT_ATTR_SUPPLY = (1 << 9),
    UNIT_ATTR_HORSE = (1 << 10),
    UNIT_ATTR_WYVERN = (1 << 11),
    UNIT_ATTR_PEGASUS = (1 << 12),
    UNIT_ATTR_LORD = (1 << 13),
    UNIT_ATTR_FEMALE = (1 << 14),
    UNIT_ATTR_BOSS = (1 << 15),
    UNIT_ATTR_LOCK_1 = (1 << 16),
    UNIT_ATTR_LOCK_2 = (1 << 17),
    UNIT_ATTR_MONSTER = (1 << 18),
    UNIT_ATTR_TRAINEE = (1 << 19),
    UNIT_ATTR_20 = (1 << 20), // "unselectable"?
    UNIT_ATTR_TRIANGLEATTACK_PEGASI = (1 << 21),
    UNIT_ATTR_TRIANGLEATTACK_ARMORS = (1 << 22),
    UNIT_ATTR_23 = (1 << 23),
    UNIT_ATTR_FINAL_BOSS = (1 << 24),
    UNIT_ATTR_ASSASSIN = (1 << 25),
    UNIT_ATTR_MAGICSEAL = (1 << 26),
    UNIT_ATTR_SUMMON = (1 << 27),
    UNIT_ATTR_LOCK_3 = (1 << 28),
    UNIT_ATTR_LOCK_4 = (1 << 29),
    UNIT_ATTR_LOCK_5 = (1 << 30),
    UNIT_ATTR_LOCK_6 = (1 << 31),

    // Helpers
    UNIT_ATTRS_REFRESH = UNIT_ATTR_DANCE | UNIT_ATTR_PLAY,
    UNIT_ATTRS_FLYING = UNIT_ATTR_WYVERN | UNIT_ATTR_PEGASUS,
    UNIT_ATTRS_TRIANGLEATTACK_ANY = UNIT_ATTR_TRIANGLEATTACK_ARMORS | UNIT_ATTR_TRIANGLEATTACK_PEGASI,
};

enum
{
    // To check result of GetUnit[Item]UseBits

    UNIT_USEBIT_WEAPON = (1 << 0),
    UNIT_USEBIT_STAFF  = (1 << 1),
};

// TODO: MOVE ELSEWHERE
extern struct JInfo const gClassData[];
extern struct PInfo const gCharacterData[];

void InitUnits(void);
void ClearUnit(Unit_t* unit);
void CopyUnit(Unit_t* from, Unit_t* to);
Unit_t* GetFreeUnit(int faction);
Unit_t* GetFreeBlueUnit(struct UnitInfo const* info);
int GetUnitVision(Unit_t* unit);
void SetUnitStatus(Unit_t* unit, int statusId);
void SetUnitStatusExt(Unit_t* unit, int status, int duration);
int GetUnitSpriteId(Unit_t* unit);
bool UnitAddItem(Unit_t* unit, int item);
void ClearUnitInventory(Unit_t* unit);
void UnitRemoveInvalidItems(Unit_t* unit);
int GetUnitItemCount(Unit_t* unit);
bool UnitHasItem(Unit_t* unit, int item);
int BatchCreateUnits(struct UnitInfo const* info);
void func_08017A54(Unit_t* unit);
bool CanClassWieldWeaponType(u8 jid, u8 wpnType);
Unit_t* CreateUnit(struct UnitInfo const* info);
void UnitInitFromInfo(Unit_t* unit, struct UnitInfo const* info);
void UnitInitItemsFromInfo(Unit_t* unit, struct UnitInfo const* info);
void UnitInitStats(Unit_t* unit, struct PInfo const* pinfo);
void sub_08017EBC(Unit_t* unit);
void UnitInitSupports(Unit_t* unit);
void UnitAutolevelWeaponExp(Unit_t* unit, struct UnitInfo const* info);
void UnitAutolevelCore(Unit_t* unit, u8 jid, int levelCount);
void UnitAutolevelPenalty(Unit_t* unit, u8 jid, int levelCount);
void UnitApplyBonusLevels(Unit_t* unit, int levelCount);
void UnitAutolevel(Unit_t* unit);
void UnitAutolevelRealistic(Unit_t* unit);
void UnitCheckStatOverflow(Unit_t* unit);
Unit_t* GetUnitByPid(int pid);
Unit_t* GetUnitByPidAndFaction(int pid, int faction);
bool CanUnitCarry(Unit_t* actor, Unit_t* target);
void UnitRescue(Unit_t* actor, Unit_t* target);
void UnitDropRescue(Unit_t* actor, int xTarget, int yTarget);
bool UnitGiveRescue(Unit_t* actor, Unit_t* target);
void KillUnit(Unit_t* unit);
void UnitChangeFaction(Unit_t* unit, int faction);
void UnitSyncMovement(Unit_t* unit);
void UnitGetDropPositionOnDeath(Unit_t* unit, int* xOut, int* yOut);
void UnitBeginAction(Unit_t* unit);
void UnitBeginCantoAction(Unit_t* unit);
void MoveActiveUnit(int x, int y);
void ClearActiveFactionGrayedStates(void);
void TickActiveFactionTurn(void);
void ClearUnitsSeenFlag(void);
void UnitUpdateUsedItem(Unit_t* unit, int itemSlot);
int GetUnitAid(Unit_t* unit);
int GetUnitMagRange(Unit_t* unit);
bool UnitKnowsMagic(Unit_t* unit);
void func_08018A7C(Unit_t* unit, int x, int y);
int GetUnitKeyItemSlotForTerrain(Unit_t* unit, int terrain);
int GetUnitAidIconId(u32 attributes);
int GetUnitWeaponUsabilityBits(Unit_t* unit);
int GetCombinedEnemyWeaponUsabilityBits(void);
bool CanUnitMove(void);
bool IsPositionMagicSealed(int x, int y);
bool IsUnitMagicSealed(Unit_t* unit);
int GetUnitLastItem(Unit_t* unit);
i8 const* GetUnitMovementCost(Unit_t* unit);
int GetUnitSpriteByJid(int jid);
void UpdatePrevDeployStates(void);
void LoadUnitPrepScreenPositions(void);
void ClearTemporaryUnits(void);
bool IsUnitSlotAvailable(int faction);
void func_08018F80(void);
void func_08018FC0(void);
u16 CountAvailableBlueUnits(void);
int CountRedUnits(void);
int CountGreenUnits(void);
void ClearCutsceneUnits(void);
void func_08019108(void);
int GetUnitCurrentHp(Unit_t* unit);
int GetUnitMaxHp(Unit_t* unit);
int GetUnitPower(Unit_t* unit);
int GetUnitSkill(Unit_t* unit);
int GetUnitSpeed(Unit_t* unit);
int GetUnitDefense(Unit_t* unit);
int GetUnitResistance(Unit_t* unit);
int GetUnitLuck(Unit_t* unit);
int GetUnitFid(Unit_t* unit);
int GetUnitChibiFid(Unit_t* unit);
int GetUnitLeaderPid(Unit_t* unit);
void SetUnitLeaderPid(Unit_t* unit, int pid);
void SetUnitHp(Unit_t* unit, int value);
void AddUnitHp(Unit_t* unit, int amount);
char const* GetUnitRescueName(Unit_t* unit);
char const* GetUnitStatusName(Unit_t* unit);
Unit_t* GetUnit(int id);
struct JInfo const* GetJInfo(int jid);
struct PInfo const* GetPInfo(int pid);
void UnitRemoveItem(Unit_t* unit, int slot);
bool CanUnitCrossTerrain(Unit_t* unit, int terrain);

extern Unit_t* gActiveUnit;

#define UNIT_IS_VALID(unit) ((unit) && (unit)->pinfo)

#define UNIT_FACTION(unit) ((unit)->id & 0xC0)

#define UNIT_ATTRIBUTES(unit) ((unit)->pinfo->attributes | (unit)->jinfo->attributes)

#define UNIT_NAME_ID(unit) ((unit)->pinfo->name_msg)

#define UNIT_MHP_MAX(unit) (UNIT_FACTION(unit) == FACTION_RED ? 120 : 60)
#define UNIT_POW_MAX(unit) ((unit)->jinfo->maxPow)
#define UNIT_SKL_MAX(unit) ((unit)->jinfo->maxSkl)
#define UNIT_SPD_MAX(unit) ((unit)->jinfo->maxSpd)
#define UNIT_DEF_MAX(unit) ((unit)->jinfo->maxDef)
#define UNIT_RES_MAX(unit) ((unit)->jinfo->maxRes)
#define UNIT_LCK_MAX(unit) (30)
#define UNIT_CON_MAX(unit) ((unit)->jinfo->maxCon)
#define UNIT_MOV_MAX(unit) (15)

#define UNIT_CON_BASE(unit) ((unit)->jinfo->baseCon + (unit)->pinfo->baseCon)
#define UNIT_MOV_BASE(unit) ((unit)->jinfo->baseMov)

#define UNIT_CON(unit) (UNIT_CON_BASE(unit) + (unit)->con_bonus)
#define UNIT_MOV(unit) ((unit)->mov_bonus + UNIT_MOV_BASE(unit))

#define UNIT_IS_GORGON_EGG(unit) (((unit)->jinfo->id == JID_GORGONEGG) || ((unit)->jinfo->id == JID_GORGONEGG2))
#define UNIT_IS_PHANTOM(unit) ((unit)->jinfo->id == JID_PHANTOM)

#define UNIT_ARENA_LEVEL(unit) (((unit)->flags >> 17) & 0x7)

#define UNIT_SUPPORT_INFO(unit) ((unit)->pinfo->supportInfo)

// NOTE: if this ends up being only used in [Get|Set]UnitLeaderCharId, having this as a macro may end up being unnecessary
#define UNIT_LEADER_CHARACTER(unit) ((unit)->supports[UNIT_SUPPORT_COUNT-1])
