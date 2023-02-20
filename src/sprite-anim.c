#include "sprite-anim.h"

// TODO [2021-10-02]: clean up and update to stan standards

#include "sprite.h"
#include "proc.h"
#include "hardware.h"
#include "oam.h"

#define AP_MAX_COUNT 0x14 // 20

static void APProc_OnUpdate(SpriteAnimProc_t* proc);
static void APProc_OnEnd(SpriteAnimProc_t* proc);

static struct ProcScr CONST_DATA sProcScr_SpriteAnimProc[] =
{
    PROC_ONEND(APProc_OnEnd),
    PROC_REPEAT(APProc_OnUpdate),

    PROC_END,
};

static u8 CONST_DATA sOamTileSizeLut[] =
{
    1, 1,
    2, 2,
    4, 4,
    8, 8,

    2, 1,
    4, 1,
    4, 2,
    8, 4,

    1, 2,
    1, 4,
    2, 4,
    4, 8,
};

static SpriteAnim_t sAPArray[AP_MAX_COUNT];

void InitSpriteAnims(void) {
    SpriteAnim_t* it;

    const SpriteAnim_t* base = sAPArray;
    const void*  nullDefinition = NULL;

    it = sAPArray + AP_MAX_COUNT - 1;

    do {
        (it--)->info = nullDefinition;
    } while ((int)it >= (int)base); // casts are needed for match
}

SpriteAnim_t* StartSpriteAnim(u16 const* info, u16 layer)
{
    SpriteAnim_t* result;

    if ((result = FindSpriteAnim(NULL)) == NULL)
        return NULL;

    InitSpriteAnim(result, info, layer);

    return result;
}

void EndSpriteAnim(SpriteAnim_t* sprite_anim) {
    if (sprite_anim && sprite_anim->info)
        sprite_anim->info = NULL;
}

bool DisplaySpriteAnim(SpriteAnim_t* sprite_anim, int x, int y) {
    if (!sprite_anim || !sprite_anim->info)
        return FALSE;
    
    PutSpriteAnim(sprite_anim, x, y);
    return StepSpriteAnim(sprite_anim);
}

void PutSpriteAnim(SpriteAnim_t* sprite_anim, int x, int y) {
    int rotScaleMask = 0;

    if (!sprite_anim || !sprite_anim->info)
        return;

    if (sprite_anim->current_affine) {
        PutSpriteAnimAffine(sprite_anim);
        rotScaleMask = (sprite_anim->affine_slot << 9);
    }

    PutSpriteExt(
        sprite_anim->sprite_layer,
        x | rotScaleMask, y,
        sprite_anim->current_sprite,
        sprite_anim->oam2
    );

    if (sprite_anim->img && sprite_anim->need_sync_img_b)
        SyncSpriteAnimImg(sprite_anim);
}

bool StepSpriteAnim(SpriteAnim_t* sprite_anim) {
    int tmp; // needed to match

    if (!sprite_anim || !sprite_anim->info)
        return FALSE;
    
    if (!sprite_anim->clock_interval_q8)
        return TRUE;
    
    // timer going down
    if (sprite_anim->clock != 0) {
        if ((sprite_anim->clock = sprite_anim->clock-1) > 0)
            return TRUE;
        
        sprite_anim->clock = 0;
        sprite_anim->script_pc += 2;
    }

    // sprite_anim animation end
    if (!sprite_anim->script_pc[0]) {
        switch (sprite_anim->script_pc[1]) {
        case (u16)(-1): // loop back to start
            sprite_anim->script_pc = sprite_anim->script;
            return StepSpriteAnim(sprite_anim);
        
        case 1: // delete sprite_anim
            EndSpriteAnim(sprite_anim);
        case 0: // end animation
            return FALSE;
        }
    }

    // Increasing the subframe clock
    tmp = (sprite_anim->script_pc[0] * sprite_anim->clock_interval_q8);
    sprite_anim->clock_decimal_q8 += tmp;

    // Check if next frame wasn't reached yet
    if (sprite_anim->clock_decimal_q8 < 0x100) {
        sprite_anim->clock = 1;
        return StepSpriteAnim(sprite_anim);
    }

    // Setting clock values depending on subframe clock
    sprite_anim->clock         = (sprite_anim->clock_decimal_q8 >> 8);
    sprite_anim->clock_decimal_q8 = (sprite_anim->clock_decimal_q8 & 0xFF);

    // Setting new frame
    sprite_anim->current_sprite = sprite_anim->frames + sprite_anim->frames[sprite_anim->script_pc[1]]/2;

    // Handling RotScale data (if any)
    if (sprite_anim->current_sprite[0] & 0x8000) {
        sprite_anim->current_affine  = sprite_anim->current_sprite;
        sprite_anim->current_sprite += (sprite_anim->current_sprite[0] & 0x7FFF)*3 + 1;
    } else {
        sprite_anim->current_affine = NULL;
    }

    // Gfx needs update
    sprite_anim->need_sync_img_b = TRUE;
    return TRUE;
}

