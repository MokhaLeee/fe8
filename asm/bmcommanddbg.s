	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Does checks related to whether a unit can do certain actions on certain tiles
	@ None of this is used, even in the debug version of the game
	@ However, in the debug version, GetUnitCommandUseFlags does some printing to debug console

	THUMB_FUNC_START CanUnitUseVisit
CanUnitUseVisit: @ 0x08034314
	push {r4, r5, r6, r7, lr}
	ldr r0, .L08034328  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08034330
	b .L08034392
	.align 2, 0
.L08034328: .4byte gActiveUnit
.L0803432C:
	movs r0, #1
	b .L08034394
.L08034330:
	ldr r0, .L0803439C  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L08034392
.L0803433C:
	ldr r0, .L0803439C  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt .L0803438C
	lsls r6, r5, #2
	lsls r7, r5, #0x18
.L0803434C:
	ldr r0, .L080343A0  @ gMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L08034386
	ldr r0, .L080343A4  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	beq .L08034378
	cmp r0, #5
	beq .L08034378
	cmp r0, #0x38
	beq .L08034378
	cmp r0, #0x37
	bne .L08034386
.L08034378:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r7, #0x18
	bl GetLocationEventCommandAt
	cmp r0, #0x10
	beq .L0803432C
.L08034386:
	subs r4, #1
	cmp r4, #0
	bge .L0803434C
.L0803438C:
	subs r5, #1
	cmp r5, #0
	bge .L0803433C
.L08034392:
	movs r0, #0
.L08034394:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803439C: .4byte gMapSize
.L080343A0: .4byte gMapMovement
.L080343A4: .4byte gMapTerrain

	THUMB_FUNC_END CanUnitUseVisit

	THUMB_FUNC_START CanUnitUseSeize
CanUnitUseSeize: @ 0x080343A8
	push {r4, r5, r6, lr}
	ldr r0, .L080343C8  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08034416
	adds r0, r2, #0
	bl CanUnitSeize
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080343D0
	b .L08034416
	.align 2, 0
.L080343C8: .4byte gActiveUnit
.L080343CC:
	movs r0, #1
	b .L08034418
.L080343D0:
	ldr r0, .L08034420  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L08034416
.L080343DC:
	ldr r0, .L08034420  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt .L08034410
	lsls r6, r5, #0x18
.L080343EA:
	ldr r0, .L08034424  @ gMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803440A
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r6, #0x18
	bl GetLocationEventCommandAt
	cmp r0, #0x11
	beq .L080343CC
.L0803440A:
	subs r4, #1
	cmp r4, #0
	bge .L080343EA
.L08034410:
	subs r5, #1
	cmp r5, #0
	bge .L080343DC
.L08034416:
	movs r0, #0
.L08034418:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08034420: .4byte gMapSize
.L08034424: .4byte gMapMovement

	THUMB_FUNC_END CanUnitUseSeize

	THUMB_FUNC_START CanUnitUseAttack
CanUnitUseAttack: @ 0x08034428
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl InitTargets
	ldr r0, .L08034460  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r4, .L08034464  @ gActiveUnit
	ldr r0, [r4]
	bl BuildUnitCompleteAttackRange
	ldr r1, .L08034468  @ gUnitSubject
	ldr r0, [r4]
	str r0, [r1]
	ldr r0, .L0803446C  @ AddUnitToTargetListIfNotAllied
	bl ForEachUnitInRange
	bl GetTargetListSize
	cmp r0, #0
	beq .L0803445A
	movs r0, #1
.L0803445A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08034460: .4byte gMapRange
.L08034464: .4byte gActiveUnit
.L08034468: .4byte gUnitSubject
.L0803446C: .4byte AddUnitToTargetListIfNotAllied

	THUMB_FUNC_END CanUnitUseAttack

	THUMB_FUNC_START CanActiveUnitUseRescue
CanActiveUnitUseRescue: @ 0x08034470
	push {lr}
	ldr r0, .L08034488  @ gActiveUnit
	ldr r0, [r0]
	bl MakeRescueTargetList
	bl GetTargetListSize
	cmp r0, #0
	beq .L08034484
	movs r0, #1
