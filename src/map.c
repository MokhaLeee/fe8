#include "map.h"

#include "constants/terrains.h"

#include "hardware.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "unit.h"
#include "mapwork.h"
#include "trap.h"

static void MapInit(void* buffer, u8*** outHandle, int width, int height);

static void RenderMapColumn(u16 xOffset);
static void RenderMapLine(u16 yOffset);

static void RefreshUnitsOnMap(void);
static void RefreshTorchlightsOnMap(void);
static void RefreshMinesOnMap(void);

enum { MAP_POOL_SIZE = 0x7B8 };

// TODO: figure out what's up with this (overlaps with a lot of other objects?)
extern u16 gBmMapBuffer[];

EWRAM_DATA struct Vec2 gMapSize = {};

EWRAM_DATA u8** gMapUnit     = NULL;
EWRAM_DATA u8** gMapTerrain  = NULL;
EWRAM_DATA u8** gMapMovement = NULL;
EWRAM_DATA u8** gMapRange    = NULL;
EWRAM_DATA u8** gMapFog      = NULL;
EWRAM_DATA u8** gMapHidden   = NULL;
EWRAM_DATA u8** gMapOther      = NULL;

EWRAM_DATA static u8 sBmMapUnitPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapTerrainPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapFogPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapHiddenPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapUnkPool[MAP_POOL_SIZE] = {};

EWRAM_DATA static u16 sTilesetConfig[0x1000 + 0x200] = {};

EWRAM_DATA static u16 sBmBaseTilesPool[MAP_POOL_SIZE] = {};

static u8** sInitializingMap;

static u8 sBmMapMovementPool[MAP_POOL_SIZE];
static u8 sBmMapRangePool[MAP_POOL_SIZE];

u8* CONST_DATA gMetatilesTerrainLut = (u8*)(sTilesetConfig + 0x1000);
u16** CONST_DATA gMapMetatiles = (u16**)(sBmBaseTilesPool);

void InitChapterMap(int chapterId) {
    UnpackChapterMap(gBmMapBuffer, chapterId);
    ApplyChapterMapGraphics(chapterId);

    MapInit(sBmMapUnitPool,     &gMapUnit,     gMapSize.x, gMapSize.y);
    MapInit(sBmMapTerrainPool,  &gMapTerrain,  gMapSize.x, gMapSize.y);
    MapInit(sBmMapMovementPool, &gMapMovement, gMapSize.x, gMapSize.y);
    MapInit(sBmMapRangePool,    &gMapRange,    gMapSize.x, gMapSize.y);
    MapInit(sBmMapFogPool,      &gMapFog,      gMapSize.x, gMapSize.y);
    MapInit(sBmMapHiddenPool,   &gMapHidden,   gMapSize.x, gMapSize.y);
    MapInit(sBmMapUnkPool, &gMapOther, gMapSize.x, gMapSize.y);

    MapFill(gMapUnit, 0);
    MapFill(gMapTerrain, 0);

    InitBaseTilesBmMap();
    ApplyEnabledMapChanges();
    RefreshTerrainMap();

    // TODO: chapter id definitions
    if (gPlaySt.chapter == 0x75)
        func_08019624();
}

void InitChapterPreviewMap(int chapterId) {
    UnpackChapterMap(gBmMapBuffer, chapterId);

    MapInit(sBmMapUnitPool,    &gMapUnit,    gMapSize.x, gMapSize.y);
    MapInit(sBmMapTerrainPool, &gMapTerrain, gMapSize.x, gMapSize.y);

    MapFill(gMapUnit, 0);
    MapFill(gMapTerrain, 0);

    InitBaseTilesBmMap();
    RefreshTerrainMap();
}

