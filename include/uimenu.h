#ifndef GUARD_UI_MENU_H
#define GUARD_UI_MENU_H

#include "global.h"
#include "text.h"

// config

enum
{
    MENU_ITEM_MAX = 11,       //!< max menu item count
    MENU_OVERRIDE_MAX = 0x10, //!< max menu overrides
};

// type decls

struct MenuInfo;
struct MenuItemDef;

struct MenuProc;
struct MenuItemProc;

struct MenuRect { i8 x, y, w, h; };

typedef u8(*MenuAvailabilityFunc)(const struct MenuItemDef*, int);
typedef u8(*MenuSelectFunc)(struct MenuProc*, struct MenuItemProc*);

struct MenuItemDef
{
    /* 00 */ const char* name;

    /* 04 */ u16 nameMsgId, helpMsgId;
    /* 08 */ u8 color, overrideId;

    /* 0C */ u8(*isAvailable)(const struct MenuItemDef*, int number);

    /* 10 */ int(*onDraw)(struct MenuProc*, struct MenuItemProc*);

    /* 14 */ u8(*onSelected)(struct MenuProc*, struct MenuItemProc*);
    /* 18 */ u8(*onIdle)(struct MenuProc*, struct MenuItemProc*);

    /* 1C */ int(*on_switch_in)(struct MenuProc*, struct MenuItemProc*);
    /* 20 */ int(*on_switch_out)(struct MenuProc*, struct MenuItemProc*);
};

struct MenuInfo
{
    /* 00 */ struct MenuRect rect;
    /* 04 */ u8 style;
    /* 08 */ const struct MenuItemDef* menuItems;

    /* 0C */ void(*on_init)(struct MenuProc*);
    /* 10 */ void(*on_end)(struct MenuProc*);
    /* 14 */ void(*_u14)(struct MenuProc*);
    /* 18 */ u8(*onBPress)(struct MenuProc*, struct MenuItemProc*);
    /* 1C */ u8(*onRPress)(struct MenuProc*);
    /* 20 */ void(*onHelpBox)(struct MenuProc*, struct MenuItemProc*);
};

struct MenuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct MenuRect rect;
    /* 30 */ const struct MenuInfo* def;

    /* 34 */ struct MenuItemProc* menuItems[MENU_ITEM_MAX];

    /* 60 */ u8 itemCount;
    /* 61 */ u8 itemCurrent;
    /* 62 */ u8 itemPrevious;
    /* 63 */ u8 state;

    /* 64 */ u8 backBg : 2;
    /* 64 */ u8 frontBg : 2;

    /* 66 */ u16 tile;
    /* 68 */ u16 unk68;
};

struct MenuItemProc
{
    /* 00 */ PROC_HEADER;

    /* 2A */ short xTile;
    /* 2C */ short yTile;

    /* 30 */ const struct MenuItemDef* def;

    /* 34 */ struct Text text;

    /* 3C */ i8 itemNumber;
    /* 3D */ u8 availability;
};

enum
{
    // Menu availability identifiers

    MENU_ENABLED  = 1,
    MENU_DISABLED = 2,
    MENU_NOTSHOWN = 3,
};

enum
{
    // Menu state bits

    MENU_STATE_GAMELOCKING = (1 << 0),
    MENU_STATE_UNUSED1 = (1 << 1),
    MENU_STATE_ENDING = (1 << 2),
    MENU_STATE_NOTSHOWN = (1 << 3),
    MENU_STATE_FLAT = (1 << 4),
    MENU_STATE_NOCURSOR = (1 << 5),
    MENU_STATE_FROZEN = (1 << 6),
    MENU_STATE_DOOMED = (1 << 7),
};

enum
{
    // Menu action bits

    MENU_ACT_SKIPCURSOR = (1 << 0),
    MENU_ACT_END = (1 << 1),
    MENU_ACT_SND6A = (1 << 2),
    MENU_ACT_SND6B = (1 << 3),
    MENU_ACT_CLEAR = (1 << 4),
    MENU_ACT_ENDFACE = (1 << 5),
    MENU_ACT_UNUSED6 = (1 << 6),
    MENU_ACT_DOOM = (1 << 7),
};

