	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Player Phase proc code and related functions

	THUMB_FUNC_START PlayerPhase_Suspend
PlayerPhase_Suspend: @ 0x0801C894
	push {lr}
	ldr r1, .L0801C8A8  @ gAction
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
	pop {r0}
	bx r0
	.align 2, 0
.L0801C8A8: .4byte gAction

	THUMB_FUNC_END PlayerPhase_Suspend

	THUMB_FUNC_START HandlePlayerCursorMovement
HandlePlayerCursorMovement: @ 0x0801C8AC
	push {lr}
	ldr r2, .L0801C8DC  @ gKeySt
	ldr r3, [r2]
	ldrh r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0801C8E8
	ldr r0, .L0801C8E0  @ gBmSt
	ldr r0, [r0, #0x20]
	ldr r1, .L0801C8E4  @ 0x00070007
	ands r0, r1
	cmp r0, #0
	bne .L0801C8E8
	ldrh r0, [r3, #0x10]
	bl HandleCursorMovement
	movs r0, #8
	bl MoveCameraByStepMaybe
	movs r0, #8
	bl func_0801588C
	b .L0801C8FC
	.align 2, 0
.L0801C8DC: .4byte gKeySt
.L0801C8E0: .4byte gBmSt
.L0801C8E4: .4byte 0x00070007
.L0801C8E8:
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	bl HandleCursorMovement
	movs r0, #4
	bl MoveCameraByStepMaybe
	movs r0, #4
	bl func_0801588C
.L0801C8FC:
	ldr r1, .L0801C91C  @ gBmSt
	ldrh r0, [r1, #0x20]
	ldrh r1, [r1, #0x22]
	orrs r0, r1
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L0801C918
	ldr r0, .L0801C920  @ gKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	ldr r0, .L0801C924  @ 0x0000FCF4
	ands r0, r1
	strh r0, [r2, #8]
.L0801C918:
	pop {r0}
	bx r0
	.align 2, 0
.L0801C91C: .4byte gBmSt
.L0801C920: .4byte gKeySt
.L0801C924: .4byte 0x0000FCF4

	THUMB_FUNC_END HandlePlayerCursorMovement

	THUMB_FUNC_START CanShowUnitStatScreen
CanShowUnitStatScreen: @ 0x0801C928

	@ r0 is an Unit*

	push {lr}
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq .L0801C936
	cmp r0, #0x34
	bne .L0801C93A
.L0801C936:
	movs r0, #0
	b .L0801C93C
.L0801C93A:
	movs r0, #1
.L0801C93C:
	pop {r1}
	bx r1

	THUMB_FUNC_END CanShowUnitStatScreen

	THUMB_FUNC_START PlayerPhase_MainIdle
PlayerPhase_MainIdle: @ 0x0801C940
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl HandlePlayerCursorMovement
	ldr r4, .L0801C97C  @ gKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0801C988
	ldr r1, .L0801C980  @ gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl func_0801DB4C
	ldr r0, .L0801C984  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0801C974
	b .L0801CB38
.L0801C974:
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0801CB38
	.align 2, 0
.L0801C97C: .4byte gKeySt
.L0801C980: .4byte gBmSt
.L0801C984: .4byte gPlaySt
.L0801C988:
	bl BMXFADEExists
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801C994
	b .L0801CB38
.L0801C994:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0801CA0C
	ldr r4, .L0801CA04  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r5, .L0801CA08  @ gMapUnit
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0801CA0C
	bl GetUnit
	bl CanShowUnitStatScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801CA0C
	bl MU_EndAll
	bl EndPlayerPhaseSideWindows
	movs r0, #0x1f
	bl SetStatScreenConfig
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r6, #0
	bl StartStatScreen
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b .L0801CB64
	.align 2, 0
.L0801CA04: .4byte gBmSt
.L0801CA08: .4byte gMapUnit
.L0801CA0C:
	ldr r0, .L0801CA4C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0801CAD4
	ldr r5, .L0801CA50  @ gBmSt
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, .L0801CA54  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl GetUnitSelectionValueThing
	cmp r0, #2
	beq .L0801CA9C
	cmp r0, #2
	ble .L0801CA58
	cmp r0, #3
	beq .L0801CABC
	b .L0801CAD4
	.align 2, 0
.L0801CA4C: .4byte gKeySt
.L0801CA50: .4byte gBmSt
.L0801CA54: .4byte gMapUnit
.L0801CA58:
	cmp r0, #0
	blt .L0801CAD4
	bl EndPlayerPhaseSideWindows
	ldr r0, .L0801CA94  @ gPlaySt
	ldrh r1, [r5, #0x14]
	strb r1, [r0, #0x12]
	ldrh r1, [r5, #0x16]
	strb r1, [r0, #0x13]
	cmp r4, #0
	beq .L0801CA78
	bl MU_EndAll
	adds r0, r4, #0
	bl ShowUnitSprite
.L0801CA78:
	ldr r0, .L0801CA98  @ MenuInfo_Map
	movs r3, #0x1c
	ldrsh r1, [r5, r3]
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x17
	bl StartMenuAdjusted
	bl func_080832CC
	b .L0801CB20
	.align 2, 0
.L0801CA94: .4byte gPlaySt
.L0801CA98: .4byte MenuInfo_Map
.L0801CA9C:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, .L0801CAB8  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl BWL_IncrementMoveValue
	adds r0, r6, #0
	bl Proc_Break
	b .L0801CB38
	.align 2, 0
.L0801CAB8: .4byte gActiveUnit
.L0801CABC:
	adds r0, r4, #0
	bl UnitBeginAction
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
	b .L0801CB38
.L0801CAD4:
	ldr r0, .L0801CB2C  @ gKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L0801CB38
	ldrh r1, [r2, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0801CB38
	ldr r2, .L0801CB30  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, .L0801CB34  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L0801CB18
	bl MU_EndAll
	adds r0, r4, #0
	bl ShowUnitSprite
.L0801CB18:
	bl EndPlayerPhaseSideWindows
	bl func_080A87C8
.L0801CB20:
	adds r0, r6, #0
	movs r1, #9
	bl Proc_Goto
	b .L0801CB64
	.align 2, 0
.L0801CB2C: .4byte gKeySt
.L0801CB30: .4byte gBmSt
.L0801CB34: .4byte gMapUnit
.L0801CB38:
	bl UnitSpriteHoverUpdate
	ldr r1, .L0801CB6C  @ gBmSt
	movs r0, #0x20
	ldrsh r4, [r1, r0]
	movs r2, #0x22
	ldrsh r5, [r1, r2]
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl IsUnitSpriteHoverEnabledAt
	lsls r0, r0, #0x18
	movs r2, #0
	cmp r0, #0
	beq .L0801CB5C
	movs r2, #3
.L0801CB5C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl DisplayCursor
.L0801CB64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0801CB6C: .4byte gBmSt

	THUMB_FUNC_END PlayerPhase_MainIdle

	THUMB_FUNC_START DisplayUnitEffectRange
DisplayUnitEffectRange: @ 0x0801CB70
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #1
	ldr r5, .L0801CBD8  @ gActiveUnit
	ldr r0, [r5]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	ldrb r2, [r0, #0x1d]
	adds r1, r1, r2
	ldr r2, .L0801CBDC  @ gAction
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapFloodUnitMovement
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0801CC10
	ldr r0, .L0801CBE0  @ gMapOther
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801CBB8
	movs r0, #1
	bl BuildMagicSealRange
.L0801CBB8:
	ldr r0, .L0801CBE4  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r5]
	bl GetUnitWeaponUsabilityBits
	cmp r0, #2
	beq .L0801CBF8
	cmp r0, #2
	bgt .L0801CBE8
	cmp r0, #1
	beq .L0801CC08
	b .L0801CC10
	.align 2, 0
.L0801CBD8: .4byte gActiveUnit
.L0801CBDC: .4byte gAction
.L0801CBE0: .4byte gMapOther
.L0801CBE4: .4byte gMapRange
.L0801CBE8:
	cmp r0, #3
	bne .L0801CC10
	ldr r0, .L0801CC04  @ gBmSt
	adds r0, #0x3e
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, #0
	beq .L0801CC08
.L0801CBF8:
	ldr r0, [r5]
	bl BuildUnitCompleteStaffRange
	movs r4, #5
	b .L0801CC10
	.align 2, 0
.L0801CC04: .4byte gBmSt
.L0801CC08:
	ldr r0, [r5]
	bl BuildUnitCompleteAttackRange
	movs r4, #3
.L0801CC10:
	adds r0, r4, #0
	bl DisplayMoveRangeGraphics
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END DisplayUnitEffectRange

	THUMB_FUNC_START PlayerPhase_InitUnitMovementSelect
PlayerPhase_InitUnitMovementSelect: @ 0x0801CC1C
	push {r4, r5, lr}
	ldr r5, .L0801CC64  @ gBmSt
	ldrb r1, [r5, #4]
	movs r0, #2
	orrs r0, r1
	strb r0, [r5, #4]
	ldr r4, .L0801CC68  @ gActiveUnit
	ldr r0, [r4]
	bl DisplayUnitEffectRange
	ldr r4, [r4]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x14
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne .L0801CC70
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne .L0801CC70
	movs r0, #0
	bl func_08032E28
	ldr r0, .L0801CC6C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0801CC76
	movs r0, #0x69
	bl m4aSongNumStart
	b .L0801CC76
	.align 2, 0
.L0801CC64: .4byte gBmSt
.L0801CC68: .4byte gActiveUnit
.L0801CC6C: .4byte gPlaySt
.L0801CC70:
	movs r0, #1
	bl func_08032E28
.L0801CC76:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END PlayerPhase_InitUnitMovementSelect

	THUMB_FUNC_START DisplayActiveUnitEffectRange
DisplayActiveUnitEffectRange: @ 0x0801CC7C
	push {lr}
	ldr r0, .L0801CCA8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0801CC90
	movs r0, #0x68
	bl m4aSongNumStart
.L0801CC90:
	ldr r2, .L0801CCAC  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2, #4]
	ldr r0, .L0801CCB0  @ gActiveUnit
	ldr r0, [r0]
	bl DisplayUnitEffectRange
	pop {r0}
	bx r0
	.align 2, 0
.L0801CCA8: .4byte gPlaySt
.L0801CCAC: .4byte gBmSt
.L0801CCB0: .4byte gActiveUnit

	THUMB_FUNC_END DisplayActiveUnitEffectRange

	THUMB_FUNC_START PlayerPhase_DisplayDangerZone
PlayerPhase_DisplayDangerZone: @ 0x0801CCB4

	@ DANGER ZONE

	push {r4, r5, r6, lr}
	ldr r4, .L0801CD04  @ gBmSt
	adds r5, r4, #0
	adds r5, #0x3e
	ldrb r1, [r5]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	bl BuildDangerZoneRange
	ldr r0, .L0801CD08  @ gMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MapFill
	ldr r0, .L0801CD0C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0801CCE6
	movs r0, #0x68
	bl m4aSongNumStart
.L0801CCE6:
	ldrb r1, [r4, #4]
	movs r0, #8
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #4]
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq .L0801CD10
	movs r0, #5
	bl DisplayMoveRangeGraphics
	b .L0801CD16
	.align 2, 0
.L0801CD04: .4byte gBmSt
.L0801CD08: .4byte gMapMovement
.L0801CD0C: .4byte gPlaySt
.L0801CD10:
	movs r0, #3
	bl DisplayMoveRangeGraphics
.L0801CD16:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END PlayerPhase_DisplayDangerZone

	THUMB_FUNC_START PlayerPhase_RangeDisplayIdle
PlayerPhase_RangeDisplayIdle: @ 0x0801CD1C

	@ Player Phase Proc Idle during range display?

	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xff
	bl HandlePlayerCursorMovement
	ldr r0, .L0801CD44  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0801CD98
	ldr r4, .L0801CD48  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	bne .L0801CD4C
	bl GetCombinedEnemyWeaponUsabilityBits
	b .L0801CD76
	.align 2, 0
.L0801CD44: .4byte gKeySt
.L0801CD48: .4byte gActiveUnit
.L0801CD4C:
	bl RunMoveEventsMaybe
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801CD5A
	movs r4, #5
	b .L0801CDE2
.L0801CD5A:
	ldr r0, [r4]
	bl GetUnitSelectionValueThing
	cmp r0, #2
	beq .L0801CD80
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0801CD80
	adds r0, r2, #0
	bl GetUnitWeaponUsabilityBits
.L0801CD76:
	movs r4, #2
	cmp r0, #3
	bne .L0801CDE2
	movs r4, #6
	b .L0801CDE2
.L0801CD80:
	ldr r1, .L0801CDBC  @ gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl CanMoveActiveUnitTo
	lsls r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	beq .L0801CDE2
	movs r4, #1
.L0801CD98:
	ldr r0, .L0801CDC0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0801CDC8
	ldr r0, .L0801CDC4  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	movs r4, #2
	cmp r0, #0
	beq .L0801CDE2
	movs r4, #0
	b .L0801CDE2
	.align 2, 0
.L0801CDBC: .4byte gBmSt
.L0801CDC0: .4byte gKeySt
.L0801CDC4: .4byte gActiveUnit
.L0801CDC8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0801CDD6
	movs r4, #3
	b .L0801CDE2
.L0801CDD6:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0801CDE2
	movs r4, #4
.L0801CDE2:
	cmp r4, #6
	bls .L0801CDE8
	b .L0801CFC0
.L0801CDE8:
	lsls r0, r4, #2
	ldr r1, .L0801CDF4  @ .L0801CDF8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0801CDF4: .4byte .L0801CDF8
.L0801CDF8: @ jump table
	.4byte .L0801CE14 @ case 0
	.4byte .L0801CE30 @ case 1
	.4byte .L0801CE50 @ case 2
	.4byte .L0801CED4 @ case 3
	.4byte .L0801CF4C @ case 4
	.4byte .L0801CFC0 @ case 5
	.4byte .L0801CF90 @ case 6
.L0801CE14:
	ldr r0, .L0801CE2C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0801CE22
	b .L0801CFC0
.L0801CE22:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0801CFC0
	.align 2, 0
.L0801CE2C: .4byte gPlaySt
.L0801CE30:
	ldr r0, .L0801CE4C  @ gActiveUnitMoveOrigin
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	bl HideMoveRangeGraphics
	adds r0, r5, #0
	bl Proc_Break
	b .L0801CFE0
	.align 2, 0
.L0801CE4C: .4byte gActiveUnitMoveOrigin
.L0801CE50:
	ldr r4, .L0801CEC4  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq .L0801CE90
	bl MU_EndAll
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L0801CE90
	ldr r4, .L0801CEC8  @ gActiveUnitMoveOrigin
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetCursorMapPosition
.L0801CE90:
	ldr r2, .L0801CECC  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r0, .L0801CED0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0801CEB8
	movs r0, #0x6b
	bl m4aSongNumStart
.L0801CEB8:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b .L0801CFE0
	.align 2, 0
.L0801CEC4: .4byte gActiveUnit
.L0801CEC8: .4byte gActiveUnitMoveOrigin
.L0801CECC: .4byte gBmSt
.L0801CED0: .4byte gPlaySt
.L0801CED4:
	bl EventEngineExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0801CFC0
	ldr r2, .L0801CF3C  @ gBmSt
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, .L0801CF40  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, .L0801CF44  @ gActiveUnitMoveOrigin
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne .L0801CF08
	ldr r0, .L0801CF48  @ gActiveUnit
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
.L0801CF08:
	cmp r4, #0
	beq .L0801CFC0
	adds r0, r4, #0
	bl GetUnit
	bl CanShowUnitStatScreen
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801CFC0
	bl MU_EndAll
	movs r0, #0x1f
	bl SetStatScreenConfig
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	b .L0801CFE0
	.align 2, 0
.L0801CF3C: .4byte gBmSt
.L0801CF40: .4byte gMapUnit
.L0801CF44: .4byte gActiveUnitMoveOrigin
.L0801CF48: .4byte gActiveUnit
.L0801CF4C:
	ldr r0, .L0801CF84  @ gActiveUnit
	ldr r0, [r0]
	cmp r0, #0
	beq .L0801CFC0
	ldr r4, .L0801CF88  @ gActiveUnitMoveOrigin
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetCursorMapPosition
	ldr r0, .L0801CF8C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0801CFC0
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0801CFC0
	.align 2, 0
.L0801CF84: .4byte gActiveUnit
.L0801CF88: .4byte gActiveUnitMoveOrigin
.L0801CF8C: .4byte gPlaySt
.L0801CF90:
	ldr r4, .L0801CFB4  @ gBmSt
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl HideMoveRangeGraphics
	ldrb r1, [r4, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L0801CFB8
	adds r0, r5, #0
	movs r1, #0xc
	bl Proc_Goto
	b .L0801CFC0
	.align 2, 0
.L0801CFB4: .4byte gBmSt
.L0801CFB8:
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
.L0801CFC0:
	ldr r0, .L0801CFE8  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitSelectionValueThing
	cmp r0, #2
	bne .L0801CFD0
	bl func_08033248
.L0801CFD0:
	ldr r1, .L0801CFEC  @ gBmSt
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl DisplayCursor
.L0801CFE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801CFE8: .4byte gActiveUnit
.L0801CFEC: .4byte gBmSt

	THUMB_FUNC_END PlayerPhase_RangeDisplayIdle

	THUMB_FUNC_START PlayerPhase_CancelAction
PlayerPhase_CancelAction: @ 0x0801CFF0

	@ Player Phase Action Cancel

	push {lr}
	ldr r2, .L0801D004  @ gAction
	movs r1, #0
	strb r1, [r2, #0x11]
	movs r1, #2
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
.L0801D004: .4byte gAction

	THUMB_FUNC_END PlayerPhase_CancelAction

	THUMB_FUNC_START PlayerPhase_BackToMove
PlayerPhase_BackToMove: @ 0x0801D008
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0801D050  @ gActiveUnit
	ldr r1, [r4]
	ldr r2, .L0801D054  @ gActiveUnitMoveOrigin
	ldrh r0, [r2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitSyncMovement
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	ldr r4, [r4]
	ldr r0, [r4, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0801D058
	adds r0, r4, #0
	bl UnitBeginAction
	b .L0801D05E
	.align 2, 0
.L0801D050: .4byte gActiveUnit
.L0801D054: .4byte gActiveUnitMoveOrigin
.L0801D058:
	adds r0, r4, #0
	bl UnitBeginCantoAction
.L0801D05E:
	ldr r4, .L0801D080  @ gActiveUnit
	ldr r0, [r4]
	bl HideUnitSprite
	bl MU_EndAll
	ldr r0, [r4]
	bl MU_Create
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D080: .4byte gActiveUnit

	THUMB_FUNC_END PlayerPhase_BackToMove

	THUMB_FUNC_START PlayerPhase_PreAction
PlayerPhase_PreAction: @ 0x0801D084
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L0801D0C4  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r5, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	eors r1, r0
	lsrs r5, r1, #0x18
	ldrb r0, [r4, #0x11]
	cmp r0, #0x22
	bls .L0801D0B8
	b .L0801D1C8
.L0801D0B8:
	lsls r0, r0, #2
	ldr r1, .L0801D0C8  @ .L0801D0CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0801D0C4: .4byte gAction
.L0801D0C8: .4byte .L0801D0CC
.L0801D0CC: @ jump table
	.4byte .L0801D158 @ case 0
	.4byte .L0801D1C8 @ case 1
	.4byte .L0801D1C8 @ case 2
	.4byte .L0801D1C8 @ case 3
	.4byte .L0801D1C8 @ case 4
	.4byte .L0801D1C8 @ case 5
	.4byte .L0801D1C8 @ case 6
	.4byte .L0801D1C8 @ case 7
	.4byte .L0801D1C8 @ case 8
	.4byte .L0801D1C8 @ case 9
	.4byte .L0801D1C8 @ case 10
	.4byte .L0801D19C @ case 11
	.4byte .L0801D19C @ case 12
	.4byte .L0801D1C8 @ case 13
	.4byte .L0801D1C8 @ case 14
	.4byte .L0801D1C8 @ case 15
	.4byte .L0801D1C8 @ case 16
	.4byte .L0801D1C8 @ case 17
	.4byte .L0801D1C8 @ case 18
	.4byte .L0801D1C8 @ case 19
	.4byte .L0801D1C8 @ case 20
	.4byte .L0801D1C8 @ case 21
	.4byte .L0801D1C8 @ case 22
	.4byte .L0801D1C8 @ case 23
	.4byte .L0801D1C8 @ case 24
	.4byte .L0801D1C8 @ case 25
	.4byte .L0801D1C8 @ case 26
	.4byte .L0801D17E @ case 27
	.4byte .L0801D18C @ case 28
	.4byte .L0801D1B8 @ case 29
	.4byte .L0801D1C8 @ case 30
	.4byte .L0801D1C8 @ case 31
	.4byte .L0801D1C8 @ case 32
	.4byte .L0801D1AC @ case 33
	.4byte .L0801D1AC @ case 34
.L0801D158:
	ldr r0, .L0801D16C  @ gBmSt
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0801D174
	ldr r1, .L0801D170  @ gAction
	movs r0, #0x1f
	strb r0, [r1, #0x11]
	b .L0801D1C8
	.align 2, 0
.L0801D16C: .4byte gBmSt
.L0801D170: .4byte gAction
.L0801D174:
	adds r0, r6, #0
	bl PlayerPhase_BackToMove
	movs r0, #1
	b .L0801D234
.L0801D17E:
	ldr r0, .L0801D188  @ gBmSt
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #2
	b .L0801D1B4
	.align 2, 0
.L0801D188: .4byte gBmSt
.L0801D18C:
	ldr r0, .L0801D198  @ gBmSt
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #4
	b .L0801D1B4
	.align 2, 0
.L0801D198: .4byte gBmSt
.L0801D19C:
	ldr r0, .L0801D1A8  @ gBmSt
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #1
	b .L0801D1B4
	.align 2, 0
.L0801D1A8: .4byte gBmSt
.L0801D1AC:
	ldr r0, .L0801D1C4  @ gBmSt
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #8
.L0801D1B4:
	orrs r1, r2
	strb r1, [r0]
.L0801D1B8:
	adds r0, r6, #0
	bl PlayerPhase_CancelAction
	movs r0, #1
	b .L0801D234
	.align 2, 0
.L0801D1C4: .4byte gBmSt
.L0801D1C8:
	ldr r4, .L0801D200  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIid
	adds r2, r0, #0
	ldr r0, .L0801D204  @ gBattleUnitA
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	cmp r2, #0x8a
	beq .L0801D230
	cmp r2, #0x8a
	bgt .L0801D208
	cmp r2, #0x64
	blt .L0801D214
	cmp r2, #0x68
	ble .L0801D230
	cmp r2, #0x88
	beq .L0801D230
	b .L0801D214
	.align 2, 0
.L0801D200: .4byte gAction
.L0801D204: .4byte gBattleUnitA
.L0801D208:
	cmp r2, #0x97
	blt .L0801D214
	cmp r2, #0x99
	ble .L0801D230
	cmp r2, #0xc1
	beq .L0801D230
.L0801D214:
	ldr r1, .L0801D23C  @ gAction
	ldrb r0, [r1, #0x11]
	cmp r0, #1
	beq .L0801D230
	ldr r0, .L0801D240  @ gBmSt
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0801D230
	movs r0, #1
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
.L0801D230:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
.L0801D234:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0801D23C: .4byte gAction
.L0801D240: .4byte gBmSt

	THUMB_FUNC_END PlayerPhase_PreAction

	THUMB_FUNC_START TryMakeCantoUnit
TryMakeCantoUnit: @ 0x0801D244
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, .L0801D29C  @ gActiveUnit
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq .L0801D298
	ldr r0, [r3, #0xc]
	ldr r1, .L0801D2A0  @ 0x00010044
	ands r0, r1
	cmp r0, #0
	bne .L0801D298
	ldr r0, .L0801D2A4  @ gAction
	ldrb r1, [r0, #0x11]
	adds r2, r0, #0
	cmp r1, #3
	bgt .L0801D278
	cmp r1, #1
	bge .L0801D298
.L0801D278:
	ldr r1, [r4]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldrb r2, [r2, #0x10]
	cmp r0, r2
	ble .L0801D298
	bl CanUnitMove
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801D2A8
.L0801D298:
	movs r0, #0
	b .L0801D2FA
	.align 2, 0
.L0801D29C: .4byte gActiveUnit
.L0801D2A0: .4byte 0x00010044
.L0801D2A4: .4byte gAction
.L0801D2A8:
	ldr r0, .L0801D2E8  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4]
	bl UnitBeginCantoAction
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	subs r1, #0x43
	ands r0, r1
	str r0, [r2, #0xc]
	bl MU_EndAll
	ldr r0, [r4]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
	ldr r0, .L0801D2EC  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L0801D2F0
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b .L0801D2F8
	.align 2, 0
.L0801D2E8: .4byte gMapRange
.L0801D2EC: .4byte gPlaySt
.L0801D2F0:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
.L0801D2F8:
	movs r0, #1
.L0801D2FA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END TryMakeCantoUnit

	THUMB_FUNC_START MaybeRunPostActionEvents
MaybeRunPostActionEvents: @ 0x0801D300
	push {lr}
	bl CheckForPostActionEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801D310
	movs r0, #1
	b .L0801D316
.L0801D310:
	bl RunPostActionEvents
	movs r0, #0
.L0801D316:
	pop {r1}
	bx r1

	THUMB_FUNC_END MaybeRunPostActionEvents

	THUMB_FUNC_START EnsureCameraOntoActiveUnitPosition
EnsureCameraOntoActiveUnitPosition: @ 0x0801D31C
	push {lr}
	ldr r1, .L0801D340  @ gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801D33A
	movs r1, #1
.L0801D33A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0801D340: .4byte gActiveUnit

	THUMB_FUNC_END EnsureCameraOntoActiveUnitPosition

	THUMB_FUNC_START func_0801D344
func_0801D344: @ 0x0801D344
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L0801D374  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L0801D37C
	bl RenderMapForFade
	ldr r1, .L0801D378  @ gAction
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #0
	bl StartBMXFADE
	bl RefreshUnitSprites
	b .L0801D38E
	.align 2, 0
.L0801D374: .4byte gPlaySt
.L0801D378: .4byte gAction
.L0801D37C:
	ldr r1, .L0801D3C0  @ gAction
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
.L0801D38E:
	ldr r4, .L0801D3C4  @ gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
	ldr r2, .L0801D3C8  @ gPlaySt
	ldr r1, .L0801D3CC  @ gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r2, #0x13]
	adds r0, r5, #0
	bl TryMakeCantoUnit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801D3D0
	ldr r0, [r4]
	bl HideUnitSprite
	b .L0801D3FC
	.align 2, 0
.L0801D3C0: .4byte gAction
.L0801D3C4: .4byte gActiveUnit
.L0801D3C8: .4byte gPlaySt
.L0801D3CC: .4byte gBmSt
.L0801D3D0:
	bl ShouldCallEndEvent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801D3F8
	bl MU_EndAll
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl MaybeCallEndEvent_
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b .L0801D3FC
.L0801D3F8:
	bl MU_EndAll
.L0801D3FC:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801D344

	THUMB_FUNC_START func_0801D404
func_0801D404: @ 0x0801D404
	push {lr}
	ldr r0, .L0801D42C  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne .L0801D428
	ldr r1, .L0801D430  @ gAction
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl MU_EndAll
.L0801D428:
	pop {r0}
	bx r0
	.align 2, 0
.L0801D42C: .4byte gPlaySt
.L0801D430: .4byte gAction

	THUMB_FUNC_END func_0801D404

	THUMB_FUNC_START func_0801D434
func_0801D434: @ 0x0801D434
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0801D464  @ gAction
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1e
	beq .L0801D456
	ldr r0, .L0801D468  @ MenuInfo_UnitAction
	ldr r2, .L0801D46C  @ gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartMenu_AndDoSomethingCommands
.L0801D456:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D464: .4byte gAction
.L0801D468: .4byte MenuInfo_UnitAction
.L0801D46C: .4byte gBmSt

	THUMB_FUNC_END func_0801D434

	THUMB_FUNC_START PlayerPhase_ApplyUnitMovement
PlayerPhase_ApplyUnitMovement: @ 0x0801D470
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L0801D4D4  @ gActiveUnit
	ldr r1, [r4]
	ldr r5, .L0801D4D8  @ gAction
	ldrb r0, [r5, #0xe]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r5, #0xf]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitSyncMovement
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0801D4BA
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	bne .L0801D4BA
	ldr r0, .L0801D4DC  @ gBmSt
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0801D4BA
	ldrb r0, [r5, #0xf]
	ldr r1, .L0801D4E0  @ gMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r5, #0xe]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
.L0801D4BA:
	bl ResetTextFont
	bl RunPostMoveEvents
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0801D4E4
	adds r0, r6, #0
	bl func_0801D434
	b .L0801D508
	.align 2, 0
.L0801D4D4: .4byte gActiveUnit
.L0801D4D8: .4byte gAction
.L0801D4DC: .4byte gBmSt
.L0801D4E0: .4byte gMapMovement
.L0801D4E4:
	ldr r0, .L0801D510  @ gAction
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1e
	beq .L0801D502
	ldr r0, .L0801D514  @ MenuInfo_UnitAction
	ldr r2, .L0801D518  @ gBmSt
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartMenu_AndDoSomethingCommands
.L0801D502:
	adds r0, r6, #0
	bl Proc_Break
.L0801D508:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D510: .4byte gAction
.L0801D514: .4byte MenuInfo_UnitAction
.L0801D518: .4byte gBmSt

	THUMB_FUNC_END PlayerPhase_ApplyUnitMovement

	THUMB_FUNC_START GetUnitSelectionValueThing
GetUnitSelectionValueThing: @ 0x0801D51C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0801D548  @ gPlaySt
	ldrb r2, [r0, #0xf]
	cmp r4, #0
	beq .L0801D556
	ldr r0, .L0801D54C  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0801D552
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl CanCharacterBePrepMoved
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801D550
	movs r0, #4
	b .L0801D5A0
	.align 2, 0
.L0801D548: .4byte gPlaySt
.L0801D54C: .4byte gBmSt
.L0801D550:
	movs r2, #0
.L0801D552:
	cmp r4, #0
	bne .L0801D55A
.L0801D556:
	movs r0, #0
	b .L0801D5A0
.L0801D55A:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, r2
	bne .L0801D59E
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L0801D584
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq .L0801D588
.L0801D584:
	movs r0, #1
	b .L0801D5A0
.L0801D588:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq .L0801D59E
	cmp r1, #4
	beq .L0801D59E
	movs r0, #2
	b .L0801D5A0
.L0801D59E:
	movs r0, #3
.L0801D5A0:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitSelectionValueThing

	THUMB_FUNC_START CanMoveActiveUnitTo
CanMoveActiveUnitTo: @ 0x0801D5A8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0801D60C  @ gMapUnit
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0801D606
	ldr r0, .L0801D610  @ gMapMovement
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi .L0801D606
	ldr r0, .L0801D614  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L0801D61C
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	adds r2, r0, #0
	ldr r1, .L0801D618  @ gActiveUnitMoveOrigin
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne .L0801D5FC
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r5, r0
	beq .L0801D61C
.L0801D5FC:
	cmp r2, #0
	beq .L0801D61C
	ldrb r0, [r2, #2]
	cmp r0, #1
	bne .L0801D61C
.L0801D606:
	movs r0, #0
	b .L0801D61E
	.align 2, 0
.L0801D60C: .4byte gMapUnit
.L0801D610: .4byte gMapMovement
.L0801D614: .4byte gActiveUnit
.L0801D618: .4byte gActiveUnitMoveOrigin
.L0801D61C:
	movs r0, #1
.L0801D61E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanMoveActiveUnitTo

	THUMB_FUNC_START PlayerPhase_DisplayUnitMovement
PlayerPhase_DisplayUnitMovement: @ 0x0801D624
	push {lr}
	bl func_08032C88
	ldr r0, .L0801D644  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl ApplyWorkingMoveScriptToAction
	ldr r0, .L0801D648  @ gUnitMoveBuffer
	bl MU_StartMoveScript_Auto
	pop {r0}
	bx r0
	.align 2, 0
.L0801D644: .4byte gActiveUnit
.L0801D648: .4byte gUnitMoveBuffer

	THUMB_FUNC_END PlayerPhase_DisplayUnitMovement

	THUMB_FUNC_START PlayerPhase_WaitForUnitMovement
PlayerPhase_WaitForUnitMovement: @ 0x0801D64C
	push {r4, lr}
	adds r4, r0, #0
	bl MU_IsAnyActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801D660
	adds r0, r4, #0
	bl Proc_Break
.L0801D660:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PlayerPhase_WaitForUnitMovement

	THUMB_FUNC_START PlayerPhase_ResumeRangeDisplay
PlayerPhase_ResumeRangeDisplay: @ 0x0801D668
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, .L0801D684  @ gActiveUnit
	ldr r2, [r5]
	cmp r2, #0
	bne .L0801D688
	bl InitBmDisplay
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b .L0801D6F4
	.align 2, 0
.L0801D684: .4byte gActiveUnit
.L0801D688:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, .L0801D6E0  @ gMapUnit
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	bl InitBmDisplay
	ldr r2, [r5]
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
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl GetUnitSelectionValueThing
	cmp r0, #2
	beq .L0801D6E4
	cmp r0, #3
	beq .L0801D6EC
	b .L0801D6F4
	.align 2, 0
.L0801D6E0: .4byte gMapUnit
.L0801D6E4:
	ldr r0, [r5]
	bl HideUnitSprite
	b .L0801D6F4
.L0801D6EC:
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
.L0801D6F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END PlayerPhase_ResumeRangeDisplay

	THUMB_FUNC_START PlayerPhase_ReloadGameGfx
PlayerPhase_ReloadGameGfx: @ 0x0801D6FC
	push {lr}
	bl InitBmDisplay
	bl SetBlendNone
	pop {r0}
	bx r0

	THUMB_FUNC_END PlayerPhase_ReloadGameGfx

	THUMB_FUNC_START MakeMoveunitForActiveUnit
MakeMoveunitForActiveUnit: @ 0x0801D70C
	push {r4, lr}
	bl MU_Exists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801D74A
	ldr r4, .L0801D754  @ gActiveUnit
	ldr r2, [r4]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	ldr r1, .L0801D758  @ gPlaySt
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne .L0801D74A
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq .L0801D74A
	cmp r1, #4
	beq .L0801D74A
	adds r0, r2, #0
	bl MU_Create
	ldr r0, [r4]
	bl HideUnitSprite
.L0801D74A:
	bl MU_SetDefaultFacing_Auto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D754: .4byte gActiveUnit
.L0801D758: .4byte gPlaySt

	THUMB_FUNC_END MakeMoveunitForActiveUnit

	THUMB_FUNC_START ClearActiveUnit
ClearActiveUnit: @ 0x0801D75C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L0801D7D8  @ gUnknown_0859AAD8
	bl FindProc
	cmp r0, #0
	beq .L0801D7D2
	movs r1, #9
	bl Proc_Goto
	ldr r4, .L0801D7DC  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq .L0801D788
	bl MU_EndAll
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
.L0801D788:
	ldr r2, .L0801D7E0  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	adds r0, r5, #0
	bl UnitBeginAction
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r1, .L0801D7E4  @ gActiveUnitMoveOrigin
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	strh r0, [r1, #2]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl SetCursorMapPosition
	bl RefreshEntityMaps
	bl RefreshUnitSprites
.L0801D7D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D7D8: .4byte gUnknown_0859AAD8
.L0801D7DC: .4byte gActiveUnit
.L0801D7E0: .4byte gBmSt
.L0801D7E4: .4byte gActiveUnitMoveOrigin

	THUMB_FUNC_END ClearActiveUnit

	THUMB_FUNC_START ASMC_801D7E8
ASMC_801D7E8: @ 0x0801D7E8
	push {lr}
	ldr r0, .L0801D80C  @ gUnknown_0859AAD8
	bl FindProc
	adds r2, r0, #0
	cmp r2, #0
	beq .L0801D806
	ldr r1, [r2, #0xc]
	ldr r0, .L0801D810  @ PlayerPhase_RangeDisplayIdle
	cmp r1, r0
	bne .L0801D806
	ldr r1, .L0801D814  @ PlayerPhase_RangeDisplayIdle_ForceAPress
	adds r0, r2, #0
	bl Proc_SetRepeatFunc
.L0801D806:
	pop {r0}
	bx r0
	.align 2, 0
.L0801D80C: .4byte gUnknown_0859AAD8
.L0801D810: .4byte PlayerPhase_RangeDisplayIdle
.L0801D814: .4byte PlayerPhase_RangeDisplayIdle_ForceAPress

	THUMB_FUNC_END ASMC_801D7E8

	THUMB_FUNC_START PlayerPhase_RangeDisplayIdle_ForceAPress
PlayerPhase_RangeDisplayIdle_ForceAPress: @ 0x0801D818
	push {lr}
	ldr r1, .L0801D830  @ gKeySt
	ldr r2, [r1]
	movs r3, #0
	movs r1, #1
	strh r1, [r2, #8]
	strh r3, [r2, #6]
	bl PlayerPhase_RangeDisplayIdle
	pop {r0}
	bx r0
	.align 2, 0
.L0801D830: .4byte gKeySt

	THUMB_FUNC_END PlayerPhase_RangeDisplayIdle_ForceAPress

	THUMB_FUNC_START func_0801D834
func_0801D834: @ 0x0801D834
	push {r4, r5, lr}
	ldr r5, .L0801D890  @ gActiveUnit
	ldr r2, [r5]
	ldr r0, [r2]
	ldr r3, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L0801D888
	ldr r0, [r2, #0xc]
	ldr r1, .L0801D894  @ 0x00010044
	ands r0, r1
	cmp r0, #0
	bne .L0801D888
	ldr r4, .L0801D898  @ gAction
	ldrb r0, [r4, #0x11]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls .L0801D888
	movs r0, #0x1d
	ldrsb r0, [r2, r0]
	movs r1, #0x12
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	ldrb r4, [r4, #0x10]
	cmp r0, r4
	ble .L0801D888
	bl CanUnitMove
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801D888
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0, #0xc]
.L0801D888:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D890: .4byte gActiveUnit
.L0801D894: .4byte 0x00010044
.L0801D898: .4byte gAction

	THUMB_FUNC_END func_0801D834

	THUMB_FUNC_START MoveLimitViewChange_OnInit
MoveLimitViewChange_OnInit: @ 0x0801D89C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L0801D8C4  @ gUnknown_08A02EB4
	ldr r1, .L0801D8C8  @ 0x06005080
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterDataMove
	ldr r0, .L0801D8CC  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0801D8D0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #2
	strh r0, [r1]
	b .L0801D8E0
	.align 2, 0
.L0801D8C4: .4byte gUnknown_08A02EB4
.L0801D8C8: .4byte 0x06005080
.L0801D8CC: .4byte gBmSt
.L0801D8D0:
	ldr r1, .L0801D8E8  @ 0x06005000
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r4, #0
	bl Proc_End
.L0801D8E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D8E8: .4byte 0x06005000

	THUMB_FUNC_END MoveLimitViewChange_OnInit

	THUMB_FUNC_START MoveLimitViewChange_OnLoop
MoveLimitViewChange_OnLoop: @ 0x0801D8EC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L0801D924  @ gUnknown_0859AD08
	adds r4, r5, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, .L0801D928  @ 0x06005000
	movs r2, #0x80
	bl RegisterDataMove
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L0801D91C
	adds r0, r5, #0
	bl Proc_Break
.L0801D91C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D924: .4byte gUnknown_0859AD08
.L0801D928: .4byte 0x06005000

	THUMB_FUNC_END MoveLimitViewChange_OnLoop

	THUMB_FUNC_START MoveLimitView_OnInit
MoveLimitView_OnInit: @ 0x0801D92C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r2, .L0801D9D0  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r4, .L0801D9D4  @ gBmSt
	ldrb r1, [r4, #4]
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #4]
	bl RenderMap
	movs r5, #9
	adds r7, r4, #0
.L0801D958:
	movs r4, #0xe
	subs r6, r5, #1
.L0801D95C:
	movs r0, #0x24
	ldrsh r1, [r7, r0]
	adds r1, r1, r4
	movs r0, #0x26
	ldrsh r2, [r7, r0]
	adds r2, r2, r5
	str r5, [sp]
	ldr r0, .L0801D9D8  @ gBg2Tm
	adds r3, r4, #0
	bl PutLimitViewSquare
	subs r4, #1
	cmp r4, #0
	bge .L0801D95C
	adds r5, r6, #0
	cmp r5, #0
	bge .L0801D958
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	bl ResetHLayers
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0801D9D0: .4byte gDispIo
.L0801D9D4: .4byte gBmSt
.L0801D9D8: .4byte gBg2Tm

	THUMB_FUNC_END MoveLimitView_OnInit

	THUMB_FUNC_START MoveLimitView_OnLoop
MoveLimitView_OnLoop: @ 0x0801D9DC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGameTime
	lsrs r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	adds r4, #0x4a
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0801DA04
	lsls r0, r5, #1
	ldr r1, .L0801DA54  @ gUnknown_08A02F34
	adds r0, r0, r1
	movs r1, #0x82
	movs r2, #0x20
	bl ApplyPaletteExt
.L0801DA04:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0801DA1C
	lsls r0, r5, #1
	ldr r1, .L0801DA58  @ gUnknown_08A02F94
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
.L0801DA1C:
	ldrh r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L0801DA34
	lsls r0, r5, #1
	ldr r1, .L0801DA5C  @ gUnknown_08A02FF4
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
.L0801DA34:
	ldrh r1, [r4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0801DA4C
	lsls r0, r5, #1
	ldr r1, .L0801DA54  @ gUnknown_08A02F34
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
.L0801DA4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DA54: .4byte gUnknown_08A02F34
.L0801DA58: .4byte gUnknown_08A02F94
.L0801DA5C: .4byte gUnknown_08A02FF4

	THUMB_FUNC_END MoveLimitView_OnLoop

	THUMB_FUNC_START MoveLimitView_OnEnd
MoveLimitView_OnEnd: @ 0x0801DA60
	push {lr}
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq .L0801DA7C
	ldr r0, .L0801DA90  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
.L0801DA7C:
	ldr r2, .L0801DA94  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0xfc
	ands r0, r1
	strb r0, [r2, #4]
	bl ResetHLayers
	pop {r0}
	bx r0
	.align 2, 0
.L0801DA90: .4byte gBg2Tm
.L0801DA94: .4byte gBmSt

	THUMB_FUNC_END MoveLimitView_OnEnd

	THUMB_FUNC_START DisplayMoveRangeGraphics
DisplayMoveRangeGraphics: @ 0x0801DA98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0801DAB4  @ gUnknown_0859AD50
	adds r0, r4, #0
	bl FindProc
	cmp r0, #0
	beq .L0801DAB8
	bl MoveLimitView_OnInit
	movs r0, #0
	bl MoveLimitViewChange_OnInit
	b .L0801DAC4
	.align 2, 0
.L0801DAB4: .4byte gUnknown_0859AD50
.L0801DAB8:
	adds r0, r4, #0
	movs r1, #4
	bl SpawnProc
	adds r0, #0x4a
	strh r5, [r0]
.L0801DAC4:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END DisplayMoveRangeGraphics

	THUMB_FUNC_START HideMoveRangeGraphics
HideMoveRangeGraphics: @ 0x0801DACC
	push {lr}
	ldr r0, .L0801DAD8  @ gUnknown_0859AD50
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0801DAD8: .4byte gUnknown_0859AD50

	THUMB_FUNC_END HideMoveRangeGraphics

	THUMB_FUNC_START func_0801DADC
func_0801DADC: @ 0x0801DADC
	push {r4, lr}
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L0801DB0A
	ldr r0, [r4]
	cmp r0, #0
	beq .L0801DB0A
	ldr r0, [r4, #0xc]
	ldr r1, .L0801DB10  @ 0x00010007
	ands r0, r1
	cmp r0, #0
	bne .L0801DB0A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq .L0801DB0A
	cmp r1, #2
	bne .L0801DB14
.L0801DB0A:
	movs r0, #0
	b .L0801DB3E
	.align 2, 0
.L0801DB10: .4byte 0x00010007
.L0801DB14:
	ldr r0, .L0801DB44  @ gUnknown_0859AAD8
	bl FindProc
	cmp r0, #0
	bne .L0801DB24
	ldr r0, .L0801DB48  @ gUnknown_0859DBBC
	bl FindProc
.L0801DB24:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetCursorMapPosition
	movs r0, #1
.L0801DB3E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0801DB44: .4byte gUnknown_0859AAD8
.L0801DB48: .4byte gUnknown_0859DBBC

	THUMB_FUNC_END func_0801DADC

	THUMB_FUNC_START func_0801DB4C
func_0801DB4C: @ 0x0801DB4C
	push {r4, r5, lr}
	ldr r2, .L0801DBA0  @ gMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r5, [r1]
	movs r0, #0xc0
	ands r0, r5
	cmp r0, #0
	beq .L0801DB66
	movs r5, #0
.L0801DB66:
	adds r5, #1
	adds r4, r5, #0
	cmp r5, #0x3e
	bgt .L0801DB80
.L0801DB6E:
	adds r0, r4, #0
	bl func_0801DADC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801DB98
	adds r4, #1
	cmp r4, #0x3e
	ble .L0801DB6E
.L0801DB80:
	movs r4, #1
	cmp r4, r5
	bgt .L0801DB98
.L0801DB86:
	adds r0, r4, #0
	bl func_0801DADC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801DB98
	adds r4, #1
	cmp r4, r5
	ble .L0801DB86
.L0801DB98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DBA0: .4byte gMapUnit

	THUMB_FUNC_END func_0801DB4C

	THUMB_FUNC_START PlayerPhase_HandleAutoEnd
PlayerPhase_HandleAutoEnd: @ 0x0801DBA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0801DBD0  @ gPlaySt
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt .L0801DBC8
	ldrb r0, [r1, #0xf]
	bl GetPhaseAbleUnitCount
	cmp r0, #0
	bne .L0801DBC8
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
.L0801DBC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DBD0: .4byte gPlaySt

@ align with 0 (not nop)
	THUMB_FUNC_END PlayerPhase_HandleAutoEnd

.align 2, 0
