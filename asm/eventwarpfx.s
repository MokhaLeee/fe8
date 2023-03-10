	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ map effect for when using the warp event codes
	@ *not* the effect used by the warp/rescue staves

	THUMB_FUNC_START func_08021B9C
func_08021B9C: @ 0x08021B9C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L08021C48  @ gUnknown_085A5A60
	ldr r1, .L08021C4C  @ 0x06002000
	bl Decompress
	ldr r0, .L08021C50  @ gUnknown_085A61A8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08021C54  @ gUnknown_085A61C8
	ldr r4, .L08021C58  @ gBmFrameTmap0
	adds r1, r4, #0
	bl Decompress
	movs r0, #0xa2
	lsls r0, r0, #7
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
.L08021BC8:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne .L08021BC8
	ldr r0, .L08021C5C  @ gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, .L08021C60  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08021BF8
	movs r0, #0xb4
	bl m4aSongNumStart
.L08021BF8:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0xc
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r2, .L08021C64  @ gDispIo
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
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08021C48: .4byte gUnknown_085A5A60
.L08021C4C: .4byte 0x06002000
.L08021C50: .4byte gUnknown_085A61A8
.L08021C54: .4byte gUnknown_085A61C8
.L08021C58: .4byte gBmFrameTmap0
.L08021C5C: .4byte gBg0Tm
.L08021C60: .4byte gPlaySt
.L08021C64: .4byte gDispIo

	THUMB_FUNC_END func_08021B9C

	THUMB_FUNC_START func_08021C68
func_08021C68: @ 0x08021C68
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, .L08021CC4  @ gUnknown_0859B48C
	cmp r0, #0
	bne .L08021C7A
	ldr r4, .L08021CC8  @ gUnknown_0859B448
.L08021C7A:
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r3, #0
	adds r2, #0x4c
	cmp r0, #0
	beq .L08021C9E
	ldr r0, .L08021CCC  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08021C9E
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
.L08021C9E:
	ldrh r0, [r2]
	adds r6, r0, #1
	strh r6, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne .L08021CD0
	adds r0, r3, #0
	bl Proc_Break
	b .L08021CF6
	.align 2, 0
.L08021CC4: .4byte gUnknown_0859B48C
.L08021CC8: .4byte gUnknown_0859B448
.L08021CCC: .4byte gKeySt
.L08021CD0:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L08021CDC
	bl RefreshUnitSprites
.L08021CDC:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, .L08021CFC  @ gBmFrameTmap0
	adds r0, r0, r1
	ldr r1, .L08021D00  @ gBg0Tm
	movs r2, #4
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
.L08021CF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08021CFC: .4byte gBmFrameTmap0
.L08021D00: .4byte gBg0Tm

	THUMB_FUNC_END func_08021C68

	THUMB_FUNC_START func_08021D04
func_08021D04: @ 0x08021D04
	push {lr}
	ldr r0, .L08021D2C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08021D18
	movs r0, #0xb5
	bl m4aSongNumStart
.L08021D18:
	ldr r0, .L08021D30  @ gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L08021D2C: .4byte gPlaySt
.L08021D30: .4byte gBg0Tm

	THUMB_FUNC_END func_08021D04

	THUMB_FUNC_START func_08021D34
func_08021D34: @ 0x08021D34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, .L08021D9C  @ gUnknown_0859B4D0
	adds r1, r6, #0
	bl SpawnProc
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r0, #0
	adds r1, #0x64
	strh r4, [r1]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r0, #0x66
	strh r5, [r0]
	lsls r0, r7, #4
	ldr r2, .L08021DA0  @ gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r7, r0, #0
	subs r7, #8
	mov r1, r8
	lsls r0, r1, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	subs r0, #0x20
	negs r1, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	negs r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08021D9C: .4byte gUnknown_0859B4D0
.L08021DA0: .4byte gBmSt

	THUMB_FUNC_END func_08021D34

	THUMB_FUNC_START func_08021DA4
func_08021DA4: @ 0x08021DA4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08021DF4  @ gUnknown_0859B4D0
	mov r1, r8
	bl SpawnProc
	adds r3, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x64
	strh r4, [r0]
	negs r5, r5
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	negs r6, r6
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r6, #0
	str r3, [sp]
	bl SetBgOffset
	ldr r3, [sp]
	adds r3, #0x66
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08021DF4: .4byte gUnknown_0859B4D0

	THUMB_FUNC_END func_08021DA4

	THUMB_FUNC_START func_08021DF8
func_08021DF8: @ 0x08021DF8
	push {lr}
	ldr r0, .L08021E0C  @ gUnknown_0859B4D0
	bl FindProc
	cmp r0, #0
	beq .L08021E06
	movs r0, #1
.L08021E06:
	pop {r1}
	bx r1
	.align 2, 0
.L08021E0C: .4byte gUnknown_0859B4D0

	THUMB_FUNC_END func_08021DF8

.align 2, 0 @ align with 0
