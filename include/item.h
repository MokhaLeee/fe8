#pragma once

#include "global.h"
#include "text.h"
#include "unit.h"

enum { ITEM_IID_BITS = 8 };

enum
{
    ITEM_KIND_SWORD    = 0,
    ITEM_KIND_LANCE    = 1,
    ITEM_KIND_AXE      = 2,
    ITEM_KIND_BOW      = 3,
    ITEM_KIND_STAFF    = 4,
    ITEM_KIND_ANIMA    = 5,
    ITEM_KIND_LIGHT    = 6,
    ITEM_KIND_DARK     = 7,
    ITEM_KIND_BALLISTA = 8,
    ITEM_KIND_ITEM     = 9,
    ITEM_KIND_DRAGON   = 10,

    ITEM_KIND_12       = 12,
};

enum
{
    ITEM_ATTR_WEAPON            = (1 << 0),
    ITEM_ATTR_MAGIC             = (1 << 1),
    ITEM_ATTR_STAFF             = (1 << 2),
    ITEM_ATTR_UNBREAKABLE       = (1 << 3),
    ITEM_ATTR_IMPORTANT         = (1 << 4),
    ITEM_ATTR_BRAVE             = (1 << 5),
    ITEM_ATTR_MAGICSWORD        = (1 << 6),
    ITEM_ATTR_UNCOUNTERABLE     = (1 << 7),
    ITEM_ATTR_REVERTS_ADVANTAGE = (1 << 8),
    ITEM_ATTR_UNREPAIRABLE      = (1 << 9),
    ITEM_ATTR_LOCK_MONSTER      = (1 << 10),
    ITEM_ATTR_LOCK_1            = (1 << 11),
    ITEM_ATTR_LOCK_2            = (1 << 12),
    ITEM_ATTR_LOCK_3            = (1 << 13),
    ITEM_ATTR_NEGATE_FLYING     = (1 << 14),
    ITEM_ATTR_NEGATE_CRIT       = (1 << 15),
    ITEM_ATTR_SEALED            = (1 << 16),
    ITEM_ATTR_NEGATE_DEFENSE    = (1 << 17),
    ITEM_ATTR_LOCK_4            = (1 << 18),
    ITEM_ATTR_LOCK_5            = (1 << 19),
    ITEM_ATTR_LOCK_6            = (1 << 20),
    ITEM_ATTR_LOCK_7            = (1 << 21),

    // Helpers
    ITEM_ATTR_REQUIRES_WEXP = (ITEM_ATTR_WEAPON | ITEM_ATTR_STAFF),
    ITEM_ATTR_LOCK_ANY = (ITEM_ATTR_LOCK_MONSTER | ITEM_ATTR_LOCK_1 | ITEM_ATTR_LOCK_2 | ITEM_ATTR_LOCK_3 | ITEM_ATTR_LOCK_4 | ITEM_ATTR_LOCK_5 | ITEM_ATTR_LOCK_6 | ITEM_ATTR_LOCK_7 | ITEM_ATTR_SEALED)
};

enum
{
    ITEM_EFFECT_02 = 0x02,
    ITEM_EFFECT_03,
    ITEM_EFFECT_04,
    ITEM_EFFECT_05,
    ITEM_EFFECT_06,

    ITEM_EFFECT_24 = 0x24,
    ITEM_EFFECT_25,
};

enum
{
    WEAPON_LEVEL_0 = 0,
    WEAPON_LEVEL_E = 1,
    WEAPON_LEVEL_D = 2,
    WEAPON_LEVEL_C = 3,
    WEAPON_LEVEL_B = 4,
    WEAPON_LEVEL_A = 5,
    WEAPON_LEVEL_S = 6,
};

enum
{
    WEAPON_EXP_0 = 0,
    WEAPON_EXP_E = 1,
    WEAPON_EXP_D = 31,
    WEAPON_EXP_C = 71,
    WEAPON_EXP_B = 121,
    WEAPON_EXP_A = 181,
    WEAPON_EXP_S = 251,
};

enum
{
    // Unit ranges are a (sometimes) weirdly hardcoded.
    // A flagset value is used to represent the combined ranges of a unit's usable items
    // That's what those "reaches" bits are for.

    REACH_NONE   = 0,

    REACH_RANGE1 = (1 << 0),
    REACH_RANGE2 = (1 << 1),
    REACH_RANGE3 = (1 << 2),
    REACH_TO10   = (1 << 3),
    REACH_TO15   = (1 << 4),
    REACH_MAGBY2 = (1 << 5),
};

enum
{
    WEAPON_EFFECT_NONE    = 0,
    WEAPON_EFFECT_POISON  = 1,
    WEAPON_EFFECT_HPDRAIN = 2,
    WEAPON_EFFECT_HPHALVE = 3,
    WEAPON_EFFECT_DEVIL   = 4,
    WEAPON_EFFECT_PETRIFY = 5,
};

struct ItemBonuses
{
    /* 00 */ i8 hp_bonus;
    /* 01 */ i8 pow_bonus;
    /* 02 */ i8 skl_bonus;
    /* 03 */ i8 spd_bonus;
    /* 04 */ i8 def_bonus;
    /* 05 */ i8 res_bonus;
    /* 06 */ i8 lck_bonus;
    /* 07 */ i8 mov_bonus;
    /* 08 */ i8 con_bonus;
};

