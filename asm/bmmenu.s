	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Map Menu, Unit Menu and all related various target selections and what not is here
	@ Huge

	THUMB_FUNC_START func_080225AC
func_080225AC: @ 0x080225AC
	movs r0, #0x17
	bx lr

	THUMB_FUNC_END func_080225AC

	THUMB_FUNC_START MapMenu_IsSuspendCommandAvailable
MapMenu_IsSuspendCommandAvailable: @ 0x080225B0
	push {lr}
	ldr r0, .L080225C4  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne .L080225C8
	movs r0, #1
	b .L080225CA
	.align 2, 0
.L080225C4: .4byte gPlaySt
.L080225C8:
	movs r0, #2
.L080225CA:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_IsSuspendCommandAvailable

	THUMB_FUNC_START MapMenu_SuspendCommand
MapMenu_SuspendCommand: @ 0x080225D0
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq .L080225E4
	bl func_080B5D3C
	movs r0, #0x17
	b .L080225EE
.L080225E4:
	ldr r1, .L080225F4  @ 0x00000864
	adds r0, r2, #0
	bl MenuCallHelpBox
	movs r0, #8
.L080225EE:
	pop {r1}
	bx r1
	.align 2, 0
.L080225F4: .4byte 0x00000864

	THUMB_FUNC_END MapMenu_SuspendCommand

	THUMB_FUNC_START MapMenuCommnd_EndEffect
MapMenuCommnd_EndEffect: @ 0x080225F8
	push {lr}
	ldr r0, .L08022608  @ gUnknown_0859AAD8
	bl EndEachProc
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08022608: .4byte gUnknown_0859AAD8

	THUMB_FUNC_END MapMenuCommnd_EndEffect

	THUMB_FUNC_START MapMenuCommand_UnitEffect
MapMenuCommand_UnitEffect: @ 0x0802260C
	push {lr}
	ldr r0, .L08022624  @ gUnknown_0859AAD8
	bl FindProc
	movs r1, #0xa
	bl Proc_Goto
	bl StartUnitListMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08022624: .4byte gUnknown_0859AAD8

	THUMB_FUNC_END MapMenuCommand_UnitEffect

	THUMB_FUNC_START MapMenu_OptionsCommand
MapMenu_OptionsCommand: @ 0x08022628
	push {lr}
	ldr r0, .L08022638  @ gUnknown_08A2ECE0
	movs r1, #3
	bl SpawnProc
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08022638: .4byte gUnknown_08A2ECE0

	THUMB_FUNC_END MapMenu_OptionsCommand

	THUMB_FUNC_START func_0802263C
func_0802263C: @ 0x0802263C
	push {lr}
	bl GetBattleMapKind
	cmp r0, #1
	beq .L0802264A
	movs r0, #1
	b .L0802264C
.L0802264A:
	movs r0, #3
.L0802264C:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0802263C

	THUMB_FUNC_START MapMenuCommnd_StatusEffect
MapMenuCommnd_StatusEffect: @ 0x08022650
	push {lr}
	movs r0, #0
	bl StartChapterStatusScreen
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenuCommnd_StatusEffect

	THUMB_FUNC_START MapMenu_IsGuideCommandAvailable
MapMenu_IsGuideCommandAvailable: @ 0x08022660
	push {lr}
	bl IsGuideLocked
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08022670
	movs r0, #1
	b .L08022672
.L08022670:
	movs r0, #3
.L08022672:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_IsGuideCommandAvailable

	THUMB_FUNC_START MapMenu_GuideCommandDraw
MapMenu_GuideCommandDraw: @ 0x08022678
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl func_080CF480
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08022692
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #4
	bl Text_SetColor
.L08022692:
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x34
	cmp r0, #2
	bne .L080226A8
	adds r0, r5, #0
	movs r1, #1
	bl Text_SetColor
.L080226A8:
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r6, #0
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl GetBgTilemap
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_GuideCommandDraw

	THUMB_FUNC_START MapMenuCommnd_GuideEffect
MapMenuCommnd_GuideEffect: @ 0x080226E4
	push {lr}
	ldr r0, .L080226F4  @ gUnknown_08B12C64
	movs r1, #3
	bl SpawnProc
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L080226F4: .4byte gUnknown_08B12C64

	THUMB_FUNC_END MapMenuCommnd_GuideEffect

	THUMB_FUNC_START MapMenuCommand_DangerZoneUnusedEffect
MapMenuCommand_DangerZoneUnusedEffect: @ 0x080226F8
	push {lr}
	ldr r0, .L08022718  @ gActiveUnit
	movs r1, #0
	str r1, [r0]
	ldr r0, .L0802271C  @ gBmSt
	adds r0, #0x3e
	strb r1, [r0]
	ldr r0, .L08022720  @ gUnknown_0859AAD8
	bl FindProc
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08022718: .4byte gActiveUnit
.L0802271C: .4byte gBmSt
.L08022720: .4byte gUnknown_0859AAD8

	THUMB_FUNC_END MapMenuCommand_DangerZoneUnusedEffect

	THUMB_FUNC_START func_08022724
func_08022724: @ 0x08022724
	push {lr}
	movs r0, #3
	bl Start_savemenu2
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08022724

	THUMB_FUNC_START func_08022734
func_08022734: @ 0x08022734
	movs r0, #0x17
	bx lr

	THUMB_FUNC_END func_08022734

	THUMB_FUNC_START EffectWait
