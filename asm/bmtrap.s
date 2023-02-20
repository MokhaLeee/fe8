	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Trap effects and loading

	THUMB_FUNC_START func_0803746C
func_0803746C: @ 0x0803746C
	push {lr}
	lsls r1, r1, #0x18
	movs r2, #0
	cmp r1, #0
	beq .L08037478
	movs r2, #3
.L08037478:
	cmp r0, #0
	bge .L0803747E
	adds r2, #2
.L0803747E:
	cmp r0, #0
	ble .L08037484
	adds r2, #1
.L08037484:
	ldr r0, .L08037490  @ gUnknown_0859E5A0
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
.L08037490: .4byte gUnknown_0859E5A0

	THUMB_FUNC_END func_0803746C

	THUMB_FUNC_START func_08037494
func_08037494: @ 0x08037494
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080374BC  @ gUnknown_0859E520
	bl FindProc
	ldr r1, .L080374C0  @ gBattleUnitA
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x52
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl func_0803746C
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080374BC: .4byte gUnknown_0859E520
.L080374C0: .4byte gBattleUnitA

	THUMB_FUNC_END func_08037494

	THUMB_FUNC_START func_080374C4
func_080374C4: @ 0x080374C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080374EC  @ gUnknown_0859E520
	bl FindProc
	ldr r1, .L080374F0  @ gBattleUnitB
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x53
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl func_0803746C
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080374EC: .4byte gUnknown_0859E520
.L080374F0: .4byte gBattleUnitB

	THUMB_FUNC_END func_080374C4

	THUMB_FUNC_START MineFireTrap_DoSomeBWLStuffWhenKill
MineFireTrap_DoSomeBWLStuffWhenKill: @ 0x080374F4
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0xa
	bgt .L0803750A
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl BWL_AddLoss
.L0803750A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END MineFireTrap_DoSomeBWLStuffWhenKill

	THUMB_FUNC_START FireTrap_StartGfx
FireTrap_StartGfx: @ 0x08037510
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl NewFireTrapEffectGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END FireTrap_StartGfx

	THUMB_FUNC_START MineTrap_StartGfx
MineTrap_StartGfx: @ 0x08037528
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl NewMineTrapEffectGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END MineTrap_StartGfx

	THUMB_FUNC_START MineFireTrap_8037540
MineFireTrap_8037540: @ 0x08037540
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq .L08037564
	cmp r0, #1
	bgt .L08037558
	cmp r0, #0
	beq .L0803755E
	b .L08037586
.L08037558:
	cmp r0, #2
	beq .L0803757C
	b .L08037586
.L0803755E:
	bl MU_EndAll
	b .L08037586
.L08037564:
	bl MU_EndAll
	ldr r0, .L08037578  @ gActiveUnit
	ldr r0, [r0]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
	b .L08037586
	.align 2, 0
.L08037578: .4byte gActiveUnit
.L0803757C:
	adds r0, r4, #0
	bl MU_GetByUnit
	bl MU_End
.L08037586:
	ldr r1, .L0803759C  @ gAction
	movs r0, #0xa
	strb r0, [r1, #0x15]
	adds r0, r4, #0
	movs r1, #0xa
	bl ExecSelfDamage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803759C: .4byte gAction

	THUMB_FUNC_END MineFireTrap_8037540

	THUMB_FUNC_START MineFireTrap_80375A0
MineFireTrap_80375A0: @ 0x080375A0
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x54]
	movs r2, #0xa
	negs r2, r2
	movs r3, #1
	negs r3, r3
	adds r1, r4, #0
	bl func_080357A8
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L080375DE
	ldr r5, .L080375E4  @ gActiveUnit
	ldr r6, [r5]
	str r4, [r5]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #3
	bl BWL_SetDeathStats
	bl CheckForPostActionEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080375DC
	bl RunPostActionEvents
.L080375DC:
	str r6, [r5]
.L080375DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080375E4: .4byte gActiveUnit

	THUMB_FUNC_END MineFireTrap_80375A0

	THUMB_FUNC_START GetTriggeredTrapType