typedef struct ItemBonuses ItemBonuses_t;

struct ItemInfo
{
    /* 00 */ u16 name_msg;
    /* 02 */ u16 desc_msg;
    /* 04 */ u16 use_desc_msg;
    /* 06 */ u8 id;
    /* 07 */ u8 weapon_kind;
    /* 08 */ u32 attributes;
    /* 0C */ ItemBonuses_t const* bonuses;
    /* 10 */ u8 const* effectiveness;
    /* 14 */ u8 uses;
    /* 15 */ u8 might;
    /* 16 */ u8 hit;
    /* 17 */ u8 weight;
    /* 18 */ u8 crit;
    /* 19 */ u8 encoded_range;
    /* 1A */ u16 cost_per_use;
    /* 1C */ u8 required_wexp;
    /* 1D */ u8 icon;
    /* 1E */ u8 item_effect;
    /* 1F */ u8 weapon_effect;
    /* 20 */ u8 wexp_coefficient;
    /* 21 */ u8 pad_item_info_21;
    /* 22 */ u8 pad_item_info_22;
    /* 23 */ u8 pad_item_info_23;
};

typedef struct ItemInfo ItemInfo_t;

char* GetItemNameWithArticle(int item, bool capitalize);

int GetItemIid(int item);
char* GetItemName(int item);
int GetItemDescMsg(int item);
int GetItemUseDescMsg(int item);
int GetItemKind(int item);
int GetItemAttributes(int item);
int GetItemUses(int item);
int GetItemMaxUses(int item);
int GetItemMight(int item);
int GetItemHit(int item);
int GetItemWeight(int item);
int GetItemCrit(int item);
int GetItemCost(int item);
int GetItemMinRange(int item);
int GetItemMaxRange(int item);
int GetItemEncodedRange(int item);
int GetItemRequiredExp(int item);
u8 const* GetItemEffectiveness(int item);
ItemBonuses_t const* GetItemBonuses(int item);
int GetItemIcon(int item);
int GetItemWeaponEffect(int item);
int GetItemEffect(int item);
int GetItemCostPerUse(int item);
int GetItemMaxValue(int item);
int GetItemExpCoefficient(int item);
int GetItemHpBonus(int item);
int GetItemPowBonus(int item);
int GetItemSklBonus(int item);
int GetItemSpdBonus(int item);
int GetItemDefBonus(int item);
int GetItemResBonus(int item);
int GetItemLckBonus(int item);
int CreateItem(int item);
bool CanUnitUseWeapon(Unit_t* unit, int item);
bool CanUnitUseWeaponNow(Unit_t* unit, int item);
bool CanUnitUseStaff(Unit_t* unit, int item);
bool CanUnitUseStaffNow(Unit_t* unit, int item);
void PutItemMenuLine(struct Text* text, int item, i8 is_usable, u16* tm);
void PutItemMenuLineLong(struct Text* text, int item, i8 is_usable, u16* tm);
void PutItemMenuLineNoColor(struct Text* text, int item, u16* tm);
void PutItemStatScreenLine(struct Text* text, int item, int name_color, u16* tm);
u16 GetItemAfterUse(int item);
u16 GetUnitEquippedWeapon(Unit_t* unit);
int GetUnitEquippedWeaponSlot(Unit_t* unit);
bool CanItemReachDistance(int item, int distance);
void UnitEquipItemSlot(Unit_t* unit, int item_slot);
bool IsItemEffectiveAgainst(u16 item, Unit_t* target);
bool IsUnitEffectiveAgainst(Unit_t* actor, Unit_t* target);
char const* GetItemRangeString(int item);
int GetWeaponLevelFromExp(int wexp);
char const* GetItemWeaponLevelString(int item);
int GetWeaponLevelSpecialCharFromExp(int wexp);
char const* GetItemKindString(int kind);
void GetWeaponExpProgression(int wexp, int* val_out, int* max_out);
bool IsItemDanceRing(int item);
bool IsItemDisplayUsable(Unit_t* unit, int item);
bool CanUnitUse_unused(Unit_t* unit, int item);
int GetUnitItemHealAmount(Unit_t* unit, int item);
int FindUnitItemSlot(Unit_t* unit, int iid);
bool IsItemStealable(int item);
bool IsItemRepairable(int item);
int GetItemReach(int item);
int GetUnitWeaponReach(Unit_t* unit, int itemSlot);
int GetUnitItemUseReach(Unit_t* unit, int itemSlot);
int GetUnitStaffReach(Unit_t* unit);
int GetTotalConvoyItemsValue(void);
int GetTotalUnitItemsValue(void);
int GetTotalTeamGoldValue(void);
void DeclareItemUnsealedForPid(int item, u8 pid);
bool IsItemUnsealedForUnit(Unit_t* unit, int item);
ItemInfo_t const* GetIidInfo(int iid);

// TODO: move out
extern ItemInfo_t const gItemInfo[];

#define ITEM_IID(item) ((item) & ((1 << ITEM_IID_BITS) - 1))
#define ITEM_USES(item) ((item) >> ITEM_IID_BITS)
