	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Some white circular fade effect proc. Seems unused

	THUMB_FUNC_START func_08021E10
func_08021E10: @ 0x08021E10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r2, r7, #0
	adds r2, #0x4c
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	movs r1, #0x40
	subs r1, r1, r0
	mov r9, r1
	movs r0, #0
	mov sl, r2
.L08021E32:
	movs r6, #0
	lsls r5, r0, #3
	adds r1, r0, #1
	mov r8, r1
	lsls r0, r0, #6
	ldr r2, .L08021EC8  @ gBg0Tm
	adds r4, r0, r2
.L08021E40:
	lsls r2, r6, #3
	ldr r1, [r7, #0x2c]
	subs r0, r1, r2
	cmp r0, #0
	bge .L08021E4C
	subs r0, r2, r1
.L08021E4C:
	ldr r2, [r7, #0x30]
	subs r1, r2, r5
	cmp r1, #0
	bge .L08021E56
	subs r1, r5, r2
.L08021E56:
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r9
	cmp r0, #0
	bge .L08021E74
	adds r0, #3
.L08021E74:
	asrs r1, r0, #2
	movs r0, #0xf
	subs r0, r0, r1
	cmp r0, #0xf
	ble .L08021E80
	movs r0, #0xf
.L08021E80:
	cmp r0, #0
	bge .L08021E86
	movs r0, #0
.L08021E86:
	movs r1, #0x84
	lsls r1, r1, #6
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #0x1d
	ble .L08021E40
	mov r0, r8
	cmp r0, #0x13
	ble .L08021E32
	movs r0, #1
	bl EnableBgSync
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x46
	ble .L08021EB8
	adds r0, r7, #0
	bl Proc_Break
.L08021EB8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08021EC8: .4byte gBg0Tm

	THUMB_FUNC_END func_08021E10

	THUMB_FUNC_START func_08021ECC
func_08021ECC: @ 0x08021ECC
	push {r4, lr}
	sub sp, #4
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r4, #1
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	bl ClearBg0Bg1
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08021ECC

	THUMB_FUNC_START func_08021F08
func_08021F08: @ 0x08021F08
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r2, .L08021FA8  @ 0x06002000
	movs r1, #0
	ldr r4, .L08021FAC  @ 0x11111111
	movs r3, #0x1f
.L08021F1A:
	movs r0, #7
.L08021F1C:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bge .L08021F1C
	adds r1, r1, r4
	subs r3, #1
	cmp r3, #0
	bge .L08021F1A
	movs r3, #0
	ldr r0, .L08021FB0  @ gPal
	adds r4, r0, #0
	adds r4, #0x40
.L08021F34:
	lsls r0, r3, #1
	lsls r1, r3, #0xb
	lsls r2, r3, #6
	adds r1, r1, r2
	adds r1, r1, r0
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xf
	ble .L08021F34
	movs r4, #0
	bl EnablePalSync
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearBg0Bg1
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, .L08021FB4  @ gUnknown_0859B4F8
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	adds r0, #0x4c
	strh r4, [r0]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08021FA8: .4byte 0x06002000
.L08021FAC: .4byte 0x11111111
.L08021FB0: .4byte gPal
.L08021FB4: .4byte gUnknown_0859B4F8

	THUMB_FUNC_END func_08021F08

.align 2, 0
