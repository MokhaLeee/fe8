#include "global.h"

#include "constants/iids.h"

#include "text.h"
#include "icon.h"
#include "chapterdata.h"
#include "gold.h"
#include "unit.h"
#include "uimenu.h"
#include "item-use.h"

#include "item.h"

// TODO: figure out those two inline functions and where they belong

static inline void SetChapterSealPid(int arg, u8 val) {
    gPlaySt.item_kind_seals[arg] = val;
}

static inline int GetChapterSealPid(int arg) {
    return gPlaySt.item_kind_seals[arg];
}

char* GetItemNameWithArticle(int item, i8 capitalize) {
    switch (GetItemIid(item)) {

    case IID_REGINLEIF:
    case IID_FIMBULVETR:
    case IID_AIRCALIBUR:
    case IID_FENRIR:

    case IID_SIEGLINDE:
    case IID_SIEGMUND:
    case IID_NAGLFAR:

    case IID_AUDHULMA:
    case IID_VIDOFNIR:
    case IID_GARM:
    case IID_NIDHOGG:
    case IID_EXCALIBUR:
    case IID_IVALDI:
    case IID_GLEIPNIR:
    case IID_LATONA_STAFF:

    case IID_GOLD:
    case IID_METISSTOME:

    case IID_1G:
    case IID_5G:
    case IID_10G:
    case IID_50G:
    case IID_100G:
    case IID_150G:
    case IID_200G:
    case IID_3000G:
    case IID_5000G:
        // no article
        return GetItemName(item);

    default: {
        char* result;
        const char* article;

        // check for article
        if (GetItemIid(item) == IID_JUNAFRUIT)
            article = (capitalize == TRUE) ? "Some " : "some ";
        else
            article = NULL;

        result = GetItemName(item);
        PrependArticleToString(result, article, capitalize);

        return result;
    }

    } // switch (GetItemIid(item))
}

inline const ItemInfo_t* GetIidInfo(int iid) {
    return gItemInfo + iid;
}

inline int GetItemIid(int item) {
    return ITEM_IID(item);
}

inline char* GetItemName(int item) {
    char* result;

    result = GetMsg(GetIidInfo(ITEM_IID(item))->name_msg);
    result = StrExpandTact();

    return result;
}

inline int GetItemDescMsg(int item) {
    return GetIidInfo(ITEM_IID(item))->desc_msg;
}

inline int GetItemUseDescMsg(int item) {
    return GetIidInfo(ITEM_IID(item))->use_desc_msg;
}

inline int GetItemKind(int item) {
    if (!item)
        return 0xFF;

    return GetIidInfo(ITEM_IID(item))->weapon_kind;
}

inline int GetItemAttributes(int item) {
    return GetIidInfo(ITEM_IID(item))->attributes;
}

inline int GetItemUses(int item) {
    if (GetItemAttributes(item) & ITEM_ATTR_UNBREAKABLE)
        return 0xFF;
    else
        return ITEM_USES(item);
}

inline int GetItemMaxUses(int item) {
    if (GetItemAttributes(item) & ITEM_ATTR_UNBREAKABLE)
        return 0xFF;
    else
        return GetIidInfo(ITEM_IID(item))->uses;
}

inline int GetItemMight(int item) {
    return GetIidInfo(ITEM_IID(item))->might;
}

inline int GetItemHit(int item) {
    return GetIidInfo(ITEM_IID(item))->hit;
}

inline int GetItemWeight(int item) {
    return GetIidInfo(ITEM_IID(item))->weight;
}

inline int GetItemCrit(int item) {
    return GetIidInfo(ITEM_IID(item))->crit;
}

inline int GetItemCost(int item) {
    if (GetItemAttributes(item) & ITEM_ATTR_UNBREAKABLE)
        return GetIidInfo(ITEM_IID(item))->cost_per_use;
    else
        return GetIidInfo(ITEM_IID(item))->cost_per_use * GetItemUses(item);
}

