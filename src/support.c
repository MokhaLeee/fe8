#include "support.h"

static int CONST_DATA sSupportMaxExpLookup[] =
{
    [SUPPORT_LEVEL_NONE] = SUPPORT_EXP_C-1,
    [SUPPORT_LEVEL_C]    = SUPPORT_EXP_B-1,
    [SUPPORT_LEVEL_B]    = SUPPORT_EXP_A-1,
    [SUPPORT_LEVEL_A]    = SUPPORT_EXP_A
};

static const struct SupportBonuses* GetAffinityBonuses(int affinity);
static void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level);
static void InitSupportBonuses(struct SupportBonuses* bonuses);

static void SetSupportLevelGained(u8 pid_a, u8 pid_b);
static i8 HasUnitGainedSupportLevel(Unit_t* unit, int num);

int GetUnitSupportCount(Unit_t* unit)
{
    if (!UNIT_SUPPORT_INFO(unit))
        return 0;

    return UNIT_SUPPORT_INFO(unit)->count;
}

u8 GetUnitSupportPid(Unit_t* unit, int num)
{
    if (!UNIT_SUPPORT_INFO(unit))
        return 0;

    return UNIT_SUPPORT_INFO(unit)->pids[num];
}

Unit_t* GetUnitSupportUnit(Unit_t* unit, int num)
{
    u8 pid = GetUnitSupportPid(unit, num);

    int i, last;

    for (i = UNIT_FACTION(unit) + 1, last = UNIT_FACTION(unit) + 0x40; i < last; ++i)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pinfo->id == pid)
            return unit;
    }

    return NULL;
}

int GetUnitSupportLevel(Unit_t* unit, int num)
{
    int supportExp = unit->supports[num];

    if (supportExp > 240)
        return SUPPORT_LEVEL_A;

    if (supportExp > 160)
        return SUPPORT_LEVEL_B;

    if (supportExp > 80)
        return SUPPORT_LEVEL_C;

    return SUPPORT_LEVEL_NONE;
}

int GetUnitTotalSupportLevel(Unit_t* unit)
{
    int i, count, result;

    count = GetUnitSupportCount(unit);

    for (i = 0, result = 0; i < count; ++i)
    {
        result += GetUnitSupportLevel(unit, i);
    }

    return result;
}

void UnitGainSupportExp(Unit_t* unit, int num)
{
    if (UNIT_SUPPORT_INFO(unit))
    {
        int gain = UNIT_SUPPORT_INFO(unit)->exp_growth[num];
        int currentExp = unit->supports[num];
        int maxExp = sSupportMaxExpLookup[GetUnitSupportLevel(unit, num)];

        if (currentExp + gain > maxExp)
            gain = maxExp - currentExp;

        unit->supports[num] = currentExp + gain;
        gPlaySt.chapterTotalSupportGain += gain;
    }
}

void UnitGainSupportLevel(Unit_t* unit, int num)
{
    unit->supports[num]++;
    gPlaySt.chapterTotalSupportGain++;

    SetSupportLevelGained(unit->pinfo->id, GetUnitSupportPid(unit, num));
}