.L08034484:
	pop {r1}
	bx r1
	.align 2, 0
.L08034488: .4byte gActiveUnit

	THUMB_FUNC_END CanActiveUnitUseRescue

	THUMB_FUNC_START CanActiveUnitUseTrade
CanActiveUnitUseTrade: @ 0x0803448C
	push {lr}
	ldr r0, .L080344A4  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTradeTargetList
	bl GetTargetListSize
	cmp r0, #0
	beq .L080344A0
	movs r0, #1
.L080344A0:
	pop {r1}
	bx r1
	.align 2, 0
.L080344A4: .4byte gActiveUnit

	THUMB_FUNC_END CanActiveUnitUseTrade

	THUMB_FUNC_START GetUnitCommandUseFlags
GetUnitCommandUseFlags: @ 0x080344A8
	push {r4, lr}
	bl GetGameTime
	bl CanUnitUseVisit
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #9
	bl CanUnitUseSeize
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	orrs r4, r0
	bl CanUnitUseAttack
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	orrs r4, r0
	bl CanActiveUnitUseRescue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	orrs r4, r0
	bl CanActiveUnitUseTrade
	lsls r0, r0, #0x18
	asrs r0, r0, #1
	orrs r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitCommandUseFlags

	THUMB_FUNC_START func_080344E8
func_080344E8: @ 0x080344E8
	push {lr}
	ldr r0, .L0803450C  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	ldrb r2, [r0, #0x1d]
	adds r1, r1, r2
	ldr r2, .L08034510  @ gAction
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapFloodUnitMovement
	bl GetUnitCommandUseFlags
	pop {r1}
	bx r1
	.align 2, 0
.L0803450C: .4byte gActiveUnit
.L08034510: .4byte gAction

	THUMB_FUNC_END func_080344E8

	THUMB_FUNC_START func_08034514
func_08034514: @ 0x08034514
	push {r4, lr}
	ldr r4, .L08034548  @ gMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl MapFill
	ldr r0, .L0803454C  @ gActiveUnit
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl GetUnitCommandUseFlags
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08034548: .4byte gMapMovement
.L0803454C: .4byte gActiveUnit

	THUMB_FUNC_END func_08034514

	THUMB_FUNC_START func_08034550
func_08034550: @ 0x08034550
	push {r4, r5, r6, r7, lr}
	movs r1, #1
	negs r1, r1
	bl GetUnitWeaponReach
	adds r7, r0, #0
	ldr r0, .L08034604  @ gMapOther
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r5, #0x81
	ldr r6, .L08034608  @ gAction
.L0803456A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L0803458C
	ldr r0, [r4]
	cmp r0, #0
	beq .L0803458C
	adds r0, r4, #0
	adds r1, r7, #0
	bl BuildUnitStandingRangeForReach
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x13]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #0x14]
.L0803458C:
	adds r5, #1
	cmp r5, #0xbf
	ble .L0803456A
	movs r0, #0
	movs r1, #0
	bl InitTargets
	ldr r0, .L0803460C  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt .L080345FE
.L080345A6:
	ldr r0, .L0803460C  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r6, #1
	cmp r4, #0
	blt .L080345F8
	lsls r5, r6, #2
.L080345B6:
	ldr r0, .L08034610  @ gMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L080345F2
	ldr r0, .L08034614  @ gMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080345F2
	ldr r0, .L08034604  @ gMapOther
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080345F2
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl AddTarget
.L080345F2:
	subs r4, #1
	cmp r4, #0
	bge .L080345B6
.L080345F8:
	adds r6, r7, #0
	cmp r6, #0
	bge .L080345A6
.L080345FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08034604: .4byte gMapOther
.L08034608: .4byte gAction
.L0803460C: .4byte gMapSize
.L08034610: .4byte gMapMovement
.L08034614: .4byte gMapUnit

	THUMB_FUNC_END func_08034550

.align 2, 0