enum
{
    // Menu item identifiers

    MENU_ITEM_NONE = 0,
};

// function decls

struct MenuProc* StartMenuAdjusted(const struct MenuInfo* def, int xSubject, int xTileLeft, int xTileRight);
struct MenuProc* StartMenuChild(const struct MenuInfo* def, Proc_t* parent);
struct MenuProc* StartOrphanMenuAt(const struct MenuInfo* def, struct MenuRect rect);
struct MenuProc* StartMenu(const struct MenuInfo* def);
struct MenuProc* StartOrphanMenuAdjustedExt(const struct MenuInfo* def, int xSubject, int xTileLeft, int xTileRight, int backBg, int tile, int frontBg, int unk);
struct MenuProc* StartMenuExt2(const struct MenuInfo* def, int backBg, int tile, int frontBg, int unk, Proc_t* parent);
struct MenuProc* StartOrphanMenuAtExt(const struct MenuInfo* def, struct MenuRect rect, int backBg, int tile, int frontBg, int unk);
struct MenuProc* StartOrphanMenuExt(const struct MenuInfo* def, int backBg, int tile, int frontBg, int unk);
struct MenuProc* StartMenuAt(const struct MenuInfo* def, struct MenuRect rect, Proc_t* parent);
struct MenuProc* StartMenuExt(const struct MenuInfo* def, struct MenuRect rect, int backBg, int tile, int frontBg, int unk, Proc_t* parent);

Proc_t* EndMenu(struct MenuProc* proc);
void EndAllMenus(void);

void SyncMenuBgs(struct MenuProc* proc);
void ClearMenuBgs(struct MenuProc* proc);
i8 HasMenuChangedItem(struct MenuProc* proc);

void Menu_CallDefinedConstructors(struct MenuProc* proc);
void Menu_Draw(struct MenuProc* proc);
void Menu_DrawHoverThing(struct MenuProc* proc, int item, i8 boolHover);
void Menu_Idle(struct MenuProc* proc);
void Menu_HandleDirectionInputs(struct MenuProc* proc);
int  Menu_HandleSelectInputs(struct MenuProc* proc);
void Menu_GetCursorGfxCurrentPosition(struct MenuProc* proc, int* xResult, int* yResult);

u8 MenuCommandAlwaysUsable(const struct MenuItemDef* def, int number);
u8 MenuCommandAlwaysGrayed(const struct MenuItemDef* def, int number);
u8 MenuCommandNeverUsable(const struct MenuItemDef* def, int number);

u8 MenuCancelSelect(struct MenuProc* menu, struct MenuItemProc* item);
u8 MenuStdHelpBox(struct MenuProc* menu, struct MenuItemProc* item);
u8 MenuCallHelp(struct MenuProc* menu);
u8 MenuCallHelpBox(struct MenuProc* proc, int msgid);
u8 MenuFrozen(struct MenuProc* proc);

void MarkSomethingInMenu(void);
void UnMarkSomethingInMenu(void);

struct MenuProc* StartMenu_AndDoSomethingCommands(const struct MenuInfo* def, int xSubject, int xTileLeft, int xTileRight);
void Menu_UpdateMovingCursorGfxPosition(struct MenuProc* proc, int* xRef, int* yRef);

void ClearMenuCommandOverride(void);
void GetOverriddenUnusableMenuCommands(u8 list[MENU_OVERRIDE_MAX]);
void SetOverriddenUnusableMenuCommands(u8 list[MENU_OVERRIDE_MAX]);
void SetMenuCommandOverride(int cmdid, int kind, void* func);
u8 GetOverriddenMenuCommandUsability(const struct MenuItemDef* def, int number);
u8 GetOverriddenMenuCommandEffect(struct MenuProc* proc, struct MenuItemProc* item);

#endif // GUARD_UI_MENU_H
