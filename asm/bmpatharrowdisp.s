	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Logic for displaying the movement path/arrow thing

	THUMB_FUNC_START MoveCursor_SetLastCursorPosition
MoveCursor_SetLastCursorPosition: @ 0x080329D8
	ldr r3, .L080329E8  @ gUnknown_0859DBA0
	ldr r2, [r3]
	adds r2, #0x29
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	strb r1, [r0]
	bx lr
	.align 2, 0
.L080329E8: .4byte gUnknown_0859DBA0

	THUMB_FUNC_END MoveCursor_SetLastCursorPosition

	THUMB_FUNC_START MoveCursor_CutPath
MoveCursor_CutPath: @ 0x080329EC
	push {r4, r5, r6, r7, lr}
	ldr r3, .L08032A8C  @ gUnknown_0859DBA0
	ldr r1, [r3]
	adds r2, r1, #0
	adds r2, #0x2c
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt .L08032A84
	subs r0, #1
	strb r0, [r2]
	ldr r2, [r3]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #0x29
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	strb r1, [r0]
	movs r5, #1
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bgt .L08032A84
	adds r7, r3, #0
.L08032A2E:
	bl GetWorkingMoveTable
	ldr r3, [r7]
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	adds r5, r3, #0
	adds r5, #0x55
	adds r6, r5, r4
	subs r1, r4, #1
	adds r5, r5, r1
	adds r1, r3, #0
	adds r1, #0x41
	adds r1, r1, r4
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldr r1, .L08032A90  @ gMapTerrain
	ldr r1, [r1]
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r3, #0x2d
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldr r1, [r2]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r5]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r6]
	adds r4, #1
	lsls r4, r4, #0x18
	ldr r0, [r7]
	adds r0, #0x2c
	lsrs r5, r4, #0x18
	asrs r4, r4, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	ble .L08032A2E
.L08032A84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08032A8C: .4byte gUnknown_0859DBA0
.L08032A90: .4byte gMapTerrain

	THUMB_FUNC_END MoveCursor_CutPath

	THUMB_FUNC_START MoveCursor_AddMovePoint
MoveCursor_AddMovePoint: @ 0x08032A94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, .L08032B10  @ gUnknown_0859DBA0
	ldr r1, [r6]
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x2d
	adds r0, r0, r1
	strb r5, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x41
	adds r0, r0, r1
	strb r4, [r0]
	bl GetWorkingMoveTable
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, #0x55
	adds r3, r2, r1
	subs r1, #1
	adds r2, r2, r1
	lsls r4, r4, #0x18
	ldr r1, .L08032B14  @ gMapTerrain
	ldr r1, [r1]
	asrs r4, r4, #0x16
	adds r4, r4, r1
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08032B10: .4byte gUnknown_0859DBA0
.L08032B14: .4byte gMapTerrain

	THUMB_FUNC_END MoveCursor_AddMovePoint

	THUMB_FUNC_START MoveCursor_GetPointIndexForPosition
MoveCursor_GetPointIndexForPosition: @ 0x08032B18
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r1, #0
	ldr r0, .L08032B6C  @ gUnknown_0859DBA0
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r1, r3
	bgt .L08032B7E
	mov ip, r2
	lsls r0, r4, #0x18
	asrs r7, r0, #0x18
	mov r6, ip
	adds r6, #0x41
	lsls r0, r5, #0x18
	asrs r5, r0, #0x18
	adds r4, r3, #0
.L08032B44:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	mov r1, ip
	adds r1, #0x2d
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, #0
	cmp r1, r7
	bne .L08032B70
	adds r0, r6, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne .L08032B70
	adds r0, r2, #0
	b .L08032B82
	.align 2, 0
.L08032B6C: .4byte gUnknown_0859DBA0
.L08032B70:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r3, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	ble .L08032B44
.L08032B7E:
	movs r0, #1
	negs r0, r0
.L08032B82:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END MoveCursor_GetPointIndexForPosition

	THUMB_FUNC_START MoveCursor_AppendFromMoveBuffer
