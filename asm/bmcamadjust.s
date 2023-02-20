	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Misc Camera movement functions

	THUMB_FUNC_START GetPlayerStartCursorPosition
GetPlayerStartCursorPosition: @ 0x0801DE30
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, .L0801DE74  @ gPlaySt
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne .L0801DE50
	bl GetPlayerLeaderPid
	bl GetUnitByPid
	adds r1, r0, #0
	ldrb r0, [r1, #0x10]
	strb r0, [r4, #0x12]
	ldrb r0, [r1, #0x11]
	strb r0, [r4, #0x13]
.L0801DE50:
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt .L0801DE78
	bl GetPlayerLeaderPid
	bl GetUnitByPid
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r5]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	b .L0801DE7E
	.align 2, 0
.L0801DE74: .4byte gPlaySt
.L0801DE78:
	ldrb r0, [r4, #0x12]
	str r0, [r5]
	ldrb r0, [r4, #0x13]
.L0801DE7E:
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END GetPlayerStartCursorPosition

	THUMB_FUNC_START GetEnemyStartCursorPosition
GetEnemyStartCursorPosition: @ 0x0801DE88
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, .L0801DE98  @ gPlaySt
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b .L0801DEDC
	.align 2, 0
.L0801DE98: .4byte gPlaySt
.L0801DE9C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L0801DED6
	ldr r3, [r2]
	cmp r3, #0
	beq .L0801DED6
	ldr r0, [r2, #0xc]
	ldr r1, .L0801DEE8  @ 0x00000201
	ands r0, r1
	cmp r0, #0
	bne .L0801DED6
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	str r0, [r5]
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne .L0801DEE2
.L0801DED6:
	adds r4, #1
	ldr r0, .L0801DEEC  @ gPlaySt
	ldrb r0, [r0, #0xf]
.L0801DEDC:
	adds r0, #0x40
	cmp r4, r0
	blt .L0801DE9C
.L0801DEE2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DEE8: .4byte 0x00000201
.L0801DEEC: .4byte gPlaySt

	THUMB_FUNC_END GetEnemyStartCursorPosition

	THUMB_FUNC_START func_0801DEF0
func_0801DEF0: @ 0x0801DEF0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r4, .L0801DF14  @ gPlaySt
	ldrb r0, [r4, #0xf]
	bl GetPhaseAbleUnitCount
	cmp r0, #0
	bne .L0801DF18
	adds r0, r5, #0
	bl Proc_End
	b .L0801DF5A
	.align 2, 0
.L0801DF14: .4byte gPlaySt
.L0801DF18:
	ldrb r0, [r4, #0xf]
	cmp r0, #0x40
	beq .L0801DF38
	cmp r0, #0x40
	bgt .L0801DF28
	cmp r0, #0
	beq .L0801DF2E
	b .L0801DF40
.L0801DF28:
	cmp r0, #0x80
	beq .L0801DF38
	b .L0801DF40
.L0801DF2E:
	add r1, sp, #4
	mov r0, sp
	bl GetPlayerStartCursorPosition
	b .L0801DF40
.L0801DF38:
	add r1, sp, #4
	mov r0, sp
	bl GetEnemyStartCursorPosition
.L0801DF40:
	ldr r1, [sp]
	cmp r1, #0
	blt .L0801DF5A
	ldr r2, [sp, #4]
	cmp r2, #0
	blt .L0801DF5A
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl SetCursorMapPosition
.L0801DF5A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801DEF0

	THUMB_FUNC_START ADJUSTFROMXI_MoveCameraOnSomeUnit
ADJUSTFROMXI_MoveCameraOnSomeUnit: @ 0x0801DF64
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetLastStatScreenUid
	bl GetUnit
	cmp r0, #0
	beq .L0801DF8E
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl EnsureCameraOntoPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetCursorMapPosition
.L0801DF8E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ADJUSTFROMXI_MoveCameraOnSomeUnit

.align 2, 0 @ align with 0
