#pragma once

#include "global.h"

#include "unit.h"

enum { MAX_SIMULTANEOUS_SUPPORT_COUNT = 5 };
enum { SUPPORT_BONUSES_MAX_DISTANCE = 3 };

enum
{
    SUPPORT_LEVEL_NONE,
    SUPPORT_LEVEL_C,
    SUPPORT_LEVEL_B,
    SUPPORT_LEVEL_A,
};

enum
{
    SUPPORT_EXP_C = 81,
    SUPPORT_EXP_B = 161,
    SUPPORT_EXP_A = 241,
};

struct SupportInfo
{
    /* 00 */ u8 pids[UNIT_SUPPORT_COUNT];
    /* 07 */ u8 exp_base[UNIT_SUPPORT_COUNT];
    /* 0E */ u8 exp_growth[UNIT_SUPPORT_COUNT];
    /* 15 */ u8 count;
};

struct SupportBonuses
{
    /* 00 */ u8 affinity;
    /* 01 */ u8 bonus_attack;
    /* 02 */ u8 bonus_defense;
    /* 03 */ u8 bonus_hit;
    /* 04 */ u8 bonus_avoid;
    /* 05 */ u8 bonus_crit;
    /* 06 */ u8 bonus_dodge;
};

int GetUnitSupportCount(Unit_t* unit);
u8 GetUnitSupportPid(Unit_t* unit, int num);
Unit_t* GetUnitSupportUnit(Unit_t* unit, int num);
int GetUnitSupportLevel(Unit_t* unit, int num);
int GetUnitTotalSupportLevel(Unit_t* unit);
void UnitGainSupportExp(Unit_t* unit, int num);
void UnitGainSupportLevel(Unit_t* unit, int num);
bool CanUnitSupportNow(Unit_t* unit, int num);
int GetUnitInitialSupportExp(Unit_t* unit, int num);
int GetUnitSupportNumByPid(Unit_t* unit, u8 pid);
void ClearUnitSupports(Unit_t* unit);
void DoTurnSupportExp(void);
int GetUnitSupportBonuses(Unit_t* unit, struct SupportBonuses* bonuses);
int GetUnitAffinityIcon(Unit_t* unit);
int GetAffinityIconByPid(int pid);
int GetSupportLevelSpecialChar(int level);
char const* GetAffinityName(int affinity);
bool ReachedMaxSupportByPids(u8 pid_a, u8 pib_b);
void SwapUnitStats(Unit_t* unit_a, Unit_t* unit_b);