EffectWait: @ 0x08022738
	ldr r1, .L08022744  @ gAction
	movs r0, #1
	strb r0, [r1, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L08022744: .4byte gAction

	THUMB_FUNC_END EffectWait

	THUMB_FUNC_START GenericSelection_BackToUM
GenericSelection_BackToUM: @ 0x08022748
	push {lr}
	bl EndTargetSelection
	ldr r0, .L08022794  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	bl HideMoveRangeGraphics
	ldr r0, .L08022798  @ MenuInfo_UnitAction
	ldr r2, .L0802279C  @ gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartMenu_AndDoSomethingCommands
	ldr r1, .L080227A0  @ gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
.L08022794: .4byte gBg2Tm
.L08022798: .4byte MenuInfo_UnitAction
.L0802279C: .4byte gBmSt
.L080227A0: .4byte gActiveUnit

	THUMB_FUNC_END GenericSelection_BackToUM

	THUMB_FUNC_START func_080227A4
func_080227A4: @ 0x080227A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, .L080227FC  @ gActiveUnit
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ShouldMoveCameraPosSomething
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080227F6
	ldr r0, [r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r0, .L08022800  @ ProcScr_CameraPan
	bl EndEachProc
	lsls r0, r4, #4
	bl GetSomeAdjustedCameraY
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L08022804  @ gBmSt
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L080227E8
	ldrh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r4, r0, #2
.L080227E8:
	ldr r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl EnsureCameraOntoPosition
.L080227F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080227FC: .4byte gActiveUnit
.L08022800: .4byte ProcScr_CameraPan
.L08022804: .4byte gBmSt

	THUMB_FUNC_END func_080227A4

	THUMB_FUNC_START func_08022808
func_08022808: @ 0x08022808
	push {lr}
	ldr r0, .L08022824  @ MenuInfo_UnitAction
	ldr r2, .L08022828  @ gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartMenu_AndDoSomethingCommands
	pop {r0}
	bx r0
	.align 2, 0
.L08022824: .4byte MenuInfo_UnitAction
.L08022828: .4byte gBmSt

	THUMB_FUNC_END func_08022808

	THUMB_FUNC_START GenericSelection_BackToUM_CamWait
GenericSelection_BackToUM_CamWait: @ 0x0802282C
	push {lr}
	bl EndTargetSelection
	ldr r0, .L08022858  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl HideMoveRangeGraphics
	bl ResetTextFont
	ldr r0, .L0802285C  @ ProcScr_0859B600
	movs r1, #3
	bl SpawnProc
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
.L08022858: .4byte gBg2Tm
.L0802285C: .4byte ProcScr_0859B600

	THUMB_FUNC_END GenericSelection_BackToUM_CamWait

	THUMB_FUNC_START ItemMenu_ButtonBPressed
ItemMenu_ButtonBPressed: @ 0x08022860
	push {lr}
	ldr r0, .L08022894  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ResetTextFont
	ldr r0, .L08022898  @ MenuInfo_UnitAction
	ldr r2, .L0802289C  @ gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartMenu_AndDoSomethingCommands
	bl HideMoveRangeGraphics
	movs r0, #0x3b
	pop {r1}
	bx r1
	.align 2, 0
.L08022894: .4byte gBg2Tm
.L08022898: .4byte MenuInfo_UnitAction
.L0802289C: .4byte gBmSt

	THUMB_FUNC_END ItemMenu_ButtonBPressed

	THUMB_FUNC_START func_080228A0
func_080228A0: @ 0x080228A0
	movs r0, #0
	bx lr

	THUMB_FUNC_END func_080228A0

	THUMB_FUNC_START RescueUsability
RescueUsability: @ 0x080228A4
	push {lr}
	ldr r0, .L080228D0  @ gActiveUnit
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L080228D4
	movs r0, #0x81
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	bne .L080228D4
	adds r0, r2, #0
	bl MakeRescueTargetList
	bl GetTargetListSize
	cmp r0, #0
	beq .L080228D4
	movs r0, #1
	b .L080228D6
	.align 2, 0
.L080228D0: .4byte gActiveUnit
.L080228D4:
	movs r0, #3
.L080228D6:
	pop {r1}
	bx r1

	THUMB_FUNC_END RescueUsability

	THUMB_FUNC_START RescueEffect
RescueEffect: @ 0x080228DC
	push {lr}
	ldr r0, .L080228F4  @ gActiveUnit
	ldr r0, [r0]
	bl MakeRescueTargetList
	ldr r0, .L080228F8  @ gUnknown_0859D478
	bl StartTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
.L080228F4: .4byte gActiveUnit
.L080228F8: .4byte gUnknown_0859D478

	THUMB_FUNC_END RescueEffect

	THUMB_FUNC_START RescueSelection_OnSelect
RescueSelection_OnSelect: @ 0x080228FC
	ldr r2, .L0802290C  @ gAction
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #9
	strb r0, [r2, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L0802290C: .4byte gAction

	THUMB_FUNC_END RescueSelection_OnSelect

	THUMB_FUNC_START DropUsability
DropUsability: @ 0x08022910
	push {lr}
	ldr r0, .L0802293C  @ gActiveUnit
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08022940
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L08022940
	adds r0, r2, #0
	bl MakeDropTargetList
	bl GetTargetListSize
	cmp r0, #0
	beq .L08022940
	movs r0, #1
	b .L08022942
	.align 2, 0
.L0802293C: .4byte gActiveUnit
.L08022940:
	movs r0, #3
.L08022942:
	pop {r1}
	bx r1

	THUMB_FUNC_END DropUsability

	THUMB_FUNC_START DropEffect
DropEffect: @ 0x08022948
	push {lr}
	ldr r0, .L08022960  @ gActiveUnit
	ldr r0, [r0]
	bl MakeDropTargetList
	ldr r0, .L08022964  @ gUnknown_0859D458
	bl StartTargetSelection
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08022960: .4byte gActiveUnit
.L08022964: .4byte gUnknown_0859D458

	THUMB_FUNC_END DropEffect

	THUMB_FUNC_START DropSelection_OnSelect
DropSelection_OnSelect: @ 0x08022968
	ldr r2, .L08022984  @ gAction
	movs r0, #0xa
	strb r0, [r2, #0x11]
	ldr r0, .L08022988  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	strb r0, [r2, #0xd]
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L08022984: .4byte gAction
.L08022988: .4byte gActiveUnit

	THUMB_FUNC_END DropSelection_OnSelect

	THUMB_FUNC_START TakeUsability
TakeUsability: @ 0x0802298C
	push {lr}
	ldr r0, .L080229C4  @ gActiveUnit
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L080229CC
	ldr r0, .L080229C8  @ gBmSt
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L080229CC
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne .L080229CC
	adds r0, r3, #0
	bl MakeTakeTargetList
	bl GetTargetListSize
	cmp r0, #0
	beq .L080229CC
	movs r0, #1
	b .L080229CE
	.align 2, 0
.L080229C4: .4byte gActiveUnit
.L080229C8: .4byte gBmSt
.L080229CC:
	movs r0, #3
.L080229CE:
	pop {r1}
	bx r1

	THUMB_FUNC_END TakeUsability

	THUMB_FUNC_START TakeEffect
TakeEffect: @ 0x080229D4
	push {lr}
	ldr r0, .L080229EC  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTakeTargetList
	ldr r0, .L080229F0  @ gUnknown_0859D438
	bl StartTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
.L080229EC: .4byte gActiveUnit
.L080229F0: .4byte gUnknown_0859D438

	THUMB_FUNC_END TakeEffect

	THUMB_FUNC_START GiveUsability
GiveUsability: @ 0x080229F4
	push {lr}
	ldr r0, .L08022A2C  @ gActiveUnit
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L08022A34
	ldr r0, .L08022A30  @ gBmSt
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08022A34
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq .L08022A34
	adds r0, r3, #0
	bl func_08025594
	bl GetTargetListSize
	cmp r0, #0
	beq .L08022A34
	movs r0, #1
	b .L08022A36
	.align 2, 0
.L08022A2C: .4byte gActiveUnit
.L08022A30: .4byte gBmSt
.L08022A34:
	movs r0, #3
.L08022A36:
	pop {r1}
	bx r1

	THUMB_FUNC_END GiveUsability

	THUMB_FUNC_START GiveEffect
GiveEffect: @ 0x08022A3C
	push {lr}
	ldr r0, .L08022A54  @ gActiveUnit
	ldr r0, [r0]
	bl func_08025594
	ldr r0, .L08022A58  @ gUnknown_0859D418
	bl StartTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
.L08022A54: .4byte gActiveUnit
.L08022A58: .4byte gUnknown_0859D418

	THUMB_FUNC_END GiveEffect

	THUMB_FUNC_START MakeUnitRescueTransferGraphics
MakeUnitRescueTransferGraphics: @ 0x08022A5C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl EndBottomHelpText
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r6, #0
	bl Make6CKOIDOAMM
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END MakeUnitRescueTransferGraphics

	THUMB_FUNC_START TakeSelection_OnSelect
TakeSelection_OnSelect: @ 0x08022A90
	push {r4, r5, lr}
	ldr r4, .L08022ADC  @ gAction
	movs r0, #0xb
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGiveRescue
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08022ADC: .4byte gAction

	THUMB_FUNC_END TakeSelection_OnSelect

	THUMB_FUNC_START GiveSelection_OnSelect
GiveSelection_OnSelect: @ 0x08022AE0
	push {r4, r5, lr}
	ldr r4, .L08022B2C  @ gAction
	movs r0, #0xc
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGiveRescue
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08022B2C: .4byte gAction

	THUMB_FUNC_END GiveSelection_OnSelect

	THUMB_FUNC_START AttackCommandEffect
AttackCommandEffect: @ 0x08022B30
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne .L08022B50
	ldr r1, .L08022B4C  @ 0x00000858
	adds r0, r5, #0
	bl MenuCallHelpBox
	movs r0, #8
	b .L08022B84
	.align 2, 0
.L08022B4C: .4byte 0x00000858
.L08022B50:
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, .L08022B74  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne .L08022B78
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_08022BD8
	b .L08022B80
	.align 2, 0
.L08022B74: .4byte gActiveUnit
.L08022B78:
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_08022B8C
.L08022B80:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
.L08022B84:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AttackCommandEffect

	THUMB_FUNC_START func_08022B8C
func_08022B8C: @ 0x08022B8C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, .L08022BD0  @ MenuInfo_BallistaRange
	bl StartMenu
	adds r5, r0, #0
	ldr r4, .L08022BD4  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08022BD0: .4byte MenuInfo_BallistaRange
.L08022BD4: .4byte gActiveUnit

	THUMB_FUNC_END func_08022B8C

	THUMB_FUNC_START func_08022BD8
func_08022BD8: @ 0x08022BD8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, .L08022C28  @ MenuInfo_Unknown
	bl StartMenu
	adds r4, r0, #0
	ldr r5, .L08022C2C  @ gActiveUnit
	ldr r1, [r5]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L08022C0E
	adds r0, r1, #0
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
.L08022C0E:
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	bl func_080832C4
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08022C28: .4byte MenuInfo_Unknown
.L08022C2C: .4byte gActiveUnit

	THUMB_FUNC_END func_08022BD8

	THUMB_FUNC_START DisplayUnitStandingAttackRange
DisplayUnitStandingAttackRange: @ 0x08022C30
	push {r4, r5, lr}
	ldr r0, .L08022C6C  @ gMapMovement
	ldr r0, [r0]
	movs r5, #1
	negs r5, r5
	adds r1, r5, #0
	bl MapFill
	ldr r0, .L08022C70  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r4, .L08022C74  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L08022C78
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #1
	movs r3, #0xa
	bl MapIncInBoundedRange
	b .L08022C88
	.align 2, 0
.L08022C6C: .4byte gMapMovement
.L08022C70: .4byte gMapRange
.L08022C74: .4byte gActiveUnit
.L08022C78:
	adds r0, r2, #0
	adds r1, r5, #0
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
.L08022C88:
	movs r0, #3
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END DisplayUnitStandingAttackRange

	THUMB_FUNC_START HideMoveRangeGraphicsWrapper
HideMoveRangeGraphicsWrapper: @ 0x08022C98
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END HideMoveRangeGraphicsWrapper

	THUMB_FUNC_START UnknownMenu_IsAvailable
UnknownMenu_IsAvailable: @ 0x08022CA4
	push {r4, r5, lr}
	ldr r5, .L08022CE4  @ gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L08022CE8
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08022CE8
	ldr r0, [r5]
	adds r1, r4, #0
	bl MakeTargetListForWeapon
	bl GetTargetListSize
	cmp r0, #0
	beq .L08022CE8
	movs r0, #1
	b .L08022CEA
	.align 2, 0
.L08022CE4: .4byte gActiveUnit
.L08022CE8:
	movs r0, #3
.L08022CEA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END UnknownMenu_IsAvailable

	THUMB_FUNC_START UnknownMenu_Selected
UnknownMenu_Selected: @ 0x08022CF0
	push {r4, lr}
	ldr r4, .L08022D28  @ gActiveUnit
	ldr r0, [r4]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl UnitEquipItemSlot
	ldr r1, .L08022D2C  @ gAction
	movs r0, #0
	strb r0, [r1, #0x12]
	bl ClearBg0Bg1
	ldr r0, [r4]
	ldrh r1, [r0, #0x1e]
	bl MakeTargetListForWeapon
	ldr r0, .L08022D30  @ gUnknown_0859D3F8
	bl StartTargetSelection
	bl func_080832C8
	movs r0, #0x27
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08022D28: .4byte gActiveUnit
.L08022D2C: .4byte gAction
.L08022D30: .4byte gUnknown_0859D3F8

	THUMB_FUNC_END UnknownMenu_Selected

	THUMB_FUNC_START UnknownMenu_Draw
UnknownMenu_Draw: @ 0x08022D34
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, .L08022D7C  @ gActiveUnit
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, .L08022D80  @ gBg0Tm
	adds r3, r3, r1
	adds r1, r4, #0
	bl PutItemMenuLine
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08022D7C: .4byte gActiveUnit
.L08022D80: .4byte gBg0Tm

	THUMB_FUNC_END UnknownMenu_Draw

	THUMB_FUNC_START AttackWeaponSelect_ItemOnSwitchIn
AttackWeaponSelect_ItemOnSwitchIn: @ 0x08022D84
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl UpdateMenuItemPanel
	ldr r0, .L08022DCC  @ gMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MapFill
	ldr r0, .L08022DD0  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r4, .L08022DD4  @ gActiveUnit
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08022DCC: .4byte gMapMovement
.L08022DD0: .4byte gMapRange
.L08022DD4: .4byte gActiveUnit

	THUMB_FUNC_END AttackWeaponSelect_ItemOnSwitchIn

	THUMB_FUNC_START AttackWeaponSelect_ItemOnSwitchOut
AttackWeaponSelect_ItemOnSwitchOut: @ 0x08022DD8
	push {lr}
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08022DEA
	bl HideMoveRangeGraphics
.L08022DEA:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END AttackWeaponSelect_ItemOnSwitchOut

	THUMB_FUNC_START func_08022DF0
func_08022DF0: @ 0x08022DF0
	push {r4, lr}
	adds r4, r1, #0
	bl EventEngineExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08022E04
	movs r0, #0
	b .L08022E2A
.L08022E04:
	ldr r1, .L08022E30  @ gAction
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne .L08022E22
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
.L08022E22:
	ldr r0, .L08022E34  @ gUnknown_0859E520
	bl EndEachProc
	movs r0, #0x17
.L08022E2A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08022E30: .4byte gAction
.L08022E34: .4byte gUnknown_0859E520

	THUMB_FUNC_END func_08022DF0

	THUMB_FUNC_START func_08022E38
func_08022E38: @ 0x08022E38
	push {lr}
	ldr r0, .L08022E50  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl EnsureCameraOntoPosition
	pop {r0}
	bx r0
	.align 2, 0
.L08022E50: .4byte gActiveUnit

	THUMB_FUNC_END func_08022E38

	THUMB_FUNC_START func_08022E54
func_08022E54: @ 0x08022E54
	push {lr}
	movs r0, #0
	movs r1, #0
	bl AttackCommandEffect
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08022E54

	THUMB_FUNC_START func_08022E64
func_08022E64: @ 0x08022E64
	push {lr}
	bl EventEngineExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L08022E84
	ldr r0, .L08022E80  @ gUnknown_0859B630
	movs r1, #3
	bl SpawnProc
	movs r0, #0xb
	b .L08022E86
	.align 2, 0
.L08022E80: .4byte gUnknown_0859B630
.L08022E84:
	movs r0, #0
.L08022E86:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08022E64

	THUMB_FUNC_START func_08022E8C
func_08022E8C: @ 0x08022E8C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne .L08022EC2
	ldr r1, .L08022EE0  @ gAction
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
	bl InitObstacleBattleUnit
.L08022EC2:
	ldr r1, .L08022EE0  @ gAction
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne .L08022EE8
	ldr r0, .L08022EE4  @ gActiveUnit
	ldr r0, [r0]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	adds r1, r5, #0
	bl BattleGenerateBallistaSimulation
	b .L08022EFC
	.align 2, 0
.L08022EE0: .4byte gAction
.L08022EE4: .4byte gActiveUnit
.L08022EE8:
	ldr r0, .L08022F0C  @ gActiveUnit
	ldr r0, [r0]
	movs r3, #1
	negs r3, r3
	ldrb r1, [r1, #0x12]
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r3, #0
	bl BattleGenerateSimulation
.L08022EFC:
	bl func_0803738C
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08022F0C: .4byte gActiveUnit

	THUMB_FUNC_END func_08022E8C

	THUMB_FUNC_START func_08022F10
func_08022F10: @ 0x08022F10
	push {lr}
	ldr r0, .L08022F30  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl HideMoveRangeGraphics
	bl func_080373B4
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
.L08022F30: .4byte gBg2Tm

	THUMB_FUNC_END func_08022F10

	THUMB_FUNC_START ItemSubMenu_IsTradeAvailable
ItemSubMenu_IsTradeAvailable: @ 0x08022F34
	push {lr}
	ldr r0, .L08022F78  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08022F80
	ldr r0, .L08022F7C  @ gBmSt
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne .L08022F80
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L08022F80
	adds r0, r2, #0
	bl MakeTradeTargetList
	bl GetTargetListSize
	cmp r0, #0
	beq .L08022F80
	movs r0, #1
	b .L08022F82
	.align 2, 0
.L08022F78: .4byte gActiveUnit
.L08022F7C: .4byte gBmSt
.L08022F80:
	movs r0, #3
.L08022F82:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemSubMenu_IsTradeAvailable

	THUMB_FUNC_START TradeCommandEffect
TradeCommandEffect: @ 0x08022F88
	push {lr}
	bl ClearBg0Bg1
	ldr r0, .L08022FA4  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTradeTargetList
	ldr r0, .L08022FA8  @ gUnknown_0859D3D8
	bl StartTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
.L08022FA4: .4byte gActiveUnit
.L08022FA8: .4byte gUnknown_0859D3D8

	THUMB_FUNC_END TradeCommandEffect

	THUMB_FUNC_START func_08022FAC
func_08022FAC: @ 0x08022FAC
	push {r4, lr}
	ldr r2, .L08022FD4  @ gAction
	movs r0, #0x1d
	strb r0, [r2, #0x11]
	ldr r0, .L08022FD8  @ gActiveUnit
	ldr r4, [r0]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl StartTradeMenu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08022FD4: .4byte gAction
.L08022FD8: .4byte gActiveUnit

	THUMB_FUNC_END func_08022FAC

	THUMB_FUNC_START UnitActionMenu_CanSeize
UnitActionMenu_CanSeize: @ 0x08022FDC
	push {r4, lr}
	ldr r4, .L08022FFC  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08022FF8
	adds r0, r2, #0
	bl CanUnitSeize
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08023000
.L08022FF8:
	movs r0, #3
	b .L0802301A
	.align 2, 0
.L08022FFC: .4byte gActiveUnit
.L08023000:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetLocationEventCommandAt
	movs r1, #3
	cmp r0, #0x11
	bne .L08023018
	movs r1, #1
.L08023018:
	adds r0, r1, #0
.L0802301A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END UnitActionMenu_CanSeize

	THUMB_FUNC_START UnitActionMenu_Seize
UnitActionMenu_Seize: @ 0x08023020
	ldr r1, .L08023038  @ gAction
	movs r0, #0x11
	strb r0, [r1, #0x11]
	ldr r0, .L0802303C  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L08023038: .4byte gAction
.L0802303C: .4byte gActiveUnit

	THUMB_FUNC_END UnitActionMenu_Seize

	THUMB_FUNC_START VisitCommandUsability
VisitCommandUsability: @ 0x08023040
	push {r4, lr}
	ldr r0, .L08023080  @ gActiveUnit
	ldr r2, [r0]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #4]
	adds r4, r0, #0
	cmp r1, #0x51
	beq .L080230B8
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L080230B8
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, .L08023084  @ gMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq .L08023090
	cmp r0, #5
	bgt .L08023088
	cmp r0, #3
	beq .L08023090
	b .L080230B8
	.align 2, 0
.L08023080: .4byte gActiveUnit
.L08023084: .4byte gMapTerrain
.L08023088:
	cmp r0, #0x38
	bgt .L080230B8
	cmp r0, #0x37
	blt .L080230B8
.L08023090:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetLocationEventCommandAt
	cmp r0, #0x10
	bne .L080230B8
	ldr r0, [r4]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080230B4
	movs r0, #2
	b .L080230BA
.L080230B4:
	movs r0, #1
	b .L080230BA
.L080230B8:
	movs r0, #3
.L080230BA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END VisitCommandUsability

	THUMB_FUNC_START VisitCommandEffect
VisitCommandEffect: @ 0x080230C0
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq .L080230DC
	ldr r1, .L080230D8  @ gAction
	movs r0, #0x10
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b .L080230E6
	.align 2, 0
.L080230D8: .4byte gAction
.L080230DC:
	ldr r1, .L080230EC  @ 0x0000084C
	adds r0, r2, #0
	bl MenuCallHelpBox
	movs r0, #8
.L080230E6:
	pop {r1}
	bx r1
	.align 2, 0
.L080230EC: .4byte 0x0000084C

	THUMB_FUNC_END VisitCommandEffect

	THUMB_FUNC_START func_080230F0
func_080230F0: @ 0x080230F0
	push {r4, r5, r6, lr}
	ldr r6, .L08023114  @ gActiveUnit
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0802314E
	adds r0, r2, #0
	bl func_08025B6C
	bl GetTargetListSize
	cmp r0, #0
	beq .L08023118
.L0802310E:
	movs r0, #1
	b .L08023150
	.align 2, 0
.L08023114: .4byte gActiveUnit
.L08023118:
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq .L0802314E
.L08023122:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0xc
	bne .L0802313A
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0802310E
.L0802313A:
	adds r5, #1
	cmp r5, #4
	bgt .L0802314E
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L08023122
.L0802314E:
	movs r0, #3
.L08023150:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080230F0

	THUMB_FUNC_START PlayCommandUsability
PlayCommandUsability: @ 0x08023158
	push {lr}
	adds r3, r0, #0
	ldr r0, .L08023184  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0802318C
	ldr r1, .L08023188  @ gBmSt
	movs r0, #0xcd
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl func_080230F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b .L0802318E
	.align 2, 0
.L08023184: .4byte gActiveUnit
.L08023188: .4byte gBmSt
.L0802318C:
	movs r0, #3
.L0802318E:
	pop {r1}
	bx r1

	THUMB_FUNC_END PlayCommandUsability

	THUMB_FUNC_START DanceCommandUsability
DanceCommandUsability: @ 0x08023194
	push {lr}
	adds r3, r0, #0
	ldr r0, .L080231C0  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080231C8
	ldr r1, .L080231C4  @ gBmSt
	movs r0, #0xa5
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl func_080230F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b .L080231CA
	.align 2, 0
.L080231C0: .4byte gActiveUnit
.L080231C4: .4byte gBmSt
.L080231C8:
	movs r0, #3
.L080231CA:
	pop {r1}
	bx r1

	THUMB_FUNC_END DanceCommandUsability

	THUMB_FUNC_START PlayCommandEffect
PlayCommandEffect: @ 0x080231D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	mov sl, r1
	movs r7, #0
	ldr r6, .L08023248  @ gActiveUnit
	ldr r0, [r6]
	bl func_08025B6C
	bl GetTargetListSize
	negs r1, r0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq .L0802322E
.L08023200:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0xc
	bne .L0802321A
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0802321A
	movs r7, #1
.L0802321A:
	adds r5, #1
	cmp r5, #4
	bgt .L0802322E
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L08023200
.L0802322E:
	mov r0, r8
	cmp r0, #0
	beq .L0802324C
	cmp r7, #0
	bne .L0802324C
	mov r0, r9
	mov r1, sl
	bl ItemMenu_Select1stCommand
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b .L0802328C
	.align 2, 0
.L08023248: .4byte gActiveUnit
.L0802324C:
	ldr r0, .L0802329C  @ MenuInfo_Item
	bl StartMenu
	adds r5, r0, #0
	ldr r4, .L080232A0  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #0x17
.L0802328C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0802329C: .4byte MenuInfo_Item
.L080232A0: .4byte gActiveUnit

	THUMB_FUNC_END PlayCommandEffect

	THUMB_FUNC_START DanceSelectOnSelect
DanceSelectOnSelect: @ 0x080232A4
	ldr r2, .L080232B4  @ gAction
	movs r0, #4
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L080232B4: .4byte gAction

	THUMB_FUNC_END DanceSelectOnSelect

	THUMB_FUNC_START ItemCommandUsability
ItemCommandUsability: @ 0x080232B8
	push {lr}
	ldr r0, .L080232DC  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L080232E0
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L080232E0
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	beq .L080232E0
	movs r0, #1
	b .L080232E2
	.align 2, 0
.L080232DC: .4byte gActiveUnit
.L080232E0:
	movs r0, #3
.L080232E2:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemCommandUsability

	THUMB_FUNC_START ItemCommandEffect
ItemCommandEffect: @ 0x080232E8
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne .L08023344
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ResetTextFont
	ldr r0, .L0802333C  @ MenuInfo_ItemSelect
	bl StartMenu
	adds r5, r0, #0
	ldr r4, .L08023340  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	movs r0, #0x17
	b .L08023346
	.align 2, 0
.L0802333C: .4byte MenuInfo_ItemSelect
.L08023340: .4byte gActiveUnit
.L08023344:
	movs r0, #0
.L08023346:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemCommandEffect

	THUMB_FUNC_START ItemSelectMenu_TextDraw
ItemSelectMenu_TextDraw: @ 0x08023350
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r7, .L08023388  @ gActiveUnit
	ldr r1, [r7]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0802338C
	adds r0, r6, #0
	adds r1, r4, #0
	bl UnknownMenu_Draw
	movs r0, #0
	b .L080233CC
	.align 2, 0
.L08023388: .4byte gActiveUnit
.L0802338C:
	adds r0, r5, #0
	bl GetItemKind
	cmp r0, #0xc
	bne .L0802339A
	movs r2, #0
	b .L080233A6
.L0802339A:
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
.L080233A6:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r4, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, .L080233D4  @ gBg0Tm
	adds r3, r3, r1
	adds r1, r5, #0
	bl PutItemMenuLine
	movs r0, #1
	bl EnableBgSync
.L080233CC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080233D4: .4byte gBg0Tm

	THUMB_FUNC_END ItemSelectMenu_TextDraw

	THUMB_FUNC_START ItemSelectMenu_Usability
ItemSelectMenu_Usability: @ 0x080233D8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r7, .L080233F4  @ gActiveUnit
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L080233F8
	movs r0, #3
	b .L08023422
	.align 2, 0
.L080233F4: .4byte gActiveUnit
.L080233F8:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0802340E
	adds r0, r6, #0
	adds r1, r5, #0
	bl UnknownMenu_IsAvailable
.L0802340E:
	ldr r0, [r7]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq .L08023420
	movs r1, #1
.L08023420:
	adds r0, r1, #0
.L08023422:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemSelectMenu_Usability

	THUMB_FUNC_START ItemSelectMenu_Effect
ItemSelectMenu_Effect: @ 0x08023428
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, .L08023480  @ gAction
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x2a]
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, .L08023484  @ 0xFFFFFF00
	ands r5, r2
	orrs r5, r0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, .L08023488  @ 0xFFFF00FF
	ands r5, r1
	orrs r5, r0
	ldr r0, .L0802348C  @ 0xFF00FFFF
	ands r5, r0
	movs r0, #0xe0
	lsls r0, r0, #0xb
	orrs r5, r0
	ldr r0, .L08023490  @ 0x00FFFFFF
	ands r5, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x10
	asrs r1, r1, #0x18
	bl func_080234AC
	ldr r0, .L08023494  @ MenuInfo_ItemSub
	adds r1, r5, #0
	adds r2, r4, #0
	bl StartMenuAt
	movs r0, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08023480: .4byte gAction
.L08023484: .4byte 0xFFFFFF00
.L08023488: .4byte 0xFFFF00FF
.L0802348C: .4byte 0xFF00FFFF
.L08023490: .4byte 0x00FFFFFF
.L08023494: .4byte MenuInfo_ItemSub

	THUMB_FUNC_END ItemSelectMenu_Effect

	THUMB_FUNC_START Menu_SwitchIn
Menu_SwitchIn: @ 0x08023498
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl UpdateMenuItemPanel
	pop {r1}
	bx r1

	THUMB_FUNC_END Menu_SwitchIn

	THUMB_FUNC_START nullsub_25
nullsub_25: @ 0x080234A8
	bx lr

	THUMB_FUNC_END nullsub_25

	THUMB_FUNC_START func_080234AC
func_080234AC: @ 0x080234AC
	push {lr}
	ldr r0, .L080234D8  @ gUnknown_02002774
	ldr r1, .L080234DC  @ 0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0
	bl InitTextFont
	ldr r0, .L080234E0  @ gBg0Tm+0x56
	ldr r1, .L080234E4  @ gBmFrameTmap0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, .L080234E8  @ gBg1Tm+0x56
	ldr r1, .L080234EC  @ gUnknown_0200422C
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	pop {r0}
	bx r0
	.align 2, 0
.L080234D8: .4byte gUnknown_02002774
.L080234DC: .4byte 0x06004000
.L080234E0: .4byte gBg0Tm+0x56
.L080234E4: .4byte gBmFrameTmap0
.L080234E8: .4byte gBg1Tm+0x56
.L080234EC: .4byte gUnknown_0200422C

	THUMB_FUNC_END func_080234AC

	THUMB_FUNC_START ItemSubMenuEnd
ItemSubMenuEnd: @ 0x080234F0
	push {lr}
	movs r0, #0
	bl SetTextFont
	pop {r0}
	bx r0

	THUMB_FUNC_END ItemSubMenuEnd

	THUMB_FUNC_START MenuCommand_SelectNo
MenuCommand_SelectNo: @ 0x080234FC
	push {lr}
	movs r0, #0
	bl SetTextFont
	ldr r0, .L08023528  @ gBmFrameTmap0
	ldr r1, .L0802352C  @ gBg0Tm+0x56
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, .L08023530  @ gUnknown_0200422C
	ldr r1, .L08023534  @ gBg1Tm+0x56
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
.L08023528: .4byte gBmFrameTmap0
.L0802352C: .4byte gBg0Tm+0x56
.L08023530: .4byte gUnknown_0200422C
.L08023534: .4byte gBg1Tm+0x56

	THUMB_FUNC_END MenuCommand_SelectNo

	THUMB_FUNC_START func_08023538
func_08023538: @ 0x08023538
	push {lr}
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl EndAllMenus
	movs r0, #0x31
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08023538

	THUMB_FUNC_START func_08023550
func_08023550: @ 0x08023550
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl func_08023538
	adds r0, r4, #0
	bl MenuCommand_SelectNo
	ldr r0, .L080235A0  @ MenuInfo_ItemSelect
	bl StartMenu
	adds r5, r0, #0
	ldr r4, .L080235A4  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080235A0: .4byte MenuInfo_ItemSelect
.L080235A4: .4byte gActiveUnit

	THUMB_FUNC_END func_08023550

	THUMB_FUNC_START func_080235A8
func_080235A8: @ 0x080235A8
	push {r4, r5, r6, lr}
	sub sp, #4
	bl func_08023538
	ldr r6, .L08023630  @ gActiveUnit
	ldr r0, [r6]
	bl GetUnitItemCount
	cmp r0, #0
	beq .L08023648
	ldr r0, .L08023634  @ gBmFrameTmap0
	ldr r5, .L08023638  @ gBg0Tm+0x56
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, .L0802363C  @ gUnknown_0200422C
	ldr r4, .L08023640  @ gBg1Tm+0x56
	adds r1, r4, #0
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	subs r5, #0x14
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	subs r4, #0x14
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	ldr r0, .L08023644  @ MenuInfo_ItemSelect
	bl StartMenu
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r6]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	movs r0, #1
	b .L0802366A
	.align 2, 0
.L08023630: .4byte gActiveUnit
.L08023634: .4byte gBmFrameTmap0
.L08023638: .4byte gBg0Tm+0x56
.L0802363C: .4byte gUnknown_0200422C
.L08023640: .4byte gBg1Tm+0x56
.L08023644: .4byte MenuInfo_ItemSelect
.L08023648:
	bl ClearBg0Bg1
	movs r0, #0
	bl EndFaceById
	ldr r0, .L08023674  @ MenuInfo_UnitAction
	ldr r2, .L08023678  @ gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartMenu_AndDoSomethingCommands
	movs r0, #0x1b
.L0802366A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08023674: .4byte MenuInfo_UnitAction
.L08023678: .4byte gBmSt

	THUMB_FUNC_END func_080235A8

	THUMB_FUNC_START ItemSubMenu_IsUseAvailable
ItemSubMenu_IsUseAvailable: @ 0x0802367C
	push {r4, r5, lr}
	ldr r5, .L080236CC  @ gActiveUnit
	ldr r1, [r5]
	ldr r0, .L080236D0  @ gAction
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r4, #0
	bl GetItemEffect
	cmp r0, #0
	beq .L080236C8
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #4
	beq .L080236C8
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0xc
	beq .L080236C8
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L080236D4
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080236D4
.L080236C8:
	movs r0, #3
	b .L080236EA
	.align 2, 0
.L080236CC: .4byte gActiveUnit
.L080236D0: .4byte gAction
.L080236D4:
	ldr r0, .L080236F0  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq .L080236E8
	movs r1, #1
.L080236E8:
	adds r0, r1, #0
.L080236EA:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080236F0: .4byte gActiveUnit

	THUMB_FUNC_END ItemSubMenu_IsUseAvailable

	THUMB_FUNC_START ItemSubMenu_IsEquipAvailable
ItemSubMenu_IsEquipAvailable: @ 0x080236F4
	push {r4, r5, lr}
	ldr r5, .L08023718  @ gActiveUnit
	ldr r1, [r5]
	ldr r0, .L0802371C  @ gAction
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L08023720
	movs r0, #3
	b .L08023734
	.align 2, 0
.L08023718: .4byte gActiveUnit
.L0802371C: .4byte gAction
.L08023720:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq .L08023732
	movs r1, #1
.L08023732:
	adds r0, r1, #0
.L08023734:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemSubMenu_IsEquipAvailable

	THUMB_FUNC_START ItemSubMenu_IsDiscardAvailable
ItemSubMenu_IsDiscardAvailable: @ 0x0802373C
	push {lr}
	ldr r0, .L08023760  @ gActiveUnit
	ldr r1, [r0]
	ldr r0, .L08023764  @ gAction
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne .L08023768
	movs r0, #1
	b .L0802376A
	.align 2, 0
.L08023760: .4byte gActiveUnit
.L08023764: .4byte gAction
.L08023768:
	movs r0, #2
.L0802376A:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemSubMenu_IsDiscardAvailable

	THUMB_FUNC_START ItemSubMenu_UseItem
ItemSubMenu_UseItem: @ 0x08023770
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	bne .L080237A8
	ldr r0, .L080237A0  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, .L080237A4  @ gAction
	ldrb r2, [r1, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl GetUnitItemCantUseMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl MenuCallHelpBox
	movs r0, #8
	b .L080237E4
	.align 2, 0
.L080237A0: .4byte gActiveUnit
.L080237A4: .4byte gAction
.L080237A8:
	bl ClearBg0Bg1
	ldr r0, .L080237EC  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, .L080237F0  @ gAction
	ldrb r2, [r1, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoUseUnitItem
	ldr r0, .L080237F4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080237D4
	movs r0, #0x6a
	bl m4aSongNumStart
.L080237D4:
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl EndAllMenus
	movs r0, #0x21
.L080237E4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080237EC: .4byte gActiveUnit
.L080237F0: .4byte gAction
.L080237F4: .4byte gPlaySt

	THUMB_FUNC_END ItemSubMenu_UseItem

	THUMB_FUNC_START ItemSubMenu_EquipItem
ItemSubMenu_EquipItem: @ 0x080237F8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq .L08023824
	ldr r0, .L0802381C  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, .L08023820  @ gAction
	ldrb r1, [r1, #0x12]
	bl UnitEquipItemSlot
	adds r0, r4, #0
	bl func_08023550
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b .L0802382E
	.align 2, 0
.L0802381C: .4byte gActiveUnit
.L08023820: .4byte gAction
.L08023824:
	ldr r1, .L08023834  @ 0x0000084D
	adds r0, r4, #0
	bl MenuCallHelpBox
	movs r0, #8
.L0802382E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08023834: .4byte 0x0000084D

	THUMB_FUNC_END ItemSubMenu_EquipItem

	THUMB_FUNC_START ItemSubMenu_TradeItem
ItemSubMenu_TradeItem: @ 0x08023838
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08023864  @ gBmSt
	ldr r1, .L08023868  @ gAction
	ldrb r1, [r1, #0x12]
	adds r0, #0x3f
	strb r1, [r0]
	adds r0, r4, #0
	bl func_08023538
	movs r0, #0
	bl EndFaceById
	adds r0, r4, #0
	adds r1, r5, #0
	bl TradeCommandEffect
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08023864: .4byte gBmSt
.L08023868: .4byte gAction

	THUMB_FUNC_END ItemSubMenu_TradeItem

	THUMB_FUNC_START ItemSubMenu_DiscardItem
ItemSubMenu_DiscardItem: @ 0x0802386C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq .L080238CC
	ldrh r0, [r2, #0x2a]
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080238B8  @ 0xFFFFFF00
	ands r3, r1
	orrs r3, r0
	ldrh r0, [r2, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, .L080238BC  @ 0xFFFF00FF
	ands r3, r1
	orrs r3, r0
	ldr r0, .L080238C0  @ 0xFF00FFFF
	ands r3, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r3, r0
	ldr r0, .L080238C4  @ 0x00FFFFFF
	ands r3, r0
	ldr r0, .L080238C8  @ MenuInfo_YesNoSelection
	adds r1, r3, #0
	adds r2, r4, #0
	bl StartMenuAt
	adds r0, #0x61
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x84
	b .L080238D6
	.align 2, 0
.L080238B8: .4byte 0xFFFFFF00
.L080238BC: .4byte 0xFFFF00FF
.L080238C0: .4byte 0xFF00FFFF
.L080238C4: .4byte 0x00FFFFFF
.L080238C8: .4byte MenuInfo_YesNoSelection
.L080238CC:
	ldr r1, .L080238DC  @ 0x0000084F
	adds r0, r4, #0
	bl MenuCallHelpBox
	movs r0, #8
.L080238D6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080238DC: .4byte 0x0000084F

	THUMB_FUNC_END ItemSubMenu_DiscardItem

	THUMB_FUNC_START MenuCommand_SelectYes
MenuCommand_SelectYes: @ 0x080238E0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L0802390C  @ gActiveUnit
	ldr r0, [r0]
	ldr r4, .L08023910  @ gAction
	ldrb r1, [r4, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq .L080238FE
	ldr r0, .L08023914  @ gBg0Tm
	movs r1, #0
	bl TmFill
.L080238FE:
	adds r0, r5, #0
	bl func_080235A8
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0802390C: .4byte gActiveUnit
.L08023910: .4byte gAction
.L08023914: .4byte gBg0Tm

	THUMB_FUNC_END MenuCommand_SelectYes

	THUMB_FUNC_START BallistaRangeMenu_BallistaUsability
BallistaRangeMenu_BallistaUsability: @ 0x08023918
	push {lr}
	ldr r0, .L0802392C  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08023930
	movs r0, #3
	b .L0802394C
	.align 2, 0
.L0802392C: .4byte gActiveUnit
.L08023930:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetBallistaItemAt
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	bne .L0802394A
	movs r0, #2
	b .L0802394C
.L0802394A:
	movs r0, #1
.L0802394C:
	pop {r1}
	bx r1

	THUMB_FUNC_END BallistaRangeMenu_BallistaUsability

	THUMB_FUNC_START BallistaRangeMenu_Draw
BallistaRangeMenu_Draw: @ 0x08023950
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08023962
	movs r5, #1
.L08023962:
	ldr r0, .L08023998  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	adds r2, r5, #0
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r4, [r4, r5]
	adds r3, r3, r4
	lsls r3, r3, #1
	ldr r4, .L0802399C  @ gBg0Tm
	adds r3, r3, r4
	bl PutItemMenuLine
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08023998: .4byte gActiveUnit
.L0802399C: .4byte gBg0Tm

	THUMB_FUNC_END BallistaRangeMenu_Draw

	THUMB_FUNC_START BallistaRangeMenu_Select
BallistaRangeMenu_Select: @ 0x080239A0
	push {lr}
	bl ClearBg0Bg1
	ldr r1, .L080239C0  @ gAction
	movs r0, #8
	strb r0, [r1, #0x12]
	ldr r0, .L080239C4  @ gActiveUnit
	ldr r0, [r0]
	bl FillBallistaRangeMaybe
	ldr r0, .L080239C8  @ gUnknown_0859D3F8
	bl StartTargetSelection
	movs r0, #0x26
	pop {r1}
	bx r1
	.align 2, 0
.L080239C0: .4byte gAction
.L080239C4: .4byte gActiveUnit
.L080239C8: .4byte gUnknown_0859D3F8

	THUMB_FUNC_END BallistaRangeMenu_Select

	THUMB_FUNC_START FillBallistaRange
FillBallistaRange: @ 0x080239CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, .L08023A48  @ gMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MapFill
	ldr r4, .L08023A4C  @ gMapRange
	ldr r0, [r4]
	movs r1, #0
	bl MapFill
	ldr r0, [r4]
	bl SetWorkingMap
	ldr r4, .L08023A50  @ gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r5, r0, #0
	bl UpdateMenuItemPanel
	ldr r0, [r4]
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl MapIncInBoundedRange
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08023A48: .4byte gMapMovement
.L08023A4C: .4byte gMapRange
.L08023A50: .4byte gActiveUnit

	THUMB_FUNC_END FillBallistaRange

	THUMB_FUNC_START StaffCommandUsability
StaffCommandUsability: @ 0x08023A54
	push {r4, r5, r6, lr}
	ldr r0, .L08023A68  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08023A70
	b .L08023ABE
	.align 2, 0
.L08023A68: .4byte gActiveUnit
.L08023A6C:
	movs r0, #2
	b .L08023AC0
.L08023A70:
	movs r6, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq .L08023ABE
.L08023A78:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #4
	bne .L08023AA8
	ldr r5, .L08023AA4  @ gActiveUnit
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08023AA8
	ldr r0, [r5]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08023A6C
	movs r0, #1
	b .L08023AC0
	.align 2, 0
.L08023AA4: .4byte gActiveUnit
.L08023AA8:
	adds r6, #1
	cmp r6, #4
	bgt .L08023ABE
	ldr r0, .L08023AC8  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L08023A78
.L08023ABE:
	movs r0, #3
.L08023AC0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08023AC8: .4byte gActiveUnit

	THUMB_FUNC_END StaffCommandUsability

	THUMB_FUNC_START StaffCommandEffect
StaffCommandEffect: @ 0x08023ACC
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq .L08023B24
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, .L08023B1C  @ MenuInfo_StaffItemSelect
	bl StartMenu
	adds r5, r0, #0
	ldr r4, .L08023B20  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	movs r0, #0x17
	b .L08023B2E
	.align 2, 0
.L08023B1C: .4byte MenuInfo_StaffItemSelect
.L08023B20: .4byte gActiveUnit
.L08023B24:
	ldr r1, .L08023B38  @ 0x00000851
	adds r0, r2, #0
	bl MenuCallHelpBox
	movs r0, #8
.L08023B2E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08023B38: .4byte 0x00000851

	THUMB_FUNC_END StaffCommandEffect

	THUMB_FUNC_START StaffCommandRange
StaffCommandRange: @ 0x08023B3C
	push {r4, r5, r6, lr}
	ldr r5, .L08023B78  @ gActiveUnit
	ldr r0, [r5]
	movs r4, #1
	negs r4, r4
	adds r1, r4, #0
	bl GetUnitItemUseReach
	adds r6, r0, #0
	ldr r0, .L08023B7C  @ gMapMovement
	ldr r0, [r0]
	adds r1, r4, #0
	bl MapFill
	ldr r0, .L08023B80  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #5
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08023B78: .4byte gActiveUnit
.L08023B7C: .4byte gMapMovement
.L08023B80: .4byte gMapRange

	THUMB_FUNC_END StaffCommandRange

	THUMB_FUNC_START HideMoveRangeGraphicsWrapper2
HideMoveRangeGraphicsWrapper2: @ 0x0HideMoveRangeGraphicsWrapper2
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END HideMoveRangeGraphicsWrapper2

	THUMB_FUNC_START StaffItemSelect_Usability
StaffItemSelect_Usability: @ 0x08023B90
	push {r4, r5, lr}
	ldr r5, .L08023BBC  @ gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #4
	bne .L08023BC0
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08023BC0
	movs r0, #1
	b .L08023BC2
	.align 2, 0
.L08023BBC: .4byte gActiveUnit
.L08023BC0:
	movs r0, #3
.L08023BC2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END StaffItemSelect_Usability

	THUMB_FUNC_START StaffItemSelect_Effect
StaffItemSelect_Effect: @ 0x08023BC8
	push {r4, r5, lr}
	ldr r5, .L08023C00  @ gActiveUnit
	ldr r0, [r5]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl UnitEquipItemSlot
	ldr r4, .L08023C04  @ gAction
	movs r0, #0
	strb r0, [r4, #0x12]
	bl ClearBg0Bg1
	ldr r0, [r5]
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoUseUnitItem
	movs r0, #7
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08023C00: .4byte gActiveUnit
.L08023C04: .4byte gAction

	THUMB_FUNC_END StaffItemSelect_Effect

	THUMB_FUNC_START StaffItemSelect_TextDraw
StaffItemSelect_TextDraw: @ 0x08023C08
	push {lr}
	bl ItemSelectMenu_TextDraw
	pop {r1}
	bx r1

	THUMB_FUNC_END StaffItemSelect_TextDraw

	THUMB_FUNC_START StaffItemSelect_OnHover
StaffItemSelect_OnHover: @ 0x08023C14
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r5, .L08023C5C  @ gActiveUnit
	ldr r0, [r5]
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl GetUnitItemUseReach
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl UpdateMenuItemPanel
	ldr r0, .L08023C60  @ gMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MapFill
	ldr r0, .L08023C64  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #4
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08023C5C: .4byte gActiveUnit
.L08023C60: .4byte gMapMovement
.L08023C64: .4byte gMapRange

	THUMB_FUNC_END StaffItemSelect_OnHover

	THUMB_FUNC_START StaffItemSelect_SwitchOut
StaffItemSelect_SwitchOut: @ 0x08023C68
	push {lr}
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08023C7A
	bl HideMoveRangeGraphics
.L08023C7A:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END StaffItemSelect_SwitchOut

	THUMB_FUNC_START TalkCommandUsability
TalkCommandUsability: @ 0x08023C80
	push {r4, lr}
	ldr r4, .L08023CA4  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08023C9E
	adds r0, r2, #0
	bl MakeTargetsForTalk
	bl GetTargetListSize
	cmp r0, #0
	bne .L08023CA8
.L08023C9E:
	movs r0, #3
	b .L08023CBC
	.align 2, 0
.L08023CA4: .4byte gActiveUnit
.L08023CA8:
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq .L08023CBA
	movs r0, #1
	b .L08023CBC
.L08023CBA:
	movs r0, #2
.L08023CBC:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END TalkCommandUsability

	THUMB_FUNC_START TalkCommandEffect
TalkCommandEffect: @ 0x08023CC4
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq .L08023CEC
	ldr r0, .L08023CE4  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTargetsForTalk
	ldr r0, .L08023CE8  @ gUnknown_0859D398
	bl StartTargetSelection
	movs r0, #7
	b .L08023CF6
	.align 2, 0
.L08023CE4: .4byte gActiveUnit
.L08023CE8: .4byte gUnknown_0859D398
.L08023CEC:
	ldr r1, .L08023CFC  @ 0x00000852
	adds r0, r2, #0
	bl MenuCallHelpBox
	movs r0, #8
.L08023CF6:
	pop {r1}
	bx r1
	.align 2, 0
.L08023CFC: .4byte 0x00000852

	THUMB_FUNC_END TalkCommandEffect

	THUMB_FUNC_START func_08023D00
func_08023D00: @ 0x08023D00
	ldr r2, .L08023D10  @ gAction
	movs r0, #0xe
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L08023D10: .4byte gAction

	THUMB_FUNC_END func_08023D00

	THUMB_FUNC_START SupportCommandUsability
SupportCommandUsability: @ 0x08023D14
	push {r4, lr}
	ldr r4, .L08023D44  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08023D40
	adds r0, r2, #0
	bl MakeTargetListForSupport
	bl GetTargetListSize
	cmp r0, #0
	beq .L08023D40
	ldr r0, [r4]
	bl MakeTargetsForTalk
	bl GetTargetListSize
	cmp r0, #0
	beq .L08023D48
.L08023D40:
	movs r0, #3
	b .L08023D5C
	.align 2, 0
.L08023D44: .4byte gActiveUnit
.L08023D48:
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq .L08023D5A
	movs r0, #1
	b .L08023D5C
.L08023D5A:
	movs r0, #2
.L08023D5C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END SupportCommandUsability

	THUMB_FUNC_START SupportCommandEffect
SupportCommandEffect: @ 0x08023D64
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq .L08023D8C
	ldr r0, .L08023D84  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTargetListForSupport
	ldr r0, .L08023D88  @ gUnknown_0859D378
	bl StartTargetSelection
	movs r0, #7
	b .L08023D96
	.align 2, 0
.L08023D84: .4byte gActiveUnit
.L08023D88: .4byte gUnknown_0859D378
.L08023D8C:
	ldr r1, .L08023D9C  @ 0x00000852
	adds r0, r2, #0
	bl MenuCallHelpBox
	movs r0, #8
.L08023D96:
	pop {r1}
	bx r1
	.align 2, 0
.L08023D9C: .4byte 0x00000852

	THUMB_FUNC_END SupportCommandEffect

	THUMB_FUNC_START func_08023DA0
func_08023DA0: @ 0x08023DA0
	ldr r2, .L08023DB0  @ gAction
	movs r0, #0xf
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L08023DB0: .4byte gAction

	THUMB_FUNC_END func_08023DA0

	THUMB_FUNC_START DoorCommandUsability
DoorCommandUsability: @ 0x08023DB4
	push {r4, lr}
	ldr r4, .L08023DD4  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08023DD0
	adds r0, r2, #0
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge .L08023DD8
.L08023DD0:
	movs r0, #3
	b .L08023DEE
	.align 2, 0
.L08023DD4: .4byte gActiveUnit
.L08023DD8:
	ldr r0, [r4]
	movs r1, #0x1e
	bl MakeTargetListForDoorAndBridges
	bl GetTargetListSize
	movs r1, #3
	cmp r0, #0
	beq .L08023DEC
	movs r1, #1
.L08023DEC:
	adds r0, r1, #0
.L08023DEE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END DoorCommandUsability

	THUMB_FUNC_START DoorCommandEffect
DoorCommandEffect: @ 0x08023DF4
	push {r4, lr}
	ldr r4, .L08023E14  @ gAction
	movs r0, #0x12
	strb r0, [r4, #0x11]
	ldr r0, .L08023E18  @ gActiveUnit
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	strb r1, [r4, #0xc]
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08023E14: .4byte gAction
.L08023E18: .4byte gActiveUnit

	THUMB_FUNC_END DoorCommandEffect

	THUMB_FUNC_START ChestCommandUsability
ChestCommandUsability: @ 0x08023E1C
	push {r4, lr}
	ldr r4, .L08023E3C  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08023E38
	adds r0, r2, #0
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge .L08023E40
.L08023E38:
	movs r0, #3
	b .L08023E52
	.align 2, 0
.L08023E3C: .4byte gActiveUnit
.L08023E40:
	ldr r0, [r4]
	bl CanUnitUseChestKeyItem
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq .L08023E50
	movs r1, #1
.L08023E50:
	adds r0, r1, #0
.L08023E52:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END ChestCommandUsability

	THUMB_FUNC_START ChestCommandEffect
ChestCommandEffect: @ 0x08023E58
	push {r4, lr}
	ldr r4, .L08023E74  @ gAction
	movs r0, #0x14
	strb r0, [r4, #0x11]
	ldr r0, .L08023E78  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08023E74: .4byte gAction
.L08023E78: .4byte gActiveUnit

	THUMB_FUNC_END ChestCommandEffect

	THUMB_FUNC_START PickCommandUsability
PickCommandUsability: @ 0x08023E7C
	push {lr}
	ldr r0, .L08023E98  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08023E94
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x33
	beq .L08023E9C
.L08023E94:
	movs r0, #3
	b .L08023EB0
	.align 2, 0
.L08023E98: .4byte gActiveUnit
.L08023E9C:
	adds r0, r2, #0
	bl MakeTargetListForPick
	bl GetTargetListSize
	movs r1, #3
	cmp r0, #0
	beq .L08023EAE
	movs r1, #1
.L08023EAE:
	adds r0, r1, #0
.L08023EB0:
	pop {r1}
	bx r1

	THUMB_FUNC_END PickCommandUsability

	THUMB_FUNC_START PickCommandEffect
PickCommandEffect: @ 0x08023EB4
	push {lr}
	ldr r0, .L08023ED0  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl MakeTargetListForPick
	ldr r0, .L08023ED4  @ gUnknown_0859D358
	bl StartTargetSelection
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08023ED0: .4byte gAction
.L08023ED4: .4byte gUnknown_0859D358

	THUMB_FUNC_END PickCommandEffect

	THUMB_FUNC_START func_08023ED8
func_08023ED8: @ 0x08023ED8
	ldr r2, .L08023EEC  @ gAction
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0x15
	strb r0, [r2, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L08023EEC: .4byte gAction

	THUMB_FUNC_END func_08023ED8

	THUMB_FUNC_START func_08023EF0
func_08023EF0: @ 0x08023EF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, .L08023F44  @ gActiveUnit
	ldr r0, [r0]
	movs r7, #0x10
	ldrsb r7, [r0, r7]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	movs r5, #0
	ldr r4, .L08023F48  @ gUnknown_080D7C04
.L08023F0C:
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, r7, r2
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	ldr r1, .L08023F4C  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L08023F50
	adds r0, r1, #0
	bl GetUnit
	cmp r0, #0
	beq .L08023F50
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne .L08023F50
	movs r0, #1
	b .L08023F5A
	.align 2, 0
.L08023F44: .4byte gActiveUnit
.L08023F48: .4byte gUnknown_080D7C04
.L08023F4C: .4byte gMapUnit
.L08023F50:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble .L08023F0C
	movs r0, #0
.L08023F5A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08023EF0

	THUMB_FUNC_START SupplyUsability
SupplyUsability: @ 0x08023F64
	push {lr}
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08023FAC
	ldr r1, .L08023F8C  @ gActiveUnit
	ldr r0, [r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L08023FAC
	ldr r0, .L08023F90  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq .L08023F88
	cmp r0, #3
	beq .L08023F94
.L08023F88:
	movs r2, #1
	b .L08023F96
	.align 2, 0
.L08023F8C: .4byte gActiveUnit
.L08023F90: .4byte gPlaySt
.L08023F94:
	movs r2, #0xf
.L08023F96:
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r2
	beq .L08023FB0
	adds r0, r2, #0
	bl func_08023EF0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08023FB0
.L08023FAC:
	movs r0, #3
	b .L08023FB2
.L08023FB0:
	movs r0, #1
.L08023FB2:
	pop {r1}
	bx r1

	THUMB_FUNC_END SupplyUsability

	THUMB_FUNC_START SupplyCommandEffect
SupplyCommandEffect: @ 0x08023FB8
	push {lr}
	ldr r1, .L08023FD0  @ gAction
	movs r0, #0x1d
	strb r0, [r1, #0x11]
	ldr r0, .L08023FD4  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0
	bl func_0809EB38
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08023FD0: .4byte gAction
.L08023FD4: .4byte gActiveUnit

	THUMB_FUNC_END SupplyCommandEffect

	THUMB_FUNC_START ArmoryCommandUsability
ArmoryCommandUsability: @ 0x08023FD8
	push {lr}
	ldr r0, .L08023FF4  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L08023FF0
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08023FF8
.L08023FF0:
	movs r0, #3
	b .L0802400E
	.align 2, 0
.L08023FF4: .4byte gActiveUnit
.L08023FF8:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetLocationEventCommandAt
	movs r1, #3
	cmp r0, #0x16
	bne .L0802400C
	movs r1, #1
.L0802400C:
	adds r0, r1, #0
.L0802400E:
	pop {r1}
	bx r1

	THUMB_FUNC_END ArmoryCommandUsability

	THUMB_FUNC_START ArmoryCommandEffect
ArmoryCommandEffect: @ 0x08024014
	push {lr}
	ldr r0, .L08024030  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl RunLocationEvents
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08024030: .4byte gActiveUnit

	THUMB_FUNC_END ArmoryCommandEffect

	THUMB_FUNC_START VendorCommandUsability
VendorCommandUsability: @ 0x08024034
	push {lr}
	ldr r0, .L08024050  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L0802404C
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08024054
.L0802404C:
	movs r0, #3
	b .L0802406A
	.align 2, 0
.L08024050: .4byte gActiveUnit
.L08024054:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetLocationEventCommandAt
	movs r1, #3
	cmp r0, #0x17
	bne .L08024068
	movs r1, #1
.L08024068:
	adds r0, r1, #0
.L0802406A:
	pop {r1}
	bx r1

	THUMB_FUNC_END VendorCommandUsability

	THUMB_FUNC_START VendorCommandEffect
VendorCommandEffect: @ 0x08024070
	push {lr}
	ldr r0, .L0802408C  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl RunLocationEvents
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L0802408C: .4byte gActiveUnit

	THUMB_FUNC_END VendorCommandEffect

	THUMB_FUNC_START SecretShopCommandUsability
SecretShopCommandUsability: @ 0x08024090
	push {lr}
	ldr r0, .L080240AC  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L080240A8
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080240B0
.L080240A8:
	movs r0, #3
	b .L080240C6
	.align 2, 0
.L080240AC: .4byte gActiveUnit
.L080240B0:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetLocationEventCommandAt
	movs r1, #3
	cmp r0, #0x18
	bne .L080240C4
	movs r1, #1
.L080240C4:
	adds r0, r1, #0
.L080240C6:
	pop {r1}
	bx r1

	THUMB_FUNC_END SecretShopCommandUsability

	THUMB_FUNC_START SecretShopCommandEffect
SecretShopCommandEffect: @ 0x080240CC
	push {lr}
	ldr r0, .L080240E8  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl RunLocationEvents
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L080240E8: .4byte gActiveUnit

	THUMB_FUNC_END SecretShopCommandEffect

	THUMB_FUNC_START ArenaCommandUsability
ArenaCommandUsability: @ 0x080240EC
	push {lr}
	ldr r0, .L08024124  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L0802411E
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0802411E
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, .L08024128  @ gMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	beq .L0802412C
.L0802411E:
	movs r0, #3
	b .L0802413E
	.align 2, 0
.L08024124: .4byte gActiveUnit
.L08024128: .4byte gMapTerrain
.L0802412C:
	adds r0, r2, #0
	bl CouldUnitUseAnyWeapon
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq .L0802413C
	movs r1, #1
.L0802413C:
	adds r0, r1, #0
.L0802413E:
	pop {r1}
	bx r1

	THUMB_FUNC_END ArenaCommandUsability

	THUMB_FUNC_START ArenaCommandEffect
ArenaCommandEffect: @ 0x08024144
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	bne .L08024180
	ldr r0, .L08024168  @ gActiveUnit
	ldr r0, [r0]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024170
	ldr r1, .L0802416C  @ 0x00000853
	adds r0, r4, #0
	bl MenuCallHelpBox
	b .L08024178
	.align 2, 0
.L08024168: .4byte gActiveUnit
.L0802416C: .4byte 0x00000853
.L08024170:
	ldr r1, .L0802417C  @ 0x00000854
	adds r0, r4, #0
	bl MenuCallHelpBox
.L08024178:
	movs r0, #8
	b .L08024186
	.align 2, 0
.L0802417C: .4byte 0x00000854
.L08024180:
	bl func_080B576C
	movs r0, #0x17
.L08024186:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END ArenaCommandEffect

	THUMB_FUNC_START StealCommandUsability
StealCommandUsability: @ 0x0802418C
	push {r4, lr}
	ldr r4, .L080241C0  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L080241BC
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L080241BC
	adds r0, r2, #0
	bl MakeTargetListForSteal
	bl GetTargetListSize
	cmp r0, #0
	bne .L080241C4
.L080241BC:
	movs r0, #3
	b .L080241D4
	.align 2, 0
.L080241C0: .4byte gActiveUnit
.L080241C4:
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	beq .L080241D2
	movs r0, #1
	b .L080241D4
.L080241D2:
	movs r0, #2
.L080241D4:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END StealCommandUsability

	THUMB_FUNC_START StealCommandEffect
StealCommandEffect: @ 0x080241DC
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq .L08024208
	bl ClearBg0Bg1
	ldr r0, .L08024200  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTargetListForSteal
	ldr r0, .L08024204  @ gUnknown_0859D318
	bl StartTargetSelection
	movs r0, #7
	b .L08024212
	.align 2, 0
.L08024200: .4byte gActiveUnit
.L08024204: .4byte gUnknown_0859D318
.L08024208:
	ldr r1, .L08024218  @ 0x00000862
	adds r0, r2, #0
	bl MenuCallHelpBox
	movs r0, #8
.L08024212:
	pop {r1}
	bx r1
	.align 2, 0
.L08024218: .4byte 0x00000862

	THUMB_FUNC_END StealCommandEffect

	THUMB_FUNC_START StealTargetSelection_OnInit
StealTargetSelection_OnInit: @ 0x0802421C
	push {r4, lr}
	adds r4, r0, #0
	bl NewUnitInfoWindow_WithAllLines
	ldr r0, .L08024238  @ 0x0000086D
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08024238: .4byte 0x0000086D

	THUMB_FUNC_END StealTargetSelection_OnInit

	THUMB_FUNC_START func_0802423C
func_0802423C: @ 0x0802423C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl func_08034D48
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0802423C

	THUMB_FUNC_START func_08024260
func_08024260: @ 0x08024260
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, .L080242F0  @ gAction
	ldrb r0, [r1, #2]
	strb r0, [r6, #0xd]
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, .L080242F4  @ MenuInfo_StealItem
	bl StartMenu
	adds r0, r4, #0
	bl EndTargetSelection
	ldr r0, .L080242F8  @ gBg1Tm+0x84
	ldr r1, .L080242FC  @ gUnknown_085A0D4C
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	bl GetStringTextLen
	movs r4, #0x38
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	ldr r5, .L08024300  @ gBg0Tm+0xC6
	movs r1, #7
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	adds r5, #0x80
	ldrb r0, [r6, #0xd]
	bl GetUnit
	bl GetUnitFid
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	movs r3, #5
	bl PutFace80x72_Core
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080242F0: .4byte gAction
.L080242F4: .4byte MenuInfo_StealItem
.L080242F8: .4byte gBg1Tm+0x84
.L080242FC: .4byte gUnknown_085A0D4C
.L08024300: .4byte gBg0Tm+0xC6

	THUMB_FUNC_END func_08024260

	THUMB_FUNC_START StealItemMenuCommand_Usability
StealItemMenuCommand_Usability: @ 0x08024304
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, .L08024320  @ gAction
	ldrb r0, [r5, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne .L08024324
	movs r0, #3
	b .L08024340
	.align 2, 0
.L08024320: .4byte gAction
.L08024324:
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0802433E
	movs r0, #1
	b .L08024340
.L0802433E:
	movs r0, #2
.L08024340:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END StealItemMenuCommand_Usability

	THUMB_FUNC_START StealItemMenuCommand_Draw
StealItemMenuCommand_Draw: @ 0x08024348
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, .L08024394  @ gAction
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl IsItemStealable
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, .L08024398  @ gBg0Tm
	adds r3, r3, r1
	adds r1, r4, #0
	bl PutItemMenuLine
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08024394: .4byte gAction
.L08024398: .4byte gBg0Tm

	THUMB_FUNC_END StealItemMenuCommand_Draw

	THUMB_FUNC_START StealItemMenuCommand_Effect
StealItemMenuCommand_Effect: @ 0x0802439C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq .L080243C4
	ldr r1, .L080243C0  @ gAction
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	movs r0, #6
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b .L080243CE
	.align 2, 0
.L080243C0: .4byte gAction
.L080243C4:
	ldr r1, .L080243D4  @ 0x00000855
	adds r0, r3, #0
	bl MenuCallHelpBox
	movs r0, #8
.L080243CE:
	pop {r1}
	bx r1
	.align 2, 0
.L080243D4: .4byte 0x00000855

	THUMB_FUNC_END StealItemMenuCommand_Effect

	THUMB_FUNC_START SummonCommandUsability
SummonCommandUsability: @ 0x080243D8
	push {r4, r5, lr}
	ldr r5, .L08024424  @ gActiveUnit
	ldr r2, [r5]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq .L0802445A
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0802445A
	adds r0, r2, #0
	bl ListSummonTargets
	bl GetTargetListSize
	cmp r0, #0
	beq .L0802445A
	ldr r4, .L08024428  @ 0x0000FFFF
	movs r2, #0
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r1, .L0802442C  @ gUnknown_0895F5A4
	ldrb r0, [r0, #4]
	adds r3, r1, #0
	ldrb r1, [r3]
	cmp r0, r1
	bne .L08024430
	movs r4, #0
	b .L0802444E
	.align 2, 0
.L08024424: .4byte gActiveUnit
.L08024428: .4byte 0x0000FFFF
.L0802442C: .4byte gUnknown_0895F5A4
.L08024430:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #2
	bhi .L0802444E
	ldr r0, .L08024460  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrb r1, [r1, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne .L08024430
	adds r4, r2, #0
.L0802444E:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08024470
.L0802445A:
	movs r0, #3
	b .L080244B0
	.align 2, 0
.L08024460: .4byte gActiveUnit
.L08024464:
	ldr r0, .L0802446C  @ 0xFFFEFFF3
	ands r1, r0
	str r1, [r2, #0xc]
	b .L080244AE
	.align 2, 0
.L0802446C: .4byte 0xFFFEFFF3
.L08024470:
	movs r4, #1
	lsls r1, r1, #1
	ldr r0, .L080244A0  @ gUnknown_0895F5A5
	adds r5, r1, r0
.L08024478:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L080244A8
	ldr r0, [r2]
	cmp r0, #0
	beq .L080244A8
	ldrb r0, [r0, #4]
	ldrb r1, [r5]
	cmp r0, r1
	bne .L080244A8
	ldr r1, [r2, #0xc]
	ldr r0, .L080244A4  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L08024464
	b .L0802445A
	.align 2, 0
.L080244A0: .4byte gUnknown_0895F5A5
.L080244A4: .4byte 0x0001000C
.L080244A8:
	adds r4, #1
	cmp r4, #0x3f
	ble .L08024478
.L080244AE:
	movs r0, #1
.L080244B0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END SummonCommandUsability

	THUMB_FUNC_START SummonCommandEffect
SummonCommandEffect: @ 0x080244B8
	push {lr}
	ldr r0, .L080244D0  @ gActiveUnit
	ldr r0, [r0]
	bl ListSummonTargets
	ldr r0, .L080244D4  @ gUnknown_0859D338
	bl StartTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
.L080244D0: .4byte gActiveUnit
.L080244D4: .4byte gUnknown_0859D338

	THUMB_FUNC_END SummonCommandEffect

	THUMB_FUNC_START func_080244D8
func_080244D8: @ 0x080244D8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, .L080244F8  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r0, #7
	strb r0, [r4, #0x11]
	ldrb r0, [r5]
	strb r0, [r4, #0x13]
	ldrb r0, [r5, #1]
	strb r0, [r4, #0x14]
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080244F8: .4byte gAction

	THUMB_FUNC_END func_080244D8

	THUMB_FUNC_START YobimaCommandUsability
YobimaCommandUsability: @ 0x080244FC
	push {r4, r5, lr}
	ldr r0, .L08024518  @ gActiveUnit
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne .L08024514
	ldr r0, [r1, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0802451C
.L08024514:
	movs r0, #3
	b .L08024542
	.align 2, 0
.L08024518: .4byte gActiveUnit
.L0802451C:
	movs r5, #0
	movs r4, #0x81
.L08024520:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq .L0802453A
	ldr r0, [r0]
	cmp r0, #0
	beq .L0802453A
	cmp r5, #0x27
	bhi .L08024514
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
.L0802453A:
	adds r4, #1
	cmp r4, #0xbf
	ble .L08024520
	movs r0, #1
.L08024542:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END YobimaCommandUsability

	THUMB_FUNC_START YobimaCommandEffect
YobimaCommandEffect: @ 0x08024548
	push {r4, lr}
	ldr r4, .L08024560  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r0, #8
	strb r0, [r4, #0x11]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08024560: .4byte gAction

	THUMB_FUNC_END YobimaCommandEffect

	THUMB_FUNC_START func_08024564
func_08024564: @ 0x08024564
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, .L08024584  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r0, #8
	strb r0, [r4, #0x11]
	ldrb r0, [r5]
	strb r0, [r4, #0x13]
	ldrb r0, [r5, #1]
	strb r0, [r4, #0x14]
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08024584: .4byte gAction

	THUMB_FUNC_END func_08024564

	THUMB_FUNC_START ConvoyMenu_HelpBox
ConvoyMenu_HelpBox: @ 0x08024588
	push {r4, lr}
	adds r4, r1, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble .L080245B4
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, .L080245B0  @ gBmSt
	ldrh r2, [r2, #0x2c]
	bl ShowItemHelpBox
	movs r0, #0
	b .L080245D4
	.align 2, 0
.L080245B0: .4byte gBmSt
.L080245B4:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, .L080245DC  @ gActiveUnit
	ldr r3, [r2]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r3, #0x1e
	adds r3, r3, r2
	ldrh r2, [r3]
	bl ShowItemHelpBox
.L080245D4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080245DC: .4byte gActiveUnit

	THUMB_FUNC_END ConvoyMenu_HelpBox

	THUMB_FUNC_START ItemMenu_HelpBox
ItemMenu_HelpBox: @ 0x080245E0
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, .L08024614  @ gAction
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0x2a
	ldrsh r3, [r4, r1]
	lsls r3, r3, #3
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	lsls r1, r1, #3
	adds r4, #0x3c
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r0, r3, #0
	bl ShowItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08024614: .4byte gAction

	THUMB_FUNC_END ItemMenu_HelpBox

	THUMB_FUNC_START BallistaRangeMenuHelpBox
BallistaRangeMenuHelpBox: @ 0x08024618
	push {r4, r5, lr}
	movs r0, #0x2a
	ldrsh r5, [r1, r0]
	lsls r5, r5, #3
	movs r0, #0x2c
	ldrsh r4, [r1, r0]
	lsls r4, r4, #3
	ldr r0, .L08024648  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ShowItemHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08024648: .4byte gActiveUnit

	THUMB_FUNC_END BallistaRangeMenuHelpBox

	THUMB_FUNC_START HealSelectOnInit
HealSelectOnInit: @ 0x0802464C
	push {lr}
	bl func_08034F9C
	pop {r0}
	bx r0

	THUMB_FUNC_END HealSelectOnInit

	THUMB_FUNC_START HealSelectOnChange
HealSelectOnChange: @ 0x08024658
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl func_08034FB0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END HealSelectOnChange

	THUMB_FUNC_START RescueSelection_OnConstruction
RescueSelection_OnConstruction: @ 0x0802467C
	push {r4, lr}
	adds r4, r0, #0
	bl func_080351CC
	ldr r0, .L08024698  @ 0x00000868
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08024698: .4byte 0x00000868

	THUMB_FUNC_END RescueSelection_OnConstruction

	THUMB_FUNC_START RescueSelection_OnChange
RescueSelection_OnChange: @ 0x0802469C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl SetupUnitRescueWindow
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END RescueSelection_OnChange

	THUMB_FUNC_START DropSelection_OnConstruction
DropSelection_OnConstruction: @ 0x080246C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080246D8  @ 0x00000869
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080246D8: .4byte 0x00000869

	THUMB_FUNC_END DropSelection_OnConstruction

	THUMB_FUNC_START func_080246DC
func_080246DC: @ 0x080246DC
	bx lr

	THUMB_FUNC_END func_080246DC

	THUMB_FUNC_START func_080246E0
func_080246E0: @ 0x080246E0
	push {r4, lr}
	adds r4, r0, #0
	bl func_08035380
	ldr r0, .L080246FC  @ 0x0000086B
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080246FC: .4byte 0x0000086B

	THUMB_FUNC_END func_080246E0

	THUMB_FUNC_START func_08024700
func_08024700: @ 0x08024700
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl func_080353B8
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08024700

	THUMB_FUNC_START func_08024724
func_08024724: @ 0x08024724
	push {r4, lr}
	adds r4, r0, #0
	bl func_080351CC
	ldr r0, .L08024740  @ 0x0000086A
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08024740: .4byte 0x0000086A

	THUMB_FUNC_END func_08024724

	THUMB_FUNC_START func_08024744
func_08024744: @ 0x08024744
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl func_080352BC
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08024744

	THUMB_FUNC_START TradeTargetSelection_OnInit
TradeTargetSelection_OnInit: @ 0x08024768
	push {r4, lr}
	adds r4, r0, #0
	bl NewUnitInfoWindow_WithAllLines
	ldr r0, .L08024784  @ 0x0000086C
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08024784: .4byte 0x0000086C

	THUMB_FUNC_END TradeTargetSelection_OnInit

	THUMB_FUNC_START func_08024788
func_08024788: @ 0x08024788
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	bl ClearIcons
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl func_08034C3C
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08024788

	THUMB_FUNC_START func_080247B0
func_080247B0: @ 0x080247B0
	push {r4, lr}
	adds r4, r0, #0
	bl func_08034F9C
	ldr r0, .L080247CC  @ 0x0000086F
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080247CC: .4byte 0x0000086F

	THUMB_FUNC_END func_080247B0

	THUMB_FUNC_START func_080247D0
func_080247D0: @ 0x080247D0
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl func_08034FB0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080247D0

	THUMB_FUNC_START DanceSelectOnInit
DanceSelectOnInit: @ 0x080247F4
	push {r4, lr}
	adds r4, r0, #0
	bl func_08034F9C
	movs r0, #0x87
	lsls r0, r0, #4
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END DanceSelectOnInit

	THUMB_FUNC_START DanceSelectOnChange
DanceSelectOnChange: @ 0x08024814
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl func_08034FB0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END DanceSelectOnChange

	THUMB_FUNC_START func_08024838
func_08024838: @ 0x08024838
	push {lr}
	bl func_08034F9C
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08024838

	THUMB_FUNC_START func_08024844
func_08024844: @ 0x08024844
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl func_08034FB0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08024844

	THUMB_FUNC_START func_08024868
func_08024868: @ 0x08024868
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x88
	lsls r0, r0, #4
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08024868

	THUMB_FUNC_START nullsub_27
nullsub_27: @ 0x08024884
	bx lr

	THUMB_FUNC_END nullsub_27

	THUMB_FUNC_START func_08024888
func_08024888: @ 0x08024888
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x88
	lsls r0, r0, #4
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08024888

	THUMB_FUNC_START func_080248A4
func_080248A4: @ 0x080248A4
	bx lr

	THUMB_FUNC_END func_080248A4

	THUMB_FUNC_START func_080248A8
func_080248A8: @ 0x080248A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080248C0  @ 0x00000881
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080248C0: .4byte 0x00000881

	THUMB_FUNC_END func_080248A8

	THUMB_FUNC_START RideCommandUsability
RideCommandUsability: @ 0x080248C4
	push {lr}
	ldr r0, .L08024910  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L08024918
	ldr r0, [r2, #0xc]
	movs r1, #0x83
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne .L08024918
	ldr r0, .L08024914  @ gBmSt
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne .L08024918
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	beq .L08024918
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne .L08024918
	movs r0, #1
	b .L0802491A
	.align 2, 0
.L08024910: .4byte gActiveUnit
.L08024914: .4byte gBmSt
.L08024918:
	movs r0, #3
.L0802491A:
	pop {r1}
	bx r1

	THUMB_FUNC_END RideCommandUsability

	THUMB_FUNC_START RideCommandEffect
RideCommandEffect: @ 0x08024920
	push {r4, lr}
	ldr r1, .L08024944  @ gAction
	movs r0, #0x21
	strb r0, [r1, #0x11]
	ldr r4, .L08024948  @ gActiveUnit
	ldr r0, [r4]
	bl RideBallista
	bl MU_EndAll
	ldr r0, [r4]
	bl MU_Create
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08024944: .4byte gAction
.L08024948: .4byte gActiveUnit

	THUMB_FUNC_END RideCommandEffect

	THUMB_FUNC_START ExitCommandUsability
ExitCommandUsability: @ 0x0802494C
	push {lr}
	ldr r0, .L08024970  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L08024978
	ldr r0, .L08024974  @ gBmSt
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne .L08024978
	movs r0, #1
	b .L0802497A
	.align 2, 0
.L08024970: .4byte gActiveUnit
.L08024974: .4byte gBmSt
.L08024978:
	movs r0, #3
.L0802497A:
	pop {r1}
	bx r1

	THUMB_FUNC_END ExitCommandUsability

	THUMB_FUNC_START ExitCommandEffect
ExitCommandEffect: @ 0x08024980
	push {r4, lr}
	ldr r1, .L080249A4  @ gAction
	movs r0, #0x22
	strb r0, [r1, #0x11]
	ldr r4, .L080249A8  @ gActiveUnit
	ldr r0, [r4]
	bl TryRemoveUnitFromBallista
	bl MU_EndAll
	ldr r0, [r4]
	bl MU_Create
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080249A4: .4byte gAction
.L080249A8: .4byte gActiveUnit

	THUMB_FUNC_END ExitCommandEffect

	THUMB_FUNC_START AttackCommandUsability
AttackCommandUsability: @ 0x080249AC
	push {r4, r5, r6, lr}
	ldr r0, .L080249C8  @ gActiveUnit
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L08024A1C
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq .L080249D0
	b .L08024A1C
	.align 2, 0
.L080249C8: .4byte gActiveUnit
.L080249CC:
	movs r0, #1
	b .L08024A1E
.L080249D0:
	movs r6, #0
	ldrh r4, [r1, #0x1e]
	cmp r4, #0
	beq .L08024A1C
.L080249D8:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L08024A06
	ldr r5, .L08024A24  @ gActiveUnit
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024A06
	ldr r0, [r5]
	adds r1, r4, #0
	bl MakeTargetListForWeapon
	bl GetTargetListSize
	cmp r0, #0
	bne .L080249CC
.L08024A06:
	adds r6, #1
	cmp r6, #4
	bgt .L08024A1C
	ldr r0, .L08024A24  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L080249D8
.L08024A1C:
	movs r0, #3
.L08024A1E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08024A24: .4byte gActiveUnit

	THUMB_FUNC_END AttackCommandUsability

	THUMB_FUNC_START AttackBallistaCommandUsability
AttackBallistaCommandUsability: @ 0x08024A28
	push {r4, r5, lr}
	ldr r5, .L08024A6C  @ gActiveUnit
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L08024A66
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	adds r4, r0, #0
	bl IsBallista
	cmp r0, #0
	beq .L08024A66
	ldr r0, [r5]
	ldrb r1, [r4, #3]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	bl MakeTargetListForWeapon
	bl GetTargetListSize
	cmp r0, #0
	bne .L08024A70
.L08024A66:
	movs r0, #3
	b .L08024A80
	.align 2, 0
.L08024A6C: .4byte gActiveUnit
.L08024A70:
	adds r0, r4, #0
	bl GetBallistaItemUses
	cmp r0, #0
	beq .L08024A7E
	movs r0, #1
	b .L08024A80
.L08024A7E:
	movs r0, #2
.L08024A80:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AttackBallistaCommandUsability

	THUMB_FUNC_START ItemMenu_Is1stCommandAvailable
ItemMenu_Is1stCommandAvailable: @ 0x08024A88
	push {lr}
	ldr r0, .L08024AA0  @ gActiveUnit
	ldr r0, [r0]
	bl func_08025B6C
	bl GetTargetListSize
	cmp r0, #0
	beq .L08024AA4
	movs r0, #1
	b .L08024AA6
	.align 2, 0
.L08024AA0: .4byte gActiveUnit
.L08024AA4:
	movs r0, #3
.L08024AA6:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemMenu_Is1stCommandAvailable

	THUMB_FUNC_START ItemMenu_Draw1stCommand
ItemMenu_Draw1stCommand: @ 0x08024AAC
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	ldr r0, .L08024AE8  @ gBmSt
	ldrh r0, [r0, #0x2c]
	bl GetItemName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L08024AEC  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08024AE8: .4byte gBmSt
.L08024AEC: .4byte gBg0Tm

	THUMB_FUNC_END ItemMenu_Draw1stCommand

	THUMB_FUNC_START ItemMenu_Select1stCommand
ItemMenu_Select1stCommand: @ 0x08024AF0
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq .L08024B14
	ldr r0, .L08024B0C  @ gActiveUnit
	ldr r0, [r0]
	bl func_08025B6C
	ldr r0, .L08024B10  @ SelectInfo_Dance
	bl StartTargetSelection
	movs r0, #0x27
	b .L08024B16
	.align 2, 0
.L08024B0C: .4byte gActiveUnit
.L08024B10: .4byte SelectInfo_Dance
.L08024B14:
	movs r0, #8
.L08024B16:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemMenu_Select1stCommand

	THUMB_FUNC_START ItemMenu_AreOtherCommandsAvailable
ItemMenu_AreOtherCommandsAvailable: @ 0x08024B1C
	push {r4, r5, lr}
	ldr r5, .L08024B48  @ gActiveUnit
	ldr r0, [r5]
	subs r1, #1
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0xc
	bne .L08024B4C
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024B4C
	movs r0, #1
	b .L08024B4E
	.align 2, 0
.L08024B48: .4byte gActiveUnit
.L08024B4C:
	movs r0, #3
.L08024B4E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemMenu_AreOtherCommandsAvailable

	THUMB_FUNC_START ItemMenu_DrawOtherCommands
ItemMenu_DrawOtherCommands: @ 0x08024B54
	push {r4, lr}
	adds r2, r1, #0
	ldr r0, .L08024B94  @ gActiveUnit
	ldr r1, [r0]
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, #0
	adds r0, #0x34
	movs r4, #0x2c
	ldrsh r3, [r2, r4]
	lsls r3, r3, #5
	movs r4, #0x2a
	ldrsh r2, [r2, r4]
	adds r3, r3, r2
	lsls r3, r3, #1
	ldr r2, .L08024B98  @ gBg0Tm
	adds r3, r3, r2
	movs r2, #1
	bl PutItemMenuLine
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08024B94: .4byte gActiveUnit
.L08024B98: .4byte gBg0Tm

	THUMB_FUNC_END ItemMenu_DrawOtherCommands

	THUMB_FUNC_START ItemMenu_SelectOtherCommands
ItemMenu_SelectOtherCommands: @ 0x08024B9C
	push {r4, lr}
	ldr r4, .L08024BC8  @ gAction
	adds r1, #0x3c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r4, #0x12]
	bl ClearBg0Bg1
	ldr r0, .L08024BCC  @ gActiveUnit
	ldr r0, [r0]
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoUseUnitItem
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08024BC8: .4byte gAction
.L08024BCC: .4byte gActiveUnit

	THUMB_FUNC_END ItemMenu_SelectOtherCommands

	THUMB_FUNC_START ItemMenu_SwitchIn
ItemMenu_SwitchIn: @ 0x08024BD0
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L08024BE4
	movs r0, #5
	bl UpdateMenuItemPanel
	b .L08024BEE
.L08024BE4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	bl UpdateMenuItemPanel
.L08024BEE:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemMenu_SwitchIn

	THUMB_FUNC_START nullsub_26
nullsub_26: @ 0x08024BF4
	bx lr

	THUMB_FUNC_END nullsub_26

	THUMB_FUNC_START ItemMenuHelpBox
ItemMenuHelpBox: @ 0x08024BF8
	push {r4, lr}
	adds r3, r1, #0
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne .L08024C14
	ldr r0, .L08024C10  @ gBmSt
	ldrh r2, [r0, #0x2c]
	b .L08024C26
	.align 2, 0
.L08024C10: .4byte gBmSt
.L08024C14:
	ldr r0, .L08024C3C  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r2, [r1]
.L08024C26:
	movs r1, #0x2a
	ldrsh r0, [r3, r1]
	lsls r0, r0, #3
	movs r4, #0x2c
	ldrsh r1, [r3, r4]
	lsls r1, r1, #3
	bl ShowItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08024C3C: .4byte gActiveUnit

	THUMB_FUNC_END ItemMenuHelpBox

	THUMB_FUNC_START MapMenu_IsRecordsCommandAvailable
MapMenu_IsRecordsCommandAvailable: @ 0x08024C40
	push {lr}
	bl GetBattleMapKind
	cmp r0, #1
	bne .L08024CAC
	ldr r0, .L08024CB0  @ gPlaySt
	ldrb r0, [r0, #0xe]
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi .L08024CB4
	movs r0, #0x71
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024CAC
	movs r0, #0x72
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024CAC
	movs r0, #0x73
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024CAC
	movs r0, #0x74
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024CAC
	movs r0, #0x75
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024CAC
	movs r0, #0x76
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08024CAC
	movs r0, #0x77
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08024CB4
.L08024CAC:
	movs r0, #3
	b .L08024CB6
	.align 2, 0
.L08024CB0: .4byte gPlaySt
.L08024CB4:
	movs r0, #1
.L08024CB6:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_IsRecordsCommandAvailable

	THUMB_FUNC_START MapMenu_RecordsCommand
MapMenu_RecordsCommand: @ 0x08024CBC
	push {lr}
	movs r0, #3
	bl func_080381E0
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_RecordsCommand

	THUMB_FUNC_START MapMenu_IsRetreatCommandAvailable
MapMenu_IsRetreatCommandAvailable: @ 0x08024CCC
	push {lr}
	bl GetBattleMapKind
	cmp r0, #0
	beq .L08024CDA
	movs r0, #1
	b .L08024CDC
.L08024CDA:
	movs r0, #3
.L08024CDC:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_IsRetreatCommandAvailable

	THUMB_FUNC_START MapMenu_RetreatCommand
MapMenu_RetreatCommand: @ 0x08024CE0
	push {lr}
	bl CallRetreatPromptEvent
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_RetreatCommand

.align 2, 0
