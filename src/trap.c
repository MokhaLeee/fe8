#include "trap.h"

#include "constants/terrains.h"

#include "unit.h"
#include "map.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "mapselect.h"

static i8 ShouldSkipGasTrapDisplay(int x, int y, int facing);

EWRAM_DATA static Trap_t sTrapPool[TRAP_COUNT] = {};
EWRAM_DATA static Trap_t sTrapLast = {};

inline Trap_t* GetTrap(int id)
{
    return sTrapPool + id;
}

void InitTraps(void)
{
    int i;

    for (i = 0; i < TRAP_COUNT; ++i)
        sTrapPool[i].kind = TRAP_NONE;

    sTrapLast.kind = TRAP_NONE;
}

Trap_t* GetTrapAt(int x, int y)
{
    Trap_t* it;

lop:
    for (it = GetTrap(0); it->kind != TRAP_NONE; ++it)
    {
        // Check trap position
        if ((x == it->x) && (y == it->y))
            return it;

        // Check if we on a wall, and there is a wall above
        // In which case the trap would be on the topmost wall tile
        if (gMapTerrain[y][x] == TERRAIN_WALL_1B)
        {
            if ((y > 0) && gMapTerrain[y-1][x] == TERRAIN_WALL_1B)
            {
                y = y-1;
                goto lop;
            }
        }
    }

    return NULL;
}

Trap_t* GetSpecificTrapAt(int x, int y, int trapType)
{
    Trap_t* it;

    for (it = GetTrap(0); it->kind != TRAP_NONE; ++it)
    {
        // Check trap position
        if ((it->x == x) && (it->y == y) && (it->kind == trapType))
            return it;

        // Check if we want a wall
        if (trapType == TERRAIN_WALL_1B)
        {
            // Check if we on a wall, and there is a wall above
            // In which case the trap would be on the topmost wall tile
            if (gMapTerrain[y][x] == TERRAIN_WALL_1B)
            {
                if ((y > 0) && gMapTerrain[y-1][x] == TERRAIN_WALL_1B)
                {
                    return GetTrapAt(x, y-1);
                }
            }
        }
    }

    return NULL;
}

Trap_t* AddTrap(int x, int y, int trapType, int meta)
{
    Trap_t* trap;

    // Find first free trap
    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap) {}

    trap->x = x;
    trap->y = y;
    trap->kind = trapType;
    trap->extra = meta;

    return trap;
}

Trap_t* AddDamagingTrap(int x, int y, int trapType, int meta, int turnCountdown, int turnInterval, int damage)
{
    Trap_t* trap = AddTrap(x, y, trapType, meta);

    trap->data[TRAP_D_DAMAGING_DELAY] = turnCountdown;
    trap->data[TRAP_D_DAMAGING_INTERVAL] = turnInterval;
    trap->data[TRAP_D_DAMAGING_COUNTER] = turnCountdown;
    trap->data[TRAP_D_DAMAGING_DAMAGE] = damage;

    return trap;
}

Trap_t* RemoveTrap(Trap_t* trap)
{
    while (trap->kind != TRAP_NONE)
    {
        *trap++ = *(trap + 1);
    }

    // return trap; // BUG
}

void AddFireTrap(int x, int y, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, y, TRAP_FIRE, 0, turnCountdown, turnInterval, 10);
}

void AddGasTrap(int x, int y, int facing, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, y, TRAP_GAS, facing, turnCountdown, turnInterval, 3);
}

void AddArrowTrap(int x, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, 0, TRAP_LIGHTARROW, 0, turnCountdown, turnInterval, 10);
}

void AddTrap6(int x, int y, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, y, TRAP_6, 0, turnCountdown, turnInterval, 0);
}

void AddTrap8(int x, int y)
{
    AddTrap(x, y, TRAP_8, 0);
}

void AddTrap9(int x, int y, int meta)
{
    AddTrap(x, y, TRAP_9, meta);
}

