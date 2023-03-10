	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Staff/Item Effect Handlers and whatnot

	THUMB_FUNC_START ExecStandardHeal
ExecStandardHeal: @ 0x0802EB98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L0802EC14  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl GetUnitItemHealAmount
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r5, #0
	bl AddUnitHp
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, .L0802EC18  @ gBattleHitIterator
	ldr r2, [r1]
	ldr r5, .L0802EC1C  @ gBattleUnitB
	ldrb r1, [r5, #0x13]
	subs r1, r1, r0
	strb r1, [r2, #3]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802EC14: .4byte gAction
.L0802EC18: .4byte gBattleHitIterator
.L0802EC1C: .4byte gBattleUnitB

	THUMB_FUNC_END ExecStandardHeal

	THUMB_FUNC_START ExecRestore
ExecRestore: @ 0x0802EC20
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802EC84  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xb
	bne .L0802EC68
	ldrb r0, [r4, #0xd]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, .L0802EC88  @ 0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
.L0802EC68:
	ldrb r0, [r4, #0xd]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802EC84: .4byte gAction
.L0802EC88: .4byte 0xFFFFFBBD

	THUMB_FUNC_END ExecRestore

	THUMB_FUNC_START func_0802EC8C
func_0802EC8C: @ 0x0802EC8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802ECCC  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r0, #0x31
	ldrb r2, [r0]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802ECCC: .4byte gAction

	THUMB_FUNC_END func_0802EC8C

	THUMB_FUNC_START GetRescueStaffeePosition
GetRescueStaffeePosition: @ 0x0802ECD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	str r1, [sp]
	mov r9, r2
	mov sl, r3
	movs r0, #1
	negs r0, r0
	str r0, [r2]
	str r0, [r3]
	ldr r0, .L0802ED94  @ 0x0000270F
	str r0, [sp, #4]
	adds r0, r7, #0
	bl MapFloodUnitExtended
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, .L0802ED98  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, .L0802ED9C  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0802EDCC
.L0802ED1A:
	ldr r0, .L0802ED9C  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt .L0802EDC6
	lsls r6, r5, #2
.L0802ED2C:
	ldr r0, .L0802EDA0  @ gMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0802EDC0
	ldr r0, .L0802ED98  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0802EDC0
	ldr r0, .L0802EDA4  @ gMapHidden
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0802EDC0
	ldr r0, .L0802EDA8  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0802EDC0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge .L0802ED84
	subs r2, r0, r4
.L0802ED84:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r1, r5, r0
	cmp r1, #0
	blt .L0802EDAC
	adds r0, r2, r1
	b .L0802EDB0
	.align 2, 0
.L0802ED94: .4byte 0x0000270F
.L0802ED98: .4byte gMapUnit
.L0802ED9C: .4byte gMapSize
.L0802EDA0: .4byte gMapMovement
.L0802EDA4: .4byte gMapHidden
.L0802EDA8: .4byte gMapTerrain
.L0802EDAC:
	subs r0, r0, r5
	adds r0, r2, r0
.L0802EDB0:
	ldr r1, [sp, #4]
	cmp r1, r0
	blt .L0802EDC0
	str r0, [sp, #4]
	mov r0, r9
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
.L0802EDC0:
	subs r4, #1
	cmp r4, #0
	bge .L0802ED2C
.L0802EDC6:
	mov r5, r8
	cmp r5, #0
	bge .L0802ED1A
.L0802EDCC:
	mov r1, r9
	ldr r0, [r1]
	cmp r0, #0
	blt .L0802EDDC
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge .L0802EECA
.L0802EDDC:
	ldr r0, .L0802EEDC  @ 0x0000270F
	str r0, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	ldr r2, .L0802EEE0  @ gUnknown_0880BB96
	bl MapFloodExtended
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, .L0802EEE4  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, .L0802EEE8  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0802EEA6
.L0802EE12:
	ldr r0, .L0802EEE8  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt .L0802EEA0
	lsls r6, r5, #2
.L0802EE24:
	ldr r0, .L0802EEEC  @ gMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0802EE9A
	ldr r0, .L0802EEE4  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0802EE9A
	ldr r0, .L0802EEF0  @ gMapHidden
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0802EE9A
	ldr r0, .L0802EEF4  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0802EE9A
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge .L0802EE7C
	subs r2, r0, r4
.L0802EE7C:
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	subs r0, r5, r1
	cmp r0, #0
	bge .L0802EE88
	subs r0, r1, r5
.L0802EE88:
	adds r0, r2, r0
	ldr r1, [sp, #4]
	cmp r1, r0
	blt .L0802EE9A
	str r0, [sp, #4]
	mov r0, r9
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
.L0802EE9A:
	subs r4, #1
	cmp r4, #0
	bge .L0802EE24
.L0802EEA0:
	mov r5, r8
	cmp r5, #0
	bge .L0802EE12
.L0802EEA6:
	mov r1, r9
	ldr r0, [r1]
	cmp r0, #0
	blt .L0802EEB6
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge .L0802EECA
.L0802EEB6:
	ldr r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	mov r1, r9
	str r0, [r1]
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	mov r1, sl
	str r0, [r1]
.L0802EECA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802EEDC: .4byte 0x0000270F
.L0802EEE0: .4byte gUnknown_0880BB96
.L0802EEE4: .4byte gMapUnit
.L0802EEE8: .4byte gMapSize
.L0802EEEC: .4byte gMapMovement
.L0802EEF0: .4byte gMapHidden
.L0802EEF4: .4byte gMapTerrain

	THUMB_FUNC_END GetRescueStaffeePosition

	THUMB_FUNC_START ExecRescueStaff
ExecRescueStaff: @ 0x0802EEF8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, .L0802EF68  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	add r3, sp, #4
	adds r0, r5, #0
	mov r2, sp
	bl GetRescueStaffeePosition
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp, #4]
	strb r1, [r0, #0x11]
	ldr r0, .L0802EF6C  @ gBattleUnitB
	ldr r1, [sp]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldr r1, [sp, #4]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802EF68: .4byte gAction
.L0802EF6C: .4byte gBattleUnitB

	THUMB_FUNC_END ExecRescueStaff

	THUMB_FUNC_START func_0802EF70
func_0802EF70: @ 0x0802EF70
	push {lr}
	bl ExecTrapForActionTarget
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0802EF70

	THUMB_FUNC_START func_0802EF80
func_0802EF80: @ 0x0802EF80
	push {lr}
	ldr r0, .L0802EFA8  @ gAction
	ldrb r0, [r0, #0xd]
	bl GetUnit
	bl MU_GetByUnit
	bl MU_End
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	pop {r1}
	bx r1
	.align 2, 0
.L0802EFA8: .4byte gAction

	THUMB_FUNC_END func_0802EF80

	THUMB_FUNC_START ExecWarpStaff
ExecWarpStaff: @ 0x0802EFAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802F004  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x14]
	strb r1, [r0, #0x11]
	ldr r0, .L0802F008  @ gBattleUnitB
	ldrb r1, [r4, #0x13]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldrb r1, [r4, #0x14]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	ldr r0, .L0802F00C  @ gUnknown_0859BDF0
	adds r1, r5, #0
	bl SpawnProcLocking
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F004: .4byte gAction
.L0802F008: .4byte gBattleUnitB
.L0802F00C: .4byte gUnknown_0859BDF0

	THUMB_FUNC_END ExecWarpStaff

	THUMB_FUNC_START ExecStatusStaff
ExecStatusStaff: @ 0x0802F010
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L0802F06C  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	ldr r4, .L0802F070  @ gBattleUnitA
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	bl RandRoll
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0802F07C
	ldr r0, .L0802F074  @ gBattleHitIterator
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #2
	orrs r1, r0
	ldr r0, .L0802F078  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	b .L0802F144
	.align 2, 0
.L0802F06C: .4byte gAction
.L0802F070: .4byte gBattleUnitA
.L0802F074: .4byte gBattleHitIterator
.L0802F078: .4byte 0xFFF80000
.L0802F07C:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x52
	beq .L0802F0BC
	cmp r0, #0x52
	bgt .L0802F094
	cmp r0, #0x51
	beq .L0802F0AC
	b .L0802F144
.L0802F094:
	cmp r0, #0x53
	beq .L0802F09E
	cmp r0, #0xb5
	beq .L0802F0CC
	b .L0802F144
.L0802F09E:
	ldr r0, .L0802F0A8  @ gBattleUnitB
	adds r0, #0x6f
	movs r1, #4
	strb r1, [r0]
	b .L0802F144
	.align 2, 0
.L0802F0A8: .4byte gBattleUnitB
.L0802F0AC:
	ldr r0, .L0802F0B8  @ gBattleUnitB
	adds r0, #0x6f
	movs r1, #3
	strb r1, [r0]
	b .L0802F144
	.align 2, 0
.L0802F0B8: .4byte gBattleUnitB
.L0802F0BC:
	ldr r0, .L0802F0C8  @ gBattleUnitB
	adds r0, #0x6f
	movs r1, #2
	strb r1, [r0]
	b .L0802F144
	.align 2, 0
.L0802F0C8: .4byte gBattleUnitB
.L0802F0CC:
	ldr r0, .L0802F0E0  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq .L0802F120
	cmp r0, #0x40
	bgt .L0802F0E4
	cmp r0, #0
	beq .L0802F0EA
	b .L0802F144
	.align 2, 0
.L0802F0E0: .4byte gPlaySt
.L0802F0E4:
	cmp r0, #0x80
	beq .L0802F104
	b .L0802F144
.L0802F0EA:
	ldr r2, .L0802F100  @ gBattleUnitB
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L0802F13C
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b .L0802F142
	.align 2, 0
.L0802F100: .4byte gBattleUnitB
.L0802F104:
	ldr r2, .L0802F11C  @ gBattleUnitB
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne .L0802F13C
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b .L0802F142
	.align 2, 0
.L0802F11C: .4byte gBattleUnitB
.L0802F120:
	ldr r2, .L0802F138  @ gBattleUnitB
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne .L0802F13C
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b .L0802F142
	.align 2, 0
.L0802F138: .4byte gBattleUnitB
.L0802F13C:
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xb
.L0802F142:
	strb r0, [r1]
.L0802F144:
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ExecStatusStaff

	THUMB_FUNC_START ExecFortify
ExecFortify: @ 0x0802F154
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, .L0802F1D4  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	bl GetPlayerLeaderPid
	bl GetUnitByPid
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl MakeTargetListForRangedHeal
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl GetUnitItemHealAmount
	adds r6, r0, #0
	bl GetTargetListSize
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge .L0802F1C4
.L0802F1A8:
	adds r0, r4, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r1, r6, #0
	bl AddUnitHp
	adds r4, #1
	cmp r4, r5
	blt .L0802F1A8
.L0802F1C4:
	adds r0, r7, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F1D4: .4byte gAction

	THUMB_FUNC_END ExecFortify

	THUMB_FUNC_START func_0802F1D8
func_0802F1D8: @ 0x0802F1D8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802F204  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F204: .4byte gAction

	THUMB_FUNC_END func_0802F1D8

	THUMB_FUNC_START func_0802F208
func_0802F208: @ 0x0802F208
	push {r4, r5, r6, lr}
	ldr r0, .L0802F270  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl MakeTargetListForFuckingNightmare
	bl GetTargetListSize
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge .L0802F26A
.L0802F222:
	adds r0, r5, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, .L0802F270  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl GetOffensiveStaffAccuracy
	bl RandRoll
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0802F264
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L0802F264
	adds r0, r4, #0
	movs r1, #2
	bl SetUnitStatus
.L0802F264:
	adds r5, #1
	cmp r5, r6
	blt .L0802F222
.L0802F26A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F270: .4byte gAction

	THUMB_FUNC_END func_0802F208

	THUMB_FUNC_START ExecUnlock
ExecUnlock: @ 0x0802F274
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802F2AC  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldr r0, .L0802F2B0  @ gBattleUnitB
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r2, [r4, #0x14]
	strb r2, [r0, #0x11]
	adds r3, r0, #0
	adds r3, #0x73
	strb r1, [r3]
	adds r0, #0x74
	strb r2, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F2AC: .4byte gAction
.L0802F2B0: .4byte gBattleUnitB

	THUMB_FUNC_END ExecUnlock

	THUMB_FUNC_START ExecHammerne
ExecHammerne: @ 0x0802F2B4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L0802F308  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x15]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl CreateItem
	ldrb r1, [r4, #0x15]
	lsls r1, r1, #1
	adds r5, #0x1e
	adds r5, r5, r1
	strh r0, [r5]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F308: .4byte gAction

	THUMB_FUNC_END ExecHammerne

	THUMB_FUNC_START ExecLatona
ExecLatona: @ 0x0802F30C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, .L0802F37C  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	bl GetPlayerLeaderPid
	bl GetUnitByPid
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl MakeTargetListForLatona
	bl GetTargetListSize
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge .L0802F36C
.L0802F340:
	adds r0, r5, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r5, #1
	cmp r5, r6
	blt .L0802F340
.L0802F36C:
	adds r0, r7, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F37C: .4byte gAction

	THUMB_FUNC_END ExecLatona

	THUMB_FUNC_START ExecSomeSelfHeal
ExecSomeSelfHeal: @ 0x0802F380
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, .L0802F3D8  @ gAction
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldrb r1, [r5, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl AddUnitHp
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, .L0802F3DC  @ gBattleHitIterator
	ldr r2, [r1]
	ldr r4, .L0802F3E0  @ gBattleUnitA
	ldrb r1, [r4, #0x13]
	subs r1, r1, r0
	strb r1, [r2, #3]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r4, #0x13]
	adds r4, #0x4a
	movs r0, #0x6c
	strh r0, [r4]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F3D8: .4byte gAction
.L0802F3DC: .4byte gBattleHitIterator
.L0802F3E0: .4byte gBattleUnitA

	THUMB_FUNC_END ExecSomeSelfHeal

	THUMB_FUNC_START func_0802F3E4
func_0802F3E4: @ 0x0802F3E4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L0802F444  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl SetUnitHp
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	ldr r1, .L0802F448  @ gBattleHitIterator
	ldr r2, [r1]
	ldr r5, .L0802F44C  @ gBattleUnitA
	ldrb r1, [r5, #0x13]
	subs r1, r1, r0
	strb r1, [r2, #3]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F444: .4byte gAction
.L0802F448: .4byte gBattleHitIterator
.L0802F44C: .4byte gBattleUnitA

	THUMB_FUNC_END func_0802F3E4

	THUMB_FUNC_START func_0802F450
func_0802F450: @ 0x0802F450
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802F488  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x31
	ldrb r2, [r0]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F488: .4byte gAction

	THUMB_FUNC_END func_0802F450

	THUMB_FUNC_START func_0802F48C
func_0802F48C: @ 0x0802F48C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802F4CC  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r0, #0x31
	ldrb r2, [r0]
	movs r1, #0x10
	negs r1, r1
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0xf]
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F4CC: .4byte gAction

	THUMB_FUNC_END func_0802F48C

	THUMB_FUNC_START func_0802F4D0
func_0802F4D0: @ 0x0802F4D0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802F508  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldr r0, .L0802F50C  @ gBattleUnitA
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F508: .4byte gAction
.L0802F50C: .4byte gBattleUnitA

	THUMB_FUNC_END func_0802F4D0

	THUMB_FUNC_START func_0802F510
func_0802F510: @ 0x0802F510
	push {r4, r5, lr}
	ldr r4, .L0802F58C  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl UnitUpdateUsedItem
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	subs r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl func_0808320C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl func_0808320C
	subs r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl func_0808320C
	adds r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl func_0808320C
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_080831C8
	ldr r0, .L0802F590  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0802F57E
	movs r0, #0xb1
	bl m4aSongNumStart
.L0802F57E:
	ldr r0, .L0802F594  @ gBattleUnitB
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F58C: .4byte gAction
.L0802F590: .4byte gPlaySt
.L0802F594: .4byte gBattleUnitB

	THUMB_FUNC_END func_0802F510

	THUMB_FUNC_START func_0802F598
func_0802F598: @ 0x0802F598
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r0, #1
	negs r0, r0
	mov r9, r0
	cmp r7, r9
	beq .L0802F5CA
	ldr r3, .L0802F650  @ gBattleUnitA
	ldr r1, .L0802F654  @ gBattleUnitB
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
.L0802F5CA:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, .L0802F650  @ gBattleUnitA
	ldr r5, .L0802F654  @ gBattleUnitB
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r6, #0
	bl ApplyUnitDefaultPromotion
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeBattleUnitPromoteGains
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, r8
	cmp r0, #0
	beq .L0802F618
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
.L0802F618:
	cmp r7, r9
	beq .L0802F624
	adds r0, r6, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
.L0802F624:
	ldr r2, .L0802F658  @ gBattleHitArray
	ldr r0, [r2]
	ldr r1, .L0802F65C  @ 0xFFF80000
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	movs r0, #0
	strb r0, [r2, #3]
	ldr r1, .L0802F660  @ gBattleStats
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F650: .4byte gBattleUnitA
.L0802F654: .4byte gBattleUnitB
.L0802F658: .4byte gBattleHitArray
.L0802F65C: .4byte 0xFFF80000
.L0802F660: .4byte gBattleStats

	THUMB_FUNC_END func_0802F598

	THUMB_FUNC_START UnitPromote
UnitPromote: @ 0x0802F664
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r9, r3
	movs r0, #1
	negs r0, r0
	mov sl, r0
	cmp r7, sl
	beq .L0802F69E
	ldr r3, .L0802F728  @ gBattleUnitA
	ldr r1, .L0802F72C  @ gBattleUnitB
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
.L0802F69E:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, .L0802F728  @ gBattleUnitA
	ldr r5, .L0802F72C  @ gBattleUnitB
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r6, #0
	mov r1, r8
	bl ApplyUnitPromotion
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeBattleUnitPromoteGains
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, r9
	cmp r0, #0
	beq .L0802F6EE
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
.L0802F6EE:
	cmp r7, sl
	beq .L0802F6FA
	adds r0, r6, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
.L0802F6FA:
	ldr r2, .L0802F730  @ gBattleHitArray
	ldr r0, [r2]
	ldr r1, .L0802F734  @ 0xFFF80000
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	movs r0, #0
	strb r0, [r2, #3]
	ldr r1, .L0802F738  @ gBattleStats
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F728: .4byte gBattleUnitA
.L0802F72C: .4byte gBattleUnitB
.L0802F730: .4byte gBattleHitArray
.L0802F734: .4byte 0xFFF80000
.L0802F738: .4byte gBattleStats

	THUMB_FUNC_END UnitPromote

	THUMB_FUNC_START func_0802F73C
func_0802F73C: @ 0x0802F73C
	push {r4, lr}
	ldr r4, .L0802F75C  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	movs r1, #1
	movs r3, #1
	bl UnitPromote
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F75C: .4byte gAction

	THUMB_FUNC_END func_0802F73C

	THUMB_FUNC_START func_0802F760
func_0802F760: @ 0x0802F760
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r4, .L0802F7F0  @ gBattleUnitA
	ldr r5, .L0802F7F4  @ gBattleUnitB
	adds r0, r5, #0
	adds r0, #0x4a
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	ldr r2, .L0802F7F8  @ 0x0000FFFF
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r0, r4, #0
	adds r0, #0x4a
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnit
	adds r0, r6, #0
	bl ApplyUnitDefaultPromotion
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnit
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeBattleUnitPromoteGains
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	ldr r2, .L0802F7FC  @ gBattleHitArray
	ldr r0, [r2]
	ldr r1, .L0802F800  @ 0xFFF80000
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	mov r0, r8
	strb r0, [r2, #3]
	ldr r1, .L0802F804  @ gBattleStats
	movs r0, #0x10
	strh r0, [r1]
	bl BeginBattleAnimations
	ldr r0, [r6, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r6, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F7F0: .4byte gBattleUnitA
.L0802F7F4: .4byte gBattleUnitB
.L0802F7F8: .4byte 0x0000FFFF
.L0802F7FC: .4byte gBattleHitArray
.L0802F800: .4byte 0xFFF80000
.L0802F804: .4byte gBattleStats

	THUMB_FUNC_END func_0802F760

	THUMB_FUNC_START ApplyStatBoosterAndGetMessageId
ApplyStatBoosterAndGetMessageId: @ 0x0802F808
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r5, #0
	lsls r0, r7, #1
	adds r1, r4, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl GetItemIid
	cmp r0, #0x89
	bne .L0802F83A
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
	movs r0, #0x1d
	b .L0802F90E
.L0802F83A:
	adds r0, r6, #0
	bl GetItemBonuses
	ldrb r1, [r0]
	ldrb r2, [r4, #0x12]
	adds r1, r1, r2
	strb r1, [r4, #0x12]
	ldrb r1, [r0]
	ldrb r2, [r4, #0x13]
	adds r1, r1, r2
	strb r1, [r4, #0x13]
	ldrb r1, [r0, #1]
	ldrb r2, [r4, #0x14]
	adds r1, r1, r2
	strb r1, [r4, #0x14]
	ldrb r1, [r0, #2]
	ldrb r2, [r4, #0x15]
	adds r1, r1, r2
	strb r1, [r4, #0x15]
	ldrb r1, [r0, #3]
	ldrb r2, [r4, #0x16]
	adds r1, r1, r2
	strb r1, [r4, #0x16]
	ldrb r1, [r0, #4]
	ldrb r2, [r4, #0x17]
	adds r1, r1, r2
	strb r1, [r4, #0x17]
	ldrb r1, [r0, #5]
	ldrb r2, [r4, #0x18]
	adds r1, r1, r2
	strb r1, [r4, #0x18]
	ldrb r1, [r0, #6]
	ldrb r2, [r4, #0x19]
	adds r1, r1, r2
	strb r1, [r4, #0x19]
	ldrb r1, [r0, #7]
	ldrb r2, [r4, #0x1d]
	adds r1, r1, r2
	strb r1, [r4, #0x1d]
	ldrb r0, [r0, #8]
	ldrb r1, [r4, #0x1a]
	adds r0, r0, r1
	strb r0, [r4, #0x1a]
	adds r0, r4, #0
	bl UnitCheckStatOverflow
	adds r0, r4, #0
	adds r1, r7, #0
	bl UnitUpdateUsedItem
	adds r0, r6, #0
	bl GetItemIid
	subs r0, #0x5b
	cmp r0, #8
	bhi .L0802F90C
	lsls r0, r0, #2
	ldr r1, .L0802F8B4  @ .L0802F8B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0802F8B4: .4byte .L0802F8B8
.L0802F8B8: @ jump table
	.4byte .L0802F8E4 @ case 0
	.4byte .L0802F8FC @ case 1
	.4byte .L0802F8DC @ case 2
	.4byte .L0802F8EC @ case 3
	.4byte .L0802F8E0 @ case 4
	.4byte .L0802F8E8 @ case 5
	.4byte .L0802F8F0 @ case 6
	.4byte .L0802F8F4 @ case 7
	.4byte .L0802F8F8 @ case 8
.L0802F8DC:
	movs r5, #0x15
	b .L0802F90C
.L0802F8E0:
	movs r5, #0x17
	b .L0802F90C
.L0802F8E4:
	movs r5, #0x1c
	b .L0802F90C
.L0802F8E8:
	movs r5, #0x18
	b .L0802F90C
.L0802F8EC:
	movs r5, #0x16
	b .L0802F90C
.L0802F8F0:
	movs r5, #0x19
	b .L0802F90C
.L0802F8F4:
	movs r5, #0x1a
	b .L0802F90C
.L0802F8F8:
	movs r5, #0x1b
	b .L0802F90C
.L0802F8FC:
	adds r0, r4, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	movs r5, #0x13
	cmp r0, #0
	beq .L0802F90C
	movs r5, #0x14
.L0802F90C:
	adds r0, r5, #0
.L0802F90E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END ApplyStatBoosterAndGetMessageId

	THUMB_FUNC_START ExecStatBooster
ExecStatBooster: @ 0x0802F914
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, .L0802F96C  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r1, .L0802F970  @ gBattleUnitB
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl ApplyStatBoosterAndGetMessageId
	adds r5, r0, #0
	ldr r0, .L0802F974  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0802F94E
	movs r0, #0x5a
	bl m4aSongNumStart
.L0802F94E:
	adds r0, r6, #0
	bl GetItemIcon
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl func_0801F9FC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802F96C: .4byte gAction
.L0802F970: .4byte gBattleUnitB
.L0802F974: .4byte gPlaySt

	THUMB_FUNC_END ExecStatBooster

	THUMB_FUNC_START func_0802F978
func_0802F978: @ 0x0802F978
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #0
	movs r4, #0
	ldr r2, .L0802F9DC  @ gUnknown_080D7C44
.L0802F984:
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r4, #1
	cmp r4, #4
	bls .L0802F984
	adds r0, r1, #0
	bl RandNext
	adds r2, r0, #0
	movs r4, #0
	ldr r0, .L0802F9DC  @ gUnknown_080D7C44
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, r2
	bgt .L0802F9BE
	adds r3, r0, #0
.L0802F9AA:
	adds r4, #1
	cmp r4, #4
	bhi .L0802F9BE
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r1, r2
	ble .L0802F9AA
.L0802F9BE:
	adds r4, #1
	ldrb r0, [r5, #8]
	subs r0, r0, r4
	movs r1, #0
	strb r0, [r5, #8]
	strb r1, [r5, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	bl UnitUpdateUsedItem
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0802F9DC: .4byte gUnknown_080D7C44

	THUMB_FUNC_END func_0802F978

	THUMB_FUNC_START func_0802F9E0
func_0802F9E0: @ 0x0802F9E0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, .L0802FA40  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r1, .L0802FA44  @ gBattleUnitB
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl func_0802F978
	adds r5, r0, #0
	ldr r0, .L0802FA48  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0802FA1C
	movs r0, #0x5a
	bl m4aSongNumStart
.L0802FA1C:
	adds r0, r6, #0
	bl GetItemIcon
	adds r4, r0, #0
	movs r0, #0x1e
	bl GetMsg
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl func_0801FA8C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802FA40: .4byte gAction
.L0802FA44: .4byte gBattleUnitB
.L0802FA48: .4byte gPlaySt

	THUMB_FUNC_END func_0802F9E0

	THUMB_FUNC_START ExecItemMine
ExecItemMine: @ 0x0802FA4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802FA88  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xb
	movs r3, #0
	bl AddTrap
	adds r0, r5, #0
	bl BattleApplyItemEffect
	ldr r0, .L0802FA8C  @ gBattleUnitB
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl BeginMineMapAnim
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802FA88: .4byte gAction
.L0802FA8C: .4byte gBattleUnitB

	THUMB_FUNC_END ExecItemMine

	THUMB_FUNC_START func_0802FA90
func_0802FA90: @ 0x0802FA90
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802FAC8  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	bl AddLightRune
	adds r0, r5, #0
	bl BattleApplyItemEffect
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl BeginLightRuneMapAnim
	ldr r0, .L0802FACC  @ gBattleUnitB
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802FAC8: .4byte gAction
.L0802FACC: .4byte gBattleUnitB

	THUMB_FUNC_END func_0802FA90

	THUMB_FUNC_START func_0802FAD0
func_0802FAD0: @ 0x0802FAD0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L0802FB78  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	adds r0, r6, #0
	bl BattleApplyItemEffect
	ldrb r5, [r4, #0x13]
	ldrb r4, [r4, #0x14]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl func_08021818
	movs r2, #0
	ldr r6, .L0802FB7C  @ gUnknown_03001788
	movs r0, #0x80
	strb r0, [r6]
	movs r0, #0x43
	strb r0, [r6, #1]
	movs r0, #1
	strb r0, [r6, #2]
	movs r0, #8
	strb r0, [r6, #3]
	movs r0, #0x3f
	ands r5, r0
	ldrb r1, [r6, #4]
	movs r0, #0x40
	negs r0, r0
	ands r0, r1
	orrs r0, r5
	strb r0, [r6, #4]
	movs r0, #0x3f
	ands r4, r0
	lsls r4, r4, #6
	ldrh r1, [r6, #4]
	ldr r0, .L0802FB80  @ 0xFFFFF03F
	ands r0, r1
	orrs r0, r4
	strh r0, [r6, #4]
	strb r2, [r6, #7]
	str r2, [r6, #8]
	ldrb r1, [r6, #5]
	movs r0, #0x11
	negs r0, r0
	ands r0, r1
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r6, #5]
	movs r0, #0x20
	strb r0, [r6, #0xc]
	movs r0, #0x21
	strb r0, [r6, #0xd]
	movs r0, #0x27
	strb r0, [r6, #0xe]
	movs r0, #0x29
	strb r0, [r6, #0xf]
	strb r2, [r6, #0x10]
	strb r2, [r6, #0x11]
	strb r2, [r6, #0x12]
	strb r2, [r6, #0x13]
	movs r0, #1
	bl GetUnitByPid
	adds r2, r0, #0
	cmp r2, #0
	bne .L0802FB68
	adds r0, r6, #0
	bl BatchCreateUnits
.L0802FB68:
	ldr r0, .L0802FB84  @ gBattleUnitB
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802FB78: .4byte gAction
.L0802FB7C: .4byte gUnknown_03001788
.L0802FB80: .4byte 0xFFFFF03F
.L0802FB84: .4byte gBattleUnitB

	THUMB_FUNC_END func_0802FAD0

	THUMB_FUNC_START ExecTorchStaff
ExecTorchStaff: @ 0x0802FB88
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0802FBB8  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xa
	movs r3, #8
	bl AddTrap
	adds r0, r5, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802FBB8: .4byte gAction

	THUMB_FUNC_END ExecTorchStaff

	THUMB_FUNC_START func_0802FBBC
func_0802FBBC: @ 0x0802FBBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, .L0802FBFC  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x7e
	beq .L0802FC0E
	cmp r0, #0x7e
	bgt .L0802FC00
	cmp r0, #0x7d
	beq .L0802FC0A
	b .L0802FC18
	.align 2, 0
.L0802FBFC: .4byte gAction
.L0802FC00:
	cmp r0, #0x7f
	beq .L0802FC12
	cmp r0, #0x80
	beq .L0802FC16
	b .L0802FC18
.L0802FC0A:
	movs r5, #5
	b .L0802FC18
.L0802FC0E:
	movs r5, #6
	b .L0802FC18
.L0802FC12:
	movs r5, #7
	b .L0802FC18
.L0802FC16:
	movs r5, #8
.L0802FC18:
	ldr r0, .L0802FC40  @ gAction
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	movs r2, #1
	bl SetUnitStatusExt
	ldr r1, .L0802FC44  @ gBattleStats
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r6, #0
	bl BattleApplyItemEffect
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802FC40: .4byte gAction
.L0802FC44: .4byte gBattleStats

	THUMB_FUNC_END func_0802FBBC

	THUMB_FUNC_START ActionStaffDoorChestUseItem
ActionStaffDoorChestUseItem: @ 0x0802FC48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, .L0802FC84  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIid
	mov r8, r0
	ldr r0, .L0802FC88  @ gBattleUnitA
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	mov r0, r8
	subs r0, #0x4b
	cmp r0, #0x76
	bls .L0802FC7A
	b .L0802FF76
.L0802FC7A:
	lsls r0, r0, #2
	ldr r1, .L0802FC8C  @ .L0802FC90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0802FC84: .4byte gAction
.L0802FC88: .4byte gBattleUnitA
.L0802FC8C: .4byte .L0802FC90
.L0802FC90: @ jump table
	.4byte .L0802FE6C @ case 0
	.4byte .L0802FE6C @ case 1
	.4byte .L0802FE6C @ case 2
	.4byte .L0802FE6C @ case 3
	.4byte .L0802FE84 @ case 4
	.4byte .L0802FE8C @ case 5
	.4byte .L0802FE74 @ case 6
	.4byte .L0802FE74 @ case 7
	.4byte .L0802FE74 @ case 8
	.4byte .L0802FEA4 @ case 9
	.4byte .L0802FE94 @ case 10
	.4byte .L0802FF60 @ case 11
	.4byte .L0802FEB4 @ case 12
	.4byte .L0802FEAC @ case 13
	.4byte .L0802FE9C @ case 14
	.4byte .L0802FF76 @ case 15
	.4byte .L0802FF40 @ case 16
	.4byte .L0802FF40 @ case 17
	.4byte .L0802FF40 @ case 18
	.4byte .L0802FF40 @ case 19
	.4byte .L0802FF40 @ case 20
	.4byte .L0802FF40 @ case 21
	.4byte .L0802FF40 @ case 22
	.4byte .L0802FF40 @ case 23
	.4byte .L0802FF40 @ case 24
	.4byte .L0802FEEC @ case 25
	.4byte .L0802FEEC @ case 26
	.4byte .L0802FEEC @ case 27
	.4byte .L0802FEEC @ case 28
	.4byte .L0802FEEC @ case 29
	.4byte .L0802FEE6 @ case 30
	.4byte .L0802FEE6 @ case 31
	.4byte .L0802FEE6 @ case 32
	.4byte .L0802FEC4 @ case 33
	.4byte .L0802FECE @ case 34
	.4byte .L0802FED6 @ case 35
	.4byte .L0802FEDE @ case 36
	.4byte .L0802FEBC @ case 37
	.4byte .L0802FF76 @ case 38
	.4byte .L0802FF76 @ case 39
	.4byte .L0802FF76 @ case 40
	.4byte .L0802FF76 @ case 41
	.4byte .L0802FF76 @ case 42
	.4byte .L0802FF76 @ case 43
	.4byte .L0802FF76 @ case 44
	.4byte .L0802FF76 @ case 45
	.4byte .L0802FEE6 @ case 46
	.4byte .L0802FF50 @ case 47
	.4byte .L0802FF58 @ case 48
	.4byte .L0802FF76 @ case 49
	.4byte .L0802FF68 @ case 50
	.4byte .L0802FF68 @ case 51
	.4byte .L0802FF68 @ case 52
	.4byte .L0802FF68 @ case 53
	.4byte .L0802FF76 @ case 54
	.4byte .L0802FF76 @ case 55
	.4byte .L0802FF76 @ case 56
	.4byte .L0802FF76 @ case 57
	.4byte .L0802FF76 @ case 58
	.4byte .L0802FF76 @ case 59
	.4byte .L0802FF76 @ case 60
	.4byte .L0802FEEC @ case 61
	.4byte .L0802FF40 @ case 62
	.4byte .L0802FEEC @ case 63
	.4byte .L0802FF76 @ case 64
	.4byte .L0802FF48 @ case 65
	.4byte .L0802FF76 @ case 66
	.4byte .L0802FF76 @ case 67
	.4byte .L0802FF76 @ case 68
	.4byte .L0802FF76 @ case 69
	.4byte .L0802FF76 @ case 70
	.4byte .L0802FF76 @ case 71
	.4byte .L0802FF76 @ case 72
	.4byte .L0802FF76 @ case 73
	.4byte .L0802FF76 @ case 74
	.4byte .L0802FF76 @ case 75
	.4byte .L0802FEEC @ case 76
	.4byte .L0802FEEC @ case 77
	.4byte .L0802FEEC @ case 78
	.4byte .L0802FF76 @ case 79
	.4byte .L0802FF76 @ case 80
	.4byte .L0802FF76 @ case 81
	.4byte .L0802FF76 @ case 82
	.4byte .L0802FF76 @ case 83
	.4byte .L0802FF76 @ case 84
	.4byte .L0802FF76 @ case 85
	.4byte .L0802FF76 @ case 86
	.4byte .L0802FEC4 @ case 87
	.4byte .L0802FF76 @ case 88
	.4byte .L0802FF76 @ case 89
	.4byte .L0802FF76 @ case 90
	.4byte .L0802FE7C @ case 91
	.4byte .L0802FF76 @ case 92
	.4byte .L0802FF76 @ case 93
	.4byte .L0802FF76 @ case 94
	.4byte .L0802FF76 @ case 95
	.4byte .L0802FF76 @ case 96
	.4byte .L0802FF76 @ case 97
	.4byte .L0802FF76 @ case 98
	.4byte .L0802FF76 @ case 99
	.4byte .L0802FF76 @ case 100
	.4byte .L0802FF76 @ case 101
	.4byte .L0802FF76 @ case 102
	.4byte .L0802FF76 @ case 103
	.4byte .L0802FF76 @ case 104
	.4byte .L0802FF76 @ case 105
	.4byte .L0802FF76 @ case 106
	.4byte .L0802FF76 @ case 107
	.4byte .L0802FF70 @ case 108
	.4byte .L0802FF76 @ case 109
	.4byte .L0802FF76 @ case 110
	.4byte .L0802FF76 @ case 111
	.4byte .L0802FF76 @ case 112
	.4byte .L0802FF76 @ case 113
	.4byte .L0802FF76 @ case 114
	.4byte .L0802FF76 @ case 115
	.4byte .L0802FF76 @ case 116
	.4byte .L0802FF76 @ case 117
	.4byte .L0802FEEC @ case 118
.L0802FE6C:
	adds r0, r6, #0
	bl ExecStandardHeal
	b .L0802FF76
.L0802FE74:
	adds r0, r6, #0
	bl ExecStatusStaff
	b .L0802FF76
.L0802FE7C:
	adds r0, r6, #0
	bl func_0802F1D8
	b .L0802FF76
.L0802FE84:
	adds r0, r6, #0
	bl ExecFortify
	b .L0802FF76
.L0802FE8C:
	adds r0, r6, #0
	bl ExecRestore
	b .L0802FF76
.L0802FE94:
	adds r0, r6, #0
	bl ExecRescueStaff
	b .L0802FF76
.L0802FE9C:
	adds r0, r6, #0
	bl func_0802EC8C
	b .L0802FF76
.L0802FEA4:
	adds r0, r6, #0
	bl ExecWarpStaff
	b .L0802FF76
.L0802FEAC:
	adds r0, r6, #0
	bl ExecUnlock
	b .L0802FF76
.L0802FEB4:
	adds r0, r6, #0
	bl ExecHammerne
	b .L0802FF76
.L0802FEBC:
	adds r0, r6, #0
	bl func_0802F48C
	b .L0802FF76
.L0802FEC4:
	adds r0, r6, #0
	movs r1, #0xa
	bl ExecSomeSelfHeal
	b .L0802FF76
.L0802FECE:
	adds r0, r6, #0
	bl func_0802F3E4
	b .L0802FF76
.L0802FED6:
	adds r0, r6, #0
	bl func_0802F450
	b .L0802FF76
.L0802FEDE:
	adds r0, r6, #0
	bl func_0802F4D0
	b .L0802FF76
.L0802FEE6:
	bl func_0802F510
	b .L0802FF76
.L0802FEEC:
	ldr r4, .L0802FF34  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r5, .L0802FF38  @ gBattleUnitA
	ldr r7, .L0802FF3C  @ gBattleUnitB
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r2, r7, #0
	adds r2, #0x4a
	strh r1, [r2]
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitEquippedWeapon
	adds r1, r7, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r5, #0x48
	strh r0, [r5]
	adds r1, #0x27
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl StartMapPromotion
	b .L0802FF76
	.align 2, 0
.L0802FF34: .4byte gAction
.L0802FF38: .4byte gBattleUnitA
.L0802FF3C: .4byte gBattleUnitB
.L0802FF40:
	adds r0, r6, #0
	bl ExecStatBooster
	b .L0802FF76
.L0802FF48:
	adds r0, r6, #0
	bl ExecLatona
	b .L0802FF76
.L0802FF50:
	adds r0, r6, #0
	bl ExecItemMine
	b .L0802FF76
.L0802FF58:
	adds r0, r6, #0
	bl func_0802FA90
	b .L0802FF76
.L0802FF60:
	adds r0, r6, #0
	bl ExecTorchStaff
	b .L0802FF76
.L0802FF68:
	adds r0, r6, #0
	bl func_0802FBBC
	b .L0802FF76
.L0802FF70:
	adds r0, r6, #0
	bl func_0802F9E0
.L0802FF76:
	mov r0, r8
	cmp r0, #0xa6
	bne .L0802FF8C
	ldr r0, .L0802FF88  @ gUnknown_0859BE28
	adds r1, r6, #0
	bl SpawnProcLocking
	b .L0802FFA2
	.align 2, 0
.L0802FF88: .4byte gUnknown_0859BE28
.L0802FF8C:
	ldr r0, .L0802FFAC  @ gBattleUnitB
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt .L0802FFA2
	ldr r0, .L0802FFB0  @ gUnknown_0859BE10
	adds r1, r6, #0
	bl SpawnProcLocking
.L0802FFA2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802FFAC: .4byte gBattleUnitB
.L0802FFB0: .4byte gUnknown_0859BE10

	THUMB_FUNC_END ActionStaffDoorChestUseItem

	THUMB_FUNC_START ActionPick
ActionPick: @ 0x0802FFB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L08030008  @ gBattleUnitA
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	ldr r0, .L0803000C  @ gAction
	movs r4, #0x13
	ldrsb r4, [r0, r4]
	movs r5, #0x14
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0808320C
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080831C8
	ldr r0, .L08030010  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0802FFEC
	movs r0, #0xb1
	bl m4aSongNumStart
.L0802FFEC:
	ldr r1, .L08030014  @ gBattleUnitB
	adds r1, #0x6f
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	blt .L08030002
	ldr r0, .L08030018  @ gUnknown_0859BE10
	adds r1, r6, #0
	bl SpawnProcLocking
.L08030002:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08030008: .4byte gBattleUnitA
.L0803000C: .4byte gAction
.L08030010: .4byte gPlaySt
.L08030014: .4byte gBattleUnitB
.L08030018: .4byte gUnknown_0859BE10

	THUMB_FUNC_END ActionPick

	THUMB_FUNC_START func_0803001C
func_0803001C: @ 0x0803001C
	push {r4, lr}
	ldr r0, .L08030048  @ gBattleUnitB
	adds r4, r0, #0
	adds r4, #0x6f
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt .L08030040
	ldr r0, .L0803004C  @ gAction
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl SetUnitStatus
	movs r0, #0xff
	strb r0, [r4]
.L08030040:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08030048: .4byte gBattleUnitB
.L0803004C: .4byte gAction

	THUMB_FUNC_END func_0803001C

	THUMB_FUNC_START func_08030050
func_08030050: @ 0x08030050
	push {lr}
	bl func_0802F208
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08030050

.align 2, 0