void PutSpriteAnimAffine(SpriteAnim_t* sprite_anim) {
    int i, count;
    const u16* it;

    if (!sprite_anim || !sprite_anim->info)
        return;
    
    if (!sprite_anim->current_affine)
        return;
    
    count = sprite_anim->current_affine[0] & 0x7FFF; // rotscale data count
    it    = sprite_anim->current_affine + 1;         // rotscale data start

    for (i = 0; i < count; it += 3, i++) {
        SetObjAffine(
            sprite_anim->affine_slot + i,  // oam rotscale index

            Div(+COS_Q12(it[0])*16, it[1]), // pa
            Div(-SIN_Q12(it[0])*16, it[2]), // pb
            Div(+SIN_Q12(it[0])*16, it[1]), // pc
            Div(+COS_Q12(it[0])*16, it[2])  // pd
        );
    }
}

void SetSpriteAnimId(SpriteAnim_t* sprite_anim, int index) {
    const u16* animDataList;

    if (!sprite_anim || !sprite_anim->info)
        return;
    
    // anim data offset array is defined by there
    // its entries are offsets relative to the table itself
    animDataList = sprite_anim->info + sprite_anim->info[1]/2;

    sprite_anim->script   = animDataList + animDataList[index]/2;
    sprite_anim->script_pc = sprite_anim->script;

    StepSpriteAnimFirstFrame(sprite_anim);
}

void SetSpriteAnimInfo(SpriteAnim_t* sprite_anim, const u16* definition) {
    if (!sprite_anim || !sprite_anim->info)
        return;
    
    LoadSpriteAnimInfo(sprite_anim, definition);
    StepSpriteAnimFirstFrame(sprite_anim);
}

void SyncSpriteAnimImg(SpriteAnim_t* sprite_anim) {
    const u16* itGfxData;
    const u16* itObjData;
    u32 tileOffset;
    int i;

    if (!sprite_anim || !sprite_anim->info)
        return;
    
    i = sprite_anim->current_sprite[0];

    itObjData = sprite_anim->current_sprite + 1;
    itGfxData = sprite_anim->current_sprite + 1 + i*3;
    
    tileOffset = 0;

    // This expression is used a lot here, so using helper macro for readability
    #define OBJ_SIZE_TABLE_INDEX(aIt) ((((aIt[0] & 0xC000)>>12)+((aIt[1] & 0xC000)>>14))*2)

    while ((i--) > 0) {
        RegisterObjectTileGraphics(
            sprite_anim->img + (*itGfxData & 0x3FF) * 0x20,              // source location
            OBJ_VRAM0 + ((sprite_anim->oam2 & 0x3FF) * 0x20) + tileOffset, // target location
            sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)+0],        // x size (tiles)
            sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)+1]         // y size (tiles)
        );

        if (!gDispIo.dispCt.obj1dMap)
            // Adding (width * sizeof(Tile4bpp))
            tileOffset += (sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)]) * 0x20;
        else
            // Using the square of the width here?
            // Maybe it's bugged, since I don't think the obj1dMap flag is ever set
            tileOffset += ((
                (sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)]) *
                (sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)])
            )& 0x3FF) * 0x20;

        itObjData += 3;
        itGfxData += 1;
    }

    #undef OBJ_SIZE_TABLE_INDEX

    sprite_anim->need_sync_img_b = FALSE;
}