void InitMapTraps(void)
{
    int ix, iy;

    for (iy = gMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gMapSize.x - 1; ix >= 0; --ix)
        {
            switch (gMapTerrain[iy][ix])
            {

            case TERRAIN_WALL_1B:
                if (gMapTerrain[iy-1][ix] == TERRAIN_WALL_1B)
                    continue; // walls are stacked, only the topmost tile gets a trap

                AddTrap(
                    ix, iy, TRAP_OBSTACLE,
                    GetChapterInfo(gPlaySt.chapter)->mapCrackedWallHeath);

                break;

            case TERRAIN_SNAG:
                AddTrap(ix, iy, TRAP_OBSTACLE, 20);
                break;

            } // switch (gMapTerrain[iy][ix])
        }
    }
}

void ApplyEnabledMapChanges(void)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        switch (trap->kind)
        {

        case TRAP_MAPCHANGE:
            ApplyMapChange(trap->extra);
            break;

        case TRAP_6:
            // this is a mystery
            ApplyMapChange(trap->extra ? trap->y : trap->x);
            break;

        } // switch (trap->kind)
    }
}

void ApplyEnabledLightRunes(void)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        switch (trap->kind)
        {

        case TRAP_LIGHT_RUNE:
            gMapTerrain[trap->y][trap->x] = TERRAIN_TILE_00;
            break;

        }
    }
}

int GetObstacleHpAt(int x, int y)
{
    Trap_t* trap;

    if ((trap = GetTrapAt(x, y)) != NULL)
    {
        return trap->extra;
    }

    if ((gMapTerrain[y][x] == TERRAIN_WALL_1B) && (gMapTerrain[y-1][x] == TERRAIN_WALL_1B))
    {
        if ((trap = GetTrapAt(x, y-1)) != NULL)
        {
            return trap->extra;
        }
    }

    return 0;
}

const struct MapChange* GetMapChange(int id)
{
    const struct MapChange* mapChange = GetChapterMapChanges(gPlaySt.chapter);

    if (!mapChange)
        return NULL;

    while (mapChange->id >= 0)
    {
        if (id == mapChange->id)
            return mapChange;

        ++mapChange;
    }

    return NULL;
}

int GetMapChangeIdAt(int x, int y)
{
    int result = -1;

    const struct MapChange* mapChange = GetChapterMapChanges(gPlaySt.chapter);

    if (!mapChange)
        return result;

    while (mapChange->id >= 0)
    {
        if (x >= mapChange->xOrigin)
            if (y >= mapChange->yOrigin)
                if (mapChange->xOrigin + mapChange->xSize - 1 >= x)
                    if (mapChange->yOrigin + mapChange->ySize - 1 >= y)
                        result = mapChange->id;

        ++mapChange;
    }

    return result;
}

void ApplyMapChange(int id)
{
    int ix = 0, iy = 0;

    const struct MapChange* mapChange = GetMapChange(id);
    const u16* tileDataIt = mapChange->data;

    for (iy = 0; iy < mapChange->ySize; ++iy)
    {
        for (ix = 0; ix < mapChange->xSize; ++ix)
        {
            if (*tileDataIt != 0)
            {
                gMapMetatiles[mapChange->yOrigin + iy][mapChange->xOrigin + ix] = *tileDataIt++;
            }
            else
            {
                ++tileDataIt;
            }
        }
    }
}

void AddMapChangeTrap(int id)
{
    AddTrap(0, 0, TRAP_MAPCHANGE, id);
}

void RemoveMapChangeTrap(int id)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        if (trap->kind == TRAP_MAPCHANGE && trap->extra == id)
            RemoveTrap(trap);
    }
}

bool IsMapChangeEnabled(int id)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        if (trap->kind == TRAP_MAPCHANGE && trap->extra == id)
            return TRUE;
    }

    return FALSE;
}

void UnitHideIfUnderRoof(Unit_t* unit)
{
    if (gMapTerrain[unit->y][unit->x] == TERRAIN_ROOF)
    {
        unit->flags |= (UNIT_FLAG_HIDDEN | UNIT_FLAG_UNDER_ROOF);
    }
}