i8 CanUnitSupportNow(Unit_t* unit, int num)
{
    int exp, maxExp;

    if (gPlaySt.chapterStateBits & CHAPTER_FLAG_7)
        return FALSE;

    if (gPlaySt.chapterStateBits & CHAPTER_FLAG_3)
        return FALSE;

    if (HasUnitGainedSupportLevel(unit, num))
        return FALSE;

    if (GetUnitTotalSupportLevel(unit) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
        return FALSE;

    if (GetUnitTotalSupportLevel(GetUnitSupportUnit(unit, num)) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
        return FALSE;

    exp    = unit->supports[num];
    maxExp = sSupportMaxExpLookup[GetUnitSupportLevel(unit, num)];

    if (exp == SUPPORT_EXP_A)
        return FALSE;

    return (exp == maxExp) ? TRUE : FALSE;
}

int GetUnitInitialSupportExp(Unit_t* unit, int num)
{
    if (!UNIT_SUPPORT_INFO(unit))
        return -1;

    return UNIT_SUPPORT_INFO(unit)->exp_base[num];
}

int GetUnitSupportNumByPid(Unit_t* unit, u8 pid)
{
    int i, count = GetUnitSupportCount(unit);

    for (i = 0; i < count; ++i)
    {
        if (GetUnitSupportPid(unit, i) == pid)
            return i;
    }

    return -1;
}

void ClearUnitSupports(Unit_t* unit)
{
    int i, count = GetUnitSupportCount(unit);

    for (i = 0; i < count; ++i)
    {
        Unit_t* other = GetUnitSupportUnit(unit, i);

        if (!other)
            continue;

        other->supports[GetUnitSupportNumByPid(other, unit->pinfo->id)] = 0;
        unit->supports[i] = 0;
    }
}

void DoTurnSupportExp(void)
{
    int i, j, jMax;

    if (gPlaySt.chapterTurnNumber == 1)
        return;

    if (gPlaySt.chapterStateBits & CHAPTER_FLAG_7)
        return;

    for (i = 1; i < 0x40; ++i)
    {
        Unit_t* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->flags & UNIT_FLAGS_UNAVAILABLE)
            continue;

        if (GetUnitTotalSupportLevel(unit) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
            continue;

        jMax = GetUnitSupportCount(unit);

        for (j = 0; j < jMax; ++j)
        {
            Unit_t* other = GetUnitSupportUnit(unit, j);

            if (!other)
                continue;

            if (other->flags & UNIT_FLAGS_UNAVAILABLE)
                continue;

            if (UNIT_FACTION(other) != FACTION_BLUE)
                continue;

            switch (RECT_DISTANCE(unit->x, unit->y, other->x, other->y))
            {

            case 0:
                if (!(unit->rescue == other->id))
                    break;

                goto add_support_points;

            case 1:
                if ((unit->flags & UNIT_FLAG_RESCUED) || (other->flags & UNIT_FLAG_RESCUED))
                    break;

            add_support_points:
                if (GetUnitTotalSupportLevel(other) < MAX_SIMULTANEOUS_SUPPORT_COUNT)
                    UnitGainSupportExp(unit, j);

                break;

            }
        }
    }
}

static const struct SupportBonuses* GetAffinityBonuses(int affinity)
{
    const struct SupportBonuses* it;

    for (it = gAffinityBonuses; it->affinity; ++it)
    {
        if (it->affinity == affinity)
            return it;
    }

    // return NULL; // BUG?
}

static void ApplyAffinitySupportBonuses(struct SupportBonuses* bonuses, int affinity, int level)
{
    const struct SupportBonuses* added = GetAffinityBonuses(affinity);

    bonuses->bonus_attack  += level * added->bonus_attack;
    bonuses->bonus_defense += level * added->bonus_defense;
    bonuses->bonus_hit     += level * added->bonus_hit;
    bonuses->bonus_avoid   += level * added->bonus_avoid;
    bonuses->bonus_crit    += level * added->bonus_crit;
    bonuses->bonus_dodge   += level * added->bonus_dodge;
}

static void InitSupportBonuses(struct SupportBonuses* bonuses)
{
    bonuses->bonus_attack  = 0;
    bonuses->bonus_defense = 0;
    bonuses->bonus_hit     = 0;
    bonuses->bonus_avoid   = 0;
    bonuses->bonus_crit    = 0;
    bonuses->bonus_dodge   = 0;
}

int GetUnitSupportBonuses(Unit_t* unit, struct SupportBonuses* bonuses)
{
    int i, count;
    int result = 0;

    InitSupportBonuses(bonuses);

    count = GetUnitSupportCount(unit);

    for (i = 0; i < count; ++i)
    {
        Unit_t* other;
        int level1, level2;

        result = result >> 1;
        other = GetUnitSupportUnit(unit, i);

        if (!other)
            continue;

        // TODO: gameStateBits constants
        if (!(gBmSt.gameStateBits & 0x40))
        {
            if (RECT_DISTANCE(unit->x, unit->y, other->x, other->y) > SUPPORT_BONUSES_MAX_DISTANCE)
                continue;
        }

        if (other->flags & (UNIT_FLAGS_UNAVAILABLE | UNIT_FLAG_RESCUED))
            continue;

        level1 = GetUnitSupportLevel(other, GetUnitSupportNumByPid(other, unit->pinfo->id));
        ApplyAffinitySupportBonuses(bonuses, other->pinfo->affinity, level1);

        level2 = GetUnitSupportLevel(unit, i);
        ApplyAffinitySupportBonuses(bonuses, unit->pinfo->affinity, level2);

        if (level1 != 0 && level2 != 0)
            result += 1 << (count - 1);
    }

    bonuses->bonus_attack  /= 2;
    bonuses->bonus_defense /= 2;
    bonuses->bonus_hit     /= 2;
    bonuses->bonus_avoid   /= 2;
    bonuses->bonus_crit    /= 2;
    bonuses->bonus_dodge   /= 2;

    return result;
}

int GetUnitAffinityIcon(Unit_t* unit)
{
    int affinity = unit->pinfo->affinity;

    if (!affinity)
        return -1;

    return 0x79 + affinity; // TODO: ICON CONSTANTS
}

int GetAffinityIconByPid(int characterId)
{
    int affinity = GetPInfo(characterId)->affinity;

    if (!affinity)
        return -1;

    return 0x79 + affinity; // TODO: ICON CONSTANTS
}

int GetSupportLevelSpecialChar(int level)
{
    u8 chars[4] = {
        // TODO: special char constant definitions
        0x14, 0x1B, 0x1A, 0x19
    };

    return chars[level];
}

char const* GetAffinityName(int affinity)
{
    int textIdLookup[] = {
        // TODO: text ids
        0x534, 0x510, 0x511, 0x512, 0x513, 0x50C, 0x50B, 0x50A
    };

    return GetMsg(textIdLookup[affinity]);
}

static void SetSupportLevelGained(u8 pid_a, u8 pid_b)
{
    Unit_t* unit = GetUnitByPid(pid_a);
    int num = GetUnitSupportNumByPid(unit, pid_b);

    unit->supportBits |= (1 << num);

    unit = GetUnitByPid(pid_b);
    num = GetUnitSupportNumByPid(unit, pid_a);

    unit->supportBits |= (1 << num);
}

static bool HasUnitGainedSupportLevel(Unit_t* unit, int num)
{
    i8 result = unit->supportBits & (1 << num);
    return result ? TRUE : FALSE;
}

bool ReachedMaxSupportByPids(u8 pid_a, u8 pid_b)
{
    Unit_t* unit = GetUnitByPid(pid_a);

    if (GetUnitSupportLevel(unit, GetUnitSupportNumByPid(unit, pid_b)) > SUPPORT_LEVEL_B)
        return TRUE;

    return FALSE;
}

void SwapUnitStats(Unit_t* unitA, Unit_t* unitB)
{
    if (unitA && unitB)
    {
        #define SWAP(aType, aLValueA, aLValueB) \
        do { \
            aType tmp; \
            tmp = (aLValueA); \
            (aLValueA) = (aLValueB); \
            (aLValueB) = tmp; \
        } while (0)

        SWAP(u8, unitA->level, unitB->level);
        SWAP(u8, unitA->exp, unitB->exp);

        SWAP(u8, unitA->maxHP, unitB->maxHP);
        SWAP(u8, unitA->curHP, unitB->curHP);
        SWAP(u8, unitA->pow, unitB->pow);
        SWAP(u8, unitA->skl, unitB->skl);
        SWAP(u8, unitA->spd, unitB->spd);
        SWAP(u8, unitA->def, unitB->def);
        SWAP(u8, unitA->res, unitB->res);
        SWAP(u8, unitA->lck, unitB->lck);
        SWAP(u8, unitA->con_bonus, unitB->con_bonus);
        SWAP(u8, unitA->mov_bonus, unitB->mov_bonus);

        SWAP(u16, unitA->items[0], unitB->items[0]);
        SWAP(u16, unitA->items[1], unitB->items[1]);
        SWAP(u16, unitA->items[2], unitB->items[2]);
        SWAP(u16, unitA->items[3], unitB->items[3]);
        SWAP(u16, unitA->items[4], unitB->items[4]);

        #undef SWAP
    }
}