void LoadSpriteAnimInfo(SpriteAnim_t* sprite_anim, const u16* definition) {
    sprite_anim->info = definition;

    // frame data starts at offset in short 0
    sprite_anim->frames = definition + (definition[0]/2);
    
    // anim offset array starts at offset in short 1
    // first entry is default anim index
    // anim data is located by indexing the anim offset array.
    // offset is relative to the anim offset array itself, not the definition!

    sprite_anim->script = (
        (definition + definition[1]/2) +  // anim offset array
        (definition[definition[1]/2]/2)   // default anim offset array index
    );

    sprite_anim->script_pc = sprite_anim->script;
}

void StepSpriteAnimFirstFrame(SpriteAnim_t* sprite_anim) {
    int tmp;

    // needed to match (and apparently even a thing in the source cf FE6:08013050)
    sprite_anim->clock = 0;

    tmp = sprite_anim->clock_interval_q8;

    // This sequence may have been a macro in the original source
    sprite_anim->clock    = 0;
    sprite_anim->clock_interval_q8 = 0x100;

    StepSpriteAnim(sprite_anim);

    sprite_anim->clock_interval_q8 = tmp;
}

void InitSpriteAnim(SpriteAnim_t* sprite_anim, const u16* definition, u16 sprite_layer) {
    LoadSpriteAnimInfo(sprite_anim, definition);

    sprite_anim->img  = NULL;
    sprite_anim->oam2   = 0;
    sprite_anim->clock = 0;

    sprite_anim->sprite_layer = sprite_layer;

    sprite_anim->current_affine = NULL;
    sprite_anim->affine_slot    = 0;

    // this is the second time this exact pattern shows. (Macro?)
    sprite_anim->clock    = 0;
    sprite_anim->clock_interval_q8 = 0x100;

    sprite_anim->clock_decimal_q8 = 0;

    StepSpriteAnim(sprite_anim);
}

SpriteAnim_t* FindSpriteAnim(const u16* definition) {
    int i = 0;
    SpriteAnim_t* result = sAPArray;

    for (i = 0; i < AP_MAX_COUNT; ++i) {
        if (result->info == definition)
            return result;
        
        result++;
    }

    return NULL;
}

SpriteAnimProc_t* StartSpriteAnimProc(u16 const* info, int x, int y, int oam2, int anim_id, u16 layer)
{
    SpriteAnim_t* sprite_anim;
    SpriteAnimProc_t* proc;

    // Setting up sprite_anim
    sprite_anim = StartSpriteAnim(info, layer);
    SetSpriteAnimId(sprite_anim, anim_id);
    sprite_anim->oam2 = oam2;

    // Making Proc
    proc = SpawnProc(sProcScr_SpriteAnimProc, PROC_TREE_3);

    // Setting up proc
    proc->sprite_anim = sprite_anim;
    proc->x = x;
    proc->y = y;

    return proc;
}

void APProc_OnUpdate(SpriteAnimProc_t* proc) {
    // Update AP, and end proc if the AP was freed (aka the animation ended)
    if (!DisplaySpriteAnim(proc->sprite_anim, proc->x, proc->y))
        if (!proc->sprite_anim || !proc->sprite_anim->info)
            Proc_End(proc);
}

void APProc_OnEnd(SpriteAnimProc_t* proc) {
    // Free AP when proc ends
    EndSpriteAnim(proc->sprite_anim);
}

void SetSpriteAnimProcParameters(SpriteAnimProc_t* proc, int x, int y, int oam2)
{
    // set position
    proc->x = x;
    proc->y = y;

    // set oam2 if asked to
    if (oam2 != -1)
        proc->sprite_anim->oam2 = oam2;
}

void EndSpriteAnimProc(SpriteAnimProc_t* proc)
{
    // delet
    Proc_End(proc);
}

void EndEachSpriteAnimProc(void)
{
    // delet all
    EndEachProc(sProcScr_SpriteAnimProc);
}

bool SpriteAnimExists(void)
{
    return FindProc(sProcScr_SpriteAnimProc) ? TRUE : FALSE;
}