void UpdateRoofedUnits(void)
{
    int i;

    for (i = 1; i < 0xC0; ++i)
    {
        Unit_t* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(unit->flags & UNIT_FLAG_UNDER_ROOF))
            continue;

        if (gMapTerrain[unit->y][unit->x] != TERRAIN_ROOF)
        {
            unit->flags = (unit->flags &~ (UNIT_FLAG_UNDER_ROOF | UNIT_FLAG_HIDDEN)) | UNIT_FLAG_SEEN;
        }
    }

    RefreshEntityMaps();
    RefreshUnitSprites();
}

void EnlistFireTrapTargets(int x, int y, int damage)
{
    AddTarget(x, y, gMapUnit[y][x], damage);
}

void EnlistArrowTrapTargets(int x, int y, int damage)
{
    int iy;

    for (iy = 0; iy < gMapSize.y; ++iy)
    {
        if (gMapUnit[iy][x])
            AddTarget(x, iy, gMapUnit[iy][x], damage);
    }
}

void EnlistGasTrapTargets(int x, int y, int damage, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    switch (facing)
    {

    case FACING_UP:
        xInc = 0;
        yInc = -1;

        break;

    case FACING_DOWN:
        xInc = 0;
        yInc = +1;

        break;

    case FACING_LEFT:
        xInc = -1;
        yInc = 0;

        break;

    case FACING_RIGHT:
        xInc = +1;
        yInc = 0;

        break;

    } // switch (facing)

    for (i = 2; i >= 0; --i)
    {
        x += xInc;
        y += yInc;

        if (gMapUnit[y][x])
            AddTarget(x, y, gMapUnit[y][x], damage);
    }
}

bool ShouldSkipGasTrapDisplay(int x, int y, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    i8 boolHasNoEffect = TRUE;

    switch (facing)
    {

    case FACING_UP:
        xInc = 0;
        yInc = -1;

        break;

    case FACING_DOWN:
        xInc = 0;
        yInc = +1;

        break;

    case FACING_LEFT:
        xInc = -1;
        yInc = 0;

        break;

    case FACING_RIGHT:
        xInc = +1;
        yInc = 0;

        break;

    } // switch (facing)

    for (i = 0; i < 3; ++i)
    {
        x += xInc;
        y += yInc;

        if (gMapUnit[y][x])
            boolHasNoEffect = FALSE;
    }

    return boolHasNoEffect;
}

void ListDamagingTrapTargets(void)
{
    Trap_t* trap;

    InitTargets(0, 0);

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        if (trap->data[TRAP_D_DAMAGING_COUNTER] == 0)
        {
            switch (trap->kind)
            {

            case TRAP_FIRE:
                EnlistFireTrapTargets(trap->x, trap->y, (i8) trap->data[TRAP_D_DAMAGING_DAMAGE]);
                break;

            case TRAP_LIGHTARROW:
                EnlistArrowTrapTargets(trap->x, trap->y, (i8) trap->data[TRAP_D_DAMAGING_DAMAGE]);
                break;

            case TRAP_GAS:
                EnlistGasTrapTargets(trap->x, trap->y, (i8) trap->data[TRAP_D_DAMAGING_DAMAGE], trap->extra);
                break;

            }
        }
    }
}

void ListDamagingTrapTargetsForDisplay(void)
{
    Trap_t* trap;

    int specialType = 0;

    InitTargets(0, 0);

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        if (trap->data[TRAP_D_DAMAGING_COUNTER] == 0)
        {
            switch (trap->kind)
            {

            case TRAP_FIRE:
                if (gMapUnit[trap->y][trap->x])
                {
                    AddTarget(trap->x, trap->y, 0, TRAP_FIRE);
                    EnlistFireTrapTargets(trap->x, trap->y, trap->data[TRAP_D_DAMAGING_DAMAGE]);
                }

                break;

            case TRAP_GAS:
                switch (trap->extra)
                {

                    // TODO: figure out

                case FACING_UP:
                    specialType = 0x64;
                    break;

                case FACING_DOWN:
                    specialType = 0x65;
                    break;

                case FACING_LEFT:
                    specialType = 0x66;
                    break;

                case FACING_RIGHT:
                    specialType = 0x67;
                    break;

                } // switch (trap->data[TRAP_D_GAS_FACING])

                if (!ShouldSkipGasTrapDisplay(trap->x, trap->y, trap->extra))
                {
                    AddTarget(trap->x, trap->y, 0, specialType);
                    EnlistGasTrapTargets(trap->x, trap->y, trap->data[TRAP_D_DAMAGING_DAMAGE], trap->extra);
                }

                break;

            case TRAP_LIGHTARROW:
                AddTarget(trap->x, trap->y, 0, TRAP_LIGHTARROW);
                EnlistArrowTrapTargets(trap->x, trap->y, trap->data[TRAP_D_DAMAGING_DAMAGE]);
                break;

            case TRAP_6:
                AddTarget(trap->extra ? trap->x : trap->y, TRAP_ID(trap), 0, trap->kind);
                break;

            } // switch (trap->kind)
        }
    }
}