MoveCursor_AppendFromMoveBuffer: @ 0x08032B88
	push {r4, lr}
	movs r4, #0
.L08032B8C:
	ldr r2, .L08032BB4  @ gUnitMoveBuffer
	adds r1, r4, #0
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xa
	bhi .L08032B8C
	lsls r0, r0, #2
	ldr r1, .L08032BB8  @ .L08032BBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08032BB4: .4byte gUnitMoveBuffer
.L08032BB8: .4byte .L08032BBC
.L08032BBC: @ jump table
	.4byte .L08032C80 @ case 0
	.4byte .L08032BE8 @ case 1
	.4byte .L08032C04 @ case 2
	.4byte .L08032C54 @ case 3
	.4byte .L08032C30 @ case 4
	.4byte .L08032C80 @ case 5
	.4byte .L08032B8C @ case 6
	.4byte .L08032B8C @ case 7
	.4byte .L08032B8C @ case 8
	.4byte .L08032B8C @ case 9
	.4byte .L08032B8C @ case 10
.L08032BE8:
	ldr r0, .L08032C00  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	b .L08032C18
	.align 2, 0
.L08032C00: .4byte gUnknown_0859DBA0
.L08032C04:
	ldr r0, .L08032C2C  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #1
.L08032C18:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MoveCursor_AddMovePoint
	b .L08032B8C
	.align 2, 0
.L08032C2C: .4byte gUnknown_0859DBA0
.L08032C30:
	ldr r0, .L08032C50  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r1, #1
	b .L08032C72
	.align 2, 0
.L08032C50: .4byte gUnknown_0859DBA0
.L08032C54:
	ldr r0, .L08032C7C  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #1
.L08032C72:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MoveCursor_AddMovePoint
	b .L08032B8C
	.align 2, 0
.L08032C7C: .4byte gUnknown_0859DBA0
.L08032C80:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END MoveCursor_AppendFromMoveBuffer

	THUMB_FUNC_START func_08032C88
func_08032C88: @ 0x08032C88
	push {r4, r5, r6, r7, lr}
	movs r6, #1
	ldr r2, .L08032CCC  @ gUnknown_0859DBA0
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r2, #0
	ldr r1, .L08032CD0  @ gUnitMoveBuffer
	mov ip, r1
	cmp r6, r0
	bgt .L08032D1E
	mov r5, ip
.L08032CA4:
	ldr r4, [r2]
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x2d
	adds r1, r0, r3
	subs r2, r3, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge .L08032CD4
	adds r1, r2, r5
	movs r0, #0
	b .L08032D00
	.align 2, 0
.L08032CCC: .4byte gUnknown_0859DBA0
.L08032CD0: .4byte gUnitMoveBuffer
.L08032CD4:
	cmp r1, r0
	ble .L08032CDE
	adds r1, r2, r5
	movs r0, #1
	b .L08032D00
.L08032CDE:
	adds r0, r4, #0
	adds r0, #0x41
	adds r1, r0, r3
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge .L08032CFC
	adds r1, r2, r5
	movs r0, #3
	b .L08032D00
.L08032CFC:
	adds r1, r2, r5
	movs r0, #2
.L08032D00:
	strb r0, [r1]
	lsls r1, r6, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r1, r0
	adds r2, r7, #0
	ldr r0, [r2]
	adds r0, #0x2c
	lsrs r6, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble .L08032CA4
.L08032D1E:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	add r0, ip
	movs r1, #4
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08032C88

	THUMB_FUNC_START MoveCursor_FillMovementMapForEndPoint
MoveCursor_FillMovementMapForEndPoint: @ 0x08032D30
	push {r4, lr}
	ldr r0, .L08032D6C  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, .L08032D70  @ gUnknown_0859DBA0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, #1
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r3, #0
	adds r2, #0x41
	adds r2, r2, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x55
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	bl MapFloodOnWorkingMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08032D6C: .4byte gActiveUnit
.L08032D70: .4byte gUnknown_0859DBA0

	THUMB_FUNC_END MoveCursor_FillMovementMapForEndPoint

	THUMB_FUNC_START MoveCursor_RecomputePath
