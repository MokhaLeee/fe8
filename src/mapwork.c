#include "mapwork.h"

// TODO [2021-10-02]: clean up and update to stan standards

#include "constants/terrains.h"

#include "random.h"
#include "armfunc.h"
#include "item.h"
#include "unit.h"
#include "map.h"
#include "proc.h"
#include "mu.h"

static void RevertMovementScript(u8* begin, u8* end);

inline void SetWorkingMap(u8** map)
{
    gWorkingMap = map;
}

void MapFloodUnit(Unit_t* unit)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));
    SetWorkingMap(gMapMovement);

    BeginMapFlood(unit->x, unit->y, UNIT_MOV(unit), unit->id);
}

void MapFloodUnitMovement(Unit_t* unit, i8 movement)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));
    SetWorkingMap(gMapMovement);

    BeginMapFlood(unit->x, unit->y, movement, unit->id);
}

void MapFloodUnitExtended(Unit_t* unit)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));
    SetWorkingMap(gMapMovement);

    BeginMapFlood(unit->x, unit->y, MAP_MOVEMENT_EXTENDED, 0);
}

void MapFloodExtendedOnRangeMap(int x, int y, i8 const move_table[TERRAIN_COUNT])
{
    SetWorkingMoveTable(move_table);
    SetWorkingMap(gMapRange);

    BeginMapFlood(x, y, MAP_MOVEMENT_EXTENDED, 0);
}

void MapFloodExtended(int x, int y, i8 const move_table[TERRAIN_COUNT])
{
    SetWorkingMoveTable(move_table);
    SetWorkingMap(gMapMovement);

    BeginMapFlood(x, y, MAP_MOVEMENT_EXTENDED, 0);
}

void MapFloodOnWorkingMap(Unit_t* unit, int x, int y, int movement)
{
    SetWorkingMoveTable(GetUnitMovementCost(unit));

    BeginMapFlood(x, y, movement, unit->id);
}

void SetWorkingMoveTable(const i8 move_table[TERRAIN_COUNT])
{
    int i;

    for (i = 0; i < TERRAIN_COUNT; ++i)
        gWorkingMoveTable[i] = move_table[i];
}

void BeginMapFlood(int x, int y, int movement, int unit_id)
{
    gMapFloodSt.waiting_queue = gMapFloodSquareBufA;
    gMapFloodSt.active_queue = gMapFloodSquareBufB;

    gMapFloodSt.movement = movement;

    if (unit_id == 0)
    {
        gMapFloodSt.has_unit = FALSE;
    }
    else
    {
        gMapFloodSt.has_unit = TRUE;
        gMapFloodSt.unit_id = unit_id;
    }

    gMapFloodSt.max_move = MAP_MOVEMENT_MAX;

    MapFill(gWorkingMap, -1);

    gMapFloodSt.waiting_queue->x = x;
    gMapFloodSt.waiting_queue->y = y;
    gMapFloodSt.waiting_queue->connect = 5;
    gMapFloodSt.waiting_queue->least_move = 0;

    gWorkingMap[y][x] = 0;

    gMapFloodSt.waiting_queue++;
    gMapFloodSt.waiting_queue->connect = 4;

    MapFloodCore();
}

void MapFloodCoreStep_unused(int connect, int x, int y)
{
    // This is a C implementation of the ARM (asm) function MapFloodCoreStep
    // Probably used during testing before switching to the a more "optimal" version.

    short tileMovementCost;

    x += gMapFloodSt.active_queue->x;
    y += gMapFloodSt.active_queue->y;

    tileMovementCost = gWorkingMoveTable[gMapTerrain[y][x]]
        + (i8) gWorkingMap[(u8) gMapFloodSt.active_queue->y][(u8) gMapFloodSt.active_queue->x];

    if (tileMovementCost >= gWorkingMap[y][x])
        return;

    if (gMapFloodSt.has_unit && gMapUnit[y][x])
        if ((gMapUnit[y][x] ^ gMapFloodSt.unit_id) & 0x80)
            return;

    if (tileMovementCost > gMapFloodSt.movement)
        return;

    gMapFloodSt.waiting_queue->x = x;
    gMapFloodSt.waiting_queue->y = y;
    gMapFloodSt.waiting_queue->connect = connect;
    gMapFloodSt.waiting_queue->least_move = tileMovementCost;

    gMapFloodSt.waiting_queue++;

    gWorkingMap[y][x] = tileMovementCost;
}