void AdvanceDamagingTrapTurnCounter(void)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        switch (trap->kind)
        {

        case TRAP_FIRE:
        case TRAP_GAS:
        case TRAP_LIGHTARROW:
        case TRAP_6:
            trap->data[TRAP_D_DAMAGING_COUNTER]--;
            break;

        } // switch (trap->kind)
    }
}

void RewindDamagingTrapTurnCounter(void)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        switch (trap->kind)
        {

        case TRAP_FIRE:
        case TRAP_GAS:
        case TRAP_LIGHTARROW:
        case TRAP_6:
            if (trap->data[TRAP_D_DAMAGING_COUNTER] == 0)
                trap->data[TRAP_D_DAMAGING_COUNTER] = trap->data[TRAP_D_DAMAGING_INTERVAL];

            break;

        } // switch (trap->kind)
    }
}

void func_0802EA00(void)
{
    int truePhase = gPlaySt.chapterPhaseIndex;
    gPlaySt.chapterPhaseIndex = FACTION_RED;

    RefreshEntityMaps();

    gPlaySt.chapterPhaseIndex = truePhase;
}

void func_0802EA1C(void)
{
    func_08026414(3);
}

void func_0802EA28(void)
{
    // TODO: EID/FLAG DEFINITIONS

    if (CheckFlag(0x65) || CountAvailableBlueUnits() == 0)
    {
        CallGameOverEvent();
    }

    if (!IsAnyEnemyUnitAlive())
        SetFlag(0x06);
}

Trap_t* AddLightRune(int x, int y)
{
    Trap_t* trap = AddTrap(x, y, TRAP_LIGHT_RUNE, gMapTerrain[y][x]);

    trap->data[TRAP_D_RUNE_TURNSLEFT] = 3;
    gMapTerrain[y][x] = TERRAIN_TILE_00;

#ifdef BUGFIX
    return trap;
#endif
}

Trap_t* RemoveLightRune(Trap_t* trap)
{
    gMapTerrain[trap->y][trap->x] = GetBaseTerrainAt(trap->x, trap->y);
    return RemoveTrap(trap);
}

void HandleTrapDecay(void)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        switch (trap->kind)
        {

        case TRAP_TORCHLIGHT:
            trap->extra--;

            if (trap->extra == 0)
            {
                RemoveTrap(trap);
                trap--;
            }

            break;

        case TRAP_LIGHT_RUNE:
            trap->data[TRAP_D_RUNE_TURNSLEFT]--;

            if (trap->data[TRAP_D_RUNE_TURNSLEFT] == 0)
            {
                RemoveLightRune(trap);
                trap--;
            }

            break;

        } // switch (trap->kind)
    }
}

void RevertEnabledLightRunes(void)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        switch (trap->kind)
        {

        case TRAP_LIGHT_RUNE:
            gMapTerrain[trap->y][trap->x] = GetBaseTerrainAt(trap->x, trap->y);
            break;

        } // switch (trap->kind)
    }
}

void RestoreEnabledLightRunes(void)
{
    Trap_t* trap;

    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap)
    {
        switch (trap->kind)
        {

        case TRAP_LIGHT_RUNE:
            gMapTerrain[trap->y][trap->x] = TERRAIN_TILE_00;
            break;

        } // switch (trap->kind)
    }
}