void func_08019624(void) {
    int ix, iy;

    // Automatic water shadows?

    for (iy = 0; iy < gMapSize.y; ++iy) {
        for (ix = 0; ix < gMapSize.x; ++ix) {
            int connect;

            if (gMapTerrain[iy][ix] != TERRAIN_WATER)
                continue;

            connect = 0;

            if (ix > 0) {
                if (gMapTerrain[iy][ix - 1] == TERRAIN_FLOOR_17)
                    connect = 1;

                if (gMapTerrain[iy][ix - 1] == TERRAIN_STAIRS)
                    connect = 1;

                if (gMapTerrain[iy][ix - 1] == TERRAIN_CHEST_20)
                    connect = 1;

                if (gMapTerrain[iy][ix - 1] == TERRAIN_CHEST_21)
                    connect = 1;
            }

            if (iy > 0) {
                if (gMapTerrain[iy - 1][ix] == TERRAIN_FLOOR_17)
                    connect += 2;

                if (gMapTerrain[iy - 1][ix] == TERRAIN_STAIRS)
                    connect += 2;

                if (gMapTerrain[iy - 1][ix] == TERRAIN_CHEST_20)
                    connect += 2;

                if (gMapTerrain[iy - 1][ix] == TERRAIN_CHEST_21)
                    connect += 2;
            }

            if (ix > 0 && iy > 0)
                if ((gMapTerrain[iy]    [ix - 1] == TERRAIN_FLOOR_17) &&
                    (gMapTerrain[iy + 1][ix - 1] == TERRAIN_WATER) &&
                    (gMapTerrain[iy - 1][ix]     != TERRAIN_FLOOR_17))
                    connect = 4;

            switch (connect) {

            case 1: // straight shadow on the left
                gMapMetatiles[iy][ix] = 0x2DC;
                break;

            case 2: // straight shadow on the top
                gMapMetatiles[iy][ix] = 0x2D8;
                break;

            case 3: // shadow on both the left and the top
                gMapMetatiles[iy][ix] = 0x358;
                break;

            case 4: // shadow on the left, but stronger at the top-left than bottom-left
                gMapMetatiles[iy][ix] = 0x35C;
                break;

            } // switch (connect)
        }
    }
}

void func_08019778(void) {
    UnpackChapterMap(gBmMapBuffer, gPlaySt.chapter);

    InitBaseTilesBmMap();
    ApplyEnabledMapChanges();
    RefreshTerrainMap();
    func_08019624();
}

void MapInit(void* buffer, u8*** outHandle, int x, int y) {
    int i;
    u8* itBuffer;

    sInitializingMap = buffer;

    x  += 2; // two tiles on each edge (shared)
    y += 4; // two tiles on each edge

    // itBuffer = start of tile area (the first y * sizeof(u8*) bytes are reserved for row pointers)
    itBuffer = buffer + y * sizeof(u8*);

    // Setting up the row pointers
    for (i = 0; i < y; ++i) {
        sInitializingMap[i] = itBuffer;
        itBuffer += x;
    }

    // first row is actually the third, ensuring the top two map rows as safety
    *outHandle = sInitializingMap + 2;
}

void MapFill(u8** map, int value) {
    int size = (gMapSize.y + 4) * (gMapSize.x + 2);

    if (size % 2)
        size = size - 1;

    value = (0xFF & value);
    value += value << 8;

    CpuFill16(value, map[-2], size);

    SetWorkingMap(map);
}

void MapSetEdges(u8** map, u8 value) {
    int ix, iy;

    u8** theMap = map;

    // Set tile values for horizontal edges
    for (iy = 0; iy < gMapSize.y; ++iy) {
        theMap[iy][0]              = value;
        theMap[iy][gMapSize.x-1] = value;
    }

    // Set tile values for vertical edges
    for (ix = 0; ix < gMapSize.x; ++ix) {
        theMap[0]             [ix] = value;
        theMap[gMapSize.y-1][ix] = value;
    }
}

void UnpackChapterMap(void* into, int chapterId) {
    // Decompress map data
    Decompress(
        GetChapterMapData(chapterId), into);

    // Setting map size
    gMapSize.x = ((u8*)(into))[0];
    gMapSize.y = ((u8*)(into))[1];

    // Decompress tileset config
    Decompress(
        gChapterDataAssetTable[GetChapterInfo(chapterId)->mapTileConfigId], sTilesetConfig);

    // Setting max camera offsets (?) TODO: figure out
    gBmSt.unk28.x = gMapSize.x*16 - 240;
    gBmSt.unk28.y = gMapSize.y*16 - 160;
}