void BuildBestMoveScript(int x, int y, u8 output[])
{
    u8* outputStart = output;

    short bestCost;
    short bestDirectionCount;

    u8 neighbourCosts[4];
    u8 bestDirections[4];

    short nextDirection = 0;

    int i;

    // The basic algorithm here is:
    // 1. start from the end point
    // 2. get on the point that's closest to the origin (lowest cost)
    // 3. write direction to output
    // 4. repeat 2-4 until we reached origin (cost = 0)
    // 5. reverse and terminate output

    // As we build the list *in reverse*, the directions are also "reversed" as we traverse the path.

    while (gWorkingMapSigned[y][x] != 0)
    {
        // Build neighbor cost list

        if (x == (gMapSize.x - 1))
            neighbourCosts[MU_COMMAND_MOVE_LEFT] |= 0xFF;
        else
            neighbourCosts[MU_COMMAND_MOVE_LEFT] = gWorkingMap[y][x+1];

        if (x == 0)
            neighbourCosts[MU_COMMAND_MOVE_RIGHT] |= 0xFF;
        else
            neighbourCosts[MU_COMMAND_MOVE_RIGHT] = gWorkingMap[y][x-1];

        if (y == (gMapSize.y - 1))
            neighbourCosts[MU_COMMAND_MOVE_UP] |= 0xFF;
        else
            neighbourCosts[MU_COMMAND_MOVE_UP] = gWorkingMap[y+1][x];

        if (y == 0)
            neighbourCosts[MU_COMMAND_MOVE_DOWN] |= 0xFF;
        else
            neighbourCosts[MU_COMMAND_MOVE_DOWN] = gWorkingMap[y-1][x];

        // find best cost

        bestCost = 0x100;
        bestDirectionCount = 0;

        for (i = 0; i < 4; ++i)
            if (bestCost > neighbourCosts[i])
                bestCost = neighbourCosts[i];

        // list all directions that have best cost

        for (i = 0; i < 4; ++i)
            if (bestCost == neighbourCosts[i])
                bestDirections[bestDirectionCount++] = i;

        // get next direction (choose randomly if necessary)

        switch (bestDirectionCount)
        {

        case 1:
            nextDirection = bestDirections[0];
            break;

        case 2:
            nextDirection = bestDirections[RandNext(2)];
            break;

        case 3:
            nextDirection = bestDirections[RandNext(3)];
            break;

        case 4:
            nextDirection = bestDirections[RandNext(4)];
            break;

        } // switch (bestDirectionCount)

        // write next direction

        *output++ = nextDirection;

        // update position given direction
        // reminder: directions are reversed

        switch (nextDirection)
        {

        case MU_COMMAND_MOVE_LEFT:
            x++;
            break;

        case MU_COMMAND_MOVE_RIGHT:
            x--;
            break;

        case MU_COMMAND_MOVE_UP:
            y++;
            break;

        case MU_COMMAND_MOVE_DOWN:
            y--;
            break;

        } // switch (nextDirection)
    }

    // reverse and terminate output
    RevertMovementScript(outputStart, output);
}

void RevertMovementScript(u8* begin, u8* end)
{
    u8 buffer[MU_COMMAND_MAX_COUNT];

    u8* it = buffer;

    while (end > begin)
        *it++ = *--end;

    *it = MU_COMMAND_HALT;

    for (it = buffer; *it != MU_COMMAND_HALT;)
        *begin++ = *it++;

    *begin = MU_COMMAND_HALT;
}