inline int GetItemMinRange(int item) {
    return GetIidInfo(ITEM_IID(item))->encoded_range >> 4;
}

inline int GetItemMaxRange(int item) {
    return GetIidInfo(ITEM_IID(item))->encoded_range & 0xF;
}

inline int GetItemEncodedRange(int item) {
    return GetIidInfo(ITEM_IID(item))->encoded_range;
}

inline int GetItemRequiredExp(int item) {
    return GetIidInfo(ITEM_IID(item))->required_wexp;
}

inline const u8* GetItemEffectiveness(int item) {
    return GetIidInfo(ITEM_IID(item))->effectiveness;
}

inline const ItemBonuses_t* GetItemBonuses(int item) {
    return GetIidInfo(ITEM_IID(item))->bonuses;
}

inline int GetItemIcon(int item) {
    if (!item)
        return -1;

    return GetIidInfo(ITEM_IID(item))->icon;
}

inline int GetItemWeaponEffect(int item) {
    return GetIidInfo(ITEM_IID(item))->weapon_effect;
}

inline int GetItemEffect(int item) {
    return GetIidInfo(ITEM_IID(item))->item_effect;
}

inline int GetItemCostPerUse(int item) {
    return GetIidInfo(ITEM_IID(item))->cost_per_use;
}

inline int GetItemMaxValue(int item) {
    return GetIidInfo(ITEM_IID(item))->cost_per_use * GetItemMaxUses(item);
}

inline int GetItemExpCoefficient(int item) {
    return GetIidInfo(ITEM_IID(item))->wexp_coefficient;
}

int GetItemHpBonus(int item) {
    if (!item)
        return 0;
    else {
        const ItemBonuses_t* statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->hp_bonus;
    }

    return 0;
}

int GetItemPowBonus(int item) {
    if (!item)
        return 0;
    else {
        const ItemBonuses_t* statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->pow_bonus;
    }

    return 0;
}

int GetItemSklBonus(int item) {
    if (!item)
        return 0;
    else {
        const ItemBonuses_t* statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->skl_bonus;
    }

    return 0;
}

int GetItemSpdBonus(int item) {
    if (!item)
        return 0;
    else {
        const ItemBonuses_t* statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->spd_bonus;
    }

    return 0;
}

int GetItemDefBonus(int item) {
    if (!item)
        return 0;
    else {
        const ItemBonuses_t* statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->def_bonus;
    }

    return 0;
}

int GetItemResBonus(int item) {
    if (!item)
        return 0;
    else {
        const ItemBonuses_t* statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->res_bonus;
    }

    return 0;
}

int GetItemLckBonus(int item) {
    if (!item)
        return 0;
    else {
        const ItemBonuses_t* statBonuses = GetItemBonuses(item);

        if (statBonuses)
            return statBonuses->lck_bonus;
    }

    return 0;
}

int CreateItem(int item) {
    int uses = GetItemMaxUses(item);

    if (GetItemAttributes(item) & ITEM_ATTR_UNBREAKABLE)
        uses = 0;

    return (uses << 8) + GetItemIid(item);
}

i8 CanUnitUseWeapon(Unit_t* unit, int item) {
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & ITEM_ATTR_WEAPON))
        return FALSE;

    if (GetItemAttributes(item) & ITEM_ATTR_LOCK_ANY) {
        // Check for item locks

        if ((GetItemAttributes(item) & ITEM_ATTR_LOCK_1) && !(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_LOCK_1))
            return FALSE;

        if ((GetItemAttributes(item) & ITEM_ATTR_LOCK_4) && !(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_LOCK_3))
            return FALSE;

        if ((GetItemAttributes(item) & ITEM_ATTR_LOCK_5) && !(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_LOCK_4))
            return FALSE;

        if ((GetItemAttributes(item) & ITEM_ATTR_LOCK_6) && !(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_LOCK_5))
            return FALSE;

        if ((GetItemAttributes(item) & ITEM_ATTR_LOCK_7) && !(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_LOCK_6))
            return FALSE;

        if ((GetItemAttributes(item) & ITEM_ATTR_LOCK_2) && !(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_LOCK_2))
            return FALSE;

        if (GetItemAttributes(item) & ITEM_ATTR_LOCK_MONSTER) {
            if (!(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_MONSTER))
                return FALSE;

            return TRUE;
        }

        if (GetItemAttributes(item) & ITEM_ATTR_SEALED)
            if (!(IsItemUnsealedForUnit(unit, item)))
                return FALSE;
    }

    if ((unit->statusId == UNIT_STATUS_SILENCED) && (GetItemAttributes(item) & ITEM_ATTR_MAGIC))
        return FALSE;

    {
        int wRank = GetItemRequiredExp(item);
        int uRank = (unit->wexp[GetItemKind(item)]);

        return (uRank >= wRank) ? TRUE : FALSE;
    }
}