void ApplyChapterMapGraphics(int chapterId) {
    // Decompress tileset graphics (part 1)
    Decompress(
        gChapterDataAssetTable[GetChapterInfo(chapterId)->mapObj1Id],
        (void*)(BG_VRAM + 0x20 * 0x400)); // TODO: tile id constant?

    // Decompress tileset graphics (part 2, if it exists)
    if (gChapterDataAssetTable[GetChapterInfo(chapterId)->mapObj2Id])
        Decompress(
            gChapterDataAssetTable[GetChapterInfo(chapterId)->mapObj2Id],
            (void*)(BG_VRAM + 0x20 * 0x600)); // TODO: tile id constant?

    // Apply tileset palette
    ApplyPaletteExt(
        gChapterDataAssetTable[GetChapterInfo(chapterId)->mapPaletteId],
        0x20 * 6, 0x20 * 10); // TODO: palette id constant?
}

void ApplyChapterMapPalettes(void) {
    ApplyPaletteExt(
        gChapterDataAssetTable[GetChapterInfo(gPlaySt.chapter)->mapPaletteId],
        0x20 * 6, 0x20 * 10); // TODO: palette id constant?
}

void InitBaseTilesBmMap(void) {
    int ix, iy;

    u16** rows;
    u16*  tiles;
    u16*  itBuffer;

    rows  = gMapMetatiles;
    tiles = gBmMapBuffer;

    gMapSize.y++; // ?

    // Ignore first short (x, y byte pair)
    tiles++;

    // Tile buffer starts after the rows
    itBuffer = (u16*)(gMapMetatiles + gMapSize.y);

    for (iy = 0; iy < gMapSize.y; ++iy) {
        // Set row buffer
        rows[iy] = itBuffer;
        itBuffer += gMapSize.x;

        // Set tiles
        for (ix = 0; ix < gMapSize.x; ++ix)
            gMapMetatiles[iy][ix] = *tiles++;
    }

    // Fill "bottom" row with empty tiles?
    // "bottom" as the y had been increased too this is just weird

    tiles = gMapMetatiles[iy - 1];

    for (ix = 0; ix < gMapSize.x; ++ix)
        *tiles++ = 0;

    gMapSize.y--; // ?
}

void RefreshTerrainMap(void) {
    int ix, iy;

    for (iy = 0; iy < gMapSize.y; ++iy)
        for (ix = 0; ix < gMapSize.x; ++ix)
            gMapTerrain[iy][ix] = gMetatilesTerrainLut[gMapMetatiles[iy][ix] >> 2];

    ApplyEnabledLightRunes();
}

int GetBaseTerrainAt(int x, int y) {
    return gMetatilesTerrainLut[gMapMetatiles[y][x] >> 2];
}

void PutMapMetatile(u16* bg, int xTileMap, int yTileMap, int xBmMap, int yBmMap) {
    u16* out = bg + yTileMap * 0x40 + xTileMap * 2; // TODO: BG_LOCATED_TILE?
    u16* tile = sTilesetConfig + gMapMetatiles[yBmMap][xBmMap];

    // TODO: palette id constants
    u16 base = gMapFog[yBmMap][xBmMap] ? (6 << 12) : (11 << 12);

    out[0x00 + 0] = base + *tile++;
    out[0x00 + 1] = base + *tile++;
    out[0x20 + 0] = base + *tile++;
    out[0x20 + 1] = base + *tile++;
}

void nullsub_8(void) {}

