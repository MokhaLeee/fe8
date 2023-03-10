	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Some effect proc emitting little white stars. Seems unused

	THUMB_FUNC_START func_08021FB8
func_08021FB8: @ 0x08021FB8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	str r0, [r4, #0x3c]
	bl RandNextB
	ldr r1, .L08021FE8  @ 0x000003FF
	ands r1, r0
	ldr r0, [r4, #0x14]
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r0, r2
	adds r1, r1, r0
	negs r1, r1
	str r1, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08021FE8: .4byte 0x000003FF

	THUMB_FUNC_END func_08021FB8

	THUMB_FUNC_START func_08021FEC
func_08021FEC: @ 0x08021FEC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0802200A
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L08022026
.L0802200A:
	ldr r2, [r4, #0x34]
	ldr r0, [r4, #0x3c]
	adds r2, r2, r0
	str r2, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x40]
	adds r1, r1, r0
	str r1, [r4, #0x38]
	ldr r0, [r4, #0x2c]
	adds r0, r0, r2
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
.L08022026:
	ldr r2, [r4, #0x30]
	cmp r2, #0
	bge .L0802203E
	adds r0, r4, #0
	bl Proc_Break
	ldr r1, [r4, #0x14]
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	b .L08022052
.L0802203E:
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	asrs r2, r2, #0x10
	ldr r3, .L0802205C  @ Sprite_8x8
	movs r0, #0xa0
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0xa
	bl PutSprite
.L08022052:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0802205C: .4byte Sprite_8x8

	THUMB_FUNC_END func_08021FEC

	THUMB_FUNC_START func_08022060
func_08022060: @ 0x08022060
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	mov r9, r3
	ldr r6, [sp, #0x1c]
	ldr r1, [r5]
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl Interpolate
	str r0, [r5]
	mov r0, r8
	ldr r1, [r0]
	str r4, [sp]
	movs r0, #0
	mov r2, r9
	adds r3, r6, #0
	bl Interpolate
	mov r1, r8
	str r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08022060

	THUMB_FUNC_START func_080220A8
func_080220A8: @ 0x080220A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L080220C4
	b .L080221EE
.L080220C4:
	movs r0, #0
	mov r9, r0
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0x28
	ble .L080220D8
	b .L080221EE
.L080220D8:
	movs r3, #0x64
	adds r3, r3, r6
	mov sl, r3
	mov r7, sl
.L080220E0:
	ldr r0, .L080221A4  @ gUnknown_0859B510
	adds r1, r6, #0
	bl SpawnProc
	adds r5, r0, #0
	bl RandNextB
	ldr r1, [r6, #0x34]
	lsls r1, r1, #0x10
	ldr r4, .L080221A8  @ 0x0000FFFF
	ands r0, r4
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl RandNextB
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r4, r5, #0
	adds r4, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	movs r5, #0
	ldrsh r0, [r7, r5]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble .L0802212A
	movs r0, #0x80
	lsls r0, r0, #1
.L0802212A:
	str r0, [sp]
	adds r0, r4, #0
	bl func_08022060
	mov r1, r8
	ldrh r0, [r1]
	adds r1, r0, #1
	mov r2, r8
	strh r1, [r2]
	movs r3, #1
	add r9, r3
	mov r4, r9
	cmp r4, #0
	bgt .L0802214E
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L080220E0
.L0802214E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bgt .L080221EE
	ldr r0, .L080221A4  @ gUnknown_0859B510
	adds r1, r6, #0
	bl SpawnProc
	adds r5, r0, #0
	bl RandNextB
	ldr r1, [r6, #0x34]
	subs r1, #8
	lsls r1, r1, #0x10
	ldr r4, .L080221A8  @ 0x0000FFFF
	ands r0, r4
	lsls r0, r0, #5
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl RandNextB
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r7, r5, #0
	adds r7, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	mov r5, sl
	movs r4, #0
	ldrsh r0, [r5, r4]
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r0, r4
	bgt .L080221AC
	str r0, [sp]
	b .L080221AE
	.align 2, 0
.L080221A4: .4byte gUnknown_0859B510
.L080221A8: .4byte 0x0000FFFF
.L080221AC:
	str r4, [sp]
.L080221AE:
	adds r0, r7, #0
	bl func_08022060
	mov r5, r8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	mov r1, sl
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	blt .L080221CE
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r1]
.L080221CE:
	mov r4, sl
	movs r5, #0
	ldrsh r1, [r4, r5]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble .L080221EE
	adds r0, r6, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x66
	movs r0, #1
	strh r0, [r1]
.L080221EE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080220A8

	THUMB_FUNC_START func_08022200
func_08022200: @ 0x08022200
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r5, r0]
	movs r0, #0x10
	subs r0, r0, r1
	cmp r0, #0
	bge .L08022216
	movs r0, #0
.L08022216:
	lsls r3, r0, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
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
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08022200

	THUMB_FUNC_START func_08022250
func_08022250: @ 0x08022250
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov r8, r1
	mov r9, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	ldr r0, .L080222A8  @ gUnknown_0859B540
	ldr r1, .L080222AC  @ 0x06014000
	movs r2, #0x20
	bl RegisterDataMove
	ldr r0, .L080222B0  @ gUnknown_0859B528
	adds r1, r6, #0
	bl SpawnProc
	adds r3, r0, #0
	mov r0, r8
	str r0, [r3, #0x34]
	mov r0, r9
	str r0, [r3, #0x38]
	lsls r4, r4, #0x10
	str r4, [r3, #0x3c]
	lsls r5, r5, #0x10
	str r5, [r3, #0x40]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r2, #0
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0x64
	ldr r0, .L080222B4  @ 0x0000FFFF
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x66
	strh r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080222A8: .4byte gUnknown_0859B540
.L080222AC: .4byte 0x06014000
.L080222B0: .4byte gUnknown_0859B528
.L080222B4: .4byte 0x0000FFFF

	THUMB_FUNC_END func_08022250

	THUMB_FUNC_START func_080222B8
func_080222B8: @ 0x080222B8
	push {lr}
	ldr r0, .L080222CC  @ gUnknown_0859B528
	bl FindProc
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L080222CC: .4byte gUnknown_0859B528

	THUMB_FUNC_END func_080222B8

	THUMB_FUNC_START func_080222D0
func_080222D0: @ 0x080222D0
	push {lr}
	ldr r0, .L080222DC  @ gUnknown_0859B528
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L080222DC: .4byte gUnknown_0859B528

	THUMB_FUNC_END func_080222D0

.align 2, 0