i8 CanUnitUseWeaponNow(Unit_t* unit, int item) {
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & ITEM_ATTR_WEAPON))
        return FALSE;

    if ((GetItemAttributes(item) & ITEM_ATTR_MAGIC) && IsUnitMagicSealed(unit))
        return FALSE;

    return CanUnitUseWeapon(unit, item);
}

i8 CanUnitUseStaff(Unit_t* unit, int item) {
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & ITEM_ATTR_STAFF))
        return FALSE;

    if (unit->statusId == UNIT_STATUS_SLEEP)
        return FALSE;

    if (unit->statusId == UNIT_STATUS_BERSERK)
        return FALSE;

    if (unit->statusId == UNIT_STATUS_SILENCED)
        return FALSE;

    {
        int wRank = GetItemRequiredExp(item);
        int uRank = unit->wexp[GetItemKind(item)];

        return (uRank >= wRank) ? TRUE : FALSE;
    }
}

// unused?
i8 CanUnitUseStaffNow(Unit_t* unit, int item) {
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & ITEM_ATTR_STAFF))
        return FALSE;

    if (IsUnitMagicSealed(unit))
        return FALSE;

    return CanUnitUseStaff(unit, item);
}

void PutItemMenuLine(struct Text* text, int item, i8 isUsable, u16* tm) {
    Text_SetParams(text, 0, (isUsable ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY));
    Text_DrawString(text, GetItemName(item));

    PutText(text, tm + 2);

    PutNumberOrBlank(tm + 11, isUsable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses(item));

    PutIcon(tm, GetItemIcon(item), 0x4000);
}

void PutItemMenuLineLong(struct Text* text, int item, i8 isUsable, u16* tm) {
    Text_SetParams(text, 0, (isUsable ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY));
    Text_DrawString(text, GetItemName(item));

    PutText(text, tm + 2);

    PutNumberOrBlank(tm + 10, isUsable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses(item));
    PutNumberOrBlank(tm + 13, isUsable ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemMaxUses(item));
    PutSpecialChar(tm + 11, isUsable ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_SLASH);

    PutIcon(tm, GetItemIcon(item), 0x4000);
}

void PutItemMenuLineNoColor(struct Text* text, int item, u16* tm) {
    Text_SetCursor(text, 0);
    Text_DrawString(text, GetItemName(item));

    PutText(text, tm + 2);

    PutNumberOrBlank(tm + 11, Text_GetColor(text), GetItemUses(item));

    PutIcon(tm, GetItemIcon(item), 0x4000);
}

void PutItemStatScreenLine(struct Text* text, int item, int name_color, u16* tm) {
    int color;

    ClearText(text);

    color = name_color;
    Text_SetColor(text, color);

    Text_DrawString(text, GetItemName(item));

    color = (name_color == TEXT_COLOR_SYSTEM_GRAY) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE;
    PutSpecialChar(tm + 12, color, TEXT_SPECIAL_SLASH);

    color = (name_color != TEXT_COLOR_SYSTEM_GRAY) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY;
    PutNumberOrBlank(tm + 11, color, GetItemUses(item));
    PutNumberOrBlank(tm + 14, color, GetItemMaxUses(item));

    PutText(text, tm + 2);

    PutIcon(tm, GetItemIcon(item), 0x4000);
}

