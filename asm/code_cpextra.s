	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Core stuff to the AI system

	THUMB_FUNC_START AiScriptCompare
AiScriptCompare: @ 0x0803A71C
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #5
	bhi .L0803A780
	lsls r0, r0, #2
	ldr r1, .L0803A734  @ .L0803A738
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0803A734: .4byte .L0803A738
.L0803A738: @ jump table
	.4byte .L0803A750 @ case 0
	.4byte .L0803A75A @ case 1
	.4byte .L0803A762 @ case 2
	.4byte .L0803A76A @ case 3
	.4byte .L0803A772 @ case 4
	.4byte .L0803A77A @ case 5
.L0803A750:
	ldrb r0, [r3]
	cmp r0, r2
	bls .L0803A780
.L0803A756:
	movs r0, #1
	b .L0803A782
.L0803A75A:
	ldrb r0, [r3]
	cmp r0, r2
	bcc .L0803A780
	b .L0803A756
.L0803A762:
	ldrb r0, [r3]
	cmp r0, r2
	bne .L0803A780
	b .L0803A756
.L0803A76A:
	ldrb r0, [r3]
	cmp r0, r2
	bhi .L0803A780
	b .L0803A756
.L0803A772:
	ldrb r0, [r3]
	cmp r0, r2
	bcs .L0803A780
	b .L0803A756
.L0803A77A:
	ldrb r0, [r3]
	cmp r0, r2
	bne .L0803A756
.L0803A780:
	movs r0, #0
.L0803A782:
	pop {r1}
	bx r1

	THUMB_FUNC_END AiScriptCompare

	THUMB_FUNC_START AiFindPositionOfCharacter
AiFindPositionOfCharacter: @ 0x0803A788
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, .L0803A824  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodExtendedOnRangeMap
	bl MapMarkFloodEdges
	ldr r0, .L0803A828  @ 0x0000FFFF
	strh r0, [r6]
	movs r5, #1
	ldr r0, .L0803A82C  @ gUnknown_0203AA8A
	mov r8, r0
