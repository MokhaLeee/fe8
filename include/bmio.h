#pragma once

#include "global.h"

void StartBmVSync(void);
void EndBmVSync(void);
void LockBmDisplay(void);
void UnlockBmDisplay(void);
void AllocWeatherParticles(int weather);
void ApplyFlamesWeatherGradient(void);
void WeatherInit(void);
void WeatherVBlank(void);
void WeatherUpdate(void);
void DisableTilesetPaletteAnim(void);
void EnableTilesetPaletteAnim(void);
void SetWeather(int weather);

// TODO: move those elsewhere

enum
{
    BM_BGPAL_6 = 6,
    BM_BGPAL_TILESET_BASE = 7,
};

enum
{
    BM_OBJPAL_1 = 1,
    BM_OBJPAL_10 = 10,
};

// TODO: move those elsewhere

struct TileGfxAnim
{
    /* 00 */ u16 time;
    /* 02 */ u16 size;
    /* 04 */ u8 const* data;
};

struct TilePalAnim
{
    /* 00 */ u16 const* data;
    /* 04 */ u8 time;
    /* 05 */ u8 color_count;
    /* 06 */ u8 color_first;
};