u16 GetItemAfterUse(int item) {
    if (GetItemAttributes(item) & ITEM_ATTR_UNBREAKABLE)
        return item; // unbreakable items don't loose uses!

    item -= (1 << 8); // lose one use

    if (item < (1 << 8))
        return 0; // return no item if uses < 0

    return item; // return used item
}

u16 GetUnitEquippedWeapon(Unit_t* unit) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (CanUnitUseWeapon(unit, unit->items[i]) == TRUE)
            return unit->items[i];

    return 0;
}

int GetUnitEquippedWeaponSlot(Unit_t* unit) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (CanUnitUseWeaponNow(unit, unit->items[i]) == TRUE)
            return i;

    return -1;
}

i8 CanItemReachDistance(int item, int range) {
    int min = GetItemMinRange(item);
    int max = GetItemMaxRange(item);

    if ((min <= range) && (range <= max))
        return TRUE;

    return FALSE;
}

void UnitEquipItemSlot(Unit_t* unit, int itemSlot) {
    int item, i;

    item = unit->items[itemSlot];

    for (i = itemSlot; i != 0; --i)
        unit->items[i] = unit->items[i - 1];

    unit->items[0] = item;
}

i8 IsItemEffectiveAgainst(u16 item, Unit_t* unit) {
    if (unit->jinfo) {
        int jid = unit->jinfo->id;
        const u8* effList = GetItemEffectiveness(item);

        if (!effList)
            return FALSE;

        for (; *effList; ++effList)
            if (*effList == jid)
                // NOTE: maybe there's a better way to make this work (using an inline maybe?)
                goto check_flying_effectiveness_negation;

        return FALSE;

        check_flying_effectiveness_negation: { 
            u32 attributes;
            int i;

            if (GetItemEffectiveness(item) != gUnknown_088ADF2A)
                if (GetItemEffectiveness(item) != gUnknown_088ADEF1)
                    return TRUE;

            attributes = 0;

            for (i = 0; i < UNIT_ITEM_COUNT; ++i)
                attributes = attributes | GetItemAttributes(unit->items[i]);

            if (!(attributes & ITEM_ATTR_NEGATE_FLYING))
                return TRUE;
            else
                return FALSE;
        }
    }

    return FALSE;
}

i8 IsUnitEffectiveAgainst(Unit_t* actor, Unit_t* target) {
    int actorClass = actor->jinfo->id;
    int targetClass = target->jinfo->id;

    const u8* effList = NULL;

    switch (actorClass) {

    case 0x2B:
    case 0x2C:
        effList = gUnknown_088ADF39;
        break;

    } // switch (actorClass)

    if (!effList)
        return FALSE;

    for (; *effList; ++effList)
        if (*effList == targetClass)
            // NOTE: see note in IsItemEffectiveAgainst
            goto is_effective;

    return FALSE;

    is_effective:
        return TRUE;
}

char const* GetItemRangeString(int item) {
    int rangeTextIdLookup[10] = {
        // TODO: TEXT ID CONSTANTS
        0x522, 0x523, 0x524, 0x525, 0x526, // 0-Mag/2, 1, 1-2, 1-3, 2
        0x527, 0x528, 0x529, 0x52A, 0x52B, // 2-3, 3-10, 3-15, Total, --
    };

    switch (GetItemEncodedRange(item)) {

    case 0x10: // 1-mag/2
        return GetMsg(rangeTextIdLookup[0]);

    case 0x11: // 1-1
        return GetMsg(rangeTextIdLookup[1]);

    case 0x12: // 1-2
        return GetMsg(rangeTextIdLookup[2]);

    case 0x13: // 1-3
        return GetMsg(rangeTextIdLookup[3]);

    case 0x22: // 2-2
        return GetMsg(rangeTextIdLookup[4]);

    case 0x23: // 2-3
        return GetMsg(rangeTextIdLookup[5]);

    case 0x3A: // 3-10
        return GetMsg(rangeTextIdLookup[6]);

    case 0x3F: // 3-15
        return GetMsg(rangeTextIdLookup[7]);

    case 0xFF: // total
        return GetMsg(rangeTextIdLookup[8]);

    default: // bad
        return GetMsg(rangeTextIdLookup[9]);

    } // switch (GetItemEncodedRange(item))
}