void PutLimitViewSquare(u16* bg, int xBmMap, int yBmMap, int xTileMap, int yTileMap) {
    bg = bg + 2*(yTileMap * 0x20 + xTileMap);

    if (!bg)
        nullsub_8();

    // TODO: tile macros?
    // TODO: are the movement and range maps i8[][]?

    if (((i8**)(gMapMovement))[yBmMap][xBmMap] >= 0) {
        bg[0x00 + 0] = 0x4280;
        bg[0x00 + 1] = 0x4281;
        bg[0x20 + 0] = 0x4282;
        bg[0x20 + 1] = 0x4283;

        return;
    }

    if (((i8**)(gMapRange))[yBmMap][xBmMap]) {
        if (bg[0]) {
            bg[0x00 + 0] = 0x5284;
            bg[0x00 + 1] = 0x5285;
            bg[0x20 + 0] = 0x5286;
            bg[0x20 + 1] = 0x5287;

            return;
        } else {
            bg[0x00 + 0] = 0x5280;
            bg[0x00 + 1] = 0x5281;
            bg[0x20 + 0] = 0x5282;
            bg[0x20 + 1] = 0x5283;

            return;
        }
    }

    bg[0x00 + 0] = 0;
    bg[0x00 + 1] = 0;
    bg[0x20 + 0] = 0;
    bg[0x20 + 1] = 0;
}

void RenderMap(void) {
    int ix, iy;

    gBmSt.mapRenderOrigin.x = gBmSt.camera.x >> 4;
    gBmSt.mapRenderOrigin.y = gBmSt.camera.y >> 4;

    for (iy = (10 - 1); iy >= 0; --iy)
        for (ix = (15 - 1); ix >= 0; --ix)
            PutMapMetatile(gBg3Tm, ix, iy,
                (short) gBmSt.mapRenderOrigin.x + ix, (short) gBmSt.mapRenderOrigin.y + iy);

    EnableBgSync(BG3_SYNC_BIT);
    SetBgOffset(3, 0, 0);

    SetDispEnable(1, 1, 1, 1, 1);
}

void RenderMapForFade(void) {
    int ix, iy;

    SetBgChrOffset(2, 0x8000);

    gBmSt.mapRenderOrigin.x = gBmSt.camera.x >> 4;
    gBmSt.mapRenderOrigin.y = gBmSt.camera.y >> 4;

    for (iy = (10 - 1); iy >= 0; --iy)
        for (ix = (15 - 1); ix >= 0; --ix)
            PutMapMetatile(gBg2Tm, ix, iy,
                (short) gBmSt.mapRenderOrigin.x + ix, (short) gBmSt.mapRenderOrigin.y + iy);

    EnableBgSync(BG2_SYNC_BIT);
    SetBgOffset(2, 0, 0);
}

void UpdateRenderMap(void) {
    // TODO: figure out

    if (gBmSt.camera.x != gBmSt.cameraPrevious.x) {
        if (gBmSt.camera.x > gBmSt.cameraPrevious.x) {
            if (((gBmSt.camera.x - 1) ^ (gBmSt.cameraPrevious.x - 1)) & 0x10)
                RenderMapColumn(15);
        } else {
            if ((gBmSt.camera.x ^ gBmSt.cameraPrevious.x) & 0x10)
                RenderMapColumn(0);
        }
    }

    if (gBmSt.camera.y != gBmSt.cameraPrevious.y) {
        if (gBmSt.camera.y > gBmSt.cameraPrevious.y) {
            if (((gBmSt.camera.y - 1) ^ (gBmSt.cameraPrevious.y - 1)) & 0x10)
                RenderMapLine(10);
        } else {
            if ((gBmSt.camera.y ^ gBmSt.cameraPrevious.y) & 0x10)
                RenderMapLine(0);
        }
    }

    gBmSt.cameraPrevious = gBmSt.camera;

    SetBgOffset(3,
        gBmSt.camera.x - gBmSt.mapRenderOrigin.x * 16,
        gBmSt.camera.y - gBmSt.mapRenderOrigin.y * 16
    );

    // TODO: GAME STATE BITS CONSTANTS
    if (gBmSt.gameStateBits & 1) {
        SetBgOffset(2,
            gBmSt.camera.x - gBmSt.mapRenderOrigin.x * 16,
            gBmSt.camera.y - gBmSt.mapRenderOrigin.y * 16
        );
    }
}

