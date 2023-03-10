	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ KOIDO and KOIDOAMM procs (rescue/drop/give/take map unit animations)

	THUMB_FUNC_START GetSomeFacingDirection
GetSomeFacingDirection: @ 0x0801DBD4
	push {lr}
	cmp r0, r2
	bne .L0801DBEA
	cmp r1, r3
	bge .L0801DBE2
	movs r0, #3
	b .L0801DBFC
.L0801DBE2:
	cmp r1, r3
	ble .L0801DBEA
	movs r0, #2
	b .L0801DBFC
.L0801DBEA:
	cmp r1, r3
	bne .L0801DBFA
	cmp r0, r2
	blt .L0801DBFA
	cmp r0, r2
	ble .L0801DBFA
	movs r0, #1
	b .L0801DBFC
.L0801DBFA:
	movs r0, #0
.L0801DBFC:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeFacingDirection

	THUMB_FUNC_START NewMoveUnitForUnitBeingRescued
NewMoveUnitForUnitBeingRescued: @ 0x0801DC00
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne .L0801DC1E
	adds r0, r3, #0
	bl MU_Create
	b .L0801DC38
.L0801DC1E:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r2, r0
	cmp r2, #0
	bne .L0801DC2E
	adds r0, r3, #0
	movs r1, #0x6f
	b .L0801DC32
.L0801DC2E:
	adds r0, r3, #0
	movs r1, #0x70
.L0801DC32:
	movs r2, #0xc
	bl MU_CreateExt
.L0801DC38:
	pop {r1}
	bx r1

	THUMB_FUNC_END NewMoveUnitForUnitBeingRescued

	THUMB_FUNC_START Loop6C_KOIDO
Loop6C_KOIDO: @ 0x0801DC3C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl MU_IsAnyActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801DC76
	adds r5, r4, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #2
	beq .L0801DC5C
	ldr r0, [r4, #0x34]
	bl MU_End
.L0801DC5C:
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne .L0801DC76
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
.L0801DC76:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_KOIDO

	THUMB_FUNC_START Make6CKOIDO
Make6CKOIDO: @ 0x0801DC7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r1, r3, #0
	ldr r0, .L0801DCCC  @ gUnknown_0859AD88
	bl SpawnProcLocking
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3a
	movs r0, #4
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, r8
	strb r1, [r0]
	adds r0, r6, #0
	bl NewMoveUnitForUnitBeingRescued
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl MU_StartMoveScript
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DCCC: .4byte gUnknown_0859AD88

	THUMB_FUNC_END Make6CKOIDO

	THUMB_FUNC_START Make6CKOIDOAMM
Make6CKOIDOAMM: @ 0x0801DCD0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, .L0801DD18  @ gUnknown_0859ADA0
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r1, #0
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r2, r7, #0
	adds r2, #0x3a
	movs r0, #4
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x3c
	strb r1, [r0]
	adds r0, r6, #0
	bl NewMoveUnitForUnitBeingRescued
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl MU_StartMoveScript
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DD18: .4byte gUnknown_0859ADA0

	THUMB_FUNC_END Make6CKOIDOAMM

.align 2, 0 @ align with 0