int GetWeaponLevelFromExp(int wexp) {
    if (wexp < WEAPON_EXP_E)
        return WEAPON_LEVEL_0;

    if (wexp < WEAPON_EXP_D)
        return WEAPON_LEVEL_E;

    if (wexp < WEAPON_EXP_C)
        return WEAPON_LEVEL_D;

    if (wexp < WEAPON_EXP_B)
        return WEAPON_LEVEL_C;

    if (wexp < WEAPON_EXP_A)
        return WEAPON_LEVEL_B;

    if (wexp < WEAPON_EXP_S)
        return WEAPON_LEVEL_A;

    return WEAPON_LEVEL_S;
}

char const* GetItemWeaponLevelString(int item) {
    int rankTextIdLookup[] = {
        // TODO: TEXT ID CONSTANTS
        0x52C, 0x52D, 0x52E, 0x52F, // --, E, D, C
        0x530, 0x531, 0x532, 0x533, // B, A, S, Prf
    };

    // reuse of the same variable for different purposes :/
    int var = GetItemRequiredExp(item);

    if ((GetItemAttributes(item) & ITEM_ATTR_LOCK_ANY) && GetWeaponLevelFromExp(var) == WEAPON_LEVEL_0)
        var = 7;
    else
        var = GetWeaponLevelFromExp(var);

    return GetMsg(rankTextIdLookup[var]);
}

int GetWeaponLevelSpecialCharFromExp(int wexp)
{
    u8 specials[] =
    {
        [WEAPON_LEVEL_0] = TEXT_SPECIAL_DASH,
        [WEAPON_LEVEL_E] = TEXT_SPECIAL_E,
        [WEAPON_LEVEL_D] = TEXT_SPECIAL_D,
        [WEAPON_LEVEL_C] = TEXT_SPECIAL_C,
        [WEAPON_LEVEL_B] = TEXT_SPECIAL_B,
        [WEAPON_LEVEL_A] = TEXT_SPECIAL_A,
        [WEAPON_LEVEL_S] = TEXT_SPECIAL_S,
    };

    return specials[GetWeaponLevelFromExp(wexp)];
}

char const* GetItemKindString(int kind) {
    int wtypeTextIdLookup[] = {
        // TODO: TEXT ID CONSTANTS
        0x505, 0x506, 0x507, 0x508, // Sword, Lance, Axe, Box
        0x509, 0x50A, 0x50B, 0x50C, // Staff, Anima, Light, Dark
        0x50D, 0x50E, 0x50F,        // Item, Bllsta, Dragon
    };

    return GetMsg(wtypeTextIdLookup[kind]);
}

void GetWeaponExpProgression(int wexp, int* val_out, int* max_out)
{
    switch (GetWeaponLevelFromExp(wexp))
    {

    case WEAPON_LEVEL_0:
        *val_out = 0;
        *max_out = 0;
        return;

    case WEAPON_LEVEL_E:
        *val_out = wexp         - WEAPON_EXP_E;
        *max_out = WEAPON_EXP_D - WEAPON_EXP_E;
        return;

    case WEAPON_LEVEL_D:
        *val_out = wexp         - WEAPON_EXP_D;
        *max_out = WEAPON_EXP_C - WEAPON_EXP_D;
        return;

    case WEAPON_LEVEL_C:
        *val_out = wexp         - WEAPON_EXP_C;
        *max_out = WEAPON_EXP_B - WEAPON_EXP_C;
        return;

    case WEAPON_LEVEL_B:
        *val_out = wexp         - WEAPON_EXP_B;
        *max_out = WEAPON_EXP_A - WEAPON_EXP_B;
        return;

    case WEAPON_LEVEL_A:
        *val_out = wexp         - WEAPON_EXP_A;
        *max_out = WEAPON_EXP_S - WEAPON_EXP_A;
        return;

    case WEAPON_LEVEL_S:
        *val_out = 0;
        *max_out = 0;
        return;

    }
}

