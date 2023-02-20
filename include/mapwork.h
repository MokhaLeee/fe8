#pragma once

#include "global.h"
#include "unit.h"

struct MapFloodSquareEnt
{
    /* 00 */ i8 x;
    /* 01 */ i8 y;
    /* 02 */ u8 connect;
    /* 03 */ u8 least_move;
};

typedef struct MapFloodSquareEnt MapFloodSquareEnt_t;

struct MapFloodSt
{
    /* 00 */ MapFloodSquareEnt_t* active_queue;
    /* 04 */ MapFloodSquareEnt_t* waiting_queue;
    /* 08 */ bool has_unit;
    /* 09 */ u8 movement;
    /* 0A */ u8 unit_id;
    /* 0B */ u8 max_move;
};

typedef struct MapFloodSt MapFloodSt_t;

void SetWorkingMap(u8** map);
void MapFloodUnit(Unit_t* unit);
void MapFloodUnitMovement(Unit_t* unit, i8 movement);
void MapFloodUnitExtended(Unit_t* unit);
void MapFloodExtendedOnRangeMap(int x, int y, i8 const move_table[]);
void MapFloodExtended(int x, int y, i8 const move_table[]);
void MapFloodOnWorkingMap(Unit_t* unit, int x, int y, int movement);
void SetWorkingMoveTable(i8 const move_table[]);
void BeginMapFlood(int x, int y, int movement, int unit_id);
void MapFloodCoreStep_unused(int connect, int x, int y);
void BuildBestMoveScript(int x, int y, u8 output[]);
void ApplyWorkingMoveScriptToAction(Unit_t* unit, int x, int y);
void MapMovementMarkFloodEdges(void);
void MapMarkFloodEdges(void);
void MapAddInRange(int x, int y, int range, int value);
void MapSetInRange(int x, int y, int range, int value);
void MapIncInBoundedRange(short x, short y, short min, short max);
void BuildUnitCompleteAttackRange(Unit_t* unit);
void BuildUnitStandingRangeForReach(Unit_t* unit, int reach);
void BuildUnitCompleteStaffRange(Unit_t* unit);
void BuildDangerZoneRange(bool is_staff_range);
void BuildMagicSealRange(int value);
i8 const* GetWorkingMoveTable(void);

extern u8** gWorkingMap;
extern u8 gWorkingMoveTable[];

extern MapFloodSt_t gMapFloodSt;
extern MapFloodSquareEnt_t gMapFloodSquareBufA[];
extern MapFloodSquareEnt_t gMapFloodSquareBufB[];

#define gWorkingMapSigned ((i8**) gWorkingMap)
