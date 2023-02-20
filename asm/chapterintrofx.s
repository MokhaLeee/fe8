	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ The screen with the chapter name and all

	THUMB_FUNC_START BgMoverProc_Update
BgMoverProc_Update: @ 0x0801FD90
	push {lr}
	bl GetGameTime
	adds r2, r0, #0
	lsrs r2, r2, #1
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	adds r1, r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	THUMB_FUNC_END BgMoverProc_Update

	THUMB_FUNC_START func_0801FDAC
func_0801FDAC: @ 0x0801FDAC
	ldr r1, [r0, #0x14]
	adds r1, #0x50
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	bx lr

	THUMB_FUNC_END func_0801FDAC

	THUMB_FUNC_START func_0801FDBC
func_0801FDBC: @ 0x0801FDBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0801FE10  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq .L0801FDE2
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	beq .L0801FDDE
	adds r1, r4, #0
	adds r1, #0x50
.L0801FDDE:
	movs r0, #1
	strh r0, [r1]
.L0801FDE2:
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0801FE0A
	ldr r2, [r4, #0x14]
	adds r1, r2, #0
	adds r1, #0x50
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq .L0801FE0A
	adds r1, r0, #0
	adds r0, r2, #0
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_End
.L0801FE0A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801FE10: .4byte gKeySt

	THUMB_FUNC_END func_0801FDBC

	THUMB_FUNC_START func_0801FE14
func_0801FE14: @ 0x0801FE14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0x82
	lsls r0, r0, #7
	mov r9, r0
	ldr r1, .L0801FEE0  @ 0x00004110
	mov r8, r1
	movs r6, #0
	ldr r7, .L0801FEE4  @ gBg3Tm
	mov sl, r7
.L0801FE30:
	movs r0, #0
	str r0, [sp]
	lsls r5, r6, #5
	adds r2, r6, #0
	adds r2, #0x10
	adds r0, r6, #0
	adds r0, #8
	adds r4, r6, #0
	adds r4, #0x18
	adds r1, r6, #1
	str r1, [sp, #4]
	adds r5, #0x10
	lsls r3, r2, #5
	adds r3, #0x10
	lsls r1, r0, #5
	adds r1, #0x10
	lsls r0, r0, #6
	add r0, sl
	mov ip, r0
	lsls r2, r2, #6
	add r2, sl
	str r2, [sp, #0xc]
	lsls r0, r6, #6
	mov r6, sl
	adds r2, r0, r6
	lsls r0, r4, #5
	adds r0, #0x10
	str r0, [sp, #8]
	lsls r4, r4, #6
	add r4, sl
	lsls r1, r1, #1
	add r1, sl
	lsls r3, r3, #1
	add r3, sl
	lsls r5, r5, #1
	add r5, sl
.L0801FE78:
	mov r7, r9
	strh r7, [r2]
	mov r0, r9
	strh r0, [r5]
	ldr r6, [sp, #0xc]
	strh r0, [r6]
	strh r0, [r3]
	mov r0, r8
	mov r7, ip
	strh r0, [r7]
	strh r0, [r1]
	strh r0, [r4]
	ldr r6, [sp, #8]
	ldr r7, [sp]
	adds r0, r6, r7
	lsls r0, r0, #1
	add r0, sl
	mov r6, r8
	strh r6, [r0]
	movs r7, #1
	add r9, r7
	movs r0, #1
	add r8, r0
	movs r6, #2
	add ip, r6
	ldr r7, [sp, #0xc]
	adds r7, #2
	str r7, [sp, #0xc]
	adds r2, #2
	adds r4, #2
	adds r1, #2
	adds r3, #2
	adds r5, #2
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	cmp r0, #0xf
	ble .L0801FE78
	movs r1, #0x10
	add r9, r1
	add r8, r1
	ldr r6, [sp, #4]
	cmp r6, #7
	ble .L0801FE30
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0801FEE0: .4byte 0x00004110
.L0801FEE4: .4byte gBg3Tm

	THUMB_FUNC_END func_0801FE14

	THUMB_FUNC_START func_0801FEE8
func_0801FEE8: @ 0x0801FEE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0x82
	lsls r0, r0, #7
	mov r8, r0
	ldr r1, .L0801FFC8  @ 0x00004110
	str r1, [sp, #0xc]
	movs r2, #0
	ldr r6, .L0801FFCC  @ gBg2Tm
.L0801FF02:
	movs r5, #0
	adds r0, r2, #0
	adds r0, #0x10
	adds r3, r2, #0
	adds r3, #8
	adds r4, r2, #0
	adds r4, #0x18
	adds r7, r2, #1
	str r7, [sp, #8]
	lsls r2, r2, #5
	str r2, [sp]
	adds r2, #0x1f
	lsls r0, r0, #5
	mov sl, r0
	mov r1, sl
	adds r1, #0x1f
	lsls r3, r3, #5
	mov r9, r3
	mov r0, r9
	adds r0, #0x1f
	lsls r4, r4, #5
	mov ip, r4
	mov r3, ip
	adds r3, #0x1f
	str r3, [sp, #4]
	lsls r0, r0, #1
	adds r4, r0, r6
	lsls r1, r1, #1
	adds r3, r1, r6
	lsls r2, r2, #1
	adds r2, r2, r6
.L0801FF40:
	ldr r0, [sp]
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	strh r1, [r0]
	strh r1, [r2]
	mov r0, sl
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	strh r1, [r3]
	mov r0, r9
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [sp, #0x10]
	ldr r7, [sp, #0xc]
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r7, r0
	ldr r7, [sp, #0x10]
	strh r1, [r7]
	strh r1, [r4]
	mov r0, ip
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	ldr r7, [sp, #4]
	subs r0, r7, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	subs r4, #2
	subs r3, #2
	subs r2, #2
	adds r5, #1
	cmp r5, #0xf
	ble .L0801FF40
	movs r3, #0x10
	add r8, r3
	adds r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [sp, #8]
	cmp r2, #7
	ble .L0801FF02
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0801FFC8: .4byte 0x00004110
.L0801FFCC: .4byte gBg2Tm

	THUMB_FUNC_END func_0801FEE8

	THUMB_FUNC_START func_0801FFD0
func_0801FFD0: @ 0x0801FFD0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_0801FFD0

	THUMB_FUNC_START func_0801FFD8
func_0801FFD8: @ 0x0801FFD8
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x10
	movs r0, #1
	movs r2, #0
	bl SetBgOffset
	ldr r2, .L0802000C  @ 0x0400001C
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0802000C: .4byte 0x0400001C

	THUMB_FUNC_END func_0801FFD8

	THUMB_FUNC_START func_08020010
func_08020010: @ 0x08020010
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, .L08020084  @ gBg1Tm
	cmp r5, #0
	bne .L08020022
	movs r5, #0xc0
	lsls r5, r5, #0x13
.L08020022:
	ldr r0, .L08020088  @ gUnknown_08B1754C
	lsls r1, r6, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L0802008C  @ gUnknown_08B12DB4
	adds r1, r5, #0
	bl Decompress
	movs r1, #0xf
	adds r0, r6, #0
	ands r0, r1
	lsls r2, r0, #0xc
	adds r0, r6, #1
	ands r0, r1
	lsls r1, r0, #0xc
	movs r3, #0
.L08020044:
	adds r0, r3, r2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xdf
	ble .L08020044
	ldr r5, .L08020090  @ 0x0000019F
	ldr r6, .L08020094  @ gUnknown_0859B108
	cmp r3, r5
	bgt .L08020064
.L08020058:
	adds r0, r3, r1
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, r5
	ble .L08020058
.L08020064:
	ldr r1, .L08020098  @ 0x0000027F
	cmp r3, r1
	bgt .L08020076
.L0802006A:
	adds r0, r3, r2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, r1
	ble .L0802006A
.L08020076:
	adds r0, r6, #0
	adds r1, r7, #0
	bl SpawnProc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08020084: .4byte gBg1Tm
.L08020088: .4byte gUnknown_08B1754C
.L0802008C: .4byte gUnknown_08B12DB4
.L08020090: .4byte 0x0000019F
.L08020094: .4byte gUnknown_0859B108
.L08020098: .4byte 0x0000027F

	THUMB_FUNC_END func_08020010

	THUMB_FUNC_START func_0802009C
func_0802009C: @ 0x0802009C
	push {r4, lr}
	ldr r4, .L080200EC  @ gDispIo
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBgChrOffset
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #0x15]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r4, #0x15]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080200EC: .4byte gDispIo

	THUMB_FUNC_END func_0802009C

	THUMB_FUNC_START func_080200F0
func_080200F0: @ 0x080200F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r0, #0
	bl SetupBackgrounds
	ldr r7, .L0802028C  @ gDispIo
	ldrb r1, [r7]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	movs r1, #1
	mov r9, r1
	mov r2, r9
	orrs r0, r2
	strb r0, [r7]
	ldrb r2, [r7, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r2, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r4, #2
	mov r8, r4
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r2, [r7, #0x14]
	adds r0, r1, #0
	ands r0, r2
	mov r4, r9
	orrs r0, r4
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r1, r0
	mov r0, r8
	orrs r1, r0
	strb r1, [r7, #0x18]
	ldrb r1, [r7, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r7, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08020290  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08020294  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08020298  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBgChrOffset
	ldrb r0, [r7, #1]
	movs r5, #0x20
	orrs r0, r5
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	ldr r2, .L0802029C  @ gUnknown_030030B4
	ldrb r1, [r2]
	orrs r1, r4
	mov r4, r8
	orrs r1, r4
	movs r3, #4
	orrs r1, r3
	movs r2, #8
	orrs r1, r2
	orrs r1, r6
	movs r0, #0x36
	adds r0, r0, r7
	mov ip, r0
	ldrb r0, [r0]
	mov r4, r9
	orrs r0, r4
	mov r4, r8
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r6
	orrs r1, r5
	ldr r2, .L0802029C  @ gUnknown_030030B4
	strb r1, [r2]
	orrs r0, r5
	mov r4, ip
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r4, #0
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	subs r0, #5
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	bl func_08001710
	movs r3, #1
	negs r3, r3
	movs r0, #0
	movs r1, #2
	movs r2, #0x40
	bl func_080017B4
	bl func_08000234_thm
	bl EnablePalSync
	ldrb r1, [r7, #0x15]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	orrs r0, r5
	strb r0, [r7, #0x15]
	ldr r0, .L080202A0  @ gUnknown_08B17B64
	ldr r1, .L080202A4  @ 0x06008000
	bl Decompress
	ldr r0, .L080202A8  @ gUnknown_08B18ED4
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r1, .L080202AC  @ gUnknown_08B18D68
	ldr r0, .L08020298  @ gBg2Tm
	movs r2, #0
	movs r3, #5
	bl func_0800154C
	ldr r0, .L080202B0  @ gUnknown_08B19874
	ldr r1, .L080202B4  @ 0x06014000
	bl Decompress
	ldr r0, .L080202B8  @ gUnknown_08B19DEC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	mov r0, sl
	movs r1, #0
	movs r2, #0xe
	bl func_08020010
	movs r0, #6
	bl EnableBgSync
	movs r0, #0x52
	add sl, r0
	mov r1, sl
	strh r4, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802028C: .4byte gDispIo
.L08020290: .4byte gBg0Tm
.L08020294: .4byte gBg1Tm
.L08020298: .4byte gBg2Tm
.L0802029C: .4byte gUnknown_030030B4
.L080202A0: .4byte gUnknown_08B17B64
.L080202A4: .4byte 0x06008000
.L080202A8: .4byte gUnknown_08B18ED4
.L080202AC: .4byte gUnknown_08B18D68
.L080202B0: .4byte gUnknown_08B19874
.L080202B4: .4byte 0x06014000
.L080202B8: .4byte gUnknown_08B19DEC

	THUMB_FUNC_END func_080200F0

	THUMB_FUNC_START func_080202BC
func_080202BC: @ 0x080202BC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x16
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x68
	movs r0, #3
	strh r0, [r1]
	ldr r0, .L080202F0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080202EC
	ldr r0, .L080202F4  @ 0x00000316
	bl m4aSongNumStart
.L080202EC:
	pop {r0}
	bx r0
	.align 2, 0
.L080202F0: .4byte gPlaySt
.L080202F4: .4byte 0x00000316

	THUMB_FUNC_END func_080202BC

	THUMB_FUNC_START func_080202F8
func_080202F8: @ 0x080202F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r0, #0x4c
	str r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, .L08020490  @ gUnknown_0859B120
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r0, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	adds r3, r7, #0
	adds r3, #0x4e
	str r3, [sp, #8]
	movs r4, #0
	ldrsh r3, [r3, r4]
	adds r5, r7, #0
	adds r5, #0x68
	str r5, [sp, #0xc]
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [r7, #0x2c]
	ldr r2, .L08020494  @ gUnknown_0859B132
	ldr r5, [sp, #4]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r0, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r4, [sp, #8]
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r4, [sp, #0xc]
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [r7, #0x30]
	movs r0, #0x64
	adds r0, r0, r7
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x64
	bgt .L080203EE
	movs r1, #0xa0
	lsls r1, r1, #1
	mov r2, sl
	movs r4, #0
	ldrsh r3, [r2, r4]
	movs r0, #0x64
	str r0, [sp]
	movs r0, #4
	movs r2, #0x40
	bl Interpolate
	mov r8, r0
	ldr r4, .L08020498  @ gSinLut
	movs r5, #0x80
	adds r5, r5, r4
	mov r9, r5
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r3, sl
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
.L080203EE:
	ldr r0, [r7, #0x2c]
	subs r0, #0x10
	ldr r4, .L0802049C  @ 0x000001FF
	ands r0, r4
	ldr r1, [r7, #0x30]
	subs r1, #0x10
	ands r1, r4
	movs r5, #0x80
	lsls r5, r5, #1
	orrs r1, r5
	ldr r6, .L080204A0  @ Sprite_32x32
	ldr r3, .L080204A4  @ 0x00002210
	adds r2, r6, #0
	bl PutOamHiRam
	ldr r1, [r7, #0x2c]
	movs r0, #0xe0
	subs r0, r0, r1
	ands r0, r4
	ldr r2, [r7, #0x30]
	movs r1, #0x90
	subs r1, r1, r2
	ands r1, r4
	orrs r1, r5
	ldr r3, .L080204A8  @ 0x00002214
	adds r2, r6, #0
	bl PutOamHiRam
	ldr r4, [sp, #8]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r5, [sp, #0xc]
	movs r2, #0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt .L08020480
	movs r0, #0
	strh r0, [r4]
	ldr r3, [sp, #4]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r4, r7, #0
	adds r4, #0x66
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0
	movs r1, #3
	movs r2, #8
	bl Interpolate
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r2, [sp, #4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	ldr r4, .L08020490  @ gUnknown_0859B120
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08020480
	adds r0, r7, #0
	bl Proc_Break
.L08020480:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08020490: .4byte gUnknown_0859B120
.L08020494: .4byte gUnknown_0859B132
.L08020498: .4byte gSinLut
.L0802049C: .4byte 0x000001FF
.L080204A0: .4byte Sprite_32x32
.L080204A4: .4byte 0x00002210
.L080204A8: .4byte 0x00002214

	THUMB_FUNC_END func_080202F8

	THUMB_FUNC_START func_080204AC
func_080204AC: @ 0x080204AC
	adds r3, r0, #0
	ldr r2, .L080204E0  @ gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	adds r0, #0x18
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	bx lr
	.align 2, 0
.L080204E0: .4byte gDispIo

	THUMB_FUNC_END func_080204AC

	THUMB_FUNC_START func_080204E4
func_080204E4: @ 0x080204E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	mov r8, r3
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x46
	str r5, [sp]
	movs r0, #5
	movs r1, #0x78
	bl Interpolate
	adds r7, r0, #0
	movs r2, #0
	ldrsh r3, [r4, r2]
	str r5, [sp]
	movs r0, #5
	movs r1, #0x50
	mov r2, r8
	bl Interpolate
	mov sl, r0
	adds r0, r7, #0
	subs r0, #8
	ldr r4, .L0802056C  @ 0x000001FF
	ands r0, r4
	lsls r6, r6, #9
	orrs r0, r6
	mov r1, sl
	subs r1, #8
	ands r1, r4
	adds r5, #0xba
	orrs r1, r5
	ldr r2, .L08020570  @ Sprite_16x16
	mov r8, r2
	ldr r2, .L08020574  @ 0x00002218
	mov r9, r2
	mov r2, r8
	mov r3, r9
	bl PutOamHiRam
	movs r0, #0xe8
	subs r0, r0, r7
	ands r0, r4
	orrs r0, r6
	movs r1, #0x98
	mov r2, sl
	subs r1, r1, r2
	ands r1, r4
	orrs r1, r5
	mov r2, r8
	mov r3, r9
	bl PutOamHiRam
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0802056C: .4byte 0x000001FF
.L08020570: .4byte Sprite_16x16
.L08020574: .4byte 0x00002218

	THUMB_FUNC_END func_080204E4

	THUMB_FUNC_START func_08020578
func_08020578: @ 0x08020578
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0x64
	add r0, sl
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x46
	bgt .L08020614
	movs r1, #0xa0
	lsls r1, r1, #1
	mov r2, r9
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r0, #0x46
	str r0, [sp]
	movs r0, #4
	movs r2, #0x10
	bl Interpolate
	adds r7, r0, #0
	ldr r4, .L08020774  @ gSinLut
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L08020614:
	mov r0, sl
	movs r1, #1
	movs r2, #0xd7
	movs r3, #0x11
	bl func_080204E4
	movs r2, #0x66
	add r2, sl
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	bgt .L080206AA
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r3, r0, #0
	movs r0, #0x46
	str r0, [sp]
	movs r0, #4
	movs r2, #0x10
	bl Interpolate
	adds r7, r0, #0
	ldr r4, .L08020774  @ gSinLut
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L080206AA:
	mov r0, sl
	movs r1, #2
	movs r2, #0xc0
	movs r3, #0x20
	bl func_080204E4
	movs r2, #0x68
	add r2, sl
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	bgt .L08020740
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r3, r0, #0
	movs r0, #0x46
	str r0, [sp]
	movs r0, #4
	movs r2, #0x10
	bl Interpolate
	adds r7, r0, #0
	ldr r4, .L08020774  @ gSinLut
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L08020740:
	mov r0, sl
	movs r1, #3
	movs r2, #0xa9
	movs r3, #0x2f
	bl func_080204E4
	mov r1, sl
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	ble .L08020764
	mov r0, sl
	bl Proc_Break
.L08020764:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08020774: .4byte gSinLut

	THUMB_FUNC_END func_08020578

	THUMB_FUNC_START func_08020778
func_08020778: @ 0x08020778
	push {r4, r5, lr}
	ldr r4, .L080207BC  @ gBg0Tm
	movs r1, #0x94
	lsls r1, r1, #5
	adds r0, r4, #0
	bl TmFill
	movs r0, #8
	movs r1, #5
	bl func_080895B4
	ldr r0, .L080207C0  @ gPlaySt
	bl func_0808979C
	adds r5, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r1, r5, #0
	bl func_0808966C
	ldr r0, .L080207C4  @ 0x00000246
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #5
	adds r2, r5, #0
	bl func_080896FC
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080207BC: .4byte gBg0Tm
.L080207C0: .4byte gPlaySt
.L080207C4: .4byte 0x00000246

	THUMB_FUNC_END func_08020778

	THUMB_FUNC_START func_080207C8
func_080207C8: @ 0x080207C8
	push {r4, r5, lr}
	ldr r4, .L080207F0  @ gUnknown_0859B144
	movs r5, #0x88
	lsls r5, r5, #6
	movs r0, #0
	movs r1, #0x40
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutOamHiRam
	movs r0, #0
	movs r1, #0x40
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutOamHiRam
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080207F0: .4byte gUnknown_0859B144

	THUMB_FUNC_END func_080207C8

	THUMB_FUNC_START func_080207F4
func_080207F4: @ 0x080207F4
	adds r2, r0, #0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x18
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_080207F4

	THUMB_FUNC_START func_08020808
func_08020808: @ 0x08020808
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0802082E
	adds r4, r7, #0
	adds r4, #0x4e
	ldrb r2, [r4]
	movs r0, #1
	movs r1, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r4]
	adds r0, #1
	b .L0802084A
.L0802082E:
	adds r4, r7, #0
	adds r4, #0x4e
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r4]
	subs r0, #1
.L0802084A:
	strh r0, [r4]
	adds r5, r4, #0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r6, r7, #0
	adds r6, #0x66
	cmp r0, #0xff
	bgt .L080208A4
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl func_080ADDFC
	ldrh r2, [r4]
	adds r2, #0xf0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #2
	adds r1, r2, #0
	bl func_080ADE90
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #2
	movs r1, #0x70
	movs r2, #0x58
	movs r3, #0x4c
	bl func_080ADEE0
	bl SyncDispIo
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq .L080208AC
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
.L080208A4:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne .L080208CC
.L080208AC:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0xf
	ble .L080208EC
	movs r0, #0x20
	strh r0, [r5]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	b .L080208EC
.L080208CC:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt .L080208EC
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, .L080208F4  @ gUnknown_0859B180
	bl EndEachProc
	adds r0, r7, #0
	bl Proc_Break
.L080208EC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080208F4: .4byte gUnknown_0859B180

	THUMB_FUNC_END func_08020808

	THUMB_FUNC_START func_080208F8
func_080208F8: @ 0x080208F8
	push {r4, lr}
	sub sp, #4
	ldr r2, .L08020940  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08020940: .4byte gDispIo

	THUMB_FUNC_END func_080208F8

	THUMB_FUNC_START func_08020944
func_08020944: @ 0x08020944
	push {r4, lr}
	sub sp, #4
	ldr r3, .L080209BC  @ gDispIo
	ldrb r1, [r3, #1]
	movs r2, #1
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #9
	negs r2, r2
	ands r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	adds r0, #0x4c
	movs r4, #0
	strh r4, [r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, .L080209C0  @ gUnknown_08B18F34
	ldr r1, .L080209C4  @ 0x06008000
	bl Decompress
	ldr r0, .L080209C8  @ gUnknown_08B19854
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080209CC  @ gUnknown_08B196D8
	ldr r4, .L080209D0  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L080209D4  @ gBg2Tm
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r4, #0
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080209BC: .4byte gDispIo
.L080209C0: .4byte gUnknown_08B18F34
.L080209C4: .4byte 0x06008000
.L080209C8: .4byte gUnknown_08B19854
.L080209CC: .4byte gUnknown_08B196D8
.L080209D0: .4byte gBuf
.L080209D4: .4byte gBg2Tm

	THUMB_FUNC_END func_08020944

	THUMB_FUNC_START func_080209D8
func_080209D8: @ 0x080209D8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrb r1, [r4]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq .L08020A04
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L08020A38
.L08020A04:
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08020A14
	ldrh r0, [r4]
	adds r0, #4
	b .L08020A18
.L08020A14:
	ldrh r0, [r4]
	adds r0, #1
.L08020A18:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #5
	ble .L08020A38
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	bl Proc_Break
.L08020A38:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080209D8

	THUMB_FUNC_START func_08020A40
func_08020A40: @ 0x08020A40
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0x1e
	strh r1, [r0]
	bl func_08001710
	ldr r4, .L08020A88  @ gPal+0x80
	movs r5, #1
	negs r5, r5
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl func_0800172C
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #0xe
	movs r2, #2
	adds r3, r5, #0
	bl func_0800172C
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl func_0800172C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08020A88: .4byte gPal+0x80

	THUMB_FUNC_END func_08020A40

	THUMB_FUNC_START func_08020A8C
func_08020A8C: @ 0x08020A8C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetGameTime
	adds r4, r0, #0
	movs r0, #3
	ands r4, r0
	cmp r4, #0
	bne .L08020AE8
	bl func_08000234_thm
	bl EnablePalSync
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L08020AE8
	ldr r2, .L08020AF0  @ gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, .L08020AF4  @ gPal
	strh r4, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
.L08020AE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08020AF0: .4byte gDispIo
.L08020AF4: .4byte gPal

	THUMB_FUNC_END func_08020A8C

	THUMB_FUNC_START func_08020AF8
func_08020AF8: @ 0x08020AF8
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	bl func_080156D4
	ldr r0, .L08020B1C  @ gPlaySt
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	bl InitSystemTextFont
	pop {r0}
	bx r0
	.align 2, 0
.L08020B1C: .4byte gPlaySt

	THUMB_FUNC_END func_08020AF8

	THUMB_FUNC_START func_08020B20
func_08020B20: @ 0x08020B20
	ldr r1, .L08020B2C  @ gBmSt
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
.L08020B2C: .4byte gBmSt

	THUMB_FUNC_END func_08020B20

	THUMB_FUNC_START func_08020B30
func_08020B30: @ 0x08020B30
	push {r4, r5, lr}
	sub sp, #8
	ldr r2, .L08020C10  @ gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	str r4, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, .L08020C14  @ 0x01000008
	add r0, sp, #4
	bl CpuFastSet
	ldr r0, .L08020C18  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08020C1C  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08020C20  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #7
	bl EnableBgSync
	bl DisableTilesetPaletteAnim
	ldr r4, .L08020C24  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl ApplyChapterMapGraphics
	bl ApplyUnitSpritePalettes
	bl LoadObjUiGfx
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	bl func_08015A40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xf8
	lsls r1, r1, #1
	ands r0, r1
	ldr r5, .L08020C28  @ gBmSt
	strh r0, [r5, #0xc]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #4
	bl func_08015A6C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xfc
	lsls r1, r1, #2
	ands r0, r1
	strh r0, [r5, #0xe]
	bl RefreshEntityMaps
	bl RenderMap
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08020C10: .4byte gDispIo
.L08020C14: .4byte 0x01000008
.L08020C18: .4byte gBg0Tm
.L08020C1C: .4byte gBg1Tm
.L08020C20: .4byte gBg2Tm
.L08020C24: .4byte gPlaySt
.L08020C28: .4byte gBmSt

	THUMB_FUNC_END func_08020B30

	THUMB_FUNC_START func_08020C2C
func_08020C2C: @ 0x08020C2C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl func_08001710
	ldr r5, .L08020C9C  @ gPal+0xC0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #1
	bl func_0800172C
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #1
	bl func_0800172C
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #1
	bl func_0800172C
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #1
	bl func_0800172C
	bl func_08000234_thm
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0x1e
	strh r0, [r4]
	ldr r0, .L08020CA0  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne .L08020C96
	bl ApplyFlamesWeatherGradient
.L08020C96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08020C9C: .4byte gPal+0xC0
.L08020CA0: .4byte gPlaySt

	THUMB_FUNC_END func_08020C2C

	THUMB_FUNC_START func_08020CA4
func_08020CA4: @ 0x08020CA4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetGameTime
	adds r4, r0, #0
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq .L08020CB8
	b .L08020DAE
.L08020CB8:
	bl func_08000234_thm
	ldr r5, .L08020D30  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne .L08020CD0
	bl ApplyFlamesWeatherGradient
.L08020CD0:
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08020CE8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08020D3C
.L08020CE8:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrh r1, [r0, #0x28]
	ldr r0, .L08020D34  @ 0x0000FFFF
	cmp r1, r0
	beq .L08020D08
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl StartBgm
.L08020D08:
	adds r3, r6, #0
	adds r3, #0x4c
	strh r4, [r3]
	ldr r2, .L08020D38  @ gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r4, r3, #0
	b .L08020D6C
	.align 2, 0
.L08020D30: .4byte gPlaySt
.L08020D34: .4byte 0x0000FFFF
.L08020D38: .4byte gDispIo
.L08020D3C:
	bl EnablePalSync
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r1, r2, #7
	adds r4, r0, #0
	cmp r1, #0
	bge .L08020D52
	adds r1, #7
.L08020D52:
	asrs r0, r1, #3
	adds r1, r0, #0
	adds r1, #0xc
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #4
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
.L08020D6C:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne .L08020D9C
	ldr r5, .L08020DB4  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrh r1, [r0, #0x28]
	ldr r0, .L08020DB8  @ 0x0000FFFF
	cmp r1, r0
	beq .L08020D9C
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl StartBgm
.L08020D9C:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge .L08020DAE
	bl EnableTilesetPaletteAnim
	adds r0, r6, #0
	bl Proc_Break
.L08020DAE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08020DB4: .4byte gPlaySt
.L08020DB8: .4byte 0x0000FFFF

	THUMB_FUNC_END func_08020CA4

	THUMB_FUNC_START func_08020DBC
func_08020DBC: @ 0x08020DBC
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r2, .L08020DE4  @ gDispIo
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L08020DE4: .4byte gDispIo

	THUMB_FUNC_END func_08020DBC

	THUMB_FUNC_START func_08020DE8
func_08020DE8: @ 0x08020DE8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x78
	bl Interpolate
	ldr r3, .L08020E44  @ gDispIo
	movs r1, #0x78
	subs r1, r1, r0
	movs r2, #0x2d
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r6, ip
	strb r1, [r6]
	adds r1, r3, #0
	adds r1, #0x31
	strb r2, [r1]
	adds r0, #0x78
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L08020E3C
	adds r0, r5, #0
	bl Proc_Break
.L08020E3C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08020E44: .4byte gDispIo

	THUMB_FUNC_END func_08020DE8

	THUMB_FUNC_START func_08020E48
func_08020E48: @ 0x08020E48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #4
	bl FadeBgmOut
	bl func_08001710
	ldr r6, .L08020EA8  @ gPal
	movs r4, #2
	negs r4, r4
	adds r0, r6, #0
	movs r1, #0
	movs r2, #3
	adds r3, r4, #0
	bl func_0800172C
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl func_0800172C
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #0xe
	movs r2, #2
	adds r3, r4, #0
	bl func_0800172C
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #0x12
	movs r2, #1
	adds r3, r4, #0
	bl func_0800172C
	adds r5, #0x4c
	movs r0, #0xf
	strh r0, [r5]
	movs r0, #1
	bl SoundStuff_80023E0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08020EA8: .4byte gPal

	THUMB_FUNC_END func_08020E48

	THUMB_FUNC_START func_08020EAC
func_08020EAC: @ 0x08020EAC
	push {r4, lr}
	adds r4, r0, #0
	bl func_08000234_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L08020EF4
	ldr r2, .L08020EFC  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	adds r0, r4, #0
	bl Proc_Break
.L08020EF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08020EFC: .4byte gDispIo

	THUMB_FUNC_END func_08020EAC

	THUMB_FUNC_START func_08020F00
func_08020F00: @ 0x08020F00
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, .L08020FCC  @ gDispIo
	ldrb r1, [r2]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, .L08020FD0  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r0, .L08020FD4  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08020FD8  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08020FDC  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #7
	bl EnableBgSync
	ldr r0, .L08020FE0  @ gUnknown_0859B0E0
	bl EndEachProc
	ldr r0, .L08020FE4  @ gUnknown_0859B108
	bl EndEachProc
	ldr r0, .L08020FE8  @ gUnknown_0859B160
	bl EndEachProc
	bl func_08001710
	ldr r5, .L08020FEC  @ gPal+0xC0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #2
	bl func_0800172C
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #2
	bl func_0800172C
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #2
	bl func_0800172C
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #2
	bl func_0800172C
	bl func_08000234_thm
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0xe
	strh r0, [r4]
	ldr r4, .L08020FF0  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrh r1, [r0, #0x28]
	ldr r0, .L08020FF4  @ 0x0000FFFF
	cmp r1, r0
	beq .L08020FC4
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl StartBgm
.L08020FC4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08020FCC: .4byte gDispIo
.L08020FD0: .4byte 0x01000008
.L08020FD4: .4byte gBg0Tm
.L08020FD8: .4byte gBg1Tm
.L08020FDC: .4byte gBg2Tm
.L08020FE0: .4byte gUnknown_0859B0E0
.L08020FE4: .4byte gUnknown_0859B108
.L08020FE8: .4byte gUnknown_0859B160
.L08020FEC: .4byte gPal+0xC0
.L08020FF0: .4byte gPlaySt
.L08020FF4: .4byte 0x0000FFFF

	THUMB_FUNC_END func_08020F00

	THUMB_FUNC_START func_08020FF8
func_08020FF8: @ 0x08020FF8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl func_08000234_thm
	ldr r5, .L08021054  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne .L08021014
	bl ApplyFlamesWeatherGradient
.L08021014:
	bl GetBattleMapKind
	cmp r0, #2
	beq .L0802102C
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0802105C
.L0802102C:
	adds r3, r4, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, .L08021058  @ gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b .L08021064
	.align 2, 0
.L08021054: .4byte gPlaySt
.L08021058: .4byte gDispIo
.L0802105C:
	bl EnablePalSync
	adds r3, r4, #0
	adds r3, #0x4c
.L08021064:
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L0802107A
	bl EnableTilesetPaletteAnim
	adds r0, r4, #0
	bl Proc_Break
.L0802107A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08020FF8

	THUMB_FUNC_START func_08021080
func_08021080: @ 0x08021080
	adds r1, #0x50
	strh r0, [r1]
	bx lr

	THUMB_FUNC_END func_08021080

	THUMB_FUNC_START func_08021088
func_08021088: @ 0x08021088
	adds r1, #0x4c
	strh r0, [r1]
	bx lr

	THUMB_FUNC_END func_08021088

	THUMB_FUNC_START func_08021090
func_08021090: @ 0x08021090
	push {lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq .L080210A4
	adds r0, r3, #0
	bl Proc_Break
	b .L080210BA
.L080210A4:
	adds r0, r3, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge .L080210BA
	adds r0, r3, #0
	bl Proc_Break
.L080210BA:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08021090

	THUMB_FUNC_START func_080210C0
func_080210C0: @ 0x080210C0
	adds r0, #0x52
	movs r1, #2
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_080210C0

	THUMB_FUNC_START func_080210C8
func_080210C8: @ 0x080210C8
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	ldr r4, .L0802117C  @ gDispIo
	ldrb r1, [r4, #0xc]
	movs r5, #4
	negs r5, r5
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	movs r1, #1
	mov r9, r1
	mov r1, r9
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x14]
	adds r0, r5, #0
	ands r0, r1
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r6, #3
	orrs r0, r6
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	ldr r0, .L08021180  @ gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldrb r1, [r4, #0xc]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	mov r1, r9
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r6
	strb r0, [r4, #0x18]
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08021168
	ldr r0, .L08021184  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08021170
.L08021168:
	bl InitBmDisplay
	bl BlackenScreen
.L08021170:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0802117C: .4byte gDispIo
.L08021180: .4byte gBg0Tm
.L08021184: .4byte gPlaySt

	THUMB_FUNC_END func_080210C8

	THUMB_FUNC_START func_08021188
func_08021188: @ 0x08021188
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L080211BC
	bl func_08000234_thm
	ldr r0, .L080211C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne .L080211B2
	bl ApplyFlamesWeatherGradient
.L080211B2:
	bl EnableTilesetPaletteAnim
	adds r0, r4, #0
	bl Proc_Break
.L080211BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080211C4: .4byte gPlaySt

	THUMB_FUNC_END func_08021188

.align 2, 0 @ align with 0
