
#include "global.h"

#include "proc.h"
#include "oam.h"

struct SceneState
{
    /* 00 */ const char* nextChar;
    /* 04 */ u32 unk04;
    /* 08 */ u8 defaultColor;
    /* 09 */ u8 unkLine09;
    /* 0A */ u8 unkLine0A;
    /* 0B */ u8 unkLine0B;
    /* 0C */ u8 unk0C;
    /* 0D */ u8 unk0D;
    /* 0E */ u8 unkWidth0E;
    /* 0F */ i8 speakingFaceSlot;
    /* 10 */ i8 unkFaceSlot10;
    /* 11 */ i8 selectedFaceSlot;
    /* 12 */ u8 instantScroll;
    /* 13 */ u8 charDisplayDelay;
    /* 14 */ u8 charDisplayClock;
    /* 15 */ u8 unk15;
    /* 16 */ u8 unk16;
    /* 17 */ u8 unk17;
    /* 18 */ ProcPtr faces[8];
    /* 38 */ u32 unk38;
    /* 3C */ u32 userNumber;
    /* 40 */ char userNumberString[0x20];
    /* 60 */ char userString[0x20];
    /* 80 */ u16 config;
    /* 82 */ u8 unk82;
    /* 83 */ u8 unk83;
};

struct ChoiceEntryInfo
{
    /* 00 */ u16 msgid;
    /* 04 */ void(*on_switch_in)(void);
};

// various bits of the box opening animation
extern u8 CONST_DATA gUnknown_089E8484[];
extern u8 CONST_DATA gUnknown_089E8434[];
extern u8 CONST_DATA gUnknown_089E83E0[];
extern u8 CONST_DATA gUnknown_089E8384[];
extern u8 CONST_DATA gUnknown_089E82E0[];
extern u8 CONST_DATA gUnknown_089E8238[];

// funcs
void func_0800662C(ProcPtr);
void func_08006650(ProcPtr);
void func_080066A8(ProcPtr);
void DialogueSkipInputListener_OnLoop(ProcPtr);
void DialogueMain_OnEnd(ProcPtr);
void DialogueMain_OnInit(ProcPtr);
void DialogueMain_OnLoop(ProcPtr);
void func_08007AB0(ProcPtr);
void func_08007B0C(ProcPtr);
void DialoguePauseTimer_OnLoop(ProcPtr);
void func_08007C4C(ProcPtr);
void func_08007D38(ProcPtr);
void func_08007DA4(ProcPtr);
void func_080B42E8(void);
void func_080B4308(void);
void DialogueTextChoice_OnLoop(ProcPtr);
void func_08007F9C(ProcPtr);
void func_08007FDC(ProcPtr);
void func_080080D0(ProcPtr);
void func_08008108(ProcPtr);
void func_080083F8(ProcPtr);
void func_08008B30(ProcPtr);
void func_08008AA8(ProcPtr);
void func_08008F54(ProcPtr);
i8 func_08008F3C(ProcPtr);
void func_08008FAC(ProcPtr);
void func_08008FB4(ProcPtr);
void func_0800903C(ProcPtr);
void func_0800904C(ProcPtr);
void func_08009100(ProcPtr);
void func_08009250(ProcPtr);
void func_08009198(ProcPtr);
void func_08009200(ProcPtr);

struct ProcScr CONST_DATA gUnknown_08591304[] =
{
    PROC_SLEEP(0),
    PROC_CALL(func_0800662C),

    PROC_SLEEP(2),
    PROC_CALL(func_08006650),

    PROC_SLEEP(0),
    PROC_CALL(func_080066A8),

    PROC_END,
};

static struct SceneState sSceneStateCore;
struct SceneState* CONST_DATA gUnknown_0859133C = &sSceneStateCore;