i8 IsItemDanceRing(int item) {
    switch (GetItemIid(item)) {

    case IID_HOPLON_SHIELD: // ????????
    case IID_FILLAS_MIGHT:
    case IID_NINISS_GRACE:
    case IID_THORS_IRE:
    case IID_SETS_LITANY:
        return TRUE;

    default:
        return FALSE;

    } // switch (GetItemIid(item))
}

i8 IsItemDisplayUsable(Unit_t* unit, int item) {
    if (GetItemAttributes(item) & ITEM_ATTR_WEAPON)
        return CanUnitUseWeapon(unit, item);

    if (GetItemAttributes(item) & ITEM_ATTR_STAFF)
        return CanUnitUseStaff(unit, item);

    if (GetItemEffect(item)) {
        if (unit->statusId == UNIT_STATUS_SLEEP)
            return FALSE;

        if (unit->statusId == UNIT_STATUS_BERSERK)
            return FALSE;

        if (!(UNIT_ATTRIBUTES(unit) & UNIT_ATTR_THIEF) && GetItemIid(item) == IID_LOCKPICK)
            return FALSE;

        if (!(UNIT_ATTRIBUTES(unit) & UNIT_ATTRS_REFRESH) && IsItemDanceRing(item))
            return FALSE;
    }

    return TRUE;
}

i8 CanUnitUse_unused(Unit_t* unit, int item) {
    if (GetItemAttributes(item) & ITEM_ATTR_WEAPON)
        return CanUnitUseWeapon(unit, item);
    else
        return CanUnitUseItem(unit, item);
}

int GetUnitItemHealAmount(Unit_t* unit, int item) {
    int result = 0;

    switch (GetItemIid(item)) {

    case IID_HEAL_STAFF:
    case IID_PHYSIC_STAFF:
    case IID_FORTIFY_STAFF:
    case IID_VULNERARY:
    case IID_VULNERARY_2:
        result = 10;
        break;

    case IID_MEND_STAFF:
        result = 20;
        break;

    case IID_RECOVER_STAFF:
    case IID_ELIXIR:
        result = 80;
        break;

    } // switch (GetItemIid(item))

    if (GetItemAttributes(item) & ITEM_ATTR_STAFF) {
        result += GetUnitPower(unit);

        if (result > 80)
            result = 80;
    }

    return result;
}

int FindUnitItemSlot(Unit_t* unit, int itemIndex) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (GetItemIid(unit->items[i]) == itemIndex)
            return i;

    return (-1);
}

i8 IsItemStealable(int item) {
    return (GetItemKind(item) == ITEM_KIND_ITEM);
}

i8 IsItemRepairable(int item) {
    if (!item)
        return FALSE;

    if (!(GetItemAttributes(item) & (ITEM_ATTR_WEAPON | ITEM_ATTR_STAFF)))
        return FALSE;

    if (GetItemAttributes(item) & (ITEM_ATTR_UNBREAKABLE | ITEM_ATTR_UNREPAIRABLE | ITEM_ATTR_LOCK_MONSTER))
        return FALSE;

    if (GetItemUses(item) == GetItemMaxUses(item))
        return FALSE;

    return TRUE;
}

int GetItemReach(int item) {
    switch (GetItemEncodedRange(item)) {

    case 0x11:
        return REACH_RANGE1;

    case 0x12:
        return REACH_RANGE1 | REACH_RANGE2;

    case 0x13:
        return REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3;

    case 0x14:
        return REACH_RANGE1 | REACH_TO10;

    case 0x22:
        return REACH_RANGE2;

    case 0x23:
        return REACH_RANGE2 | REACH_RANGE3;

    case 0x33:
        return REACH_RANGE3;

    case 0x3A:
        return REACH_RANGE3 | REACH_TO10;

    case 0x3F:
        return REACH_RANGE3 | REACH_TO15;

    default:
        return REACH_NONE;

    } // switch (GetItemEncodedRange(item))
}

