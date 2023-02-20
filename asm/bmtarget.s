	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Make list of valid targets for everything

	THUMB_FUNC_START func_08024E40
func_08024E40: @ 0x08024E40
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, .L08024EA0  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt .L08024E98
.L08024E50:
	ldr r0, .L08024EA0  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt .L08024E92
	lsls r5, r1, #2
.L08024E60:
	ldr r0, .L08024EA4  @ gMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08024E8C
	ldr r0, .L08024EA8  @ gMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08024E8C
	bl GetUnit
	bl _call_via_r7
.L08024E8C:
	subs r4, #1
	cmp r4, #0
	bge .L08024E60
.L08024E92:
	adds r1, r6, #0
	cmp r1, #0
	bge .L08024E50
.L08024E98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08024EA0: .4byte gMapSize
.L08024EA4: .4byte gMapMovement
.L08024EA8: .4byte gMapUnit

	THUMB_FUNC_END func_08024E40

	THUMB_FUNC_START ForEachUnitInRange
ForEachUnitInRange: @ 0x08024EAC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, .L08024F0C  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt .L08024F04
.L08024EBC:
	ldr r0, .L08024F0C  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt .L08024EFE
	lsls r5, r1, #2
.L08024ECC:
	ldr r0, .L08024F10  @ gMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08024EF8
	ldr r0, .L08024F14  @ gMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08024EF8
	bl GetUnit
	bl _call_via_r7
.L08024EF8:
	subs r4, #1
	cmp r4, #0
	bge .L08024ECC
.L08024EFE:
	adds r1, r6, #0
	cmp r1, #0
	bge .L08024EBC
.L08024F04:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08024F0C: .4byte gMapSize
.L08024F10: .4byte gMapRange
.L08024F14: .4byte gMapUnit

	THUMB_FUNC_END ForEachUnitInRange

	THUMB_FUNC_START ForEachPosInRange
ForEachPosInRange: @ 0x08024F18
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, .L08024F68  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L08024F60
.L08024F28:
	ldr r0, .L08024F68  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt .L08024F5A
.L08024F36:
	ldr r0, .L08024F6C  @ gMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08024F54
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r7
.L08024F54:
	subs r4, #1
	cmp r4, #0
	bge .L08024F36
.L08024F5A:
	adds r5, r6, #0
	cmp r5, #0
	bge .L08024F28
.L08024F60:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08024F68: .4byte gMapSize
.L08024F6C: .4byte gMapRange

	THUMB_FUNC_END ForEachPosInRange

	THUMB_FUNC_START ForEachAdjacentUnit
ForEachAdjacentUnit: @ 0x08024F70
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl InitTargets
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachUnitInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ForEachAdjacentUnit

	THUMB_FUNC_START ForEachAdjacentPosition
ForEachAdjacentPosition: @ 0x08024FA4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl InitTargets
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachPosInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ForEachAdjacentPosition

	THUMB_FUNC_START func_08024FD8
func_08024FD8: @ 0x08024FD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	bl InitTargets
	movs r1, #0xff
	ldr r7, .L08025034  @ gWorkingMap
	lsls r6, r5, #2
.L08024FEE:
	movs r2, #0xff
	lsls r3, r1, #0x18
.L08024FF2:
	cmp r4, #0
	blt .L08025008
	cmp r5, #0
	blt .L08025008
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08025008:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble .L08024FF2
	adds r0, r3, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble .L08024FEE
	mov r0, r8
	bl ForEachPosInRange
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08025034: .4byte gWorkingMap

	THUMB_FUNC_END func_08024FD8

	THUMB_FUNC_START ForEachPosIn12Range
ForEachPosIn12Range: @ 0x08025038
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl InitTargets
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachPosInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ForEachPosIn12Range

	THUMB_FUNC_START ForEachUnitInMagBy2Range
ForEachUnitInMagBy2Range: @ 0x0802506C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, .L080250B8  @ gUnitSubject
	ldr r0, [r6]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl InitTargets
	ldr r0, [r6]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	mov r0, r8
	bl ForEachUnitInRange
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080250B8: .4byte gUnitSubject

	THUMB_FUNC_END ForEachUnitInMagBy2Range

	THUMB_FUNC_START TryAddTrapsToTargetList
TryAddTrapsToTargetList: @ 0x080250BC
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq .L0802516E
	ldr r6, .L08025174  @ gMapTerrain
	ldr r5, .L08025178  @ gMapRange
.L080250D0:
	cmp r0, #2
	bne .L08025166
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne .L08025104
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08025104
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
.L08025104:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne .L08025136
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08025136
	adds r1, #1
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
.L08025136:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x33
	bne .L08025166
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08025166
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
.L08025166:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne .L080250D0
.L0802516E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08025174: .4byte gMapTerrain
.L08025178: .4byte gMapRange

	THUMB_FUNC_END TryAddTrapsToTargetList

	THUMB_FUNC_START AddUnitToTargetListIfNotAllied
