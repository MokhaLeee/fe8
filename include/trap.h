#pragma once

#include "global.h"

#include "unit.h"

enum
{
    TRAP_COUNT = 64,
};

enum
{
    TRAP_NONE       = 0,
    TRAP_BALLISTA   = 1,
    TRAP_OBSTACLE   = 2,
    TRAP_MAPCHANGE  = 3,
    TRAP_FIRE       = 4,
    TRAP_GAS        = 5,
    TRAP_6          = 6, // TODO: figure out
    TRAP_LIGHTARROW = 7,
    TRAP_8          = 8,
    TRAP_9          = 9,
    TRAP_TORCHLIGHT = 10,
    TRAP_MINE       = 11,
    TRAP_GORGON_EGG = 12, // TODO: figure out
    TRAP_LIGHT_RUNE = 13,
};

enum
{
    // Ballista data slots
    TRAP_D_BLST_RIDDEN   = 1, // "is ridden" boolean
    TRAP_D_BLST_ITEMUSES = 2, // ballista item uses

    // Damaging Trap (Fire/Gas/Arrow) data slots
    TRAP_D_DAMAGING_DELAY    = 0, // start turn countdown
    TRAP_D_DAMAGING_INTERVAL = 1, // repeat turn countdown
    TRAP_D_DAMAGING_COUNTER  = 2, // turn counter
    TRAP_D_DAMAGING_DAMAGE   = 3, // trap damage

    // Light Rune data slots
    TRAP_D_RUNE_TURNSLEFT = 2, // turns left beofre wearing out
};

struct Trap
{
    /* 00 */ u8 x;
    /* 01 */ u8 y;

    /* 02 */ u8 kind;

    /* 03 */ u8 extra; // extra data (meaning varies based on trap type)
    /* 04 */ i8 data[4]; // more extra data (see above enum for per trap type entry allocations)
};

typedef struct Trap Trap_t;

void InitTraps(void);
Trap_t* GetTrap(int id);
Trap_t* GetTrapAt(int x, int y);
Trap_t* GetSpecificTrapAt(int x, int y, int kind);
Trap_t* AddTrap(int x, int y, int kind, int meta);
Trap_t* AddDamagingTrap(int x, int y, int kind, int meta, int turn_delay, int turn_interval, int damage);
Trap_t* RemoveTrap(Trap_t* trap);
void AddFireTrap(int x, int y, int turn_delay, int turn_interval);
void AddGasTrap(int x, int y, int facing, int turn_delay, int turn_interval);
void AddArrowTrap(int x, int turn_delay, int turn_interval);
void AddTrap6(int x, int y, int turn_delay, int turn_interval);
void AddTrap8(int x, int y);
void AddTrap9(int x, int y, int meta);
void InitMapTraps(void);
void ApplyEnabledMapChanges(void);
void ApplyEnabledLightRunes(void);
int GetObstacleHpAt(int x, int y);
struct MapChange const* GetMapChange(int id);
int GetMapChangeIdAt(int x, int y);
void ApplyMapChange(int id);
void AddMapChangeTrap(int id);
void RemoveMapChangeTrap(int id);
bool IsMapChangeEnabled(int id);
void UnitHideIfUnderRoof(Unit_t* unit);
void UpdateRoofedUnits(void);
void EnlistFireTrapTargets(int x, int y, int damage);
void EnlistArrowTrapTargets(int x, int y, int damage);
void EnlistGasTrapTargets(int x, int y, int damage, int facing);
void ListDamagingTrapTargets(void);
void ListDamagingTrapTargetsForDisplay(void);
void AdvanceDamagingTrapTurnCounter(void);
void RewindDamagingTrapTurnCounter(void);
void func_0802EA00(void);
void func_0802EA1C(void);
void func_0802EA28(void);
Trap_t* AddLightRune(int x, int y);
Trap_t* RemoveLightRune(Trap_t* trap);
void HandleTrapDecay(void);
void RevertEnabledLightRunes(void);
void RestoreEnabledLightRunes(void);

#define TRAP_ID(trap) ((trap) - GetTrap(0))