void RenderMapColumn(u16 xOffset) {
    u16 xBmMap = (gBmSt.camera.x >> 4) + xOffset;
    u16 yBmMap = (gBmSt.camera.y >> 4);

    u16 xTileMap = ((gBmSt.camera.x >> 4) - gBmSt.mapRenderOrigin.x + xOffset) & 0xF;
    u16 yTileMap = ((gBmSt.camera.y >> 4) - gBmSt.mapRenderOrigin.y);

    int iy;

    if (!(gBmSt.gameStateBits & 1)) {
        for (iy = 10; iy >= 0; --iy) {
            PutMapMetatile(gBg3Tm,
                xTileMap, (yTileMap + iy) & 0xF,
                xBmMap, (yBmMap + iy));
        }

        EnableBgSync(BG3_SYNC_BIT);
    } else {
        for (iy = 10; iy >= 0; --iy) {
            PutMapMetatile(gBg3Tm,
                xTileMap, (yTileMap + iy) & 0xF,
                xBmMap, (yBmMap + iy));

            PutLimitViewSquare(gBg2Tm,
                xBmMap, (yBmMap + iy),
                xTileMap, (yTileMap + iy) & 0xF);
        }

        EnableBgSync(BG3_SYNC_BIT | BG2_SYNC_BIT);
    }
}

void RenderMapLine(u16 yOffset) {
    u16 xBmMap = (gBmSt.camera.x >> 4);
    u16 yBmMap = (gBmSt.camera.y >> 4) + yOffset;

    u16 xTileMap = ((gBmSt.camera.x >> 4) - gBmSt.mapRenderOrigin.x);
    u16 yTileMap = ((gBmSt.camera.y >> 4) - gBmSt.mapRenderOrigin.y + yOffset) & 0xF;

    int ix;

    if (!(gBmSt.gameStateBits & 1)) {
        for (ix = 15; ix >= 0; --ix) {
            PutMapMetatile(gBg3Tm,
                (xTileMap + ix) & 0xF, yTileMap,
                (xBmMap + ix), yBmMap);
        }

        EnableBgSync(BG3_SYNC_BIT);
    } else {
        for (ix = 15; ix >= 0; --ix) {
            PutMapMetatile(gBg3Tm,
                (xTileMap + ix) & 0xF, yTileMap,
                (xBmMap + ix), yBmMap);

            PutLimitViewSquare(gBg2Tm,
                (xBmMap + ix), yBmMap,
                (xTileMap + ix) & 0xF, yTileMap);
        }

        EnableBgSync(BG3_SYNC_BIT | BG2_SYNC_BIT);
    }
}

void RefreshUnitsOnMap(void) {
    Unit_t* unit;
    int i;

    // 1. Blue & Green units

    for (i = 1; i < FACTION_RED; ++i) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->flags & UNIT_FLAG_HIDDEN)
            continue;

        // Put unit on unit map
        gMapUnit[unit->y][unit->x] = i;

        // If fog is enabled, apply unit vision to fog map
        if (gPlaySt.chapterVisionRange)
            MapAddInRange(unit->x, unit->y, GetUnitVision(unit), 1);
    }

    // 2. Red (& Purple) units

    if (gPlaySt.chapterPhaseIndex != FACTION_RED) {
        // 2.1. No red phase

        for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i) {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->flags & UNIT_FLAG_HIDDEN)
                continue;

            // If unit is magic seal, set fog in range 0-10.
            // Magic seal set the fog map probably solely for the alternate map palette.
            if (UNIT_ATTRIBUTES(unit) & UNIT_ATTR_MAGICSEAL)
                MapAddInRange(unit->x, unit->y, 10, -1);

            if (gPlaySt.chapterVisionRange && !gMapFog[unit->y][unit->x]) {
                // If in fog, set unit bit on the hidden map, and set the "hidden in fog" flag

                gMapHidden[unit->y][unit->x] |= HIDDEN_BIT_UNIT;
                unit->flags = unit->flags | UNIT_FLAG_UNSEEN;
            } else {
                // If not in fog, put unit on the map, and update flags accordingly

                gMapUnit[unit->y][unit->x] = i;

                if (unit->flags & UNIT_FLAG_UNSEEN)
                    unit->flags = (unit->flags &~ UNIT_FLAG_UNSEEN) | UNIT_FLAG_SEEN;
            }
        }
    } else {
        // 2.2. Yes red phase

        // This does mostly the same as the "No red phase" loop, except:
        // - It always puts the units on the unit map
        // - It never sets the "spotted" unit flag (even if unit is seen)

        for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i) {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->flags & UNIT_FLAG_HIDDEN)
                continue;

            // See above
            if (UNIT_ATTRIBUTES(unit) & UNIT_ATTR_MAGICSEAL)
                MapAddInRange(unit->x, unit->y, 10, -1);

            if (gPlaySt.chapterVisionRange) {
                // Update unit flags according to fog level

                if (!gMapFog[unit->y][unit->x])
                    unit->flags = unit->flags | UNIT_FLAG_UNSEEN;
                else
                    unit->flags = unit->flags &~ UNIT_FLAG_UNSEEN;
            }

            // Put on unit map
            gMapUnit[unit->y][unit->x] = i;
        }
    }
}