MoveCursor_RecomputePath: @ 0x08032D74
	push {lr}
	movs r0, #1
	bl MoveCursor_CutPath
	bl MoveCursor_FillMovementMapForEndPoint
	ldr r1, .L08032D98  @ gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	ldr r2, .L08032D9C  @ gUnitMoveBuffer
	bl BuildBestMoveScript
	bl MoveCursor_AppendFromMoveBuffer
	pop {r0}
	bx r0
	.align 2, 0
.L08032D98: .4byte gBmSt
.L08032D9C: .4byte gUnitMoveBuffer

	THUMB_FUNC_END MoveCursor_RecomputePath

	THUMB_FUNC_START MoveCursor_8032DA0
MoveCursor_8032DA0: @ 0x08032DA0
	push {r4, r5, r6, r7, lr}
	ldr r0, .L08032DAC  @ gUnknown_0859DBA0
	ldr r0, [r0]
	adds r0, #0x2c
	ldrb r1, [r0]
	b .L08032E18
	.align 2, 0
.L08032DAC: .4byte gUnknown_0859DBA0
.L08032DB0:
	asrs r4, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	lsls r1, r1, #0x18
	mov ip, r1
	cmp r2, #0
	blt .L08032E10
	ldr r0, .L08032DFC  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r6, r1, #0
	adds r6, #0x2d
	adds r0, r6, r4
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r5, r1, #0
	adds r5, #0x41
	adds r4, r5, r4
.L08032DD8:
	asrs r1, r2, #0x18
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r7, r0
	bne .L08032E00
	adds r0, r5, r1
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L08032E00
	movs r0, #0
	b .L08032E20
	.align 2, 0
.L08032DFC: .4byte gUnknown_0859DBA0
.L08032E00:
	lsls r0, r3, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	cmp r2, #0
	bge .L08032DD8
.L08032E10:
	movs r0, #0xff
	lsls r0, r0, #0x18
	add r0, ip
	lsrs r1, r0, #0x18
.L08032E18:
	lsls r0, r1, #0x18
	cmp r0, #0
	bgt .L08032DB0
	movs r0, #1
.L08032E20:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END MoveCursor_8032DA0

	THUMB_FUNC_START func_08032E28