GetTriggeredTrapType: @ 0x080375E8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	cmp r0, #0
	beq .L08037652
	ldrb r3, [r0, #2]
	cmp r3, #4
	beq .L08037612
	cmp r3, #4
	bgt .L0803760C
	cmp r3, #1
	beq .L08037652
	b .L08037656
.L0803760C:
	cmp r3, #0xb
	beq .L08037628
	b .L08037656
.L08037612:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq .L08037656
	movs r0, #0xf
	b .L08037658
.L08037628:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq .L0803764A
	adds r0, r4, #0
	bl GetUnitItemCount
	cmp r0, #5
	beq .L08037652
	movs r0, #0x10
	b .L08037658
.L0803764A:
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq .L08037656
.L08037652:
	movs r0, #0
	b .L08037658
.L08037656:
	adds r0, r3, #0
.L08037658:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetTriggeredTrapType

	THUMB_FUNC_START ExecTrap
ExecTrap: @ 0x08037660
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r5, #0
	bl GetTriggeredTrapType
	cmp r0, #0xb
	beq .L08037690
	cmp r0, #0xb
	bgt .L0803767C
	cmp r0, #8
	beq .L08037686
	b .L08037738
.L0803767C:
	cmp r0, #0xf
	beq .L080376B8
	cmp r0, #0x10
	beq .L080376F4
	b .L08037738
.L08037686:
	ldr r0, .L0803768C  @ gUnknown_0859E5AC
	b .L080376A4
	.align 2, 0
.L0803768C: .4byte gUnknown_0859E5AC
.L08037690:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	bl GetSpecificTrapAt
	bl RemoveTrap
	ldr r0, .L080376B4  @ gUnknown_0859E5FC
.L080376A4:
	adds r1, r6, #0
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r0, #0x50
	strh r4, [r0]
	str r5, [r1, #0x54]
	b .L08037738
	.align 2, 0
.L080376B4: .4byte gUnknown_0859E5FC
.L080376B8:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, .L080376F0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080376DA
	movs r0, #0xb1
	bl m4aSongNumStart
.L080376DA:
	movs r4, #1
	negs r4, r4
	movs r0, #0x20
	bl GetMsg
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_0801F9FC
	b .L08037738
	.align 2, 0
.L080376F0: .4byte gPlaySt
.L080376F4:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, .L08037740  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08037716
	movs r0, #0xb1
	bl m4aSongNumStart
.L08037716:
	movs r4, #1
	negs r4, r4
	movs r0, #0x21
	bl GetMsg
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_0801F9FC
	movs r0, #0x7a
	bl CreateItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
.L08037738:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08037740: .4byte gPlaySt

	THUMB_FUNC_END ExecTrap

	THUMB_FUNC_START HandlePostActionTraps
HandlePostActionTraps: @ 0x08037744
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08037790  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitCurrentHp
	cmp r0, #0
	ble .L0803778A
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L0803777E
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0803777E
	ldr r0, .L08037794  @ gAction
	ldrb r0, [r0, #0x11]
	cmp r0, #3
	bgt .L0803778A
	cmp r0, #1
	blt .L0803778A
.L0803777E:
	ldr r4, .L08037790  @ gActiveUnit
	ldr r0, [r4]
	bl GetTriggeredTrapType
	cmp r0, #0
	bne .L08037798
.L0803778A:
	movs r0, #1
	b .L080377C0
	.align 2, 0
.L08037790: .4byte gActiveUnit
.L08037794: .4byte gAction
.L08037798:
	ldr r1, .L080377C8  @ gAction
	movs r0, #1
	strb r0, [r1, #0x16]
	strb r0, [r1, #0x11]
	movs r0, #3
	bl SaveSuspendedGame
	bl GetBattleAnimType
	cmp r0, #1
	bne .L080377B2
	bl RefreshUnitSprites
.L080377B2:
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
.L080377C0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080377C8: .4byte gAction

	THUMB_FUNC_END HandlePostActionTraps

	THUMB_FUNC_START ExecTrapForActionTarget
ExecTrapForActionTarget: @ 0x080377CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080377EC  @ gAction
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080377EC: .4byte gAction

	THUMB_FUNC_END ExecTrapForActionTarget

	THUMB_FUNC_START func_080377F0
func_080377F0: @ 0x080377F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetTriggeredTrapType
	cmp r0, #0
	beq .L08037810
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L08037828
.L08037810:
	adds r0, r4, #0
	bl MU_GetByUnit
	bl MU_End
	bl RenderMap
	bl RefreshEntityMaps
	bl ForceSyncUnitSpriteSheet
	movs r0, #1
.L08037828:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080377F0

	THUMB_FUNC_START ExecTrap_QuietMaybe
ExecTrap_QuietMaybe: @ 0x08037830
	push {lr}
	movs r2, #3
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END ExecTrap_QuietMaybe

	THUMB_FUNC_START LoadTrapData
LoadTrapData: @ 0x08037840
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	cmp r5, #0
	beq .L08037908
	b .L08037902
.L0803784C:
	ldrb r0, [r5]
	subs r1, r0, #1
	adds r2, r0, #0
	cmp r1, #0xb
	bhi .L08037900
	lsls r0, r1, #2
	ldr r1, .L08037860  @ .L08037864
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08037860: .4byte .L08037864
.L08037864: @ jump table
	.4byte .L08037894 @ case 0
	.4byte .L08037900 @ case 1
	.4byte .L08037900 @ case 2
	.4byte .L080378A0 @ case 3
	.4byte .L080378AE @ case 4
	.4byte .L08037900 @ case 5
	.4byte .L080378E2 @ case 6
	.4byte .L080378C0 @ case 7
	.4byte .L080378CA @ case 8
	.4byte .L08037900 @ case 9
	.4byte .L080378D6 @ case 10
	.4byte .L080378EC @ case 11
.L08037894:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddBallista
	b .L08037900
.L080378A0:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #4]
	ldrb r3, [r5, #5]
	bl AddFireTrap
	b .L08037900
.L080378AE:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGasTrap
	b .L08037900
.L080378C0:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	bl AddTrap8
	b .L08037900
.L080378CA:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddTrap9
	b .L08037900
.L080378D6:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	movs r3, #0
	bl AddTrap
	b .L08037900
.L080378E2:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #4]
	ldrb r2, [r5, #5]
	bl AddArrowTrap
.L080378EC:
	movs r0, #1
	ldrsb r0, [r5, r0]
	movs r1, #2
	ldrsb r1, [r5, r1]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGorgonEggTrap
.L08037900:
	adds r5, #6
.L08037902:
	ldrb r0, [r5]
	cmp r0, #0
	bne .L0803784C
.L08037908:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadTrapData

	THUMB_FUNC_START LoadChapterBallistae
LoadChapterBallistae: @ 0x08037910
	push {lr}
	bl GetCurrentChapterBallistaePtr
	bl LoadTrapData
	bl GetCurrentChapterBallistae2Ptr
	bl LoadTrapData
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadChapterBallistae

	THUMB_FUNC_START AddGorgonEggTrap
AddGorgonEggTrap: @ 0x08037928
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0xc
	adds r3, r5, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END AddGorgonEggTrap

.align 2, 0