void RefreshTorchlightsOnMap(void) {
    Trap_t* trap;
    
    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap) {
        switch (trap->kind) {

        case TRAP_TORCHLIGHT:
            MapAddInRange(trap->x, trap->y, trap->extra, 1);
            break;

        } // switch (trap->kind)
    }
}

void RefreshMinesOnMap(void) {
    Trap_t* trap;
    
    for (trap = GetTrap(0); trap->kind != TRAP_NONE; ++trap) {
        switch (trap->kind) {

        case TRAP_MINE:
            if (!gMapUnit[trap->y][trap->x])
                gMapHidden[trap->y][trap->x] |= HIDDEN_BIT_TRAP;

            break;

        } // switch (trap->kind)
    }
}

void RefreshEntityMaps(void) {
    // 1. Clear unit & hidden maps

    MapFill(gMapUnit, 0);
    MapFill(gMapHidden, 0);

    // 2. Clear fog map, with 1 (visible) if no fog, with 0 (hidden) if yes fog

    MapFill(gMapFog, !gPlaySt.chapterVisionRange ? 1 : 0);

    // 3. Populate unit, fog & hidden maps

    RefreshTorchlightsOnMap();
    RefreshUnitsOnMap();
    RefreshMinesOnMap();
}

char const* GetTerrainName(int terrain) {
    return GetMsg(gUnknown_0880D374[terrain]);
}

int GetTerrainHealAmount(int terrain) {
    return gUnknown_0880C744[terrain];
}

int DoesTerrainHealStatus(int terrain) {
    return gUnknown_0880C785[terrain];
}

void func_0801A278(void) {
    const u16* tile = sTilesetConfig;

    // TODO: game state bits constants
    if (!func_0800D208() || (gBmSt.gameStateBits & 0x10)) {
        // TODO: macros?
        SetBlankChr(0x400 + (*tile++ & 0x3FF));
        SetBlankChr(0x400 + (*tile++ & 0x3FF));
        SetBlankChr(0x400 + (*tile++ & 0x3FF));
        SetBlankChr(0x400 + (*tile++ & 0x3FF));
    }

    SetBackdropColor(0);
}

void RevertMapChange(int id) {
    const struct MapChange* mapChange;
    u8 ix, iy;

    Decompress(GetChapterMapData(gPlaySt.chapter), gBmMapBuffer);

    mapChange = GetMapChange(id);

    for (iy = mapChange->yOrigin; iy < (mapChange->yOrigin + mapChange->ySize); ++iy) {
        u16* itSource = (iy * gMapSize.x) + mapChange->xOrigin + (gBmMapBuffer + 1);
        u16* itDest   = gMapMetatiles[iy] + mapChange->xOrigin;

        for (ix = mapChange->xOrigin; ix < (mapChange->xOrigin + mapChange->xSize); ++ix)
            *itDest++ = *itSource++;
    }
}