.L0803A7BA:
	adds r0, r5, #0
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq .L0803A810
	ldr r4, [r3]
	cmp r4, #0
	beq .L0803A810
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r0, .L0803A830  @ gMapRange
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803A810
	ldrb r0, [r4, #4]
	cmp r0, r7
	bne .L0803A810
	ldr r1, [r3, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0803A854
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq .L0803A804
	movs r0, #3
	mov r1, r8
	strb r0, [r1]
.L0803A804:
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	strh r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	strh r0, [r6, #2]
.L0803A810:
	adds r5, #1
	cmp r5, #0xbf
	ble .L0803A7BA
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	blt .L0803A834
	movs r0, #1
	b .L0803A86A
	.align 2, 0
.L0803A824: .4byte gActiveUnit
.L0803A828: .4byte 0x0000FFFF
.L0803A82C: .4byte gUnknown_0203AA8A
.L0803A830: .4byte gMapRange
.L0803A834:
	adds r0, r7, #0
	bl GetUnitByPid
	ldr r0, [r0, #0xc]
	ldr r1, .L0803A84C  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	beq .L0803A860
	ldr r0, .L0803A850  @ gAiSt
	adds r0, #0x86
	movs r1, #1
	b .L0803A866
	.align 2, 0
.L0803A84C: .4byte 0x0001000C
.L0803A850: .4byte gAiSt
.L0803A854:
	ldr r0, .L0803A85C  @ gAiSt
	adds r0, #0x86
	movs r1, #1
	b .L0803A866
	.align 2, 0
.L0803A85C: .4byte gAiSt
.L0803A860:
	ldr r0, .L0803A874  @ gAiSt
	adds r0, #0x86
	movs r1, #4
.L0803A866:
	strb r1, [r0]
	movs r0, #0
.L0803A86A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803A874: .4byte gAiSt

	THUMB_FUNC_END AiFindPositionOfCharacter

	THUMB_FUNC_START AiFindClosestPositionWithUnitOfClass
AiFindClosestPositionWithUnitOfClass: @ 0x0803A878
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	movs r7, #0xff
	ldr r0, .L0803A908  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodExtendedOnRangeMap
	ldr r0, .L0803A90C  @ 0x0000FFFF
	strh r0, [r6]
	movs r4, #1
.L0803A8A4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L0803A8F4
	ldr r0, [r2]
	cmp r0, #0
	beq .L0803A8F4
	ldr r0, [r2, #0xc]
	ldr r1, .L0803A910  @ 0x00010025
	ands r0, r1
	cmp r0, #0
	bne .L0803A8F4
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, .L0803A914  @ gMapRange
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0x10
	ldrsb r3, [r2, r3]
	ldr r0, [r1]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi .L0803A8F4
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne .L0803A8F4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r7, r0
	blt .L0803A8F4
	ldrb r7, [r1]
	strh r3, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	strh r0, [r6, #2]
.L0803A8F4:
	adds r4, #1
	cmp r4, #0xbf
	ble .L0803A8A4
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge .L0803A918
	movs r0, #0
	b .L0803A91A
	.align 2, 0
.L0803A908: .4byte gActiveUnit
.L0803A90C: .4byte 0x0000FFFF
.L0803A910: .4byte 0x00010025
.L0803A914: .4byte gMapRange
.L0803A918:
	movs r0, #1
.L0803A91A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiFindClosestPositionWithUnitOfClass

	THUMB_FUNC_START AiGetClosestUnitPosition
AiGetClosestUnitPosition: @ 0x0803A924
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, .L0803A964  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodExtendedOnRangeMap
	ldr r2, .L0803A968  @ 0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, .L0803A96C  @ gMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b .L0803A9FA
	.align 2, 0
.L0803A964: .4byte gActiveUnit
.L0803A968: .4byte 0x0000FFFF
.L0803A96C: .4byte gMapSize
.L0803A970:
	ldr r0, .L0803AA0C  @ gMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt .L0803A9F6
	mov sl, r8
	ldr r0, .L0803AA10  @ gMapRange
	mov r9, r0
	asrs r7, r1, #0xe
.L0803A98C:
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803A9E8
	ldr r0, .L0803AA14  @ gMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq .L0803A9E8
	ldr r0, .L0803AA18  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq .L0803A9E8
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803A9E8
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	ldr r2, [sp, #8]
	cmp r0, r2
	bhi .L0803A9E8
	adds r1, r0, #0
	str r1, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r0, sl
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
.L0803A9E8:
	lsls r0, r6, #0x10
	ldr r1, .L0803AA1C  @ 0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge .L0803A98C
.L0803A9F6:
	ldr r0, .L0803AA1C  @ 0xFFFF0000
	add r0, r8
.L0803A9FA:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge .L0803A970
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge .L0803AA20
	movs r0, #0
	b .L0803AA30
	.align 2, 0
.L0803AA0C: .4byte gMapSize
.L0803AA10: .4byte gMapRange
.L0803AA14: .4byte gMapUnit
.L0803AA18: .4byte gActiveUnitId
.L0803AA1C: .4byte 0xFFFF0000
.L0803AA20:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
.L0803AA30:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiGetClosestUnitPosition

	THUMB_FUNC_START func_0803AA40
func_0803AA40: @ 0x0803AA40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, .L0803AA80  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiMapRangeFillMovementWithPassableWalls
	ldr r2, .L0803AA84  @ 0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, .L0803AA88  @ gMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b .L0803AB16
	.align 2, 0
.L0803AA80: .4byte gActiveUnit
.L0803AA84: .4byte 0x0000FFFF
.L0803AA88: .4byte gMapSize
.L0803AA8C:
	ldr r0, .L0803AB28  @ gMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt .L0803AB12
	mov sl, r8
	ldr r0, .L0803AB2C  @ gMapRange
	mov r9, r0
	asrs r7, r1, #0xe
.L0803AAA8:
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803AB04
	ldr r0, .L0803AB30  @ gMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq .L0803AB04
	ldr r0, .L0803AB34  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq .L0803AB04
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803AB04
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	ldr r2, [sp, #8]
	cmp r0, r2
	bhi .L0803AB04
	adds r1, r0, #0
	str r1, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r0, sl
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
.L0803AB04:
	lsls r0, r6, #0x10
	ldr r1, .L0803AB38  @ 0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge .L0803AAA8
.L0803AB12:
	ldr r0, .L0803AB38  @ 0xFFFF0000
	add r0, r8
.L0803AB16:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge .L0803AA8C
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge .L0803AB3C
	movs r0, #0
	b .L0803AB4C
	.align 2, 0
.L0803AB28: .4byte gMapSize
.L0803AB2C: .4byte gMapRange
.L0803AB30: .4byte gMapUnit
.L0803AB34: .4byte gActiveUnitId
.L0803AB38: .4byte 0xFFFF0000
.L0803AB3C:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
.L0803AB4C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803AA40

	THUMB_FUNC_START func_0803AB5C
func_0803AB5C: @ 0x0803AB5C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	movs r0, #0
	mov r8, r0
	mov r9, r0
	ldr r0, .L0803AB80  @ gActiveUnit
	ldr r0, [r0]
	bl MapFloodUnit
	ldr r3, .L0803AB84  @ 0x0000FFFF
	ldr r0, .L0803AB88  @ gMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b .L0803ABF6
	.align 2, 0
.L0803AB80: .4byte gActiveUnit
.L0803AB84: .4byte 0x0000FFFF
.L0803AB88: .4byte gMapSize
.L0803AB8C:
	ldr r0, .L0803AC2C  @ gMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	lsls r7, r1, #0x10
	cmp r4, #0
	blt .L0803ABF2
	adds r2, r7, #0
	asrs r6, r7, #0xe
.L0803ABA2:
	ldr r0, .L0803AC30  @ gMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	asrs r1, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803ABE4
	ldr r0, .L0803AC34  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0803ABE4
	movs r0, #0x80
	lsls r0, r0, #1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	cmp r0, r8
	bcc .L0803ABE4
	mov r8, r0
	lsrs r3, r4, #0x10
	lsrs r1, r2, #0x10
	mov r9, r1
.L0803ABE4:
	lsls r0, r5, #0x10
	ldr r1, .L0803AC38  @ 0xFFFF0000
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	cmp r4, #0
	bge .L0803ABA2
.L0803ABF2:
	ldr r1, .L0803AC38  @ 0xFFFF0000
	adds r0, r7, r1
.L0803ABF6:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge .L0803AB8C
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L0803AC1C
	mov r0, r9
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl AiSetDecision
.L0803AC1C:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803AC2C: .4byte gMapSize
.L0803AC30: .4byte gMapMovement
.L0803AC34: .4byte gMapUnit
.L0803AC38: .4byte 0xFFFF0000

	THUMB_FUNC_END func_0803AB5C

	THUMB_FUNC_START CouldStationaryUnitBeInRangeHeuristic
CouldStationaryUnitBeInRangeHeuristic: @ 0x0803AC3C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r3, r1, r0
	cmp r3, #0
	bge .L0803AC56
	subs r3, r0, r1
.L0803AC56:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	subs r0, r2, r1
	cmp r0, #0
	bge .L0803AC66
	subs r0, r1, r2
.L0803AC66:
	adds r5, r3, r0
	adds r0, r6, #0
	bl GetItemMaxRange
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r5, r1
	ble .L0803AC86
	movs r0, #0
	b .L0803AC88
.L0803AC86:
	movs r0, #1
.L0803AC88:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CouldStationaryUnitBeInRangeHeuristic

	THUMB_FUNC_START CouldUnitBeInRangeHeuristic
CouldUnitBeInRangeHeuristic: @ 0x0803AC90
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r3, #0x10
	ldrsb r3, [r4, r3]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	bge .L0803ACAA
	subs r1, r0, r3
.L0803ACAA:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt .L0803ACBC
	adds r6, r1, r3
	b .L0803ACC0
.L0803ACBC:
	subs r0, r0, r2
	adds r6, r1, r0
.L0803ACC0:
	adds r0, r7, #0
	bl GetItemMaxRange
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	movs r2, #0x1d
	ldrsb r2, [r5, r2]
	ldr r3, [r5, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r6, r1
	ble .L0803ACEE
	movs r0, #0
	b .L0803ACF0
.L0803ACEE:
	movs r0, #1
.L0803ACF0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END CouldUnitBeInRangeHeuristic

	THUMB_FUNC_START func_0803ACF8
func_0803ACF8: @ 0x0803ACF8
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b .L0803AD0A
.L0803AD00:
	cmp r2, r1
	bne .L0803AD08
	movs r0, #1
	b .L0803AD12
.L0803AD08:
	adds r0, #2
.L0803AD0A:
	ldrh r2, [r0]
	cmp r2, #0
	bne .L0803AD00
	movs r0, #0
.L0803AD12:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803ACF8

	THUMB_FUNC_START IsTerrainIdInList
IsTerrainIdInList: @ 0x0803AD18
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	b .L0803AD2A
.L0803AD20:
	cmp r2, r1
	bne .L0803AD28
	movs r0, #1
	b .L0803AD32
.L0803AD28:
	adds r0, #1
.L0803AD2A:
	ldrb r2, [r0]
	cmp r2, #0
	bne .L0803AD20
	movs r0, #0
.L0803AD32:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsTerrainIdInList

	THUMB_FUNC_START AiFindClosestTileInRangeWithListedTerrain
AiFindClosestTileInRangeWithListedTerrain: @ 0x0803AD38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov r9, r0
	ldr r0, .L0803AE14  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803AE0A
.L0803AD5A:
	ldr r0, .L0803AE14  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt .L0803AE04
	lsls r6, r5, #2
.L0803AD6C:
	ldr r0, .L0803AE18  @ gMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803ADFE
	ldr r0, .L0803AE1C  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl IsTerrainIdInList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803ADFE
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L0803ADC4
	ldr r0, .L0803AE20  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803ADC4
	ldr r0, .L0803AE24  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803ADFE
.L0803ADC4:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L0803ADDE
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl AiAreEnemiesWithin3Tiles
	cmp r0, #0
	bne .L0803ADFE
.L0803ADDE:
	ldr r0, .L0803AE18  @ gMapRange
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r9, r0
	ble .L0803ADFE
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r9, r0
.L0803ADFE:
	subs r4, #1
	cmp r4, #0
	bge .L0803AD6C
.L0803AE04:
	mov r5, sl
	cmp r5, #0
	bge .L0803AD5A
.L0803AE0A:
	mov r0, r9
	cmp r0, #0xff
	bne .L0803AE28
	movs r0, #0
	b .L0803AE2A
	.align 2, 0
.L0803AE14: .4byte gMapSize
.L0803AE18: .4byte gMapRange
.L0803AE1C: .4byte gMapTerrain
.L0803AE20: .4byte gMapUnit
.L0803AE24: .4byte gActiveUnit
.L0803AE28:
	movs r0, #1
.L0803AE2A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiFindClosestTileInRangeWithListedTerrain

	THUMB_FUNC_START GetPositionRangeWeight
GetPositionRangeWeight: @ 0x0803AE3C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, .L0803AE74  @ gMapRange
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt .L0803AE70
	ldr r0, .L0803AE78  @ gMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq .L0803AE80
	ldr r0, .L0803AE7C  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq .L0803AE80
.L0803AE70:
	movs r0, #0xff
	b .L0803AE8C
	.align 2, 0
.L0803AE74: .4byte gMapRange
.L0803AE78: .4byte gMapUnit
.L0803AE7C: .4byte gActiveUnitId
.L0803AE80:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
.L0803AE8C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetPositionRangeWeight

	THUMB_FUNC_START func_0803AE94
func_0803AE94: @ 0x0803AE94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	mov sl, r1
	mov r9, r2
	movs r0, #0xff
	str r0, [sp, #8]
	ldr r0, .L0803AFB0  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt .L0803AFA4
	mov r8, sp
.L0803AEB8:
	ldr r0, .L0803AFB0  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r6, #1
	str r3, [sp, #0xc]
	cmp r5, #0
	blt .L0803AF9E
	lsls r7, r6, #2
	str r7, [sp, #0x10]
.L0803AECC:
	ldr r0, .L0803AFB4  @ gMapRange
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803AF98
	ldr r0, .L0803AFB8  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	bl IsTerrainIdInList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803AF98
	movs r0, #1
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq .L0803AF28
	ldr r0, .L0803AFBC  @ gMapUnit
	ldr r0, [r0]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803AF28
	ldr r0, .L0803AFC0  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803AF98
.L0803AF28:
	movs r0, #2
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq .L0803AF42
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl AiAreEnemiesWithin3Tiles
	cmp r0, #0
	bne .L0803AF98
.L0803AF42:
	mov r4, sp
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, .L0803AFC4  @ GetPositionRangeWeight
	mov r3, sp
	bl GetLesserWeightedAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803AF98
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, .L0803AFB4  @ gMapRange
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r3, r8
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble .L0803AF98
	ldrh r0, [r3]
	mov r3, r9
	strh r0, [r3]
	ldrh r0, [r4, #2]
	strh r0, [r3, #2]
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
.L0803AF98:
	subs r5, #1
	cmp r5, #0
	bge .L0803AECC
.L0803AF9E:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	bge .L0803AEB8
.L0803AFA4:
	ldr r7, [sp, #8]
	cmp r7, #0xff
	bne .L0803AFC8
	movs r0, #0
	b .L0803AFCA
	.align 2, 0
.L0803AFB0: .4byte gMapSize
.L0803AFB4: .4byte gMapRange
.L0803AFB8: .4byte gMapTerrain
.L0803AFBC: .4byte gMapUnit
.L0803AFC0: .4byte gActiveUnit
.L0803AFC4: .4byte GetPositionRangeWeight
.L0803AFC8:
	movs r0, #1
.L0803AFCA:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803AE94

	THUMB_FUNC_START AiSomethingCheckPick
AiSomethingCheckPick: @ 0x0803AFDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	mov r9, r1
	mov r8, r2
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r0, .L0803B050  @ gMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge .L0803B004
	b .L0803B1DA
.L0803B004:
	movs r4, #1
	ldr r0, [sp, #4]
	ands r0, r4
	str r0, [sp, #0x10]
.L0803B00C:
	ldr r0, .L0803B050  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge .L0803B01A
	b .L0803B1D2
.L0803B01A:
	lsls r2, r7, #2
	mov sl, r2
	mov r5, sp
	movs r4, #2
	ldr r0, [sp, #4]
	ands r0, r4
	str r0, [sp, #0x14]
.L0803B028:
	ldr r0, .L0803B054  @ gMapRange
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bls .L0803B03A
	b .L0803B1CA
.L0803B03A:
	ldr r0, .L0803B058  @ gMapTerrain
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq .L0803B05C
	cmp r0, #0x21
	beq .L0803B08C
	b .L0803B1CA
	.align 2, 0
.L0803B050: .4byte gMapSize
.L0803B054: .4byte gMapRange
.L0803B058: .4byte gMapTerrain
.L0803B05C:
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	movs r0, #8
	ldr r1, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq .L0803B072
	b .L0803B1CA
.L0803B072:
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, .L0803B088  @ GetPositionRangeWeight
	mov r3, sp
	bl GetLesserWeightedAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803B086
	b .L0803B1CA
.L0803B086:
	b .L0803B134
	.align 2, 0
.L0803B088: .4byte GetPositionRangeWeight
.L0803B08C:
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	movs r0, #4
	ldr r2, [sp, #4]
	ands r0, r2
	cmp r0, #0
	beq .L0803B0A2
	b .L0803B1CA
.L0803B0A2:
	strh r6, [r5]
	mov r4, sp
	strh r7, [r4, #2]
	ldr r0, .L0803B128  @ gMapMovement
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r2, [r0]
	ldr r0, .L0803B12C  @ gActiveUnit
	ldr r3, [r0]
	movs r1, #0x1d
	ldrsb r1, [r3, r1]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bgt .L0803B134
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq .L0803B0FA
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, .L0803B130  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803B0FA
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803B1CA
.L0803B0FA:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq .L0803B110
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl AiAreEnemiesWithin3Tiles
	cmp r0, #0
	bne .L0803B1CA
.L0803B110:
	ldrh r0, [r5]
	mov r4, r9
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	mov r0, r8
	cmp r0, #0
	beq .L0803B210
	strh r6, [r0]
	strh r7, [r0, #2]
	b .L0803B210
	.align 2, 0
.L0803B128: .4byte gMapMovement
.L0803B12C: .4byte gActiveUnit
.L0803B130: .4byte gMapUnit
.L0803B134:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq .L0803B16A
	movs r2, #2
	ldrsh r0, [r5, r2]
	ldr r1, .L0803B200  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803B16A
	ldr r0, .L0803B204  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803B1CA
.L0803B16A:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq .L0803B180
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl AiAreEnemiesWithin3Tiles
	cmp r0, #0
	bne .L0803B1CA
.L0803B180:
	mov r2, sp
	movs r4, #2
	ldrsh r0, [r2, r4]
	ldr r1, .L0803B208  @ gMapRange
	ldr r3, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble .L0803B1CA
	ldrh r0, [r5]
	mov r4, r9
	strh r0, [r4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
	mov r4, r8
	cmp r4, #0
	beq .L0803B1CA
	strh r6, [r4]
	strh r7, [r4, #2]
.L0803B1CA:
	subs r6, #1
	cmp r6, #0
	blt .L0803B1D2
	b .L0803B028
.L0803B1D2:
	subs r7, #1
	cmp r7, #0
	blt .L0803B1DA
	b .L0803B00C
.L0803B1DA:
	movs r0, #0
	cmp r0, #0
	bne .L0803B1E8
	ldr r0, .L0803B20C  @ gAiSt
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
.L0803B1E8:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne .L0803B1F6
	ldr r0, .L0803B20C  @ gAiSt
	adds r0, #0x86
	movs r1, #5
	strb r1, [r0]
.L0803B1F6:
	ldr r1, [sp, #8]
	cmp r1, #0xff
	bne .L0803B210
	movs r0, #0
	b .L0803B212
	.align 2, 0
.L0803B200: .4byte gMapUnit
.L0803B204: .4byte gActiveUnit
.L0803B208: .4byte gMapRange
.L0803B20C: .4byte gAiSt
.L0803B210:
	movs r0, #1
.L0803B212:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiSomethingCheckPick

	THUMB_FUNC_START func_0803B224
func_0803B224: @ 0x0803B224
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r1, .L0803B28C  @ gMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	cmp r2, #0
	blt .L0803B280
	movs r3, #0
	ldrsh r7, [r1, r3]
	ldr r0, .L0803B290  @ gMapRange
	mov r8, r0
	ldr r3, .L0803B294  @ gMapUnit
	mov ip, r3
.L0803B244:
	subs r1, r7, #1
	subs r5, r2, #1
	cmp r1, #0
	blt .L0803B27A
	mov r3, r8
	ldr r0, [r3]
	lsls r2, r2, #2
	adds r0, r2, r0
	ldr r3, [r0]
	mov r6, ip
.L0803B258:
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803B274
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803B274
	adds r4, #1
.L0803B274:
	subs r1, #1
	cmp r1, #0
	bge .L0803B258
.L0803B27A:
	adds r2, r5, #0
	cmp r2, #0
	bge .L0803B244
.L0803B280:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803B28C: .4byte gMapSize
.L0803B290: .4byte gMapRange
.L0803B294: .4byte gMapUnit

	THUMB_FUNC_END func_0803B224

	THUMB_FUNC_START func_0803B298
func_0803B298: @ 0x0803B298
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, .L0803B304  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt .L0803B2FA
.L0803B2A8:
	ldr r0, .L0803B304  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt .L0803B2F4
	lsls r5, r1, #2
.L0803B2B8:
	ldr r0, .L0803B308  @ gMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803B2EE
	ldr r0, .L0803B30C  @ gMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803B2EE
	ldr r0, .L0803B310  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803B2EE
	adds r6, #1
.L0803B2EE:
	subs r4, #1
	cmp r4, #0
	bge .L0803B2B8
.L0803B2F4:
	adds r1, r7, #0
	cmp r1, #0
	bge .L0803B2A8
.L0803B2FA:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803B304: .4byte gMapSize
.L0803B308: .4byte gMapRange
.L0803B30C: .4byte gMapUnit
.L0803B310: .4byte gActiveUnitId

	THUMB_FUNC_END func_0803B298

	THUMB_FUNC_START func_0803B314
func_0803B314: @ 0x0803B314
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, .L0803B380  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt .L0803B378
.L0803B324:
	ldr r0, .L0803B380  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt .L0803B372
	lsls r5, r1, #2
.L0803B334:
	ldr r0, .L0803B384  @ gMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803B36C
	ldr r0, .L0803B388  @ gMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803B36C
	ldr r0, .L0803B38C  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803B36C
	adds r6, #1
.L0803B36C:
	subs r4, #1
	cmp r4, #0
	bge .L0803B334
.L0803B372:
	adds r1, r7, #0
	cmp r1, #0
	bge .L0803B324
.L0803B378:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803B380: .4byte gMapSize
.L0803B384: .4byte gMapRange
.L0803B388: .4byte gMapUnit
.L0803B38C: .4byte gActiveUnitId

	THUMB_FUNC_END func_0803B314

	THUMB_FUNC_START func_0803B390
func_0803B390: @ 0x0803B390
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, .L0803B40C  @ gUnknown_085A80BC
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, .L0803B410  @ 0x0000270F
	cmp r0, r2
	beq .L0803B3FE
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	ldr r5, .L0803B414  @ gMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r9, r2
	ldr r0, .L0803B418  @ gMapUnit
	mov r8, r0
.L0803B3C2:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, ip
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge .L0803B3F6
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge .L0803B3F6
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803B3F6
	adds r6, #1
.L0803B3F6:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r9
	bne .L0803B3C2
.L0803B3FE:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803B40C: .4byte gUnknown_085A80BC
.L0803B410: .4byte 0x0000270F
.L0803B414: .4byte gMapSize
.L0803B418: .4byte gMapUnit

	THUMB_FUNC_END func_0803B390

	THUMB_FUNC_START AiAreEnemiesWithin3Tiles
AiAreEnemiesWithin3Tiles: @ 0x0803B41C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, .L0803B4A4  @ gUnknown_085A80BC
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, .L0803B4A8  @ 0x0000270F
	cmp r0, r2
	beq .L0803B496
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, .L0803B4AC  @ gMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r9, r2
.L0803B44A:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge .L0803B48E
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge .L0803B48E
	ldr r0, .L0803B4B0  @ gMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803B48E
	ldr r0, .L0803B4B4  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803B48E
	adds r6, #1
.L0803B48E:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, r9
	bne .L0803B44A
.L0803B496:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803B4A4: .4byte gUnknown_085A80BC
.L0803B4A8: .4byte 0x0000270F
.L0803B4AC: .4byte gMapSize
.L0803B4B0: .4byte gMapUnit
.L0803B4B4: .4byte gActiveUnitId

	THUMB_FUNC_END AiAreEnemiesWithin3Tiles

	THUMB_FUNC_START func_0803B4B8
func_0803B4B8: @ 0x0803B4B8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, .L0803B544  @ gUnknown_085A80BC
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, .L0803B548  @ 0x0000270F
	cmp r0, r2
	beq .L0803B534
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, .L0803B54C  @ gMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r9, r2
.L0803B4E6:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge .L0803B52C
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge .L0803B52C
	ldr r0, .L0803B550  @ gMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803B52C
	ldr r0, .L0803B554  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803B52C
	adds r6, #1
.L0803B52C:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, r9
	bne .L0803B4E6
.L0803B534:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803B544: .4byte gUnknown_085A80BC
.L0803B548: .4byte 0x0000270F
.L0803B54C: .4byte gMapSize
.L0803B550: .4byte gMapUnit
.L0803B554: .4byte gActiveUnitId

	THUMB_FUNC_END func_0803B4B8

	THUMB_FUNC_START FillMovementAndRangeMapForItem
FillMovementAndRangeMapForItem: @ 0x0803B558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	bl MapFloodUnit
	ldr r0, .L0803B5EC  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L0803B5F0  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt .L0803B5DC
.L0803B582:
	ldr r0, .L0803B5F0  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt .L0803B5D6
	lsls r1, r7, #0x10
	mov r8, r1
.L0803B596:
	ldr r0, .L0803B5F4  @ gMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803B5D0
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, r9
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r9
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapIncInBoundedRange
.L0803B5D0:
	subs r6, #1
	cmp r6, #0
	bge .L0803B596
.L0803B5D6:
	mov r7, sl
	cmp r7, #0
	bge .L0803B582
.L0803B5DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B5EC: .4byte gMapRange
.L0803B5F0: .4byte gMapSize
.L0803B5F4: .4byte gMapMovement

	THUMB_FUNC_END FillMovementAndRangeMapForItem

	THUMB_FUNC_START func_0803B5F8
func_0803B5F8: @ 0x0803B5F8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetUnitPower
	cmp r0, #0x14
	bgt .L0803B60E
	adds r0, r4, #0
	bl GetUnitPower
	adds r7, r0, #0
	b .L0803B610
.L0803B60E:
	movs r7, #0x14
.L0803B610:
	adds r0, r4, #0
	bl MapFloodUnit
	ldr r0, .L0803B66C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L0803B670  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803B664
.L0803B62C:
	ldr r0, .L0803B670  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt .L0803B65E
.L0803B63A:
	ldr r0, .L0803B674  @ gMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803B658
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #1
	bl MapAddInRange
.L0803B658:
	subs r4, #1
	cmp r4, #0
	bge .L0803B63A
.L0803B65E:
	adds r5, r6, #0
	cmp r5, #0
	bge .L0803B62C
.L0803B664:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B66C: .4byte gMapRange
.L0803B670: .4byte gMapSize
.L0803B674: .4byte gMapMovement

	THUMB_FUNC_END func_0803B5F8

	THUMB_FUNC_START func_0803B678
func_0803B678: @ 0x0803B678
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	bl MapFloodUnit
	ldr r0, .L0803B70C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L0803B710  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt .L0803B6FC
.L0803B6A2:
	ldr r0, .L0803B710  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt .L0803B6F6
	lsls r1, r7, #0x10
	mov r8, r1
.L0803B6B6:
	ldr r0, .L0803B714  @ gMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803B6F0
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, r9
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r9
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapIncInBoundedRange
.L0803B6F0:
	subs r6, #1
	cmp r6, #0
	bge .L0803B6B6
.L0803B6F6:
	mov r7, sl
	cmp r7, #0
	bge .L0803B6A2
.L0803B6FC:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803B70C: .4byte gMapRange
.L0803B710: .4byte gMapSize
.L0803B714: .4byte gMapMovement

	THUMB_FUNC_END func_0803B678

	THUMB_FUNC_START GetLesserWeightedAdjacentPosition
GetLesserWeightedAdjacentPosition: @ 0x0803B718
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r3, #0
	mov r9, r2
	movs r0, #0xff
	mov r8, r0
	ldr r1, .L0803B780  @ gUnknown_080D80F4
	mov r0, sp
	movs r2, #8
	bl memcpy
	mov r4, sp
	movs r2, #3
.L0803B73C:
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r7, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r6, r1
	str r2, [sp, #8]
	bl _call_via_r9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #8]
	cmp r0, #0xff
	beq .L0803B76E
	cmp r8, r0
	bls .L0803B76E
	mov r8, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, r7
	strh r0, [r5]
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r0, r6
	strh r0, [r5, #2]
.L0803B76E:
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge .L0803B73C
	mov r0, r8
	cmp r0, #0xff
	bne .L0803B784
	movs r0, #0
	b .L0803B786
	.align 2, 0
.L0803B780: .4byte gUnknown_080D80F4
.L0803B784:
	movs r0, #1
.L0803B786:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetLesserWeightedAdjacentPosition

	THUMB_FUNC_START GetItemAiStealPriority
GetItemAiStealPriority: @ 0x0803B794
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	ldr r2, .L0803B7C0  @ gUnknown_085A83A4
	ldrh r1, [r2]
	ldr r3, .L0803B7C4  @ 0x0000FFFF
	cmp r1, r3
	beq .L0803B7B4
.L0803B7A6:
	cmp r1, r4
	beq .L0803B7B8
	adds r2, #2
	adds r0, #1
	ldrh r1, [r2]
	cmp r1, r3
	bne .L0803B7A6
.L0803B7B4:
	movs r0, #1
	negs r0, r0
.L0803B7B8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0803B7C0: .4byte gUnknown_085A83A4
.L0803B7C4: .4byte 0x0000FFFF

	THUMB_FUNC_END GetItemAiStealPriority

	THUMB_FUNC_START AiGetBestItemSlotIndexToSteal
AiGetBestItemSlotIndexToSteal: @ 0x0803B7C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xff
	movs r5, #0xff
	movs r4, #0
.L0803B7D2:
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq .L0803B7FE
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	bl GetItemAiStealPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bcc .L0803B7F8
	adds r6, r0, #0
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
.L0803B7F8:
	adds r4, #1
	cmp r4, #4
	ble .L0803B7D2
.L0803B7FE:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiGetBestItemSlotIndexToSteal

	THUMB_FUNC_START AiFindUnitSafestTileToMoveTo
AiFindUnitSafestTileToMoveTo: @ 0x0803B808
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r9, r1
	movs r0, #0xff
	mov sl, r0
	ldr r0, .L0803B84C  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0803B854
	ldr r4, .L0803B850  @ gMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl MapFill
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b .L0803B85A
	.align 2, 0
.L0803B84C: .4byte gAiSt
.L0803B850: .4byte gMapMovement
.L0803B854:
	adds r0, r5, #0
	bl MapFloodUnit
.L0803B85A:
	ldr r1, .L0803B8D8  @ gMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803B8CE
.L0803B866:
	ldr r1, .L0803B8D8  @ gMapSize
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r3, #0
	blt .L0803B8C8
	lsls r4, r5, #2
	ldr r1, .L0803B8DC  @ gMapMovement
	mov ip, r1
	ldr r7, .L0803B8E0  @ gMapUnit
	ldr r6, .L0803B8E4  @ gActiveUnitId
	ldr r1, .L0803B8E8  @ gMapOther
.L0803B882:
	mov r2, ip
	ldr r0, [r2]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803B8C2
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0803B8A6
	ldrb r2, [r6]
	cmp r0, r2
	bne .L0803B8C2
.L0803B8A6:
	ldr r0, [r1]
	adds r2, r4, r0
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp sl, r0
	bcc .L0803B8C2
	mov r0, r9
	strh r3, [r0]
	strh r5, [r0, #2]
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	mov sl, r0
.L0803B8C2:
	subs r3, #1
	cmp r3, #0
	bge .L0803B882
.L0803B8C8:
	mov r5, r8
	cmp r5, #0
	bge .L0803B866
.L0803B8CE:
	mov r1, sl
	cmp r1, #0xff
	bne .L0803B8EC
	movs r0, #0
	b .L0803B8EE
	.align 2, 0
.L0803B8D8: .4byte gMapSize
.L0803B8DC: .4byte gMapMovement
.L0803B8E0: .4byte gMapUnit
.L0803B8E4: .4byte gActiveUnitId
.L0803B8E8: .4byte gMapOther
.L0803B8EC:
	movs r0, #1
.L0803B8EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiFindUnitSafestTileToMoveTo

	THUMB_FUNC_START AiGetLootingParameters
AiGetLootingParameters: @ 0x0803B8FC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r5, .L0803B97C  @ gActiveUnit
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, .L0803B980  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	ldr r2, [r5]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r3, #0xb
	ldrsb r3, [r2, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	adds r0, r4, #0
	bl AiGetActiveUniChestKeyItemSlot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r6, .L0803B984  @ gUnknown_085A8120
	cmp r0, #1
	bne .L0803B93C
	ldr r6, .L0803B988  @ gUnknown_085A8124
.L0803B93C:
	adds r0, r6, #0
	movs r1, #1
	adds r2, r7, #0
	bl AiFindClosestTileInRangeWithListedTerrain
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803B98C
	ldr r0, [r5]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodExtendedOnRangeMap
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl AiFindClosestTileInRangeWithListedTerrain
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803B98C
	movs r0, #0
	b .L0803B98E
	.align 2, 0
.L0803B97C: .4byte gActiveUnit
.L0803B980: .4byte gMapRange
.L0803B984: .4byte gUnknown_085A8120
.L0803B988: .4byte gUnknown_085A8124
.L0803B98C:
	movs r0, #1
.L0803B98E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiGetLootingParameters

	THUMB_FUNC_START AiGetActiveUniChestKeyItemSlot
AiGetActiveUniChestKeyItemSlot: @ 0x0803B994
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	strb r5, [r6]
	ldr r4, .L0803B9B4  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	bne .L0803B9BC
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #0xa]
	b .L0803B9FE
	.align 2, 0
.L0803B9B4: .4byte gActiveUnit
.L0803B9B8:
	movs r0, #1
	b .L0803BA00
.L0803B9BC:
	movs r5, #0
	adds r7, r4, #0
.L0803B9C0:
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq .L0803B9FE
	strb r5, [r6]
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x69
	beq .L0803B9B8
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x6b
	bne .L0803B9F8
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	bne .L0803B9B8
.L0803B9F8:
	adds r5, #1
	cmp r5, #4
	ble .L0803B9C0
.L0803B9FE:
	movs r0, #0
.L0803BA00:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiGetActiveUniChestKeyItemSlot

	THUMB_FUNC_START AiTryMoveTowards
AiTryMoveTowards: @ 0x0803BA08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, .L0803BA64  @ gActiveUnit
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne .L0803BA68
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne .L0803BA68
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
	b .L0803BBC0
	.align 2, 0
.L0803BA64: .4byte gActiveUnit
.L0803BA68:
	cmp r4, #0
	beq .L0803BA8C
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, .L0803BA88  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapFloodExtendedOnRangeMap
	b .L0803BA9C
	.align 2, 0
.L0803BA88: .4byte gActiveUnit
.L0803BA8C:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, .L0803BACC  @ gActiveUnit
	ldr r2, [r2]
	bl func_080410C4
.L0803BA9C:
	ldr r4, .L0803BACC  @ gActiveUnit
	ldr r0, [r4]
	bl MapFloodUnit
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, .L0803BAD0  @ gMapRange
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r9, r0
	ldr r1, .L0803BAD4  @ 0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, .L0803BAD8  @ gMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b .L0803BB98
	.align 2, 0
.L0803BACC: .4byte gActiveUnit
.L0803BAD0: .4byte gMapRange
.L0803BAD4: .4byte 0x0000FFFF
.L0803BAD8: .4byte gMapSize
.L0803BADC:
	ldr r0, .L0803BBD0  @ gMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt .L0803BB94
	asrs r0, r7, #0xe
	mov r8, r0
.L0803BAF2:
	ldr r0, .L0803BBD4  @ gMapMovement
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0x78
	bhi .L0803BB88
	ldr r0, .L0803BBD8  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq .L0803BB1E
	ldr r0, .L0803BBDC  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803BB88
.L0803BB1E:
	mov r1, sl
	cmp r1, #0
	bne .L0803BB52
	ldr r0, .L0803BBE0  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, .L0803BBE4  @ gAiSt
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge .L0803BB52
	ldr r0, .L0803BBE8  @ gMapOther
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne .L0803BB88
.L0803BB52:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl IsAiTileSafe
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq .L0803BB88
	ldr r0, .L0803BBEC  @ gMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, r9
	bhi .L0803BB88
	adds r1, r0, #0
	mov r9, r1
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
.L0803BB88:
	ldr r1, .L0803BBF0  @ 0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge .L0803BAF2
.L0803BB94:
	ldr r1, .L0803BBF0  @ 0xFFFF0000
	adds r0, r7, r1
.L0803BB98:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0803BADC
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L0803BBC0
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
.L0803BBC0:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BBD0: .4byte gMapSize
.L0803BBD4: .4byte gMapMovement
.L0803BBD8: .4byte gMapUnit
.L0803BBDC: .4byte gActiveUnitId
.L0803BBE0: .4byte gActiveUnit
.L0803BBE4: .4byte gAiSt
.L0803BBE8: .4byte gMapOther
.L0803BBEC: .4byte gMapRange
.L0803BBF0: .4byte 0xFFFF0000

	THUMB_FUNC_END AiTryMoveTowards

	THUMB_FUNC_START func_0803BBF4
func_0803BBF4: @ 0x0803BBF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, .L0803BC50  @ gActiveUnit
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne .L0803BC54
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne .L0803BC54
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
	b .L0803BDAC
	.align 2, 0
.L0803BC50: .4byte gActiveUnit
.L0803BC54:
	cmp r4, #0
	beq .L0803BC78
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, .L0803BC74  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl AiMapRangeFillMovementWithPassableWalls
	b .L0803BC88
	.align 2, 0
.L0803BC74: .4byte gActiveUnit
.L0803BC78:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, .L0803BCB8  @ gActiveUnit
	ldr r2, [r2]
	bl func_08040F54
.L0803BC88:
	ldr r4, .L0803BCB8  @ gActiveUnit
	ldr r0, [r4]
	bl MapFloodUnit
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, .L0803BCBC  @ gMapRange
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r9, r0
	ldr r1, .L0803BCC0  @ 0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, .L0803BCC4  @ gMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b .L0803BD84
	.align 2, 0
.L0803BCB8: .4byte gActiveUnit
.L0803BCBC: .4byte gMapRange
.L0803BCC0: .4byte 0x0000FFFF
.L0803BCC4: .4byte gMapSize
.L0803BCC8:
	ldr r0, .L0803BDBC  @ gMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt .L0803BD80
	asrs r0, r7, #0xe
	mov r8, r0
.L0803BCDE:
	ldr r0, .L0803BDC0  @ gMapMovement
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0x78
	bhi .L0803BD74
	ldr r0, .L0803BDC4  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq .L0803BD0A
	ldr r0, .L0803BDC8  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803BD74
.L0803BD0A:
	mov r1, sl
	cmp r1, #0
	bne .L0803BD3E
	ldr r0, .L0803BDCC  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, .L0803BDD0  @ gAiSt
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge .L0803BD3E
	ldr r0, .L0803BDD4  @ gMapOther
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne .L0803BD74
.L0803BD3E:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl IsAiTileSafe
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq .L0803BD74
	ldr r0, .L0803BDD8  @ gMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, r9
	bhi .L0803BD74
	adds r1, r0, #0
	mov r9, r1
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
.L0803BD74:
	ldr r1, .L0803BDDC  @ 0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge .L0803BCDE
.L0803BD80:
	ldr r1, .L0803BDDC  @ 0xFFFF0000
	adds r0, r7, r1
.L0803BD84:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0803BCC8
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L0803BDAC
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
.L0803BDAC:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803BDBC: .4byte gMapSize
.L0803BDC0: .4byte gMapMovement
.L0803BDC4: .4byte gMapUnit
.L0803BDC8: .4byte gActiveUnitId
.L0803BDCC: .4byte gActiveUnit
.L0803BDD0: .4byte gAiSt
.L0803BDD4: .4byte gMapOther
.L0803BDD8: .4byte gMapRange
.L0803BDDC: .4byte 0xFFFF0000

	THUMB_FUNC_END func_0803BBF4

	THUMB_FUNC_START FindUnitClosestValidPosition
FindUnitClosestValidPosition: @ 0x0803BDE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	adds r6, r3, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	asrs r5, r2, #0x10
	ldr r2, .L0803BE34  @ gMapUnit
	ldr r0, [r2]
	lsls r2, r5, #2
	adds r0, r2, r0
	lsrs r4, r1, #0x10
	mov r8, r4
	asrs r4, r1, #0x10
	ldr r1, [r0]
	adds r1, r1, r4
	ldr r7, .L0803BE38  @ gMapOther
	ldr r0, [r7]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	ldr r0, .L0803BE3C  @ gMapHidden
	ldr r0, [r0]
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r4
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne .L0803BE40
	mov r1, r8
	strh r1, [r6]
	strh r3, [r6, #2]
	b .L0803BF38
	.align 2, 0
.L0803BE34: .4byte gMapUnit
.L0803BE38: .4byte gMapOther
.L0803BE3C: .4byte gMapHidden
.L0803BE40:
	ldr r0, [sp, #8]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodExtendedOnRangeMap
	ldr r0, [sp, #8]
	bl MapFloodUnitExtended
	movs r2, #0x7c
	str r2, [sp]
	ldr r0, .L0803BE68  @ 0x0000FFFF
	strh r0, [r6]
	ldr r1, .L0803BE6C  @ gMapSize
	ldrh r0, [r1, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b .L0803BF06
	.align 2, 0
.L0803BE68: .4byte 0x0000FFFF
.L0803BE6C: .4byte gMapSize
.L0803BE70:
	ldr r4, .L0803BF1C  @ gMapSize
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r5, #0x10
	str r7, [sp, #8]
	cmp r1, #0
	blt .L0803BF00
	asrs r3, r7, #0xe
	ldr r0, .L0803BF20  @ gMapMovement
	str r0, [sp, #4]
	ldr r2, .L0803BF24  @ gMapUnit
	mov sl, r2
	ldr r7, .L0803BF28  @ gMapOther
	mov r9, r7
	ldr r0, .L0803BF2C  @ gMapHidden
	mov r8, r0
	ldr r2, .L0803BF30  @ gMapRange
	mov ip, r2
.L0803BE9A:
	ldr r7, [sp, #4]
	ldr r0, [r7]
	adds r0, r3, r0
	asrs r2, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803BEF2
	mov r1, sl
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, r1, r2
	mov r7, r9
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	mov r7, r8
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne .L0803BEF2
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r2, [sp]
	cmp r0, r2
	bhi .L0803BEF2
	adds r1, r0, #0
	str r1, [sp]
	strh r4, [r6]
	strh r5, [r6, #2]
.L0803BEF2:
	lsls r0, r4, #0x10
	ldr r4, .L0803BF34  @ 0xFFFF0000
	adds r0, r0, r4
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge .L0803BE9A
.L0803BF00:
	ldr r7, [sp, #8]
	ldr r1, .L0803BF34  @ 0xFFFF0000
	adds r0, r7, r1
.L0803BF06:
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge .L0803BE70
	movs r2, #0
	ldrsh r1, [r6, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0803BF38
	movs r0, #0
	b .L0803BF3A
	.align 2, 0
.L0803BF1C: .4byte gMapSize
.L0803BF20: .4byte gMapMovement
.L0803BF24: .4byte gMapUnit
.L0803BF28: .4byte gMapOther
.L0803BF2C: .4byte gMapHidden
.L0803BF30: .4byte gMapRange
.L0803BF34: .4byte 0xFFFF0000
.L0803BF38:
	movs r0, #1
.L0803BF3A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END FindUnitClosestValidPosition

	THUMB_FUNC_START func_0803BF4C
func_0803BF4C: @ 0x0803BF4C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r2, .L0803BF58  @ gUnknown_085A8150
	b .L0803BF74
	.align 2, 0
.L0803BF58: .4byte gUnknown_085A8150
.L0803BF5C:
	ldr r1, [r2]
	b .L0803BF66
.L0803BF60:
	cmp r0, r4
	beq .L0803BF7A
	adds r1, #1
.L0803BF66:
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0803BF60
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #4
.L0803BF74:
	ldr r0, [r2]
	cmp r0, #0
	bne .L0803BF5C
.L0803BF7A:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803BF4C

	THUMB_FUNC_START AiIsCharacterOnMap
AiIsCharacterOnMap: @ 0x0803BF84
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
.L0803BF8C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L0803BFC0
	ldr r0, [r1]
	cmp r0, #0
	beq .L0803BFC0
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne .L0803BFC0
	ldr r1, [r1, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0803BFB2
.L0803BFAE:
	movs r0, #1
	b .L0803BFC8
.L0803BFB2:
	ldr r0, .L0803BFBC  @ 0x00010005
	ands r1, r0
	cmp r1, #0
	bne .L0803BFC6
	b .L0803BFAE
	.align 2, 0
.L0803BFBC: .4byte 0x00010005
.L0803BFC0:
	adds r4, #1
	cmp r4, #0xbf
	ble .L0803BF8C
.L0803BFC6:
	movs r0, #0
.L0803BFC8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiIsCharacterOnMap

	THUMB_FUNC_START AiArePointsWithinDistance
AiArePointsWithinDistance: @ 0x0803BFD0
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r1, r0, r2
	cmp r1, #0
	bge .L0803BFF2
	subs r1, r2, r0
.L0803BFF2:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	subs r0, r2, r3
	cmp r0, #0
	bge .L0803BFFE
	subs r0, r6, r2
.L0803BFFE:
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bls .L0803C00C
	movs r0, #0
	b .L0803C00E
.L0803C00C:
	movs r0, #1
.L0803C00E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiArePointsWithinDistance

	THUMB_FUNC_START AiIsPositionLootable
AiIsPositionLootable: @ 0x0803C014
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, .L0803C03C  @ gMapTerrain
	ldr r2, [r2]
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x21
	beq .L0803C04A
	cmp r0, #0x21
	bgt .L0803C040
	cmp r0, #3
	beq .L0803C058
	b .L0803C05C
	.align 2, 0
.L0803C03C: .4byte gMapTerrain
.L0803C040:
	cmp r0, #0x24
	beq .L0803C058
	cmp r0, #0x37
	bne .L0803C05C
	b .L0803C058
.L0803C04A:
	mov r0, sp
	bl AiGetActiveUniChestKeyItemSlot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803C05C
.L0803C058:
	movs r0, #1
	b .L0803C05E
.L0803C05C:
	movs r0, #0
.L0803C05E:
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_END AiIsPositionLootable

	THUMB_FUNC_START GenBlueUnitAiStats
GenBlueUnitAiStats: @ 0x0803C064
	push {r4, r5, r6, r7, lr}
	ldr r0, .L0803C118  @ gAiSt
	adds r0, #0x85
	movs r1, #0
	strb r1, [r0]
	movs r4, #1
.L0803C070:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	cmp r5, #0
	beq .L0803C10A
	ldr r0, [r5]
	cmp r0, #0
	beq .L0803C10A
	ldr r0, [r5, #0xc]
	ldr r1, .L0803C11C  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne .L0803C10A
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x12]
	ldrb r1, [r5, #0x1d]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, .L0803C118  @ gAiSt
	adds r0, #0x85
	ldrb r2, [r0]
	cmp r1, r2
	bls .L0803C0A6
	strb r1, [r0]
.L0803C0A6:
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq .L0803C104
.L0803C0AE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803C0CA
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803C0F0
.L0803C0CA:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq .L0803C0E0
	ldrb r1, [r5, #0xa]
	movs r0, #1
	orrs r0, r1
	strb r0, [r5, #0xa]
.L0803C0E0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetupUnitStatusStaffAIFlags
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetupUnitHealStaffAIFlags
.L0803C0F0:
	adds r6, #1
	cmp r6, #4
	bgt .L0803C104
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L0803C0AE
.L0803C104:
	adds r0, r5, #0
	bl UpdateNumberOfAlliedUnitsWithin8Tiles
.L0803C10A:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble .L0803C070
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C118: .4byte gAiSt
.L0803C11C: .4byte 0x00010005

	THUMB_FUNC_END GenBlueUnitAiStats

	THUMB_FUNC_START SetupUnitStatusStaffAIFlags
SetupUnitStatusStaffAIFlags: @ 0x0803C120
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq .L0803C162
	movs r4, #2
	adds r0, r5, #0
	bl GetItemIid
	cmp r0, #0x52
	beq .L0803C156
	cmp r0, #0x52
	bgt .L0803C14C
	cmp r0, #0x51
	beq .L0803C152
	b .L0803C15C
.L0803C14C:
	cmp r0, #0x53
	beq .L0803C15A
	b .L0803C15C
.L0803C152:
	movs r4, #8
	b .L0803C15C
.L0803C156:
	movs r4, #0x10
	b .L0803C15C
.L0803C15A:
	movs r4, #0x20
.L0803C15C:
	ldrb r0, [r6, #0xa]
	orrs r4, r0
	strb r4, [r6, #0xa]
.L0803C162:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetupUnitStatusStaffAIFlags

	THUMB_FUNC_START SetupUnitHealStaffAIFlags
SetupUnitHealStaffAIFlags: @ 0x0803C168
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r5, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0803C18C
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble .L0803C18C
	movs r5, #0x40
.L0803C18C:
	adds r0, r4, #0
	bl GetItemEffect
	cmp r0, #1
	blt .L0803C1A6
	cmp r0, #5
	ble .L0803C1A2
	cmp r0, #0x22
	bgt .L0803C1A6
	cmp r0, #0x21
	blt .L0803C1A6
.L0803C1A2:
	movs r0, #4
	orrs r5, r0
.L0803C1A6:
	ldrb r0, [r6, #0xa]
	orrs r5, r0
	strb r5, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetupUnitHealStaffAIFlags

	THUMB_FUNC_START UpdateNumberOfAlliedUnitsWithin8Tiles
UpdateNumberOfAlliedUnitsWithin8Tiles: @ 0x0803C1B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r0, .L0803C24C  @ gMapMovement
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #1
	movs r3, #8
	bl MapIncInBoundedRange
	ldr r0, .L0803C250  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt .L0803C23A
.L0803C1E6:
	ldr r0, .L0803C250  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt .L0803C234
	lsls r5, r1, #2
.L0803C1F6:
	ldr r0, .L0803C24C  @ gMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803C22E
	ldr r0, .L0803C254  @ gMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803C22E
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803C22E
	movs r0, #1
	add r8, r0
.L0803C22E:
	subs r4, #1
	cmp r4, #0
	bge .L0803C1F6
.L0803C234:
	adds r1, r7, #0
	cmp r1, #0
	bge .L0803C1E6
.L0803C23A:
	adds r0, r6, #0
	adds r0, #0x46
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C24C: .4byte gMapMovement
.L0803C250: .4byte gMapSize
.L0803C254: .4byte gMapUnit

	THUMB_FUNC_END UpdateNumberOfAlliedUnitsWithin8Tiles

	THUMB_FUNC_START SetUnitAiFromDefinition
SetUnitAiFromDefinition: @ 0x0803C258
	adds r3, r0, #0
	ldrb r0, [r1, #0x10]
	adds r2, r3, #0
	adds r2, #0x42
	strb r0, [r2]
	ldrb r2, [r1, #0x11]
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	adds r3, #0x40
	ldrh r0, [r3]
	ldr r2, .L0803C280  @ 0x0000FFF8
	ands r2, r0
	ldrb r0, [r1, #0x12]
	orrs r2, r0
	ldrb r0, [r1, #0x13]
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r3]
	bx lr
	.align 2, 0
.L0803C280: .4byte 0x0000FFF8

	THUMB_FUNC_END SetUnitAiFromDefinition

	THUMB_FUNC_START func_0803C284
func_0803C284: @ 0x0803C284
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	movs r0, #0
	mov r9, r0
	ldr r0, .L0803C338  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt .L0803C32E
.L0803C2A0:
	ldr r0, .L0803C338  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt .L0803C328
	lsls r7, r6, #2
.L0803C2B2:
	ldr r0, .L0803C33C  @ gMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803C322
	ldr r0, .L0803C340  @ gMapRange
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803C322
	ldr r0, .L0803C344  @ gMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq .L0803C2EE
	ldr r0, .L0803C348  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803C322
.L0803C2EE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl AiGetPositionTerrainSafetyWeight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl AiGetPositionUnitSafetyWeight
	adds r4, r4, r0
	ldr r0, .L0803C34C  @ gMapOther
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r1, .L0803C350  @ 0x7FFFFFFF
	adds r4, r4, r1
	cmp r9, r4
	bcs .L0803C322
	mov r0, r8
	strh r5, [r0]
	strh r6, [r0, #2]
	mov r9, r4
.L0803C322:
	subs r5, #1
	cmp r5, #0
	bge .L0803C2B2
.L0803C328:
	mov r6, sl
	cmp r6, #0
	bge .L0803C2A0
.L0803C32E:
	mov r1, r9
	cmp r1, #0
	bne .L0803C354
	movs r0, #0
	b .L0803C356
	.align 2, 0
.L0803C338: .4byte gMapSize
.L0803C33C: .4byte gMapMovement
.L0803C340: .4byte gMapRange
.L0803C344: .4byte gMapUnit
.L0803C348: .4byte gActiveUnitId
.L0803C34C: .4byte gMapOther
.L0803C350: .4byte 0x7FFFFFFF
.L0803C354:
	movs r0, #1
.L0803C356:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803C284

	THUMB_FUNC_START func_0803C364
func_0803C364: @ 0x0803C364
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetCurrentPhase
	adds r5, r0, #0
	adds r4, r5, #1
	b .L0803C39E
.L0803C372:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L0803C39A
	ldr r0, [r2]
	cmp r0, #0
	beq .L0803C39A
	ldr r0, [r2, #0xc]
	ldr r1, .L0803C3AC  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne .L0803C39A
	ldrb r1, [r2, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803C39A
	adds r6, #1
.L0803C39A:
	adds r4, #1
	adds r0, r5, #0
.L0803C39E:
	adds r0, #0x80
	cmp r4, r0
	blt .L0803C372
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0803C3AC: .4byte 0x00010005

	THUMB_FUNC_END func_0803C364

	THUMB_FUNC_START func_0803C3B0
func_0803C3B0: @ 0x0803C3B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r0, .L0803C43C  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt .L0803C430
.L0803C3C4:
	ldr r0, .L0803C43C  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r1, #1
	mov r8, r0
	cmp r4, #0
	blt .L0803C42A
	lsls r5, r1, #2
.L0803C3D6:
	ldr r0, .L0803C440  @ gMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803C424
	ldr r6, .L0803C444  @ gMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803C424
	ldr r0, .L0803C448  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803C424
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	ldrb r1, [r0, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803C424
	adds r7, #1
.L0803C424:
	subs r4, #1
	cmp r4, #0
	bge .L0803C3D6
.L0803C42A:
	mov r1, r8
	cmp r1, #0
	bge .L0803C3C4
.L0803C430:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803C43C: .4byte gMapSize
.L0803C440: .4byte gMapRange
.L0803C444: .4byte gMapUnit
.L0803C448: .4byte gActiveUnitId

	THUMB_FUNC_END func_0803C3B0

	THUMB_FUNC_START func_0803C44C
func_0803C44C: @ 0x0803C44C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
.L0803C452:
	lsls r0, r5, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq .L0803C488
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq .L0803C482
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803C482
	movs r0, #1
	b .L0803C48A
.L0803C482:
	adds r5, #1
	cmp r5, #4
	ble .L0803C452
.L0803C488:
	movs r0, #0
.L0803C48A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803C44C

	THUMB_FUNC_START AiFillMovementMapForUnit
AiFillMovementMapForUnit: @ 0x0803C490
	push {lr}
	adds r2, r0, #0
	ldr r0, .L0803C4AC  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0803C4B0
	adds r0, r2, #0
	movs r1, #0
	bl MapFloodUnitMovement
	b .L0803C4B6
	.align 2, 0
.L0803C4AC: .4byte gAiSt
.L0803C4B0:
	adds r0, r2, #0
	bl MapFloodUnit
.L0803C4B6:
	pop {r0}
	bx r0

	THUMB_FUNC_END AiFillMovementMapForUnit

	THUMB_FUNC_START AiExecAi1
AiExecAi1: @ 0x0803C4BC
	push {r4, lr}
	ldr r3, .L0803C4FC  @ gpAiScriptCurrent
	ldr r2, .L0803C500  @ gUnknown_085A91E4
	ldr r0, .L0803C504  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x42
	ldrb r1, [r1]
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	str r2, [r3]
	adds r0, #0x43
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r2, r2, r1
	str r2, [r3]
	ldr r4, .L0803C508  @ gAiScriptEndedFlag
	movs r1, #1
	strb r1, [r4]
	ldr r2, .L0803C50C  @ gBoolIsAi2
	movs r1, #0
	str r1, [r2]
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0803C4FC: .4byte gpAiScriptCurrent
.L0803C500: .4byte gUnknown_085A91E4
.L0803C504: .4byte gActiveUnit
.L0803C508: .4byte gAiScriptEndedFlag
.L0803C50C: .4byte gBoolIsAi2

	THUMB_FUNC_END AiExecAi1

	THUMB_FUNC_START AiExecFallbackAi1
AiExecFallbackAi1: @ 0x0803C510
	push {r4, lr}
	ldr r1, .L0803C538  @ gpAiScriptCurrent
	ldr r0, .L0803C53C  @ gUnknown_085A812C
	str r0, [r1]
	ldr r4, .L0803C540  @ gAiScriptEndedFlag
	movs r0, #1
	strb r0, [r4]
	ldr r1, .L0803C544  @ gBoolIsAi2
	movs r0, #0
	str r0, [r1]
	ldr r0, .L0803C548  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x43
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0803C538: .4byte gpAiScriptCurrent
.L0803C53C: .4byte gUnknown_085A812C
.L0803C540: .4byte gAiScriptEndedFlag
.L0803C544: .4byte gBoolIsAi2
.L0803C548: .4byte gActiveUnit

	THUMB_FUNC_END AiExecFallbackAi1

	THUMB_FUNC_START AiExecAi2
AiExecAi2: @ 0x0803C54C
	push {r4, lr}
	ldr r3, .L0803C58C  @ gpAiScriptCurrent
	ldr r2, .L0803C590  @ gUnknown_085A91D8
	ldr r0, .L0803C594  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x44
	ldrb r1, [r1]
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	str r2, [r3]
	adds r0, #0x45
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r2, r2, r1
	str r2, [r3]
	ldr r4, .L0803C598  @ gAiScriptEndedFlag
	movs r1, #1
	strb r1, [r4]
	ldr r2, .L0803C59C  @ gBoolIsAi2
	movs r1, #1
	str r1, [r2]
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0803C58C: .4byte gpAiScriptCurrent
.L0803C590: .4byte gUnknown_085A91D8
.L0803C594: .4byte gActiveUnit
.L0803C598: .4byte gAiScriptEndedFlag
.L0803C59C: .4byte gBoolIsAi2

	THUMB_FUNC_END AiExecAi2

	THUMB_FUNC_START AiExecFallbackAi2
AiExecFallbackAi2: @ 0x0803C5A0
	push {r4, lr}
	ldr r1, .L0803C5C8  @ gpAiScriptCurrent
	ldr r0, .L0803C5CC  @ gUnknown_085A813C
	str r0, [r1]
	ldr r4, .L0803C5D0  @ gAiScriptEndedFlag
	movs r0, #1
	strb r0, [r4]
	ldr r1, .L0803C5D4  @ gBoolIsAi2
	movs r0, #1
	str r0, [r1]
	ldr r0, .L0803C5D8  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x45
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0803C5C8: .4byte gpAiScriptCurrent
.L0803C5CC: .4byte gUnknown_085A813C
.L0803C5D0: .4byte gAiScriptEndedFlag
.L0803C5D4: .4byte gBoolIsAi2
.L0803C5D8: .4byte gActiveUnit

	THUMB_FUNC_END AiExecFallbackAi2

	THUMB_FUNC_START AiScript_Exec
AiScript_Exec: @ 0x0803C5DC
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	ldr r1, .L0803C604  @ gUnknown_080D80FC
	mov r0, sp
	movs r2, #0x70
	bl memcpy
	ldr r1, .L0803C608  @ gpAiScriptCurrent
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0x1c
	bls .L0803C618
	ldr r0, .L0803C60C  @ gBoolIsAi2
	ldr r0, [r0]
	cmp r0, #0
	bne .L0803C614
	ldr r0, .L0803C610  @ gUnknown_085A812C
	b .L0803C616
	.align 2, 0
.L0803C604: .4byte gUnknown_080D80FC
.L0803C608: .4byte gpAiScriptCurrent
.L0803C60C: .4byte gBoolIsAi2
.L0803C610: .4byte gUnknown_085A812C
.L0803C614:
	ldr r0, .L0803C63C  @ gUnknown_085A813C
.L0803C616:
	str r0, [r1]
.L0803C618:
	ldr r1, .L0803C640  @ gAiSt
	ldr r0, .L0803C644  @ gpAiScriptCurrent
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	adds r1, #0x7e
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	add sp, #0x70
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C63C: .4byte gUnknown_085A813C
.L0803C640: .4byte gAiSt
.L0803C644: .4byte gpAiScriptCurrent

	THUMB_FUNC_END AiScript_Exec

	THUMB_FUNC_START AiScriptCmd_00_ConditionalGoto
AiScriptCmd_00_ConditionalGoto: @ 0x0803C648
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L0803C678  @ gpAiScriptCurrent
	ldr r2, [r0]
	ldrb r5, [r2, #3]
	movs r4, #0
	ldr r0, [r2, #8]
	ldrb r1, [r2, #1]
	ldr r2, [r2, #4]
	bl AiScriptCompare
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803C6D4
	ldr r0, .L0803C67C  @ gBoolIsAi2
	ldr r0, [r0]
	cmp r0, #0
	bne .L0803C688
	ldr r1, .L0803C680  @ gUnknown_085A91E4
	ldr r0, .L0803C684  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x42
	b .L0803C690
	.align 2, 0
.L0803C678: .4byte gpAiScriptCurrent
.L0803C67C: .4byte gBoolIsAi2
.L0803C680: .4byte gUnknown_085A91E4
.L0803C684: .4byte gActiveUnit
.L0803C688:
	ldr r1, .L0803C6A8  @ gUnknown_085A91D8
	ldr r0, .L0803C6AC  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x44
.L0803C690:
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r5, #0
	beq .L0803C6D0
	lsls r0, r4, #4
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r3, .L0803C6B0  @ gAiScriptEndedFlag
	b .L0803C6C0
	.align 2, 0
.L0803C6A8: .4byte gUnknown_085A91D8
.L0803C6AC: .4byte gActiveUnit
.L0803C6B0: .4byte gAiScriptEndedFlag
.L0803C6B4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r1, r0, r2
	ldrb r0, [r1]
.L0803C6C0:
	cmp r0, #0x1c
	bne .L0803C6B4
	ldrb r0, [r1, #3]
	cmp r0, r5
	bne .L0803C6B4
	adds r0, r4, #1
	strb r0, [r6]
	b .L0803C6DC
.L0803C6D0:
	strb r5, [r6]
	b .L0803C6DA
.L0803C6D4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
.L0803C6DA:
	ldr r3, .L0803C6E8  @ gAiScriptEndedFlag
.L0803C6DC:
	movs r0, #0
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C6E8: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_00_ConditionalGoto

	THUMB_FUNC_START AiScriptCmd_01_FunctionCall
AiScriptCmd_01_FunctionCall: @ 0x0803C6EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, .L0803C710  @ gpCurrentAiFunctionCall
	ldr r0, .L0803C714  @ gpAiScriptCurrent
	ldr r0, [r0]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	bl _call_via_r1
	ldr r1, .L0803C718  @ gAiScriptEndedFlag
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C710: .4byte gpCurrentAiFunctionCall
.L0803C714: .4byte gpAiScriptCurrent
.L0803C718: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_01_FunctionCall

	THUMB_FUNC_START AiScriptCmd_02_ChangeAi
AiScriptCmd_02_ChangeAi: @ 0x0803C71C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, .L0803C77C  @ gpAiScriptCurrent
	ldr r0, [r0]
	ldrb r3, [r0, #1]
	adds r6, r3, #0
	ldrb r4, [r0, #2]
	adds r7, r4, #0
	cmp r3, #0xff
	beq .L0803C740
	ldr r1, .L0803C780  @ gActiveUnit
	ldr r0, [r1]
	adds r0, #0x42
	movs r2, #0
	strb r3, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r2, [r0]
.L0803C740:
	cmp r4, #0xff
	beq .L0803C754
	ldr r1, .L0803C780  @ gActiveUnit
	ldr r0, [r1]
	adds r0, #0x44
	movs r2, #0
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x45
	strb r2, [r0]
.L0803C754:
	ldr r0, .L0803C784  @ gBoolIsAi2
	ldr r0, [r0]
	cmp r0, #0
	bne .L0803C760
	cmp r6, #0xff
	beq .L0803C768
.L0803C760:
	cmp r0, #1
	bne .L0803C76E
	cmp r7, #0xff
	bne .L0803C76E
.L0803C768:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
.L0803C76E:
	ldr r0, .L0803C788  @ gAiSt
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C77C: .4byte gpAiScriptCurrent
.L0803C780: .4byte gActiveUnit
.L0803C784: .4byte gBoolIsAi2
.L0803C788: .4byte gAiSt

	THUMB_FUNC_END AiScriptCmd_02_ChangeAi

	THUMB_FUNC_START AiScriptCmd_03_Goto
AiScriptCmd_03_Goto: @ 0x0803C78C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, .L0803C7AC  @ gpAiScriptCurrent
	ldr r0, [r0]
	ldrb r4, [r0, #3]
	movs r3, #0
	ldr r0, .L0803C7B0  @ gBoolIsAi2
	ldr r0, [r0]
	cmp r0, #0
	bne .L0803C7BC
	ldr r1, .L0803C7B4  @ gUnknown_085A91E4
	ldr r0, .L0803C7B8  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x42
	b .L0803C7C4
	.align 2, 0
.L0803C7AC: .4byte gpAiScriptCurrent
.L0803C7B0: .4byte gBoolIsAi2
.L0803C7B4: .4byte gUnknown_085A91E4
.L0803C7B8: .4byte gActiveUnit
.L0803C7BC:
	ldr r1, .L0803C7DC  @ gUnknown_085A91D8
	ldr r0, .L0803C7E0  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x44
.L0803C7C4:
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r4, #0
	beq .L0803C804
	lsls r0, r3, #4
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r6, .L0803C7E4  @ gAiScriptEndedFlag
	b .L0803C7F4
	.align 2, 0
.L0803C7DC: .4byte gUnknown_085A91D8
.L0803C7E0: .4byte gActiveUnit
.L0803C7E4: .4byte gAiScriptEndedFlag
.L0803C7E8:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #4
	adds r1, r0, r2
	ldrb r0, [r1]
.L0803C7F4:
	cmp r0, #0x1c
	bne .L0803C7E8
	ldrb r0, [r1, #3]
	cmp r0, r4
	bne .L0803C7E8
	adds r0, r3, #1
	strb r0, [r5]
	b .L0803C808
.L0803C804:
	strb r4, [r5]
	ldr r6, .L0803C814  @ gAiScriptEndedFlag
.L0803C808:
	movs r0, #0
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803C814: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_03_Goto

	THUMB_FUNC_START IsUnitEnemyWithActiveUnit
IsUnitEnemyWithActiveUnit: @ 0x0803C818
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803C83C  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803C840
	movs r0, #1
	b .L0803C842
	.align 2, 0
.L0803C83C: .4byte gActiveUnit
.L0803C840:
	movs r0, #0
.L0803C842:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsUnitEnemyWithActiveUnit

	THUMB_FUNC_START IsUnitNotActiveUnit
IsUnitNotActiveUnit: @ 0x0803C848
	push {lr}
	ldr r1, .L0803C858  @ gActiveUnit
	ldr r1, [r1]
	cmp r0, r1
	beq .L0803C85C
	movs r0, #1
	b .L0803C85E
	.align 2, 0
.L0803C858: .4byte gActiveUnit
.L0803C85C:
	movs r0, #0
.L0803C85E:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsUnitNotActiveUnit

	THUMB_FUNC_START IsUnitEnemyAndNotInTheAiInstList
IsUnitEnemyAndNotInTheAiInstList: @ 0x0803C864
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803C89C  @ gpAiScriptCurrent
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl func_0803ACF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803C8A4
	ldr r0, .L0803C8A0  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803C8A4
	movs r0, #1
	b .L0803C8A6
	.align 2, 0
.L0803C89C: .4byte gpAiScriptCurrent
.L0803C8A0: .4byte gActiveUnit
.L0803C8A4:
	movs r0, #0
.L0803C8A6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsUnitEnemyAndNotInTheAiInstList

	THUMB_FUNC_START IsUnitEnemyOrInTheAiInstList
IsUnitEnemyOrInTheAiInstList: @ 0x0803C8AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803C8E4  @ gpAiScriptCurrent
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl func_0803ACF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803C8DE
	ldr r0, .L0803C8E8  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803C8EC
.L0803C8DE:
	movs r0, #1
	b .L0803C8EE
	.align 2, 0
.L0803C8E4: .4byte gpAiScriptCurrent
.L0803C8E8: .4byte gActiveUnit
.L0803C8EC:
	movs r0, #0
.L0803C8EE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsUnitEnemyOrInTheAiInstList

	THUMB_FUNC_START AiIsUnitScriptCharAndEnemyWithActiveUnit
AiIsUnitScriptCharAndEnemyWithActiveUnit: @ 0x0803C8F4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldrb r1, [r0, #4]
	ldr r0, .L0803C924  @ gpAiScriptCurrent
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne .L0803C92C
	ldr r0, .L0803C928  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803C92C
	movs r0, #1
	b .L0803C92E
	.align 2, 0
.L0803C924: .4byte gpAiScriptCurrent
.L0803C928: .4byte gActiveUnit
.L0803C92C:
	movs r0, #0
.L0803C92E:
	pop {r1}
	bx r1

	THUMB_FUNC_END AiIsUnitScriptCharAndEnemyWithActiveUnit

	THUMB_FUNC_START AiIsUnitScriptClassAndEnemyWithActiveUnit
AiIsUnitScriptClassAndEnemyWithActiveUnit: @ 0x0803C934
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldrb r1, [r0, #4]
	ldr r0, .L0803C964  @ gpAiScriptCurrent
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne .L0803C96C
	ldr r0, .L0803C968  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803C96C
	movs r0, #1
	b .L0803C96E
	.align 2, 0
.L0803C964: .4byte gpAiScriptCurrent
.L0803C968: .4byte gActiveUnit
.L0803C96C:
	movs r0, #0
.L0803C96E:
	pop {r1}
	bx r1

	THUMB_FUNC_END AiIsUnitScriptClassAndEnemyWithActiveUnit

	THUMB_FUNC_START AiScriptCmd_04_ActionOnSelectedCharacter
AiScriptCmd_04_ActionOnSelectedCharacter: @ 0x0803C974
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, .L0803C9C4  @ gpAiScriptCurrent
	ldr r1, [r5]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi .L0803C9F4
	ldr r0, .L0803C9C8  @ IsUnitEnemyWithActiveUnit
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne .L0803C9FC
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	bl AiIsCharacterOnMap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803C9DC
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	ldr r0, [r0, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0803C9D0
	ldr r0, .L0803C9CC  @ gAiSt
	adds r0, #0x86
	movs r1, #3
	b .L0803C9E2
	.align 2, 0
.L0803C9C4: .4byte gpAiScriptCurrent
.L0803C9C8: .4byte IsUnitEnemyWithActiveUnit
.L0803C9CC: .4byte gAiSt
.L0803C9D0:
	ldr r0, .L0803C9D8  @ AiIsUnitScriptCharAndEnemyWithActiveUnit
	bl AiTryDoOffensiveAction
	b .L0803C9FC
	.align 2, 0
.L0803C9D8: .4byte AiIsUnitScriptCharAndEnemyWithActiveUnit
.L0803C9DC:
	ldr r0, .L0803C9EC  @ gAiSt
	adds r0, #0x86
	movs r1, #1
.L0803C9E2:
	strb r1, [r0]
	ldr r0, .L0803C9F0  @ gAiScriptEndedFlag
	strb r4, [r0]
	b .L0803C9FC
	.align 2, 0
.L0803C9EC: .4byte gAiSt
.L0803C9F0: .4byte gAiScriptEndedFlag
.L0803C9F4:
	ldr r0, .L0803CA08  @ gAiSt
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
.L0803C9FC:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CA08: .4byte gAiSt

	THUMB_FUNC_END AiScriptCmd_04_ActionOnSelectedCharacter

	THUMB_FUNC_START AiScriptCmd_05_DoStandardAction
AiScriptCmd_05_DoStandardAction: @ 0x0803CA0C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L0803CA40  @ gpAiScriptCurrent
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	cmp r0, r2
	bhi .L0803CA64
	ldr r0, [r1, #8]
	cmp r0, #0
	bne .L0803CA48
	ldr r4, .L0803CA44  @ IsUnitEnemyWithActiveUnit
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803CA6C
	adds r0, r4, #0
	bl AiTryDoOffensiveAction
	b .L0803CA6C
	.align 2, 0
.L0803CA40: .4byte gpAiScriptCurrent
.L0803CA44: .4byte IsUnitEnemyWithActiveUnit
.L0803CA48:
	ldr r0, .L0803CA5C  @ IsUnitEnemyOrInTheAiInstList
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803CA6C
	ldr r0, .L0803CA60  @ IsUnitEnemyAndNotInTheAiInstList
	bl AiTryDoOffensiveAction
	b .L0803CA6C
	.align 2, 0
.L0803CA5C: .4byte IsUnitEnemyOrInTheAiInstList
.L0803CA60: .4byte IsUnitEnemyAndNotInTheAiInstList
.L0803CA64:
	ldr r0, .L0803CA78  @ gAiSt
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
.L0803CA6C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CA78: .4byte gAiSt

	THUMB_FUNC_END AiScriptCmd_05_DoStandardAction

	THUMB_FUNC_START AiScriptCmd_06_DoNothing
AiScriptCmd_06_DoNothing: @ 0x0803CA7C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END AiScriptCmd_06_DoNothing

	THUMB_FUNC_START AiScriptCmd_07_DoStandardActionNoMove
AiScriptCmd_07_DoStandardActionNoMove: @ 0x0803CA84
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L0803CAC0  @ gpAiScriptCurrent
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi .L0803CACC
	ldr r1, .L0803CAC4  @ gAiSt
	adds r1, #0x7b
	ldrb r2, [r1]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1]
	ldr r4, .L0803CAC8  @ IsUnitEnemyWithActiveUnit
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803CAD4
	adds r0, r4, #0
	bl AiTryDoOffensiveAction
	b .L0803CAD4
	.align 2, 0
.L0803CAC0: .4byte gpAiScriptCurrent
.L0803CAC4: .4byte gAiSt
.L0803CAC8: .4byte IsUnitEnemyWithActiveUnit
.L0803CACC:
	ldr r0, .L0803CAE0  @ gAiSt
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
.L0803CAD4:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CAE0: .4byte gAiSt

	THUMB_FUNC_END AiScriptCmd_07_DoStandardActionNoMove

	THUMB_FUNC_START AiScriptCmd_08_DoStandardActionAgainstClass
AiScriptCmd_08_DoStandardActionAgainstClass: @ 0x0803CAE4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L0803CB14  @ gpAiScriptCurrent
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi .L0803CB1C
	ldr r4, .L0803CB18  @ AiIsUnitScriptClassAndEnemyWithActiveUnit
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803CB24
	adds r0, r4, #0
	bl AiTryDoOffensiveAction
	b .L0803CB24
	.align 2, 0
.L0803CB14: .4byte gpAiScriptCurrent
.L0803CB18: .4byte AiIsUnitScriptClassAndEnemyWithActiveUnit
.L0803CB1C:
	ldr r0, .L0803CB30  @ gAiSt
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
.L0803CB24:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CB30: .4byte gAiSt

	THUMB_FUNC_END AiScriptCmd_08_DoStandardActionAgainstClass

	THUMB_FUNC_START AiScriptCmd_09_DoStaffAction
AiScriptCmd_09_DoStaffAction: @ 0x0803CB34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803CB4C  @ IsUnitEnemyWithActiveUnit
	bl AiTryDoStaff
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CB4C: .4byte IsUnitEnemyWithActiveUnit

	THUMB_FUNC_END AiScriptCmd_09_DoStaffAction

	THUMB_FUNC_START AiScriptCmd_0A_DoStaffAction
AiScriptCmd_0A_DoStaffAction: @ 0x0803CB50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803CB68  @ IsUnitEnemyWithActiveUnit
	bl AiTryDoStaff
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CB68: .4byte IsUnitEnemyWithActiveUnit

	THUMB_FUNC_END AiScriptCmd_0A_DoStaffAction

	THUMB_FUNC_START AiScriptCmd_0B_DoStaffAction
AiScriptCmd_0B_DoStaffAction: @ 0x0803CB6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803CB84  @ IsUnitEnemyWithActiveUnit
	bl AiTryDoStaff
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CB84: .4byte IsUnitEnemyWithActiveUnit

	THUMB_FUNC_END AiScriptCmd_0B_DoStaffAction

	THUMB_FUNC_START AiScriptCmd_0C_MoveTowardsSetPoint
AiScriptCmd_0C_MoveTowardsSetPoint: @ 0x0803CB88
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, .L0803CBCC  @ gpAiScriptCurrent
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r1, .L0803CBD0  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne .L0803CBC4
	ldr r2, [r4]
	ldrb r0, [r1, #2]
	ldrb r3, [r2, #1]
	cmp r0, r3
	bne .L0803CBC4
	ldrb r0, [r1, #3]
	ldrb r2, [r2, #3]
	cmp r0, r2
	bne .L0803CBC4
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
.L0803CBC4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CBCC: .4byte gpAiScriptCurrent
.L0803CBD0: .4byte gAiDecision

	THUMB_FUNC_END AiScriptCmd_0C_MoveTowardsSetPoint

	THUMB_FUNC_START AiScriptCmd_0D_MoveTowardsCharacterUntilAdjacent
AiScriptCmd_0D_MoveTowardsCharacterUntilAdjacent: @ 0x0803CBD4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, .L0803CC44  @ gpAiScriptCurrent
	ldr r0, [r6]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindPositionOfCharacter
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0803CC78
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r5, .L0803CC48  @ gAiDecision
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #3]
	str r4, [sp]
	bl AiArePointsWithinDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803CC7E
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl GetUnitByPid
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	movs r0, #0x20
	ands r4, r0
	cmp r4, #0
	beq .L0803CC50
	ldr r0, .L0803CC4C  @ gAiSt
	adds r0, #0x86
	movs r1, #3
	strb r1, [r0]
	b .L0803CC7E
	.align 2, 0
.L0803CC44: .4byte gpAiScriptCurrent
.L0803CC48: .4byte gAiDecision
.L0803CC4C: .4byte gAiSt
.L0803CC50:
	ldrb r0, [r1, #0xb]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	ldr r0, .L0803CC70  @ gAiSt
	adds r0, #0x86
	movs r1, #2
	strb r1, [r0]
	strb r4, [r5, #0xa]
	ldr r0, .L0803CC74  @ gAiScriptEndedFlag
	strb r4, [r0]
	b .L0803CC7E
	.align 2, 0
.L0803CC70: .4byte gAiSt
.L0803CC74: .4byte gAiScriptEndedFlag
.L0803CC78:
	ldr r1, .L0803CC8C  @ gAiScriptEndedFlag
	movs r0, #0
	strb r0, [r1]
.L0803CC7E:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CC8C: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_0D_MoveTowardsCharacterUntilAdjacent

	THUMB_FUNC_START AiScriptCmd_0E_DoNothing
AiScriptCmd_0E_DoNothing: @ 0x0803CC90
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END AiScriptCmd_0E_DoNothing

	THUMB_FUNC_START AiScriptCmd_0F_MoveTowardsUnitWithClass
AiScriptCmd_0F_MoveTowardsUnitWithClass: @ 0x0803CC98
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r7, .L0803CCD8  @ gpAiScriptCurrent
	ldr r0, [r7]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindClosestPositionWithUnitOfClass
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0803CCCA
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r7]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
.L0803CCCA:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CCD8: .4byte gpAiScriptCurrent

	THUMB_FUNC_END AiScriptCmd_0F_MoveTowardsUnitWithClass

	THUMB_FUNC_START AiScriptCmd_10_DoLooting
AiScriptCmd_10_DoLooting: @ 0x0803CCDC
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803CD2C
	ldr r3, .L0803CD20  @ gpAiScriptCurrent
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq .L0803CDC8
	ldr r2, .L0803CD24  @ gActiveUnit
	ldr r1, [r2]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne .L0803CDC8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, .L0803CD28  @ gAiScriptEndedFlag
	movs r0, #0
	b .L0803CDC6
	.align 2, 0
.L0803CD20: .4byte gpAiScriptCurrent
.L0803CD24: .4byte gActiveUnit
.L0803CD28: .4byte gAiScriptEndedFlag
.L0803CD2C:
	add r4, sp, #0x10
	adds r0, r4, #0
	add r1, sp, #0xc
	bl AiGetLootingParameters
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne .L0803CDBC
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r4, .L0803CDAC  @ gAiDecision
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiIsPositionLootable
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803CDC8
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl AiSetDecision
	ldr r3, .L0803CDB0  @ gpAiScriptCurrent
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq .L0803CDC8
	ldr r2, .L0803CDB4  @ gActiveUnit
	ldr r1, [r2]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne .L0803CDC8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, .L0803CDB8  @ gAiScriptEndedFlag
	strb r4, [r0]
	b .L0803CDC8
	.align 2, 0
.L0803CDAC: .4byte gAiDecision
.L0803CDB0: .4byte gpAiScriptCurrent
.L0803CDB4: .4byte gActiveUnit
.L0803CDB8: .4byte gAiScriptEndedFlag
.L0803CDBC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, .L0803CDD0  @ gAiScriptEndedFlag
	movs r0, #0
.L0803CDC6:
	strb r0, [r1]
.L0803CDC8:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CDD0: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_10_DoLooting

	THUMB_FUNC_START AiScriptCmd_11_MoveTowardsSafety
AiScriptCmd_11_MoveTowardsSafety: @ 0x0803CDD4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, .L0803CE14  @ gActiveUnit
	ldr r0, [r0]
	add r4, sp, #0xc
	adds r1, r4, #0
	bl AiFindUnitSafestTileToMoveTo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803CE06
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0
	bl AiSetDecision
.L0803CE06:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CE14: .4byte gActiveUnit

	THUMB_FUNC_END AiScriptCmd_11_MoveTowardsSafety

	THUMB_FUNC_START AiScriptCmd_12_MoveTowardsEnemy
AiScriptCmd_12_MoveTowardsEnemy: @ 0x0803CE18
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, .L0803CE54  @ gpAiScriptCurrent
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne .L0803CE5C
	ldr r0, .L0803CE58  @ IsUnitEnemyWithActiveUnit
	add r5, sp, #4
	adds r1, r5, #0
	bl AiGetClosestUnitPosition
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0803CE84
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b .L0803CE84
	.align 2, 0
.L0803CE54: .4byte gpAiScriptCurrent
.L0803CE58: .4byte IsUnitEnemyWithActiveUnit
.L0803CE5C:
	ldr r0, .L0803CE94  @ IsUnitEnemyAndNotInTheAiInstList
	add r5, sp, #4
	adds r1, r5, #0
	bl AiGetClosestUnitPosition
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0803CE84
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
.L0803CE84:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CE94: .4byte IsUnitEnemyAndNotInTheAiInstList

	THUMB_FUNC_END AiScriptCmd_12_MoveTowardsEnemy

	THUMB_FUNC_START AiScriptCmd_13_MoveTowardsEnemyNoWalls
AiScriptCmd_13_MoveTowardsEnemyNoWalls: @ 0x0803CE98
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, .L0803CED4  @ gpAiScriptCurrent
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne .L0803CEDC
	ldr r0, .L0803CED8  @ IsUnitEnemyWithActiveUnit
	add r5, sp, #4
	adds r1, r5, #0
	bl func_0803AA40
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0803CF04
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl func_0803BBF4
	b .L0803CF04
	.align 2, 0
.L0803CED4: .4byte gpAiScriptCurrent
.L0803CED8: .4byte IsUnitEnemyWithActiveUnit
.L0803CEDC:
	ldr r0, .L0803CF14  @ IsUnitEnemyAndNotInTheAiInstList
	add r5, sp, #4
	adds r1, r5, #0
	bl func_0803AA40
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0803CF04
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl func_0803BBF4
.L0803CF04:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CF14: .4byte IsUnitEnemyAndNotInTheAiInstList

	THUMB_FUNC_END AiScriptCmd_13_MoveTowardsEnemyNoWalls

	THUMB_FUNC_START AiScriptCmd_14_DoNothing
AiScriptCmd_14_DoNothing: @ 0x0803CF18
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END AiScriptCmd_14_DoNothing

	THUMB_FUNC_START AiScriptCmd_15_DoNothing
AiScriptCmd_15_DoNothing: @ 0x0803CF20
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END AiScriptCmd_15_DoNothing

	THUMB_FUNC_START AiScriptCmd_16_RandomMovement
AiScriptCmd_16_RandomMovement: @ 0x0803CF28
	push {r4, lr}
	adds r4, r0, #0
	bl func_0803AB5C
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END AiScriptCmd_16_RandomMovement

	THUMB_FUNC_START AiScriptCmd_17_DoEscape
AiScriptCmd_17_DoEscape: @ 0x0803CF3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0803CF5C  @ gActiveUnit
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	bl AiUnitTryMoveTowardsEscapePoint
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803CF5C: .4byte gActiveUnit

	THUMB_FUNC_END AiScriptCmd_17_DoEscape

	THUMB_FUNC_START func_0803CF60
func_0803CF60: @ 0x0803CF60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl AiGetPositionTerrainSafetyWeight
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetPositionUnitSafetyWeight
	adds r4, r4, r0
	ldr r0, .L0803CFA8  @ gMapMovement
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, .L0803CFAC  @ gMapOther
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, .L0803CFB0  @ 0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0803CFA8: .4byte gMapMovement
.L0803CFAC: .4byte gMapOther
.L0803CFB0: .4byte 0x7FFFFFFF

	THUMB_FUNC_END func_0803CF60

	THUMB_FUNC_START func_0803CFB4
func_0803CFB4: @ 0x0803CFB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r4, .L0803D0F8  @ gActiveUnit
	ldr r0, [r4]
	bl MapFloodUnit
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, [r4]
	ldrh r0, [r0, #0x1e]
	mov r8, r0
	cmp r0, #0
	beq .L0803D0DE
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	lsls r6, r6, #0x10
	str r6, [sp, #0x1c]
.L0803CFF2:
	ldr r0, .L0803D0F8  @ gActiveUnit
	ldr r0, [r0]
	mov r1, r8
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r1, #1
	mov r9, r1
	cmp r0, #0
	beq .L0803D0C4
	ldr r0, .L0803D0FC  @ gMapRange
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
	ldr r2, [sp, #0x18]
	asrs r0, r2, #0x10
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapIncInBoundedRange
	ldr r0, .L0803D100  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt .L0803D0C4
.L0803D044:
	ldr r0, .L0803D100  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt .L0803D0BE
	lsls r7, r6, #2
.L0803D056:
	ldr r0, .L0803D104  @ gMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803D0B8
	ldr r0, .L0803D0FC  @ gMapRange
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803D0B8
	ldr r0, .L0803D108  @ gMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq .L0803D092
	ldr r0, .L0803D10C  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803D0B8
.L0803D092:
	mov r0, r8
	bl GetItemMight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_0803CF60
	adds r4, r4, r0
	ldr r1, [sp, #0x14]
	cmp r4, r1
	bls .L0803D0B8
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
.L0803D0B8:
	subs r5, #1
	cmp r5, #0
	bge .L0803D056
.L0803D0BE:
	mov r6, sl
	cmp r6, #0
	bge .L0803D044
.L0803D0C4:
	mov r1, r9
	str r1, [sp, #8]
	cmp r1, #4
	bgt .L0803D0DE
	ldr r0, .L0803D0F8  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne .L0803CFF2
.L0803D0DE:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq .L0803D110
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
	b .L0803D112
	.align 2, 0
.L0803D0F8: .4byte gActiveUnit
.L0803D0FC: .4byte gMapRange
.L0803D100: .4byte gMapSize
.L0803D104: .4byte gMapMovement
.L0803D108: .4byte gMapUnit
.L0803D10C: .4byte gActiveUnitId
.L0803D110:
	movs r0, #0
.L0803D112:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803CFB4

	THUMB_FUNC_START func_0803D124
func_0803D124: @ 0x0803D124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov r9, r0
	ldr r0, .L0803D200  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803D1F6
.L0803D146:
	ldr r0, .L0803D200  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt .L0803D1F0
	lsls r6, r5, #2
.L0803D158:
	ldr r0, .L0803D204  @ gMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803D1EA
	ldr r0, .L0803D208  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl IsTerrainIdInList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803D1EA
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L0803D1B0
	ldr r0, .L0803D20C  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803D1B0
	ldr r0, .L0803D210  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803D1EA
.L0803D1B0:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L0803D1CA
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl AiAreEnemiesWithin3Tiles
	cmp r0, #0
	bne .L0803D1EA
.L0803D1CA:
	ldr r0, .L0803D204  @ gMapRange
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r9, r0
	ble .L0803D1EA
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r9, r0
.L0803D1EA:
	subs r4, #1
	cmp r4, #0
	bge .L0803D158
.L0803D1F0:
	mov r5, sl
	cmp r5, #0
	bge .L0803D146
.L0803D1F6:
	mov r0, r9
	cmp r0, #0xff
	bne .L0803D214
	movs r0, #0
	b .L0803D216
	.align 2, 0
.L0803D200: .4byte gMapSize
.L0803D204: .4byte gMapRange
.L0803D208: .4byte gMapTerrain
.L0803D20C: .4byte gMapUnit
.L0803D210: .4byte gActiveUnit
.L0803D214:
	movs r0, #1
.L0803D216:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803D124

	THUMB_FUNC_START AiScriptCmd_18_TryAttackSnagWall
AiScriptCmd_18_TryAttackSnagWall: @ 0x0803D228
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, .L0803D298  @ gActiveUnit
	ldr r0, [r0]
	bl func_08041020
	ldr r0, .L0803D29C  @ gUnknown_085A814C
	add r4, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl func_0803D124
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne .L0803D2B4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	add r5, sp, #0x14
	adds r2, r5, #0
	add r3, sp, #0xc
	bl func_0803CFB4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803D2A0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl GetTrapAt
	cmp r0, #0
	beq .L0803D2C8
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	ldrb r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0
	bl AiSetDecision
	b .L0803D2C2
	.align 2, 0
.L0803D298: .4byte gActiveUnit
.L0803D29C: .4byte gUnknown_085A814C
.L0803D2A0:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	str r6, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	b .L0803D2C2
.L0803D2B4:
	ldr r0, .L0803D2D0  @ gAiSt
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, .L0803D2D4  @ gAiScriptEndedFlag
	strb r2, [r0]
.L0803D2C2:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
.L0803D2C8:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D2D0: .4byte gAiSt
.L0803D2D4: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_18_TryAttackSnagWall

	THUMB_FUNC_START AiScriptCmd_19_MoveTowardsTerrain
AiScriptCmd_19_MoveTowardsTerrain: @ 0x0803D2D8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, .L0803D328  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodExtendedOnRangeMap
	ldr r6, .L0803D32C  @ gpAiScriptCurrent
	ldr r0, [r6]
	adds r0, #3
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl AiFindClosestTileInRangeWithListedTerrain
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0803D330
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b .L0803D33E
	.align 2, 0
.L0803D328: .4byte gActiveUnit
.L0803D32C: .4byte gpAiScriptCurrent
.L0803D330:
	ldr r0, .L0803D34C  @ gAiSt
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, .L0803D350  @ gAiScriptEndedFlag
	strb r2, [r0]
.L0803D33E:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D34C: .4byte gAiSt
.L0803D350: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_19_MoveTowardsTerrain

	THUMB_FUNC_START AiScriptCmd_1A_MoveTowardsTerrain
AiScriptCmd_1A_MoveTowardsTerrain: @ 0x0803D354
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, .L0803D3A4  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodExtendedOnRangeMap
	ldr r6, .L0803D3A8  @ gpAiScriptCurrent
	ldr r0, [r6]
	ldr r0, [r0, #8]
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl AiFindClosestTileInRangeWithListedTerrain
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0803D3AC
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b .L0803D3BA
	.align 2, 0
.L0803D3A4: .4byte gActiveUnit
.L0803D3A8: .4byte gpAiScriptCurrent
.L0803D3AC:
	ldr r0, .L0803D3C8  @ gAiSt
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, .L0803D3CC  @ gAiScriptEndedFlag
	strb r2, [r0]
.L0803D3BA:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D3C8: .4byte gAiSt
.L0803D3CC: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_1A_MoveTowardsTerrain

	THUMB_FUNC_START AiScriptCmd_1B_NoOp
AiScriptCmd_1B_NoOp: @ 0x0803D3D0
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, .L0803D3E0  @ gAiScriptEndedFlag
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0803D3E0: .4byte gAiScriptEndedFlag

	THUMB_FUNC_END AiScriptCmd_1B_NoOp

	THUMB_FUNC_START AiDoBerserkAction
AiDoBerserkAction: @ 0x0803D3E4
	push {lr}
	ldr r0, .L0803D3FC  @ IsUnitEnemyWithActiveUnit
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803D3F8
	ldr r0, .L0803D400  @ IsUnitNotActiveUnit
	bl AiTryDoOffensiveAction
.L0803D3F8:
	pop {r0}
	bx r0
	.align 2, 0
.L0803D3FC: .4byte IsUnitEnemyWithActiveUnit
.L0803D400: .4byte IsUnitNotActiveUnit

	THUMB_FUNC_END AiDoBerserkAction

	THUMB_FUNC_START AiDoBerserkMove
AiDoBerserkMove: @ 0x0803D404
	push {r4, lr}
	sub sp, #8
	ldr r0, .L0803D438  @ IsUnitNotActiveUnit
	add r4, sp, #4
	adds r1, r4, #0
	bl AiGetClosestUnitPosition
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne .L0803D42E
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
.L0803D42E:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D438: .4byte IsUnitNotActiveUnit

	THUMB_FUNC_END AiDoBerserkMove

	THUMB_FUNC_START func_0803D43C
func_0803D43C: @ 0x0803D43C
	movs r0, #1
	bx lr

	THUMB_FUNC_END func_0803D43C

	THUMB_FUNC_START func_0803D440
func_0803D440: @ 0x0803D440
	push {lr}
	ldrb r0, [r0]
	bl func_0803BF4C
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803D440

	THUMB_FUNC_START AiTryDoOffensiveAction
AiTryDoOffensiveAction: @ 0x0803D450
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	movs r5, #0
	strb r5, [r0, #2]
	str r5, [r0, #8]
	ldr r6, .L0803D4BC  @ gActiveUnit
	ldr r3, [r6]
	ldr r1, [r3, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r1, r2
	mov sl, r0
	cmp r1, #0
	beq .L0803D4C4
	ldr r4, .L0803D4C0  @ gMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl MapFill
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetNonEmptyBallistaAt
	adds r1, r0, #0
	cmp r1, #0
	beq .L0803D4B2
	b .L0803D628
.L0803D4B2:
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
	b .L0803D55A
	.align 2, 0
.L0803D4BC: .4byte gActiveUnit
.L0803D4C0: .4byte gMapMovement
.L0803D4C4:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L0803D4FA
	adds r0, r3, #0
	bl GetUnitItemCount
	cmp r0, #4
	bgt .L0803D4FA
	ldr r0, [r6]
	bl MapFloodUnit
	bl MapMovementMarkFloodEdges
	bl AiTryDoSteal
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803D4FA
	movs r0, #0
	b .L0803D69C
.L0803D4FA:
	ldr r0, .L0803D530  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0803D53C
	ldr r4, .L0803D534  @ gMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl MapFill
	ldr r0, .L0803D538  @ gActiveUnit
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
	b .L0803D544
	.align 2, 0
.L0803D530: .4byte gAiSt
.L0803D534: .4byte gMapMovement
.L0803D538: .4byte gActiveUnit
.L0803D53C:
	ldr r0, .L0803D6AC  @ gActiveUnit
	ldr r0, [r0]
	bl MapFloodUnit
.L0803D544:
	ldr r0, .L0803D6AC  @ gActiveUnit
	ldr r0, [r0]
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803D55A
	movs r0, #1
	negs r0, r0
	bl BuildMagicSealRange
.L0803D55A:
	ldr r0, .L0803D6B0  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r1, #0
	mov r8, r1
	ldr r2, .L0803D6AC  @ gActiveUnit
	ldr r1, [r2]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq .L0803D628
	mov r9, r2
.L0803D572:
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x28]
	cmp r5, #0xa6
	beq .L0803D60E
	mov r3, r9
	ldr r0, [r3]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803D60E
	add r0, sp, #0xc
	mov r4, r8
	strh r4, [r0, #4]
	movs r6, #1
.L0803D596:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L0803D608
	ldr r1, [r4]
	cmp r1, #0
	beq .L0803D608
	ldr r1, [r4, #0xc]
	ldr r2, .L0803D6B4  @ 0x00010025
	ands r1, r2
	cmp r1, #0
	bne .L0803D608
	ldr r7, [sp, #0x24]
	bl _call_via_r7
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803D608
	mov r1, r9
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl CouldStationaryUnitBeInRangeHeuristic
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803D608
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillUnitStandingRangeWithWeapon
	add r1, sp, #0xc
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl AiTrySimulateBattle
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803D608
	ldr r2, [sp, #0x14]
	mov r3, sl
	ldr r1, [r3, #8]
	cmp r2, r1
	bcc .L0803D608
	mov r2, sl
	add r1, sp, #0xc
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	mov r7, r8
	mov r4, sl
	strh r7, [r4, #4]
.L0803D608:
	adds r6, #1
	cmp r6, #0xbf
	ble .L0803D596
.L0803D60E:
	ldr r1, [sp, #0x28]
	mov r8, r1
	cmp r1, #4
	bgt .L0803D628
	mov r2, r9
	ldr r1, [r2]
	ldr r3, [sp, #0x28]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	cmp r5, #0
	bne .L0803D572
.L0803D628:
	ldr r1, .L0803D6AC  @ gActiveUnit
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r2, #0x28]
	ldr r2, [r3, #0x28]
	orrs r1, r2
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq .L0803D662
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl func_0803D998
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne .L0803D662
	ldr r2, [sp, #0x14]
	mov r4, sl
	ldr r1, [r4, #8]
	cmp r2, r1
	bcc .L0803D662
	mov r2, sl
	add r1, sp, #0xc
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
.L0803D662:
	mov r2, sl
	ldr r1, [r2, #8]
	cmp r1, #0
	bne .L0803D670
	ldrb r1, [r2, #2]
	cmp r1, #0
	beq .L0803D69C
.L0803D670:
	mov r4, sl
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	movs r2, #4
	ldrsb r2, [r4, r2]
	movs r1, #1
	negs r1, r1
	cmp r2, r1
	beq .L0803D69C
	ldr r0, .L0803D6AC  @ gActiveUnit
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
.L0803D69C:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803D6AC: .4byte gActiveUnit
.L0803D6B0: .4byte gMapRange
.L0803D6B4: .4byte 0x00010025

	THUMB_FUNC_END AiTryDoOffensiveAction

	THUMB_FUNC_START func_0803D6B8
func_0803D6B8: @ 0x0803D6B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r2, sp, #0x18
	movs r5, #0
	strb r5, [r2, #2]
	str r5, [r2, #8]
	ldr r6, .L0803D870  @ gActiveUnit
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq .L0803D71E
	ldr r4, .L0803D874  @ gMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl MapFill
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetNonEmptyBallistaAt
	adds r1, r0, #0
	cmp r1, #0
	bne .L0803D7EA
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
.L0803D71E:
	ldr r0, .L0803D878  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r1, #0
	mov r9, r1
	ldr r1, [r6]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq .L0803D7EA
	mov sl, r6
.L0803D734:
	mov r2, r9
	adds r2, #1
	str r2, [sp, #0x28]
	cmp r5, #0xa6
	beq .L0803D7D0
	mov r3, sl
	ldr r0, [r3]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803D7D0
	add r0, sp, #0xc
	mov r4, r9
	strh r4, [r0, #4]
	movs r6, #1
.L0803D758:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L0803D7CA
	ldr r1, [r4]
	cmp r1, #0
	beq .L0803D7CA
	ldr r1, [r4, #0xc]
	ldr r2, .L0803D87C  @ 0x00010025
	ands r1, r2
	cmp r1, #0
	bne .L0803D7CA
	ldr r7, [sp, #0x24]
	bl _call_via_r7
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803D7CA
	mov r1, sl
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl CouldStationaryUnitBeInRangeHeuristic
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803D7CA
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillUnitStandingRangeWithWeapon
	add r1, sp, #0xc
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl AiTrySimulateBattle
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803D7CA
	ldr r2, [sp, #0x14]
	mov r3, r8
	ldr r1, [r3, #8]
	cmp r2, r1
	bcc .L0803D7CA
	mov r2, r8
	add r1, sp, #0xc
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	mov r7, r9
	mov r4, r8
	strh r7, [r4, #4]
.L0803D7CA:
	adds r6, #1
	cmp r6, #0xbf
	ble .L0803D758
.L0803D7D0:
	ldr r1, [sp, #0x28]
	mov r9, r1
	cmp r1, #4
	bgt .L0803D7EA
	mov r2, sl
	ldr r1, [r2]
	ldr r3, [sp, #0x28]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	cmp r5, #0
	bne .L0803D734
.L0803D7EA:
	ldr r1, .L0803D870  @ gActiveUnit
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r2, #0x28]
	ldr r2, [r3, #0x28]
	orrs r1, r2
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq .L0803D824
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl func_0803D998
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne .L0803D824
	ldr r2, [sp, #0x14]
	mov r4, r8
	ldr r1, [r4, #8]
	cmp r2, r1
	bcc .L0803D824
	mov r2, r8
	add r1, sp, #0xc
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
.L0803D824:
	mov r2, r8
	ldr r1, [r2, #8]
	cmp r1, #0
	bne .L0803D832
	ldrb r1, [r2, #2]
	cmp r1, #0
	beq .L0803D85E
.L0803D832:
	mov r4, r8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	movs r2, #4
	ldrsb r2, [r4, r2]
	movs r1, #1
	negs r1, r1
	cmp r2, r1
	beq .L0803D85E
	ldr r0, .L0803D870  @ gActiveUnit
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
.L0803D85E:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803D870: .4byte gActiveUnit
.L0803D874: .4byte gMapMovement
.L0803D878: .4byte gMapRange
.L0803D87C: .4byte 0x00010025

	THUMB_FUNC_END func_0803D6B8

	THUMB_FUNC_START AiFillUnitStandingRangeWithWeapon
AiFillUnitStandingRangeWithWeapon: @ 0x0803D880
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	ldr r0, .L0803D8D0  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r6, #0x10
	ldrsb r6, [r4, r6]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
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
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D8D0: .4byte gMapRange

	THUMB_FUNC_END AiFillUnitStandingRangeWithWeapon

	THUMB_FUNC_START func_0803D8D4
func_0803D8D4: @ 0x0803D8D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, .L0803D98C  @ gMapMovement
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl BeginMapFlood
	ldr r0, .L0803D990  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L0803D994  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt .L0803D97E
.L0803D924:
	ldr r0, .L0803D994  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov r9, r0
	cmp r6, #0
	blt .L0803D978
	lsls r1, r7, #0x10
	mov r8, r1
.L0803D938:
	ldr r0, .L0803D98C  @ gMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803D972
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapIncInBoundedRange
.L0803D972:
	subs r6, #1
	cmp r6, #0
	bge .L0803D938
.L0803D978:
	mov r7, r9
	cmp r7, #0
	bge .L0803D924
.L0803D97E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803D98C: .4byte gMapMovement
.L0803D990: .4byte gMapRange
.L0803D994: .4byte gMapSize

	THUMB_FUNC_END func_0803D8D4

	THUMB_FUNC_START func_0803D998
func_0803D998: @ 0x0803D998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	mov r8, r1
	movs r0, #0
	mov sl, r0
	add r4, sp, #0xc
	ldr r1, .L0803DA0C  @ gUnknown_080D867C
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	ldr r0, .L0803DA10  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt .L0803DA34
.L0803D9C4:
	ldr r0, .L0803DA10  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r3, r7, #1
	mov r9, r3
	cmp r4, #0
	blt .L0803DA2E
	ldr r2, .L0803DA14  @ gMapMovement
	lsls r6, r7, #2
.L0803D9D8:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803DA28
	adds r0, r4, #0
	adds r1, r7, #0
	str r2, [sp, #0x14]
	bl GetBallistaItemAt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x14]
	cmp r5, #0
	beq .L0803DA18
	movs r0, #1
	add sl, r0
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	strb r5, [r0]
	b .L0803DA28
	.align 2, 0
.L0803DA0C: .4byte gUnknown_080D867C
.L0803DA10: .4byte gMapSize
.L0803DA14: .4byte gMapMovement
.L0803DA18:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	negs r3, r3
	adds r1, r3, #0
	strb r1, [r0]
.L0803DA28:
	subs r4, #1
	cmp r4, #0
	bge .L0803D9D8
.L0803DA2E:
	mov r7, r9
	cmp r7, #0
	bge .L0803D9C4
.L0803DA34:
	mov r0, sl
	cmp r0, #0
	beq .L0803DAF4
	movs r0, #0
	mov r1, r8
	strb r0, [r1, #2]
	str r0, [r1, #8]
	movs r1, #0
	mov r6, sp
.L0803DA46:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	ldrb r5, [r0]
	ldr r0, .L0803DAE8  @ 0x0000FFFF
	mov r2, r8
	strh r0, [r2, #4]
	movs r7, #1
	adds r1, #1
	mov r9, r1
.L0803DA5A:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L0803DAC8
	ldr r0, [r4]
	cmp r0, #0
	beq .L0803DAC8
	ldr r0, [r4, #0xc]
	ldr r1, .L0803DAEC  @ 0x00010025
	ands r0, r1
	cmp r0, #0
	bne .L0803DAC8
	adds r0, r4, #0
	ldr r3, [sp, #0x10]
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803DAC8
	ldr r0, .L0803DAF0  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl CouldStationaryUnitBeInRangeHeuristic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803DAC8
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillUnitStandingRangeWithWeapon
	ldrb r0, [r4, #0xb]
	strb r0, [r6, #2]
	mov r0, sp
	adds r1, r5, #0
	bl func_0803DD84
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803DAC8
	ldr r1, [sp, #8]
	mov r2, r8
	ldr r0, [r2, #8]
	cmp r1, r0
	bcc .L0803DAC8
	ldrb r0, [r6]
	strb r0, [r2]
	ldrb r0, [r6, #1]
	strb r0, [r2, #1]
	ldrb r0, [r6, #2]
	strb r0, [r2, #2]
	str r1, [r2, #8]
.L0803DAC8:
	adds r7, #1
	cmp r7, #0xbf
	ble .L0803DA5A
	mov r1, r9
	cmp r1, #2
	ble .L0803DA46
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r0, #0
	bne .L0803DAE2
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq .L0803DAF4
.L0803DAE2:
	movs r0, #1
	b .L0803DAF6
	.align 2, 0
.L0803DAE8: .4byte 0x0000FFFF
.L0803DAEC: .4byte 0x00010025
.L0803DAF0: .4byte gActiveUnit
.L0803DAF4:
	movs r0, #0
.L0803DAF6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803D998

	THUMB_FUNC_START GetEffectiveTileMovCost
GetEffectiveTileMovCost: @ 0x0803DB08
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, .L0803DB40  @ gMapMovement
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt .L0803DB3C
	ldr r0, .L0803DB44  @ gMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq .L0803DB4C
	ldr r0, .L0803DB48  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq .L0803DB4C
.L0803DB3C:
	movs r0, #0xff
	b .L0803DB58
	.align 2, 0
.L0803DB40: .4byte gMapMovement
.L0803DB44: .4byte gMapUnit
.L0803DB48: .4byte gActiveUnitId
.L0803DB4C:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
.L0803DB58:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetEffectiveTileMovCost

	THUMB_FUNC_START AiTryDoSteal
AiTryDoSteal: @ 0x0803DB60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0xff
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	ldr r0, .L0803DC70  @ gMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r0, #1
	mov r8, r0
	cmp r0, #0
	blt .L0803DC64
.L0803DB86:
	ldr r0, .L0803DC70  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	mov r2, r8
	subs r2, #1
	str r2, [sp, #0x20]
	cmp r5, #0
	blt .L0803DC5C
	mov r3, r8
	lsls r7, r3, #2
.L0803DB9C:
	ldr r0, .L0803DC74  @ gMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803DC56
	ldr r0, .L0803DC78  @ gMapUnit
	mov sl, r0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803DC56
	ldr r0, .L0803DC7C  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803DC56
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, r8
	ldr r2, .L0803DC80  @ GetEffectiveTileMovCost
	add r3, sp, #0xc
	bl GetLesserWeightedAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803DC56
	mov r2, sl
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, .L0803DC84  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt .L0803DC56
	adds r0, r4, #0
	bl AiGetBestItemSlotIndexToSteal
	lsls r6, r0, #0x18
	asrs r1, r6, #0x18
	cmp r1, #0
	blt .L0803DC56
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetItemAiStealPriority
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r3, r0
	bcc .L0803DC56
	str r0, [sp, #0x14]
	add r1, sp, #0xc
	ldr r2, [sp, #0x1c]
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	ldrh r1, [r1]
	mov r9, r1
	mov r3, r9
	orrs r3, r0
	mov r9, r3
	mov r1, sl
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	lsrs r6, r6, #0x18
	str r6, [sp, #0x10]
.L0803DC56:
	subs r5, #1
	cmp r5, #0
	bge .L0803DB9C
.L0803DC5C:
	ldr r2, [sp, #0x20]
	mov r8, r2
	cmp r2, #0
	bge .L0803DB86
.L0803DC64:
	ldr r3, [sp, #0x14]
	cmp r3, #0xff
	bne .L0803DC88
	movs r0, #0
	b .L0803DCB0
	.align 2, 0
.L0803DC70: .4byte gMapSize
.L0803DC74: .4byte gMapMovement
.L0803DC78: .4byte gMapUnit
.L0803DC7C: .4byte gActiveUnitId
.L0803DC80: .4byte GetEffectiveTileMovCost
.L0803DC84: .4byte gActiveUnit
.L0803DC88:
	ldr r0, .L0803DCC0  @ gActiveUnit
	ldr r1, [r0]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	mov r1, r9
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #3
	ldr r3, [sp, #0x18]
	bl AiSetDecision
	movs r0, #1
.L0803DCB0:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803DCC0: .4byte gActiveUnit

	THUMB_FUNC_END AiTryDoSteal

	THUMB_FUNC_START AiTrySimulateBattle
AiTrySimulateBattle: @ 0x0803DCC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r3, #0
	ldr r0, .L0803DD60  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803DD4E
.L0803DCDC:
	ldr r0, .L0803DD60  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt .L0803DD48
	lsls r6, r5, #2
.L0803DCEE:
	ldr r0, .L0803DD64  @ gMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803DD42
	ldr r0, .L0803DD68  @ gMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803DD42
	ldr r0, .L0803DD6C  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq .L0803DD2A
	ldr r0, .L0803DD70  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803DD42
.L0803DD2A:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl AiGetTileWeightForAttack
	ldr r3, [sp]
	cmp r0, r3
	bls .L0803DD42
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
.L0803DD42:
	subs r4, #1
	cmp r4, #0
	bge .L0803DCEE
.L0803DD48:
	mov r5, r8
	cmp r5, #0
	bge .L0803DCDC
.L0803DD4E:
	cmp r3, #0
	beq .L0803DD74
	adds r0, r7, #0
	bl AiSimulateBattle
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L0803DD76
	.align 2, 0
.L0803DD60: .4byte gMapSize
.L0803DD64: .4byte gMapMovement
.L0803DD68: .4byte gMapRange
.L0803DD6C: .4byte gMapUnit
.L0803DD70: .4byte gActiveUnitId
.L0803DD74:
	movs r0, #0
.L0803DD76:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTrySimulateBattle

	THUMB_FUNC_START func_0803DD84
func_0803DD84: @ 0x0803DD84
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	movs r3, #0
	ldr r0, .L0803DE38  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803DE26
.L0803DDA4:
	ldr r0, .L0803DE38  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt .L0803DE20
	lsls r6, r5, #2
.L0803DDB6:
	ldr r0, .L0803DE3C  @ gMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi .L0803DE1A
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r9
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne .L0803DE1A
	ldr r0, .L0803DE40  @ gMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803DE1A
	ldr r0, .L0803DE44  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq .L0803DE02
	ldr r0, .L0803DE48  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803DE1A
.L0803DE02:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl AiGetTileWeightForAttack
	ldr r3, [sp]
	cmp r0, r3
	bls .L0803DE1A
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
.L0803DE1A:
	subs r4, #1
	cmp r4, #0
	bge .L0803DDB6
.L0803DE20:
	mov r5, r8
	cmp r5, #0
	bge .L0803DDA4
.L0803DE26:
	cmp r3, #0
	beq .L0803DE4C
	adds r0, r7, #0
	bl AiSimulateBattle
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L0803DE4E
	.align 2, 0
.L0803DE38: .4byte gMapSize
.L0803DE3C: .4byte gMapMovement
.L0803DE40: .4byte gMapRange
.L0803DE44: .4byte gMapUnit
.L0803DE48: .4byte gActiveUnitId
.L0803DE4C:
	movs r0, #0
.L0803DE4E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803DD84

	THUMB_FUNC_START AiGetTileWeightForAttack
AiGetTileWeightForAttack: @ 0x0803DE5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldrb r0, [r2, #2]
	bl GetUnit
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetUnitReachWeightWithEquippedWeapon
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetPositionTerrainSafetyWeight
	adds r4, r4, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl AiGetPositionUnitSafetyWeight
	adds r4, r4, r0
	ldr r0, .L0803DEB8  @ gMapMovement
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, .L0803DEBC  @ gMapOther
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, .L0803DEC0  @ 0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0803DEB8: .4byte gMapMovement
.L0803DEBC: .4byte gMapOther
.L0803DEC0: .4byte 0x7FFFFFFF

	THUMB_FUNC_END AiGetTileWeightForAttack

	THUMB_FUNC_START ShouldAiNotBattle
ShouldAiNotBattle: @ 0x0803DEC4
	movs r0, #0
	bx lr

	THUMB_FUNC_END ShouldAiNotBattle

	THUMB_FUNC_START AiSimulateBattle
AiSimulateBattle: @ 0x0803DEC8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r1, [r5, #4]
	ldr r0, .L0803DEF0  @ 0x0000FFFF
	cmp r1, r0
	beq .L0803DEF8
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, .L0803DEF4  @ gActiveUnit
	ldr r0, [r0]
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl BattleGenerateSimulation
	b .L0803DF0E
	.align 2, 0
.L0803DEF0: .4byte 0x0000FFFF
.L0803DEF4: .4byte gActiveUnit
.L0803DEF8:
	ldr r0, .L0803DF20  @ gActiveUnit
	ldr r4, [r0]
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	adds r0, r4, #0
	bl BattleGenerateBallistaSimulation
.L0803DF0E:
	adds r0, r5, #0
	bl ShouldAiNotBattle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803DF24
	movs r0, #0
	b .L0803DF2C
	.align 2, 0
.L0803DF20: .4byte gActiveUnit
.L0803DF24:
	adds r0, r5, #0
	bl ComputeAiAttackWeight
	movs r0, #1
.L0803DF2C:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiSimulateBattle

	THUMB_FUNC_START AiBattleGetDamageDealtWeight
AiBattleGetDamageDealtWeight: @ 0x0803DF34
	push {r4, lr}
	ldr r3, .L0803DF44  @ gBattleUnitB
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne .L0803DF48
	movs r0, #0x32
	b .L0803DF86
	.align 2, 0
.L0803DF44: .4byte gBattleUnitB
.L0803DF48:
	ldr r1, .L0803DF8C  @ gBattleUnitA
	adds r0, r1, #0
	adds r0, #0x5a
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r2, r2, r0
	adds r1, #0x64
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r2, #0
	muls r1, r0, r1
	cmp r1, #0
	bge .L0803DF6C
	movs r1, #0
.L0803DF6C:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, .L0803DF90  @ gpAiBattleWeightFactorTable
	ldr r0, [r0]
	ldrb r0, [r0]
	muls r1, r0, r1
	cmp r1, #0x28
	ble .L0803DF84
	movs r1, #0x28
.L0803DF84:
	adds r0, r1, #0
.L0803DF86:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0803DF8C: .4byte gBattleUnitA
.L0803DF90: .4byte gpAiBattleWeightFactorTable

	THUMB_FUNC_END AiBattleGetDamageDealtWeight

	THUMB_FUNC_START AiBattleGetTargetHpWeight
AiBattleGetTargetHpWeight: @ 0x0803DF94
	push {lr}
	ldr r0, .L0803DFB4  @ gBattleUnitB
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, .L0803DFB8  @ gpAiBattleWeightFactorTable
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	muls r1, r0, r1
	cmp r1, #0
	bge .L0803DFAE
	movs r1, #0
.L0803DFAE:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0803DFB4: .4byte gBattleUnitB
.L0803DFB8: .4byte gpAiBattleWeightFactorTable

	THUMB_FUNC_END AiBattleGetTargetHpWeight

	THUMB_FUNC_START AiBattleGetAlliesAroundWeight
AiBattleGetAlliesAroundWeight: @ 0x0803DFBC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r4, .L0803E054  @ gUnknown_085A91F0
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	beq .L0803E038
	ldr r0, .L0803E058  @ gBattleUnitA
	mov r9, r0
	ldr r1, .L0803E05C  @ gMapSize
	mov r8, r1
.L0803DFDA:
	mov r3, r9
	ldrb r3, [r3, #0x10]
	adds r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #1]
	mov r6, r9
	ldrb r6, [r6, #0x11]
	adds r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, .L0803E060  @ gMapUnit
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r7, r8
	movs r6, #0
	ldrsh r0, [r7, r6]
	cmp r2, r0
	bge .L0803E02C
	movs r2, #2
	ldrsh r0, [r7, r2]
	cmp r3, r0
	bge .L0803E02C
	cmp r1, #0
	beq .L0803E02C
	mov r3, r9
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803E02C
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
.L0803E02C:
	adds r4, #4
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	bne .L0803DFDA
.L0803E038:
	ldr r0, .L0803E064  @ gpAiBattleWeightFactorTable
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	muls r5, r0, r5
	cmp r5, #0xa
	ble .L0803E046
	movs r5, #0xa
.L0803E046:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803E054: .4byte gUnknown_085A91F0
.L0803E058: .4byte gBattleUnitA
.L0803E05C: .4byte gMapSize
.L0803E060: .4byte gMapUnit
.L0803E064: .4byte gpAiBattleWeightFactorTable

	THUMB_FUNC_END AiBattleGetAlliesAroundWeight

	THUMB_FUNC_START AiBattleGetWeight_803E068
AiBattleGetWeight_803E068: @ 0x0803E068
	push {lr}
	ldr r0, .L0803E094  @ gBattleUnitB
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	bl func_0803BF4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L0803E098  @ gpAiBattleWeightFactorTable
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	adds r1, r1, r0
	ldrb r1, [r1]
	ldrb r0, [r2, #3]
	muls r1, r0, r1
	cmp r1, #0x14
	ble .L0803E08E
	movs r1, #0x14
.L0803E08E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0803E094: .4byte gBattleUnitB
.L0803E098: .4byte gpAiBattleWeightFactorTable

	THUMB_FUNC_END AiBattleGetWeight_803E068

	THUMB_FUNC_START AiBattleGetTurnNumberWeight
AiBattleGetTurnNumberWeight: @ 0x0803E09C
	ldr r0, .L0803E0AC  @ gPlaySt
	ldrh r0, [r0, #0x10]
	ldr r1, .L0803E0B0  @ gpAiBattleWeightFactorTable
	ldr r1, [r1]
	ldrb r1, [r1, #4]
	muls r0, r1, r0
	bx lr
	.align 2, 0
.L0803E0AC: .4byte gPlaySt
.L0803E0B0: .4byte gpAiBattleWeightFactorTable

	THUMB_FUNC_END AiBattleGetTurnNumberWeight

	THUMB_FUNC_START AiBattleGetDamageTakenWeight
AiBattleGetDamageTakenWeight: @ 0x0803E0B4
	push {lr}
	ldr r2, .L0803E0C8  @ gBattleUnitB
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0803E0CC
	movs r0, #0xa
	negs r0, r0
	b .L0803E108
	.align 2, 0
.L0803E0C8: .4byte gBattleUnitB
.L0803E0CC:
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, .L0803E10C  @ gBattleUnitA
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	cmp r1, #0
	bge .L0803E0EE
	movs r1, #0
.L0803E0EE:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, .L0803E110  @ gpAiBattleWeightFactorTable
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	muls r1, r0, r1
	cmp r1, #0x28
	ble .L0803E106
	movs r1, #0x28
.L0803E106:
	adds r0, r1, #0
.L0803E108:
	pop {r1}
	bx r1
	.align 2, 0
.L0803E10C: .4byte gBattleUnitA
.L0803E110: .4byte gpAiBattleWeightFactorTable

	THUMB_FUNC_END AiBattleGetDamageTakenWeight

	THUMB_FUNC_START AiBattleGetTileDangerWeight
AiBattleGetTileDangerWeight: @ 0x0803E114
	push {lr}
	ldr r2, .L0803E144  @ gBattleUnitA
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, .L0803E148  @ gMapOther
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, #3
	ldr r0, .L0803E14C  @ gpAiBattleWeightFactorTable
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	muls r1, r0, r1
	cmp r1, #0x14
	ble .L0803E13E
	movs r1, #0x14
.L0803E13E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0803E144: .4byte gBattleUnitA
.L0803E148: .4byte gMapOther
.L0803E14C: .4byte gpAiBattleWeightFactorTable

	THUMB_FUNC_END AiBattleGetTileDangerWeight

	THUMB_FUNC_START AiBattleGetSubjectHpWeight
AiBattleGetSubjectHpWeight: @ 0x0803E150
	push {lr}
	ldr r0, .L0803E170  @ gBattleUnitA
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, .L0803E174  @ gpAiBattleWeightFactorTable
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	muls r1, r0, r1
	cmp r1, #0
	bge .L0803E16A
	movs r1, #0
.L0803E16A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0803E170: .4byte gBattleUnitA
.L0803E174: .4byte gpAiBattleWeightFactorTable

	THUMB_FUNC_END AiBattleGetSubjectHpWeight

	THUMB_FUNC_START ComputeAiAttackWeight
ComputeAiAttackWeight: @ 0x0803E178
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, .L0803E1D4  @ gpAiBattleWeightFactorTable
	ldr r0, .L0803E1D8  @ gAiSt
	adds r0, #0x7d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, .L0803E1DC  @ gUnknown_080D8178
	adds r0, r0, r1
	str r0, [r2]
	bl AiBattleGetDamageDealtWeight
	adds r4, r0, #0
	adds r5, r4, #0
	bl AiBattleGetTargetHpWeight
	adds r4, r4, r0
	bl AiBattleGetAlliesAroundWeight
	adds r4, r4, r0
	bl AiBattleGetWeight_803E068
	adds r4, r4, r0
	bl AiBattleGetTurnNumberWeight
	adds r4, r4, r0
	bl AiBattleGetDamageTakenWeight
	subs r4, r4, r0
	bl AiBattleGetTileDangerWeight
	subs r4, r4, r0
	bl AiBattleGetSubjectHpWeight
	subs r4, r4, r0
	cmp r4, #0
	bge .L0803E1C8
	movs r4, #0
.L0803E1C8:
	cmp r4, #0
	beq .L0803E1E0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #3
	b .L0803E1E2
	.align 2, 0
.L0803E1D4: .4byte gpAiBattleWeightFactorTable
.L0803E1D8: .4byte gAiSt
.L0803E1DC: .4byte gUnknown_080D8178
.L0803E1E0:
	adds r4, r5, #0
.L0803E1E2:
	str r4, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ComputeAiAttackWeight

	THUMB_FUNC_START AiGetUnitReachWeightWithEquippedWeapon
AiGetUnitReachWeightWithEquippedWeapon: @ 0x0803E1EC
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	subs r3, r4, r0
	cmp r3, #0
	bge .L0803E1FA
	subs r3, r0, r4
.L0803E1FA:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	subs r4, r0, r1
	cmp r4, #0
	blt .L0803E208
	adds r5, r3, r4
	b .L0803E20C
.L0803E208:
	subs r0, r1, r0
	adds r5, r3, r0
.L0803E20C:
	adds r0, r2, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq .L0803E232
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r5, r0
	bgt .L0803E22E
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r5, r0
	bge .L0803E232
.L0803E22E:
	movs r0, #0x32
	b .L0803E234
.L0803E232:
	movs r0, #0
.L0803E234:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiGetUnitReachWeightWithEquippedWeapon

	THUMB_FUNC_START AiGetPositionTerrainSafetyWeight
AiGetPositionTerrainSafetyWeight: @ 0x0803E23C
	ldr r2, .L0803E274  @ gMapTerrain
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r3, [r1]
	ldr r0, .L0803E278  @ gActiveUnit
	ldr r0, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r2, #0x44]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x48]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldr r1, [r2, #0x4c]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	bx lr
	.align 2, 0
.L0803E274: .4byte gMapTerrain
.L0803E278: .4byte gActiveUnit

	THUMB_FUNC_END AiGetPositionTerrainSafetyWeight

	THUMB_FUNC_START AiGetPositionUnitSafetyWeight
AiGetPositionUnitSafetyWeight: @ 0x0803E27C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0
	ldr r4, .L0803E2CC  @ gUnknown_085A9254
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, .L0803E2D0  @ 0x0000270F
	cmp r0, r1
	beq .L0803E2E8
	mov r8, r1
.L0803E296:
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, r6, r0
	ldr r1, .L0803E2D4  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r7, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803E2DE
	ldr r0, .L0803E2D8  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803E2DC
	adds r5, #5
	b .L0803E2DE
	.align 2, 0
.L0803E2CC: .4byte gUnknown_085A9254
.L0803E2D0: .4byte 0x0000270F
.L0803E2D4: .4byte gMapUnit
.L0803E2D8: .4byte gActiveUnitId
.L0803E2DC:
	subs r5, #5
.L0803E2DE:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	bne .L0803E296
.L0803E2E8:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiGetPositionUnitSafetyWeight

	THUMB_FUNC_START SetupAiDangerMap
SetupAiDangerMap: @ 0x0803E2F4
	push {lr}
	ldr r0, .L0803E318  @ gAiSt
	adds r1, r0, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0803E314
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L0803E31C  @ gMapOther
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	bl FillAiDangerMap
.L0803E314:
	pop {r0}
	bx r0
	.align 2, 0
.L0803E318: .4byte gAiSt
.L0803E31C: .4byte gMapOther

	THUMB_FUNC_END SetupAiDangerMap

	THUMB_FUNC_START FillAiDangerMap
FillAiDangerMap: @ 0x0803E320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
	mov r9, r0
	movs r4, #1
.L0803E332:
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r4, #1
	mov sl, r4
	cmp r6, #0
	beq .L0803E41C
	ldr r0, [r6]
	cmp r0, #0
	beq .L0803E41C
	ldr r0, [r6, #0xc]
	ldr r1, .L0803E430  @ 0x0001000D
	ands r0, r1
	cmp r0, #0
	bne .L0803E41C
	ldr r0, .L0803E434  @ gActiveUnitId
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803E41C
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq .L0803E3A6
.L0803E36C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803E392
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r9
	ble .L0803E392
	mov r8, r4
	mov r0, r8
	bl GetItemMight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
.L0803E392:
	adds r5, #1
	cmp r5, #4
	bgt .L0803E3A6
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L0803E36C
.L0803E3A6:
	mov r1, r8
	cmp r1, #0
	beq .L0803E41C
	ldr r0, .L0803E438  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r6, #0
	mov r2, r8
	bl CouldUnitBeInRangeHeuristic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803E41C
	adds r0, r6, #0
	mov r1, r8
	bl FillMovementAndRangeMapForItem
	ldr r0, .L0803E43C  @ gMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r1, r0, #1
	cmp r1, #0
	blt .L0803E41C
.L0803E3D2:
	ldr r0, .L0803E43C  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt .L0803E416
	lsls r5, r1, #2
.L0803E3E2:
	ldr r0, .L0803E440  @ gMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803E410
	adds r0, r6, #0
	bl GetUnitPower
	ldr r1, .L0803E444  @ gMapOther
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	add r0, r9
	asrs r0, r0, #1
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
.L0803E410:
	subs r4, #1
	cmp r4, #0
	bge .L0803E3E2
.L0803E416:
	adds r1, r7, #0
	cmp r1, #0
	bge .L0803E3D2
.L0803E41C:
	mov r4, sl
	cmp r4, #0xbf
	ble .L0803E332
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E430: .4byte 0x0001000D
.L0803E434: .4byte gActiveUnitId
.L0803E438: .4byte gActiveUnit
.L0803E43C: .4byte gMapSize
.L0803E440: .4byte gMapRange
.L0803E444: .4byte gMapOther

	THUMB_FUNC_END FillAiDangerMap

	THUMB_FUNC_START IsAiTileSafe
IsAiTileSafe: @ 0x0803E448
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, .L0803E464  @ gMapOther
	ldr r3, [r3]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, r2
	bhi .L0803E468
	movs r0, #1
	b .L0803E46A
	.align 2, 0
.L0803E464: .4byte gMapOther
.L0803E468:
	movs r0, #0
.L0803E46A:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsAiTileSafe

	THUMB_FUNC_START AiTryGetNearestHealPoint
AiTryGetNearestHealPoint: @ 0x0803E470
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, .L0803E534  @ 0x00002710
	str r0, [sp]
	movs r1, #0xff
	mov r9, r1
	ldr r0, .L0803E538  @ gActiveUnit
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L0803E49E
	b .L0803E62C
.L0803E49E:
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq .L0803E4B0
	b .L0803E62C
.L0803E4B0:
	adds r0, r2, #0
	movs r1, #0x7c
	bl MapFloodUnitMovement
	ldr r0, .L0803E53C  @ gMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge .L0803E4C6
	b .L0803E5E0
.L0803E4C6:
	ldr r0, .L0803E53C  @ gMapSize
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r4, #0
	bge .L0803E4D8
	b .L0803E5D8
.L0803E4D8:
	lsls r5, r7, #2
.L0803E4DA:
	ldr r0, .L0803E540  @ gMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803E5D0
	ldr r0, .L0803E544  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, .L0803E548  @ gUnknown_085A92B8
	bl IsTerrainIdInList
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803E554
	ldr r6, .L0803E54C  @ gMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803E5D0
	ldr r0, .L0803E550  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803E5D0
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	b .L0803E594
	.align 2, 0
.L0803E534: .4byte 0x00002710
.L0803E538: .4byte gActiveUnit
.L0803E53C: .4byte gMapSize
.L0803E540: .4byte gMapMovement
.L0803E544: .4byte gMapTerrain
.L0803E548: .4byte gUnknown_085A92B8
.L0803E54C: .4byte gMapUnit
.L0803E550: .4byte gActiveUnitId
.L0803E554:
	ldr r6, .L0803E620  @ gMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803E59E
	ldr r0, .L0803E624  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803E5D0
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L0803E59E
.L0803E594:
	ldrb r1, [r2, #0xa]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L0803E5D0
.L0803E59E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl AiAreEnemiesWithin3Tiles
	adds r2, r0, #0
	ldr r0, [sp]
	cmp r2, r0
	bgt .L0803E5D0
	ldr r0, .L0803E628  @ gMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r9
	bgt .L0803E5D0
	str r2, [sp]
	ldrb r1, [r1]
	mov r9, r1
	mov r1, r8
	strh r4, [r1]
	strh r7, [r1, #2]
.L0803E5D0:
	subs r4, #1
	cmp r4, #0
	blt .L0803E5D8
	b .L0803E4DA
.L0803E5D8:
	mov r7, sl
	cmp r7, #0
	blt .L0803E5E0
	b .L0803E4C6
.L0803E5E0:
	mov r2, r9
	cmp r2, #0xff
	beq .L0803E62C
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, .L0803E620  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq .L0803E61A
	ldr r0, .L0803E624  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq .L0803E61A
	adds r0, r1, #0
	bl GetUnit
	adds r2, r0, #0
	ldrb r1, [r2, #0xa]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2, #0xa]
.L0803E61A:
	movs r0, #1
	b .L0803E62E
	.align 2, 0
.L0803E620: .4byte gMapUnit
.L0803E624: .4byte gActiveUnitId
.L0803E628: .4byte gMapMovement
.L0803E62C:
	movs r0, #0
.L0803E62E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTryGetNearestHealPoint

	THUMB_FUNC_START AiUpdateAllUnitHealAi
AiUpdateAllUnitHealAi: @ 0x0803E640
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, .L0803E690  @ gPlaySt
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, .L0803E694  @ gUnknown_080D8680
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge .L0803E686
	adds r6, r1, #0
	adds r4, r2, #1
.L0803E664:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L0803E67C
	ldr r0, [r1]
	cmp r0, #0
	beq .L0803E67C
	adds r0, r1, #0
	bl AiUnitUpdateGetHealMode
.L0803E67C:
	adds r4, #1
	adds r5, #1
	ldr r0, [r6]
	cmp r5, r0
	blt .L0803E664
.L0803E686:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803E690: .4byte gPlaySt
.L0803E694: .4byte gUnknown_080D8680

	THUMB_FUNC_END AiUpdateAllUnitHealAi

	THUMB_FUNC_START AiUnitUpdateGetHealMode
AiUnitUpdateGetHealMode: @ 0x0803E698
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r3, [r5, #0xa]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq .L0803E6E8
	ldr r2, .L0803E6E4  @ gUnknown_085A8390
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r4
	bhi .L0803E70E
	movs r0, #0xfe
	ands r0, r3
	strb r0, [r5, #0xa]
	movs r0, #0
	b .L0803E710
	.align 2, 0
.L0803E6E4: .4byte gUnknown_085A8390
.L0803E6E8:
	ldr r2, .L0803E704  @ gUnknown_085A8390
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, r4
	bhi .L0803E708
	movs r0, #0
	b .L0803E710
	.align 2, 0
.L0803E704: .4byte gUnknown_085A8390
.L0803E708:
	movs r0, #1
	orrs r0, r3
	strb r0, [r5, #0xa]
.L0803E70E:
	movs r0, #1
.L0803E710:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiUnitUpdateGetHealMode

	THUMB_FUNC_START AiUnitTryHealSelf
AiUnitTryHealSelf: @ 0x0803E718
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r6, #0
	ldr r7, .L0803E794  @ gActiveUnit
.L0803E720:
	ldr r0, [r7]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	cmp r4, #0
	beq .L0803E7C6
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x6c
	beq .L0803E744
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x6d
	bne .L0803E7C0
.L0803E744:
	ldr r0, .L0803E798  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne .L0803E79C
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne .L0803E79C
	add r5, sp, #0xc
	adds r0, r2, #0
	adds r1, r5, #0
	bl AiFindUnitSafestTileToMoveTo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803E7C0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	b .L0803E7B4
	.align 2, 0
.L0803E794: .4byte gActiveUnit
.L0803E798: .4byte gAiSt
.L0803E79C:
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
.L0803E7B4:
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	b .L0803E7C8
.L0803E7C0:
	adds r6, #1
	cmp r6, #4
	ble .L0803E720
.L0803E7C6:
	movs r0, #0
.L0803E7C8:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiUnitTryHealSelf

	THUMB_FUNC_START AiUnitTryMoveTowardsEscapePoint
AiUnitTryMoveTowardsEscapePoint: @ 0x0803E7D0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, .L0803E840  @ gActiveUnit
	ldr r0, [r6]
	movs r1, #0x7c
	bl MapFloodUnitMovement
	bl AiUnitGetClosestEscapePointData
	adds r4, r0, #0
	cmp r4, #0
	beq .L0803E86C
	ldrb r5, [r4, #1]
	ldr r0, .L0803E844  @ gMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r3, [r4]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, [r6]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	cmp r2, r0
	bgt .L0803E84C
	movs r0, #1
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r1, .L0803E848  @ gAiDecision
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldrb r3, [r4]
	ldrb r2, [r4, #1]
	str r2, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #2
	bl AiSetDecision
	movs r0, #1
	b .L0803E86E
	.align 2, 0
.L0803E840: .4byte gActiveUnit
.L0803E844: .4byte gMapMovement
.L0803E848: .4byte gAiDecision
.L0803E84C:
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r0, .L0803E868  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L0803E86E
	.align 2, 0
.L0803E868: .4byte gAiDecision
.L0803E86C:
	movs r0, #0
.L0803E86E:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiUnitTryMoveTowardsEscapePoint

	THUMB_FUNC_START AiUnitGetClosestEscapePointData
AiUnitGetClosestEscapePointData: @ 0x0803E878
	push {r4, r5, lr}
	movs r1, #0
	movs r5, #0
	ldr r0, .L0803E898  @ gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	movs r4, #0xff
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq .L0803E8B0
	cmp r0, #0x40
	bgt .L0803E89C
	cmp r0, #0
	beq .L0803E8A2
	b .L0803E8B8
	.align 2, 0
.L0803E898: .4byte gPlaySt
.L0803E89C:
	cmp r0, #0x80
	beq .L0803E8A6
	b .L0803E8B8
.L0803E8A2:
	movs r0, #0
	b .L0803E8F2
.L0803E8A6:
	ldr r1, .L0803E8AC  @ gUnknown_085A8188
	b .L0803E8B2
	.align 2, 0
.L0803E8AC: .4byte gUnknown_085A8188
.L0803E8B0:
	ldr r1, .L0803E8F8  @ gUnknown_085A828C
.L0803E8B2:
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
.L0803E8B8:
	movs r0, #0
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq .L0803E8F0
	ldr r0, .L0803E8FC  @ gMapMovement
	ldr r3, [r0]
	adds r2, r1, #0
.L0803E8CA:
	ldrb r0, [r2, #1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi .L0803E8E8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	ble .L0803E8E8
	ldrb r4, [r1]
	adds r5, r2, #0
.L0803E8E8:
	adds r2, #4
	ldrb r0, [r2]
	cmp r0, #0xff
	bne .L0803E8CA
.L0803E8F0:
	adds r0, r5, #0
.L0803E8F2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0803E8F8: .4byte gUnknown_085A828C
.L0803E8FC: .4byte gMapMovement

	THUMB_FUNC_END AiUnitGetClosestEscapePointData

	THUMB_FUNC_START func_0803E900
func_0803E900: @ 0x0803E900
	push {lr}
	ldr r0, .L0803E92C  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0803E934
	ldr r0, .L0803E930  @ gAiDecision
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0803E934
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq .L0803E934
	movs r0, #1
	b .L0803E936
	.align 2, 0
.L0803E92C: .4byte gActiveUnit
.L0803E930: .4byte gAiDecision
.L0803E934:
	movs r0, #0
.L0803E936:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803E900

	THUMB_FUNC_START func_0803E93C
func_0803E93C: @ 0x0803E93C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, .L0803E958  @ gActiveUnit
	ldr r0, [r5]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne .L0803E95C
	movs r0, #0
	b .L0803EA48
	.align 2, 0
.L0803E958: .4byte gActiveUnit
.L0803E95C:
	movs r7, #0
	strh r7, [r4]
	ldr r1, [r5]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq .L0803EA48
	adds r6, r4, #0
	movs r0, #0
	mov r8, r0
.L0803E96E:
	adds r0, r5, #0
	bl GetItemAttributes
	adds r1, r0, #0
	movs r2, #5
	ands r1, r2
	cmp r1, #0
	beq .L0803EA2A
	adds r0, r5, #0
	bl GetItemAttributes
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #3
	ands r1, r2
	cmp r1, #0
	bne .L0803EA2A
	ldr r4, .L0803EA08  @ gActiveUnit
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803E9B0
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseStaff
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L0803EA2A
.L0803E9B0:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0803EA0C
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble .L0803E9D0
	ldrh r0, [r6]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6]
.L0803E9D0:
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne .L0803E9E2
	ldrh r0, [r6]
	movs r1, #1
	orrs r0, r1
	strh r0, [r6]
.L0803E9E2:
	adds r0, r5, #0
	bl GetItemUses
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetItemMaxUses
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	cmp r4, #0xa
	bhi .L0803EA1A
	ldrh r0, [r6]
	movs r1, #4
	b .L0803EA16
	.align 2, 0
.L0803EA08: .4byte gActiveUnit
.L0803EA0C:
	adds r0, r5, #0
	bl func_0803EC18
	ldrh r0, [r6]
	movs r1, #8
.L0803EA16:
	orrs r0, r1
	strh r0, [r6]
.L0803EA1A:
	adds r0, r5, #0
	bl GetItemMight
	adds r1, r0, #0
	lsls r1, r1, #8
	ldrh r2, [r6]
	orrs r1, r2
	strh r1, [r6]
.L0803EA2A:
	adds r6, #2
	movs r1, #2
	add r8, r1
	adds r7, #1
	cmp r7, #4
	bgt .L0803EA48
	movs r1, #0
	strh r1, [r6]
	ldr r1, .L0803EA54  @ gActiveUnit
	ldr r1, [r1]
	adds r1, #0x1e
	add r1, r8
	ldrh r5, [r1]
	cmp r5, #0
	bne .L0803E96E
.L0803EA48:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803EA54: .4byte gActiveUnit

	THUMB_FUNC_END func_0803E93C

	THUMB_FUNC_START func_0803EA58
func_0803EA58: @ 0x0803EA58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x38]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	strh r0, [r2]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	ldr r0, .L0803EB94  @ gMapOther
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r4, #1
.L0803EA86:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x14]
	cmp r5, #0
	beq .L0803EB70
	ldr r0, [r5]
	cmp r0, #0
	beq .L0803EB70
	ldr r0, [r5, #0xc]
	movs r1, #0x21
	ands r0, r1
	cmp r0, #0
	bne .L0803EB70
	ldr r0, .L0803EB98  @ gActiveUnitId
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803EB70
	adds r0, r5, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl func_0803EC54
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803EB70
	adds r0, r5, #0
	bl MapFloodUnit
	ldr r4, .L0803EB9C  @ gMapMovement
	ldr r1, [r4]
	ldr r2, [sp, #8]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [sp, #4]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	beq .L0803EB70
	adds r0, r5, #0
	mov r1, sp
	bl GetUnitAttackAndWeapon
	adds r6, r0, #0
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMinRange
	cmp r0, #1
	ble .L0803EB02
	ldr r1, [sp, #0xc]
	ldrh r0, [r1]
	adds r0, r0, r6
	strh r0, [r1]
.L0803EB02:
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMaxRange
	cmp r0, #1
	bne .L0803EB16
	ldr r2, [sp, #0x10]
	ldrh r0, [r2]
	adds r0, r0, r6
	strh r0, [r2]
.L0803EB16:
	ldr r1, .L0803EBA0  @ gMapSize
	movs r3, #2
	ldrsh r0, [r1, r3]
	subs r2, r0, #1
	mov sl, r1
	cmp r2, #0
	blt .L0803EB70
	mov r9, r4
	ldr r0, .L0803EB94  @ gMapOther
	mov r8, r0
.L0803EB2A:
	mov r1, sl
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r3, r0, #1
	subs r7, r2, #1
	cmp r3, #0
	blt .L0803EB6A
	lsls r4, r2, #2
	mov r1, r9
	mov r5, r8
	movs r0, #0xff
	mov ip, r0
.L0803EB42:
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803EB64
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r2, r0, r3
	ldrb r0, [r2]
	adds r0, r0, r6
	cmp r0, #0xff
	ble .L0803EB62
	mov r0, ip
.L0803EB62:
	strb r0, [r2]
.L0803EB64:
	subs r3, #1
	cmp r3, #0
	bge .L0803EB42
.L0803EB6A:
	adds r2, r7, #0
	cmp r2, #0
	bge .L0803EB2A
.L0803EB70:
	ldr r4, [sp, #0x14]
	cmp r4, #0xbf
	ble .L0803EA86
	ldr r1, [sp, #0x10]
	ldrh r0, [r1]
	ldr r2, [sp, #0xc]
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r3, [sp, #0x38]
	strh r0, [r3]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EB94: .4byte gMapOther
.L0803EB98: .4byte gActiveUnitId
.L0803EB9C: .4byte gMapMovement
.L0803EBA0: .4byte gMapSize

	THUMB_FUNC_END func_0803EA58

	THUMB_FUNC_START func_0803EBA4
func_0803EBA4: @ 0x0803EBA4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #1
	negs r5, r5
	movs r4, #0
	movs r3, #0
	movs r7, #0xff
	lsls r7, r7, #8
.L0803EBB4:
	ldrh r0, [r1]
	cmp r0, #0
	beq .L0803EBCE
	adds r2, r0, #0
	ands r0, r6
	cmp r0, #0
	beq .L0803EBCE
	adds r0, r7, #0
	ands r0, r2
	cmp r0, r4
	bls .L0803EBCE
	adds r4, r0, #0
	adds r5, r3, #0
.L0803EBCE:
	adds r1, #2
	adds r3, #1
	cmp r3, #4
	ble .L0803EBB4
	cmp r5, #0
	ble .L0803EBE4
	ldr r0, .L0803EBEC  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r5, #0
	bl UnitEquipItemSlot
.L0803EBE4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803EBEC: .4byte gActiveUnit

	THUMB_FUNC_END func_0803EBA4

	THUMB_FUNC_START func_0803EBF0
func_0803EBF0: @ 0x0803EBF0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmn r1, r0
	beq .L0803EC14
	cmp r1, r0
	bcc .L0803EC0C
	movs r0, #1
	adds r1, r3, #0
	bl func_0803EBA4
	b .L0803EC14
.L0803EC0C:
	movs r0, #2
	adds r1, r3, #0
	bl func_0803EBA4
.L0803EC14:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0803EBF0

	THUMB_FUNC_START func_0803EC18
func_0803EC18: @ 0x0803EC18
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	cmp r0, #0x4b
	blt .L0803EC4C
	cmp r0, #0x4f
	ble .L0803EC30
	cmp r0, #0x57
	beq .L0803EC40
	b .L0803EC4C
.L0803EC30:
	ldr r0, .L0803EC3C  @ gActiveUnit
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #4
	b .L0803EC48
	.align 2, 0
.L0803EC3C: .4byte gActiveUnit
.L0803EC40:
	ldr r0, .L0803EC50  @ gActiveUnit
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #0x10
.L0803EC48:
	orrs r0, r1
	strb r0, [r2, #0xa]
.L0803EC4C:
	pop {r0}
	bx r0
	.align 2, 0
.L0803EC50: .4byte gActiveUnit

	THUMB_FUNC_END func_0803EC18

	THUMB_FUNC_START func_0803EC54
func_0803EC54: @ 0x0803EC54
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x1d
	ldrsb r0, [r3, r0]
	ldr r1, [r3, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, r1
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	subs r1, r4, r0
	cmp r1, #0
	bge .L0803EC74
	subs r1, r0, r4
.L0803EC74:
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt .L0803EC82
	adds r0, r1, r3
	b .L0803EC86
.L0803EC82:
	subs r0, r0, r2
	adds r0, r1, r0
.L0803EC86:
	cmp r5, r0
	bge .L0803EC8E
	movs r0, #0
	b .L0803EC90
.L0803EC8E:
	movs r0, #1
.L0803EC90:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803EC54

	THUMB_FUNC_START GetUnitAttackAndWeapon
GetUnitAttackAndWeapon: @ 0x0803EC98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strh r4, [r6]
	adds r0, r5, #0
	bl GetUnitPower
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetItemMight
	adds r5, r5, r0
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitAttackAndWeapon

	THUMB_FUNC_START AiTryDanceOrStealInPlace
AiTryDanceOrStealInPlace: @ 0x0803ECC4
	push {r4, lr}
	ldr r4, .L0803ECEC  @ gAiDecision
	ldrb r0, [r4]
	cmp r0, #2
	beq .L0803ECE6
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoDanceAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803ECE6
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoStealAdjacent
.L0803ECE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803ECEC: .4byte gAiDecision

	THUMB_FUNC_END AiTryDanceOrStealInPlace

	THUMB_FUNC_START AiTryActionAfterMove
AiTryActionAfterMove: @ 0x0803ECF0
	push {r4, lr}
	ldr r4, .L0803ED24  @ gAiDecision
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoDanceAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803ED1C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiTryDoStealAdjacent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803ED1C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl func_0803EEB0
.L0803ED1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803ED24: .4byte gAiDecision

	THUMB_FUNC_END AiTryActionAfterMove

	THUMB_FUNC_START AiTryDoDanceAdjacent
AiTryDoDanceAdjacent: @ 0x0803ED28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	str r1, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov r9, r0
	ldr r0, .L0803EE08  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	beq .L0803EE04
	ldr r0, .L0803EE0C  @ gMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MapFill
	mov r0, sl
	ldr r1, [sp, #0xc]
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	ldr r0, .L0803EE10  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt .L0803EDFE
.L0803ED78:
	ldr r0, .L0803EE10  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt .L0803EDF8
	lsls r5, r1, #2
.L0803ED88:
	ldr r0, .L0803EE0C  @ gMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803EDF2
	ldr r6, .L0803EE14  @ gMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803EDF2
	ldr r0, .L0803EE18  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803EDF2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne .L0803EDF2
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r8, r0
	bge .L0803EDF2
	ldrb r2, [r2, #8]
	mov r8, r2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r9, r0
.L0803EDF2:
	subs r4, #1
	cmp r4, #0
	bge .L0803ED88
.L0803EDF8:
	adds r1, r7, #0
	cmp r1, #0
	bge .L0803ED78
.L0803EDFE:
	mov r0, r8
	cmp r0, #0
	bne .L0803EE1C
.L0803EE04:
	movs r0, #0
	b .L0803EE3A
	.align 2, 0
.L0803EE08: .4byte gActiveUnit
.L0803EE0C: .4byte gMapMovement
.L0803EE10: .4byte gMapSize
.L0803EE14: .4byte gMapUnit
.L0803EE18: .4byte gActiveUnitId
.L0803EE1C:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #7
	mov r3, r9
	bl AiSetDecision
	movs r0, #1
.L0803EE3A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTryDoDanceAdjacent

	THUMB_FUNC_START AiTryDoStealAdjacent
AiTryDoStealAdjacent: @ 0x0803EE4C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, .L0803EEA0  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L0803EE9C
	ldr r4, .L0803EEA4  @ gMapMovement
	ldr r0, [r4]
	movs r5, #1
	negs r5, r5
	adds r1, r5, #0
	bl MapFill
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0x78
	bl MapAddInRange
	bl AiTryDoSteal
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne .L0803EEA8
.L0803EE9C:
	movs r0, #0
	b .L0803EEAA
	.align 2, 0
.L0803EEA0: .4byte gActiveUnit
.L0803EEA4: .4byte gMapMovement
.L0803EEA8:
	movs r0, #1
.L0803EEAA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTryDoStealAdjacent

	THUMB_FUNC_START func_0803EEB0
func_0803EEB0: @ 0x0803EEB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	mov sl, r1
	ldr r0, .L0803EED4  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne .L0803EF08
	b .L0803EFBE
	.align 2, 0
.L0803EED4: .4byte gActiveUnit
.L0803EED8:
	ldr r0, .L0803EF04  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitEquippedWeaponSlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r9
	asrs r2, r1, #0x10
	mov r3, r8
	asrs r1, r3, #0x10
	ldrb r3, [r5, #0xb]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #1
	bl AiSetDecision
	movs r0, #1
	b .L0803EFC0
	.align 2, 0
.L0803EF04: .4byte gActiveUnit
.L0803EF08:
	ldr r0, .L0803EFD0  @ gMapMovement
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x10
	mov r9, r0
	asrs r6, r0, #0x10
	mov r1, sl
	lsls r1, r1, #0x10
	mov r8, r1
	asrs r5, r1, #0x10
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
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl MapIncInBoundedRange
	ldr r0, .L0803EFD4  @ gMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r7, r0, #1
	cmp r7, #0
	blt .L0803EFBE
.L0803EF50:
	ldr r0, .L0803EFD4  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt .L0803EFB8
	lsls r6, r7, #2
.L0803EF5E:
	ldr r0, .L0803EFD0  @ gMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803EFB2
	ldr r5, .L0803EFD8  @ gMapUnit
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803EFB2
	ldr r0, .L0803EFDC  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803EFB2
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, sl
	adds r2, r5, #0
	bl AiGetUnitReachWeightWithEquippedWeapon
	cmp r0, #0
	bne .L0803EED8
.L0803EFB2:
	subs r4, #1
	cmp r4, #0
	bge .L0803EF5E
.L0803EFB8:
	subs r7, #1
	cmp r7, #0
	bge .L0803EF50
.L0803EFBE:
	movs r0, #0
.L0803EFC0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803EFD0: .4byte gMapMovement
.L0803EFD4: .4byte gMapSize
.L0803EFD8: .4byte gMapUnit
.L0803EFDC: .4byte gActiveUnitId

	THUMB_FUNC_END func_0803EEB0

	THUMB_FUNC_START AiIsUnitAtPositionDifferentAllegiance
AiIsUnitAtPositionDifferentAllegiance: @ 0x0803EFE0
	push {lr}
	ldr r2, .L0803F008  @ gMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, #0
	beq .L0803F002
	ldr r0, .L0803F00C  @ gActiveUnitId
	ldrb r0, [r0]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L0803F010
.L0803F002:
	movs r0, #0
	b .L0803F012
	.align 2, 0
.L0803F008: .4byte gMapUnit
.L0803F00C: .4byte gActiveUnitId
.L0803F010:
	movs r0, #1
.L0803F012:
	pop {r1}
	bx r1

	THUMB_FUNC_END AiIsUnitAtPositionDifferentAllegiance

	THUMB_FUNC_START func_0803F018
func_0803F018: @ 0x0803F018
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r4, .L0803F0B0  @ gActiveUnit
	ldr r0, [r4]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	mov r3, r8
	ldrb r1, [r3]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x14
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, r8
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq .L0803F0BC
	cmp r2, #0
	beq .L0803F0BC
	ldr r0, [r4]
	adds r1, r5, #0
	bl func_0803D8D4
	ldr r0, .L0803F0B4  @ gMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803F132
.L0803F066:
	ldr r0, .L0803F0B4  @ gMapSize
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt .L0803F0A6
.L0803F074:
	ldr r0, .L0803F0B8  @ gMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803F0A0
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiIsUnitAtPositionDifferentAllegiance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803F0A0
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
.L0803F0A0:
	subs r4, #1
	cmp r4, #0
	bge .L0803F074
.L0803F0A6:
	adds r5, r6, #0
	cmp r5, #0
	bge .L0803F066
	b .L0803F132
	.align 2, 0
.L0803F0B0: .4byte gActiveUnit
.L0803F0B4: .4byte gMapSize
.L0803F0B8: .4byte gMapRange
.L0803F0BC:
	ldr r4, .L0803F14C  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, .L0803F150  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r5, #0
	movs r3, #0
	bl BeginMapFlood
	ldr r0, .L0803F154  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803F132
.L0803F0F0:
	ldr r0, .L0803F154  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt .L0803F12C
.L0803F0FE:
	ldr r0, .L0803F150  @ gMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803F126
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiIsUnitAtPositionDifferentAllegiance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0803F126
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
.L0803F126:
	subs r4, #1
	cmp r4, #0
	bge .L0803F0FE
.L0803F12C:
	adds r5, r6, #0
	cmp r5, #0
	bge .L0803F0F0
.L0803F132:
	ldr r0, .L0803F158  @ gAiSt
	adds r0, #0x86
	mov r3, r8
	ldrb r3, [r3, #2]
	adds r0, r0, r3
	strb r7, [r0]
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F14C: .4byte gActiveUnit
.L0803F150: .4byte gMapRange
.L0803F154: .4byte gMapSize
.L0803F158: .4byte gAiSt

	THUMB_FUNC_END func_0803F018

	THUMB_FUNC_START func_0803F15C
func_0803F15C: @ 0x0803F15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, .L0803F1F8  @ gActiveUnit
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	ldrb r1, [r4, #4]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x14
	str r1, [sp, #4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0xfe
	lsls r0, r0, #5
	ands r0, r1
	lsrs r0, r0, #8
	ldr r1, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r8, r1
	ldrb r0, [r0, #1]
	mov r9, r0
	movs r6, #0x10
	ldrsb r6, [r2, r6]
	movs r7, #0x11
	ldrsb r7, [r2, r7]
	strb r1, [r2, #0x10]
	ldr r0, [r5]
	mov r2, r9
	strb r2, [r0, #0x11]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq .L0803F200
	mov r0, sl
	cmp r0, #0
	beq .L0803F200
	ldr r0, [r5]
	ldr r1, [sp, #4]
	mov r2, sl
	bl func_0803D8D4
	ldr r0, .L0803F1FC  @ gMapRange
	ldr r1, [r0]
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0803F23A
.L0803F1EC:
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldr r0, [r5]
	strb r7, [r0, #0x11]
	b .L0803F304
	.align 2, 0
.L0803F1F8: .4byte gActiveUnit
.L0803F1FC: .4byte gMapRange
.L0803F200:
	ldr r5, .L0803F2B0  @ gActiveUnit
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r4, .L0803F2B4  @ gMapRange
	ldr r0, [r4]
	bl SetWorkingMap
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #4]
	movs r3, #0
	bl BeginMapFlood
	ldr r1, [r4]
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803F1EC
.L0803F23A:
	ldr r4, .L0803F2B0  @ gActiveUnit
	ldr r0, [r4]
	strb r6, [r0, #0x10]
	ldr r0, [r4]
	strb r7, [r0, #0x11]
	ldr r0, [r4]
	bl MapFloodUnit
	ldr r0, [r4]
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803F25E
	movs r0, #1
	negs r0, r0
	bl BuildMagicSealRange
.L0803F25E:
	ldr r1, .L0803F2B8  @ gMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803F2F2
.L0803F26A:
	ldr r1, .L0803F2B8  @ gMapSize
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov ip, r0
	cmp r3, #0
	blt .L0803F2EC
	ldr r7, .L0803F2BC  @ gMapMovement
	ldr r6, .L0803F2B4  @ gMapRange
	movs r2, #1
	negs r2, r2
	adds r1, r2, #0
.L0803F284:
	mov r0, sl
	cmp r0, #0
	beq .L0803F2C0
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt .L0803F2E4
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0803F2E6
	b .L0803F2E4
	.align 2, 0
.L0803F2B0: .4byte gActiveUnit
.L0803F2B4: .4byte gMapRange
.L0803F2B8: .4byte gMapSize
.L0803F2BC: .4byte gMapMovement
.L0803F2C0:
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt .L0803F2E4
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	ble .L0803F2E6
.L0803F2E4:
	strb r1, [r4]
.L0803F2E6:
	subs r3, #1
	cmp r3, #0
	bge .L0803F284
.L0803F2EC:
	mov r5, ip
	cmp r5, #0
	bge .L0803F26A
.L0803F2F2:
	ldr r0, .L0803F328  @ IsUnitEnemyWithActiveUnit
	bl func_0803D6B8
	ldr r0, .L0803F32C  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803F314
.L0803F304:
	mov r0, r8
	mov r1, r9
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
.L0803F314:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F328: .4byte IsUnitEnemyWithActiveUnit
.L0803F32C: .4byte gAiDecision

	THUMB_FUNC_END func_0803F15C

	THUMB_FUNC_START func_0803F330
func_0803F330: @ 0x0803F330
	ldr r1, .L0803F344  @ gAiSt
	ldr r0, .L0803F348  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r0, [r0]
	adds r1, #0x86
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
.L0803F344: .4byte gAiSt
.L0803F348: .4byte gActiveUnit

	THUMB_FUNC_END func_0803F330

	THUMB_FUNC_START func_0803F34C
func_0803F34C: @ 0x0803F34C
	push {r4, r5, lr}
	bl GetCurrentPhase
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge .L0803F368
	adds r5, r0, #0
.L0803F35C:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt .L0803F35C
.L0803F368:
	ldr r0, .L0803F378  @ gAiSt
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F378: .4byte gAiSt

	THUMB_FUNC_END func_0803F34C

	THUMB_FUNC_START func_0803F37C
func_0803F37C: @ 0x0803F37C
	push {r4, r5, lr}
	bl GetCurrentPhase
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge .L0803F398
	adds r5, r0, #0
.L0803F38C:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt .L0803F38C
.L0803F398:
	ldr r0, .L0803F3A8  @ gAiSt
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F3A8: .4byte gAiSt

	THUMB_FUNC_END func_0803F37C

	THUMB_FUNC_START func_0803F3AC
func_0803F3AC: @ 0x0803F3AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, .L0803F3E0  @ gActiveUnit
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0xfe
	lsls r0, r0, #5
	ands r0, r1
	lsrs r3, r0, #8
	adds r5, r2, #0
	adds r5, #0x46
	ldrb r4, [r5]
	ldr r0, .L0803F3E4  @ gUnknown_085A8400
	ldr r1, [r0]
	cmp r1, #0
	beq .L0803F3DA
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	bne .L0803F3E8
.L0803F3DA:
	movs r0, #0
	b .L0803F42A
	.align 2, 0
.L0803F3E0: .4byte gActiveUnit
.L0803F3E4: .4byte gUnknown_085A8400
.L0803F3E8:
	lsls r0, r4, #2
	adds r3, r2, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0803F3FE
	movs r4, #0
	strb r4, [r5]
	adds r3, r2, #0
.L0803F3FE:
	ldrh r0, [r3]
	strh r0, [r6]
	ldrh r0, [r3, #2]
	strh r0, [r6, #2]
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, .L0803F430  @ gMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq .L0803F428
	adds r4, #1
	ldr r0, [r7]
	adds r0, #0x46
	strb r4, [r0]
.L0803F428:
	movs r0, #1
.L0803F42A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F430: .4byte gMapMovement

	THUMB_FUNC_END func_0803F3AC

	THUMB_FUNC_START func_0803F434
func_0803F434: @ 0x0803F434
	push {r4, lr}
	sub sp, #8
	ldr r4, .L0803F464  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq .L0803F46C
	ldr r0, [r4]
	bl FillMovementAndRangeMapForItem
	bl func_0803B298
	adds r1, r0, #0
	cmp r1, #0
	beq .L0803F472
	ldr r0, .L0803F468  @ gAiSt
	adds r0, #0x86
	strb r1, [r0]
	movs r0, #0
	b .L0803F49C
	.align 2, 0
.L0803F464: .4byte gActiveUnit
.L0803F468: .4byte gAiSt
.L0803F46C:
	ldr r0, [r4]
	bl MapFloodUnit
.L0803F472:
	add r4, sp, #4
	adds r0, r4, #0
	bl func_0803F3AC
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	beq .L0803F486
	movs r0, #0
	b .L0803F49C
.L0803F486:
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	movs r0, #1
.L0803F49C:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803F434

	THUMB_FUNC_START func_0803F4A4
func_0803F4A4: @ 0x0803F4A4
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0803F4D0  @ gActiveUnit
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	ldrb r3, [r0, #0x11]
	ldrb r0, [r1]
	cmp r0, r2
	bhi .L0803F4D8
	ldrb r0, [r1, #2]
	cmp r0, r2
	bcc .L0803F4D8
	ldrb r0, [r1, #1]
	cmp r0, r3
	bhi .L0803F4D8
	ldrb r0, [r1, #3]
	cmp r0, r3
	bcc .L0803F4D8
	ldr r0, .L0803F4D4  @ gAiSt
	adds r0, #0x86
	movs r1, #1
	b .L0803F4DE
	.align 2, 0
.L0803F4D0: .4byte gActiveUnit
.L0803F4D4: .4byte gAiSt
.L0803F4D8:
	ldr r0, .L0803F4E8  @ gAiSt
	adds r0, #0x86
	movs r1, #0
.L0803F4DE:
	strb r1, [r0]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0803F4E8: .4byte gAiSt

	THUMB_FUNC_END func_0803F4A4

	THUMB_FUNC_START AiFunc_DecideTalk
AiFunc_DecideTalk: @ 0x0803F4EC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	bl GetUnitByPid
	ldrb r5, [r0, #0xb]
	ldrb r0, [r4, #1]
	bl GetUnitByPid
	ldrb r3, [r0, #0xb]
	movs r0, #0xff
	str r0, [sp]
	movs r0, #8
	movs r1, #0
	adds r2, r5, #0
	bl AiUpdateDecision
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiFunc_DecideTalk

	THUMB_FUNC_START func_0803F51C
func_0803F51C: @ 0x0803F51C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r7, .L0803F554  @ gActiveUnitId
	ldrb r0, [r7]
	mov r8, r0
	ldr r4, .L0803F558  @ gActiveUnit
	ldr r6, [r4]
	adds r0, r6, #0
	bl GetUnitLeaderPid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq .L0803F5C6
	bl GetUnitByPid
	adds r1, r0, #0
	str r1, [r4]
	cmp r1, #0
	bne .L0803F560
	str r6, [r4]
	ldr r0, .L0803F55C  @ gAiSt
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b .L0803F5C6
	.align 2, 0
.L0803F554: .4byte gActiveUnitId
.L0803F558: .4byte gActiveUnit
.L0803F55C: .4byte gAiSt
.L0803F560:
	ldrb r0, [r1, #0xb]
	strb r0, [r7]
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, #1
	ldrb r7, [r0]
.L0803F56E:
	bl AiExecAi1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803F584
	adds r5, #1
	cmp r5, #0xff
	ble .L0803F56E
	bl AiExecFallbackAi1
.L0803F584:
	ldr r1, .L0803F59C  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne .L0803F5A4
	ldrb r0, [r1]
	cmp r0, #1
	bne .L0803F5A4
	ldr r0, .L0803F5A0  @ gAiSt
	ldrb r1, [r1, #6]
	adds r0, #0x86
	b .L0803F5AA
	.align 2, 0
.L0803F59C: .4byte gAiDecision
.L0803F5A0: .4byte gAiSt
.L0803F5A4:
	ldr r0, .L0803F5D4  @ gAiSt
	adds r0, #0x86
	movs r1, #0
.L0803F5AA:
	strb r1, [r0]
	bl ClearAiDecision
	ldr r1, .L0803F5D8  @ gActiveUnit
	ldr r0, [r1]
	adds r0, #0x42
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r7, [r0]
	ldr r0, .L0803F5DC  @ gActiveUnitId
	mov r2, r8
	strb r2, [r0]
	str r6, [r1]
.L0803F5C6:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F5D4: .4byte gAiSt
.L0803F5D8: .4byte gActiveUnit
.L0803F5DC: .4byte gActiveUnitId

	THUMB_FUNC_END func_0803F51C

	THUMB_FUNC_START func_0803F5E0
func_0803F5E0: @ 0x0803F5E0
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, .L0803F60C  @ gUnknown_0203AAA0
	ldrb r0, [r0, #4]
	ldrb r1, [r1]
	cmp r0, r1
	bne .L0803F614
	ldr r0, .L0803F610  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803F614
	movs r0, #1
	b .L0803F616
	.align 2, 0
.L0803F60C: .4byte gUnknown_0203AAA0
.L0803F610: .4byte gActiveUnit
.L0803F614:
	movs r0, #0
.L0803F616:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803F5E0

	THUMB_FUNC_START func_0803F61C
func_0803F61C: @ 0x0803F61C
	push {lr}
	ldr r2, .L0803F63C  @ gUnknown_0203AAA0
	ldrb r1, [r0]
	strb r1, [r2]
	ldrb r0, [r0]
	bl AiIsCharacterOnMap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803F644
	ldr r0, .L0803F640  @ gAiSt
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b .L0803F66C
	.align 2, 0
.L0803F63C: .4byte gUnknown_0203AAA0
.L0803F640: .4byte gAiSt
.L0803F644:
	ldr r0, .L0803F674  @ func_0803F5E0
	bl AiTryDoOffensiveAction
	ldr r0, .L0803F678  @ gAiSt
	adds r2, r0, #0
	adds r2, #0x86
	movs r0, #0
	strb r0, [r2]
	ldr r1, .L0803F67C  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne .L0803F668
	ldrb r0, [r1]
	cmp r0, #1
	bne .L0803F668
	ldrb r0, [r1, #6]
	strb r0, [r2]
.L0803F668:
	bl ClearAiDecision
.L0803F66C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0803F674: .4byte func_0803F5E0
.L0803F678: .4byte gAiSt
.L0803F67C: .4byte gAiDecision

	THUMB_FUNC_END func_0803F61C

	THUMB_FUNC_START func_0803F680
func_0803F680: @ 0x0803F680
	push {lr}
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	ldr r0, .L0803F6A8  @ gAiSt
	adds r0, #0x86
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803F6B0
	ldr r0, .L0803F6AC  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803F6B0
	movs r0, #1
	b .L0803F6B2
	.align 2, 0
.L0803F6A8: .4byte gAiSt
.L0803F6AC: .4byte gActiveUnit
.L0803F6B0:
	movs r0, #0
.L0803F6B2:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803F680

	THUMB_FUNC_START func_0803F6B8
func_0803F6B8: @ 0x0803F6B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, .L0803F718  @ gAiSt
	adds r0, #0x86
	ldrb r0, [r0]
	bl GetUnit
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r1, .L0803F71C  @ gActiveUnit
	ldr r1, [r1]
	movs r3, #0x10
	ldrsb r3, [r1, r3]
	subs r7, r2, r3
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	subs r0, r0, r2
	mov r8, r0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r5, r0, r3
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r6, r0, r2
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803F720
	adds r0, r7, #0
	muls r0, r5, r0
	cmp r0, #0
	blt .L0803F720
	mov r0, r8
	muls r0, r6, r0
	cmp r0, #0
	blt .L0803F720
	movs r0, #1
	b .L0803F722
	.align 2, 0
.L0803F718: .4byte gAiSt
.L0803F71C: .4byte gActiveUnit
.L0803F720:
	movs r0, #0
.L0803F722:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803F6B8

	THUMB_FUNC_START func_0803F72C
func_0803F72C: @ 0x0803F72C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, .L0803F780  @ gAiSt
	adds r1, r0, #0
	adds r1, #0x86
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803F776
	ldrb r0, [r1]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, .L0803F784  @ func_0803F680
	bl AiTryDoOffensiveAction
	ldr r5, .L0803F788  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq .L0803F776
	ldr r0, .L0803F78C  @ func_0803F6B8
	bl AiTryDoOffensiveAction
	movs r0, #0xa
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq .L0803F776
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
.L0803F776:
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F780: .4byte gAiSt
.L0803F784: .4byte func_0803F680
.L0803F788: .4byte gAiDecision
.L0803F78C: .4byte func_0803F6B8

	THUMB_FUNC_END func_0803F72C

	THUMB_FUNC_START func_0803F790
func_0803F790: @ 0x0803F790
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, .L0803F7C4  @ gAiSt
	ldrb r2, [r4, #1]
	adds r1, r3, #0
	adds r1, #0x7c
	strb r2, [r1]
	ldrb r4, [r4]
	cmp r0, r4
	bhi .L0803F7CC
	ldr r4, .L0803F7C8  @ IsUnitEnemyWithActiveUnit
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803F7D4
	adds r0, r4, #0
	bl AiTryDoOffensiveAction
	b .L0803F7D4
	.align 2, 0
.L0803F7C4: .4byte gAiSt
.L0803F7C8: .4byte IsUnitEnemyWithActiveUnit
.L0803F7CC:
	adds r1, r3, #0
	adds r1, #0x79
	movs r0, #4
	strb r0, [r1]
.L0803F7D4:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803F790

	THUMB_FUNC_START func_0803F7DC
func_0803F7DC: @ 0x0803F7DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	cmp r0, r1
	bhi .L0803F818
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803F820
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r4, [r4, #1]
	cmp r0, r4
	bhi .L0803F820
	ldr r0, .L0803F814  @ IsUnitEnemyWithActiveUnit
	bl AiTryDoOffensiveAction
	b .L0803F820
	.align 2, 0
.L0803F814: .4byte IsUnitEnemyWithActiveUnit
.L0803F818:
	ldr r0, .L0803F828  @ gAiSt
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
.L0803F820:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F828: .4byte gAiSt

	THUMB_FUNC_END func_0803F7DC

	THUMB_FUNC_START func_0803F82C
func_0803F82C: @ 0x0803F82C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, .L0803F888  @ 0x0000FFFF
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	mov r8, r1
	movs r2, #0xff
	mov sl, r2
	ldr r4, .L0803F88C  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L0803F890
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetNonEmptyBallistaAt
	cmp r0, #0
	beq .L0803F868
	b .L0803F990
.L0803F868:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r8
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xa
	movs r3, #0
	bl AiSetDecision
	b .L0803F990
	.align 2, 0
.L0803F888: .4byte 0x0000FFFF
.L0803F88C: .4byte gActiveUnit
.L0803F890:
	adds r0, r2, #0
	bl InitAiMoveMapForUnit
	ldr r0, .L0803F964  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803F918
.L0803F8A2:
	ldr r0, .L0803F964  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r9, r0
	cmp r4, #0
	blt .L0803F912
	ldr r7, .L0803F968  @ gMapMovement
	lsls r6, r5, #2
.L0803F8B6:
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803F90C
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetNonEmptyBallistaAt
	cmp r0, #0
	beq .L0803F90C
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, .L0803F96C  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0803F90C
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, sl
	bhi .L0803F90C
	adds r1, r0, #0
	mov sl, r1
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
.L0803F90C:
	subs r4, #1
	cmp r4, #0
	bge .L0803F8B6
.L0803F912:
	mov r5, r9
	cmp r5, #0
	bge .L0803F8A2
.L0803F918:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0803F936
	ldr r2, [sp, #0x10]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
.L0803F936:
	ldr r1, .L0803F970  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne .L0803F974
	ldrb r0, [r1, #2]
	cmp r0, r4
	bne .L0803F990
	ldrb r1, [r1, #3]
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne .L0803F990
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	b .L0803F990
	.align 2, 0
.L0803F964: .4byte gMapSize
.L0803F968: .4byte gMapMovement
.L0803F96C: .4byte gMapUnit
.L0803F970: .4byte gAiDecision
.L0803F974:
	mov r0, r8
	cmp r0, #0
	beq .L0803F988
	ldr r0, .L0803F984  @ gAiSt
	adds r0, #0x86
	movs r1, #7
	b .L0803F98E
	.align 2, 0
.L0803F984: .4byte gAiSt
.L0803F988:
	ldr r0, .L0803F9A4  @ gAiSt
	adds r0, #0x86
	movs r1, #6
.L0803F98E:
	strb r1, [r0]
.L0803F990:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803F9A4: .4byte gAiSt

	THUMB_FUNC_END func_0803F82C

	THUMB_FUNC_START func_0803F9A8
func_0803F9A8: @ 0x0803F9A8
	push {lr}
	sub sp, #4
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	movs r0, #1
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803F9A8

	THUMB_FUNC_START func_0803F9C8
func_0803F9C8: @ 0x0803F9C8
	ldr r0, .L0803F9D4  @ gAiSt
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
.L0803F9D4: .4byte gAiSt

	THUMB_FUNC_END func_0803F9C8

	THUMB_FUNC_START AiGetStaffAiIndex
AiGetStaffAiIndex: @ 0x0803F9D8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r0, .L0803F9F4  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803F9FC
	b .L0803FA30
	.align 2, 0
.L0803F9F4: .4byte gActiveUnit
.L0803F9F8:
	adds r0, r5, #0
	b .L0803FA34
.L0803F9FC:
	adds r0, r4, #0
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, .L0803FA3C  @ gUnknown_080D868C
	ldrh r0, [r4]
	cmp r0, #0
	beq .L0803FA30
	movs r3, #0
	adds r2, r4, #4
	adds r1, r4, #0
.L0803FA14:
	ldrh r0, [r1]
	cmp r6, r0
	bne .L0803FA20
	ldr r0, [r2]
	cmp r0, #0
	bne .L0803F9F8
.L0803FA20:
	adds r3, #8
	adds r2, #8
	adds r1, #8
	adds r5, #1
	adds r0, r3, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0803FA14
.L0803FA30:
	movs r0, #1
	negs r0, r0
.L0803FA34:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0803FA3C: .4byte gUnknown_080D868C

	THUMB_FUNC_END AiGetStaffAiIndex

	THUMB_FUNC_START AiTryDoStaff
AiTryDoStaff: @ 0x0803FA40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, .L0803FADC  @ gActiveUnit
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq .L0803FACA
	movs r5, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq .L0803FACA
	ldr r0, .L0803FAE0  @ gUnknown_080D8690
	mov r8, r0
.L0803FA68:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq .L0803FAB4
	adds r0, r4, #0
	bl GetItemRequiredExp
	cmp r0, r6
	blt .L0803FAB4
	adds r0, r4, #0
	bl AiGetStaffAiIndex
	adds r1, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0803FAB4
	lsls r0, r1, #3
	add r0, r8
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	bl _call_via_r2
	ldr r0, .L0803FAE4  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803FAB4
	adds r0, r4, #0
	bl GetItemRequiredExp
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
.L0803FAB4:
	adds r5, #1
	cmp r5, #4
	bgt .L0803FACA
	ldr r0, .L0803FADC  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L0803FA68
.L0803FACA:
	ldr r0, .L0803FAE4  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803FADC: .4byte gActiveUnit
.L0803FAE0: .4byte gUnknown_080D8690
.L0803FAE4: .4byte gAiDecision

	THUMB_FUNC_END AiTryDoStaff

	THUMB_FUNC_START GetAiSafestAccessibleAdjacentPosition
GetAiSafestAccessibleAdjacentPosition: @ 0x0803FAE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov r8, r2
	movs r0, #0
	mov sl, r0
	ldr r2, .L0803FB8C  @ gUnknown_085A92BC
	movs r1, #3
	mov r9, r1
.L0803FB04:
	ldr r0, [r2]
	ldr r1, [sp]
	adds r5, r1, r0
	ldr r0, [r2, #4]
	ldr r1, [sp, #4]
	adds r7, r1, r0
	ldr r0, .L0803FB90  @ gMapMovement
	ldr r0, [r0]
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi .L0803FB72
	ldr r0, .L0803FB94  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq .L0803FB3A
	ldr r0, .L0803FB98  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803FB72
.L0803FB3A:
	adds r0, r5, #0
	adds r1, r7, #0
	str r2, [sp, #8]
	bl AiGetPositionTerrainSafetyWeight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl AiGetPositionUnitSafetyWeight
	adds r4, r4, r0
	ldr r0, .L0803FB9C  @ gMapOther
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, .L0803FBA0  @ 0x7FFFFFFF
	adds r4, r4, r0
	ldr r2, [sp, #8]
	cmp sl, r4
	bcs .L0803FB72
	mov r1, r8
	strh r5, [r1]
	strh r7, [r1, #2]
	mov sl, r4
.L0803FB72:
	adds r2, #8
	movs r0, #1
	negs r0, r0
	add r9, r0
	mov r1, r9
	cmp r1, #0
	bge .L0803FB04
	mov r0, sl
	cmp r0, #0
	bne .L0803FBA4
	movs r0, #0
	b .L0803FBA6
	.align 2, 0
.L0803FB8C: .4byte gUnknown_085A92BC
.L0803FB90: .4byte gMapMovement
.L0803FB94: .4byte gMapUnit
.L0803FB98: .4byte gActiveUnitId
.L0803FB9C: .4byte gMapOther
.L0803FBA0: .4byte 0x7FFFFFFF
.L0803FBA4:
	movs r0, #1
.L0803FBA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAiSafestAccessibleAdjacentPosition

	THUMB_FUNC_START func_0803FBB8
func_0803FBB8: @ 0x0803FBB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	negs r1, r1
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r0, .L0803FD10  @ gActiveUnit
	ldr r0, [r0]
	bl AiFillMovementMapForUnit
	ldr r0, [sp, #0x18]
	bl BuildMagicSealRange
	bl MapMovementMarkFloodEdges
	ldr r0, .L0803FD14  @ gAiSt
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803FBFA
	adds r1, r0, #0
	mov sl, r1
.L0803FBFA:
	ldr r0, .L0803FD18  @ gMapSize
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt .L0803FCDA
.L0803FC06:
	ldr r0, .L0803FD18  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x20]
	cmp r6, #0
	blt .L0803FCD4
	lsls r4, r7, #2
	mov r8, r4
.L0803FC1A:
	ldr r0, .L0803FD1C  @ gMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803FCCE
	ldr r0, .L0803FD20  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, #0
	beq .L0803FCCE
	ldr r0, .L0803FD24  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq .L0803FCCE
	adds r0, r1, #0
	bl GetUnit
	adds r5, r0, #0
	ldr r0, .L0803FD28  @ gUnknown_0203AA7F
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0803FC6A
	mov r1, r9
	cmp r1, #0
	beq .L0803FC6A
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803FCCE
.L0803FC6A:
	ldr r2, .L0803FD2C  @ gUnknown_0203AA80
	ldrb r0, [r2]
	cmp r0, #0
	bne .L0803FC7C
	ldrb r1, [r5, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803FCCE
.L0803FC7C:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sl
	bhi .L0803FCCE
	add r5, sp, #0xc
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803FCCE
	mov sl, r4
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r4, #2
	ldrsh r2, [r5, r4]
	str r2, [sp, #0x18]
	ldr r0, .L0803FD20  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
.L0803FCCE:
	subs r6, #1
	cmp r6, #0
	bge .L0803FC1A
.L0803FCD4:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge .L0803FC06
.L0803FCDA:
	movs r0, #1
	negs r0, r0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq .L0803FCFE
	adds r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
.L0803FCFE:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FD10: .4byte gActiveUnit
.L0803FD14: .4byte gAiSt
.L0803FD18: .4byte gMapSize
.L0803FD1C: .4byte gMapMovement
.L0803FD20: .4byte gMapUnit
.L0803FD24: .4byte gActiveUnitId
.L0803FD28: .4byte gUnknown_0203AA7F
.L0803FD2C: .4byte gUnknown_0203AA80

	THUMB_FUNC_END func_0803FBB8

	THUMB_FUNC_START func_0803FD30
func_0803FD30: @ 0x0803FD30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	negs r1, r1
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r4, .L0803FEE0  @ gAiSt
	adds r5, r4, #0
	adds r5, #0x7b
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L0803FD62
	b .L0803FED0
.L0803FD62:
	ldr r0, .L0803FEE4  @ gActiveUnit
	ldr r0, [r0]
	bl AiFillMovementMapForUnit
	ldr r0, [sp, #0x18]
	bl BuildMagicSealRange
	adds r1, r4, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0803FD7E
	adds r3, r0, #0
	mov sl, r3
.L0803FD7E:
	movs r4, #1
	mov r8, r4
.L0803FD82:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	bne .L0803FD90
	b .L0803FEA0
.L0803FD90:
	ldr r0, [r6]
	cmp r0, #0
	bne .L0803FD98
	b .L0803FEA0
.L0803FD98:
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, .L0803FEE8  @ gMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, .L0803FEEC  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq .L0803FEA0
	ldr r0, [r6, #0xc]
	ldr r1, .L0803FEF0  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne .L0803FEA0
	ldr r0, .L0803FEF4  @ gUnknown_0203AA7F
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0803FDE0
	mov r1, r9
	cmp r1, #0
	beq .L0803FDE0
	adds r0, r6, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0803FEA0
.L0803FDE0:
	ldr r2, .L0803FEF8  @ gUnknown_0203AA80
	ldrb r0, [r2]
	cmp r0, #0
	bne .L0803FDF2
	ldrb r1, [r6, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803FEA0
.L0803FDF2:
	ldr r7, .L0803FEE4  @ gActiveUnit
	ldr r0, [r7]
	bl GetUnitMagRange
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r3, [r2, #0x1d]
	adds r1, r1, r3
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiArePointsWithinDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803FEA0
	ldr r0, .L0803FEFC  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r5, sp, #0xc
	adds r0, r5, #0
	bl func_0803C284
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803FEA0
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sl
	bhi .L0803FEA0
	mov sl, r0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r3, #2
	ldrsh r2, [r5, r3]
	str r2, [sp, #0x18]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, .L0803FEE8  @ gMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
.L0803FEA0:
	movs r4, #1
	add r8, r4
	mov r0, r8
	cmp r0, #0xbf
	bgt .L0803FEAC
	b .L0803FD82
.L0803FEAC:
	movs r0, #1
	negs r0, r0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq .L0803FED0
	adds r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
.L0803FED0:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FEE0: .4byte gAiSt
.L0803FEE4: .4byte gActiveUnit
.L0803FEE8: .4byte gMapUnit
.L0803FEEC: .4byte gActiveUnitId
.L0803FEF0: .4byte 0x00010005
.L0803FEF4: .4byte gUnknown_0203AA7F
.L0803FEF8: .4byte gUnknown_0203AA80
.L0803FEFC: .4byte gMapRange

	THUMB_FUNC_END func_0803FD30

	THUMB_FUNC_START func_0803FF00
func_0803FF00: @ 0x0803FF00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov r9, r0
	mov sl, r0
	ldr r0, .L0803FFF0  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0803FFE0
	bl func_0803C364
	cmp r0, #2
	ble .L0803FFE0
	ldr r0, .L0803FFF4  @ gActiveUnit
	ldr r0, [r0]
	bl AiFillMovementMapForUnit
	movs r0, #1
	negs r0, r0
	bl BuildMagicSealRange
	ldr r0, .L0803FFF8  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt .L0803FFB8
.L0803FF48:
	ldr r0, .L0803FFF8  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r5, #1
	cmp r4, #0
	blt .L0803FFB2
	lsls r6, r5, #2
.L0803FF58:
	ldr r0, .L0803FFFC  @ gMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0803FFAC
	ldr r0, .L08040000  @ gMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq .L0803FF80
	ldr r0, .L08040004  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0803FFAC
.L0803FF80:
	ldr r0, .L08040008  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L0803FFF4  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	bl func_0803C3B0
	cmp r0, r8
	ble .L0803FFAC
	mov r8, r0
	mov r9, r4
	mov sl, r5
.L0803FFAC:
	subs r4, #1
	cmp r4, #0
	bge .L0803FF58
.L0803FFB2:
	adds r5, r7, #0
	cmp r5, #0
	bge .L0803FF48
.L0803FFB8:
	mov r3, r8
	cmp r3, #1
	ble .L0803FFE0
	mov r1, r9
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0xc]
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl AiSetDecision
.L0803FFE0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803FFF0: .4byte gAiSt
.L0803FFF4: .4byte gActiveUnit
.L0803FFF8: .4byte gMapSize
.L0803FFFC: .4byte gMapMovement
.L08040000: .4byte gMapUnit
.L08040004: .4byte gActiveUnitId
.L08040008: .4byte gMapRange

	THUMB_FUNC_END func_0803FF00

	THUMB_FUNC_START func_0804000C
func_0804000C: @ 0x0804000C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r5, #0
	str r5, [sp, #0x1c]
	ldr r0, .L08040150  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L0804003C
	b .L0804013E
.L0804003C:
	ldr r0, .L08040154  @ gActiveUnit
	ldr r0, [r0]
	bl AiFillMovementMapForUnit
	movs r0, #1
	negs r0, r0
	bl BuildMagicSealRange
	bl MapMovementMarkFloodEdges
	ldr r0, .L08040158  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt .L08040108
.L0804005C:
	ldr r0, .L08040158  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r5, r7, #1
	str r5, [sp, #0x20]
	cmp r4, #0
	blt .L08040102
	lsls r0, r7, #2
	mov r8, r0
.L08040070:
	ldr r0, .L0804015C  @ gMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L080400FC
	ldr r0, .L08040160  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L080400FC
	bl GetUnit
	adds r5, r0, #0
	ldr r0, .L08040150  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L080400B8
	mov r1, r9
	cmp r1, #0
	beq .L080400B8
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L080400FC
.L080400B8:
	ldrb r1, [r5, #0xa]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne .L080400FC
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt .L080400FC
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080400FC
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r5, #0
	ldrsh r2, [r0, r5]
	str r2, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, .L08040160  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
.L080400FC:
	subs r4, #1
	cmp r4, #0
	bge .L08040070
.L08040102:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge .L0804005C
.L08040108:
	mov r2, sl
	cmp r2, #0
	beq .L0804013E
	add r4, sp, #0xc
	adds r0, r4, #0
	bl func_08040668
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804013E
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r5, [sp, #0x10]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
.L0804013E:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040150: .4byte gAiSt
.L08040154: .4byte gActiveUnit
.L08040158: .4byte gMapSize
.L0804015C: .4byte gMapMovement
.L08040160: .4byte gMapUnit

	THUMB_FUNC_END func_0804000C

	THUMB_FUNC_START func_08040164
func_08040164: @ 0x08040164
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r4, #0
	str r4, [sp, #0x1c]
	ldr r0, .L08040294  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08040282
	ldr r0, .L08040298  @ gActiveUnit
	ldr r0, [r0]
	bl AiFillMovementMapForUnit
	movs r0, #1
	negs r0, r0
	bl BuildMagicSealRange
	bl MapMovementMarkFloodEdges
	ldr r0, .L0804029C  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt .L08040262
.L080401B2:
	ldr r0, .L0804029C  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0
	blt .L0804025C
	lsls r1, r7, #2
	mov r8, r1
.L080401C6:
	ldr r0, .L080402A0  @ gMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L08040256
	ldr r0, .L080402A4  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08040256
	bl GetUnit
	adds r5, r0, #0
	ldr r0, .L08040294  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0804020E
	mov r2, r9
	cmp r2, #0
	beq .L0804020E
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L08040256
.L0804020E:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L08040256
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt .L08040256
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl GetAiSafestAccessibleAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040256
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, .L080402A4  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
.L08040256:
	subs r4, #1
	cmp r4, #0
	bge .L080401C6
.L0804025C:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge .L080401B2
.L08040262:
	mov r2, sl
	cmp r2, #0
	beq .L08040282
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
.L08040282:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040294: .4byte gAiSt
.L08040298: .4byte gActiveUnit
.L0804029C: .4byte gMapSize
.L080402A0: .4byte gMapMovement
.L080402A4: .4byte gMapUnit

	THUMB_FUNC_END func_08040164

	THUMB_FUNC_START func_080402A8
func_080402A8: @ 0x080402A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
.L080402AE:
	lsls r0, r6, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq .L080402F6
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, .L080402EC  @ 0x00000405
	ands r1, r0
	cmp r1, #0
	beq .L080402F0
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080402E8
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080402F0
.L080402E8:
	movs r0, #1
	b .L080402F8
	.align 2, 0
.L080402EC: .4byte 0x00000405
.L080402F0:
	adds r6, #1
	cmp r6, #4
	ble .L080402AE
.L080402F6:
	movs r0, #0
.L080402F8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080402A8

	THUMB_FUNC_START func_08040300
func_08040300: @ 0x08040300
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L0804031C  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r5, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi .L08040320
	movs r0, #0
	b .L0804034C
	.align 2, 0
.L0804031C: .4byte gActiveUnit
.L08040320:
	adds r0, r5, #0
	bl GetUnitPower
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq .L0804034A
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq .L0804034A
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
.L0804034A:
	adds r0, r4, #0
.L0804034C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08040300

	THUMB_FUNC_START func_08040354
func_08040354: @ 0x08040354
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sl, r1
	movs r0, #0
	str r0, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x1c]
	movs r3, #0
	str r3, [sp, #0x20]
	ldr r0, .L080404D0  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L08040384
	b .L080404C0
.L08040384:
	ldr r0, .L080404D4  @ gActiveUnit
	ldr r0, [r0]
	bl AiFillMovementMapForUnit
	movs r0, #1
	negs r0, r0
	bl BuildMagicSealRange
	movs r4, #1
	mov r9, r4
.L08040398:
	mov r0, r9
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq .L08040490
	ldr r0, [r6]
	cmp r0, #0
	beq .L08040490
	ldr r0, [r6, #0xc]
	ldr r1, .L080404D8  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne .L08040490
	ldr r0, .L080404D0  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L080403D4
	mov r0, sl
	cmp r0, #0
	beq .L080403D4
	adds r0, r6, #0
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040490
.L080403D4:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq .L08040490
	adds r0, r6, #0
	bl func_0803C44C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040490
	ldr r1, .L080404D4  @ gActiveUnit
	mov r8, r1
	ldr r0, [r1]
	bl GetUnitMagRange
	mov r3, r8
	ldr r2, [r3]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r4, [r2, #0x1d]
	adds r1, r1, r4
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiArePointsWithinDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040490
	adds r0, r6, #0
	bl func_080402A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040490
	adds r0, r6, #0
	bl func_08040300
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq .L08040490
	ldr r0, [sp, #0x14]
	cmp r7, r0
	bcc .L08040490
	ldr r0, .L080404DC  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	mov r1, r8
	ldr r0, [r1]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r4, sp, #0xc
	adds r0, r4, #0
	bl func_0803C284
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040490
	str r7, [sp, #0x14]
	add r0, sp, #0xc
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x18]
	movs r1, #2
	ldrsh r0, [r4, r1]
	str r0, [sp, #0x1c]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x20]
.L08040490:
	movs r2, #1
	add r9, r2
	mov r3, r9
	cmp r3, #0xbf
	bgt .L0804049C
	b .L08040398
.L0804049C:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq .L080404C0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	lsls r3, r2, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
.L080404C0:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080404D0: .4byte gAiSt
.L080404D4: .4byte gActiveUnit
.L080404D8: .4byte 0x00010005
.L080404DC: .4byte gMapRange

	THUMB_FUNC_END func_08040354

	THUMB_FUNC_START func_080404E0
func_080404E0: @ 0x080404E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r3, #0
	str r3, [sp, #0x1c]
	ldr r0, .L08040654  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L08040510
	b .L08040642
.L08040510:
	ldr r0, .L08040658  @ gActiveUnit
	ldr r0, [r0]
	bl AiFillMovementMapForUnit
	movs r0, #1
	negs r0, r0
	bl BuildMagicSealRange
	movs r4, #1
	mov r8, r4
.L08040524:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq .L08040612
	ldr r0, [r6]
	cmp r0, #0
	beq .L08040612
	ldr r0, [r6, #0xc]
	ldr r1, .L0804065C  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne .L08040612
	ldr r0, .L08040654  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08040560
	mov r0, r9
	cmp r0, #0
	beq .L08040560
	adds r0, r6, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040612
.L08040560:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L08040612
	ldr r7, .L08040658  @ gActiveUnit
	ldr r0, [r7]
	bl GetUnitMagRange
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r3, [r2, #0x1d]
	adds r1, r1, r3
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiArePointsWithinDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040612
	adds r0, r6, #0
	bl func_080402A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040612
	ldr r0, [r7]
	adds r1, r6, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls .L08040612
	movs r0, #8
	ldrsb r0, [r6, r0]
	adds r0, r1, r0
	cmp r0, sl
	blt .L08040612
	ldr r0, .L08040660  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r4, sp, #0xc
	adds r0, r4, #0
	bl func_0803C284
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040612
	ldrb r0, [r6, #8]
	mov sl, r0
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r0, #2
	ldrsh r3, [r4, r0]
	str r3, [sp, #0x18]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x1c]
.L08040612:
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #0xbf
	bgt .L0804061E
	b .L08040524
.L0804061E:
	mov r3, sl
	cmp r3, #0
	beq .L08040642
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
.L08040642:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040654: .4byte gAiSt
.L08040658: .4byte gActiveUnit
.L0804065C: .4byte 0x00010005
.L08040660: .4byte gMapRange

	THUMB_FUNC_END func_080404E0

	THUMB_FUNC_START nullsub_29
nullsub_29: @ 0x08040664
	bx lr

	THUMB_FUNC_END nullsub_29

	THUMB_FUNC_START func_08040668
func_08040668: @ 0x08040668
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	mov r8, r0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, .L0804073C  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	str r0, [sp, #0x10]
	bl GetCurrentPhase
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #0x80
	cmp r4, r0
	blt .L080406A2
	b .L080407CA
.L080406A2:
	adds r0, r4, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x18]
	cmp r7, #0
	bne .L080406BA
	b .L080407C0
.L080406BA:
	ldr r0, [r7]
	cmp r0, #0
	bne .L080406C2
	b .L080407C0
.L080406C2:
	ldr r0, [r7, #0xc]
	ldr r1, .L08040740  @ 0x00010025
	ands r0, r1
	cmp r0, #0
	bne .L080407C0
	adds r0, r7, #0
	bl func_08041054
	ldr r0, .L08040744  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt .L0804079A
.L080406DE:
	ldr r0, .L08040744  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r6, #1
	mov r9, r0
	cmp r4, #0
	blt .L08040794
	ldr r3, .L08040748  @ gMapRange
	lsls r5, r6, #2
.L080406F2:
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, #0x78
	bhi .L0804078E
	ldr r0, .L0804074C  @ gMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08040750
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	str r3, [sp, #0x20]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x20]
	cmp r0, #0
	bne .L0804078E
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r8, r0
	ble .L0804078E
	ldrb r1, [r1]
	mov r8, r1
	b .L0804078E
	.align 2, 0
.L0804073C: .4byte gActiveUnit
.L08040740: .4byte 0x00010025
.L08040744: .4byte gMapSize
.L08040748: .4byte gMapRange
.L0804074C: .4byte gMapUnit
.L08040750:
	ldr r0, .L080407D4  @ gMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L0804078E
	ldr r0, .L080407D8  @ gMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x78
	ble .L0804078E
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp sl, r0
	ble .L0804078E
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	ldrb r2, [r2]
	mov sl, r2
.L0804078E:
	subs r4, #1
	cmp r4, #0
	bge .L080406F2
.L08040794:
	mov r6, r9
	cmp r6, #0
	bge .L080406DE
.L0804079A:
	mov r0, r8
	cmp r0, #0xff
	beq .L080407C0
	ldr r1, [sp, #4]
	cmp r1, r8
	bcc .L080407C0
	mov r0, sl
	cmp r0, #0xff
	beq .L080407C0
	mov r1, sp
	ldrh r0, [r1, #8]
	ldr r1, [sp]
	strh r0, [r1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldr r1, [sp]
	strh r0, [r1, #2]
	mov r1, r8
	str r1, [sp, #4]
.L080407C0:
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	cmp r4, r0
	bge .L080407CA
	b .L080406A2
.L080407CA:
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne .L080407DC
	movs r0, #0
	b .L080407DE
	.align 2, 0
.L080407D4: .4byte gMapTerrain
.L080407D8: .4byte gMapMovement
.L080407DC:
	movs r0, #1
.L080407DE:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08040668

	THUMB_FUNC_START func_080407F0
func_080407F0: @ 0x080407F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, .L08040820  @ gUnknown_080D86F4
	ldrh r0, [r3]
	cmp r0, #0
	beq .L08040834
	movs r1, #0
	adds r2, r3, #0
	adds r6, r2, #4
.L0804080E:
	ldrh r0, [r2]
	cmp r5, r0
	bne .L08040824
	adds r0, r1, r6
	ldr r0, [r0]
	cmp r0, #0
	beq .L08040824
	adds r0, r4, #0
	b .L08040838
	.align 2, 0
.L08040820: .4byte gUnknown_080D86F4
.L08040824:
	adds r1, #8
	adds r2, #8
	adds r4, #1
	ldr r3, .L08040840  @ gUnknown_080D86F4
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0804080E
.L08040834:
	movs r0, #1
	negs r0, r0
.L08040838:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08040840: .4byte gUnknown_080D86F4

	THUMB_FUNC_END func_080407F0

	THUMB_FUNC_START AiTryDoSpecialItems
AiTryDoSpecialItems: @ 0x08040844
	push {r4, r5, r6, lr}
	ldr r0, .L08040858  @ gAiSt
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804085C
	movs r0, #0
	b .L080408D6
	.align 2, 0
.L08040858: .4byte gAiSt
.L0804085C:
	bl AiTrySomethingPick
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080408D4
	movs r5, #0
	ldr r0, .L080408C4  @ gActiveUnit
	ldr r0, [r0]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq .L080408B0
	ldr r6, .L080408C8  @ gUnknown_080D86F8
.L08040874:
	adds r0, r4, #0
	bl GetItemKind
	cmp r0, #0
	beq .L0804089A
	adds r0, r4, #0
	bl func_080407F0
	adds r1, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0804089A
	lsls r0, r1, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
.L0804089A:
	adds r5, #1
	cmp r5, #4
	bgt .L080408B0
	ldr r0, .L080408C4  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L08040874
.L080408B0:
	ldr r0, .L080408CC  @ gAiSt
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080408D4
	ldr r0, .L080408D0  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L080408D6
	.align 2, 0
.L080408C4: .4byte gActiveUnit
.L080408C8: .4byte gUnknown_080D86F8
.L080408CC: .4byte gAiSt
.L080408D0: .4byte gAiDecision
.L080408D4:
	movs r0, #1
.L080408D6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTryDoSpecialItems

	THUMB_FUNC_START func_080408DC
func_080408DC: @ 0x080408DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, .L08040964  @ gAiSt
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, .L08040968  @ 0x80000001
	ands r0, r1
	cmp r0, #0
	beq .L0804095C
	ldr r0, .L0804096C  @ gActiveUnit
	ldr r0, [r0]
	add r5, sp, #0xc
	adds r1, r5, #0
	bl func_08040B38
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804095C
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, .L08040970  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne .L0804095C
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	movs r5, #0
	str r5, [sp]
	bl AiArePointsWithinDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0804095C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
.L0804095C:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08040964: .4byte gAiSt
.L08040968: .4byte 0x80000001
.L0804096C: .4byte gActiveUnit
.L08040970: .4byte gAiDecision

	THUMB_FUNC_END func_080408DC

	THUMB_FUNC_START func_08040974
func_08040974: @ 0x08040974
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r5, #0
	ldr r6, .L080409B4  @ gAiSt
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L08040A64
	ldr r4, .L080409B8  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble .L080409BC
	ldr r2, [r4]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne .L080409BC
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	adds r0, r6, #0
	adds r0, #0x79
	strb r5, [r0]
	b .L08040A64
	.align 2, 0
.L080409B4: .4byte gAiSt
.L080409B8: .4byte gActiveUnit
.L080409BC:
	ldr r6, .L08040A6C  @ gActiveUnit
	ldr r2, [r6]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r4, #4
	ands r0, r4
	cmp r0, #0
	beq .L08040A64
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #4
	ble .L080409DE
	orrs r5, r4
.L080409DE:
	ldr r1, [r6]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x1c
	bne .L080409F6
	ldrb r1, [r1, #0xa]
	movs r2, #8
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L080409F6
	orrs r5, r2
.L080409F6:
	ldr r0, .L08040A6C  @ gActiveUnit
	ldr r0, [r0]
	add r6, sp, #0xc
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl AiSomethingGetPick
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040A64
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, .L08040A70  @ gAiSt
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, .L08040A74  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne .L08040A64
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl AiArePointsWithinDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040A64
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
.L08040A64:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040A6C: .4byte gActiveUnit
.L08040A70: .4byte gAiSt
.L08040A74: .4byte gAiDecision

	THUMB_FUNC_END func_08040974

	THUMB_FUNC_START func_08040A78
func_08040A78: @ 0x08040A78
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, .L08040AD8  @ gAiSt
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L08040ACE
	ldr r0, .L08040ADC  @ gActiveUnit
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne .L08040ACE
	add r4, sp, #0xc
	adds r0, r2, #0
	adds r1, r4, #0
	bl AiFindUnitSafestTileToMoveTo
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040ACE
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
.L08040ACE:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08040AD8: .4byte gAiSt
.L08040ADC: .4byte gActiveUnit

	THUMB_FUNC_END func_08040A78

	THUMB_FUNC_START func_08040AE0
func_08040AE0: @ 0x08040AE0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, .L08040B18  @ gMapRange
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt .L08040B14
	ldr r0, .L08040B1C  @ gMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq .L08040B24
	ldr r0, .L08040B20  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq .L08040B24
.L08040B14:
	movs r0, #0xff
	b .L08040B30
	.align 2, 0
.L08040B18: .4byte gMapRange
.L08040B1C: .4byte gMapUnit
.L08040B20: .4byte gActiveUnitId
.L08040B24:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
.L08040B30:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08040AE0

	THUMB_FUNC_START func_08040B38
func_08040B38: @ 0x08040B38
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl func_08040FBC
	ldr r0, .L08040B7C  @ gUnknown_085A92DC
	movs r1, #0
	adds r2, r4, #0
	bl func_0803AE94
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040B84
	adds r0, r5, #0
	bl func_08040E98
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, .L08040B80  @ gMapRange
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt .L08040B84
	movs r0, #1
	b .L08040B86
	.align 2, 0
.L08040B7C: .4byte gUnknown_085A92DC
.L08040B80: .4byte gMapRange
.L08040B84:
	movs r0, #0
.L08040B86:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08040B38

	THUMB_FUNC_START func_08040B8C
func_08040B8C: @ 0x08040B8C
	push {r4, lr}
	adds r4, r1, #0
	bl func_08040E98
	ldr r0, .L08040BA8  @ gUnknown_085A92DE
	movs r1, #0
	adds r2, r4, #0
	bl AiFindClosestTileInRangeWithListedTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08040BAC
	movs r0, #1
	b .L08040BAE
	.align 2, 0
.L08040BA8: .4byte gUnknown_085A92DE
.L08040BAC:
	movs r0, #0
.L08040BAE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08040B8C

	THUMB_FUNC_START AiSomethingGetPick
AiSomethingGetPick: @ 0x08040BB4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r7, r3, #0
	bl InitAiMoveMapForUnit
	adds r0, r5, #0
	bl InitAiRangeMoveMapForUnitWithDoorsPassable
	movs r0, #1
	orrs r0, r6
	adds r1, r4, #0
	adds r2, r7, #0
	bl AiSomethingCheckPick
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040C04
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, .L08040C00  @ gMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt .L08040C04
.L08040BFA:
	movs r0, #1
	b .L08040C4C
	.align 2, 0
.L08040C00: .4byte gMapMovement
.L08040C04:
	adds r0, r5, #0
	bl func_08040FBC
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl AiSomethingCheckPick
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040C4A
	movs r3, #2
	ldrsh r1, [r4, r3]
	ldr r0, .L08040C54  @ gMapMovement
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt .L08040BFA
	ldr r0, .L08040C58  @ gMapUnit
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08040BFA
.L08040C4A:
	movs r0, #0
.L08040C4C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08040C54: .4byte gMapMovement
.L08040C58: .4byte gMapUnit

	THUMB_FUNC_END AiSomethingGetPick

	THUMB_FUNC_START AiTrySomethingPick
AiTrySomethingPick: @ 0x08040C5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r6, #0
	ldr r4, .L08040C74  @ gActiveUnit
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x33
	beq .L08040C78
	movs r0, #0
	b .L08040DC2
	.align 2, 0
.L08040C74: .4byte gActiveUnit
.L08040C78:
	adds r0, r1, #0
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #4
	ble .L08040CA4
	ldr r3, [r4]
	ldrb r2, [r3, #0xa]
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	bne .L08040CA4
	movs r1, #8
	orrs r1, r2
	strb r1, [r3, #0xa]
	ldr r1, .L08040CA0  @ gAiSt
	adds r1, #0x79
	strb r6, [r1]
	b .L08040DC2
	.align 2, 0
.L08040CA0: .4byte gAiSt
.L08040CA4:
	ldr r0, .L08040D2C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bne .L08040D3C
	ldr r4, .L08040D30  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble .L08040CC0
	movs r0, #0xc
	orrs r6, r0
.L08040CC0:
	ldr r0, [r4]
	add r7, sp, #0xc
	add r5, sp, #0x10
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl AiSomethingGetPick
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040DC0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	ldr r2, .L08040D34  @ gAiSt
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r6, #0
	str r6, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, .L08040D38  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne .L08040DC0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r6, [sp]
	bl AiArePointsWithinDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040DC0
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	str r6, [sp]
	ldrb r2, [r5]
	str r2, [sp, #4]
	ldrh r2, [r5, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	b .L08040DA6
	.align 2, 0
.L08040D2C: .4byte gPlaySt
.L08040D30: .4byte gActiveUnit
.L08040D34: .4byte gAiSt
.L08040D38: .4byte gAiDecision
.L08040D3C:
	ldr r4, .L08040DB4  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	bgt .L08040DC0
	ldr r0, [r4]
	add r6, sp, #0xc
	adds r1, r6, #0
	bl func_08040B8C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040DC0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, .L08040DB8  @ gAiSt
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, .L08040DBC  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne .L08040DC0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl AiArePointsWithinDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08040DC0
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	str r5, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	ldrb r2, [r4, #3]
.L08040DA6:
	str r2, [sp, #8]
	movs r2, #0xd
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	b .L08040DC2
	.align 2, 0
.L08040DB4: .4byte gActiveUnit
.L08040DB8: .4byte gAiSt
.L08040DBC: .4byte gAiDecision
.L08040DC0:
	movs r0, #0
.L08040DC2:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTrySomethingPick

	THUMB_FUNC_START AiSetMovCostTableWithPassableWalls
AiSetMovCostTableWithPassableWalls: @ 0x08040DCC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #1
	ldr r3, .L08040DEC  @ gWorkingMoveTable
	movs r5, #1
.L08040DD6:
	adds r0, r4, r2
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L08040DF0
	adds r0, r2, r3
	strb r1, [r0]
	b .L08040DF4
	.align 2, 0
.L08040DEC: .4byte gWorkingMoveTable
.L08040DF0:
	adds r0, r2, r3
	strb r5, [r0]
.L08040DF4:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls .L08040DD6
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END AiSetMovCostTableWithPassableWalls

	THUMB_FUNC_START AiSetMovCostTableWithTerrainSetAsPassable
AiSetMovCostTableWithTerrainSetAsPassable: @ 0x08040E04
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	movs r2, #1
	ldr r6, .L08040E30  @ gWorkingMoveTable
	adds r4, r6, #0
.L08040E10:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls .L08040E10
	adds r1, r5, r6
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08040E30: .4byte gWorkingMoveTable

	THUMB_FUNC_END AiSetMovCostTableWithTerrainSetAsPassable

	THUMB_FUNC_START func_08040E34
func_08040E34: @ 0x08040E34
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r3, #1
	ldr r2, .L08040E64  @ gWorkingMoveTable
	adds r5, r2, #0
.L08040E42:
	adds r1, r3, r5
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x40
	bls .L08040E42
	adds r0, r6, r2
	movs r1, #1
	strb r1, [r0]
	adds r0, r7, r2
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08040E64: .4byte gWorkingMoveTable

	THUMB_FUNC_END func_08040E34

	THUMB_FUNC_START InitAiMoveMapForUnit
InitAiMoveMapForUnit: @ 0x08040E68
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, .L08040E94  @ gMapMovement
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040E94: .4byte gMapMovement

	THUMB_FUNC_END InitAiMoveMapForUnit

	THUMB_FUNC_START func_08040E98
func_08040E98: @ 0x08040E98
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, .L08040EC4  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040EC4: .4byte gMapRange

	THUMB_FUNC_END func_08040E98

	THUMB_FUNC_START func_08040EC8
func_08040EC8: @ 0x08040EC8
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, .L08040EF4  @ gMapMovement
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040EF4: .4byte gMapMovement

	THUMB_FUNC_END func_08040EC8

	THUMB_FUNC_START func_08040EF8
func_08040EF8: @ 0x08040EF8
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, .L08040F24  @ gMapMovement
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040F24: .4byte gMapMovement

	THUMB_FUNC_END func_08040EF8

	THUMB_FUNC_START AiMapRangeFillMovementWithPassableWalls
AiMapRangeFillMovementWithPassableWalls: @ 0x08040F28
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, .L08040F50  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08040F50: .4byte gMapRange

	THUMB_FUNC_END AiMapRangeFillMovementWithPassableWalls

	THUMB_FUNC_START func_08040F54
func_08040F54: @ 0x08040F54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, .L08040F84  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08040F84: .4byte gMapRange

	THUMB_FUNC_END func_08040F54

	THUMB_FUNC_START InitAiRangeMoveMapForUnitWithDoorsPassable
InitAiRangeMoveMapForUnitWithDoorsPassable: @ 0x08040F88
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl AiSetMovCostTableWithTerrainSetAsPassable
	ldr r0, .L08040FB8  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040FB8: .4byte gMapRange

	THUMB_FUNC_END InitAiRangeMoveMapForUnitWithDoorsPassable

	THUMB_FUNC_START func_08040FBC
func_08040FBC: @ 0x08040FBC
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl AiSetMovCostTableWithTerrainSetAsPassable
	ldr r0, .L08040FE8  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08040FE8: .4byte gMapRange

	THUMB_FUNC_END func_08040FBC

	THUMB_FUNC_START func_08040FEC
func_08040FEC: @ 0x08040FEC
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1b
	movs r2, #0x33
	bl func_08040E34
	ldr r0, .L0804101C  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804101C: .4byte gMapRange

	THUMB_FUNC_END func_08040FEC

	THUMB_FUNC_START func_08041020
func_08041020: @ 0x08041020
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1b
	movs r2, #0x33
	bl func_08040E34
	ldr r0, .L08041050  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08041050: .4byte gMapRange

	THUMB_FUNC_END func_08041020

	THUMB_FUNC_START func_08041054
func_08041054: @ 0x08041054
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, .L0804108C  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804108C: .4byte gMapRange

	THUMB_FUNC_END func_08041054

	THUMB_FUNC_START AiUpdateNoMoveFlag
AiUpdateNoMoveFlag: @ 0x08041090
	push {lr}
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq .L080410B0
	ldr r0, .L080410AC  @ gAiSt
	adds r0, #0x7b
	ldrb r2, [r0]
	movs r1, #2
	orrs r1, r2
	b .L080410BA
	.align 2, 0
.L080410AC: .4byte gAiSt
.L080410B0:
	ldr r0, .L080410C0  @ gAiSt
	adds r0, #0x7b
	ldrb r2, [r0]
	movs r1, #0xfd
	ands r1, r2
.L080410BA:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L080410C0: .4byte gAiSt

	THUMB_FUNC_END AiUpdateNoMoveFlag

	THUMB_FUNC_START func_080410C4
func_080410C4: @ 0x080410C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, .L080410F4  @ gMapRange
	ldr r0, [r0]
	bl SetWorkingMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080410F4: .4byte gMapRange

	THUMB_FUNC_END func_080410C4

	THUMB_FUNC_START func_080410F8
func_080410F8: @ 0x080410F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	str r0, [r7]
	movs r2, #1
	negs r2, r2
	mov r9, r2
	ldr r0, .L080411E4  @ gMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt .L080411D2
.L08041128:
	ldr r0, .L080411E4  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r1, #1
	mov sl, r0
	cmp r5, #0
	blt .L080411CC
	lsls r6, r1, #2
.L0804113A:
	ldr r0, .L080411E8  @ gMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080411C6
	ldr r4, .L080411EC  @ gMapUnit
	ldr r0, [r4]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq .L080411C6
	ldr r0, .L080411F0  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080411C6
	ldr r0, [r4]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls .L080411C6
	adds r0, r1, #0
	cmp r0, #0xb
	beq .L080411C6
	cmp r0, #0xd
	beq .L080411C6
	mov r1, r8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080411F4  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl GetOffensiveStaffAccuracy
	ldr r2, [sp]
	cmp r0, r2
	blt .L080411C6
	mov r0, r9
	cmp r0, #0
	bge .L080411C0
	ldrb r4, [r4, #0xb]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r9, r4
.L080411C0:
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
.L080411C6:
	subs r5, #1
	cmp r5, #0
	bge .L0804113A
.L080411CC:
	mov r1, sl
	cmp r1, #0
	bge .L08041128
.L080411D2:
	mov r0, r9
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080411E4: .4byte gMapSize
.L080411E8: .4byte gMapRange
.L080411EC: .4byte gMapUnit
.L080411F0: .4byte gActiveUnitId
.L080411F4: .4byte gActiveUnit

	THUMB_FUNC_END func_080410F8

	THUMB_FUNC_START func_080411F8
func_080411F8: @ 0x080411F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r9, r0
	movs r4, #0
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	movs r3, #0
	str r3, [sp, #0x14]
	str r1, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r1, .L08041234  @ gPlaySt
	ldrh r1, [r1, #0x10]
	cmp r1, #1
	bhi .L0804123C
	ldr r0, .L08041238  @ gAiSt
	adds r1, r0, #0
	adds r1, #0x86
	strb r3, [r1]
	adds r0, #0x87
	mov r4, sp
	ldrb r4, [r4, #0x14]
	strb r4, [r0]
	movs r0, #0
	b .L080413B8
	.align 2, 0
.L08041234: .4byte gPlaySt
.L08041238: .4byte gAiSt
.L0804123C:
	movs r1, #0
	str r1, [sp, #8]
	b .L08041248
.L08041242:
	ldr r2, [sp, #8]
	adds r2, #1
	str r2, [sp, #8]
.L08041248:
	ldr r3, [sp, #8]
	cmp r3, #4
	bgt .L0804126C
	ldr r1, .L08041388  @ gActiveUnit
	ldr r1, [r1]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	cmp r1, #0
	beq .L0804126C
	adds r0, r1, #0
	bl GetItemIid
	adds r1, r0, #0
	cmp r1, #0xa6
	bne .L08041242
	movs r4, #1
.L0804126C:
	cmp r4, #0
	bne .L08041272
	b .L080413B8
.L08041272:
	ldr r0, .L08041388  @ gActiveUnit
	ldr r0, [r0]
	bl AiFillMovementMapForUnit
	movs r0, #1
	negs r0, r0
	bl BuildMagicSealRange
	ldr r0, .L0804138C  @ gMapSize
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt .L08041348
.L0804128E:
	ldr r0, .L0804138C  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x24]
	cmp r6, #0
	blt .L08041342
	lsls r3, r7, #2
	mov r8, r3
	lsls r4, r7, #0x10
	mov sl, r4
.L080412A6:
	ldr r0, .L08041390  @ gMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi .L0804133C
	ldr r0, .L08041394  @ gMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, #0
	beq .L080412CE
	ldr r0, .L08041398  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne .L0804133C
.L080412CE:
	ldr r0, .L0804139C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	movs r0, #0xa6
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0xa6
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, sl
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapIncInBoundedRange
	mov r3, r9
	ldrb r2, [r3, #2]
	mov r0, sp
	add r1, sp, #4
	bl func_080410F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldr r4, [sp, #0x14]
	cmp r2, r4
	ble .L0804131A
	str r2, [sp, #0x14]
.L0804131A:
	mov r1, r9
	ldrb r1, [r1]
	cmp r2, r1
	blt .L0804133C
	ldr r1, [sp, #4]
	mov r3, r9
	ldrb r3, [r3, #1]
	cmp r1, r3
	blt .L0804133C
	ldr r4, [sp, #0x10]
	cmp r1, r4
	ble .L0804133C
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r6, [sp, #0x1c]
	str r7, [sp, #0x20]
	str r0, [sp, #0x18]
.L0804133C:
	subs r6, #1
	cmp r6, #0
	bge .L080412A6
.L08041342:
	ldr r7, [sp, #0x24]
	cmp r7, #0
	bge .L0804128E
.L08041348:
	ldr r1, [sp, #0xc]
	mov r0, r9
	ldrb r0, [r0, #1]
	cmp r1, r0
	blt .L080413A4
	ldr r1, .L080413A0  @ gAiSt
	adds r2, r1, #0
	adds r2, #0x86
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x87
	mov r2, sp
	ldrb r2, [r2, #0x1c]
	strb r2, [r0]
	adds r0, #1
	add r3, sp, #0x20
	ldrb r3, [r3]
	strb r3, [r0]
	adds r0, #1
	mov r4, sp
	ldrb r4, [r4, #0x18]
	strb r4, [r0]
	adds r0, #1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
	adds r0, #1
	mov r3, sp
	ldrb r3, [r3, #0x14]
	strb r3, [r0]
	b .L080413B6
	.align 2, 0
.L08041388: .4byte gActiveUnit
.L0804138C: .4byte gMapSize
.L08041390: .4byte gMapMovement
.L08041394: .4byte gMapUnit
.L08041398: .4byte gActiveUnitId
.L0804139C: .4byte gMapRange
.L080413A0: .4byte gAiSt
.L080413A4:
	ldr r0, .L080413C8  @ gAiSt
	adds r2, r0, #0
	adds r2, #0x86
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x87
	mov r4, sp
	ldrb r4, [r4, #0x14]
	strb r4, [r0]
.L080413B6:
	movs r0, #0
.L080413B8:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080413C8: .4byte gAiSt

	THUMB_FUNC_END func_080411F8

	THUMB_FUNC_START func_080413CC
func_080413CC: @ 0x080413CC
	push {lr}
	sub sp, #0xc
	ldr r2, .L08041400  @ gAiSt
	adds r0, r2, #0
	adds r0, #0x87
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x88
	ldrb r1, [r1]
	adds r3, r2, #0
	adds r3, #0x89
	ldrb r3, [r3]
	adds r2, #0x8a
	ldrb r2, [r2]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xb
	bl AiSetDecision
	movs r0, #1
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
.L08041400: .4byte gAiSt

	THUMB_FUNC_END func_080413CC

	THUMB_FUNC_START func_08041404
func_08041404: @ 0x08041404
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	movs r7, #0
	ldr r0, .L08041438  @ gPlaySt
	ldrh r0, [r0, #0x10]
	cmp r0, #1
	bne .L08041444
	ldr r2, .L0804143C  @ gAiSt
	adds r1, r2, #0
	adds r1, #0x86
	strb r0, [r1]
	ldr r0, .L08041440  @ gActiveUnit
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	adds r3, r2, #0
	adds r3, #0x87
	strb r0, [r3]
	ldrb r1, [r1, #0x11]
	adds r0, r2, #0
	adds r0, #0x88
	b .L0804156A
	.align 2, 0
.L08041438: .4byte gPlaySt
.L0804143C: .4byte gAiSt
.L08041440: .4byte gActiveUnit
.L08041444:
	ldr r0, .L0804154C  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L08041550  @ gActiveUnit
	ldr r0, [r0]
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	movs r0, #0xa6
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0xa6
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapIncInBoundedRange
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl func_080410F8
	ldr r0, [sp]
	mov r1, sl
	ldrb r1, [r1]
	cmp r0, r1
	blt .L08041564
	ldr r0, .L08041554  @ gMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt .L08041524
.L0804149C:
	ldr r0, .L08041554  @ gMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r2, r0, #1
	subs r0, r6, #1
	mov r9, r0
	cmp r2, #0
	blt .L0804151E
.L080414AC:
	ldr r0, .L08041558  @ gMapUnit
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r4, [r0]
	subs r2, #1
	mov r8, r2
	cmp r4, #0
	beq .L08041518
	ldr r0, .L0804155C  @ gActiveUnitId
	ldrb r1, [r0]
	cmp r4, r1
	beq .L08041518
	ldrb r0, [r0]
	adds r1, r4, #0
	bl AreAllegiancesAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08041518
	adds r0, r4, #0
	bl GetUnit
	adds r4, r0, #0
	mov r2, sl
	ldr r3, [r2, #4]
	ldrb r2, [r3]
	cmp r2, #0
	beq .L08041518
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	adds r5, r0, #0
	cmp r1, r2
	bne .L080414FE
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	beq .L08041516
.L080414FE:
	adds r3, #0x14
	ldrb r1, [r3]
	cmp r1, #0
	beq .L08041518
	ldrb r0, [r5, #4]
	cmp r0, r1
	bne .L080414FE
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne .L080414FE
.L08041516:
	adds r7, #1
.L08041518:
	mov r2, r8
	cmp r2, #0
	bge .L080414AC
.L0804151E:
	mov r6, r9
	cmp r6, #0
	bge .L0804149C
.L08041524:
	mov r0, sl
	ldrb r0, [r0, #1]
	cmp r7, r0
	bge .L08041564
	ldr r2, .L08041560  @ gAiSt
	adds r1, r2, #0
	adds r1, #0x86
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L08041550  @ gActiveUnit
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	adds r3, r2, #0
	adds r3, #0x87
	strb r0, [r3]
	ldrb r1, [r1, #0x11]
	adds r0, r2, #0
	adds r0, #0x88
	b .L0804156A
	.align 2, 0
.L0804154C: .4byte gMapRange
.L08041550: .4byte gActiveUnit
.L08041554: .4byte gMapSize
.L08041558: .4byte gMapUnit
.L0804155C: .4byte gActiveUnitId
.L08041560: .4byte gAiSt
.L08041564:
	ldr r0, .L08041580  @ gAiSt
	adds r0, #0x86
	movs r1, #0
.L0804156A:
	strb r1, [r0]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08041580: .4byte gAiSt

	THUMB_FUNC_END func_08041404

	THUMB_FUNC_START func_08041584
func_08041584: @ 0x08041584
	push {lr}
	sub sp, #0xc
	ldr r1, .L080415AC  @ gAiSt
	adds r0, r1, #0
	adds r0, #0x87
	ldrb r0, [r0]
	adds r1, #0x88
	ldrb r1, [r1]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xc
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
.L080415AC: .4byte gAiSt

	THUMB_FUNC_END func_08041584

.align 2, 0
