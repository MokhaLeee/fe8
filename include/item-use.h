#pragma once

#include "global.h"
#include "unit.h"
#include "uimenu.h"
#include "mapselect.h"

bool CanUnitUseItem(Unit_t* unit, int item);
int GetUnitItemCantUseMsg(Unit_t* unit, int item);
void DoUseUnitItem(Unit_t* unit, int item);

bool HasSelectTarget(Unit_t* unit, void(*list_targets)(Unit_t* unit));

bool CanUnitUseHealItem(Unit_t* unit);
bool CanUnitUseBindingBladeToHeal(Unit_t* unit);
bool CanUnitUsePureWaterItem(Unit_t* unit);
bool CanUnitUseTorchItem(Unit_t* unit);
bool CanUnitUseAntitoxinItem(Unit_t* unit);
bool CanUnitUseChestKeyItem(Unit_t* unit);
bool CanUnitUseDoorKeyItem(Unit_t* unit);
bool CanUnitUseBridgeKeyItem(Unit_t* unit);
bool CanUnitUseLockpickItem(Unit_t* unit);
bool CanUnitUsePromotionItem(Unit_t* unit, int item);
bool CanUnitUseStatGainItem(Unit_t* unit, int item);
bool CanUnitUseJunaFruitItem(Unit_t* unit);

void SetStaffUseAction(Unit_t* unit);
void SetItemUseAction(Unit_t* unit);

void DoUseRescueStaff(Unit_t* unit, void(*list_targets)(Unit_t* unit));
void DoUseSpecialDance(Unit_t* unit, void(*list_targets)(Unit_t* unit), int help_msg);
void DoUseWarpStaff(Unit_t* unit);
void DoUsePutTrap(Unit_t* unit, void(*list_targets)(Unit_t* unit), int help_msg);
void DoUseRepairStaff(Unit_t* unit);
void DoUseHealStaff(Unit_t* unit, void(*list_targets)(Unit_t* unit));
void DoUseRestoreStaff(Unit_t* unit, void(*list_targets)(Unit_t* unit));
void DoUseBarrierStaff(Unit_t* unit);
void DoUseAttackStaff(Unit_t* unit, void(*list_targets)(Unit_t* unit));
void DoUseTorchStaff(Unit_t* unit);

bool CanUnitUseItemPrepScreen(Unit_t* unit, int item);

bool DoesUnitHoldItemCC(Unit_t* unit);

int StaffSelectOnSelect(ProcPtr proc, SelectTarget_t* target);

int RepairSelectOnSelect(ProcPtr proc, SelectTarget_t* target);
int RepairSelectOnChange(ProcPtr proc, SelectTarget_t* target);
void RepairSelectOnInit(ProcPtr proc);
int RepairMenuItemOnChange(struct MenuProc* menu, struct MenuItemProc* menu_item);
int nullsub_24(struct MenuProc* menu, struct MenuItemProc* menu_item);
u8 RepairMenuItemIsAvailable(const struct MenuItemDef*, int id);
int RepairMenuItemDraw(struct MenuProc* menu, struct MenuItemProc* menu_item);
u8 RepairMenuItemSelect(struct MenuProc* menu, struct MenuItemProc* menu_item);

int RestoreSelectOnInit(ProcPtr proc);
int RestoreSelectOnChange(ProcPtr proc, SelectTarget_t* target);

int BarrierSelectOnInit(ProcPtr proc);
int BarrierSelectOnChange(ProcPtr proc, SelectTarget_t* target);

int AttackStaffSelectOnInit(ProcPtr proc);
int AttackStaffSelectOnChange(ProcPtr proc, SelectTarget_t* target);