void ApplyWorkingMoveScriptToAction(Unit_t* unit, int x, int y)
{
    u8* it = gUnitMoveBuffer;

    for (;;) {
        gAction.xMove = x;
        gAction.yMove = y;

        switch (*it)
        {

        case MU_COMMAND_MOVE_UP: // up
            y--;
            break;

        case MU_COMMAND_MOVE_DOWN: // down
            y++;
            break;

        case MU_COMMAND_MOVE_LEFT: // left
            x--;
            break;

        case MU_COMMAND_MOVE_RIGHT: // right
            x++;
            break;

        } // switch (*it)

        if (!(UNIT_ATTRIBUTES(unit) & (UNIT_ATTR_THIEF | UNIT_ATTRS_FLYING | UNIT_ATTR_ASSASSIN)))
        {
            if (gMapHidden[y][x] & HIDDEN_BIT_TRAP)
            {
                *++it = MU_COMMAND_HALT;

                gAction.unitActionType = UNIT_ACTION_TRAPPED;
                gAction.xMove = x;
                gAction.yMove = y;

                return;
            }
        }

        if (gMapHidden[y][x] & HIDDEN_BIT_UNIT)
        {
            *it++ = MU_COMMAND_BUMP;
            *it++ = MU_COMMAND_HALT;

            gAction.unitActionType = UNIT_ACTION_TRAPPED;

            return;
        }

        if (*it == MU_COMMAND_HALT)
            break;

        it++;
    }
}

void MapMovementMarkFloodEdges(void) {
    int ix, iy;

    for (iy = gMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gMapSize.x - 1; ix >= 0; --ix)
        {
            if (gMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((i8) gMapMovement[iy][ix] == gMapFloodSt.max_move)
                continue;

            if ((i8) gMapMovement[iy][ix - 1] < 0 && (ix != 0))
                gMapMovement[iy][ix - 1] = gMapFloodSt.max_move;

            if ((i8) gMapMovement[iy][ix + 1] < 0 && (ix != (gMapSize.x - 1)))
                gMapMovement[iy][ix + 1] = gMapFloodSt.max_move;

            if ((i8) gMapMovement[iy - 1][ix] < 0 && (iy != 0))
                gMapMovement[iy - 1][ix] = gMapFloodSt.max_move;

            if ((i8) gMapMovement[iy + 1][ix] < 0 && (iy != (gMapSize.y - 1)))
                gMapMovement[iy + 1][ix] = gMapFloodSt.max_move;
        }
    }

    gMapFloodSt.max_move++;
}

void MapMarkFloodEdges(void)
{
    int ix, iy;

    for (iy = gMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gMapSize.x - 1; ix >= 0; --ix)
        {
            if (gWorkingMap[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((i8) gWorkingMap[iy][ix] == gMapFloodSt.max_move)
                continue;

            if ((i8) gWorkingMap[iy][ix - 1] < 0 && (ix != 0))
                gWorkingMap[iy][ix - 1] = gMapFloodSt.max_move;

            if ((i8) gWorkingMap[iy][ix + 1] < 0 && (ix != (gMapSize.x - 1)))
                gWorkingMap[iy][ix + 1] = gMapFloodSt.max_move;

            if ((i8) gWorkingMap[iy - 1][ix] < 0 && (iy != 0))
                gWorkingMap[iy - 1][ix] = gMapFloodSt.max_move;

            if ((i8) gWorkingMap[iy + 1][ix] < 0 && (iy != (gMapSize.y - 1)))
                gWorkingMap[iy + 1][ix] = gMapFloodSt.max_move;
        }
    }

    gMapFloodSt.max_move++;
}

void MapAddInRange(int x, int y, int range, int value)
{
    int ix, iy, iRange;

    // Handles rows [y, y+range]
    // For each row, decrement range
    for (iRange = range, iy = y; (iy <= y + range) && (iy < gMapSize.y); --iRange, ++iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gMapSize.x)
        {
            xMax -= (xMax - gMapSize.x);
            xMax = gMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingMap[iy][ix] += value;
        }
    }

    // Handle rows [y-range, y-1], starting from the bottom most row
    // For each row, decrement range
    for (iRange = (range - 1), iy = (y - 1); (iy >= y - range) && (iy >= 0); --iRange, --iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gMapSize.x)
        {
            xMax -= (xMax - gMapSize.x);
            xMax = gMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingMap[iy][ix] += value;
        }
    }
}

