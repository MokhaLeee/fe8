#pragma once

#include "global.h"

struct SpriteAnim
{
    /* 00 */ u16 const* info;             // address of info
    /* 04 */ u16 const* frames;           // address of frame array
    /* 08 */ u16 const* script;           // address of script start (where we go back on loop)
    /* 0C */ u16 const* script_pc;        // address of script pc (where we are now)
    /* 10 */ u16 const* current_sprite;   // address of current sprite
    /* 14 */ u16 const* current_affine;   // address of current affine
    /* 18 */ i16 clock;                   // Cycle Timer
    /* 1A */ u16 clock_interval_q8;       // Cycle Time Step
    /* 1C */ u16 clock_decimal_q8;        // Sub frame time offset or something
    /* 1E */ u16 sprite_layer;            // sprite layer
    /* 20 */ u8 need_sync_img_b;          // bool defining whether gfx needs update
    /* 21 */ u8 affine_slot;              // Rotation/Scale OAM Index
    /* 22 */ u16 oam2;                    // OAM Extra Data (Tile Index Root & OAM2 Stuff)
    /* 24 */ u8 const* img;               // address of graphics (if any)
};

typedef struct SpriteAnim SpriteAnim_t;

struct SpriteAnimProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 pad_sprite_anim_proc_29[0x50 - 0x29];

    /* 50 */ SpriteAnim_t* sprite_anim;
    /* 54 */ u32 x;
    /* 58 */ u32 y;
};

typedef struct SpriteAnimProc SpriteAnimProc_t;

void InitSpriteAnims(void);
SpriteAnim_t* StartSpriteAnim(u16 const* info, u16 layer);
void EndSpriteAnim(SpriteAnim_t* sprite_anim);
bool DisplaySpriteAnim(SpriteAnim_t* sprite_anim, int x, int y);
void PutSpriteAnim(SpriteAnim_t* sprite_anim, int x, int y);
bool StepSpriteAnim(SpriteAnim_t* sprite_anim);
void PutSpriteAnimAffine(SpriteAnim_t* sprite_anim);
void SetSpriteAnimId(SpriteAnim_t* sprite_anim, int id);
void SetSpriteAnimInfo(SpriteAnim_t* sprite_anim, u16 const* info);
void SyncSpriteAnimImg(SpriteAnim_t* sprite_anim);
void LoadSpriteAnimInfo(SpriteAnim_t* sprite_anim, u16 const* info);
void StepSpriteAnimFirstFrame(SpriteAnim_t* sprite_anim);
void InitSpriteAnim(SpriteAnim_t* sprite_anim, u16 const* info, u16 layer);
SpriteAnim_t* FindSpriteAnim(u16 const* info);
SpriteAnimProc_t* StartSpriteAnimProc(u16 const* info, int x, int y, int oam2, int anim_id, u16 layer);
void SetSpriteAnimProcParameters(SpriteAnimProc_t* proc, int x, int y, int oam2);
void EndSpriteAnimProc(SpriteAnimProc_t* proc);
void EndEachSpriteAnimProc(void);
bool SpriteAnimExists(void);
