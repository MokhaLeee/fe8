#include "global.h"

#include "hardware.h"
#include "dma.h"
#include "sprite.h"

#include "uiutils.h"

static const u16 gUnknown_080DA2F4[] = {
    TILE(0x01, BGPAL_UI_FRAME),
    TILE(0x02, BGPAL_UI_FRAME),
    TILE(0x03, BGPAL_UI_FRAME),
    TILE(0x05, BGPAL_UI_FRAME),

    TILE(0x07, BGPAL_UI_FRAME),
    TILE(0x08, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x0A, BGPAL_UI_FRAME),

    TILE(0x06, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x0A, BGPAL_UI_FRAME),

    TILE(0x1A, BGPAL_UI_FRAME),
    TILE(0x1B, BGPAL_UI_FRAME),
    TILE(0x1B, BGPAL_UI_FRAME),
    TILE(0x21, BGPAL_UI_FRAME),
};

static const u16 gUnknown_080DA314[] = {
    TILE(0x01, BGPAL_UI_FRAME),
    TILE(0x02, BGPAL_UI_FRAME),
    TILE(0x03, BGPAL_UI_FRAME),
    TILE(0x05, BGPAL_UI_FRAME),

    TILE(0x66, BGPAL_UI_FRAME),
    TILE(0x67, BGPAL_UI_FRAME),
    TILE(0x67, BGPAL_UI_FRAME),
    TILE(0x68, BGPAL_UI_FRAME),

    TILE(0x06, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x0A, BGPAL_UI_FRAME),

    TILE(0x1A, BGPAL_UI_FRAME),
    TILE(0x1B, BGPAL_UI_FRAME),
    TILE(0x1B, BGPAL_UI_FRAME),
    TILE(0x21, BGPAL_UI_FRAME),
};

static const u16 gUnknown_080DA334[] = {
    TILE(0x72, BGPAL_UI_FRAME),
    TILE(0x73, BGPAL_UI_FRAME),
    TILE(0x73, BGPAL_UI_FRAME),
    TILE(0x74, BGPAL_UI_FRAME),

    TILE(0x75, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x76, BGPAL_UI_FRAME),

    TILE(0x75, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x76, BGPAL_UI_FRAME),

    TILE(0x77, BGPAL_UI_FRAME),
    TILE(0x78, BGPAL_UI_FRAME),
    TILE(0x78, BGPAL_UI_FRAME),
    TILE(0x79, BGPAL_UI_FRAME),
};

static const u16 gUnknown_080DA354[] = {
    TILE(0x01, BGPAL_UI_FRAME),
    TILE(0x02, BGPAL_UI_FRAME),
    TILE(0x03, BGPAL_UI_FRAME),
    TILE(0x05, BGPAL_UI_FRAME),

    TILE(0x0C, BGPAL_UI_FRAME),
    TILE(0x0D, BGPAL_UI_FRAME),
    TILE(0x0E, BGPAL_UI_FRAME),
    TILE(0x0F, BGPAL_UI_FRAME),

    TILE(0x0B, BGPAL_UI_FRAME),
    TILE(0x0E, BGPAL_UI_FRAME),
    TILE(0x0E, BGPAL_UI_FRAME),
    TILE(0x0F, BGPAL_UI_FRAME),

    TILE(0x1A, BGPAL_UI_FRAME),
    TILE(0x1B, BGPAL_UI_FRAME),
    TILE(0x1B, BGPAL_UI_FRAME),
    TILE(0x21, BGPAL_UI_FRAME),
};

static const u16 gUnknown_080DA374[] = {
    TILE(0x78, BGPAL_UI_FRAME),
    TILE(0x79, BGPAL_UI_FRAME),
    TILE(0x7A, BGPAL_UI_FRAME),
    TILE(0x7B, BGPAL_UI_FRAME),
    TILE(0x7C, BGPAL_UI_FRAME),
    TILE(0x7D, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x09, BGPAL_UI_FRAME),
    TILE(0x34, BGPAL_UI_FRAME),
    TILE(0x7A, BGPAL_UI_FRAME),
    TILE(0x7B, BGPAL_UI_FRAME),
    TILE(0x7C, BGPAL_UI_FRAME),
    TILE(0x63, BGPAL_UI_FRAME) + 0x0400,
    TILE(0x63, BGPAL_UI_FRAME),
    TILE(0x62, BGPAL_UI_FRAME) + 0x0400,
    TILE(0x62, BGPAL_UI_FRAME),
    TILE(0x60, BGPAL_UI_FRAME),
    TILE(0x60, BGPAL_UI_FRAME) + 0x0800,
    TILE(0x61, BGPAL_UI_FRAME),
    TILE(0x61, BGPAL_UI_FRAME) + 0x0800,
};

static const u16* sUiFrameModelTilemapLookup[] = {
    gUnknown_080DA2F4,
    gUnknown_080DA334,
    gUnknown_080DA354,
    gUnknown_080DA314,
};

static const u16* sLegacyUiFramePaletteLookup[] = {
    gLegacyUiFrameAPalette,
    gLegacyUiFrameBPalette,
    gLegacyUiFrameCPalette,
    gLegacyUiFrameDPalette,
};

static const u16* sUiFramePaletteLookup[] = {
    gUiFramePaletteA,
    gUiFramePaletteB,
    gUiFramePaletteC,
    gUiFramePaletteD,
};

