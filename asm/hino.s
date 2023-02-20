	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START func_080126BC
func_080126BC: @ 0x080126BC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldrh r0, [r6, #0x30]
	ldrh r1, [r6, #0x32]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls .L080126DC
	adds r0, r6, #0
	bl Proc_Break
.L080126DC:
	ldr r4, .L080127B0  @ gUnknown_03000700
	movs r2, #0
	mov r8, r2
	ldr r3, .L080127B4  @ 0x000003FF
	mov r9, r3
.L080126E6:
	movs r7, #1
	mov r0, r8
	lsls r7, r0
	ldr r0, [r6, #0x2c]
	ands r0, r7
	cmp r0, #0
	beq .L08012794
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldrh r2, [r6, #0x32]
	movs r0, #0x80
	lsls r0, r0, #1
	subs r3, r0, r2
	muls r1, r3, r1
	ldrh r0, [r6, #0x34]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge .L08012710
	adds r0, #0xff
.L08012710:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, [r4, #4]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	adds r1, r0, #0
	muls r1, r3, r1
	ldrh r0, [r6, #0x36]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge .L0801272C
	adds r0, #0xff
.L0801272C:
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #6]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x16
	adds r1, r0, #0
	muls r1, r3, r1
	ldrh r0, [r6, #0x38]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge .L08012746
	adds r0, #0xff
.L08012746:
	lsls r2, r0, #8
	lsrs r2, r2, #0x10
	mov r0, ip
	adds r1, r5, #0
	adds r3, r7, #0
	bl WriteFadedPaletteFromArchive
	bl GetSomethingInPaletteBB_2A
	ldr r2, .L080127B4  @ 0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldrh r1, [r4]
	ldr r3, .L080127B8  @ 0xFFFFFC00
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strh r1, [r4]
	bl GetSomethingInPaletteBB_5A
	mov r1, r9
	ands r0, r1
	lsls r0, r0, #0xa
	ldr r1, [r4]
	ldr r2, .L080127BC  @ 0xFFF003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r4]
	bl GetSomethingInPaletteBB_8A
	mov r2, r9
	ands r0, r2
	lsls r0, r0, #4
	ldrh r1, [r4, #2]
	ldr r3, .L080127C0  @ 0xFFFFC00F
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, #2]
.L08012794:
	adds r4, #8
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x1f
	bls .L080126E6
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080127B0: .4byte gUnknown_03000700
.L080127B4: .4byte 0x000003FF
.L080127B8: .4byte 0xFFFFFC00
.L080127BC: .4byte 0xFFF003FF
.L080127C0: .4byte 0xFFFFC00F

	THUMB_FUNC_END func_080126BC

	THUMB_FUNC_START func_080127C4
func_080127C4: @ 0x080127C4
	push {r4, r5, r6, r7, lr}
	bl ArchiveCurrentPalettes
	ldr r2, .L08012814  @ gUnknown_03000700
	movs r3, #0
	ldr r0, .L08012818  @ 0xFFFFFC00
	mov ip, r0
	ldr r6, .L0801281C  @ 0xFFFFC00F
	movs r7, #0x80
	lsls r7, r7, #1
	adds r5, r7, #0
	ldr r4, .L08012820  @ 0xFFF003FF
.L080127DC:
	ldrh r1, [r2]
	mov r0, ip
	ands r0, r1
	orrs r0, r5
	strh r0, [r2]
	ldr r0, [r2]
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r2]
	ldrh r1, [r2, #2]
	adds r0, r6, #0
	ands r0, r1
	movs r7, #0x80
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2, #2]
	adds r2, #8
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls .L080127DC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08012814: .4byte gUnknown_03000700
.L08012818: .4byte 0xFFFFFC00
.L0801281C: .4byte 0xFFFFC00F
.L08012820: .4byte 0xFFF003FF

	THUMB_FUNC_END func_080127C4

	THUMB_FUNC_START func_08012824
func_08012824: @ 0x08012824
	push {r4, r5, r6, r7, lr}
	movs r4, #0x80
	lsls r4, r4, #1
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl WriteFadedPaletteFromArchive
	ldr r2, .L08012880  @ gUnknown_03000700
	movs r3, #0
	ldr r0, .L08012884  @ 0xFFFFFC00
	mov ip, r0
	ldr r6, .L08012888  @ 0xFFFFC00F
	adds r5, r4, #0
	ldr r4, .L0801288C  @ 0xFFF003FF
.L08012846:
	ldrh r1, [r2]
	mov r0, ip
	ands r0, r1
	orrs r0, r5
	strh r0, [r2]
	ldr r0, [r2]
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r2]
	ldrh r1, [r2, #2]
	adds r0, r6, #0
	ands r0, r1
	movs r7, #0x80
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2, #2]
	adds r2, #8
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls .L08012846
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08012880: .4byte gUnknown_03000700
.L08012884: .4byte 0xFFFFFC00
.L08012888: .4byte 0xFFFFC00F
.L0801288C: .4byte 0xFFF003FF

	THUMB_FUNC_END func_08012824

	THUMB_FUNC_START func_08012890
func_08012890: @ 0x08012890
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r4, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, .L080128C4  @ gUnknown_08592568
	bl SpawnProcLocking
	adds r1, r0, #0
	cmp r5, #0
	bne .L080128C8
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #0x30]
	b .L080128CA
	.align 2, 0
.L080128C4: .4byte gUnknown_08592568
.L080128C8:
	strh r5, [r1, #0x30]
.L080128CA:
	movs r0, #0
	strh r0, [r1, #0x32]
	str r6, [r1, #0x2c]
	mov r0, r8
	strh r0, [r1, #0x34]
	strh r7, [r1, #0x36]
	strh r4, [r1, #0x38]
	ldr r3, .L0801293C  @ gUnknown_03000700
	movs r4, #0
	ldr r0, .L08012940  @ 0xFFFFFC00
	mov r8, r0
	ldr r5, .L08012944  @ 0x000003FF
	ldr r7, .L08012948  @ 0xFFFFC00F
.L080128E4:
	movs r0, #1
	lsls r0, r4
	ands r0, r6
	cmp r0, #0
	beq .L08012926
	ldrh r1, [r3]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldrh r2, [r3, #4]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldr r0, [r3]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	ands r0, r5
	lsls r0, r0, #0xa
	ldr r1, [r3, #4]
	ldr r2, .L0801294C  @ 0xFFF003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #4]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x12
	lsrs r1, r1, #0x16
	ands r1, r5
	lsls r1, r1, #4
	ldrh r2, [r3, #6]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #6]
.L08012926:
	adds r3, #8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls .L080128E4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0801293C: .4byte gUnknown_03000700
.L08012940: .4byte 0xFFFFFC00
.L08012944: .4byte 0x000003FF
.L08012948: .4byte 0xFFFFC00F
.L0801294C: .4byte 0xFFF003FF

	THUMB_FUNC_END func_08012890

	THUMB_FUNC_START func_08012950
func_08012950: @ 0x08012950
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl func_08021D34
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08012950

	THUMB_FUNC_START func_08012974
func_08012974: @ 0x08012974
	push {lr}
	bl func_08021DF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08012974

	THUMB_FUNC_START func_08012984
func_08012984: @ 0x08012984
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r4, .L08012A28  @ gDispIo
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x10]
	ldrb r2, [r4, #0x14]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x18]
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	movs r0, #0x34
	adds r0, r0, r4
	mov r8, r0
	ldrb r0, [r0]
	movs r1, #0x20
	orrs r0, r1
	adds r4, #0x36
	ldrb r2, [r4]
	movs r1, #0x21
	negs r1, r1
	ands r1, r2
	movs r5, #1
	orrs r0, r5
	orrs r0, r6
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	mov r7, r8
	strb r0, [r7]
	orrs r1, r5
	orrs r1, r6
	movs r0, #5
	negs r0, r0
	ands r1, r0
	orrs r1, r3
	orrs r1, r2
	strb r1, [r4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08012A28: .4byte gDispIo

	THUMB_FUNC_END func_08012984

	THUMB_FUNC_START func_08012A2C
func_08012A2C: @ 0x08012A2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x8d
	bl PlaySpacialSong
	ldr r0, .L08012A58  @ gUnknown_089B06AC
	ldr r1, .L08012A5C  @ 0x06013800
	bl Decompress
	ldr r0, .L08012A60  @ gUnknown_089B0700
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x48
	movs r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08012A58: .4byte gUnknown_089B06AC
.L08012A5C: .4byte 0x06013800
.L08012A60: .4byte gUnknown_089B0700

	THUMB_FUNC_END func_08012A2C

	THUMB_FUNC_START func_08012A64
func_08012A64: @ 0x08012A64
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r1, r7, #0
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	movs r4, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble .L08012AAE
	strh r4, [r1]
	adds r0, r7, #0
	bl Proc_Break
	ldr r5, .L08012AB8  @ gUnknown_089A6254
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	ldr r6, .L08012ABC  @ 0x000041C0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl StartSpriteAnimProc
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl StartSpriteAnimProc
.L08012AAE:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08012AB8: .4byte gUnknown_089A6254
.L08012ABC: .4byte 0x000041C0

	THUMB_FUNC_END func_08012A64

	THUMB_FUNC_START func_08012AC0
func_08012AC0: @ 0x08012AC0
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble .L08012ADC
	adds r0, r2, #0
	bl Proc_Break
.L08012ADC:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08012AC0

	THUMB_FUNC_START func_08012AE0
func_08012AE0: @ 0x08012AE0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, .L08012B1C  @ gUnknown_08592580
	movs r1, #3
	bl SpawnProc
	lsls r4, r4, #0x10
	asrs r4, r4, #0xc
	ldr r2, .L08012B20  @ gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r4, r4, r1
	adds r4, #8
	str r4, [r0, #0x30]
	lsls r5, r5, #0x10
	asrs r5, r5, #0xc
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r5, r5, r1
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08012B1C: .4byte gUnknown_08592580
.L08012B20: .4byte gBmSt

	THUMB_FUNC_END func_08012AE0

	THUMB_FUNC_START func_08012B24
func_08012B24: @ 0x08012B24
	push {lr}
	ldr r0, .L08012B38  @ gUnknown_08592580
	bl FindProc
	cmp r0, #0
	beq .L08012B32
	movs r0, #1
.L08012B32:
	pop {r1}
	bx r1
	.align 2, 0
.L08012B38: .4byte gUnknown_08592580

	THUMB_FUNC_END func_08012B24

	THUMB_FUNC_START func_08012B3C
func_08012B3C: @ 0x08012B3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08012B7C  @ gUnknown_085925D0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, .L08012B80  @ gBmSt
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08012B7C: .4byte gUnknown_085925D0
.L08012B80: .4byte gBmSt

	THUMB_FUNC_END func_08012B3C

	THUMB_FUNC_START func_08012B84
func_08012B84: @ 0x08012B84
	push {lr}
	ldr r0, .L08012B98  @ gUnknown_085925D0
	bl FindProc
	cmp r0, #0
	beq .L08012B92
	movs r0, #1
.L08012B92:
	pop {r1}
	bx r1
	.align 2, 0
.L08012B98: .4byte gUnknown_085925D0

	THUMB_FUNC_END func_08012B84

	THUMB_FUNC_START func_08012B9C
func_08012B9C: @ 0x08012B9C
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L08012C2E
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08012BBC
	cmp r0, #1
	beq .L08012BF0
	b .L08012C2E
.L08012BBC:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08012BCC
	cmp r0, #1
	beq .L08012BDC
	b .L08012BE6
.L08012BCC:
	ldr r0, .L08012BD8  @ gBmSt
	ldrh r1, [r0, #0xc]
	movs r2, #2
	eors r1, r2
	strh r1, [r0, #0xc]
	b .L08012BE6
	.align 2, 0
.L08012BD8: .4byte gBmSt
.L08012BDC:
	ldr r0, .L08012BEC  @ gBmSt
	ldrh r1, [r0, #0xe]
	movs r2, #2
	eors r1, r2
	strh r1, [r0, #0xe]
.L08012BE6:
	bl RenderMap
	b .L08012C2E
	.align 2, 0
.L08012BEC: .4byte gBmSt
.L08012BF0:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08012C00
	cmp r0, #1
	beq .L08012C18
	b .L08012C2E
.L08012C00:
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #2
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	b .L08012C2E
.L08012C18:
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #2
	ands r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
.L08012C2E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08012B9C

	THUMB_FUNC_START func_08012C34
func_08012C34: @ 0x08012C34
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	ldr r0, .L08012C7C  @ gUnknown_085925F0
	bl FindProc
	cmp r0, #0
	bne .L08012C6A
	cmp r4, #1
	bne .L08012C62
	ldr r0, .L08012C80  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08012C62
	ldr r0, .L08012C84  @ 0x0000026A
	bl m4aSongNumStart
.L08012C62:
	ldr r0, .L08012C7C  @ gUnknown_085925F0
	movs r1, #3
	bl SpawnProc
.L08012C6A:
	adds r1, r0, #0
	adds r1, #0x29
	strb r5, [r1]
	adds r0, #0x2a
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08012C7C: .4byte gUnknown_085925F0
.L08012C80: .4byte gPlaySt
.L08012C84: .4byte 0x0000026A

	THUMB_FUNC_END func_08012C34

	THUMB_FUNC_START func_08012C88
func_08012C88: @ 0x08012C88
	push {lr}
	ldr r0, .L08012CA4  @ gUnknown_085925F0
	bl FindProc
	cmp r0, #0
	beq .L08012CDA
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08012CA8
	cmp r0, #1
	beq .L08012CC4
	b .L08012CCE
	.align 2, 0
.L08012CA4: .4byte gUnknown_085925F0
.L08012CA8:
	ldr r2, .L08012CBC  @ gBmSt
	ldrh r3, [r2, #0xc]
	ldr r1, .L08012CC0  @ 0x0000FFFC
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #0xe]
	ands r1, r0
	strh r1, [r2, #0xe]
	b .L08012CCE
	.align 2, 0
.L08012CBC: .4byte gBmSt
.L08012CC0: .4byte 0x0000FFFC
.L08012CC4:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08012CCE:
	ldr r0, .L08012CE0  @ gUnknown_085925F0
	bl EndEachProc
	movs r0, #4
	bl SoundStuff_80023E0
.L08012CDA:
	pop {r0}
	bx r0
	.align 2, 0
.L08012CE0: .4byte gUnknown_085925F0

	THUMB_FUNC_END func_08012C88

	THUMB_FUNC_START func_08012CE4
func_08012CE4: @ 0x08012CE4
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	bl ResetHLayers
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08012CE4

	THUMB_FUNC_START func_08012CFC
func_08012CFC: @ 0x08012CFC
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L08012DB4  @ gUnknown_08592608
	bl SpawnProcLocking
	adds r6, r0, #0
	ldr r3, .L08012DB8  @ gDispIo
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	lsls r2, r2, #4
	ldr r1, .L08012DBC  @ gBmSt
	ldrh r0, [r1, #0xc]
	subs r2, r2, r0
	subs r2, #0x10
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	lsls r3, r3, #4
	ldrh r0, [r1, #0xe]
	subs r3, r3, r0
	subs r3, #0x18
	ldr r0, .L08012DC0  @ gUnknown_08592628
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r4, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r6, [sp, #0x10]
	movs r1, #2
	bl func_080AE7C4
	ldr r0, .L08012DC4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08012DAC
	ldr r0, .L08012DC8  @ 0x000002D6
	bl m4aSongNumStart
.L08012DAC:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08012DB4: .4byte gUnknown_08592608
.L08012DB8: .4byte gDispIo
.L08012DBC: .4byte gBmSt
.L08012DC0: .4byte gUnknown_08592628
.L08012DC4: .4byte gPlaySt
.L08012DC8: .4byte 0x000002D6

	THUMB_FUNC_END func_08012CFC

	THUMB_FUNC_START Interpolate
Interpolate: @ 0x08012DCC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, [sp, #0x10]
	cmp r5, #0
	bne .L08012DDA
	adds r0, r2, #0
	b .L08012E8E
.L08012DDA:
	cmp r0, #5
	bhi .L08012E8C
	lsls r0, r0, #2
	ldr r1, .L08012DE8  @ .L08012DEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08012DE8: .4byte .L08012DEC
.L08012DEC: @ jump table
	.4byte .L08012E04 @ case 0
	.4byte .L08012E10 @ case 1
	.4byte .L08012E20 @ case 2
	.4byte .L08012E34 @ case 3
	.4byte .L08012E58 @ case 4
	.4byte .L08012E6A @ case 5
.L08012E04:
	subs r0, r2, r6
	adds r2, r0, #0
	muls r2, r3, r2
	adds r0, r2, #0
	adds r1, r5, #0
	b .L08012E50
.L08012E10:
	adds r0, r3, #0
	muls r0, r3, r0
	subs r1, r2, r6
	adds r2, r0, #0
	muls r2, r1, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b .L08012E4E
.L08012E20:
	adds r0, r3, #0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	b .L08012E4A
.L08012E34:
	adds r0, r3, #0
	muls r0, r3, r0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	muls r0, r5, r0
.L08012E4A:
	adds r1, r0, #0
	muls r1, r5, r1
.L08012E4E:
	adds r0, r2, #0
.L08012E50:
	bl Div
	adds r0, r6, r0
	b .L08012E8E
.L08012E58:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b .L08012E80
.L08012E6A:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r0, #0
	muls r1, r5, r1
.L08012E80:
	adds r0, r2, #0
	bl Div
	adds r4, r6, r4
	subs r0, r4, r0
	b .L08012E8E
.L08012E8C:
	movs r0, #0
.L08012E8E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Interpolate

	THUMB_FUNC_START nullsub_28
nullsub_28: @ 0x08012E94
	bx lr

	THUMB_FUNC_END nullsub_28

	THUMB_FUNC_START StringEquals
StringEquals: @ 0x08012E98
	push {r4, lr}
	adds r4, r0, #0
	b .L08012EAA
.L08012E9E:
	adds r1, #1
	adds r4, #1
	cmp r2, r3
	beq .L08012EAA
	movs r0, #0
	b .L08012EB8
.L08012EAA:
	ldrb r2, [r4]
	ldrb r3, [r1]
	adds r0, r3, #0
	orrs r0, r2
	cmp r0, #0
	bne .L08012E9E
	movs r0, #1
.L08012EB8:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END StringEquals

	THUMB_FUNC_START StringCopy
StringCopy: @ 0x08012EC0
	push {lr}
	adds r3, r0, #0
	b .L08012ECC
.L08012EC6:
	strb r2, [r3]
	adds r1, #1
	adds r3, #1
.L08012ECC:
	ldrb r2, [r1]
	cmp r2, #0
	bne .L08012EC6
	ldrb r0, [r1]
	strb r0, [r3]
	pop {r0}
	bx r0

	THUMB_FUNC_END StringCopy

	THUMB_FUNC_START PackRawCopy
PackRawCopy: @ 0x08012EDC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetPackSize
	adds r2, r0, #0
	subs r1, r2, #4
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	beq .L08012F04
	adds r0, r4, #4
	lsrs r2, r1, #0x1f
	adds r2, r1, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r1, r5, #0
	bl CpuSet
	b .L08012F1A
.L08012F04:
	adds r3, r4, #4
	adds r0, r1, #0
	cmp r0, #0
	bge .L08012F0E
	subs r0, r2, #1
.L08012F0E:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r3, #0
	adds r1, r5, #0
	bl CpuFastSet
.L08012F1A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END PackRawCopy

	THUMB_FUNC_START func_08012F20
func_08012F20: @ 0x08012F20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, .L08012F4C  @ gBuf
	adds r1, r6, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetPackSize
	cmp r0, #0
	bge .L08012F3A
	adds r0, #3
.L08012F3A:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08012F4C: .4byte gBuf

	THUMB_FUNC_END func_08012F20

	THUMB_FUNC_START Decompress
Decompress: @ 0x08012F50
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0xfa
	lsls r0, r0, #0x18
	adds r1, r4, r0
	ldr r0, .L08012F88  @ 0x00017FFF
	movs r5, #1
	cmp r1, r0
	bhi .L08012F66
	movs r5, #0
.L08012F66:
	ldr r2, .L08012F8C  @ gUnknown_08599FB4
	ldrb r1, [r3]
	movs r0, #0xf0
	ands r0, r1
	lsrs r0, r0, #3
	adds r0, r5, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08012F88: .4byte 0x00017FFF
.L08012F8C: .4byte gUnknown_08599FB4

	THUMB_FUNC_END Decompress

	THUMB_FUNC_START GetPackSize
GetPackSize: @ 0x08012F90
	ldr r0, [r0]
	lsrs r0, r0, #8
	bx lr

	THUMB_FUNC_END GetPackSize

	THUMB_FUNC_START func_08012F98
func_08012F98: @ 0x08012F98
	adds r3, r2, #0
	str r3, [r0]
	ldr r2, .L08012FAC  @ 0x0000FFE0
	ands r1, r2
	asrs r1, r1, #5
	ands r2, r3
	asrs r3, r2, #5
	subs r1, r3, r1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
.L08012FAC: .4byte 0x0000FFE0

	THUMB_FUNC_END func_08012F98

	THUMB_FUNC_START func_08012FB0
func_08012FB0: @ 0x08012FB0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5]
	adds r0, r4, #0
	bl Decompress
	adds r0, r4, #0
	bl GetPackSize
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	ldr r1, [r5, #4]
	cmp r0, #0
	bge .L08012FD2
	adds r0, #0x1f
.L08012FD2:
	asrs r0, r0, #5
	adds r0, r1, r0
	str r0, [r5, #4]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08012FB0

	THUMB_FUNC_START func_08012FE0
func_08012FE0: @ 0x08012FE0
	lsls r3, r1, #5
	ldr r2, [r0]
	adds r2, r2, r3
	str r2, [r0]
	ldr r2, [r0, #4]
	adds r1, r2, r1
	str r1, [r0, #4]
	adds r0, r2, #0
	bx lr

	THUMB_FUNC_END func_08012FE0

	THUMB_FUNC_START RegisterObjectTileGraphics
RegisterObjectTileGraphics: @ 0x08012FF4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble .L0801301A
	adds r4, r3, #0
.L08013002:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl RegisterDataMove
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne .L08013002
.L0801301A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END RegisterObjectTileGraphics

	THUMB_FUNC_START CopyTileGfxForObj
CopyTileGfxForObj: @ 0x08013020
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #5
	cmp r3, #0
	ble .L08013050
	adds r5, r3, #0
.L0801302E:
	adds r2, r4, #0
	cmp r4, #0
	bge .L08013036
	adds r2, r4, #3
.L08013036:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r7, #0
	adds r1, r6, #0
	bl CpuFastSet
	adds r7, r7, r4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r6, r0
	subs r5, #1
	cmp r5, #0
	bne .L0801302E
.L08013050:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END CopyTileGfxForObj

	THUMB_FUNC_START func_08013058
func_08013058: @ 0x08013058
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	ble .L08013088
	lsls r0, r7, #6
	mov r9, r0
	adds r4, r3, #0
	lsls r0, r7, #5
	mov r8, r0
.L08013074:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl func_08013094
	add r6, r9
	add r5, r8
	subs r4, #1
	cmp r4, #0
	bne .L08013074
.L08013088:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013058

	THUMB_FUNC_START func_08013094
func_08013094: @ 0x08013094
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r7, #0
	ble .L080130B6
	adds r4, r7, #0
.L080130A2:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl func_080130BC
	adds r6, #8
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bne .L080130A2
.L080130B6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013094

	THUMB_FUNC_START func_080130BC
func_080130BC: @ 0x080130BC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r2, #7
.L080130C6:
	ldrb r0, [r3, #7]
	lsls r0, r0, #4
	ldrb r1, [r3, #6]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #5]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #4]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #3]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #2]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #1]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3]
	orrs r0, r1
	stm r5!, {r0}
	lsls r0, r4, #3
	adds r3, r3, r0
	subs r2, #1
	cmp r2, #0
	bge .L080130C6
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080130BC

	THUMB_FUNC_START func_08013104
func_08013104: @ 0x08013104
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	cmp r0, r3
	bge .L08013130
.L08013112:
	adds r2, r0, #1
	cmp r5, #0
	ble .L0801312A
	lsls r0, r0, #6
	adds r0, r0, r6
	adds r1, r5, #0
.L0801311E:
	strh r4, [r0]
	adds r4, #1
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne .L0801311E
.L0801312A:
	adds r0, r2, #0
	cmp r0, r3
	blt .L08013112
.L08013130:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013104

	THUMB_FUNC_START func_08013138
func_08013138: @ 0x08013138
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r3, #0
	ble .L0801315C
	movs r2, #0
.L08013144:
	strh r2, [r0]
	subs r0, #2
	subs r3, #1
	cmp r3, #0
	bne .L08013144
	b .L0801315C
.L08013150:
	ldrb r0, [r1]
	adds r0, r0, r5
	subs r0, #0x30
	strh r0, [r4]
	subs r4, #2
	subs r1, #1
.L0801315C:
	ldrb r0, [r1]
	cmp r0, #0x20
	bne .L08013150
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013138

	THUMB_FUNC_START func_08013168
func_08013168: @ 0x08013168
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r3, #0
	ble .L0801317C
	movs r5, #0
.L08013172:
	strh r5, [r0]
	subs r0, #2
	subs r3, #1
	cmp r3, #0
	bne .L08013172
.L0801317C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq .L0801319A
	adds r0, r2, #0
	adds r0, #0xa
	strh r0, [r4]
	subs r4, #2
	strh r0, [r4]
	b .L080131A0
.L0801318E:
	ldrb r0, [r1]
	adds r0, r0, r2
	subs r0, #0x30
	strh r0, [r4]
	subs r4, #2
	subs r1, #1
.L0801319A:
	ldrb r0, [r1]
	cmp r0, #0x20
	bne .L0801318E
.L080131A0:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013168

	THUMB_FUNC_START func_080131A8
func_080131A8: @ 0x080131A8
	adds r0, #0x4c
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_080131A8

	THUMB_FUNC_START func_080131B0
func_080131B0: @ 0x080131B0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, .L080131C0  @ 0x00007FFF
	ands r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
.L080131C0: .4byte 0x00007FFF

	THUMB_FUNC_END func_080131B0

	THUMB_FUNC_START func_080131C4
func_080131C4: @ 0x080131C4
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_080131C4

	THUMB_FUNC_START func_080131D0
func_080131D0: @ 0x080131D0
	push {r4, lr}
	movs r1, #0x9f
	movs r3, #0xf0
	movs r4, #1
	negs r4, r4
	adds r2, r4, #0
.L080131DC:
	strh r3, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge .L080131DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080131D0

	THUMB_FUNC_START func_080131F0
func_080131F0: @ 0x080131F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r6, [sp, #0x18]
	cmp r4, r6
	ble .L0801320E
	adds r1, r3, #0
	adds r3, r5, #0
	adds r5, r1, #0
	adds r1, r6, #0
	adds r6, r4, #0
	adds r4, r1, #0
.L0801320E:
	subs r0, r3, r5
	lsls r0, r0, #0x10
	subs r1, r6, r4
	bl __divsi3
	mov ip, r0
	lsls r5, r5, #0x10
	cmp r6, #0xa0
	ble .L08013222
	movs r6, #0xa0
.L08013222:
	cmp r4, #0
	bge .L08013232
	negs r0, r4
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	adds r5, r5, r0
	movs r4, #0
.L08013232:
	cmp r4, r6
	bge .L0801326C
	lsls r0, r4, #2
	mov r2, r8
	adds r1, r0, r2
	adds r2, r1, #0
.L0801323E:
	asrs r3, r5, #0x10
	cmp r3, #0xf0
	ble .L08013246
	movs r3, #0xf0
.L08013246:
	cmp r3, #0
	bge .L0801324C
	movs r3, #0
.L0801324C:
	movs r7, #0
	ldrsh r0, [r1, r7]
	cmp r0, r3
	ble .L08013256
	strh r3, [r1]
.L08013256:
	movs r7, #2
	ldrsh r0, [r2, r7]
	cmp r0, r3
	bge .L08013260
	strh r3, [r2, #2]
.L08013260:
	add r5, ip
	adds r1, #4
	adds r2, #4
	adds r4, #1
	cmp r4, r6
	blt .L0801323E
.L0801326C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080131F0

	THUMB_FUNC_START func_08013278
func_08013278: @ 0x08013278
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	str r6, [sp]
	cmp r6, #0x50
	ble .L08013290
	movs r0, #0x50
	str r0, [sp]
.L08013290:
	adds r2, r6, #0
	movs r1, #0
	mov r9, r1
	cmp r2, #0
	blt .L08013388
	movs r3, #0
	str r3, [sp, #4]
	ldr r4, [sp]
	lsls r0, r4, #2
	ldr r7, .L0801339C  @ gBuf
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp, #8]
	negs r1, r2
	str r1, [sp, #0xc]
	lsls r0, r2, #2
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	str r0, [sp, #0x14]
.L080132BC:
	ldr r0, [sp]
	add r0, r9
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	cmp r0, #0x9f
	bhi .L080132CE
	mov r7, sl
	strh r2, [r7, #2]
.L080132CE:
	ldr r0, [sp]
	mov r1, r9
	subs r0, r0, r1
	mov r8, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bhi .L080132E2
	ldr r3, [sp, #8]
	strh r2, [r3, #2]
.L080132E2:
	ldr r7, [sp]
	adds r7, r7, r2
	mov ip, r7
	lsls r0, r7, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bhi .L080132F6
	mov r1, r9
	ldr r0, [sp, #0x14]
	strh r1, [r0, #2]
.L080132F6:
	ldr r7, [sp]
	subs r5, r7, r2
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x9f
	bhi .L08013308
	mov r7, r9
	ldr r0, [sp, #0x10]
	strh r7, [r0, #2]
.L08013308:
	ldr r0, [sp, #0x18]
	cmp r0, #0x9f
	bhi .L08013316
	mov r7, sp
	ldrh r0, [r7, #0xc]
	mov r7, sl
	strh r0, [r7]
.L08013316:
	cmp r4, #0x9f
	bhi .L08013328
	mov r4, r8
	lsls r0, r4, #2
	ldr r7, .L0801339C  @ gBuf
	adds r0, r0, r7
	mov r4, sp
	ldrh r4, [r4, #0xc]
	strh r4, [r0]
.L08013328:
	cmp r3, #0x9f
	bhi .L0801333A
	mov r7, ip
	lsls r0, r7, #2
	ldr r3, .L0801339C  @ gBuf
	adds r0, r0, r3
	mov r4, sp
	ldrh r4, [r4, #4]
	strh r4, [r0]
.L0801333A:
	cmp r1, #0x9f
	bhi .L0801334A
	lsls r0, r5, #2
	ldr r7, .L0801339C  @ gBuf
	adds r0, r0, r7
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0]
.L0801334A:
	adds r1, r6, #1
	mov r3, r9
	lsls r0, r3, #1
	subs r6, r1, r0
	cmp r6, #0
	bge .L08013370
	subs r1, r2, #1
	lsls r0, r1, #1
	adds r6, r6, r0
	ldr r4, [sp, #0xc]
	adds r4, #1
	str r4, [sp, #0xc]
	ldr r7, [sp, #0x10]
	adds r7, #4
	str r7, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r0, #4
	str r0, [sp, #0x14]
	adds r2, r1, #0
.L08013370:
	ldr r1, [sp, #4]
	subs r1, #1
	str r1, [sp, #4]
	movs r3, #4
	add sl, r3
	ldr r4, [sp, #8]
	subs r4, #4
	str r4, [sp, #8]
	movs r7, #1
	add r9, r7
	cmp r2, r9
	bge .L080132BC
.L08013388:
	ldr r0, .L0801339C  @ gBuf
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0801339C: .4byte gBuf

	THUMB_FUNC_END func_08013278

	THUMB_FUNC_START func_080133A0
func_080133A0: @ 0x080133A0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r7, .L080133BC  @ gBuf
	movs r6, #0
	adds r5, r7, #0
	ldr r4, .L080133C0  @ gPal
.L080133AC:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, r3
	blt .L080133C4
	subs r1, r1, r3
	b .L080133C8
	.align 2, 0
.L080133BC: .4byte gBuf
.L080133C0: .4byte gPal
.L080133C4:
	ldr r0, .L080133D8  @ 0x0000FFE0
	ands r1, r0
.L080133C8:
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsls r2, r3, #5
	cmp r0, r2
	blt .L080133DC
	subs r1, r1, r2
	b .L080133E0
	.align 2, 0
.L080133D8: .4byte 0x0000FFE0
.L080133DC:
	ldr r0, .L080133F0  @ 0x0000FC1F
	ands r1, r0
.L080133E0:
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsls r2, r3, #0xa
	cmp r0, r2
	blt .L080133F4
	subs r1, r1, r2
	b .L080133F8
	.align 2, 0
.L080133F0: .4byte 0x0000FC1F
.L080133F4:
	ldr r0, .L08013420  @ 0x000003FF
	ands r1, r0
.L080133F8:
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	adds r6, #1
	ldr r0, .L08013424  @ 0x000001FF
	cmp r6, r0
	ble .L080133AC
	bl DisablePalSync
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, #0
	bl RegisterDataMove
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08013420: .4byte 0x000003FF
.L08013424: .4byte 0x000001FF

	THUMB_FUNC_END func_080133A0

	THUMB_FUNC_START func_08013428
func_08013428: @ 0x08013428
	bx lr

	THUMB_FUNC_END func_08013428

	THUMB_FUNC_START func_0801342C
func_0801342C: @ 0x0801342C
	push {lr}
	sub sp, #0x10
	ldr r1, .L08013448  @ gUnknown_080D7954
	mov r0, sp
	movs r2, #0xd
	bl memcpy
	mov r0, sp
	bl func_0801342C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
.L08013448: .4byte gUnknown_080D7954

	THUMB_FUNC_END func_0801342C

	THUMB_FUNC_START GetPaletteFadeBuffer
GetPaletteFadeBuffer: @ 0x0801344C
	ldr r0, .L08013450  @ gPaletteFadeBuffer
	bx lr
	.align 2, 0
.L08013450: .4byte gPaletteFadeBuffer

	THUMB_FUNC_END GetPaletteFadeBuffer

	THUMB_FUNC_START func_08013454
func_08013454: @ 0x08013454
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	bl SetSomethingInPaletteBB_2A
	adds r0, r4, #0
	bl SetSomethingInPaletteBB_5A
	adds r0, r5, #0
	bl SetSomethingInPaletteBB_8A
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013454

	THUMB_FUNC_START SetSomethingInPaletteBB_2A
SetSomethingInPaletteBB_2A: @ 0x08013470
	push {r4, lr}
	adds r4, r0, #0
	bl GetPaletteFadeBuffer
	strh r4, [r0, #0x2a]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetSomethingInPaletteBB_2A

	THUMB_FUNC_START SetSomethingInPaletteBB_5A
SetSomethingInPaletteBB_5A: @ 0x08013480
	push {r4, lr}
	adds r4, r0, #0
	bl GetPaletteFadeBuffer
	adds r0, #0x5a
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetSomethingInPaletteBB_5A

	THUMB_FUNC_START SetSomethingInPaletteBB_8A
SetSomethingInPaletteBB_8A: @ 0x08013494
	push {r4, lr}
	adds r4, r0, #0
	bl GetPaletteFadeBuffer
	adds r0, #0x8a
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetSomethingInPaletteBB_8A

	THUMB_FUNC_START GetSomethingInPaletteBB_2A
GetSomethingInPaletteBB_2A: @ 0x080134A8
	push {lr}
	bl GetPaletteFadeBuffer
	ldrh r0, [r0, #0x2a]
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomethingInPaletteBB_2A

	THUMB_FUNC_START GetSomethingInPaletteBB_5A
GetSomethingInPaletteBB_5A: @ 0x080134B4
	push {lr}
	bl GetPaletteFadeBuffer
	adds r0, #0x5a
	ldrh r0, [r0]
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomethingInPaletteBB_5A

	THUMB_FUNC_START GetSomethingInPaletteBB_8A
GetSomethingInPaletteBB_8A: @ 0x080134C4
	push {lr}
	bl GetPaletteFadeBuffer
	adds r0, #0x8a
	ldrh r0, [r0]
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomethingInPaletteBB_8A

	THUMB_FUNC_START ArchiveCurrentPalettes
ArchiveCurrentPalettes: @ 0x080134D4
	push {r4, r5, lr}
	bl GetPaletteFadeBuffer
	ldr r3, .L0801351C  @ gPal
	movs r1, #0
.L080134DE:
	adds r5, r0, #0
	adds r5, #0x30
	adds r4, r1, #1
	adds r1, r0, #0
	movs r2, #0xf
.L080134E8:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge .L080134E8
	adds r0, r5, #0
	adds r1, r4, #0
	cmp r1, #0x1f
	ble .L080134DE
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl SetSomethingInPaletteBB_2A
	adds r0, r4, #0
	bl SetSomethingInPaletteBB_5A
	adds r0, r4, #0
	bl SetSomethingInPaletteBB_8A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801351C: .4byte gPal

	THUMB_FUNC_END ArchiveCurrentPalettes

	THUMB_FUNC_START ArchivePalette
ArchivePalette: @ 0x08013520
	push {r4, lr}
	adds r4, r0, #0
	bl GetPaletteFadeBuffer
	lsls r2, r4, #5
	ldr r1, .L0801354C  @ gPal
	adds r2, r2, r1
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, r1, r0
	movs r3, #0xf
.L08013538:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge .L08013538
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801354C: .4byte gPal

	THUMB_FUNC_END ArchivePalette

	THUMB_FUNC_START WriteFadedPaletteFromArchive
WriteFadedPaletteFromArchive: @ 0x08013550
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	str r2, [sp]
	mov sl, r3
	bl SetSomethingInPaletteBB_2A
	mov r0, r8
	bl SetSomethingInPaletteBB_5A
	ldr r0, [sp]
	bl SetSomethingInPaletteBB_8A
	bl GetPaletteFadeBuffer
	mov r9, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r7, r0
	ble .L080135D4
	ldr r0, .L080135CC  @ 0xFFFFFF00
	adds r7, r7, r0
	movs r5, #0
	mov ip, r5
.L0801358A:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq .L080135C0
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, r9
	lsls r0, r5, #5
	ldr r1, .L080135D0  @ gPal
	adds r2, r0, r1
.L080135A4:
	ldrh r0, [r3]
	adds r1, r6, #0
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	ands r1, r6
	strh r1, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble .L080135A4
.L080135C0:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble .L0801358A
	b .L08013614
	.align 2, 0
.L080135CC: .4byte 0xFFFFFF00
.L080135D0: .4byte gPal
.L080135D4:
	movs r5, #0
	mov ip, r5
.L080135D8:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq .L0801360A
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, r9
	lsls r0, r5, #5
	ldr r1, .L08013670  @ gPal
	adds r2, r0, r1
.L080135F2:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	ands r0, r6
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble .L080135F2
.L0801360A:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble .L080135D8
.L08013614:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	ble .L08013678
	ldr r1, .L08013674  @ 0xFFFFFF00
	add r8, r1
	movs r5, #0
	mov ip, r5
.L08013624:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq .L08013664
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r3, ip
	add r3, r9
	lsls r0, r5, #5
	ldr r1, .L08013670  @ gPal
	adds r2, r0, r1
.L08013640:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	subs r1, r6, r0
	mov r7, r8
	muls r7, r1, r7
	adds r1, r7, #0
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble .L08013640
.L08013664:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble .L08013624
	b .L080136C0
	.align 2, 0
.L08013670: .4byte gPal
.L08013674: .4byte 0xFFFFFF00
.L08013678:
	movs r5, #0
	movs r7, #0
.L0801367C:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq .L080136B8
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r0, r9
	adds r3, r7, r0
	lsls r0, r5, #5
	ldr r1, .L08013720  @ gPal
	adds r2, r0, r1
.L08013698:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble .L08013698
.L080136B8:
	adds r7, #0x30
	adds r5, #1
	cmp r5, #0x1f
	ble .L0801367C
.L080136C0:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r5, [sp]
	cmp r5, r0
	ble .L08013728
	ldr r7, .L08013724  @ 0xFFFFFF00
	adds r5, r5, r7
	str r5, [sp]
	movs r5, #0
.L080136D2:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	adds r7, r5, #1
	cmp r0, #0
	beq .L08013718
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, r9
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, .L08013720  @ gPal
	adds r2, r0, r5
.L080136F6:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	subs r1, r6, r0
	ldr r5, [sp]
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble .L080136F6
.L08013718:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble .L080136D2
	b .L08013772
	.align 2, 0
.L08013720: .4byte gPal
.L08013724: .4byte 0xFFFFFF00
.L08013728:
	movs r5, #0
.L0801372A:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	adds r7, r5, #1
	cmp r0, #0
	beq .L0801376C
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, r9
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, .L08013788  @ gPal
	adds r2, r0, r5
.L0801374E:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	ldr r1, [sp]
	muls r0, r1, r0
	asrs r0, r0, #8
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble .L0801374E
.L0801376C:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble .L0801372A
.L08013772:
	bl EnablePalSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08013788: .4byte gPal

	THUMB_FUNC_END WriteFadedPaletteFromArchive

	THUMB_FUNC_START func_0801378C
func_0801378C: @ 0x0801378C
	movs r1, #0
	str r1, [r0, #0x44]
	bx lr

	THUMB_FUNC_END func_0801378C

	THUMB_FUNC_START func_08013794
func_08013794: @ 0x08013794
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r2, r1, r0
	str r2, [r4, #0x44]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r3, r7, r2
	ldr r0, [r4, #0x2c]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x38]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge .L080137B8
	adds r0, #0xff
.L080137B8:
	asrs r6, r0, #8
	ldr r0, [r4, #0x30]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x3c]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge .L080137CC
	adds r1, #0xff
.L080137CC:
	asrs r5, r1, #8
	ldr r0, [r4, #0x34]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge .L080137E0
	adds r1, #0xff
.L080137E0:
	asrs r2, r1, #8
	ldr r3, [r4, #0x4c]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x44]
	cmp r0, r7
	bne .L080137F8
	adds r0, r4, #0
	bl Proc_Break
.L080137F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013794

	THUMB_FUNC_START func_08013800
func_08013800: @ 0x08013800
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r7, [sp, #0x1c]
	ldr r4, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r0, .L08013840  @ gUnknown_08599FD4
	bl SpawnProc
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	mov r1, r9
	str r1, [r0, #0x38]
	str r7, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x40]
	str r4, [r0, #0x48]
	ldr r1, [sp, #0x24]
	str r1, [r0, #0x4c]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08013840: .4byte gUnknown_08599FD4

	THUMB_FUNC_END func_08013800

	THUMB_FUNC_START MapBrightnessFadeExists
MapBrightnessFadeExists: @ 0x08013844
	push {lr}
	ldr r0, .L08013854  @ gUnknown_08599FD4
	bl FindProc
	cmp r0, #0
	bne .L08013858
	movs r0, #0
	b .L0801385A
	.align 2, 0
.L08013854: .4byte gUnknown_08599FD4
.L08013858:
	movs r0, #1
.L0801385A:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapBrightnessFadeExists

	THUMB_FUNC_START func_08013860
func_08013860: @ 0x08013860
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x66
	movs r1, #0x5a
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_08013860

	THUMB_FUNC_START func_08013870
func_08013870: @ 0x08013870
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	ldr r5, .L080138D4  @ gKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0801388E
	adds r1, r3, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L0801388E:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne .L080138CE
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L080138B6
	adds r0, r3, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	negs r4, r0
.L080138B6:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080138C6
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r4, [r0, r1]
.L080138C6:
	movs r0, #0x9a
	adds r1, r4, #0
	bl PlaySpacialSong
.L080138CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080138D4: .4byte gKeySt

	THUMB_FUNC_END func_08013870

	THUMB_FUNC_START func_080138D8
func_080138D8: @ 0x080138D8
	push {lr}
	ldr r0, .L080138E8  @ gUnknown_08599FF4
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L080138E8: .4byte gUnknown_08599FF4

	THUMB_FUNC_END func_080138D8

	THUMB_FUNC_START func_080138EC
func_080138EC: @ 0x080138EC
	bx lr

	THUMB_FUNC_END func_080138EC

	THUMB_FUNC_START func_080138F0
func_080138F0: @ 0x080138F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, .L08013908  @ gUnknown_0859A120
	adds r1, r4, #0
	adds r2, r5, #0
	bl func_08013928
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08013908: .4byte gUnknown_0859A120

	THUMB_FUNC_END func_080138F0

	THUMB_FUNC_START func_0801390C
func_0801390C: @ 0x0801390C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, .L08013924  @ gUnknown_0859A140
	adds r1, r4, #0
	adds r2, r5, #0
	bl func_08013928
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08013924: .4byte gUnknown_0859A140

	THUMB_FUNC_END func_0801390C

	THUMB_FUNC_START func_08013928
func_08013928: @ 0x08013928
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r9, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	ldr r0, .L0801397C  @ gPaletteFadeBuffer
	adds r4, r4, r0
	ldr r0, .L08013980  @ gUnknown_0859A00C
	bl SpawnProc
	mov r8, r0
	lsls r5, r5, #5
	ldr r0, .L08013984  @ gPal
	adds r5, r5, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuSet
	str r5, [r4, #0x24]
	mov r0, r9
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x28]
	strh r6, [r4, #0x2a]
	adds r6, #1
	strh r6, [r4, #0x2c]
	mov r0, r8
	str r4, [r0, #0x2c]
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0801397C: .4byte gPaletteFadeBuffer
.L08013980: .4byte gUnknown_0859A00C
.L08013984: .4byte gPal

	THUMB_FUNC_END func_08013928

	THUMB_FUNC_START func_08013988
func_08013988: @ 0x08013988
	push {lr}
	ldr r0, .L08013994  @ gUnknown_0859A00C
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08013994: .4byte gUnknown_0859A00C

	THUMB_FUNC_END func_08013988

	THUMB_FUNC_START func_08013998
func_08013998: @ 0x08013998
	strh r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END func_08013998

	THUMB_FUNC_START func_0801399C
func_0801399C: @ 0x0801399C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov sl, r0
	ldr r1, [r0, #0x20]
	str r1, [sp, #8]
	ldr r1, [r0, #0x24]
	ldrh r0, [r0, #0x28]
	mov r2, sl
	ldrh r2, [r2, #0x2c]
	cmp r0, r2
	beq .L080139C6
	mov r3, sl
	ldrh r3, [r3, #0x2a]
	cmp r0, r3
	bls .L080139CE
.L080139C6:
	adds r0, r7, #0
	bl Proc_End
	b .L08013A74
.L080139CE:
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #0xc]
.L080139D4:
	ldr r1, [sp, #4]
	lsls r2, r1, #1
	mov r3, sl
	adds r0, r2, r3
	ldrh r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r9, r3
	ands r3, r0
	mov r9, r3
	ldr r0, [sp, #8]
	adds r2, r2, r0
	ldrh r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	movs r4, #0xf8
	lsls r4, r4, #2
	ands r4, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r8, r3
	ands r3, r0
	mov r8, r3
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	mov r1, r9
	mov r2, r8
	bl Interpolate
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r4, r2
	orrs r0, r4
	movs r3, #0x1f
	ands r5, r3
	orrs r0, r5
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	adds r1, #2
	str r1, [sp, #0xc]
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #4]
	cmp r2, #0xf
	ble .L080139D4
	bl EnablePalSync
	ldr r1, [r7, #0x2c]
	ldrh r0, [r1, #0x28]
	adds r0, #1
	strh r0, [r1, #0x28]
.L08013A74:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801399C

	THUMB_FUNC_START func_08013A84
func_08013A84: @ 0x08013A84
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08013A9C  @ gUnknown_0859A120
	lsls r1, r1, #5
	ldr r2, .L08013AA0  @ gPal
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
.L08013A9C: .4byte gUnknown_0859A120
.L08013AA0: .4byte gPal

	THUMB_FUNC_END func_08013A84

	THUMB_FUNC_START func_08013AA4
func_08013AA4: @ 0x08013AA4
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08013ABC  @ gUnknown_0859A140
	lsls r1, r1, #5
	ldr r2, .L08013AC0  @ gPal
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
.L08013ABC: .4byte gUnknown_0859A140
.L08013AC0: .4byte gPal

	THUMB_FUNC_END func_08013AA4

	THUMB_FUNC_START func_08013AC4
func_08013AC4: @ 0x08013AC4
	push {r4, lr}
	movs r4, #0
.L08013AC8:
	adds r0, r4, #0
	bl func_08013A84
	adds r4, #1
	cmp r4, #0x1f
	ble .L08013AC8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013AC4

	THUMB_FUNC_START func_08013ADC
func_08013ADC: @ 0x08013ADC
	push {r4, lr}
	movs r4, #0
.L08013AE0:
	adds r0, r4, #0
	bl func_08013A84
	adds r4, #1
	cmp r4, #0x1f
	ble .L08013AE0
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013ADC

	THUMB_FUNC_START func_08013AF4
func_08013AF4: @ 0x08013AF4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, .L08013B58  @ gDispIo
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x10
	strh r0, [r1]
	adds r4, #0x66
	strh r2, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08013B58: .4byte gDispIo

	THUMB_FUNC_END func_08013AF4

	THUMB_FUNC_START func_08013B5C
func_08013B5C: @ 0x08013B5C
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08013B74  @ gDispIo
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne .L08013B78
	adds r0, r2, #0
	bl Proc_End
	b .L08013B9C
	.align 2, 0
.L08013B74: .4byte gDispIo
.L08013B78:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble .L08013B96
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
.L08013B96:
	ldrh r0, [r1]
	lsrs r0, r0, #4
	strb r0, [r3]
.L08013B9C:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013B5C

	THUMB_FUNC_START func_08013BA0
func_08013BA0: @ 0x08013BA0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, .L08013C14  @ gDispIo
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #3
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
	movs r0, #1
	bl SetBlendBackdropA
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x10
	strh r0, [r1]
	adds r5, #0x66
	adds r0, #0xf0
	strh r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08013C14: .4byte gDispIo

	THUMB_FUNC_END func_08013BA0

	THUMB_FUNC_START func_08013C18
func_08013C18: @ 0x08013C18
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08013C30  @ gDispIo
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0
	bne .L08013C34
	adds r0, r1, #0
	bl Proc_End
	b .L08013C54
	.align 2, 0
.L08013C30: .4byte gDispIo
.L08013C34:
	adds r2, r1, #0
	adds r2, #0x66
	adds r0, r1, #0
	adds r0, #0x64
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt .L08013C4E
	movs r0, #0
	strh r0, [r2]
.L08013C4E:
	ldrh r0, [r2]
	lsrs r0, r0, #4
	strb r0, [r3]
.L08013C54:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013C18

	THUMB_FUNC_START func_08013C58
func_08013C58: @ 0x08013C58
	push {lr}
	bl func_08013AF4
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013C58

	THUMB_FUNC_START func_08013C70
func_08013C70: @ 0x08013C70
	push {lr}
	bl func_08013BA0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	pop {r0}
	bx r0

	@ possible file boundry

	THUMB_FUNC_END func_08013C70

	THUMB_FUNC_START IsFadeActive
IsFadeActive: @ 0x08013C88
	push {lr}
	ldr r0, .L08013CB8  @ gUnknown_0859A044
	bl FindProc
	cmp r0, #0
	bne .L08013CC8
	ldr r0, .L08013CBC  @ gUnknown_0859A024
	bl FindProc
	cmp r0, #0
	bne .L08013CC8
	ldr r0, .L08013CC0  @ gUnknown_0859A084
	bl FindProc
	cmp r0, #0
	bne .L08013CC8
	ldr r0, .L08013CC4  @ gUnknown_0859A064
	bl FindProc
	cmp r0, #0
	bne .L08013CC8
	movs r0, #0
	b .L08013CCA
	.align 2, 0
.L08013CB8: .4byte gUnknown_0859A044
.L08013CBC: .4byte gUnknown_0859A024
.L08013CC0: .4byte gUnknown_0859A084
.L08013CC4: .4byte gUnknown_0859A064
.L08013CC8:
	movs r0, #1
.L08013CCA:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsFadeActive

	THUMB_FUNC_START StartFadeInBlack
StartFadeInBlack: @ 0x08013CD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08013CE8  @ gUnknown_0859A024
	movs r1, #3
	bl SpawnProc
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08013CE8: .4byte gUnknown_0859A024

	THUMB_FUNC_END StartFadeInBlack

	THUMB_FUNC_START StartFadeOutBlack
StartFadeOutBlack: @ 0x08013CEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08013D04  @ gUnknown_0859A044
	movs r1, #3
	bl SpawnProc
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08013D04: .4byte gUnknown_0859A044

	THUMB_FUNC_END StartFadeOutBlack

	THUMB_FUNC_START StartBlockingFadeInBlack
StartBlockingFadeInBlack: @ 0x08013D08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08013D1C  @ gUnknown_0859A024
	bl SpawnProcLocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08013D1C: .4byte gUnknown_0859A024

	THUMB_FUNC_END StartBlockingFadeInBlack

	THUMB_FUNC_START StartBlockingFadeOutBlack
StartBlockingFadeOutBlack: @ 0x08013D20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08013D34  @ gUnknown_0859A044
	bl SpawnProcLocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08013D34: .4byte gUnknown_0859A044

	THUMB_FUNC_END StartBlockingFadeOutBlack

	THUMB_FUNC_START StartBlockingFadeInWhite
StartBlockingFadeInWhite: @ 0x08013D38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08013D4C  @ gUnknown_0859A064
	bl SpawnProcLocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08013D4C: .4byte gUnknown_0859A064

	THUMB_FUNC_END StartBlockingFadeInWhite

	THUMB_FUNC_START StartBlockingFadeOutWhite
StartBlockingFadeOutWhite: @ 0x08013D50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08013D64  @ gUnknown_0859A084
	bl SpawnProcLocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08013D64: .4byte gUnknown_0859A084

	THUMB_FUNC_END StartBlockingFadeOutWhite

	THUMB_FUNC_START StartFadeInBlackMedium
StartFadeInBlackMedium: @ 0x08013D68
	push {lr}
	movs r0, #0x10
	bl StartFadeInBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END StartFadeInBlackMedium

	THUMB_FUNC_START StartFadeInBlackSlow
StartFadeInBlackSlow: @ 0x08013D74
	push {lr}
	movs r0, #4
	bl StartFadeInBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END StartFadeInBlackSlow

	THUMB_FUNC_START StartFadeInBlackFast
StartFadeInBlackFast: @ 0x08013D80
	push {lr}
	movs r0, #0x40
	bl StartFadeInBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END StartFadeInBlackFast

	THUMB_FUNC_START StartFadeOutBlackMedium
StartFadeOutBlackMedium: @ 0x08013D8C
	push {lr}
	movs r0, #0x10
	bl StartFadeOutBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END StartFadeOutBlackMedium

	THUMB_FUNC_START func_08013D98
func_08013D98: @ 0x08013D98
	push {lr}
	movs r0, #4
	bl StartFadeOutBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013D98

	THUMB_FUNC_START StartFadeOutBlackFast
StartFadeOutBlackFast: @ 0x08013DA4
	push {lr}
	movs r0, #0x40
	bl StartFadeOutBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END StartFadeOutBlackFast

	THUMB_FUNC_START func_08013DB0
func_08013DB0: @ 0x08013DB0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl StartBlockingFadeInBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013DB0

	THUMB_FUNC_START StartBlockingFadeInBlackSlow
StartBlockingFadeInBlackSlow: @ 0x08013DC0
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartBlockingFadeInBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END StartBlockingFadeInBlackSlow

	THUMB_FUNC_START func_08013DD0
func_08013DD0: @ 0x08013DD0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl StartBlockingFadeInBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013DD0

	THUMB_FUNC_START func_08013DE0
func_08013DE0: @ 0x08013DE0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl StartBlockingFadeOutBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013DE0

	THUMB_FUNC_START func_08013DF0
func_08013DF0: @ 0x08013DF0
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartBlockingFadeOutBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013DF0

	THUMB_FUNC_START func_08013E00
func_08013E00: @ 0x08013E00
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl StartBlockingFadeOutBlack
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013E00

	THUMB_FUNC_START func_08013E10
func_08013E10: @ 0x08013E10
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartBlockingFadeInWhite
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013E10

	THUMB_FUNC_START func_08013E20
func_08013E20: @ 0x08013E20
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl StartBlockingFadeOutWhite
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013E20

	THUMB_FUNC_START func_08013E30
func_08013E30: @ 0x08013E30
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013E44  @ BlackenScreen
	movs r0, #1
	movs r1, #4
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013E44: .4byte BlackenScreen

	THUMB_FUNC_END func_08013E30

	THUMB_FUNC_START func_08013E48
func_08013E48: @ 0x08013E48
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013E5C  @ BlackenScreen
	movs r0, #1
	movs r1, #8
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013E5C: .4byte BlackenScreen

	THUMB_FUNC_END func_08013E48

	THUMB_FUNC_START func_08013E60
func_08013E60: @ 0x08013E60
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013E74  @ BlackenScreen
	movs r0, #1
	movs r1, #0x10
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013E74: .4byte BlackenScreen

	THUMB_FUNC_END func_08013E60

	THUMB_FUNC_START func_08013E78
func_08013E78: @ 0x08013E78
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013E8C  @ BlackenScreen
	movs r0, #1
	movs r1, #0x20
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013E8C: .4byte BlackenScreen

	THUMB_FUNC_END func_08013E78

	THUMB_FUNC_START func_08013E90
func_08013E90: @ 0x08013E90
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013EA4  @ BlackenScreen
	movs r0, #1
	movs r1, #0x40
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013EA4: .4byte BlackenScreen

	THUMB_FUNC_END func_08013E90

	THUMB_FUNC_START func_08013EA8
func_08013EA8: @ 0x08013EA8
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #8
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013EA8

	THUMB_FUNC_START func_08013EBC
func_08013EBC: @ 0x08013EBC
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013EBC

	THUMB_FUNC_START func_08013ED0
func_08013ED0: @ 0x08013ED0
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x20
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013ED0

	THUMB_FUNC_START func_08013EE4
func_08013EE4: @ 0x08013EE4
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x40
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013EE4

	THUMB_FUNC_START func_08013EF8
func_08013EF8: @ 0x08013EF8
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013F0C  @ BlackenScreen
	movs r0, #3
	movs r1, #4
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013F0C: .4byte BlackenScreen

	THUMB_FUNC_END func_08013EF8

	THUMB_FUNC_START func_08013F10
func_08013F10: @ 0x08013F10
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013F24  @ BlackenScreen
	movs r0, #3
	movs r1, #8
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013F24: .4byte BlackenScreen

	THUMB_FUNC_END func_08013F10

	THUMB_FUNC_START func_08013F28
func_08013F28: @ 0x08013F28
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013F3C  @ BlackenScreen
	movs r0, #3
	movs r1, #0x10
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013F3C: .4byte BlackenScreen

	THUMB_FUNC_END func_08013F28

	THUMB_FUNC_START func_08013F40
func_08013F40: @ 0x08013F40
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013F54  @ BlackenScreen
	movs r0, #3
	movs r1, #0x20
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013F54: .4byte BlackenScreen

	THUMB_FUNC_END func_08013F40

	THUMB_FUNC_START StartSafeFadeInBlack
StartSafeFadeInBlack: @ 0x08013F58
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08013F6C  @ BlackenScreen
	movs r0, #3
	movs r1, #0x40
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08013F6C: .4byte BlackenScreen

	THUMB_FUNC_END StartSafeFadeInBlack

	THUMB_FUNC_START func_08013F70
func_08013F70: @ 0x08013F70
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #4
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013F70

	THUMB_FUNC_START func_08013F84
func_08013F84: @ 0x08013F84
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013F84

	THUMB_FUNC_START func_08013F98
func_08013F98: @ 0x08013F98
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl StartSafeFade
	bl func_08014170
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013F98

	THUMB_FUNC_START func_08013FB0
func_08013FB0: @ 0x08013FB0
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x10
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013FB0

	THUMB_FUNC_START StartSafeFadeOutBlack
StartSafeFadeOutBlack: @ 0x08013FC4
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x20
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END StartSafeFadeOutBlack

	THUMB_FUNC_START func_08013FD8
func_08013FD8: @ 0x08013FD8
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x40
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013FD8

	THUMB_FUNC_START func_08013FEC
func_08013FEC: @ 0x08013FEC
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #0x10
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08013FEC

	THUMB_FUNC_START func_08014000
func_08014000: @ 0x08014000
	push {lr}
	adds r2, r0, #0
	movs r0, #7
	movs r1, #0x10
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014000

	THUMB_FUNC_START func_08014014
func_08014014: @ 0x08014014
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #8
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014014

	THUMB_FUNC_START func_08014028
func_08014028: @ 0x08014028
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #4
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014028

	THUMB_FUNC_START func_0801403C
func_0801403C: @ 0x0801403C
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #8
	movs r3, #0
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801403C

	THUMB_FUNC_START func_08014050
func_08014050: @ 0x08014050
	push {lr}
	adds r2, r0, #0
	ldr r3, .L08014064  @ func_0801420C
	movs r0, #7
	movs r1, #8
	bl StartSafeFade
	pop {r0}
	bx r0
	.align 2, 0
.L08014064: .4byte func_0801420C

	THUMB_FUNC_END func_08014050

	THUMB_FUNC_START WaitForFade
WaitForFade: @ 0x08014068
	push {r4, lr}
	adds r4, r0, #0
	bl IsFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801407C
	adds r0, r4, #0
	bl Proc_Break
.L0801407C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END WaitForFade

	THUMB_FUNC_START func_08014084
func_08014084: @ 0x08014084
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r0, #3
	movs r1, #0x40
	bl StartSafeFade
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014084

	THUMB_FUNC_START StartSafeFade
StartSafeFade: @ 0x08014098
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	adds r5, r3, #0
	ldr r7, .L080140DC  @ gLut_080D7964
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r6, r2, #2
	adds r0, r6, r7
	ldr r2, [r0]
	ldr r0, .L080140E0  @ gUnknown_0859A0A4
	bl _call_via_r2
	str r4, [r0, #0x54]
	str r5, [r0, #0x4c]
	asrs r4, r4, #4
	cmp r4, #0
	bne .L080140BE
	movs r4, #1
.L080140BE:
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl _call_via_r1
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080140DC: .4byte gLut_080D7964
.L080140E0: .4byte gUnknown_0859A0A4

	THUMB_FUNC_END StartSafeFade

	THUMB_FUNC_START func_080140E4
func_080140E4: @ 0x080140E4
	push {lr}
	ldr r0, .L080140F0  @ gUnknown_0859A0A4
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L080140F0: .4byte gUnknown_0859A0A4

	THUMB_FUNC_END func_080140E4

	THUMB_FUNC_START func_080140F4
func_080140F4: @ 0x080140F4
	movs r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	str r1, [r0, #0x4c]
	bx lr

	THUMB_FUNC_END func_080140F4

	THUMB_FUNC_START func_08014100
func_08014100: @ 0x08014100
	push {r4, lr}
	adds r4, r0, #0
	bl func_08014124
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801411E
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq .L08014118
	bl _call_via_r0
.L08014118:
	adds r0, r4, #0
	bl Proc_Break
.L0801411E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014100

	THUMB_FUNC_START func_08014124
func_08014124: @ 0x08014124
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	ldr r2, [r4, #0x54]
	adds r1, r0, r2
	str r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r0, r0, r2
	str r0, [r4, #0x5c]
	cmp r1, #0xf
	bgt .L08014142
	cmp r0, r2
	beq .L08014148
.L0801413E:
	movs r0, #1
	b .L08014160
.L08014142:
	adds r0, r1, #0
	subs r0, #0x10
	str r0, [r4, #0x58]
.L08014148:
	bl func_08000234_thm
	ldr r1, .L08014168  @ gPal
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	ldr r1, [r4, #0x5c]
	ldr r0, .L0801416C  @ 0x000001FF
	cmp r1, r0
	ble .L0801413E
	movs r0, #0
.L08014160:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08014168: .4byte gPal
.L0801416C: .4byte 0x000001FF

	THUMB_FUNC_END func_08014124

	THUMB_FUNC_START func_08014170
func_08014170: @ 0x08014170
	push {lr}
	movs r0, #0x10
	movs r1, #0x10
	movs r2, #0
	bl func_0800183C
	bl func_08014194
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014170

	THUMB_FUNC_START func_08014184
func_08014184: @ 0x08014184
	push {lr}
	movs r2, #0
	bl func_0800183C
	bl func_08014194
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014184

	THUMB_FUNC_START func_08014194
func_08014194: @ 0x08014194
	push {lr}
	ldr r0, .L080141AC  @ gUnknown_0859A0A4
	bl FindProc
	adds r1, r0, #0
	cmp r1, #0
	beq .L080141A6
	movs r0, #0
	str r0, [r1, #0x4c]
.L080141A6:
	pop {r0}
	bx r0
	.align 2, 0
.L080141AC: .4byte gUnknown_0859A0A4

	THUMB_FUNC_END func_08014194

	THUMB_FUNC_START BlackenScreen
BlackenScreen: @ 0x080141B0
	push {lr}
	sub sp, #4
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	ldr r1, .L08014204  @ gPal
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	ldr r2, .L08014208  @ gDispIo
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
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08014204: .4byte gPal
.L08014208: .4byte gDispIo

	THUMB_FUNC_END BlackenScreen

	THUMB_FUNC_START func_0801420C
func_0801420C: @ 0x0801420C
	push {lr}
	sub sp, #4
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801420C

	THUMB_FUNC_START StartBlockingTimer
StartBlockingTimer: @ 0x08014238
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, .L08014250  @ gUnknown_0859A0D4
	adds r1, r2, #0
	bl SpawnProcLocking
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08014250: .4byte gUnknown_0859A0D4

	THUMB_FUNC_END StartBlockingTimer

	THUMB_FUNC_START Timer_Countdown
Timer_Countdown: @ 0x08014254
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	bne .L08014266
	adds r0, r1, #0
	bl Proc_Break
	b .L0801426A
.L08014266:
	subs r0, #1
	str r0, [r1, #0x58]
.L0801426A:
	pop {r0}
	bx r0

	THUMB_FUNC_END Timer_Countdown

	THUMB_FUNC_START func_08014270
func_08014270: @ 0x08014270
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r5, #0
	cmp r4, #0
	bne .L08014298
	ldr r0, .L08014294  @ gUnknown_0859A0EC
	ldrb r1, [r0]
	strb r1, [r6]
	adds r6, #1
	ldrb r0, [r0, #1]
	strb r0, [r6]
	strb r4, [r6, #1]
	movs r0, #1
	b .L08014324
	.align 2, 0
.L08014294: .4byte gUnknown_0859A0EC
.L08014298:
	cmp r4, #0
	bge .L080142AA
	ldr r0, .L080142B4  @ gUnknown_0859A0F0
	ldrb r1, [r0]
	strb r1, [r6]
	ldrb r0, [r0, #1]
	strb r0, [r6, #1]
	negs r4, r4
	movs r5, #2
.L080142AA:
	ldr r0, .L080142B8  @ 0x0001869F
	cmp r4, r0
	ble .L080142BC
	adds r5, #0xa
	b .L080142EA
	.align 2, 0
.L080142B4: .4byte gUnknown_0859A0F0
.L080142B8: .4byte 0x0001869F
.L080142BC:
	ldr r0, .L080142C8  @ 0x0000270F
	cmp r4, r0
	ble .L080142CC
	adds r5, #8
	b .L080142EA
	.align 2, 0
.L080142C8: .4byte 0x0000270F
.L080142CC:
	ldr r0, .L080142D8  @ 0x000003E7
	cmp r4, r0
	ble .L080142DC
	adds r5, #6
	b .L080142EA
	.align 2, 0
.L080142D8: .4byte 0x000003E7
.L080142DC:
	cmp r4, #0x63
	ble .L080142E4
	adds r5, #4
	b .L080142EA
.L080142E4:
	cmp r4, #9
	ble .L080142EA
	adds r5, #2
.L080142EA:
	mov r8, r5
	cmp r4, #0
	ble .L08014316
	ldr r7, .L08014330  @ gUnknown_0859A0EC
.L080142F2:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r6, r5
	ldrb r1, [r7]
	strb r1, [r2]
	ldrb r1, [r7, #1]
	adds r1, r1, r0
	strb r1, [r2, #1]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bgt .L080142F2
.L08014316:
	mov r0, r8
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1, #2]
	mov r1, r8
	asrs r0, r1, #1
	adds r0, #1
.L08014324:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08014330: .4byte gUnknown_0859A0EC

	THUMB_FUNC_END func_08014270

	THUMB_FUNC_START String_FromNumber
String_FromNumber: @ 0x08014334
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	cmp r4, #0
	bne .L08014350
	ldr r0, .L0801434C  @ gUnknown_0859A0F3
	ldrb r0, [r0]
	strb r0, [r5]
	strb r4, [r5, #1]
	movs r0, #1
	b .L080143CE
	.align 2, 0
.L0801434C: .4byte gUnknown_0859A0F3
.L08014350:
	cmp r4, #0
	bge .L0801435E
	ldr r0, .L08014368  @ gUnknown_0859A0F4
	ldrb r0, [r0]
	strb r0, [r5]
	adds r5, #1
	negs r4, r4
.L0801435E:
	ldr r0, .L0801436C  @ 0x0001869F
	cmp r4, r0
	ble .L08014370
	movs r6, #5
	b .L0801439E
	.align 2, 0
.L08014368: .4byte gUnknown_0859A0F4
.L0801436C: .4byte 0x0001869F
.L08014370:
	ldr r0, .L0801437C  @ 0x0000270F
	cmp r4, r0
	ble .L08014380
	movs r6, #4
	b .L0801439E
	.align 2, 0
.L0801437C: .4byte 0x0000270F
.L08014380:
	ldr r0, .L0801438C  @ 0x000003E7
	cmp r4, r0
	ble .L08014390
	movs r6, #3
	b .L0801439E
	.align 2, 0
.L0801438C: .4byte 0x000003E7
.L08014390:
	cmp r4, #0x63
	ble .L08014398
	movs r6, #2
	b .L0801439E
.L08014398:
	cmp r4, #9
	ble .L0801439E
	movs r6, #1
.L0801439E:
	adds r7, r6, #0
	cmp r4, #0
	ble .L080143C6
.L080143A4:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r5, r6
	ldr r1, .L080143D4  @ gUnknown_0859A0F3
	ldrb r1, [r1]
	adds r1, r1, r0
	strb r1, [r2]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r6, #1
	cmp r4, #0
	bgt .L080143A4
.L080143C6:
	adds r0, r5, r7
	movs r1, #0
	strb r1, [r0, #1]
	adds r0, r7, #1
.L080143CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080143D4: .4byte gUnknown_0859A0F3

	THUMB_FUNC_END String_FromNumber

	THUMB_FUNC_START SomeDrawTextCentered
SomeDrawTextCentered: @ 0x080143D8
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r9, r0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, .L08014438  @ gSomeUtilityTextHandle
	adds r0, r5, #0
	adds r1, r4, #0
	bl InitText
	adds r0, r6, #0
	bl GetStringTextLen
	lsls r4, r4, #3
	subs r4, r4, r0
	subs r4, #1
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, r8
	bl Text_SetColor
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_DrawString
	adds r0, r5, #0
	mov r1, r9
	bl PutText
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08014438: .4byte gSomeUtilityTextHandle

	THUMB_FUNC_END SomeDrawTextCentered

	THUMB_FUNC_START SomeDrawTextInlineAutoWidth
SomeDrawTextInlineAutoWidth: @ 0x0801443C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r4, .L0801447C  @ gSomeUtilityTextHandle
	adds r0, r5, #0
	bl GetStringTextLen
	adds r1, r0, #7
	cmp r1, #0
	bge .L08014454
	adds r1, #7
.L08014454:
	asrs r1, r1, #3
	adds r0, r4, #0
	bl InitText
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0801447C: .4byte gSomeUtilityTextHandle

	THUMB_FUNC_END SomeDrawTextInlineAutoWidth

	THUMB_FUNC_START DeleteAllPaletteAnimator
DeleteAllPaletteAnimator: @ 0x08014480
	push {lr}
	ldr r0, .L0801448C  @ gUnknown_0859A0F8
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0801448C: .4byte gUnknown_0859A0F8

	THUMB_FUNC_END DeleteAllPaletteAnimator

	THUMB_FUNC_START StartPaletteAnimator
StartPaletteAnimator: @ 0x08014490
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r1, [sp, #0x14]
	ldr r0, .L080144C8  @ gUnknown_0859A0F8
	bl SpawnProc
	str r5, [r0, #0x2c]
	movs r2, #0
	mov r1, r8
	strh r1, [r0, #0x30]
	lsrs r1, r4, #0x1f
	adds r4, r4, r1
	asrs r4, r4, #1
	strh r4, [r0, #0x32]
	strh r6, [r0, #0x36]
	strh r6, [r0, #0x34]
	strh r2, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080144C8: .4byte gUnknown_0859A0F8

	THUMB_FUNC_END StartPaletteAnimator

	THUMB_FUNC_START func_080144CC
func_080144CC: @ 0x080144CC
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl StartPaletteAnimator
	movs r1, #0
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080144CC

	THUMB_FUNC_START StartPaletteAnimator_
StartPaletteAnimator_: @ 0x080144E4
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl StartPaletteAnimator
	movs r1, #1
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartPaletteAnimator_

	THUMB_FUNC_START func_080144FC
func_080144FC: @ 0x080144FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	bcc .L08014558
	movs r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x32]
	bl DivRem
	adds r5, r0, #0
	ldrh r0, [r4, #0x3a]
	cmp r0, #0
	beq .L0801452A
	mvns r0, r5
	ldrh r2, [r4, #0x32]
	adds r5, r0, r2
.L0801452A:
	lsls r6, r5, #1
	ldr r0, [r4, #0x2c]
	adds r0, r0, r6
	ldrh r1, [r4, #0x30]
	ldrh r2, [r4, #0x32]
	subs r2, r2, r5
	lsls r2, r2, #1
	bl ApplyPaletteExt
	cmp r5, #0
	ble .L08014552
	ldr r0, [r4, #0x2c]
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #1
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	subs r1, r1, r6
	adds r2, r6, #0
	bl ApplyPaletteExt
.L08014552:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
.L08014558:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080144FC

	THUMB_FUNC_START func_08014560
func_08014560: @ 0x08014560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov sl, r1
	ldr r0, [sp, #0x24]
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	adds r3, r2, #0
	adds r0, r3, r0
	cmp r3, r0
	bge .L080145B8
	mov r8, r0
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
.L08014584:
	mov r1, sl
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	adds r6, r3, #1
	cmp r1, r0
	bge .L080145B2
	adds r5, r0, #0
	lsls r0, r3, #6
	add r0, r9
	mov r7, ip
	adds r2, r7, r0
.L0801459A:
	cmp r1, #0x1f
	bhi .L080145A4
	cmp r3, #0x1f
	bhi .L080145A4
	strh r4, [r2]
.L080145A4:
	adds r2, #2
	adds r1, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r1, r5
	blt .L0801459A
.L080145B2:
	adds r3, r6, #0
	cmp r3, r8
	blt .L08014584
.L080145B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014560

	THUMB_FUNC_START func_080145C8
func_080145C8: @ 0x080145C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08014648
	movs r5, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	bge .L08014690
.L080145F8:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge .L0801463E
	lsls r3, r5, #6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
.L08014608:
	adds r0, r7, r2
	adds r4, r2, #1
	cmp r0, #0x1f
	bhi .L08014638
	mov r2, sl
	adds r1, r2, r5
	cmp r1, #0x1f
	bhi .L08014638
	lsls r1, r1, #6
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	adds r1, r1, r0
	mov r2, ip
	subs r0, r2, r4
	lsls r0, r0, #1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	add r0, r9
	mov r2, r8
	eors r0, r2
	strh r0, [r1]
.L08014638:
	adds r2, r4, #0
	cmp r2, ip
	blt .L08014608
.L0801463E:
	adds r5, r6, #0
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt .L080145F8
	b .L08014690
.L08014648:
	movs r5, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	bge .L08014690
	lsls r2, r7, #1
	mov r8, r2
.L08014654:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge .L08014688
	lsls r0, r5, #6
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldr r3, [sp]
	add r3, r8
.L08014666:
	adds r0, r7, r2
	cmp r0, #0x1f
	bhi .L0801467E
	mov r0, sl
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi .L0801467E
	lsls r1, r1, #6
	adds r1, r1, r3
	ldrh r0, [r4]
	add r0, r9
	strh r0, [r1]
.L0801467E:
	adds r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, ip
	blt .L08014666
.L08014688:
	adds r5, r6, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	blt .L08014654
.L08014690:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080145C8

	THUMB_FUNC_START func_080146A0
func_080146A0: @ 0x080146A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov r9, r1
	str r2, [sp, #4]
	ldr r7, [sp, #0x28]
	ldr r5, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	ldr r0, [sp, #0x30]
	mov r8, r0
	movs r0, #0x20
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DivRem
	adds r1, r7, #0
	muls r1, r0, r1
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [sp, #0x2c]
	adds r0, r6, #0
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	cmp r5, r2
	bge .L0801473A
	mov r0, r9
	lsls r0, r0, #1
	mov ip, r0
.L080146FC:
	movs r4, #0
	adds r6, r5, #1
	cmp r4, r7
	bge .L08014732
	lsls r0, r5, #6
	mov r1, r8
	adds r3, r1, r0
	ldr r2, [sp]
	add r2, ip
.L0801470E:
	mov r1, r9
	adds r0, r1, r4
	cmp r0, #0x1f
	bhi .L08014728
	ldr r0, [sp, #4]
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi .L08014728
	lsls r1, r1, #6
	adds r1, r1, r2
	ldrh r0, [r3]
	add r0, sl
	strh r0, [r1]
.L08014728:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r7
	blt .L0801470E
.L08014732:
	adds r5, r6, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	blt .L080146FC
.L0801473A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080146A0

	THUMB_FUNC_START func_0801474C
func_0801474C: @ 0x0801474C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r5, [sp, #0x3c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #8]
	ldr r6, [sp, #0x38]
	ldrb r0, [r6]
	adds r0, #1
	mov r9, r0
	adds r6, #2
	mov r1, r8
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r4, #0
	muls r1, r0, r1
	subs r5, r5, r1
	mov r1, r8
	muls r1, r5, r1
	lsls r1, r1, #1
	adds r1, r6, r1
	ldr r2, [sp, #0x34]
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r6, r1, r0
	movs r5, #0
	cmp r5, r2
	bge .L080147F2
	mov r7, sl
	lsls r7, r7, #1
	mov ip, r7
.L080147A6:
	movs r4, #0
	adds r0, r5, #1
	str r0, [sp, #0xc]
	cmp r4, r8
	bge .L080147EA
	ldr r1, [sp, #0x34]
	subs r0, r1, r5
	subs r0, #1
	mov r2, r9
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #1
	adds r3, r6, r0
	ldr r2, [sp]
	add r2, ip
.L080147C4:
	mov r7, sl
	adds r0, r7, r4
	cmp r0, #0x1f
	bhi .L080147E0
	ldr r0, [sp, #4]
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi .L080147E0
	lsls r1, r1, #6
	adds r1, r1, r2
	ldrh r0, [r3]
	ldr r7, [sp, #8]
	adds r0, r7, r0
	strh r0, [r1]
.L080147E0:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r8
	blt .L080147C4
.L080147EA:
	ldr r5, [sp, #0xc]
	ldr r0, [sp, #0x34]
	cmp r5, r0
	blt .L080147A6
.L080147F2:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801474C

	THUMB_FUNC_START func_08014804
func_08014804: @ 0x08014804
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	mov ip, r2
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r2, r3, #2
	movs r1, #0xff
	ldr r0, [r3]
	ldrb r7, [r3]
	lsrs r3, r0, #8
	ands r3, r1
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	blt .L0801486C
.L0801482A:
	asrs r0, r1, #0x10
	add r0, ip
	lsls r4, r3, #0x10
	cmp r0, #0x1f
	bhi .L08014860
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	mov r3, r8
	adds r1, r3, r0
	lsls r3, r7, #0x10
	asrs r0, r3, #0x10
	cmp r0, #0
	blt .L08014860
.L08014846:
	asrs r3, r3, #0x10
	adds r0, r5, r3
	cmp r0, #0x1f
	bhi .L08014854
	ldrh r0, [r2]
	adds r0, r6, r0
	strh r0, [r1]
.L08014854:
	subs r0, r3, #1
	adds r2, #2
	adds r1, #2
	lsls r3, r0, #0x10
	cmp r3, #0
	bge .L08014846
.L08014860:
	ldr r1, .L08014878  @ 0xFFFF0000
	adds r0, r4, r1
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	cmp r1, #0
	bge .L0801482A
.L0801486C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08014878: .4byte 0xFFFF0000

	THUMB_FUNC_END func_08014804

	THUMB_FUNC_START FutureCall2_Loop
FutureCall2_Loop: @ 0x0801487C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne .L0801489A
	ldr r0, [r4, #0x2c]
	bl _call_via_r0
	adds r0, r4, #0
	bl Proc_Break
.L0801489A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FutureCall2_Loop

	THUMB_FUNC_START FutureCall_Loop
FutureCall_Loop: @ 0x080148A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne .L080148C0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
.L080148C0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FutureCall_Loop

	THUMB_FUNC_START SetupFutureCall2
SetupFutureCall2: @ 0x080148C8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080148E0  @ gUnknown_0859A100
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080148E0: .4byte gUnknown_0859A100

	THUMB_FUNC_END SetupFutureCall2

	THUMB_FUNC_START SetupFutureCall
SetupFutureCall: @ 0x080148E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08014900  @ gUnknown_0859A110
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08014900: .4byte gUnknown_0859A110

	THUMB_FUNC_END SetupFutureCall

	THUMB_FUNC_START func_08014904
func_08014904: @ 0x08014904
	push {lr}
	cmp r1, #0
	ble .L08014916
	movs r2, #0
.L0801490C:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt .L0801490C
.L08014916:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014904

	THUMB_FUNC_START func_0801491C
func_0801491C: @ 0x0801491C
	push {lr}
	cmp r1, #0
	ble .L0801492C
.L08014922:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt .L08014922
.L0801492C:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801491C

	THUMB_FUNC_START func_08014930
func_08014930: @ 0x08014930
	push {lr}
	cmp r1, #0
	ble .L08014940
.L08014936:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bgt .L08014936
.L08014940:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014930

	THUMB_FUNC_START func_08014944
func_08014944: @ 0x08014944
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, .L08014964  @ gUnknown_0859A1E0
	bl SpawnProcLocking
	adds r4, r0, #0
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08014964: .4byte gUnknown_0859A1E0

	THUMB_FUNC_END func_08014944

	THUMB_FUNC_START func_08014968
func_08014968: @ 0x08014968
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne .L08014986
	adds r0, r4, #0
	bl Proc_Break
.L08014986:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014968

	THUMB_FUNC_START func_0801498C
func_0801498C: @ 0x0801498C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq .L080149AA
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuSet
	b .L080149BC
.L080149AA:
	adds r2, r3, #0
	cmp r2, #0
	bge .L080149B2
	adds r2, #3
.L080149B2:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
.L080149BC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801498C

	THUMB_FUNC_START func_080149C4
func_080149C4: @ 0x080149C4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble .L080149EA
	adds r4, r3, #0
.L080149D2:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl func_0801498C
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne .L080149D2
.L080149EA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080149C4

	THUMB_FUNC_START func_080149F0
func_080149F0: @ 0x080149F0
	push {r4, lr}
	adds r4, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r2, #0
	ble .L08014A0C
.L080149FC:
	ldrh r0, [r4]
	adds r0, r3, r0
	strh r0, [r1]
	adds r4, #2
	adds r1, #2
	subs r2, #2
	cmp r2, #0
	bgt .L080149FC
.L08014A0C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080149F0

	THUMB_FUNC_START func_08014A14
func_08014A14: @ 0x08014A14
	push {lr}
	cmp r0, #1
	beq .L08014A40
	cmp r0, #1
	bgt .L08014A24
	cmp r0, #0
	beq .L08014A2E
	b .L08014A70
.L08014A24:
	cmp r0, #2
	beq .L08014A50
	cmp r0, #3
	beq .L08014A60
	b .L08014A70
.L08014A2E:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08014A3C  @ gBg0Tm
	adds r0, r0, r1
	b .L08014A72
	.align 2, 0
.L08014A3C: .4byte gBg0Tm
.L08014A40:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08014A4C  @ gBg1Tm
	adds r0, r0, r1
	b .L08014A72
	.align 2, 0
.L08014A4C: .4byte gBg1Tm
.L08014A50:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08014A5C  @ gBg2Tm
	adds r0, r0, r1
	b .L08014A72
	.align 2, 0
.L08014A5C: .4byte gBg2Tm
.L08014A60:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08014A6C  @ gBg3Tm
	adds r0, r0, r1
	b .L08014A72
	.align 2, 0
.L08014A6C: .4byte gBg3Tm
.L08014A70:
	movs r0, #0
.L08014A72:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08014A14

	THUMB_FUNC_START func_08014A78
func_08014A78: @ 0x08014A78
	push {r4, r5, lr}
	ldr r4, .L08014AFC  @ gDispIo
	ldrb r1, [r4, #0xc]
	movs r5, #0x80
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne .L08014A9C
	movs r0, #0
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl func_08014930
.L08014A9C:
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne .L08014ABA
	movs r0, #1
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl func_08014930
.L08014ABA:
	ldrb r1, [r4, #0x14]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne .L08014AD8
	movs r0, #2
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl func_08014930
.L08014AD8:
	ldrb r1, [r4, #0x18]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne .L08014AF6
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl func_08014930
.L08014AF6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08014AFC: .4byte gDispIo

	THUMB_FUNC_END func_08014A78

	THUMB_FUNC_START RerangeSomething
RerangeSomething: @ 0x08014B00
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge .L08014B0E
	movs r0, #0x60
	negs r0, r0
	b .L08014B24
.L08014B0E:
	cmp r1, #0xef
	bgt .L08014B22
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	movs r1, #0xf0
	bl Div
	subs r0, #0x60
	b .L08014B24
.L08014B22:
	movs r0, #0x5f
.L08014B24:
	pop {r1}
	bx r1

	THUMB_FUNC_END RerangeSomething

	THUMB_FUNC_START PlaySpacialSong
PlaySpacialSong: @ 0x08014B28
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, .L08014B78  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08014B42
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
.L08014B42:
	ldr r2, .L08014B7C  @ gMPlayTable
	ldr r1, .L08014B80  @ gSongTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, .L08014B84  @ 0x0000FFFF
	adds r0, r6, #0
	bl RerangeSomething
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08014B78: .4byte gPlaySt
.L08014B7C: .4byte gMPlayTable
.L08014B80: .4byte gSongTable
.L08014B84: .4byte 0x0000FFFF

	THUMB_FUNC_END PlaySpacialSong

	THUMB_FUNC_START func_08014B88
func_08014B88: @ 0x08014B88
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, .L08014B9C  @ func_08014BA0
	adds r1, r3, #0
	bl SetupFutureCall
	pop {r0}
	bx r0
	.align 2, 0
.L08014B9C: .4byte func_08014BA0

	THUMB_FUNC_END func_08014B88

	THUMB_FUNC_START func_08014BA0
func_08014BA0: @ 0x08014BA0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08014BBC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08014BB8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
.L08014BB8:
	pop {r0}
	bx r0
	.align 2, 0
.L08014BBC: .4byte gPlaySt

	THUMB_FUNC_END func_08014BA0

	THUMB_FUNC_START func_08014BC0
func_08014BC0: @ 0x08014BC0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014BC0

	THUMB_FUNC_START func_08014BD0
func_08014BD0: @ 0x08014BD0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl FadeBgmOut
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014BD0

	THUMB_FUNC_START func_08014BE0
func_08014BE0: @ 0x08014BE0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #5
	ldr r1, .L08014C34  @ gPal
	movs r2, #0x1f
	mov ip, r2
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r4, r0, r1
	movs r5, #0xf
.L08014BF6:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	lsrs r0, r0, #2
	lsls r2, r0, #1
	adds r2, r2, r0
	adds r0, r7, #0
	ands r0, r1
	lsrs r0, r0, #2
	lsls r3, r0, #1
	adds r3, r3, r0
	adds r0, r6, #0
	ands r0, r1
	lsrs r0, r0, #2
	lsls r1, r0, #1
	adds r1, r1, r0
	mov r0, ip
	ands r2, r0
	ands r3, r7
	orrs r2, r3
	ands r1, r6
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge .L08014BF6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08014C34: .4byte gPal

	THUMB_FUNC_END func_08014BE0

	THUMB_FUNC_START func_08014C38
func_08014C38: @ 0x08014C38
	push {lr}
	adds r3, r0, #0
	cmp r2, #0
	beq .L08014C4E
.L08014C40:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bne .L08014C40
.L08014C4E:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014C38

	THUMB_FUNC_START func_08014C54
func_08014C54: @ 0x08014C54
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov r9, r1
	adds r5, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x18]
	mov r0, r8
	bl GetStringTextLen
	adds r1, r0, #0
	lsls r4, r4, #3
	subs r4, r4, r1
	asrs r1, r4, #1
	adds r0, r6, #0
	bl Text_SetCursor
	adds r0, r6, #0
	mov r1, r8
	bl Text_DrawString
	lsls r5, r5, #5
	add r5, r9
	lsls r5, r5, #1
	ldr r0, .L08014CA0  @ gBg0Tm
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08014CA0: .4byte gBg0Tm

	THUMB_FUNC_END func_08014C54

	THUMB_FUNC_START func_08014CA4
func_08014CA4: @ 0x08014CA4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0xc
	adds r1, r4, #0
	bl DivArm
	adds r1, r5, #0
	adds r2, r6, #0
	bl func_0800A42C
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08014CA4

	THUMB_FUNC_START func_08014CC4
func_08014CC4: @ 0x08014CC4
	push {r4, r5, r6, lr}
	ldr r0, .L08014D24  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xe4
	bne .L08014CD6
	movs r4, #0
.L08014CD6:
	cmp r4, #0x9f
	bhi .L08014D38
	ldr r5, .L08014D28  @ gUnknown_03004990
	ldr r2, [r5]
	ldr r1, .L08014D2C  @ 0x0000079D
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08014D9E
	ldr r3, .L08014D30  @ 0x0000079C
	adds r0, r2, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	adds r0, r2, r0
	movs r3, #0
	adds r6, r5, #0
	ldr r5, .L08014D34  @ 0x0000078C
	lsls r1, r4, #1
	adds r2, r0, r1
	movs r4, #0xa0
	lsls r4, r4, #1
.L08014D08:
	ldr r0, [r6]
	lsls r1, r3, #2
	adds r0, r0, r5
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq .L08014D1A
	ldrh r0, [r2]
	strh r0, [r1]
.L08014D1A:
	adds r2, r2, r4
	adds r3, #1
	cmp r3, #2
	ble .L08014D08
	b .L08014D9E
	.align 2, 0
.L08014D24: .4byte 0x04000006
.L08014D28: .4byte gUnknown_03004990
.L08014D2C: .4byte 0x0000079D
.L08014D30: .4byte 0x0000079C
.L08014D34: .4byte 0x0000078C
.L08014D38:
	cmp r4, #0xa0
	bne .L08014D9E
	ldr r4, .L08014D84  @ gUnknown_03004990
	ldr r1, [r4]
	ldr r2, .L08014D88  @ 0x0000079E
	adds r0, r1, r2
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	beq .L08014D98
	ldr r3, .L08014D8C  @ 0x0000079D
	adds r1, r1, r3
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	ldr r2, .L08014D90  @ 0x0000079B
	adds r1, r0, r2
	ldrb r1, [r1]
	subs r3, #1
	adds r0, r0, r3
	strb r1, [r0]
	movs r3, #0
	adds r6, r4, #0
	ldr r5, .L08014D94  @ 0x0000078C
	movs r4, #0xf0
	lsls r4, r4, #3
.L08014D6C:
	ldr r0, [r6]
	lsls r2, r3, #2
	adds r1, r0, r5
	adds r1, r1, r2
	adds r0, r0, r4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	adds r3, #1
	cmp r3, #2
	ble .L08014D6C
	b .L08014D9E
	.align 2, 0
.L08014D84: .4byte gUnknown_03004990
.L08014D88: .4byte 0x0000079E
.L08014D8C: .4byte 0x0000079D
.L08014D90: .4byte 0x0000079B
.L08014D94: .4byte 0x0000078C
.L08014D98:
	ldr r3, .L08014DA4  @ 0x0000079D
	adds r0, r1, r3
	strb r2, [r0]
.L08014D9E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08014DA4: .4byte 0x0000079D

	THUMB_FUNC_END func_08014CC4

	THUMB_FUNC_START func_08014DA8
func_08014DA8: @ 0x08014DA8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	ldr r1, .L08014E24  @ gUnknown_03004990
	str r0, [r1]
	movs r3, #0
	adds r6, r1, #0
	adds r5, r6, #0
	movs r0, #0xf3
	lsls r0, r0, #3
	mov r8, r0
	movs r4, #0
	ldr r1, .L08014E28  @ 0x0000078C
	mov ip, r1
	movs r2, #0xf0
	lsls r2, r2, #3
	mov r9, r2
.L08014DCC:
	ldr r0, [r5]
	add r0, r8
	adds r0, r0, r3
	strb r4, [r0]
	ldr r0, [r5]
	lsls r2, r3, #2
	mov r7, ip
	adds r1, r0, r7
	adds r1, r1, r2
	add r0, r9
	adds r0, r0, r2
	str r4, [r0]
	str r4, [r1]
	adds r3, #1
	cmp r3, #2
	ble .L08014DCC
	ldr r0, [r6]
	ldr r1, .L08014E2C  @ 0x0000079B
	adds r2, r0, r1
	movs r1, #0
	strb r1, [r2]
	ldr r2, .L08014E30  @ 0x0000079C
	adds r0, r0, r2
	strb r1, [r0]
	ldr r0, [r6]
	ldr r7, .L08014E34  @ 0x0000079D
	adds r0, r0, r7
	strb r1, [r0]
	ldr r0, [r6]
	adds r2, #2
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, .L08014E38  @ func_08014CC4
	bl SetOnHBlankA
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08014E24: .4byte gUnknown_03004990
.L08014E28: .4byte 0x0000078C
.L08014E2C: .4byte 0x0000079B
.L08014E30: .4byte 0x0000079C
.L08014E34: .4byte 0x0000079D
.L08014E38: .4byte func_08014CC4

	THUMB_FUNC_END func_08014DA8

	THUMB_FUNC_START func_08014E3C
func_08014E3C: @ 0x08014E3C
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #0
	bl SetOnHBlankA
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r4, .L08014E68  @ gUnknown_03004990
	ldr r1, [r4]
	ldr r2, .L08014E6C  @ 0x010003C0
	bl CpuSet
	ldr r0, [r4]
	ldr r1, .L08014E70  @ 0x0000079E
	adds r0, r0, r1
	strb r5, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08014E68: .4byte gUnknown_03004990
.L08014E6C: .4byte 0x010003C0
.L08014E70: .4byte 0x0000079E

	THUMB_FUNC_END func_08014E3C

	THUMB_FUNC_START func_08014E74
func_08014E74: @ 0x08014E74
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, .L08014EA0  @ gUnknown_03004990
	ldr r0, [r0]
	ldr r4, .L08014EA4  @ 0x0000079B
	adds r2, r0, r4
	ldrb r2, [r2]
	adds r2, r2, r1
	movs r1, #1
	ands r2, r1
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #6
	adds r0, r0, r1
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #6
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08014EA0: .4byte gUnknown_03004990
.L08014EA4: .4byte 0x0000079B

	THUMB_FUNC_END func_08014E74

	THUMB_FUNC_START func_08014EA8
func_08014EA8: @ 0x08014EA8
	ldr r0, .L08014EBC  @ gUnknown_03004990
	ldr r1, [r0]
	ldr r0, .L08014EC0  @ 0x0000079B
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #1
	eors r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
.L08014EBC: .4byte gUnknown_03004990
.L08014EC0: .4byte 0x0000079B

	THUMB_FUNC_END func_08014EA8

	THUMB_FUNC_START func_08014EC4
func_08014EC4: @ 0x08014EC4
	ldr r2, .L08014ED8  @ gUnknown_03004990
	ldr r2, [r2]
	lsls r0, r0, #2
	movs r3, #0xf0
	lsls r3, r3, #3
	adds r2, r2, r3
	adds r2, r2, r0
	str r1, [r2]
	bx lr
	.align 2, 0
.L08014ED8: .4byte gUnknown_03004990

	THUMB_FUNC_END func_08014EC4

	THUMB_FUNC_START func_08014EDC
func_08014EDC: @ 0x08014EDC
	ldr r1, .L08014EF0  @ gUnknown_03004990
	ldr r1, [r1]
	lsls r0, r0, #2
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
.L08014EF0: .4byte gUnknown_03004990

	THUMB_FUNC_END func_08014EDC

	THUMB_FUNC_START func_08014EF4
func_08014EF4: @ 0x08014EF4
	ldr r1, .L08014F0C  @ gUnknown_03004990
	ldr r1, [r1]
	movs r2, #0xf3
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
.L08014F0C: .4byte gUnknown_03004990

	THUMB_FUNC_END func_08014EF4

	THUMB_FUNC_START func_08014F10
func_08014F10: @ 0x08014F10
	ldr r1, .L08014F2C  @ gUnknown_03004990
	ldr r2, [r1]
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L08014F2C: .4byte gUnknown_03004990

	THUMB_FUNC_END func_08014F10

	THUMB_FUNC_START func_08014F30
func_08014F30: @ 0x08014F30
	ldr r1, .L08014F4C  @ gUnknown_03004990
	ldr r2, [r1]
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L08014F4C: .4byte gUnknown_03004990

	THUMB_FUNC_END func_08014F30

	THUMB_FUNC_START func_08014F50
func_08014F50: @ 0x08014F50
	push {r4, r5, r6, lr}
	ldr r6, [r0]
	ldr r3, [r1]
	muls r3, r6, r3
	ldr r5, [r0, #4]
	ldr r4, [r1, #0xc]
	muls r4, r5, r4
	adds r3, r3, r4
	ldr r4, [r0, #8]
	ldr r0, [r1, #0x18]
	muls r0, r4, r0
	adds r3, r3, r0
	asrs r3, r3, #0xc
	str r3, [r2]
	ldr r0, [r1, #4]
	muls r0, r6, r0
	ldr r3, [r1, #0x10]
	muls r3, r5, r3
	adds r0, r0, r3
	ldr r3, [r1, #0x1c]
	muls r3, r4, r3
	adds r0, r0, r3
	asrs r0, r0, #0xc
	str r0, [r2, #4]
	ldr r0, [r1, #8]
	muls r0, r6, r0
	ldr r3, [r1, #0x14]
	muls r3, r5, r3
	adds r0, r0, r3
	ldr r1, [r1, #0x20]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r2, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014F50

	THUMB_FUNC_START func_08014F9C
func_08014F9C: @ 0x08014F9C
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r3, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r3, r6
	beq .L08014FAE
	cmp r4, r6
	bne .L08014FB2
.L08014FAE:
	mov r5, sp
	b .L08014FB4
.L08014FB2:
	adds r5, r6, #0
.L08014FB4:
	ldr r1, [r3]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5]
	ldr r1, [r3]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #4]
	ldr r1, [r3]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #8]
	ldr r1, [r3, #0xc]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0xc]
	ldr r1, [r3, #0xc]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x10]
	ldr r1, [r3, #0xc]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x14]
	ldr r1, [r3, #0x18]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x18]
	ldr r1, [r3, #0x18]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x1c]
	ldr r1, [r3, #0x18]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x20]
	ldr r1, [r3]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0xc]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x18]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x24]
	adds r0, r0, r1
	str r0, [r5, #0x24]
	ldr r1, [r3, #4]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x28]
	adds r0, r0, r1
	str r0, [r5, #0x28]
	ldr r1, [r3, #8]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x2c]
	adds r0, r0, r1
	str r0, [r5, #0x2c]
	cmp r5, sp
	bne .L08015104
	mov r0, sp
	adds r1, r6, #0
	bl func_0801512C
.L08015104:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08014F9C

	THUMB_FUNC_START func_0801510C
func_0801510C: @ 0x0801510C
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [r0]
	movs r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END func_0801510C

	THUMB_FUNC_START func_0801512C
func_0801512C: @ 0x0801512C
	ldr r2, [r0]
	str r2, [r1]
	ldr r2, [r0, #4]
	str r2, [r1, #4]
	ldr r2, [r0, #8]
	str r2, [r1, #8]
	ldr r2, [r0, #0xc]
	str r2, [r1, #0xc]
	ldr r2, [r0, #0x10]
	str r2, [r1, #0x10]
	ldr r2, [r0, #0x14]
	str r2, [r1, #0x14]
	ldr r2, [r0, #0x18]
	str r2, [r1, #0x18]
	ldr r2, [r0, #0x1c]
	str r2, [r1, #0x1c]
	ldr r2, [r0, #0x20]
	str r2, [r1, #0x20]
	ldr r2, [r0, #0x24]
	str r2, [r1, #0x24]
	ldr r2, [r0, #0x28]
	str r2, [r1, #0x28]
	ldr r0, [r0, #0x2c]
	str r0, [r1, #0x2c]
	bx lr

	THUMB_FUNC_END func_0801512C

	THUMB_FUNC_START func_08015160
func_08015160: @ 0x08015160
	push {r4, lr}
	ldr r3, .L080151A8  @ gSinLut
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r4, [r1]
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0]
	movs r3, #0
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x10]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	negs r1, r2
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080151A8: .4byte gSinLut

	THUMB_FUNC_END func_08015160

	THUMB_FUNC_START func_080151AC
func_080151AC: @ 0x080151AC
	push {r4, lr}
	ldr r3, .L080151F0  @ gSinLut
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r3, #0
	ldrsh r4, [r1, r3]
	str r4, [r0]
	movs r3, #0
	str r3, [r0, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	negs r1, r2
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r3, [r0, #0x1c]
	str r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080151F0: .4byte gSinLut

	THUMB_FUNC_END func_080151AC

	THUMB_FUNC_START func_080151F4
func_080151F4: @ 0x080151F4
	push {r4, lr}
	ldr r3, .L08015238  @ gSinLut
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r4, #0
	ldrsh r3, [r1, r4]
	str r3, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	negs r1, r2
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08015238: .4byte gSinLut

	THUMB_FUNC_END func_080151F4

	THUMB_FUNC_START func_0801523C
func_0801523C: @ 0x0801523C
	bx lr

	THUMB_FUNC_END func_0801523C

	THUMB_FUNC_START func_08015240
func_08015240: @ 0x08015240
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r0, [r1]
	muls r0, r2, r0
	ldr r3, [r4, #4]
	ldr r2, [r1, #4]
	muls r2, r3, r2
	adds r0, r0, r2
	ldr r2, [r4, #8]
	ldr r1, [r1, #8]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08015240

	THUMB_FUNC_START func_08015264
func_08015264: @ 0x08015264
	push {r4, r5, r6, lr}
	ldr r6, [r0, #4]
	ldr r3, [r1, #8]
	muls r3, r6, r3
	ldr r5, [r0, #8]
	ldr r4, [r1, #4]
	muls r4, r5, r4
	subs r3, r3, r4
	asrs r3, r3, #0xc
	str r3, [r2]
	ldr r3, [r1]
	muls r3, r5, r3
	ldr r4, [r0]
	ldr r0, [r1, #8]
	muls r0, r4, r0
	subs r3, r3, r0
	asrs r3, r3, #0xc
	str r3, [r2, #4]
	ldr r0, [r1, #4]
	muls r0, r4, r0
	ldr r1, [r1]
	muls r1, r6, r1
	subs r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r2, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08015264

	THUMB_FUNC_START func_0801529C
func_0801529C: @ 0x0801529C
	muls r0, r3, r0
	muls r1, r2, r1
	subs r0, r0, r1
	bx lr

	THUMB_FUNC_END func_0801529C

	THUMB_FUNC_START OnVBlank
OnVBlank: @ 0x080152A4
	push {lr}
	ldr r1, .L080152E8  @ gUnknown_03007FF8
	movs r0, #1
	strh r0, [r1]
	bl IncGameTime
	bl m4aSoundVSync
	ldr r0, .L080152EC  @ gProcTreeRootArray
	ldr r0, [r0]
	bl Proc_Run
	bl SyncLoOam
	ldr r1, .L080152F0  @ gBmSt
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L080152DE
	movs r0, #0
	strb r0, [r1]
	bl SyncDispIo
	bl SyncBgsAndPal
	bl ApplyDataMoves
	bl SyncHiOam
.L080152DE:
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
.L080152E8: .4byte gUnknown_03007FF8
.L080152EC: .4byte gProcTreeRootArray
.L080152F0: .4byte gBmSt

	THUMB_FUNC_END OnVBlank

	THUMB_FUNC_START OnGameLoopMain
OnGameLoopMain: @ 0x080152F4
	push {r4, lr}
	ldr r0, .L08015350  @ gKeySt
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, .L08015354  @ gProcTreeRootArray
	ldr r0, [r4, #4]
	bl Proc_Run
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801531A
	ldr r0, [r4, #8]
	bl Proc_Run
.L0801531A:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #0x10]
	bl Proc_Run
	movs r0, #0xd
	bl PutSpriteLayerOam
	ldr r1, .L08015358  @ gBmSt
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L0801535C  @ 0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08015350: .4byte gKeySt
.L08015354: .4byte gProcTreeRootArray
.L08015358: .4byte gBmSt
.L0801535C: .4byte 0x04000006

	THUMB_FUNC_END OnGameLoopMain

	THUMB_FUNC_START LockGameLogic
LockGameLogic: @ 0x08015360
	ldr r1, .L0801536C  @ gBmSt
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
.L0801536C: .4byte gBmSt

	THUMB_FUNC_END LockGameLogic

	THUMB_FUNC_START UnlockGameLogic
UnlockGameLogic: @ 0x08015370
	ldr r1, .L0801537C  @ gBmSt
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
.L0801537C: .4byte gBmSt

	THUMB_FUNC_END UnlockGameLogic

	THUMB_FUNC_START GetGameLogicLock
GetGameLogicLock: @ 0x08015380
	ldr r0, .L08015388  @ gBmSt
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
.L08015388: .4byte gBmSt

	THUMB_FUNC_END GetGameLogicLock

	THUMB_FUNC_START SwitchGameplayPhase
SwitchGameplayPhase: @ 0x0801538C
	push {lr}
	ldr r2, .L080153A0  @ gPlaySt
	ldrb r0, [r2, #0xf]
	cmp r0, #0x40
	beq .L080153B6
	cmp r0, #0x40
	bgt .L080153A4
	cmp r0, #0
	beq .L080153AA
	b .L080153CA
	.align 2, 0
.L080153A0: .4byte gPlaySt
.L080153A4:
	cmp r0, #0x80
	beq .L080153B0
	b .L080153CA
.L080153AA:
	movs r0, #0x80
	strb r0, [r2, #0xf]
	b .L080153CA
.L080153B0:
	movs r0, #0x40
	strb r0, [r2, #0xf]
	b .L080153CA
.L080153B6:
	movs r0, #0
	strb r0, [r2, #0xf]
	ldrh r1, [r2, #0x10]
	ldr r0, .L080153D0  @ 0x000003E6
	cmp r1, r0
	bhi .L080153C6
	adds r0, r1, #1
	strh r0, [r2, #0x10]
.L080153C6:
	bl DoTurnSupportExp
.L080153CA:
	pop {r0}
	bx r0
	.align 2, 0
.L080153D0: .4byte 0x000003E6

	THUMB_FUNC_END SwitchGameplayPhase

	THUMB_FUNC_START MapMain_CallBeginningEvent
MapMain_CallBeginningEvent: @ 0x080153D4
	push {r4, lr}
	ldr r0, .L080153F8  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	adds r4, r0, #0
	bl GetBattleMapKind
	cmp r0, #2
	beq .L080153FC
	ldr r0, [r4, #0x48]
	movs r1, #1
	bl CallEvent
	b .L08015404
	.align 2, 0
.L080153F8: .4byte gPlaySt
.L080153FC:
	ldr r0, .L0801540C  @ gUnknown_089FFC30
	movs r1, #1
	bl CallEvent
.L08015404:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0801540C: .4byte gUnknown_089FFC30

	THUMB_FUNC_END MapMain_CallBeginningEvent

	THUMB_FUNC_START MapMain_SwitchPhases
MapMain_SwitchPhases: @ 0x08015410
	push {lr}
	bl ClearActiveFactionGrayedStates
	bl RefreshUnitSprites
	bl SwitchGameplayPhase
	bl RunPhaseSwitchEvents
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0801542E
	movs r0, #1
	b .L08015430
.L0801542E:
	movs r0, #0
.L08015430:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMain_SwitchPhases

	THUMB_FUNC_START MapMain_ThisProbablyUsedToBeEventRelatedInEarlierGames
MapMain_ThisProbablyUsedToBeEventRelatedInEarlierGames: @ 0x08015434
	push {lr}
	bl func_080832D4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L08015446
	movs r0, #1
	b .L0801544C
.L08015446:
	bl func_080832D0
	movs r0, #0
.L0801544C:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMain_ThisProbablyUsedToBeEventRelatedInEarlierGames

	THUMB_FUNC_START MapMain_StartPhaseController
MapMain_StartPhaseController: @ 0x08015450
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08015468  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq .L0801548C
	cmp r0, #0x40
	bgt .L0801546C
	cmp r0, #0
	beq .L08015472
	b .L08015494
	.align 2, 0
.L08015468: .4byte gPlaySt
.L0801546C:
	cmp r0, #0x80
	beq .L0801547C
	b .L08015494
.L08015472:
	ldr r0, .L08015478  @ gUnknown_0859AAD8
	b .L0801547E
	.align 2, 0
.L08015478: .4byte gUnknown_0859AAD8
.L0801547C:
	ldr r0, .L08015488  @ ProcScr_CpPhase
.L0801547E:
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L08015494
	.align 2, 0
.L08015488: .4byte ProcScr_CpPhase
.L0801548C:
	ldr r0, .L080154A0  @ ProcScr_CpPhase
	adds r1, r4, #0
	bl SpawnProcLocking
.L08015494:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080154A0: .4byte ProcScr_CpPhase

	THUMB_FUNC_END MapMain_StartPhaseController

	THUMB_FUNC_START MapMain_StartPlayerPhaseAndApplyAction
MapMain_StartPlayerPhaseAndApplyAction: @ 0x080154A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080154C4  @ gUnknown_0859AAD8
	adds r1, r4, #0
	bl SpawnProcLocking
	movs r1, #7
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080154C4: .4byte gUnknown_0859AAD8

	THUMB_FUNC_END MapMain_StartPlayerPhaseAndApplyAction

	THUMB_FUNC_START MapMain_UpdateTraps
MapMain_UpdateTraps: @ 0x080154C8
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080154E4  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	bne .L080154EC
	ldr r0, .L080154E8  @ gUnknown_0859BDA0
	bl SpawnProcLocking
	bl HandleTrapDecay
	movs r0, #0
	b .L080154EE
	.align 2, 0
.L080154E4: .4byte gPlaySt
.L080154E8: .4byte gUnknown_0859BDA0
.L080154EC:
	movs r0, #1
.L080154EE:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMain_UpdateTraps

	THUMB_FUNC_START MapMain_Suspend
MapMain_Suspend: @ 0x080154F4
	push {lr}
	ldr r1, .L08015508  @ gAction
	movs r0, #9
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
	pop {r0}
	bx r0
	.align 2, 0
.L08015508: .4byte gAction

	THUMB_FUNC_END MapMain_Suspend

	THUMB_FUNC_START MapMain_StartIntroFx
MapMain_StartIntroFx: @ 0x0801550C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0801553C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x38
	beq .L08015534
	cmp r0, #6
	bne .L0801552C
	movs r0, #0x88
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08015534
.L0801552C:
	ldr r0, .L08015540  @ gUnknown_0859B1B0
	adds r1, r4, #0
	bl SpawnProcLocking
.L08015534:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801553C: .4byte gPlaySt
.L08015540: .4byte gUnknown_0859B1B0

	THUMB_FUNC_END MapMain_StartIntroFx

	THUMB_FUNC_START MapMain_DeployEveryone
MapMain_DeployEveryone: @ 0x08015544
	push {r4, lr}
	movs r0, #0x84
	bl ClearFlag
	ldr r0, .L08015584  @ gPlaySt
	adds r0, #0x4a
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0801557E
	movs r4, #1
.L0801555C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08015578
	ldr r0, [r2]
	cmp r0, #0
	beq .L08015578
	ldr r0, [r2, #0xc]
	movs r1, #9
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
.L08015578:
	adds r4, #1
	cmp r4, #0x3f
	ble .L0801555C
.L0801557E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08015584: .4byte gPlaySt

	THUMB_FUNC_END MapMain_DeployEveryone

	THUMB_FUNC_START GotoChapterWithoutSave
GotoChapterWithoutSave: @ 0x08015588
	push {lr}
	ldr r1, .L080155B0  @ gPlaySt
	strb r0, [r1, #0xe]
	ldr r0, .L080155B4  @ ProcScr_BMapMain
	bl FindProc
	movs r1, #2
	bl Proc_Goto
	ldr r0, .L080155B8  @ gUnknown_0859AAD8
	bl EndEachProc
	ldr r0, .L080155BC  @ ProcScr_CpPhase
	bl EndEachProc
	ldr r0, .L080155C0  @ ProcScr_BerserkCpPhase
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L080155B0: .4byte gPlaySt
.L080155B4: .4byte ProcScr_BMapMain
.L080155B8: .4byte gUnknown_0859AAD8
.L080155BC: .4byte ProcScr_CpPhase
.L080155C0: .4byte ProcScr_BerserkCpPhase

	THUMB_FUNC_END GotoChapterWithoutSave

	THUMB_FUNC_START MapMain_ChapterSwitch
MapMain_ChapterSwitch: @ 0x080155C4
	push {r4, r5, lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080155D8
	ldr r0, .L08015604  @ gPlaySt
	bl RegisterChapterTimeAndTurnCount
.L080155D8:
	bl ComputeChapterRankings
	ldr r0, .L08015604  @ gPlaySt
	adds r5, r0, #0
	adds r5, #0x4a
	ldrb r4, [r5]
	lsls r4, r4, #0x1f
	lsrs r4, r4, #0x1f
	bl CleanupUnitsBeforeChapter
	movs r0, #0
	bl StartChapter
	cmp r4, #0
	beq .L080155FE
	ldrb r0, [r5]
	movs r1, #1
	orrs r0, r1
	strb r0, [r5]
.L080155FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08015604: .4byte gPlaySt

	THUMB_FUNC_END MapMain_ChapterSwitch

	THUMB_FUNC_START ResetHLayers
ResetHLayers: @ 0x08015608
	push {lr}
	ldr r0, .L08015644  @ gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne .L0801564C
	ldr r3, .L08015648  @ gDispIo
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x14]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r2, r0
	orrs r2, r1
	strb r2, [r3, #0x18]
	b .L08015678
	.align 2, 0
.L08015644: .4byte gPlaySt
.L08015648: .4byte gDispIo
.L0801564C:
	ldr r3, .L0801567C  @ gDispIo
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
.L08015678:
	pop {r0}
	bx r0
	.align 2, 0
.L0801567C: .4byte gDispIo

	THUMB_FUNC_END ResetHLayers

	.align 2, 0 @ Don't pad with nop.