void MapSetInRange(int x, int y, int range, int value)
{
    int ix, iy, iRange;

    // Handles rows [y, y+range]
    // For each row, decrement range
    for (iRange = range, iy = y; (iy <= y + range) && (iy < gMapSize.y); --iRange, ++iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gMapSize.x)
        {
            xMax -= (xMax - gMapSize.x);
            xMax = gMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingMap[iy][ix] = value;
        }
    }

    // Handle rows [y-range, y-1], starting from the bottom most row
    // For each row, decrement range
    for (iRange = (range - 1), iy = (y - 1); (iy >= y - range) && (iy >= 0); --iRange, --iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gMapSize.x)
        {
            xMax -= (xMax - gMapSize.x);
            xMax = gMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gWorkingMap[iy][ix] = value;
        }
    }
}

inline void MapIncInBoundedRange(short x, short y, short minRange, short maxRange)
{
    MapAddInRange(x, y, maxRange,     +1);
    MapAddInRange(x, y, minRange - 1, -1);
}

void BuildUnitCompleteAttackRange(Unit_t* unit)
{
    int ix, iy;

    #define FOR_EACH_IN_MOVEMENT_RANGE(block) \
        for (iy = gMapSize.y - 1; iy >= 0; --iy) \
        { \
            for (ix = gMapSize.x - 1; ix >= 0; --ix) \
            { \
                if (gMapMovement[iy][ix] > MAP_MOVEMENT_MAX) \
                    continue; \
                if (gMapUnit[iy][ix]) \
                    continue; \
                if (gMapOther[iy][ix]) \
                    continue; \
                block \
            } \
        }

    switch (GetUnitWeaponReach(unit, -1))
    {

    case REACH_RANGE1:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 2);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 3);
        })

        break;

    case REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 2, 2);
        })

        break;

    case REACH_RANGE2 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 2, 3);
        })

        break;

    case REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 3, 3);
        })

        break;

    case REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 3, 10);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 1);
            MapIncInBoundedRange(ix, iy, 3, 3);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 1);
            MapIncInBoundedRange(ix, iy, 3, 10);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 10);
        })

        break;

    case REACH_RANGE1 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 4);
        })

        break;

    } // switch (GetUnitWeaponReach(unit, -1))

    if (UNIT_ATTRIBUTES(unit) & UNIT_ATTR_BALLISTAE)
    {
        FOR_EACH_IN_MOVEMENT_RANGE({
            int item = GetBallistaItemAt(ix, iy);

            if (item)
            {
                MapIncInBoundedRange(ix, iy,
                    GetItemMinRange(item), GetItemMaxRange(item));
            }
        })
    }

    #undef FOR_EACH_IN_MOVEMENT_RANGE

    SetWorkingMap(gMapMovement);
}