static const void* sLegacyUiFrameImageLookup[] = {
    gLegacyUiFrameAImage,
    gLegacyUiFrameBImage,
    gLegacyUiFrameCImage,
    gLegacyUiFrameDImage,
};

static const void* sUiFrameImageLookup[] = {
    gUiFrameImage,
    gUiFrameImage,
    gUiFrameImage,
    gUiFrameImage,
};

static const u16* sStatBarPaletteLookup[] = {
    gUiBarPaletteA,
    gUiBarPaletteB,
    gUiBarPaletteC,
    gUiBarPaletteD,
};

// TODO: OBJ DATA/SPRITE HELPER DEFINITIONS
static u16 sSprite_Hand[] = {
    1,
    0x0002, 0x4000, 0x0000
};

static u8 sHandHOffsetLookup[] = {
    0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1,
};

EWRAM_DATA
static struct Vec2 sPrevHandScreenPosition = {};

EWRAM_DATA
static int sPrevHandClockFrame = 0;

void UnpackLegacyUiFramePalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_UI_FRAME;

    ApplyPalette(sLegacyUiFramePaletteLookup[gPlaySt.configWindowColor], palId);
}

void UnpackUiFramePalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_UI_FRAME;

    ApplyPalette(sUiFramePaletteLookup[gPlaySt.configWindowColor], palId);
}

void UnpackLegacyUiFrameImage(void* dest)
{
    if (dest == NULL)
        dest = BG_CHAR_ADDR(0);

    Decompress(sLegacyUiFrameImageLookup[gPlaySt.configWindowColor], dest);
}

void UnpackUiFrameImage(void* dest)
{
    if (dest == NULL)
        dest = BG_CHAR_ADDR(0);

    Decompress(sUiFrameImageLookup[gPlaySt.configWindowColor], dest);
}

void UnpackUiBarPalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_UI_STATBAR;

    ApplyPalette(sStatBarPaletteLookup[gPlaySt.configWindowColor], palId);
}

void UnpackUiFrameBuffered(int id)
{
    int bufSize;
    i8* bufAddr;

    if (id < 0)
        id = gPlaySt.configWindowColor;

    bufSize = GetPackSize(sUiFrameImageLookup[id]);
    bufAddr = gUnknown_02022288 - bufSize;

    Decompress(sUiFrameImageLookup[id], bufAddr);
    RegisterDataMove(bufAddr, BG_CHAR_ADDR(0), bufSize);

    UnpackUiFramePalette(-1);
}

void DrawUiFrame(u16* tilemap, int x, int y, int width, int height, int tilebase, int style)
{
    const u16* model = sUiFrameModelTilemapLookup[style];

    int xMax = x + width  - 1;
    int yMax = y + height - 1;

    int iy, ix;

    for (iy = y + 1; iy < yMax; iy += 2)
    {
        for (ix = x + 1; ix < xMax; ix += 2)
        {
            u16 tilemapOffset = TM_OFFSET(ix, iy);

            tilemap[tilemapOffset + TM_OFFSET(0, 0)] = model[6]  + tilebase; // center tile
            tilemap[tilemapOffset + TM_OFFSET(1, 0)] = model[6]  + tilebase; // center tile
            tilemap[tilemapOffset + TM_OFFSET(0, 1)] = model[9]  + tilebase; // bottom center tile (0, 0)
            tilemap[tilemapOffset + TM_OFFSET(1, 1)] = model[10] + tilebase; // bottom center tile (1, 0)
        }

        tilemap[TM_OFFSET(x,    iy+0)] = model[8]  + tilebase; // left center tile
        tilemap[TM_OFFSET(xMax, iy+0)] = model[7]  + tilebase; // right center tile 0
        tilemap[TM_OFFSET(x,    iy+1)] = model[8]  + tilebase; // left center tile
        tilemap[TM_OFFSET(xMax, iy+1)] = model[11] + tilebase; // right center tile 1
    }

    for (ix = x + 1; ix < xMax; ix += 2)
    {
        tilemap[TM_OFFSET(ix+0, y)]    = model[2]  + tilebase; // top center tile
        tilemap[TM_OFFSET(ix+1, y)]    = model[2]  + tilebase; // top centertile
        tilemap[TM_OFFSET(ix+0, yMax)] = model[13] + tilebase; // bottom center tile (0, 1)
        tilemap[TM_OFFSET(ix+1, yMax)] = model[14] + tilebase; // bottom center tile (1, 1)
    }

    tilemap[TM_OFFSET(x+0, y+0)] = model[0] + tilebase; // top left tile (0, 0)
    tilemap[TM_OFFSET(x+1, y+0)] = model[1] + tilebase; // top left tile (1, 0)
    tilemap[TM_OFFSET(x+0, y+1)] = model[4] + tilebase; // top left tile (0, 1)
    tilemap[TM_OFFSET(x+1, y+1)] = model[5] + tilebase; // top left tile (1, 1)

    tilemap[TM_OFFSET(xMax, y)] = model[3] + tilebase; // top right tile

    tilemap[TM_OFFSET(x, yMax)] = model[12] + tilebase; // bottom left tile

    tilemap[TM_OFFSET(xMax, yMax)] = model[15] + tilebase; // bottom right tile
}

#ifdef NONMATCHING

void ClearUiFrame(u16* tilemap, int x, int y, int width, int height)
{
    int i;

    width *= 2;
    tilemap += y*0x20 + x;

    for (i = 0; i < height; ++i)
    {
        CpuFill16(0, tilemap + i*0x20, width);
    }
}

#else // NONMATCHING