struct ProcScr CONST_DATA gUnknown_08591340[] =
{
    PROC_MARK(PROC_MARK_5),
    PROC_REPEAT(DialogueSkipInputListener_OnLoop),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_08591358[] =
{
    PROC_MARK(PROC_MARK_5),
    PROC_ONEND(DialogueMain_OnEnd),

    PROC_SLEEP(1),

    PROC_CALL(DialogueMain_OnInit),
    PROC_REPEAT(DialogueMain_OnLoop),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_08591388[] =
{
    PROC_BLOCK,
};

struct FaceVramEnt CONST_DATA gUnknown_08591390[4] =
{
    [0] =
    {
        .tileOffset = 0x20 * 0x40,
        .paletteId  = 3,
    },

    [1] =
    {
        .tileOffset = 0x20 * 0x40,
        .paletteId  = 3,
    },

    [2] =
    {
        .tileOffset = 0x20 * 0x40,
        .paletteId  = 3,
    },

    [3] =
    {
        .tileOffset = 0x20 * 0x40,
        .paletteId  = 3,
    },
};

struct ProcScr CONST_DATA gUnknown_085913B0[] =
{
    PROC_SLEEP(1),

    PROC_CALL(func_08007AB0),
    PROC_REPEAT(func_08007B0C),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_085913D0[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_SLEEP(1),
    PROC_REPEAT(DialoguePauseTimer_OnLoop),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_085913F0[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_SLEEP(8),
    PROC_REPEAT(func_08007C4C),
    PROC_SLEEP(1),

    PROC_END,
};

static u16 CONST_DATA sObj_PressKeyArrow0[] =
{
    1, OAM0_SHAPE_8x8 + OAM0_Y(0), OAM1_SIZE_8x8, OAM2_CHR(0),
};

static u16 CONST_DATA sObj_PressKeyArrow1[] =
{
    1, OAM0_SHAPE_8x8 + OAM0_Y(1), OAM1_SIZE_8x8, OAM2_CHR(0),
};

static u16 CONST_DATA sObj_PressKeyArrow2[] =
{
    1, OAM0_SHAPE_8x8 + OAM0_Y(2), OAM1_SIZE_8x8, OAM2_CHR(0),
};

const u16* CONST_DATA gUnknown_08591430[] =
{
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,
    sObj_PressKeyArrow0,

    sObj_PressKeyArrow1,

    sObj_PressKeyArrow2,
    sObj_PressKeyArrow2,
    sObj_PressKeyArrow2,
    sObj_PressKeyArrow2,

    sObj_PressKeyArrow1,
};

struct ProcScr CONST_DATA gUnknown_08591470[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_CALL(func_08007D38),
    PROC_REPEAT(func_08007DA4),

    PROC_END,
};

struct ChoiceEntryInfo CONST_DATA gUnknown_08591490[2] =
{
    { 0x843, NULL }, // Yes
    { 0x844, NULL }, // No
};

struct ChoiceEntryInfo CONST_DATA gUnknown_085914A0[2] =
{
    { 0x845, func_080B42E8 }, // Buy
    { 0x846, func_080B4308 }, // Sell
};

struct ProcScr CONST_DATA gUnknown_085914B0[] =
{
    PROC_SLEEP(8),
    PROC_REPEAT(DialogueTextChoice_OnLoop),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_085914C8[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_CALL(func_08007F9C),
    PROC_REPEAT(func_08007FDC),

    PROC_SLEEP(1),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_085914F0[] =
{
    PROC_MARK(PROC_MARK_5),

    PROC_CALL(func_080080D0),
    PROC_SLEEP(0),
    PROC_CALL(func_08008108),

    PROC_SLEEP(1),

    PROC_END,
};

int CONST_DATA gUnknown_08591520[4] = { 8, 16, 32, 64 };

struct ProcScr CONST_DATA gUnknown_08591530[] =
{
    PROC_REPEAT(func_080083F8),
    PROC_END,
};

void nullsub_74(ProcPtr);
void func_080087A8(ProcPtr);
void func_0800880C(ProcPtr);
void func_08008840(ProcPtr);

struct ProcScr CONST_DATA gUnknown_08591540[] =
{
    PROC_MARK(PROC_MARK_5),
    PROC_ONEND(nullsub_74),

    PROC_CALL(func_080087A8),
    PROC_REPEAT(func_0800880C),
    PROC_REPEAT(func_08008840),

    PROC_END,
};

int CONST_DATA gUnknown_08591570[8] = { 3, 6, 9, 21, 24, 27, -8, 38 };

u16 CONST_DATA gUnknown_08591590[] =
{
    4,
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8),       OAM2_CHR(0x21),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8 + 64),  OAM2_CHR(0x29),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8 + 128), OAM2_CHR(0x31),
    OAM0_SHAPE_32x32 + OAM0_Y(8), OAM1_SIZE_32x32 + OAM0_Y(8 + 192), OAM2_CHR(0x39),
};

u16 CONST_DATA gUnknown_085915AA[] =
{
    12,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32,               OAM2_CHR(0x00),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(64),  OAM2_CHR(0x08),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(128), OAM2_CHR(0x10),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(192), OAM2_CHR(0x18),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16,               OAM2_CHR(0x80),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(32),  OAM2_CHR(0x84),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(64),  OAM2_CHR(0x88),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(96),  OAM2_CHR(0x8C),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(128), OAM2_CHR(0x90),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(160), OAM2_CHR(0x94),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(192), OAM2_CHR(0x98),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(224), OAM2_CHR(0x9C),
};

struct ProcScr CONST_DATA gUnusued_085915F4[] =
{
    PROC_ONEND(func_08008B30),
    PROC_REPEAT(func_08008AA8),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_0859160C[] =
{
    PROC_ONEND(func_08008F54),
    PROC_WHILE(func_08008F3C),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_08591624[] =
{
    PROC_CALL(func_08008FAC),
    PROC_REPEAT(func_08008FB4),

    PROC_END,
};

struct ProcScr CONST_DATA gUnknown_0859163C[] =
{
    PROC_SLEEP(0),

    PROC_CALL(func_0800903C),
    PROC_REPEAT(func_0800904C),
    PROC_REPEAT(func_08009100),

    PROC_END,
};

struct ProcScr CONST_DATA gUnused_0859166C[] =
{
    PROC_SLEEP(0),

    PROC_ONEND(func_08009250),

    PROC_CALL(func_08009198),
    PROC_REPEAT(func_08009200),

    PROC_END,
};

const void* const gUnknown_080D78EC[] =
{
    gUnknown_089E8484,
    gUnknown_089E8434,
    gUnknown_089E83E0,
    gUnknown_089E8384,
    gUnknown_089E82E0,
    gUnknown_089E8238,

    NULL,
};

const int gUnknown_080D7908[] = { 0, 8 };