func_08032E28: @ 0x08032E28
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08032E98  @ gUnknown_08A03054
	ldr r1, .L08032E9C  @ 0x06015E00
	bl Decompress
	ldr r0, .L08032EA0  @ gUnknown_08A0328C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r4, #0
	bne .L08032E90
	ldr r5, .L08032EA4  @ gUnknown_0859DBA0
	ldr r2, [r5]
	ldr r4, .L08032EA8  @ gActiveUnit
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x12]
	ldrb r1, [r1, #0x1d]
	adds r0, r0, r1
	ldr r1, .L08032EAC  @ gAction
	ldrb r1, [r1, #0x10]
	subs r0, r0, r1
	adds r2, #0x2b
	strb r0, [r2]
	movs r0, #0
	bl MoveCursor_CutPath
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MoveCursor_AddMovePoint
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, #0x55
	strb r1, [r0]
	ldr r1, .L08032EB0  @ 0x0000FFFF
	adds r0, r1, #0
	bl MoveCursor_SetLastCursorPosition
	bl func_08032EB4
.L08032E90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08032E98: .4byte gUnknown_08A03054
.L08032E9C: .4byte 0x06015E00
.L08032EA0: .4byte gUnknown_08A0328C
.L08032EA4: .4byte gUnknown_0859DBA0
.L08032EA8: .4byte gActiveUnit
.L08032EAC: .4byte gAction
.L08032EB0: .4byte 0x0000FFFF

	THUMB_FUNC_END func_08032E28

	THUMB_FUNC_START func_08032EB4
func_08032EB4: @ 0x08032EB4
	push {r4, r5, r6, r7, lr}
	ldr r7, .L08032F38  @ gUnknown_0859DBA0
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x29
	ldr r5, .L08032F3C  @ gBmSt
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r3, #0x14
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne .L08032EDE
	adds r0, r2, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne .L08032EDE
	b .L08033060
.L08032EDE:
	ldrh r0, [r5, #0x14]
	ldrh r1, [r5, #0x16]
	bl MoveCursor_SetLastCursorPosition
	ldr r0, .L08032F40  @ gMapMovement
	ldr r0, [r0]
	bl SetWorkingMap
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, .L08032F44  @ gWorkingMap
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #1
	negs r4, r4
	cmp r0, r4
	bne .L08032F12
	b .L08033060
.L08032F12:
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	bl MoveCursor_GetPointIndexForPosition
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq .L08032F48
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	asrs r0, r0, #0x18
	bl MoveCursor_CutPath
	b .L08033060
	.align 2, 0
.L08032F38: .4byte gUnknown_0859DBA0
.L08032F3C: .4byte gBmSt
.L08032F40: .4byte gMapMovement
.L08032F44: .4byte gWorkingMap
.L08032F48:
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, #0x55
	adds r4, r4, r0
	bl GetWorkingMoveTable
	movs r1, #0x16
	ldrsh r6, [r5, r1]
	ldr r1, .L08032FB8  @ gMapTerrain
	ldr r2, [r1]
	lsls r1, r6, #2
	adds r1, r1, r2
	movs r2, #0x14
	ldrsh r3, [r5, r2]
	ldr r1, [r1]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt .L08032FDC
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r3
	cmp r2, #0
	bge .L08032F9E
	subs r2, r3, r0
.L08032F9E:
	adds r0, r4, #0
	adds r0, #0x41
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r0, r1, r6
	cmp r0, #0
	blt .L08032FBC
	adds r0, r2, r0
	cmp r0, #1
	beq .L08032FC4
	b .L08032FDC
	.align 2, 0
.L08032FB8: .4byte gMapTerrain
.L08032FBC:
	subs r0, r6, r1
	adds r0, r2, r0
	cmp r0, #1
	bne .L08032FDC
.L08032FC4:
	ldr r1, .L08032FD8  @ gBmSt
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MoveCursor_AddMovePoint
	b .L08033060
	.align 2, 0
.L08032FD8: .4byte gBmSt
.L08032FDC:
	ldr r0, .L08033034  @ gUnknown_0859DBA0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x55
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08032FFE
	movs r0, #1
	bl MoveCursor_CutPath
.L08032FFE:
	ldr r0, .L08033038  @ gMapOther
	ldr r0, [r0]
	bl SetWorkingMap
	bl MoveCursor_FillMovementMapForEndPoint
	ldr r2, .L0803303C  @ gBmSt
	movs r3, #0x16
	ldrsh r4, [r2, r3]
	ldr r0, .L08033040  @ gWorkingMap
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r1, #0x14
	ldrsh r3, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08033044
	bl MoveCursor_RecomputePath
	b .L08033060
	.align 2, 0
.L08033034: .4byte gUnknown_0859DBA0
.L08033038: .4byte gMapOther
.L0803303C: .4byte gBmSt
.L08033040: .4byte gWorkingMap
.L08033044:
	ldr r2, .L08033068  @ gUnitMoveBuffer
	adds r0, r3, #0
	adds r1, r4, #0
	bl BuildBestMoveScript
	bl MoveCursor_AppendFromMoveBuffer
	bl MoveCursor_8032DA0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08033060
	bl MoveCursor_RecomputePath
.L08033060:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08033068: .4byte gUnitMoveBuffer

	THUMB_FUNC_END func_08032EB4

	THUMB_FUNC_START func_0803306C
func_0803306C: @ 0x0803306C
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0
	bne .L0803307C
	movs r0, #0
	b .L080330CE
.L0803307C:
	ldr r1, .L080330A0  @ gUnknown_0859DBA0
	ldr r4, [r1]
	subs r5, r3, #1
	adds r1, r4, #0
	adds r1, #0x2d
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge .L080330A4
	movs r0, #3
	b .L080330CE
	.align 2, 0
.L080330A0: .4byte gUnknown_0859DBA0
.L080330A4:
	cmp r2, r1
	ble .L080330AC
	movs r0, #1
	b .L080330CE
.L080330AC:
	adds r1, r4, #0
	adds r1, #0x41
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge .L080330C8
	movs r0, #4
	b .L080330CE
.L080330C8:
	cmp r2, r1
	ble .L080330CE
	movs r0, #2
.L080330CE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803306C

	THUMB_FUNC_START func_080330D4
func_080330D4: @ 0x080330D4
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r1, .L080330F4  @ gUnknown_0859DBA0
	ldr r4, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r3, r1
	bne .L080330F8
	movs r0, #0
	b .L08033140
	.align 2, 0
.L080330F4: .4byte gUnknown_0859DBA0
.L080330F8:
	adds r1, r4, #0
	adds r1, #0x2d
	adds r2, r1, r3
	adds r5, r3, #1
	adds r1, r1, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge .L08033116
	movs r0, #1
	b .L08033140
.L08033116:
	cmp r2, r1
	ble .L0803311E
	movs r0, #3
	b .L08033140
.L0803311E:
	adds r1, r4, #0
	adds r1, #0x41
	adds r2, r1, r3
	adds r1, r1, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge .L0803313A
	movs r0, #2
	b .L08033140
.L0803313A:
	cmp r2, r1
	ble .L08033140
	movs r0, #4
.L08033140:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080330D4

	THUMB_FUNC_START func_08033148
func_08033148: @ 0x08033148
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, .L08033180  @ gBmSt
	movs r6, #0xe
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	cmn r1, r3
	ble .L08033184
	cmp r1, #0x9f
	bgt .L08033184
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmn r0, r5
	ble .L08033184
	cmp r0, #0xef
	bgt .L08033184
	movs r0, #1
	b .L08033186
	.align 2, 0
.L08033180: .4byte gBmSt
.L08033184:
	movs r0, #0
.L08033186:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08033148

	THUMB_FUNC_START func_0803318C
func_0803318C: @ 0x0803318C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, .L08033238  @ gUnknown_0859DBA0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08033228
	ldrb r0, [r1]
	lsls r5, r0, #0x18
	cmp r5, #0
	blt .L08033228
	ldr r0, .L0803323C  @ gUnknown_0859DB6C
	mov r9, r0
.L080331B2:
	ldr r0, .L08033238  @ gUnknown_0859DBA0
	ldr r1, [r0]
	asrs r6, r5, #0x18
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r6
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, #0x41
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r2, #4
	lsls r0, r0, #4
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0x10
	bl func_08033148
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08033220
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl func_0803306C
	adds r4, r0, #0
	adds r0, r5, #0
	bl func_080330D4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r4, r4, r1
	add r4, r9
	ldrh r3, [r4]
	ldr r0, .L08033240  @ gBmSt
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r1, r7, r1
	movs r4, #0xe
	ldrsh r2, [r0, r4]
	mov r0, r8
	subs r2, r0, r2
	str r3, [sp]
	movs r0, #0xb
	ldr r3, .L08033244  @ Sprite_16x16
	bl PutSprite
.L08033220:
	subs r0, r6, #1
	lsls r5, r0, #0x18
	cmp r5, #0
	bge .L080331B2
.L08033228:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08033238: .4byte gUnknown_0859DBA0
.L0803323C: .4byte gUnknown_0859DB6C
.L08033240: .4byte gBmSt
.L08033244: .4byte Sprite_16x16

	THUMB_FUNC_END func_0803318C

	THUMB_FUNC_START func_08033248
func_08033248: @ 0x08033248
	push {lr}
	bl func_08032EB4
	bl func_0803318C
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08033248

.align 2, 0