AddUnitToTargetListIfNotAllied: @ 0x0802517C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080251B0  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080251AA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L080251AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080251B0: .4byte gUnitSubject

	THUMB_FUNC_END AddUnitToTargetListIfNotAllied

	THUMB_FUNC_START MakeTargetListForWeapon
MakeTargetListForWeapon: @ 0x080251B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, .L08025210  @ gUnitSubject
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	ldr r0, .L08025214  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	mov r0, r8
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapIncInBoundedRange
	ldr r0, .L08025218  @ AddUnitToTargetListIfNotAllied
	bl ForEachUnitInRange
	bl TryAddTrapsToTargetList
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08025210: .4byte gUnitSubject
.L08025214: .4byte gMapRange
.L08025218: .4byte AddUnitToTargetListIfNotAllied

	THUMB_FUNC_END MakeTargetListForWeapon

	THUMB_FUNC_START TryAddUnitToTradeTargetList
TryAddUnitToTradeTargetList: @ 0x0802521C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L080252CC  @ gUnitSubject
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesEqual
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080252C4
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L080252C4
	ldr r3, [r4, #4]
	ldrb r0, [r3, #4]
	cmp r0, #0x51
	beq .L080252C4
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq .L08025288
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	bne .L08025264
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq .L08025288
.L08025264:
	ldr r0, [r4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L08025288
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L08025288:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080252C4
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne .L080252C4
	ldr r0, .L080252CC  @ gUnitSubject
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne .L080252B6
	ldrh r0, [r1, #0x1e]
	cmp r0, #0
	beq .L080252C4
.L080252B6:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0
	bl AddTarget
.L080252C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080252CC: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToTradeTargetList

	THUMB_FUNC_START MakeTradeTargetList
MakeTradeTargetList: @ 0x080252D0
	push {r4, r5, r6, r7, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r6, .L08025338  @ gUnitSubject
	str r0, [r6]
	ldr r0, .L0802533C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r7, .L08025340  @ TryAddUnitToTradeTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ForEachAdjacentUnit
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08025332
	bl GetTargetListSize
	adds r4, r0, #0
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	bl _call_via_r7
	bl GetTargetListSize
	cmp r4, r0
	beq .L08025332
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x11]
	strb r1, [r0, #1]
.L08025332:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08025338: .4byte gUnitSubject
.L0802533C: .4byte gMapRange
.L08025340: .4byte TryAddUnitToTradeTargetList

	THUMB_FUNC_END MakeTradeTargetList

	THUMB_FUNC_START TryAddUnitToRescueTargetList
TryAddUnitToRescueTargetList: @ 0x08025344
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L080253B0  @ gUnitSubject
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080253AA
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L080253AA
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L080253AA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq .L080253AA
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne .L080253AA
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080253AA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L080253AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080253B0: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToRescueTargetList

	THUMB_FUNC_START MakeRescueTargetList
MakeRescueTargetList: @ 0x080253B4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L080253DC  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L080253E0  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L080253E4  @ TryAddUnitToRescueTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080253DC: .4byte gUnitSubject
.L080253E0: .4byte gMapRange
.L080253E4: .4byte TryAddUnitToRescueTargetList

	THUMB_FUNC_END MakeRescueTargetList

	THUMB_FUNC_START TryAddToDropTargetList
TryAddToDropTargetList: @ 0x080253E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, .L08025434  @ gMapUnit
	ldr r0, [r0]
	lsls r5, r6, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0802542C
	ldr r0, .L08025438  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	ldr r1, .L0802543C  @ gMapTerrain
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0802542C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
.L0802542C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08025434: .4byte gMapUnit
.L08025438: .4byte gUnitSubject
.L0802543C: .4byte gMapTerrain

	THUMB_FUNC_END TryAddToDropTargetList

	THUMB_FUNC_START MakeDropTargetList
MakeDropTargetList: @ 0x08025440
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025468  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L0802546C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08025470  @ TryAddToDropTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025468: .4byte gUnitSubject
.L0802546C: .4byte gMapRange
.L08025470: .4byte TryAddToDropTargetList

	THUMB_FUNC_END MakeDropTargetList

	THUMB_FUNC_START TryAddRescuedUnitToTakeTargetList
TryAddRescuedUnitToTakeTargetList: @ 0x08025474
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L080254DC  @ gUnitSubject
	ldr r0, [r4]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreAllegiancesEqual
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080254D6
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080254D6
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L080254D6
	ldr r4, [r4]
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080254D6
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
.L080254D6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080254DC: .4byte gUnitSubject

	THUMB_FUNC_END TryAddRescuedUnitToTakeTargetList

	THUMB_FUNC_START MakeTakeTargetList
MakeTakeTargetList: @ 0x080254E0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025508  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L0802550C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08025510  @ TryAddRescuedUnitToTakeTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025508: .4byte gUnitSubject
.L0802550C: .4byte gMapRange
.L08025510: .4byte TryAddRescuedUnitToTakeTargetList

	THUMB_FUNC_END MakeTakeTargetList

	THUMB_FUNC_START func_08025514
func_08025514: @ 0x08025514
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L08025590  @ gUnitSubject
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesEqual
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025588
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne .L08025588
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq .L08025588
	cmp r1, #2
	beq .L08025588
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L08025588
	ldr r0, [r5]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitCarry
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025588
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L08025588:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025590: .4byte gUnitSubject

	THUMB_FUNC_END func_08025514

	THUMB_FUNC_START func_08025594
func_08025594: @ 0x08025594
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L080255BC  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L080255C0  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L080255C4  @ func_08025514
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080255BC: .4byte gUnitSubject
.L080255C0: .4byte gMapRange
.L080255C4: .4byte func_08025514

	THUMB_FUNC_END func_08025594

	THUMB_FUNC_START func_080255C8
func_080255C8: @ 0x080255C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq .L08025606
	cmp r1, #2
	beq .L08025606
	ldr r0, .L0802560C  @ gUnitSubject
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl CheckForCharacterEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025606
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	ldr r3, [r4]
	ldrb r3, [r3, #4]
	bl AddTarget
.L08025606:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0802560C: .4byte gUnitSubject

	THUMB_FUNC_END func_080255C8

	THUMB_FUNC_START MakeTargetsForTalk
MakeTargetsForTalk: @ 0x08025610
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025638  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L0802563C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08025640  @ func_080255C8
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025638: .4byte gUnitSubject
.L0802563C: .4byte gMapRange
.L08025640: .4byte func_080255C8

	THUMB_FUNC_END MakeTargetsForTalk

	THUMB_FUNC_START MakeTargetListForSupport
MakeTargetListForSupport: @ 0x08025644
	push {r4, r5, r6, r7, lr}
	ldr r4, .L080256E8  @ gUnitSubject
	str r0, [r4]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl InitTargets
	ldr r0, [r4]
	bl GetUnitSupportCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge .L080256E2
	adds r7, r4, #0
.L08025668:
	ldr r0, [r7]
	adds r1, r5, #0
	bl GetUnitSupportUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L080256DC
	ldr r3, [r7]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge .L08025688
	subs r1, r0, r2
.L08025688:
	ldrb r3, [r3, #0x11]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge .L0802569A
	subs r0, r2, r3
.L0802569A:
	adds r0, r1, r0
	cmp r0, #1
	bne .L080256DC
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080256DC
	ldr r0, [r4, #0xc]
	ldr r1, .L080256EC  @ 0x0001002C
	ands r0, r1
	cmp r0, #0
	bne .L080256DC
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq .L080256DC
	cmp r1, #2
	beq .L080256DC
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	adds r3, r5, #0
	bl AddTarget
.L080256DC:
	adds r5, #1
	cmp r5, r6
	blt .L08025668
.L080256E2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080256E8: .4byte gUnitSubject
.L080256EC: .4byte 0x0001002C

	THUMB_FUNC_END MakeTargetListForSupport

	THUMB_FUNC_START AddUnitToTargetListIfAllied
AddUnitToTargetListIfAllied: @ 0x080256F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08025724  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0802571E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #1
	bl AddTarget
.L0802571E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08025724: .4byte gUnitSubject

	THUMB_FUNC_END AddUnitToTargetListIfAllied

	THUMB_FUNC_START FillBallistaRangeMaybe
FillBallistaRangeMaybe: @ 0x08025728
	push {r4, r5, r6, r7, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, .L08025788  @ gUnitSubject
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetSomeBallistaItemAt
	adds r7, r0, #0
	cmp r7, #0
	beq .L08025782
	ldr r0, .L0802578C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	adds r0, r7, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapIncInBoundedRange
	ldr r0, .L08025790  @ AddUnitToTargetListIfAllied
	bl ForEachUnitInRange
	bl TryAddTrapsToTargetList
.L08025782:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08025788: .4byte gUnitSubject
.L0802578C: .4byte gMapRange
.L08025790: .4byte AddUnitToTargetListIfAllied

	THUMB_FUNC_END FillBallistaRangeMaybe

	THUMB_FUNC_START TryAddClosedDoorToTargetList
TryAddClosedDoorToTargetList: @ 0x08025794
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080257D0  @ gMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne .L080257CA
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080257CA
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x1e
	movs r3, #0
	bl AddTarget
.L080257CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080257D0: .4byte gMapTerrain

	THUMB_FUNC_END TryAddClosedDoorToTargetList

	THUMB_FUNC_START TryAddBridgeToTargetList
TryAddBridgeToTargetList: @ 0x080257D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08025810  @ gMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x14
	bne .L0802580A
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0802580A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #0
	bl AddTarget
.L0802580A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025810: .4byte gMapTerrain

	THUMB_FUNC_END TryAddBridgeToTargetList

	THUMB_FUNC_START MakeTargetListForDoorAndBridges
MakeTargetListForDoorAndBridges: @ 0x08025814
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, .L08025844  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025848  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	cmp r4, #0x14
	beq .L08025850
	cmp r4, #0x1e
	bne .L0802585A
	ldr r2, .L0802584C  @ TryAddClosedDoorToTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
	b .L0802585A
	.align 2, 0
.L08025844: .4byte gUnitSubject
.L08025848: .4byte gMapRange
.L0802584C: .4byte TryAddClosedDoorToTargetList
.L08025850:
	ldr r2, .L08025860  @ TryAddBridgeToTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
.L0802585A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08025860: .4byte TryAddBridgeToTargetList

	THUMB_FUNC_END MakeTargetListForDoorAndBridges

	THUMB_FUNC_START func_08025864
func_08025864: @ 0x08025864
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, .L08025890  @ gMapTerrain
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x14
	beq .L08025894
	cmp r0, #0x1e
	bne .L080258A0
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #0x1e
	movs r3, #0
	bl AddTarget
	b .L080258A0
	.align 2, 0
.L08025890: .4byte gMapTerrain
.L08025894:
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #0x14
	movs r3, #0
	bl AddTarget
.L080258A0:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08025864

	THUMB_FUNC_START MakeTargetListForPick
MakeTargetListForPick: @ 0x080258A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0x10
	ldrsb r5, [r4, r5]
	movs r6, #0x11
	ldrsb r6, [r4, r6]
	ldr r0, .L080258F4  @ gUnitSubject
	str r4, [r0]
	ldr r0, .L080258F8  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L080258FC  @ func_08025864
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, .L08025900  @ gMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x21
	bne .L080258EE
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x21
	movs r3, #0
	bl AddTarget
.L080258EE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080258F4: .4byte gUnitSubject
.L080258F8: .4byte gMapRange
.L080258FC: .4byte func_08025864
.L08025900: .4byte gMapTerrain

	THUMB_FUNC_END MakeTargetListForPick

	THUMB_FUNC_START MakeTerrainHealTargetList
MakeTerrainHealTargetList: @ 0x08025904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	mov r7, r8
	b .L080259CE
.L08025918:
	adds r0, r7, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq .L080259CE
	ldr r0, [r5]
	cmp r0, #0
	beq .L080259CE
	ldr r0, [r5, #0xc]
	ldr r1, .L080259E4  @ 0x0001002C
	ands r0, r1
	cmp r0, #0
	bne .L080259CE
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, .L080259E8  @ gMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r6, #0
	bl GetTerrainHealAmount
	cmp r0, #0
	beq .L0802598E
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq .L0802598E
	adds r0, r6, #0
	bl GetTerrainHealAmount
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r3, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	bl AddTarget
.L0802598E:
	adds r0, r6, #0
	bl DoesTerrainHealStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080259CE
	adds r2, r5, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L080259CE
	cmp r0, #0xd
	bne .L080259BA
	movs r3, #0x10
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0xb
	orrs r0, r1
	strb r0, [r2]
.L080259BA:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #1
	negs r3, r3
	bl AddTarget
.L080259CE:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt .L08025918
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080259E4: .4byte 0x0001002C
.L080259E8: .4byte gMapTerrain

	THUMB_FUNC_END MakeTerrainHealTargetList

	THUMB_FUNC_START MakePoisonDamageTargetList
MakePoisonDamageTargetList: @ 0x080259EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	mov r7, r8
	b .L08025A4A
.L08025A00:
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08025A4A
	ldr r0, [r2]
	cmp r0, #0
	beq .L08025A4A
	ldr r0, [r2, #0xc]
	ldr r1, .L08025A60  @ 0x0001002C
	ands r0, r1
	cmp r0, #0
	bne .L08025A4A
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne .L08025A4A
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	movs r6, #0xb
	ldrsb r6, [r2, r6]
	movs r0, #3
	bl RandNext
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl AddTarget
.L08025A4A:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt .L08025A00
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08025A60: .4byte 0x0001002C

	THUMB_FUNC_END MakePoisonDamageTargetList

	THUMB_FUNC_START MakeGorgonEggHatchTargetList
MakeGorgonEggHatchTargetList: @ 0x08025A64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	adds r6, r7, #1
	adds r0, r7, #0
	adds r0, #0x40
	cmp r6, r0
	bge .L08025B0C
	movs r0, #5
	lsls r0, r0, #0x18
	mov r8, r0
.L08025A84:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L08025B02
	ldr r0, [r4]
	cmp r0, #0
	beq .L08025B02
	ldr r5, [r4, #0xc]
	ldr r0, .L08025AD4  @ 0x0001002C
	ands r5, r0
	cmp r5, #0
	bne .L08025B02
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne .L08025B02
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xc
	bl GetSpecificTrapAt
	adds r2, r0, #0
	cmp r2, #0
	beq .L08025B02
	ldrb r0, [r2, #4]
	subs r0, #1
	cmp r0, #0
	ble .L08025AD8
	strb r0, [r2, #4]
	ldrb r0, [r2, #5]
	strb r0, [r2, #6]
	b .L08025B02
	.align 2, 0
.L08025AD4: .4byte 0x0001002C
.L08025AD8:
	strb r5, [r2, #4]
	ldrb r0, [r2, #6]
	adds r0, #1
	strb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #5
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt .L08025B02
	strb r5, [r2, #6]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	mov r4, r8
	asrs r3, r4, #0x18
	bl AddTarget
.L08025B02:
	adds r6, #1
	adds r0, r7, #0
	adds r0, #0x40
	cmp r6, r0
	blt .L08025A84
.L08025B0C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END MakeGorgonEggHatchTargetList

	THUMB_FUNC_START func_08025B18
func_08025B18: @ 0x08025B18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08025B68  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesEqual
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025B62
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L08025B62
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq .L08025B62
	cmp r1, #0xd
	beq .L08025B62
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L08025B62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08025B68: .4byte gUnitSubject

	THUMB_FUNC_END func_08025B18

	THUMB_FUNC_START func_08025B6C
func_08025B6C: @ 0x08025B6C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025B94  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025B98  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08025B9C  @ func_08025B18
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025B94: .4byte gUnitSubject
.L08025B98: .4byte gMapRange
.L08025B9C: .4byte func_08025B18

	THUMB_FUNC_END func_08025B6C

	THUMB_FUNC_START AddAsTarget_IfCanStealFrom
AddAsTarget_IfCanStealFrom: @ 0x08025BA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne .L08025BF8
	ldr r0, .L08025BEC  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	blt .L08025BF8
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x1e
.L08025BC6:
	ldrh r0, [r4]
	cmp r0, #0
	beq .L08025BF8
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025BF0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
	b .L08025BF8
	.align 2, 0
.L08025BEC: .4byte gActiveUnit
.L08025BF0:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble .L08025BC6
.L08025BF8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END AddAsTarget_IfCanStealFrom

	THUMB_FUNC_START MakeTargetListForSteal
MakeTargetListForSteal: @ 0x08025C00
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025C28  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025C2C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08025C30  @ AddAsTarget_IfCanStealFrom
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025C28: .4byte gUnitSubject
.L08025C2C: .4byte gMapRange
.L08025C30: .4byte AddAsTarget_IfCanStealFrom

	THUMB_FUNC_END MakeTargetListForSteal

	THUMB_FUNC_START AddAsTarget_IfPositionCleanForSummon
AddAsTarget_IfPositionCleanForSummon: @ 0x08025C34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08025C90  @ gMapUnit
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08025C8A
	ldr r0, .L08025C94  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L08025C64
	ldr r0, .L08025C98  @ gMapFog
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08025C8A
.L08025C64:
	ldr r0, .L08025C9C  @ gUnitSubject
	ldr r0, [r0]
	ldr r1, .L08025CA0  @ gMapTerrain
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025C8A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
.L08025C8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025C90: .4byte gMapUnit
.L08025C94: .4byte gPlaySt
.L08025C98: .4byte gMapFog
.L08025C9C: .4byte gUnitSubject
.L08025CA0: .4byte gMapTerrain

	THUMB_FUNC_END AddAsTarget_IfPositionCleanForSummon

	THUMB_FUNC_START ListSummonTargets
ListSummonTargets: @ 0x08025CA4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025CCC  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025CD0  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08025CD4  @ AddAsTarget_IfPositionCleanForSummon
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025CCC: .4byte gUnitSubject
.L08025CD0: .4byte gMapRange
.L08025CD4: .4byte AddAsTarget_IfPositionCleanForSummon

	THUMB_FUNC_END ListSummonTargets

	THUMB_FUNC_START func_08025CD8
func_08025CD8: @ 0x08025CD8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08025D34  @ gMapUnit
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08025D2E
	ldr r0, .L08025D38  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L08025D08
	ldr r0, .L08025D3C  @ gMapFog
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08025D2E
.L08025D08:
	ldr r0, .L08025D40  @ gUnitSubject
	ldr r0, [r0]
	ldr r1, .L08025D44  @ gMapTerrain
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025D2E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
.L08025D2E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025D34: .4byte gMapUnit
.L08025D38: .4byte gPlaySt
.L08025D3C: .4byte gMapFog
.L08025D40: .4byte gUnitSubject
.L08025D44: .4byte gMapTerrain

	THUMB_FUNC_END func_08025CD8

	THUMB_FUNC_START func_08025D48
func_08025D48: @ 0x08025D48
	push {r4, r5, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r1, .L08025D74  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025D78  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	adds r4, #4
	ldr r2, .L08025D7C  @ func_08025CD8
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_08024FD8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025D74: .4byte gUnitSubject
.L08025D78: .4byte gMapRange
.L08025D7C: .4byte func_08025CD8

	THUMB_FUNC_END func_08025D48

	THUMB_FUNC_START func_08025D80
func_08025D80: @ 0x08025D80
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025DAC  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025DB0  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	subs r4, #4
	ldr r2, .L08025DB4  @ func_08025CD8
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_08024FD8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025DAC: .4byte gUnitSubject
.L08025DB0: .4byte gMapRange
.L08025DB4: .4byte func_08025CD8

	THUMB_FUNC_END func_08025D80

	THUMB_FUNC_START func_08025DB8
func_08025DB8: @ 0x08025DB8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025DE4  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025DE8  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	adds r4, #4
	ldr r2, .L08025DEC  @ func_08025CD8
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_08024FD8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025DE4: .4byte gUnitSubject
.L08025DE8: .4byte gMapRange
.L08025DEC: .4byte func_08025CD8

	THUMB_FUNC_END func_08025DB8

	THUMB_FUNC_START func_08025DF0
func_08025DF0: @ 0x08025DF0
	push {r4, r5, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r1, .L08025E1C  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025E20  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	subs r4, #4
	ldr r2, .L08025E24  @ func_08025CD8
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_08024FD8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025E1C: .4byte gUnitSubject
.L08025E20: .4byte gMapRange
.L08025E24: .4byte func_08025CD8

	THUMB_FUNC_END func_08025DF0

	THUMB_FUNC_START TryAddUnitToHealTargetList
TryAddUnitToHealTargetList: @ 0x08025E28
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08025E78  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025E72
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08025E72
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq .L08025E72
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
.L08025E72:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025E78: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToHealTargetList

	THUMB_FUNC_START MakeTargetListForAdjacentHeal
MakeTargetListForAdjacentHeal: @ 0x08025E7C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025EA4  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08025EA8  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08025EAC  @ TryAddUnitToHealTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025EA4: .4byte gUnitSubject
.L08025EA8: .4byte gMapRange
.L08025EAC: .4byte TryAddUnitToHealTargetList

	THUMB_FUNC_END MakeTargetListForAdjacentHeal

	THUMB_FUNC_START MakeTargetListForRangedHeal
MakeTargetListForRangedHeal: @ 0x08025EB0
	push {r4, r5, r6, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r4, .L08025EF0  @ gUnitSubject
	str r0, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	ldr r0, .L08025EF4  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [r4]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	ldr r0, .L08025EF8  @ TryAddUnitToHealTargetList
	bl ForEachUnitInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08025EF0: .4byte gUnitSubject
.L08025EF4: .4byte gMapRange
.L08025EF8: .4byte TryAddUnitToHealTargetList

	THUMB_FUNC_END MakeTargetListForRangedHeal

	THUMB_FUNC_START AddToTargetListIfNotAllied
AddToTargetListIfNotAllied: @ 0x08025EFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08025F40  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L08025F3A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L08025F3A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L08025F3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08025F40: .4byte gUnitSubject

	THUMB_FUNC_END AddToTargetListIfNotAllied

	THUMB_FUNC_START MakeTargetListForFuckingNightmare
MakeTargetListForFuckingNightmare: @ 0x08025F44
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08025F8C  @ gUnitSubject
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl InitTargets
	ldr r0, .L08025F90  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	ldr r0, .L08025F94  @ AddToTargetListIfNotAllied
	bl ForEachUnitInRange
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08025F8C: .4byte gUnitSubject
.L08025F90: .4byte gMapRange
.L08025F94: .4byte AddToTargetListIfNotAllied

	THUMB_FUNC_END MakeTargetListForFuckingNightmare

	THUMB_FUNC_START TryAddUnitToRestoreTargetList
TryAddUnitToRestoreTargetList: @ 0x08025F98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08025FE4  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08025FDE
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08025FDE
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L08025FDE
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L08025FDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08025FE4: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToRestoreTargetList

	THUMB_FUNC_START MakeTargetListForRestore
MakeTargetListForRestore: @ 0x08025FE8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08026010  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08026014  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08026018  @ TryAddUnitToRestoreTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08026010: .4byte gUnitSubject
.L08026014: .4byte gMapRange
.L08026018: .4byte TryAddUnitToRestoreTargetList

	THUMB_FUNC_END MakeTargetListForRestore

	THUMB_FUNC_START TryAddUnitToBarrierTargetList
TryAddUnitToBarrierTargetList: @ 0x0802601C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08026068  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08026060
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08026060
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #6
	bhi .L08026060
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L08026060:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08026068: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToBarrierTargetList

	THUMB_FUNC_START MakeTargetListForBarrier
MakeTargetListForBarrier: @ 0x0802606C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08026094  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08026098  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L0802609C  @ TryAddUnitToBarrierTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08026094: .4byte gUnitSubject
.L08026098: .4byte gMapRange
.L0802609C: .4byte TryAddUnitToBarrierTargetList

	THUMB_FUNC_END MakeTargetListForBarrier

	THUMB_FUNC_START TryAddUnitToRescueStaffTargetList
TryAddUnitToRescueStaffTargetList: @ 0x080260A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080260D4  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080260CE
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L080260CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080260D4: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToRescueStaffTargetList

	THUMB_FUNC_START MakeTargetListForRescueStaff
MakeTargetListForRescueStaff: @ 0x080260D8
	push {lr}
	ldr r1, .L080260F4  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L080260F8  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L080260FC  @ TryAddUnitToRescueStaffTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
.L080260F4: .4byte gUnitSubject
.L080260F8: .4byte gMapRange
.L080260FC: .4byte TryAddUnitToRescueStaffTargetList

	THUMB_FUNC_END MakeTargetListForRescueStaff

	THUMB_FUNC_START TryAddUnitToSilenceTargetList
TryAddUnitToSilenceTargetList: @ 0x08026100
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08026148  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08026140
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq .L0802612E
	cmp r1, #3
	bne .L08026140
.L0802612E:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L08026140:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08026148: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToSilenceTargetList

	THUMB_FUNC_START TryAddUnitToSleepTargetList
TryAddUnitToSleepTargetList: @ 0x0802614C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08026194  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0802618C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq .L0802617A
	cmp r1, #2
	bne .L0802618C
.L0802617A:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L0802618C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08026194: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToSleepTargetList

	THUMB_FUNC_START TryAddUnitToBerzerkTargetList
TryAddUnitToBerzerkTargetList: @ 0x08026198
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080261E0  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080261D8
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq .L080261C6
	cmp r1, #4
	bne .L080261D8
.L080261C6:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L080261D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080261E0: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToBerzerkTargetList

	THUMB_FUNC_START MakeTargetListForSilence
MakeTargetListForSilence: @ 0x080261E4
	push {lr}
	ldr r1, .L08026200  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08026204  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L08026208  @ TryAddUnitToSilenceTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
.L08026200: .4byte gUnitSubject
.L08026204: .4byte gMapRange
.L08026208: .4byte TryAddUnitToSilenceTargetList

	THUMB_FUNC_END MakeTargetListForSilence

	THUMB_FUNC_START MakeTargetListForSleep
MakeTargetListForSleep: @ 0x0802620C
	push {lr}
	ldr r1, .L08026228  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L0802622C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L08026230  @ TryAddUnitToSleepTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
.L08026228: .4byte gUnitSubject
.L0802622C: .4byte gMapRange
.L08026230: .4byte TryAddUnitToSleepTargetList

	THUMB_FUNC_END MakeTargetListForSleep

	THUMB_FUNC_START MakeTargetListForBerserk
MakeTargetListForBerserk: @ 0x08026234
	push {lr}
	ldr r1, .L08026250  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08026254  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L08026258  @ TryAddUnitToBerzerkTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
.L08026250: .4byte gUnitSubject
.L08026254: .4byte gMapRange
.L08026258: .4byte TryAddUnitToBerzerkTargetList

	THUMB_FUNC_END MakeTargetListForBerserk

	THUMB_FUNC_START TryAddUnitToWarpTargetList
TryAddUnitToWarpTargetList: @ 0x0802625C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08026290  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0802628A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L0802628A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08026290: .4byte gUnitSubject

	THUMB_FUNC_END TryAddUnitToWarpTargetList

	THUMB_FUNC_START MakeTargetListForWarp
MakeTargetListForWarp: @ 0x08026294
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L080262BC  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L080262C0  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L080262C4  @ TryAddUnitToWarpTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080262BC: .4byte gUnitSubject
.L080262C0: .4byte gMapRange
.L080262C4: .4byte TryAddUnitToWarpTargetList

	THUMB_FUNC_END MakeTargetListForWarp

	THUMB_FUNC_START MakeTargetListForUnlock
MakeTargetListForUnlock: @ 0x080262C8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L080262F0  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L080262F4  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L080262F8  @ TryAddClosedDoorToTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachPosIn12Range
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080262F0: .4byte gUnitSubject
.L080262F4: .4byte gMapRange
.L080262F8: .4byte TryAddClosedDoorToTargetList

	THUMB_FUNC_END MakeTargetListForUnlock

	THUMB_FUNC_START TryAddUnitToHammerneTargetList
TryAddUnitToHammerneTargetList: @ 0x080262FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L0802631C  @ gUnitSubject
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesEqual
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0802634C
	movs r5, #0
	b .L08026322
	.align 2, 0
.L0802631C: .4byte gUnitSubject
.L08026320:
	adds r5, #1
.L08026322:
	cmp r5, #4
	bgt .L0802634C
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl IsItemRepairable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08026320
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
.L0802634C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END TryAddUnitToHammerneTargetList

	THUMB_FUNC_START MakeTargetListForHammerne
MakeTargetListForHammerne: @ 0x08026354
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L0802637C  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08026380  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08026384  @ TryAddUnitToHammerneTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802637C: .4byte gUnitSubject
.L08026380: .4byte gMapRange
.L08026384: .4byte TryAddUnitToHammerneTargetList

	THUMB_FUNC_END MakeTargetListForHammerne

	THUMB_FUNC_START MakeTargetListForLatona
MakeTargetListForLatona: @ 0x08026388
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl InitTargets
	bl GetCurrentPhase
	adds r7, r0, #0
	adds r6, r7, #1
	b .L08026400
.L080263AA:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq .L080263FC
	ldr r0, [r5]
	cmp r0, #0
	beq .L080263FC
	ldr r0, [r5, #0xc]
	ldr r1, .L08026410  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L080263FC
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	bne .L080263E6
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L080263FC
.L080263E6:
	cmp r5, r8
	beq .L080263FC
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
.L080263FC:
	adds r6, #1
	adds r0, r7, #0
.L08026400:
	adds r0, #0x80
	cmp r6, r0
	blt .L080263AA
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08026410: .4byte 0x0001000C

	THUMB_FUNC_END MakeTargetListForLatona

	THUMB_FUNC_START func_08026414
func_08026414: @ 0x08026414
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	bl GetTargetListSize
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge .L08026460
.L08026428:
	adds r0, r6, #0
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #3
	ldrsb r1, [r4, r1]
	cmp r0, r1
	bgt .L0802645A
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	movs r1, #0
	mov r2, r8
	bl BWL_SetDeathStats
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl BWL_AddLoss
.L0802645A:
	adds r6, #1
	cmp r6, r7
	blt .L08026428
.L08026460:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08026414

	THUMB_FUNC_START func_0802646C
func_0802646C: @ 0x0802646C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080264DC  @ gMapUnit
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080264D4
	ldr r0, .L080264E0  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L0802649C
	ldr r0, .L080264E4  @ gMapFog
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080264D4
.L0802649C:
	ldr r0, .L080264E8  @ gUnitSubject
	ldr r0, [r0]
	ldr r1, .L080264EC  @ gMapTerrain
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080264D4
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	cmp r0, #0
	beq .L080264C8
	ldrb r0, [r0, #2]
	cmp r0, #0xa
	bne .L080264D4
.L080264C8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
.L080264D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080264DC: .4byte gMapUnit
.L080264E0: .4byte gPlaySt
.L080264E4: .4byte gMapFog
.L080264E8: .4byte gUnitSubject
.L080264EC: .4byte gMapTerrain

	THUMB_FUNC_END func_0802646C

	THUMB_FUNC_START MakeTargetListForMine
MakeTargetListForMine: @ 0x080264F0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L08026518  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L0802651C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08026520  @ func_0802646C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08026518: .4byte gUnitSubject
.L0802651C: .4byte gMapRange
.L08026520: .4byte func_0802646C

	THUMB_FUNC_END MakeTargetListForMine

	THUMB_FUNC_START func_08026524
func_08026524: @ 0x08026524
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08026574  @ gMapUnit
	ldr r0, [r0]
	lsls r6, r5, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0802656C
	adds r0, r4, #0
	bl GetTrapAt
	cmp r0, #0
	bne .L0802656C
	ldr r1, .L08026578  @ gUnknown_0880BB96
	ldr r0, .L0802657C  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L0802656C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
.L0802656C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08026574: .4byte gMapUnit
.L08026578: .4byte gUnknown_0880BB96
.L0802657C: .4byte gMapTerrain

	THUMB_FUNC_END func_08026524

	THUMB_FUNC_START MakeTargetListForLightRune
MakeTargetListForLightRune: @ 0x08026580
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L080265A8  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L080265AC  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L080265B0  @ func_08026524
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080265A8: .4byte gUnitSubject
.L080265AC: .4byte gMapRange
.L080265B0: .4byte func_08026524

	THUMB_FUNC_END MakeTargetListForLightRune

	THUMB_FUNC_START TryAddUnitToDanceRingTargetList
TryAddUnitToDanceRingTargetList: @ 0x080265B4
	push {lr}
	adds r3, r0, #0
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne .L080265E0
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L080265E0
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	movs r3, #0
	bl AddTarget
.L080265E0:
	pop {r0}
	bx r0

	THUMB_FUNC_END TryAddUnitToDanceRingTargetList

	THUMB_FUNC_START MakeTargetListForDanceRing
MakeTargetListForDanceRing: @ 0x080265E4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, .L0802660C  @ gUnitSubject
	str r0, [r1]
	ldr r0, .L08026610  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r2, .L08026614  @ TryAddUnitToDanceRingTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802660C: .4byte gUnitSubject
.L08026610: .4byte gMapRange
.L08026614: .4byte TryAddUnitToDanceRingTargetList

	THUMB_FUNC_END MakeTargetListForDanceRing

.align 2, 0