void BuildUnitStandingRangeForReach(Unit_t* unit, int reach)
{
    int x = unit->x;
    int y = unit->y;

    switch (reach)
    {

    case REACH_RANGE1:
        MapIncInBoundedRange(x, y, 1, 1);
        break;

    case REACH_RANGE1 | REACH_RANGE2:
        MapIncInBoundedRange(x, y, 1, 2);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        MapIncInBoundedRange(x, y, 1, 3);
        break;

    case REACH_RANGE2:
        MapIncInBoundedRange(x, y, 2, 2);
        break;

    case REACH_RANGE2 | REACH_RANGE3:
        MapIncInBoundedRange(x, y, 2, 3);
        break;

    case REACH_RANGE3:
        MapIncInBoundedRange(x, y, 3, 3);
        break;

    case REACH_RANGE3 | REACH_TO10:
        MapIncInBoundedRange(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE3:
        MapIncInBoundedRange(x, y, 1, 1);
        MapIncInBoundedRange(x, y, 3, 3);
        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        MapIncInBoundedRange(x, y, 1, 1);
        MapIncInBoundedRange(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        MapIncInBoundedRange(x, y, 1, 10);
        break;

    case REACH_RANGE1 | REACH_TO10:
        MapIncInBoundedRange(x, y, 1, 4);
        break;

    case REACH_MAGBY2:
        MapIncInBoundedRange(x, y, 1, GetUnitMagRange(unit));
        break;

    } // switch (reach)
}

void BuildUnitCompleteStaffRange(Unit_t* unit)
{
    int ix, iy;

    int reach = GetUnitStaffReach(unit);
    int magBy2Range = GetUnitMagRange(unit);

    #define FOR_EACH_IN_MOVEMENT_RANGE(block) \
        for (iy = gMapSize.y - 1; iy >= 0; --iy) \
        { \
            for (ix = gMapSize.x - 1; ix >= 0; --ix) \
            { \
                if (gMapMovement[iy][ix] > MAP_MOVEMENT_MAX) \
                    continue; \
                if (gMapUnit[iy][ix]) \
                    continue; \
                if (gMapOther[iy][ix]) \
                    continue; \
                block \
            } \
        }

    switch (reach)
    {

    case REACH_RANGE1:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, 2);
        })

        break;

    case REACH_MAGBY2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapIncInBoundedRange(ix, iy, 1, magBy2Range);
        })

        break;

    default:
        break;

    } // switch (reach)

    #undef FOR_EACH_IN_MOVEMENT_RANGE
}

void BuildDangerZoneRange(i8 is_staff_range)
{
    int i, enemyFaction;
    int hasMagicRank, prevHasMagicRank;
    u8 savedUnitId;

    prevHasMagicRank = -1;

    MapFill(gMapRange, 0);

    enemyFaction = IsNotEnemyPhaseMaybe();

    for (i = enemyFaction + 1; i < enemyFaction + 0x80; ++i)
    {
        Unit_t* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue; // not a unit

        if (is_staff_range && !UnitKnowsMagic(unit))
            continue; // no magic in magic range mode

        if (gPlaySt.chapterVisionRange && (gMapFog[unit->y][unit->x] == 0))
            continue; // in the fog

        if (unit->flags & UNIT_FLAG_UNDER_ROOF)
            continue; // under a roof

        // Fill movement map for unit
        MapFloodUnitMovement(unit, UNIT_MOV(unit));

        savedUnitId = gMapUnit[unit->y][unit->x];
        gMapUnit[unit->y][unit->x] = 0;

        hasMagicRank = UnitKnowsMagic(unit);

        if (prevHasMagicRank != hasMagicRank)
        {
            MapFill(gMapOther, 0);

            if (hasMagicRank)
                BuildMagicSealRange(1);

            prevHasMagicRank = hasMagicRank;
        }

        SetWorkingMap(gMapRange);

        // Apply unit's range to range map

        if (is_staff_range)
            BuildUnitCompleteStaffRange(unit);
        else
            BuildUnitCompleteAttackRange(unit);

        gMapUnit[unit->y][unit->x] = savedUnitId;
    }
}

void BuildMagicSealRange(int value)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i)
    {
        Unit_t* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_ATTRIBUTES(unit) & UNIT_ATTR_MAGICSEAL)
            MapSetInRange(unit->x, unit->y, 10, value);
    }
}

inline i8 const* GetWorkingMoveTable(void)
{
    return gWorkingMoveTable;
}