int GetUnitWeaponReach(Unit_t* unit, int itemSlot) {
    int i, item, result = 0;

    if (itemSlot >= 0)
        return GetItemReach(unit->items[itemSlot]);

    for (i = 0; (i < UNIT_ITEM_COUNT) && (item = unit->items[i]); ++i)
        if (CanUnitUseWeapon(unit, item))
            result |= GetItemReach(item);

    return result;
}

int GetUnitItemUseReach(Unit_t* unit, int itemSlot) {
    int i, tmp, range = 0;

    if (itemSlot >= 0) {
        tmp = unit->items[itemSlot];

        if (!CanUnitUseItem(unit, tmp))
            return REACH_NONE;

        range = GetItemMaxRange(tmp);

        if (range == 0)
            range = 99;
    } else {
        for (i = 0; (i < UNIT_ITEM_COUNT) && (tmp = unit->items[i]); ++i) {
            if (CanUnitUseItem(unit, tmp)) {
                tmp = GetItemMaxRange(tmp);

                if (tmp == 0)
                    tmp = 99;

                if (range < tmp)
                    range = tmp;
            }
        }
    }

    switch (range) {

    case 1:
        return REACH_RANGE1;

    case 2:
        return REACH_RANGE1 | REACH_RANGE2;

    case 99:
        return REACH_MAGBY2;

    default:
        return REACH_NONE;

    } // switch (range)
}

int GetUnitStaffReach(Unit_t* unit) {
    int i, tmp, range = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && (tmp = unit->items[i]); ++i) {
        if (CanUnitUseStaff(unit, tmp)) {
            if (GetItemIid(tmp) == IID_NIGHTMARE) {
                tmp = 99;
            } else {
                tmp = GetItemMaxRange(tmp);

                if (tmp == 0)
                    tmp = 99;
            }

            if (range < tmp)
                range = tmp;
        }
    }

    switch (range) {

    case 1:
        return REACH_RANGE1;

    case 2:
        return REACH_RANGE1 | REACH_RANGE2;

    case 99:
        return REACH_MAGBY2;

    default:
        return REACH_NONE;

    } // switch (range)
}

int GetTotalConvoyItemsValue(void) {
    int i, result = 0;

    const u16* convoy = GetConvoyItemArray();

    for (i = 0; (i < CONVOY_ITEM_COUNT) && (*convoy); ++i) {
        result += GetItemCost(*convoy);
        convoy++;
    }

    return result;
}

int GetTotalUnitItemsValue(void) {
    int i, j, item, result = 0;

    for (i = 1; i < 0x40; ++i) {
        Unit_t* unit = GetUnit(i);

        if (!unit)
            continue;

        if (!unit->pinfo)
            continue;

        if (unit->flags & (UNIT_FLAG_DEAD | UNIT_FLAG_AWAY))
            continue;

        for (j = 0; (j < UNIT_ITEM_COUNT) && (item = unit->items[j]); ++j)
            result += GetItemCost(item);
    }

    return result;
}

int GetTotalTeamGoldValue(void) {
    int result = 0;

    result += GetTotalConvoyItemsValue();
    result += GetTotalUnitItemsValue();
    result += GetGold();

    if (result > 9999999) // TODO: use a constant?
        result = 9999999;

    return result;
}

void DeclareItemUnsealedForPid(int item, u8 pid) {
    SetChapterSealPid(GetItemKind(item), pid);
}

i8 IsItemUnsealedForUnit(Unit_t* unit, int item) {
    return (GetChapterSealPid(GetItemKind(item)) == unit->pinfo->id) ? TRUE : FALSE;
}
