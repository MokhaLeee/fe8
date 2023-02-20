#include "global.h"
#include "mapselect.h"

#include "item-use.h"
#include "uiutils.h"

// TODO: move elsewhere

int GenericSelection_BackToUM_CamWait(ProcPtr proc, SelectTarget_t* target);
int GenericSelection_BackToUM(ProcPtr proc, SelectTarget_t* target);

int HealSelectOnInit(ProcPtr proc);
int HealSelectOnChange(ProcPtr proc, SelectTarget_t* target);

int DanceSelectOnInit(ProcPtr proc);
int DanceSelectOnChange(ProcPtr proc, SelectTarget_t* target);
int DanceSelectOnSelect(ProcPtr proc, SelectTarget_t* target);

SelectInfo_t CONST_DATA SelectInfo_AttackStaff =
{
    .on_init = AttackStaffSelectOnInit,
    .on_end = (void*) ClearBg0Bg1,
    .on_switch_in = AttackStaffSelectOnChange,
    .on_select = StaffSelectOnSelect,
    .on_cancel = GenericSelection_BackToUM_CamWait,
};

SelectInfo_t CONST_DATA SelectInfo_Barrier =
{
    .on_init = BarrierSelectOnInit,
    .on_end = (void*) ClearBg0Bg1,
    .on_switch_in = BarrierSelectOnChange,
    .on_select = StaffSelectOnSelect,
    .on_cancel = GenericSelection_BackToUM,
};

SelectInfo_t CONST_DATA SelectInfo_Restore =
{
    .on_init = RestoreSelectOnInit,
    .on_end = (void*) ClearBg0Bg1,
    .on_switch_in = RestoreSelectOnChange,
    .on_select = StaffSelectOnSelect,
    .on_cancel = GenericSelection_BackToUM,
};

SelectInfo_t CONST_DATA SelectInfo_Heal =
{
    .on_init = HealSelectOnInit,
    .on_end = (void*) ClearBg0Bg1,
    .on_switch_in = HealSelectOnChange,
    .on_select = StaffSelectOnSelect,
    .on_cancel = GenericSelection_BackToUM_CamWait,
};

SelectInfo_t CONST_DATA SelectInfo_Dance =
{
    .on_init = DanceSelectOnInit,
    .on_end = (void*) ClearBg0Bg1,
    .on_switch_in = DanceSelectOnChange,
    .on_select = DanceSelectOnSelect,
    .on_cancel = GenericSelection_BackToUM,
};