__attribute__((naked))
void ClearUiFrame(u16* tilemap, int x, int y, int width, int height)
{
    // :/

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #4\n\
        adds r5, r0, #0\n\
        ldr r0, [sp, #0x20]\n\
        lsls r3, r3, #1\n\
        lsls r2, r2, #5\n\
        adds r2, r2, r1\n\
        lsls r2, r2, #1\n\
        adds r5, r5, r2\n\
        cmp r0, #0\n\
        ble .L0804E35A\n\
        mov r7, sp\n\
        adds r4, r0, #0\n\
        movs r0, #0\n\
        mov r9, r0\n\
        lsls r0, r3, #0xa\n\
        lsrs r6, r0, #0xb\n\
        movs r0, #0x80\n\
        lsls r0, r0, #0x11\n\
        mov r8, r0\n\
    .L0804E342:\n\
        mov r0, r9\n\
        strh r0, [r7]\n\
        mov r0, sp\n\
        adds r1, r5, #0\n\
        mov r2, r8\n\
        orrs r2, r6\n\
        bl CpuSet\n\
        adds r5, #0x40\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bne .L0804E342\n\
    .L0804E35A:\n\
        add sp, #4\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

#ifdef NONMATCHING

void DrawUiFrame2(int x, int y, int width, int height, int style)
{
    const u16* model = sUiFrameModelTilemapLookup[style];

    int xMax = x + width  - 1;
    int yMax = y + height - 1;

    int iy, ix;

    u16 tilemapOffset;
    i8 r9;

    if (style != 3)
    {
        for (iy = y + 1; iy < yMax; iy += 2)
        {
            for (ix = x + 1; ix < xMax; ix += 2)
            {
                tilemapOffset = TM_OFFSET(ix, iy);

                gBg0Tm[tilemapOffset] = 0;
                gBg1Tm[tilemapOffset] = model[6];

                tilemapOffset += TM_OFFSET(1, 0);

                gBg0Tm[tilemapOffset] = 0;
                gBg1Tm[tilemapOffset] = model[6];

                tilemapOffset += TM_OFFSET(-1, 1);

                gBg0Tm[tilemapOffset] = 0;
                gBg1Tm[tilemapOffset] = model[9];

                tilemapOffset += TM_OFFSET(1, 0);

                gBg0Tm[tilemapOffset] = 0;
                gBg1Tm[tilemapOffset] = model[10];
            }

            gBg0Tm[TM_OFFSET(x,    iy+0)] = 0;
            gBg1Tm[TM_OFFSET(x,    iy+0)] = model[8]; // left center tile

            gBg0Tm[TM_OFFSET(xMax, iy+0)] = 0;
            gBg1Tm[TM_OFFSET(xMax, iy+0)] = model[7]; // right center tile 0

            gBg0Tm[TM_OFFSET(x,    iy+1)] = 0;
            gBg1Tm[TM_OFFSET(x,    iy+1)] = model[8]; // left center tile

            gBg0Tm[TM_OFFSET(xMax, iy+1)] = 0;
            gBg1Tm[TM_OFFSET(xMax, iy+1)] = model[11]; // right center tile 1
        }

        for (ix = x + 1; ix < xMax; ix += 2)
        {
            gBg0Tm[TM_OFFSET(ix+0, y)]    = 0;
            gBg1Tm[TM_OFFSET(ix+0, y)]    = model[2]; // top center tile

            gBg0Tm[TM_OFFSET(ix+1, y)]    = 0;
            gBg1Tm[TM_OFFSET(ix+1, y)]    = model[2]; // top centertile

            gBg0Tm[TM_OFFSET(ix+0, yMax)] = 0;
            gBg1Tm[TM_OFFSET(ix+0, yMax)] = model[13]; // bottom center tile (0, 1)

            gBg0Tm[TM_OFFSET(ix+1, yMax)] = 0;
            gBg1Tm[TM_OFFSET(ix+1, yMax)] = model[14]; // bottom center tile (1, 1)
        }

        gBg0Tm[TM_OFFSET(x,    y)]    = 0;
        gBg0Tm[TM_OFFSET(xMax, y)]    = 0;
        gBg0Tm[TM_OFFSET(x,    yMax)] = 0;
        gBg0Tm[TM_OFFSET(xMax, yMax)] = 0;

        gBg1Tm[TM_OFFSET(x+0, y+0)] = model[0]; // top left tile (0, 0)
        gBg1Tm[TM_OFFSET(x+1, y+0)] = model[1]; // top left tile (1, 0)
        gBg1Tm[TM_OFFSET(x+0, y+1)] = model[4]; // top left tile (0, 1)
        gBg1Tm[TM_OFFSET(x+1, y+1)] = model[5]; // top left tile (1, 1)

        gBg1Tm[TM_OFFSET(xMax, y)]    = model[3];  // top right tile
        gBg1Tm[TM_OFFSET(x,    yMax)] = model[12]; // bottom left tile
        gBg1Tm[TM_OFFSET(xMax, yMax)] = model[15]; // bottom right tile
    }
    else
    {
        for (iy = y + 1; iy < yMax; iy += 2)
        {
            r9 = (iy == y + 1);

            for (ix = x + 1; ix < xMax; ix += 2)
            {
                tilemapOffset = TM_OFFSET(ix, iy);

                gBg0Tm[tilemapOffset] = 0;
                gBg1Tm[tilemapOffset] = model[r9 ? 5 : 9];

                tilemapOffset += TM_OFFSET(1, 0);

                gBg0Tm[tilemapOffset] = 0;
                gBg1Tm[tilemapOffset] = model[r9 ? 6 : 10];

                tilemapOffset += TM_OFFSET(-1, 1);

                gBg0Tm[tilemapOffset] = 0;
                gBg1Tm[tilemapOffset] = model[9];

                tilemapOffset += TM_OFFSET(1, 0);

                gBg0Tm[tilemapOffset] = 0;
                gBg1Tm[tilemapOffset] = model[10];
            }

            gBg0Tm[TM_OFFSET(x,    iy+0)] = 0;
            gBg1Tm[TM_OFFSET(x,    iy+0)] = model[r9 ? 4 : 8]; // left center tile

            gBg0Tm[TM_OFFSET(xMax, iy+0)] = 0;
            gBg1Tm[TM_OFFSET(xMax, iy+0)] = model[r9 ? 7 : 11]; // right center tile 0

            gBg0Tm[TM_OFFSET(x,    iy+1)] = 0;
            gBg1Tm[TM_OFFSET(x,    iy+1)] = model[8]; // left center tile

            gBg0Tm[TM_OFFSET(xMax, iy+1)] = 0;
            gBg1Tm[TM_OFFSET(xMax, iy+1)] = model[11]; // right center tile 1
        }

        for (ix = x + 1; ix < xMax; ix += 2)
        {
            gBg0Tm[TM_OFFSET(ix+0, yMax)] = 0;
            gBg1Tm[TM_OFFSET(ix+0, yMax)] = model[13]; // bottom center tile (0, 1)

            gBg0Tm[TM_OFFSET(ix+1, yMax)] = 0;
            gBg1Tm[TM_OFFSET(ix+1, yMax)] = model[14]; // bottom center tile (1, 1)
        }

        gBg0Tm[TM_OFFSET(x,    yMax)] = 0;
        gBg0Tm[TM_OFFSET(xMax, yMax)] = 0;

        gBg1Tm[TM_OFFSET(x,    yMax)] = model[12]; // bottom left tile
        gBg1Tm[TM_OFFSET(xMax, yMax)] = model[15]; // bottom right tile
    }

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

#else // NONMATCHING

__attribute__((naked))
void DrawUiFrame2(int x, int y, int width, int height, int style)
{
    // :/

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x4c\n\
        str r0, [sp]\n\
        adds r5, r1, #0\n\
        ldr r4, [sp, #0x6c]\n\
        ldr r1, .L0804E5B0  @ sUiFrameModelTilemapLookup\n\
        lsls r0, r4, #2\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov ip, r0\n\
        ldr r0, [sp]\n\
        adds r2, r0, r2\n\
        subs r2, #1\n\
        str r2, [sp, #4]\n\
        adds r3, r5, r3\n\
        subs r3, #1\n\
        str r3, [sp, #8]\n\
        cmp r4, #3\n\
        bne .L0804E398\n\
        b .L0804E5BC\n\
    .L0804E398:\n\
        adds r0, r5, #1\n\
        str r0, [sp, #0x1c]\n\
        ldr r1, [sp]\n\
        adds r1, #1\n\
        str r1, [sp, #0x18]\n\
        lsls r5, r5, #5\n\
        str r5, [sp, #0x24]\n\
        lsls r2, r3, #5\n\
        str r2, [sp, #0x30]\n\
        cmp r0, r3\n\
        bge .L0804E48A\n\
        movs r3, #0\n\
        mov r9, r3\n\
        ldr r4, .L0804E5B4  @ gBg1Tm\n\
        mov r8, r4\n\
    .L0804E3B6:\n\
        ldr r7, [sp, #0x18]\n\
        lsls r5, r0, #5\n\
        adds r6, r0, #1\n\
        mov sl, r6\n\
        adds r0, #2\n\
        str r0, [sp, #0x20]\n\
        ldr r0, [sp, #4]\n\
        cmp r7, r0\n\
        bge .L0804E432\n\
        ldr r3, .L0804E5B8  @ gBg0Tm\n\
        movs r2, #0\n\
        ldr r6, .L0804E5B4  @ gBg1Tm\n\
    .L0804E3CE:\n\
        adds r0, r5, r7\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        adds r0, r1, r3\n\
        strh r2, [r0]\n\
        adds r1, r1, r6\n\
        str r1, [sp, #0x44]\n\
        mov r1, ip\n\
        ldrh r0, [r1, #0xc]\n\
        ldr r1, [sp, #0x44]\n\
        strh r0, [r1]\n\
        adds r0, r4, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        adds r0, r1, r3\n\
        strh r2, [r0]\n\
        adds r1, r1, r6\n\
        str r1, [sp, #0x44]\n\
        mov r1, ip\n\
        ldrh r0, [r1, #0xc]\n\
        ldr r1, [sp, #0x44]\n\
        strh r0, [r1]\n\
        adds r0, r4, #0\n\
        adds r0, #0x1f\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        adds r0, r1, r3\n\
        strh r2, [r0]\n\
        adds r1, r1, r6\n\
        str r1, [sp, #0x44]\n\
        mov r1, ip\n\
        ldrh r0, [r1, #0x12]\n\
        ldr r1, [sp, #0x44]\n\
        strh r0, [r1]\n\
        adds r0, r4, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0xf\n\
        adds r1, r0, r3\n\
        strh r2, [r1]\n\
        adds r0, r0, r6\n\
        mov r4, ip\n\
        ldrh r1, [r4, #0x14]\n\
        strh r1, [r0]\n\
        adds r7, #2\n\
        ldr r0, [sp, #4]\n\
        cmp r7, r0\n\
        blt .L0804E3CE\n\
    .L0804E432:\n\
        ldr r2, [sp]\n\
        adds r1, r5, r2\n\
        lsls r1, r1, #1\n\
        ldr r3, .L0804E5B8  @ gBg0Tm\n\
        adds r0, r1, r3\n\
        mov r4, r9\n\
        strh r4, [r0]\n\
        add r1, r8\n\
        mov r6, ip\n\
        ldrh r0, [r6, #0x10]\n\
        strh r0, [r1]\n\
        ldr r0, [sp, #4]\n\
        adds r1, r5, r0\n\
        lsls r1, r1, #1\n\
        adds r0, r1, r3\n\
        strh r4, [r0]\n\
        add r1, r8\n\
        ldrh r0, [r6, #0xe]\n\
        strh r0, [r1]\n\
        mov r1, sl\n\
        lsls r2, r1, #5\n\
        ldr r3, [sp]\n\
        adds r1, r2, r3\n\
        lsls r1, r1, #1\n\
        ldr r4, .L0804E5B8  @ gBg0Tm\n\
        adds r0, r1, r4\n\
        mov r5, r9\n\
        strh r5, [r0]\n\
        add r1, r8\n\
        ldrh r0, [r6, #0x10]\n\
        strh r0, [r1]\n\
        ldr r6, [sp, #4]\n\
        adds r2, r2, r6\n\
        lsls r2, r2, #1\n\
        adds r0, r2, r4\n\
        strh r5, [r0]\n\
        add r2, r8\n\
        mov r1, ip\n\
        ldrh r0, [r1, #0x16]\n\
        strh r0, [r2]\n\
        ldr r0, [sp, #0x20]\n\
        ldr r2, [sp, #8]\n\
        cmp r0, r2\n\
        blt .L0804E3B6\n\
    .L0804E48A:\n\
        ldr r7, [sp, #0x18]\n\
        ldr r3, [sp, #4]\n\
        cmp r7, r3\n\
        bge .L0804E526\n\
        ldr r6, .L0804E5B8  @ gBg0Tm\n\
        ldr r4, .L0804E5B4  @ gBg1Tm\n\
        ldr r5, [sp, #0x24]\n\
        adds r5, #1\n\
        str r5, [sp, #0xc]\n\
        ldr r3, [sp, #0x30]\n\
        adds r3, #1\n\
        lsls r2, r7, #1\n\
        ldr r1, [sp, #0x30]\n\
        lsls r0, r1, #1\n\
        adds r1, r0, r4\n\
        adds r1, r2, r1\n\
        str r1, [sp, #0x34]\n\
        adds r0, r0, r6\n\
        adds r0, r2, r0\n\
        str r0, [sp, #0x38]\n\
        ldr r5, [sp, #0x24]\n\
        lsls r0, r5, #1\n\
        adds r1, r0, r4\n\
        adds r1, r1, r2\n\
        mov sl, r1\n\
        adds r0, r0, r6\n\
        adds r0, r0, r2\n\
        mov r9, r0\n\
        lsls r3, r3, #1\n\
        adds r0, r3, r4\n\
        adds r0, r0, r2\n\
        mov r8, r0\n\
        adds r3, r3, r6\n\
        adds r3, r2, r3\n\
        ldr r0, [sp, #0xc]\n\
        lsls r0, r0, #1\n\
        str r0, [sp, #0x3c]\n\
        adds r4, r0, r4\n\
        adds r1, r2, r4\n\
        adds r6, r0, r6\n\
        adds r2, r2, r6\n\
    .L0804E4DC:\n\
        movs r5, #0\n\
        mov r4, r9\n\
        strh r5, [r4]\n\
        mov r6, ip\n\
        ldrh r0, [r6, #4]\n\
        mov r4, sl\n\
        strh r0, [r4]\n\
        strh r5, [r2]\n\
        ldrh r0, [r6, #4]\n\
        strh r0, [r1]\n\
        ldr r6, [sp, #0x38]\n\
        strh r5, [r6]\n\
        mov r4, ip\n\
        ldrh r0, [r4, #0x1a]\n\
        ldr r5, [sp, #0x34]\n\
        strh r0, [r5]\n\
        movs r6, #0\n\
        strh r6, [r3]\n\
        ldrh r0, [r4, #0x1c]\n\
        mov r4, r8\n\
        strh r0, [r4]\n\
        adds r5, #4\n\
        str r5, [sp, #0x34]\n\
        ldr r5, [sp, #0x38]\n\
        adds r5, #4\n\
        str r5, [sp, #0x38]\n\
        movs r6, #4\n\
        add sl, r6\n\
        add r9, r6\n\
        add r8, r6\n\
        adds r3, #4\n\
        adds r1, #4\n\
        adds r2, #4\n\
        adds r7, #2\n\
        ldr r0, [sp, #4]\n\
        cmp r7, r0\n\
        blt .L0804E4DC\n\
    .L0804E526:\n\
        ldr r1, [sp, #0x24]\n\
        ldr r3, [sp]\n\
        adds r2, r1, r3\n\
        lsls r2, r2, #1\n\
        ldr r4, .L0804E5B8  @ gBg0Tm\n\
        adds r0, r2, r4\n\
        movs r1, #0\n\
        strh r1, [r0]\n\
        ldr r5, [sp, #0x24]\n\
        ldr r6, [sp, #4]\n\
        adds r5, r5, r6\n\
        str r5, [sp, #0x10]\n\
        lsls r6, r5, #1\n\
        adds r0, r6, r4\n\
        strh r1, [r0]\n\
        ldr r0, [sp, #0x30]\n\
        adds r4, r0, r3\n\
        lsls r4, r4, #1\n\
        ldr r3, .L0804E5B8  @ gBg0Tm\n\
        adds r0, r4, r3\n\
        strh r1, [r0]\n\
        ldr r5, [sp, #0x30]\n\
        ldr r0, [sp, #4]\n\
        adds r3, r5, r0\n\
        lsls r3, r3, #1\n\
        ldr r5, .L0804E5B8  @ gBg0Tm\n\
        adds r0, r3, r5\n\
        strh r1, [r0]\n\
        ldr r0, .L0804E5B4  @ gBg1Tm\n\
        adds r2, r2, r0\n\
        mov r1, ip\n\
        ldrh r0, [r1]\n\
        strh r0, [r2]\n\
        ldr r0, [sp, #0x24]\n\
        adds r0, #1\n\
        ldr r2, [sp]\n\
        adds r0, r0, r2\n\
        lsls r0, r0, #1\n\
        ldr r5, .L0804E5B4  @ gBg1Tm\n\
        adds r0, r0, r5\n\
        ldrh r1, [r1, #2]\n\
        strh r1, [r0]\n\
        ldr r1, [sp, #0x1c]\n\
        lsls r0, r1, #5\n\
        adds r1, r0, r2\n\
        lsls r1, r1, #1\n\
        adds r1, r1, r5\n\
        mov r5, ip\n\
        ldrh r2, [r5, #8]\n\
        strh r2, [r1]\n\
        adds r0, #1\n\
        ldr r1, [sp]\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #1\n\
        ldr r2, .L0804E5B4  @ gBg1Tm\n\
        adds r0, r0, r2\n\
        ldrh r1, [r5, #0xa]\n\
        strh r1, [r0]\n\
        adds r6, r6, r2\n\
        ldrh r0, [r5, #6]\n\
        strh r0, [r6]\n\
        adds r4, r4, r2\n\
        ldrh r0, [r5, #0x18]\n\
        strh r0, [r4]\n\
        adds r3, r3, r2\n\
        ldrh r0, [r5, #0x1e]\n\
        strh r0, [r3]\n\
        b .L0804E76A\n\
        .align 2, 0\n\
    .L0804E5B0: .4byte sUiFrameModelTilemapLookup\n\
    .L0804E5B4: .4byte gBg1Tm\n\
    .L0804E5B8: .4byte gBg0Tm\n\
    .L0804E5BC:\n\
        adds r0, r5, #1\n\
        str r0, [sp, #0x1c]\n\
        ldr r3, [sp]\n\
        adds r3, #1\n\
        str r3, [sp, #0x18]\n\
        ldr r4, [sp, #8]\n\
        lsls r4, r4, #5\n\
        str r4, [sp, #0x30]\n\
        ldr r5, [sp, #8]\n\
        cmp r0, r5\n\
        blt .L0804E5D4\n\
        b .L0804E6F0\n\
    .L0804E5D4:\n\
        movs r1, #0\n\
        ldr r6, [sp, #0x1c]\n\
        cmp r0, r6\n\
        bne .L0804E5DE\n\
        movs r1, #1\n\
    .L0804E5DE:\n\
        mov r9, r1\n\
        ldr r7, [sp, #0x18]\n\
        lsls r5, r0, #5\n\
        adds r1, r0, #1\n\
        mov sl, r1\n\
        adds r0, #2\n\
        str r0, [sp, #0x20]\n\
        mov r2, ip\n\
        adds r2, #0x10\n\
        str r2, [sp, #0x28]\n\
        mov r3, ip\n\
        adds r3, #0x16\n\
        str r3, [sp, #0x2c]\n\
        ldr r4, [sp, #4]\n\
        cmp r7, r4\n\
        bge .L0804E67C\n\
        ldr r6, .L0804E794  @ gBg0Tm\n\
        mov r8, r6\n\
        movs r3, #0\n\
        ldr r2, .L0804E798  @ gBg1Tm\n\
        mov r0, r9\n\
        str r0, [sp, #0x48]\n\
    .L0804E60A:\n\
        adds r0, r5, r7\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        mov r6, r8\n\
        adds r0, r1, r6\n\
        strh r3, [r0]\n\
        adds r1, r1, r2\n\
        mov r0, ip\n\
        adds r0, #0x12\n\
        ldr r6, [sp, #0x48]\n\
        cmp r6, #0\n\
        beq .L0804E626\n\
        subs r0, #8\n\
    .L0804E626:\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        adds r0, r4, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        mov r6, r8\n\
        adds r0, r1, r6\n\
        strh r3, [r0]\n\
        adds r1, r1, r2\n\
        mov r0, ip\n\
        adds r0, #0x14\n\
        ldr r6, [sp, #0x48]\n\
        cmp r6, #0\n\
        beq .L0804E646\n\
        subs r0, #8\n\
    .L0804E646:\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        adds r0, r4, #0\n\
        adds r0, #0x1f\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        mov r6, r8\n\
        adds r0, r1, r6\n\
        strh r3, [r0]\n\
        adds r1, r1, r2\n\
        mov r6, ip\n\
        ldrh r0, [r6, #0x12]\n\
        strh r0, [r1]\n\
        adds r0, r4, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0xf\n\
        mov r4, r8\n\
        adds r1, r0, r4\n\
        strh r3, [r1]\n\
        adds r0, r0, r2\n\
        ldrh r1, [r6, #0x14]\n\
        strh r1, [r0]\n\
        adds r7, #2\n\
        ldr r6, [sp, #4]\n\
        cmp r7, r6\n\
        blt .L0804E60A\n\
    .L0804E67C:\n\
        ldr r1, [sp]\n\
        adds r0, r5, r1\n\
        lsls r0, r0, #1\n\
        ldr r2, .L0804E794  @ gBg0Tm\n\
        adds r1, r0, r2\n\
        movs r6, #0\n\
        strh r6, [r1]\n\
        ldr r3, .L0804E798  @ gBg1Tm\n\
        adds r1, r0, r3\n\
        mov r4, r9\n\
        ldr r0, [sp, #0x28]\n\
        cmp r4, #0\n\
        beq .L0804E69A\n\
        mov r0, ip\n\
        adds r0, #8\n\
    .L0804E69A:\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        ldr r0, [sp, #4]\n\
        adds r1, r5, r0\n\
        lsls r1, r1, #1\n\
        ldr r2, .L0804E794  @ gBg0Tm\n\
        adds r0, r1, r2\n\
        strh r6, [r0]\n\
        ldr r3, .L0804E798  @ gBg1Tm\n\
        adds r1, r1, r3\n\
        ldr r0, [sp, #0x2c]\n\
        cmp r4, #0\n\
        beq .L0804E6B8\n\
        mov r0, ip\n\
        adds r0, #0xe\n\
    .L0804E6B8:\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        mov r4, sl\n\
        lsls r2, r4, #5\n\
        ldr r5, [sp]\n\
        adds r1, r2, r5\n\
        lsls r1, r1, #1\n\
        ldr r3, .L0804E794  @ gBg0Tm\n\
        adds r0, r1, r3\n\
        strh r6, [r0]\n\
        ldr r4, .L0804E798  @ gBg1Tm\n\
        adds r1, r1, r4\n\
        mov r5, ip\n\
        ldrh r0, [r5, #0x10]\n\
        strh r0, [r1]\n\
        ldr r0, [sp, #4]\n\
        adds r2, r2, r0\n\
        lsls r2, r2, #1\n\
        adds r0, r2, r3\n\
        strh r6, [r0]\n\
        adds r2, r2, r4\n\
        ldrh r0, [r5, #0x16]\n\
        strh r0, [r2]\n\
        ldr r0, [sp, #0x20]\n\
        ldr r1, [sp, #8]\n\
        cmp r0, r1\n\
        bge .L0804E6F0\n\
        b .L0804E5D4\n\
    .L0804E6F0:\n\
        ldr r7, [sp, #0x18]\n\
        ldr r2, [sp, #4]\n\
        cmp r7, r2\n\
        bge .L0804E740\n\
        ldr r3, .L0804E794  @ gBg0Tm\n\
        mov r9, r3\n\
        movs r4, #0\n\
        mov r8, r4\n\
        ldr r3, .L0804E798  @ gBg1Tm\n\
        ldr r2, [sp, #0x30]\n\
        adds r2, #1\n\
        lsls r4, r7, #1\n\
        ldr r5, [sp, #0x30]\n\
        lsls r0, r5, #1\n\
        adds r1, r0, r3\n\
        adds r5, r4, r1\n\
        add r0, r9\n\
        adds r6, r4, r0\n\
        lsls r2, r2, #1\n\
        adds r3, r2, r3\n\
        adds r1, r4, r3\n\
        add r2, r9\n\
        adds r4, r4, r2\n\
    .L0804E71E:\n\
        mov r0, r8\n\
        strh r0, [r6]\n\
        mov r2, ip\n\
        ldrh r0, [r2, #0x1a]\n\
        strh r0, [r5]\n\
        mov r3, r8\n\
        strh r3, [r4]\n\
        ldrh r0, [r2, #0x1c]\n\
        strh r0, [r1]\n\
        adds r5, #4\n\
        adds r6, #4\n\
        adds r1, #4\n\
        adds r4, #4\n\
        adds r7, #2\n\
        ldr r0, [sp, #4]\n\
        cmp r7, r0\n\
        blt .L0804E71E\n\
    .L0804E740:\n\
        ldr r1, [sp, #0x30]\n\
        ldr r3, [sp]\n\
        adds r2, r1, r3\n\
        lsls r2, r2, #1\n\
        ldr r4, .L0804E794  @ gBg0Tm\n\
        adds r0, r2, r4\n\
        movs r3, #0\n\
        strh r3, [r0]\n\
        ldr r5, [sp, #4]\n\
        adds r1, r1, r5\n\
        lsls r1, r1, #1\n\
        adds r0, r1, r4\n\
        strh r3, [r0]\n\
        ldr r6, .L0804E798  @ gBg1Tm\n\
        adds r2, r2, r6\n\
        mov r3, ip\n\
        ldrh r0, [r3, #0x18]\n\
        strh r0, [r2]\n\
        adds r1, r1, r6\n\
        ldrh r0, [r3, #0x1e]\n\
        strh r0, [r1]\n\
    .L0804E76A:\n\
        movs r0, #0\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl SetBgOffset\n\
        movs r0, #1\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl SetBgOffset\n\
        movs r0, #3\n\
        bl EnableBgSync\n\
        add sp, #0x4c\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    .L0804E794: .4byte gBg0Tm\n\
    .L0804E798: .4byte gBg1Tm\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void DisplayUiHand(int x, int y)
{
    if ((GetGameTime() - 1) == sPrevHandClockFrame)
    {
        x = (x + sPrevHandScreenPosition.x) >> 1;
        y = (y + sPrevHandScreenPosition.y) >> 1;
    }

    sPrevHandScreenPosition.x = x;
    sPrevHandScreenPosition.y = y;
    sPrevHandClockFrame = GetGameTime();

    x += (sHandHOffsetLookup[GetGameTime() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, 0);
}

void DisplayUiHand_unused(int x, int y)
{
    x += (sHandHOffsetLookup[GetGameTime() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, 0);
}

void DisplayFrozenUiHand(int x, int y)
{
    x -= 12;
    PutSprite(3, x, y, sSprite_Hand, 0);
}

int GetUiHandPrevDisplayX(void)
{
    return sPrevHandScreenPosition.x;
}

int GetUiHandPrevDisplayY(void)
{
    return sPrevHandScreenPosition.y;
}

void ClearBg0Bg1(void)
{
    TmFill(gBg0Tm, 0);
    TmFill(gBg1Tm, 0);

    EnableBgSync(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void DrawUiItemHover(int x, int y, int width)
{
    int xMax = x + width - 1;
    y += 1;

    // TODO: meaningful constants

    gBg1Tm[TM_OFFSET(x, y)] = TILE(0x7A, BGPAL_UI_FRAME);

    for (x += 1; x < xMax; ++x)
        gBg1Tm[TM_OFFSET(x, y)] = TILE(0x7B, BGPAL_UI_FRAME);

    gBg1Tm[TM_OFFSET(x, y)] = TILE(0x7C, BGPAL_UI_FRAME);

    EnableBgSync(BG1_SYNC_BIT);
}

void ClearUiItemHover(int x, int y, int width)
{
    int xMax = x + width - 1;
    y += 1;

    for (; x < xMax; x += 2)
    {
        gBg1Tm[TM_OFFSET(x + 0, y)] = gUnknown_080DA374[6];
        gBg1Tm[TM_OFFSET(x + 1, y)] = gUnknown_080DA374[7];
    }

    gBg1Tm[TM_OFFSET(xMax, y)] = (width % 2)
        ? gUnknown_080DA374[6]
        : gUnknown_080DA374[7];

    EnableBgSync(BG1_SYNC_BIT);
}

void DrawUiItemHoverExt(int bg, int base, int x, int y, int width)
{
    u16* tilemap;
    int xMax;

    xMax = x + width - 1;
    y += 1;

    tilemap = GetBgTilemap(bg);

    tilemap[TM_OFFSET(x, y)] = TILE(0x7A, BGPAL_UI_FRAME) + base;

    for (x += 1; x < xMax; ++x)
        tilemap[TM_OFFSET(x, y)] = TILE(0x7B, BGPAL_UI_FRAME) + base;

    tilemap[TM_OFFSET(x, y)] = TILE(0x7C, BGPAL_UI_FRAME) + base;

    EnableBgSync(BG_SYNC_BIT(bg));
}

void ClearUiItemHoverExt(int bg, int base, int x, int y, int width)
{
    u16* tilemap;
    int xMax;

    xMax = x + width - 1;
    y += 1;

    tilemap = GetBgTilemap(bg);

    for (; x < xMax; x += 2)
    {
        tilemap[TM_OFFSET(x + 0, y)] = gUnknown_080DA374[6] + base;
        tilemap[TM_OFFSET(x + 1, y)] = gUnknown_080DA374[7] + base;
    }

    tilemap[TM_OFFSET(xMax, y)] = (width % 2)
        ? gUnknown_080DA374[6] + base
        : gUnknown_080DA374[7] + base;

    EnableBgSync(BG_SYNC_BIT(bg));
}

void UnpackUnkUiFrame(void* vram, int palId, int palCount)
{
    Decompress(gUnkUiFrameImage, vram);
    ApplyPalettes(gUnkUiFramePalettes, palId, palCount);
}

void DisplayUiHandExt(int x, int y, unsigned objTileOffset)
{
    if ((GetGameTime() - 1) == sPrevHandClockFrame)
    {
        x = (x + sPrevHandScreenPosition.x) >> 1;
        y = (y + sPrevHandScreenPosition.y) >> 1;
    }

    sPrevHandScreenPosition.x = x;
    sPrevHandScreenPosition.y = y;
    sPrevHandClockFrame = GetGameTime();

    x += (sHandHOffsetLookup[GetGameTime() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, objTileOffset << 15 >> 20);
}

void DisplayFrozenUiHandExt(int x, int y, unsigned objTileOffset)
{
    x -= 12;
    PutSprite(3, x, y, sSprite_Hand, objTileOffset << 15 >> 20);
}

void LoadLegacyUiFrameGraphics(void)
{
    UnpackLegacyUiFrameImage(NULL);
    UnpackLegacyUiFramePalette(-1);
}

void LoadUiFrameGraphics(void)
{
    UnpackUiFrameImage(NULL);
    UnpackUiFramePalette(-1);
}

void LoadUiFrameGraphicsTo(unsigned vramOffset, int palId)
{
    UnpackUiFrameImage((void*)(VRAM + vramOffset));
    UnpackUiFramePalette(palId);
}
