	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START func_080895B4
func_080895B4: @ 0x080895B4
	push {lr}
	adds r2, r0, #0
	movs r0, #1
	ands r0, r2
	ldr r3, .L080895DC  @ gUnknown_08A07C58
	cmp r0, #0
	beq .L080895C4
	ldr r3, .L080895E0  @ gUnknown_08A07AD8
.L080895C4:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne .L0808960A
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq .L080895E4
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r3, r0
	b .L0808960A
	.align 2, 0
.L080895DC: .4byte gUnknown_08A07C58
.L080895E0: .4byte gUnknown_08A07AD8
.L080895E4:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne .L0808960A
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq .L080895F6
	adds r3, #0x40
.L080895F6:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq .L08089600
	adds r3, #0x80
.L08089600:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq .L0808960A
	adds r3, #0x80
.L0808960A:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq .L08089614
	adds r3, #0x20
.L08089614:
	lsls r1, r1, #5
	adds r0, r3, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080895B4

	THUMB_FUNC_START LoadChapterTitleGfx
LoadChapterTitleGfx: @ 0x08089624
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r0, #0x84
	lsls r0, r0, #1
	cmp r3, r0
	bls .L08089634
	movs r3, #0x54
.L08089634:
	ldr r2, .L08089660  @ gUnknown_0203E78C
	ldr r0, .L08089664  @ 0x000003FF
	adds r1, r0, #0
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r2, #2]
	ldr r1, .L08089668  @ chap_title_data
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08089660: .4byte gUnknown_0203E78C
.L08089664: .4byte 0x000003FF
.L08089668: .4byte chap_title_data

	THUMB_FUNC_END LoadChapterTitleGfx

	THUMB_FUNC_START func_0808966C
func_0808966C: @ 0x0808966C
	push {lr}
	bl LoadChapterTitleGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808966C

	THUMB_FUNC_START func_08089678
func_08089678: @ 0x08089678
	push {lr}
	adds r1, r0, #0
	ldr r3, .L0808969C  @ gUnknown_0203E78C
	ldr r0, .L080896A0  @ 0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, .L080896A4  @ gUnknown_08A09E4C
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
.L0808969C: .4byte gUnknown_0203E78C
.L080896A0: .4byte 0x000003FF
.L080896A4: .4byte gUnknown_08A09E4C

	THUMB_FUNC_END func_08089678

	THUMB_FUNC_START func_080896A8
func_080896A8: @ 0x080896A8
	push {lr}
	adds r1, r0, #0
	ldr r3, .L080896CC  @ gUnknown_0203E78C
	ldr r0, .L080896D0  @ 0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, .L080896D4  @ gUnknown_08A0A4E8
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
.L080896CC: .4byte gUnknown_0203E78C
.L080896D0: .4byte 0x000003FF
.L080896D4: .4byte gUnknown_08A0A4E8

	THUMB_FUNC_END func_080896A8

	THUMB_FUNC_START func_080896D8
func_080896D8: @ 0x080896D8
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080896F8  @ gUnknown_0203E78C
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r1, r1, r0
	movs r0, #0x3f
.L080896E6:
	strh r1, [r2]
	adds r1, #1
	adds r2, #2
	subs r0, #1
	cmp r0, #0
	bge .L080896E6
	pop {r0}
	bx r0
	.align 2, 0
.L080896F8: .4byte gUnknown_0203E78C

	THUMB_FUNC_END func_080896D8

	THUMB_FUNC_START func_080896FC
func_080896FC: @ 0x080896FC
	push {lr}
	adds r2, r0, #0
	ldr r0, .L0808971C  @ gUnknown_0203E78C
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r1, r1, r0
	movs r0, #0x3f
.L0808970A:
	strh r1, [r2]
	adds r1, #1
	adds r2, #2
	subs r0, #1
	cmp r0, #0
	bge .L0808970A
	pop {r0}
	bx r0
	.align 2, 0
.L0808971C: .4byte gUnknown_0203E78C

	THUMB_FUNC_END func_080896FC

	THUMB_FUNC_START func_08089720
func_08089720: @ 0x08089720
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08089740  @ gUnknown_0203E78C
	lsls r1, r1, #0xc
	ldrh r0, [r0]
	adds r1, r1, r0
	movs r0, #0x7f
.L0808972E:
	strh r1, [r2]
	adds r1, #1
	adds r2, #2
	subs r0, #1
	cmp r0, #0
	bge .L0808972E
	pop {r0}
	bx r0
	.align 2, 0
.L08089740: .4byte gUnknown_0203E78C

	THUMB_FUNC_END func_08089720

	THUMB_FUNC_START func_08089744
func_08089744: @ 0x08089744
	push {lr}
	adds r2, r1, #0
	ldr r1, .L08089760  @ gUnknown_08A0A9F8
	ldr r3, .L08089764  @ gUnknown_0203E78C
	lsls r2, r2, #0xc
	ldrh r3, [r3]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	pop {r0}
	bx r0
	.align 2, 0
.L08089760: .4byte gUnknown_08A0A9F8
.L08089764: .4byte gUnknown_0203E78C

	THUMB_FUNC_END func_08089744

	THUMB_FUNC_START func_08089768
func_08089768: @ 0x08089768
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne .L08089774
	movs r0, #0x54
	b .L08089798
.L08089774:
	ldrb r2, [r1, #0x14]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq .L08089782
	movs r0, #0x57
	b .L08089798
.L08089782:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne .L08089796
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xe]
	b .L08089798
.L08089796:
	movs r0, #0x55
.L08089798:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08089768

	THUMB_FUNC_START func_0808979C
func_0808979C: @ 0x0808979C
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne .L080897AE
	movs r0, #0x54
	b .L080897F2
.L080897A8:
	adds r0, r1, #0
	adds r0, #0x46
	b .L080897F2
.L080897AE:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl func_080BCFDC
	adds r5, r0, #0
	ldrb r1, [r4, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L080897CC
	ldr r0, .L080897F8  @ gGmData
	bl func_080BD014
	cmp r0, r5
	beq .L080897E8
.L080897CC:
	movs r1, #0
	ldr r0, .L080897FC  @ gUnknown_08206951
	ldrb r0, [r0]
	cmp r1, r0
	bge .L080897E8
	ldr r3, .L08089800  @ gUnknown_08206948
	adds r2, r0, #0
.L080897DA:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r5, r0
	beq .L080897A8
	adds r1, #1
	cmp r1, r2
	blt .L080897DA
.L080897E8:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xe]
.L080897F2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080897F8: .4byte gGmData
.L080897FC: .4byte gUnknown_08206951
.L08089800: .4byte gUnknown_08206948

	THUMB_FUNC_END func_0808979C

	THUMB_FUNC_START LoadHelpBoxGfx
LoadHelpBoxGfx: @ 0x08089804
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne .L08089810
	ldr r5, .L080898A4  @ 0x06013000
.L08089810:
	cmp r6, #0
	bge .L08089816
	movs r6, #5
.L08089816:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	ldr r0, .L080898A8  @ gUnknown_08A0285C
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L080898AC  @ gUnknown_08A02884
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L080898B0  @ gUnknown_08A028AC
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L080898B4  @ gUnknown_08A02914
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L080898B8  @ gUnknown_08A02980
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl Decompress
	ldr r7, .L080898BC  @ gFont_HelpBox
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSpriteTextFont
	adds r0, r7, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r7, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r7, #0
	adds r0, #0x28
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	ldr r0, .L080898C0  @ gUnknown_0859EF40
	lsls r1, r6, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r5, #0x11
	lsrs r0, r0, #0x16
	ands r6, r4
	lsls r1, r6, #0xc
	adds r0, r0, r1
	strh r0, [r7, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080898A4: .4byte 0x06013000
.L080898A8: .4byte gUnknown_08A0285C
.L080898AC: .4byte gUnknown_08A02884
.L080898B0: .4byte gUnknown_08A028AC
.L080898B4: .4byte gUnknown_08A02914
.L080898B8: .4byte gUnknown_08A02980
.L080898BC: .4byte gFont_HelpBox
.L080898C0: .4byte gUnknown_0859EF40

	THUMB_FUNC_END LoadHelpBoxGfx

	THUMB_FUNC_START func_080898C4
func_080898C4: @ 0x080898C4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne .L080898D0
	ldr r5, .L08089960  @ 0x06013000
.L080898D0:
	cmp r6, #0
	bge .L080898D6
	movs r6, #5
.L080898D6:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	ldr r0, .L08089964  @ gUnknown_08A0285C
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L08089968  @ gUnknown_08A02884
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808996C  @ gUnknown_08A028AC
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L08089970  @ gUnknown_08A02914
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L08089974  @ gUnknown_08A02980
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl Decompress
	ldr r7, .L08089978  @ gFont_HelpBox
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSpriteTextFont
	adds r0, r7, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r7, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	bl SetTextFont
	ldr r0, .L0808997C  @ gUnknown_0859EF40
	lsls r1, r6, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r5, #0x11
	lsrs r0, r0, #0x16
	ands r6, r4
	lsls r1, r6, #0xc
	adds r0, r0, r1
	strh r0, [r7, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08089960: .4byte 0x06013000
.L08089964: .4byte gUnknown_08A0285C
.L08089968: .4byte gUnknown_08A02884
.L0808996C: .4byte gUnknown_08A028AC
.L08089970: .4byte gUnknown_08A02914
.L08089974: .4byte gUnknown_08A02980
.L08089978: .4byte gFont_HelpBox
.L0808997C: .4byte gUnknown_0859EF40

	THUMB_FUNC_END func_080898C4

	THUMB_FUNC_START DisplayHelpBoxObj
DisplayHelpBoxObj: @ 0x08089980
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov sl, r0
	str r1, [sp, #4]
	adds r7, r2, #0
	mov r9, r3
	adds r0, r7, #7
	movs r1, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r0, #0xf
	adds r1, r7, #0
	ands r1, r0
	cmp r7, #0x1f
	bgt .L080899AA
	movs r7, #0x20
.L080899AA:
	cmp r7, #0xc0
	ble .L080899B0
	movs r7, #0xc0
.L080899B0:
	mov r0, r9
	cmp r0, #0xf
	bgt .L080899BA
	movs r0, #0x10
	mov r9, r0
.L080899BA:
	mov r0, r9
	cmp r0, #0x30
	ble .L080899C4
	movs r0, #0x30
	mov r9, r0
.L080899C4:
	adds r0, r7, #0
	adds r0, #0x1f
	cmp r0, #0
	bge .L080899CE
	adds r0, #0x1f
.L080899CE:
	asrs r2, r0, #5
	mov r0, r9
	adds r0, #0xf
	cmp r0, #0
	bge .L080899DA
	adds r0, #0xf
.L080899DA:
	asrs r0, r0, #4
	str r0, [sp, #8]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	mov r8, r3
	subs r5, r2, #1
	str r0, [sp, #0x1c]
	str r5, [sp, #0x14]
	ldr r0, [sp, #4]
	subs r0, #8
	str r0, [sp, #0x10]
	ldr r3, [sp, #4]
	add r3, r9
	str r3, [sp, #0x28]
	mov r0, sl
	subs r0, #8
	str r0, [sp, #0xc]
	mov r3, sl
	adds r3, r3, r7
	str r3, [sp, #0x24]
	lsls r1, r1, #0x18
	str r1, [sp, #0x20]
	cmp r5, #0
	blt .L08089A92
.L08089A0A:
	ldr r4, [sp, #8]
	subs r0, r5, #1
	str r0, [sp, #0x18]
	cmp r4, #0
	blt .L08089A88
	lsls r6, r4, #6
	mov r1, r8
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
.L08089A1E:
	adds r0, r4, #1
	lsls r2, r0, #4
	cmp r2, r9
	ble .L08089A28
	mov r2, r9
.L08089A28:
	subs r2, #0x10
	adds r0, r5, #1
	lsls r0, r0, #5
	mov r3, r8
	cmp r3, #0
	beq .L08089A5C
	subs r0, #0x20
	mov r3, sl
	adds r1, r3, r0
	ldr r0, [sp, #4]
	adds r2, r0, r2
	ldr r3, .L08089A54  @ gFont_HelpBox
	lsls r0, r5, #2
	ldrh r3, [r3, #0x30]
	adds r0, r0, r3
	adds r0, r0, r6
	str r0, [sp]
	movs r0, #0
	ldr r3, .L08089A58  @ Sprite_16x16
	bl PutSprite
	b .L08089A80
	.align 2, 0
.L08089A54: .4byte gFont_HelpBox
.L08089A58: .4byte Sprite_16x16
.L08089A5C:
	cmp r0, r7
	ble .L08089A62
	adds r0, r7, #0
.L08089A62:
	subs r0, #0x20
	mov r3, sl
	adds r1, r3, r0
	ldr r0, [sp, #4]
	adds r2, r0, r2
	ldr r3, .L08089ADC  @ gFont_HelpBox
	lsls r0, r5, #2
	ldrh r3, [r3, #0x30]
	adds r0, r0, r3
	adds r0, r0, r6
	str r0, [sp]
	movs r0, #0
	ldr r3, .L08089AE0  @ Sprite_32x16
	bl PutSprite
.L08089A80:
	subs r6, #0x40
	subs r4, #1
	cmp r4, #0
	bge .L08089A1E
.L08089A88:
	movs r1, #0
	mov r8, r1
	ldr r5, [sp, #0x18]
	cmp r5, #0
	bge .L08089A0A
.L08089A92:
	ldr r3, [sp, #0x1c]
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r5, [sp, #0x14]
	cmp r5, #0
	blt .L08089B1E
	ldr r6, .L08089ADC  @ gFont_HelpBox
.L08089AA0:
	adds r0, r5, #1
	lsls r0, r0, #5
	mov r1, r8
	cmp r1, #0
	beq .L08089AE8
	subs r0, #0x20
	mov r3, sl
	adds r4, r3, r0
	ldrh r0, [r6, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x10]
	ldr r3, .L08089AE4  @ Sprite_16x8
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x28]
	ldr r3, .L08089AE4  @ Sprite_16x8
	bl PutSprite
	movs r0, #0
	mov r8, r0
	b .L08089B18
	.align 2, 0
.L08089ADC: .4byte gFont_HelpBox
.L08089AE0: .4byte Sprite_32x16
.L08089AE4: .4byte Sprite_16x8
.L08089AE8:
	cmp r0, r7
	ble .L08089AEE
	adds r0, r7, #0
.L08089AEE:
	subs r0, #0x20
	mov r1, sl
	adds r4, r1, r0
	ldrh r0, [r6, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x10]
	ldr r3, .L08089C28  @ Sprite_32x8
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x28]
	ldr r3, .L08089C28  @ Sprite_32x8
	bl PutSprite
.L08089B18:
	subs r5, #1
	cmp r5, #0
	bge .L08089AA0
.L08089B1E:
	ldr r4, [sp, #8]
	cmp r4, #0
	blt .L08089B7C
.L08089B24:
	adds r0, r4, #1
	lsls r2, r0, #4
	cmp r2, r9
	ble .L08089B2E
	mov r2, r9
.L08089B2E:
	subs r2, #0x10
	ldr r3, [sp, #4]
	adds r5, r3, r2
	ldr r7, .L08089C2C  @ Sprite_8x16
	ldr r6, .L08089C30  @ gFont_HelpBox
	ldrh r0, [r6, #0x30]
	adds r0, #0x5f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0xc]
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x24]
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq .L08089B76
	ldrh r0, [r6, #0x30]
	adds r0, #0x1a
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x24]
	subs r1, #8
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
.L08089B76:
	subs r4, #1
	cmp r4, #0
	bge .L08089B24
.L08089B7C:
	ldr r6, .L08089C34  @ Sprite_8x8
	ldr r5, .L08089C30  @ gFont_HelpBox
	ldrh r0, [r5, #0x30]
	adds r0, #0x5b
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x10]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5d
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x28]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	adds r3, r6, #0
	bl PutSprite
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq .L08089BF6
	ldr r4, [sp, #0x24]
	subs r4, #8
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x10]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x28]
	adds r3, r6, #0
	bl PutSprite
.L08089BF6:
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	bne .L08089C16
	ldr r2, [sp, #4]
	subs r2, #0xb
	ldr r3, .L08089C38  @ Sprite_32x16
	ldr r0, .L08089C30  @ gFont_HelpBox
	ldrh r1, [r0, #0x30]
	ldr r0, .L08089C3C  @ 0x000003FF
	ands r0, r1
	adds r0, #0x7b
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	bl PutSprite
.L08089C16:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08089C28: .4byte Sprite_32x8
.L08089C2C: .4byte Sprite_8x16
.L08089C30: .4byte gFont_HelpBox
.L08089C34: .4byte Sprite_8x8
.L08089C38: .4byte Sprite_32x16
.L08089C3C: .4byte 0x000003FF

	THUMB_FUNC_END DisplayHelpBoxObj

	THUMB_FUNC_START DrawHelpBoxWeaponStatLabels
DrawHelpBoxWeaponStatLabels: @ 0x08089C40
	push {r4, lr}
	ldr r4, .L08089CC0  @ gText_HelpBox
	bl GetItemKind
	bl GetItemKindString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	movs r0, #0xa0
	lsls r0, r0, #3
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, .L08089CC4  @ 0x00000502
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x61
	movs r2, #8
	bl Text_InsertDrawString
	adds r4, #8
	ldr r0, .L08089CC8  @ 0x00000503
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, .L08089CCC  @ 0x000004F4
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, .L08089CD0  @ 0x00000501
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x61
	movs r2, #8
	bl Text_InsertDrawString
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08089CC0: .4byte gText_HelpBox
.L08089CC4: .4byte 0x00000502
.L08089CC8: .4byte 0x00000503
.L08089CCC: .4byte 0x000004F4
.L08089CD0: .4byte 0x00000501

	THUMB_FUNC_END DrawHelpBoxWeaponStatLabels

	THUMB_FUNC_START DrawHelpBoxWeaponStats
DrawHelpBoxWeaponStats: @ 0x08089CD4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08089D4C  @ gText_HelpBox
	bl GetItemWeaponLevelString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x43
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemWeight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r4, #8
	adds r0, r5, #0
	bl GetItemMight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemHit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x51
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemCrit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08089D4C: .4byte gText_HelpBox

	THUMB_FUNC_END DrawHelpBoxWeaponStats

	THUMB_FUNC_START DrawHelpBoxStaffStatLabels
DrawHelpBoxStaffStatLabels: @ 0x08089D50
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08089DA8  @ gText_HelpBox
	ldr r0, .L08089DAC  @ 0x00000509
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemWeaponLevelString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #7
	bl Text_InsertDrawString
	movs r0, #0xa0
	lsls r0, r0, #3
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x46
	movs r2, #7
	bl Text_InsertDrawString
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08089DA8: .4byte gText_HelpBox
.L08089DAC: .4byte 0x00000509

	THUMB_FUNC_END DrawHelpBoxStaffStatLabels

	THUMB_FUNC_START DrawHelpBoxSavemenuLabels
DrawHelpBoxSavemenuLabels: @ 0x08089DB0
	push {r4, lr}
	ldr r4, .L08089DE0  @ gText_HelpBox
	ldr r0, .L08089DE4  @ 0x00000147
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	movs r0, #0xa4
	lsls r0, r0, #1
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x5a
	movs r2, #8
	bl Text_InsertDrawString
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08089DE0: .4byte gText_HelpBox
.L08089DE4: .4byte 0x00000147

	THUMB_FUNC_END DrawHelpBoxSavemenuLabels

	THUMB_FUNC_START DrawHelpBoxSavemenuStuff
DrawHelpBoxSavemenuStuff: @ 0x08089DE8
	push {r4, lr}
	bl func_080AA768
	adds r3, r0, #0
	cmp r3, #0
	beq .L08089E04
	ldr r0, .L08089E00  @ gText_HelpBox
	movs r1, #0x1a
	movs r2, #7
	bl Text_InsertDrawString
	b .L08089E1A
	.align 2, 0
.L08089E00: .4byte gText_HelpBox
.L08089E04:
	ldr r4, .L08089E30  @ gText_HelpBox
	movs r0, #0xa7
	lsls r0, r0, #3
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x1a
	movs r2, #7
	bl Text_InsertDrawString
.L08089E1A:
	bl func_080AA744
	adds r3, r0, #0
	cmp r3, #0
	blt .L08089E34
	ldr r0, .L08089E30  @ gText_HelpBox
	movs r1, #0x74
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	b .L08089E48
	.align 2, 0
.L08089E30: .4byte gText_HelpBox
.L08089E34:
	ldr r4, .L08089E50  @ gText_HelpBox
	ldr r0, .L08089E54  @ 0x00000535
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #7
	bl Text_InsertDrawString
.L08089E48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08089E50: .4byte gText_HelpBox
.L08089E54: .4byte 0x00000535

	THUMB_FUNC_END DrawHelpBoxSavemenuStuff

	THUMB_FUNC_START HelpBoxTextScroll_OnLoop
HelpBoxTextScroll_OnLoop: @ 0x08089E58
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt .L08089EE6
	adds r0, r4, #0
	adds r0, #0x60
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r6, r1
	bge .L08089EE0
	adds r5, r4, #0
	adds r5, #0x5c
.L08089E8E:
	ldr r0, [r4, #0x2c]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #1
	beq .L08089EB0
	cmp r2, #1
	bgt .L08089EA2
	cmp r2, #0
	beq .L08089EA8
	b .L08089EC0
.L08089EA2:
	cmp r2, #4
	beq .L08089EBC
	b .L08089EC0
.L08089EA8:
	adds r0, r4, #0
	bl Proc_Break
	b .L08089EE0
.L08089EB0:
	adds r0, r3, #1
	str r0, [r4, #0x2c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b .L08089ED6
.L08089EBC:
	adds r0, r3, #1
	b .L08089ED4
.L08089EC0:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	bl Text_DrawCharacter
.L08089ED4:
	str r0, [r4, #0x2c]
.L08089ED6:
	adds r6, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r6, r0
	blt .L08089E8E
.L08089EE0:
	movs r0, #0
	bl SetTextFont
.L08089EE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END HelpBoxTextScroll_OnLoop

	THUMB_FUNC_START func_08089EEC
func_08089EEC: @ 0x08089EEC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
.L08089EF8:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldrb r0, [r5, #4]
	lsls r0, r0, #3
	ldr r1, [r4, #0x2c]
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetCursor
.L08089F14:
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq .L08089F34
	cmp r1, #1
	bgt .L08089F26
	cmp r1, #0
	beq .L08089F4C
	b .L08089F40
.L08089F26:
	cmp r1, #5
	bgt .L08089F40
	cmp r1, #4
	blt .L08089F40
	adds r0, #1
	str r0, [r4, #0x2c]
	b .L08089F14
.L08089F34:
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r6, #1
	cmp r6, #5
	ble .L08089EF8
	b .L08089F4C
.L08089F40:
	ldr r1, [r4, #0x2c]
	adds r0, r5, #0
	bl Text_DrawCharacter
	str r0, [r4, #0x2c]
	b .L08089F14
.L08089F4C:
	ldr r0, [r4, #0x30]
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08089EEC

	THUMB_FUNC_START func_08089F58
func_08089F58: @ 0x08089F58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, .L08089F80  @ gFont_HelpBox
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	bl GetItemHelpBoxKind
	adds r1, r0, #0
	cmp r1, #1
	beq .L08089F96
	cmp r1, #1
	bgt .L08089F84
	cmp r1, #0
	beq .L08089F8E
	b .L08089FB8
	.align 2, 0
.L08089F80: .4byte gFont_HelpBox
.L08089F84:
	cmp r1, #2
	beq .L08089FA4
	cmp r1, #3
	beq .L08089FAC
	b .L08089FB8
.L08089F8E:
	adds r0, r5, #0
	adds r0, #0x64
	strh r1, [r0]
	b .L08089FB8
.L08089F96:
	adds r0, r4, #0
	bl DrawHelpBoxWeaponStatLabels
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #2
	b .L08089FB6
.L08089FA4:
	adds r0, r4, #0
	bl DrawHelpBoxStaffStatLabels
	b .L08089FB0
.L08089FAC:
	bl DrawHelpBoxSavemenuLabels
.L08089FB0:
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #1
.L08089FB6:
	strh r0, [r1]
.L08089FB8:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08089F58

	THUMB_FUNC_START func_08089FCC
func_08089FCC: @ 0x08089FCC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, .L08089FE8  @ gFont_HelpBox
	bl SetTextFont
	adds r0, r4, #0
	bl GetItemHelpBoxKind
	cmp r0, #1
	beq .L08089FEC
	cmp r0, #3
	beq .L08089FF4
	b .L08089FF8
	.align 2, 0
.L08089FE8: .4byte gFont_HelpBox
.L08089FEC:
	adds r0, r4, #0
	bl DrawHelpBoxWeaponStats
	b .L08089FF8
.L08089FF4:
	bl DrawHelpBoxSavemenuStuff
.L08089FF8:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08089FCC

	THUMB_FUNC_START func_0808A00C
func_0808A00C: @ 0x0808A00C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r5, .L0808A0B4  @ gFont_HelpBox
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	movs r0, #0x18
	adds r0, r0, r5
	mov r9, r0
	movs r1, #6
	bl Text_SetColor
	movs r1, #0x20
	adds r1, r1, r5
	mov r8, r1
	mov r0, r8
	movs r1, #6
	bl Text_SetColor
	adds r6, r5, #0
	adds r6, #0x28
	adds r0, r6, #0
	movs r1, #6
	bl Text_SetColor
	movs r0, #0
	bl SetTextFont
	ldr r4, .L0808A0B8  @ gUnknown_08A01628
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x30]
	mov r0, r9
	str r0, [r4, #0x34]
	mov r1, r8
	str r1, [r4, #0x38]
	str r6, [r4, #0x3c]
	mov r0, sl
	adds r0, #0x64
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r5, #0
	strh r1, [r0]
	mov r1, sl
	ldr r0, [r1, #0x5c]
	bl GetMsg
	bl StrExpandNames
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #1
	strh r3, [r1]
	adds r0, r4, #0
	adds r0, #0x5e
	strh r5, [r0]
	ldr r0, .L0808A0BC  @ gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	cmp r2, #1
	beq .L0808A0D2
	cmp r2, #1
	bgt .L0808A0C0
	cmp r2, #0
	beq .L0808A0CA
	b .L0808A0EE
	.align 2, 0
.L0808A0B4: .4byte gFont_HelpBox
.L0808A0B8: .4byte gUnknown_08A01628
.L0808A0BC: .4byte gPlaySt
.L0808A0C0:
	cmp r2, #2
	beq .L0808A0DA
	cmp r2, #3
	beq .L0808A0E4
	b .L0808A0EE
.L0808A0CA:
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #2
	b .L0808A0EC
.L0808A0D2:
	adds r0, r4, #0
	adds r0, #0x60
	strh r2, [r0]
	b .L0808A0EE
.L0808A0DA:
	adds r0, r4, #0
	adds r0, #0x60
	strh r3, [r0]
	strh r2, [r1]
	b .L0808A0EE
.L0808A0E4:
	adds r0, r4, #0
	adds r0, #0x60
	strh r5, [r0]
	movs r0, #0x7f
.L0808A0EC:
	strh r0, [r1]
.L0808A0EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A00C

	THUMB_FUNC_START StartHelpBoxTextInit
StartHelpBoxTextInit: @ 0x0808A0FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0808A114  @ gUnknown_08A01650
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x58]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808A114: .4byte gUnknown_08A01650

	THUMB_FUNC_END StartHelpBoxTextInit

	THUMB_FUNC_START ClearHelpBoxText
ClearHelpBoxText: @ 0x0808A118
	push {r4, lr}
	ldr r4, .L0808A154  @ gFont_HelpBox
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl DrawSpriteTextBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl DrawSpriteTextBackground
	adds r4, #0x28
	adds r0, r4, #0
	bl DrawSpriteTextBackground
	ldr r0, .L0808A158  @ gUnknown_08A01628
	bl EndEachProc
	ldr r0, .L0808A15C  @ gUnknown_08A01650
	bl EndEachProc
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808A154: .4byte gFont_HelpBox
.L0808A158: .4byte gUnknown_08A01628
.L0808A15C: .4byte gUnknown_08A01650

	THUMB_FUNC_END ClearHelpBoxText

	THUMB_FUNC_START func_0808A160
func_0808A160: @ 0x0808A160
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl UpdateHelpBoxDisplay
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge .L0808A182
	adds r0, r3, #1
	strh r0, [r2]
.L0808A182:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A160

	THUMB_FUNC_START func_0808A188
func_0808A188: @ 0x0808A188
	push {r4, r5, lr}
	adds r4, r0, #0
	bl func_0808A444
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl func_0808A43C
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A188

	THUMB_FUNC_START func_0808A1B8
func_0808A1B8: @ 0x0808A1B8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateHelpBoxDisplay
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L0808A1D8
	adds r0, r4, #0
	bl Proc_Break
.L0808A1D8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A1B8

	THUMB_FUNC_START func_0808A1E0
func_0808A1E0: @ 0x0808A1E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808A1FC  @ gUnknown_0203E7C8
	movs r3, #0
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	bl func_0808A354
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808A1FC: .4byte gUnknown_0203E7C8

	THUMB_FUNC_END func_0808A1E0

	THUMB_FUNC_START func_0808A200
func_0808A200: @ 0x0808A200
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, .L0808A244  @ gUnknown_08A01678
	adds r0, r4, #0
	bl FindProc
	adds r5, r0, #0
	cmp r5, #0
	bne .L0808A24C
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	ldr r0, .L0808A248  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808A230
	movs r0, #0x70
	bl m4aSongNumStart
.L0808A230:
	ldrb r1, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	adds r0, r5, #0
	bl func_0808A43C
	adds r0, r5, #0
	bl func_0808A444
	b .L0808A268
	.align 2, 0
.L0808A244: .4byte gUnknown_08A01678
.L0808A248: .4byte gPlaySt
.L0808A24C:
	ldrh r0, [r5, #0x30]
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x3a]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	subs r0, #4
	strh r1, [r0]
	adds r0, #6
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
.L0808A268:
	str r6, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc
	strh r0, [r1]
	ldrh r0, [r6, #0x12]
	adds r4, r5, #0
	adds r4, #0x4c
	strh r0, [r4]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r4]
	bl GetMsg
	add r2, sp, #4
	mov r1, sp
	bl GetStringTextBox
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl func_0808A384
	ldrb r1, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	adds r0, r5, #0
	bl func_0808A3C4
	bl ClearHelpBoxText
	adds r0, r5, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	ldrh r1, [r4]
	bl StartHelpBoxTextInit
	ldr r0, .L0808A2CC  @ gUnknown_0203E7E4
	str r6, [r0]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808A2CC: .4byte gUnknown_0203E7E4

	THUMB_FUNC_END func_0808A200

	THUMB_FUNC_START func_0808A2D0
func_0808A2D0: @ 0x0808A2D0
	push {lr}
	ldr r0, .L0808A2F4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808A2E4
	movs r0, #0x71
	bl m4aSongNumStart
.L0808A2E4:
	bl ClearHelpBoxText
	ldr r0, .L0808A2F8  @ gUnknown_08A01678
	bl BreakEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0808A2F4: .4byte gPlaySt
.L0808A2F8: .4byte gUnknown_08A01678

	THUMB_FUNC_END func_0808A2D0

	THUMB_FUNC_START func_0808A2FC
func_0808A2FC: @ 0x0808A2FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq .L0808A314
	adds r0, r4, #0
	bl _call_via_r1
.L0808A314:
	ldr r0, [r4, #0x2c]
	bl func_0808A200
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A2FC

	THUMB_FUNC_START func_0808A320
func_0808A320: @ 0x0808A320
	push {lr}
	adds r2, r0, #0
	ldr r0, .L0808A33C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0808A338
	adds r0, r2, #0
	bl Proc_Break
.L0808A338:
	pop {r0}
	bx r0
	.align 2, 0
.L0808A33C: .4byte gKeySt

	THUMB_FUNC_END func_0808A320

	THUMB_FUNC_START func_0808A340
func_0808A340: @ 0x0808A340
	push {r4, lr}
	adds r4, r0, #0
	bl func_0808A2D0
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A340

	THUMB_FUNC_START func_0808A354
func_0808A354: @ 0x0808A354
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808A368  @ gUnknown_08A01698
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808A368: .4byte gUnknown_08A01698

	THUMB_FUNC_END func_0808A354

	THUMB_FUNC_START func_0808A36C
func_0808A36C: @ 0x0808A36C
	push {lr}
	ldr r0, .L0808A380  @ gUnknown_08A01698
	bl FindProc
	cmp r0, #0
	beq .L0808A37A
	movs r0, #1
.L0808A37A:
	pop {r1}
	bx r1
	.align 2, 0
.L0808A380: .4byte gUnknown_08A01698

	THUMB_FUNC_END func_0808A36C

	THUMB_FUNC_START func_0808A384
func_0808A384: @ 0x0808A384
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0x1f
	movs r0, #0xe0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl func_0808A454
	cmp r0, #1
	beq .L0808A3A6
	cmp r0, #2
	beq .L0808A3AC
	b .L0808A3B4
.L0808A3A6:
	movs r4, #0xa0
	adds r5, #0x20
	b .L0808A3B4
.L0808A3AC:
	cmp r4, #0x5f
	bgt .L0808A3B2
	movs r4, #0x60
.L0808A3B2:
	adds r5, #0x10
.L0808A3B4:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A384

	THUMB_FUNC_START func_0808A3C4
func_0808A3C4: @ 0x0808A3C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r7, r0, #0
	adds r7, #0x10
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge .L0808A3FE
	movs r0, #0
	strh r0, [r5, #0x3c]
.L0808A3FE:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble .L0808A40E
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
.L0808A40E:
	mov r0, r8
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r1, #0x3e
	ldrsh r0, [r5, r1]
	adds r0, r0, r7
	cmp r0, #0xa0
	ble .L0808A424
	mov r1, r8
	subs r0, r1, r7
	strh r0, [r5, #0x3e]
.L0808A424:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A3C4

	THUMB_FUNC_START func_0808A43C
func_0808A43C: @ 0x0808A43C
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	bx lr

	THUMB_FUNC_END func_0808A43C

	THUMB_FUNC_START func_0808A444
func_0808A444: @ 0x0808A444
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_0808A444

	THUMB_FUNC_START func_0808A454
func_0808A454: @ 0x0808A454
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808A464  @ 0x0000FFFE
	cmp r4, r0
	bne .L0808A468
	movs r0, #3
	b .L0808A49E
	.align 2, 0
.L0808A464: .4byte 0x0000FFFE
.L0808A468:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L0808A498
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808A48A
	movs r0, #1
	b .L0808A49E
.L0808A48A:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne .L0808A49C
.L0808A498:
	movs r0, #0
	b .L0808A49E
.L0808A49C:
	movs r0, #2
.L0808A49E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808A454

	THUMB_FUNC_START func_0808A4A4
func_0808A4A4: @ 0x0808A4A4
	push {lr}
	adds r2, r0, #0
	ldr r0, .L0808A4C0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0808A4BC
	adds r0, r2, #0
	bl Proc_Break
.L0808A4BC:
	pop {r0}
	bx r0
	.align 2, 0
.L0808A4C0: .4byte gKeySt

	THUMB_FUNC_END func_0808A4A4

	THUMB_FUNC_START func_0808A4C4
func_0808A4C4: @ 0x0808A4C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadHelpBoxGfx
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl func_0808A1E0
	ldr r0, .L0808A4F8  @ gUnknown_08A016C8
	adds r1, r6, #0
	bl SpawnProcLocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0808A4F8: .4byte gUnknown_08A016C8

	THUMB_FUNC_END func_0808A4C4

	THUMB_FUNC_START func_0808A4FC
func_0808A4FC: @ 0x0808A4FC
	push {lr}
	ldr r0, .L0808A50C  @ gUnknown_08A016E0
	bl FindProc
	cmp r0, #0
	bne .L0808A510
	movs r0, #0
	b .L0808A512
	.align 2, 0
.L0808A50C: .4byte gUnknown_08A016E0
.L0808A510:
	movs r0, #1
.L0808A512:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808A4FC

	THUMB_FUNC_START SetDialogueBoxConfig
SetDialogueBoxConfig: @ 0x0808A518
	ldr r1, .L0808A520  @ gUnknown_0203E7E8
	adds r1, #0x42
	strh r0, [r1]
	bx lr
	.align 2, 0
.L0808A520: .4byte gUnknown_0203E7E8

	THUMB_FUNC_END SetDialogueBoxConfig

	THUMB_FUNC_START GetDialogueBoxConfig
GetDialogueBoxConfig: @ 0x0808A524
	ldr r0, .L0808A52C  @ gUnknown_0203E7E8
	adds r0, #0x42
	ldrh r0, [r0]
	bx lr
	.align 2, 0
.L0808A52C: .4byte gUnknown_0203E7E8

	THUMB_FUNC_END GetDialogueBoxConfig

	THUMB_FUNC_START func_0808A530
func_0808A530: @ 0x0808A530
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r3, .L0808A590  @ gUnknown_0203E7E8
	adds r0, r3, #0
	adds r0, #0x40
	ldrh r2, [r0]
	ldr r0, .L0808A594  @ 0x000003FF
	ands r0, r2
	ldrh r3, [r3, #0x18]
	adds r0, r0, r3
	lsls r0, r0, #5
	ldr r2, .L0808A598  @ 0x06010000
	adds r5, r0, r2
	movs r7, #0
	lsls r0, r1, #1
	cmp r7, r0
	bge .L0808A5C2
	adds r3, r0, #0
.L0808A55C:
	adds r4, r5, #0
	movs r2, #0
	adds r0, r7, #1
	mov r8, r0
	cmp r2, r9
	bge .L0808A5B6
.L0808A568:
	adds r6, r2, #1
	movs r1, #6
.L0808A56C:
	ldr r0, [r4, #4]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bge .L0808A56C
	subs r0, r3, #1
	cmp r7, r0
	bne .L0808A5A4
	str r3, [sp]
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	ldr r3, [sp]
	cmp r1, #0
	bne .L0808A5A0
	ldr r0, .L0808A59C  @ 0x44444444
	b .L0808A5AE
	.align 2, 0
.L0808A590: .4byte gUnknown_0203E7E8
.L0808A594: .4byte 0x000003FF
.L0808A598: .4byte 0x06010000
.L0808A59C: .4byte 0x44444444
.L0808A5A0:
	movs r0, #0
	b .L0808A5AE
.L0808A5A4:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r0, [r0]
.L0808A5AE:
	stm r4!, {r0}
	adds r2, r6, #0
	cmp r2, r9
	blt .L0808A568
.L0808A5B6:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r5, r2
	mov r7, r8
	cmp r7, r3
	blt .L0808A55C
.L0808A5C2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A530

	THUMB_FUNC_START func_0808A5D0
func_0808A5D0: @ 0x0808A5D0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne .L0808A5DC
	ldr r5, .L0808A634  @ 0x06013000
.L0808A5DC:
	cmp r6, #0
	bge .L0808A5E2
	movs r6, #5
.L0808A5E2:
	movs r0, #0xf
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808A64C
	ldr r0, .L0808A638  @ gUnknown_08A029A8
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808A63C  @ gUnknown_08A02A1C
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808A640  @ gUnknown_08A02A94
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808A644  @ gUnknown_08A02B3C
	movs r2, #0xf8
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808A648  @ gUnknown_08A02BAC
	movs r2, #0x9c
	lsls r2, r2, #5
	adds r1, r5, r2
	bl Decompress
	b .L0808A688
	.align 2, 0
.L0808A634: .4byte 0x06013000
.L0808A638: .4byte gUnknown_08A029A8
.L0808A63C: .4byte gUnknown_08A02A1C
.L0808A640: .4byte gUnknown_08A02A94
.L0808A644: .4byte gUnknown_08A02B3C
.L0808A648: .4byte gUnknown_08A02BAC
.L0808A64C:
	ldr r0, .L0808A6FC  @ gUnknown_08A0285C
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808A700  @ gUnknown_08A02884
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808A704  @ gUnknown_08A028AC
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808A708  @ gUnknown_08A02914
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, .L0808A70C  @ gUnknown_08A02980
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl Decompress
.L0808A688:
	bl ClearTalkFlags
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L0808A728
	ldr r4, .L0808A710  @ gUnknown_0203E7E8
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSpriteTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x28
	bl InitSpriteText
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808A6E4
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne .L0808A6E4
	adds r0, r4, #0
	adds r0, #0x30
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x38
	bl InitSpriteText
.L0808A6E4:
	movs r0, #0
	bl SetTextFont
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808A718
	ldr r0, .L0808A714  @ gUnknown_0859EF80
	b .L0808A71A
	.align 2, 0
.L0808A6FC: .4byte gUnknown_08A0285C
.L0808A700: .4byte gUnknown_08A02884
.L0808A704: .4byte gUnknown_08A028AC
.L0808A708: .4byte gUnknown_08A02914
.L0808A70C: .4byte gUnknown_08A02980
.L0808A710: .4byte gUnknown_0203E7E8
.L0808A714: .4byte gUnknown_0859EF80
.L0808A718:
	ldr r0, .L0808A724  @ gUnknown_0859EF60
.L0808A71A:
	lsls r1, r6, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	b .L0808A764
	.align 2, 0
.L0808A724: .4byte gUnknown_0859EF60
.L0808A728:
	ldr r0, .L0808A738  @ gUnknown_0203E7E8
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSpriteTextFont
	movs r4, #0
	lsls r7, r6, #5
	b .L0808A748
	.align 2, 0
.L0808A738: .4byte gUnknown_0203E7E8
.L0808A73C:
	lsls r0, r4, #3
	ldr r1, .L0808A79C  @ gUnknown_0203E800
	adds r0, r0, r1
	bl InitSpriteText
	adds r4, #1
.L0808A748:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt .L0808A73C
	movs r0, #0
	bl SetTextFont
	ldr r0, .L0808A7A0  @ Pal_SystemText
	adds r1, r7, #0
	movs r2, #0x20
	bl ApplyPaletteExt
.L0808A764:
	ldr r2, .L0808A7A4  @ gUnknown_0203E7E8
	lsls r1, r5, #0x11
	lsrs r1, r1, #0x16
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r2, #0x40
	strh r1, [r2]
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808A794
	ldr r0, .L0808A7A8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808A794
	ldr r0, .L0808A7AC  @ 0x000002E6
	bl m4aSongNumStart
.L0808A794:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808A79C: .4byte gUnknown_0203E800
.L0808A7A0: .4byte Pal_SystemText
.L0808A7A4: .4byte gUnknown_0203E7E8
.L0808A7A8: .4byte gPlaySt
.L0808A7AC: .4byte 0x000002E6

	THUMB_FUNC_END func_0808A5D0

	THUMB_FUNC_START func_0808A7B0
func_0808A7B0: @ 0x0808A7B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x10
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xbf
	ble .L0808A7D6
	movs r0, #0xc0
	strh r0, [r1]
.L0808A7D6:
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r7, r0, #0
	adds r7, #0x10
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L0808A828
	strh r5, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r4, #0x3e]
	bl GetDialogueBoxConfig
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne .L0808A820
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	cmp r0, #0xf0
	ble .L0808A80E
	movs r0, #0xf0
	subs r0, r0, r7
	strh r0, [r4, #0x3c]
.L0808A80E:
	movs r2, #0x3e
	ldrsh r0, [r4, r2]
	add r0, r8
	cmp r0, #0xa0
	ble .L0808A820
	movs r0, #0x98
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #0x3e]
.L0808A820:
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	b .L0808A82C
.L0808A828:
	strh r5, [r4, #0x3c]
	strh r6, [r4, #0x3e]
.L0808A82C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A7B0

	THUMB_FUNC_START func_0808A838
func_0808A838: @ 0x0808A838
	movs r3, #0xf8
	ands r3, r1
	adds r1, r0, #0
	adds r1, #0x44
	strh r3, [r1]
	adds r0, #0x46
	strh r2, [r0]
	bx lr

	THUMB_FUNC_END func_0808A838

	THUMB_FUNC_START func_0808A848
func_0808A848: @ 0x0808A848
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0xff
	bne .L0808A862
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl func_0808A5D0
	b .L0808A86A
.L0808A862:
	ldr r0, [r4, #0x3c]
	ldrb r1, [r1]
	bl func_0808A5D0
.L0808A86A:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	bl func_0808AC0C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A848

	THUMB_FUNC_START func_0808A87C
func_0808A87C: @ 0x0808A87C
	push {r4, lr}
	adds r4, r0, #0
	bl GetDialogueBoxConfig
	movs r1, #0x82
	ands r1, r0
	cmp r1, #0
	bne .L0808A8A2
	ldr r0, .L0808A8A8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq .L0808A8A2
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
.L0808A8A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808A8A8: .4byte gKeySt

	THUMB_FUNC_END func_0808A87C

	THUMB_FUNC_START func_0808A8AC
func_0808A8AC: @ 0x0808A8AC
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808A8CC
	ldr r0, .L0808A8DC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808A8CC
	ldr r0, .L0808A8E0  @ 0x000002E7
	bl m4aSongNumStart
.L0808A8CC:
	movs r0, #0
	bl SetTextFontGlyphs
	bl func_0808A9F0
	pop {r0}
	bx r0
	.align 2, 0
.L0808A8DC: .4byte gPlaySt
.L0808A8E0: .4byte 0x000002E7

	THUMB_FUNC_END func_0808A8AC

	THUMB_FUNC_START func_0808A8E4
func_0808A8E4: @ 0x0808A8E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	mov r8, r0
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	mov r9, r2
	adds r0, r7, #0
	adds r0, #0x40
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, #4
	movs r6, #0
	ldrsh r2, [r0, r6]
	adds r4, r7, #0
	adds r4, #0x48
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r6, #0x4a
	adds r6, r6, r7
	mov sl, r6
	movs r3, #0
	ldrsh r0, [r6, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r0, #0x42
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r6, #0
	ldrsh r3, [r4, r6]
	mov r4, sl
	movs r6, #0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, #0
	bl Interpolate
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r7, #0x30]
	mov r1, r9
	strh r1, [r7, #0x32]
	mov r0, r8
	mov r1, r9
	ldr r2, [sp, #4]
	bl func_0808ACFC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A8E4

	THUMB_FUNC_START func_0808A974
func_0808A974: @ 0x0808A974
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl func_0808A8E4
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge .L0808A996
	adds r0, r3, #1
	strh r0, [r2]
.L0808A996:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A974

	THUMB_FUNC_START func_0808A99C
func_0808A99C: @ 0x0808A99C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ResetHelpBoxInitSize
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808A99C

	THUMB_FUNC_START func_0808A9C0
func_0808A9C0: @ 0x0808A9C0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl func_0808A8E4
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L0808A9E6
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, .L0808A9EC  @ gUnknown_08A01818
	bl EndEachProc
.L0808A9E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808A9EC: .4byte gUnknown_08A01818

	THUMB_FUNC_END func_0808A9C0

	THUMB_FUNC_START func_0808A9F0
func_0808A9F0: @ 0x0808A9F0
	push {lr}
	bl func_0808BAA4
	ldr r0, .L0808AA00  @ gUnknown_08A01740
	bl BreakEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0808AA00: .4byte gUnknown_08A01740

	THUMB_FUNC_END func_0808A9F0

	THUMB_FUNC_START func_0808AA04
func_0808AA04: @ 0x0808AA04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r4, .L0808AA30  @ gUnknown_08A016E0
	adds r0, r4, #0
	bl EndEachProc
	movs r0, #0
	bl SetDialogueBoxConfig
	cmp r5, #0
	bne .L0808AA34
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
	b .L0808AA3C
	.align 2, 0
.L0808AA30: .4byte gUnknown_08A016E0
.L0808AA34:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProcLocking
.L0808AA3C:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L0808AA68  @ gUnknown_08A01818
	movs r1, #0
	bl SpawnProc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808AA68: .4byte gUnknown_08A01818

	THUMB_FUNC_END func_0808AA04

	THUMB_FUNC_START func_0808AA6C
func_0808AA6C: @ 0x0808AA6C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r5, [sp, #0x20]
	ldr r4, .L0808AA9C  @ gUnknown_08A016E0
	adds r0, r4, #0
	bl EndEachProc
	movs r0, #0
	bl SetDialogueBoxConfig
	cmp r5, #0
	bne .L0808AAA0
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
	b .L0808AAA8
	.align 2, 0
.L0808AA9C: .4byte gUnknown_08A016E0
.L0808AAA0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProcLocking
.L0808AAA8:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	ldr r0, [sp, #0x1c]
	strb r0, [r1]
	mov r0, r9
	str r0, [r2, #0x3c]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L0808AAD8  @ gUnknown_08A01818
	movs r1, #0
	bl SpawnProc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808AAD8: .4byte gUnknown_08A01818

	THUMB_FUNC_END func_0808AA6C

	THUMB_FUNC_START func_0808AADC
func_0808AADC: @ 0x0808AADC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r7, #0
	movs r6, #0x10
	str r7, [r4]
	str r7, [r5]
.L0808AAEE:
	ldrb r0, [r3]
	cmp r0, #7
	bgt .L0808AB10
	cmp r0, #4
	bge .L0808AB38
	cmp r0, #1
	beq .L0808AB2C
	cmp r0, #1
	bgt .L0808AB06
	cmp r0, #0
	beq .L0808AB6E
	b .L0808AB80
.L0808AB06:
	cmp r0, #2
	beq .L0808AB3C
	cmp r0, #3
	beq .L0808AB52
	b .L0808AB80
.L0808AB10:
	cmp r0, #0x19
	ble .L0808AB1A
	cmp r0, #0x80
	beq .L0808AB28
	b .L0808AB80
.L0808AB1A:
	cmp r0, #0x18
	bge .L0808AB36
	cmp r0, #0x14
	bgt .L0808AB80
	cmp r0, #0x12
	blt .L0808AB80
	b .L0808AB6E
.L0808AB28:
	adds r3, #2
	b .L0808AAEE
.L0808AB2C:
	adds r6, #0x10
	ldr r0, [r4]
	cmp r0, r7
	bge .L0808AB36
	str r7, [r4]
.L0808AB36:
	movs r7, #0
.L0808AB38:
	adds r3, #1
	b .L0808AAEE
.L0808AB3C:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge .L0808AB46
	str r6, [r5]
.L0808AB46:
	movs r6, #0
	ldr r0, [r4]
	cmp r0, r7
	bge .L0808AB6A
	str r7, [r4]
	b .L0808AB6A
.L0808AB52:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge .L0808AB5C
	str r6, [r5]
.L0808AB5C:
	movs r6, #0
	adds r1, r7, #0
	adds r1, #8
	ldr r0, [r4]
	cmp r0, r1
	bge .L0808AB6A
	str r1, [r4]
.L0808AB6A:
	movs r7, #0
	b .L0808AAEE
.L0808AB6E:
	ldr r0, [r4]
	cmp r0, r7
	bge .L0808AB76
	str r7, [r4]
.L0808AB76:
	ldr r0, [r5]
	cmp r0, r6
	bge .L0808AB90
	str r6, [r5]
	b .L0808AB90
.L0808AB80:
	adds r0, r3, #0
	mov r1, sp
	bl GetCharTextLen
	adds r3, r0, #0
	ldr r0, [sp]
	adds r7, r7, r0
	b .L0808AAEE
.L0808AB90:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808AADC

	THUMB_FUNC_START func_0808AB98
func_0808AB98: @ 0x0808AB98
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	movs r5, #0
	adds r4, r0, #0
	strb r5, [r6]
	movs r0, #1
	bl SetTextFontGlyphs
.L0808ABAA:
	ldrb r0, [r4]
	cmp r0, #7
	bgt .L0808ABCC
	cmp r0, #4
	bge .L0808ABE2
	cmp r0, #1
	beq .L0808ABE6
	cmp r0, #1
	bgt .L0808ABC2
	cmp r0, #0
	beq .L0808AC00
	b .L0808ABF0
.L0808ABC2:
	cmp r0, #2
	beq .L0808ABE2
	cmp r0, #3
	beq .L0808AC00
	b .L0808ABF0
.L0808ABCC:
	cmp r0, #0x19
	ble .L0808ABD6
	cmp r0, #0x80
	beq .L0808ABEC
	b .L0808ABF0
.L0808ABD6:
	cmp r0, #0x18
	bge .L0808ABE6
	cmp r0, #0x14
	bgt .L0808ABF0
	cmp r0, #0x12
	blt .L0808ABF0
.L0808ABE2:
	adds r4, #1
	b .L0808ABAA
.L0808ABE6:
	adds r4, #1
	movs r5, #0
	b .L0808ABAA
.L0808ABEC:
	adds r4, #2
	b .L0808ABAA
.L0808ABF0:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b .L0808ABAA
.L0808AC00:
	adds r0, r5, #2
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808AB98

	THUMB_FUNC_START func_0808AC0C
func_0808AC0C: @ 0x0808AC0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	ldr r4, .L0808AC5C  @ gUnknown_08A01740
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	strh r5, [r0]
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808AC60
	adds r0, r4, #0
	adds r0, #0x4a
	strh r5, [r0]
	b .L0808AC68
	.align 2, 0
.L0808AC5C: .4byte gUnknown_08A01740
.L0808AC60:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0xc
	strh r0, [r1]
.L0808AC68:
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
	adds r5, r4, #0
	adds r5, #0x4c
	mov r0, r8
	strh r0, [r5]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r5]
	bl GetMsg
	bl StrExpandNames
	add r2, sp, #4
	mov r1, sp
	bl func_0808AADC
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl func_0808A838
	bl GetDialogueBoxConfig
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808ACD6
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xd8
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r6, r6, r0
	adds r0, r4, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r7, r7, r0
.L0808ACD6:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl func_0808A7B0
	bl func_0808BAA4
	ldrh r0, [r5]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl func_0808BA60
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808AC0C

	THUMB_FUNC_START func_0808ACFC
func_0808ACFC: @ 0x0808ACFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r4, r2, #0
	mov r8, r3
	mov r0, r8
	asrs r0, r0, #5
	str r0, [sp, #0x14]
	cmp r4, #0x1f
	bgt .L0808AD1C
	movs r4, #0x20
.L0808AD1C:
	cmp r4, #0xc0
	ble .L0808AD22
	movs r4, #0xc0
.L0808AD22:
	mov r1, r8
	cmp r1, #0xf
	bgt .L0808AD2C
	movs r2, #0x10
	mov r8, r2
.L0808AD2C:
	mov r3, r8
	cmp r3, #0x50
	ble .L0808AD36
	movs r0, #0x50
	mov r8, r0
.L0808AD36:
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808AD44
	b .L0808B020
.L0808AD44:
	mov r0, r8
	adds r0, #0xf
	cmp r0, #0
	bge .L0808AD4E
	adds r0, #0xf
.L0808AD4E:
	asrs r0, r0, #4
	str r0, [sp, #0x10]
	adds r0, r4, #7
	cmp r0, #0
	bge .L0808AD5A
	adds r0, #7
.L0808AD5A:
	asrs r0, r0, #3
	adds r1, r0, #1
	str r1, [sp, #0xc]
	movs r7, #0
	subs r0, #3
	ldr r2, [sp, #8]
	subs r2, #8
	str r2, [sp, #0x24]
	ldr r3, [sp, #8]
	add r3, r8
	str r3, [sp, #0x1c]
	ldr r1, [sp, #4]
	subs r1, #8
	str r1, [sp, #0x20]
	cmp r7, r0
	bge .L0808ADBE
	mov sl, r0
.L0808AD7C:
	lsls r6, r7, #3
	ldr r5, [sp, #0x10]
	adds r4, r7, #4
	cmp r5, #0
	blt .L0808ADB8
	ldr r2, .L0808AE04  @ gUnknown_0203E828
	mov r9, r2
.L0808AD8A:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble .L0808AD94
	mov r0, r8
.L0808AD94:
	subs r0, #0x10
	ldr r3, [sp, #8]
	adds r2, r3, r0
	mov r1, r9
	ldrh r0, [r1]
	adds r0, r0, r7
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, .L0808AE08  @ Sprite_32x16
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge .L0808AD8A
.L0808ADB8:
	adds r7, r4, #0
	cmp r7, sl
	blt .L0808AD7C
.L0808ADBE:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bge .L0808AE40
	subs r0, #2
	mov sl, r0
.L0808ADC8:
	lsls r6, r7, #3
	ldr r5, [sp, #0x10]
	cmp r5, #0
	blt .L0808AE32
	ldr r1, .L0808AE04  @ gUnknown_0203E828
	mov r9, r1
	lsls r4, r5, #6
.L0808ADD6:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble .L0808ADE0
	mov r0, r8
.L0808ADE0:
	subs r0, #0x10
	cmp r7, sl
	bge .L0808AE10
	ldr r3, [sp, #8]
	adds r2, r3, r0
	mov r1, r9
	ldrh r0, [r1]
	adds r0, r0, r7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, .L0808AE0C  @ Sprite_16x16
	bl PutSprite
	b .L0808AE2A
	.align 2, 0
.L0808AE04: .4byte gUnknown_0203E828
.L0808AE08: .4byte Sprite_32x16
.L0808AE0C: .4byte Sprite_16x16
.L0808AE10:
	ldr r1, [sp, #8]
	adds r2, r1, r0
	mov r3, r9
	ldrh r0, [r3]
	adds r0, r0, r7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, .L0808AEAC  @ Sprite_8x16
	bl PutSprite
.L0808AE2A:
	subs r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge .L0808ADD6
.L0808AE32:
	cmp r7, sl
	bge .L0808AE38
	adds r7, #1
.L0808AE38:
	adds r7, #1
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt .L0808ADC8
.L0808AE40:
	movs r7, #0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	bge .L0808AEEC
	ldr r2, .L0808AEB0  @ gUnknown_0203E7E8
	str r2, [sp, #0x18]
.L0808AE4C:
	lsls r6, r7, #3
	ldr r0, [sp, #0xc]
	subs r0, #2
	cmp r7, r0
	bge .L0808AEB8
	ldr r3, [sp, #4]
	adds r3, r3, r6
	mov r9, r3
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	mov sl, r0
	ldrh r5, [r0]
	adds r6, r5, #0
	adds r6, #0x1b
	adds r4, r7, #6
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	cmp r0, #0
	bne .L0808AE78
	adds r6, #2
.L0808AE78:
	str r6, [sp]
	movs r0, #2
	mov r1, r9
	ldr r2, [sp, #0x24]
	ldr r3, .L0808AEB4  @ Sprite_16x8
	bl PutSprite
	mov r2, sl
	ldrh r1, [r2]
	adds r2, r1, #0
	adds r2, #0x3b
	movs r0, #7
	ands r4, r0
	cmp r4, #0
	bne .L0808AE98
	adds r2, #2
.L0808AE98:
	str r2, [sp]
	movs r0, #2
	mov r1, r9
	ldr r2, [sp, #0x1c]
	ldr r3, .L0808AEB4  @ Sprite_16x8
	bl PutSprite
	adds r7, #1
	b .L0808AEE4
	.align 2, 0
.L0808AEAC: .4byte Sprite_8x16
.L0808AEB0: .4byte gUnknown_0203E7E8
.L0808AEB4: .4byte Sprite_16x8
.L0808AEB8:
	ldr r3, [sp, #4]
	adds r4, r3, r6
	ldr r1, .L0808AF60  @ gUnknown_0203E828
	ldrh r0, [r1]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x24]
	ldr r3, .L0808AF64  @ Sprite_8x8
	bl PutSprite
	ldr r2, .L0808AF60  @ gUnknown_0203E828
	ldrh r0, [r2]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	ldr r3, .L0808AF64  @ Sprite_8x8
	bl PutSprite
.L0808AEE4:
	adds r7, #1
	ldr r3, [sp, #0xc]
	cmp r7, r3
	blt .L0808AE4C
.L0808AEEC:
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808AF70
	ldr r5, [sp, #0x10]
	lsls r7, r7, #3
	mov r9, r7
	cmp r5, #0
	blt .L0808AFBA
.L0808AF02:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble .L0808AF0C
	mov r0, r8
.L0808AF0C:
	subs r0, #0x10
	ldr r1, [sp, #8]
	adds r4, r1, r0
	ldr r6, .L0808AF68  @ Sprite_8x16
	ldr r0, .L0808AF6C  @ gUnknown_0203E7E8
	adds r7, r0, #0
	adds r7, #0x40
	ldrh r2, [r7]
	movs r0, #1
	ands r0, r5
	adds r1, r2, #0
	adds r1, #0x5f
	cmp r0, #0
	beq .L0808AF2A
	adds r1, #0x20
.L0808AF2A:
	str r1, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	ldr r1, [sp, #4]
	add r1, r9
	ldrh r0, [r7]
	adds r2, r0, #0
	adds r2, #0x1f
	ldr r3, [sp, #0x14]
	cmp r5, r3
	bne .L0808AF4A
	adds r2, #0x5f
.L0808AF4A:
	str r2, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge .L0808AF02
	b .L0808AFBA
	.align 2, 0
.L0808AF60: .4byte gUnknown_0203E828
.L0808AF64: .4byte Sprite_8x8
.L0808AF68: .4byte Sprite_8x16
.L0808AF6C: .4byte gUnknown_0203E7E8
.L0808AF70:
	ldr r5, [sp, #0x10]
	lsls r7, r7, #3
	mov r9, r7
	cmp r5, #0
	blt .L0808AFBA
	ldr r6, .L0808B010  @ Sprite_8x16
	ldr r7, .L0808B014  @ gUnknown_0203E828
.L0808AF7E:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble .L0808AF88
	mov r0, r8
.L0808AF88:
	subs r0, #0x10
	ldr r1, [sp, #8]
	adds r4, r1, r0
	ldrh r0, [r7]
	adds r0, #0x5f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	add r1, r9
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge .L0808AF7E
.L0808AFBA:
	ldr r5, .L0808B018  @ Sprite_8x8
	ldr r4, .L0808B01C  @ gUnknown_0203E7E8
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, #0x5b
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl PutSprite
	ldr r6, [sp, #4]
	add r6, r9
	ldrh r0, [r4]
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl PutSprite
	ldrh r0, [r4]
	adds r0, #0x5d
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl PutSprite
	ldrh r0, [r4]
	adds r0, #0x5e
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl PutSprite
	b .L0808B082
	.align 2, 0
.L0808B010: .4byte Sprite_8x16
.L0808B014: .4byte gUnknown_0203E828
.L0808B018: .4byte Sprite_8x8
.L0808B01C: .4byte gUnknown_0203E7E8
.L0808B020:
	adds r0, r4, #0
	adds r0, #0x1f
	cmp r0, #0
	bge .L0808B02A
	adds r0, #0x1f
.L0808B02A:
	asrs r0, r0, #5
	str r0, [sp, #0xc]
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	subs r0, #1
	str r0, [sp, #0x10]
	ldr r7, [sp, #0xc]
	subs r7, #1
	cmp r7, #0
	blt .L0808B082
.L0808B042:
	ldr r5, [sp, #0x10]
	subs r2, r7, #1
	mov r8, r2
	cmp r5, #0
	blt .L0808B07C
	lsls r6, r7, #5
	ldr r3, .L0808B094  @ gUnknown_0203E828
	mov r9, r3
	lsls r0, r5, #4
	ldr r1, [sp, #8]
	adds r4, r0, r1
.L0808B058:
	lsls r0, r7, #2
	mov r2, r9
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	adds r2, r4, #0
	ldr r3, .L0808B098  @ Sprite_32x16
	bl PutSprite
	subs r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge .L0808B058
.L0808B07C:
	mov r7, r8
	cmp r7, #0
	bge .L0808B042
.L0808B082:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B094: .4byte gUnknown_0203E828
.L0808B098: .4byte Sprite_32x16

	THUMB_FUNC_END func_0808ACFC

	THUMB_FUNC_START func_0808B09C
func_0808B09C: @ 0x0808B09C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808B0D0  @ gUnknown_08A01740
	bl FindProc
	adds r2, r4, #0
	adds r2, #0x59
	movs r1, #0
	strb r1, [r2]
	ldrh r1, [r0, #0x30]
	subs r1, #8
	subs r2, #9
	strb r1, [r2]
	ldrh r0, [r0, #0x32]
	subs r0, #8
	adds r1, r4, #0
	adds r1, #0x51
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	adds r1, #1
	bl func_0808AB98
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B0D0: .4byte gUnknown_08A01740

	THUMB_FUNC_END func_0808B09C

	THUMB_FUNC_START func_0808B0D4
func_0808B0D4: @ 0x0808B0D4
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq .L0808B0F4
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
.L0808B0F4:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808B0D4

	THUMB_FUNC_START func_0808B0F8
func_0808B0F8: @ 0x0808B0F8
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq .L0808B116
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r1, r0
	movs r0, #0
	bl SetFaceDispById
.L0808B116:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808B0F8

	THUMB_FUNC_START func_0808B11C
func_0808B11C: @ 0x0808B11C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0808B174  @ gUnknown_0203E800
	adds r0, r4, #0
	bl DrawSpriteTextBackground
	adds r0, r4, #0
	adds r0, #8
	bl DrawSpriteTextBackground
	adds r0, r4, #0
	adds r0, #0x10
	bl DrawSpriteTextBackground
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808B160
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne .L0808B160
	adds r0, r4, #0
	adds r0, #0x18
	bl DrawSpriteTextBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl DrawSpriteTextBackground
.L0808B160:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	subs r0, #0x10
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B174: .4byte gUnknown_0203E800

	THUMB_FUNC_END func_0808B11C

	THUMB_FUNC_START BoxDialogueInterpreter_Main
BoxDialogueInterpreter_Main: @ 0x0808B178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, .L0808B1AC  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq .L0808B200
	bl GetDialogueBoxConfig
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne .L0808B200
	movs r3, #0x80
	mov r8, r3
	b .L0808B21A
	.align 2, 0
.L0808B1AC: .4byte gKeySt
.L0808B1B0:
	bl func_0808B0D4
	ldr r0, .L0808B1D0  @ gUnknown_08A016E0
	bl FindProc
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L0808B1D4  @ gUnknown_08A01818
	bl EndEachProc
	b .L0808B4C0
	.align 2, 0
.L0808B1D0: .4byte gUnknown_08A016E0
.L0808B1D4: .4byte gUnknown_08A01818
.L0808B1D8:
	adds r0, r1, #1
	str r0, [r6, #0x2c]
	b .L0808B772
.L0808B1DE:
	adds r1, r6, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b .L0808B772
.L0808B1F0:
	adds r0, r6, #0
	bl Proc_Break
	b .L0808B772
.L0808B1F8:
	adds r0, r6, #0
	bl func_0808B11C
	b .L0808B772
.L0808B200:
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble .L0808B212
	b .L0808B778
.L0808B212:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	strh r0, [r1]
.L0808B21A:
	bl func_0808B0F8
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r7, #0
	cmp r7, r8
	blt .L0808B22C
	b .L0808B772
.L0808B22C:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls .L0808B238
	b .L0808B6A8
.L0808B238:
	lsls r0, r1, #2
	ldr r1, .L0808B244  @ .L0808B248
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808B244: .4byte .L0808B248
.L0808B248: @ jump table
	.4byte .L0808B56C @ case 0
	.4byte .L0808B572 @ case 1
	.4byte .L0808B5EA @ case 2
	.4byte .L0808B664 @ case 3
	.4byte .L0808B59A @ case 4
	.4byte .L0808B5AE @ case 5
	.4byte .L0808B5C2 @ case 6
	.4byte .L0808B5D6 @ case 7
	.4byte .L0808B6A8 @ case 8
	.4byte .L0808B6A8 @ case 9
	.4byte .L0808B6A8 @ case 10
	.4byte .L0808B6A8 @ case 11
	.4byte .L0808B6A8 @ case 12
	.4byte .L0808B6A8 @ case 13
	.4byte .L0808B6A8 @ case 14
	.4byte .L0808B6A8 @ case 15
	.4byte .L0808B6A8 @ case 16
	.4byte .L0808B6A8 @ case 17
	.4byte .L0808B4FE @ case 18
	.4byte .L0808B4FE @ case 19
	.4byte .L0808B4FE @ case 20
	.4byte .L0808B6A8 @ case 21
	.4byte .L0808B6A8 @ case 22
	.4byte .L0808B6A8 @ case 23
	.4byte .L0808B44C @ case 24
	.4byte .L0808B488 @ case 25
	.4byte .L0808B6A8 @ case 26
	.4byte .L0808B6A8 @ case 27
	.4byte .L0808B6A8 @ case 28
	.4byte .L0808B6A8 @ case 29
	.4byte .L0808B6A8 @ case 30
	.4byte .L0808B6A8 @ case 31
	.4byte .L0808B6A8 @ case 32
	.4byte .L0808B6A8 @ case 33
	.4byte .L0808B6A8 @ case 34
	.4byte .L0808B6A8 @ case 35
	.4byte .L0808B6A8 @ case 36
	.4byte .L0808B6A8 @ case 37
	.4byte .L0808B6A8 @ case 38
	.4byte .L0808B6A8 @ case 39
	.4byte .L0808B6A8 @ case 40
	.4byte .L0808B6A8 @ case 41
	.4byte .L0808B6A8 @ case 42
	.4byte .L0808B6A8 @ case 43
	.4byte .L0808B6A8 @ case 44
	.4byte .L0808B6A8 @ case 45
	.4byte .L0808B6A8 @ case 46
	.4byte .L0808B6A8 @ case 47
	.4byte .L0808B6A8 @ case 48
	.4byte .L0808B6A8 @ case 49
	.4byte .L0808B6A8 @ case 50
	.4byte .L0808B6A8 @ case 51
	.4byte .L0808B6A8 @ case 52
	.4byte .L0808B6A8 @ case 53
	.4byte .L0808B6A8 @ case 54
	.4byte .L0808B6A8 @ case 55
	.4byte .L0808B6A8 @ case 56
	.4byte .L0808B6A8 @ case 57
	.4byte .L0808B6A8 @ case 58
	.4byte .L0808B6A8 @ case 59
	.4byte .L0808B6A8 @ case 60
	.4byte .L0808B6A8 @ case 61
	.4byte .L0808B6A8 @ case 62
	.4byte .L0808B6A8 @ case 63
	.4byte .L0808B6A8 @ case 64
	.4byte .L0808B6A8 @ case 65
	.4byte .L0808B6A8 @ case 66
	.4byte .L0808B6A8 @ case 67
	.4byte .L0808B6A8 @ case 68
	.4byte .L0808B6A8 @ case 69
	.4byte .L0808B6A8 @ case 70
	.4byte .L0808B6A8 @ case 71
	.4byte .L0808B6A8 @ case 72
	.4byte .L0808B6A8 @ case 73
	.4byte .L0808B6A8 @ case 74
	.4byte .L0808B6A8 @ case 75
	.4byte .L0808B6A8 @ case 76
	.4byte .L0808B6A8 @ case 77
	.4byte .L0808B6A8 @ case 78
	.4byte .L0808B6A8 @ case 79
	.4byte .L0808B6A8 @ case 80
	.4byte .L0808B6A8 @ case 81
	.4byte .L0808B6A8 @ case 82
	.4byte .L0808B6A8 @ case 83
	.4byte .L0808B6A8 @ case 84
	.4byte .L0808B6A8 @ case 85
	.4byte .L0808B6A8 @ case 86
	.4byte .L0808B6A8 @ case 87
	.4byte .L0808B6A8 @ case 88
	.4byte .L0808B6A8 @ case 89
	.4byte .L0808B6A8 @ case 90
	.4byte .L0808B6A8 @ case 91
	.4byte .L0808B6A8 @ case 92
	.4byte .L0808B6A8 @ case 93
	.4byte .L0808B6A8 @ case 94
	.4byte .L0808B6A8 @ case 95
	.4byte .L0808B6A8 @ case 96
	.4byte .L0808B6A8 @ case 97
	.4byte .L0808B6A8 @ case 98
	.4byte .L0808B6A8 @ case 99
	.4byte .L0808B6A8 @ case 100
	.4byte .L0808B6A8 @ case 101
	.4byte .L0808B6A8 @ case 102
	.4byte .L0808B6A8 @ case 103
	.4byte .L0808B6A8 @ case 104
	.4byte .L0808B6A8 @ case 105
	.4byte .L0808B6A8 @ case 106
	.4byte .L0808B6A8 @ case 107
	.4byte .L0808B6A8 @ case 108
	.4byte .L0808B6A8 @ case 109
	.4byte .L0808B6A8 @ case 110
	.4byte .L0808B6A8 @ case 111
	.4byte .L0808B6A8 @ case 112
	.4byte .L0808B6A8 @ case 113
	.4byte .L0808B6A8 @ case 114
	.4byte .L0808B6A8 @ case 115
	.4byte .L0808B6A8 @ case 116
	.4byte .L0808B6A8 @ case 117
	.4byte .L0808B6A8 @ case 118
	.4byte .L0808B6A8 @ case 119
	.4byte .L0808B6A8 @ case 120
	.4byte .L0808B6A8 @ case 121
	.4byte .L0808B6A8 @ case 122
	.4byte .L0808B6A8 @ case 123
	.4byte .L0808B6A8 @ case 124
	.4byte .L0808B6A8 @ case 125
	.4byte .L0808B6A8 @ case 126
	.4byte .L0808B6A8 @ case 127
	.4byte .L0808B4D0 @ case 128
.L0808B44C:
	bl func_0808B0D4
	ldr r0, .L0808B480  @ gUnknown_08A01740
	bl FindProc
	adds r3, r0, #0
	ldr r0, .L0808B484  @ gUnknown_08A016D8
	adds r1, r6, #0
	adds r1, #0x48
	movs r5, #0
	ldrsh r4, [r1, r5]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #1
	b .L0808B4B8
	.align 2, 0
.L0808B480: .4byte gUnknown_08A01740
.L0808B484: .4byte gUnknown_08A016D8
.L0808B488:
	bl func_0808B0D4
	ldr r0, .L0808B4C8  @ gUnknown_08A01740
	bl FindProc
	adds r3, r0, #0
	ldr r0, .L0808B4CC  @ gUnknown_08A016D8
	adds r1, r6, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r4, [r1, r2]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #2
.L0808B4B8:
	str r4, [sp, #4]
	str r6, [sp, #8]
	bl func_080900EC
.L0808B4C0:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b .L0808B772
	.align 2, 0
.L0808B4C8: .4byte gUnknown_08A01740
.L0808B4CC: .4byte gUnknown_08A016D8
.L0808B4D0:
	adds r1, r2, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #0x21
	bne .L0808B4F2
	adds r2, r6, #0
	adds r2, #0x59
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	subs r7, #1
	b .L0808B76A
.L0808B4F2:
	cmp r0, #4
	bne .L0808B4F8
	b .L0808B1B0
.L0808B4F8:
	cmp r0, #0x25
	bne .L0808B4FE
	b .L0808B1D8
.L0808B4FE:
	ldr r0, .L0808B568  @ gUnknown_08A01740
	bl FindProc
	adds r4, r0, #0
	bl func_0808B0D4
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne .L0808B51A
	adds r0, r1, #1
	str r0, [r6, #0x2c]
.L0808B51A:
	cmp r4, #0
	bne .L0808B520
	b .L0808B772
.L0808B520:
	adds r0, r6, #0
	bl func_0808B11C
	ldr r0, [r6, #0x2c]
	add r2, sp, #0x10
	add r1, sp, #0xc
	bl func_0808AADC
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	adds r1, #0x56
	movs r2, #0
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	strb r2, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	b .L0808B772
	.align 2, 0
.L0808B568: .4byte gUnknown_08A01740
.L0808B56C:
	bl func_0808B0D4
	b .L0808B606
.L0808B572:
	bl func_0808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	cmp r1, r0
	bne .L0808B592
	b .L0808B1DE
.L0808B592:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b .L0808B76A
.L0808B59A:
	bl func_0808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #8
	strh r0, [r1]
	b .L0808B772
.L0808B5AE:
	bl func_0808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x10
	strh r0, [r1]
	b .L0808B772
.L0808B5C2:
	bl func_0808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x20
	strh r0, [r1]
	b .L0808B772
.L0808B5D6:
	bl func_0808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x40
	strh r0, [r1]
	b .L0808B772
.L0808B5EA:
	bl func_0808B0D4
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne .L0808B5FE
	adds r0, r1, #1
	str r0, [r6, #0x2c]
.L0808B5FE:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808B638
.L0808B606:
	bl GetDialogueBoxConfig
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne .L0808B614
	b .L0808B1F0
.L0808B614:
	ldr r0, .L0808B630  @ gUnknown_08A016E0
	bl FindProc
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L0808B634  @ gUnknown_08A01818
	bl EndEachProc
	b .L0808B772
	.align 2, 0
.L0808B630: .4byte gUnknown_08A016E0
.L0808B634: .4byte gUnknown_08A01818
.L0808B638:
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq .L0808B64A
	b .L0808B1F8
.L0808B64A:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808B654
	b .L0808B772
.L0808B654:
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b .L0808B772
.L0808B664:
	bl func_0808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, .L0808B6A4  @ gUnknown_08A01740
	bl FindProc
	adds r4, r6, #0
	adds r4, #0x52
	movs r5, #0x3c
	ldrsh r1, [r0, r5]
	ldrb r2, [r4]
	adds r1, r1, r2
	movs r3, #0x3e
	ldrsh r2, [r0, r3]
	adds r0, r6, #0
	adds r0, #0x48
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	adds r0, r6, #0
	bl NewTextBluArrowAndButtonChecker
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl func_0808AB98
	b .L0808B772
	.align 2, 0
.L0808B6A4: .4byte gUnknown_08A01740
.L0808B6A8:
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808B6CE
	adds r5, r6, #0
	adds r5, #0x48
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #1
	bl Text_SetColor
	b .L0808B70A
.L0808B6CE:
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808B6F2
	adds r5, r6, #0
	adds r5, #0x48
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xa
	bl Text_SetColor
	b .L0808B70A
.L0808B6F2:
	adds r5, r6, #0
	adds r5, #0x48
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #6
	bl Text_SetColor
.L0808B70A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne .L0808B730
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq .L0808B76A
.L0808B730:
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808B758
	ldr r0, .L0808B750  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B76A
	ldr r0, .L0808B754  @ 0x000002E5
	bl m4aSongNumStart
	b .L0808B76A
	.align 2, 0
.L0808B750: .4byte gPlaySt
.L0808B754: .4byte 0x000002E5
.L0808B758:
	ldr r0, .L0808B784  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808B76A
	movs r0, #0x6e
	bl m4aSongNumStart
.L0808B76A:
	adds r7, #1
	cmp r7, r8
	bge .L0808B772
	b .L0808B22C
.L0808B772:
	movs r0, #0
	bl SetTextFont
.L0808B778:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B784: .4byte gPlaySt

	THUMB_FUNC_END BoxDialogueInterpreter_Main

	THUMB_FUNC_START func_0808B788
func_0808B788: @ 0x0808B788
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808B7B0  @ gUnknown_08A01818
	bl FindProc
	cmp r0, #0
	beq .L0808B7AA
	ldr r0, .L0808B7B4  @ gUnknown_08A016E0
	bl FindProc
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
.L0808B7AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B7B0: .4byte gUnknown_08A01818
.L0808B7B4: .4byte gUnknown_08A016E0

	THUMB_FUNC_END func_0808B788

	THUMB_FUNC_START func_0808B7B8
func_0808B7B8: @ 0x0808B7B8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r1, [r1]
	bl func_0808A530
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne .L0808B7F8
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	ldr r1, .L0808B800  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	bl Proc_Break
.L0808B7F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B800: .4byte gUnknown_0203E800

	THUMB_FUNC_END func_0808B7B8

	THUMB_FUNC_START func_0808B804
func_0808B804: @ 0x0808B804
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0808B81A
	adds r0, r4, #0
	bl Proc_Break
	b .L0808B822
.L0808B81A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
.L0808B822:
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq .L0808B834
	subs r0, r2, #1
	strh r0, [r1]
.L0808B834:
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808B804

	THUMB_FUNC_START func_0808B844
func_0808B844: @ 0x0808B844
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808B86C  @ gUnknown_08A016E0
	bl FindProc
	movs r1, #3
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B86C: .4byte gUnknown_08A016E0

	THUMB_FUNC_END func_0808B844

	THUMB_FUNC_START func_0808B870
func_0808B870: @ 0x0808B870
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, .L0808B900  @ gUnknown_08A01740
	bl FindProc
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	cmp r6, #0
	beq .L0808B8C8
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r0, [r0]
	ldrb r3, [r5]
	movs r2, #2
	subs r2, r2, r3
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, r2, r0
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r0, r6, #0
	bl func_0808A838
.L0808B8C8:
	ldrb r0, [r5]
	cmp r0, #2
	bne .L0808B8F8
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsrs r0, r0, #4
	adds r1, r0, #0
	cmp r0, #5
	bls .L0808B8EC
	movs r1, #5
.L0808B8EC:
	adds r0, r4, #0
	adds r0, #0x55
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
.L0808B8F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808B900: .4byte gUnknown_08A01740

	THUMB_FUNC_END func_0808B870

	THUMB_FUNC_START func_0808B904
func_0808B904: @ 0x0808B904
	push {lr}
	ldr r0, .L0808B91C  @ gUnknown_08A016E0
	bl FindProc
	cmp r0, #0
	beq .L0808B920
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808B920
	movs r0, #0
	b .L0808B922
	.align 2, 0
.L0808B91C: .4byte gUnknown_08A016E0
.L0808B920:
	movs r0, #1
.L0808B922:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808B904

	THUMB_FUNC_START func_0808B928
func_0808B928: @ 0x0808B928
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0808B998  @ gUnknown_0203E7E8
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #1
	bl SetTextFontGlyphs
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L0808B99C
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #6
	bl Text_SetColor
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808B9BA
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne .L0808B9BA
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #6
	bl Text_SetColor
	b .L0808B9BA
	.align 2, 0
.L0808B998: .4byte gUnknown_0203E7E8
.L0808B99C:
	movs r4, #0
	b .L0808B9AE
.L0808B9A0:
	lsls r0, r4, #3
	ldr r1, .L0808BA38  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetColor
	adds r4, #1
.L0808B9AE:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt .L0808B9A0
.L0808B9BA:
	movs r0, #0
	bl SetTextFont
	ldr r4, .L0808BA3C  @ gUnknown_08A01760
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	ldr r1, .L0808BA40  @ gUnknown_0203E7E8
	str r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r4, #0x34]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x40]
	adds r0, #8
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x5c]
	bl GetMsg
	bl StrExpandNames
	str r0, [r4, #0x2c]
	ldr r1, [r5, #0x2c]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	bl func_0808B904
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq .L0808BA44
	bl GetTextPrintDelay
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x80
	cmp r0, #0
	beq .L0808BA30
	movs r1, #1
.L0808BA30:
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	b .L0808BA52
	.align 2, 0
.L0808BA38: .4byte gUnknown_0203E800
.L0808BA3C: .4byte gUnknown_08A01760
.L0808BA40: .4byte gUnknown_0203E7E8
.L0808BA44:
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0x80
	strh r0, [r1]
.L0808BA52:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808B928

	THUMB_FUNC_START func_0808BA60
func_0808BA60: @ 0x0808BA60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L0808BA94  @ gUnknown_08A01800
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	cmp r5, #0
	bge .L0808BA7A
	adds r5, #7
.L0808BA7A:
	asrs r0, r5, #3
	str r0, [r1, #0x2c]
	adds r0, r6, #0
	cmp r6, #0
	bge .L0808BA86
	adds r0, #0xf
.L0808BA86:
	asrs r0, r0, #4
	cmp r0, #5
	bgt .L0808BA98
	cmp r0, #0
	bge .L0808BA9A
	movs r0, #0
	b .L0808BA9A
	.align 2, 0
.L0808BA94: .4byte gUnknown_08A01800
.L0808BA98:
	movs r0, #5
.L0808BA9A:
	str r0, [r1, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808BA60

	THUMB_FUNC_START func_0808BAA4
func_0808BAA4: @ 0x0808BAA4
	push {r4, lr}
	ldr r4, .L0808BAFC  @ gUnknown_0203E7E8
	adds r0, r4, #0
	bl SetTextFont
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L0808BB00
	adds r0, r4, #0
	adds r0, #0x18
	bl DrawSpriteTextBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl DrawSpriteTextBackground
	adds r0, r4, #0
	adds r0, #0x28
	bl DrawSpriteTextBackground
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L0808BB1E
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne .L0808BB1E
	adds r0, r4, #0
	adds r0, #0x30
	bl DrawSpriteTextBackground
	adds r0, r4, #0
	adds r0, #0x38
	bl DrawSpriteTextBackground
	b .L0808BB1E
	.align 2, 0
.L0808BAFC: .4byte gUnknown_0203E7E8
.L0808BB00:
	movs r4, #0
	b .L0808BB12
.L0808BB04:
	lsls r0, r4, #3
	ldr r1, .L0808BB38  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	adds r4, #1
.L0808BB12:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt .L0808BB04
.L0808BB1E:
	ldr r0, .L0808BB3C  @ gUnknown_08A01760
	bl EndEachProc
	ldr r0, .L0808BB40  @ gUnknown_08A01800
	bl EndEachProc
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BB38: .4byte gUnknown_0203E800
.L0808BB3C: .4byte gUnknown_08A01760
.L0808BB40: .4byte gUnknown_08A01800

	THUMB_FUNC_END func_0808BAA4

	THUMB_FUNC_START func_0808BB44
func_0808BB44: @ 0x0808BB44
	push {lr}
	ldr r0, .L0808BB54  @ gUnknown_08A01818
	movs r1, #0
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0808BB54: .4byte gUnknown_08A01818

	THUMB_FUNC_END func_0808BB44

	THUMB_FUNC_START func_0808BB58
func_0808BB58: @ 0x0808BB58
	push {lr}
	ldr r0, .L0808BB68  @ gUnknown_08A01818
	bl FindProc
	cmp r0, #0
	bne .L0808BB6C
	movs r0, #0
	b .L0808BB6E
	.align 2, 0
.L0808BB68: .4byte gUnknown_08A01818
.L0808BB6C:
	movs r0, #1
.L0808BB6E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808BB58

	THUMB_FUNC_START func_0808BB74
func_0808BB74: @ 0x0808BB74
	push {lr}
	ldr r0, .L0808BB98  @ gUnknown_08A016E0
	bl EndEachProc
	ldr r0, .L0808BB9C  @ gUnknown_08A01818
	bl EndEachProc
	ldr r0, .L0808BBA0  @ gUnknown_08A01740
	bl EndEachProc
	ldr r0, .L0808BBA4  @ gUnknown_08A01760
	bl EndEachProc
	ldr r0, .L0808BBA8  @ gUnknown_08A01800
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0808BB98: .4byte gUnknown_08A016E0
.L0808BB9C: .4byte gUnknown_08A01818
.L0808BBA0: .4byte gUnknown_08A01740
.L0808BBA4: .4byte gUnknown_08A01760
.L0808BBA8: .4byte gUnknown_08A01800

	THUMB_FUNC_END func_0808BB74

	THUMB_FUNC_START func_0808BBAC
func_0808BBAC: @ 0x0808BBAC
	push {lr}
	cmp r0, #0
	bge .L0808BBBE
	cmp r1, #0
	bge .L0808BBBA
	movs r0, #0
	b .L0808BBC8
.L0808BBBA:
	movs r0, #1
	b .L0808BBC8
.L0808BBBE:
	cmp r1, #0
	blt .L0808BBC6
	movs r0, #3
	b .L0808BBC8
.L0808BBC6:
	movs r0, #2
.L0808BBC8:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808BBAC

	THUMB_FUNC_START GetCameraMovementSpeedMaybe
GetCameraMovementSpeedMaybe: @ 0x0808BBCC
	push {r4, lr}
	ldr r2, .L0808BBF8  @ gBmSt
	movs r0, #0x14
	ldrsh r3, [r2, r0]
	lsls r3, r3, #4
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r0, #8
	subs r3, r3, r0
	movs r4, #0x16
	ldrsh r1, [r2, r4]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r0, #8
	subs r1, r1, r0
	cmp r3, #0x78
	bgt .L0808BBFC
	cmp r1, #0x50
	bgt .L0808BC04
	movs r0, #0
	b .L0808BC0A
	.align 2, 0
.L0808BBF8: .4byte gBmSt
.L0808BBFC:
	cmp r1, #0x50
	bgt .L0808BC08
	movs r0, #1
	b .L0808BC0A
.L0808BC04:
	movs r0, #2
	b .L0808BC0A
.L0808BC08:
	movs r0, #3
.L0808BC0A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetCameraMovementSpeedMaybe

	THUMB_FUNC_START func_0808BC10
func_0808BC10: @ 0x0808BC10
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble .L0808BC20
	movs r0, #5
.L0808BC20:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	strh r0, [r3]
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808BC10

	THUMB_FUNC_START func_0808BC2C
func_0808BC2C: @ 0x0808BC2C
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x13
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #0
	adds r5, r2, #0
	adds r5, #0xe
	adds r2, #6
	adds r0, r2, r0
.L0808BC46:
	cmp r1, r4
	bge .L0808BC4E
	strh r5, [r3]
	b .L0808BC58
.L0808BC4E:
	cmp r1, r4
	bne .L0808BC56
	strh r0, [r3]
	b .L0808BC58
.L0808BC56:
	strh r2, [r3]
.L0808BC58:
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble .L0808BC46
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808BC2C

	THUMB_FUNC_START func_0808BC68
func_0808BC68: @ 0x0808BC68
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble .L0808BC78
	movs r3, #5
.L0808BC78:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge .L0808BC80
	movs r3, #0
.L0808BC80:
	adds r1, r2, #0
	adds r1, #0xf
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808BC68

	THUMB_FUNC_START func_0808BC94
func_0808BC94: @ 0x0808BC94
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x32
	adds r4, r0, #0
	muls r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl func_0808BC10
	adds r0, r5, #2
	subs r1, r4, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	bl func_0808BC2C
	adds r5, #0xc
	subs r4, #0x2d
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl func_0808BC68
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808BC94

	THUMB_FUNC_START Loop6CUI1_DisplayTransition
Loop6CUI1_DisplayTransition: @ 0x0808BCF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, .L0808BD44  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r4, #0
	cmp r0, #0
	blt .L0808BD1A
	movs r4, #0xe
.L0808BD1A:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge .L0808BD50
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, .L0808BD48  @ gBg0Tm
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808BD4C  @ gBg1Tm
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b .L0808BD70
	.align 2, 0
.L0808BD44: .4byte gUnknown_08A01828
.L0808BD48: .4byte gBg0Tm
.L0808BD4C: .4byte gBg1Tm
.L0808BD50:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, .L0808BDC8  @ gBg0Tm+0x22
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808BDCC  @ gBg1Tm+0x22
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
.L0808BD70:
	mov r8, r5
	adds r6, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, .L0808BDD0  @ gUnknown_08A0189C
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, .L0808BDD4  @ gUnknown_08A01828
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808BDE8
	movs r4, #0xd
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, .L0808BDD8  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, .L0808BDDC  @ gBg0Tm
	adds r1, r6, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, .L0808BDE0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, .L0808BDE4  @ gBg1Tm
	adds r1, r6, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b .L0808BE0E
	.align 2, 0
.L0808BDC8: .4byte gBg0Tm+0x22
.L0808BDCC: .4byte gBg1Tm+0x22
.L0808BDD0: .4byte gUnknown_08A0189C
.L0808BDD4: .4byte gUnknown_08A01828
.L0808BDD8: .4byte gBmFrameTmap0
.L0808BDDC: .4byte gBg0Tm
.L0808BDE0: .4byte gUnknown_0200422C
.L0808BDE4: .4byte gBg1Tm
.L0808BDE8:
	ldr r0, .L0808BE58  @ gBmFrameTmap0
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, .L0808BE5C  @ gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, .L0808BE60  @ gUnknown_0200422C
	ldr r1, .L0808BE64  @ gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
.L0808BE0E:
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	cmp r0, #4
	bne .L0808BE4C
	adds r1, r7, #0
	adds r1, #0x55
	movs r0, #0
	strb r0, [r1]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	bl Proc_Break
	ldr r2, .L0808BE68  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, .L0808BE6C  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r7, #0
	bl DrawMinimugBoxMaybe
.L0808BE4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BE58: .4byte gBmFrameTmap0
.L0808BE5C: .4byte gBg0Tm
.L0808BE60: .4byte gUnknown_0200422C
.L0808BE64: .4byte gBg1Tm
.L0808BE68: .4byte gBmSt
.L0808BE6C: .4byte gMapUnit

	THUMB_FUNC_END Loop6CUI1_DisplayTransition

	THUMB_FUNC_START Loop6CUI1_HideTransition
Loop6CUI1_HideTransition: @ 0x0808BE70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, .L0808BED0  @ gUnknown_08A01828
	adds r2, r6, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	blt .L0808BE94
	movs r4, #0xe
.L0808BE94:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808BEDC
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, .L0808BED4  @ gBg0Tm
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808BED8  @ gBg1Tm
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b .L0808BEFC
	.align 2, 0
.L0808BED0: .4byte gUnknown_08A01828
.L0808BED4: .4byte gBg0Tm
.L0808BED8: .4byte gBg1Tm
.L0808BEDC:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, .L0808BF54  @ gBg0Tm+0x22
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808BF58  @ gBg1Tm+0x22
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
.L0808BEFC:
	mov r8, r5
	adds r7, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, .L0808BF5C  @ gUnknown_08A018A0
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, .L0808BF60  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808BF74
	movs r4, #0xd
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, .L0808BF64  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, .L0808BF68  @ gBg0Tm
	adds r1, r7, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, .L0808BF6C  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, .L0808BF70  @ gBg1Tm
	adds r1, r7, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b .L0808BF9A
	.align 2, 0
.L0808BF54: .4byte gBg0Tm+0x22
.L0808BF58: .4byte gBg1Tm+0x22
.L0808BF5C: .4byte gUnknown_08A018A0
.L0808BF60: .4byte gUnknown_08A01828
.L0808BF64: .4byte gBmFrameTmap0
.L0808BF68: .4byte gBg0Tm
.L0808BF6C: .4byte gUnknown_0200422C
.L0808BF70: .4byte gBg1Tm
.L0808BF74:
	ldr r0, .L0808BFC4  @ gBmFrameTmap0
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, .L0808BFC8  @ gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, .L0808BFCC  @ gUnknown_0200422C
	ldr r1, .L0808BFD0  @ gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
.L0808BF9A:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne .L0808BFBA
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	str r0, [r6, #0x58]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L0808BFBA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808BFC4: .4byte gBmFrameTmap0
.L0808BFC8: .4byte gBg0Tm
.L0808BFCC: .4byte gUnknown_0200422C
.L0808BFD0: .4byte gBg1Tm

	THUMB_FUNC_END Loop6CUI1_HideTransition

	THUMB_FUNC_START func_0808BFD4
func_0808BFD4: @ 0x0808BFD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, .L0808C00C  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808C018
	ldr r0, .L0808C010  @ gBg0Tm+0x340
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808C014  @ gBg1Tm+0x340
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b .L0808C030
	.align 2, 0
.L0808C00C: .4byte gUnknown_08A01828
.L0808C010: .4byte gBg0Tm+0x340
.L0808C014: .4byte gBg1Tm+0x340
.L0808C018:
	ldr r0, .L0808C084  @ gBg0Tm+0x36E
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808C088  @ gBg1Tm+0x36E
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
.L0808C030:
	movs r0, #3
	bl EnableBgSync
	ldr r1, .L0808C08C  @ gUnknown_08A018A3
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r0, #1
	ldr r1, .L0808C090  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808C0A8
	ldr r4, .L0808C094  @ 0x00000147
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, .L0808C098  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, .L0808C09C  @ gBg0Tm+0x340
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, .L0808C0A0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, .L0808C0A4  @ gBg1Tm+0x340
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b .L0808C0CE
	.align 2, 0
.L0808C084: .4byte gBg0Tm+0x36E
.L0808C088: .4byte gBg1Tm+0x36E
.L0808C08C: .4byte gUnknown_08A018A3
.L0808C090: .4byte gUnknown_08A01828
.L0808C094: .4byte 0x00000147
.L0808C098: .4byte gBmFrameTmap0
.L0808C09C: .4byte gBg0Tm+0x340
.L0808C0A0: .4byte gUnknown_0200422C
.L0808C0A4: .4byte gBg1Tm+0x340
.L0808C0A8:
	ldr r0, .L0808C0F0  @ gUnknown_02003FAC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, .L0808C0F4  @ gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, .L0808C0F8  @ gUnknown_020044AC
	ldr r1, .L0808C0FC  @ gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
.L0808C0CE:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne .L0808C0E8
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L0808C0E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C0F0: .4byte gUnknown_02003FAC
.L0808C0F4: .4byte gBg0Tm
.L0808C0F8: .4byte gUnknown_020044AC
.L0808C0FC: .4byte gBg1Tm

	THUMB_FUNC_END func_0808BFD4

	THUMB_FUNC_START func_0808C100
func_0808C100: @ 0x0808C100
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldr r1, .L0808C140  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808C14C
	ldr r0, .L0808C144  @ gBg0Tm+0x340
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808C148  @ gBg1Tm+0x340
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b .L0808C164
	.align 2, 0
.L0808C140: .4byte gUnknown_08A01828
.L0808C144: .4byte gBg0Tm+0x340
.L0808C148: .4byte gBg1Tm+0x340
.L0808C14C:
	ldr r0, .L0808C1B8  @ gBg0Tm+0x36E
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808C1BC  @ gBg1Tm+0x36E
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
.L0808C164:
	movs r0, #3
	bl EnableBgSync
	ldr r1, .L0808C1C0  @ gUnknown_08A018A6
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, .L0808C1C4  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808C1D8
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, .L0808C1C8  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, .L0808C1CC  @ gBg0Tm+0x340
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, .L0808C1D0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, .L0808C1D4  @ gBg1Tm+0x340
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b .L0808C1FE
	.align 2, 0
.L0808C1B8: .4byte gBg0Tm+0x36E
.L0808C1BC: .4byte gBg1Tm+0x36E
.L0808C1C0: .4byte gUnknown_08A018A6
.L0808C1C4: .4byte gUnknown_08A01828
.L0808C1C8: .4byte gBmFrameTmap0
.L0808C1CC: .4byte gBg0Tm+0x340
.L0808C1D0: .4byte gUnknown_0200422C
.L0808C1D4: .4byte gBg1Tm+0x340
.L0808C1D8:
	ldr r0, .L0808C224  @ gUnknown_02003FAC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, .L0808C228  @ gBg0Tm
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, .L0808C22C  @ gUnknown_020044AC
	ldr r1, .L0808C230  @ gBg1Tm
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
.L0808C1FE:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne .L0808C21C
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L0808C21C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C224: .4byte gUnknown_02003FAC
.L0808C228: .4byte gBg0Tm
.L0808C22C: .4byte gUnknown_020044AC
.L0808C230: .4byte gBg1Tm

	THUMB_FUNC_END func_0808C100

	THUMB_FUNC_START func_0808C234
func_0808C234: @ 0x0808C234
	push {lr}
	ldr r1, .L0808C27C  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #2
	ldrsb r0, [r1, r0]
	movs r2, #0x12
	cmp r0, #0
	bge .L0808C250
	movs r2, #0
.L0808C250:
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r1, #0xe
	cmp r0, #0
	bge .L0808C25C
	movs r1, #0
.L0808C25C:
	ldr r0, .L0808C280  @ gBmFrameTmap0
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, .L0808C284  @ gBg0Tm
	adds r1, r1, r2
	movs r2, #0xd
	movs r3, #6
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L0808C27C: .4byte gUnknown_08A01828
.L0808C280: .4byte gBmFrameTmap0
.L0808C284: .4byte gBg0Tm

	THUMB_FUNC_END func_0808C234

	THUMB_FUNC_START func_0808C288
func_0808C288: @ 0x0808C288
	push {lr}
	ldr r1, .L0808C2C0  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x17
	cmp r0, #0
	bge .L0808C2A6
	movs r1, #0
.L0808C2A6:
	ldr r0, .L0808C2C4  @ gUnknown_02003FAC
	lsls r1, r1, #1
	ldr r2, .L0808C2C8  @ gBg0Tm+0x340
	adds r1, r1, r2
	movs r2, #7
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L0808C2C0: .4byte gUnknown_08A01828
.L0808C2C4: .4byte gUnknown_02003FAC
.L0808C2C8: .4byte gBg0Tm+0x340

	THUMB_FUNC_END func_0808C288

	THUMB_FUNC_START func_0808C2CC
func_0808C2CC: @ 0x0808C2CC
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	cmp r0, #0x40
	beq .L0808C2F8
	cmp r0, #0x40
	bgt .L0808C2E0
	cmp r0, #0
	beq .L0808C2E6
	b .L0808C300
.L0808C2E0:
	cmp r0, #0x80
	beq .L0808C2F0
	b .L0808C300
.L0808C2E6:
	ldr r4, .L0808C2EC  @ gUnknown_08A1738C
	b .L0808C304
	.align 2, 0
.L0808C2EC: .4byte gUnknown_08A1738C
.L0808C2F0:
	ldr r4, .L0808C2F4  @ gUnknown_08A173AC
	b .L0808C304
	.align 2, 0
.L0808C2F4: .4byte gUnknown_08A173AC
.L0808C2F8:
	ldr r4, .L0808C2FC  @ gUnknown_08A173CC
	b .L0808C304
	.align 2, 0
.L0808C2FC: .4byte gUnknown_08A173CC
.L0808C300:
	bl nullsub_8
.L0808C304:
	lsls r1, r5, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808C2CC

	THUMB_FUNC_START func_0808C314
func_0808C314: @ 0x0808C314
	push {lr}
	ldr r0, .L0808C330  @ gBmSt
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x6f
	ble .L0808C334
	movs r0, #1
	negs r0, r0
	b .L0808C336
	.align 2, 0
.L0808C330: .4byte gBmSt
.L0808C334:
	movs r0, #1
.L0808C336:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808C314

	THUMB_FUNC_START func_0808C33C
func_0808C33C: @ 0x0808C33C
	push {lr}
	ldr r0, .L0808C354  @ gBmSt
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x70
	bgt .L0808C358
	movs r0, #1
	b .L0808C35C
	.align 2, 0
.L0808C354: .4byte gBmSt
.L0808C358:
	movs r0, #1
	negs r0, r0
.L0808C35C:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808C33C

	THUMB_FUNC_START func_0808C360
func_0808C360: @ 0x0808C360
	ldr r2, .L0808C380  @ 0x00002120
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, .L0808C384  @ 0x00002121
	adds r0, r3, #0
	strh r0, [r1, #2]
	movs r2, #0
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	adds r3, #0x1d
	adds r0, r3, #0
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	strh r2, [r1, #0xc]
	bx lr
	.align 2, 0
.L0808C380: .4byte 0x00002120
.L0808C384: .4byte 0x00002121

	THUMB_FUNC_END func_0808C360

	THUMB_FUNC_START MMB_DrawStatusText
MMB_DrawStatusText: @ 0x0808C388
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, .L0808C3AC  @ 0x0000016F
	cmp r1, #0
	beq .L0808C448
	adds r1, #0x30
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r6, r1, #0
	cmp r0, #0xd
	bhi .L0808C41C
	lsls r0, r0, #2
	ldr r1, .L0808C3B0  @ .L0808C3B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808C3AC: .4byte 0x0000016F
.L0808C3B0: .4byte .L0808C3B4
.L0808C3B4: @ jump table
	.4byte .L0808C448 @ case 0
	.4byte .L0808C3EC @ case 1
	.4byte .L0808C3F0 @ case 2
	.4byte .L0808C3F4 @ case 3
	.4byte .L0808C3FA @ case 4
	.4byte .L0808C400 @ case 5
	.4byte .L0808C406 @ case 6
	.4byte .L0808C40C @ case 7
	.4byte .L0808C412 @ case 8
	.4byte .L0808C448 @ case 9
	.4byte .L0808C448 @ case 10
	.4byte .L0808C418 @ case 11
	.4byte .L0808C41C @ case 12
	.4byte .L0808C418 @ case 13
.L0808C3EC:
	movs r2, #0
	b .L0808C41C
.L0808C3F0:
	movs r2, #0xa0
	b .L0808C41C
.L0808C3F4:
	movs r2, #0xa0
	lsls r2, r2, #1
	b .L0808C41C
.L0808C3FA:
	movs r2, #0xf0
	lsls r2, r2, #1
	b .L0808C41C
.L0808C400:
	movs r2, #0xa0
	lsls r2, r2, #2
	b .L0808C41C
.L0808C406:
	movs r2, #0xc8
	lsls r2, r2, #2
	b .L0808C41C
.L0808C40C:
	movs r2, #0xf0
	lsls r2, r2, #2
	b .L0808C41C
.L0808C412:
	movs r2, #0x8c
	lsls r2, r2, #3
	b .L0808C41C
.L0808C418:
	movs r2, #0xa0
	lsls r2, r2, #3
.L0808C41C:
	ldr r0, .L0808C450  @ gUnknown_08A16DEC
	adds r0, r2, r0
	ldr r1, .L0808C454  @ 0x06002DE0
	movs r2, #0x28
	bl CpuFastSet
	strh r4, [r5]
	adds r4, #1
	strh r4, [r5, #2]
	adds r4, #1
	strh r4, [r5, #4]
	adds r4, #1
	strh r4, [r5, #6]
	adds r4, #1
	strh r4, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	ldrb r0, [r6]
	lsrs r0, r0, #4
	ldr r1, .L0808C458  @ 0x00001128
	adds r0, r0, r1
	strh r0, [r5, #0xc]
.L0808C448:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C450: .4byte gUnknown_08A16DEC
.L0808C454: .4byte 0x06002DE0
.L0808C458: .4byte 0x00001128

	THUMB_FUNC_END MMB_DrawStatusText

	THUMB_FUNC_START DrawMinimugBoxMaybe
DrawMinimugBoxMaybe: @ 0x0808C45C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne .L0808C47A
	movs r2, #0
.L0808C47A:
	lsls r1, r2, #0x10
	asrs r2, r1, #0x10
	movs r0, #0x3f
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	bne .L0808C518
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq .L0808C4A0
	ldr r0, [r4, #0x40]
	adds r1, r5, #0
	bl MMB_DrawStatusText
	movs r0, #1
	bl EnableBgSync
	b .L0808C518
.L0808C4A0:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble .L0808C4B2
	movs r0, #0xff
	bl GenNumberOrBlankStr
	b .L0808C4BC
.L0808C4B2:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	bl GenNumberOrBlankStr
.L0808C4BC:
	ldr r1, .L0808C4E4  @ gNumberStr
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r4, #0
	adds r2, #0x51
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble .L0808C4E8
	movs r0, #0xff
	bl GenNumberOrBlankStr
	b .L0808C4F2
	.align 2, 0
.L0808C4E4: .4byte gNumberStr
.L0808C4E8:
	adds r0, r5, #0
	bl GetUnitMaxHp
	bl GenNumberOrBlankStr
.L0808C4F2:
	ldr r1, .L0808C5C4  @ gNumberStr
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r4, #0
	adds r2, #0x53
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	ldr r1, [r4, #0x40]
	adds r0, r4, #0
	adds r2, r5, #0
	bl func_0808C360
	movs r0, #1
	bl EnableBgSync
.L0808C518:
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0808C5BA
	asrs r0, r6, #0x10
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0808C53E
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L0808C5BA
.L0808C53E:
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #3
	adds r7, r5, #0
	adds r7, #0x11
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #3
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r0, [r1]
	cmp r0, #0xf0
	beq .L0808C570
	ldr r2, .L0808C5C8  @ Sprite_8x8
	adds r3, r0, #0
	ldr r0, .L0808C5CC  @ 0x000082E0
	adds r3, r3, r0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutOamHiRam
.L0808C570:
	adds r0, r5, #0
	adds r0, #0x18
	ldr r7, .L0808C5C8  @ Sprite_8x8
	adds r1, r4, #0
	adds r1, #0x52
	ldrb r3, [r1]
	ldr r1, .L0808C5CC  @ 0x000082E0
	mov r8, r1
	add r3, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutOamHiRam
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #0xf0
	beq .L0808C5A6
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r1]
	ldr r1, .L0808C5CC  @ 0x000082E0
	adds r3, r3, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutOamHiRam
.L0808C5A6:
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r1, #0x54
	ldrb r3, [r1]
	add r3, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutOamHiRam
.L0808C5BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C5C4: .4byte gNumberStr
.L0808C5C8: .4byte Sprite_8x8
.L0808C5CC: .4byte 0x000082E0

	THUMB_FUNC_END DrawMinimugBoxMaybe

	THUMB_FUNC_START InitMinimugBoxMaybe
InitMinimugBoxMaybe: @ 0x0808C5D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sl, r0
	str r0, [sp, #4]
	ldr r1, .L0808C688  @ gBmFrameTmap0
	mov r9, r1
	ldr r2, .L0808C68C  @ 0x01000060
	add r0, sp, #4
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	bl GetMsg
	adds r6, r0, #0
	movs r0, #0x38
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawString
	mov r1, r9
	adds r1, #0x4a
	adds r0, r4, #0
	bl PutText
	mov r0, r8
	bl GetUnitChibiFid
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0808C646
	adds r2, #1
.L0808C646:
	mov r1, r9
	adds r1, #0x42
	mov r0, sl
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xf0
	movs r3, #4
	bl PutFaceChibi
	mov r0, r9
	adds r0, #0xca
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, sl
	strh r1, [r0]
	ldr r2, .L0808C690  @ gUnknown_08A01828
	adds r1, r7, #0
	adds r1, #0x50
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808C694
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #5
	b .L0808C69A
	.align 2, 0
.L0808C688: .4byte gBmFrameTmap0
.L0808C68C: .4byte 0x01000060
.L0808C690: .4byte gUnknown_08A01828
.L0808C694:
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0x17
.L0808C69A:
	strh r0, [r2]
	ldr r0, .L0808C6B8  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge .L0808C6BC
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #3
	b .L0808C6C2
	.align 2, 0
.L0808C6B8: .4byte gUnknown_08A01828
.L0808C6BC:
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0x11
.L0808C6C2:
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl DrawMinimugBoxMaybe
	ldr r0, .L0808C704  @ gUnknown_02003E36
	movs r2, #0x8a
	lsls r2, r2, #5
	mov r1, r8
	bl func_0808BC94
	ldr r0, .L0808C708  @ gUnknown_0200422C
	ldr r1, .L0808C70C  @ gUnknown_08A17484
	movs r2, #0xc0
	lsls r2, r2, #6
	bl TmApplyTsa_thm
	mov r1, r8
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #3
	bl func_0808C2CC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C704: .4byte gUnknown_02003E36
.L0808C708: .4byte gUnknown_0200422C
.L0808C70C: .4byte gUnknown_08A17484

	THUMB_FUNC_END InitMinimugBoxMaybe

	THUMB_FUNC_START func_0808C710
func_0808C710: @ 0x0808C710
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetCameraMovementSpeedMaybe
	adds r1, r0, #0
	movs r2, #1
	cmp r4, #5
	ble .L0808C734
	cmp r4, #0xb
	bgt .L0808C736
	ldr r0, .L0808C74C  @ gUnknown_08A01828
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge .L0808C736
.L0808C734:
	movs r2, #4
.L0808C736:
	cmp r5, #1
	bgt .L0808C73C
	subs r2, #1
.L0808C73C:
	cmp r5, #0x16
	ble .L0808C742
	adds r2, #1
.L0808C742:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0808C74C: .4byte gUnknown_08A01828

	THUMB_FUNC_END func_0808C710

	THUMB_FUNC_START func_0808C750
func_0808C750: @ 0x0808C750
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, .L0808C8C4  @ gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge .L0808C774
	adds r0, #7
.L0808C774:
	asrs r0, r0, #3
	mov sl, r0
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge .L0808C78C
	adds r0, #7
.L0808C78C:
	asrs r4, r0, #3
	mov r0, sl
	adds r1, r4, #0
	bl func_0808C710
	mov r8, r0
	ldr r0, .L0808C8C8  @ gUnknown_08A01860
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sl, r0
	ldr r0, .L0808C8CC  @ gUnknown_08A01866
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
	strb r0, [r1]
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	bl GetMsg
	mov r9, r0
	movs r0, #0x38
	mov r1, r9
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r5, #0
	mov r1, r9
	bl Text_DrawString
	ldr r0, .L0808C8D0  @ gUnknown_08A0184E
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r0, .L0808C8D4  @ gUnknown_08A01848
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, .L0808C8D8  @ gBg0Tm
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r1, r4, #3
	lsls r0, r1, #5
	adds r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	movs r3, #0
	strh r3, [r0]
	mov r0, sl
	adds r0, #1
	adds r2, r7, #0
	adds r2, #0x46
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp]
	bl DrawMinimugBoxMaybe
	lsls r0, r4, #5
	add r0, sl
	lsls r0, r0, #1
	ldr r5, .L0808C8DC  @ gBg1Tm
	adds r0, r0, r5
	ldr r1, .L0808C8E0  @ gUnknown_08A0186C
	mov r2, r8
	lsls r2, r2, #2
	mov r8, r2
	add r1, r8
	ldr r1, [r1]
	movs r6, #0xc4
	lsls r6, r6, #6
	adds r2, r6, #0
	bl TmApplyTsa_thm
	adds r0, r4, #1
	lsls r0, r0, #5
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, .L0808C8E4  @ gUnknown_08A17604
	adds r2, r6, #0
	bl TmApplyTsa_thm
	adds r4, #4
	lsls r4, r4, #5
	add r4, sl
	lsls r4, r4, #1
	adds r4, r4, r5
	ldr r0, .L0808C8E8  @ gUnknown_08A01884
	add r8, r0
	mov r3, r8
	ldr r1, [r3]
	adds r0, r4, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
	movs r0, #3
	bl EnableBgSync
	ldr r1, [sp]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #3
	bl func_0808C2CC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C8C4: .4byte gBmSt
.L0808C8C8: .4byte gUnknown_08A01860
.L0808C8CC: .4byte gUnknown_08A01866
.L0808C8D0: .4byte gUnknown_08A0184E
.L0808C8D4: .4byte gUnknown_08A01848
.L0808C8D8: .4byte gBg0Tm
.L0808C8DC: .4byte gBg1Tm
.L0808C8E0: .4byte gUnknown_08A0186C
.L0808C8E4: .4byte gUnknown_08A17604
.L0808C8E8: .4byte gUnknown_08A01884

	THUMB_FUNC_END func_0808C750

	THUMB_FUNC_START func_0808C8EC
func_0808C8EC: @ 0x0808C8EC
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x3e]
	movs r0, #0xa1
	lsls r0, r0, #3
	cmp r1, r0
	bne .L0808C956
	adds r7, r2, #0
	adds r7, #0x3d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x3c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L0808C95C  @ gBg0Tm
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x3e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x3f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L0808C960  @ gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0
	strb r0, [r6]
	strb r0, [r4]
.L0808C956:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808C95C: .4byte gBg0Tm
.L0808C960: .4byte gBg1Tm

	THUMB_FUNC_END func_0808C8EC

	THUMB_FUNC_START func_0808C964
func_0808C964: @ 0x0808C964
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, .L0808CA48  @ gBmSt
	mov r9, r0
	movs r1, #0x16
	ldrsh r0, [r0, r1]
	ldr r1, .L0808CA4C  @ gMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, r9
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	ldr r0, .L0808CA50  @ gUnknown_02003FAC
	mov r8, r0
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808CA54  @ gUnknown_020044AC
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl GetTerrainName
	adds r5, r0, #0
	movs r0, #0x28
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	mov r1, r8
	adds r1, #0x82
	adds r0, r4, #0
	bl PutText
	movs r6, #0x81
	lsls r6, r6, #1
	add r6, r8
	ldr r1, .L0808CA58  @ gUnknown_08A1768C
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r6, #0
	bl TmApplyTsa_thm
	ldr r0, .L0808CA5C  @ gUnknown_0880B90C
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L0808CA3A
	ldr r0, .L0808CA60  @ gUnknown_0880C4BA
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GenNumberStr
	movs r0, #0x85
	lsls r0, r0, #1
	add r0, r8
	ldr r4, .L0808CA64  @ gNumberStr+7
	ldr r5, .L0808CA68  @ 0x00002128
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl func_08013138
	ldr r0, .L0808CA6C  @ gUnknown_0880C479
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GenNumberStr
	movs r0, #0xa5
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl func_08013138
.L0808CA3A:
	cmp r7, #0x29
	bgt .L0808CA70
	cmp r7, #0x27
	bge .L0808CAD8
	cmp r7, #0x1b
	beq .L0808CA74
	b .L0808CB06
	.align 2, 0
.L0808CA48: .4byte gBmSt
.L0808CA4C: .4byte gMapTerrain
.L0808CA50: .4byte gUnknown_02003FAC
.L0808CA54: .4byte gUnknown_020044AC
.L0808CA58: .4byte gUnknown_08A1768C
.L0808CA5C: .4byte gUnknown_0880B90C
.L0808CA60: .4byte gUnknown_0880C4BA
.L0808CA64: .4byte gNumberStr+7
.L0808CA68: .4byte 0x00002128
.L0808CA6C: .4byte gUnknown_0880C479
.L0808CA70:
	cmp r7, #0x33
	bne .L0808CB06
.L0808CA74:
	ldr r4, .L0808CAA8  @ gUnknown_020040AE
	ldr r1, .L0808CAAC  @ gUnknown_08A176A4
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r1, .L0808CAB0  @ gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl GetObstacleHpAt
	adds r6, r0, #0
	cmp r6, #0x64
	bne .L0808CAB8
	adds r0, r4, #0
	adds r0, #0x46
	ldr r1, .L0808CAB4  @ gUnknown_08A176B4
	movs r2, #0x80
	lsls r2, r2, #1
	bl TmApplyTsa_thm
	b .L0808CB06
	.align 2, 0
.L0808CAA8: .4byte gUnknown_020040AE
.L0808CAAC: .4byte gUnknown_08A176A4
.L0808CAB0: .4byte gBmSt
.L0808CAB4: .4byte gUnknown_08A176B4
.L0808CAB8:
	adds r0, r6, #0
	bl GenNumberStr
	adds r0, r4, #0
	adds r0, #0x48
	ldr r1, .L0808CAD0  @ gNumberStr+7
	ldr r2, .L0808CAD4  @ 0x00002128
	movs r3, #2
	bl func_08013138
	b .L0808CB06
	.align 2, 0
.L0808CAD0: .4byte gNumberStr+7
.L0808CAD4: .4byte 0x00002128
.L0808CAD8:
	ldr r1, .L0808CB20  @ gUnknown_08A1769C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	bl TmApplyTsa_thm
	mov r1, r9
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl GetObstacleHpAt
	bl GenNumberStr
	movs r0, #0x85
	lsls r0, r0, #1
	add r0, r8
	ldr r1, .L0808CB24  @ gNumberStr+7
	ldr r2, .L0808CB28  @ 0x00002128
	movs r3, #2
	bl func_08013138
.L0808CB06:
	ldr r0, .L0808CB2C  @ gUnknown_020044EC
	ldr r1, .L0808CB30  @ gUnknown_08A1742C
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808CB20: .4byte gUnknown_08A1769C
.L0808CB24: .4byte gNumberStr+7
.L0808CB28: .4byte 0x00002128
.L0808CB2C: .4byte gUnknown_020044EC
.L0808CB30: .4byte gUnknown_08A1742C

	THUMB_FUNC_END func_0808C964

	THUMB_FUNC_START func_0808CB34
func_0808CB34: @ 0x0808CB34
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	str r0, [r2, #0x58]
	subs r1, #6
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #5
	bl InitTextDb
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808CB34

	THUMB_FUNC_START func_0808CB5C
func_0808CB5C: @ 0x0808CB5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, .L0808CBF0  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl func_0808BBAC
	adds r6, r0, #0
	ldr r0, .L0808CBF4  @ gUnknown_08A0190C
	bl FindProc
	adds r4, r0, #0
	cmp r4, #0
	beq .L0808CBAA
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt .L0808CBAA
	cmp r0, r6
	beq .L0808CBE8
.L0808CBAA:
	ldr r0, .L0808CBF8  @ gUnknown_08A019E4
	bl FindProc
	cmp r4, #0
	beq .L0808CBC4
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt .L0808CBC4
	cmp r0, r6
	beq .L0808CBE8
.L0808CBC4:
	adds r0, r5, #0
	adds r0, #0x57
	strb r6, [r0]
	adds r0, r5, #0
	bl func_0808C964
	ldr r0, .L0808CBFC  @ gBmSt
	ldrh r1, [r0, #0x14]
	adds r2, r5, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r5, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L0808CBE8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808CBF0: .4byte gUnknown_08A01828
.L0808CBF4: .4byte gUnknown_08A0190C
.L0808CBF8: .4byte gUnknown_08A019E4
.L0808CBFC: .4byte gBmSt

	THUMB_FUNC_END func_0808CB5C

	THUMB_FUNC_START func_0808CC00
func_0808CC00: @ 0x0808CC00
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, .L0808CC80  @ gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq .L0808CC9A
	ldr r0, .L0808CC84  @ ProcScr_CameraPan
	bl FindProc
	cmp r0, #0
	bne .L0808CC8C
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq .L0808CC70
	ldr r1, .L0808CC88  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L0808CC8C
	movs r1, #1
	ldrsb r1, [r5, r1]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L0808CC8C
.L0808CC70:
	adds r0, r4, #0
	bl func_0808C964
	adds r0, r4, #0
	bl func_0808C288
	b .L0808CC9A
	.align 2, 0
.L0808CC80: .4byte gBmSt
.L0808CC84: .4byte ProcScr_CameraPan
.L0808CC88: .4byte gUnknown_08A01828
.L0808CC8C:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0808CC9A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808CC00

	THUMB_FUNC_START func_0808CCA0
func_0808CCA0: @ 0x0808CCA0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #7
	bl InitTextDb
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808CCA0

	THUMB_FUNC_START Loop6CUI1_Hidden
Loop6CUI1_Hidden: @ 0x0808CCC8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, .L0808CD64  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, .L0808CD68  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq .L0808CD5C
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, .L0808CD6C  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl func_0808BBAC
	adds r5, r0, #0
	ldr r0, .L0808CD70  @ gUnknown_08A018AC
	bl FindProc
	cmp r0, #0
	beq .L0808CD36
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt .L0808CD36
	cmp r0, r5
	beq .L0808CD5C
.L0808CD36:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	ldr r0, .L0808CD64  @ gBmSt
	ldrh r1, [r0, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r4, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitMinimugBoxMaybe
	adds r0, r4, #0
	bl Proc_Break
.L0808CD5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808CD64: .4byte gBmSt
.L0808CD68: .4byte gMapUnit
.L0808CD6C: .4byte gUnknown_08A01828
.L0808CD70: .4byte gUnknown_08A018AC

	THUMB_FUNC_END Loop6CUI1_Hidden

	THUMB_FUNC_START Loop6CUI1_Displayed
Loop6CUI1_Displayed: @ 0x0808CD74
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, .L0808CE2C  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, .L0808CE30  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl DrawMinimugBoxMaybe
	ldrh r1, [r4]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne .L0808CDB8
	adds r0, r5, #0
	bl func_0808C234
.L0808CDB8:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x4d
	strb r0, [r2]
	ldrh r0, [r6, #0x14]
	strb r0, [r3]
	ldrh r0, [r6, #0x16]
	strb r0, [r4]
	ldrh r0, [r3]
	ldrh r1, [r1]
	cmp r0, r1
	beq .L0808CE4A
	cmp r7, #0
	beq .L0808CE3C
	ldr r0, .L0808CE34  @ ProcScr_CameraPan
	bl FindProc
	cmp r0, #0
	bne .L0808CE3C
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq .L0808CE22
	ldr r1, .L0808CE38  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r4, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #2
	ldrsb r1, [r4, r1]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L0808CE3C
	movs r1, #3
	ldrsb r1, [r4, r1]
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L0808CE3C
.L0808CE22:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L0808CE4A
	.align 2, 0
.L0808CE2C: .4byte gBmSt
.L0808CE30: .4byte gMapUnit
.L0808CE34: .4byte ProcScr_CameraPan
.L0808CE38: .4byte gUnknown_08A01828
.L0808CE3C:
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L0808CE4A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6CUI1_Displayed

	THUMB_FUNC_START func_0808CE50
func_0808CE50: @ 0x0808CE50
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, .L0808CE80  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, .L0808CE84  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	bne .L0808CE88
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b .L0808CE94
	.align 2, 0
.L0808CE80: .4byte gBmSt
.L0808CE84: .4byte gMapUnit
.L0808CE88:
	adds r0, r4, #0
	bl InitMinimugBoxMaybe
	adds r0, r4, #0
	bl func_0808C234
.L0808CE94:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808CE50

	THUMB_FUNC_START Init6CUI2
Init6CUI2: @ 0x0808CE9C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	movs r1, #7
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #0x17
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x17
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END Init6CUI2

	THUMB_FUNC_START Loop6CUI2
Loop6CUI2: @ 0x0808CEC8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4b
	ldrb r0, [r5]
	adds r3, r4, #0
	adds r3, #0x4a
	strb r0, [r3]
	ldr r2, .L0808CF0C  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, .L0808CF10  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r6, #0x14
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq .L0808CF14
	cmp r1, #0
	beq .L0808CF14
	adds r0, r4, #0
	bl func_0808C8EC
	movs r0, #0
	str r0, [r4, #0x58]
	b .L0808CFBC
	.align 2, 0
.L0808CF0C: .4byte gBmSt
.L0808CF10: .4byte gMapUnit
.L0808CF14:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq .L0808CFBC
	ldr r0, .L0808CF64  @ ProcScr_CameraPan
	bl FindProc
	cmp r0, #0
	bne .L0808CFBC
	ldr r0, .L0808CF68  @ gUnknown_08A018AC
	bl FindProc
	adds r5, r0, #0
	cmp r5, #0
	beq .L0808CF42
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0808CF58
.L0808CF42:
	ldr r0, .L0808CF6C  @ gUnknown_08A019E4
	bl FindProc
	cmp r0, #0
	beq .L0808CF70
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0808CF70
.L0808CF58:
	ldr r0, [r4, #0x58]
	cmp r0, #3
	bgt .L0808CFBC
	adds r0, #1
	str r0, [r4, #0x58]
	b .L0808CFBC
	.align 2, 0
.L0808CF64: .4byte ProcScr_CameraPan
.L0808CF68: .4byte gUnknown_08A018AC
.L0808CF6C: .4byte gUnknown_08A019E4
.L0808CF70:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #7
	ble .L0808CFBC
	cmp r0, #8
	bne .L0808CF8E
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl func_0808C750
	b .L0808CFBC
.L0808CF8E:
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	cmp r5, #0
	beq .L0808CFA6
	adds r0, r5, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x11
	b .L0808CFAC
.L0808CFA6:
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #0
.L0808CFAC:
	strb r0, [r1]
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl DrawMinimugBoxMaybe
.L0808CFBC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6CUI2

	THUMB_FUNC_START InitPlayerPhaseInterfaceMaybe
InitPlayerPhaseInterfaceMaybe: @ 0x0808CFC4
	push {r4, lr}
	sub sp, #4
	ldr r2, .L0808D0A8  @ gDispIo
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
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
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
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r0, .L0808D0AC  @ gUnknown_08A167C8
	ldr r1, .L0808D0B0  @ 0x06002000
	bl Decompress
	ldr r0, .L0808D0B4  @ gUnknown_08A16D6C
	ldr r1, .L0808D0B8  @ 0x06015C00
	bl Decompress
	ldr r0, .L0808D0BC  @ 0x06002EA0
	ldr r1, .L0808D0C0  @ 0x06015D40
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L0808D0C4  @ gPal
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #1
	movs r1, #2
	bl ApplyIconPalette
	bl ResetTextFont
	ldr r4, .L0808D0C8  @ gPlaySt
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808D092
	ldr r0, .L0808D0CC  @ gUnknown_08A018AC
	movs r1, #3
	bl SpawnProc
.L0808D092:
	ldr r0, .L0808D0D0  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0808D0D8
	ldr r0, .L0808D0D4  @ gUnknown_08A01A44
	movs r1, #3
	bl SpawnProc
	b .L0808D0F8
	.align 2, 0
.L0808D0A8: .4byte gDispIo
.L0808D0AC: .4byte gUnknown_08A167C8
.L0808D0B0: .4byte 0x06002000
.L0808D0B4: .4byte gUnknown_08A16D6C
.L0808D0B8: .4byte 0x06015C00
.L0808D0BC: .4byte 0x06002EA0
.L0808D0C0: .4byte 0x06015D40
.L0808D0C4: .4byte gPal
.L0808D0C8: .4byte gPlaySt
.L0808D0CC: .4byte gUnknown_08A018AC
.L0808D0D0: .4byte gBmSt
.L0808D0D4: .4byte gUnknown_08A01A44
.L0808D0D8:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne .L0808D0F8
	movs r0, #0x66
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0808D0F8
	ldr r0, .L0808D12C  @ gUnknown_08A019E4
	movs r1, #3
	bl SpawnProc
.L0808D0F8:
	ldr r0, .L0808D130  @ gPlaySt
	adds r4, r0, #0
	adds r4, #0x40
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne .L0808D110
	ldr r0, .L0808D134  @ gUnknown_08A0190C
	movs r1, #3
	bl SpawnProc
.L0808D110:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne .L0808D122
	ldr r0, .L0808D138  @ gUnknown_08A01994
	movs r1, #3
	bl SpawnProc
.L0808D122:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D12C: .4byte gUnknown_08A019E4
.L0808D130: .4byte gPlaySt
.L0808D134: .4byte gUnknown_08A0190C
.L0808D138: .4byte gUnknown_08A01994

	THUMB_FUNC_END InitPlayerPhaseInterfaceMaybe

	THUMB_FUNC_START StartPlayerPhaseSideWindows
StartPlayerPhaseSideWindows: @ 0x0808D13C
	push {lr}
	ldr r0, .L0808D14C  @ gUnknown_08A019C4
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0808D14C: .4byte gUnknown_08A019C4

	THUMB_FUNC_END StartPlayerPhaseSideWindows

	THUMB_FUNC_START EndPlayerPhaseSideWindows
EndPlayerPhaseSideWindows: @ 0x0808D150
	push {lr}
	ldr r0, .L0808D17C  @ gUnknown_08A0190C
	bl EndEachProc
	ldr r0, .L0808D180  @ gUnknown_08A01994
	bl EndEachProc
	ldr r0, .L0808D184  @ gUnknown_08A018AC
	bl EndEachProc
	ldr r0, .L0808D188  @ gUnknown_08A019E4
	bl EndEachProc
	ldr r0, .L0808D18C  @ gUnknown_08A01A44
	bl EndEachProc
	bl SetBlendNone
	bl ClearBg0Bg1
	pop {r0}
	bx r0
	.align 2, 0
.L0808D17C: .4byte gUnknown_08A0190C
.L0808D180: .4byte gUnknown_08A01994
.L0808D184: .4byte gUnknown_08A018AC
.L0808D188: .4byte gUnknown_08A019E4
.L0808D18C: .4byte gUnknown_08A01A44

	THUMB_FUNC_END EndPlayerPhaseSideWindows

	THUMB_FUNC_START func_0808D190
func_0808D190: @ 0x0808D190
	push {lr}
	ldr r0, .L0808D1A8  @ gBmSt
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x40
	bgt .L0808D1AC
	movs r0, #0
	b .L0808D1AE
	.align 2, 0
.L0808D1A8: .4byte gBmSt
.L0808D1AC:
	movs r0, #1
.L0808D1AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808D190

	THUMB_FUNC_START func_0808D1B4
func_0808D1B4: @ 0x0808D1B4
	push {lr}
	bl func_0808D190
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808D1DC
	bl func_0808C314
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne .L0808D1D0
	movs r0, #2
	b .L0808D1FA
.L0808D1D0:
	bl func_0808C314
	cmp r0, #1
	bne .L0808D1F8
	movs r0, #1
	b .L0808D1FA
.L0808D1DC:
	bl func_0808C33C
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne .L0808D1EC
	movs r0, #4
	b .L0808D1FA
.L0808D1EC:
	bl func_0808C33C
	cmp r0, #1
	bne .L0808D1F8
	movs r0, #3
	b .L0808D1FA
.L0808D1F8:
	movs r0, #0
.L0808D1FA:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808D1B4

	THUMB_FUNC_START func_0808D200
func_0808D200: @ 0x0808D200
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, .L0808D278  @ gUnknown_020044D4
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, .L0808D27C  @ gUnknown_02004054
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	adds r5, r4, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne .L0808D244
	ldr r1, .L0808D280  @ gUnknown_08A17744
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
.L0808D244:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne .L0808D270
	ldr r1, .L0808D284  @ gUnknown_08A176BC
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r1, #0xc2
	bl PutText
.L0808D270:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D278: .4byte gUnknown_020044D4
.L0808D27C: .4byte gUnknown_02004054
.L0808D280: .4byte gUnknown_08A17744
.L0808D284: .4byte gUnknown_08A176BC

	THUMB_FUNC_END func_0808D200

	THUMB_FUNC_START Init6CPI
Init6CPI: @ 0x0808D288
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r1, #0
	str r1, [r6, #0x58]
	adds r0, #0x56
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r5, r6, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r0, r6, #0
	bl StartGreenText
	adds r0, r5, #0
	bl ClearText
	adds r0, r4, #0
	bl ClearText
	bl GetBattleMapKind
	cmp r0, #2
	beq .L0808D2E8
	ldr r0, .L0808D2E4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	b .L0808D2EC
	.align 2, 0
.L0808D2E4: .4byte gPlaySt
.L0808D2E8:
	movs r0, #0xcf
	lsls r0, r0, #1
.L0808D2EC:
	bl GetMsg
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x2c
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	bl GetBattleMapKind
	cmp r0, #2
	beq .L0808D328
	ldr r0, .L0808D324  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8c
	ldrb r0, [r0]
	b .L0808D32A
	.align 2, 0
.L0808D324: .4byte gPlaySt
.L0808D328:
	movs r0, #1
.L0808D32A:
	cmp r0, #4
	bls .L0808D330
	b .L0808D476
.L0808D330:
	lsls r0, r0, #2
	ldr r1, .L0808D33C  @ .L0808D340
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808D33C: .4byte .L0808D340
.L0808D340: @ jump table
	.4byte .L0808D354 @ case 0
	.4byte .L0808D35C @ case 1
	.4byte .L0808D3B0 @ case 2
	.4byte .L0808D354 @ case 3
	.4byte .L0808D354 @ case 4
.L0808D354:
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	b .L0808D474
.L0808D35C:
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, .L0808D390  @ 0x000001C1
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L0808D394  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L0808D39C
	ldr r0, .L0808D398  @ 0x00000535
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #1
	bl Text_InsertDrawString
	b .L0808D46E
	.align 2, 0
.L0808D390: .4byte 0x000001C1
.L0808D394: .4byte gPlaySt
.L0808D398: .4byte 0x00000535
.L0808D39C:
	movs r0, #0x80
	bl CountUnitsByFaction
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	b .L0808D46E
.L0808D3B0:
	ldr r4, .L0808D3D0  @ gPlaySt
	ldrh r5, [r4, #0x10]
	bl GetBattleMapKind
	cmp r0, #2
	beq .L0808D3D4
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge .L0808D3DC
	b .L0808D404
	.align 2, 0
.L0808D3D0: .4byte gPlaySt
.L0808D3D4:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	blt .L0808D404
.L0808D3DC:
	ldr r0, .L0808D400  @ 0x000001C3
	bl GetMsg
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x34
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertDrawString
	b .L0808D46E
	.align 2, 0
.L0808D400: .4byte 0x000001C3
.L0808D404:
	adds r4, r6, #0
	adds r4, #0x34
	ldr r7, .L0808D444  @ gPlaySt
	ldrh r3, [r7, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r0, .L0808D448  @ 0x00000539
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0
	bl Text_InsertDrawString
	bl GetBattleMapKind
	adds r5, r4, #0
	cmp r0, #2
	beq .L0808D44C
	movs r0, #0xe
	ldrsb r0, [r7, r0]
	bl GetChapterInfo
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r3, r0, #1
	b .L0808D450
	.align 2, 0
.L0808D444: .4byte gPlaySt
.L0808D448: .4byte 0x00000539
.L0808D44C:
	movs r3, #1
	negs r3, r3
.L0808D450:
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	movs r0, #0xe1
	lsls r0, r0, #1
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0
	bl Text_InsertDrawString
.L0808D46E:
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
.L0808D474:
	strh r0, [r1]
.L0808D476:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Init6CPI

	THUMB_FUNC_START Loop16CPI
Loop16CPI: @ 0x0808D47C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, .L0808D508  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl func_0808BBAC
	adds r5, r0, #0
	ldr r0, .L0808D50C  @ gUnknown_08A018AC
	bl FindProc
	cmp r0, #0
	beq .L0808D4CC
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt .L0808D4CC
	cmp r0, r5
	beq .L0808D500
.L0808D4CC:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	adds r0, r4, #0
	bl func_0808D200
	ldr r1, .L0808D510  @ gBmSt
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r3, r4, #0
	adds r3, #0x4f
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0808D500:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D508: .4byte gUnknown_08A01828
.L0808D50C: .4byte gUnknown_08A018AC
.L0808D510: .4byte gBmSt

	THUMB_FUNC_END Loop16CPI

	THUMB_FUNC_START func_0808D514
func_0808D514: @ 0x0808D514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov sl, r2
	ldr r1, .L0808D69C  @ gUnknown_08A01828
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	mov r8, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r9, r0
	cmp r1, #0
	bge .L0808D582
	cmp r0, #0
	bge .L0808D582
	ldr r4, .L0808D6A0  @ gBg1Tm
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, .L0808D6A4  @ gBg0Tm
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, .L0808D6A8  @ gUnknown_02004254
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, .L0808D6AC  @ gUnknown_02003D54
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
.L0808D582:
	mov r0, r8
	cmp r0, #0
	ble .L0808D5D2
	mov r1, r9
	cmp r1, #0
	bge .L0808D5D2
	ldr r4, .L0808D6B0  @ gBg1Tm+0x26
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, .L0808D6B4  @ gBg0Tm+0x26
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, .L0808D6A8  @ gUnknown_02004254
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, .L0808D6AC  @ gUnknown_02003D54
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
.L0808D5D2:
	mov r0, r8
	cmp r0, #0
	bge .L0808D62C
	mov r1, r9
	cmp r1, #0
	ble .L0808D62C
	ldr r5, .L0808D6B8  @ gBg1Tm+0x380
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, .L0808D6BC  @ gBg0Tm+0x380
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808D6C0  @ gUnknown_020044D4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, .L0808D6C4  @ 0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, .L0808D6C8  @ gUnknown_02004054
	ldr r1, .L0808D6C4  @ 0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
.L0808D62C:
	mov r0, r8
	cmp r0, #0
	ble .L0808D686
	mov r1, r9
	cmp r1, #0
	ble .L0808D686
	ldr r5, .L0808D6CC  @ gBg1Tm+0x3A6
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, .L0808D6D0  @ gBg0Tm+0x3A6
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0808D6C0  @ gUnknown_020044D4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, .L0808D6C4  @ 0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, .L0808D6C8  @ gUnknown_02004054
	ldr r1, .L0808D6C4  @ 0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
.L0808D686:
	movs r0, #3
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D69C: .4byte gUnknown_08A01828
.L0808D6A0: .4byte gBg1Tm
.L0808D6A4: .4byte gBg0Tm
.L0808D6A8: .4byte gUnknown_02004254
.L0808D6AC: .4byte gUnknown_02003D54
.L0808D6B0: .4byte gBg1Tm+0x26
.L0808D6B4: .4byte gBg0Tm+0x26
.L0808D6B8: .4byte gBg1Tm+0x380
.L0808D6BC: .4byte gBg0Tm+0x380
.L0808D6C0: .4byte gUnknown_020044D4
.L0808D6C4: .4byte 0xFFFFFC80
.L0808D6C8: .4byte gUnknown_02004054
.L0808D6CC: .4byte gBg1Tm+0x3A6
.L0808D6D0: .4byte gBg0Tm+0x3A6

	THUMB_FUNC_END func_0808D514

	THUMB_FUNC_START Loop26CPI
Loop26CPI: @ 0x0808D6D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0808D718  @ gUnknown_08A019DC
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl func_0808D514
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #5
	bne .L0808D712
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0808D712:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D718: .4byte gUnknown_08A019DC

	THUMB_FUNC_END Loop26CPI

	THUMB_FUNC_START Loop46CPI
Loop46CPI: @ 0x0808D71C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x55
	movs r5, #0
	movs r0, #1
	strb r0, [r6]
	ldr r1, .L0808D774  @ gUnknown_08A019E1
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl func_0808D514
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #3
	bne .L0808D76C
	str r5, [r4, #0x58]
	strb r5, [r6]
	adds r0, r4, #0
	adds r0, #0x56
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0808D76C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D774: .4byte gUnknown_08A019E1

	THUMB_FUNC_END Loop46CPI

	THUMB_FUNC_START func_0808D778
func_0808D778: @ 0x0808D778
	bx lr

	THUMB_FUNC_END func_0808D778

	THUMB_FUNC_START __malloc_unlock_0
__malloc_unlock_0: @ 0x0808D77C
	bx lr

	THUMB_FUNC_END __malloc_unlock_0

	THUMB_FUNC_START func_0808D780
func_0808D780: @ 0x0808D780
	bx lr

	THUMB_FUNC_END func_0808D780

	THUMB_FUNC_START Loop36CPI
Loop36CPI: @ 0x0808D784
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, .L0808D808  @ gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq .L0808D802
	ldr r0, .L0808D80C  @ ProcScr_CameraPan
	bl FindProc
	cmp r0, #0
	bne .L0808D7F4
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq .L0808D802
	ldr r1, .L0808D810  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L0808D7F4
	movs r1, #5
	ldrsb r1, [r5, r1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq .L0808D802
.L0808D7F4:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0808D802:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D808: .4byte gBmSt
.L0808D80C: .4byte ProcScr_CameraPan
.L0808D810: .4byte gUnknown_08A01828

	THUMB_FUNC_END Loop36CPI

	THUMB_FUNC_START func_0808D814
func_0808D814: @ 0x0808D814
	push {lr}
	ldr r0, .L0808D85C  @ gUnknown_08A0190C
	bl FindProc
	cmp r0, #0
	beq .L0808D82C
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0808D858
.L0808D82C:
	ldr r0, .L0808D860  @ gUnknown_08A018AC
	bl FindProc
	cmp r0, #0
	beq .L0808D842
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0808D858
.L0808D842:
	ldr r0, .L0808D864  @ gUnknown_08A019E4
	bl FindProc
	cmp r0, #0
	beq .L0808D868
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0808D868
.L0808D858:
	movs r0, #1
	b .L0808D86A
	.align 2, 0
.L0808D85C: .4byte gUnknown_08A0190C
.L0808D860: .4byte gUnknown_08A018AC
.L0808D864: .4byte gUnknown_08A019E4
.L0808D868:
	movs r0, #0
.L0808D86A:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808D814

	THUMB_FUNC_START func_0808D870
func_0808D870: @ 0x0808D870
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808D898  @ gUnknown_08A199C8
	ldr r1, .L0808D89C  @ 0x06015000
	bl Decompress
	adds r1, r4, #0
	adds r1, #0x46
	movs r2, #0
	movs r0, #0x88
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x8c
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x56
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D898: .4byte gUnknown_08A199C8
.L0808D89C: .4byte 0x06015000

	THUMB_FUNC_END func_0808D870

	THUMB_FUNC_START func_0808D8A0
func_0808D8A0: @ 0x0808D8A0
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r2, #0
	ldr r0, .L0808D920  @ gUnknown_08A01828
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #4
	ldrsb r2, [r1, r2]
	movs r4, #5
	ldrsb r4, [r1, r4]
	cmp r2, #0
	bge .L0808D8CE
	cmp r4, #0
	bge .L0808D8CE
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x14
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
.L0808D8CE:
	cmp r2, #0
	ble .L0808D8E8
	cmp r4, #0
	bge .L0808D8E8
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0xac
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x14
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
.L0808D8E8:
	cmp r2, #0
	bge .L0808D900
	cmp r4, #0
	ble .L0808D900
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	movs r0, #0xa4
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
.L0808D900:
	cmp r2, #0
	ble .L0808D918
	cmp r4, #0
	ble .L0808D918
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0xac
	strh r0, [r1]
	movs r0, #0xa4
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
.L0808D918:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D920: .4byte gUnknown_08A01828

	THUMB_FUNC_END func_0808D8A0

	THUMB_FUNC_START func_0808D924
func_0808D924: @ 0x0808D924
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, .L0808D970  @ 0x000001FF
	adds r1, r4, #0
	ands r1, r6
	movs r0, #0xff
	ands r5, r0
	ldr r0, .L0808D974  @ Sprite_32x16
	mov r8, r0
	movs r0, #0x8a
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	mov r3, r8
	bl PutSprite
	adds r4, #0x20
	ands r4, r6
	ldr r0, .L0808D978  @ 0x00002284
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, r8
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D970: .4byte 0x000001FF
.L0808D974: .4byte Sprite_32x16
.L0808D978: .4byte 0x00002284

	THUMB_FUNC_END func_0808D924

	THUMB_FUNC_START func_0808D97C
func_0808D97C: @ 0x0808D97C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	movs r5, #0
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r4, #0x58]
	adds r0, r4, #0
	bl func_0808D8A0
	str r5, [r4, #0x58]
	ldr r1, .L0808D9B4  @ gBmSt
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r4, #0x4f
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808D9B4: .4byte gBmSt

	THUMB_FUNC_END func_0808D97C

	THUMB_FUNC_START func_0808D9B8
func_0808D9B8: @ 0x0808D9B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	adds r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl func_0808D8A0
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl func_0808D924
	ldr r0, [r4, #0x58]
	cmp r0, #0x18
	bne .L0808D9F6
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
.L0808D9F6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808D9B8

	THUMB_FUNC_START func_0808D9FC
func_0808D9FC: @ 0x0808D9FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl func_0808D924
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, .L0808DA94  @ gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq .L0808DA8C
	ldr r0, .L0808DA98  @ ProcScr_CameraPan
	bl FindProc
	cmp r0, #0
	bne .L0808DA7E
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq .L0808DA8C
	ldr r1, .L0808DA9C  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L0808DA7E
	movs r1, #5
	ldrsb r1, [r5, r1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq .L0808DA8C
.L0808DA7E:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0808DA8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808DA94: .4byte gBmSt
.L0808DA98: .4byte ProcScr_CameraPan
.L0808DA9C: .4byte gUnknown_08A01828

	THUMB_FUNC_END func_0808D9FC

	THUMB_FUNC_START func_0808DAA0
func_0808DAA0: @ 0x0808DAA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	subs r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl func_0808D8A0
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl func_0808D924
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne .L0808DADC
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
.L0808DADC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808DAA0

	THUMB_FUNC_START MinimalVBlankHandler
MinimalVBlankHandler: @ 0x0808DAE4
	push {lr}
	ldr r1, .L0808DB04  @ gUnknown_03007FF8
	movs r0, #1
	strh r0, [r1]
	bl SyncDispIo
	bl SyncBgsAndPal
	bl ApplyDataMoves
	bl m4aSoundVSync
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
.L0808DB04: .4byte gUnknown_03007FF8

	THUMB_FUNC_END MinimalVBlankHandler

	THUMB_FUNC_START func_0808DB08
func_0808DB08: @ 0x0808DB08
	push {r4, lr}
	ldr r4, .L0808DB30  @ gKeySt
	ldr r0, [r4]
	bl RefreshKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq .L0808DB24
	movs r0, #0xff
	bl SoftReset
.L0808DB24:
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808DB30: .4byte gKeySt

	THUMB_FUNC_END func_0808DB08

	THUMB_FUNC_START func_0808DB34
func_0808DB34: @ 0x0808DB34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x7c
	add r5, sp, #0x18
	bl ResetText
	bl InitTalkTextFont
	add r7, sp, #8
	add r0, sp, #0x10
	mov r8, r0
	mov r4, sp
	movs r6, #2
.L0808DB50:
	adds r0, r4, #0
	movs r1, #0x16
	bl InitText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge .L0808DB50
	movs r1, #0
	str r1, [r5, #0x30]
	mov r0, sp
	str r0, [r5, #0x34]
	str r7, [r5, #0x38]
	mov r0, r8
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x5c
	strh r1, [r0]
	ldr r0, .L0808DBC0  @ 0x0000088E
	bl GetMsg
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl func_08089EEC
	ldr r4, .L0808DBC4  @ gBg0Tm+0x188
	mov r0, sp
	adds r1, r4, #0
	bl PutText
	adds r1, r4, #0
	adds r1, #0xc0
	adds r0, r7, #0
	bl PutText
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	add sp, #0x7c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808DBC0: .4byte 0x0000088E
.L0808DBC4: .4byte gBg0Tm+0x188

	THUMB_FUNC_END func_0808DB34

	THUMB_FUNC_START func_0808DBC8
func_0808DBC8: @ 0x0808DBC8
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	bl SetupBackgrounds
	bl m4aSoundInit
	bl InitProcs
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, .L0808DC60  @ gDispIo
	ldrb r0, [r4, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetBlendNone
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	strh r0, [r4, #0x38]
	bl SyncDispIo
	movs r4, #0
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, .L0808DC64  @ 0x01000008
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, .L0808DC68  @ 0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	bl func_0808DB34
	ldr r0, .L0808DC6C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808DC52
	movs r0, #0x7b
	bl m4aSongNumStart
.L0808DC52:
	ldr r0, .L0808DC70  @ func_0808DB08
	bl SetMainFunc
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808DC60: .4byte gDispIo
.L0808DC64: .4byte 0x01000008
.L0808DC68: .4byte 0x06008000
.L0808DC6C: .4byte gPlaySt
.L0808DC70: .4byte func_0808DB08

	THUMB_FUNC_END func_0808DBC8

	THUMB_FUNC_START SioLinkError
SioLinkError: @ 0x0808DC74
	push {lr}
	ldr r1, .L0808DC9C  @ 0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, .L0808DCA0  @ 0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, .L0808DCA4  @ MinimalVBlankHandler
	bl SetOnVBlank
	ldr r0, .L0808DCA8  @ func_0808DBC8
	bl SetMainFunc
	pop {r0}
	bx r0
	.align 2, 0
.L0808DC9C: .4byte 0x04000004
.L0808DCA0: .4byte 0x04000208
.L0808DCA4: .4byte MinimalVBlankHandler
.L0808DCA8: .4byte func_0808DBC8

	THUMB_FUNC_END SioLinkError

	THUMB_FUNC_START func_0808DCAC
func_0808DCAC: @ 0x0808DCAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808DCC8  @ 0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r0, .L0808DCCC  @ gUnknown_08A01D18
	adds r1, r4, #0
	bl StartMoveableHelpBox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808DCC8: .4byte 0x06015000
.L0808DCCC: .4byte gUnknown_08A01D18

	THUMB_FUNC_END func_0808DCAC

	THUMB_FUNC_START func_0808DCD0
func_0808DCD0: @ 0x0808DCD0
	push {r4, lr}
	movs r4, #1
.L0808DCD4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L0808DCEA
	ldr r0, [r1]
	cmp r0, #0
	beq .L0808DCEA
	adds r0, r1, #0
	b .L0808DCF2
.L0808DCEA:
	adds r4, #1
	cmp r4, #0x3f
	ble .L0808DCD4
	movs r0, #0
.L0808DCF2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808DCD0

	THUMB_FUNC_START func_0808DCF8
func_0808DCF8: @ 0x0808DCF8
	push {r4, lr}
	movs r2, #0
	ldr r0, .L0808DD14  @ gPlaySt
	ldrb r0, [r0, #0xe]
	subs r0, #0xd
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bhi .L0808DD84
	lsls r0, r0, #2
	ldr r1, .L0808DD18  @ .L0808DD1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808DD14: .4byte gPlaySt
.L0808DD18: .4byte .L0808DD1C
.L0808DD1C: @ jump table
	.4byte .L0808DD70 @ case 0
	.4byte .L0808DD84 @ case 1
	.4byte .L0808DD74 @ case 2
	.4byte .L0808DD84 @ case 3
	.4byte .L0808DD84 @ case 4
	.4byte .L0808DD84 @ case 5
	.4byte .L0808DD84 @ case 6
	.4byte .L0808DD7C @ case 7
	.4byte .L0808DD84 @ case 8
	.4byte .L0808DD84 @ case 9
	.4byte .L0808DD84 @ case 10
	.4byte .L0808DD84 @ case 11
	.4byte .L0808DD84 @ case 12
	.4byte .L0808DD84 @ case 13
	.4byte .L0808DD84 @ case 14
	.4byte .L0808DD78 @ case 15
	.4byte .L0808DD84 @ case 16
	.4byte .L0808DD84 @ case 17
	.4byte .L0808DD84 @ case 18
	.4byte .L0808DD84 @ case 19
	.4byte .L0808DD7C @ case 20
.L0808DD70:
	movs r0, #0x51
	b .L0808DD7E
.L0808DD74:
	movs r0, #0x43
	b .L0808DD7E
.L0808DD78:
	movs r0, #0x53
	b .L0808DD7E
.L0808DD7C:
	movs r0, #0x41
.L0808DD7E:
	bl GetUnitByPid
	adds r2, r0, #0
.L0808DD84:
	cmp r2, #0
	beq .L0808DD8C
.L0808DD88:
	adds r0, r2, #0
	b .L0808DDBA
.L0808DD8C:
	movs r4, #0x81
.L0808DD8E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L0808DDB2
	ldr r1, [r2]
	cmp r1, #0
	beq .L0808DDB2
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne .L0808DD88
.L0808DDB2:
	adds r4, #1
	cmp r4, #0xbf
	ble .L0808DD8E
	movs r0, #0
.L0808DDBA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808DCF8

	THUMB_FUNC_START func_0808DDC0
func_0808DDC0: @ 0x0808DDC0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
.L0808DDC6:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq .L0808DDEA
	ldr r1, [r0]
	cmp r1, #0
	beq .L0808DDEA
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq .L0808DDEA
	adds r5, #1
.L0808DDEA:
	adds r4, #1
	cmp r4, #0xbf
	ble .L0808DDC6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808DDC0

	THUMB_FUNC_START CountUnitsByFaction
CountUnitsByFaction: @ 0x0808DDF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b .L0808DE24
.L0808DE02:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L0808DE20
	ldr r0, [r1]
	cmp r0, #0
	beq .L0808DE20
	ldr r0, [r1, #0xc]
	ldr r1, .L0808DE34  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L0808DE20
	adds r6, #1
.L0808DE20:
	adds r4, #1
	adds r0, r5, #0
.L0808DE24:
	adds r0, #0x40
	cmp r4, r0
	blt .L0808DE02
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0808DE34: .4byte 0x0001000C

	THUMB_FUNC_END CountUnitsByFaction

	THUMB_FUNC_START func_0808DE38
func_0808DE38: @ 0x0808DE38
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, .L0808DEB4  @ gUnknown_08A2E8F0
	adds r0, #0x5e
	ldrh r5, [r0]
	ldr r6, .L0808DEB8  @ gPal+0x2FC
	adds r3, r2, #0
	adds r3, #0x40
	ldrb r0, [r3]
	lsrs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1
	adds r0, #1
	strb r0, [r3]
	cmp r4, #0x10
	ble .L0808DE60
	movs r0, #0xf
	ands r0, r4
	movs r1, #0x10
	subs r4, r1, r0
.L0808DE60:
	adds r1, r2, #0
	adds r1, #0x2e
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r2, [r0]
	cmp r1, r2
	beq .L0808DE76
	strb r1, [r0]
	movs r0, #0
	strb r0, [r3]
.L0808DE76:
	movs r3, #0x1f
	movs r0, #0x1f
	ands r0, r5
	movs r2, #0x10
	subs r2, r2, r4
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #4
	ands r1, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r5, #0
	ands r0, r3
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r5, r3
	adds r0, r5, #0
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	strh r1, [r6]
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808DEB4: .4byte gUnknown_08A2E8F0
.L0808DEB8: .4byte gPal+0x2FC

	THUMB_FUNC_END func_0808DE38

	THUMB_FUNC_START func_0808DEBC
func_0808DEBC: @ 0x0808DEBC
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	cmp r1, #0
	beq .L0808DEDA
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0808DEDA
.L0808DECC:
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0808DEDA
	cmp r0, #1
	bne .L0808DEDE
	adds r0, r1, #1
	b .L0808DEEA
.L0808DEDA:
	movs r0, #0
	b .L0808DEEA
.L0808DEDE:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextLen
	adds r1, r0, #0
	b .L0808DECC
.L0808DEEA:
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808DEBC

	THUMB_FUNC_START func_0808DEF0
func_0808DEF0: @ 0x0808DEF0
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808DF18
	movs r0, #0
	str r0, [sp]
	ldr r1, .L0808DF10  @ gPal+0x3A0
	ldr r2, .L0808DF14  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b .L0808DF1C
	.align 2, 0
.L0808DF10: .4byte gPal+0x3A0
.L0808DF14: .4byte 0x01000008
.L0808DF18:
	bl ApplyUnitSpritePalettes
.L0808DF1C:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808DEF0

	THUMB_FUNC_START func_0808DF24
func_0808DF24: @ 0x0808DF24
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r4, .L0808E060  @ gDispIo
	ldrb r0, [r4, #0xc]
	mov r9, r0
	movs r5, #4
	negs r5, r5
	ldrb r0, [r4, #0x10]
	adds r2, r5, #0
	ands r2, r0
	movs r6, #1
	mov r8, r6
	mov r0, r8
	orrs r2, r0
	ldrb r0, [r4, #0x14]
	adds r1, r5, #0
	ands r1, r0
	movs r6, #2
	mov ip, r6
	mov r0, ip
	orrs r1, r0
	ldrb r3, [r4, #0x18]
	movs r0, #3
	orrs r3, r0
	adds r0, r5, #0
	mov r6, r9
	ands r0, r6
	strb r0, [r4, #0xc]
	ands r2, r5
	mov r0, r8
	orrs r2, r0
	strb r2, [r4, #0x10]
	ands r1, r5
	mov r6, ip
	orrs r1, r6
	strb r1, [r4, #0x14]
	ands r3, r5
	orrs r3, r6
	strb r3, [r4, #0x18]
	bl ResetText
	bl LoadUiFrameGraphics
	movs r5, #0
	movs r0, #0
	strh r0, [r7, #0x3c]
	adds r0, r7, #0
	adds r0, #0x3e
	strb r5, [r0]
	subs r0, #0x14
	strb r5, [r0]
	ldr r4, .L0808E064  @ 0x0000FFFE
	ldr r2, .L0808E068  @ 0x0000FFFC
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	ldr r2, .L0808E06C  @ 0x0000FFDC
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearBg0Bg1
	ldr r0, .L0808E070  @ gUiFramePaletteA
	movs r1, #0x40
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, .L0808E074  @ gUnknown_08A2E5EC
	ldr r1, .L0808E078  @ 0x06005800
	bl Decompress
	ldr r0, .L0808E07C  @ gUnknown_08A2E4C4
	ldr r4, .L0808E080  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L0808E084  @ gBg2Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, .L0808E088  @ gUnknown_08A2D32C
	ldr r1, .L0808E08C  @ 0x06013000
	bl Decompress
	ldr r0, .L0808E090  @ gUnknown_08A2E1B8
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, .L0808E094  @ gUnknown_08A2E1F8
	ldr r1, .L0808E098  @ 0x06013300
	bl Decompress
	bl SetBlendNone
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r7, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #0x12
	strb r5, [r0]
	bl GetPlayerLeaderPid
	bl GetUnitByPid
	str r0, [r7, #0x34]
	movs r0, #0
	bl CountUnitsByFaction
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	bl GetGlobalCompletionCount
	adds r1, r7, #0
	adds r1, #0x2b
	strb r0, [r1]
	ldr r2, [r7, #0x34]
	ldr r1, [r2, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0808E09C
	movs r0, #3
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0xc]
	adds r1, r7, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	b .L0808E0A2
	.align 2, 0
.L0808E060: .4byte gDispIo
.L0808E064: .4byte 0x0000FFFE
.L0808E068: .4byte 0x0000FFFC
.L0808E06C: .4byte 0x0000FFDC
.L0808E070: .4byte gUiFramePaletteA
.L0808E074: .4byte gUnknown_08A2E5EC
.L0808E078: .4byte 0x06005800
.L0808E07C: .4byte gUnknown_08A2E4C4
.L0808E080: .4byte gBuf
.L0808E084: .4byte gBg2Tm
.L0808E088: .4byte gUnknown_08A2D32C
.L0808E08C: .4byte 0x06013000
.L0808E090: .4byte gUnknown_08A2E1B8
.L0808E094: .4byte gUnknown_08A2E1F8
.L0808E098: .4byte 0x06013300
.L0808E09C:
	adds r0, r7, #0
	adds r0, #0x29
	strb r5, [r0]
.L0808E0A2:
	bl func_0808DDC0
	cmp r0, #0
	beq .L0808E0AE
	bl func_0808DCF8
.L0808E0AE:
	str r0, [r7, #0x38]
	movs r0, #0x80
	bl CountUnitsByFaction
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	bl ApplyUnitSpritePalettes
	adds r4, r7, #0
	adds r4, #0x34
	movs r5, #1
.L0808E0C6:
	ldr r0, [r4]
	cmp r0, #0
	beq .L0808E0D4
	bl GetUnitSpriteId
	bl UseUnitSprite
.L0808E0D4:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge .L0808E0C6
	bl ForceSyncUnitSpriteSheet
	ldr r6, .L0808E190  @ gDispIo
	ldrb r0, [r6, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x48
	strb r0, [r1]
	adds r3, r6, #0
	adds r3, #0x34
	ldrb r0, [r3]
	movs r5, #1
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r2, #8
	orrs r0, r2
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	adds r3, #2
	ldrb r0, [r3]
	orrs r0, r5
	movs r5, #3
	negs r5, r5
	ands r0, r5
	orrs r0, r4
	orrs r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xe
	bl StartScreenMenuScrollingBg
	ldr r0, .L0808E194  @ gUnknown_08B1754C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #0xc8
	movs r1, #0x12
	movs r2, #2
	adds r3, r7, #0
	bl ShowRIsInfo
	ldr r0, .L0808E198  @ gUnknown_08A01CA4
	adds r1, r7, #0
	bl SpawnProc
	ldrb r1, [r6, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	ands r0, r5
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r6, #1]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E190: .4byte gDispIo
.L0808E194: .4byte gUnknown_08B1754C
.L0808E198: .4byte gUnknown_08A01CA4

	THUMB_FUNC_END func_0808DF24

	THUMB_FUNC_START func_0808E19C
func_0808E19C: @ 0x0808E19C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, .L0808E22C  @ gUnknown_02004BBC
	ldr r0, .L0808E230  @ gBg0Tm+0x272
	movs r1, #3
	movs r2, #3
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	adds r0, #8
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	cmp r6, #0
	bne .L0808E1CC
	b .L0808E318
.L0808E1CC:
	ldr r0, [r6, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L0808E238
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x82
	bl Text_SetCursor
	ldr r4, .L0808E234  @ 0x00000535
	adds r0, r4, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xa2
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xba
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #1
	bl func_0808DEF0
	b .L0808E364
	.align 2, 0
.L0808E22C: .4byte gUnknown_02004BBC
.L0808E230: .4byte gBg0Tm+0x272
.L0808E234: .4byte 0x00000535
.L0808E238:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r6]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetCursor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x8a
	bl Text_SetCursor
	movs r1, #8
	ldrsb r1, [r6, r1]
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble .L0808E2A4
	adds r0, r5, #0
	movs r1, #0xa2
	bl Text_SetCursor
	ldr r0, .L0808E2A0  @ 0x00000535
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	b .L0808E2BA
	.align 2, 0
.L0808E2A0: .4byte 0x00000535
.L0808E2A4:
	adds r0, r5, #0
	movs r1, #0xaa
	bl Text_SetCursor
	adds r0, r6, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
.L0808E2BA:
	adds r0, r6, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble .L0808E2E0
	adds r0, r5, #0
	movs r1, #0xba
	bl Text_SetCursor
	ldr r0, .L0808E2DC  @ 0x00000535
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	b .L0808E2F6
	.align 2, 0
.L0808E2DC: .4byte 0x00000535
.L0808E2E0:
	adds r0, r5, #0
	movs r1, #0xc2
	bl Text_SetCursor
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawNumberOrBlank
.L0808E2F6:
	adds r0, r6, #0
	bl GetUnitChibiFid
	ldr r1, .L0808E314  @ gBg0Tm+0x272
	movs r2, #0xa0
	lsls r2, r2, #2
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl PutFaceChibi
	movs r0, #0
	bl func_0808DEF0
	b .L0808E364
	.align 2, 0
.L0808E314: .4byte gBg0Tm+0x272
.L0808E318:
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0x82
	bl Text_SetCursor
	ldr r4, .L0808E3CC  @ 0x00000535
	adds r0, r4, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xa2
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #0xba
	bl Text_SetCursor
	adds r0, r4, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
.L0808E364:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0xb3
	bl Text_SetCursor
	ldr r0, .L0808E3D0  @ 0x00000539
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	movs r0, #1
	bl EnableBgSync
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E3CC: .4byte 0x00000535
.L0808E3D0: .4byte 0x00000539

	THUMB_FUNC_END func_0808E19C

	THUMB_FUNC_START func_0808E3D4
func_0808E3D4: @ 0x0808E3D4
	ldr r2, .L0808E3F0  @ gDispIo
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
	bx lr
	.align 2, 0
.L0808E3F0: .4byte gDispIo

	THUMB_FUNC_END func_0808E3D4

	THUMB_FUNC_START func_0808E3F4
func_0808E3F4: @ 0x0808E3F4
	push {r4, lr}
	ldr r0, .L0808E430  @ Pal_SystemText
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L0808E434  @ gUnknown_02004BC4
	ldr r1, .L0808E438  @ 0x06017800
	adds r0, r4, #0
	movs r2, #0x1a
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	subs r4, #8
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E430: .4byte Pal_SystemText
.L0808E434: .4byte gUnknown_02004BC4
.L0808E438: .4byte 0x06017800

	THUMB_FUNC_END func_0808E3F4

	THUMB_FUNC_START func_0808E43C
func_0808E43C: @ 0x0808E43C
	push {r4, r5, lr}
	ldr r5, .L0808E4A0  @ gBg0Tm+0x380
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	adds r0, #0x18
	ldr r1, .L0808E4A4  @ gPlaySt
	ldrh r2, [r1, #0x10]
	movs r1, #2
	bl PutNumber
	adds r4, r5, #0
	adds r4, #0x96
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r0, r5, #0
	adds r0, #0x98
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	ldr r1, .L0808E4A8  @ 0xFFFFFEE2
	adds r0, r5, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	adds r0, r5, #0
	subs r0, #0x9e
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E4A0: .4byte gBg0Tm+0x380
.L0808E4A4: .4byte gPlaySt
.L0808E4A8: .4byte 0xFFFFFEE2

	THUMB_FUNC_END func_0808E43C

	THUMB_FUNC_START func_0808E4AC
func_0808E4AC: @ 0x0808E4AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, .L0808E504  @ gUnknown_08A01B3C
	bl InitTextList
	adds r0, r6, #0
	bl func_0808E3F4
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r0, #6
	adds r0, r0, r1
	ldr r0, [r0]
	bl func_0808E19C
	ldr r4, .L0808E508  @ gBg1Tm+0x148
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r2, [r0]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	ldr r0, .L0808E50C  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L0808E510
	adds r0, r4, #0
	adds r0, #0xe
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b .L0808E520
	.align 2, 0
.L0808E504: .4byte gUnknown_08A01B3C
.L0808E508: .4byte gBg1Tm+0x148
.L0808E50C: .4byte gPlaySt
.L0808E510:
	adds r0, r4, #0
	adds r0, #0xe
	adds r1, r6, #0
	adds r1, #0x31
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
.L0808E520:
	adds r4, r6, #0
	adds r4, #0x2c
	movs r0, #1
	strb r0, [r4]
	bl GetBattleMapKind
	mov r8, r4
	cmp r0, #2
	beq .L0808E548
	ldr r0, .L0808E544  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x88
	ldrh r0, [r0]
	b .L0808E54C
	.align 2, 0
.L0808E544: .4byte gPlaySt
.L0808E548:
	movs r0, #0xe0
	lsls r0, r0, #1
.L0808E54C:
	bl GetMsg
	adds r5, r0, #0
	ldr r7, .L0808E5B4  @ gUnknown_02004BAC
	movs r0, #0x60
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r7, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl func_0808DEBC
	adds r5, r0, #0
	cmp r5, #0
	beq .L0808E592
	adds r4, r7, #0
	adds r4, #8
	movs r0, #0x60
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #2
	mov r1, r8
	strb r0, [r1]
.L0808E592:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #2
	bne .L0808E5BC
	ldr r4, .L0808E5B8  @ gBg0Tm+0x282
	adds r0, r7, #0
	adds r1, r4, #0
	bl PutText
	adds r0, r7, #0
	adds r0, #8
	adds r4, #0x80
	adds r1, r4, #0
	bl PutText
	b .L0808E5C4
	.align 2, 0
.L0808E5B4: .4byte gUnknown_02004BAC
.L0808E5B8: .4byte gBg0Tm+0x282
.L0808E5BC:
	ldr r1, .L0808E5FC  @ gBg0Tm+0x2C2
	adds r0, r7, #0
	bl PutText
.L0808E5C4:
	adds r4, r6, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0808E5E6
	ldr r0, .L0808E600  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0808E5E6
	ldr r0, .L0808E604  @ gBg0Tm+0x34
	ldrb r2, [r4]
	adds r2, #1
	movs r1, #0
	bl PutNumberOrBlank
.L0808E5E6:
	bl func_0808E43C
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E5FC: .4byte gBg0Tm+0x2C2
.L0808E600: .4byte gPlaySt
.L0808E604: .4byte gBg0Tm+0x34

	THUMB_FUNC_END func_0808E4AC

	THUMB_FUNC_START func_0808E608
func_0808E608: @ 0x0808E608
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x2e
	ldrb r7, [r3]
	adds r4, r5, #0
	adds r4, #0x3e
	movs r0, #0
	strb r0, [r4]
	ldr r1, .L0808E638  @ gKeySt
	ldr r6, [r1]
	ldrh r2, [r6, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	mov ip, r1
	cmp r0, #0
	beq .L0808E63C
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl func_0808DCAC
	b .L0808E710
	.align 2, 0
.L0808E638: .4byte gKeySt
.L0808E63C:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L0808E690
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq .L0808E670
	ldr r0, [r2, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L0808E670
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	bl SetLastStatScreenUid
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
.L0808E670:
	ldr r0, .L0808E68C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808E682
	movs r0, #0x6a
	bl m4aSongNumStart
.L0808E682:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L0808E710
	.align 2, 0
.L0808E68C: .4byte gPlaySt
.L0808E690:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq .L0808E6B8
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L0808E6B4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808E710
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0808E710
	.align 2, 0
.L0808E6B4: .4byte gPlaySt
.L0808E6B8:
	ldrh r1, [r6, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0808E6CC
	ldrb r0, [r3]
	cmp r0, #0
	beq .L0808E6CC
	subs r0, #1
	strb r0, [r3]
.L0808E6CC:
	mov r1, ip
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq .L0808E6E8
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0808E6E8
	adds r0, #1
	strb r0, [r4]
.L0808E6E8:
	ldrb r0, [r4]
	cmp r0, r7
	beq .L0808E710
	ldr r0, .L0808E718  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808E700
	movs r0, #0x66
	bl m4aSongNumStart
.L0808E700:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl func_0808E19C
.L0808E710:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E718: .4byte gPlaySt

	THUMB_FUNC_END func_0808E608

	THUMB_FUNC_START func_0808E71C
func_0808E71C: @ 0x0808E71C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808E744  @ gUnknown_08A01CA4
	bl EndEachProc
	bl HideRIsInfo
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808E73E
	ldr r0, [r4, #0x34]
	ldr r1, [r0, #0xc]
	movs r2, #2
	orrs r1, r2
	str r1, [r0, #0xc]
.L0808E73E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E744: .4byte gUnknown_08A01CA4

	THUMB_FUNC_END func_0808E71C

	THUMB_FUNC_START func_0808E748
func_0808E748: @ 0x0808E748
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808E75A
	ldr r0, .L0808E760  @ gUnknown_0859AE18
	bl SpawnProcLocking
.L0808E75A:
	pop {r0}
	bx r0
	.align 2, 0
.L0808E760: .4byte gUnknown_0859AE18

	THUMB_FUNC_END func_0808E748

	THUMB_FUNC_START StartChapterStatusScreen
StartChapterStatusScreen: @ 0x0808E764
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq .L0808E784
	ldr r0, .L0808E780  @ gUnknown_08A01B54
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	b .L0808E790
	.align 2, 0
.L0808E780: .4byte gUnknown_08A01B54
.L0808E784:
	ldr r0, .L0808E798  @ gUnknown_08A01B54
	movs r1, #3
	bl SpawnProc
	adds r0, #0x3f
	strb r4, [r0]
.L0808E790:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E798: .4byte gUnknown_08A01B54

	THUMB_FUNC_END StartChapterStatusScreen

	THUMB_FUNC_START func_0808E79C
func_0808E79C: @ 0x0808E79C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0808E7B0  @ gUnknown_08A01C04
	bl SpawnProcLocking
	adds r0, #0x3f
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L0808E7B0: .4byte gUnknown_08A01C04

	THUMB_FUNC_END func_0808E79C

	THUMB_FUNC_START func_0808E7B4
func_0808E7B4: @ 0x0808E7B4
	push {r4, lr}
	adds r4, r0, #0
	bl LoadObjUiGfx
	ldr r0, .L0808E804  @ gUnknown_08A2E4A4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0808E808  @ gUnknown_08A2E8F0
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0808E80C  @ gUnknown_08A2E214
	ldr r1, .L0808E810  @ 0x06016800
	bl Decompress
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	movs r0, #0x80
	movs r1, #0x13
	bl func_080895B4
	movs r4, #0xb8
	lsls r4, r4, #4
	ldr r0, .L0808E814  @ gPlaySt
	bl func_0808979C
	adds r1, r0, #0
	adds r0, r4, #0
	bl LoadChapterTitleGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E804: .4byte gUnknown_08A2E4A4
.L0808E808: .4byte gUnknown_08A2E8F0
.L0808E80C: .4byte gUnknown_08A2E214
.L0808E810: .4byte 0x06016800
.L0808E814: .4byte gPlaySt

	THUMB_FUNC_END func_0808E7B4

	THUMB_FUNC_START func_0808E818
func_0808E818: @ 0x0808E818
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r7, [r0, #0x14]
	ldr r3, .L0808E990  @ gUnknown_08A01B18
	ldr r0, .L0808E994  @ 0x00008580
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #3
	bl PutSprite
	ldr r3, .L0808E998  @ gUnknown_08A01B2C
	ldr r0, .L0808E99C  @ 0x00009580
	str r0, [sp]
	movs r0, #4
	movs r1, #0x96
	movs r2, #0x7c
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808E862
	ldr r3, .L0808E9A0  @ gUnknown_08A01C7C
	movs r0, #0xde
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #0xb
	bl PutSprite
.L0808E862:
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	ldr r3, .L0808E9A4  @ gUnknown_08A01AE6
	movs r0, #0xeb
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r2, #0x2c
	bl PutSprite
	ldr r3, .L0808E9A8  @ gUnknown_08A01AAC
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x25
	bl PutSprite
	ldr r3, .L0808E9AC  @ gUnknown_08A01ABA
	str r4, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x25
	bl PutSprite
	ldr r3, .L0808E9B0  @ gUnknown_08A01AD6
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x73
	bl PutSprite
	ldr r3, .L0808E9B4  @ gUnknown_08A01ADE
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x83
	bl PutSprite
	ldr r3, .L0808E9B8  @ gUnknown_08A01AC8
	str r4, [sp]
	movs r0, #4
	movs r1, #0x1c
	movs r2, #0x43
	bl PutSprite
	mov r8, r5
	movs r0, #0x34
	adds r0, r0, r7
	mov r9, r0
	movs r1, #0x2b
	adds r1, r1, r7
	mov sl, r1
	ldr r6, .L0808E9BC  @ 0x0000A3C0
	movs r5, #0xa0
	movs r4, #1
.L0808E8DA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x3c
	ldr r3, .L0808E9C0  @ Sprite_32x16
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge .L0808E8DA
	ldr r3, .L0808E9C0  @ Sprite_32x16
	ldr r0, .L0808E9C4  @ 0x0000A3D0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb4
	movs r2, #0x4b
	bl PutSprite
	ldr r6, .L0808E9C8  @ 0x0000A3D4
	movs r5, #0x9c
	movs r4, #1
.L0808E908:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x5b
	ldr r3, .L0808E9C0  @ Sprite_32x16
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge .L0808E908
	ldr r4, .L0808E9CC  @ gBg0Tm+0x426
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl PutTime
	movs r0, #1
	bl EnableBgSync
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, r9
	ldr r3, [r0]
	cmp r3, #0
	beq .L0808E950
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x3d
	bl PutUnitSprite
.L0808E950:
	bl SyncUnitSpriteSheet
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0808E97A
	ldr r0, .L0808E9D0  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne .L0808E97A
	ldr r3, .L0808E9D4  @ gUnknown_08A01AA4
	str r0, [sp]
	movs r0, #4
	movs r1, #0xdb
	movs r2, #3
	bl PutSprite
.L0808E97A:
	adds r0, r7, #0
	bl func_0808DE38
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808E990: .4byte gUnknown_08A01B18
.L0808E994: .4byte 0x00008580
.L0808E998: .4byte gUnknown_08A01B2C
.L0808E99C: .4byte 0x00009580
.L0808E9A0: .4byte gUnknown_08A01C7C
.L0808E9A4: .4byte gUnknown_08A01AE6
.L0808E9A8: .4byte gUnknown_08A01AAC
.L0808E9AC: .4byte gUnknown_08A01ABA
.L0808E9B0: .4byte gUnknown_08A01AD6
.L0808E9B4: .4byte gUnknown_08A01ADE
.L0808E9B8: .4byte gUnknown_08A01AC8
.L0808E9BC: .4byte 0x0000A3C0
.L0808E9C0: .4byte Sprite_32x16
.L0808E9C4: .4byte 0x0000A3D0
.L0808E9C8: .4byte 0x0000A3D4
.L0808E9CC: .4byte gBg0Tm+0x426
.L0808E9D0: .4byte gPlaySt
.L0808E9D4: .4byte gUnknown_08A01AA4

	THUMB_FUNC_END func_0808E818

	THUMB_FUNC_START func_0808E9D8
func_0808E9D8: @ 0x0808E9D8
	ldr r3, .L0808E9E8  @ gUnknown_0203E82C
	lsls r0, r0, #0xa
	ldr r1, [r3, #0x48]
	ldr r2, .L0808E9EC  @ 0x000003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #0x48]
	bx lr
	.align 2, 0
.L0808E9E8: .4byte gUnknown_0203E82C
.L0808E9EC: .4byte 0x000003FF

	THUMB_FUNC_END func_0808E9D8

	THUMB_FUNC_START func_0808E9F0
func_0808E9F0: @ 0x0808E9F0
	push {r4, lr}
	ldr r4, .L0808EA10  @ gUnknown_0203E82C
	ldr r3, [r4, #0x48]
	lsrs r2, r3, #0xa
	ldr r1, .L0808EA14  @ 0x003FFFFF
	ands r1, r0
	orrs r2, r1
	lsls r2, r2, #0xa
	ldr r0, .L0808EA18  @ 0x000003FF
	ands r0, r3
	orrs r0, r2
	str r0, [r4, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808EA10: .4byte gUnknown_0203E82C
.L0808EA14: .4byte 0x003FFFFF
.L0808EA18: .4byte 0x000003FF

	THUMB_FUNC_END func_0808E9F0

	THUMB_FUNC_START func_0808EA1C
func_0808EA1C: @ 0x0808EA1C
	push {r4, lr}
	adds r4, r0, #0
	bl func_0808EA3C
	adds r1, r0, #0
	ldr r0, .L0808EA38  @ 0x003FFFFF
	eors r0, r4
	ands r0, r1
	bl func_0808E9D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808EA38: .4byte 0x003FFFFF

	THUMB_FUNC_END func_0808EA1C

	THUMB_FUNC_START func_0808EA3C
func_0808EA3C: @ 0x0808EA3C
	ldr r0, .L0808EA44  @ gUnknown_0203E82C
	ldr r0, [r0, #0x48]
	lsrs r0, r0, #0xa
	bx lr
	.align 2, 0
.L0808EA44: .4byte gUnknown_0203E82C

	THUMB_FUNC_END func_0808EA3C

	THUMB_FUNC_START func_0808EA48
func_0808EA48: @ 0x0808EA48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x20
	orrs r1, r2
	ldr r2, .L0808EA64  @ gUnknown_0203E82C
	lsls r1, r1, #8
	adds r1, #0x40
	adds r0, r0, r1
	adds r2, #0x4c
	strh r0, [r2]
	bx lr
	.align 2, 0
.L0808EA64: .4byte gUnknown_0203E82C

	THUMB_FUNC_END func_0808EA48

	THUMB_FUNC_START func_0808EA68
func_0808EA68: @ 0x0808EA68
	ldr r0, .L0808EA70  @ gUnknown_0203E82C
	adds r0, #0x4c
	ldrh r0, [r0]
	bx lr
	.align 2, 0
.L0808EA70: .4byte gUnknown_0203E82C

	THUMB_FUNC_END func_0808EA68

	THUMB_FUNC_START func_0808EA74
func_0808EA74: @ 0x0808EA74
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, .L0808EA88  @ gUnknown_0203E82C
	lsrs r1, r1, #8
	adds r0, r0, r1
	adds r2, #0x4e
	strh r0, [r2]
	bx lr
	.align 2, 0
.L0808EA88: .4byte gUnknown_0203E82C

	THUMB_FUNC_END func_0808EA74

	THUMB_FUNC_START func_0808EA8C
func_0808EA8C: @ 0x0808EA8C
	ldr r0, .L0808EA94  @ gUnknown_0203E82C
	adds r0, #0x4e
	ldrh r0, [r0]
	bx lr
	.align 2, 0
.L0808EA94: .4byte gUnknown_0203E82C

	THUMB_FUNC_END func_0808EA8C

	THUMB_FUNC_START func_0808EA98
func_0808EA98: @ 0x0808EA98
	push {r4, r5, lr}
	ldr r0, .L0808EAF8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa0
	bls .L0808EAAA
	movs r4, #0
.L0808EAAA:
	ldr r0, .L0808EAFC  @ gUnknown_0203E82C
	adds r5, r0, #0
	adds r5, #0x48
	ldrb r0, [r5]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	subs r0, #0x20
	cmp r4, r0
	bne .L0808EACC
	bl func_0808EA68
	ldr r1, .L0808EB00  @ 0x04000050
	strh r0, [r1]
	bl func_0808EA8C
	ldr r1, .L0808EB04  @ 0x04000052
	strh r0, [r1]
.L0808EACC:
	cmp r4, #0
	beq .L0808EADE
	ldrh r0, [r5]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	lsls r0, r0, #3
	adds r0, #4
	cmp r4, r0
	bne .L0808EAF2
.L0808EADE:
	ldr r1, .L0808EB00  @ 0x04000050
	ldr r2, .L0808EB08  @ gDispIo+0x3C
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r3, .L0808EB04  @ 0x04000052
	ldrb r1, [r2, #8]
	ldrb r0, [r2, #9]
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r3]
.L0808EAF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808EAF8: .4byte 0x04000006
.L0808EAFC: .4byte gUnknown_0203E82C
.L0808EB00: .4byte 0x04000050
.L0808EB04: .4byte 0x04000052
.L0808EB08: .4byte gDispIo+0x3C

	THUMB_FUNC_END func_0808EA98

	THUMB_FUNC_START func_0808EB0C
func_0808EB0C: @ 0x0808EB0C
	push {r4, r5, lr}
	sub sp, #0x40
	adds r3, r0, #0
	add r2, sp, #0x18
	ldr r1, [r3, #0x2c]
	ldrb r0, [r1]
	adds r5, r2, #0
	cmp r0, #0x80
	bne .L0808EBB6
	ldrb r0, [r1, #1]
	cmp r0, #0x23
	bne .L0808EBB6
	adds r0, r1, #2
	str r0, [r3, #0x2c]
	ldrb r0, [r1, #2]
	add r4, sp, #0x38
	cmp r0, #1
	beq .L0808EB46
.L0808EB30:
	ldr r1, [r3, #0x2c]
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1, #1]
	strb r0, [r2, #1]
	adds r0, r1, #2
	str r0, [r3, #0x2c]
	adds r2, #2
	ldrb r0, [r1, #2]
	cmp r0, #1
	bne .L0808EB30
.L0808EB46:
	ldr r0, [r3, #0x2c]
	adds r0, #1
	str r0, [r3, #0x2c]
	movs r0, #0
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #9
	bl func_0808E9F0
	ldr r1, .L0808EBC0  @ 0x06017800
	mov r0, sp
	movs r2, #0x12
	bl InitSpriteTextFont
	mov r0, sp
	bl SetTextFont
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	ldr r0, .L0808EBC4  @ Pal_SystemText
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0808EBC8  @ gUnknown_085A643C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0808EBCC  @ gUnknown_085A638C
	ldr r1, .L0808EBD0  @ 0x06017900
	bl Decompress
.L0808EBB6:
	add sp, #0x40
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808EBC0: .4byte 0x06017800
.L0808EBC4: .4byte Pal_SystemText
.L0808EBC8: .4byte gUnknown_085A643C
.L0808EBCC: .4byte gUnknown_085A638C
.L0808EBD0: .4byte 0x06017900

	THUMB_FUNC_END func_0808EB0C

	THUMB_FUNC_START func_0808EBD4
func_0808EBD4: @ 0x0808EBD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bl func_0808EA3C
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq .L0808EC0E
	bl func_0808EA3C
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	subs r0, #1
	b .L0808EC12
.L0808EC0E:
	bl GetTextPrintDelay
.L0808EC12:
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r2, #0x7f
	cmp r0, #0
	beq .L0808EC24
	movs r2, #1
.L0808EC24:
	adds r0, r6, #0
	adds r0, #0x53
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	adds r0, r6, #0
	bl func_0808EB0C
	adds r0, r6, #0
	adds r0, #0x5b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	movs r0, #0x5c
	adds r0, r0, r6
	mov r9, r0
	cmp r1, #0
	blt .L0808EC58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L0808EC8A
.L0808EC58:
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r6, #0x2c]
	add r2, sp, #8
	add r1, sp, #4
	bl func_0808F428
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp, #4]
	adds r0, r1, #7
	cmp r0, #0
	bge .L0808EC78
	adds r0, #7
.L0808EC78:
	asrs r0, r0, #3
	strb r0, [r7]
	ldr r0, [sp, #8]
	cmp r0, #0
	bge .L0808EC84
	adds r0, #7
.L0808EC84:
	asrs r0, r0, #3
	mov r1, r9
	strb r0, [r1]
.L0808EC8A:
	bl func_0808EA3C
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808EC98
	b .L0808EDE6
.L0808EC98:
	movs r2, #0x58
	adds r2, r2, r6
	mov r8, r2
	mov r3, r9
	movs r0, #0
	ldrsb r0, [r3, r0]
	mvns r0, r0
	ldrb r1, [r2]
	adds r0, r0, r1
	str r0, [sp, #0x10]
	bl func_0808EA3C
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq .L0808ED38
	adds r5, r6, #0
	adds r5, #0x57
	ldrb r0, [r5]
	movs r1, #0
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	subs r0, #2
	str r0, [sp, #0xc]
	bl func_0808EA3C
	movs r2, #0xc0
	lsls r2, r2, #8
	mov sl, r2
	ands r0, r2
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	movs r3, #0
	ldrsb r3, [r7, r3]
	subs r1, r1, r3
	subs r1, #2
	mov ip, r1
	mov r7, r9
	movs r4, #0
	ldrsb r4, [r7, r4]
	mvns r2, r4
	mov r1, r8
	ldrb r1, [r1]
	adds r2, r2, r1
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	mov r1, ip
	bl func_08008668
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L0808EDAA
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #3
	cmp r1, #0
	beq .L0808ED1C
	movs r4, #5
.L0808ED1C:
	bl func_0808EA3C
	mov r2, sl
	ands r0, r2
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	subs r1, #1
	mov r3, r8
	ldrb r2, [r3]
	subs r2, #2
	adds r3, r4, #0
	bl func_080084E0
	b .L0808EDAA
.L0808ED38:
	adds r5, r6, #0
	adds r5, #0x57
	ldrb r0, [r5]
	adds r0, #1
	str r0, [sp, #0xc]
	bl func_0808EA3C
	movs r1, #0xc0
	lsls r1, r1, #8
	mov sl, r1
	ands r0, r1
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	adds r1, #1
	mov ip, r1
	mov r2, r9
	movs r4, #0
	ldrsb r4, [r2, r4]
	mvns r2, r4
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r2, r3
	movs r3, #0
	ldrsb r3, [r7, r3]
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl func_08008668
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L0808EDAA
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #2
	cmp r1, #0
	beq .L0808ED92
	movs r4, #5
.L0808ED92:
	bl func_0808EA3C
	mov r7, sl
	ands r0, r7
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	mov r3, r8
	ldrb r2, [r3]
	subs r2, #2
	adds r3, r4, #0
	bl func_080084E0
.L0808EDAA:
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq .L0808EDE0
	bl func_0808EA3C
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	ldr r7, [sp, #0x10]
	lsls r1, r7, #6
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r1, #6
	movs r2, #0
	movs r3, #0
	bl TmFillRect_thm
.L0808EDE0:
	movs r0, #0xf
	bl EnableBgSync
.L0808EDE6:
	adds r0, r6, #0
	bl func_0808F3D8
	ldr r0, .L0808EE5C  @ func_0808F5C8
	adds r1, r6, #0
	bl StartParallelWorker
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	mov r3, r9
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r5, #0
	cmp r0, #0
	blt .L0808EE38
.L0808EE10:
	lsls r0, r5, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r4, r4, r0
	ldr r0, [r4]
	bl InitSpriteText
	ldr r0, [r4]
	movs r1, #0xb
	bl Text_SetColor
	adds r5, #1
	mov r7, r9
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	ble .L0808EE10
.L0808EE38:
	adds r0, r6, #0
	bl func_0808F2BC
	movs r0, #0
	bl SetTextFont
	bl func_0808EA3C
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808EE60
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b .L0808EF30
	.align 2, 0
.L0808EE5C: .4byte func_0808F5C8
.L0808EE60:
	bl func_0808EA3C
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq .L0808EE7E
	movs r0, #0x10
	movs r1, #1
	bl func_0808EA74
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b .L0808EE86
.L0808EE7E:
	movs r0, #0
	movs r1, #0x10
	bl func_0808EA74
.L0808EE86:
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq .L0808EEA4
	ldr r5, .L0808EEA0  @ gUnknown_0203E82C
	adds r4, r6, #0
	adds r4, #0x58
	ldrb r1, [r4]
	subs r1, #5
	b .L0808EEAE
	.align 2, 0
.L0808EEA0: .4byte gUnknown_0203E82C
.L0808EEA4:
	ldr r5, .L0808EF58  @ gUnknown_0203E82C
	adds r4, r6, #0
	adds r4, #0x58
	ldrb r1, [r4]
	subs r1, #1
.L0808EEAE:
	adds r3, r5, #0
	adds r3, #0x48
	movs r0, #0x1f
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r0, r9
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrb r4, [r4]
	adds r1, r1, r4
	adds r1, #1
	adds r3, r5, #0
	adds r3, #0x48
	movs r2, #0x1f
	mov r8, r2
	mov r7, r8
	ands r1, r7
	lsls r1, r1, #5
	ldrh r2, [r3]
	ldr r0, .L0808EF5C  @ 0xFFFFFC1F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	bl func_0808EA3C
	movs r6, #0xc0
	lsls r6, r6, #8
	ands r0, r6
	lsrs r0, r0, #0xe
	movs r4, #1
	adds r5, r4, #0
	lsls r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl func_0808EA3C
	ands r0, r6
	lsrs r0, r0, #0xe
	lsls r4, r0
	mov r0, r8
	eors r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_0808EA48
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne .L0808EF30
	movs r0, #0
	bl SetOnHBlankB
	ldr r0, .L0808EF60  @ func_0808EA98
	bl SetOnHBlankB
.L0808EF30:
	bl func_0808EA3C
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808EF58: .4byte gUnknown_0203E82C
.L0808EF5C: .4byte 0xFFFFFC1F
.L0808EF60: .4byte func_0808EA98

	THUMB_FUNC_END func_0808EBD4

	THUMB_FUNC_START func_0808EF64
func_0808EF64: @ 0x0808EF64
	adds r0, #0x56
	movs r1, #0
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END func_0808EF64

	THUMB_FUNC_START func_0808EF6C
func_0808EF6C: @ 0x0808EF6C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq .L0808EF8A
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b .L0808EF8C
.L0808EF8A:
	movs r1, #1
.L0808EF8C:
	adds r0, r2, #0
	bl func_0808EA74
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne .L0808EFA2
	adds r0, r4, #0
	bl Proc_Break
.L0808EFA2:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808EF6C

	THUMB_FUNC_START func_0808EFA8
func_0808EFA8: @ 0x0808EFA8
	push {r4, lr}
	adds r4, r0, #0
	bl func_0808F2BC
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	bl func_0808FFE8
	bl func_0808EA3C
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808EFDC
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b .L0808EFE4
.L0808EFDC:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0x10
	strb r0, [r1]
.L0808EFE4:
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq .L0808EFFC
	ldr r0, .L0808F004  @ ProcScr_Face
	bl FindProc
	bl StartFaceFadeOut
.L0808EFFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808F004: .4byte ProcScr_Face

	THUMB_FUNC_END func_0808EFA8

	THUMB_FUNC_START func_0808F008
func_0808F008: @ 0x0808F008
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq .L0808F026
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b .L0808F028
.L0808F026:
	movs r1, #1
.L0808F028:
	adds r0, r2, #0
	bl func_0808EA74
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0808F046
	movs r0, #0x80
	lsls r0, r0, #9
	bl func_0808EA1C
	adds r0, r4, #0
	bl Proc_Break
.L0808F046:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F008

	THUMB_FUNC_START func_0808F04C
func_0808F04C: @ 0x0808F04C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0808F080  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq .L0808F07A
	bl func_0808EA3C
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne .L0808F07A
	bl func_0800D3E4
	bl func_0808FFE8
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
.L0808F07A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0808F080: .4byte gKeySt

	THUMB_FUNC_END func_0808F04C

	THUMB_FUNC_START func_0808F084
func_0808F084: @ 0x0808F084
	push {r4, lr}
	adds r4, r0, #0
	bl func_0808EA3C
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r1, [r1]
	subs r1, #1
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r4, #0x5c
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, #1
	movs r1, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xf
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F084

	THUMB_FUNC_START func_0808F0C4
func_0808F0C4: @ 0x0808F0C4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
	adds r0, r4, #0
	bl func_0808F084
	movs r0, #0
	bl SetOnHBlankB
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F0C4

	THUMB_FUNC_START func_0808F0EC
func_0808F0EC: @ 0x0808F0EC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl func_0808F2BC
	adds r0, r5, #0
	adds r0, #0x54
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	bl SetTextFontGlyphs
	adds r1, r5, #0
	adds r1, #0x59
	strb r4, [r1]
	adds r2, r5, #0
	adds r2, #0x5a
	strb r4, [r2]
	ldr r0, [r5, #0x2c]
	bl func_0808F358
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl func_0808FFC4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F0EC

	THUMB_FUNC_START func_0808F128
func_0808F128: @ 0x0808F128
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r7, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, .L0808F17C  @ gUnknown_08A01DBC
	adds r0, r6, #0
	bl FindProc
	adds r4, r0, #0
	cmp r4, #0
	beq .L0808F18A
	ldr r0, [sp, #0x2c]
	bl GetMsg
	str r0, [r4, #0x2c]
	bl func_0808F5A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808F166
	bl StrExpandNames
	str r0, [r4, #0x2c]
.L0808F166:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne .L0808F180
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b .L0808F254
	.align 2, 0
.L0808F17C: .4byte gUnknown_08A01DBC
.L0808F180:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b .L0808F254
.L0808F18A:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq .L0808F19A
	adds r0, r6, #0
	ldr r1, [sp, #0x38]
	bl SpawnProcLocking
	b .L0808F1A2
.L0808F19A:
	adds r0, r6, #0
	movs r1, #3
	bl SpawnProc
.L0808F1A2:
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	bl func_0808E9D8
	bl ClearTalkFlags
	ldr r0, .L0808F264  @ gUnknown_0203E82C
	str r0, [r4, #0x30]
	adds r3, r4, #0
	adds r3, #0x57
	adds r6, r4, #0
	adds r6, #0x58
	movs r1, #0x5b
	adds r1, r1, r4
	mov ip, r1
	movs r1, #0x5c
	adds r1, r1, r4
	mov r8, r1
	movs r1, #0x50
	adds r1, r1, r4
	mov r9, r1
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, #0x40
	adds r1, r4, #0
	adds r1, #0x48
.L0808F1D8:
	str r0, [r1]
	subs r0, #8
	subs r1, #4
	cmp r1, r2
	bge .L0808F1D8
	mov r0, sl
	strb r0, [r3]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r6]
	mov r0, sp
	ldrb r1, [r0, #4]
	mov r0, ip
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #8]
	mov r0, r8
	strb r1, [r0]
	str r7, [r4, #0x4c]
	cmp r5, #0
	bge .L0808F204
	movs r5, #5
.L0808F204:
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	cmp r7, #0
	bne .L0808F214
	ldr r7, .L0808F268  @ 0x06013000
.L0808F214:
	ldr r0, [r4, #0x30]
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFont
	ldr r0, .L0808F26C  @ gUnknown_0859EF60
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r6
	lsls r1, r5, #0xc
	adds r0, r0, r1
	mov r1, r9
	strh r0, [r1]
	ldr r0, [sp, #0x2c]
	bl GetMsg
	str r0, [r4, #0x2c]
	bl func_0808F5A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808F254
	bl StrExpandNames
	str r0, [r4, #0x2c]
.L0808F254:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808F264: .4byte gUnknown_0203E82C
.L0808F268: .4byte 0x06013000
.L0808F26C: .4byte gUnknown_0859EF60

	THUMB_FUNC_END func_0808F128

	THUMB_FUNC_START func_0808F270
func_0808F270: @ 0x0808F270
	push {lr}
	ldr r0, .L0808F280  @ gUnknown_08A01DBC
	bl FindProc
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0808F280: .4byte gUnknown_08A01DBC

	THUMB_FUNC_END func_0808F270

	THUMB_FUNC_START func_0808F284
func_0808F284: @ 0x0808F284
	push {lr}
	ldr r0, .L0808F294  @ gUnknown_08A01DBC
	bl FindProc
	cmp r0, #0
	bne .L0808F298
	movs r0, #0
	b .L0808F29A
	.align 2, 0
.L0808F294: .4byte gUnknown_08A01DBC
.L0808F298:
	movs r0, #1
.L0808F29A:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808F284

	THUMB_FUNC_START func_0808F2A0
func_0808F2A0: @ 0x0808F2A0
	push {lr}
	ldr r0, .L0808F2B8  @ gUnknown_08A01DBC
	bl FindProc
	cmp r0, #0
	beq .L0808F2B2
	movs r1, #0
	bl Proc_Goto
.L0808F2B2:
	pop {r0}
	bx r0
	.align 2, 0
.L0808F2B8: .4byte gUnknown_08A01DBC

	THUMB_FUNC_END func_0808F2A0

	THUMB_FUNC_START func_0808F2BC
func_0808F2BC: @ 0x0808F2BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt .L0808F300
.L0808F2DA:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble .L0808F2DA
.L0808F300:
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F2BC

	THUMB_FUNC_START func_0808F30C
func_0808F30C: @ 0x0808F30C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetTextFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt .L0808F350
.L0808F32A:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl Text_SetCursor
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble .L0808F32A
.L0808F350:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F30C

	THUMB_FUNC_START func_0808F358
func_0808F358: @ 0x0808F358
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r6, #0
	ldrb r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
.L0808F370:
	ldrb r0, [r4]
	cmp r0, #7
	bgt .L0808F392
	cmp r0, #4
	bge .L0808F3A4
	cmp r0, #1
	beq .L0808F3A8
	cmp r0, #1
	bgt .L0808F388
	cmp r0, #0
	beq .L0808F3C4
	b .L0808F3B4
.L0808F388:
	cmp r0, #2
	beq .L0808F3A4
	cmp r0, #3
	beq .L0808F3C4
	b .L0808F3B4
.L0808F392:
	cmp r0, #0x19
	ble .L0808F39C
	cmp r0, #0x80
	beq .L0808F3B0
	b .L0808F3B4
.L0808F39C:
	cmp r0, #0x18
	bge .L0808F3C4
	cmp r0, #0x16
	blt .L0808F3B4
.L0808F3A4:
	adds r4, #1
	b .L0808F370
.L0808F3A8:
	adds r4, #1
	adds r5, #0x10
	movs r6, #0
	b .L0808F370
.L0808F3B0:
	adds r4, #2
	b .L0808F370
.L0808F3B4:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r6, r6, r0
	b .L0808F370
.L0808F3C4:
	mov r0, r8
	strb r6, [r0]
	strb r5, [r7]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F358

	THUMB_FUNC_START func_0808F3D8
func_0808F3D8: @ 0x0808F3D8
	push {r4, lr}
	adds r4, r0, #0
	bl func_0808EA3C
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne .L0808F420
	bl func_0808EA3C
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq .L0808F406
	adds r1, r4, #0
	adds r1, #0x57
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r0, [r0]
	mvns r0, r0
	ldrb r2, [r1]
	adds r0, r0, r2
	b .L0808F40E
.L0808F406:
	adds r1, r4, #0
	adds r1, #0x57
	ldrb r0, [r1]
	adds r0, #2
.L0808F40E:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x58
	adds r1, r4, #0
	adds r1, #0x5c
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r0, r1
	strb r0, [r2]
.L0808F420:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F3D8

	THUMB_FUNC_START func_0808F428
func_0808F428: @ 0x0808F428
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r5, #0
	movs r6, #0x10
	str r5, [r1]
	str r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
.L0808F444:
	ldrb r2, [r4]
	cmp r2, #0x19
	bhi .L0808F4D0
	lsls r0, r2, #2
	ldr r1, .L0808F454  @ .L0808F458
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808F454: .4byte .L0808F458
.L0808F458: @ jump table
	.4byte .L0808F4C2 @ case 0
	.4byte .L0808F4C2 @ case 1
	.4byte .L0808F4C2 @ case 2
	.4byte .L0808F4C0 @ case 3
	.4byte .L0808F4D0 @ case 4
	.4byte .L0808F4D0 @ case 5
	.4byte .L0808F4D0 @ case 6
	.4byte .L0808F4D0 @ case 7
	.4byte .L0808F4D0 @ case 8
	.4byte .L0808F4D0 @ case 9
	.4byte .L0808F4D0 @ case 10
	.4byte .L0808F4D0 @ case 11
	.4byte .L0808F4D0 @ case 12
	.4byte .L0808F4D0 @ case 13
	.4byte .L0808F4D0 @ case 14
	.4byte .L0808F4D0 @ case 15
	.4byte .L0808F4D0 @ case 16
	.4byte .L0808F4D0 @ case 17
	.4byte .L0808F4D0 @ case 18
	.4byte .L0808F4D0 @ case 19
	.4byte .L0808F4D0 @ case 20
	.4byte .L0808F4D0 @ case 21
	.4byte .L0808F4D0 @ case 22
	.4byte .L0808F4D0 @ case 23
	.4byte .L0808F4C2 @ case 24
	.4byte .L0808F4C2 @ case 25
.L0808F4C0:
	adds r5, #8
.L0808F4C2:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r5
	bge .L0808F4CC
	str r5, [r1]
.L0808F4CC:
	movs r5, #0
	ldrb r2, [r4]
.L0808F4D0:
	cmp r2, #0x19
	bhi .L0808F55C
	lsls r0, r2, #2
	ldr r1, .L0808F4E0  @ .L0808F4E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808F4E0: .4byte .L0808F4E4
.L0808F4E4: @ jump table
	.4byte .L0808F550 @ case 0
	.4byte .L0808F54C @ case 1
	.4byte .L0808F550 @ case 2
	.4byte .L0808F55C @ case 3
	.4byte .L0808F55C @ case 4
	.4byte .L0808F55C @ case 5
	.4byte .L0808F55C @ case 6
	.4byte .L0808F55C @ case 7
	.4byte .L0808F55C @ case 8
	.4byte .L0808F55C @ case 9
	.4byte .L0808F55C @ case 10
	.4byte .L0808F55C @ case 11
	.4byte .L0808F55C @ case 12
	.4byte .L0808F55C @ case 13
	.4byte .L0808F55C @ case 14
	.4byte .L0808F55C @ case 15
	.4byte .L0808F55C @ case 16
	.4byte .L0808F55C @ case 17
	.4byte .L0808F55C @ case 18
	.4byte .L0808F55C @ case 19
	.4byte .L0808F55C @ case 20
	.4byte .L0808F55C @ case 21
	.4byte .L0808F55C @ case 22
	.4byte .L0808F55C @ case 23
	.4byte .L0808F54C @ case 24
	.4byte .L0808F54C @ case 25
.L0808F54C:
	adds r6, #0x10
	b .L0808F55C
.L0808F550:
	ldr r0, [r7]
	cmp r0, r6
	bge .L0808F558
	str r6, [r7]
.L0808F558:
	movs r6, #0
	ldrb r2, [r4]
.L0808F55C:
	adds r0, r2, #0
	cmp r0, #7
	bgt .L0808F56C
	cmp r0, #1
	bge .L0808F57A
	cmp r0, #0
	beq .L0808F592
	b .L0808F582
.L0808F56C:
	cmp r2, #0x16
	blt .L0808F582
	cmp r2, #0x19
	ble .L0808F57A
	cmp r2, #0x80
	beq .L0808F57E
	b .L0808F582
.L0808F57A:
	adds r4, #1
	b .L0808F444
.L0808F57E:
	adds r4, #2
	b .L0808F444
.L0808F582:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b .L0808F444
.L0808F592:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F428

	THUMB_FUNC_START func_0808F5A0
func_0808F5A0: @ 0x0808F5A0
	push {lr}
	adds r1, r0, #0
.L0808F5A4:
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0808F5B0
	cmp r0, #0x80
	beq .L0808F5B4
	b .L0808F5C0
.L0808F5B0:
	movs r0, #0
	b .L0808F5C4
.L0808F5B4:
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0x20
	bne .L0808F5C0
	movs r0, #1
	b .L0808F5C4
.L0808F5C0:
	adds r1, #1
	b .L0808F5A4
.L0808F5C4:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808F5A0

	THUMB_FUNC_START func_0808F5C8
func_0808F5C8: @ 0x0808F5C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r6, r0, #3
	mov r0, r8
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r7, r0, #3
	movs r0, #0
	mov r9, r0
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	negs r1, r1
	asrs r1, r1, #0x1f
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	str r1, [sp, #4]
	bl func_0808EA3C
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq .L0808F638
	cmp r1, r0
	bhi .L0808F61C
	cmp r1, #0
	beq .L0808F62A
	b .L0808F662
.L0808F61C:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq .L0808F648
	cmp r1, r2
	beq .L0808F658
	b .L0808F662
.L0808F62A:
	ldr r0, .L0808F634  @ gDispIo
	ldrh r1, [r0, #0x1c]
	subs r6, r6, r1
	ldrh r0, [r0, #0x1e]
	b .L0808F660
	.align 2, 0
.L0808F634: .4byte gDispIo
.L0808F638:
	ldr r0, .L0808F644  @ gDispIo
	ldrh r1, [r0, #0x20]
	subs r6, r6, r1
	ldrh r0, [r0, #0x22]
	b .L0808F660
	.align 2, 0
.L0808F644: .4byte gDispIo
.L0808F648:
	ldr r0, .L0808F654  @ gDispIo
	ldrh r1, [r0, #0x24]
	subs r6, r6, r1
	ldrh r0, [r0, #0x26]
	b .L0808F660
	.align 2, 0
.L0808F654: .4byte gDispIo
.L0808F658:
	ldr r0, .L0808F6D0  @ gDispIo
	ldrh r1, [r0, #0x28]
	subs r6, r6, r1
	ldrh r0, [r0, #0x2a]
.L0808F660:
	subs r7, r7, r0
.L0808F662:
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq .L0808F6A6
	adds r1, r6, #0
	subs r1, #0x10
	ldr r5, .L0808F6D4  @ 0x000001FF
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	movs r4, #0xff
	ands r2, r4
	ldr r3, .L0808F6D8  @ gUnknown_08A01D88
	ldr r0, .L0808F6DC  @ 0x000013C8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	adds r1, r6, #0
	subs r1, #8
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x14
	ands r2, r4
	ldr r3, .L0808F6E0  @ gUnknown_08A01DAE
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
.L0808F6A6:
	movs r4, #0
	mov r0, r8
	adds r0, #0x5c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	str r0, [sp, #0xc]
	movs r2, #0x50
	add r2, r8
	mov sl, r2
	movs r3, #0x5b
	add r8, r3
	cmp r4, r1
	bge .L0808F73A
.L0808F6C6:
	movs r5, #0
	mov r9, r5
	adds r0, r4, #1
	str r0, [sp, #0x10]
	b .L0808F716
	.align 2, 0
.L0808F6D0: .4byte gDispIo
.L0808F6D4: .4byte 0x000001FF
.L0808F6D8: .4byte gUnknown_08A01D88
.L0808F6DC: .4byte 0x000013C8
.L0808F6E0: .4byte gUnknown_08A01DAE
.L0808F6E4:
	mov r2, r9
	lsls r1, r2, #5
	adds r1, r6, r1
	ldr r0, .L0808F768  @ 0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	mov r3, r9
	lsls r0, r3, #2
	mov r5, sl
	ldrh r5, [r5]
	adds r0, r0, r5
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, .L0808F76C  @ Sprite_32x16
	bl PutSpriteExt
	movs r5, #1
	add r9, r5
.L0808F716:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge .L0808F722
	adds r0, #3
.L0808F722:
	asrs r0, r0, #2
	cmp r9, r0
	blt .L0808F6E4
	ldr r4, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt .L0808F6C6
.L0808F73A:
	mov r3, r8
	ldrb r0, [r3]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq .L0808F7DA
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge .L0808F752
	adds r0, r1, #3
.L0808F752:
	asrs r0, r0, #2
	lsls r4, r0, #2
	str r4, [sp, #8]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r4, #0
	ldr r5, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r5, r0]
	b .L0808F7D0
	.align 2, 0
.L0808F768: .4byte 0x000001FF
.L0808F76C: .4byte Sprite_32x16
.L0808F770:
	movs r0, #0
	mov r9, r0
	adds r1, r4, #1
	str r1, [sp, #0x10]
	b .L0808F7AC
.L0808F77A:
	mov r2, r9
	lsls r1, r2, #3
	adds r1, r6, r1
	ldr r0, .L0808F818  @ 0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	mov r3, sl
	ldrh r0, [r3]
	ldr r5, [sp, #8]
	adds r0, r0, r5
	add r0, r9
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, .L0808F81C  @ Sprite_8x16
	bl PutSpriteExt
	movs r5, #1
	add r9, r5
.L0808F7AC:
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge .L0808F7BA
	adds r0, r1, #3
.L0808F7BA:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r9, r0
	blt .L0808F77A
	ldr r4, [sp, #0x10]
	ldr r1, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r1, r0]
.L0808F7D0:
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt .L0808F770
.L0808F7DA:
	mov r2, r9
	lsls r1, r2, #5
	adds r1, r6, r1
	ldr r0, .L0808F818  @ 0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	ldr r3, .L0808F820  @ Sprite_32x16
	mov r5, r9
	lsls r0, r5, #2
	mov r6, sl
	ldrh r6, [r6]
	adds r0, r0, r6
	lsls r4, r4, #6
	adds r0, r0, r4
	ldr r4, [sp, #4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0808F818: .4byte 0x000001FF
.L0808F81C: .4byte Sprite_8x16
.L0808F820: .4byte Sprite_32x16

	THUMB_FUNC_END func_0808F5C8

	THUMB_FUNC_START func_0808F824
func_0808F824: @ 0x0808F824
	push {lr}
	subs r0, #0x16
	cmp r0, #9
	bhi .L0808F8AC
	lsls r0, r0, #2
	ldr r1, .L0808F838  @ .L0808F83C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808F838: .4byte .L0808F83C
.L0808F83C: @ jump table
	.4byte .L0808F864 @ case 0
	.4byte .L0808F86A @ case 1
	.4byte .L0808F870 @ case 2
	.4byte .L0808F876 @ case 3
	.4byte .L0808F87C @ case 4
	.4byte .L0808F882 @ case 5
	.4byte .L0808F88E @ case 6
	.4byte .L0808F894 @ case 7
	.4byte .L0808F89A @ case 8
	.4byte .L0808F8A0 @ case 9
.L0808F864:
	movs r0, #0
	movs r1, #0
	b .L0808F886
.L0808F86A:
	movs r0, #0
	movs r1, #1
	b .L0808F886
.L0808F870:
	movs r0, #0
	movs r1, #3
	b .L0808F886
.L0808F876:
	movs r0, #0
	movs r1, #2
	b .L0808F886
.L0808F87C:
	movs r0, #0
	movs r1, #4
	b .L0808F886
.L0808F882:
	movs r0, #0
	movs r1, #5
.L0808F886:
	bl SetFaceBlinkControlById
	movs r0, #1
	b .L0808F8AE
.L0808F88E:
	movs r0, #0
	movs r1, #0
	b .L0808F8A4
.L0808F894:
	movs r0, #0
	movs r1, #2
	b .L0808F8A4
.L0808F89A:
	movs r0, #0
	movs r1, #3
	b .L0808F8A4
.L0808F8A0:
	movs r0, #0
	movs r1, #4
.L0808F8A4:
	bl func_080064DC
	movs r0, #1
	b .L0808F8AE
.L0808F8AC:
	movs r0, #0
.L0808F8AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808F824

	THUMB_FUNC_START func_0808F8B4
func_0808F8B4: @ 0x0808F8B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	ldr r0, .L0808F8F0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq .L0808F8F4
	bl func_0808EA3C
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne .L0808F8F4
	movs r0, #0x7f
	mov sl, r0
	b .L0808F90E
	.align 2, 0
.L0808F8F0: .4byte gKeySt
.L0808F8F4:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	ble .L0808F906
	b .L0808FE94
.L0808F906:
	adds r0, r6, #0
	adds r0, #0x52
	ldrb r0, [r0]
	strb r0, [r1]
.L0808F90E:
	ldr r0, [r6, #0x30]
	bl SetTextFont
	ldr r0, .L0808F940  @ gUnknown_03005398
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808F944
	cmp r0, #1
	beq .L0808F95E
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #1
	movs r1, #1
	bl SetFaceBlinkControlById
	b .L0808F990
	.align 2, 0
.L0808F940: .4byte gUnknown_03005398
.L0808F944:
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #1
	b .L0808F976
.L0808F95E:
	movs r0, #1
	bl GetFaceDispById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #1
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #0
.L0808F976:
	movs r1, #1
	bl SetFaceBlinkControlById
	b .L0808F990
.L0808F97E:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b .L0808FE68
.L0808F990:
	movs r0, #0
	mov r9, r0
	cmp r9, sl
	blt .L0808F99A
	b .L0808FE68
.L0808F99A:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls .L0808F9A6
	b .L0808FDEA
.L0808F9A6:
	lsls r0, r1, #2
	ldr r1, .L0808F9B0  @ .L0808F9B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0808F9B0: .4byte .L0808F9B4
.L0808F9B4: @ jump table
	.4byte .L0808FC64 @ case 0
	.4byte .L0808FC92 @ case 1
	.4byte .L0808FD02 @ case 2
	.4byte .L0808FD48 @ case 3
	.4byte .L0808FCBE @ case 4
	.4byte .L0808FCC8 @ case 5
	.4byte .L0808FCD2 @ case 6
	.4byte .L0808FCDC @ case 7
	.4byte .L0808FDEA @ case 8
	.4byte .L0808FDEA @ case 9
	.4byte .L0808FDEA @ case 10
	.4byte .L0808FDEA @ case 11
	.4byte .L0808FDEA @ case 12
	.4byte .L0808FDEA @ case 13
	.4byte .L0808FDEA @ case 14
	.4byte .L0808FDEA @ case 15
	.4byte .L0808FDEA @ case 16
	.4byte .L0808FDEA @ case 17
	.4byte .L0808FDEA @ case 18
	.4byte .L0808FDEA @ case 19
	.4byte .L0808FDEA @ case 20
	.4byte .L0808FDEA @ case 21
	.4byte .L0808FCE6 @ case 22
	.4byte .L0808FCF4 @ case 23
	.4byte .L0808FBB8 @ case 24
	.4byte .L0808FC18 @ case 25
	.4byte .L0808FDEA @ case 26
	.4byte .L0808FDEA @ case 27
	.4byte .L0808FDEA @ case 28
	.4byte .L0808FDEA @ case 29
	.4byte .L0808FDEA @ case 30
	.4byte .L0808FDEA @ case 31
	.4byte .L0808FDEA @ case 32
	.4byte .L0808FDEA @ case 33
	.4byte .L0808FDEA @ case 34
	.4byte .L0808FDEA @ case 35
	.4byte .L0808FDEA @ case 36
	.4byte .L0808FDEA @ case 37
	.4byte .L0808FDEA @ case 38
	.4byte .L0808FDEA @ case 39
	.4byte .L0808FDEA @ case 40
	.4byte .L0808FDEA @ case 41
	.4byte .L0808FDEA @ case 42
	.4byte .L0808FDEA @ case 43
	.4byte .L0808FDEA @ case 44
	.4byte .L0808FDEA @ case 45
	.4byte .L0808FDEA @ case 46
	.4byte .L0808FDEA @ case 47
	.4byte .L0808FDEA @ case 48
	.4byte .L0808FDEA @ case 49
	.4byte .L0808FDEA @ case 50
	.4byte .L0808FDEA @ case 51
	.4byte .L0808FDEA @ case 52
	.4byte .L0808FDEA @ case 53
	.4byte .L0808FDEA @ case 54
	.4byte .L0808FDEA @ case 55
	.4byte .L0808FDEA @ case 56
	.4byte .L0808FDEA @ case 57
	.4byte .L0808FDEA @ case 58
	.4byte .L0808FDEA @ case 59
	.4byte .L0808FDEA @ case 60
	.4byte .L0808FDEA @ case 61
	.4byte .L0808FDEA @ case 62
	.4byte .L0808FDEA @ case 63
	.4byte .L0808FDEA @ case 64
	.4byte .L0808FDEA @ case 65
	.4byte .L0808FDEA @ case 66
	.4byte .L0808FDEA @ case 67
	.4byte .L0808FDEA @ case 68
	.4byte .L0808FDEA @ case 69
	.4byte .L0808FDEA @ case 70
	.4byte .L0808FDEA @ case 71
	.4byte .L0808FDEA @ case 72
	.4byte .L0808FDEA @ case 73
	.4byte .L0808FDEA @ case 74
	.4byte .L0808FDEA @ case 75
	.4byte .L0808FDEA @ case 76
	.4byte .L0808FDEA @ case 77
	.4byte .L0808FDEA @ case 78
	.4byte .L0808FDEA @ case 79
	.4byte .L0808FDEA @ case 80
	.4byte .L0808FDEA @ case 81
	.4byte .L0808FDEA @ case 82
	.4byte .L0808FDEA @ case 83
	.4byte .L0808FDEA @ case 84
	.4byte .L0808FDEA @ case 85
	.4byte .L0808FDEA @ case 86
	.4byte .L0808FDEA @ case 87
	.4byte .L0808FDEA @ case 88
	.4byte .L0808FDEA @ case 89
	.4byte .L0808FDEA @ case 90
	.4byte .L0808FDEA @ case 91
	.4byte .L0808FDEA @ case 92
	.4byte .L0808FDEA @ case 93
	.4byte .L0808FDEA @ case 94
	.4byte .L0808FDEA @ case 95
	.4byte .L0808FDEA @ case 96
	.4byte .L0808FDEA @ case 97
	.4byte .L0808FDEA @ case 98
	.4byte .L0808FDEA @ case 99
	.4byte .L0808FDEA @ case 100
	.4byte .L0808FDEA @ case 101
	.4byte .L0808FDEA @ case 102
	.4byte .L0808FDEA @ case 103
	.4byte .L0808FDEA @ case 104
	.4byte .L0808FDEA @ case 105
	.4byte .L0808FDEA @ case 106
	.4byte .L0808FDEA @ case 107
	.4byte .L0808FDEA @ case 108
	.4byte .L0808FDEA @ case 109
	.4byte .L0808FDEA @ case 110
	.4byte .L0808FDEA @ case 111
	.4byte .L0808FDEA @ case 112
	.4byte .L0808FDEA @ case 113
	.4byte .L0808FDEA @ case 114
	.4byte .L0808FDEA @ case 115
	.4byte .L0808FDEA @ case 116
	.4byte .L0808FDEA @ case 117
	.4byte .L0808FDEA @ case 118
	.4byte .L0808FDEA @ case 119
	.4byte .L0808FDEA @ case 120
	.4byte .L0808FDEA @ case 121
	.4byte .L0808FDEA @ case 122
	.4byte .L0808FDEA @ case 123
	.4byte .L0808FDEA @ case 124
	.4byte .L0808FDEA @ case 125
	.4byte .L0808FDEA @ case 126
	.4byte .L0808FDEA @ case 127
	.4byte .L0808FDCA @ case 128
.L0808FBB8:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, .L0808FC10  @ gUnknown_08A01E5C
	cmp r1, #0
	beq .L0808FBD4
	ldr r5, .L0808FC14  @ gUnknown_08A01E54
.L0808FBD4:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r2, [r0]
	lsls r2, r2, #3
	adds r0, #1
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r3, r0
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #1
.L0808FBFA:
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r5, #0
	bl func_080900EC
.L0808FC06:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b .L0808FD3C
	.align 2, 0
.L0808FC10: .4byte gUnknown_08A01E5C
.L0808FC14: .4byte gUnknown_08A01E54
.L0808FC18:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, .L0808FC5C  @ gUnknown_08A01E5C
	cmp r1, #0
	beq .L0808FC34
	ldr r5, .L0808FC60  @ gUnknown_08A01E54
.L0808FC34:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r2, [r0]
	lsls r2, r2, #3
	adds r0, #1
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r3, r0
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #2
	b .L0808FBFA
	.align 2, 0
.L0808FC5C: .4byte gUnknown_08A01E5C
.L0808FC60: .4byte gUnknown_08A01E54
.L0808FC64:
	bl func_0808EA3C
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq .L0808FC80
	movs r0, #4
	bl func_0808EA1C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b .L0808FC88
.L0808FC80:
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
.L0808FC88:
	mov r0, r8
	movs r1, #0x63
	bl Proc_Goto
	b .L0808FD3C
.L0808FC92:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	adds r3, r6, #0
	adds r3, #0x54
	movs r2, #0
	ldrsb r2, [r3, r2]
	adds r2, #1
	adds r0, r6, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt .L0808FCB6
	b .L0808F97E
.L0808FCB6:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b .L0808FE5E
.L0808FCBE:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #8
	strb r0, [r1]
	b .L0808FC06
.L0808FCC8:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x10
	strb r0, [r1]
	b .L0808FC06
.L0808FCD2:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x20
	strb r0, [r1]
	b .L0808FC06
.L0808FCDC:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x80
	strb r0, [r1]
	b .L0808FC06
.L0808FCE6:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldr r0, .L0808FCF0  @ 0x0000FFF7
	ands r7, r0
	b .L0808FE5E
	.align 2, 0
.L0808FCF0: .4byte 0x0000FFF7
.L0808FCF4:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	movs r0, #8
	orrs r7, r0
	lsls r0, r7, #0x10
	lsrs r7, r0, #0x10
	b .L0808FE5E
.L0808FD02:
	adds r1, r2, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #1
	bne .L0808FD10
	adds r0, r1, #1
	str r0, [r6, #0x2c]
.L0808FD10:
	bl func_0808EA3C
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq .L0808FD26
	mov r0, r8
	movs r1, #2
	bl Proc_Goto
	b .L0808FD3C
.L0808FD26:
	adds r0, r6, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r6, #0
	adds r1, #0x5f
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
.L0808FD3C:
	ldr r0, .L0808FD44  @ 0x0000FFEF
	ands r7, r0
	b .L0808FE68
	.align 2, 0
.L0808FD44: .4byte 0x0000FFEF
.L0808FD48:
	ldr r0, .L0808FD90  @ 0x0000FFEF
	ands r7, r0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	bl func_0808EA3C
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0808FD94
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r5, r6, #0
	adds r5, #0x59
	lsls r1, r1, #3
	ldrb r0, [r5]
	adds r1, r1, r0
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r2, [r0]
	adds r4, r6, #0
	adds r4, #0x5a
	lsls r2, r2, #3
	ldrb r0, [r4]
	adds r2, r2, r0
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	bl func_08007D04
	b .L0808FDBE
	.align 2, 0
.L0808FD90: .4byte 0x0000FFEF
.L0808FD94:
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r5, r6, #0
	adds r5, #0x59
	lsls r1, r1, #3
	ldrb r0, [r5]
	adds r1, r1, r0
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r2, [r0]
	adds r4, r6, #0
	adds r4, #0x5a
	lsls r2, r2, #3
	ldrb r0, [r4]
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl NewTextBluArrowAndButtonChecker
.L0808FDBE:
	adds r1, r5, #0
	adds r2, r4, #0
	ldr r0, [r6, #0x2c]
	bl func_0808F358
	b .L0808FE68
.L0808FDCA:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #0x21
	bne .L0808FDE2
	adds r2, r6, #0
	adds r2, #0x5e
	ldrb r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2]
.L0808FDE2:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b .L0808FE5E
.L0808FDEA:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808FE0E
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xc
	bl Text_SetColor
	b .L0808FE26
.L0808FE0E:
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xb
	bl Text_SetColor
.L0808FE26:
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	cmp r0, #1
	beq .L0808FE5E
	bl func_0808EA3C
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne .L0808FE5E
	ldr r0, .L0808FE80  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0808FE5E
	movs r0, #0x6e
	bl m4aSongNumStart
.L0808FE5E:
	movs r0, #1
	add r9, r0
	cmp r9, sl
	bge .L0808FE68
	b .L0808F99A
.L0808FE68:
	movs r0, #0
	bl SetTextFont
	ldr r0, .L0808FE84  @ gUnknown_03005398
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0808FE88
	cmp r0, #1
	beq .L0808FE8C
	movs r0, #0
	b .L0808FE8E
	.align 2, 0
.L0808FE80: .4byte gPlaySt
.L0808FE84: .4byte gUnknown_03005398
.L0808FE88:
	movs r0, #0
	b .L0808FE8E
.L0808FE8C:
	movs r0, #1
.L0808FE8E:
	adds r1, r7, #0
	bl SetFaceDispById
.L0808FE94:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808F8B4

	THUMB_FUNC_START func_0808FEA4
func_0808FEA4: @ 0x0808FEA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r1
	mov ip, r2
	adds r4, r0, #0
	movs r6, #0
	cmp r6, ip
	bge .L0808FF00
.L0808FEBA:
	adds r1, r4, #0
	movs r2, #0
	adds r0, r6, #1
	mov r9, r0
	cmp r2, r8
	bge .L0808FEF4
	mov r7, ip
	subs r7, #1
	mov sl, r2
.L0808FECC:
	adds r5, r2, #1
	movs r3, #6
.L0808FED0:
	ldr r0, [r1, #4]
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge .L0808FED0
	cmp r6, r7
	bne .L0808FEE2
	mov r0, sl
	b .L0808FEEC
.L0808FEE2:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0]
.L0808FEEC:
	stm r1!, {r0}
	adds r2, r5, #0
	cmp r2, r8
	blt .L0808FECC
.L0808FEF4:
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	mov r6, r9
	cmp r6, ip
	blt .L0808FEBA
.L0808FF00:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808FEA4

	THUMB_FUNC_START func_0808FF10
func_0808FF10: @ 0x0808FF10
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_0808FF10

	THUMB_FUNC_START func_0808FF18
func_0808FF18: @ 0x0808FF18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x14]
	adds r6, r5, #0
	adds r6, #0x54
	movs r2, #0
	ldrsb r2, [r6, r2]
	adds r2, #1
	lsls r2, r2, #1
	ldr r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x5b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl func_0808FEA4
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r2, #0
	mov r8, r2
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r4, r5, #0
	adds r4, #0x5f
	ldrb r0, [r4]
	lsls r0, r0, #4
	cmp r1, r0
	bne .L0808FF92
	adds r0, r5, #0
	bl func_0808F30C
	ldrb r1, [r4]
	subs r1, #1
	ldrb r0, [r6]
	subs r0, r0, r1
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x59
	mov r2, r8
	strb r2, [r1]
	subs r4, #5
	strb r2, [r4]
	ldr r0, [r5, #0x2c]
	adds r2, r4, #0
	bl func_0808F358
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldrb r1, [r4]
	adds r0, r0, r1
	strb r0, [r4]
	adds r0, r7, #0
	bl Proc_Break
.L0808FF92:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808FF18

	THUMB_FUNC_START func_0808FF9C
func_0808FF9C: @ 0x0808FF9C
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl func_0808F2BC
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
	adds r1, #5
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x5a
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl func_0808F358
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808FF9C

	THUMB_FUNC_START func_0808FFC4
func_0808FFC4: @ 0x0808FFC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0808FFE4  @ gUnknown_08A01E64
	adds r0, r4, #0
	bl FindProc
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0808FFE4: .4byte gUnknown_08A01E64

	THUMB_FUNC_END func_0808FFC4

	THUMB_FUNC_START func_0808FFE8
func_0808FFE8: @ 0x0808FFE8
	push {lr}
	ldr r0, .L0808FFF8  @ gUnknown_08A01E64
	bl FindProc
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0808FFF8: .4byte gUnknown_08A01E64

	THUMB_FUNC_END func_0808FFE8

	THUMB_FUNC_START func_0808FFFC
func_0808FFFC: @ 0x0808FFFC
	push {lr}
	bl func_0808EA3C
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne .L0809000E
	movs r0, #0
	b .L08090010
.L0809000E:
	movs r0, #1
.L08090010:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808FFFC

	THUMB_FUNC_START func_08090014
func_08090014: @ 0x08090014
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, .L08090040  @ gKeySt
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq .L08090048
	ldr r0, .L08090044  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809003A
	movs r0, #0x6b
	bl m4aSongNumStart
.L0809003A:
	movs r0, #0
	b .L08090068
	.align 2, 0
.L08090040: .4byte gKeySt
.L08090044: .4byte gPlaySt
.L08090048:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq .L08090078
	ldr r0, .L08090074  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08090064
	movs r0, #0x6a
	bl m4aSongNumStart
.L08090064:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
.L08090068:
	bl SetDialoguePromptResult
	adds r0, r4, #0
	bl Proc_Break
	b .L080900E2
	.align 2, 0
.L08090074: .4byte gPlaySt
.L08090078:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq .L0809009C
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	cmp r0, #2
	bne .L0809009C
	ldr r0, .L080900E8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809009A
	movs r0, #0x67
	bl m4aSongNumStart
.L0809009A:
	strh r6, [r4, #0x2a]
.L0809009C:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080900C6
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne .L080900C6
	ldr r0, .L080900E8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080900C2
	movs r0, #0x67
	bl m4aSongNumStart
.L080900C2:
	movs r0, #2
	strh r0, [r4, #0x2a]
.L080900C6:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl DisplayUiHand
.L080900E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080900E8: .4byte gPlaySt

	THUMB_FUNC_END func_08090014

	THUMB_FUNC_START func_080900EC
func_080900EC: @ 0x080900EC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov r9, r3
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x24]
	ldr r0, [r5]
	bl GetMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x10
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, [r5, #4]
	bl GetMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x38
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, .L08090148  @ gUnknown_08A01EC4
	adds r1, r7, #0
	bl SpawnProcLocking
	mov r1, sp
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x2a]
	adds r4, #0x10
	strh r4, [r0, #0x2c]
	mov r2, r9
	strh r2, [r0, #0x2e]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08090148: .4byte gUnknown_08A01EC4

	THUMB_FUNC_END func_080900EC

	THUMB_FUNC_START func_0809014C
func_0809014C: @ 0x0809014C
	push {r4, r5, lr}
	ldr r0, .L080901B8  @ gUnknown_0200E158
	bl InitUnitStack
	movs r5, #1
.L08090156:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L0809017A
	ldr r0, [r4]
	cmp r0, #0
	beq .L0809017A
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809017A
	adds r0, r4, #0
	bl PushUnit
.L0809017A:
	adds r5, #1
	cmp r5, #0x3f
	ble .L08090156
	movs r5, #1
.L08090182:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L080901A6
	ldr r0, [r4]
	cmp r0, #0
	beq .L080901A6
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080901A6
	adds r0, r4, #0
	bl PushUnit
.L080901A6:
	adds r5, #1
	cmp r5, #0x3f
	ble .L08090182
	bl LoadPlayerUnitsFromUnitStack
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080901B8: .4byte gUnknown_0200E158

	THUMB_FUNC_END func_0809014C

	THUMB_FUNC_START func_080901BC
func_080901BC: @ 0x080901BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, .L08090234  @ gUnknown_08A17B58
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	mov r1, r8
	adds r2, r7, #0
	bl PutSpriteExt
	movs r5, #0
	subs r0, r6, #1
	cmp r5, r0
	bge .L08090210
	mov r4, r8
	adds r4, #8
.L080901F2:
	ldr r0, .L08090234  @ gUnknown_08A17B58
	ldr r3, [r0, #4]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #1
	subs r0, r6, #1
	cmp r5, r0
	blt .L080901F2
.L08090210:
	lsls r1, r5, #4
	add r1, r8
	adds r1, #8
	ldr r0, .L08090234  @ gUnknown_08A17B58
	ldr r3, [r0, #8]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08090234: .4byte gUnknown_08A17B58

	THUMB_FUNC_END func_080901BC

	THUMB_FUNC_START func_08090238
func_08090238: @ 0x08090238
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r5, .L080902C0  @ gBg2Tm+0x6A
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, .L080902C4  @ gUnknown_0200E150
	adds r0, r4, #0
	bl ClearText
	movs r7, #0
	mov r8, r4
	mov sl, r5
.L08090266:
	movs r6, #0
	lsls r0, r7, #3
	adds r1, r7, #1
	mov r9, r1
	adds r0, r0, r7
	lsls r5, r0, #4
	ldr r2, .L080902C8  @ gUnknown_08A17C48
	adds r1, r5, r2
.L08090276:
	ldrb r0, [r1]
	ldr r2, [sp]
	cmp r0, r2
	bne .L080902FC
	ldr r4, .L080902C4  @ gUnknown_0200E150
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, .L080902CC  @ 0x000004FD
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	cmp r7, #5
	bne .L080902D0
	cmp r6, #0
	beq .L080902D0
	adds r0, r4, #0
	mov r1, sl
	bl PutText
	adds r1, r6, #0
	adds r1, #0x6f
	mov r0, sl
	adds r0, #8
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b .L08090306
	.align 2, 0
.L080902C0: .4byte gBg2Tm+0x6A
.L080902C4: .4byte gUnknown_0200E150
.L080902C8: .4byte gUnknown_08A17C48
.L080902CC: .4byte 0x000004FD
.L080902D0:
	mov r0, r8
	movs r1, #4
	bl Text_Skip
	ldr r1, .L080902F4  @ gUnknown_08A17C4C
	adds r0, r5, r1
	ldr r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	mov r0, r8
	bl Text_DrawString
	mov r0, r8
	ldr r1, .L080902F8  @ gBg2Tm+0x6A
	bl PutText
	b .L08090306
	.align 2, 0
.L080902F4: .4byte gUnknown_08A17C4C
.L080902F8: .4byte gBg2Tm+0x6A
.L080902FC:
	adds r5, #0x10
	adds r1, #0x10
	adds r6, #1
	cmp r6, #8
	ble .L08090276
.L08090306:
	mov r7, r9
	cmp r7, #9
	ble .L08090266
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08090238

	THUMB_FUNC_START func_08090324
func_08090324: @ 0x08090324
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r1, .L08090348  @ gUnknown_0200F15C
.L0809032C:
	ldr r0, [r1]
	cmp r0, r3
	beq .L08090354
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble .L0809032C
	movs r2, #0
	ldr r1, .L08090348  @ gUnknown_0200F15C
.L0809033E:
	ldr r0, [r1]
	cmp r0, #0xff
	bne .L0809034C
	str r3, [r1]
	b .L08090354
	.align 2, 0
.L08090348: .4byte gUnknown_0200F15C
.L0809034C:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble .L0809033E
.L08090354:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08090324

	THUMB_FUNC_START func_08090358
func_08090358: @ 0x08090358
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	ldr r3, .L0809040C  @ gUnknown_0200F158
	movs r2, #0xff
	add r1, sp, #0x1c
.L0809036A:
	str r2, [r1]
	subs r1, #4
	cmp r1, sp
	bge .L0809036A
	cmp r0, #0
	ble .L08090378
	subs r0, #1
.L08090378:
	movs r6, #0
	ldrb r3, [r3]
	cmp r0, r3
	bge .L080903BE
	ldr r1, .L08090410  @ gUnknown_0200D6E0
	adds r5, r0, #0
	mov r7, sp
	lsls r0, r5, #2
	adds r4, r0, r1
.L0809038A:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L080903AA
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIcon
	str r0, [r7]
.L080903AA:
	adds r5, #1
	adds r7, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #7
	bgt .L080903BE
	ldr r0, .L0809040C  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r5, r0
	blt .L0809038A
.L080903BE:
	movs r6, #0
	ldr r7, .L08090414  @ gUnknown_0200F15C
	mov r8, r7
.L080903C4:
	lsls r1, r6, #2
	mov r2, r8
	adds r0, r1, r2
	ldr r0, [r0]
	adds r4, r1, #0
	adds r6, #1
	cmp r0, #0xff
	beq .L080903FC
	movs r5, #0
	adds r1, r0, #0
	mov r2, sp
	movs r3, #7
.L080903DC:
	ldr r0, [r2]
	cmp r0, r1
	bne .L080903E4
	movs r5, #1
.L080903E4:
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge .L080903DC
	cmp r5, #0
	bne .L080903FC
	adds r4, r4, r7
	ldr r0, [r4]
	bl ClearIcon
	movs r0, #0xff
	str r0, [r4]
.L080903FC:
	cmp r6, #7
	ble .L080903C4
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809040C: .4byte gUnknown_0200F158
.L08090410: .4byte gUnknown_0200D6E0
.L08090414: .4byte gUnknown_0200F15C

	THUMB_FUNC_END func_08090358

	THUMB_FUNC_START func_08090418
func_08090418: @ 0x08090418
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r1, #0
	beq .L0809045A
	bl func_08095394
	b .L0809045E
.L08090430:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r3, [r4, #0x3e]
	b .L08090508
.L0809043A:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r1, [r4, #0x3e]
	b .L08090508
.L08090444:
	subs r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b .L08090508
.L0809044E:
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	strh r7, [r4, #0x3e]
	b .L08090508
.L0809045A:
	bl GetLastStatScreenUid
.L0809045E:
	adds r1, r0, #0
	movs r3, #0
	ldr r0, .L08090498  @ gUnknown_0200F158
	ldrb r6, [r0]
	mov r9, r0
	cmp r3, r6
	bge .L08090508
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0x2c
	adds r0, r0, r4
	mov ip, r0
	movs r5, #0x40
	negs r5, r5
	movs r7, #0x10
	negs r7, r7
	ldr r2, .L0809049C  @ gUnknown_0200D6E0
.L08090482:
	mov r0, r8
	cmp r0, #0
	beq .L080904A0
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r1
	beq .L080904AE
	b .L080904FC
	.align 2, 0
.L08090498: .4byte gUnknown_0200F158
.L0809049C: .4byte gUnknown_0200D6E0
.L080904A0:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne .L080904FC
.L080904AE:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r3, [r0]
	cmp r3, #0
	beq .L08090430
	mov r0, r9
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r3, r0
	bne .L080904DA
	cmp r2, #6
	bls .L0809043A
	movs r0, #5
	mov r1, ip
	strb r0, [r1]
	mov r1, r9
	ldrb r0, [r1]
	subs r0, #6
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	b .L08090508
.L080904DA:
	ldrh r2, [r4, #0x3e]
	lsrs r1, r2, #4
	adds r0, r1, #0
	cmp r3, r0
	ble .L080904EA
	adds r0, #5
	cmp r3, r0
	blt .L08090444
.L080904EA:
	cmp r2, r7
	bgt .L0809044E
	cmp r2, r5
	bge .L08090508
	movs r0, #4
	mov r1, ip
	strb r0, [r1]
	strh r5, [r4, #0x3e]
	b .L08090508
.L080904FC:
	adds r5, #0x10
	adds r7, #0x10
	adds r2, #4
	adds r3, #1
	cmp r3, r6
	blt .L08090482
.L08090508:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08090418

	THUMB_FUNC_START func_08090514
func_08090514: @ 0x08090514
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq .L080905B4
	ldr r0, .L080905B0  @ gDispIo
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r1, #0x31
	movs r0, #0x3a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0xf0
	strb r3, [r0]
	subs r1, #1
	movs r0, #0x98
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x20
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r2]
	mov r7, ip
	adds r7, #0x35
	ldrb r2, [r7]
	movs r1, #2
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r6
	strb r0, [r7]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	movs r0, #0x11
	negs r0, r0
	ands r1, r0
	strb r1, [r2]
	b .L08090614
	.align 2, 0
.L080905B0: .4byte gDispIo
.L080905B4:
	ldr r0, .L0809061C  @ gDispIo
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r1, #0x31
	movs r0, #0x3a
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
.L08090614:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809061C: .4byte gDispIo

	THUMB_FUNC_END func_08090514

	THUMB_FUNC_START func_08090620
func_08090620: @ 0x08090620
	push {r4, lr}
	adds r4, r0, #0
	bl MU_EndAll
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	bl EndGreenText
	ldr r2, .L08090660  @ gDispIo
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
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08090664
	movs r0, #0x11
	bl SetStatScreenConfig
	b .L0809066A
	.align 2, 0
.L08090660: .4byte gDispIo
.L08090664:
	movs r0, #0x1f
	bl SetStatScreenConfig
.L0809066A:
	ldr r1, .L080906A4  @ gUnknown_0200D6E0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	ldr r1, .L080906A8  @ gPlaySt
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x32
	lsls r0, r0, #7
	ldrb r2, [r2]
	adds r0, r0, r2
	strb r0, [r1, #0x1a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080906A4: .4byte gUnknown_0200D6E0
.L080906A8: .4byte gPlaySt

	THUMB_FUNC_END func_08090620

	THUMB_FUNC_START func_080906AC
func_080906AC: @ 0x080906AC
	push {lr}
	bl func_08090D80
	ldr r2, .L080906D4  @ gDispIo
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
	pop {r0}
	bx r0
	.align 2, 0
.L080906D4: .4byte gDispIo

	THUMB_FUNC_END func_080906AC

	THUMB_FUNC_START func_080906D8
func_080906D8: @ 0x080906D8
	ldr r2, .L080906F4  @ gDispIo
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
	bx lr
	.align 2, 0
.L080906F4: .4byte gDispIo

	THUMB_FUNC_END func_080906D8

	THUMB_FUNC_START func_080906F8
func_080906F8: @ 0x080906F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x3b
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r5, #0x2c]
	ldrh r0, [r0, #0x3e]
	movs r1, #0
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	adds r0, #0x3a
	strb r1, [r0]
	adds r0, r5, #0
	bl Make6CMenuScroll
	str r0, [r5, #0x34]
	movs r0, #0xe0
	movs r1, #0x40
	bl func_080976AC
	ldr r0, [r5, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, .L08090778  @ gUnknown_0200F158
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl func_080976CC
	movs r0, #0xe4
	lsls r0, r0, #7
	movs r1, #1
	bl func_08097700
	bl ForceSyncUnitSpriteSheet
	movs r0, #7
	strh r0, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0xe1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x44
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #6
	movs r1, #4
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	ldr r0, .L0809077C  @ gUnknown_08A1C7D8
	ldr r1, .L08090780  @ 0x06010280
	bl Decompress
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08090778: .4byte gUnknown_0200F158
.L0809077C: .4byte gUnknown_08A1C7D8
.L08090780: .4byte 0x06010280

	THUMB_FUNC_END func_080906F8

	THUMB_FUNC_START func_08090784
func_08090784: @ 0x08090784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, .L08090834  @ gUnknown_08205B84
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #0x2c]
	adds r0, #0x34
	ldrb r0, [r0]
	ldr r5, .L08090838  @ 0x000020E2
	cmp r0, #0
	bne .L080907AC
	movs r5, #0xe2
.L080907AC:
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r0, [r4]
	lsrs r0, r0, #3
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, .L0809083C  @ gUnknown_08A17B64
	movs r7, #0x90
	lsls r7, r7, #8
	str r7, [sp]
	movs r0, #0xb
	adds r1, r5, #0
	bl PutSpriteExt
	ldr r1, .L08090840  @ gUnknown_08A17C20
	ldr r0, [r6, #0x2c]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #0xd
	movs r1, #0x10
	movs r2, #8
	bl PutSpriteExt
	ldr r0, [r6, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, .L08090844  @ gUnknown_0200F158
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl func_080976CC
	ldr r5, [r6, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	str r4, [sp, #0x14]
	cmp r0, #2
	bls .L0809084C
	ldr r2, .L08090848  @ gUnknown_08A17C48
	adds r3, r5, #0
	adds r3, #0x2d
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	adds r1, r5, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, #0x28
	bl DisplayUiHand
	b .L08090862
	.align 2, 0
.L08090834: .4byte gUnknown_08205B84
.L08090838: .4byte 0x000020E2
.L0809083C: .4byte gUnknown_08A17B64
.L08090840: .4byte gUnknown_08A17C20
.L08090844: .4byte gUnknown_0200F158
.L08090848: .4byte gUnknown_08A17C48
.L0809084C:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x40
	ldr r3, .L080908B4  @ gUnknown_08A17B6C
	str r7, [sp]
	movs r0, #0xd
	movs r1, #4
	bl PutSpriteExt
.L08090862:
	ldr r1, [r6, #0x2c]
	ldrh r0, [r6, #0x38]
	ldrh r2, [r1, #0x3e]
	cmp r0, r2
	bne .L08090876
	ldrh r0, [r1, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L080908C0
.L08090876:
	ldr r0, .L080908B8  @ gPal
	ldr r1, .L080908BC  @ gUnknown_02013460
	ldrh r1, [r1, #0x10]
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r0, r0, r3
	strh r1, [r0]
	bl EnablePalSync
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r2, [sp, #0x18]
	mov r9, r0
	cmp r1, #0
	bne .L080908FC
	movs r0, #1
	bl func_08090514
	movs r0, #1
	mov r4, r9
	strb r0, [r4]
	b .L080908FC
	.align 2, 0
.L080908B4: .4byte gUnknown_08A17B6C
.L080908B8: .4byte gPal
.L080908BC: .4byte gUnknown_02013460
.L080908C0:
	ldr r2, .L08090B20  @ gPal
	ldr r3, .L08090B24  @ gUnknown_02013460
	adds r4, r6, #0
	adds r4, #0x3c
	ldrb r0, [r4]
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r4, [sp, #0x18]
	mov r9, r0
	cmp r1, #1
	bne .L080908FC
	movs r0, #0
	bl func_08090514
	movs r0, #0
	mov r2, r9
	strb r0, [r2]
.L080908FC:
	bl ForceSyncUnitSpriteSheet
	ldrh r0, [r6, #0x38]
	lsrs r7, r0, #4
	movs r1, #0xf
	ands r0, r1
	negs r0, r0
	mov r8, r0
	movs r5, #0
	ldr r0, .L08090B28  @ gUnknown_0200F158
	adds r3, r6, #0
	adds r3, #0x46
	str r3, [sp, #0x24]
	adds r4, r6, #0
	adds r4, #0x48
	str r4, [sp, #0x28]
	adds r1, r6, #0
	adds r1, #0x42
	str r1, [sp, #0x1c]
	adds r2, r6, #0
	adds r2, #0x44
	str r2, [sp, #0x20]
	ldrb r0, [r0]
	cmp r7, r0
	bge .L08090964
	ldr r1, .L08090B2C  @ gUnknown_0200D6E0
	adds r4, r7, #0
	lsls r0, r7, #2
	adds r0, r0, r1
	mov sl, r0
.L08090938:
	lsls r2, r5, #4
	mov r0, r8
	adds r0, #0x38
	adds r2, r2, r0
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldm r3!, {r0}
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl PutUnitSprite
	adds r4, #1
	adds r5, #1
	cmp r5, #5
	bgt .L08090964
	ldr r0, .L08090B28  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt .L08090938
.L08090964:
	mov r4, r9
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08090990
	adds r3, r5, r7
	ldr r0, .L08090B28  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r3, r0
	bge .L08090990
	lsls r2, r5, #4
	mov r0, r8
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, .L08090B2C  @ gUnknown_0200D6E0
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl PutUnitSprite
.L08090990:
	ldr r2, .L08090B30  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L080909A8
	movs r0, #0x1f
	ldr r1, [sp, #0x24]
	strh r0, [r1]
	movs r0, #1
	strh r0, [r6, #0x3e]
.L080909A8:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080909C2
	movs r0, #0x1f
	ldr r2, [sp, #0x28]
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0xe7
	strh r0, [r1]
.L080909C2:
	ldr r3, [sp, #0x24]
	ldrh r0, [r3]
	ldr r4, [sp, #0x1c]
	ldrh r4, [r4]
	adds r0, r0, r4
	ldr r1, [sp, #0x1c]
	strh r0, [r1]
	ldr r2, [sp, #0x28]
	ldrh r0, [r2]
	ldr r3, [sp, #0x20]
	ldrh r3, [r3]
	adds r0, r0, r3
	ldr r4, [sp, #0x20]
	strh r0, [r4]
	ldr r0, [sp, #0x24]
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	ble .L080909F0
	subs r0, r1, #1
	ldr r3, [sp, #0x24]
	strh r0, [r3]
.L080909F0:
	ldr r4, [sp, #0x28]
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #4
	ble .L08090A00
	subs r0, r1, #1
	strh r0, [r4]
.L08090A00:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L08090A2C
	ldrh r1, [r6, #0x3e]
	movs r3, #0x3e
	ldrsh r0, [r6, r3]
	cmp r0, #6
	bgt .L08090A1A
	adds r0, r1, #1
	strh r0, [r6, #0x3e]
.L08090A1A:
	adds r1, r6, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0xe1
	ble .L08090A2C
	subs r0, r2, #1
	strh r0, [r1]
.L08090A2C:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bls .L08090A90
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq .L08090A90
	movs r0, #0x3e
	ldrsh r4, [r6, r0]
	ldr r5, .L08090B34  @ Sprite_8x8
	ldr r1, [sp, #0x1c]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L08090B38  @ 0x00001414
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSprite
	movs r3, #0x3e
	ldrsh r4, [r6, r3]
	ldr r1, [sp, #0x1c]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L08090B3C  @ 0x0000141A
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x30
	adds r3, r5, #0
	bl PutSprite
.L08090A90:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #0
	adds r0, #0x2f
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r0]
	ldrb r2, [r2]
	cmp r0, r2
	bcs .L08090AFE
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq .L08090AFE
	adds r4, r6, #0
	adds r4, #0x40
	movs r3, #0
	ldrsh r5, [r4, r3]
	ldr r6, .L08090B40  @ Sprite_8x8_HFlipped
	ldr r1, [sp, #0x20]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L08090B38  @ 0x00001414
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x28
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0
	ldrsh r4, [r4, r3]
	ldr r1, [sp, #0x20]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L08090B3C  @ 0x0000141A
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x30
	adds r3, r6, #0
	bl PutSprite
.L08090AFE:
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r4, [sp, #0x18]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08090B20: .4byte gPal
.L08090B24: .4byte gUnknown_02013460
.L08090B28: .4byte gUnknown_0200F158
.L08090B2C: .4byte gUnknown_0200D6E0
.L08090B30: .4byte gKeySt
.L08090B34: .4byte Sprite_8x8
.L08090B38: .4byte 0x00001414
.L08090B3C: .4byte 0x0000141A
.L08090B40: .4byte Sprite_8x8_HFlipped

	THUMB_FUNC_END func_08090784

	THUMB_FUNC_START nullsub_63
nullsub_63: @ 0x08090B44
	bx lr

	THUMB_FUNC_END nullsub_63

	THUMB_FUNC_START func_08090B48
func_08090B48: @ 0x08090B48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [r7, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L08090B66
	mov r1, r8
	adds r1, #0x3b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08090B66:
	ldr r5, .L08090C48  @ gUnknown_0200D3E0
	ldr r4, .L08090C4C  @ gUnknown_0200F158
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	str r7, [r0]
	movs r1, #1
	negs r1, r1
	adds r0, r7, #0
	bl BattleGenerateUiStats
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r3, .L08090C50  @ gBattleUnitA
	adds r0, r3, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r0, #1
	movs r2, #0xff
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #4]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #6]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x62
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #8]
	adds r0, r7, #0
	bl GetUnitSupportCount
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	cmp r6, r5
	bge .L08090BF2
.L08090BDC:
	adds r0, r7, #0
	adds r1, r4, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08090BEC
	adds r6, #1
.L08090BEC:
	adds r4, #1
	cmp r4, r5
	blt .L08090BDC
.L08090BF2:
	cmp r6, #3
	ble .L08090C0C
	mov r5, r8
	adds r5, #0x2e
	ldrb r4, [r5]
	subs r0, r6, #1
	movs r1, #3
	bl __divsi3
	adds r0, #6
	cmp r4, r0
	bge .L08090C0C
	strb r0, [r5]
.L08090C0C:
	ldr r4, .L08090C48  @ gUnknown_0200D3E0
	ldr r3, .L08090C4C  @ gUnknown_0200F158
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r6, [r0, #0xa]
	ldr r0, .L08090C54  @ gUnknown_0200D6E0
	ldrb r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	adds r0, r7, #0
	bl GetUnitSpriteId
	bl UseUnitSprite
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08090C48: .4byte gUnknown_0200D3E0
.L08090C4C: .4byte gUnknown_0200F158
.L08090C50: .4byte gBattleUnitA
.L08090C54: .4byte gUnknown_0200D6E0

	THUMB_FUNC_END func_08090B48

	THUMB_FUNC_START func_08090C58
func_08090C58: @ 0x08090C58
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L08090CAC  @ gUnknown_0200F158
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08090CB4
	ldr r0, .L08090CB0  @ gPlaySt
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	adds r0, #0x40
	cmp r5, r0
	bge .L08090CF0
.L08090C78:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L08090C9E
	ldr r0, [r4]
	cmp r0, #0
	beq .L08090C9E
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08090C9E
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_08090B48
.L08090C9E:
	adds r5, #1
	ldr r0, .L08090CB0  @ gPlaySt
	ldrb r0, [r0, #0xf]
	adds r0, #0x40
	cmp r5, r0
	blt .L08090C78
	b .L08090CF0
	.align 2, 0
.L08090CAC: .4byte gUnknown_0200F158
.L08090CB0: .4byte gPlaySt
.L08090CB4:
	ldr r0, .L08090CBC  @ gPlaySt
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b .L08090CEA
	.align 2, 0
.L08090CBC: .4byte gPlaySt
.L08090CC0:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08090CE4
	ldr r0, [r2]
	cmp r0, #0
	beq .L08090CE4
	ldr r0, [r2, #0xc]
	ldr r1, .L08090CF8  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L08090CE4
	adds r0, r2, #0
	adds r1, r6, #0
	bl func_08090B48
.L08090CE4:
	adds r4, #1
	ldr r0, .L08090CFC  @ gPlaySt
	ldrb r0, [r0, #0xf]
.L08090CEA:
	adds r0, #0x40
	cmp r4, r0
	blt .L08090CC0
.L08090CF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08090CF8: .4byte 0x0001000C
.L08090CFC: .4byte gPlaySt

	THUMB_FUNC_END func_08090C58

	THUMB_FUNC_START func_08090D00
func_08090D00: @ 0x08090D00
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L08090D44  @ gUnknown_0200F158
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08090D48
	movs r5, #1
.L08090D16:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L08090D3C
	ldr r0, [r4]
	cmp r0, #0
	beq .L08090D3C
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08090D3C
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_08090B48
.L08090D3C:
	adds r5, #1
	cmp r5, #0x3f
	ble .L08090D16
	b .L08090D74
	.align 2, 0
.L08090D44: .4byte gUnknown_0200F158
.L08090D48:
	movs r4, #1
.L08090D4A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08090D6E
	ldr r0, [r2]
	cmp r0, #0
	beq .L08090D6E
	ldr r0, [r2, #0xc]
	ldr r1, .L08090D7C  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L08090D6E
	adds r0, r2, #0
	adds r1, r6, #0
	bl func_08090B48
.L08090D6E:
	adds r4, #1
	cmp r4, #0x3f
	ble .L08090D4A
.L08090D74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08090D7C: .4byte 0x0001000C

	THUMB_FUNC_END func_08090D00

	THUMB_FUNC_START func_08090D80
func_08090D80: @ 0x08090D80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	ldr r2, .L08090E60  @ gDispIo
	ldrb r0, [r2, #1]
	movs r6, #1
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnVMatch
	movs r0, #0
	bl SetupBackgrounds
	bl ResetText
	bl ResetTextFont
	bl ClearIcons
	bl ApplyUnitSpritePalettes
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, .L08090E64  @ gPal+0x360
	ldr r2, .L08090E68  @ 0x01000008
	add r0, sp, #4
	bl CpuFastSet
	bl LoadObjUiGfx
	mov r0, r8
	bl StartGreenText
	mov r0, r8
	adds r0, #0x3b
	strb r4, [r0]
	subs r0, #0xd
	movs r5, #6
	strb r5, [r0]
	mov r0, r8
	bl func_08090D00
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08090E14
	mov r0, r8
	adds r0, #0x2a
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x32
	str r1, [sp, #0x14]
	mov r2, r8
	adds r2, #0x29
	str r2, [sp, #8]
	movs r1, #0x2f
	add r1, r8
	mov sl, r1
	cmp r0, #1
	bne .L08090E88
.L08090E14:
	ldr r4, .L08090E6C  @ gPlaySt
	ldrb r1, [r4, #0x1a]
	mov r3, r8
	adds r3, #0x34
	mov r2, r8
	adds r2, #0x32
	str r2, [sp, #0x14]
	cmp r1, #0
	beq .L08090E38
	lsrs r0, r1, #7
	ands r0, r6
	adds r2, #1
	strb r0, [r2]
	strb r0, [r3]
	movs r0, #0x7f
	ands r1, r0
	ldr r0, [sp, #0x14]
	strb r1, [r0]
.L08090E38:
	mov r0, r8
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #8]
	movs r2, #0x2f
	add r2, r8
	mov sl, r2
	cmp r1, #4
	beq .L08090E7E
	ldrb r0, [r2]
	cmp r0, #0
	beq .L08090E7E
	ldrb r0, [r4, #0x19]
	lsrs r1, r0, #4
	cmp r1, #0
	beq .L08090E7E
	cmp r1, #6
	bls .L08090E70
	strb r5, [r2]
	b .L08090E74
	.align 2, 0
.L08090E60: .4byte gDispIo
.L08090E64: .4byte gPal+0x360
.L08090E68: .4byte 0x01000008
.L08090E6C: .4byte gPlaySt
.L08090E70:
	mov r0, sl
	strb r1, [r0]
.L08090E74:
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	adds r1, #0x36
	strb r0, [r1]
.L08090E7E:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl SortUnitList
.L08090E88:
	ldr r0, .L08090F70  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r4, .L08090F74  @ gBg1Tm
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L08090F78  @ gBg2Tm
	movs r1, #0
	bl TmFill
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl LoadUiFrameGraphics
	ldr r0, .L08090F7C  @ gUnknown_08A1CD68
	ldr r1, .L08090F80  @ 0x06014800
	bl Decompress
	mov r1, sl
	ldrb r0, [r1]
	ldr r2, .L08090F84  @ gUnknown_08A1D288
	cmp r0, #0
	beq .L08090EC4
	ldr r2, .L08090F88  @ gUnknown_08A1CDC4
.L08090EC4:
	ldr r1, .L08090F8C  @ 0x06015800
	adds r0, r2, #0
	bl Decompress
	ldr r0, .L08090F90  @ gUnknown_08A1B154
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	bl func_08097FDC
	ldr r1, .L08090F94  @ gUnknown_08A1C8B4
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r4, #0
	mov r2, r8
	adds r2, #0x2e
	str r2, [sp, #0x10]
	mov r0, r8
	adds r0, #0x2b
	str r0, [sp, #0xc]
	ldr r6, .L08090F98  @ gUnknown_0200E098
	movs r1, #0x10
	adds r1, r1, r6
	mov r9, r1
	adds r5, r6, #0
	movs r7, #0
.L08090F02:
	lsls r0, r4, #3
	ldr r1, .L08090F9C  @ gUnknown_0200E060
	adds r0, r0, r1
	movs r1, #5
	bl InitText
	adds r0, r5, #0
	movs r1, #8
	bl InitTextDb
	adds r0, r6, #0
	adds r0, #8
	adds r0, r7, r0
	movs r1, #7
	bl InitText
	mov r0, r9
	movs r1, #5
	bl InitText
	movs r2, #0x18
	add r9, r2
	adds r5, #0x18
	adds r7, #0x18
	adds r4, #1
	cmp r4, #6
	ble .L08090F02
	ldr r0, .L08090FA0  @ gUnknown_0200E140
	movs r1, #4
	bl InitText
	ldr r0, .L08090FA4  @ gUnknown_0200E148
	movs r1, #0x14
	bl InitText
	ldr r0, .L08090FA8  @ gUnknown_0200E150
	movs r1, #8
	bl InitText
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	bl func_08090238
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	cmp r0, #4
	bne .L08090FAC
	mov r0, r8
	movs r1, #0
	bl func_08090418
	movs r0, #0
	ldr r1, [sp, #8]
	strb r0, [r1]
	b .L08090FBE
	.align 2, 0
.L08090F70: .4byte gBg0Tm
.L08090F74: .4byte gBg1Tm
.L08090F78: .4byte gBg2Tm
.L08090F7C: .4byte gUnknown_08A1CD68
.L08090F80: .4byte 0x06014800
.L08090F84: .4byte gUnknown_08A1D288
.L08090F88: .4byte gUnknown_08A1CDC4
.L08090F8C: .4byte 0x06015800
.L08090F90: .4byte gUnknown_08A1B154
.L08090F94: .4byte gUnknown_08A1C8B4
.L08090F98: .4byte gUnknown_0200E098
.L08090F9C: .4byte gUnknown_0200E060
.L08090FA0: .4byte gUnknown_0200E140
.L08090FA4: .4byte gUnknown_0200E148
.L08090FA8: .4byte gUnknown_0200E150
.L08090FAC:
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08090FBE
	mov r0, r8
	movs r1, #1
	bl func_08090418
.L08090FBE:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2, #0x3c]
	ldr r0, [sp, #0xc]
	strb r1, [r0]
	ldr r4, .L08091014  @ gUnknown_0200E140
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, .L08091018  @ 0x000004E5
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0809101C  @ gBg2Tm+0x146
	adds r0, r4, #0
	bl PutText
	ldr r1, .L08091020  @ gUnknown_0200F15C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
.L08091000:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge .L08091000
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b .L08091042
	.align 2, 0
.L08091014: .4byte gUnknown_0200E140
.L08091018: .4byte 0x000004E5
.L0809101C: .4byte gBg2Tm+0x146
.L08091020: .4byte gUnknown_0200F15C
.L08091024:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #1
	str r0, [sp]
	mov r0, r8
	ldr r2, .L08091164  @ gBg0Tm
	bl func_080922F0
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
.L08091042:
	cmp r4, r0
	bge .L0809104E
	ldr r0, .L08091168  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt .L08091024
.L0809104E:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #1
	bl func_08092298
	ldr r7, .L0809116C  @ gDispIo
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r5, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x3a
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	movs r6, #1
	orrs r0, r6
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0x36
	adds r0, r0, r7
	mov r9, r0
	ldrb r1, [r0]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r5
	mov r1, r9
	strb r0, [r1]
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, r8
	ldrh r2, [r0, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrb r2, [r7, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r2, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldr r0, .L08091170  @ gUnknown_08A1C7D8
	ldr r1, .L08091174  @ gBg1Tm+0x500
	bl Decompress
	ldr r0, .L08091178  @ gUnknown_08A1A084
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0809117C  @ gUnknown_08A17B08
	mov r1, r8
	bl SpawnProc
	mov r1, r8
	str r0, [r1, #0x40]
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartScreenMenuScrollingBg
	mov r2, r8
	str r0, [r2, #0x44]
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadHelpBoxGfx
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08091164: .4byte gBg0Tm
.L08091168: .4byte gUnknown_0200F158
.L0809116C: .4byte gDispIo
.L08091170: .4byte gUnknown_08A1C7D8
.L08091174: .4byte gBg1Tm+0x500
.L08091178: .4byte gUnknown_08A1A084
.L0809117C: .4byte gUnknown_08A17B08

	THUMB_FUNC_END func_08090D80

	THUMB_FUNC_START func_08091180
func_08091180: @ 0x08091180
	push {lr}
	adds r3, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	adds r0, #8
	movs r2, #1
	strb r2, [r0]
	subs r0, #5
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r0, #9
	ldrb r0, [r0]
	cmp r0, #3
	bne .L080911AC
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	b .L080911B2
.L080911AC:
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
.L080911B2:
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #0
	strb r0, [r2]
	movs r2, #0
	strh r1, [r3, #0x3e]
	adds r1, r3, #0
	adds r1, #0x32
	movs r0, #1
	strb r0, [r1]
	subs r1, #8
	strb r2, [r1]
	adds r1, #9
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, r3, #0
	bl func_08090D80
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08091180

	THUMB_FUNC_START func_080911E4
func_080911E4: @ 0x080911E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x3a
	adds r6, r5, #0
	adds r6, #0x3b
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	bls .L08091268
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl func_080952EC
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b .L08091234
.L08091216:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, .L0809125C  @ gBg0Tm
	bl func_080922F0
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
.L08091234:
	cmp r4, r0
	bge .L08091240
	ldr r0, .L08091260  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt .L08091216
.L08091240:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r0, .L08091264  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809127A
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L0809127A
	.align 2, 0
.L0809125C: .4byte gBg0Tm
.L08091260: .4byte gUnknown_0200F158
.L08091264: .4byte gPlaySt
.L08091268:
	ldr r0, .L08091284  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809127A
	movs r0, #0x6c
	bl m4aSongNumStart
.L0809127A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08091284: .4byte gPlaySt

	THUMB_FUNC_END func_080911E4

	THUMB_FUNC_START func_08091288
func_08091288: @ 0x08091288
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809130C
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl func_08095314
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	adds r6, r5, #0
	adds r6, #0x3b
	b .L080912D8
.L080912BA:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, .L08091300  @ gBg0Tm
	bl func_080922F0
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
.L080912D8:
	cmp r4, r0
	bge .L080912E4
	ldr r0, .L08091304  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt .L080912BA
.L080912E4:
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r0, .L08091308  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809131E
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809131E
	.align 2, 0
.L08091300: .4byte gBg0Tm
.L08091304: .4byte gUnknown_0200F158
.L08091308: .4byte gPlaySt
.L0809130C:
	ldr r0, .L08091328  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809131E
	movs r0, #0x6c
	bl m4aSongNumStart
.L0809131E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08091328: .4byte gPlaySt

	THUMB_FUNC_END func_08091288

	THUMB_FUNC_START func_0809132C
func_0809132C: @ 0x0809132C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	ldr r1, .L08091358  @ gUnknown_0200D6E0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r5, [r0]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq .L08091360
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	ldr r2, .L0809135C  @ 0x00000C52
	b .L080913B2
	.align 2, 0
.L08091358: .4byte gUnknown_0200D6E0
.L0809135C: .4byte 0x00000C52
.L08091360:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq .L080913CA
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08091390
	adds r0, r5, #0
	bl func_08097E74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08091390
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	ldr r2, .L0809138C  @ 0x0000088A
	b .L080913B2
	.align 2, 0
.L0809138C: .4byte 0x0000088A
.L08091390:
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080913C0
	adds r0, r5, #0
	bl func_08097E38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080913C0
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	ldr r2, .L080913BC  @ 0x00000889
.L080913B2:
	movs r0, #0
	adds r3, r4, #0
	bl func_08097DA8
	b .L080913D2
	.align 2, 0
.L080913BC: .4byte 0x00000889
.L080913C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_080911E4
	b .L080913D2
.L080913CA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_08091288
.L080913D2:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809132C

	THUMB_FUNC_START func_080913D8
func_080913D8: @ 0x080913D8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809140C
	ldr r0, .L08091408  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809143C
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0809143C
	.align 2, 0
.L08091408: .4byte gPlaySt
.L0809140C:
	ldr r4, [r5, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r4
	lsrs r1, r0, #0xe
	adds r0, r1, r2
	adds r0, #3
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #0xe
	ldr r0, .L08091444  @ 0xFFFF3FFF
	ands r4, r0
	orrs r4, r1
	str r4, [r5, #0xc]
	ldr r0, .L08091448  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809143C
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809143C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08091444: .4byte 0xFFFF3FFF
.L08091448: .4byte gPlaySt

	THUMB_FUNC_END func_080913D8

	THUMB_FUNC_START func_0809144C
func_0809144C: @ 0x0809144C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, .L08091474  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq .L08091478
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #2
	b .L0809147E
	.align 2, 0
.L08091474: .4byte gKeySt
.L08091478:
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
.L0809147E:
	strb r0, [r1]
	mov r8, r1
	mov r0, ip
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq .L080914A0
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b .L080917CA
.L080914A0:
	movs r1, #1
	mov r9, r1
	mov r6, r9
	ands r6, r4
	cmp r6, #0
	beq .L0809150C
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	beq .L080914C8
	cmp r0, #1
	bgt .L080914C0
	cmp r0, #0
	beq .L080914D0
	b .L080917CA
.L080914C0:
	cmp r0, #3
	bne .L080914C6
	b .L080915BE
.L080914C6:
	b .L080917CA
.L080914C8:
	adds r0, r5, #0
	bl func_0809132C
	b .L080917CA
.L080914D0:
	ldr r1, .L08091504  @ gUnknown_0200D6E0
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl SetLastStatScreenUid
	ldr r0, .L08091508  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080914FC
	movs r0, #0x6a
	bl m4aSongNumStart
.L080914FC:
	adds r0, r5, #0
	bl Proc_Break
	b .L080917CA
	.align 2, 0
.L08091504: .4byte gUnknown_0200D6E0
.L08091508: .4byte gPlaySt
.L0809150C:
	ldrh r1, [r3, #6]
	movs r2, #0x20
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq .L080915A0
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne .L08091560
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	bne .L08091530
	b .L080917CA
.L08091530:
	ldr r1, .L08091558  @ gUnknown_0200D6E0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl func_080913D8
	ldrb r1, [r4]
	ldr r2, .L0809155C  @ gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r6, [sp]
	b .L080915E0
	.align 2, 0
.L08091558: .4byte gUnknown_0200D6E0
.L0809155C: .4byte gBg0Tm
.L08091560:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi .L0809156C
	b .L080917CA
.L0809156C:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	ldr r0, .L0809159C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L08091592
	b .L080917CA
.L08091592:
	movs r0, #0x6f
	bl m4aSongNumStart
	b .L080917CA
	.align 2, 0
.L0809159C: .4byte gPlaySt
.L080915A0:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq .L08091634
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne .L080915F0
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	bne .L080915BE
	b .L080917CA
.L080915BE:
	ldr r1, .L080915E8  @ gUnknown_0200D6E0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	bl func_080913D8
	ldrb r1, [r4]
	ldr r2, .L080915EC  @ gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r7, [sp]
.L080915E0:
	adds r0, r5, #0
	bl func_080922F0
	b .L080917CA
	.align 2, 0
.L080915E8: .4byte gUnknown_0200D6E0
.L080915EC: .4byte gBg0Tm
.L080915F0:
	adds r0, r5, #0
	adds r0, #0x2f
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc .L08091602
	b .L080917CA
.L08091602:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r0, .L08091630  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08091624
	movs r0, #0x6f
	bl m4aSongNumStart
.L08091624:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b .L080917CA
	.align 2, 0
.L08091630: .4byte gPlaySt
.L08091634:
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne .L08091654
	ldrh r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08091716
	ldrh r1, [r3, #0x10]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L08091716
.L08091654:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r0, [r6]
	cmp r0, #0
	bne .L08091688
	adds r0, r7, #0
	ands r0, r4
	cmp r0, #0
	bne .L08091668
	b .L080917CA
.L08091668:
	ldr r0, .L08091684  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809167A
	movs r0, #0x66
	bl m4aSongNumStart
.L0809167A:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #3
	strb r0, [r1]
	b .L080917CA
	.align 2, 0
.L08091684: .4byte gPlaySt
.L08091688:
	subs r0, #1
	strb r0, [r6]
	ldr r0, .L08091708  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809169E
	movs r0, #0x66
	bl m4aSongNumStart
.L0809169E:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bhi .L08091710
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	cmp r0, #0
	beq .L08091710
	cmp r1, #0
	bne .L080916C0
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r0, #1
	strb r0, [r4]
.L080916C0:
	ldrh r1, [r5, #0x3e]
	lsrs r1, r1, #4
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, .L0809170C  @ gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	mov r0, r9
	str r0, [sp]
	adds r0, r5, #0
	bl func_080922F0
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #2
	ldrh r2, [r5, #0x3e]
	subs r2, r2, r0
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080917CA
	b .L080917C6
	.align 2, 0
.L08091708: .4byte gPlaySt
.L0809170C: .4byte gBg0Tm
.L08091710:
	ldrb r0, [r4]
	subs r0, #1
	b .L080917C8
.L08091716:
	mov r0, ip
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne .L0809173C
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080917CA
	ldrh r1, [r2, #0x10]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L080917CA
.L0809173C:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r1, [r6]
	ldr r7, .L080917B8  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge .L080917CA
	adds r0, r1, #1
	strb r0, [r6]
	ldr r0, .L080917BC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08091762
	movs r0, #0x66
	bl m4aSongNumStart
.L08091762:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #4
	bne .L080917C4
	ldrb r1, [r6]
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	beq .L080917C4
	ldrh r1, [r5, #0x3e]
	lsrs r1, r1, #4
	adds r1, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, .L080917C0  @ gBg0Tm
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	adds r0, r5, #0
	bl func_080922F0
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	mov r1, r8
	ldrb r2, [r1]
	lsls r2, r2, #2
	ldrh r0, [r5, #0x3e]
	adds r2, r2, r0
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	b .L080917CA
	.align 2, 0
.L080917B8: .4byte gUnknown_0200F158
.L080917BC: .4byte gPlaySt
.L080917C0: .4byte gBg0Tm
.L080917C4:
	ldrb r0, [r4]
.L080917C6:
	adds r0, #1
.L080917C8:
	strb r0, [r4]
.L080917CA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809144C

	THUMB_FUNC_START func_080917D8
func_080917D8: @ 0x080917D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	ldr r2, .L0809180C  @ gKeySt
	cmp r0, #0
	beq .L08091810
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08091810
	bl MoveableHelpBox_OnEnd
	movs r0, #0
	strb r0, [r4]
	b .L08091AA0
	.align 2, 0
.L0809180C: .4byte gKeySt
.L08091810:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080918F8
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080918F8
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	str r0, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x2a
	movs r0, #1
	strb r0, [r2]
	ldr r0, .L08091898  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	mov r8, r1
	cmp r0, #0
	blt .L0809184A
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809184A:
	ldr r2, .L0809189C  @ gUnknown_08A17C48
	adds r5, r7, #0
	adds r5, #0x2d
	adds r6, r7, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	ldrb r1, [r5]
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r4]
	bl SortUnitList
	lsls r0, r0, #0x18
	mov r9, r4
	movs r1, #0x34
	adds r1, r1, r7
	mov sl, r1
	adds r1, r7, #0
	adds r1, #0x35
	str r1, [sp, #8]
	cmp r0, #0
	beq .L080918CC
	movs r4, #0
	b .L080918B8
	.align 2, 0
.L08091898: .4byte gPlaySt
.L0809189C: .4byte gUnknown_08A17C48
.L080918A0:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #1
	str r0, [sp]
	adds r0, r7, #0
	ldr r2, .L080918F0  @ gBg0Tm
	bl func_080922F0
	adds r4, #1
	cmp r4, #5
	bgt .L080918C0
.L080918B8:
	ldr r0, .L080918F4  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt .L080918A0
.L080918C0:
	ldrh r0, [r7, #0x3e]
	bl func_08090358
	movs r0, #1
	bl EnableBgSync
.L080918CC:
	mov r1, r9
	ldrb r0, [r1]
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r5]
	ldr r1, [sp, #8]
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldr r1, [sp, #4]
	cmp r0, r1
	bne .L080918E6
	b .L08091AA0
.L080918E6:
	mov r1, r8
	ldrb r0, [r1]
	bl func_08090238
	b .L08091AA0
	.align 2, 0
.L080918F0: .4byte gBg0Tm
.L080918F4: .4byte gUnknown_0200F158
.L080918F8:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L08091934
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r4, [r0]
	cmp r4, #0
	bne .L08091934
	ldr r0, .L08091930  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08091920
	movs r0, #0x66
	bl m4aSongNumStart
.L08091920:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	strb r4, [r0]
	b .L08091AA0
	.align 2, 0
.L08091930: .4byte gPlaySt
.L08091934:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq .L080919CA
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	subs r1, #6
	ldrb r0, [r1]
	adds r5, r1, #0
	cmp r0, #0
	bne .L080919C4
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi .L08091962
	b .L08091AA0
.L08091962:
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne .L0809196E
	b .L08091AA0
.L0809196E:
	ldr r0, .L080919BC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08091980
	movs r0, #0x6f
	bl m4aSongNumStart
.L08091980:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r4, #8
	ldr r2, .L080919C0  @ gUnknown_08A17C48
	ldrb r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne .L080919B6
	adds r0, r1, r2
	adds r1, r0, #0
	adds r1, #0x80
.L080919A8:
	subs r1, #0x10
	subs r4, #1
	cmp r4, #0
	ble .L080919B6
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq .L080919A8
.L080919B6:
	strb r4, [r5]
	b .L08091A32
	.align 2, 0
.L080919BC: .4byte gPlaySt
.L080919C0: .4byte gUnknown_08A17C48
.L080919C4:
	subs r0, #1
	strb r0, [r1]
	b .L08091A46
.L080919CA:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08091A60
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r3, r7, #0
	adds r3, #0x2d
	ldrb r0, [r3]
	adds r6, r7, #0
	adds r6, #0x2f
	cmp r0, #8
	beq .L080919FE
	ldr r2, .L08091A3C  @ gUnknown_08A17C48
	adds r4, r0, #1
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne .L08091A44
.L080919FE:
	adds r1, r7, #0
	adds r1, #0x2e
	ldrb r0, [r6]
	ldrb r1, [r1]
	cmp r0, r1
	bcs .L08091AA0
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq .L08091AA0
	strb r5, [r3]
	ldr r0, .L08091A40  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08091A28
	movs r0, #0x6f
	bl m4aSongNumStart
.L08091A28:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08091A32:
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b .L08091AA0
	.align 2, 0
.L08091A3C: .4byte gUnknown_08A17C48
.L08091A40: .4byte gPlaySt
.L08091A44:
	strb r4, [r3]
.L08091A46:
	ldr r0, .L08091A5C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08091AA0
	movs r0, #0x67
	bl m4aSongNumStart
	b .L08091AA0
	.align 2, 0
.L08091A5C: .4byte gPlaySt
.L08091A60:
	ldrh r1, [r2, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08091AA0
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08091AA0
	movs r0, #1
	strb r0, [r1]
	ldr r2, .L08091AB0  @ gUnknown_08A17C48
	adds r3, r7, #0
	adds r3, #0x2d
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl ShowTextHelpBox
.L08091AA0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08091AB0: .4byte gUnknown_08A17C48

	THUMB_FUNC_END func_080917D8

	THUMB_FUNC_START func_08091AB4
func_08091AB4: @ 0x08091AB4
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08091AB4

	THUMB_FUNC_START func_08091AEC
func_08091AEC: @ 0x08091AEC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	ldr r0, .L08091B2C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08091B34
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08091B34
	ldr r0, .L08091B30  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08091B1E
	movs r0, #0x6b
	bl m4aSongNumStart
.L08091B1E:
	movs r0, #0
	bl SetLastStatScreenUid
	adds r0, r4, #0
	bl Proc_Break
	b .L08091BF6
	.align 2, 0
.L08091B2C: .4byte gKeySt
.L08091B30: .4byte gPlaySt
.L08091B34:
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r0, [r5]
	cmp r0, #1
	beq .L08091B62
	cmp r0, #1
	bgt .L08091B48
	cmp r0, #0
	beq .L08091B52
	b .L08091BC4
.L08091B48:
	cmp r0, #2
	beq .L08091B94
	cmp r0, #3
	beq .L08091B5A
	b .L08091BC4
.L08091B52:
	adds r0, r4, #0
	bl func_0809144C
	b .L08091BC4
.L08091B5A:
	adds r0, r4, #0
	bl func_080917D8
	b .L08091BC4
.L08091B62:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r2, r2, #2
	ldrh r0, [r4, #0x3e]
	adds r2, r2, r0
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r0, [r4, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L08091BC4
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl func_08090358
	b .L08091BC4
.L08091B94:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldrh r2, [r4, #0x3e]
	subs r2, r2, r0
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r0, [r4, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L08091BC4
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl func_08090358
.L08091BC4:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08091BF6
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	cmp r6, r3
	beq .L08091BF6
	ldr r2, .L08091BFC  @ gUnknown_08A17C48
	adds r0, #9
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl ShowTextHelpBox
.L08091BF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08091BFC: .4byte gUnknown_08A17C48

	THUMB_FUNC_END func_08091AEC

	THUMB_FUNC_START func_08091C00
func_08091C00: @ 0x08091C00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08091C28
	ldr r1, .L08091CA8  @ gUnknown_0200D6E0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl func_080953C0
	bl func_0809014C
.L08091C28:
	ldr r3, .L08091CAC  @ gPlaySt
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x32
	lsls r0, r0, #7
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r0, [r3, #0x1a]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	cmp r2, #0
	beq .L08091C52
	lsls r2, r2, #4
	ldrb r1, [r3, #0x19]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x19]
.L08091C52:
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq .L08091C62
	bl Proc_End
.L08091C62:
	bl EndGreenText
	ldr r0, .L08091CB0  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08091CB4  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08091CB8  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	ldr r2, .L08091CBC  @ gDispIo
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
	bl ResetTextFont
	bl ClearIcons
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08091CA8: .4byte gUnknown_0200D6E0
.L08091CAC: .4byte gPlaySt
.L08091CB0: .4byte gBg0Tm
.L08091CB4: .4byte gBg1Tm
.L08091CB8: .4byte gBg2Tm
.L08091CBC: .4byte gDispIo

	THUMB_FUNC_END func_08091C00

	THUMB_FUNC_START func_08091CC0
func_08091CC0: @ 0x08091CC0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, .L08091CE4  @ gUnknown_0200D7E0
	movs r1, #0x1f
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	cmp r4, r0
	bge .L08091D12
	ldr r0, .L08091CE8  @ gUnknown_0200F158
	adds r6, r5, #0
	adds r6, #0x2f
	b .L08091D0C
	.align 2, 0
.L08091CE4: .4byte gUnknown_0200D7E0
.L08091CE8: .4byte gUnknown_0200F158
.L08091CEC:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, .L08091D48  @ gUnknown_0200D7E0
	bl func_080922F0
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
	cmp r4, r0
	bge .L08091D12
	ldr r0, .L08091D4C  @ gUnknown_0200F158
.L08091D0C:
	ldrb r0, [r0]
	cmp r4, r0
	blt .L08091CEC
.L08091D12:
	ldr r4, .L08091D50  @ gUnknown_0200DFE0
	adds r0, r4, #0
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r6, r5, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	adds r0, r4, #0
	bl func_080921CC
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x3c]
	ldrb r0, [r6]
	adds r2, r5, #0
	adds r2, #0x37
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08091D48: .4byte gUnknown_0200D7E0
.L08091D4C: .4byte gUnknown_0200F158
.L08091D50: .4byte gUnknown_0200DFE0

	THUMB_FUNC_END func_08091CC0

	THUMB_FUNC_START func_08091D54
func_08091D54: @ 0x08091D54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x38
	ldr r1, .L08091DB4  @ gUnknown_08A17B30
	ldrh r0, [r5, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls .L08091D80
	movs r0, #0x14
	strb r0, [r2]
.L08091D80:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r3, #0
	str r2, [sp, #0xc]
	adds r2, r5, #0
	adds r2, #0x36
	str r2, [sp, #8]
	movs r0, #0x2f
	adds r0, r0, r5
	mov sl, r0
	ldr r1, [sp, #0xc]
	str r1, [sp, #4]
.L08091D9A:
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	mov r1, sl
	ldrb r1, [r1]
	cmp r0, r1
	bls .L08091DB8
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	adds r0, r3, r0
	cmp r0, #0x14
	bgt .L08091DC0
	b .L08091DC6
	.align 2, 0
.L08091DB4: .4byte gUnknown_08A17B30
.L08091DB8:
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r3, r0
	bge .L08091DC4
.L08091DC0:
	movs r1, #0
	b .L08091DCC
.L08091DC4:
	subs r0, r3, r0
.L08091DC6:
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
.L08091DCC:
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	lsls r6, r1, #1
	adds r2, r3, #1
	mov r9, r2
	cmp r4, r0
	bge .L08091E10
	movs r0, #0x1f
	mov r8, r0
	ldr r1, .L08091E8C  @ gBg0Tm
	mov ip, r1
	ldr r7, .L08091E90  @ gUnknown_0200D7E0
	adds r2, r6, #0
.L08091DEA:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #5
	adds r1, #8
	adds r1, r1, r3
	lsls r1, r1, #1
	add r1, ip
	lsls r0, r0, #6
	adds r0, r2, r0
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt .L08091DEA
.L08091E10:
	ldr r0, .L08091E94  @ gBg2Tm
	ldr r1, .L08091E98  @ gUnknown_0200DFE0
	adds r2, r6, r1
	adds r1, r3, #0
	adds r1, #0xa8
	movs r4, #1
	lsls r1, r1, #1
	adds r1, r1, r0
.L08091E20:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #0x40
	adds r1, #0x40
	subs r4, #1
	cmp r4, #0
	bge .L08091E20
	mov r3, r9
	cmp r3, #0x13
	ble .L08091D9A
	movs r0, #5
	bl EnableBgSync
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	cmp r0, #0x13
	bls .L08091EF4
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	mov r2, sl
	strb r0, [r2]
	ldr r0, .L08091E9C  @ gBg2Tm+0x150
	movs r1, #0x16
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L08091EA0  @ gBg0Tm+0x10
	movs r1, #0x16
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	adds r4, r5, #0
	adds r4, #0x32
	adds r6, r5, #0
	adds r6, #0x2e
	ldr r1, .L08091EA4  @ gUnknown_0200F15C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
.L08091E72:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge .L08091E72
	bl ClearIcons
	ldrb r0, [r4]
	bl func_08090238
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b .L08091EC4
	.align 2, 0
.L08091E8C: .4byte gBg0Tm
.L08091E90: .4byte gUnknown_0200D7E0
.L08091E94: .4byte gBg2Tm
.L08091E98: .4byte gUnknown_0200DFE0
.L08091E9C: .4byte gBg2Tm+0x150
.L08091EA0: .4byte gBg0Tm+0x10
.L08091EA4: .4byte gUnknown_0200F15C
.L08091EA8:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r0, sl
	ldrb r3, [r0]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, .L08091F04  @ gUnknown_0200D7E0
	bl func_080922F0
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
.L08091EC4:
	cmp r4, r0
	bge .L08091ED0
	ldr r0, .L08091F08  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt .L08091EA8
.L08091ED0:
	ldr r0, .L08091F0C  @ gUnknown_0200DFE0
	mov r2, sl
	ldrb r1, [r2]
	bl func_080921CC
	ldrb r0, [r6]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #0
	bl func_08092298
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	bl Proc_Break
.L08091EF4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08091F04: .4byte gUnknown_0200D7E0
.L08091F08: .4byte gUnknown_0200F158
.L08091F0C: .4byte gUnknown_0200DFE0

	THUMB_FUNC_END func_08091D54

	THUMB_FUNC_START func_08091F10
func_08091F10: @ 0x08091F10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov r2, r8
	adds r2, #0x38
	ldr r1, .L08091FEC  @ gUnknown_08A17B36
	mov r3, r8
	ldrh r0, [r3, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls .L08091F3E
	movs r0, #0x14
	strb r0, [r2]
.L08091F3E:
	mov r3, r8
	ldrh r0, [r3, #0x3c]
	adds r0, #1
	strh r0, [r3, #0x3c]
	mov r0, r8
	adds r0, #0x36
	mov r1, r8
	adds r1, #0x37
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls .L08092000
	movs r5, #0
	str r2, [sp]
	ldrb r0, [r2]
	cmp r5, r0
	blt .L08091F62
	b .L0809208E
.L08091F62:
	adds r7, r2, #0
.L08091F64:
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	movs r3, #8
	adds r3, r3, r5
	mov ip, r3
	adds r5, #1
	mov sl, r5
	cmp r4, r0
	bge .L08091FB6
	adds r5, r6, #0
	lsls r2, r3, #1
	movs r0, #0x1f
	mov r9, r0
.L08091F88:
	adds r3, r4, #0
	mov r1, r9
	ands r3, r1
	lsls r1, r3, #5
	ldrb r0, [r7]
	subs r0, r5, r0
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L08091FF0  @ gBg0Tm
	adds r1, r1, r0
	lsls r0, r3, #6
	adds r0, r2, r0
	ldr r3, .L08091FF4  @ gUnknown_0200D7E0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt .L08091F88
.L08091FB6:
	ldr r3, .L08091FF8  @ gBg2Tm
	mov r9, r3
	adds r5, r6, #0
	mov r1, ip
	lsls r0, r1, #1
	ldr r3, .L08091FFC  @ gUnknown_0200DFE0
	adds r2, r0, r3
	movs r3, #0xa0
	movs r4, #1
.L08091FC8:
	ldrb r0, [r7]
	subs r0, r5, r0
	adds r0, r3, r0
	lsls r0, r0, #1
	add r0, r9
	ldrh r1, [r2]
	strh r1, [r0]
	adds r2, #0x40
	adds r3, #0x20
	subs r4, #1
	cmp r4, #0
	bge .L08091FC8
	mov r5, sl
	ldrb r0, [r7]
	cmp r5, r0
	blt .L08091F64
	b .L0809208E
	.align 2, 0
.L08091FEC: .4byte gUnknown_08A17B36
.L08091FF0: .4byte gBg0Tm
.L08091FF4: .4byte gUnknown_0200D7E0
.L08091FF8: .4byte gBg2Tm
.L08091FFC: .4byte gUnknown_0200DFE0
.L08092000:
	movs r5, #0
	str r2, [sp]
	ldrb r1, [r2]
	cmp r5, r1
	bge .L0809208E
	adds r7, r2, #0
.L0809200C:
	mov r3, r8
	ldrh r0, [r3, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	adds r1, r5, #1
	mov sl, r1
	cmp r4, r0
	bge .L0809205C
	mov ip, r6
	movs r3, #0x1f
	mov r9, r3
.L08092028:
	adds r3, r4, #0
	mov r0, r9
	ands r3, r0
	lsls r2, r3, #5
	adds r2, #8
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r1, .L080920B4  @ gBg0Tm
	adds r2, r2, r1
	ldrb r0, [r7]
	mov r1, ip
	subs r0, r1, r0
	lsls r0, r0, #1
	lsls r1, r3, #6
	adds r0, r0, r1
	ldr r3, .L080920B8  @ gUnknown_0200D7E0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt .L08092028
.L0809205C:
	movs r4, #0
	ldr r3, .L080920BC  @ gUnknown_0200DFE0
	mov ip, r3
	adds r3, r6, #0
	adds r0, r5, #0
	adds r0, #0xa8
	lsls r0, r0, #1
	ldr r1, .L080920C0  @ gBg2Tm
	adds r2, r0, r1
.L0809206E:
	ldrb r0, [r7]
	subs r0, r3, r0
	lsls r0, r0, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #0x40
	adds r4, #1
	cmp r4, #1
	ble .L0809206E
	mov r5, sl
	ldrb r3, [r7]
	cmp r5, r3
	blt .L0809200C
.L0809208E:
	movs r0, #5
	bl EnableBgSync
	ldr r1, [sp]
	ldrb r0, [r1]
	cmp r0, #0x13
	bls .L080920A2
	mov r0, r8
	bl Proc_Break
.L080920A2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080920B4: .4byte gBg0Tm
.L080920B8: .4byte gUnknown_0200D7E0
.L080920BC: .4byte gUnknown_0200DFE0
.L080920C0: .4byte gBg2Tm

	THUMB_FUNC_END func_08091F10

	THUMB_FUNC_START StartUnitListMenu
StartUnitListMenu: @ 0x080920C4
	push {lr}
	ldr r0, .L080920D8  @ gUnknown_08A177A0
	movs r1, #3
	bl SpawnProc
	adds r0, #0x39
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L080920D8: .4byte gUnknown_08A177A0

	THUMB_FUNC_END StartUnitListMenu

	THUMB_FUNC_START func_080920DC
func_080920DC: @ 0x080920DC
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne .L080920F4
	ldr r0, .L080920F0  @ gUnknown_08A178C0
	movs r1, #3
	bl SpawnProc
	b .L080920FA
	.align 2, 0
.L080920F0: .4byte gUnknown_08A178C0
.L080920F4:
	ldr r0, .L08092118  @ gUnknown_08A178C0
	bl SpawnProcLocking
.L080920FA:
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0809211C
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #5
	b .L08092124
	.align 2, 0
.L08092118: .4byte gUnknown_08A178C0
.L0809211C:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x3a
.L08092124:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080920DC

	THUMB_FUNC_START func_08092134
func_08092134: @ 0x08092134
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne .L0809214C
	ldr r0, .L08092148  @ gUnknown_08A17990
	movs r1, #3
	bl SpawnProc
	b .L08092152
	.align 2, 0
.L08092148: .4byte gUnknown_08A17990
.L0809214C:
	ldr r0, .L08092160  @ gUnknown_08A17990
	bl SpawnProcLocking
.L08092152:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #3
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08092160: .4byte gUnknown_08A17990

	THUMB_FUNC_END func_08092134

	THUMB_FUNC_START func_08092164
func_08092164: @ 0x08092164
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne .L0809217C
	ldr r0, .L08092178  @ gUnknown_08A178C0
	movs r1, #3
	bl SpawnProc
	b .L08092182
	.align 2, 0
.L08092178: .4byte gUnknown_08A178C0
.L0809217C:
	ldr r0, .L08092190  @ gUnknown_08A178C0
	bl SpawnProcLocking
.L08092182:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08092190: .4byte gUnknown_08A178C0

	THUMB_FUNC_END func_08092164

	THUMB_FUNC_START func_08092194
func_08092194: @ 0x08092194
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne .L080921AC
	ldr r0, .L080921A8  @ gUnknown_08A17A30
	movs r1, #3
	bl SpawnProc
	b .L080921B2
	.align 2, 0
.L080921A8: .4byte gUnknown_08A17A30
.L080921AC:
	ldr r0, .L080921C8  @ gUnknown_08A17A30
	bl SpawnProcLocking
.L080921B2:
	adds r4, r0, #0
	bl ResetUnitSprites
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #5
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080921C8: .4byte gUnknown_08A17A30

	THUMB_FUNC_END func_08092194

	THUMB_FUNC_START func_080921CC
func_080921CC: @ 0x080921CC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r7, #0
	adds r6, #0x12
	adds r0, r6, #0
	movs r1, #0x13
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L08092214  @ gUnknown_0200E148
	mov r8, r0
	bl ClearText
	cmp r4, #5
	bne .L08092218
	movs r5, #0
	adds r4, r6, #0
.L080921FA:
	adds r1, r5, #0
	adds r1, #0x70
	adds r0, r4, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #4
	adds r5, #1
	cmp r5, #7
	ble .L080921FA
	b .L0809227C
	.align 2, 0
.L08092214: .4byte gUnknown_0200E148
.L08092218:
	movs r5, #1
	ldr r3, .L08092290  @ gUnknown_08A17C48
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #4
	adds r2, r1, #0
	adds r2, #0x10
	adds r0, r2, r3
	ldrb r0, [r0, #8]
	adds r7, #0x10
	mov r9, r7
	cmp r0, #0
	beq .L08092274
	mov r7, r8
	mov r8, r3
	adds r0, r1, r3
	adds r4, r0, #0
	adds r4, #0x10
	adds r6, r2, #0
.L0809223E:
	ldrb r1, [r4, #8]
	subs r1, #0x40
	adds r0, r7, #0
	bl Text_SetCursor
	adds r0, r7, #0
	movs r1, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #4
	adds r0, r6, r0
	ldr r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_DrawString
	adds r4, #0x10
	adds r6, #0x10
	adds r5, #1
	cmp r5, #8
	bgt .L08092274
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne .L0809223E
.L08092274:
	ldr r0, .L08092294  @ gUnknown_0200E148
	mov r1, r9
	bl PutText
.L0809227C:
	movs r0, #4
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08092290: .4byte gUnknown_08A17C48
.L08092294: .4byte gUnknown_0200E148

	THUMB_FUNC_END func_080921CC

	THUMB_FUNC_START func_08092298
func_08092298: @ 0x08092298
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r7, r3, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	cmp r3, #0
	beq .L080922CE
	ldr r4, .L080922E8  @ gBg2Tm+0xF4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r3, #0
	bl PutNumber
	adds r0, r4, #2
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
.L080922CE:
	cmp r5, #0
	beq .L080922DA
	ldr r0, .L080922EC  @ gBg2Tm+0x140
	adds r1, r7, #0
	bl func_080921CC
.L080922DA:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080922E8: .4byte gBg2Tm+0xF4
.L080922EC: .4byte gBg2Tm+0x140

	THUMB_FUNC_END func_08092298

	THUMB_FUNC_START func_080922F0
func_080922F0: @ 0x080922F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	str r0, [sp, #0x24]
	mov sl, r2
	ldr r4, [sp, #0x78]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	lsls r0, r7, #1
	str r0, [sp, #0x30]
	movs r0, #0x1f
	ldr r1, [sp, #0x30]
	ands r1, r0
	str r1, [sp, #0x30]
	ldr r1, .L0809238C  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	negs r0, r0
	lsrs r0, r0, #0x1f
	mov r9, r0
	cmp r4, #0
	beq .L080923CA
	ldr r2, [sp, #0x2c]
	lsls r4, r2, #3
	ldr r0, .L08092390  @ gUnknown_0200E060
	adds r5, r4, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	bne .L08092394
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08092394
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08092394
	adds r0, r5, #0
	movs r1, #4
	bl Text_SetColor
	b .L0809239E
	.align 2, 0
.L0809238C: .4byte gUnknown_0200D6E0
.L08092390: .4byte gUnknown_0200E060
.L08092394:
	ldr r0, .L08092414  @ gUnknown_0200E060
	add r0, r8
	mov r1, r9
	bl Text_SetColor
.L0809239E:
	ldr r4, .L08092414  @ gUnknown_0200E060
	add r4, r8
	ldr r1, .L08092418  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r3, [sp, #0x30]
	lsls r1, r3, #6
	add r1, sl
	adds r1, #6
	adds r0, r4, #0
	bl PutText
.L080923CA:
	ldr r4, [sp, #0x2c]
	lsls r5, r4, #1
	adds r0, r5, r4
	lsls r0, r0, #3
	mov r8, r0
	ldr r6, .L0809241C  @ gUnknown_0200E098
	adds r0, r0, r6
	bl ClearText
	adds r0, r6, #0
	adds r0, #8
	add r0, r8
	bl ClearText
	ldr r0, [sp, #0x30]
	lsls r4, r0, #6
	mov r1, sl
	adds r1, r1, r4
	str r1, [sp, #0x34]
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0x18
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	str r4, [sp, #0x54]
	str r5, [sp, #0x50]
	ldr r2, [sp, #0x28]
	cmp r2, #5
	bls .L0809240A
	b .L08092A48
.L0809240A:
	lsls r0, r2, #2
	ldr r1, .L08092420  @ .L08092424
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08092414: .4byte gUnknown_0200E060
.L08092418: .4byte gUnknown_0200D6E0
.L0809241C: .4byte gUnknown_0200E098
.L08092420: .4byte .L08092424
.L08092424: @ jump table
	.4byte .L0809243C @ case 0
	.4byte .L080925A0 @ case 1
	.4byte .L08092664 @ case 2
	.4byte .L0809279A @ case 3
	.4byte .L080928B0 @ case 4
	.4byte .L080929E8 @ case 5
.L0809243C:
	ldr r0, .L080924B0  @ gUnknown_0200D6E0
	lsls r6, r7, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetMsg
	adds r2, r0, #0
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r5, r3, r4
	lsls r5, r5, #3
	ldr r4, .L080924B4  @ gUnknown_0200E098
	adds r0, r5, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	movs r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	bl PutDrawText
	adds r4, #8
	adds r5, r5, r4
	mov r4, r9
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetColor
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	str r6, [sp, #0x4c]
	cmp r0, #0
	bne .L080924BC
	ldr r0, .L080924B8  @ 0x00000537
	bl GetMsg
	adds r1, r7, #0
	adds r1, #0x22
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	b .L0809251A
	.align 2, 0
.L080924B0: .4byte gUnknown_0200D6E0
.L080924B4: .4byte gUnknown_0200E098
.L080924B8: .4byte 0x00000537
.L080924BC:
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r1, r7, #0
	adds r1, #0x22
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	adds r4, r7, #0
	adds r4, #0x1e
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIcon
	bl func_08090324
.L0809251A:
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r0, r3, r4
	lsls r0, r0, #3
	ldr r1, .L08092550  @ gUnknown_0200E0A8
	adds r5, r0, r1
	adds r0, r5, #0
	bl ClearText
	ldr r0, .L08092554  @ gUnknown_0200D6E0
	ldr r6, [sp, #0x4c]
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r4, r0
	beq .L08092562
	cmp r4, r0
	bhi .L08092558
	cmp r4, #0
	beq .L08092584
	b .L08092BC6
	.align 2, 0
.L08092550: .4byte gUnknown_0200E0A8
.L08092554: .4byte gUnknown_0200D6E0
.L08092558:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	beq .L08092566
	b .L08092BC6
.L08092562:
	movs r0, #0xbf
	b .L08092568
.L08092566:
	movs r0, #0xc0
.L08092568:
	bl GetMsg
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #8
	bl PutDrawText
	b .L08092BC6
.L08092584:
	movs r0, #0xbe
	bl GetMsg
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
	b .L08092BC6
.L080925A0:
	ldr r1, .L0809265C  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, .L08092660  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	mov r8, r9
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #4
	bl PutDrawText
	adds r3, r7, #0
	adds r3, #0x22
	movs r1, #2
	mov r4, r9
	cmp r4, #0
	beq .L080925E6
	movs r1, #1
.L080925E6:
	ldr r0, [r6]
	ldr r0, [r0]
	movs r2, #8
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x28
	movs r1, #2
	mov r0, r9
	cmp r0, #0
	beq .L08092602
	movs r1, #1
.L08092602:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r2, [r0, #9]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r5, r7, #0
	adds r5, #0x2e
	movs r4, #2
	mov r1, r9
	cmp r1, #0
	beq .L0809261C
	movs r4, #1
.L0809261C:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r0, r7, #0
	adds r0, #0x30
	mov r1, r8
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, r7, #0
	adds r4, #0x34
	movs r5, #2
	mov r2, r9
	cmp r2, #0
	beq .L08092648
	movs r5, #1
.L08092648:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	b .L08092BC6
	.align 2, 0
.L0809265C: .4byte gUnknown_0200D6E0
.L08092660: .4byte gUnknown_0200E098
.L08092664:
	ldr r5, [sp, #0x54]
	add r5, sl
	movs r3, #0x12
	adds r3, r3, r5
	mov r8, r3
	ldr r1, .L08092788  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne .L0809268A
	movs r6, #4
.L0809268A:
	adds r0, r2, #0
	bl GetUnitPower
	adds r2, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x18
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x15
	ldrsb r1, [r0, r1]
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne .L080926B4
	movs r6, #4
.L080926B4:
	adds r0, r2, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x1e
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne .L080926DE
	movs r6, #4
.L080926DE:
	adds r0, r2, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x24
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	movs r6, #2
	cmp r0, #0x1e
	bne .L08092702
	movs r6, #4
.L08092702:
	adds r0, r1, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x2a
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x17
	ldrsb r1, [r0, r1]
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne .L0809272C
	movs r6, #4
.L0809272C:
	adds r0, r2, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x30
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x18
	ldrsb r1, [r0, r1]
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne .L08092756
	movs r6, #4
.L08092756:
	adds r0, r2, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0809278C
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b .L08092BC6
	.align 2, 0
.L08092788: .4byte gUnknown_0200D6E0
.L0809278C:
	adds r0, r5, #0
	adds r0, #0x34
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b .L08092BC6
.L0809279A:
	ldr r0, .L080927DC  @ gUnknown_0200D6E0
	lsls r4, r7, #2
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	str r4, [sp, #0x4c]
	cmp r5, #0
	bne .L080927E8
	ldr r0, .L080927E0  @ 0x00000537
	bl GetMsg
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, .L080927E4  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x14
	mov r2, r9
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	b .L0809284C
	.align 2, 0
.L080927DC: .4byte gUnknown_0200D6E0
.L080927E0: .4byte 0x00000537
.L080927E4: .4byte gUnknown_0200E098
.L080927E8:
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r5, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, .L080928A8  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x14
	mov r2, r9
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	adds r4, #0x10
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIcon
	bl func_08090324
.L0809284C:
	ldr r5, [sp, #0x54]
	add r5, sl
	adds r3, r5, #0
	adds r3, #0x24
	movs r1, #2
	mov r4, r9
	cmp r4, #0
	beq .L0809285E
	movs r1, #1
.L0809285E:
	ldr r0, .L080928AC  @ gUnknown_0200D6E0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	movs r6, #4
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r5, #0
	adds r3, #0x2c
	movs r1, #2
	mov r0, r9
	cmp r0, #0
	beq .L0809287E
	movs r1, #1
.L0809287E:
	ldr r0, [r4]
	movs r6, #6
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r1, r5, #0
	adds r1, #0x34
	movs r3, #2
	mov r0, r9
	cmp r0, #0
	beq .L08092898
	movs r3, #1
.L08092898:
	ldr r0, [r4]
	movs r4, #8
	ldrsh r2, [r0, r4]
	adds r0, r1, #0
	adds r1, r3, #0
	bl PutNumberOrBlank
	b .L08092BC6
	.align 2, 0
.L080928A8: .4byte gUnknown_0200E098
.L080928AC: .4byte gUnknown_0200D6E0
.L080928B0:
	ldr r0, .L080928F4  @ gUnknown_0200D6E0
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r5, [r2, #0xc]
	movs r0, #0x10
	ands r5, r0
	str r1, [sp, #0x4c]
	cmp r5, #0
	beq .L080928FC
	adds r0, r2, #0
	bl GetUnitRescueName
	adds r5, r0, #0
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r0, r0, #3
	ldr r1, .L080928F8  @ gUnknown_0200E0A0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x22
	mov r2, r9
	negs r4, r2
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #2
	bl PutDrawText
	b .L08092924
	.align 2, 0
.L080928F4: .4byte gUnknown_0200D6E0
.L080928F8: .4byte gUnknown_0200E0A0
.L080928FC:
	ldr r0, .L080929D8  @ 0x00000536
	bl GetMsg
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, .L080929DC  @ gUnknown_0200E0A0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x22
	mov r2, r9
	negs r4, r2
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #2
	bl PutDrawText
.L08092924:
	mov r8, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r3, r7, #0
	adds r3, #0x14
	movs r1, #2
	mov r4, r9
	cmp r4, #0
	beq .L08092938
	movs r1, #1
.L08092938:
	ldr r0, .L080929E0  @ gUnknown_0200D6E0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	ldr r0, [r0]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x1a
	movs r5, #2
	mov r0, r9
	cmp r0, #0
	beq .L08092964
	movs r5, #1
.L08092964:
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r5, r7, #0
	adds r5, #0x20
	movs r6, #2
	mov r1, r9
	cmp r1, #0
	beq .L08092994
	movs r6, #1
.L08092994:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitStatusName
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x2c]
	adds r0, r2, r3
	lsls r0, r0, #3
	ldr r1, .L080929E4  @ gUnknown_0200E098
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x2e
	mov r6, r8
	mov r2, r9
	orrs r6, r2
	lsrs r2, r6, #0x1f
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	movs r3, #2
	bl PutDrawText
	b .L08092BC6
	.align 2, 0
.L080929D8: .4byte 0x00000536
.L080929DC: .4byte gUnknown_0200E0A0
.L080929E0: .4byte gUnknown_0200D6E0
.L080929E4: .4byte gUnknown_0200E098
.L080929E8:
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, .L08092A40  @ gUnknown_0200D6E0
	adds r7, r3, r0
	ldr r5, [sp, #0x54]
	add r5, sl
.L080929F4:
	add r1, sp, #8
	ldr r0, .L08092A44  @ gUnknown_08205B94
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	bl GetWeaponLevelFromExp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r6, #2
	adds r0, #0x14
	adds r3, r5, r0
	movs r1, #2
	cmp r4, #6
	bne .L08092A24
	movs r1, #4
.L08092A24:
	lsls r0, r4, #2
	add r0, sp
	adds r0, #8
	ldr r2, [r0]
	adds r0, r3, #0
	bl PutSpecialChar
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls .L080929F4
	b .L08092BC6
	.align 2, 0
.L08092A40: .4byte gUnknown_0200D6E0
.L08092A44: .4byte gUnknown_08205B94
.L08092A48:
	ldr r1, [sp, #0x28]
	subs r1, #6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x38]
	movs r4, #0
	str r4, [sp, #0x3c]
	ldr r1, .L08092B10  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSupportCount
	str r0, [sp, #0x40]
	adds r0, r6, #0
	adds r0, #0x10
	add r0, r8
	bl ClearText
	movs r6, #0
	ldr r0, [sp, #0x40]
	cmp r4, r0
	blt .L08092A7E
	b .L08092B7E
.L08092A7E:
	adds r7, r5, #0
	mov r1, r8
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	str r2, [sp, #0x48]
	mov r3, r9
	negs r3, r3
	mov r0, r9
	orrs r3, r0
	mov r8, r3
.L08092A92:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08092B72
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	cmp r1, r2
	bcc .L08092B68
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportUnit
	cmp r0, #0
	beq .L08092B72
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportUnit
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne .L08092B18
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetPInfo
	ldrh r0, [r0]
	bl GetMsg
	adds r2, r0, #0
	lsls r0, r4, #3
	ldr r1, .L08092B14  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r3, [sp, #0x44]
	adds r0, r3, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r3, [sp, #0x48]
	adds r1, r3, r1
	str r5, [sp]
	str r2, [sp, #4]
	mov r3, r8
	lsrs r2, r3, #0x1f
	movs r3, #0
	bl PutDrawText
	b .L08092B56
	.align 2, 0
.L08092B10: .4byte gUnknown_0200D6E0
.L08092B14: .4byte gUnknown_0200E098
.L08092B18:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetPInfo
	ldrh r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, .L08092B64  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	adds r0, r1, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r2, [sp, #0x48]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #1
	movs r3, #0
	bl PutDrawText
.L08092B56:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq .L08092B7E
	b .L08092B72
	.align 2, 0
.L08092B64: .4byte gUnknown_0200E098
.L08092B68:
	ldr r0, [sp, #0x3c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
.L08092B72:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x40]
	cmp r6, r3
	blt .L08092A92
.L08092B7E:
	cmp r4, #2
	bhi .L08092BC6
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r5, r0, #3
	ldr r7, [sp, #0x54]
	add r7, sl
	mov r2, r9
	negs r6, r2
	orrs r6, r2
.L08092B94:
	ldr r0, .L08092BDC  @ 0x00000536
	bl GetMsg
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, .L08092BE0  @ gUnknown_0200E098
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	adds r1, r7, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	lsrs r2, r6, #0x1f
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls .L08092B94
.L08092BC6:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08092BDC: .4byte 0x00000536
.L08092BE0: .4byte gUnknown_0200E098

	THUMB_FUNC_END func_080922F0

	THUMB_FUNC_START SortUnitList_GetUnitSoloAnimation
SortUnitList_GetUnitSoloAnimation: @ 0x08092BE4
	ldr r0, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	bx lr

	THUMB_FUNC_END SortUnitList_GetUnitSoloAnimation

	THUMB_FUNC_START SortUnitList
SortUnitList: @ 0x08092BF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #1
	ands r2, r1
	subs r0, #1
	cmp r0, #0x1f
	bls .L08092C12
	bl .L08094FE0
.L08092C12:
	lsls r0, r0, #2
	ldr r1, .L08092C1C  @ .L08092C20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08092C1C: .4byte .L08092C20
.L08092C20: @ jump table
	.4byte .L08092CA0 @ case 0
	.4byte .L08092F90 @ case 1
	.4byte .L08092E84 @ case 2
	.4byte .L08093094 @ case 3
	.4byte .L08093190 @ case 4
	.4byte .L0809329C @ case 5
	.4byte .L080933A8 @ case 6
	.4byte .L080934B4 @ case 7
	.4byte .L080935C0 @ case 8
	.4byte .L080936CC @ case 9
	.4byte .L080937D8 @ case 10
	.4byte .L080938E4 @ case 11
	.4byte .L08093C58 @ case 12
	.4byte .L08093D64 @ case 13
	.4byte .L08093F68 @ case 14
	.4byte .L0809405C @ case 15
	.4byte .L08094150 @ case 16
	.4byte .L08094244 @ case 17
	.4byte .L080939F0 @ case 18
	.4byte .L08093B4C @ case 19
	.4byte .L08094374 @ case 20
	.4byte .L08094480 @ case 21
	.4byte .L08094608 @ case 22
	.4byte .L0809470C @ case 23
	.4byte .L08094808 @ case 24
	.4byte .L08094904 @ case 25
	.4byte .L08094A00 @ case 26
	.4byte .L08094AFC @ case 27
	.4byte .L08094BF8 @ case 28
	.4byte .L08094CF4 @ case 29
	.4byte .L08094DF0 @ case 30
	.4byte .L08094EDC @ case 31
.L08092CA0:
	cmp r2, #0
	bne .L08092D94
	movs r0, #0
	str r0, [sp, #0x40]
	movs r1, #0
	ldr r3, .L08092D8C  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge .L08092D16
	adds r7, r3, #0
	mov sl, r7
.L08092CBA:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L08092D06
	ldr r7, .L08092D90  @ gUnknown_0200D6E0
	mov r9, r7
.L08092CCE:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r0, r3, #2
	adds r4, r0, r1
	ldr r3, [r4]
	ldr r0, [r3]
	ldr r1, [r0]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bcs .L08092CF6
	str r5, [r4]
	str r3, [r6]
	movs r2, #1
	str r2, [sp, #0x40]
.L08092CF6:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt .L08092CCE
.L08092D06:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L08092CBA
.L08092D16:
	movs r1, #0
	ldr r7, .L08092D8C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge .L08092D86
	mov sl, r7
.L08092D24:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L08092D76
	ldr r7, .L08092D90  @ gUnknown_0200D6E0
	mov r9, r7
	movs r7, #2
	mov ip, r8
.L08092D3C:
	adds r6, r3, #1
	lsls r0, r6, #2
	mov r1, r9
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ands r1, r7
	lsls r0, r3, #2
	mov r2, r9
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r1, r0
	bcs .L08092D66
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x40]
.L08092D66:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r2, ip
	subs r0, r0, r2
	cmp r3, r0
	blt .L08092D3C
.L08092D76:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	ldr r7, .L08092D8C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt .L08092D24
.L08092D86:
	ldr r0, [sp, #0x40]
	bl .L080945F2
	.align 2, 0
.L08092D8C: .4byte gUnknown_0200F158
.L08092D90: .4byte gUnknown_0200D6E0
.L08092D94:
	movs r1, #0
	str r1, [sp, #0x44]
	ldr r2, .L08092E7C  @ gUnknown_0200F158
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	adds r3, r1, #0
	cmp r3, r0
	bge .L08092E06
	adds r7, r2, #0
	mov sl, r7
.L08092DAA:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L08092DF6
	ldr r7, .L08092E80  @ gUnknown_0200D6E0
	mov r9, r7
.L08092DBE:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r0, r3, #2
	adds r4, r0, r1
	ldr r3, [r4]
	ldr r0, [r3]
	ldr r1, [r0]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bls .L08092DE6
	str r5, [r4]
	str r3, [r6]
	movs r2, #1
	str r2, [sp, #0x44]
.L08092DE6:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt .L08092DBE
.L08092DF6:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L08092DAA
.L08092E06:
	movs r1, #0
	ldr r7, .L08092E7C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge .L08092E76
	mov sl, r7
.L08092E14:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L08092E66
	ldr r7, .L08092E80  @ gUnknown_0200D6E0
	mov r9, r7
	movs r7, #2
	mov ip, r8
.L08092E2C:
	adds r6, r3, #1
	lsls r0, r6, #2
	mov r1, r9
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ands r1, r7
	lsls r0, r3, #2
	mov r2, r9
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r1, r0
	bls .L08092E56
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x44]
.L08092E56:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r2, ip
	subs r0, r0, r2
	cmp r3, r0
	blt .L08092E2C
.L08092E66:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	ldr r7, .L08092E7C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt .L08092E14
.L08092E76:
	ldr r0, [sp, #0x44]
	bl .L080945F2
	.align 2, 0
.L08092E7C: .4byte gUnknown_0200F158
.L08092E80: .4byte gUnknown_0200D6E0
.L08092E84:
	cmp r2, #0
	bne .L08092F0C
	movs r1, #0
	mov sl, r1
	ldr r3, .L08092F04  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L08092E9C
	bl .L08094EC8
.L08092E9C:
	adds r7, r3, #0
	mov r9, r7
.L08092EA0:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08092EF0
	ldr r0, .L08092F08  @ gUnknown_0200D6E0
	mov r8, r0
.L08092EB4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble .L08092EE2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08092EE2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08092EB4
.L08092EF0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08092EA0
	bl .L08094EC8
	.align 2, 0
.L08092F04: .4byte gUnknown_0200F158
.L08092F08: .4byte gUnknown_0200D6E0
.L08092F0C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08092F88  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L08092F22
	bl .L08094EC8
.L08092F22:
	ldr r2, .L08092F88  @ gUnknown_0200F158
	mov r9, r2
.L08092F26:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08092F76
	ldr r0, .L08092F8C  @ gUnknown_0200D6E0
	mov r8, r0
.L08092F3A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge .L08092F68
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08092F68:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08092F3A
.L08092F76:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08092F26
	bl .L08094EC8
	.align 2, 0
.L08092F88: .4byte gUnknown_0200F158
.L08092F8C: .4byte gUnknown_0200D6E0
.L08092F90:
	cmp r2, #0
	bne .L08093014
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, .L0809300C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L08092FA8
	bl .L0809435C
.L08092FA8:
	adds r7, r3, #0
	mov sl, r7
.L08092FAC:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L08092FF8
	ldr r7, .L08093010  @ gUnknown_0200D6E0
	mov r9, r7
.L08092FC0:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bcs .L08092FE8
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
.L08092FE8:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt .L08092FC0
.L08092FF8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L0809300C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L08092FAC
	bl .L0809435C
	.align 2, 0
.L0809300C: .4byte gUnknown_0200F158
.L08093010: .4byte gUnknown_0200D6E0
.L08093014:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, .L0809308C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	blt .L08093028
	bl .L0809435C
.L08093028:
	adds r3, r2, #0
	mov sl, r3
.L0809302C:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L08093078
	ldr r0, .L08093090  @ gUnknown_0200D6E0
	mov r9, r0
.L08093040:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bls .L08093068
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
.L08093068:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt .L08093040
.L08093078:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L0809308C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L0809302C
	bl .L0809435C
	.align 2, 0
.L0809308C: .4byte gUnknown_0200F158
.L08093090: .4byte gUnknown_0200D6E0
.L08093094:
	cmp r2, #0
	bne .L08093114
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, .L0809310C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080930AC
	bl .L0809435C
.L080930AC:
	adds r7, r3, #0
	mov sl, r7
.L080930B0:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L080930F8
	ldr r7, .L08093110  @ gUnknown_0200D6E0
	mov r9, r7
.L080930C4:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r2, [r5]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r1, [r4]
	ldrb r0, [r2, #9]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bls .L080930E8
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
.L080930E8:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt .L080930C4
.L080930F8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L0809310C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080930B0
	bl .L0809435C
	.align 2, 0
.L0809310C: .4byte gUnknown_0200F158
.L08093110: .4byte gUnknown_0200D6E0
.L08093114:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, .L08093188  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	blt .L08093128
	bl .L0809435C
.L08093128:
	adds r3, r2, #0
	mov sl, r3
.L0809312C:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L08093174
	ldr r0, .L0809318C  @ gUnknown_0200D6E0
	mov r9, r0
.L08093140:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r2, [r5]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r1, [r4]
	ldrb r0, [r2, #9]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bcs .L08093164
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
.L08093164:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt .L08093140
.L08093174:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093188  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L0809312C
	bl .L0809435C
	.align 2, 0
.L08093188: .4byte gUnknown_0200F158
.L0809318C: .4byte gUnknown_0200D6E0
.L08093190:
	cmp r2, #0
	bne .L08093218
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, .L08093210  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080931A8
	bl .L08094EC8
.L080931A8:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L080931FA
	ldr r1, .L08093214  @ gUnknown_0200D6E0
	mov r9, r1
.L080931BA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, r9
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, r9
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	ble .L080931EA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r0, #1
	mov sl, r0
.L080931EA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093210  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	cmp r5, r0
	blt .L080931BA
.L080931FA:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093210  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080931A8
	bl .L08094EC8
	.align 2, 0
.L08093210: .4byte gUnknown_0200F158
.L08093214: .4byte gUnknown_0200D6E0
.L08093218:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, .L08093294  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L0809322C
	bl .L08094FCE
.L0809322C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L0809327E
	ldr r0, .L08093298  @ gUnknown_0200D6E0
	mov r9, r0
.L0809323E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	bge .L0809326E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L0809326E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093294  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L0809323E
.L0809327E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08093294  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L0809322C
	bl .L08094FCE
	.align 2, 0
.L08093294: .4byte gUnknown_0200F158
.L08093298: .4byte gUnknown_0200D6E0
.L0809329C:
	cmp r2, #0
	bne .L08093324
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, .L0809331C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080932B4
	bl .L08094FCE
.L080932B4:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093306
	ldr r7, .L08093320  @ gUnknown_0200D6E0
	mov r9, r7
.L080932C6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	ble .L080932F6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L080932F6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L0809331C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L080932C6
.L08093306:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L0809331C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080932B4
	bl .L08094FCE
	.align 2, 0
.L0809331C: .4byte gUnknown_0200F158
.L08093320: .4byte gUnknown_0200D6E0
.L08093324:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L080933A0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L08093338
	bl .L08094FCE
.L08093338:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L0809338A
	ldr r7, .L080933A4  @ gUnknown_0200D6E0
	mov r9, r7
.L0809334A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	bge .L0809337A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L0809337A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L080933A0  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L0809334A
.L0809338A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080933A0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093338
	bl .L08094FCE
	.align 2, 0
.L080933A0: .4byte gUnknown_0200F158
.L080933A4: .4byte gUnknown_0200D6E0
.L080933A8:
	cmp r2, #0
	bne .L08093430
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, .L08093428  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080933C0
	bl .L08094FCE
.L080933C0:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093412
	ldr r7, .L0809342C  @ gUnknown_0200D6E0
	mov r9, r7
.L080933D2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	ble .L08093402
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08093402:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093428  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L080933D2
.L08093412:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093428  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080933C0
	bl .L08094FCE
	.align 2, 0
.L08093428: .4byte gUnknown_0200F158
.L0809342C: .4byte gUnknown_0200D6E0
.L08093430:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L080934AC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L08093444
	bl .L08094FCE
.L08093444:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093496
	ldr r7, .L080934B0  @ gUnknown_0200D6E0
	mov r9, r7
.L08093456:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	bge .L08093486
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08093486:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L080934AC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08093456
.L08093496:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080934AC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093444
	bl .L08094FCE
	.align 2, 0
.L080934AC: .4byte gUnknown_0200F158
.L080934B0: .4byte gUnknown_0200D6E0
.L080934B4:
	cmp r2, #0
	bne .L0809353C
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, .L08093534  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080934CC
	bl .L08094FCE
.L080934CC:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L0809351E
	ldr r7, .L08093538  @ gUnknown_0200D6E0
	mov r9, r7
.L080934DE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	ble .L0809350E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L0809350E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093534  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L080934DE
.L0809351E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093534  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080934CC
	bl .L08094FCE
	.align 2, 0
.L08093534: .4byte gUnknown_0200F158
.L08093538: .4byte gUnknown_0200D6E0
.L0809353C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L080935B8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L08093550
	bl .L08094FCE
.L08093550:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L080935A2
	ldr r7, .L080935BC  @ gUnknown_0200D6E0
	mov r9, r7
.L08093562:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	bge .L08093592
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08093592:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L080935B8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08093562
.L080935A2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080935B8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093550
	bl .L08094FCE
	.align 2, 0
.L080935B8: .4byte gUnknown_0200F158
.L080935BC: .4byte gUnknown_0200D6E0
.L080935C0:
	cmp r2, #0
	bne .L08093648
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, .L08093640  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080935D8
	bl .L08094FCE
.L080935D8:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L0809362A
	ldr r7, .L08093644  @ gUnknown_0200D6E0
	mov r9, r7
.L080935EA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	ble .L0809361A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L0809361A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093640  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L080935EA
.L0809362A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093640  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080935D8
	bl .L08094FCE
	.align 2, 0
.L08093640: .4byte gUnknown_0200F158
.L08093644: .4byte gUnknown_0200D6E0
.L08093648:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L080936C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L0809365C
	bl .L08094FCE
.L0809365C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L080936AE
	ldr r7, .L080936C8  @ gUnknown_0200D6E0
	mov r9, r7
.L0809366E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	bge .L0809369E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L0809369E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L080936C4  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L0809366E
.L080936AE:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080936C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L0809365C
	bl .L08094FCE
	.align 2, 0
.L080936C4: .4byte gUnknown_0200F158
.L080936C8: .4byte gUnknown_0200D6E0
.L080936CC:
	cmp r2, #0
	bne .L08093754
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, .L0809374C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080936E4
	bl .L08094FCE
.L080936E4:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093736
	ldr r7, .L08093750  @ gUnknown_0200D6E0
	mov r9, r7
.L080936F6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	ble .L08093726
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08093726:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L0809374C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L080936F6
.L08093736:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L0809374C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080936E4
	bl .L08094FCE
	.align 2, 0
.L0809374C: .4byte gUnknown_0200F158
.L08093750: .4byte gUnknown_0200D6E0
.L08093754:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L080937D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L08093768
	bl .L08094FCE
.L08093768:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L080937BA
	ldr r7, .L080937D4  @ gUnknown_0200D6E0
	mov r9, r7
.L0809377A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	bge .L080937AA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L080937AA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L080937D0  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L0809377A
.L080937BA:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080937D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093768
	bl .L08094FCE
	.align 2, 0
.L080937D0: .4byte gUnknown_0200F158
.L080937D4: .4byte gUnknown_0200D6E0
.L080937D8:
	cmp r2, #0
	bne .L08093860
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, .L08093858  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080937F0
	bl .L08094FCE
.L080937F0:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093842
	ldr r7, .L0809385C  @ gUnknown_0200D6E0
	mov r9, r7
.L08093802:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	ble .L08093832
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08093832:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093858  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08093802
.L08093842:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093858  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080937F0
	bl .L08094FCE
	.align 2, 0
.L08093858: .4byte gUnknown_0200F158
.L0809385C: .4byte gUnknown_0200D6E0
.L08093860:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L080938DC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L08093874
	bl .L08094FCE
.L08093874:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L080938C6
	ldr r7, .L080938E0  @ gUnknown_0200D6E0
	mov r9, r7
.L08093886:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	bge .L080938B6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L080938B6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L080938DC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08093886
.L080938C6:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080938DC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093874
	bl .L08094FCE
	.align 2, 0
.L080938DC: .4byte gUnknown_0200F158
.L080938E0: .4byte gUnknown_0200D6E0
.L080938E4:
	cmp r2, #0
	bne .L0809396C
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, .L08093964  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L080938FC
	bl .L08094FCE
.L080938FC:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L0809394E
	ldr r7, .L08093968  @ gUnknown_0200D6E0
	mov r9, r7
.L0809390E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	ble .L0809393E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L0809393E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093964  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L0809390E
.L0809394E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093964  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080938FC
	bl .L08094FCE
	.align 2, 0
.L08093964: .4byte gUnknown_0200F158
.L08093968: .4byte gUnknown_0200D6E0
.L0809396C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L080939E8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L08093980
	bl .L08094FCE
.L08093980:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L080939D2
	ldr r7, .L080939EC  @ gUnknown_0200D6E0
	mov r9, r7
.L08093992:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	bge .L080939C2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L080939C2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L080939E8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08093992
.L080939D2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080939E8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093980
	bl .L08094FCE
	.align 2, 0
.L080939E8: .4byte gUnknown_0200F158
.L080939EC: .4byte gUnknown_0200D6E0
.L080939F0:
	cmp r2, #0
	bne .L08093AA0
	movs r3, #0
	str r3, [sp, #0x48]
	movs r1, #0
	ldr r7, .L08093A98  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r2, r0
	bge .L08093A90
	adds r0, r7, #0
	mov sl, r0
.L08093A08:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge .L08093A80
	ldr r7, .L08093A9C  @ gUnknown_0200D6E0
	mov ip, r7
.L08093A1C:
	adds r0, r2, #1
	mov r8, r0
	lsls r0, r0, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	ble .L08093A6E
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x48]
.L08093A6E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r9
	subs r0, r0, r3
	cmp r2, r0
	blt .L08093A1C
.L08093A80:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08093A98  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093A08
.L08093A90:
	ldr r3, [sp, #0x48]
	bl .L08094ECA
	.align 2, 0
.L08093A98: .4byte gUnknown_0200F158
.L08093A9C: .4byte gUnknown_0200D6E0
.L08093AA0:
	movs r7, #0
	str r7, [sp, #0x4c]
	movs r1, #0
	ldr r2, .L08093B44  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r7, r0
	bge .L08093B3C
	adds r3, r2, #0
	mov sl, r3
.L08093AB4:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge .L08093B2C
	ldr r0, .L08093B48  @ gUnknown_0200D6E0
	mov ip, r0
.L08093AC8:
	adds r1, r2, #1
	mov r8, r1
	lsls r0, r1, #2
	mov r3, ip
	adds r7, r0, r3
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r1, ip
	adds r4, r0, r1
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	bge .L08093B1A
	str r6, [r4]
	str r5, [r7]
	movs r2, #1
	str r2, [sp, #0x4c]
.L08093B1A:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r9
	subs r0, r0, r1
	cmp r2, r0
	blt .L08093AC8
.L08093B2C:
	mov r2, r9
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093B44  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L08093AB4
.L08093B3C:
	ldr r7, [sp, #0x4c]
	bl .L0809435E
	.align 2, 0
.L08093B44: .4byte gUnknown_0200F158
.L08093B48: .4byte gUnknown_0200D6E0
.L08093B4C:
	cmp r2, #0
	bne .L08093BD4
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, .L08093BCC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L08093B64
	bl .L08094EC8
.L08093B64:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093BB6
	ldr r1, .L08093BD0  @ gUnknown_0200D6E0
	mov r9, r1
.L08093B76:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, r9
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, r9
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	ble .L08093BA6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r0, #1
	mov sl, r0
.L08093BA6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093BCC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	cmp r5, r0
	blt .L08093B76
.L08093BB6:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093BCC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L08093B64
	bl .L08094EC8
	.align 2, 0
.L08093BCC: .4byte gUnknown_0200F158
.L08093BD0: .4byte gUnknown_0200D6E0
.L08093BD4:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, .L08093C50  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L08093BE8
	bl .L08094FCE
.L08093BE8:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093C3A
	ldr r0, .L08093C54  @ gUnknown_0200D6E0
	mov r9, r0
.L08093BFA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	bge .L08093C2A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08093C2A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093C50  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08093BFA
.L08093C3A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08093C50  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093BE8
	bl .L08094FCE
	.align 2, 0
.L08093C50: .4byte gUnknown_0200F158
.L08093C54: .4byte gUnknown_0200D6E0
.L08093C58:
	cmp r2, #0
	bne .L08093CE0
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, .L08093CD8  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L08093C70
	bl .L08094FCE
.L08093C70:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093CC2
	ldr r7, .L08093CDC  @ gUnknown_0200D6E0
	mov r9, r7
.L08093C82:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	bge .L08093CB2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08093CB2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093CD8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08093C82
.L08093CC2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L08093CD8  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L08093C70
	bl .L08094FCE
	.align 2, 0
.L08093CD8: .4byte gUnknown_0200F158
.L08093CDC: .4byte gUnknown_0200D6E0
.L08093CE0:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L08093D5C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt .L08093CF4
	bl .L08094FCE
.L08093CF4:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08093D46
	ldr r7, .L08093D60  @ gUnknown_0200D6E0
	mov r9, r7
.L08093D06:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	ble .L08093D36
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08093D36:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08093D5C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08093D06
.L08093D46:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08093D5C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093CF4
	bl .L08094FCE
	.align 2, 0
.L08093D5C: .4byte gUnknown_0200F158
.L08093D60: .4byte gUnknown_0200D6E0
.L08093D64:
	cmp r2, #0
	beq .L08093D6A
	b .L08093E6C
.L08093D6A:
	movs r3, #0
	str r3, [sp, #0x50]
	movs r4, #0
	ldr r0, .L08093DA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r2, r0
	bcs .L08093DA2
	ldr r5, .L08093DAC  @ gUnknown_0200D6E0
.L08093D7A:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	mov r7, sp
	adds r1, r7, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L08093DA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	bcc .L08093D7A
.L08093DA2:
	movs r4, #0
	b .L08093E56
	.align 2, 0
.L08093DA8: .4byte gUnknown_0200F158
.L08093DAC: .4byte gUnknown_0200D6E0
.L08093DB0:
	movs r6, #0
	ldrb r0, [r1]
	adds r1, r4, #1
	subs r0, r0, r1
	str r1, [sp, #0x58]
	cmp r6, r0
	bge .L08093E50
	ldr r0, .L08093DF8  @ gUnknown_0200D6E0
	mov sl, r0
.L08093DC2:
	adds r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	mov r8, r1
	mov r2, sp
	adds r5, r2, r6
	ldrb r4, [r1]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov r9, r0
	cmp r3, r2
	bls .L08093DFC
	adds r1, r2, #0
	strb r4, [r5]
	mov r3, r8
	strb r1, [r3]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r7, #1
	str r7, [sp, #0x50]
	b .L08093E3E
	.align 2, 0
.L08093DF8: .4byte gUnknown_0200D6E0
.L08093DFC:
	cmp r3, r2
	bne .L08093E3E
	mov r1, r9
	lsls r0, r1, #2
	mov r2, sl
	adds r7, r0, r2
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bls .L08093E3E
	ldrb r1, [r5]
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r5]
	strb r1, [r2]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r3, #1
	str r3, [sp, #0x50]
.L08093E3E:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
	ldr r0, .L08093E68  @ gUnknown_0200F158
	ldrb r0, [r0]
	ldr r1, [sp, #0x58]
	subs r0, r0, r1
	cmp r6, r0
	blt .L08093DC2
.L08093E50:
	ldr r2, [sp, #0x58]
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
.L08093E56:
	ldr r1, .L08093E68  @ gUnknown_0200F158
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt .L08093DB0
	ldr r3, [sp, #0x50]
	bl .L08094ECA
	.align 2, 0
.L08093E68: .4byte gUnknown_0200F158
.L08093E6C:
	movs r7, #0
	str r7, [sp, #0x54]
	movs r4, #0
	ldr r0, .L08093EA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r7, r0
	bcs .L08093EA4
	ldr r5, .L08093EAC  @ gUnknown_0200D6E0
.L08093E7C:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L08093EA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	bcc .L08093E7C
.L08093EA4:
	movs r4, #0
	b .L08093F56
	.align 2, 0
.L08093EA8: .4byte gUnknown_0200F158
.L08093EAC: .4byte gUnknown_0200D6E0
.L08093EB0:
	movs r6, #0
	ldrb r0, [r1]
	adds r1, r4, #1
	subs r0, r0, r1
	str r1, [sp, #0x5c]
	cmp r6, r0
	bge .L08093F50
	ldr r3, .L08093EF8  @ gUnknown_0200D6E0
	mov sl, r3
.L08093EC2:
	adds r0, r6, #1
	mov r7, sp
	adds r7, r7, r0
	mov r8, r7
	mov r1, sp
	adds r5, r1, r6
	ldrb r4, [r7]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov r9, r0
	cmp r3, r2
	bcs .L08093EFC
	adds r1, r2, #0
	strb r4, [r5]
	strb r1, [r7]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r2, #1
	str r2, [sp, #0x54]
	b .L08093F3E
	.align 2, 0
.L08093EF8: .4byte gUnknown_0200D6E0
.L08093EFC:
	cmp r3, r2
	bne .L08093F3E
	mov r3, r9
	lsls r0, r3, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bcs .L08093F3E
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r7, #1
	str r7, [sp, #0x54]
.L08093F3E:
	mov r1, r9
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r0, .L08093F64  @ gUnknown_0200F158
	ldrb r0, [r0]
	ldr r2, [sp, #0x5c]
	subs r0, r0, r2
	cmp r6, r0
	blt .L08093EC2
.L08093F50:
	ldr r3, [sp, #0x5c]
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
.L08093F56:
	ldr r1, .L08093F64  @ gUnknown_0200F158
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt .L08093EB0
	ldr r7, [sp, #0x54]
	b .L0809435E
	.align 2, 0
.L08093F64: .4byte gUnknown_0200F158
.L08093F68:
	cmp r2, #0
	bne .L08093FE4
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, .L08093FDC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge .L08093FD6
	adds r7, r3, #0
	mov sl, r7
.L08093F80:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge .L08093FC6
	mov r8, r9
.L08093F92:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, .L08093FE0  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble .L08093FB6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
.L08093FB6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt .L08093F92
.L08093FC6:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08093FDC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093F80
.L08093FD6:
	mov r3, ip
	bl .L08094ECA
	.align 2, 0
.L08093FDC: .4byte gUnknown_0200F158
.L08093FE0: .4byte gUnknown_0200D6E0
.L08093FE4:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, .L08094054  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge .L0809404E
	adds r3, r2, #0
	mov sl, r3
.L08093FF8:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge .L0809403E
	mov r8, r9
.L0809400A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, .L08094058  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #4
	ldrsh r1, [r4, r7]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge .L0809402E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
.L0809402E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt .L0809400A
.L0809403E:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08094054  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08093FF8
.L0809404E:
	mov r3, ip
	bl .L08094ECA
	.align 2, 0
.L08094054: .4byte gUnknown_0200F158
.L08094058: .4byte gUnknown_0200D6E0
.L0809405C:
	cmp r2, #0
	bne .L080940D8
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, .L080940D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge .L080940CA
	adds r7, r3, #0
	mov sl, r7
.L08094074:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge .L080940BA
	mov r8, r9
.L08094086:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, .L080940D4  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble .L080940AA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
.L080940AA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt .L08094086
.L080940BA:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080940D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094074
.L080940CA:
	mov r3, ip
	bl .L08094ECA
	.align 2, 0
.L080940D0: .4byte gUnknown_0200F158
.L080940D4: .4byte gUnknown_0200D6E0
.L080940D8:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, .L08094148  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge .L08094142
	adds r3, r2, #0
	mov sl, r3
.L080940EC:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge .L08094132
	mov r8, r9
.L080940FE:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, .L0809414C  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #6
	ldrsh r1, [r4, r7]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge .L08094122
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
.L08094122:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt .L080940FE
.L08094132:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08094148  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L080940EC
.L08094142:
	mov r3, ip
	bl .L08094ECA
	.align 2, 0
.L08094148: .4byte gUnknown_0200F158
.L0809414C: .4byte gUnknown_0200D6E0
.L08094150:
	cmp r2, #0
	bne .L080941CC
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, .L080941C4  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge .L080941BE
	adds r7, r3, #0
	mov sl, r7
.L08094168:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge .L080941AE
	mov r8, r9
.L0809417A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, .L080941C8  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble .L0809419E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
.L0809419E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt .L0809417A
.L080941AE:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L080941C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094168
.L080941BE:
	mov r3, ip
	bl .L08094ECA
	.align 2, 0
.L080941C4: .4byte gUnknown_0200F158
.L080941C8: .4byte gUnknown_0200D6E0
.L080941CC:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, .L0809423C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge .L08094236
	adds r3, r2, #0
	mov sl, r3
.L080941E0:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge .L08094226
	mov r8, r9
.L080941F2:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, .L08094240  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #8
	ldrsh r1, [r4, r7]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge .L08094216
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
.L08094216:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt .L080941F2
.L08094226:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L0809423C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L080941E0
.L08094236:
	mov r3, ip
	bl .L08094ECA
	.align 2, 0
.L0809423C: .4byte gUnknown_0200F158
.L08094240: .4byte gUnknown_0200D6E0
.L08094244:
	cmp r2, #0
	bne .L080942D8
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, .L080942D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L0809425A
	b .L0809435C
.L0809425A:
	adds r7, r3, #0
	mov sl, r7
.L0809425E:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L080942BE
	ldr r7, .L080942D4  @ gUnknown_0200D6E0
	mov r9, r7
.L08094272:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	ble .L080942AE
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
.L080942AE:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt .L08094272
.L080942BE:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L080942D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L0809425E
	b .L0809435C
	.align 2, 0
.L080942D0: .4byte gUnknown_0200F158
.L080942D4: .4byte gUnknown_0200D6E0
.L080942D8:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, .L0809436C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge .L0809435C
	adds r3, r2, #0
	mov sl, r3
.L080942EC:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge .L0809434C
	ldr r0, .L08094370  @ gUnknown_0200D6E0
	mov r9, r0
.L08094300:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge .L0809433C
.L08094334:
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
.L0809433C:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt .L08094300
.L0809434C:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, .L0809436C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt .L080942EC
.L0809435C:
	mov r7, ip
.L0809435E:
	cmp r7, #0
	bne .L08094366
	bl .L08094FE0
.L08094366:
	movs r0, #1
	bl .L08094FE2
	.align 2, 0
.L0809436C: .4byte gUnknown_0200F158
.L08094370: .4byte gUnknown_0200D6E0
.L08094374:
	cmp r2, #0
	bne .L080943FC
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, .L080943F4  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L0809438E
	bl .L08094EC8
.L0809438E:
	adds r7, r3, #0
	mov r9, r7
.L08094392:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L080943E2
	ldr r0, .L080943F8  @ gUnknown_0200D6E0
	mov r8, r0
.L080943A6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bls .L080943D4
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L080943D4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L080943A6
.L080943E2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094392
	bl .L08094EC8
	.align 2, 0
.L080943F4: .4byte gUnknown_0200F158
.L080943F8: .4byte gUnknown_0200D6E0
.L080943FC:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094478  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L08094412
	bl .L08094EC8
.L08094412:
	ldr r2, .L08094478  @ gUnknown_0200F158
	mov r9, r2
.L08094416:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094466
	ldr r0, .L0809447C  @ gUnknown_0200D6E0
	mov r8, r0
.L0809442A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bcs .L08094458
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094458:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L0809442A
.L08094466:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094416
	bl .L08094EC8
	.align 2, 0
.L08094478: .4byte gUnknown_0200F158
.L0809447C: .4byte gUnknown_0200D6E0
.L08094480:
	cmp r2, #0
	bne .L08094540
	movs r7, #0
	mov r9, r7
	movs r1, #0
	ldr r0, .L080944B0  @ gUnknown_0200F158
	ldrb r3, [r0]
	cmp r2, r3
	bcs .L080944C8
	ldr r6, .L080944B4  @ gUnknown_0200D6E0
	movs r5, #0x10
	movs r4, #1
.L08094498:
	lsls r0, r1, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ands r2, r5
	cmp r2, #0
	beq .L080944B8
	mov r2, sp
	adds r0, r2, r1
	strb r4, [r0]
	b .L080944BE
	.align 2, 0
.L080944B0: .4byte gUnknown_0200F158
.L080944B4: .4byte gUnknown_0200D6E0
.L080944B8:
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
.L080944BE:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r3
	bcc .L08094498
.L080944C8:
	movs r1, #0
	ldr r2, .L08094538  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L080944D6
	b .L080945F0
.L080944D6:
	mov r8, r2
	ldr r3, .L0809453C  @ gUnknown_0200D6E0
	mov ip, r3
	mov sl, r8
.L080944DE:
	movs r2, #0
	mov r7, r8
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	adds r6, r1, #0
	cmp r2, r0
	bge .L08094528
	mov r7, ip
.L080944F0:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bls .L0809451A
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov r9, r1
.L0809451A:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r0, [r3]
	subs r0, r0, r6
	cmp r2, r0
	blt .L080944F0
.L08094528:
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt .L080944DE
	b .L080945F0
	.align 2, 0
.L08094538: .4byte gUnknown_0200F158
.L0809453C: .4byte gUnknown_0200D6E0
.L08094540:
	movs r1, #0
	mov r9, r1
	ldr r0, .L0809456C  @ gUnknown_0200F158
	ldrb r2, [r0]
	cmp r9, r2
	bcs .L08094584
	ldr r6, .L08094570  @ gUnknown_0200D6E0
	adds r3, r2, #0
	movs r5, #0x10
	movs r4, #1
.L08094554:
	lsls r0, r1, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ands r2, r5
	cmp r2, #0
	beq .L08094574
	mov r2, sp
	adds r0, r2, r1
	strb r4, [r0]
	b .L0809457A
	.align 2, 0
.L0809456C: .4byte gUnknown_0200F158
.L08094570: .4byte gUnknown_0200D6E0
.L08094574:
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
.L0809457A:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r3
	bcc .L08094554
.L08094584:
	movs r1, #0
	ldr r2, .L08094600  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	bge .L080945F0
	mov r8, r2
	ldr r3, .L08094604  @ gUnknown_0200D6E0
	mov ip, r3
	mov sl, r8
.L08094598:
	movs r2, #0
	mov r7, r8
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	adds r6, r1, #0
	cmp r2, r0
	bge .L080945E2
	mov r7, ip
.L080945AA:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bcs .L080945D4
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
.L080945C8:
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov r9, r1
.L080945D4:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r0, [r3]
	subs r0, r0, r6
	cmp r2, r0
	blt .L080945AA
.L080945E2:
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt .L08094598
.L080945F0:
	mov r0, r9
.L080945F2:
	cmp r0, #0
	bne .L080945FA
	bl .L08094FE0
.L080945FA:
	movs r0, #1
	bl .L08094FE2
	.align 2, 0
.L08094600: .4byte gUnknown_0200F158
.L08094604: .4byte gUnknown_0200D6E0
.L08094608:
	cmp r2, #0
	bne .L0809468C
	movs r1, #0
	mov sl, r1
	ldr r3, .L08094684  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt .L08094620
	bl .L08094EC8
.L08094620:
	adds r7, r3, #0
	mov r9, r7
.L08094624:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094670
	ldr r0, .L08094688  @ gUnknown_0200D6E0
	mov r8, r0
.L08094638:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls .L08094662
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094662:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094638
.L08094670:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094624
	bl .L08094EC8
	.align 2, 0
.L08094684: .4byte gUnknown_0200F158
.L08094688: .4byte gUnknown_0200D6E0
.L0809468C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094704  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L080946A2
	bl .L08094EC8
.L080946A2:
	ldr r2, .L08094704  @ gUnknown_0200F158
	mov r9, r2
.L080946A6:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L080946F2
	ldr r0, .L08094708  @ gUnknown_0200D6E0
	mov r8, r0
.L080946BA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L080946E4
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L080946E4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L080946BA
.L080946F2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L080946A6
	bl .L08094EC8
	.align 2, 0
.L08094704: .4byte gUnknown_0200F158
.L08094708: .4byte gUnknown_0200D6E0
.L0809470C:
	cmp r2, #0
	bne .L0809478C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094784  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt .L08094724
	b .L08094EC8
.L08094724:
	ldr r2, .L08094784  @ gUnknown_0200F158
	mov r9, r2
.L08094728:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094774
	ldr r0, .L08094788  @ gUnknown_0200D6E0
	mov r8, r0
.L0809473C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls .L08094766
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094766:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L0809473C
.L08094774:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094728
	b .L08094EC8
	.align 2, 0
.L08094784: .4byte gUnknown_0200F158
.L08094788: .4byte gUnknown_0200D6E0
.L0809478C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094800  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L080947A0
	b .L08094EC8
.L080947A0:
	ldr r2, .L08094800  @ gUnknown_0200F158
	mov r9, r2
.L080947A4:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L080947F0
	ldr r0, .L08094804  @ gUnknown_0200D6E0
	mov r8, r0
.L080947B8:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L080947E2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L080947E2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L080947B8
.L080947F0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L080947A4
	b .L08094EC8
	.align 2, 0
.L08094800: .4byte gUnknown_0200F158
.L08094804: .4byte gUnknown_0200D6E0
.L08094808:
	cmp r2, #0
	bne .L08094888
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094880  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt .L08094820
	b .L08094EC8
.L08094820:
	ldr r2, .L08094880  @ gUnknown_0200F158
	mov r9, r2
.L08094824:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094870
	ldr r0, .L08094884  @ gUnknown_0200D6E0
	mov r8, r0
.L08094838:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls .L08094862
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094862:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094838
.L08094870:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094824
	b .L08094EC8
	.align 2, 0
.L08094880: .4byte gUnknown_0200F158
.L08094884: .4byte gUnknown_0200D6E0
.L08094888:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L080948FC  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L0809489C
	b .L08094EC8
.L0809489C:
	ldr r2, .L080948FC  @ gUnknown_0200F158
	mov r9, r2
.L080948A0:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L080948EC
	ldr r0, .L08094900  @ gUnknown_0200D6E0
	mov r8, r0
.L080948B4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L080948DE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L080948DE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L080948B4
.L080948EC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L080948A0
	b .L08094EC8
	.align 2, 0
.L080948FC: .4byte gUnknown_0200F158
.L08094900: .4byte gUnknown_0200D6E0
.L08094904:
	cmp r2, #0
	bne .L08094984
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L0809497C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt .L0809491C
	b .L08094EC8
.L0809491C:
	ldr r2, .L0809497C  @ gUnknown_0200F158
	mov r9, r2
.L08094920:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L0809496C
	ldr r0, .L08094980  @ gUnknown_0200D6E0
	mov r8, r0
.L08094934:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls .L0809495E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L0809495E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094934
.L0809496C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094920
	b .L08094EC8
	.align 2, 0
.L0809497C: .4byte gUnknown_0200F158
.L08094980: .4byte gUnknown_0200D6E0
.L08094984:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L080949F8  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L08094998
	b .L08094EC8
.L08094998:
	ldr r2, .L080949F8  @ gUnknown_0200F158
	mov r9, r2
.L0809499C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L080949E8
	ldr r0, .L080949FC  @ gUnknown_0200D6E0
	mov r8, r0
.L080949B0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L080949DA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L080949DA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L080949B0
.L080949E8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L0809499C
	b .L08094EC8
	.align 2, 0
.L080949F8: .4byte gUnknown_0200F158
.L080949FC: .4byte gUnknown_0200D6E0
.L08094A00:
	cmp r2, #0
	bne .L08094A80
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094A78  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt .L08094A18
	b .L08094EC8
.L08094A18:
	ldr r2, .L08094A78  @ gUnknown_0200F158
	mov r9, r2
.L08094A1C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094A68
	ldr r0, .L08094A7C  @ gUnknown_0200D6E0
	mov r8, r0
.L08094A30:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls .L08094A5A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094A5A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094A30
.L08094A68:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094A1C
	b .L08094EC8
	.align 2, 0
.L08094A78: .4byte gUnknown_0200F158
.L08094A7C: .4byte gUnknown_0200D6E0
.L08094A80:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094AF4  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L08094A94
	b .L08094EC8
.L08094A94:
	ldr r2, .L08094AF4  @ gUnknown_0200F158
	mov r9, r2
.L08094A98:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094AE4
	ldr r0, .L08094AF8  @ gUnknown_0200D6E0
	mov r8, r0
.L08094AAC:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L08094AD6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094AD6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094AAC
.L08094AE4:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094A98
	b .L08094EC8
	.align 2, 0
.L08094AF4: .4byte gUnknown_0200F158
.L08094AF8: .4byte gUnknown_0200D6E0
.L08094AFC:
	cmp r2, #0
	bne .L08094B7C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094B74  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt .L08094B14
	b .L08094EC8
.L08094B14:
	ldr r2, .L08094B74  @ gUnknown_0200F158
	mov r9, r2
.L08094B18:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094B64
	ldr r0, .L08094B78  @ gUnknown_0200D6E0
	mov r8, r0
.L08094B2C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls .L08094B56
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094B56:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094B2C
.L08094B64:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094B18
	b .L08094EC8
	.align 2, 0
.L08094B74: .4byte gUnknown_0200F158
.L08094B78: .4byte gUnknown_0200D6E0
.L08094B7C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094BF0  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L08094B90
	b .L08094EC8
.L08094B90:
	ldr r2, .L08094BF0  @ gUnknown_0200F158
	mov r9, r2
.L08094B94:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094BE0
	ldr r0, .L08094BF4  @ gUnknown_0200D6E0
	mov r8, r0
.L08094BA8:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L08094BD2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094BD2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094BA8
.L08094BE0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094B94
	b .L08094EC8
	.align 2, 0
.L08094BF0: .4byte gUnknown_0200F158
.L08094BF4: .4byte gUnknown_0200D6E0
.L08094BF8:
	cmp r2, #0
	bne .L08094C78
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094C70  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt .L08094C10
	b .L08094EC8
.L08094C10:
	ldr r2, .L08094C70  @ gUnknown_0200F158
	mov r9, r2
.L08094C14:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094C60
	ldr r0, .L08094C74  @ gUnknown_0200D6E0
	mov r8, r0
.L08094C28:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls .L08094C52
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094C52:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094C28
.L08094C60:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094C14
	b .L08094EC8
	.align 2, 0
.L08094C70: .4byte gUnknown_0200F158
.L08094C74: .4byte gUnknown_0200D6E0
.L08094C78:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094CEC  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L08094C8C
	b .L08094EC8
.L08094C8C:
	ldr r2, .L08094CEC  @ gUnknown_0200F158
	mov r9, r2
.L08094C90:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094CDC
	ldr r0, .L08094CF0  @ gUnknown_0200D6E0
	mov r8, r0
.L08094CA4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L08094CCE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094CCE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094CA4
.L08094CDC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094C90
	b .L08094EC8
	.align 2, 0
.L08094CEC: .4byte gUnknown_0200F158
.L08094CF0: .4byte gUnknown_0200D6E0
.L08094CF4:
	cmp r2, #0
	bne .L08094D74
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094D6C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt .L08094D0C
	b .L08094EC8
.L08094D0C:
	ldr r2, .L08094D6C  @ gUnknown_0200F158
	mov r9, r2
.L08094D10:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094D5C
	ldr r0, .L08094D70  @ gUnknown_0200D6E0
	mov r8, r0
.L08094D24:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls .L08094D4E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094D4E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094D24
.L08094D5C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094D10
	b .L08094EC8
	.align 2, 0
.L08094D6C: .4byte gUnknown_0200F158
.L08094D70: .4byte gUnknown_0200D6E0
.L08094D74:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094DE8  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt .L08094D88
	b .L08094EC8
.L08094D88:
	ldr r2, .L08094DE8  @ gUnknown_0200F158
	mov r9, r2
.L08094D8C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge .L08094DD8
	ldr r0, .L08094DEC  @ gUnknown_0200D6E0
	mov r8, r0
.L08094DA0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L08094DCA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094DCA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt .L08094DA0
.L08094DD8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094D8C
	b .L08094EC8
	.align 2, 0
.L08094DE8: .4byte gUnknown_0200F158
.L08094DEC: .4byte gUnknown_0200D6E0
.L08094DF0:
	cmp r2, #0
	bne .L08094E64
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094E5C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge .L08094EC8
	ldr r2, .L08094E5C  @ gUnknown_0200F158
	mov r9, r2
.L08094E0A:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r2, r0
	bge .L08094E48
.L08094E1A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, .L08094E60  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	ldrb r0, [r4, #0xa]
	ldrb r7, [r3, #0xa]
	cmp r0, r7
	bls .L08094E3A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094E3A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r3, r9
	ldrb r0, [r3]
	subs r0, r0, r1
	cmp r2, r0
	blt .L08094E1A
.L08094E48:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094E0A
	b .L08094EC8
	.align 2, 0
.L08094E5C: .4byte gUnknown_0200F158
.L08094E60: .4byte gUnknown_0200D6E0
.L08094E64:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, .L08094ED4  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	bge .L08094EC8
	ldr r2, .L08094ED4  @ gUnknown_0200F158
	mov r9, r2
.L08094E7A:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r2, r0
	bge .L08094EB8
.L08094E8A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, .L08094ED8  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	ldrb r0, [r4, #0xa]
	ldrb r7, [r3, #0xa]
	cmp r0, r7
	bcs .L08094EAA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
.L08094EAA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r3, r9
	ldrb r0, [r3]
	subs r0, r0, r1
	cmp r2, r0
	blt .L08094E8A
.L08094EB8:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094E7A
.L08094EC8:
	mov r3, sl
.L08094ECA:
	cmp r3, #0
	bne .L08094ED0
	b .L08094FE0
.L08094ED0:
	movs r0, #1
	b .L08094FE2
	.align 2, 0
.L08094ED4: .4byte gUnknown_0200F158
.L08094ED8: .4byte gUnknown_0200D6E0
.L08094EDC:
	cmp r2, #0
	bne .L08094F5C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, .L08094F54  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge .L08094FCE
.L08094EF0:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08094F42
	ldr r0, .L08094F58  @ gUnknown_0200D6E0
	mov r9, r0
.L08094F02:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	cmp r4, r0
	ble .L08094F32
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08094F32:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08094F54  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08094F02
.L08094F42:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08094F54  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094EF0
	b .L08094FCE
	.align 2, 0
.L08094F54: .4byte gUnknown_0200F158
.L08094F58: .4byte gUnknown_0200D6E0
.L08094F5C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, .L08094FD8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge .L08094FCE
.L08094F6C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge .L08094FBE
	ldr r7, .L08094FDC  @ gUnknown_0200D6E0
	mov r9, r7
.L08094F7E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl SortUnitList_GetUnitSoloAnimation
	cmp r4, r0
	bge .L08094FAE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
.L08094FAE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, .L08094FD8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt .L08094F7E
.L08094FBE:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, .L08094FD8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt .L08094F6C
.L08094FCE:
	mov r2, sl
	cmp r2, #0
	beq .L08094FE0
	movs r0, #1
	b .L08094FE2
	.align 2, 0
.L08094FD8: .4byte gUnknown_0200F158
.L08094FDC: .4byte gUnknown_0200D6E0
.L08094FE0:
	movs r0, #0
.L08094FE2:
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END SortUnitList

	THUMB_FUNC_START CanPrepScreenSave
CanPrepScreenSave: @ 0x08094FF4
	push {lr}
	ldr r0, .L08095014  @ gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	ldr r0, .L08095018  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0809501C
	adds r0, r2, #0
	subs r0, #0x24
	cmp r0, #0x13
	bhi .L0809501C
	movs r0, #0
	b .L0809501E
	.align 2, 0
.L08095014: .4byte gPlaySt
.L08095018: .4byte gGmData
.L0809501C:
	movs r0, #1
.L0809501E:
	pop {r1}
	bx r1

	THUMB_FUNC_END CanPrepScreenSave

	THUMB_FUNC_START GetActivePrepScreenMenuItemHelpTextId
GetActivePrepScreenMenuItemHelpTextId: @ 0x08095024
	push {r4, lr}
	bl GetActivePrepScreenMenuItemId
	adds r4, r0, #0
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095048
	ldr r0, .L08095044  @ gUnknown_08A18200
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #8
	b .L08095086
	.align 2, 0
.L08095044: .4byte gUnknown_08A18200
.L08095048:
	cmp r4, #4
	bne .L08095064
	movs r0, #2
	bl CanPrepScreenSupport
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809507C
	ldr r0, .L08095060  @ gUnknown_08A18200
	ldr r0, [r0, #0x30]
	b .L0809508A
	.align 2, 0
.L08095060: .4byte gUnknown_08A18200
.L08095064:
	cmp r4, #2
	bne .L0809507C
	bl CanPrepScreenSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809507C
	ldr r0, .L08095078  @ gUnknown_08A18200
	ldr r0, [r0, #0x18]
	b .L0809508A
	.align 2, 0
.L08095078: .4byte gUnknown_08A18200
.L0809507C:
	ldr r0, .L08095090  @ gUnknown_08A18200
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
.L08095086:
	adds r1, r1, r0
	ldr r0, [r1]
.L0809508A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08095090: .4byte gUnknown_08A18200

	THUMB_FUNC_END GetActivePrepScreenMenuItemHelpTextId

	THUMB_FUNC_START func_08095094
func_08095094: @ 0x08095094
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r2, #0
	movs r5, #1
.L0809509E:
	adds r0, r1, #0
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq .L080950B2
	cmp r4, r3
	bne .L080950B0
	adds r0, r2, #0
	b .L080950BC
.L080950B0:
	adds r3, #1
.L080950B2:
	adds r2, #1
	cmp r2, #3
	ble .L0809509E
	movs r0, #1
	negs r0, r0
.L080950BC:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08095094

	THUMB_FUNC_START func_080950C4
func_080950C4: @ 0x080950C4
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	movs r4, #1
.L080950CE:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq .L080950DA
	adds r2, #1
.L080950DA:
	adds r1, #1
	cmp r1, #3
	ble .L080950CE
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080950C4

	THUMB_FUNC_START func_080950E8
func_080950E8: @ 0x080950E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, .L0809512C  @ gUnknown_08205BB0
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L08095130  @ gUnknown_08A1D8D0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, .L08095134  @ gPlaySt
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809512C: .4byte gUnknown_08205BB0
.L08095130: .4byte gUnknown_08A1D8D0
.L08095134: .4byte gPlaySt

	THUMB_FUNC_END func_080950E8

	THUMB_FUNC_START func_08095138
func_08095138: @ 0x08095138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	mov r9, r2
	mov sl, r3
	ldr r1, .L080951AC  @ gUnknown_08A1A41C
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	movs r3, #0x80
	lsls r3, r3, #5
	adds r2, r3, #0
	adds r0, r0, r2
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov r0, r8
	bl TmApplyTsa_thm
	movs r5, #0
	cmp r5, r7
	bge .L08095182
	mov r4, r8
	adds r4, #0x40
	adds r5, r7, #0
.L0809516E:
	adds r0, r4, #0
	ldr r1, .L080951B0  @ gUnknown_08A1A434
	lsrs r2, r6, #0x10
	bl TmApplyTsa_thm
	adds r4, #0x80
	subs r5, #1
	cmp r5, #0
	bne .L0809516E
	adds r5, r7, #0
.L08095182:
	lsls r0, r5, #7
	add r0, r8
	adds r0, #0x40
	ldr r1, .L080951B4  @ gUnknown_08A1A474
	mov r4, sl
	lsls r2, r4, #0xc
	mov r4, r9
	lsls r3, r4, #0xf
	lsrs r3, r3, #0x14
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080951AC: .4byte gUnknown_08A1A41C
.L080951B0: .4byte gUnknown_08A1A434
.L080951B4: .4byte gUnknown_08A1A474

	THUMB_FUNC_END func_08095138

	THUMB_FUNC_START PrepScreenMenu_OnPickUnits
PrepScreenMenu_OnPickUnits: @ 0x080951B8
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #1
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnPickUnits

	THUMB_FUNC_START PrepScreenMenu_OnItems
PrepScreenMenu_OnItems: @ 0x080951CC
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #2
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnItems

	THUMB_FUNC_START PrepScreenMenu_OnSupport
PrepScreenMenu_OnSupport: @ 0x080951E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x33
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #1
	str r1, [sp]
	movs r0, #0x37
	adds r1, r2, #0
	movs r3, #0x20
	bl func_080029E8
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnSupport

	THUMB_FUNC_START PrepScreenMenu_OnSave
PrepScreenMenu_OnSave: @ 0x08095210
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809523C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08095226
	movs r0, #0x6a
	bl m4aSongNumStart
.L08095226:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809523C: .4byte gPlaySt

	THUMB_FUNC_END PrepScreenMenu_OnSave

	THUMB_FUNC_START PrepScreenMenu_OnStartPress
PrepScreenMenu_OnStartPress: @ 0x08095240
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0809525C
	bl func_08096BC4
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #1
	b .L0809525E
.L0809525C:
	movs r0, #0
.L0809525E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenMenu_OnStartPress

	THUMB_FUNC_START func_08095264
func_08095264: @ 0x08095264
	push {lr}
	ldr r0, .L08095278  @ gUnknown_08A1829C
	bl FindProc
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0809527C
	movs r0, #1
	b .L0809527E
	.align 2, 0
.L08095278: .4byte gUnknown_08A1829C
.L0809527C:
	movs r0, #0
.L0809527E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08095264

	THUMB_FUNC_START PrepScreenMenu_OnCancel
PrepScreenMenu_OnCancel: @ 0x08095284
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnCancel

	THUMB_FUNC_START PrepScreenMenu_OnBPress
PrepScreenMenu_OnBPress: @ 0x08095290
	push {r4, lr}
	adds r4, r0, #0
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080952AC
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080952B8
	bl func_08096BE0
.L080952AC:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	movs r0, #1
	b .L080952BA
.L080952B8:
	movs r0, #0
.L080952BA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenMenu_OnBPress

	THUMB_FUNC_START PrepScreenMenu_OnCheckMap
PrepScreenMenu_OnCheckMap: @ 0x080952C0
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnCheckMap

	THUMB_FUNC_START func_080952CC
func_080952CC: @ 0x080952CC
	bx lr

	THUMB_FUNC_END func_080952CC

	THUMB_FUNC_START __malloc_unlock_1
__malloc_unlock_1: @ 0x080952D0
	bx lr

	THUMB_FUNC_END __malloc_unlock_1

	THUMB_FUNC_START func_080952D4
func_080952D4: @ 0x080952D4
	push {lr}
	ldr r1, .L080952E8  @ gUnknown_0203E87C
	movs r2, #0
	adds r0, r1, #4
.L080952DC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L080952DC
	pop {r0}
	bx r0
	.align 2, 0
.L080952E8: .4byte gUnknown_0203E87C

	THUMB_FUNC_END func_080952D4

	THUMB_FUNC_START func_080952EC
func_080952EC: @ 0x080952EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, .L08095304  @ gUnknown_0203E87C
.L080952F6:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08095308
	strb r3, [r1]
	b .L0809530E
	.align 2, 0
.L08095304: .4byte gUnknown_0203E87C
.L08095308:
	adds r2, #1
	cmp r2, #4
	ble .L080952F6
.L0809530E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080952EC

	THUMB_FUNC_START func_08095314
func_08095314: @ 0x08095314
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, .L08095344  @ gUnknown_0203E87C
	adds r4, r3, #0
.L08095320:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne .L08095348
	adds r2, r1, #0
	cmp r1, #3
	bgt .L0809533C
	adds r1, r1, r4
.L08095330:
	ldrb r0, [r1, #1]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #3
	ble .L08095330
.L0809533C:
	movs r0, #0
	strb r0, [r3, #4]
	b .L0809534E
	.align 2, 0
.L08095344: .4byte gUnknown_0203E87C
.L08095348:
	adds r1, #1
	cmp r1, #4
	ble .L08095320
.L0809534E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08095314

	THUMB_FUNC_START GetPrepScreenUnitListEntry
GetPrepScreenUnitListEntry: @ 0x08095354
	ldr r1, .L08095360  @ gUnknown_020121CC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L08095360: .4byte gUnknown_020121CC

	THUMB_FUNC_END GetPrepScreenUnitListEntry

	THUMB_FUNC_START SetPrepScreenUnitListEntry
SetPrepScreenUnitListEntry: @ 0x08095364
	ldr r2, .L08095370  @ gUnknown_020121CC
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
.L08095370: .4byte gUnknown_020121CC

	THUMB_FUNC_END SetPrepScreenUnitListEntry

	THUMB_FUNC_START GetPrepScreenUnitListSize
GetPrepScreenUnitListSize: @ 0x08095374
	ldr r0, .L08095380  @ gUnknown_020121CC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L08095380: .4byte gUnknown_020121CC

	THUMB_FUNC_END GetPrepScreenUnitListSize

	THUMB_FUNC_START SetPrepScreenUnitListSize
SetPrepScreenUnitListSize: @ 0x08095384
	ldr r1, .L08095390  @ gUnknown_020121CC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
.L08095390: .4byte gUnknown_020121CC

	THUMB_FUNC_END SetPrepScreenUnitListSize

	THUMB_FUNC_START func_08095394
func_08095394: @ 0x08095394
	push {lr}
	ldr r0, .L080953A8  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080953AC
	bl func_080C4088
	b .L080953B6
	.align 2, 0
.L080953A8: .4byte gGmData
.L080953AC:
	ldr r0, .L080953BC  @ gUnknown_020121CC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
.L080953B6:
	pop {r1}
	bx r1
	.align 2, 0
.L080953BC: .4byte gUnknown_020121CC

	THUMB_FUNC_END func_08095394

	THUMB_FUNC_START func_080953C0
func_080953C0: @ 0x080953C0
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080953D8  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080953DC
	adds r0, r2, #0
	bl func_080C409C
	b .L080953E6
	.align 2, 0
.L080953D8: .4byte gGmData
.L080953DC:
	ldr r0, .L080953EC  @ gUnknown_020121CC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	str r2, [r0]
.L080953E6:
	pop {r0}
	bx r0
	.align 2, 0
.L080953EC: .4byte gUnknown_020121CC

	THUMB_FUNC_END func_080953C0

	THUMB_FUNC_START IsCharacterForceDeployed
IsCharacterForceDeployed: @ 0x080953F0
	push {r4, lr}
	adds r4, r0, #0
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08095414
	bl GetBattleMapKind
	cmp r0, #0
	bne .L08095414
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl IsCharacterForceDeployed_
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L08095416
.L08095414:
	movs r0, #0
.L08095416:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsCharacterForceDeployed

	THUMB_FUNC_START CountForceDeployedUnits
CountForceDeployedUnits: @ 0x0809541C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
.L08095422:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq .L0809544A
	ldr r2, [r0]
	cmp r2, #0
	beq .L0809544A
	ldr r0, [r0, #0xc]
	ldr r1, .L08095458  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L0809544A
	ldrb r0, [r2, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809544A
	adds r5, #1
.L0809544A:
	adds r4, #1
	cmp r4, #0x3f
	ble .L08095422
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08095458: .4byte 0x00010004

	THUMB_FUNC_END CountForceDeployedUnits

	THUMB_FUNC_START SomeLeftoverFunctionThatReturns0
SomeLeftoverFunctionThatReturns0: @ 0x0809545C
	movs r0, #0
	bx lr

	THUMB_FUNC_END SomeLeftoverFunctionThatReturns0

	THUMB_FUNC_START IsUnitInCurrentRoster
IsUnitInCurrentRoster: @ 0x08095460
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, .L08095488  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L08095490
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L0809548C
	movs r0, #1
	b .L08095492
	.align 2, 0
.L08095488: .4byte 0x00010004
.L0809548C:
	movs r0, #8
	str r0, [r2, #0xc]
.L08095490:
	movs r0, #0
.L08095492:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsUnitInCurrentRoster

	THUMB_FUNC_START AtMenu_AddPrepScreenSupportMenuItem
AtMenu_AddPrepScreenSupportMenuItem: @ 0x08095498
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	adds r2, r0, #0
	adds r2, #0x2f
	strb r6, [r2]
	ldr r0, .L080954F8  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L080954EE
	movs r4, #0
	adds r5, r2, #0
.L080954B4:
	adds r0, r4, #0
	bl CanPrepScreenSupport
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080954CA
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
.L080954CA:
	adds r4, #1
	cmp r4, #3
	ble .L080954B4
	movs r0, #2
	bl CanPrepScreenSupport
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080954DE
	movs r6, #1
.L080954DE:
	ldr r1, .L080954FC  @ PrepScreenMenu_OnSupport
	ldr r3, .L08095500  @ 0x00000577
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r2, r6, #0
	bl SetPrepScreenMenuItem
.L080954EE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080954F8: .4byte gPlaySt
.L080954FC: .4byte PrepScreenMenu_OnSupport
.L08095500: .4byte 0x00000577

	THUMB_FUNC_END AtMenu_AddPrepScreenSupportMenuItem

	THUMB_FUNC_START CanPrepScreenCheckMap
CanPrepScreenCheckMap: @ 0x08095504
	push {lr}
	ldr r0, .L08095518  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x7d
	beq .L0809551C
	movs r0, #1
	b .L0809551E
	.align 2, 0
.L08095518: .4byte gPlaySt
.L0809551C:
	movs r0, #0
.L0809551E:
	pop {r1}
	bx r1

	THUMB_FUNC_END CanPrepScreenCheckMap

	THUMB_FUNC_START AtMenu_InitPrepScreenMenu
AtMenu_InitPrepScreenMenu: @ 0x08095524
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl StartPrepScreenMenu
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne .L080955CC
	ldr r1, .L0809557C  @ PrepScreenMenu_OnPickUnits
	ldr r3, .L08095580  @ 0x00000574
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, .L08095584  @ PrepScreenMenu_OnItems
	ldr r3, .L08095588  @ 0x00000576
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	adds r0, r5, #0
	bl AtMenu_AddPrepScreenSupportMenuItem
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08095590
	ldr r1, .L0809558C  @ PrepScreenMenu_OnCheckMap
	movs r3, #0xaf
	lsls r3, r3, #3
	str r4, [sp]
	movs r0, #7
	movs r2, #0
	bl SetPrepScreenMenuItem
	b .L080955A0
	.align 2, 0
.L0809557C: .4byte PrepScreenMenu_OnPickUnits
.L08095580: .4byte 0x00000574
.L08095584: .4byte PrepScreenMenu_OnItems
.L08095588: .4byte 0x00000576
.L0809558C: .4byte PrepScreenMenu_OnCheckMap
.L08095590:
	ldr r1, .L080955C0  @ PrepScreenMenu_OnCheckMap
	movs r3, #0xaf
	lsls r3, r3, #3
	str r0, [sp]
	movs r0, #7
	movs r2, #1
	bl SetPrepScreenMenuItem
.L080955A0:
	movs r4, #0
	bl CanPrepScreenSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080955AE
	movs r4, #1
.L080955AE:
	ldr r1, .L080955C4  @ PrepScreenMenu_OnSave
	ldr r3, .L080955C8  @ 0x00000579
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	bl SetPrepScreenMenuItem
	b .L080955F8
	.align 2, 0
.L080955C0: .4byte PrepScreenMenu_OnCheckMap
.L080955C4: .4byte PrepScreenMenu_OnSave
.L080955C8: .4byte 0x00000579
.L080955CC:
	ldr r1, .L08095630  @ PrepScreenMenu_OnPickUnits
	ldr r3, .L08095634  @ 0x00000574
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, .L08095638  @ PrepScreenMenu_OnItems
	ldr r3, .L0809563C  @ 0x00000576
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	ldr r1, .L08095640  @ PrepScreenMenu_OnCancel
	ldr r3, .L08095644  @ 0x0000075C
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	bl SetPrepScreenMenuItem
.L080955F8:
	ldr r0, .L08095648  @ PrepScreenMenu_OnBPress
	bl SetPrepScreenMenuOnBPress
	ldr r0, .L0809564C  @ PrepScreenMenu_OnStartPress
	bl SetPrepScreenMenuOnStartPress
	ldr r0, .L08095650  @ gBg0Tm
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L08095654  @ gBg1Tm
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095658
	movs r0, #1
	movs r1, #5
	bl SetPrepScreenMenuPosition
	b .L08095660
	.align 2, 0
.L08095630: .4byte PrepScreenMenu_OnPickUnits
.L08095634: .4byte 0x00000574
.L08095638: .4byte PrepScreenMenu_OnItems
.L0809563C: .4byte 0x00000576
.L08095640: .4byte PrepScreenMenu_OnCancel
.L08095644: .4byte 0x0000075C
.L08095648: .4byte PrepScreenMenu_OnBPress
.L0809564C: .4byte PrepScreenMenu_OnStartPress
.L08095650: .4byte gBg0Tm
.L08095654: .4byte gBg1Tm
.L08095658:
	movs r0, #1
	movs r1, #6
	bl SetPrepScreenMenuPosition
.L08095660:
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	bl SetPrepScreenMenuSelectedItem
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_InitPrepScreenMenu

	THUMB_FUNC_START func_08095674
func_08095674: @ 0x08095674
	push {r4, r5, lr}
	movs r5, #0
	b .L08095696
.L0809567A:
	bl GetLastStatScreenUid
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetPrepScreenUnitListEntry
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne .L08095694
	adds r0, r5, #0
	b .L080956A0
.L08095694:
	adds r5, #1
.L08095696:
	bl GetPrepScreenUnitListSize
	cmp r5, r0
	blt .L0809567A
	movs r0, #0
.L080956A0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08095674

	THUMB_FUNC_START func_080956A8
func_080956A8: @ 0x080956A8
	push {r4, r5, lr}
	movs r5, #0
	b .L080956C6
.L080956AE:
	adds r0, r5, #0
	bl GetPrepScreenUnitListEntry
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl func_08095394
	cmp r4, r0
	bne .L080956C4
	adds r0, r5, #0
	b .L080956D0
.L080956C4:
	adds r5, #1
.L080956C6:
	bl GetPrepScreenUnitListSize
	cmp r5, r0
	blt .L080956AE
	movs r0, #0
.L080956D0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080956A8

	THUMB_FUNC_START ReorderPlayerUnitsBasedOnDeployment
ReorderPlayerUnitsBasedOnDeployment: @ 0x080956D8
	push {r4, lr}
	ldr r0, .L08095740  @ gUnknown_020111CC
	bl InitUnitStack
	movs r4, #1
.L080956E2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08095704
	ldr r0, [r2]
	cmp r0, #0
	beq .L08095704
	ldr r0, [r2, #0xc]
	ldr r1, .L08095744  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L08095704
	adds r0, r2, #0
	bl PushUnit
.L08095704:
	adds r4, #1
	cmp r4, #0x3f
	ble .L080956E2
	movs r4, #1
.L0809570C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L0809572E
	ldr r0, [r2]
	cmp r0, #0
	beq .L0809572E
	ldr r0, [r2, #0xc]
	ldr r1, .L08095744  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	beq .L0809572E
	adds r0, r2, #0
	bl PushUnit
.L0809572E:
	adds r4, #1
	cmp r4, #0x3f
	ble .L0809570C
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08095740: .4byte gUnknown_020111CC
.L08095744: .4byte 0x0001000C

	THUMB_FUNC_END ReorderPlayerUnitsBasedOnDeployment

	THUMB_FUNC_START SortPlayerUnitsForPrepScreen
SortPlayerUnitsForPrepScreen: @ 0x08095748
	push {r4, r5, r6, r7, lr}
	bl GetChapterAllyUnitCount
	adds r7, r0, #0
	movs r6, #0
	ldr r0, .L0809580C  @ gUnknown_020111CC
	bl InitUnitStack
	movs r5, #1
.L0809575A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L08095794
	ldr r0, [r4]
	cmp r0, #0
	beq .L08095794
	ldr r0, [r4, #0xc]
	ldr r1, .L08095810  @ 0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095794
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095794
	adds r0, r4, #0
	bl PushUnit
.L08095794:
	adds r5, #1
	cmp r5, #0x3f
	ble .L0809575A
	movs r5, #1
.L0809579C:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L080957CE
	ldr r0, [r4]
	cmp r0, #0
	beq .L080957CE
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080957C8
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080957CE
.L080957C8:
	adds r0, r4, #0
	bl PushUnit
.L080957CE:
	adds r5, #1
	cmp r5, #0x3f
	ble .L0809579C
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
.L080957DA:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L08095832
	ldr r0, [r4]
	cmp r0, #0
	beq .L08095832
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095832
	adds r0, r4, #0
	bl SomeLeftoverFunctionThatReturns0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095818
	ldr r0, [r4, #0xc]
	ldr r1, .L08095814  @ gUnknown_02000008
	b .L0809582E
	.align 2, 0
.L0809580C: .4byte gUnknown_020111CC
.L08095810: .4byte 0xFDFFFFFF
.L08095814: .4byte gUnknown_02000008
.L08095818:
	cmp r7, r6
	ble .L0809582A
	ldr r0, [r4, #0xc]
	movs r1, #9
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b .L08095832
.L0809582A:
	ldr r0, [r4, #0xc]
	movs r1, #8
.L0809582E:
	orrs r0, r1
	str r0, [r4, #0xc]
.L08095832:
	adds r5, #1
	cmp r5, #0x3f
	ble .L080957DA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END SortPlayerUnitsForPrepScreen

	THUMB_FUNC_START func_08095840
func_08095840: @ 0x08095840
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #1
.L08095848:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov r8, r4
	cmp r5, #0
	beq .L080958AC
	ldr r0, [r5]
	cmp r0, #0
	beq .L080958AC
	movs r7, #0
	ldr r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl GetUnitItemCount
	cmp r7, r0
	bge .L080958A2
	adds r4, r5, #0
	adds r4, #0x1e
	adds r6, r0, #0
.L08095878:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0xb7
	beq .L08095894
	cmp r0, #0xb7
	bgt .L08095890
	cmp r0, #0x84
	bgt .L0809589A
	cmp r0, #0x81
	blt .L0809589A
	b .L08095894
.L08095890:
	cmp r0, #0xcc
	bne .L0809589A
.L08095894:
	movs r0, #0
	strh r0, [r4]
	movs r7, #1
.L0809589A:
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bne .L08095878
.L080958A2:
	cmp r7, #0
	beq .L080958AC
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
.L080958AC:
	mov r4, r8
	cmp r4, #0x3f
	ble .L08095848
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08095840

	THUMB_FUNC_START InitPrepScreenUnitList
InitPrepScreenUnitList: @ 0x080958BC
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #1
.L080958C2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L080958EA
	ldr r0, [r4]
	cmp r0, #0
	beq .L080958EA
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080958EA
	adds r0, r6, #0
	adds r1, r4, #0
	bl SetPrepScreenUnitListEntry
	adds r6, #1
.L080958EA:
	adds r5, #1
	cmp r5, #0x3f
	ble .L080958C2
	adds r0, r6, #0
	bl SetPrepScreenUnitListSize
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END InitPrepScreenUnitList

	THUMB_FUNC_START func_080958FC
func_080958FC: @ 0x080958FC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b .L08095918
.L08095904:
	adds r0, r4, #0
	bl GetPrepScreenUnitListEntry
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne .L08095916
	adds r0, r4, #0
	b .L08095922
.L08095916:
	adds r4, #1
.L08095918:
	bl GetPrepScreenUnitListSize
	cmp r4, r0
	blt .L08095904
	movs r0, #0
.L08095922:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080958FC

	THUMB_FUNC_START func_08095928
func_08095928: @ 0x08095928
	push {r4, lr}
	bl ResetUnitSprites
	movs r4, #0
	b .L0809595E
.L08095932:
	adds r0, r4, #0
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne .L0809594C
	movs r0, #3
	negs r0, r0
	ands r1, r0
	b .L08095950
.L0809594C:
	movs r0, #0xa
	orrs r1, r0
.L08095950:
	str r1, [r2, #0xc]
	adds r0, r2, #0
	bl GetUnitSpriteId
	bl UseUnitSprite
	adds r4, #1
.L0809595E:
	bl GetPrepScreenUnitListSize
	cmp r4, r0
	blt .L08095932
	bl ForceSyncUnitSpriteSheet
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08095928

	THUMB_FUNC_START func_08095970
func_08095970: @ 0x08095970
	push {r4, r5, r6, lr}
	movs r5, #0
	bl GetChapterAllyUnitCount
	adds r6, r0, #0
	movs r4, #0
	b .L080959A0
.L0809597E:
	adds r0, r4, #0
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r3, #8
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne .L0809599E
	cmp r5, r6
	blt .L0809599C
	orrs r1, r3
	str r1, [r2, #0xc]
	b .L0809599E
.L0809599C:
	adds r5, #1
.L0809599E:
	adds r4, #1
.L080959A0:
	bl GetPrepScreenUnitListSize
	cmp r4, r0
	blt .L0809597E
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08095970

	THUMB_FUNC_START AtMenu_AutoCapDeployPrepScreenUnits
AtMenu_AutoCapDeployPrepScreenUnits: @ 0x080959B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	movs r6, #0
	adds r7, r1, #0
	b .L080959FC
.L080959CA:
	adds r0, r6, #0
	bl GetPrepScreenUnitListEntry
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r5, #8
	ands r0, r5
	cmp r0, #0
	bne .L080959F4
	adds r2, r4, #0
	adds r2, #0x2b
	adds r1, r4, #0
	adds r1, #0x2a
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcc .L080959F0
	str r5, [r3, #0xc]
	b .L080959F4
.L080959F0:
	adds r0, #1
	strb r0, [r2]
.L080959F4:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	adds r6, #1
.L080959FC:
	bl GetPrepScreenUnitListSize
	cmp r6, r0
	blt .L080959CA
	adds r2, r4, #0
	adds r2, #0x29
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r2, [r2]
	ldrb r1, [r0]
	cmp r2, r1
	bcs .L08095A16
	strb r2, [r0]
.L08095A16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_AutoCapDeployPrepScreenUnits

	THUMB_FUNC_START RestartScreenMenuScrollingBg
RestartScreenMenuScrollingBg: @ 0x08095A1C
	push {lr}
	ldr r0, .L08095A34  @ gUnknown_08A006E4
	bl EndEachProc
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartScreenMenuScrollingBg
	pop {r0}
	bx r0
	.align 2, 0
.L08095A34: .4byte gUnknown_08A006E4

	THUMB_FUNC_END RestartScreenMenuScrollingBg

	THUMB_FUNC_START EndScreenMenuScrollingBg
EndScreenMenuScrollingBg: @ 0x08095A38
	push {lr}
	bl EndBG3Slider
	pop {r0}
	bx r0

	THUMB_FUNC_END EndScreenMenuScrollingBg

	THUMB_FUNC_START func_08095A44
func_08095A44: @ 0x08095A44
	push {r4, r5, lr}
	sub sp, #0x20
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, .L08095AA0  @ 0x06010000
	adds r2, r2, r0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl InitSpriteTextFont
	ldr r0, .L08095AA4  @ Pal_SystemText
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	bl GetBattleMapKind
	adds r5, r4, #0
	cmp r0, #2
	beq .L08095AAC
	ldr r0, .L08095AA8  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8a
	ldrh r0, [r0]
	b .L08095AB0
	.align 2, 0
.L08095AA0: .4byte 0x06010000
.L08095AA4: .4byte Pal_SystemText
.L08095AA8: .4byte gPlaySt
.L08095AAC:
	movs r0, #0xcf
	lsls r0, r0, #1
.L08095AB0:
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x60
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08095A44

	THUMB_FUNC_START AtMenu_8095AD8
AtMenu_8095AD8: @ 0x08095AD8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl func_080953C0
	movs r0, #0
	str r0, [r4, #0x40]
	strh r0, [r4, #0x3c]
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095AFA
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #5
	b .L08095B02
.L08095AFA:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x2a
.L08095B02:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_8095AD8

	THUMB_FUNC_START ClearPrepScreenMenuHelpText
ClearPrepScreenMenuHelpText: @ 0x08095B30
	push {r4, r5, lr}
	ldr r5, .L08095B5C  @ gUnknown_020111A4
	movs r4, #4
.L08095B36:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08095B36
	ldr r0, .L08095B60  @ gBg2Tm+0x19A
	movs r1, #0xf
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08095B5C: .4byte gUnknown_020111A4
.L08095B60: .4byte gBg2Tm+0x19A

	THUMB_FUNC_END ClearPrepScreenMenuHelpText

	THUMB_FUNC_START DrawPrepScreenMenuHelpText
DrawPrepScreenMenuHelpText: @ 0x08095B64
	push {r4, lr}
	ldr r4, .L08095B80  @ gUnknown_020111A4
	bl GetMsg
.L08095B6C:
	adds r1, r0, #0
.L08095B6E:
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08095B8C
	cmp r0, #1
	bne .L08095B84
	adds r4, #8
	adds r1, #1
	b .L08095B6E
	.align 2, 0
.L08095B80: .4byte gUnknown_020111A4
.L08095B84:
	adds r0, r4, #0
	bl Text_DrawCharacter
	b .L08095B6C
.L08095B8C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END DrawPrepScreenMenuHelpText

	THUMB_FUNC_START DisplayPrepScreenMenuHelpText
DisplayPrepScreenMenuHelpText: @ 0x08095B94
	push {r4, r5, lr}
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	negs r1, r0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	movs r5, #0
	negs r1, r1
	adds r4, r1, #7
.L08095BAA:
	lsls r0, r5, #3
	ldr r1, .L08095BD0  @ gUnknown_020111A4
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r2, .L08095BD4  @ gBg2Tm+0x1A
	adds r1, r1, r2
	bl PutText
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble .L08095BAA
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08095BD0: .4byte gUnknown_020111A4
.L08095BD4: .4byte gBg2Tm+0x1A

	THUMB_FUNC_END DisplayPrepScreenMenuHelpText

	THUMB_FUNC_START UpdatePrepScreenMenuHelp_Clear
UpdatePrepScreenMenuHelp_Clear: @ 0x08095BD8
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl ClearPrepScreenMenuHelpText
	pop {r0}
	bx r0

	THUMB_FUNC_END UpdatePrepScreenMenuHelp_Clear

	THUMB_FUNC_START UpdatePrepScreenMenuHelp_Draw
UpdatePrepScreenMenuHelp_Draw: @ 0x08095BE8
	push {lr}
	ldr r0, [r0, #0x58]
	bl DrawPrepScreenMenuHelpText
	pop {r0}
	bx r0

	THUMB_FUNC_END UpdatePrepScreenMenuHelp_Draw

	THUMB_FUNC_START UpdatePrepScreenMenuHelp_Display
UpdatePrepScreenMenuHelp_Display: @ 0x08095BF4
	push {lr}
	bl DisplayPrepScreenMenuHelpText
	pop {r0}
	bx r0

	THUMB_FUNC_END UpdatePrepScreenMenuHelp_Display

	THUMB_FUNC_START StartUpdatePrepScreenMenuHelp
StartUpdatePrepScreenMenuHelp: @ 0x08095C00
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, .L08095C28  @ gUnknown_08A1826C
	adds r0, r5, #0
	bl FindProc
	cmp r0, #0
	beq .L08095C16
	bl Proc_End
.L08095C16:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08095C28: .4byte gUnknown_08A1826C

	THUMB_FUNC_END StartUpdatePrepScreenMenuHelp

	THUMB_FUNC_START func_08095C2C
func_08095C2C: @ 0x08095C2C
	push {r4, lr}
	adds r4, r0, #0
	bl func_080AD2D4
	bl func_08096C20
	bl EndScreenMenuScrollingBg
	bl GetActivePrepScreenMenuItemId
	adds r4, #0x2d
	strb r0, [r4]
	bl EndPrepScreenMenu
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08095C2C

	THUMB_FUNC_START func_08095C50
func_08095C50: @ 0x08095C50
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, .L08095C78  @ gUnknown_08A1AC88
	ldr r1, .L08095C7C  @ 0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, .L08095C80  @ gUnknown_08A1B174
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08095C78: .4byte gUnknown_08A1AC88
.L08095C7C: .4byte 0x06010000
.L08095C80: .4byte gUnknown_08A1B174

	THUMB_FUNC_END func_08095C50

	THUMB_FUNC_START AtMenu_Reinitialize
AtMenu_Reinitialize: @ 0x08095C84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, .L08095E00  @ gUnknown_08A181E8
	bl SetupBackgrounds
	bl ResetText
	bl LoadUiFrameGraphics
	movs r0, #0
	movs r1, #0xe
	bl LoadHelpBoxGfx
	ldr r2, .L08095E04  @ gDispIo
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
	bl LoadObjUiGfx
	bl ResetUnitSprites
	bl InitPrepScreenUnitList
	adds r0, r7, #0
	bl AtMenu_AutoCapDeployPrepScreenUnits
	bl ReorderPlayerUnitsBasedOnDeployment
	ldr r0, .L08095E08  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08095E0C  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08095E10  @ gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r5, .L08095E14  @ gUnknown_020111A4
	movs r4, #4
.L08095CF2:
	adds r0, r5, #0
	movs r1, #0xe
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08095CF2
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldr r5, .L08095E18  @ gUnknown_02011184
	movs r4, #3
.L08095D0C:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08095D0C
	ldr r0, .L08095E1C  @ gUnknown_0201117C
	movs r1, #0xa
	bl InitText
	ldr r0, .L08095E20  @ gUnknown_08A1A4C8
	ldr r1, .L08095E24  @ 0x06014800
	bl Decompress
	ldr r0, .L08095E28  @ gUnknown_08A1D510
	ldr r1, .L08095E2C  @ 0x06016000
	bl Decompress
	ldr r0, .L08095E30  @ gUnknown_08A1B154
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #6
	bl func_08095C50
	ldr r0, .L08095E34  @ gUnknown_08A1D4C8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl EnablePalSync
	ldr r3, .L08095E04  @ gDispIo
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldrb r1, [r3, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
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
	adds r0, r7, #0
	bl AtMenu_InitPrepScreenMenu
	movs r0, #0xf
	bl EnableBgSync
	bl SetBlendNone
	adds r0, r7, #0
	bl func_08096BFC
	bl RestartScreenMenuScrollingBg
	ldr r0, .L08095E38  @ gUiFramePaletteB
	movs r1, #0x40
	movs r2, #0x60
	bl ApplyPaletteExt
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095E48
	ldr r0, .L08095E3C  @ gUnknown_08A1B698
	ldr r4, .L08095E40  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L08095E44  @ gBg1Tm+0x142
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	b .L08095E76
	.align 2, 0
.L08095E00: .4byte gUnknown_08A181E8
.L08095E04: .4byte gDispIo
.L08095E08: .4byte gBg0Tm
.L08095E0C: .4byte gBg1Tm
.L08095E10: .4byte gBg2Tm
.L08095E14: .4byte gUnknown_020111A4
.L08095E18: .4byte gUnknown_02011184
.L08095E1C: .4byte gUnknown_0201117C
.L08095E20: .4byte gUnknown_08A1A4C8
.L08095E24: .4byte 0x06014800
.L08095E28: .4byte gUnknown_08A1D510
.L08095E2C: .4byte 0x06016000
.L08095E30: .4byte gUnknown_08A1B154
.L08095E34: .4byte gUnknown_08A1D4C8
.L08095E38: .4byte gUiFramePaletteB
.L08095E3C: .4byte gUnknown_08A1B698
.L08095E40: .4byte gBuf
.L08095E44: .4byte gBg1Tm+0x142
.L08095E48:
	ldr r0, .L08095EAC  @ gUnknown_08A1B658
	ldr r5, .L08095EB0  @ gBuf
	adds r1, r5, #0
	bl Decompress
	ldr r4, .L08095EB4  @ gBg1Tm+0xA0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
	ldr r0, .L08095EB8  @ gUnknown_08A1B698
	adds r1, r5, #0
	bl Decompress
	adds r4, #0xe2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
.L08095E76:
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #0xb
	bl func_08095A44
	adds r0, r7, #0
	bl func_080AD1AC
	movs r0, #0xd0
	lsls r0, r0, #7
	bl func_080AD1D0
	bl GetActivePrepScreenMenuItemId
	mov r1, r8
	strb r0, [r1]
	bl GetActivePrepScreenMenuItemHelpTextId
	bl DrawPrepScreenMenuHelpText
	bl DisplayPrepScreenMenuHelpText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095EAC: .4byte gUnknown_08A1B658
.L08095EB0: .4byte gBuf
.L08095EB4: .4byte gBg1Tm+0xA0
.L08095EB8: .4byte gUnknown_08A1B698

	THUMB_FUNC_END AtMenu_Reinitialize

	THUMB_FUNC_START AtMenu_EndIfNoUnits
AtMenu_EndIfNoUnits: @ 0x08095EBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, .L08095F28  @ gDispIo
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
	movs r4, #1
.L08095EE2:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L08095F06
	ldr r0, [r1]
	cmp r0, #0
	beq .L08095F06
	adds r0, r1, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08095F06
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L08095F06:
	adds r4, #1
	cmp r4, #0x3f
	ble .L08095EE2
	cmp r5, #0
	bne .L08095F20
	adds r1, r6, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
.L08095F20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08095F28: .4byte gDispIo

	THUMB_FUNC_END AtMenu_EndIfNoUnits

	THUMB_FUNC_START AtMenu_MaintainPrepScreenMenuHelp
AtMenu_MaintainPrepScreenMenuHelp: @ 0x08095F2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetActivePrepScreenMenuItemId
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	cmp r0, r6
	beq .L08095F4C
	bl GetActivePrepScreenMenuItemHelpTextId
	adds r1, r5, #0
	bl StartUpdatePrepScreenMenuHelp
	strb r6, [r4]
.L08095F4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_MaintainPrepScreenMenuHelp

	THUMB_FUNC_START func_08095F54
func_08095F54: @ 0x08095F54
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, .L08095FCC  @ gUnknown_02011184
	adds r0, #0x2f
	ldrb r0, [r0]
	bl func_080950C4
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	movs r1, #5
	movs r2, #9
	bl DrawUiFrame2
	movs r4, #0
	movs r6, #0xc0
	lsls r6, r6, #1
.L08095F7E:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L08095FB6
	adds r0, r5, #0
	bl ClearText
	ldr r1, .L08095FD0  @ gUnknown_08A196BC
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	ldr r1, .L08095FD4  @ gBg0Tm+0x8
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #8
	adds r6, #0x80
.L08095FB6:
	adds r4, #1
	cmp r4, #3
	ble .L08095F7E
	movs r0, #3
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08095FCC: .4byte gUnknown_02011184
.L08095FD0: .4byte gUnknown_08A196BC
.L08095FD4: .4byte gBg0Tm+0x8

	THUMB_FUNC_END func_08095F54

	THUMB_FUNC_START func_08095FD8
func_08095FD8: @ 0x08095FD8
	push {lr}
	ldr r0, .L08095FFC  @ gBg0Tm+0x146
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L08096000  @ gBg1Tm+0x146
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L08095FFC: .4byte gBg0Tm+0x146
.L08096000: .4byte gBg1Tm+0x146

	THUMB_FUNC_END func_08095FD8

	THUMB_FUNC_START func_08096004
func_08096004: @ 0x08096004
	push {r4, lr}
	adds r4, r0, #0
	bl DisablePrepScreenMenu
	adds r0, r4, #0
	bl func_08095F54
	adds r4, #0x2e
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x1c
	movs r2, #7
	bl func_080AD51C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08096004

	THUMB_FUNC_START func_0809602C
func_0809602C: @ 0x0809602C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	add r1, sp, #4
	ldr r0, .L08096080  @ gUnknown_08205BC0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	mov r9, r0
	movs r1, #0x1c
	mov sl, r1
	lsls r0, r0, #4
	adds r6, r0, #0
	adds r6, #0x30
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r2, [r4]
	mov r8, r2
	cmp r2, #0
	beq .L08096088
	ldr r0, .L08096084  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08096076
	b .L08096184
.L08096076:
	bl MoveableHelpBox_OnEnd
	movs r0, #0
	strb r0, [r4]
	b .L08096246
	.align 2, 0
.L08096080: .4byte gUnknown_08205BC0
.L08096084: .4byte gKeySt
.L08096088:
	ldr r0, .L080960DC  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080960E4
	ldr r0, .L080960E0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080960A8
	movs r0, #0x6a
	bl m4aSongNumStart
.L080960A8:
	ldrb r0, [r5]
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl func_08095094
	cmp r0, #2
	bne .L080960CA
	movs r2, #0x80
	lsls r2, r2, #1
	mov r3, r8
	str r3, [sp]
	movs r0, #0x37
	adds r1, r2, #0
	movs r3, #0x20
	bl func_080029E8
.L080960CA:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #4
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b .L08096246
	.align 2, 0
.L080960DC: .4byte gKeySt
.L080960E0: .4byte gPlaySt
.L080960E4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08096110
	movs r0, #1
	strb r0, [r4]
	ldrb r0, [r5]
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl func_08095094
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	movs r0, #0x1c
	adds r1, r6, #0
	bl ShowTextHelpBox
	b .L08096246
.L08096110:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08096184
	adds r0, r7, #0
	bl func_08095FD8
	ldr r0, .L08096170  @ gUnknown_08A1B658
	ldr r5, .L08096174  @ gBuf
	adds r1, r5, #0
	bl Decompress
	ldr r4, .L08096178  @ gBg1Tm+0xA0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
	ldr r0, .L0809617C  @ gUnknown_08A1B698
	adds r1, r5, #0
	bl Decompress
	adds r4, #0xe2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
	movs r0, #1
	movs r1, #6
	bl SetPrepScreenMenuPosition
	ldr r0, .L08096180  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08096166
	movs r0, #0x6b
	bl m4aSongNumStart
.L08096166:
	adds r0, r7, #0
	bl Proc_Break
	b .L08096246
	.align 2, 0
.L08096170: .4byte gUnknown_08A1B658
.L08096174: .4byte gBuf
.L08096178: .4byte gBg1Tm+0xA0
.L0809617C: .4byte gUnknown_08A1B698
.L08096180: .4byte gPlaySt
.L08096184:
	ldr r0, .L080961E0  @ gKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	adds r5, r7, #0
	adds r5, #0x2e
	cmp r0, #0
	beq .L080961B6
	ldrb r0, [r5]
	cmp r0, #0
	bne .L080961B2
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L080961B6
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl func_080950C4
.L080961B2:
	subs r0, #1
	strb r0, [r5]
.L080961B6:
	ldr r6, .L080961E0  @ gKeySt
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r4, #0x80
	mov r8, r4
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq .L080961F4
	ldrb r4, [r5]
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl func_080950C4
	subs r0, #1
	cmp r4, r0
	bge .L080961E4
	ldrb r0, [r5]
	adds r0, #1
	b .L080961F2
	.align 2, 0
.L080961E0: .4byte gKeySt
.L080961E4:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq .L080961F4
	movs r0, #0
.L080961F2:
	strb r0, [r5]
.L080961F4:
	ldrb r2, [r5]
	cmp r9, r2
	beq .L08096246
	lsls r0, r2, #4
	adds r6, r0, #0
	adds r6, #0x30
	adds r0, r7, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08096226
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, r2, #0
	bl func_08095094
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	mov r0, sl
	adds r1, r6, #0
	bl ShowTextHelpBox
.L08096226:
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, sl
	adds r1, r6, #0
	movs r2, #7
	bl func_080AD51C
	ldr r0, .L08096258  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08096246
	movs r0, #0x66
	bl m4aSongNumStart
.L08096246:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08096258: .4byte gPlaySt

	THUMB_FUNC_END func_0809602C

	THUMB_FUNC_START func_0809625C
func_0809625C: @ 0x0809625C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
.L08096262:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L0809627C
	ldr r0, [r2]
	cmp r0, #0
	beq .L0809627C
	ldr r0, [r2, #0xc]
	ldr r1, .L08096290  @ 0xFDFFFFFF
	ands r0, r1
	str r0, [r2, #0xc]
.L0809627C:
	adds r4, #1
	cmp r4, #0x3f
	ble .L08096262
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08096290: .4byte 0xFDFFFFFF

	THUMB_FUNC_END func_0809625C

	THUMB_FUNC_START func_08096294
func_08096294: @ 0x08096294
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl EndScreenMenuScrollingBg
	bl func_08096C20
	movs r0, #0
	bl SetupBackgrounds
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
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080962D8
	adds r0, r4, #0
	bl nullsub_20
.L080962D8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08096294

	THUMB_FUNC_START func_080962E0
func_080962E0: @ 0x080962E0
	push {r4, lr}
	adds r4, r0, #0
	bl ReorderPlayerUnitsBasedOnDeployment
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq .L080962F6
	bl EndPrepScreen
	b .L08096304
.L080962F6:
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08096304
	bl func_08042EA8
.L08096304:
	bl PositionUnitsAccordingToDeployment
	bl ResetUnitSprites
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080962E0

	THUMB_FUNC_START AtMenu_StartSubmenu
AtMenu_StartSubmenu: @ 0x0809631C
	push {r4, lr}
	adds r4, r0, #0
	bl func_08095C2C
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi .L08096384
	lsls r0, r0, #2
	ldr r1, .L0809633C  @ .L08096340
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0809633C: .4byte .L08096340
.L08096340: @ jump table
	.4byte .L08096364 @ case 0
	.4byte .L0809635C @ case 1
	.4byte .L0809637E @ case 2
	.4byte .L08096374 @ case 3
	.4byte .L08096354 @ case 4
.L08096354:
	adds r0, r4, #0
	bl func_0808E79C
	b .L08096384
.L0809635C:
	adds r0, r4, #0
	bl StartPrepScreenItemsMenu
	b .L08096384
.L08096364:
	ldr r0, .L08096370  @ gUnknown_08A18E8C
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L08096384
	.align 2, 0
.L08096370: .4byte gUnknown_08A18E8C
.L08096374:
	movs r0, #2
	adds r1, r4, #0
	bl StartPrepScreenSupportMenu
	b .L08096384
.L0809637E:
	adds r0, r4, #0
	bl StartPrepScreenSaveMenu
.L08096384:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_StartSubmenu

	THUMB_FUNC_START AtMenu_OnSubmenuEnd
AtMenu_OnSubmenuEnd: @ 0x08096390
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r0, [r5]
	cmp r0, #3
	bne .L080963AC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
.L080963AC:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #4
	bhi .L080963F4
	lsls r0, r0, #2
	ldr r1, .L080963C0  @ .L080963C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080963C0: .4byte .L080963C4
.L080963C4: @ jump table
	.4byte .L080963EC @ case 0
	.4byte .L080963EC @ case 1
	.4byte .L080963E2 @ case 2
	.4byte .L080963D8 @ case 3
	.4byte .L080963EC @ case 4
.L080963D8:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	b .L080963F4
.L080963E2:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b .L080963F4
.L080963EC:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
.L080963F4:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_OnSubmenuEnd

	THUMB_FUNC_START func_08096404
func_08096404: @ 0x08096404
	ldr r2, .L08096420  @ gDispIo
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
	bx lr
	.align 2, 0
.L08096420: .4byte gDispIo

	THUMB_FUNC_END func_08096404

	THUMB_FUNC_START AtMenu_LockGame
AtMenu_LockGame: @ 0x08096424
	push {lr}
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08096438
	bl LockGameLogic
	bl LockBmDisplay
.L08096438:
	pop {r0}
	bx r0

	THUMB_FUNC_END AtMenu_LockGame

	THUMB_FUNC_START func_0809643C
func_0809643C: @ 0x0809643C
	push {lr}
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08096450
	bl UnlockBmDisplay
	bl UnlockGameLogic
.L08096450:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809643C

	THUMB_FUNC_START StartAtMenu
StartAtMenu: @ 0x08096454
	push {lr}
	ldr r0, .L08096464  @ gUnknown_08A1829C
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08096464: .4byte gUnknown_08A1829C

	THUMB_FUNC_END StartAtMenu

	THUMB_FUNC_START StartAtMenu_LinkArena
StartAtMenu_LinkArena: @ 0x08096468
	push {lr}
	ldr r0, .L08096480  @ gUnknown_08A1829C
	movs r1, #3
	bl SpawnProc
	bl func_08095840
	bl func_080952D4
	pop {r0}
	bx r0
	.align 2, 0
.L08096480: .4byte gUnknown_08A1829C

	THUMB_FUNC_END StartAtMenu_LinkArena

	THUMB_FUNC_START func_08096484
func_08096484: @ 0x08096484
	push {lr}
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08096484

	THUMB_FUNC_START func_08096494
func_08096494: @ 0x08096494
	push {lr}
	sub sp, #4
	bl func_0808F270
	bl ClearDialogueAndFaces
	bl EndEachSpriteAnimProc
	ldr r3, .L080964F0  @ gDispIo
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
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L080964F0: .4byte gDispIo

	THUMB_FUNC_END func_08096494

	THUMB_FUNC_START func_080964F4
func_080964F4: @ 0x080964F4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	bl GetUnitByPid
	adds r5, r0, #0
	cmp r5, #0
	bne .L0809650E
	adds r0, r4, #0
	bl Proc_End
	b .L08096556
.L0809650E:
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	movs r4, #0
	strh r0, [r1]
	ldr r2, .L0809655C  @ gDispIo
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
	subs r1, #0x80
	adds r0, r5, #0
	movs r2, #0
	bl func_0802F598
	ldr r1, .L08096560  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, .L08096564  @ gBattleUnitA
	adds r0, #0x4a
	strh r4, [r0]
	ldr r0, .L08096568  @ gBattleUnitB
	adds r0, #0x4a
	strh r4, [r0]
	bl BeginBattleAnimations
.L08096556:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809655C: .4byte gDispIo
.L08096560: .4byte gBattleStats
.L08096564: .4byte gBattleUnitA
.L08096568: .4byte gBattleUnitB

	THUMB_FUNC_END func_080964F4

	THUMB_FUNC_START func_0809656C
func_0809656C: @ 0x0809656C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne .L08096588
	adds r0, r5, #0
	bl Proc_Break
.L08096588:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809656C

	THUMB_FUNC_START func_08096590
func_08096590: @ 0x08096590
	push {r4, lr}
	sub sp, #4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl GetUnitByPid
	adds r1, r0, #0
	cmp r1, #0
	beq .L080965A8
	movs r0, #0xff
	strb r0, [r1, #9]
.L080965A8:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	ldr r2, .L080965EC  @ gDispIo
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
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0x20
	bl func_080029E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080965EC: .4byte gDispIo

	THUMB_FUNC_END func_08096590

	THUMB_FUNC_START func_080965F0
func_080965F0: @ 0x080965F0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl func_0808F270
	bl ClearDialogueAndFaces
	bl EndEachSpriteAnimProc
	ldr r3, .L08096660  @ gDispIo
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
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, .L08096664  @ gUnknown_08A184B4
	adds r1, r4, #0
	bl SpawnProcLocking
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08096660: .4byte gDispIo
.L08096664: .4byte gUnknown_08A184B4

	THUMB_FUNC_END func_080965F0

	THUMB_FUNC_START func_08096668
func_08096668: @ 0x08096668
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x20
	bl func_080029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08096668

	THUMB_FUNC_START NewPrepScreenTraineePromotionManager
NewPrepScreenTraineePromotionManager: @ 0x08096684
	push {lr}
	ldr r0, .L08096694  @ gUnknown_08A184F4
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08096694: .4byte gUnknown_08A184F4

	THUMB_FUNC_END NewPrepScreenTraineePromotionManager

	THUMB_FUNC_START PrepScreenTraineePromotionManagerExists
PrepScreenTraineePromotionManagerExists: @ 0x08096698
	push {lr}
	ldr r0, .L080966AC  @ gUnknown_08A184F4
	bl FindProc
	cmp r0, #0
	beq .L080966A6
	movs r0, #1
.L080966A6:
	pop {r1}
	bx r1
	.align 2, 0
.L080966AC: .4byte gUnknown_08A184F4

	THUMB_FUNC_END PrepScreenTraineePromotionManagerExists

	THUMB_FUNC_START AtMenuExists
AtMenuExists: @ 0x080966B0
	push {lr}
	ldr r0, .L080966C4  @ gUnknown_08A1829C
	bl FindProc
	cmp r0, #0
	beq .L080966BE
	movs r0, #1
.L080966BE:
	pop {r1}
	bx r1
	.align 2, 0
.L080966C4: .4byte gUnknown_08A1829C

	THUMB_FUNC_END AtMenuExists

	THUMB_FUNC_START func_080966C8
func_080966C8: @ 0x080966C8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, .L080966EC  @ gUnknown_08A1856E
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080966EC: .4byte gUnknown_08A1856E

	THUMB_FUNC_END func_080966C8

	THUMB_FUNC_START func_080966F0
func_080966F0: @ 0x080966F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L08096724
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x40
	ldr r0, .L08096750  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
.L08096724:
	ldr r3, .L08096754  @ gUnknown_08A18582
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt .L08096758
	adds r1, r6, #0
	adds r1, #0x30
	ldr r0, .L08096750  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b .L0809677A
	.align 2, 0
.L08096750: .4byte gUnknown_08A18614
.L08096754: .4byte gUnknown_08A18582
.L08096758:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, .L080967AC  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
.L0809677A:
	adds r5, r6, #0
	adds r5, #0x38
	ldr r4, .L080967AC  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080967AC: .4byte gUnknown_08A18614

	THUMB_FUNC_END func_080966F0

	THUMB_FUNC_START func_080967B0
func_080967B0: @ 0x080967B0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080967E4
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x40
	ldr r0, .L08096810  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
.L080967E4:
	ldr r3, .L08096814  @ gUnknown_08A18590
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt .L08096818
	adds r1, r6, #0
	adds r1, #0x30
	ldr r0, .L08096810  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b .L0809683A
	.align 2, 0
.L08096810: .4byte gUnknown_08A18614
.L08096814: .4byte gUnknown_08A18590
.L08096818:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, .L0809686C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
.L0809683A:
	adds r5, r6, #0
	adds r5, #0x38
	ldr r4, .L0809686C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809686C: .4byte gUnknown_08A18614

	THUMB_FUNC_END func_080967B0

	THUMB_FUNC_START func_08096870
func_08096870: @ 0x08096870
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080968A4
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x3c
	ldr r0, .L080968D0  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
.L080968A4:
	adds r1, r6, #4
	ldr r3, .L080968D4  @ gUnknown_08A1859E
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt .L080968D8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r0, .L080968D0  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b .L080968FA
	.align 2, 0
.L080968D0: .4byte gUnknown_08A18614
.L080968D4: .4byte gUnknown_08A1859E
.L080968D8:
	adds r5, r6, #0
	adds r5, #0x2c
	ldr r4, .L0809692C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
.L080968FA:
	adds r5, r6, #0
	adds r5, #0x34
	ldr r4, .L0809692C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809692C: .4byte gUnknown_08A18614

	THUMB_FUNC_END func_08096870

	THUMB_FUNC_START func_08096930
func_08096930: @ 0x08096930
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, .L08096954  @ gUnknown_08A185AC
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08096954: .4byte gUnknown_08A185AC

	THUMB_FUNC_END func_08096930

	THUMB_FUNC_START func_08096958
func_08096958: @ 0x08096958
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r4, #0xa0
	movs r5, #8
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08096974
	b .L08096A80
.L08096974:
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #4
	bhi .L080969E8
	lsls r0, r0, #2
	ldr r1, .L08096988  @ .L0809698C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08096988: .4byte .L0809698C
.L0809698C: @ jump table
	.4byte .L080969E8 @ case 0
	.4byte .L080969A0 @ case 1
	.4byte .L080969B4 @ case 2
	.4byte .L080969C8 @ case 3
	.4byte .L080969DC @ case 4
.L080969A0:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080966F0
	b .L080969E8
.L080969B4:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080967B0
	b .L080969E8
.L080969C8:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_08096870
	b .L080969E8
.L080969DC:
	movs r2, #0xc7
	lsls r2, r2, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_08096930
.L080969E8:
	movs r0, #0x33
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov r9, r1
	ldr r6, .L08096A6C  @ 0x0000B6C0
	movs r5, #0x80
	movs r4, #2
.L080969FA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x18
	ldr r3, .L08096A70  @ Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge .L080969FA
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08096A26
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L08096A38
.L08096A26:
	ldr r3, .L08096A74  @ gUnknown_08A18E4E
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #0x8c
	bl PutSpriteExt
.L08096A38:
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08096A4C
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L08096A5E
.L08096A4C:
	ldr r3, .L08096A78  @ gUnknown_08A18E76
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x64
	movs r2, #0x8c
	bl PutSpriteExt
.L08096A5E:
	ldr r2, .L08096A7C  @ 0x00009380
	movs r0, #0x74
	movs r1, #0x28
	bl func_080966C8
	b .L08096AA4
	.align 2, 0
.L08096A6C: .4byte 0x0000B6C0
.L08096A70: .4byte Sprite_32x16
.L08096A74: .4byte gUnknown_08A18E4E
.L08096A78: .4byte gUnknown_08A18E76
.L08096A7C: .4byte 0x00009380
.L08096A80:
	bl func_08095264
	cmp r0, #0
	beq .L08096A9A
	ldr r3, .L08096AB4  @ gUnknown_08A18E62
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #0x8c
	bl PutSpriteExt
.L08096A9A:
	ldr r2, .L08096AB8  @ 0x00009380
	movs r0, #0x74
	movs r1, #0x20
	bl func_080966C8
.L08096AA4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08096AB4: .4byte gUnknown_08A18E62
.L08096AB8: .4byte 0x00009380

	THUMB_FUNC_END func_08096958

	THUMB_FUNC_START func_08096ABC
func_08096ABC: @ 0x08096ABC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x36]
	bl ForceSyncUnitSpriteSheet
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq .L08096AFC
	ldr r0, .L08096AF4  @ gUnknown_08A1B194
	ldr r3, .L08096AF8  @ 0x00009E40
	movs r1, #1
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x3c
	movs r2, #0x10
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	b .L08096B86
	.align 2, 0
.L08096AF4: .4byte gUnknown_08A1B194
.L08096AF8: .4byte 0x00009E40
.L08096AFC:
	ldr r0, .L08096B28  @ gUnknown_08A1B194
	ldr r3, .L08096B2C  @ 0x00009E40
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x3c
	movs r2, #0x10
	bl StartSpriteAnimProc
	str r0, [r5, #0x38]
	ldr r0, .L08096B30  @ gPlaySt
	movs r4, #0xe
	ldrsb r4, [r0, r4]
	adds r0, r4, #0
	subs r0, #0x24
	cmp r0, #9
	bhi .L08096B34
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #2
	b .L08096B74
	.align 2, 0
.L08096B28: .4byte gUnknown_08A1B194
.L08096B2C: .4byte 0x00009E40
.L08096B30: .4byte gPlaySt
.L08096B34:
	adds r0, r4, #0
	subs r0, #0x2e
	cmp r0, #9
	bhi .L08096B44
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #3
	b .L08096B74
.L08096B44:
	adds r0, r4, #0
	bl func_080C0960
	cmp r0, #0
	beq .L08096B56
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #4
	b .L08096B74
.L08096B56:
	adds r0, r4, #0
	subs r0, #0x15
	cmp r0, #1
	bls .L08096B66
	cmp r4, #0x22
	beq .L08096B66
	cmp r4, #0x23
	bne .L08096B6E
.L08096B66:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0
	b .L08096B74
.L08096B6E:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #1
.L08096B74:
	strb r0, [r1]
	adds r0, r4, #0
	bl GetChapterInfo
	adds r0, #0x80
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
.L08096B86:
	adds r1, r5, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	movs r1, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08096ABC

	THUMB_FUNC_START func_08096BA4
func_08096BA4: @ 0x08096BA4
	push {r4, lr}
	adds r4, r0, #0
	bl func_08096958
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08096BA4

	THUMB_FUNC_START func_08096BB8
func_08096BB8: @ 0x08096BB8
	push {lr}
	ldr r0, [r0, #0x38]
	bl EndSpriteAnimProc
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08096BB8

	THUMB_FUNC_START func_08096BC4
func_08096BC4: @ 0x08096BC4
	push {lr}
	ldr r0, .L08096BDC  @ gUnknown_08A186B4
	bl FindProc
	cmp r0, #0
	beq .L08096BD8
	adds r1, r0, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
.L08096BD8:
	pop {r0}
	bx r0
	.align 2, 0
.L08096BDC: .4byte gUnknown_08A186B4

	THUMB_FUNC_END func_08096BC4

	THUMB_FUNC_START func_08096BE0
func_08096BE0: @ 0x08096BE0
	push {lr}
	ldr r0, .L08096BF8  @ gUnknown_08A186B4
	bl FindProc
	cmp r0, #0
	beq .L08096BF4
	adds r1, r0, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
.L08096BF4:
	pop {r0}
	bx r0
	.align 2, 0
.L08096BF8: .4byte gUnknown_08A186B4

	THUMB_FUNC_END func_08096BE0

	THUMB_FUNC_START func_08096BFC
func_08096BFC: @ 0x08096BFC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08096C1C  @ gUnknown_08A186B4
	adds r0, r4, #0
	bl FindProc
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08096C1C: .4byte gUnknown_08A186B4

	THUMB_FUNC_END func_08096BFC

	THUMB_FUNC_START func_08096C20
func_08096C20: @ 0x08096C20
	push {lr}
	ldr r0, .L08096C30  @ gUnknown_08A186B4
	bl FindProc
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L08096C30: .4byte gUnknown_08A186B4

	THUMB_FUNC_END func_08096C20

	THUMB_FUNC_START func_08096C34
func_08096C34: @ 0x08096C34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r3, r2, #0
	subs r3, #0x38
	cmp r3, #0
	bge .L08096C4A
	movs r7, #0
	adds r6, r2, #0
	b .L08096C60
.L08096C4A:
	adds r0, r2, #0
	adds r0, #0x38
	cmp r0, #0xf0
	ble .L08096C5A
	movs r7, #0xf
	adds r6, r2, #0
	subs r6, #0x78
	b .L08096C60
.L08096C5A:
	asrs r7, r3, #3
	lsls r0, r7, #3
	subs r6, r2, r0
.L08096C60:
	adds r3, r1, #0
	subs r3, #0x28
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, #0xa0
	ble .L08096C72
	movs r5, #8
	subs r1, #0x40
	b .L08096C82
.L08096C72:
	adds r0, r3, #0
	cmp r0, #0
	bge .L08096C7C
	adds r0, r1, #0
	subs r0, #0x21
.L08096C7C:
	asrs r5, r0, #3
	lsls r0, r5, #3
	subs r1, r1, r0
.L08096C82:
	mov r8, r1
	ldr r4, .L08096CC8  @ gBg0Tm+0x8
	adds r0, r4, #0
	movs r1, #2
	adds r2, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	adds r2, r5, #0
	bl PutNumberOrBlank
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	adds r2, r6, #0
	bl PutNumberOrBlank
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	mov r2, r8
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08096CC8: .4byte gBg0Tm+0x8

	THUMB_FUNC_END func_08096C34

	THUMB_FUNC_START PrepScreenMenu_OnInit
PrepScreenMenu_OnInit: @ 0x08096CCC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	movs r1, #7
	adds r0, #0x54
.L08096CD6:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge .L08096CD6
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x2a
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, r5, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	str r4, [r5, #0x58]
	str r4, [r5, #0x5c]
	str r4, [r5, #0x60]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnInit

	THUMB_FUNC_START PrepScreenMenu_OnActiveLoop
PrepScreenMenu_OnActiveLoop: @ 0x08096D10
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	mov r9, r0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	mov r8, r0
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #3
	mov r2, r9
	lsls r1, r2, #4
	adds r7, r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	adds r1, r7, #0
	movs r2, #6
	bl func_080AD51C
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r5, [r0]
	adds r6, r4, #0
	adds r6, #0x29
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq .L08096D84
	ldr r2, .L08096D80  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08096D74
	b .L08096E8C
.L08096D74:
	bl MoveableHelpBox_OnEnd
	movs r0, #0
	strb r0, [r6]
	b .L08096F34
	.align 2, 0
.L08096D80: .4byte gKeySt
.L08096D84:
	ldr r1, .L08096DAC  @ gKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	beq .L08096DB0
	ldr r2, [r5, #0x30]
	cmp r2, #0
	bne .L08096D9E
	b .L08096F34
.L08096D9E:
	mov r0, r8
	adds r1, r7, #0
	bl ShowTextHelpBox
	movs r0, #1
	strb r0, [r6]
	b .L08096F34
	.align 2, 0
.L08096DAC: .4byte gKeySt
.L08096DB0:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq .L08096DF8
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne .L08096E74
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq .L08096E74
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x14]
	ldr r1, [r5, #0x2c]
	bl _call_via_r1
	ldr r0, .L08096DF4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L08096DEC
	b .L08096F34
.L08096DEC:
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L08096F34
	.align 2, 0
.L08096DF4: .4byte gPlaySt
.L08096DF8:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq .L08096E38
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne .L08096E08
	b .L08096F34
.L08096E08:
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08096E74
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, .L08096E34  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L08096E2A
	b .L08096F34
.L08096E2A:
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L08096F34
	.align 2, 0
.L08096E34: .4byte gPlaySt
.L08096E38:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq .L08096E8C
	ldr r1, [r4, #0x5c]
	cmp r1, #0
	beq .L08096F34
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08096E74
	ldr r0, .L08096E70  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08096E64
	movs r0, #0x6a
	bl m4aSongNumStart
.L08096E64:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b .L08096F34
	.align 2, 0
.L08096E70: .4byte gPlaySt
.L08096E74:
	ldr r0, .L08096E88  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08096F34
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L08096F34
	.align 2, 0
.L08096E88: .4byte gPlaySt
.L08096E8C:
	ldr r3, [r2]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x2a
	cmp r0, #0
	beq .L08096EB8
	ldrb r0, [r5]
	cmp r0, #0
	bne .L08096EB4
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq .L08096EB8
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
.L08096EB4:
	subs r0, #1
	strb r0, [r5]
.L08096EB8:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L08096EE6
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge .L08096ED8
	adds r0, r1, #1
	b .L08096EE4
.L08096ED8:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L08096EE6
	movs r0, #0
.L08096EE4:
	strb r0, [r5]
.L08096EE6:
	ldrb r0, [r5]
	cmp r9, r0
	beq .L08096F34
	ldr r0, .L08096F40  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08096EFE
	movs r0, #0x66
	bl m4aSongNumStart
.L08096EFE:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08096F34
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r3, [r5]
	lsls r2, r3, #4
	adds r1, r1, r2
	lsls r3, r3, #2
	adds r2, r4, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r2, [r5, #0x30]
	bl ShowTextHelpBox
.L08096F34:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08096F40: .4byte gPlaySt

	THUMB_FUNC_END PrepScreenMenu_OnActiveLoop

	THUMB_FUNC_START PrepScreenMenu_OnLoop_2
PrepScreenMenu_OnLoop_2: @ 0x08096F44
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	bl DisplayFrozenUiHand
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnLoop_2

	THUMB_FUNC_START PrepScreenMenu_OnLoop_0
PrepScreenMenu_OnLoop_0: @ 0x08096F6C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #6
	bl func_080AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnLoop_0

	THUMB_FUNC_START PrepScreenMenu_OnEnd
PrepScreenMenu_OnEnd: @ 0x08096F98
	push {lr}
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq .L08096FA6
	ldr r0, [r0, #0x14]
	bl _call_via_r1
.L08096FA6:
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnEnd

	THUMB_FUNC_START StartPrepScreenMenu
StartPrepScreenMenu: @ 0x08096FAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08096FCC  @ gUnknown_08A186EC
	adds r0, r4, #0
	bl FindProc
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08096FCC: .4byte gUnknown_08A186EC

	THUMB_FUNC_END StartPrepScreenMenu

	THUMB_FUNC_START SetPrepScreenMenuOnBPress
SetPrepScreenMenuOnBPress: @ 0x08096FD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08096FE8  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	beq .L08096FE0
	str r4, [r0, #0x58]
.L08096FE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08096FE8: .4byte gUnknown_08A186EC

	THUMB_FUNC_END SetPrepScreenMenuOnBPress

	THUMB_FUNC_START SetPrepScreenMenuOnStartPress
SetPrepScreenMenuOnStartPress: @ 0x08096FEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08097004  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	beq .L08096FFC
	str r4, [r0, #0x5c]
.L08096FFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08097004: .4byte gUnknown_08A186EC

	THUMB_FUNC_END SetPrepScreenMenuOnStartPress

	THUMB_FUNC_START SetPrepScreenMenuOnEnd
SetPrepScreenMenuOnEnd: @ 0x08097008
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08097020  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	beq .L08097018
	str r4, [r0, #0x60]
.L08097018:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08097020: .4byte gUnknown_08A186EC

	THUMB_FUNC_END SetPrepScreenMenuOnEnd

	THUMB_FUNC_START SetPrepScreenMenuItem
SetPrepScreenMenuItem: @ 0x08097024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r0, .L08097074  @ gUnknown_08A186EC
	bl FindProc
	adds r1, r0, #0
	cmp r1, #0
	beq .L080970B8
	movs r4, #0
	movs r0, #0x38
	adds r0, r0, r1
	mov sl, r0
	mov r3, sl
.L0809704C:
	ldr r2, [r3]
	cmp r2, #0
	beq .L08097078
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r6
	bne .L08097078
	str r7, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x38
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r3]
	mov r2, r9
	str r2, [r0, #0x34]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x30]
	b .L080970B8
	.align 2, 0
.L08097074: .4byte gUnknown_08A186EC
.L08097078:
	adds r3, #4
	adds r4, #1
	cmp r4, #7
	ble .L0809704C
	adds r5, r1, #0
	adds r5, #0x2b
	ldrb r4, [r5]
	ldr r0, .L080970C8  @ gUnknown_08A186DC
	bl SpawnProc
	lsls r1, r4, #2
	add r1, sl
	str r0, [r1]
	adds r0, #0x39
	strb r6, [r0]
	ldr r0, [r1]
	str r7, [r0, #0x2c]
	adds r0, #0x38
	mov r2, r8
	strb r2, [r0]
	ldr r0, [r1]
	mov r1, r9
	str r1, [r0, #0x34]
	ldr r2, [sp, #0x20]
	str r2, [r0, #0x30]
	adds r0, #0x3c
	movs r1, #7
	bl InitText
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
.L080970B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080970C8: .4byte gUnknown_08A186DC

	THUMB_FUNC_END SetPrepScreenMenuItem

	THUMB_FUNC_START SetPrepScreenMenuSelectedItem
SetPrepScreenMenuSelectedItem: @ 0x080970CC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, .L080970F8  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	beq .L08097106
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0x2a
	adds r1, r0, #0
	adds r1, #0x38
.L080970E6:
	ldr r0, [r1]
	cmp r0, #0
	beq .L080970FE
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r5
	bne .L080970FC
	strb r4, [r3]
	b .L08097106
	.align 2, 0
.L080970F8: .4byte gUnknown_08A186EC
.L080970FC:
	adds r4, #1
.L080970FE:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble .L080970E6
.L08097106:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetPrepScreenMenuSelectedItem

	THUMB_FUNC_START GetActivePrepScreenMenuItemId
GetActivePrepScreenMenuItemId: @ 0x0809710C
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, .L0809713C  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	beq .L0809714A
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r0
	mov ip, r1
	adds r2, r0, #0
	adds r2, #0x38
.L08097126:
	ldr r1, [r2]
	cmp r1, #0
	beq .L08097142
	mov r5, ip
	ldrb r0, [r5]
	cmp r0, r4
	bne .L08097140
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	b .L0809714C
	.align 2, 0
.L0809713C: .4byte gUnknown_08A186EC
.L08097140:
	adds r4, #1
.L08097142:
	adds r2, #4
	adds r3, #1
	cmp r3, #7
	ble .L08097126
.L0809714A:
	movs r0, #0
.L0809714C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetActivePrepScreenMenuItemId

	THUMB_FUNC_START DrawPrepScreenMenuFrameAt
DrawPrepScreenMenuFrameAt: @ 0x08097154
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, .L080971F8  @ gUnknown_08A186EC
	bl FindProc
	mov r8, r0
	cmp r0, #0
	beq .L080971EA
	movs r0, #0
	mov r1, r8
	strh r6, [r1, #0x34]
	strh r5, [r1, #0x36]
	mov r4, r8
	adds r4, #0x2b
	ldrb r3, [r4]
	lsls r3, r3, #1
	adds r3, #2
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl DrawUiFrame2
	ldrb r0, [r4]
	mov r9, r4
	cmp r0, #1
	bls .L080971E4
	movs r7, #0
	ldrb r0, [r4]
	cmp r7, r0
	bge .L080971E4
	adds r0, r5, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r6
.L080971A4:
	lsls r1, r7, #2
	mov r0, r8
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl ClearText
	ldr r0, [r4, #0x34]
	bl GetMsg
	lsls r1, r6, #1
	ldr r2, .L080971FC  @ gBg0Tm
	adds r1, r1, r2
	adds r4, #0x38
	ldrb r3, [r4]
	movs r2, #1
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	adds r6, #0x40
	adds r7, #1
	mov r1, r9
	ldrb r1, [r1]
	cmp r7, r1
	blt .L080971A4
.L080971E4:
	movs r0, #3
	bl EnableBgSync
.L080971EA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080971F8: .4byte gUnknown_08A186EC
.L080971FC: .4byte gBg0Tm

	THUMB_FUNC_END DrawPrepScreenMenuFrameAt

	THUMB_FUNC_START SetPrepScreenMenuPosition
SetPrepScreenMenuPosition: @ 0x08097200
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L0809728C  @ gUnknown_08A186EC
	bl FindProc
	mov r8, r0
	cmp r0, #0
	beq .L0809727E
	strh r5, [r0, #0x34]
	strh r4, [r0, #0x36]
	adds r0, #0x2b
	ldrb r1, [r0]
	mov r9, r0
	cmp r1, #1
	bls .L08097278
	movs r7, #0
	ldrb r0, [r0]
	cmp r7, r0
	bge .L08097278
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r5
.L08097238:
	lsls r1, r7, #2
	mov r0, r8
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl ClearText
	ldr r0, [r4, #0x34]
	bl GetMsg
	lsls r1, r6, #1
	ldr r2, .L08097290  @ gBg0Tm
	adds r1, r1, r2
	adds r4, #0x38
	ldrb r3, [r4]
	movs r2, #1
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	adds r6, #0x40
	adds r7, #1
	mov r1, r9
	ldrb r1, [r1]
	cmp r7, r1
	blt .L08097238
.L08097278:
	movs r0, #1
	bl EnableBgSync
.L0809727E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809728C: .4byte gUnknown_08A186EC
.L08097290: .4byte gBg0Tm

	THUMB_FUNC_END SetPrepScreenMenuPosition

	THUMB_FUNC_START func_08097294
func_08097294: @ 0x08097294
	push {lr}
	ldr r0, .L080972A4  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	bne .L080972A8
	movs r0, #0
	b .L080972AC
	.align 2, 0
.L080972A4: .4byte gUnknown_08A186EC
.L080972A8:
	adds r0, #0x2b
	ldrb r0, [r0]
.L080972AC:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097294

	THUMB_FUNC_START EndPrepScreenMenu
EndPrepScreenMenu: @ 0x080972B0
	push {r4, lr}
	ldr r0, .L080972D0  @ gUnknown_08A186EC
	bl FindProc
	adds r4, r0, #0
	cmp r4, #0
	beq .L080972CA
	bl ClearPrepScreenMenu
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
.L080972CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080972D0: .4byte gUnknown_08A186EC

	THUMB_FUNC_END EndPrepScreenMenu

	THUMB_FUNC_START ClearPrepScreenMenu
ClearPrepScreenMenu: @ 0x080972D4
	push {r4, r5, lr}
	ldr r0, .L08097334  @ gUnknown_08A186EC
	bl FindProc
	adds r4, r0, #0
	cmp r4, #0
	beq .L0809732C
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08097338  @ gBg0Tm
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L0809733C  @ gBg1Tm
	adds r0, r0, r1
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
.L0809732C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08097334: .4byte gUnknown_08A186EC
.L08097338: .4byte gBg0Tm
.L0809733C: .4byte gBg1Tm

	THUMB_FUNC_END ClearPrepScreenMenu

	THUMB_FUNC_START PrepScreenMenuExists
PrepScreenMenuExists: @ 0x08097340
	push {lr}
	ldr r0, .L08097350  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	bne .L08097354
	movs r0, #0
	b .L08097356
	.align 2, 0
.L08097350: .4byte gUnknown_08A186EC
.L08097354:
	movs r0, #1
.L08097356:
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenMenuExists

	THUMB_FUNC_START DisablePrepScreenMenu
DisablePrepScreenMenu: @ 0x0809735C
	push {lr}
	ldr r0, .L08097374  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	beq .L0809736E
	movs r1, #2
	bl Proc_Goto
.L0809736E:
	pop {r0}
	bx r0
	.align 2, 0
.L08097374: .4byte gUnknown_08A186EC

	THUMB_FUNC_END DisablePrepScreenMenu

	THUMB_FUNC_START func_08097378
func_08097378: @ 0x08097378
	push {lr}
	ldr r0, .L08097390  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	beq .L0809738A
	movs r1, #0
	bl Proc_Goto
.L0809738A:
	pop {r0}
	bx r0
	.align 2, 0
.L08097390: .4byte gUnknown_08A186EC

	THUMB_FUNC_END func_08097378

	THUMB_FUNC_START EnablePrepScreenMenu
EnablePrepScreenMenu: @ 0x08097394
	push {lr}
	ldr r0, .L080973AC  @ gUnknown_08A186EC
	bl FindProc
	cmp r0, #0
	beq .L080973A6
	movs r1, #1
	bl Proc_Goto
.L080973A6:
	pop {r0}
	bx r0
	.align 2, 0
.L080973AC: .4byte gUnknown_08A186EC

	THUMB_FUNC_END EnablePrepScreenMenu

	THUMB_FUNC_START func_080973B0
func_080973B0: @ 0x080973B0
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	strh r1, [r3, #0x2a]
	adds r0, #0x2c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r1, [r3, #0x2e]
	strh r1, [r3, #0x32]
	adds r0, #7
	strb r2, [r0]
	ldrh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	movs r0, #0xe4
	lsls r0, r0, #2
	strh r0, [r3, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x38]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr

	THUMB_FUNC_END func_080973B0

	THUMB_FUNC_START func_080973E4
func_080973E4: @ 0x080973E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	ldrh r1, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	adds r1, r1, r0
	mov r9, r1
	adds r1, r4, #0
	adds r1, #0x34
	ldrh r0, [r4, #0x32]
	ldrb r1, [r1]
	cmp r0, r1
	bhi .L08097408
	b .L0809762A
.L08097408:
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	mov sl, r0
	adds r0, #0xd
	str r0, [sp, #0x14]
	adds r1, r4, #0
	adds r1, #0x3b
	str r1, [sp, #0x18]
	mov r2, sl
	ldrb r2, [r2]
	cmp r6, r2
	bge .L08097448
	movs r5, #1
.L08097424:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r2, r2, r5
	mov r3, r9
	str r3, [sp]
	movs r0, #4
	ldr r3, .L08097534  @ gUnknown_08A18744
	bl PutSpriteExt
	adds r5, #8
	adds r6, #1
	mov r0, sl
	ldrb r0, [r0]
	cmp r6, r0
	blt .L08097424
.L08097448:
	cmp r6, #0
	bne .L0809744E
	b .L080975D8
.L0809744E:
	mov r1, sl
	ldrb r0, [r1]
	lsls r7, r0, #0x13
	ldrh r2, [r4, #0x2e]
	str r2, [sp, #0xc]
	ldrh r5, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r6, [r0]
	str r0, [sp, #0x10]
	movs r3, #0x2c
	adds r3, r3, r4
	mov r8, r3
	cmp r5, r6
	bhi .L0809746E
	b .L080975A6
.L0809746E:
	adds r0, r7, #0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #4]
	adds r0, r7, #0
	muls r0, r6, r0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #8]
	ldr r5, [sp, #0xc]
	cmp r5, #0
	beq .L080974AE
	ldrh r1, [r4, #0x2a]
	ldr r6, .L08097538  @ 0x00002001
	adds r1, r1, r6
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #8
	ldr r3, .L0809753C  @ gUnknown_08A187F0
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
.L080974AE:
	movs r6, #0
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x13
	cmp r6, r5
	bcs .L080974E6
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r0, r0, #0x14
	adds r7, r0, #1
.L080974C4:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r3, r8
	ldrb r2, [r3]
	adds r2, r2, r7
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, .L08097540  @ gUnknown_08A1879C
	ldr r3, [r0, #0x20]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r6, #1
	cmp r6, r5
	bcc .L080974C4
.L080974E6:
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #4
	ldr r1, [sp, #0x10]
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrh r2, [r4, #0x32]
	cmp r0, r2
	bne .L08097544
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r5, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r1, r5, #0
	muls r1, r2, r1
	lsrs r2, r1, #0x14
	lsls r3, r6, #3
	adds r1, r2, r3
	subs r0, r0, r1
	cmp r0, #0
	beq .L080975A6
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	adds r2, #1
	mov r5, r8
	ldrb r5, [r5]
	adds r2, r2, r5
	adds r2, r2, r3
	ldr r3, .L08097540  @ gUnknown_08A1879C
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
	b .L080975A6
	.align 2, 0
.L08097534: .4byte gUnknown_08A18744
.L08097538: .4byte 0x00002001
.L0809753C: .4byte gUnknown_08A187F0
.L08097540: .4byte gUnknown_08A1879C
.L08097544:
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x10
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	beq .L0809757C
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	ldr r3, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r0, r2
	lsrs r2, r2, #0x14
	adds r2, #1
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r2, r3
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r3, .L0809763C  @ gUnknown_08A1879C
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r5, r9
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
.L0809757C:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, sl
	ldrb r2, [r6]
	lsls r2, r2, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r2, #2
	ldr r3, .L08097640  @ gUnknown_08A187F0
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
.L080975A6:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #7
	ldr r3, .L08097644  @ gUnknown_08A1874C
	mov r5, r9
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, r8
	ldrb r2, [r6]
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, #1
	adds r2, r2, r0
	ldr r3, .L08097648  @ gUnknown_08A18754
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
.L080975D8:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq .L08097600
	cmp r1, r0
	bls .L080975EC
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	adds r0, #3
	strb r0, [r5]
.L080975EC:
	ldrh r0, [r4, #0x30]
	ldrh r6, [r4, #0x2e]
	cmp r0, r6
	bcs .L080975FC
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
.L080975FC:
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
.L08097600:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	adds r0, #1
	movs r2, #0
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3]
	lsrs r0, r0, #3
	cmp r0, #5
	bls .L0809761E
	strb r2, [r3]
.L0809761E:
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	cmp r0, #5
	bls .L0809762A
	strb r2, [r5]
.L0809762A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809763C: .4byte gUnknown_08A1879C
.L08097640: .4byte gUnknown_08A187F0
.L08097644: .4byte gUnknown_08A1874C
.L08097648: .4byte gUnknown_08A18754

	THUMB_FUNC_END func_080973E4

	THUMB_FUNC_START func_0809764C
func_0809764C: @ 0x0809764C
	push {lr}
	ldr r0, .L08097664  @ gUnknown_08A18808
	bl FindProc
	cmp r0, #0
	beq .L0809765E
	movs r1, #1
	bl Proc_Goto
.L0809765E:
	pop {r0}
	bx r0
	.align 2, 0
.L08097664: .4byte gUnknown_08A18808

	THUMB_FUNC_END func_0809764C

	THUMB_FUNC_START func_08097668
func_08097668: @ 0x08097668
	push {lr}
	ldr r0, .L08097680  @ gUnknown_08A18808
	bl FindProc
	cmp r0, #0
	beq .L0809767A
	movs r1, #0
	bl Proc_Goto
.L0809767A:
	pop {r0}
	bx r0
	.align 2, 0
.L08097680: .4byte gUnknown_08A18808

	THUMB_FUNC_END func_08097668

	THUMB_FUNC_START Delete6CMenuScroll
Delete6CMenuScroll: @ 0x08097684
	push {lr}
	ldr r0, .L08097694  @ gUnknown_08A18808
	bl FindProc
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L08097694: .4byte gUnknown_08A18808

	THUMB_FUNC_END Delete6CMenuScroll

	THUMB_FUNC_START Make6CMenuScroll
Make6CMenuScroll: @ 0x08097698
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080976A8  @ gUnknown_08A18808
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L080976A8: .4byte gUnknown_08A18808

	THUMB_FUNC_END Make6CMenuScroll

	THUMB_FUNC_START func_080976AC
func_080976AC: @ 0x080976AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080976C8  @ gUnknown_08A18808
	bl FindProc
	cmp r0, #0
	beq .L080976C2
	strh r4, [r0, #0x2a]
	adds r0, #0x2c
	strb r5, [r0]
.L080976C2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080976C8: .4byte gUnknown_08A18808

	THUMB_FUNC_END func_080976AC

	THUMB_FUNC_START func_080976CC
func_080976CC: @ 0x080976CC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, .L080976FC  @ gUnknown_08A18808
	bl FindProc
	cmp r0, #0
	beq .L080976F6
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	strh r6, [r0, #0x2e]
	strh r4, [r0, #0x32]
	adds r0, #0x34
	strb r5, [r0]
.L080976F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080976FC: .4byte gUnknown_08A18808

	THUMB_FUNC_END func_080976CC

	THUMB_FUNC_START func_08097700
func_08097700: @ 0x08097700
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08097738  @ gUnknown_08A19CAC
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0809773C  @ gUnknown_08A19C0C
	ldr r2, .L08097740  @ 0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, .L08097744  @ gUnknown_08A18808
	bl FindProc
	adds r2, r0, #0
	cmp r2, #0
	beq .L08097730
	asrs r0, r4, #5
	strh r0, [r2, #0x36]
	lsls r0, r5, #0xc
	strh r0, [r2, #0x38]
.L08097730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08097738: .4byte gUnknown_08A19CAC
.L0809773C: .4byte gUnknown_08A19C0C
.L08097740: .4byte 0x06010000
.L08097744: .4byte gUnknown_08A18808

	THUMB_FUNC_END func_08097700

	THUMB_FUNC_START func_08097748
func_08097748: @ 0x08097748
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov r8, r1
	mov r9, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r0, .L0809779C  @ gUnknown_08A18808
	adds r1, r4, #0
	bl SpawnProc
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	mov r1, r9
	strb r1, [r0]
	ldr r0, .L080977A0  @ gUnknown_08A19CAC
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080977A4  @ gUnknown_08A19C0C
	ldr r2, .L080977A8  @ 0x06010000
	adds r1, r5, r2
	bl Decompress
	asrs r5, r5, #5
	strh r5, [r4, #0x36]
	lsls r6, r6, #0xc
	strh r6, [r4, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0809779C: .4byte gUnknown_08A18808
.L080977A0: .4byte gUnknown_08A19CAC
.L080977A4: .4byte gUnknown_08A19C0C
.L080977A8: .4byte 0x06010000

	THUMB_FUNC_END func_08097748

	THUMB_FUNC_START func_080977AC
func_080977AC: @ 0x080977AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r7, #0
	bl Text_DrawString
	adds r0, r4, #0
	mov r1, r8
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080977AC

	THUMB_FUNC_START func_080977EC
func_080977EC: @ 0x080977EC
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r5, .L08097800  @ gUnknown_02012F56
	ldrh r4, [r5]
	adds r2, r4, #0
	cmp r2, #0
	bne .L08097804
	strb r2, [r3]
	strh r2, [r1]
	b .L08097838
	.align 2, 0
.L08097800: .4byte gUnknown_02012F56
.L08097804:
	cmp r2, #7
	bhi .L08097816
	ldrb r0, [r3]
	cmp r0, r2
	bcc .L08097812
	subs r0, r4, #1
	strb r0, [r3]
.L08097812:
	movs r0, #0
	b .L08097836
.L08097816:
	ldrh r0, [r1]
	lsrs r0, r0, #4
	adds r2, r0, #7
	ldrh r0, [r5]
	cmp r2, r0
	bge .L0809782E
	ldrb r0, [r3]
	cmp r0, #6
	bne .L08097838
	movs r0, #5
	strb r0, [r3]
	b .L08097838
.L0809782E:
	cmp r2, r0
	ble .L08097838
	subs r0, #7
	lsls r0, r0, #4
.L08097836:
	strh r0, [r1]
.L08097838:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080977EC

	THUMB_FUNC_START func_08097840
func_08097840: @ 0x08097840
	push {lr}
	ldr r0, .L0809785C  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xa0
	bne .L08097864
	movs r3, #0
	ldr r0, .L08097860  @ gUnknown_02013458
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b .L0809786C
	.align 2, 0
.L0809785C: .4byte 0x04000006
.L08097860: .4byte gUnknown_02013458
.L08097864:
	ldr r0, .L08097884  @ gUnknown_02013458
	cmp r3, #0xa0
	bls .L0809786C
	movs r3, #0
.L0809786C:
	ldr r2, .L08097888  @ 0x04000042
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #8
	ldrb r0, [r0, #1]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
.L08097884: .4byte gUnknown_02013458
.L08097888: .4byte 0x04000042

	THUMB_FUNC_END func_08097840

	THUMB_FUNC_START func_0809788C
func_0809788C: @ 0x0809788C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r2, .L08097908  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r2
	cmp r0, #0
	bge .L08097918
	movs r0, #0x96
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, .L0809790C  @ gUnknown_02012F58
	mov r9, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, .L08097910  @ gUnknown_02013458
	mov sl, r1
	mov r7, r9
	movs r4, #0
	movs r2, #0xf0
	movs r6, #0xa0
	lsls r6, r6, #2
	ldr r5, .L08097914  @ 0x00000281
.L080978DA:
	lsls r0, r3, #2
	adds r0, r0, r7
	strb r4, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r6
	strb r4, [r1]
	adds r0, r0, r5
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls .L080978DA
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	b .L08097960
	.align 2, 0
.L08097908: .4byte gDispIo
.L0809790C: .4byte gUnknown_02012F58
.L08097910: .4byte gUnknown_02013458
.L08097914: .4byte 0x00000281
.L08097918:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, .L080979CC  @ gUnknown_02012F58
	mov r9, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, .L080979D0  @ gUnknown_02013458
	mov sl, r1
	mov r6, r9
	movs r2, #0x78
	movs r5, #0xa0
	lsls r5, r5, #2
	ldr r4, .L080979D4  @ 0x00000281
.L08097934:
	lsls r0, r3, #2
	adds r0, r0, r6
	strb r2, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r5
	strb r2, [r1]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls .L08097934
	mov r2, ip
	adds r2, #0x2f
	movs r1, #0
	movs r0, #0x78
	strb r0, [r2]
	adds r2, #4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x2e
.L08097960:
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
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
	strb r0, [r2]
	adds r2, #1
	ldrb r1, [r2]
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
	strb r0, [r2]
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, r9
	mov r1, sl
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #2
	add r0, r9
	str r0, [r1, #4]
	ldr r0, .L080979D8  @ func_08097840
	bl SetOnHBlankA
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080979CC: .4byte gUnknown_02012F58
.L080979D0: .4byte gUnknown_02013458
.L080979D4: .4byte 0x00000281
.L080979D8: .4byte func_08097840

	THUMB_FUNC_END func_0809788C

	THUMB_FUNC_START func_080979DC
func_080979DC: @ 0x080979DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r6, #0x2c]
	adds r0, r0, r1
	str r0, [r6, #0x2c]
	cmp r0, #0x96
	ble .L080979FA
	movs r0, #0x96
	str r0, [r6, #0x2c]
.L080979FA:
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bge .L08097A04
	movs r0, #0
	str r0, [r6, #0x2c]
.L08097A04:
	movs r1, #0
	movs r0, #0x29
	adds r0, r0, r6
	mov r9, r0
	ldr r7, .L08097A44  @ gUnknown_02013458
	movs r2, #0x78
	mov r8, r2
.L08097A12:
	ldr r0, [r6, #0x2c]
	lsls r5, r1, #0x10
	cmp r0, #0
	ble .L08097A32
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	asrs r4, r5, #0x10
	adds r1, r4, #0
	subs r1, #0x50
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	cmp r0, #0
	bge .L08097A48
.L08097A32:
	ldr r0, [r7, #4]
	asrs r1, r5, #0xe
	adds r0, r1, r0
	mov r4, r8
	strb r4, [r0]
	ldr r0, [r7, #4]
	adds r1, r1, r0
	strb r4, [r1, #1]
	b .L08097A6E
	.align 2, 0
.L08097A44: .4byte gUnknown_02013458
.L08097A48:
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble .L08097A58
	movs r3, #0x78
.L08097A58:
	ldr r1, [r7, #4]
	lsls r2, r4, #2
	adds r1, r2, r1
	mov r4, r8
	subs r0, r4, r3
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r0, #0x78
	strb r0, [r2, #1]
.L08097A6E:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble .L08097A12
	mov r2, r9
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne .L08097A92
	adds r0, r6, #0
	bl Proc_Break
.L08097A92:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080979DC

	THUMB_FUNC_START func_08097AA0
func_08097AA0: @ 0x08097AA0
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08097AA0

	THUMB_FUNC_START func_08097AAC
func_08097AAC: @ 0x08097AAC
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08097AC8  @ gUnknown_08A18840
	adds r1, r2, #0
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08097AC8: .4byte gUnknown_08A18840

	THUMB_FUNC_END func_08097AAC

	THUMB_FUNC_START func_08097ACC
func_08097ACC: @ 0x08097ACC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r1, r0, #0
	adds r1, #0x29
	movs r7, #0
	strb r7, [r1]
	ldr r1, .L08097B6C  @ gDispIo
	mov ip, r1
	ldrb r1, [r1, #1]
	movs r2, #1
	mov r8, r2
	mov r6, r8
	orrs r1, r6
	movs r2, #2
	mov r9, r2
	mov r6, r9
	orrs r1, r6
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x21
	negs r2, r2
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r2, ip
	strb r1, [r2, #1]
	adds r2, #0x35
	ldrb r1, [r2]
	mov r6, r8
	orrs r1, r6
	mov r6, r9
	orrs r1, r6
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	mov r3, ip
	adds r3, #0x36
	ldrb r2, [r3]
	movs r1, #2
	negs r1, r1
	ands r1, r2
	movs r2, #3
	negs r2, r2
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L08097B70
	mov r0, ip
	adds r0, #0x2f
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	b .L08097B8A
	.align 2, 0
.L08097B6C: .4byte gDispIo
.L08097B70:
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x33
	movs r1, #0x50
	strb r1, [r2]
	subs r2, #5
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r1, [r0]
.L08097B8A:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08097ACC

	THUMB_FUNC_START func_08097B98
func_08097B98: @ 0x08097B98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, .L08097C18  @ gDispIo
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r2]
	movs r1, #0xf
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #7
	muls r0, r1, r0
	movs r1, #0xe1
	bl __divsi3
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r5, r1, #4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L08097C1C
	lsls r1, r5, #1
	adds r2, r1, r5
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r1, [r0]
	movs r3, #0x10
	negs r3, r3
	adds r0, r3, #0
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x2e
	strb r0, [r2]
	movs r2, #0x60
	negs r2, r2
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x32
	strb r0, [r1]
	b .L08097C40
	.align 2, 0
.L08097C18: .4byte gDispIo
.L08097C1C:
	lsls r2, r5, #1
	adds r1, r2, r5
	movs r0, #0x78
	subs r0, r0, r1
	adds r3, r4, #0
	adds r3, #0x2f
	strb r0, [r3]
	movs r0, #0x50
	subs r0, r0, r2
	adds r3, #4
	strb r0, [r3]
	adds r1, #0x78
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r2, #0x50
	adds r0, #4
	strb r2, [r0]
.L08097C40:
	adds r2, r4, #0
	adds r2, #0x35
	ldrb r0, [r2]
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
	strb r0, [r2]
	adds r2, #1
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r3, #3
	negs r3, r3
	mov sl, r3
	ands r0, r3
	movs r1, #5
	negs r1, r1
	mov r9, r1
	ands r0, r1
	subs r3, #6
	mov r8, r3
	ands r0, r3
	movs r7, #0x11
	negs r7, r7
	ands r0, r7
	strb r0, [r2]
	cmp r5, #0x27
	ble .L08097CB4
	adds r0, r6, #0
	bl Proc_Break
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L08097CB4
	ldrb r1, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	mov r1, sl
	ands r0, r1
	mov r2, r9
	ands r0, r2
	mov r3, r8
	ands r0, r3
	ands r0, r7
	strb r0, [r4, #1]
.L08097CB4:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08097B98

	THUMB_FUNC_START func_08097CC4
func_08097CC4: @ 0x08097CC4
	movs r0, #0
	bx lr

	THUMB_FUNC_END func_08097CC4

	THUMB_FUNC_START func_08097CC8
func_08097CC8: @ 0x08097CC8
	push {lr}
	bl GetConvoyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097CC8

	THUMB_FUNC_START func_08097CD8
func_08097CD8: @ 0x08097CD8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	ldrh r1, [r4, #0x2c]
	cmp r0, r1
	bne .L08097D04
	ldr r2, .L08097D10  @ gDispIo
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
	adds r0, r4, #0
	bl Proc_Break
.L08097D04:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08097D10: .4byte gDispIo

	THUMB_FUNC_END func_08097CD8

	THUMB_FUNC_START func_08097D14
func_08097D14: @ 0x08097D14
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, .L08097D4C  @ gUnknown_08A18888
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2a]
	ldr r2, .L08097D50  @ gDispIo
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08097D4C: .4byte gUnknown_08A18888
.L08097D50: .4byte gDispIo

	THUMB_FUNC_END func_08097D14

	THUMB_FUNC_START func_08097D54
func_08097D54: @ 0x08097D54
	push {lr}
	cmp r0, #0
	beq .L08097D64
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08097D64:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08097D54

	THUMB_FUNC_START func_08097D68
func_08097D68: @ 0x08097D68
	push {lr}
	cmp r0, #0
	beq .L08097D7C
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08097D7C
	subs r0, #1
	strb r0, [r1]
.L08097D7C:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08097D68

	THUMB_FUNC_START func_08097D80
func_08097D80: @ 0x08097D80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08097DA4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq .L08097D9C
	bl MoveableHelpBox_OnEnd
	adds r0, r4, #0
	bl Proc_Break
.L08097D9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08097DA4: .4byte gKeySt

	THUMB_FUNC_END func_08097D80

	THUMB_FUNC_START func_08097DA8
func_08097DA8: @ 0x08097DA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bge .L08097DC4
	cmp r1, #0
	bge .L08097DC4
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r1, r0, #0
.L08097DC4:
	adds r0, r4, #0
	adds r2, r5, #0
	bl ShowTextHelpBox
	ldr r0, .L08097DDC  @ gUnknown_08A188A8
	adds r1, r6, #0
	bl SpawnProcLocking
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08097DDC: .4byte gUnknown_08A188A8

	THUMB_FUNC_END func_08097DA8

	THUMB_FUNC_START func_08097DE0
func_08097DE0: @ 0x08097DE0
	push {r4, lr}
	adds r4, r1, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08097E00
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	bne .L08097E00
	movs r0, #1
	b .L08097E02
.L08097E00:
	movs r0, #0
.L08097E02:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097DE0

	THUMB_FUNC_START func_08097E08
func_08097E08: @ 0x08097E08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
.L08097E10:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl func_08097DE0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08097E2A
	adds r6, #1
.L08097E2A:
	adds r4, #1
	cmp r4, #4
	ble .L08097E10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097E08

	THUMB_FUNC_START func_08097E38
func_08097E38: @ 0x08097E38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L08097E6A
	adds r0, r4, #0
	bl CouldUnitUseAnyWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08097E6A
	adds r0, r4, #0
	bl func_08097E08
	cmp r0, #0
	beq .L08097E6A
	movs r0, #1
	b .L08097E6C
.L08097E6A:
	movs r0, #0
.L08097E6C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097E38

	THUMB_FUNC_START func_08097E74
func_08097E74: @ 0x08097E74
	push {r4, lr}
	movs r2, #0
	ldr r0, [r0]
	ldrb r3, [r0, #4]
	ldr r1, .L08097E8C  @ gUnknown_08205BFC
.L08097E7E:
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bne .L08097E90
	movs r0, #0
	b .L08097E9A
	.align 2, 0
.L08097E8C: .4byte gUnknown_08205BFC
.L08097E90:
	adds r1, #2
	adds r2, #1
	cmp r2, #0xa
	bls .L08097E7E
	movs r0, #1
.L08097E9A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097E74

	THUMB_FUNC_START func_08097EA0
func_08097EA0: @ 0x08097EA0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq .L08097F3A
	bl CheckGameLinkArenaBit
	cmp r0, #0
	beq .L08097F3A
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L08097EF6
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl func_08097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08097EF6
	adds r0, r4, #0
	bl func_08097E08
	cmp r0, #1
	bgt .L08097EF6
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl func_08097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08097F36
.L08097EF6:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L08097F3A
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl func_08097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08097F3A
	adds r0, r5, #0
	bl func_08097E08
	cmp r0, #1
	bgt .L08097F3A
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl func_08097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08097F3A
.L08097F36:
	movs r0, #0
	b .L08097F3C
.L08097F3A:
	movs r0, #1
.L08097F3C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097EA0

	THUMB_FUNC_START func_08097F44
func_08097F44: @ 0x08097F44
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckGameLinkArenaBit
	cmp r0, #0
	beq .L08097F90
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L08097F90
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl func_08097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08097F90
	adds r0, r4, #0
	bl func_08097E08
	cmp r0, #1
	bne .L08097F90
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_08097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08097F90
	movs r0, #0
	b .L08097F92
.L08097F90:
	movs r0, #1
.L08097F92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097F44

	THUMB_FUNC_START func_08097F98
func_08097F98: @ 0x08097F98
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl CheckGameLinkArenaBit
	cmp r0, #0
	beq .L08097FD4
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L08097FD4
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl func_08097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08097FD4
	adds r0, r4, #0
	bl func_08097E08
	cmp r0, #1
	bne .L08097FD4
	movs r0, #0
	b .L08097FD6
.L08097FD4:
	movs r0, #1
.L08097FD6:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08097F98

	THUMB_FUNC_START func_08097FDC
func_08097FDC: @ 0x08097FDC
	push {r4, lr}
	movs r1, #0
	ldr r4, .L08098008  @ gUnknown_0202BD31
	ldr r2, .L0809800C  @ gUnknown_02013460
	ldr r3, .L08098010  @ gUnknown_08A1D448
.L08097FE6:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0xf
	ble .L08097FE6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08098008: .4byte gUnknown_0202BD31
.L0809800C: .4byte gUnknown_02013460
.L08098010: .4byte gUnknown_08A1D448

	THUMB_FUNC_END func_08097FDC

	THUMB_FUNC_START func_08098014
func_08098014: @ 0x08098014
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, .L08098034  @ gUnknown_08A188C0
.L0809801C:
	adds r0, r6, #0
	bl GetItemKind
	ldrb r1, [r4]
	cmp r0, r1
	blt .L08098038
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt .L08098038
	adds r0, r5, #0
	b .L08098042
	.align 2, 0
.L08098034: .4byte gUnknown_08A188C0
.L08098038:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble .L0809801C
	movs r0, #8
.L08098042:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08098014

	THUMB_FUNC_START func_08098048
func_08098048: @ 0x08098048
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r0, .L08098100  @ gUnknown_02012914
	mov r8, r0
	ldr r0, .L08098104  @ gUnknown_02012F56
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, .L08098108  @ gUnknown_02012F54
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge .L080980B4
	ldr r1, .L0809810C  @ gUnknown_08A188C0
	mov r3, r9
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
.L08098078:
	ldr r1, .L08098110  @ gUnknown_020122D4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	str r2, [sp]
	bl GetItemKind
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldrb r1, [r6]
	cmp r0, r1
	bcc .L080980AA
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi .L080980AA
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
.L080980AA:
	adds r4, #1
	ldr r0, .L08098108  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blt .L08098078
.L080980B4:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge .L080980F6
	ldr r1, .L0809810C  @ gUnknown_08A188C0
	mov r2, r9
	lsls r0, r2, #2
	adds r6, r0, r1
.L080980C4:
	ldr r1, .L08098110  @ gUnknown_020122D4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemKind
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	bcc .L080980E0
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls .L080980EC
.L080980E0:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
.L080980EC:
	adds r4, #1
	ldr r0, .L08098108  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blt .L080980C4
.L080980F6:
	movs r2, #1
	ldr r5, .L08098100  @ gUnknown_02012914
	ldr r3, .L08098104  @ gUnknown_02012F56
	mov sl, r3
	b .L0809811A
	.align 2, 0
.L08098100: .4byte gUnknown_02012914
.L08098104: .4byte gUnknown_02012F56
.L08098108: .4byte gUnknown_02012F54
.L0809810C: .4byte gUnknown_08A188C0
.L08098110: .4byte gUnknown_020122D4
.L08098114:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
.L0809811A:
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt .L08098114
	cmp r2, #0
	ble .L080981BC
.L08098134:
	adds r4, r2, #0
	mov r3, sl
	ldrh r3, [r3]
	cmp r2, r3
	bge .L080981AE
	ldr r0, .L080981D8  @ gUnknown_02012F56
	mov sl, r0
.L08098142:
	subs r7, r4, r2
	adds r4, #1
	mov r9, r4
	cmp r7, #0
	blt .L080981A2
	ldr r1, .L080981DC  @ gUnknown_02012914
	mov r8, r1
.L08098150:
	lsls r0, r7, #2
	mov r3, r8
	adds r6, r0, r3
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIid
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIid
	ldr r2, [sp]
	cmp r4, r0
	bgt .L08098194
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIid
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIid
	ldr r2, [sp]
	cmp r4, r0
	bne .L080981A2
	ldrh r0, [r6, #2]
	ldrh r3, [r5, #2]
	cmp r0, r3
	bls .L0809819C
.L08098194:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
.L0809819C:
	subs r7, r7, r2
	cmp r7, #0
	bge .L08098150
.L080981A2:
	mov r4, r9
	ldr r0, .L080981D8  @ gUnknown_02012F56
	ldr r5, .L080981DC  @ gUnknown_02012914
	ldrh r0, [r0]
	cmp r4, r0
	blt .L08098142
.L080981AE:
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt .L08098134
.L080981BC:
	ldr r1, .L080981E0  @ gUnknown_020122D4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r5, #0
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080981D8: .4byte gUnknown_02012F56
.L080981DC: .4byte gUnknown_02012914
.L080981E0: .4byte gUnknown_020122D4

	THUMB_FUNC_END func_08098048

	THUMB_FUNC_START SomethingPrepListRelated
SomethingPrepListRelated: @ 0x080981E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov r9, r2
	ldr r6, .L080982AC  @ gUnknown_020122D4
	ldr r1, .L080982B0  @ gUnknown_02012F54
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq .L0809825E
	movs r5, #1
.L08098206:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r7, r5, #1
	cmp r4, #0
	beq .L08098258
	ldr r0, [r4]
	cmp r0, #0
	beq .L08098258
	ldr r0, [r4, #0xc]
	ldr r1, .L080982B4  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L08098258
	cmp r4, r8
	beq .L08098258
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r2, #0
	cmp r2, r5
	bge .L08098258
	ldr r3, .L080982B0  @ gUnknown_02012F54
	adds r1, r4, #0
	adds r1, #0x1e
.L0809823C:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	blt .L0809823C
.L08098258:
	adds r5, r7, #0
	cmp r5, #0x3f
	ble .L08098206
.L0809825E:
	movs r0, #1
	mov r1, r9
	ands r0, r1
	cmp r0, #0
	beq .L08098298
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq .L08098298
	movs r4, #0
	ldr r3, .L080982B0  @ gUnknown_02012F54
.L0809827A:
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r4, [r6]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x63
	bgt .L08098298
	ldrh r0, [r1]
	cmp r0, #0
	bne .L0809827A
.L08098298:
	mov r0, sl
	bl func_08098048
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080982AC: .4byte gUnknown_020122D4
.L080982B0: .4byte gUnknown_02012F54
.L080982B4: .4byte 0x00010004

	THUMB_FUNC_END SomethingPrepListRelated

	THUMB_FUNC_START func_080982B8
func_080982B8: @ 0x080982B8
	push {r4, r5, lr}
	bl ClearConvoyItems
	movs r4, #0
	ldr r0, .L080982F4  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	bcs .L080982EC
	ldr r5, .L080982F8  @ gUnknown_020122D4
.L080982CA:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne .L080982DE
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq .L080982DE
	bl AddItemToConvoy
.L080982DE:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, .L080982F4  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	bcc .L080982CA
.L080982EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080982F4: .4byte gUnknown_02012F54
.L080982F8: .4byte gUnknown_020122D4

	THUMB_FUNC_END func_080982B8

	THUMB_FUNC_START func_080982FC
func_080982FC: @ 0x080982FC
	push {r4, r5, lr}
	bl ClearConvoyItems
	movs r4, #0
	movs r5, #0x88
.L08098306:
	subs r0, r5, r4
	bl AddItemToConvoy
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x63
	bls .L08098306
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080982FC

	THUMB_FUNC_START func_0809831C
func_0809831C: @ 0x0809831C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	movs r1, #0
	movs r4, #1
.L08098328:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq .L08098334
	adds r2, #1
.L08098334:
	adds r1, #1
	cmp r1, #0xf
	ble .L08098328
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809831C

	THUMB_FUNC_START func_08098344
func_08098344: @ 0x08098344
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	movs r2, #0
	movs r1, #1
.L08098352:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq .L08098368
	cmp r3, r5
	bne .L08098366
	adds r0, r1, #0
	lsls r0, r2
	b .L08098370
.L08098366:
	adds r3, #1
.L08098368:
	adds r2, #1
	cmp r2, #0xf
	ble .L08098352
	movs r0, #0
.L08098370:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08098344

	THUMB_FUNC_START func_08098378
func_08098378: @ 0x08098378
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	movs r3, #1
.L08098382:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq .L08098390
	adds r0, r1, #0
	b .L08098398
.L08098390:
	adds r1, #1
	cmp r1, #0xf
	ble .L08098382
	movs r0, #0
.L08098398:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08098378

	THUMB_FUNC_START CanUnitPrepScreenUse
CanUnitPrepScreenUse: @ 0x0809839C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge .L080983CA
.L080983AC:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq .L080983C4
	movs r0, #1
	b .L080983CC
.L080983C4:
	adds r4, #1
	cmp r4, r6
	blt .L080983AC
.L080983CA:
	movs r0, #0
.L080983CC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanUnitPrepScreenUse

	THUMB_FUNC_START func_080983D4
func_080983D4: @ 0x080983D4
	push {lr}
	ldr r0, .L08098400  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls .L080983E6
	movs r2, #0
.L080983E6:
	cmp r2, #0
	bne .L080983F0
	ldr r1, .L08098404  @ 0x04000012
	movs r0, #0xf8
	strh r0, [r1]
.L080983F0:
	cmp r2, #0x48
	bne .L080983FA
	ldr r1, .L08098404  @ 0x04000012
	movs r0, #0xfc
	strh r0, [r1]
.L080983FA:
	pop {r0}
	bx r0
	.align 2, 0
.L08098400: .4byte 0x04000006
.L08098404: .4byte 0x04000012

	THUMB_FUNC_END func_080983D4

	THUMB_FUNC_START func_08098408
func_08098408: @ 0x08098408
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x34]
	str r0, [r4, #0x48]
	str r0, [r4, #0x44]
	bl func_08096484
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08098408

	THUMB_FUNC_START func_08098448
func_08098448: @ 0x08098448
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08098468  @ gUnknown_08A1B1FC
	ldr r1, .L0809846C  @ 0x06013000
	bl Decompress
	ldr r0, .L08098470  @ gUnknown_08A1B638
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08098468: .4byte gUnknown_08A1B1FC
.L0809846C: .4byte 0x06013000
.L08098470: .4byte gUnknown_08A1B638

	THUMB_FUNC_END func_08098448

	THUMB_FUNC_START func_08098474
func_08098474: @ 0x08098474
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq .L0809849C
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, .L080984A4  @ gUnknown_08A18928
	ldr r0, [r4, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xb0
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
.L0809849C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080984A4: .4byte gUnknown_08A18928

	THUMB_FUNC_END func_08098474

	THUMB_FUNC_START func_080984A8
func_080984A8: @ 0x080984A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, .L080984C8  @ gUnknown_08A18944
	bl SpawnProc
	movs r1, #0
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080984C8: .4byte gUnknown_08A18944

	THUMB_FUNC_END func_080984A8

	THUMB_FUNC_START func_080984CC
func_080984CC: @ 0x080984CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080984E8  @ gUnknown_08A18944
	bl FindProc
	movs r1, #1
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080984E8: .4byte gUnknown_08A18944

	THUMB_FUNC_END func_080984CC

	THUMB_FUNC_START func_080984EC
func_080984EC: @ 0x080984EC
	push {lr}
	ldr r0, .L080984FC  @ gUnknown_08A18944
	bl FindProc
	movs r1, #0
	str r1, [r0, #0x38]
	pop {r0}
	bx r0
	.align 2, 0
.L080984FC: .4byte gUnknown_08A18944

	THUMB_FUNC_END func_080984EC

	THUMB_FUNC_START func_08098500
func_08098500: @ 0x08098500
	push {lr}
	ldr r0, .L08098510  @ gUnknown_08A18944
	bl FindProc
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L08098510: .4byte gUnknown_08A18944

	THUMB_FUNC_END func_08098500

	THUMB_FUNC_START func_08098514
func_08098514: @ 0x08098514
	push {lr}
	ldr r0, .L08098528  @ gUiFramePaletteA
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L08098528: .4byte gUiFramePaletteA

	THUMB_FUNC_END func_08098514

	THUMB_FUNC_START func_0809852C
func_0809852C: @ 0x0809852C
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq .L0809854A
	ldr r1, [r2, #0x2c]
	ldr r2, [r2, #0x30]
	ldr r3, .L08098550  @ gUnknown_08A18964
	movs r0, #0x96
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
.L0809854A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08098550: .4byte gUnknown_08A18964

	THUMB_FUNC_END func_0809852C

	THUMB_FUNC_START func_08098554
func_08098554: @ 0x08098554
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0809856C  @ gUnknown_08A1898C
	bl SpawnProc
	movs r1, #0
	str r1, [r0, #0x34]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
.L0809856C: .4byte gUnknown_08A1898C

	THUMB_FUNC_END func_08098554

	THUMB_FUNC_START func_08098570
func_08098570: @ 0x08098570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0809858C  @ gUnknown_08A1898C
	bl FindProc
	movs r1, #1
	str r1, [r0, #0x34]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809858C: .4byte gUnknown_08A1898C

	THUMB_FUNC_END func_08098570

	THUMB_FUNC_START func_08098590
func_08098590: @ 0x08098590
	push {lr}
	ldr r0, .L080985A0  @ gUnknown_08A1898C
	bl FindProc
	movs r1, #0
	str r1, [r0, #0x34]
	pop {r0}
	bx r0
	.align 2, 0
.L080985A0: .4byte gUnknown_08A1898C

	THUMB_FUNC_END func_08098590

	THUMB_FUNC_START func_080985A4
func_080985A4: @ 0x080985A4
	push {lr}
	ldr r0, .L080985B4  @ gUnknown_08A1898C
	bl FindProc
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L080985B4: .4byte gUnknown_08A1898C

	THUMB_FUNC_END func_080985A4

	THUMB_FUNC_START func_080985B8
func_080985B8: @ 0x080985B8
	push {r4, r5, lr}
	ldr r0, .L080985F8  @ gUnknown_02013588
	ldr r4, .L080985FC  @ gBg0Tm+0x466
	adds r1, r4, #0
	bl PutText
	adds r5, r4, #0
	adds r5, #0x10
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x12
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #0xa8
	movs r1, #0x85
	bl func_080984CC
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080985F8: .4byte gUnknown_02013588
.L080985FC: .4byte gBg0Tm+0x466

	THUMB_FUNC_END func_080985B8

	THUMB_FUNC_START func_08098600
func_08098600: @ 0x08098600
	push {lr}
	ldr r0, .L0809861C  @ gBg0Tm+0x466
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	bl func_080984EC
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L0809861C: .4byte gBg0Tm+0x466

	THUMB_FUNC_END func_08098600

	THUMB_FUNC_START func_08098620
func_08098620: @ 0x08098620
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #4
	ldr r0, .L08098970  @ gUnknown_08205C14
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, .L08098974  @ gUnknown_08A181E8
	bl SetupBackgrounds
	ldr r4, .L08098978  @ gDispIo
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	add r0, sp, #4
	bl SetFaceConfig
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	ldr r0, .L0809897C  @ 0x06017800
	movs r1, #0
	bl DebugInitObj
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
	bl ResetText
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl LoadUiFrameGraphics
	ldr r0, .L08098980  @ gUiFramePaletteD
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	bl LoadObjUiGfx
	bl InitPrepScreenUnitList
	bl func_08095394
	bl func_080958FC
	adds r1, r7, #0
	adds r1, #0x2a
	movs r4, #0
	strb r0, [r1]
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	ldr r0, .L08098984  @ func_0809A274
	adds r1, r7, #0
	bl StartParallelWorker
	adds r0, r7, #0
	bl func_080AC9C0
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r0, .L08098988  @ gPal
	strh r4, [r0]
	bl EnablePalSync
	add r4, sp, #0x24
	mov sl, r4
	ldr r5, .L0809898C  @ gUnknown_02013498
	movs r4, #0xe
.L08098726:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08098726
	movs r0, #0x2b
	adds r0, r0, r7
	mov r8, r0
	ldr r0, .L08098990  @ gUnknown_02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
.L08098746:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r0, r6, #0
	movs r1, #7
	bl InitText
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08098746
	ldr r4, .L08098994  @ gUnknown_02013560
	adds r0, r4, #0
	movs r1, #8
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #8
	bl InitText
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #5
	bl InitText
	ldr r0, .L08098998  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadHelpBoxGfx
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r1, #0
	mov r9, r1
	str r1, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r2, r9
	str r2, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r3, .L08098978  @ gDispIo
	movs r4, #0x36
	adds r4, r4, r3
	mov ip, r4
	ldrb r2, [r4]
	movs r1, #0x20
	orrs r2, r1
	ldrb r0, [r3, #1]
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2d
	mov r1, r9
	strb r1, [r0]
	adds r0, #4
	movs r4, #4
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x44
	strb r0, [r1]
	adds r6, r3, #0
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	orrs r0, r4
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r6]
	orrs r2, r5
	orrs r2, r3
	movs r0, #5
	negs r0, r0
	ands r2, r0
	orrs r2, r4
	orrs r2, r1
	mov r3, ip
	strb r2, [r3]
	ldr r2, .L0809899C  @ 0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	ldr r1, .L080989A0  @ 0x0000FFD8
	ldrh r2, [r7, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	movs r0, #7
	bl EnableBgSync
	bl ApplyUnitSpritePalettes
	mov r4, r9
	str r4, [sp, #0x24]
	ldr r1, .L080989A4  @ gPal+0x360
	ldr r2, .L080989A8  @ 0x01000008
	mov r0, sl
	bl CpuFastSet
	bl ForceSyncUnitSpriteSheet
	ldr r0, .L080989AC  @ gUnknown_08A1D4E8
	ldr r1, .L080989B0  @ 0x06013E00
	bl Decompress
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xd0
	bl func_080ACA4C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	bl RestartScreenMenuScrollingBg
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq .L080988E2
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r7, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl func_080AC9D4
	mov r2, r8
	ldrb r0, [r2]
	bl GetPrepScreenUnitListEntry
	adds r1, r0, #0
	ldr r0, .L080989B4  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl func_08099E98
.L080988E2:
	movs r3, #0x80
	lsls r3, r3, #2
	movs r4, #4
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0xe0
	movs r2, #0xb
	bl func_08097748
	ldrh r4, [r7, #0x34]
	bl GetPrepScreenUnitListSize
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl func_080976CC
	bl func_08097668
	bl func_08095928
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r9
	str r1, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, .L080989B8  @ func_080983D4
	bl SetOnHBlankA
	movs r0, #0xa8
	movs r1, #0x85
	movs r2, #0xb
	adds r3, r7, #0
	bl func_080984A8
	adds r0, r7, #0
	bl func_08098554
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098970: .4byte gUnknown_08205C14
.L08098974: .4byte gUnknown_08A181E8
.L08098978: .4byte gDispIo
.L0809897C: .4byte 0x06017800
.L08098980: .4byte gUiFramePaletteD
.L08098984: .4byte func_0809A274
.L08098988: .4byte gPal
.L0809898C: .4byte gUnknown_02013498
.L08098990: .4byte gUnknown_02013510
.L08098994: .4byte gUnknown_02013560
.L08098998: .4byte 0x06014000
.L0809899C: .4byte 0x0000FFFC
.L080989A0: .4byte 0x0000FFD8
.L080989A4: .4byte gPal+0x360
.L080989A8: .4byte 0x01000008
.L080989AC: .4byte gUnknown_08A1D4E8
.L080989B0: .4byte 0x06013E00
.L080989B4: .4byte 0x00000503
.L080989B8: .4byte func_080983D4

	THUMB_FUNC_END func_08098620

	THUMB_FUNC_START func_080989BC
func_080989BC: @ 0x080989BC
	push {lr}
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl func_080953C0
	bl EndAllParallelWorkers
	bl EndPrepScreenHandCursor
	bl func_080ACB00
	movs r0, #0
	bl func_08099F50
	movs r0, #1
	bl func_08099F50
	bl EndScreenMenuScrollingBg
	bl HideRIsInfo
	bl Delete6CMenuScroll
	bl func_08098500
	bl func_080985A4
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080989BC

	THUMB_FUNC_START func_08098A04
func_08098A04: @ 0x08098A04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, .L08098A68  @ gUnknown_02013560
	adds r0, r4, #0
	bl ClearText
	movs r0, #8
	adds r0, r0, r4
	mov r8, r0
	bl ClearText
	ldr r0, .L08098A6C  @ 0x00000583
	bl GetMsg
	adds r1, r5, #0
	adds r1, #0x42
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, .L08098A70  @ 0x00000584
	bl GetMsg
	adds r5, #0xc2
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08098A68: .4byte gUnknown_02013560
.L08098A6C: .4byte 0x00000583
.L08098A70: .4byte 0x00000584

	THUMB_FUNC_END func_08098A04

	THUMB_FUNC_START func_08098A74
func_08098A74: @ 0x08098A74
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	movs r2, #8
	movs r3, #0
	bl TmFillRect_thm
	ldr r4, .L08098AB0  @ gUnknown_02013560
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r0, #8
	bl ClearText
	adds r4, #0x10
	adds r0, r4, #0
	bl ClearText
	bl func_080C4070
	cmp r0, #1
	beq .L08098AC8
	cmp r0, #1
	bgt .L08098AB4
	cmp r0, #0
	beq .L08098ABE
	b .L08098ADA
	.align 2, 0
.L08098AB0: .4byte gUnknown_02013560
.L08098AB4:
	cmp r0, #2
	beq .L08098AD0
	cmp r0, #3
	beq .L08098AD8
	b .L08098ADA
.L08098ABE:
	ldr r5, .L08098AC4  @ 0x00000672
	b .L08098ADA
	.align 2, 0
.L08098AC4: .4byte 0x00000672
.L08098AC8:
	ldr r5, .L08098ACC  @ 0x00000673
	b .L08098ADA
	.align 2, 0
.L08098ACC: .4byte 0x00000673
.L08098AD0:
	ldr r5, .L08098AD4  @ 0x00000674
	b .L08098ADA
	.align 2, 0
.L08098AD4: .4byte 0x00000674
.L08098AD8:
	ldr r5, .L08098B38  @ 0x00000675
.L08098ADA:
	adds r0, r5, #0
	bl GetMsg
	ldr r4, .L08098B3C  @ gUnknown_02013560
	adds r1, r6, #0
	adds r1, #0x80
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl PutDrawText
	ldr r0, .L08098B40  @ 0x00000583
	bl GetMsg
	adds r2, r4, #0
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r6, r3
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #4
	bl PutDrawText
	ldr r0, .L08098B44  @ 0x00000584
	bl GetMsg
	adds r4, #0x10
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r6, r2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl PutDrawText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08098B38: .4byte 0x00000675
.L08098B3C: .4byte gUnknown_02013560
.L08098B40: .4byte 0x00000583
.L08098B44: .4byte 0x00000584

	THUMB_FUNC_END func_08098A74

	THUMB_FUNC_START func_08098B48
func_08098B48: @ 0x08098B48
	push {lr}
	sub sp, #4
	ldr r0, .L08098B64  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x59
	movs r2, #9
	movs r3, #4
	bl func_0809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08098B64: .4byte 0x0000A440

	THUMB_FUNC_END func_08098B48

	THUMB_FUNC_START func_08098B68
func_08098B68: @ 0x08098B68
	push {lr}
	sub sp, #4
	bl func_080C4070
	cmp r0, #3
	bne .L08098B8C
	ldr r0, .L08098B88  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl func_0809A31C
	b .L08098B9C
	.align 2, 0
.L08098B88: .4byte 0x0000A440
.L08098B8C:
	ldr r0, .L08098BA4  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl func_0809A31C
.L08098B9C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08098BA4: .4byte 0x0000A440

	THUMB_FUNC_END func_08098B68

	THUMB_FUNC_START func_08098BA8
func_08098BA8: @ 0x08098BA8
	push {lr}
	sub sp, #4
	ldr r0, .L08098BC4  @ 0x0000A440
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl func_0809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08098BC4: .4byte 0x0000A440

	THUMB_FUNC_END func_08098BA8

	THUMB_FUNC_START func_08098BC8
func_08098BC8: @ 0x08098BC8
	push {lr}
	sub sp, #4
	ldr r0, .L08098BE4  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl func_0809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08098BE4: .4byte 0x0000A840

	THUMB_FUNC_END func_08098BC8

	THUMB_FUNC_START func_08098BE8
func_08098BE8: @ 0x08098BE8
	push {lr}
	ldr r0, .L08098C04  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08098C0C
	ldr r0, .L08098C08  @ func_08098B68
	bl GetParallelWorker
	bl Proc_End
	b .L08098C16
	.align 2, 0
.L08098C04: .4byte gGmData
.L08098C08: .4byte func_08098B68
.L08098C0C:
	ldr r0, .L08098C30  @ func_08098B48
	bl GetParallelWorker
	bl Proc_End
.L08098C16:
	ldr r0, .L08098C34  @ func_08098BA8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, .L08098C38  @ func_08098BC8
	bl GetParallelWorker
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L08098C30: .4byte func_08098B48
.L08098C34: .4byte func_08098BA8
.L08098C38: .4byte func_08098BC8

	THUMB_FUNC_END func_08098BE8

	THUMB_FUNC_START func_08098C3C
func_08098C3C: @ 0x08098C3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, .L08098C80  @ gUnknown_08205C34
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L08098C84  @ gUnknown_08A1D8D0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, .L08098C88  @ gPlaySt
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08098C80: .4byte gUnknown_08205C34
.L08098C84: .4byte gUnknown_08A1D8D0
.L08098C88: .4byte gPlaySt

	THUMB_FUNC_END func_08098C3C

	THUMB_FUNC_START func_08098C8C
func_08098C8C: @ 0x08098C8C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, .L08098CB4  @ gUnknown_08A1D7DC
	ldr r1, .L08098CB8  @ 0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, .L08098CBC  @ gUiFramePaletteD
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08098CB4: .4byte gUnknown_08A1D7DC
.L08098CB8: .4byte 0x06010000
.L08098CBC: .4byte gUiFramePaletteD

	THUMB_FUNC_END func_08098C8C

	THUMB_FUNC_START func_08098CC0
func_08098CC0: @ 0x08098CC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl LoadUiFrameGraphics
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	adds r0, r6, #0
	bl func_0809A08C
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl func_08098C8C
	ldr r0, .L08098D78  @ gUnknown_08A1B8B8
	ldr r4, .L08098D7C  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L08098D80  @ gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, .L08098D84  @ gUiFramePaletteD
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl GetPrepScreenUnitListEntry
	adds r1, r0, #0
	ldr r0, .L08098D88  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl func_08099E98
	ldr r4, .L08098D8C  @ gUnknown_02013510
	ldr r7, .L08098D90  @ gBg0Tm+0x244
	ldrb r0, [r5]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	movs r3, #2
	bl func_08099F7C
	ldr r0, .L08098D94  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08098D98
	adds r0, r7, #0
	subs r0, #0x20
	bl func_08098A74
	b .L08098DA0
	.align 2, 0
.L08098D78: .4byte gUnknown_08A1B8B8
.L08098D7C: .4byte gBuf
.L08098D80: .4byte gBg1Tm
.L08098D84: .4byte gUiFramePaletteD
.L08098D88: .4byte 0x00000503
.L08098D8C: .4byte gUnknown_02013510
.L08098D90: .4byte gBg0Tm+0x244
.L08098D94: .4byte gGmData
.L08098D98:
	adds r0, r7, #0
	adds r0, #0x60
	bl func_08098A04
.L08098DA0:
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl func_080AD51C
	adds r0, r6, #0
	movs r1, #0
	bl func_0809A504
	bl func_080ACAE4
	bl func_080ACAA4
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r6, #0
	bl ShowRIsInfo
	bl func_08098BE8
	ldr r0, .L08098E14  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08098E1C
	ldr r0, .L08098E18  @ func_08098B68
	adds r1, r6, #0
	bl StartParallelWorker
	b .L08098E24
	.align 2, 0
.L08098E14: .4byte gGmData
.L08098E18: .4byte func_08098B68
.L08098E1C:
	ldr r0, .L08098E3C  @ func_08098B48
	adds r1, r6, #0
	bl StartParallelWorker
.L08098E24:
	bl func_080985B8
	bl func_08098590
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08098E3C: .4byte func_08098B48

	THUMB_FUNC_END func_08098CC0

	THUMB_FUNC_START func_08098E40
func_08098E40: @ 0x08098E40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r3, r8
	adds r3, #0x2a
	ldrb r7, [r3]
	ldr r0, .L08098F1C  @ gKeySt
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	mov r4, r8
	adds r4, #0x31
	movs r0, #4
	strb r0, [r4]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08098E6E
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r4]
.L08098E6E:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq .L08098E80
	ldrb r0, [r3]
	subs r0, #3
	cmp r0, #0
	blt .L08098E80
	strb r0, [r3]
.L08098E80:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x2a
	cmp r0, #0
	beq .L08098E9E
	ldrb r4, [r6]
	adds r4, #3
	bl GetPrepScreenUnitListSize
	cmp r4, r0
	bge .L08098E9E
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
.L08098E9E:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq .L08098EBA
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08098EBA
	subs r0, r4, #1
	strb r0, [r6]
.L08098EBA:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq .L08098EE4
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi .L08098EE4
	adds r4, #1
	bl GetPrepScreenUnitListSize
	cmp r4, r0
	bge .L08098EE4
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
.L08098EE4:
	ldrb r0, [r6]
	cmp r0, r7
	beq .L08098FA0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl GetPrepScreenUnitListSize
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x34]
	subs r0, r4, r1
	cmp r0, #0x20
	ble .L08098F20
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge .L08098F20
	lsrs r1, r1, #4
	adds r1, #4
	b .L08098F34
	.align 2, 0
.L08098F1C: .4byte gKeySt
.L08098F20:
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt .L08098F54
	cmp r7, #0
	beq .L08098F54
	lsrs r1, r7, #4
	subs r1, #1
.L08098F34:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl func_0809A114
	ldrb r0, [r6]
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x12
	adds r0, #0x18
	bl func_080AD4E4
	b .L08098F84
.L08098F54:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl func_080AD51C
.L08098F84:
	ldr r0, .L08098F9C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08098F96
	movs r0, #0x65
	bl m4aSongNumStart
.L08098F96:
	movs r0, #1
	b .L08098FA2
	.align 2, 0
.L08098F9C: .4byte gPlaySt
.L08098FA0:
	movs r0, #0
.L08098FA2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08098E40

	THUMB_FUNC_START func_08098FAC
func_08098FAC: @ 0x08098FAC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl GetPrepScreenUnitListSize
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0x20
	ble .L0809904C
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge .L0809904C
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	adds r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, .L080990D0  @ 0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq .L0809902C
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl func_080AC9D4
.L0809902C:
	ldrh r4, [r6, #0x34]
	bl GetPrepScreenUnitListSize
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl func_080976CC
.L0809904C:
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0xf
	bgt .L080990C8
	cmp r1, #0
	beq .L080990C8
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	subs r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, .L080990D0  @ 0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq .L080990A8
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl func_080AC9D4
.L080990A8:
	ldrh r4, [r6, #0x34]
	bl GetPrepScreenUnitListSize
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl func_080976CC
.L080990C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080990D0: .4byte 0x0000FFD8

	THUMB_FUNC_END func_08098FAC

	THUMB_FUNC_START func_080990D4
func_080990D4: @ 0x080990D4
	push {r4, lr}
	adds r4, r0, #0
	bl func_080989BC
	movs r0, #0x31
	bl SetStatScreenConfig
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r1, r4, #0
	bl StartStatScreen
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080990D4

	THUMB_FUNC_START func_08099100
func_08099100: @ 0x08099100
	push {r4, lr}
	adds r4, r0, #0
	bl func_08098620
	bl func_08095674
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	bl func_0809A08C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099100

	THUMB_FUNC_START func_08099120
func_08099120: @ 0x08099120
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L08099132
	b .L0809930E
.L08099132:
	ldr r0, .L0809914C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08099150
	adds r0, r6, #0
	bl Proc_Break
	b .L08099314
	.align 2, 0
.L0809914C: .4byte gKeySt
.L08099150:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne .L0809915C
	b .L08099288
.L0809915C:
	ldr r0, .L080991A4  @ gGmData
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L08099202
	bl func_080C4070
	cmp r0, #2
	beq .L080991A8
	cmp r0, #3
	bne .L080991FC
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi .L08099230
	bl GetPrepScreenUnitListSize
	subs r0, #1
	cmp r7, r0
	bge .L08099230
	ldrb r0, [r4]
	adds r0, #1
	b .L08099234
	.align 2, 0
.L080991A4: .4byte gGmData
.L080991A8:
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080991E0
	ldr r0, .L080991DC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080991D0
	movs r0, #0x6a
	bl m4aSongNumStart
.L080991D0:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	b .L08099314
	.align 2, 0
.L080991DC: .4byte gPlaySt
.L080991E0:
	ldr r0, .L080991F8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080991EE
	b .L08099314
.L080991EE:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L08099314
	.align 2, 0
.L080991F8: .4byte gPlaySt
.L080991FC:
	adds r0, r6, #0
	movs r1, #0xd
	b .L0809926A
.L08099202:
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi .L08099230
	bl GetPrepScreenUnitListSize
	subs r0, #1
	cmp r7, r0
	bge .L08099230
	ldrb r0, [r4]
	adds r0, #1
	b .L08099234
.L08099230:
	ldrb r0, [r4]
	subs r0, #1
.L08099234:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl func_080AC9D4
	adds r0, r6, #0
	movs r1, #2
.L0809926A:
	bl Proc_Goto
	ldr r0, .L08099284  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08099314
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L08099314
	.align 2, 0
.L08099284: .4byte gPlaySt
.L08099288:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080992CC
	ldr r0, .L080992C4  @ gGmData
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L080992A8
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
.L080992A8:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	ldr r0, .L080992C8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08099314
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L08099314
	.align 2, 0
.L080992C4: .4byte gGmData
.L080992C8: .4byte gPlaySt
.L080992CC:
	adds r0, r6, #0
	bl func_08098E40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809930E
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl GetPrepScreenUnitListEntry
	adds r1, r0, #0
	ldr r0, .L0809931C  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl func_08099E98
	ldr r4, .L08099320  @ gUnknown_02013510
	ldr r5, .L08099324  @ gBg0Tm+0x244
	ldrb r0, [r7]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl func_08099F7C
	movs r0, #1
	bl EnableBgSync
.L0809930E:
	adds r0, r6, #0
	bl func_08098FAC
.L08099314:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809931C: .4byte 0x00000503
.L08099320: .4byte gUnknown_02013510
.L08099324: .4byte gBg0Tm+0x244

	THUMB_FUNC_END func_08099120

	THUMB_FUNC_START func_08099328
func_08099328: @ 0x08099328
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov r8, r1
	mov sl, r2
	mov r0, r8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r7, .L08099454  @ gUnknown_02013560
	adds r0, r7, #0
	bl ClearText
	bl GetPrepScreenUnitListSize
	movs r4, #0
	cmp r0, #1
	bgt .L08099358
	movs r4, #1
.L08099358:
	ldr r0, .L08099458  @ 0x00000594
	bl GetMsg
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertDrawString
	bl GetPrepScreenUnitListSize
	movs r4, #0
	cmp r0, #1
	bgt .L08099376
	movs r4, #1
.L08099376:
	ldr r0, .L0809945C  @ 0x00000595
	bl GetMsg
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0x20
	adds r2, r4, #0
	bl Text_InsertDrawString
	mov r1, r8
	adds r1, #0x40
	adds r0, r7, #0
	bl PutText
	adds r5, r7, #0
	adds r5, #8
	adds r0, r5, #0
	bl ClearText
	mov r0, sl
	bl CanUnitPrepScreenUse
	movs r4, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080993AC
	movs r4, #1
.L080993AC:
	ldr r0, .L08099460  @ 0x00000596
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertDrawString
	movs r6, #0
	mov r4, r9
	adds r4, #0x2c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne .L080993CE
	movs r6, #1
.L080993CE:
	ldr r0, .L08099464  @ 0x0000059A
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	adds r2, r6, #0
	bl Text_InsertDrawString
	mov r1, r8
	adds r1, #0xc0
	adds r0, r5, #0
	bl PutText
	adds r5, r7, #0
	adds r5, #0x10
	adds r0, r5, #0
	bl ClearText
	movs r6, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne .L08099400
	movs r6, #1
.L08099400:
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl Text_InsertDrawString
	ldr r0, .L08099468  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08099470
	adds r6, r5, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq .L0809943E
	mov r0, sl
	bl GetUnitItemCount
	cmp r0, #0
	ble .L0809943E
	bl CheckGameLinkArenaBit
	cmp r0, #0
	beq .L08099440
.L0809943E:
	movs r5, #1
.L08099440:
	ldr r0, .L0809946C  @ 0x00000597
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x20
	adds r2, r5, #0
	bl Text_InsertDrawString
	b .L080994A2
	.align 2, 0
.L08099454: .4byte gUnknown_02013560
.L08099458: .4byte 0x00000594
.L0809945C: .4byte 0x00000595
.L08099460: .4byte 0x00000596
.L08099464: .4byte 0x0000059A
.L08099468: .4byte gGmData
.L0809946C: .4byte 0x00000597
.L08099470:
	bl CheckGameLinkArenaBit
	cmp r0, #0
	beq .L08099490
	ldr r0, .L0809948C  @ 0x00000599
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #1
	bl Text_InsertDrawString
	b .L080994A2
	.align 2, 0
.L0809948C: .4byte 0x00000599
.L08099490:
	ldr r0, .L080994BC  @ 0x00000599
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertDrawString
.L080994A2:
	ldr r0, .L080994C0  @ gUnknown_02013570
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, r8
	bl PutText
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080994BC: .4byte 0x00000599
.L080994C0: .4byte gUnknown_02013570

	THUMB_FUNC_END func_08099328

	THUMB_FUNC_START func_080994C4
func_080994C4: @ 0x080994C4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x2b
	adds r0, r0, r4
	mov r9, r0
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r6, r0, #0
	adds r4, #0x32
	movs r1, #0
	mov r8, r1
	movs r0, #1
	strb r0, [r4]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r5, .L080995B8  @ gUnknown_02013510
	ldr r7, .L080995BC  @ gBg0Tm+0x244
	mov r2, r9
	ldrb r0, [r2]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0
	bl func_08099F7C
	ldr r0, .L080995C0  @ gUnknown_08A1B8B8
	ldr r4, .L080995C4  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L080995C8  @ gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	movs r0, #0
	movs r1, #0x1f
	bl func_08098570
	adds r0, r6, #0
	bl GetUnitFid
	ldr r3, .L080995CC  @ 0xFFFFFEC0
	adds r1, r7, r3
	movs r2, #0x9c
	lsls r2, r2, #2
	mov r3, r8
	str r3, [sp]
	movs r3, #3
	bl PutFaceChibi
	adds r5, #0x80
	adds r0, r5, #0
	bl ClearText
	ldr r0, [r6]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, .L080995D0  @ 0xFFFFFECC
	adds r1, r7, r0
	mov r2, r8
	str r2, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	subs r0, #0xb6
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	adds r0, r7, #0
	subs r0, #0xae
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r7, #0
	subs r0, #0xb0
	movs r2, #8
	ldrsb r2, [r6, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	subs r0, #0xaa
	ldrb r2, [r6, #9]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #7
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080995B8: .4byte gUnknown_02013510
.L080995BC: .4byte gBg0Tm+0x244
.L080995C0: .4byte gUnknown_08A1B8B8
.L080995C4: .4byte gBuf
.L080995C8: .4byte gBg1Tm
.L080995CC: .4byte 0xFFFFFEC0
.L080995D0: .4byte 0xFFFFFECC

	THUMB_FUNC_END func_080994C4

	THUMB_FUNC_START func_080995D4
func_080995D4: @ 0x080995D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L0809963C  @ gBg0Tm+0x25E
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl func_08098C8C
	adds r0, r6, #0
	bl func_080994C4
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl func_0809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08099640
	bl func_080ACAC8
	b .L08099644
	.align 2, 0
.L0809963C: .4byte gBg0Tm+0x25E
.L08099640:
	bl func_080ACAE4
.L08099644:
	bl func_08098BE8
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080995D4

	THUMB_FUNC_START func_08099654
func_08099654: @ 0x08099654
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L080996A8  @ gBg0Tm+0x266
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_08099328
	ldr r0, .L080996AC  @ func_08098BC8
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r4, #0
	bl ShowRIsInfo
	adds r4, #0x2e
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl func_080AD51C
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080996A8: .4byte gBg0Tm+0x266
.L080996AC: .4byte func_08098BC8

	THUMB_FUNC_END func_08099654

	THUMB_FUNC_START func_080996B0
func_080996B0: @ 0x080996B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl func_0809A504
	ldr r0, .L080996E0  @ gUnknown_02013510
	ldr r1, .L080996E4  @ gBg0Tm+0x244
	adds r2, r5, #0
	movs r3, #0
	bl func_08099F7C
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080996E0: .4byte gUnknown_02013510
.L080996E4: .4byte gBg0Tm+0x244

	THUMB_FUNC_END func_080996B0

	THUMB_FUNC_START func_080996E8
func_080996E8: @ 0x080996E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0x2d
	ldrb r0, [r4]
	cmp r0, #0xff
	beq .L08099704
	b .L08099930
.L08099704:
	ldr r0, .L08099734  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08099754
	mov r1, r8
	strb r1, [r4]
	ldr r0, .L08099738  @ gGmData
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809973C
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	b .L08099A4C
	.align 2, 0
.L08099734: .4byte gKeySt
.L08099738: .4byte gGmData
.L0809973C:
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, .L08099750  @ gUnknown_08A188F8
	b .L08099A54
	.align 2, 0
.L08099750: .4byte gUnknown_08A188F8
.L08099754:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0809975E
	b .L080998F0
.L0809975E:
	mov r0, r8
	cmp r0, #5
	bls .L08099766
	b .L080998D4
.L08099766:
	lsls r0, r0, #2
	ldr r1, .L08099770  @ .L08099774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08099770: .4byte .L08099774
.L08099774: @ jump table
	.4byte .L0809978C @ case 0
	.4byte .L0809979C @ case 1
	.4byte .L080997AC @ case 2
	.4byte .L080997C8 @ case 3
	.4byte .L08099854 @ case 4
	.4byte .L08099868 @ case 5
.L0809978C:
	bl GetPrepScreenUnitListSize
	cmp r0, #1
	bgt .L08099796
	b .L080998D4
.L08099796:
	adds r0, r5, #0
	movs r1, #4
	b .L080998B4
.L0809979C:
	bl GetPrepScreenUnitListSize
	cmp r0, #1
	bgt .L080997A6
	b .L080998D4
.L080997A6:
	adds r0, r5, #0
	movs r1, #8
	b .L080998B4
.L080997AC:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	bl CanUnitPrepScreenUse
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080997C2
	b .L080998D4
.L080997C2:
	adds r0, r5, #0
	movs r1, #9
	b .L080998B4
.L080997C8:
	bl CheckGameLinkArenaBit
	cmp r0, #0
	beq .L080997F8
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L080997F8
	subs r1, #9
	ldr r2, .L080997F4  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r5, #0
	bl func_08097DA8
	b .L08099A90
	.align 2, 0
.L080997F4: .4byte 0x0000088B
.L080997F8:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080998D4
	adds r6, r5, #0
	adds r6, #0x2b
	ldrb r0, [r6]
	bl GetPrepScreenUnitListEntry
	bl func_0809A538
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080998D4
	ldr r4, .L0809984C  @ gBg0Tm+0x266
	ldrb r0, [r6]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_08099328
	ldr r5, .L08099850  @ gUnknown_02013510
	subs r4, #0x22
	ldrb r0, [r6]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl func_08099F7C
	movs r0, #1
	bl EnableBgSync
	b .L080998B8
	.align 2, 0
.L0809984C: .4byte gBg0Tm+0x266
.L08099850: .4byte gUnknown_02013510
.L08099854:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080998D4
	adds r0, r5, #0
	movs r1, #0xa
	b .L080998B4
.L08099868:
	ldr r0, .L080998A4  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080998A8
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080998D4
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	bl GetUnitItemCount
	cmp r0, #0
	ble .L080998D4
	bl CheckGameLinkArenaBit
	cmp r0, #0
	bne .L080998D4
	adds r0, r5, #0
	movs r1, #0xb
	b .L080998B4
	.align 2, 0
.L080998A4: .4byte gGmData
.L080998A8:
	bl CheckGameLinkArenaBit
	cmp r0, #0
	bne .L080998D4
	adds r0, r5, #0
	movs r1, #0xc
.L080998B4:
	bl Proc_Goto
.L080998B8:
	ldr r0, .L080998D0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080998C6
	b .L08099A90
.L080998C6:
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L08099A90
	.align 2, 0
.L080998D0: .4byte gPlaySt
.L080998D4:
	ldr r0, .L080998EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080998E2
	b .L08099A90
.L080998E2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L08099A90
	.align 2, 0
.L080998EC: .4byte gPlaySt
.L080998F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08099948
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl func_080ACA84
	ldr r0, .L0809992C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08099920
	movs r0, #0x6b
	bl m4aSongNumStart
.L08099920:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b .L08099A90
	.align 2, 0
.L0809992C: .4byte gPlaySt
.L08099930:
	ldr r0, .L0809996C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08099948
	bl MoveableHelpBox_OnEnd
	movs r0, #0xff
	strb r0, [r4]
.L08099948:
	ldr r2, .L0809996C  @ gKeySt
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x20
	adds r0, r7, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq .L0809997E
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq .L08099970
	subs r0, r3, #1
	b .L0809997C
	.align 2, 0
.L0809996C: .4byte gKeySt
.L08099970:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809997E
	adds r0, r3, #1
.L0809997C:
	strb r0, [r4]
.L0809997E:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x10
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L080999A8
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne .L0809999A
	adds r0, r3, #1
	b .L080999A6
.L0809999A:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L080999A8
	subs r0, r3, #1
.L080999A6:
	strb r0, [r4]
.L080999A8:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L080999CE
	ldrb r3, [r4]
	cmp r3, #1
	bls .L080999C0
	subs r0, r3, #2
	b .L080999CC
.L080999C0:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L080999CE
	adds r0, r3, #4
.L080999CC:
	strb r0, [r4]
.L080999CE:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq .L080999F4
	ldrb r3, [r4]
	cmp r3, #3
	bhi .L080999E6
	adds r0, r3, #2
	b .L080999F2
.L080999E6:
	ldrh r1, [r2, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq .L080999F4
	subs r0, r3, #4
.L080999F2:
	strb r0, [r4]
.L080999F4:
	adds r6, r4, #0
	ldrb r1, [r6]
	cmp r8, r1
	beq .L08099A90
	ldr r0, .L08099A64  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08099A0E
	movs r0, #0x65
	bl m4aSongNumStart
.L08099A0E:
	ldrb r1, [r6]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl func_080AD51C
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq .L08099A90
	ldr r0, .L08099A68  @ gGmData
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L08099A70
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	muls r0, r2, r0
	adds r0, #0x90
.L08099A4C:
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, .L08099A6C  @ gUnknown_08A18910
.L08099A54:
	ldrb r2, [r6]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl ShowTextHelpBox
	b .L08099A90
	.align 2, 0
.L08099A64: .4byte gPlaySt
.L08099A68: .4byte gGmData
.L08099A6C: .4byte gUnknown_08A18910
.L08099A70:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	muls r0, r2, r0
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, .L08099A9C  @ gUnknown_08A188F8
	ldrb r2, [r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl ShowTextHelpBox
.L08099A90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08099A9C: .4byte gUnknown_08A188F8

	THUMB_FUNC_END func_080996E8

	THUMB_FUNC_START func_08099AA0
func_08099AA0: @ 0x08099AA0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r4, .L08099AF0  @ gUnknown_02013510
	ldr r5, .L08099AF4  @ gBg0Tm+0x244
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl func_08099F7C
	adds r4, #0x28
	adds r5, #0x1e
	adds r6, #0x2a
	ldrb r0, [r6]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl func_08099F7C
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08099AF0: .4byte gUnknown_02013510
.L08099AF4: .4byte gBg0Tm+0x244

	THUMB_FUNC_END func_08099AA0

	THUMB_FUNC_START func_08099AF8
func_08099AF8: @ 0x08099AF8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r0, .L08099C3C  @ gBg0Tm
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	ldr r0, .L08099C40  @ gUnknown_08A1B8B8
	ldr r5, .L08099C44  @ gBuf
	adds r1, r5, #0
	bl Decompress
	ldr r4, .L08099C48  @ gBg1Tm
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
	ldr r0, .L08099C4C  @ gUnknown_08A1B990
	adds r1, r5, #0
	bl Decompress
	ldr r0, .L08099C50  @ 0x0000025E
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
	mov r1, r8
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	mov r6, r8
	adds r6, #0x2a
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	mov r2, r8
	ldrh r0, [r2, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl func_080AD51C
	mov r0, r8
	movs r1, #0
	bl func_0809A504
	movs r0, #7
	bl EnableBgSync
	mov r4, r8
	adds r4, #0x2b
	ldrb r0, [r4]
	bl GetPrepScreenUnitListEntry
	adds r1, r0, #0
	ldr r0, .L08099C54  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl func_08099E98
	ldrb r0, [r6]
	bl GetPrepScreenUnitListEntry
	adds r1, r0, #0
	ldr r0, .L08099C58  @ 0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl func_08099E98
	ldrb r5, [r4]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl func_080AC9D4
	ldr r0, .L08099C5C  @ func_08099AA0
	movs r1, #1
	mov r2, r8
	bl func_080ACE20
	bl func_080ACAE4
	bl func_08098590
	bl HideRIsInfo
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08099C3C: .4byte gBg0Tm
.L08099C40: .4byte gUnknown_08A1B8B8
.L08099C44: .4byte gBuf
.L08099C48: .4byte gBg1Tm
.L08099C4C: .4byte gUnknown_08A1B990
.L08099C50: .4byte 0x0000025E
.L08099C54: .4byte 0x00000503
.L08099C58: .4byte 0x00000502
.L08099C5C: .4byte func_08099AA0

	THUMB_FUNC_END func_08099AF8

	THUMB_FUNC_START func_08099C60
func_08099C60: @ 0x08099C60
	push {lr}
	bl func_08098BE8
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099C60

	THUMB_FUNC_START func_08099C70
func_08099C70: @ 0x08099C70
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L08099C82
	b .L08099D9C
.L08099C82:
	ldr r0, .L08099C9C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08099CA0
	adds r0, r6, #0
	bl Proc_Break
	b .L08099DA2
	.align 2, 0
.L08099C9C: .4byte gKeySt
.L08099CA0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08099D10
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl GetPrepScreenUnitListEntry
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	bl GetPrepScreenUnitListEntry
	bl GetUnitItemCount
	adds r1, r0, #0
	ldrb r0, [r5]
	ldrb r4, [r4]
	cmp r0, r4
	beq .L08099CF8
	cmp r7, #0
	bgt .L08099CD8
	cmp r1, #0
	ble .L08099CF8
.L08099CD8:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, .L08099CF4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08099DA2
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L08099DA2
	.align 2, 0
.L08099CF4: .4byte gPlaySt
.L08099CF8:
	ldr r0, .L08099D0C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08099DA2
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L08099DA2
	.align 2, 0
.L08099D0C: .4byte gPlaySt
.L08099D10:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08099D40
	movs r0, #1
	bl func_08099F50
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, .L08099D3C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08099DA2
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L08099DA2
	.align 2, 0
.L08099D3C: .4byte gPlaySt
.L08099D40:
	adds r0, r6, #0
	bl func_08098E40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08099D9C
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl GetPrepScreenUnitListEntry
	adds r1, r0, #0
	ldr r0, .L08099DAC  @ 0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl func_08099E98
	ldr r4, .L08099DB0  @ gUnknown_02013538
	ldr r5, .L08099DB4  @ gBg0Tm+0x262
	ldrb r0, [r7]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl func_08099F7C
	subs r4, #0x28
	subs r5, #0x1e
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl func_08099F7C
	movs r0, #1
	bl EnableBgSync
.L08099D9C:
	adds r0, r6, #0
	bl func_08098FAC
.L08099DA2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08099DAC: .4byte 0x00000502
.L08099DB0: .4byte gUnknown_02013538
.L08099DB4: .4byte gBg0Tm+0x262

	THUMB_FUNC_END func_08099C70

	THUMB_FUNC_START func_08099DB8
func_08099DB8: @ 0x08099DB8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl func_080989BC
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl StartPrepScreenTrade
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099DB8

	THUMB_FUNC_START func_08099DE8
func_08099DE8: @ 0x08099DE8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r1, r4, #0
	bl StartPrepScreenItemUseScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099DE8

	THUMB_FUNC_START func_08099E00
func_08099E00: @ 0x08099E00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r1, r4, #0
	bl func_0809EAD8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099E00

	THUMB_FUNC_START func_08099E18
func_08099E18: @ 0x08099E18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r1, r4, #0
	bl func_080A070C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099E18

	THUMB_FUNC_START func_08099E30
func_08099E30: @ 0x08099E30
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	adds r1, r4, #0
	bl func_0809FD88
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099E30

	THUMB_FUNC_START func_08099E48
func_08099E48: @ 0x08099E48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetPrepScreenUnitListEntry
	ldr r1, .L08099E64  @ gUnknown_08A188E4
	adds r2, r4, #0
	bl StartArmoryScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08099E64: .4byte gUnknown_08A188E4

	THUMB_FUNC_END func_08099E48

	THUMB_FUNC_START func_08099E68
func_08099E68: @ 0x08099E68
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08099E94  @ gGmData
	ldrb r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L08099E8E
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L08099E8E
	movs r0, #0
	bl func_080C409C
.L08099E8E:
	pop {r0}
	bx r0
	.align 2, 0
.L08099E94: .4byte gGmData

	THUMB_FUNC_END func_08099E68

	THUMB_FUNC_START func_08099E98
func_08099E98: @ 0x08099E98
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	ldr r0, .L08099EF8  @ gUnknown_08A189A4
	bl FindProc
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x44
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq .L08099EFC
	cmp r0, #0
	beq .L08099ED6
	adds r0, r4, #0
	bl EndFaceById
.L08099ED6:
	cmp r6, #0
	beq .L08099F18
	adds r0, r6, #0
	bl GetUnitFid
	adds r1, r0, #0
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	mov r0, r9
	str r0, [sp]
	adds r0, r4, #0
	bl NewFace2
	b .L08099F18
	.align 2, 0
.L08099EF8: .4byte gUnknown_08A189A4
.L08099EFC:
	cmp r6, #0
	beq .L08099F18
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl func_08006618
	adds r0, r4, #0
	mov r1, r9
	bl SetFaceDispById
.L08099F18:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x44
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	mov r1, r9
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099E98

	THUMB_FUNC_START func_08099F50
func_08099F50: @ 0x08099F50
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl func_08099E98
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099F50

	THUMB_FUNC_START StartPrepScreenItemsMenu
StartPrepScreenItemsMenu: @ 0x08099F68
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08099F78  @ gUnknown_08A189A4
	bl SpawnProcLocking
	pop {r1}
	bx r1
	.align 2, 0
.L08099F78: .4byte gUnknown_08A189A4

	THUMB_FUNC_END StartPrepScreenItemsMenu

	THUMB_FUNC_START func_08099F7C
func_08099F7C: @ 0x08099F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq .L08099FAE
	bl ClearIcons
.L08099FAE:
	mov r0, r8
	cmp r0, #0
	beq .L0809A07C
	bl GetUnitItemCount
	str r0, [sp, #4]
	movs r1, #0
	mov r9, r1
	cmp r9, r0
	bge .L0809A07C
	adds r0, r4, #0
	adds r0, #0x16
	str r0, [sp, #8]
	adds r1, r4, #4
	str r1, [sp, #0xc]
	mov sl, r4
.L08099FCE:
	mov r1, r9
	lsls r0, r1, #1
	mov r1, r8
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r0, #4
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq .L08099FEE
	mov r0, r8
	adds r1, r5, #0
	bl CanUnitUseItemPrepScreen
	b .L08099FF6
.L08099FEE:
	mov r0, r8
	adds r1, r5, #0
	bl IsItemDisplayUsable
.L08099FF6:
	movs r7, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809A000
	movs r7, #1
.L0809A000:
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	bne .L0809A02E
	adds r0, r6, #0
	bl ClearText
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_SetColor
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
.L0809A02E:
	adds r0, r5, #0
	bl GetItemIcon
	adds r1, r0, #0
	mov r0, sl
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl PutText
	movs r4, #1
	cmp r7, #0
	bne .L0809A050
	movs r4, #2
.L0809A050:
	adds r0, r5, #0
	bl GetItemUses
	adds r2, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl PutNumberOrBlank
	adds r6, #8
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	str r1, [sp, #0xc]
	movs r0, #0x80
	add sl, r0
	movs r1, #1
	add r9, r1
	ldr r0, [sp, #4]
	cmp r9, r0
	blt .L08099FCE
.L0809A07C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08099F7C

	THUMB_FUNC_START func_0809A08C
func_0809A08C: @ 0x0809A08C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl GetPrepScreenUnitListSize
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r1, r0, #4
	ldrh r0, [r5, #0x34]
	subs r0, r4, r0
	cmp r0, #0x20
	ble .L0809A0C6
	cmp r4, r1
	bne .L0809A0C0
	adds r0, r4, #0
	subs r0, #0x30
	b .L0809A0D6
.L0809A0C0:
	adds r0, r4, #0
	subs r0, #0x20
	b .L0809A0D6
.L0809A0C6:
	cmp r0, #0xf
	bgt .L0809A0D8
	cmp r4, #0
	bne .L0809A0D2
	strh r4, [r5, #0x34]
	b .L0809A0D8
.L0809A0D2:
	adds r0, r6, #0
	subs r0, #0x10
.L0809A0D6:
	strh r0, [r5, #0x34]
.L0809A0D8:
	ldr r1, .L0809A110  @ 0x0000FFD8
	ldrh r2, [r5, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldrh r4, [r5, #0x34]
	bl GetPrepScreenUnitListSize
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl func_080976CC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A110: .4byte 0x0000FFD8

	THUMB_FUNC_END func_0809A08C

	THUMB_FUNC_START func_0809A114
func_0809A114: @ 0x0809A114
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L0809A1C0  @ gUnknown_02013498
	adds r4, r0, r1
	ldr r0, .L0809A1C4  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809A154
	bl func_080C4070
	movs r1, #1
	str r1, [sp, #4]
	cmp r0, #2
	beq .L0809A158
.L0809A154:
	movs r0, #0
	str r0, [sp, #4]
.L0809A158:
	movs r7, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r9, r0
.L0809A160:
	mov r1, r9
	cmp r1, #0
	bne .L0809A16C
	adds r0, r4, #0
	bl ClearText
.L0809A16C:
	ldr r0, [sp]
	adds r5, r0, r7
	bl GetPrepScreenUnitListSize
	cmp r5, r0
	bge .L0809A1FA
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r6, r1, #1
	movs r0, #0x1f
	ands r6, r0
	mov r0, r9
	cmp r0, #0
	bne .L0809A1EA
	adds r0, r5, #0
	bl GetPrepScreenUnitListEntry
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r1, [sp, #4]
	cmp r1, #0
	beq .L0809A1D2
	adds r0, r5, #0
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809A1C8
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	b .L0809A1DA
	.align 2, 0
.L0809A1C0: .4byte gUnknown_02013498
.L0809A1C4: .4byte gGmData
.L0809A1C8:
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColor
	b .L0809A1DA
.L0809A1D2:
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
.L0809A1DA:
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
.L0809A1EA:
	lsls r1, r6, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, .L0809A218  @ gBg2Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
.L0809A1FA:
	adds r4, #8
	adds r7, #1
	cmp r7, #2
	ble .L0809A160
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A218: .4byte gBg2Tm

	THUMB_FUNC_END func_0809A114

	THUMB_FUNC_START func_0809A21C
func_0809A21C: @ 0x0809A21C
	push {lr}
	cmp r0, #0x60
	bhi .L0809A22A
	cmp r1, #0x1f
	ble .L0809A22A
	movs r0, #1
	b .L0809A22C
.L0809A22A:
	movs r0, #0
.L0809A22C:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809A21C

	THUMB_FUNC_START func_0809A230
func_0809A230: @ 0x0809A230
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r1, [r0, #4]
	ldrb r4, [r1, #4]
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	movs r1, #0xf0
	lsls r1, r1, #8
	cmp r0, #0
	beq .L0809A254
	movs r1, #0xc0
	lsls r1, r1, #8
.L0809A254:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r3, r0, #0
	adds r3, r1, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r4, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl PutUnitSpriteForJid
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809A230

	THUMB_FUNC_START func_0809A274
func_0809A274: @ 0x0809A274
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b .L0809A308
.L0809A27C:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x34]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi .L0809A306
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0809A2B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_0809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809A306
.L0809A2B8:
	ldr r0, .L0809A2E8  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809A2EC
	bl func_080C4070
	cmp r0, #2
	bne .L0809A2EC
	adds r0, r6, #0
	bl GetPrepScreenUnitListEntry
	adds r1, r5, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #4
	movs r3, #0xff
	ands r2, r3
	bl func_0809A230
	b .L0809A306
	.align 2, 0
.L0809A2E8: .4byte gGmData
.L0809A2EC:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl GetPrepScreenUnitListEntry
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl PutUnitSprite
.L0809A306:
	adds r6, #1
.L0809A308:
	bl GetPrepScreenUnitListSize
	cmp r6, r0
	blt .L0809A27C
	bl SyncUnitSpriteSheet
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809A274

	THUMB_FUNC_START func_0809A31C
func_0809A31C: @ 0x0809A31C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x38]
	cmp r2, #0
	bgt .L0809A338
	b .L0809A4E6
.L0809A338:
	cmp r3, #0
	bgt .L0809A33E
	b .L0809A4E6
.L0809A33E:
	ldr r4, .L0809A4F8  @ Sprite_8x8
	str r7, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, [sp, #8]
	lsls r0, r0, #3
	mov r9, r0
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r7, #3
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r5, sl
	add r5, r8
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #1
	ldr r3, [sp, #8]
	subs r3, #1
	str r3, [sp, #0x10]
	cmp r5, r3
	bge .L0809A3D6
	ldr r6, .L0809A4FC  @ Sprite_16x8
	ldr r4, [sp, #4]
	adds r4, #8
.L0809A3A8:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt .L0809A3A8
.L0809A3D6:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge .L0809A412
	ldr r6, .L0809A4F8  @ Sprite_8x8
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	subs r5, r1, r5
.L0809A3E6:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne .L0809A3E6
.L0809A412:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble .L0809A44E
	ldr r5, .L0809A4F8  @ Sprite_8x8
	mov r4, sl
	adds r4, #8
	adds r6, r0, #0
	subs r6, #1
.L0809A422:
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #9
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	add r1, r9
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne .L0809A422
.L0809A44E:
	movs r6, #1
	ldr r1, [sp, #0xc]
	cmp r6, r1
	bge .L0809A4E6
	ldr r3, [sp, #8]
	subs r3, #3
	mov r9, r3
	adds r7, #5
	mov r8, r7
.L0809A460:
	movs r5, #1
	adds r0, r6, #1
	str r0, [sp, #0x14]
	cmp r5, r9
	bge .L0809A48A
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
.L0809A470:
	mov r1, r8
	str r1, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, .L0809A500  @ Sprite_32x8
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, r9
	blt .L0809A470
.L0809A48A:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge .L0809A4B4
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
.L0809A498:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, .L0809A4FC  @ Sprite_16x8
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt .L0809A498
.L0809A4B4:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge .L0809A4DE
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	lsls r6, r6, #3
	subs r5, r1, r5
.L0809A4C4:
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, .L0809A4F8  @ Sprite_8x8
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne .L0809A4C4
.L0809A4DE:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt .L0809A460
.L0809A4E6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A4F8: .4byte Sprite_8x8
.L0809A4FC: .4byte Sprite_16x8
.L0809A500: .4byte Sprite_32x8

	THUMB_FUNC_END func_0809A31C

	THUMB_FUNC_START func_0809A504
func_0809A504: @ 0x0809A504
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #0x34]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge .L0809A530
	lsls r6, r1, #0x18
.L0809A518:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	asrs r2, r6, #0x18
	bl func_0809A114
	adds r4, #1
	ldrh r0, [r5, #0x34]
	lsrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt .L0809A518
.L0809A530:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809A504

	THUMB_FUNC_START func_0809A538
func_0809A538: @ 0x0809A538
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl func_08097CC8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge .L0809A56E
	cmp r6, #0x63
	bgt .L0809A56E
.L0809A554:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl UnitRemoveItem
	adds r4, #1
	cmp r4, r7
	bge .L0809A56E
	adds r0, r4, r6
	cmp r0, #0x63
	ble .L0809A554
.L0809A56E:
	cmp r4, #0
	bgt .L0809A576
	movs r0, #0
	b .L0809A578
.L0809A576:
	movs r0, #1
.L0809A578:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809A538

	THUMB_FUNC_START func_0809A580
func_0809A580: @ 0x0809A580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov r9, r2
.L0809A5A0:
	mov r0, r8
	adds r4, r0, r7
	bl GetPrepScreenUnitListSize
	cmp r4, r0
	bge .L0809A61A
	adds r0, r4, #0
	bl GetPrepScreenUnitListEntry
	adds r5, r0, #0
	movs r6, #0
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809A5D2
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809A5D2
	movs r6, #4
	b .L0809A5DE
.L0809A5D2:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq .L0809A5DE
	movs r6, #1
.L0809A5DE:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, .L0809A63C  @ gUnknown_02013598
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetMsg
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, r9
	lsls r1, r1, #1
	ldr r2, .L0809A640  @ gBg2Tm
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
.L0809A61A:
	movs r0, #7
	add r9, r0
	adds r7, #1
	cmp r7, #1
	ble .L0809A5A0
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A63C: .4byte gUnknown_02013598
.L0809A640: .4byte gBg2Tm

	THUMB_FUNC_END func_0809A580

	THUMB_FUNC_START func_0809A644
func_0809A644: @ 0x0809A644
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, .L0809A668  @ gBg2Tm+0x20
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L0809A668: .4byte gBg2Tm+0x20

	THUMB_FUNC_END func_0809A644

	THUMB_FUNC_START PrepScreenUnitSelectDisplaySprites
PrepScreenUnitSelectDisplaySprites: @ 0x0809A66C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r6, #0
	b .L0809A6AE
.L0809A67A:
	asrs r0, r6, #1
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi .L0809A6AC
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl GetPrepScreenUnitListEntry
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutUnitSprite
.L0809A6AC:
	adds r6, #1
.L0809A6AE:
	bl GetPrepScreenUnitListSize
	cmp r6, r0
	blt .L0809A67A
	mov r0, r8
	ldrh r1, [r0, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L0809A758
	ldr r1, .L0809A754  @ gDispIo
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x1a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	movs r4, #5
	negs r4, r4
	ands r0, r4
	movs r2, #8
	orrs r0, r2
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r5
	orrs r0, r3
	ands r0, r4
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r1]
	mov r4, ip
	adds r4, #0x36
	ldrb r0, [r4]
	orrs r0, r5
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	orrs r0, r2
	orrs r0, r6
	strb r0, [r4]
	b .L0809A76E
	.align 2, 0
.L0809A754: .4byte gDispIo
.L0809A758:
	ldr r2, .L0809A7D0  @ gDispIo
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
.L0809A76E:
	mov r0, r8
	adds r0, #0x37
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq .L0809A77E
	adds r0, r1, #1
	strb r0, [r7]
.L0809A77E:
	movs r5, #0x87
	lsls r5, r5, #8
	movs r4, #4
	movs r6, #2
.L0809A786:
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x81
	ldr r3, .L0809A7D4  @ Sprite_32x16
	bl PutSpriteExt
	adds r5, #4
	adds r4, #0x20
	subs r6, #1
	cmp r6, #0
	bge .L0809A786
	ldrb r0, [r7]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L0809A7EC
	mov r0, r8
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0809A7EC
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809A7DC
	ldr r3, .L0809A7D8  @ gUnknown_08A18E62
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
	b .L0809A7EC
	.align 2, 0
.L0809A7D0: .4byte gDispIo
.L0809A7D4: .4byte Sprite_32x16
.L0809A7D8: .4byte gUnknown_08A18E62
.L0809A7DC:
	ldr r3, .L0809A80C  @ gUnknown_08A18E4E
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
.L0809A7EC:
	ldr r3, .L0809A810  @ gUnknown_08A18E34
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8f
	bl PutSpriteExt
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A80C: .4byte gUnknown_08A18E4E
.L0809A810: .4byte gUnknown_08A18E34

	THUMB_FUNC_END PrepScreenUnitSelectDisplaySprites

	THUMB_FUNC_START func_0809A814
func_0809A814: @ 0x0809A814
	push {r4, r5, lr}
	bl ResetText
	ldr r5, .L0809A868  @ gUnknown_02013598
	movs r4, #0xd
.L0809A81E:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0809A81E
	ldr r5, .L0809A86C  @ gUnknown_02013608
	movs r4, #4
.L0809A832:
	adds r0, r5, #0
	movs r1, #7
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0809A832
	ldr r4, .L0809A870  @ gUnknown_02013630
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl InitText
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xc
	bl InitText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A868: .4byte gUnknown_02013598
.L0809A86C: .4byte gUnknown_02013608
.L0809A870: .4byte gUnknown_02013630

	THUMB_FUNC_END func_0809A814

	THUMB_FUNC_START func_0809A874
func_0809A874: @ 0x0809A874
	push {r4, lr}
	bl InitIcons
	bl LoadUiFrameGraphics
	bl LoadObjUiGfx
	movs r0, #4
	bl ApplyIconPalettes
	movs r4, #0xc0
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #8
	bl func_08095A44
	adds r0, r4, #0
	movs r1, #0xf
	bl func_080950E8
	ldr r0, .L0809A8D8  @ gUnknown_08A1B730
	ldr r1, .L0809A8DC  @ 0x06000440
	bl Decompress
	ldr r0, .L0809A8E0  @ gUnknown_08A1B7C8
	ldr r4, .L0809A8E4  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L0809A8E8  @ gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, .L0809A8EC  @ gUnknown_08A1D510
	ldr r1, .L0809A8F0  @ 0x06010800
	bl Decompress
	ldr r0, .L0809A8F4  @ gUnknown_08A1D79C
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A8D8: .4byte gUnknown_08A1B730
.L0809A8DC: .4byte 0x06000440
.L0809A8E0: .4byte gUnknown_08A1B7C8
.L0809A8E4: .4byte gBuf
.L0809A8E8: .4byte gBg1Tm
.L0809A8EC: .4byte gUnknown_08A1D510
.L0809A8F0: .4byte 0x06010800
.L0809A8F4: .4byte gUnknown_08A1D79C

	THUMB_FUNC_END func_0809A874

	THUMB_FUNC_START func_0809A8F8
func_0809A8F8: @ 0x0809A8F8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ApplyUnitSpritePalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, .L0809A928  @ gPal+0x360
	ldr r2, .L0809A92C  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl InitPrepScreenUnitList
	ldr r0, [r4, #0x14]
	bl AtMenu_AutoCapDeployPrepScreenUnits
	bl func_08095928
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A928: .4byte gPal+0x360
.L0809A92C: .4byte 0x01000008

	THUMB_FUNC_END func_0809A8F8

	THUMB_FUNC_START func_0809A930
func_0809A930: @ 0x0809A930
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, .L0809A9E0  @ gBg0Tm+0xCA
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	bl GetUnitFid
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov r9, r3
	str r3, [sp]
	movs r3, #2
	bl PutFaceChibi
	ldr r0, .L0809A9E4  @ gUnknown_02013630
	mov r8, r0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, r9
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809A9E0: .4byte gBg0Tm+0xCA
.L0809A9E4: .4byte gUnknown_02013630

	THUMB_FUNC_END func_0809A930

	THUMB_FUNC_START func_0809A9E8
func_0809A9E8: @ 0x0809A9E8
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl GetPrepScreenUnitListEntry
	bl func_0809A930
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809A9E8

	THUMB_FUNC_START func_0809A9F8
func_0809A9F8: @ 0x0809A9F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl InitIcons
	ldr r4, .L0809AAE4  @ gBg0Tm+0x142
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge .L0809AACC
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov r9, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
.L0809AA38:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemIcon
	adds r1, r0, #0
	mov r0, r9
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, .L0809AAE8  @ gUnknown_02013608
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809AA76
	movs r6, #1
.L0809AA76:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, .L0809AAEC  @ gBg0Tm+0x2
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq .L0809AAA6
	movs r5, #2
.L0809AAA6:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	add sl, r0
	add r9, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt .L0809AA38
.L0809AACC:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AAE4: .4byte gBg0Tm+0x142
.L0809AAE8: .4byte gUnknown_02013608
.L0809AAEC: .4byte gBg0Tm+0x2

	THUMB_FUNC_END func_0809A9F8

	THUMB_FUNC_START func_0809AAF0
func_0809AAF0: @ 0x0809AAF0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	cmp r6, #0
	bne .L0809AB34
	ldr r4, .L0809ABBC  @ gUnknown_02013640
	adds r0, r4, #0
	bl ClearText
	ldr r0, .L0809ABC0  @ 0x000005A1
	bl GetMsg
	ldr r5, .L0809ABC4  @ gBg0Tm+0x5A
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #6
	bl PutDrawText
	ldr r0, .L0809ABC8  @ 0x000005A2
	bl GetMsg
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x29
	bl PutDrawText
.L0809AB34:
	ldr r4, .L0809ABCC  @ gBg0Tm+0x60
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r3, r4, #2
	adds r5, r7, #0
	adds r5, #0x29
	adds r6, r7, #0
	adds r6, #0x2a
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne .L0809AB58
	movs r1, #1
.L0809AB58:
	ldrb r2, [r6]
	ldrb r0, [r5]
	subs r2, r2, r0
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r3, r4, #0
	adds r3, #0x12
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne .L0809AB82
	movs r1, #4
.L0809AB82:
	ldrb r2, [r5]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r3, r4, #0
	adds r3, #0x18
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne .L0809ABA6
	movs r1, #4
.L0809ABA6:
	ldrb r2, [r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809ABBC: .4byte gUnknown_02013640
.L0809ABC0: .4byte 0x000005A1
.L0809ABC4: .4byte gBg0Tm+0x5A
.L0809ABC8: .4byte 0x000005A2
.L0809ABCC: .4byte gBg0Tm+0x60

	THUMB_FUNC_END func_0809AAF0

	THUMB_FUNC_START func_0809ABD0
func_0809ABD0: @ 0x0809ABD0
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r1, [r3]
	ldrb r0, [r0]
	cmp r0, r1
	bls .L0809AC20
	adds r0, r1, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl func_080952EC
	ldr r0, .L0809AC1C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809AC0C
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809AC0C:
	ldrh r1, [r4, #0x2e]
	lsrs r1, r1, #1
	adds r0, r4, #0
	bl func_0809A580
	movs r0, #1
	b .L0809AC34
	.align 2, 0
.L0809AC1C: .4byte gPlaySt
.L0809AC20:
	ldr r0, .L0809AC3C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809AC32
	movs r0, #0x6c
	bl m4aSongNumStart
.L0809AC32:
	movs r0, #0
.L0809AC34:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0809AC3C: .4byte gPlaySt

	THUMB_FUNC_END func_0809ABD0

	THUMB_FUNC_START func_0809AC40
func_0809AC40: @ 0x0809AC40
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809AC94
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl func_08095314
	ldr r0, .L0809AC90  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809AC80
	movs r0, #0x6b
	bl m4aSongNumStart
.L0809AC80:
	ldrh r1, [r5, #0x2e]
	lsrs r1, r1, #1
	adds r0, r5, #0
	bl func_0809A580
	movs r0, #1
	b .L0809ACA8
	.align 2, 0
.L0809AC90: .4byte gPlaySt
.L0809AC94:
	ldr r0, .L0809ACB0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809ACA6
	movs r0, #0x6c
	bl m4aSongNumStart
.L0809ACA6:
	movs r0, #0
.L0809ACA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0809ACB0: .4byte gPlaySt

	THUMB_FUNC_END func_0809AC40

	THUMB_FUNC_START func_0809ACB4
func_0809ACB4: @ 0x0809ACB4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetPrepScreenUnitListEntry
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq .L0809ACF4
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, .L0809ACF0  @ 0x00000C52
.L0809ACE6:
	adds r3, r4, #0
	bl func_08097DA8
	b .L0809AD88
	.align 2, 0
.L0809ACF0: .4byte 0x00000C52
.L0809ACF4:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq .L0809AD76
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809AD34
	adds r0, r5, #0
	bl func_08097E74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809AD34
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, .L0809AD30  @ 0x0000088A
	b .L0809ACE6
	.align 2, 0
.L0809AD30: .4byte 0x0000088A
.L0809AD34:
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809AD6C
	adds r0, r5, #0
	bl func_08097E38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809AD6C
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, .L0809AD68  @ 0x00000889
	b .L0809ACE6
	.align 2, 0
.L0809AD68: .4byte 0x00000889
.L0809AD6C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0809ABD0
	b .L0809AD7E
.L0809AD76:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_0809AC40
.L0809AD7E:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809AD88
	movs r0, #1
	b .L0809AD8A
.L0809AD88:
	movs r0, #0
.L0809AD8A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809ACB4

	THUMB_FUNC_START func_0809AD90
func_0809AD90: @ 0x0809AD90
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble .L0809ADA4
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r1
	ble .L0809ADBA
.L0809ADA4:
	adds r5, r1, #5
	bl GetPrepScreenUnitListSize
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge .L0809ADBE
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r5
	blt .L0809ADBE
.L0809ADBA:
	movs r0, #1
	b .L0809ADC0
.L0809ADBE:
	movs r0, #0
.L0809ADC0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809AD90

	THUMB_FUNC_START func_0809ADC8
func_0809ADC8: @ 0x0809ADC8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl func_0809AD90
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809AE0A
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl GetPrepScreenUnitListSize
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt .L0809ADFC
	cmp r4, #0
	bne .L0809ADF2
	strh r4, [r5, #0x30]
	b .L0809ADF8
.L0809ADF2:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
.L0809ADF8:
	cmp r4, r6
	ble .L0809AE0A
.L0809ADFC:
	cmp r4, r1
	bne .L0809AE04
	subs r0, r4, #5
	b .L0809AE06
.L0809AE04:
	subs r0, r4, #4
.L0809AE06:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
.L0809AE0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809ADC8

	THUMB_FUNC_START func_0809AE10
func_0809AE10: @ 0x0809AE10
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl GetPrepScreenUnitListSize
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble .L0809AE26
	movs r5, #1
.L0809AE26:
	adds r0, r4, #5
	cmp r0, r1
	bge .L0809AE30
	movs r0, #2
	orrs r5, r0
.L0809AE30:
	adds r0, r5, #0
	bl func_080ACD60
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809AE10

	THUMB_FUNC_START func_0809AE3C
func_0809AE3C: @ 0x0809AE3C
	push {r4, lr}
	adds r4, r0, #0
	bl InitPrepScreenUnitList
	bl func_08095394
	bl func_080958FC
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809AE3C

	THUMB_FUNC_START func_0809AE7C
func_0809AE7C: @ 0x0809AE7C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, .L0809AFF8  @ gUnknown_08A181E8
	bl SetupBackgrounds
	ldr r4, .L0809AFFC  @ gDispIo
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl func_0809ADC8
	ldr r0, .L0809B000  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L0809B004  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L0809B008  @ gBg2Tm
	movs r1, #0
	bl TmFill
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl func_0809A814
	bl func_0809A874
	movs r0, #7
	bl EnableBgSync
	bl SetBlendNone
	adds r0, r5, #0
	bl func_0809A8F8
	ldr r0, .L0809B00C  @ PrepScreenUnitSelectDisplaySprites
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl func_080AD51C
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xe0
	movs r2, #0x20
	bl func_08097748
	ldrh r4, [r5, #0x30]
	bl GetPrepScreenUnitListSize
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl func_080976CC
	movs r0, #0x20
	movs r1, #0x8f
	movs r2, #9
	adds r3, r5, #0
	bl ShowRIsInfo
	ldrh r0, [r5, #0x2e]
	bl GetPrepScreenUnitListEntry
	bl func_0809A9F8
	ldrh r0, [r5, #0x2e]
	bl GetPrepScreenUnitListEntry
	bl func_0809A930
	movs r4, #0
.L0809AFC4:
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl func_0809A580
	adds r4, #1
	cmp r4, #5
	ble .L0809AFC4
	adds r0, r5, #0
	movs r1, #0
	bl func_0809AAF0
	adds r0, r5, #0
	bl StartGreenText
	ldr r0, .L0809B010  @ 0x06014800
	movs r1, #5
	bl LoadHelpBoxGfx
	bl RestartScreenMenuScrollingBg
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809AFF8: .4byte gUnknown_08A181E8
.L0809AFFC: .4byte gDispIo
.L0809B000: .4byte gBg0Tm
.L0809B004: .4byte gBg1Tm
.L0809B008: .4byte gBg2Tm
.L0809B00C: .4byte PrepScreenUnitSelectDisplaySprites
.L0809B010: .4byte 0x06014800

	THUMB_FUNC_END func_0809AE7C

	THUMB_FUNC_START func_0809B014
func_0809B014: @ 0x0809B014
	push {lr}
	bl Delete6CMenuScroll
	bl EndAllParallelWorkers
	bl func_080AD2D4
	bl EndPrepScreenHandCursor
	bl HideRIsInfo
	bl func_080ACDDC
	bl EndScreenMenuScrollingBg
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B014

	THUMB_FUNC_START func_0809B038
func_0809B038: @ 0x0809B038
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq .L0809B046
	b .L0809B25A
.L0809B046:
	ldr r4, .L0809B094  @ gKeySt
	ldr r2, [r4]
	ldrh r6, [r2, #6]
	adds r3, r5, #0
	adds r3, #0x36
	movs r7, #4
	strb r7, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809B066
	ldrh r6, [r2, #4]
	movs r0, #8
	strb r0, [r3]
.L0809B066:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L0809B0BC
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0809B09C
	ldr r0, .L0809B098  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0809B08A
	b .L0809B2D4
.L0809B08A:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0809B2D4
	.align 2, 0
.L0809B094: .4byte gKeySt
.L0809B098: .4byte gPlaySt
.L0809B09C:
	ldr r0, .L0809B0B8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B0AE
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809B0AE:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b .L0809B2D4
	.align 2, 0
.L0809B0B8: .4byte gPlaySt
.L0809B0BC:
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809B0E4
	ldr r0, .L0809B0E0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B0D6
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809B0D6:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b .L0809B2D4
	.align 2, 0
.L0809B0E0: .4byte gPlaySt
.L0809B0E4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809B0F8
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b .L0809B2D4
.L0809B0F8:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809B11A
	adds r0, r5, #0
	bl func_0809ACB4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809B110
	b .L0809B2D4
.L0809B110:
	adds r0, r5, #0
	movs r1, #1
	bl func_0809AAF0
	b .L0809B2D4
.L0809B11A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809B144
	ldr r0, .L0809B140  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B134
	movs r0, #0x6b
	bl m4aSongNumStart
.L0809B134:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b .L0809B2D4
	.align 2, 0
.L0809B140: .4byte gPlaySt
.L0809B144:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq .L0809B15A
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809B15A
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
.L0809B15A:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq .L0809B17E
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0809B17E
	ldrh r4, [r5, #0x2e]
	bl GetPrepScreenUnitListSize
	subs r0, #1
	cmp r4, r0
	bge .L0809B17E
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
.L0809B17E:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq .L0809B190
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt .L0809B190
	strh r0, [r5, #0x2e]
.L0809B190:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq .L0809B1AC
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl GetPrepScreenUnitListSize
	subs r0, #1
	cmp r4, r0
	bgt .L0809B1AC
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
.L0809B1AC:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	bne .L0809B1B6
	b .L0809B2D4
.L0809B1B6:
	ldrh r0, [r5, #0x2e]
	bl GetPrepScreenUnitListEntry
	bl func_0809A9F8
	ldr r0, .L0809B224  @ func_0809A9E8
	movs r1, #1
	adds r2, r5, #0
	bl func_080ACE20
	ldr r0, .L0809B228  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B1DC
	movs r0, #0x65
	bl m4aSongNumStart
.L0809B1DC:
	adds r0, r5, #0
	bl func_0809AD90
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809B22C
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bcs .L0809B1FC
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r5, #0
	bl func_0809A580
.L0809B1FC:
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bls .L0809B210
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, #6
	adds r0, r5, #0
	bl func_0809A580
.L0809B210:
	ldrh r0, [r5, #0x2e]
	movs r1, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	bl func_080AD4E4
	b .L0809B252
	.align 2, 0
.L0809B224: .4byte func_0809A9E8
.L0809B228: .4byte gPlaySt
.L0809B22C:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl func_080AD51C
.L0809B252:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq .L0809B2D4
.L0809B25A:
	ldrh r3, [r5, #0x2e]
	ldrh r2, [r5, #0x2c]
	cmp r3, r2
	bcs .L0809B26E
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
.L0809B26E:
	cmp r3, r2
	bls .L0809B27E
	adds r1, r5, #0
	adds r1, #0x36
	ldrh r0, [r5, #0x30]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
.L0809B27E:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L0809B2A4
	lsrs r0, r1, #4
	subs r0, #1
	bl func_0809A644
	ldrh r0, [r5, #0x30]
	lsrs r0, r0, #4
	adds r0, #6
	bl func_0809A644
	adds r0, r5, #0
	bl func_0809AE10
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
.L0809B2A4:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r4, [r5, #0x30]
	bl GetPrepScreenUnitListSize
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl func_080976CC
.L0809B2D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B038

	THUMB_FUNC_START func_0809B2DC
func_0809B2DC: @ 0x0809B2DC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x34]
	adds r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bne .L0809B2FA
	adds r0, r4, #0
	bl Proc_Break
.L0809B2FA:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L0809B31C
	lsrs r0, r1, #4
	subs r0, #1
	bl func_0809A644
.L0809B31C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B2DC

	THUMB_FUNC_START func_0809B324
func_0809B324: @ 0x0809B324
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L0809B33C
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl func_0809A580
.L0809B33C:
	ldrh r1, [r4, #0x34]
	subs r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	subs r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne .L0809B354
	adds r0, r4, #0
	bl Proc_Break
.L0809B354:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B324

	THUMB_FUNC_START nullsub_21
nullsub_21: @ 0x0809B36C
	bx lr

	THUMB_FUNC_END nullsub_21

	THUMB_FUNC_START func_0809B370
func_0809B370: @ 0x0809B370
	push {lr}
	bl nullsub_21
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl func_080AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B370

	THUMB_FUNC_START func_0809B388
func_0809B388: @ 0x0809B388
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl func_080AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B388

	THUMB_FUNC_START func_0809B3B4
func_0809B3B4: @ 0x0809B3B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809B404  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809B3D8
	ldr r0, .L0809B408  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B3D8
	movs r0, #0x6c
	bl m4aSongNumStart
.L0809B3D8:
	ldr r0, .L0809B404  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0809B3FE
	ldr r0, .L0809B408  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B3F8
	movs r0, #0x65
	bl m4aSongNumStart
.L0809B3F8:
	adds r0, r4, #0
	bl Proc_Break
.L0809B3FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B404: .4byte gKeySt
.L0809B408: .4byte gPlaySt

	THUMB_FUNC_END func_0809B3B4

	THUMB_FUNC_START func_0809B40C
func_0809B40C: @ 0x0809B40C
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl GetPrepScreenUnitListEntry
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl func_080953C0
	bl EndScreenMenuScrollingBg
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B40C

	THUMB_FUNC_START func_0809B438
func_0809B438: @ 0x0809B438
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B438

	THUMB_FUNC_START func_0809B458
func_0809B458: @ 0x0809B458
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetPrepScreenUnitListEntry
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl func_080953C0
	adds r0, r4, #0
	bl func_080920DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B458

	THUMB_FUNC_START func_0809B478
func_0809B478: @ 0x0809B478
	push {r4, r5, lr}
	adds r4, r0, #0
	bl func_080956A8
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
.L0809B48C:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L0809B4AE
	ldr r0, [r1]
	cmp r0, #0
	beq .L0809B4AE
	ldr r0, [r1, #0xc]
	ldr r1, .L0809B4BC  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L0809B4AE
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
.L0809B4AE:
	adds r5, #1
	cmp r5, #0x3f
	ble .L0809B48C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809B4BC: .4byte 0x0001000C

	THUMB_FUNC_END func_0809B478

	THUMB_FUNC_START func_0809B4C0
func_0809B4C0: @ 0x0809B4C0
	ldr r2, .L0809B4E0  @ gDispIo
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
	bx lr
	.align 2, 0
.L0809B4E0: .4byte gDispIo

	THUMB_FUNC_END func_0809B4C0

	THUMB_FUNC_START func_0809B4E4
func_0809B4E4: @ 0x0809B4E4
	ldr r2, .L0809B500  @ gDispIo
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
	bx lr
	.align 2, 0
.L0809B500: .4byte gDispIo

	THUMB_FUNC_END func_0809B4E4

	THUMB_FUNC_START func_0809B504
func_0809B504: @ 0x0809B504
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenConfig
	ldrh r0, [r4, #0x2e]
	bl GetPrepScreenUnitListEntry
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B504

	THUMB_FUNC_START func_0809B520
func_0809B520: @ 0x0809B520
	push {r4, lr}
	adds r4, r0, #0
	bl InitPrepScreenUnitList
	bl func_08095674
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B520

	THUMB_FUNC_START func_0809B538
func_0809B538: @ 0x0809B538
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r1, r1, #1
	adds r4, r0, #0
	adds r4, #0x1e
	adds r4, r4, r1
	ldrh r5, [r4]
	lsls r3, r3, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r4]
	strh r5, [r1]
	bl UnitRemoveInvalidItems
	adds r0, r6, #0
	bl UnitRemoveInvalidItems
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B538

	THUMB_FUNC_START func_0809B564
func_0809B564: @ 0x0809B564
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809B5C8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0809B5E8
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L0809B582
	b .L0809B744
.L0809B582:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq .L0809B5B0
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne .L0809B5B0
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq .L0809B5B0
	movs r0, #5
	cmp r2, #5
	beq .L0809B5AE
	adds r0, r2, #1
.L0809B5AE:
	adds r2, r0, #0
.L0809B5B0:
	cmp r2, #0
	bgt .L0809B5B6
	b .L0809B744
.L0809B5B6:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble .L0809B5CC
	adds r0, r1, #0
	subs r0, #8
	b .L0809B5CE
	.align 2, 0
.L0809B5C8: .4byte gKeySt
.L0809B5CC:
	subs r0, r2, #1
.L0809B5CE:
	str r0, [r4, #0x34]
	ldr r0, .L0809B5E4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0809B5DE
	b .L0809B738
.L0809B5DE:
	movs r0, #0x67
	b .L0809B734
	.align 2, 0
.L0809B5E4: .4byte gPlaySt
.L0809B5E8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0809B658
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq .L0809B5FC
	b .L0809B744
.L0809B5FC:
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq .L0809B62A
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne .L0809B62A
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq .L0809B62A
	movs r0, #5
	cmp r2, #5
	beq .L0809B628
	adds r0, r2, #1
.L0809B628:
	adds r2, r0, #0
.L0809B62A:
	cmp r2, #0
	bgt .L0809B630
	b .L0809B744
.L0809B630:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble .L0809B640
	adds r0, r1, #0
	adds r0, #8
	b .L0809B642
.L0809B640:
	adds r0, r2, #7
.L0809B642:
	str r0, [r4, #0x34]
	ldr r0, .L0809B654  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B738
	movs r0, #0x67
	b .L0809B734
	.align 2, 0
.L0809B654: .4byte gPlaySt
.L0809B658:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0809B6C4
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq .L0809B694
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne .L0809B694
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq .L0809B694
	movs r0, #5
	cmp r3, #5
	beq .L0809B692
	adds r0, r3, #1
.L0809B692:
	adds r3, r0, #0
.L0809B694:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble .L0809B6A4
	subs r0, r2, #1
	str r0, [r4, #0x34]
	b .L0809B726
.L0809B6A4:
	ldr r0, .L0809B6C0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0809B744
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	b .L0809B726
	.align 2, 0
.L0809B6C0: .4byte gKeySt
.L0809B6C4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L0809B744
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq .L0809B700
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne .L0809B700
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq .L0809B700
	movs r0, #5
	cmp r3, #5
	beq .L0809B6FE
	adds r0, r3, #1
.L0809B6FE:
	adds r3, r0, #0
.L0809B700:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge .L0809B712
	adds r0, r2, #1
	str r0, [r4, #0x34]
	b .L0809B726
.L0809B712:
	ldr r0, .L0809B73C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L0809B744
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
.L0809B726:
	ldr r0, .L0809B740  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809B738
	movs r0, #0x66
.L0809B734:
	bl m4aSongNumStart
.L0809B738:
	movs r0, #1
	b .L0809B746
	.align 2, 0
.L0809B73C: .4byte gKeySt
.L0809B740: .4byte gPlaySt
.L0809B744:
	movs r0, #0
.L0809B746:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809B564

	THUMB_FUNC_START func_0809B74C
func_0809B74C: @ 0x0809B74C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov r9, r1
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge .L0809B820
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
.L0809B786:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq .L0809B7A2
	mov r0, sl
	adds r1, r6, #0
	bl CanUnitUseItemPrepScreen
	b .L0809B7AA
.L0809B7A2:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUsable
.L0809B7AA:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r9
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne .L0809B7C8
	movs r2, #1
.L0809B7C8:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r9
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl PutDrawText
	mov r4, r8
	adds r4, #0x16
	movs r7, #1
	cmp r5, #0
	beq .L0809B7E4
	movs r7, #2
.L0809B7E4:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r6, #0
	bl GetItemIcon
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	movs r0, #8
	add r9, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt .L0809B786
.L0809B820:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B74C

	THUMB_FUNC_START func_0809B830
func_0809B830: @ 0x0809B830
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge .L0809B866
.L0809B844:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt .L0809B844
.L0809B866:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809B830

	THUMB_FUNC_START func_0809B86C
func_0809B86C: @ 0x0809B86C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, .L0809B964  @ gUnknown_08205C44
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, .L0809B968  @ gUnknown_08A181E8
	ldrh r0, [r0]
	bl SetupBackgrounds
	add r0, sp, #8
	bl SetFaceConfig
	ldr r3, .L0809B96C  @ gDispIo
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl LoadObjUiGfx
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
	ldr r0, .L0809B970  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl RestartScreenMenuScrollingBg
	ldr r0, .L0809B974  @ gUnknown_02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
.L0809B932:
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r0, r6, #0
	movs r1, #7
	bl InitTextDb
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0809B932
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x40]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0809B978
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x34]
	b .L0809B992
	.align 2, 0
.L0809B964: .4byte gUnknown_08205C44
.L0809B968: .4byte gUnknown_08A181E8
.L0809B96C: .4byte gDispIo
.L0809B970: .4byte 0x06014000
.L0809B974: .4byte gUnknown_02013510
.L0809B978:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne .L0809B98C
	movs r0, #8
	mov r2, r8
	str r0, [r2, #0x34]
	b .L0809B992
.L0809B98C:
	movs r0, #0
	mov r3, r8
	str r0, [r3, #0x34]
.L0809B992:
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	bl GetUnitFid
	adds r1, r0, #0
	movs r4, #4
	negs r4, r4
	ldr r0, .L0809BB24  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl NewFace2
	mov r1, r8
	ldr r0, [r1, #0x30]
	bl GetUnitFid
	adds r1, r0, #0
	ldr r0, .L0809BB28  @ 0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl NewFace2
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #7
	bl EnableBgSync
	mov r2, r8
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r7, r0, #0
	bl GetStringTextLen
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, .L0809BB2C  @ gBg0Tm
	mov r9, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, r9
	movs r2, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r7, r0, #0
	bl GetStringTextLen
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, r9
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl PutDrawText
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, r9
	ldr r4, .L0809BB30  @ gUnknown_02013510
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl func_0809B74C
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, r9
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl func_0809B74C
	mov r0, r8
	bl func_080AC9C0
	mov r0, r8
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl func_080AD51C
	movs r0, #0xc8
	movs r1, #0x93
	movs r2, #2
	mov r3, r8
	bl ShowRIsInfo
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r4, #1
	negs r4, r4
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl func_080ADBFC
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl func_080ADBFC
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809BB24: .4byte 0x00000203
.L0809BB28: .4byte 0x00000202
.L0809BB2C: .4byte gBg0Tm
.L0809BB30: .4byte gUnknown_02013510

	THUMB_FUNC_END func_0809B86C

	THUMB_FUNC_START func_0809BB34
func_0809BB34: @ 0x0809BB34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq .L0809BB60
	ldr r0, .L0809BB5C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0809BB54
	b .L0809BDB8
.L0809BB54:
	bl MoveableHelpBox_OnEnd
	movs r0, #0xff
	b .L0809BE18
	.align 2, 0
.L0809BB5C: .4byte gKeySt
.L0809BB60:
	ldr r0, .L0809BB9C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809BBA0
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne .L0809BB90
	b .L0809BE1A
.L0809BB90:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b .L0809BE10
	.align 2, 0
.L0809BB9C: .4byte gKeySt
.L0809BBA0:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne .L0809BBA8
	b .L0809BD00
.L0809BBA8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0809BBB2
	b .L0809BCB8
.L0809BBB2:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl func_08097EA0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809BBF4
	movs r1, #1
	negs r1, r1
	ldr r2, .L0809BBF0  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r6, #0
	bl func_08097DA8
	b .L0809BE1A
	.align 2, 0
.L0809BBF0: .4byte 0x0000088B
.L0809BBF4:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl func_0809B538
	ldr r4, .L0809BC58  @ gBg0Tm+0x244
	ldr r5, .L0809BC5C  @ gUnknown_02013510
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl func_0809B74C
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl func_0809B74C
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne .L0809BC60
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b .L0809BC74
	.align 2, 0
.L0809BC58: .4byte gBg0Tm+0x244
.L0809BC5C: .4byte gUnknown_02013510
.L0809BC60:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt .L0809BC76
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
.L0809BC74:
	str r0, [r6, #0x38]
.L0809BC76:
	ldr r0, .L0809BCB4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809BC88
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809BC88:
	movs r0, #0
	bl func_080ACA84
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl func_080AD51C
	b .L0809BE1A
	.align 2, 0
.L0809BCB4: .4byte gPlaySt
.L0809BCB8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne .L0809BCC2
	b .L0809BDB8
.L0809BCC2:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl func_080AD51C
	ldr r0, .L0809BCFC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809BCF4
	movs r0, #0x6b
	bl m4aSongNumStart
.L0809BCF4:
	movs r0, #0
	bl func_080ACA84
	b .L0809BE1A
	.align 2, 0
.L0809BCFC: .4byte gPlaySt
.L0809BD00:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809BD90
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl func_080AC9D4
	cmp r4, #4
	bgt .L0809BD50
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b .L0809BD58
.L0809BD50:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
.L0809BD58:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl func_080AD51C
	ldr r0, .L0809BD8C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809BE1A
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L0809BE1A
	.align 2, 0
.L0809BD8C: .4byte gPlaySt
.L0809BD90:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809BDB8
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, .L0809BDB4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809BE1A
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809BE1A
	.align 2, 0
.L0809BDB4: .4byte gPlaySt
.L0809BDB8:
	adds r0, r6, #0
	bl func_0809B564
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809BE1A
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl func_080AD51C
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq .L0809BE1A
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq .L0809BE1A
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
.L0809BE10:
	adds r1, #0x48
	bl ShowItemHelpBox
	ldr r0, [r6, #0x34]
.L0809BE18:
	str r0, [r6, #0x3c]
.L0809BE1A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809BB34

	THUMB_FUNC_START func_0809BE24
func_0809BE24: @ 0x0809BE24
	push {lr}
	bl EndScreenMenuScrollingBg
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809BE24

	THUMB_FUNC_START StartPrepScreenTrade
StartPrepScreenTrade: @ 0x0809BE3C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, .L0809BE5C  @ gUnknown_08A1901C
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	negs r1, r1
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809BE5C: .4byte gUnknown_08A1901C

	THUMB_FUNC_END StartPrepScreenTrade

	THUMB_FUNC_START func_0809BE60
func_0809BE60: @ 0x0809BE60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, .L0809BE7C  @ gUnknown_08A1901C
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809BE7C: .4byte gUnknown_08A1901C

	THUMB_FUNC_END func_0809BE60

	THUMB_FUNC_START func_0809BE80
func_0809BE80: @ 0x0809BE80
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, .L0809BEAC  @ gKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq .L0809BEC2
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble .L0809BEB0
	subs r0, #1
	str r0, [r4, #0x30]
	b .L0809BEEE
	.align 2, 0
.L0809BEAC: .4byte gKeySt
.L0809BEB0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809BF08
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b .L0809BEEE
.L0809BEC2:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809BF08
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge .L0809BEE0
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b .L0809BEEE
.L0809BEE0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809BF08
	str r6, [r4, #0x30]
.L0809BEEE:
	ldr r0, .L0809BF04  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809BF00
	movs r0, #0x66
	bl m4aSongNumStart
.L0809BF00:
	movs r0, #1
	b .L0809BF0A
	.align 2, 0
.L0809BF04: .4byte gPlaySt
.L0809BF08:
	movs r0, #0
.L0809BF0A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809BE80

	THUMB_FUNC_START DrawPrepScreenItemUseStatLabels
DrawPrepScreenItemUseStatLabels: @ 0x0809BF10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, .L0809BF78  @ gUnknown_02013498
	adds r5, r6, #0
	movs r4, #7
.L0809BF20:
	adds r0, r5, #0
	bl ClearText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0809BF20
	ldr r0, .L0809BF7C  @ 0x000004E9
	bl GetMsg
	adds r1, r6, #0
	adds r6, #8
	ldr r5, .L0809BF80  @ gBg2Tm+0xE0
	movs r7, #0
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r0, r8
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq .L0809BF88
	ldr r0, .L0809BF84  @ 0x000004FF
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b .L0809BFA4
	.align 2, 0
.L0809BF78: .4byte gUnknown_02013498
.L0809BF7C: .4byte 0x000004E9
.L0809BF80: .4byte gBg2Tm+0xE0
.L0809BF84: .4byte 0x000004FF
.L0809BF88:
	ldr r0, .L0809C090  @ 0x000004FE
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
.L0809BFA4:
	ldr r0, .L0809C094  @ 0x000004EC
	bl GetMsg
	adds r1, r6, #0
	adds r6, #8
	ldr r7, .L0809C098  @ gBg2Tm+0x1E0
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, .L0809C09C  @ 0x000004ED
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, .L0809C0A0  @ 0x000004EE
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, .L0809C0A4  @ 0x000004EF
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x72
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	movs r0, #0x9e
	lsls r0, r0, #3
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xe
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	ldr r0, .L0809C0A8  @ 0x000004F7
	bl GetMsg
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8e
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, .L0809C0AC  @ 0xFFFFFE8A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl PutDrawText
	ldr r1, .L0809C0B0  @ 0xFFFFFE82
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809C090: .4byte 0x000004FE
.L0809C094: .4byte 0x000004EC
.L0809C098: .4byte gBg2Tm+0x1E0
.L0809C09C: .4byte 0x000004ED
.L0809C0A0: .4byte 0x000004EE
.L0809C0A4: .4byte 0x000004EF
.L0809C0A8: .4byte 0x000004F7
.L0809C0AC: .4byte 0xFFFFFE8A
.L0809C0B0: .4byte 0xFFFFFE82

	THUMB_FUNC_END DrawPrepScreenItemUseStatLabels

	THUMB_FUNC_START DrawPrepScreenItemUseStatBars
DrawPrepScreenItemUseStatBars: @ 0x0809C0B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	adds r5, r0, #0
	mov r8, r1
	movs r0, #2
	bl UnpackUiBarPalette
	add r4, sp, #0xc
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r3, r0, #3
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq .L0809C0E8
	adds r0, r3, #0
	movs r1, #0x3c
	b .L0809C0EC
.L0809C0E8:
	adds r0, r2, #0
	movs r1, #5
.L0809C0EC:
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	bl GetUnitPower
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetUnitSkill
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetUnitSpeed
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetUnitLuck
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl GetUnitDefense
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl GetUnitResistance
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [r5, #4]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x24]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x28]
	movs r5, #0
	add r6, sp, #0xc
	movs r7, #0xe0
	lsls r7, r7, #7
.L0809C1BE:
	mov r4, r8
	asrs r4, r5
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq .L0809C200
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0x92
	asrs r3, r5, #2
	lsls r1, r3, #3
	subs r1, r1, r3
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, .L0809C1FC  @ gBg0Tm
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #4
	movs r3, #0xc0
	lsls r3, r3, #6
	bl func_08086B2C
	b .L0809C22E
	.align 2, 0
.L0809C1FC: .4byte gBg0Tm
.L0809C200:
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0x92
	asrs r3, r5, #2
	lsls r1, r3, #3
	subs r1, r1, r3
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, .L0809C250  @ gBg0Tm
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r3, #0x80
	lsls r3, r3, #6
	bl func_08086B2C
.L0809C22E:
	adds r6, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r5, #1
	cmp r5, #7
	ble .L0809C1BE
	movs r0, #1
	bl EnableBgSync
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809C250: .4byte gBg0Tm

	THUMB_FUNC_END DrawPrepScreenItemUseStatBars

	THUMB_FUNC_START DrawPrepScreenItemUseStatValues
DrawPrepScreenItemUseStatValues: @ 0x0809C254
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, .L0809C274  @ gBg2Tm+0xE8
	bl GetUnitCurrentHp
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne .L0809C278
	cmp r2, #0x78
	beq .L0809C27C
	b .L0809C280
	.align 2, 0
.L0809C274: .4byte gBg2Tm+0xE8
.L0809C278:
	cmp r2, #0x3c
	bne .L0809C280
.L0809C27C:
	movs r5, #4
	b .L0809C282
.L0809C280:
	movs r5, #2
.L0809C282:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	ldr r5, .L0809C3E0  @ gBg2Tm+0x168
	adds r0, r4, #0
	bl GetUnitPower
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne .L0809C2AA
	movs r6, #4
.L0809C2AA:
	adds r0, r4, #0
	bl GetUnitPower
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x80
	adds r0, r4, #0
	bl GetUnitSkill
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne .L0809C2D4
	movs r6, #4
.L0809C2D4:
	adds r0, r4, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r5, r0
	adds r0, r4, #0
	bl GetUnitSpeed
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne .L0809C300
	movs r6, #4
.L0809C300:
	adds r0, r4, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	subs r7, #0x72
	adds r0, r4, #0
	bl GetUnitLuck
	movs r6, #2
	cmp r0, #0x1e
	bne .L0809C322
	movs r6, #4
.L0809C322:
	adds r0, r4, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0xe
	adds r0, r4, #0
	bl GetUnitDefense
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne .L0809C34C
	movs r6, #4
.L0809C34C:
	adds r0, r4, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x8e
	adds r0, r4, #0
	bl GetUnitResistance
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne .L0809C376
	movs r6, #4
.L0809C376:
	adds r0, r4, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	movs r1, #0x87
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r2, [r4, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	movs r1, #2
	cmp r3, r0
	bne .L0809C3AE
	movs r1, #4
.L0809C3AE:
	adds r0, r6, #0
	adds r2, r3, #0
	bl PutNumberOrBlank
	ldr r1, .L0809C3E4  @ 0xFFFFFEFE
	adds r0, r5, r1
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, .L0809C3E8  @ 0xFFFFFF00
	adds r0, r5, r1
	movs r2, #8
	ldrsb r2, [r4, r2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809C3E0: .4byte gBg2Tm+0x168
.L0809C3E4: .4byte 0xFFFFFEFE
.L0809C3E8: .4byte 0xFFFFFF00

	THUMB_FUNC_END DrawPrepScreenItemUseStatValues

	THUMB_FUNC_START DrawPrepScreenItemUseItemUseDesc
DrawPrepScreenItemUseItemUseDesc: @ 0x0809C3EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, .L0809C46C  @ gUnknown_02013560
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r0, #8
	bl ClearText
	adds r4, #0x20
	adds r0, r4, #0
	bl ClearText
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq .L0809C4A2
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemUseDescMsg
	adds r5, r0, #0
	mov r1, sp
	ldr r0, .L0809C470  @ gUnknown_08205C64
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	cmp r5, #0
	beq .L0809C4A2
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq .L0809C478
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColor
	ldr r0, [sp, #8]
	movs r1, #0
	bl Text_SetColor
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	ldr r2, .L0809C474  @ gBg0Tm+0x31E
	mov r0, sp
	movs r3, #3
	bl func_08008A3C
	b .L0809C4A2
	.align 2, 0
.L0809C46C: .4byte gUnknown_02013560
.L0809C470: .4byte gUnknown_08205C64
.L0809C474: .4byte gBg0Tm+0x31E
.L0809C478:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColor
	ldr r0, [sp, #8]
	movs r1, #1
	bl Text_SetColor
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	ldr r2, .L0809C4B0  @ gBg0Tm+0x31E
	mov r0, sp
	movs r3, #3
	bl func_08008A3C
.L0809C4A2:
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809C4B0: .4byte gBg0Tm+0x31E

	THUMB_FUNC_END DrawPrepScreenItemUseItemUseDesc

	THUMB_FUNC_START PrepScreenItemUseScreen_OnUpdateSMS
PrepScreenItemUseScreen_OnUpdateSMS: @ 0x0809C4B4
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	movs r2, #0xa
	bl PutUnitSpriteForJid
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenItemUseScreen_OnUpdateSMS

	THUMB_FUNC_START PrepScreenItemUseScreen_OnInit
PrepScreenItemUseScreen_OnInit: @ 0x0809C4D8
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr

	THUMB_FUNC_END PrepScreenItemUseScreen_OnInit

	THUMB_FUNC_START PrepScreenItemUseScreen_InitDisplay
PrepScreenItemUseScreen_InitDisplay: @ 0x0809C4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, .L0809C7E0  @ gUnknown_08205C70
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r4, r6}
	stm r1!, {r4, r6}
	ldr r4, .L0809C7E4  @ gDispIo
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldr r0, .L0809C7E8  @ gUnknown_08A181E8
	bl SetupBackgrounds
	add r0, sp, #8
	bl SetFaceConfig
	movs r0, #0xff
	str r0, [r7, #0x34]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl LoadObjUiGfx
	bl ApplyUnitSpritePalettes
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
	ldr r0, .L0809C7EC  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl RestartScreenMenuScrollingBg
	ldr r5, .L0809C7F0  @ gUnknown_02013510
	movs r4, #4
.L0809C5B6:
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0809C5B6
	ldr r5, .L0809C7F4  @ gUnknown_02013498
	movs r4, #7
.L0809C5CA:
	adds r0, r5, #0
	movs r1, #3
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0809C5CA
	ldr r0, .L0809C7F4  @ gUnknown_02013498
	mov sl, r0
	adds r0, #0x40
	movs r1, #8
	bl InitText
	mov r0, sl
	adds r0, #0xc8
	movs r1, #0xf
	bl InitText
	mov r0, sl
	adds r0, #0xd0
	movs r1, #0xf
	bl InitText
	mov r0, sl
	adds r0, #0xe8
	movs r1, #0xf
	bl InitText
	mov r0, sl
	adds r0, #0xd8
	movs r1, #0xe
	bl InitText
	mov r0, sl
	adds r0, #0xe0
	movs r1, #8
	bl InitText
	ldr r0, [r7, #0x2c]
	bl DrawPrepScreenItemUseStatLabels
	ldr r0, [r7, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r7, #0x2c]
	bl GetUnitFid
	adds r1, r0, #0
	movs r3, #4
	negs r3, r3
	ldr r0, .L0809C7F8  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl NewFace2
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl func_08098C8C
	ldr r0, .L0809C7FC  @ gUnknown_08A1BAB8
	ldr r1, .L0809C800  @ 0x06000440
	bl Decompress
	ldr r0, .L0809C804  @ gUnknown_08A1BAE4
	ldr r4, .L0809C808  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L0809C80C  @ gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r2, #1
	negs r2, r2
	movs r0, #0
	movs r3, #1
	bl func_080ADBFC
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	bl GetStringTextLen
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, .L0809C810  @ gBg0Tm
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl func_080AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	ldr r0, .L0809C814  @ PrepScreenItemUseScreen_OnUpdateSMS
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r6, .L0809C7E4  @ gDispIo
	ldrb r0, [r6, #1]
	movs r3, #0x20
	mov ip, r3
	mov r4, ip
	orrs r0, r4
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x5e
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x92
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r6
	mov r9, r0
	ldrb r1, [r0]
	movs r2, #1
	mov r8, r2
	mov r3, r8
	orrs r1, r3
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	ldr r6, .L0809C818  @ gUnknown_030030B6
	ldrb r0, [r6]
	mov r6, r8
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, ip
	orrs r1, r2
	mov r3, r9
	strb r1, [r3]
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	ldr r4, .L0809C818  @ gUnknown_030030B6
	strb r0, [r4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	movs r6, #0
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc0
	movs r1, #0x90
	movs r2, #9
	adds r3, r7, #0
	bl ShowRIsInfo
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	mov r1, sl
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, .L0809C81C  @ gBg0Tm+0x244
	movs r3, #1
	bl func_0809B74C
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0xb
	movs r3, #0x80
	lsls r3, r3, #4
	bl func_080AD51C
	ldr r0, [r7, #0x2c]
	bl GetUnitSpriteId
	bl UseUnitSprite
	bl ForceSyncUnitSpriteSheet
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809C7E0: .4byte gUnknown_08205C70
.L0809C7E4: .4byte gDispIo
.L0809C7E8: .4byte gUnknown_08A181E8
.L0809C7EC: .4byte 0x06014000
.L0809C7F0: .4byte gUnknown_02013510
.L0809C7F4: .4byte gUnknown_02013498
.L0809C7F8: .4byte 0x00000203
.L0809C7FC: .4byte gUnknown_08A1BAB8
.L0809C800: .4byte 0x06000440
.L0809C804: .4byte gUnknown_08A1BAE4
.L0809C808: .4byte gBuf
.L0809C80C: .4byte gBg1Tm
.L0809C810: .4byte gBg0Tm
.L0809C814: .4byte PrepScreenItemUseScreen_OnUpdateSMS
.L0809C818: .4byte gUnknown_030030B6
.L0809C81C: .4byte gBg0Tm+0x244

	THUMB_FUNC_END PrepScreenItemUseScreen_InitDisplay

	THUMB_FUNC_START PrepScreenItemUseScreen_OnIdle
PrepScreenItemUseScreen_OnIdle: @ 0x0809C820
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq .L0809C848
	ldr r0, .L0809C844  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809C8F0
	bl MoveableHelpBox_OnEnd
	movs r0, #0xff
	b .L0809C938
	.align 2, 0
.L0809C844: .4byte gKeySt
.L0809C848:
	ldr r0, .L0809C8A8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0809C91C
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809C8C8
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq .L0809C8B0
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl func_080AC9D4
	str r5, [r4, #0x3c]
	ldr r0, .L0809C8AC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809C89E
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809C89E:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b .L0809C93A
	.align 2, 0
.L0809C8A8: .4byte gKeySt
.L0809C8AC: .4byte gPlaySt
.L0809C8B0:
	ldr r0, .L0809C8C4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809C93A
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0809C93A
	.align 2, 0
.L0809C8C4: .4byte gPlaySt
.L0809C8C8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809C8F0
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, .L0809C8EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809C93A
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809C93A
	.align 2, 0
.L0809C8EC: .4byte gPlaySt
.L0809C8F0:
	adds r0, r4, #0
	bl func_0809BE80
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809C93A
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq .L0809C93A
.L0809C91C:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq .L0809C93A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl ShowItemHelpBox
	ldr r0, [r4, #0x30]
.L0809C938:
	str r0, [r4, #0x38]
.L0809C93A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenItemUseScreen_OnIdle

	THUMB_FUNC_START func_0809C940
func_0809C940: @ 0x0809C940
	push {lr}
	bl EndScreenMenuScrollingBg
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809C940

	THUMB_FUNC_START DisplayAreYouSureYNBoxText
DisplayAreYouSureYNBoxText: @ 0x0809C958
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, .L0809C9C4  @ gUnknown_02013570
	adds r0, r4, #0
	bl ClearText
	ldr r0, .L0809C9C8  @ 0x00000585
	bl GetMsg
	adds r1, r4, #0
	adds r4, #8
	ldr r5, .L0809C9CC  @ gBg2Tm+0x362
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #0
	bl ClearText
	ldr r0, .L0809C9D0  @ 0x00000843
	bl GetMsg
	adds r5, #0x84
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, .L0809C9D4  @ 0x00000844
	bl GetMsg
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809C9C4: .4byte gUnknown_02013570
.L0809C9C8: .4byte 0x00000585
.L0809C9CC: .4byte gBg2Tm+0x362
.L0809C9D0: .4byte 0x00000843
.L0809C9D4: .4byte 0x00000844

	THUMB_FUNC_END DisplayAreYouSureYNBoxText

	THUMB_FUNC_START func_0809C9D8
func_0809C9D8: @ 0x0809C9D8
	push {lr}
	ldr r0, .L0809C9F0  @ gBg2Tm+0x362
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L0809C9F0: .4byte gBg2Tm+0x362

	THUMB_FUNC_END func_0809C9D8

	THUMB_FUNC_START PrepScreenItemUseScreen_AreUSureBoxInit
PrepScreenItemUseScreen_AreUSureBoxInit: @ 0x0809C9F4
	push {r4, lr}
	adds r4, r0, #0
	bl DisplayAreYouSureYNBoxText
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl func_080AD51C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenItemUseScreen_AreUSureBoxInit

	THUMB_FUNC_START PrepScreenItemUseScreen_AreUSureBoxLoop
PrepScreenItemUseScreen_AreUSureBoxLoop: @ 0x0809CA14
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, .L0809CA6C  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x80
	movs r1, #0x64
	movs r2, #0xc
	movs r3, #4
	bl func_0809A31C
	ldr r5, .L0809CA70  @ gKeySt
	ldr r3, [r5]
	ldrh r1, [r3, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809CA78
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	movs r0, #0
	bl func_080ACA84
	bl func_0809C9D8
	ldr r0, .L0809CA74  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809CADA
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809CADA
	.align 2, 0
.L0809CA6C: .4byte 0x0000A440
.L0809CA70: .4byte gKeySt
.L0809CA74: .4byte gPlaySt
.L0809CA78:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r1
	cmp r2, #0
	beq .L0809CAE8
	bl func_0809C9D8
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne .L0809CAB0
	bl HidePrepScreenHandCursor
	ldr r0, .L0809CAAC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809CAA2
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809CAA2:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b .L0809CB2A
	.align 2, 0
.L0809CAAC: .4byte gPlaySt
.L0809CAB0:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	ldr r0, .L0809CAE4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809CAD4
	movs r0, #0x6b
	bl m4aSongNumStart
.L0809CAD4:
	movs r0, #0
	bl func_080ACA84
.L0809CADA:
	adds r0, r4, #0
	bl Proc_Break
	b .L0809CB2A
	.align 2, 0
.L0809CAE4: .4byte gPlaySt
.L0809CAE8:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0809CAF4
	str r2, [r4, #0x3c]
.L0809CAF4:
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0809CB02
	str r6, [r4, #0x3c]
.L0809CB02:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq .L0809CB2A
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl func_080AD51C
	ldr r0, .L0809CB34  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809CB2A
	movs r0, #0x67
	bl m4aSongNumStart
.L0809CB2A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809CB34: .4byte gPlaySt

	THUMB_FUNC_END PrepScreenItemUseScreen_AreUSureBoxLoop

	THUMB_FUNC_START func_0809CB38
func_0809CB38: @ 0x0809CB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x8a
	beq .L0809CB78
	cmp r0, #0x8a
	bgt .L0809CB62
	cmp r0, #0x64
	blt .L0809CBA0
	cmp r0, #0x68
	ble .L0809CB78
	cmp r0, #0x88
	beq .L0809CB78
	b .L0809CBA0
.L0809CB62:
	cmp r0, #0xb7
	beq .L0809CB98
	cmp r0, #0xb7
	bgt .L0809CB74
	cmp r0, #0x99
	bgt .L0809CBA0
	cmp r0, #0x97
	blt .L0809CBA0
	b .L0809CB78
.L0809CB74:
	cmp r0, #0xc1
	bne .L0809CBA0
.L0809CB78:
	ldr r0, .L0809CB94  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809CB8A
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809CB8A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b .L0809CBA0
	.align 2, 0
.L0809CB94: .4byte gPlaySt
.L0809CB98:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
.L0809CBA0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809CB38

	THUMB_FUNC_START func_0809CBA8
func_0809CBA8: @ 0x0809CBA8
	push {r4, lr}
	adds r4, r0, #0
	bl EndScreenMenuScrollingBg
	bl ResetText
	movs r0, #0
	bl SetupBackgrounds
	bl EndGreenText
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl InitFaces
	bl HideRIsInfo
	ldr r2, .L0809CC38  @ gDispIo
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
	adds r1, r2, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1]
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	bl EndSmallBrownNameBoxes
	bl EndAllParallelWorkers
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl func_080ACA84
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r1, #1
	movs r3, #0
	bl UnitPromote
	ldr r1, .L0809CC3C  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809CC38: .4byte gDispIo
.L0809CC3C: .4byte gBattleStats

	THUMB_FUNC_END func_0809CBA8

	THUMB_FUNC_START func_0809CC40
func_0809CC40: @ 0x0809CC40
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne .L0809CC58
	adds r0, r4, #0
	bl Proc_Break
.L0809CC58:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809CC40

	THUMB_FUNC_START func_0809CC60
func_0809CC60: @ 0x0809CC60
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl func_080953C0
	cmp r5, #0
	bne .L0809CC84
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b .L0809CC94
.L0809CC84:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt .L0809CC8E
	subs r0, #1
	str r0, [r4, #0x30]
.L0809CC8E:
	adds r0, r4, #0
	bl Proc_Break
.L0809CC94:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809CC60

	THUMB_FUNC_START func_0809CC9C
func_0809CC9C: @ 0x0809CC9C
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809CCB8
	movs r0, #0x38
	bl OverrideBgm
	b .L0809CCDA
.L0809CCB8:
	ldr r0, .L0809CCD0  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809CCD4
	bl MakeBgmOverridePersist
	bl func_080B9FC0
	b .L0809CCDA
	.align 2, 0
.L0809CCD0: .4byte gGmData
.L0809CCD4:
	movs r0, #0x34
	bl OverrideBgm
.L0809CCDA:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809CC9C

	THUMB_FUNC_START func_0809CCE0
func_0809CCE0: @ 0x0809CCE0
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl func_080029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809CCE0

	THUMB_FUNC_START StartPrepScreenItemUseScreen
StartPrepScreenItemUseScreen: @ 0x0809CCFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809CD10  @ gUnknown_08A19064
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809CD10: .4byte gUnknown_08A19064

	THUMB_FUNC_END StartPrepScreenItemUseScreen

	THUMB_FUNC_START func_0809CD14
func_0809CD14: @ 0x0809CD14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r3, #0
	bl GetMsg
	mov r9, r0
	ldr r0, [sp, #0x28]
	bl GetItemIcon
	mov r8, r0
	mov r0, r9
	bl GetStringTextLen
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq .L0809CD60
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, .L0809CDCC  @ gBg2Tm
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
.L0809CD60:
	ldr r4, .L0809CDD0  @ gUnknown_02013570
	adds r0, r4, #0
	bl ClearText
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq .L0809CD72
	adds r0, #2
.L0809CD72:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, .L0809CDCC  @ gBg2Tm
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x44]
	mov r0, sl
	cmp r0, #0
	bge .L0809CDA6
	adds r0, #7
.L0809CDA6:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x48]
	mov r0, r8
	cmp r0, #0
	beq .L0809CDB6
	adds r0, r1, #3
	str r0, [r6, #0x48]
.L0809CDB6:
	movs r0, #2
	str r0, [r6, #0x4c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809CDCC: .4byte gBg2Tm
.L0809CDD0: .4byte gUnknown_02013570

	THUMB_FUNC_END func_0809CD14

	THUMB_FUNC_START func_0809CDD4
func_0809CDD4: @ 0x0809CDD4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl func_0807EDF8
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl ApplyStatBoosterAndGetMessageId
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	strb r1, [r0]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0xe
	movs r2, #0xe
	adds r3, r6, #0
	bl func_0809CD14
	movs r4, #0
.L0809CEF0:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq .L0809CF1E
	asrs r1, r4, #2
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x2a
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl func_0807EFF0
.L0809CF1E:
	adds r4, #1
	cmp r4, #7
	ble .L0809CEF0
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, .L0809CF44  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809CF3A
	movs r0, #0x5a
	bl m4aSongNumStart
.L0809CF3A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809CF44: .4byte gPlaySt

	THUMB_FUNC_END func_0809CDD4

	THUMB_FUNC_START func_0809CF48
func_0809CF48: @ 0x0809CF48
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, .L0809CF84  @ 0x0000A440
	str r4, [sp]
	bl func_0809A31C
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq .L0809CF76
	ldr r0, .L0809CF88  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq .L0809CF7C
.L0809CF76:
	adds r0, r5, #0
	bl Proc_Break
.L0809CF7C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809CF84: .4byte 0x0000A440
.L0809CF88: .4byte gKeySt

	THUMB_FUNC_END func_0809CF48

	THUMB_FUNC_START func_0809CF8C
func_0809CF8C: @ 0x0809CF8C
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, .L0809CFB4  @ gBg2Tm+0x39C
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r5, #0
	bne .L0809CFB8
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b .L0809CFD4
	.align 2, 0
.L0809CFB4: .4byte gBg2Tm+0x39C
.L0809CFB8:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt .L0809CFC2
	subs r0, #1
	str r0, [r4, #0x30]
.L0809CFC2:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
.L0809CFD4:
	ldr r0, .L0809D008  @ gBg0Tm+0x244
	ldr r1, .L0809D00C  @ gUnknown_02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl func_0809B74C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	movs r0, #0
	bl func_080ACA84
	bl func_0807EE74
	movs r0, #5
	bl EnableBgSync
	ldr r0, .L0809D010  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadHelpBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D008: .4byte gBg0Tm+0x244
.L0809D00C: .4byte gUnknown_02013510
.L0809D010: .4byte 0x06014000

	THUMB_FUNC_END func_0809CF8C

	THUMB_FUNC_START func_0809D014
func_0809D014: @ 0x0809D014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r0, #0x1f
	bl GetMsg
	mov r9, r0
	ldr r0, [sp, #0x28]
	bl GetItemIcon
	mov r8, r0
	mov r0, r9
	bl GetStringTextLen
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq .L0809D060
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, .L0809D0CC  @ gBg2Tm
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
.L0809D060:
	ldr r4, .L0809D0D0  @ gUnknown_02013570
	adds r0, r4, #0
	bl ClearText
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq .L0809D072
	adds r0, #2
.L0809D072:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, .L0809D0CC  @ gBg2Tm
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #4
	bl EnableBgSync
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x34]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x38]
	mov r0, sl
	cmp r0, #0
	bge .L0809D0A6
	adds r0, #7
.L0809D0A6:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x3c]
	mov r0, r8
	cmp r0, #0
	beq .L0809D0B6
	adds r0, r1, #3
	str r0, [r6, #0x3c]
.L0809D0B6:
	movs r0, #2
	str r0, [r6, #0x40]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D0CC: .4byte gBg2Tm
.L0809D0D0: .4byte gUnknown_02013570

	THUMB_FUNC_END func_0809D014

	THUMB_FUNC_START func_0809D0D4
func_0809D0D4: @ 0x0809D0D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl func_0807EDF8
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	movs r1, #0x30
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl func_0802F978
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	adds r4, r7, #0
	adds r4, #0x31
	strb r0, [r4]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl func_0809D014
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq .L0809D154
	adds r2, r0, #0
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r2, r2, r0
	movs r0, #0xb0
	movs r1, #0x1a
	bl func_0807EFF0
.L0809D154:
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, .L0809D178  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809D16A
	movs r0, #0x5a
	bl m4aSongNumStart
.L0809D16A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D178: .4byte gPlaySt

	THUMB_FUNC_END func_0809D0D4

	THUMB_FUNC_START func_0809D17C
func_0809D17C: @ 0x0809D17C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	ldr r2, [r5, #0x3c]
	ldr r3, [r5, #0x40]
	ldr r4, .L0809D1B8  @ 0x0000A440
	str r4, [sp]
	bl func_0809A31C
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq .L0809D1AA
	ldr r0, .L0809D1BC  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq .L0809D1B0
.L0809D1AA:
	adds r0, r5, #0
	bl Proc_Break
.L0809D1B0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D1B8: .4byte 0x0000A440
.L0809D1BC: .4byte gKeySt

	THUMB_FUNC_END func_0809D17C

	THUMB_FUNC_START func_0809D1C0
func_0809D1C0: @ 0x0809D1C0
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, .L0809D1E8  @ gBg2Tm+0x3A2
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r5, #0
	bne .L0809D1EC
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b .L0809D208
	.align 2, 0
.L0809D1E8: .4byte gBg2Tm+0x3A2
.L0809D1EC:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt .L0809D1F6
	subs r0, #1
	str r0, [r4, #0x30]
.L0809D1F6:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
.L0809D208:
	ldr r0, .L0809D238  @ gBg0Tm+0x244
	ldr r1, .L0809D23C  @ gUnknown_02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl func_0809B74C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	movs r0, #0
	bl func_080ACA84
	movs r0, #5
	bl EnableBgSync
	ldr r0, .L0809D240  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadHelpBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D238: .4byte gBg0Tm+0x244
.L0809D23C: .4byte gUnknown_02013510
.L0809D240: .4byte 0x06014000

	THUMB_FUNC_END func_0809D1C0

	THUMB_FUNC_START func_0809D244
func_0809D244: @ 0x0809D244
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, .L0809D270  @ 0x0000DFC0
	movs r5, #0x30
	movs r4, #3
.L0809D24E:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, .L0809D274  @ Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge .L0809D24E
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D270: .4byte 0x0000DFC0
.L0809D274: .4byte Sprite_32x16

	THUMB_FUNC_END func_0809D244

	THUMB_FUNC_START func_0809D278
func_0809D278: @ 0x0809D278
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0809D2B8  @ func_0809D244
	bl StartParallelWorker
	ldr r0, .L0809D2BC  @ gUnknown_08A191F4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, .L0809D2C0  @ gUnknown_08A19200
	ldr r1, [r1]
	bl GetMsgTo
	adds r2, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl func_080ADD24
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D2B8: .4byte func_0809D244
.L0809D2BC: .4byte gUnknown_08A191F4
.L0809D2C0: .4byte gUnknown_08A19200

	THUMB_FUNC_END func_0809D278

	THUMB_FUNC_START UnpackConvoyWeaponIconGraphics
UnpackConvoyWeaponIconGraphics: @ 0x0809D2C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809D2F0  @ gUnknown_08A1A3FC
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0809D2F4  @ gUnknown_08A1A0A4
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl Decompress
	ldr r0, .L0809D2F8  @ gUnknown_08A1A23C
	ldr r1, .L0809D2FC  @ 0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D2F0: .4byte gUnknown_08A1A3FC
.L0809D2F4: .4byte gUnknown_08A1A0A4
.L0809D2F8: .4byte gUnknown_08A1A23C
.L0809D2FC: .4byte 0x06000200

	THUMB_FUNC_END UnpackConvoyWeaponIconGraphics

	THUMB_FUNC_START func_0809D300
func_0809D300: @ 0x0809D300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	ldr r1, .L0809D350  @ gUnknown_02012F56
	ldrh r0, [r1]
	cmp r0, #0
	bne .L0809D354
	ldr r0, [sp]
	bl ClearText
	movs r0, #0xb5
	lsls r0, r0, #3
	bl GetMsg
	adds r3, r0, #0
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertDrawString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl PutText
	b .L0809D3FE
	.align 2, 0
.L0809D350: .4byte gUnknown_02012F56
.L0809D354:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge .L0809D3FE
	ldrh r1, [r1]
	cmp r6, r1
	bge .L0809D3FE
.L0809D362:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, .L0809D410  @ gUnknown_020122D4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r9, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809D38C
	movs r0, #1
	mov r9, r0
.L0809D38C:
	mov r0, r8
	bl ClearText
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, r9
	bl Text_InsertDrawString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl PutText
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, r9
	cmp r0, #0
	bne .L0809D3DC
	movs r5, #2
.L0809D3DC:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge .L0809D3FE
	ldr r0, .L0809D414  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r6, r0
	blt .L0809D362
.L0809D3FE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D410: .4byte gUnknown_020122D4
.L0809D414: .4byte gUnknown_02012F56

	THUMB_FUNC_END func_0809D300

	THUMB_FUNC_START func_0809D418
func_0809D418: @ 0x0809D418
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge .L0809D468
	ldr r0, .L0809D474  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r5, r0
	bge .L0809D468
	ldr r1, .L0809D478  @ gUnknown_020122D4
	lsls r0, r5, #2
	adds r6, r0, r1
.L0809D438:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl GetItemIcon
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl PutIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge .L0809D468
	ldr r0, .L0809D474  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r5, r0
	blt .L0809D438
.L0809D468:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D474: .4byte gUnknown_02012F56
.L0809D478: .4byte gUnknown_020122D4

	THUMB_FUNC_END func_0809D418

	THUMB_FUNC_START func_0809D47C
func_0809D47C: @ 0x0809D47C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r9, r1
	ldr r0, .L0809D528  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, r2
	ble .L0809D51C
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, .L0809D52C  @ gUnknown_020122D4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809D4BC
	movs r0, #1
	mov r8, r0
.L0809D4BC:
	lsls r4, r4, #6
	add r4, r9
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl ClearText
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertDrawString
	adds r5, r4, #2
	adds r0, r6, #0
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl PutIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl PutText
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne .L0809D50C
	movs r5, #2
.L0809D50C:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
.L0809D51C:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D528: .4byte gUnknown_02012F56
.L0809D52C: .4byte gUnknown_020122D4

	THUMB_FUNC_END func_0809D47C

	THUMB_FUNC_START func_0809D530
func_0809D530: @ 0x0809D530
	push {lr}
	ldr r0, .L0809D568  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls .L0809D542
	movs r2, #0
.L0809D542:
	cmp r2, #0xc
	bne .L0809D552
	ldr r1, .L0809D56C  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
.L0809D552:
	cmp r2, #0x34
	beq .L0809D55A
	cmp r2, #0
	bne .L0809D564
.L0809D55A:
	ldr r0, .L0809D56C  @ 0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
.L0809D564:
	pop {r0}
	bx r0
	.align 2, 0
.L0809D568: .4byte 0x04000006
.L0809D56C: .4byte 0x04000050

	THUMB_FUNC_END func_0809D530

	THUMB_FUNC_START func_0809D570
func_0809D570: @ 0x0809D570
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne .L0809D58E
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b .L0809D594
.L0809D58E:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
.L0809D594:
	strb r0, [r1]
	ldr r0, .L0809D5B0  @ gGmData
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0809D5B4
	bl GM_GetBaseMenuProc
	cmp r0, #0
	beq .L0809D5C8
	adds r0, #0x2b
	b .L0809D5C6
	.align 2, 0
.L0809D5B0: .4byte gGmData
.L0809D5B4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0809D5D4
	ldr r0, .L0809D5D0  @ gUnknown_08A1829C
	bl FindProc
	adds r0, #0x32
.L0809D5C6:
	ldrb r0, [r0]
.L0809D5C8:
	adds r1, r4, #0
	adds r1, #0x35
	strb r0, [r1]
	b .L0809D5DA
	.align 2, 0
.L0809D5D0: .4byte gUnknown_08A1829C
.L0809D5D4:
	adds r0, r4, #0
	adds r0, #0x35
	strb r1, [r0]
.L0809D5DA:
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
.L0809D5F4:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge .L0809D5F4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809D570

	THUMB_FUNC_START func_0809D608
func_0809D608: @ 0x0809D608
	push {r4, lr}
	ldr r4, .L0809D638  @ gUnknown_02013648
	ldr r1, .L0809D63C  @ 0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, .L0809D640  @ Pal_SystemText
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x90
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D638: .4byte gUnknown_02013648
.L0809D63C: .4byte 0x06011000
.L0809D640: .4byte Pal_SystemText

	THUMB_FUNC_END func_0809D608

	THUMB_FUNC_START func_0809D644
func_0809D644: @ 0x0809D644
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl func_08097CC8
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, .L0809D6BC  @ gUnknown_02013648
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	adds r7, r4, #0
	movs r4, #0
	cmp r5, #0x64
	beq .L0809D67E
	cmp r6, #0
	bne .L0809D680
.L0809D67E:
	movs r4, #1
.L0809D680:
	ldr r0, .L0809D6C0  @ 0x0000059E
	bl GetMsg
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldr r5, .L0809D6C4  @ gUnknown_020136D8
	movs r4, #0
	cmp r6, #5
	bne .L0809D69C
	movs r4, #1
.L0809D69C:
	ldr r0, .L0809D6C8  @ 0x0000059F
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D6BC: .4byte gUnknown_02013648
.L0809D6C0: .4byte 0x0000059E
.L0809D6C4: .4byte gUnknown_020136D8
.L0809D6C8: .4byte 0x0000059F

	THUMB_FUNC_END func_0809D644

	THUMB_FUNC_START func_0809D6CC
func_0809D6CC: @ 0x0809D6CC
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r6, .L0809D77C  @ gBg0Tm+0x68
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetMsg
	ldr r4, .L0809D780  @ gUnknown_02013660
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl PutDrawText
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xab
	movs r3, #2
	bl PutFaceChibi
	movs r0, #0xb4
	lsls r0, r0, #3
	bl GetMsg
	adds r4, #8
	subs r1, r6, #2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl PutDrawText
	adds r5, r6, #0
	adds r5, #0xa
	bl func_08097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne .L0809D744
	movs r4, #4
.L0809D744:
	bl func_08097CC8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D77C: .4byte gBg0Tm+0x68
.L0809D780: .4byte gUnknown_02013660

	THUMB_FUNC_END func_0809D6CC

	THUMB_FUNC_START func_0809D784
func_0809D784: @ 0x0809D784
	push {r4, lr}
	sub sp, #4
	ldr r0, .L0809D7C4  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #4
	bl func_0809A31C
	ldr r4, .L0809D7C8  @ Sprite_32x16
	ldr r0, .L0809D7CC  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, .L0809D7D0  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D7C4: .4byte 0x0000A840
.L0809D7C8: .4byte Sprite_32x16
.L0809D7CC: .4byte 0x0000B080
.L0809D7D0: .4byte 0x0000B088

	THUMB_FUNC_END func_0809D784

	THUMB_FUNC_START func_0809D7D4
func_0809D7D4: @ 0x0809D7D4
	push {lr}
	sub sp, #4
	ldr r0, .L0809D800  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #2
	bl func_0809A31C
	ldr r3, .L0809D804  @ Sprite_32x16
	ldr r0, .L0809D808  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L0809D800: .4byte 0x0000A840
.L0809D804: .4byte Sprite_32x16
.L0809D808: .4byte 0x0000B080

	THUMB_FUNC_END func_0809D7D4

	THUMB_FUNC_START func_0809D80C
func_0809D80C: @ 0x0809D80C
	push {lr}
	sub sp, #4
	ldr r0, .L0809D838  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x31
	movs r2, #5
	movs r3, #2
	bl func_0809A31C
	ldr r3, .L0809D83C  @ Sprite_32x16
	ldr r0, .L0809D840  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L0809D838: .4byte 0x0000A840
.L0809D83C: .4byte Sprite_32x16
.L0809D840: .4byte 0x0000B088

	THUMB_FUNC_END func_0809D80C

	THUMB_FUNC_START func_0809D844
func_0809D844: @ 0x0809D844
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, .L0809D8BC  @ gPal
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, .L0809D8C0  @ gUnknown_08A1BD60
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, .L0809D8C4  @ 0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, .L0809D8C8  @ gUnknown_08A19608
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, .L0809D8CC  @ gUnknown_08A195F8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, .L0809D8D0  @ gUnknown_02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl func_080976CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D8BC: .4byte gPal
.L0809D8C0: .4byte gUnknown_08A1BD60
.L0809D8C4: .4byte 0x0000029A
.L0809D8C8: .4byte gUnknown_08A19608
.L0809D8CC: .4byte gUnknown_08A195F8
.L0809D8D0: .4byte gUnknown_02012F56

	THUMB_FUNC_END func_0809D844

	THUMB_FUNC_START func_0809D8D4
func_0809D8D4: @ 0x0809D8D4
	push {r4, r5, r6, lr}
	movs r5, #0
	lsls r2, r2, #0xc
	ldr r4, .L0809D910  @ 0x0001FFFF
	adds r3, r1, #0
	ands r3, r4
	lsrs r3, r3, #5
	adds r6, r2, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	ands r1, r4
	lsrs r1, r1, #5
	adds r2, r2, r1
	adds r3, r0, #0
	adds r3, #0x40
	adds r1, r0, #0
.L0809D8F6:
	adds r0, r6, r5
	strh r0, [r1]
	adds r0, r2, r5
	strh r0, [r3]
	adds r3, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xe
	ble .L0809D8F6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D910: .4byte 0x0001FFFF

	THUMB_FUNC_END func_0809D8D4

	THUMB_FUNC_START func_0809D914
func_0809D914: @ 0x0809D914
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0809D9F8  @ gDispIo
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl LoadObjUiGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r5, #0x4c
	adds r5, r5, r0
	ldrh r2, [r5]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, .L0809D9FC  @ 0x06013000
	movs r1, #1
	negs r1, r1
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl RestartScreenMenuScrollingBg
	movs r0, #8
	bl EnableBgSync
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809D9F8: .4byte gDispIo
.L0809D9FC: .4byte 0x06013000

	THUMB_FUNC_END func_0809D914

	THUMB_FUNC_START func_0809DA00
func_0809DA00: @ 0x0809DA00
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl func_08098C8C
	ldr r0, .L0809DC38  @ gUnknown_08A1B9EC
	ldr r4, .L0809DC3C  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r5, .L0809DC40  @ gBg1Tm
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
	ldr r0, .L0809DC44  @ gUnknown_08A1BCC0
	adds r1, r4, #0
	bl Decompress
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r0, #0
	movs r1, #0x90
	movs r2, #6
	movs r3, #2
	bl func_080ADBFC
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r0, r7, #0
	bl func_080AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	ldr r5, .L0809DC48  @ gDispIo
	ldrb r0, [r5, #1]
	movs r1, #0x20
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r5
	mov r9, r0
	ldrb r1, [r0]
	movs r6, #1
	orrs r1, r6
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r6
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, r8
	orrs r1, r2
	mov r2, r9
	strb r1, [r2]
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl ShowRIsInfo
	ldr r4, .L0809DC4C  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #4
	bl InitText
	bl func_0809D608
	adds r4, #0x10
	movs r5, #4
.L0809DB3C:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L0809DB3C
	movs r2, #0x35
	adds r2, r2, r7
	mov r8, r2
	movs r0, #0x4c
	adds r0, r0, r7
	mov r9, r0
	ldr r4, .L0809DC50  @ gUnknown_02013698
	movs r5, #7
.L0809DB5C:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L0809DB5C
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, .L0809DC54  @ func_0809D530
	bl SetOnHBlankA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl UnpackConvoyWeaponIconGraphics
	ldr r5, .L0809DC58  @ gBg0Tm+0xDE
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl func_0809D8D4
	ldr r0, .L0809DC5C  @ gUnknown_08A19CCC
	ldr r1, .L0809DC60  @ 0x06015000
	bl Decompress
	ldr r0, .L0809DC64  @ gUnknown_08A1A084
	movs r6, #0xa0
	lsls r6, r6, #2
	adds r1, r6, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl func_08097748
	bl func_08097668
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r4, .L0809DC50  @ gUnknown_02013698
	ldr r1, .L0809DC68  @ gBg2Tm+0x1E
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, r9
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl func_0809D300
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #0x28
	ldr r2, [r7, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl func_0809B74C
	bl func_0809D6CC
	adds r0, r7, #0
	bl func_080ACCE0
	movs r0, #0
	adds r1, r6, #0
	movs r2, #2
	bl func_080ACCF4
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl func_080ACD7C
	movs r0, #3
	bl func_080ACD60
	ldr r0, .L0809DC6C  @ func_0809D844
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809DC38: .4byte gUnknown_08A1B9EC
.L0809DC3C: .4byte gBuf
.L0809DC40: .4byte gBg1Tm
.L0809DC44: .4byte gUnknown_08A1BCC0
.L0809DC48: .4byte gDispIo
.L0809DC4C: .4byte gUnknown_02013660
.L0809DC50: .4byte gUnknown_02013698
.L0809DC54: .4byte func_0809D530
.L0809DC58: .4byte gBg0Tm+0xDE
.L0809DC5C: .4byte gUnknown_08A19CCC
.L0809DC60: .4byte 0x06015000
.L0809DC64: .4byte gUnknown_08A1A084
.L0809DC68: .4byte gBg2Tm+0x1E
.L0809DC6C: .4byte func_0809D844

	THUMB_FUNC_END func_0809DA00

	THUMB_FUNC_START func_0809DC70
func_0809DC70: @ 0x0809DC70
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl func_0809D278
	movs r0, #0
	bl func_080ACA84
	adds r0, r4, #0
	bl func_0809D644
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl func_080AD51C
	ldr r0, .L0809DCC8  @ func_0809D7D4
	bl GetParallelWorker
	bl Proc_End
	ldr r0, .L0809DCCC  @ func_0809D80C
	bl GetParallelWorker
	bl Proc_End
	ldr r0, .L0809DCD0  @ func_0809D784
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #7
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809DCC8: .4byte func_0809D7D4
.L0809DCCC: .4byte func_0809D80C
.L0809DCD0: .4byte func_0809D784

	THUMB_FUNC_END func_0809DC70

	THUMB_FUNC_START func_0809DCD4
func_0809DCD4: @ 0x0809DCD4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq .L0809DCE6
	b .L0809DE34
.L0809DCE6:
	ldr r1, .L0809DD04  @ gKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	mov ip, r1
	cmp r0, #0
	beq .L0809DDE8
	cmp r6, #0
	beq .L0809DD08
	cmp r6, #1
	beq .L0809DD70
	b .L0809DEEC
	.align 2, 0
.L0809DD04: .4byte gKeySt
.L0809DD08:
	bl func_08097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi .L0809DDCC
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble .L0809DDCC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl func_080AC9D4
	ldr r0, .L0809DD64  @ func_0809D784
	bl GetParallelWorker
	bl Proc_End
	ldr r0, .L0809DD68  @ func_0809D7D4
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #1
	adds r1, r5, #0
	bl func_0809D278
	ldr r0, .L0809DD6C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809DD5A
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809DD5A:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b .L0809DEEC
	.align 2, 0
.L0809DD64: .4byte func_0809D784
.L0809DD68: .4byte func_0809D7D4
.L0809DD6C: .4byte gPlaySt
.L0809DD70:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt .L0809DDCC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl func_080AC9D4
	ldr r0, .L0809DDC0  @ func_0809D784
	bl GetParallelWorker
	bl Proc_End
	ldr r0, .L0809DDC4  @ func_0809D80C
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #2
	adds r1, r5, #0
	bl func_0809D278
	ldr r0, .L0809DDC8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809DDB6
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809DDB6:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b .L0809DEEC
	.align 2, 0
.L0809DDC0: .4byte func_0809D784
.L0809DDC4: .4byte func_0809D80C
.L0809DDC8: .4byte gPlaySt
.L0809DDCC:
	ldr r0, .L0809DDE4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0809DDDA
	b .L0809DEEC
.L0809DDDA:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0809DEEC
	.align 2, 0
.L0809DDE4: .4byte gPlaySt
.L0809DDE8:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq .L0809DE10
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, .L0809DE0C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809DEEC
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809DEEC
	.align 2, 0
.L0809DE0C: .4byte gPlaySt
.L0809DE10:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq .L0809DE54
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, .L0809DE30  @ gUnknown_08A19204
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl ShowTextHelpBox
	strh r7, [r5, #0x38]
	b .L0809DEEC
	.align 2, 0
.L0809DE30: .4byte gUnknown_08A19204
.L0809DE34:
	ldr r2, .L0809DE50  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq .L0809DE54
	bl MoveableHelpBox_OnEnd
	movs r0, #0
	strh r0, [r5, #0x38]
	b .L0809DEEC
	.align 2, 0
.L0809DE50: .4byte gKeySt
.L0809DE54:
	mov r0, ip
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq .L0809DE80
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0809DE72
	subs r0, #1
	b .L0809DE7E
.L0809DE72:
	ldrh r1, [r3, #8]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809DE80
	movs r0, #1
.L0809DE7E:
	strb r0, [r4]
.L0809DE80:
	mov r0, ip
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809DEA8
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0809DE9A
	adds r0, #1
	b .L0809DEA6
.L0809DE9A:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809DEA8
	movs r0, #0
.L0809DEA6:
	strb r0, [r4]
.L0809DEA8:
	ldrb r0, [r4]
	cmp r6, r0
	beq .L0809DEEC
	ldr r0, .L0809DEF4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809DEC0
	movs r0, #0x66
	bl m4aSongNumStart
.L0809DEC0:
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl func_080AD51C
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq .L0809DEEC
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, .L0809DEF8  @ gUnknown_08A19204
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl ShowTextHelpBox
.L0809DEEC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809DEF4: .4byte gPlaySt
.L0809DEF8: .4byte gUnknown_08A19204

	THUMB_FUNC_END func_0809DCD4

	THUMB_FUNC_START func_0809DEFC
func_0809DEFC: @ 0x0809DEFC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r0, .L0809DF8C  @ gUnknown_02013698
	ldr r1, .L0809DF90  @ gBg2Tm+0x1E
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl func_0809D300
	ldr r0, .L0809DF94  @ gBg0Tm+0x244
	ldr r1, [r4, #0x2c]
	bl func_0809B830
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl func_080AD51C
	movs r0, #5
	bl EnableBgSync
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq .L0809DFA8
	ldr r0, .L0809DF98  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq .L0809DFA0
	ldr r2, .L0809DF9C  @ gUnknown_020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl ShowItemHelpBox
	movs r0, #1
	b .L0809DFA6
	.align 2, 0
.L0809DF8C: .4byte gUnknown_02013698
.L0809DF90: .4byte gBg2Tm+0x1E
.L0809DF94: .4byte gBg0Tm+0x244
.L0809DF98: .4byte gUnknown_02012F56
.L0809DF9C: .4byte gUnknown_020122D4
.L0809DFA0:
	bl MoveableHelpBox_OnEnd
	movs r0, #0xff
.L0809DFA6:
	strh r0, [r4, #0x38]
.L0809DFA8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809DEFC

	THUMB_FUNC_START func_0809DFB0
func_0809DFB0: @ 0x0809DFB0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r1, r6, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge .L0809DFDE
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
.L0809DFDE:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne .L0809DFFE
	ldrb r0, [r5]
	cmp r0, #0
	bne .L0809DFF0
	movs r0, #8
	b .L0809DFF2
.L0809DFF0:
	subs r0, #1
.L0809DFF2:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl func_0809DEFC
	ldr r3, [sp]
.L0809DFFE:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt .L0809E01E
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
.L0809E01E:
	movs r0, #0xff
	ands r3, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	ldrb r1, [r4]
	lsls r0, r7, #1
	cmp r1, r0
	bne .L0809E04C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
.L0809E04C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809DFB0

	THUMB_FUNC_START func_0809E054
func_0809E054: @ 0x0809E054
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge .L0809E086
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
.L0809E086:
	adds r5, r7, #0
	adds r5, #0x35
	cmp r4, #4
	bne .L0809E0A2
	ldrb r0, [r5]
	cmp r0, #8
	bne .L0809E098
	movs r0, #0
	b .L0809E09A
.L0809E098:
	adds r0, #1
.L0809E09A:
	strb r0, [r5]
	adds r0, r7, #0
	bl func_0809DEFC
.L0809E0A2:
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r8
	blt .L0809E0C6
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	negs r6, r0
.L0809E0C6:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne .L0809E0F6
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
.L0809E0F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809E054

	THUMB_FUNC_START func_0809E100
func_0809E100: @ 0x0809E100
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, .L0809E128  @ gUnknown_02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne .L0809E12C
	mov r3, ip
	adds r3, #0x35
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b .L0809E14A
	.align 2, 0
.L0809E128: .4byte gUnknown_02012F56
.L0809E12C:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x3a
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble .L0809E14A
	strh r0, [r4]
.L0809E14A:
	ldrh r0, [r5]
	cmp r0, #6
	bls .L0809E168
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble .L0809E168
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
.L0809E168:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809E100

	THUMB_FUNC_START func_0809E184
func_0809E184: @ 0x0809E184
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt .L0809E1B0
	cmp r3, #0
	beq .L0809E1B0
	adds r0, r3, #1
	strh r0, [r4]
.L0809E1B0:
	mov r4, ip
	adds r4, #0x35
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x3a
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble .L0809E1E4
	ldr r0, .L0809E214  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq .L0809E1E4
	subs r0, r5, #1
	strh r0, [r6]
.L0809E1E4:
	mov r0, ip
	bl func_0809E100
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl func_080AD51C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809E214: .4byte gUnknown_02012F56

	THUMB_FUNC_END func_0809E184

	THUMB_FUNC_START func_0809E218
func_0809E218: @ 0x0809E218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, .L0809E2B0  @ gBg2Tm+0x1E
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl func_0809D418
	ldr r0, .L0809E2B4  @ gBg0Tm+0x244
	ldr r1, [r4, #0x2c]
	bl func_0809B830
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge .L0809E26A
	ldr r0, .L0809E2B8  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl func_0809D47C
.L0809E26A:
	cmp r7, #0
	ble .L0809E284
	ldr r0, .L0809E2B8  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl func_0809D47C
.L0809E284:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809E2B0: .4byte gBg2Tm+0x1E
.L0809E2B4: .4byte gBg0Tm+0x244
.L0809E2B8: .4byte gUnknown_02013698

	THUMB_FUNC_END func_0809E218

	THUMB_FUNC_START func_0809E2BC
func_0809E2BC: @ 0x0809E2BC
	push {lr}
	bl func_0809D6CC
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809E2BC

	THUMB_FUNC_START func_0809E2C8
func_0809E2C8: @ 0x0809E2C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq .L0809E2E4
	ldr r0, .L0809E2FC  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0809E304
.L0809E2E4:
	ldr r0, .L0809E300  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0809E2F2
	b .L0809E412
.L0809E2F2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0809E412
	.align 2, 0
.L0809E2FC: .4byte gUnknown_02012F56
.L0809E300: .4byte gPlaySt
.L0809E304:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, .L0809E3E4  @ gUnknown_020122D4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl func_080982B8
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl func_0809E100
	bl InitIcons
	ldr r0, .L0809E3E8  @ gBg0Tm+0x244
	ldr r4, .L0809E3EC  @ gUnknown_02013670
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl func_0809B74C
	adds r4, #0x28
	ldr r1, .L0809E3F0  @ gBg2Tm+0x1E
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl func_0809D300
	ldr r0, .L0809E3F4  @ func_0809E2BC
	movs r1, #1
	adds r2, r7, #0
	bl func_080ACE20
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r6, r6, r0
	ldrh r1, [r6]
	lsls r1, r1, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl func_080AD51C
	movs r0, #5
	bl EnableBgSync
	ldr r1, .L0809E3F8  @ gAction
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne .L0809E400
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L0809E3FC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E412
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809E412
	.align 2, 0
.L0809E3E4: .4byte gUnknown_020122D4
.L0809E3E8: .4byte gBg0Tm+0x244
.L0809E3EC: .4byte gUnknown_02013670
.L0809E3F0: .4byte gBg2Tm+0x1E
.L0809E3F4: .4byte func_0809E2BC
.L0809E3F8: .4byte gAction
.L0809E3FC: .4byte gPlaySt
.L0809E400:
	ldr r0, .L0809E41C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E412
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809E412:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809E41C: .4byte gPlaySt

	THUMB_FUNC_END func_0809E2C8

	THUMB_FUNC_START func_0809E420
func_0809E420: @ 0x0809E420
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r1, #0x3a
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r2, #0xf
	mov r9, r2
	mov r1, r9
	ands r1, r0
	mov r9, r1
	cmp r1, #0
	beq .L0809E458
	b .L0809E648
.L0809E458:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq .L0809E462
	cmp r0, #0xff
	bne .L0809E500
.L0809E462:
	ldr r1, .L0809E49C  @ gKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq .L0809E4C4
	ldr r0, .L0809E4A0  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq .L0809E4A8
	ldr r1, .L0809E4A4  @ gUnknown_020122D4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, sl
	lsls r1, r0, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl ShowItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b .L0809E79A
	.align 2, 0
.L0809E49C: .4byte gKeySt
.L0809E4A0: .4byte gUnknown_02012F56
.L0809E4A4: .4byte gUnknown_020122D4
.L0809E4A8:
	ldr r0, .L0809E4C0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0809E4B6
	b .L0809E79A
.L0809E4B6:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0809E79A
	.align 2, 0
.L0809E4C0: .4byte gPlaySt
.L0809E4C4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq .L0809E4D4
	adds r0, r4, #0
	bl func_0809E2C8
	b .L0809E79A
.L0809E4D4:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq .L0809E520
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L0809E4FC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E4F6
	movs r0, #0x6b
	bl m4aSongNumStart
.L0809E4F6:
	mov r1, r9
	strh r1, [r4, #0x38]
	b .L0809E79A
	.align 2, 0
.L0809E4FC: .4byte gPlaySt
.L0809E500:
	ldr r2, .L0809E51C  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq .L0809E520
	bl MoveableHelpBox_OnEnd
	mov r2, r9
	strh r2, [r4, #0x38]
	b .L0809E79A
	.align 2, 0
.L0809E51C: .4byte gKeySt
.L0809E520:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq .L0809E568
	movs r0, #0
	bl func_080ACDA4
	ldr r0, .L0809E564  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E54A
	movs r0, #0x67
	bl m4aSongNumStart
.L0809E54A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl func_0809DFB0
	b .L0809E79A
	.align 2, 0
.L0809E564: .4byte gPlaySt
.L0809E568:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0809E5A4
	movs r0, #1
	bl func_080ACDA4
	ldr r0, .L0809E5A0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E588
	movs r0, #0x67
	bl m4aSongNumStart
.L0809E588:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl func_0809E054
	b .L0809E79A
	.align 2, 0
.L0809E5A0: .4byte gPlaySt
.L0809E5A4:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809E5B8
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b .L0809E5BE
.L0809E5B8:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
.L0809E5BE:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne .L0809E5EC
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x35
	adds r5, r4, #0
	adds r5, #0x3a
	cmp r0, #0
	beq .L0809E608
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne .L0809E608
.L0809E5EC:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq .L0809E608
	subs r0, r1, #1
	strh r0, [r3]
.L0809E608:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne .L0809E62A
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809E6A8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne .L0809E6A8
.L0809E62A:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, .L0809E644  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge .L0809E6A8
	adds r0, r1, #1
	strh r0, [r2]
	b .L0809E6A8
	.align 2, 0
.L0809E644: .4byte gUnknown_02012F56
.L0809E648:
	mov r1, sl
	lsls r0, r1, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt .L0809E666
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
.L0809E666:
	ldrb r0, [r7]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble .L0809E68E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
.L0809E68E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	adds r6, r7, #0
	mov r5, r8
.L0809E6A8:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq .L0809E79A
	ldr r1, .L0809E710  @ gUnknown_020122D4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, .L0809E714  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E6D0
	movs r0, #0x66
	bl m4aSongNumStart
.L0809E6D0:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt .L0809E718
	cmp r3, #0
	beq .L0809E718
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq .L0809E702
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl ShowItemHelpBox
.L0809E702:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	b .L0809E750
	.align 2, 0
.L0809E710: .4byte gUnknown_020122D4
.L0809E714: .4byte gPlaySt
.L0809E718:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble .L0809E75C
	ldr r0, .L0809E758  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq .L0809E75C
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq .L0809E748
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl ShowItemHelpBox
.L0809E748:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
.L0809E750:
	adds r0, r4, #0
	bl func_0809E218
	b .L0809E79A
	.align 2, 0
.L0809E758: .4byte gUnknown_02012F56
.L0809E75C:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq .L0809E77C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl ShowItemHelpBox
.L0809E77C:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl func_080AD51C
.L0809E79A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809E420

	THUMB_FUNC_START func_0809E7A8
func_0809E7A8: @ 0x0809E7A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, .L0809E7D8  @ gKeySt
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq .L0809E7EE
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq .L0809E7DC
	subs r0, #1
	strb r0, [r2]
	b .L0809E81E
	.align 2, 0
.L0809E7D8: .4byte gKeySt
.L0809E7DC:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809E838
	subs r0, r3, #1
	strb r0, [r2]
	b .L0809E81E
.L0809E7EE:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809E838
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge .L0809E810
	adds r0, r1, #1
	strb r0, [r2]
	b .L0809E81E
.L0809E810:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809E838
	strb r5, [r2]
.L0809E81E:
	ldr r0, .L0809E834  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E830
	movs r0, #0x66
	bl m4aSongNumStart
.L0809E830:
	movs r0, #1
	b .L0809E83A
	.align 2, 0
.L0809E834: .4byte gPlaySt
.L0809E838:
	movs r0, #0
.L0809E83A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809E7A8

	THUMB_FUNC_START func_0809E840
func_0809E840: @ 0x0809E840
	push {lr}
	adds r0, #0x31
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809E840

	THUMB_FUNC_START func_0809E85C
func_0809E85C: @ 0x0809E85C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r1, [r5, #0x2c]
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl func_08098014
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r5, #0
	bl func_0809E100
	bl InitIcons
	ldr r0, .L0809E924  @ gBg0Tm+0x244
	ldr r4, .L0809E928  @ gUnknown_02013670
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl func_0809B74C
	adds r4, #0x28
	ldr r1, .L0809E92C  @ gBg2Tm+0x1E
	ldrb r2, [r6]
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl func_0809D300
	ldr r0, .L0809E930  @ func_0809E2BC
	movs r1, #1
	adds r2, r5, #0
	bl func_080ACE20
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, .L0809E934  @ gAction
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq .L0809E906
	bl func_08097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne .L0809E93C
.L0809E906:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L0809E938  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E96A
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809E96A
	.align 2, 0
.L0809E924: .4byte gBg0Tm+0x244
.L0809E928: .4byte gUnknown_02013670
.L0809E92C: .4byte gBg2Tm+0x1E
.L0809E930: .4byte func_0809E2BC
.L0809E934: .4byte gAction
.L0809E938: .4byte gPlaySt
.L0809E93C:
	ldr r0, .L0809E970  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809E94E
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809E94E:
	ldrb r0, [r7]
	cmp r4, r0
	bgt .L0809E96A
	subs r0, r4, #1
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
.L0809E96A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809E970: .4byte gPlaySt

	THUMB_FUNC_END func_0809E85C

	THUMB_FUNC_START func_0809E974
func_0809E974: @ 0x0809E974
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne .L0809E99C
	ldr r0, .L0809E998  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809EA34
	bl MoveableHelpBox_OnEnd
	movs r0, #0
	strh r0, [r4, #0x38]
	b .L0809EA76
	.align 2, 0
.L0809E998: .4byte gKeySt
.L0809E99C:
	ldr r0, .L0809E9D0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809E9D4
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq .L0809EA76
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl ShowItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b .L0809EA76
	.align 2, 0
.L0809E9D0: .4byte gKeySt
.L0809E9D4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809EA0C
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl func_08097F98
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809EA04
	movs r1, #1
	negs r1, r1
	ldr r2, .L0809EA00  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r4, #0
	bl func_08097DA8
	b .L0809EA76
	.align 2, 0
.L0809EA00: .4byte 0x0000088B
.L0809EA04:
	adds r0, r4, #0
	bl func_0809E85C
	b .L0809EA76
.L0809EA0C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809EA34
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L0809EA30  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809EA76
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809EA76
	.align 2, 0
.L0809EA30: .4byte gPlaySt
.L0809EA34:
	adds r0, r4, #0
	bl func_0809E7A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809EA76
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne .L0809EA76
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq .L0809EA76
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl ShowItemHelpBox
.L0809EA76:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809E974

	THUMB_FUNC_START func_0809EA7C
func_0809EA7C: @ 0x0809EA7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809EAA0  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809EAA4
	bl GM_GetBaseMenuProc
	cmp r0, #0
	beq .L0809EABE
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x2b
	b .L0809EABC
	.align 2, 0
.L0809EAA0: .4byte gGmData
.L0809EAA4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0809EABE
	ldr r0, .L0809EAD4  @ gUnknown_08A1829C
	bl FindProc
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
.L0809EABC:
	strb r1, [r0]
.L0809EABE:
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndScreenMenuScrollingBg
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809EAD4: .4byte gUnknown_08A1829C

	THUMB_FUNC_END func_0809EA7C

	THUMB_FUNC_START func_0809EAD8
func_0809EAD8: @ 0x0809EAD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809EAF0  @ gUnknown_08A1920C
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809EAF0: .4byte gUnknown_08A1920C

	THUMB_FUNC_END func_0809EAD8

	THUMB_FUNC_START func_0809EAF4
func_0809EAF4: @ 0x0809EAF4
	push {r4, lr}
	ldr r4, .L0809EB10  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq .L0809EB08
	bl MU_EndAll
	ldr r0, [r4]
	bl ShowUnitSprite
.L0809EB08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809EB10: .4byte gActiveUnit

	THUMB_FUNC_END func_0809EAF4

	THUMB_FUNC_START func_0809EB14
func_0809EB14: @ 0x0809EB14
	push {r4, lr}
	ldr r4, .L0809EB34  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq .L0809EB2C
	bl HideUnitSprite
	ldr r0, [r4]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
.L0809EB2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809EB34: .4byte gActiveUnit

	THUMB_FUNC_END func_0809EB14

	THUMB_FUNC_START func_0809EB38
func_0809EB38: @ 0x0809EB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809EB54  @ gUnknown_08A192EC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809EB54: .4byte gUnknown_08A192EC

	THUMB_FUNC_END func_0809EB38

	THUMB_FUNC_START func_0809EB58
func_0809EB58: @ 0x0809EB58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809EB74  @ gUnknown_08A192EC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809EB74: .4byte gUnknown_08A192EC

	THUMB_FUNC_END func_0809EB58

	THUMB_FUNC_START func_0809EB78
func_0809EB78: @ 0x0809EB78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809EBA4  @ gUnknown_08A1829C
	bl FindProc
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r4, #0x36]
	movs r0, #0xff
	strh r0, [r4, #0x34]
	ldr r0, .L0809EBA8  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809EBB4
	bl GM_GetBaseMenuProc
	cmp r0, #0
	beq .L0809EBAC
	adds r0, #0x2a
	b .L0809EBB8
	.align 2, 0
.L0809EBA4: .4byte gUnknown_08A1829C
.L0809EBA8: .4byte gGmData
.L0809EBAC:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	b .L0809EBBE
.L0809EBB4:
	adds r0, r2, #0
	adds r0, #0x31
.L0809EBB8:
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
.L0809EBBE:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x31
	movs r0, #0
	movs r1, #4
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	movs r3, #0
	adds r1, #0x1a
	adds r0, r4, #0
	adds r0, #0x38
	movs r2, #8
.L0809EBDA:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge .L0809EBDA
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809EB78

	THUMB_FUNC_START func_0809EBF0
func_0809EBF0: @ 0x0809EBF0
	push {r4, lr}
	sub sp, #8
	ldr r4, .L0809EC2C  @ gBg0Tm+0x68
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, .L0809EC30  @ 0x000005A9
	bl GetMsg
	ldr r2, .L0809EC34  @ gUnknown_020136D8
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809EC2C: .4byte gBg0Tm+0x68
.L0809EC30: .4byte 0x000005A9
.L0809EC34: .4byte gUnknown_020136D8

	THUMB_FUNC_END func_0809EBF0

	THUMB_FUNC_START func_0809EC38
func_0809EC38: @ 0x0809EC38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, .L0809EC84  @ gBg0Tm+0x70
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r7, .L0809EC88  @ gUnknown_02013668
	adds r0, r7, #0
	bl ClearText
	ldr r0, .L0809EC8C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, r4
	bgt .L0809EC94
	ldr r0, .L0809EC90  @ 0x00000536
	bl GetMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b .L0809ECBA
	.align 2, 0
.L0809EC84: .4byte gBg0Tm+0x70
.L0809EC88: .4byte gUnknown_02013668
.L0809EC8C: .4byte gUnknown_02012F56
.L0809EC90: .4byte 0x00000536
.L0809EC94:
	ldr r0, .L0809ECC4  @ gUnknown_020122D4
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r4, [r1]
	cmp r4, #0
	bne .L0809ECC8
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetMsg
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
.L0809ECBA:
	movs r3, #0
	bl PutDrawText
	b .L0809ECE8
	.align 2, 0
.L0809ECC4: .4byte gUnknown_020122D4
.L0809ECC8:
	adds r0, r4, #0
	bl GetUnitByPid
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl PutDrawText
.L0809ECE8:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809EC38

	THUMB_FUNC_START func_0809ECFC
func_0809ECFC: @ 0x0809ECFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, .L0809ED74  @ gPal
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, .L0809ED78  @ gUnknown_08A1BD60
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, .L0809ED7C  @ 0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, .L0809ED80  @ gUnknown_08A19608
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, .L0809ED84  @ gUnknown_08A195F8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, .L0809ED88  @ gUnknown_02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl func_080976CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809ED74: .4byte gPal
.L0809ED78: .4byte gUnknown_08A1BD60
.L0809ED7C: .4byte 0x0000029A
.L0809ED80: .4byte gUnknown_08A19608
.L0809ED84: .4byte gUnknown_08A195F8
.L0809ED88: .4byte gUnknown_02012F56

	THUMB_FUNC_END func_0809ECFC

	THUMB_FUNC_START func_0809ED8C
func_0809ED8C: @ 0x0809ED8C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, .L0809F0C0  @ gDispIo
	mov r8, r0
	ldrb r1, [r0]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	mov r0, r8
	ldrb r2, [r0, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	mov r2, r8
	strb r0, [r2, #0xc]
	ldrb r2, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r5, #2
	orrs r0, r5
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl LoadObjUiGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #0x17
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r0, .L0809F0C4  @ 0x06012000
	movs r1, #1
	negs r1, r1
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl RestartScreenMenuScrollingBg
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	ldr r0, .L0809F0C8  @ gUnknown_08A1B9EC
	ldr r4, .L0809F0CC  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L0809F0D0  @ gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	adds r0, r7, #0
	bl func_080AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	mov r1, r8
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, r8
	strb r0, [r2, #1]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r2, #0x34
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	orrs r0, r5
	movs r1, #5
	negs r1, r1
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl ShowRIsInfo
	ldr r4, .L0809F0D4  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl InitText
	adds r4, #0x10
	movs r5, #4
.L0809EF2C:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L0809EF2C
	movs r2, #0x33
	adds r2, r2, r7
	mov r8, r2
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, .L0809F0D8  @ gUnknown_02013698
	movs r5, #7
.L0809EF4A:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L0809EF4A
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl UnpackConvoyWeaponIconGraphics
	ldr r0, .L0809F0DC  @ gBg0Tm+0xDE
	mov r9, r0
	adds r1, r4, #0
	movs r2, #6
	bl func_0809D8D4
	ldr r0, .L0809F0E0  @ gUnknown_08A19CCC
	ldr r1, .L0809F0E4  @ 0x06015000
	bl Decompress
	ldr r0, .L0809F0E8  @ gUnknown_08A1A084
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl func_08097748
	bl func_08097668
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl func_0809F5F4
	ldr r5, .L0809F0D8  @ gUnknown_02013698
	ldr r1, .L0809F0EC  @ gBg2Tm+0x1E
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl func_0809D300
	movs r0, #4
	bl EnableBgSync
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, r9
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl func_0809B74C
	bl func_0809EBF0
	adds r0, r7, #0
	bl func_080ACCE0
	movs r0, #0
	adds r1, r4, #0
	movs r2, #2
	bl func_080ACCF4
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl func_080ACD7C
	movs r0, #3
	bl func_080ACD60
	ldr r0, .L0809F0F0  @ func_0809ECFC
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r0, [r7, #0x2c]
	bl GetUnitFid
	adds r1, r0, #0
	movs r3, #4
	negs r3, r3
	ldr r0, .L0809F0F4  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl NewFace2
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r2, #1
	negs r2, r2
	movs r0, #0
	movs r3, #1
	bl func_080ADBFC
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl func_080ADBFC
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, .L0809F0F8  @ gBg0Tm
	movs r2, #0
	bl PutDrawText
	adds r0, r7, #0
	bl func_0809EC38
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809F0C0: .4byte gDispIo
.L0809F0C4: .4byte 0x06012000
.L0809F0C8: .4byte gUnknown_08A1B9EC
.L0809F0CC: .4byte gBuf
.L0809F0D0: .4byte gBg1Tm
.L0809F0D4: .4byte gUnknown_02013660
.L0809F0D8: .4byte gUnknown_02013698
.L0809F0DC: .4byte gBg0Tm+0xDE
.L0809F0E0: .4byte gUnknown_08A19CCC
.L0809F0E4: .4byte 0x06015000
.L0809F0E8: .4byte gUnknown_08A1A084
.L0809F0EC: .4byte gBg2Tm+0x1E
.L0809F0F0: .4byte func_0809ECFC
.L0809F0F4: .4byte 0x00000203
.L0809F0F8: .4byte gBg0Tm

	THUMB_FUNC_END func_0809ED8C

	THUMB_FUNC_START func_0809F0FC
func_0809F0FC: @ 0x0809F0FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809F120  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809F124
	bl GM_GetBaseMenuProc
	cmp r0, #0
	beq .L0809F134
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x2a
	b .L0809F132
	.align 2, 0
.L0809F120: .4byte gGmData
.L0809F124:
	ldr r0, .L0809F14C  @ gUnknown_08A1829C
	bl FindProc
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
.L0809F132:
	strb r1, [r0]
.L0809F134:
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl EndFaceById
	bl EndScreenMenuScrollingBg
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809F14C: .4byte gUnknown_08A1829C

	THUMB_FUNC_END func_0809F0FC

	THUMB_FUNC_START func_0809F150
func_0809F150: @ 0x0809F150
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r4, #0
	bl func_0809F370
	ldr r0, .L0809F1F0  @ gUnknown_02013698
	ldr r1, .L0809F1F4  @ gBg2Tm+0x1E
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl func_0809D300
	ldr r0, .L0809F1F8  @ gBg0Tm+0x244
	ldr r1, [r4, #0x2c]
	bl func_0809B830
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl func_080AD51C
	movs r0, #5
	bl EnableBgSync
	ldr r0, .L0809F1FC  @ func_0809EC38
	movs r1, #2
	adds r2, r4, #0
	bl func_080ACE20
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq .L0809F210
	ldr r0, .L0809F200  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq .L0809F208
	ldr r2, .L0809F204  @ gUnknown_020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl ShowItemHelpBox
	movs r0, #1
	b .L0809F20E
	.align 2, 0
.L0809F1F0: .4byte gUnknown_02013698
.L0809F1F4: .4byte gBg2Tm+0x1E
.L0809F1F8: .4byte gBg0Tm+0x244
.L0809F1FC: .4byte func_0809EC38
.L0809F200: .4byte gUnknown_02012F56
.L0809F204: .4byte gUnknown_020122D4
.L0809F208:
	bl MoveableHelpBox_OnEnd
	movs r0, #0xff
.L0809F20E:
	strh r0, [r4, #0x36]
.L0809F210:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809F150

	THUMB_FUNC_START func_0809F218
func_0809F218: @ 0x0809F218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge .L0809F24A
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r6, r0, #0
	subs r6, #0x60
.L0809F24A:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne .L0809F266
	ldrb r0, [r5]
	cmp r0, #0
	bne .L0809F25C
	movs r0, #8
	b .L0809F25E
.L0809F25C:
	subs r0, #1
.L0809F25E:
	strb r0, [r5]
	adds r0, r7, #0
	bl func_0809F150
.L0809F266:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt .L0809F28A
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	adds r6, r0, #0
.L0809F28A:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne .L0809F2BA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
.L0809F2BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809F218

	THUMB_FUNC_START func_0809F2C4
func_0809F2C4: @ 0x0809F2C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge .L0809F2F6
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
.L0809F2F6:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne .L0809F312
	ldrb r0, [r5]
	cmp r0, #8
	bne .L0809F308
	movs r0, #0
	b .L0809F30A
.L0809F308:
	adds r0, #1
.L0809F30A:
	strb r0, [r5]
	adds r0, r7, #0
	bl func_0809F150
.L0809F312:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt .L0809F336
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	negs r6, r0
.L0809F336:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl SetBgOffset
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne .L0809F366
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
.L0809F366:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809F2C4

	THUMB_FUNC_START func_0809F370
func_0809F370: @ 0x0809F370
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, .L0809F398  @ gUnknown_02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne .L0809F39C
	mov r3, ip
	adds r3, #0x33
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b .L0809F3BA
	.align 2, 0
.L0809F398: .4byte gUnknown_02012F56
.L0809F39C:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble .L0809F3BA
	strh r0, [r4]
.L0809F3BA:
	ldrh r0, [r5]
	cmp r0, #6
	bls .L0809F3D8
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble .L0809F3D8
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
.L0809F3D8:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809F370

	THUMB_FUNC_START func_0809F3F4
func_0809F3F4: @ 0x0809F3F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl InitIcons
	ldr r0, .L0809F48C  @ gBg2Tm+0x1E
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl func_0809D418
	ldr r0, .L0809F490  @ gBg0Tm+0x244
	ldr r1, [r4, #0x2c]
	bl func_0809B830
	movs r0, #5
	bl EnableBgSync
	cmp r7, #0
	bge .L0809F446
	ldr r0, .L0809F494  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl func_0809D47C
.L0809F446:
	cmp r7, #0
	ble .L0809F460
	ldr r0, .L0809F494  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl func_0809D47C
.L0809F460:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809F48C: .4byte gBg2Tm+0x1E
.L0809F490: .4byte gBg0Tm+0x244
.L0809F494: .4byte gUnknown_02013698

	THUMB_FUNC_END func_0809F3F4

	THUMB_FUNC_START func_0809F498
func_0809F498: @ 0x0809F498
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq .L0809F4B6
	ldr r0, .L0809F4CC  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0809F4D4
.L0809F4B6:
	ldr r0, .L0809F4D0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0809F4C4
	b .L0809F5E2
.L0809F4C4:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0809F5E2
	.align 2, 0
.L0809F4CC: .4byte gUnknown_02012F56
.L0809F4D0: .4byte gPlaySt
.L0809F4D4:
	movs r4, #0
	strh r4, [r6, #0x36]
	ldr r1, [r6, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r0, .L0809F5B8  @ gUnknown_020122D4
	mov r9, r0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	strh r4, [r0, #2]
	bl func_080982B8
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r6, #0
	bl func_0809F370
	bl InitIcons
	ldr r0, .L0809F5BC  @ gBg0Tm+0x244
	ldr r4, .L0809F5C0  @ gUnknown_02013670
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl func_0809B74C
	adds r4, #0x28
	ldr r1, .L0809F5C4  @ gBg2Tm+0x1E
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	add r0, r8
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl func_0809D300
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0809F56E
	ldr r0, .L0809F5C8  @ func_0809EC38
	movs r1, #1
	adds r2, r6, #0
	bl func_080ACE20
.L0809F56E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl func_080AD51C
	movs r0, #5
	bl EnableBgSync
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne .L0809F5D0
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L0809F5CC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809F5E2
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809F5E2
	.align 2, 0
.L0809F5B8: .4byte gUnknown_020122D4
.L0809F5BC: .4byte gBg0Tm+0x244
.L0809F5C0: .4byte gUnknown_02013670
.L0809F5C4: .4byte gBg2Tm+0x1E
.L0809F5C8: .4byte func_0809EC38
.L0809F5CC: .4byte gPlaySt
.L0809F5D0:
	ldr r0, .L0809F5F0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809F5E2
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809F5E2:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809F5F0: .4byte gPlaySt

	THUMB_FUNC_END func_0809F498

	THUMB_FUNC_START func_0809F5F4
func_0809F5F4: @ 0x0809F5F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt .L0809F620
	cmp r3, #0
	beq .L0809F620
	adds r0, r3, #1
	strh r0, [r4]
.L0809F620:
	mov r4, ip
	adds r4, #0x33
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble .L0809F654
	ldr r0, .L0809F684  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq .L0809F654
	subs r0, r5, #1
	strh r0, [r6]
.L0809F654:
	mov r0, ip
	bl func_0809F370
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl func_080AD51C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809F684: .4byte gUnknown_02012F56

	THUMB_FUNC_END func_0809F5F4

	THUMB_FUNC_START func_0809F688
func_0809F688: @ 0x0809F688
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	movs r1, #0x38
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov r9, r1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r0
	ldrh r0, [r7]
	movs r2, #0xf
	mov sl, r2
	mov r1, sl
	ands r1, r0
	mov sl, r1
	cmp r1, #0
	beq .L0809F6C0
	b .L0809F908
.L0809F6C0:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq .L0809F6CC
	cmp r0, #0xff
	beq .L0809F6CC
	b .L0809F7C0
.L0809F6CC:
	ldr r1, .L0809F708  @ gKeySt
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq .L0809F714
	ldr r0, .L0809F70C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq .L0809F724
	ldr r1, .L0809F710  @ gUnknown_020122D4
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, r9
	lsls r1, r0, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl ShowItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b .L0809FA7A
	.align 2, 0
.L0809F708: .4byte gKeySt
.L0809F70C: .4byte gUnknown_02012F56
.L0809F710: .4byte gUnknown_020122D4
.L0809F714:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq .L0809F794
	ldr r0, .L0809F73C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne .L0809F744
.L0809F724:
	ldr r0, .L0809F740  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0809F732
	b .L0809FA7A
.L0809F732:
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L0809FA7A
	.align 2, 0
.L0809F73C: .4byte gUnknown_02012F56
.L0809F740: .4byte gPlaySt
.L0809F744:
	ldr r0, .L0809F76C  @ gUnknown_020122D4
	mov r2, r9
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0809F770
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl func_080AC9D4
	adds r0, r4, #0
	movs r1, #7
	b .L0809F774
	.align 2, 0
.L0809F76C: .4byte gUnknown_020122D4
.L0809F770:
	adds r0, r4, #0
	movs r1, #6
.L0809F774:
	bl Proc_Goto
	ldr r0, .L0809F790  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L0809F786
	b .L0809FA7A
.L0809F786:
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L0809FA7A
	.align 2, 0
.L0809F790: .4byte gPlaySt
.L0809F794:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq .L0809F7E0
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, .L0809F7BC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809F7B6
	movs r0, #0x6b
	bl m4aSongNumStart
.L0809F7B6:
	mov r0, sl
	strh r0, [r4, #0x36]
	b .L0809FA7A
	.align 2, 0
.L0809F7BC: .4byte gPlaySt
.L0809F7C0:
	ldr r2, .L0809F7DC  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq .L0809F7E0
	bl MoveableHelpBox_OnEnd
	mov r1, sl
	strh r1, [r4, #0x36]
	b .L0809FA7A
	.align 2, 0
.L0809F7DC: .4byte gKeySt
.L0809F7E0:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq .L0809F828
	movs r0, #0
	bl func_080ACDA4
	ldr r0, .L0809F824  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809F80A
	movs r0, #0x67
	bl m4aSongNumStart
.L0809F80A:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl func_0809F218
	b .L0809FA7A
	.align 2, 0
.L0809F824: .4byte gPlaySt
.L0809F828:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0809F864
	movs r0, #1
	bl func_080ACDA4
	ldr r0, .L0809F860  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809F848
	movs r0, #0x67
	bl m4aSongNumStart
.L0809F848:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl func_0809F2C4
	b .L0809FA7A
	.align 2, 0
.L0809F860: .4byte gPlaySt
.L0809F864:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809F878
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b .L0809F87E
.L0809F878:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
.L0809F87E:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne .L0809F8AC
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x33
	adds r5, r4, #0
	adds r5, #0x38
	cmp r0, #0
	beq .L0809F8C8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne .L0809F8C8
.L0809F8AC:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq .L0809F8C8
	subs r0, r1, #1
	strh r0, [r3]
.L0809F8C8:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne .L0809F8EA
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809F966
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne .L0809F966
.L0809F8EA:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, .L0809F904  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge .L0809F966
	adds r0, r1, #1
	strh r0, [r2]
	b .L0809F966
	.align 2, 0
.L0809F904: .4byte gUnknown_02012F56
.L0809F908:
	mov r1, r9
	lsls r0, r1, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt .L0809F926
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
.L0809F926:
	ldrb r0, [r6]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble .L0809F94E
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
.L0809F94E:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	mov r5, r8
.L0809F966:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp r9, r0
	bne .L0809F974
	b .L0809FA7A
.L0809F974:
	ldr r7, .L0809F9F0  @ gUnknown_020122D4
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, .L0809F9F4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809F990
	movs r0, #0x66
	bl m4aSongNumStart
.L0809F990:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r7
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq .L0809F9B0
	adds r0, r4, #0
	bl func_0809EC38
.L0809F9B0:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4a
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt .L0809F9F8
	cmp r3, #0
	beq .L0809F9F8
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq .L0809F9E2
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl ShowItemHelpBox
.L0809F9E2:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	b .L0809FA30
	.align 2, 0
.L0809F9F0: .4byte gUnknown_020122D4
.L0809F9F4: .4byte gPlaySt
.L0809F9F8:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble .L0809FA3C
	ldr r0, .L0809FA38  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq .L0809FA3C
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq .L0809FA28
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl ShowItemHelpBox
.L0809FA28:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
.L0809FA30:
	adds r0, r4, #0
	bl func_0809F3F4
	b .L0809FA7A
	.align 2, 0
.L0809FA38: .4byte gUnknown_02012F56
.L0809FA3C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq .L0809FA5C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl ShowItemHelpBox
.L0809FA5C:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl func_080AD51C
.L0809FA7A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809F688

	THUMB_FUNC_START func_0809FA88
func_0809FA88: @ 0x0809FA88
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov ip, r0
	adds r5, r1, #0
	cmp r5, #5
	bne .L0809FAA6
	movs r5, #4
	b .L0809FAAE
.L0809FAA6:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq .L0809FAAE
	subs r5, #1
.L0809FAAE:
	cmp r1, #0
	beq .L0809FB2C
	ldr r2, .L0809FAD4  @ gKeySt
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	adds r3, r4, #0
	adds r3, #0x30
	cmp r0, #0
	beq .L0809FAE4
	ldrb r0, [r3]
	cmp r0, #0
	beq .L0809FAD8
	subs r0, #1
	strb r0, [r3]
	b .L0809FAE4
	.align 2, 0
.L0809FAD4: .4byte gKeySt
.L0809FAD8:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809FAE4
	strb r5, [r3]
.L0809FAE4:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r4, #0x80
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809FB0A
	ldrb r0, [r3]
	cmp r0, r5
	bge .L0809FAFC
	adds r0, #1
	b .L0809FB08
.L0809FAFC:
	ldrh r1, [r2, #8]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq .L0809FB0A
	movs r0, #0
.L0809FB08:
	strb r0, [r3]
.L0809FB0A:
	ldrb r3, [r3]
	cmp ip, r3
	beq .L0809FB2C
	ldr r0, .L0809FB28  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809FB22
	movs r0, #0x66
	bl m4aSongNumStart
.L0809FB22:
	movs r0, #1
	b .L0809FB2E
	.align 2, 0
.L0809FB28: .4byte gPlaySt
.L0809FB2C:
	movs r0, #0
.L0809FB2E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0809FA88

	THUMB_FUNC_START func_0809FB34
func_0809FB34: @ 0x0809FB34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne .L0809FB50
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b .L0809FB56
.L0809FB50:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
.L0809FB56:
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809FB34

	THUMB_FUNC_START func_0809FB70
func_0809FB70: @ 0x0809FB70
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r1, r1, #1
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, .L0809FC0C  @ gUnknown_020122D4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl func_080982B8
	cmp r5, #0
	bne .L0809FBB6
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
.L0809FBB6:
	adds r0, r6, #0
	bl func_0809F370
	ldr r0, .L0809FC10  @ gBg0Tm+0x244
	ldr r4, .L0809FC14  @ gUnknown_02013670
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl func_0809B74C
	adds r4, #0x28
	ldr r1, .L0809FC18  @ gBg2Tm+0x1E
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl func_0809D300
	ldr r0, .L0809FC1C  @ func_0809EC38
	movs r1, #1
	adds r2, r6, #0
	bl func_080ACE20
	movs r0, #4
	bl EnableBgSync
	ldr r0, .L0809FC20  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809FC06
	movs r0, #0x6a
	bl m4aSongNumStart
.L0809FC06:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0809FC0C: .4byte gUnknown_020122D4
.L0809FC10: .4byte gBg0Tm+0x244
.L0809FC14: .4byte gUnknown_02013670
.L0809FC18: .4byte gBg2Tm+0x1E
.L0809FC1C: .4byte func_0809EC38
.L0809FC20: .4byte gPlaySt

	THUMB_FUNC_END func_0809FB70

	THUMB_FUNC_START func_0809FC24
func_0809FC24: @ 0x0809FC24
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne .L0809FC4C
	ldr r0, .L0809FC48  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809FD0C
	bl MoveableHelpBox_OnEnd
	movs r0, #0
	strh r0, [r5, #0x36]
	b .L0809FD4E
	.align 2, 0
.L0809FC48: .4byte gKeySt
.L0809FC4C:
	ldr r0, .L0809FC80  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809FC84
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq .L0809FD4E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl ShowItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b .L0809FD4E
	.align 2, 0
.L0809FC80: .4byte gKeySt
.L0809FC84:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0809FCE0
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, .L0809FCC4  @ gUnknown_020122D4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r3, [r2]
	lsls r3, r3, #1
	adds r2, #5
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl func_08097F44
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0809FCCC
	movs r1, #1
	negs r1, r1
	ldr r2, .L0809FCC8  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r5, #0
	bl func_08097DA8
	b .L0809FD4E
	.align 2, 0
.L0809FCC4: .4byte gUnknown_020122D4
.L0809FCC8: .4byte 0x0000088B
.L0809FCCC:
	movs r0, #0
	bl func_080ACA84
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl func_0809FB70
	b .L0809FD4E
.L0809FCE0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0809FD0C
	movs r0, #0
	bl func_080ACA84
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, .L0809FD08  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0809FD4E
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L0809FD4E
	.align 2, 0
.L0809FD08: .4byte gPlaySt
.L0809FD0C:
	adds r0, r5, #0
	bl func_0809FA88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0809FD4E
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne .L0809FD4E
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq .L0809FD4E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl ShowItemHelpBox
.L0809FD4E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0809FC24

	THUMB_FUNC_START func_0809FD54
func_0809FD54: @ 0x0809FD54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r0, r0, r1
	ldrh r4, [r0]
	lsls r4, r4, #2
	ldr r0, .L0809FD84  @ gUnknown_020122D4
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitByPid
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl func_0809BE60
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809FD84: .4byte gUnknown_020122D4

	THUMB_FUNC_END func_0809FD54

	THUMB_FUNC_START func_0809FD88
func_0809FD88: @ 0x0809FD88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0809FD9C  @ gUnknown_08A19424
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809FD9C: .4byte gUnknown_08A19424

	THUMB_FUNC_END func_0809FD88

	THUMB_FUNC_START func_0809FDA0
func_0809FDA0: @ 0x0809FDA0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, .L0809FDCC  @ 0x0000DF80
	movs r5, #0x30
	movs r4, #3
.L0809FDAA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, .L0809FDD0  @ Sprite_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge .L0809FDAA
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0809FDCC: .4byte 0x0000DF80
.L0809FDD0: .4byte Sprite_32x16

	THUMB_FUNC_END func_0809FDA0

	THUMB_FUNC_START func_0809FDD4
func_0809FDD4: @ 0x0809FDD4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0809FE10  @ func_0809FDA0
	bl StartParallelWorker
	ldr r0, .L0809FE14  @ gUnknown_08A1951C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, .L0809FE18  @ gUnknown_08A19524
	ldr r1, [r1]
	bl GetMsgTo
	adds r2, r0, #0
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl func_080ADD24
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809FE10: .4byte func_0809FDA0
.L0809FE14: .4byte gUnknown_08A1951C
.L0809FE18: .4byte gUnknown_08A19524

	THUMB_FUNC_END func_0809FDD4

	THUMB_FUNC_START func_0809FE1C
func_0809FE1C: @ 0x0809FE1C
	push {lr}
	ldr r0, .L0809FE4C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls .L0809FE2E
	movs r2, #0
.L0809FE2E:
	cmp r2, #0xc
	bne .L0809FE38
	ldr r1, .L0809FE50  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
.L0809FE38:
	cmp r2, #0x34
	beq .L0809FE40
	cmp r2, #0
	bne .L0809FE48
.L0809FE40:
	ldr r1, .L0809FE50  @ 0x04000050
	ldr r2, .L0809FE54  @ 0x00000242
	adds r0, r2, #0
	strh r0, [r1]
.L0809FE48:
	pop {r0}
	bx r0
	.align 2, 0
.L0809FE4C: .4byte 0x04000006
.L0809FE50: .4byte 0x04000050
.L0809FE54: .4byte 0x00000242

	THUMB_FUNC_END func_0809FE1C

	THUMB_FUNC_START func_0809FE58
func_0809FE58: @ 0x0809FE58
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x34]
	movs r1, #0xff
	strh r1, [r0, #0x32]
	adds r0, #0x30
	strb r2, [r0]
	bx lr

	THUMB_FUNC_END func_0809FE58

	THUMB_FUNC_START func_0809FE68
func_0809FE68: @ 0x0809FE68
	push {r4, r5, lr}
	ldr r4, .L0809FEE4  @ gUnknown_02013648
	ldr r1, .L0809FEE8  @ 0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, .L0809FEEC  @ Pal_SystemText
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r5, r4, #0
	adds r5, #0x90
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	ldr r0, .L0809FEF0  @ 0x0000059C
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L0809FEF4  @ 0x0000059B
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L0809FEF8  @ 0x0000059D
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #3
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0809FEE4: .4byte gUnknown_02013648
.L0809FEE8: .4byte 0x06011000
.L0809FEEC: .4byte Pal_SystemText
.L0809FEF0: .4byte 0x0000059C
.L0809FEF4: .4byte 0x0000059B
.L0809FEF8: .4byte 0x0000059D

	THUMB_FUNC_END func_0809FE68

	THUMB_FUNC_START func_0809FEFC
func_0809FEFC: @ 0x0809FEFC
	push {r4, lr}
	sub sp, #4
	ldr r0, .L0809FF5C  @ 0x00008840
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x5b
	movs r2, #8
	movs r3, #4
	bl func_0809A31C
	ldr r4, .L0809FF60  @ Sprite_32x16
	ldr r0, .L0809FF64  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, .L0809FF68  @ 0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, .L0809FF6C  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, .L0809FF70  @ 0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0809FF5C: .4byte 0x00008840
.L0809FF60: .4byte Sprite_32x16
.L0809FF64: .4byte 0x0000B088
.L0809FF68: .4byte 0x0000B08C
.L0809FF6C: .4byte 0x0000B080
.L0809FF70: .4byte 0x0000B084

	THUMB_FUNC_END func_0809FEFC

	THUMB_FUNC_START func_0809FF74
func_0809FF74: @ 0x0809FF74
	push {lr}
	sub sp, #4
	ldr r3, .L0809FFA0  @ Sprite_32x16
	ldr r0, .L0809FFA4  @ 0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, .L0809FFA8  @ Sprite_8x16
	ldr r0, .L0809FFAC  @ 0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x48
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L0809FFA0: .4byte Sprite_32x16
.L0809FFA4: .4byte 0x0000B090
.L0809FFA8: .4byte Sprite_8x16
.L0809FFAC: .4byte 0x0000B094

	THUMB_FUNC_END func_0809FF74

	THUMB_FUNC_START func_0809FFB0
func_0809FFB0: @ 0x0809FFB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, .L080A0008  @ gBg0Tm+0x268
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	cmp r4, #0
	beq .L080A0022
	adds r0, r4, #0
	bl func_080B5268
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq .L0809FFE2
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L080A000C
.L0809FFE2:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b .L080A0018
	.align 2, 0
.L080A0008: .4byte gBg0Tm+0x268
.L080A000C:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
.L080A0018:
	ldr r0, .L080A0030  @ gBg0Tm+0x276
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
.L080A0022:
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A0030: .4byte gBg0Tm+0x276

	THUMB_FUNC_END func_0809FFB0

	THUMB_FUNC_START func_080A0034
func_080A0034: @ 0x080A0034
	push {r4, r5, lr}
	ldr r4, .L080A0074  @ gBg0Tm+0x1E8
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r5, r4, r0
	bl GetGold
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	ldr r0, .L080A0078  @ 0x0000028E
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A0074: .4byte gBg0Tm+0x1E8
.L080A0078: .4byte 0x0000028E

	THUMB_FUNC_END func_080A0034

	THUMB_FUNC_START func_080A007C
func_080A007C: @ 0x080A007C
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r4, .L080A00D4  @ gBg0Tm+0x68
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetMsg
	ldr r3, .L080A00D8  @ gUnknown_02013660
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #2
	bl PutDrawText
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xab
	adds r1, r4, #0
	movs r3, #2
	bl PutFaceChibi
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A00D4: .4byte gBg0Tm+0x68
.L080A00D8: .4byte gUnknown_02013660

	THUMB_FUNC_END func_080A007C

	THUMB_FUNC_START func_080A00DC
func_080A00DC: @ 0x080A00DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, .L080A0300  @ gDispIo
	ldrb r1, [r5]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldrb r2, [r5, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5, #0xc]
	ldrb r2, [r5, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	strb r1, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl LoadObjUiGfx
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
	ldr r0, .L080A0304  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadHelpBoxGfx
	movs r0, #4
	bl ApplyIconPalettes
	bl RestartScreenMenuScrollingBg
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #8
	bl func_08098C8C
	ldr r0, .L080A0308  @ gUnknown_08A1BBD0
	ldr r4, .L080A030C  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L080A0310  @ gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	movs r0, #7
	bl EnableBgSync
	ldr r0, [r7, #0x2c]
	bl GetUnitFid
	adds r1, r0, #0
	ldr r0, .L080A0314  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x48
	bl NewFace2
	adds r0, r7, #0
	bl func_080AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	ldrb r0, [r5, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r5
	mov r8, r0
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	mov r0, r9
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r9
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetBlendConfig
	adds r0, r7, #0
	bl StartGreenText
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #2
	adds r3, r7, #0
	bl ShowRIsInfo
	movs r0, #0xa5
	movs r1, #0x80
	movs r2, #0xa
	adds r3, r7, #0
	bl func_080984A8
	movs r0, #0xa5
	movs r1, #0x80
	bl func_080984CC
	ldr r4, .L080A0318  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl InitText
	bl func_0809FE68
	adds r4, #0x10
	movs r5, #4
.L080A029E:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L080A029E
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, .L080A031C  @ func_0809FE1C
	bl SetOnHBlankA
	movs r0, #4
	bl EnableBgSync
	ldr r0, .L080A0320  @ gBg0Tm+0x244
	ldr r1, .L080A0324  @ gUnknown_02013670
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl func_0809B74C
	bl func_080A007C
	ldr r0, .L080A0328  @ func_0809FF74
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r1, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl func_0809FFB0
	bl func_080A0034
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A0300: .4byte gDispIo
.L080A0304: .4byte 0x06014000
.L080A0308: .4byte gUnknown_08A1BBD0
.L080A030C: .4byte gBuf
.L080A0310: .4byte gBg1Tm
.L080A0314: .4byte 0x00000503
.L080A0318: .4byte gUnknown_02013660
.L080A031C: .4byte func_0809FE1C
.L080A0320: .4byte gBg0Tm+0x244
.L080A0324: .4byte gUnknown_02013670
.L080A0328: .4byte func_0809FF74

	THUMB_FUNC_END func_080A00DC

	THUMB_FUNC_START func_080A032C
func_080A032C: @ 0x080A032C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, .L080A035C  @ gKeySt
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq .L080A0372
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq .L080A0360
	subs r0, #1
	strb r0, [r2]
	b .L080A03A2
	.align 2, 0
.L080A035C: .4byte gKeySt
.L080A0360:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L080A03BC
	subs r0, r3, #1
	strb r0, [r2]
	b .L080A03A2
.L080A0372:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L080A03BC
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge .L080A0394
	adds r0, r1, #1
	strb r0, [r2]
	b .L080A03A2
.L080A0394:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L080A03BC
	strb r5, [r2]
.L080A03A2:
	ldr r0, .L080A03B8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A03B4
	movs r0, #0x66
	bl m4aSongNumStart
.L080A03B4:
	movs r0, #1
	b .L080A03BE
	.align 2, 0
.L080A03B8: .4byte gPlaySt
.L080A03BC:
	movs r0, #0
.L080A03BE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A032C

	THUMB_FUNC_START func_080A03C4
func_080A03C4: @ 0x080A03C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L080A0418  @ gBg0Tm+0x244
	ldr r1, .L080A041C  @ gUnknown_02013670
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl func_0809B74C
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl func_0809FFB0
	movs r0, #0
	bl func_080ACA84
	ldr r0, .L080A0420  @ func_0809FEFC
	bl GetParallelWorker
	bl Proc_End
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	movs r0, #0
	adds r1, r4, #0
	bl func_0809FDD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A0418: .4byte gBg0Tm+0x244
.L080A041C: .4byte gUnknown_02013670
.L080A0420: .4byte func_0809FEFC

	THUMB_FUNC_END func_080A03C4

	THUMB_FUNC_START func_080A0424
func_080A0424: @ 0x080A0424
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne .L080A044C
	ldr r0, .L080A0448  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080A0518
	bl MoveableHelpBox_OnEnd
	movs r0, #0
	strh r0, [r4, #0x34]
	b .L080A056A
	.align 2, 0
.L080A0448: .4byte gKeySt
.L080A044C:
	ldr r0, .L080A0484  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080A0488
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne .L080A0472
	b .L080A056A
.L080A0472:
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl ShowItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x34]
	b .L080A056A
	.align 2, 0
.L080A0484: .4byte gKeySt
.L080A0488:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080A04F0
	ldr r1, [r4, #0x2c]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl func_080B5268
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L080A04BA
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq .L080A04CE
.L080A04BA:
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0x85
	lsls r2, r2, #4
	movs r0, #0x10
	adds r3, r4, #0
	bl func_08097DA8
	b .L080A056A
.L080A04CE:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, .L080A04EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A056A
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L080A056A
	.align 2, 0
.L080A04EC: .4byte gPlaySt
.L080A04F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080A0518
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, .L080A0514  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A056A
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L080A056A
	.align 2, 0
.L080A0514: .4byte gPlaySt
.L080A0518:
	adds r0, r4, #0
	bl func_080A032C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A056A
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl func_080AD51C
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl func_0809FFB0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne .L080A056A
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq .L080A056A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl ShowItemHelpBox
.L080A056A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A0424

	THUMB_FUNC_START func_080A0570
func_080A0570: @ 0x080A0570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, .L080A05B8  @ func_0809FEFC
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl func_080AC9D4
	ldrb r0, [r5]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl func_080AD51C
	movs r0, #1
	adds r1, r4, #0
	bl func_0809FDD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A05B8: .4byte func_0809FEFC

	THUMB_FUNC_END func_080A0570

	THUMB_FUNC_START func_080A05BC
func_080A05BC: @ 0x080A05BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl func_080B5268
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AddGold
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, .L080A0628  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A0602
	movs r0, #0xb9
	bl m4aSongNumStart
.L080A0602:
	bl func_080A0034
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne .L080A0634
	ldr r0, .L080A062C  @ gBg0Tm+0x244
	ldr r1, .L080A0630  @ gUnknown_02013670
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl func_0809B74C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b .L080A0646
	.align 2, 0
.L080A0628: .4byte gPlaySt
.L080A062C: .4byte gBg0Tm+0x244
.L080A0630: .4byte gUnknown_02013670
.L080A0634:
	ldrb r1, [r5]
	cmp r0, r1
	bne .L080A063E
	subs r0, #1
	strb r0, [r5]
.L080A063E:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L080A0646:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A05BC

	THUMB_FUNC_START func_080A064C
func_080A064C: @ 0x080A064C
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, .L080A0670  @ gKeySt
	ldr r3, [r6]
	ldrh r2, [r3, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L080A0674
	cmp r5, #0
	bne .L080A0680
	adds r0, r1, #0
	bl func_080A05BC
	b .L080A06E6
	.align 2, 0
.L080A0670: .4byte gKeySt
.L080A0674:
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq .L080A06A0
.L080A0680:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, .L080A069C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A06E6
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L080A06E6
	.align 2, 0
.L080A069C: .4byte gPlaySt
.L080A06A0:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L080A06AC
	strb r2, [r4]
.L080A06AC:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080A06BC
	movs r0, #1
	strb r0, [r4]
.L080A06BC:
	ldrb r0, [r4]
	cmp r5, r0
	beq .L080A06E6
	ldr r0, .L080A06EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A06D4
	movs r0, #0x67
	bl m4aSongNumStart
.L080A06D4:
	ldrb r0, [r4]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl func_080AD51C
.L080A06E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A06EC: .4byte gPlaySt

	THUMB_FUNC_END func_080A064C

	THUMB_FUNC_START func_080A06F0
func_080A06F0: @ 0x080A06F0
	push {lr}
	bl EndScreenMenuScrollingBg
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	bl func_08098500
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A06F0

	THUMB_FUNC_START func_080A070C
func_080A070C: @ 0x080A070C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080A0720  @ gUnknown_08A19528
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A0720: .4byte gUnknown_08A19528

	THUMB_FUNC_END func_080A070C

	THUMB_FUNC_START func_080A0724
func_080A0724: @ 0x080A0724
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, .L080A0754  @ 0x06011000
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl func_0808F128
	movs r0, #0x7c
	bl func_0808E9D8
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
.L080A0754: .4byte 0x06011000

	THUMB_FUNC_END func_080A0724

	THUMB_FUNC_START nullsub_19
nullsub_19: @ 0x080A0758
	bx lr

	THUMB_FUNC_END nullsub_19

	THUMB_FUNC_START __malloc_unlock_2
__malloc_unlock_2: @ 0x080A075C
	bx lr

	THUMB_FUNC_END __malloc_unlock_2

	THUMB_FUNC_START func_080A0760
func_080A0760: @ 0x080A0760
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	movs r4, #1
	strb r4, [r0]
	bl func_080A0A34
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	bl func_080A0A70
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A0760

	THUMB_FUNC_START func_080A078C
func_080A078C: @ 0x080A078C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r9, r0
	ldr r6, .L080A084C  @ gUnknown_02013498
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	ldr r0, .L080A0850  @ gBg0Tm+0x280
	movs r1, #0x1f
	movs r2, #0xa
	movs r3, #0
	bl TmFillRect_thm
	movs r4, #0
.L080A07B4:
	adds r0, r6, #0
	bl ClearText
	ldr r1, .L080A0854  @ gUnknown_08A196D0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r5, r6, #0
	adds r6, #8
	asrs r2, r4, #1
	lsls r2, r2, #6
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, .L080A0858  @ gBg0Tm
	mov r8, r0
	adds r1, r2, r0
	movs r2, #0
	mov r0, r9
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080A07FE
	movs r2, #1
.L080A07FE:
	movs r7, #0
	str r7, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	adds r4, #1
	cmp r4, #3
	ble .L080A07B4
	ldr r0, .L080A084C  @ gUnknown_02013498
	adds r6, r0, #0
	adds r6, #0xf0
	adds r0, r6, #0
	bl ClearText
	ldr r0, .L080A085C  @ gUnknown_08A196BC
	ldr r0, [r0, #0xc]
	bl GetMsg
	mov r1, r8
	adds r1, #0x2c
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A084C: .4byte gUnknown_02013498
.L080A0850: .4byte gBg0Tm+0x280
.L080A0854: .4byte gUnknown_08A196D0
.L080A0858: .4byte gBg0Tm
.L080A085C: .4byte gUnknown_08A196BC

	THUMB_FUNC_END func_080A078C

	THUMB_FUNC_START func_080A0860
func_080A0860: @ 0x080A0860
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, .L080A08F0  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L080A0884
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L080A0884
	subs r0, r4, #1
	strb r0, [r3]
.L080A0884:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq .L080A08A2
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L080A08A2
	adds r0, r1, #1
	strb r0, [r3]
.L080A08A2:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L080A08BA
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne .L080A08BA
	adds r0, r1, #2
	strb r0, [r3]
.L080A08BA:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080A08D2
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq .L080A08D2
	subs r0, r1, #2
	strb r0, [r3]
.L080A08D2:
	ldrb r3, [r3]
	cmp r4, r3
	beq .L080A08F8
	ldr r0, .L080A08F4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A08EA
	movs r0, #0x65
	bl m4aSongNumStart
.L080A08EA:
	movs r0, #1
	b .L080A08FA
	.align 2, 0
.L080A08F0: .4byte gKeySt
.L080A08F4: .4byte gPlaySt
.L080A08F8:
	movs r0, #0
.L080A08FA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0860

	THUMB_FUNC_START func_080A0900
func_080A0900: @ 0x080A0900
	push {r4, lr}
	adds r4, r0, #0
	bl func_0808F270
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndScreenMenuScrollingBg
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A0900

	THUMB_FUNC_START func_080A0924
func_080A0924: @ 0x080A0924
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	blt .L080A093E
	cmp r1, #1
	ble .L080A093E
	cmp r1, #2
	bne .L080A093E
	movs r1, #4
	bl Proc_Goto
.L080A093E:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A0924

	THUMB_FUNC_START StartPrepScreenSupportMenu
StartPrepScreenSupportMenu: @ 0x080A0944
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080A0958  @ gUnknown_08A1962C
	bl SpawnProcLocking
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A0958: .4byte gUnknown_08A1962C

	THUMB_FUNC_END StartPrepScreenSupportMenu

	THUMB_FUNC_START CanPrepScreenSupport
CanPrepScreenSupport: @ 0x080A095C
	push {lr}
	cmp r0, #1
	beq .L080A0976
	cmp r0, #1
	bgt .L080A096C
	cmp r0, #0
	beq .L080A0972
	b .L080A0986
.L080A096C:
	cmp r0, #2
	beq .L080A097C
	b .L080A0986
.L080A0972:
	movs r0, #1
	b .L080A0988
.L080A0976:
	bl func_080A0A34
	b .L080A0980
.L080A097C:
	bl func_080A0A70
.L080A0980:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L080A0988
.L080A0986:
	movs r0, #0
.L080A0988:
	pop {r1}
	bx r1

	THUMB_FUNC_END CanPrepScreenSupport

	THUMB_FUNC_START func_080A098C
func_080A098C: @ 0x080A098C
	push {lr}
	ldr r0, .L080A09A4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
.L080A09A4: .4byte gPlaySt

	THUMB_FUNC_END func_080A098C

	THUMB_FUNC_START func_080A09A8
func_080A09A8: @ 0x080A09A8
	push {lr}
	ldr r0, .L080A09C0  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x76
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
.L080A09C0: .4byte gPlaySt

	THUMB_FUNC_END func_080A09A8

	THUMB_FUNC_START func_080A09C4
func_080A09C4: @ 0x080A09C4
	push {lr}
	ldr r0, .L080A09DC  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7c
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
.L080A09DC: .4byte gPlaySt

	THUMB_FUNC_END func_080A09C4

	THUMB_FUNC_START func_080A09E0
func_080A09E0: @ 0x080A09E0
	push {lr}
	ldr r0, .L080A09F8  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7f
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
.L080A09F8: .4byte gPlaySt

	THUMB_FUNC_END func_080A09E0

	THUMB_FUNC_START func_080A09FC
func_080A09FC: @ 0x080A09FC
	push {lr}
	ldr r0, .L080A0A14  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
.L080A0A14: .4byte gPlaySt

	THUMB_FUNC_END func_080A09FC

	THUMB_FUNC_START func_080A0A18
func_080A0A18: @ 0x080A0A18
	push {lr}
	bl func_080A098C
	cmp r0, #0
	beq .L080A0A2E
	bl func_080A09A8
	cmp r0, #0
	bne .L080A0A2E
	movs r0, #1
	b .L080A0A30
.L080A0A2E:
	movs r0, #0
.L080A0A30:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0A18

	THUMB_FUNC_START func_080A0A34
func_080A0A34: @ 0x080A0A34
	push {lr}
	ldr r0, .L080A0A50  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L080A0A4A
	bl func_080A098C
	cmp r0, #0
	bne .L080A0A54
.L080A0A4A:
	movs r0, #0
	b .L080A0A56
	.align 2, 0
.L080A0A50: .4byte gPlaySt
.L080A0A54:
	movs r0, #1
.L080A0A56:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0A34

	THUMB_FUNC_START func_080A0A5C
func_080A0A5C: @ 0x080A0A5C
	push {lr}
	bl func_080A09FC
	cmp r0, #1
	beq .L080A0A6A
	movs r0, #0
	b .L080A0A6C
.L080A0A6A:
	movs r0, #1
.L080A0A6C:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0A5C

	THUMB_FUNC_START func_080A0A70
func_080A0A70: @ 0x080A0A70
	movs r0, #1
	bx lr

	THUMB_FUNC_END func_080A0A70

	THUMB_FUNC_START func_080A0A74
func_080A0A74: @ 0x080A0A74
	push {lr}
	ldr r0, .L080A0A88  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x61
	bgt .L080A0A8C
	movs r0, #0
	b .L080A0A8E
	.align 2, 0
.L080A0A88: .4byte gPlaySt
.L080A0A8C:
	movs r0, #1
.L080A0A8E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0A74

	THUMB_FUNC_START func_080A0A94
func_080A0A94: @ 0x080A0A94
	ldr r0, .L080A0A9C  @ gUnknown_020136F0
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L080A0A9C: .4byte gUnknown_020136F0

	THUMB_FUNC_END func_080A0A94

	THUMB_FUNC_START func_080A0AA0
func_080A0AA0: @ 0x080A0AA0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080A0AB4  @ gUnknown_020136F0
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge .L080A0AB8
	adds r0, r1, #1
	b .L080A0ABA
	.align 2, 0
.L080A0AB4: .4byte gUnknown_020136F0
.L080A0AB8:
	movs r0, #0
.L080A0ABA:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0AA0

	THUMB_FUNC_START func_080A0AC0
func_080A0AC0: @ 0x080A0AC0
	push {lr}
	cmp r0, #0
	bne .L080A0ACA
	ldr r0, .L080A0AD0  @ gUnknown_020136F0
	ldr r0, [r0]
.L080A0ACA:
	subs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
.L080A0AD0: .4byte gUnknown_020136F0

	THUMB_FUNC_END func_080A0AC0

	THUMB_FUNC_START func_080A0AD4
func_080A0AD4: @ 0x080A0AD4
	ldr r2, .L080A0AE8  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
.L080A0AE8: .4byte gUnknown_08A196FC

	THUMB_FUNC_END func_080A0AD4

	THUMB_FUNC_START func_080A0AEC
func_080A0AEC: @ 0x080A0AEC
	ldr r2, .L080A0B00  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
.L080A0B00: .4byte gUnknown_08A196FC

	THUMB_FUNC_END func_080A0AEC

	THUMB_FUNC_START func_080A0B04
func_080A0B04: @ 0x080A0B04
	ldr r2, .L080A0B1C  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
.L080A0B1C: .4byte gUnknown_08A196FC

	THUMB_FUNC_END func_080A0B04

	THUMB_FUNC_START func_080A0B20
func_080A0B20: @ 0x080A0B20
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, .L080A0B40  @ gCharacterData
	bl func_080A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080A0B40: .4byte gCharacterData

	THUMB_FUNC_END func_080A0B20

	THUMB_FUNC_START func_080A0B44
func_080A0B44: @ 0x080A0B44
	ldr r1, .L080A0B54  @ gUnknown_08A196FC
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
.L080A0B54: .4byte gUnknown_08A196FC

	THUMB_FUNC_END func_080A0B44

	THUMB_FUNC_START func_080A0B58
func_080A0B58: @ 0x080A0B58
	ldr r1, .L080A0B68  @ gUnknown_08A196FC
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
.L080A0B68: .4byte gUnknown_08A196FC

	THUMB_FUNC_END func_080A0B58

	THUMB_FUNC_START func_080A0B6C
func_080A0B6C: @ 0x080A0B6C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
.L080A0B72:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L080A0BA0
	ldr r3, [r2]
	cmp r3, #0
	beq .L080A0BA0
	ldr r0, [r2, #0xc]
	ldr r1, .L080A0B9C  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L080A0BA0
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne .L080A0BA0
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b .L080A0BB2
	.align 2, 0
.L080A0B9C: .4byte 0x00010004
.L080A0BA0:
	adds r4, #1
	cmp r4, #0x3f
	ble .L080A0B72
	ldr r2, .L080A0BB8  @ gCharacterData
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
.L080A0BB2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080A0BB8: .4byte gCharacterData

	THUMB_FUNC_END func_080A0B6C

	THUMB_FUNC_START func_080A0BBC
func_080A0BBC: @ 0x080A0BBC
	push {r4, lr}
	adds r4, r0, #0
	bl GetSupportTalkInfoList
	adds r1, r0, #0
	ldrh r0, [r1]
	ldr r2, .L080A0BE0  @ 0x0000FFFF
	cmp r0, r2
	beq .L080A0BEC
.L080A0BCE:
	ldrh r0, [r1]
	cmp r0, r4
	beq .L080A0BDA
	ldrh r0, [r1, #2]
	cmp r0, r4
	bne .L080A0BE4
.L080A0BDA:
	movs r0, #1
	b .L080A0BEE
	.align 2, 0
.L080A0BE0: .4byte 0x0000FFFF
.L080A0BE4:
	adds r1, #0x10
	ldrh r0, [r1]
	cmp r0, r2
	bne .L080A0BCE
.L080A0BEC:
	movs r0, #0
.L080A0BEE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0BBC

	THUMB_FUNC_START func_080A0BF4
func_080A0BF4: @ 0x080A0BF4
	push {r4, r5, r6, r7, lr}
	bl GetSupportTalkInfoList
	adds r6, r0, #0
	ldrh r0, [r6]
	ldr r1, .L080A0C3C  @ 0x0000FFFF
	cmp r0, r1
	beq .L080A0C34
	adds r7, r1, #0
.L080A0C06:
	ldrh r0, [r6]
	movs r1, #0
	bl SGM_SetCharacterKnown
	ldrh r0, [r6, #2]
	movs r1, #0
	bl SGM_SetCharacterKnown
	ldrh r4, [r6]
	ldrh r5, [r6, #2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_080A3468
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl SGM_SetSupportLevelKnown
	adds r6, #0x10
	ldrh r0, [r6]
	cmp r0, r7
	bne .L080A0C06
.L080A0C34:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A0C3C: .4byte 0x0000FFFF

	THUMB_FUNC_END func_080A0BF4

	THUMB_FUNC_START func_080A0C40
func_080A0C40: @ 0x080A0C40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, .L080A0DC0  @ gUnknown_08A196FC
	ldr r1, [r7]
	ldr r2, .L080A0DC4  @ 0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, .L080A0DC8  @ gUnknown_020136F0
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne .L080A0C72
	b .L080A0DD8
.L080A0C72:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, .L080A0DCC  @ 0x01000010
	bl CpuSet
	movs r4, #1
.L080A0C80:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq .L080A0CB0
	ldr r2, [r0]
	cmp r2, #0
	beq .L080A0CB0
	ldr r0, [r0, #0xc]
	ldr r1, .L080A0DD0  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L080A0CB0
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
.L080A0CB0:
	adds r4, #1
	cmp r4, #0x3f
	ble .L080A0C80
	movs r4, #1
	ldr r0, .L080A0DC8  @ gUnknown_020136F0
	mov sl, r0
.L080A0CBC:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq .L080A0DB6
	ldr r2, [r5]
	cmp r2, #0
	beq .L080A0DB6
	ldr r0, [r5, #0xc]
	ldr r1, .L080A0DD0  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L080A0DB6
	ldrb r0, [r2, #4]
	bl func_080A1B6C
	cmp r0, #0
	beq .L080A0DB6
	mov r0, sl
	ldr r1, [r0]
	ldr r0, .L080A0DC0  @ gUnknown_08A196FC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, .L080A0DC0  @ gUnknown_08A196FC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, .L080A0DD4  @ gCharacterData+0x2C
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge .L080A0DAE
	ldr r7, .L080A0DC8  @ gUnknown_020136F0
	ldr r0, .L080A0DC0  @ gUnknown_08A196FC
	mov r8, r0
.L080A0D30:
	ldr r0, [r7]
	adds r1, r6, #0
	bl func_080A0B20
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl func_080A0B6C
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	add r1, r9
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, .L080A0DD4  @ gCharacterData+0x2C
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt .L080A0D30
.L080A0DAE:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
.L080A0DB6:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt .L080A0DBE
	b .L080A0CBC
.L080A0DBE:
	b .L080A0EAE
	.align 2, 0
.L080A0DC0: .4byte gUnknown_08A196FC
.L080A0DC4: .4byte 0x01000600
.L080A0DC8: .4byte gUnknown_020136F0
.L080A0DCC: .4byte 0x01000010
.L080A0DD0: .4byte 0x00010004
.L080A0DD4: .4byte gCharacterData+0x2C
.L080A0DD8:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl LoadGeneralGameMetadata
	ldr r0, .L080A0E50  @ 0x0000026A
	bl GetMsg
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, .L080A0E54  @ gCharacterData
	mov r8, r1
.L080A0DF4:
	adds r0, r6, #0
	mov r1, sl
	bl GGM_IsCharacterKnown
	lsls r0, r0, #0x18
	adds r4, r6, #1
	cmp r0, #0
	beq .L080A0EA8
	adds r0, r6, #0
	bl func_080A1B6C
	cmp r0, #0
	beq .L080A0EA8
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl func_080A35EC
	movs r0, #0
	mov r9, r0
	b .L080A0E98
	.align 2, 0
.L080A0E50: .4byte 0x0000026A
.L080A0E54: .4byte gCharacterData
.L080A0E58:
	ldr r0, [r5]
	mov r1, r9
	bl func_080A0B20
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	add r2, r9
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, r8
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl GGM_IsCharacterKnown
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	add r1, r9
	strb r0, [r1]
	movs r1, #1
	add r9, r1
.L080A0E98:
	adds r0, r6, #0
	bl func_080A1B6C
	cmp r9, r0
	blt .L080A0E58
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
.L080A0EA8:
	adds r6, r4, #0
	cmp r6, #0xff
	ble .L080A0DF4
.L080A0EAE:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A0C40

	THUMB_FUNC_START func_080A0EC0
func_080A0EC0: @ 0x080A0EC0
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080A0EF4
	movs r4, #1
.L080A0ED0:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L080A0EEC
	ldr r0, [r1]
	cmp r0, #0
	beq .L080A0EEC
	adds r0, r1, #0
	bl GetUnitSpriteId
	bl UseUnitSprite
.L080A0EEC:
	adds r4, #1
	cmp r4, #0x3f
	ble .L080A0ED0
	b .L080A0F1C
.L080A0EF4:
	movs r4, #0
	ldr r0, .L080A0F28  @ gUnknown_020136F0
	ldr r0, [r0]
	cmp r4, r0
	bge .L080A0F1C
	movs r5, #0
.L080A0F00:
	ldr r0, .L080A0F2C  @ gUnknown_08A196FC
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetUnitSpriteByJid
	bl UseUnitSprite
	adds r5, #0x18
	adds r4, #1
	ldr r0, .L080A0F28  @ gUnknown_020136F0
	ldr r0, [r0]
	cmp r4, r0
	blt .L080A0F00
.L080A0F1C:
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A0F28: .4byte gUnknown_020136F0
.L080A0F2C: .4byte gUnknown_08A196FC

	THUMB_FUNC_END func_080A0EC0

	THUMB_FUNC_START func_080A0F30
func_080A0F30: @ 0x080A0F30
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, .L080A0F3C  @ gCharacterData+0x2C
	b .L080A0F4C
	.align 2, 0
.L080A0F3C: .4byte gCharacterData+0x2C
.L080A0F40:
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_080A0AD4
	adds r6, r6, r0
	adds r4, #1
.L080A0F4C:
	adds r0, r5, #0
	bl func_080A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt .L080A0F40
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0F30

	THUMB_FUNC_START func_080A0F6C
func_080A0F6C: @ 0x080A0F6C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A0F88
	adds r0, r6, #0
	bl func_080A0F30
	cmp r0, #5
	beq .L080A0FCA
	b .L080A0FD0
.L080A0F88:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl func_080A0F30
	mov r9, r0
	adds r0, r6, #0
	bl func_080A0B44
	bl func_080A1B6C
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge .L080A0FC6
.L080A0FA6:
	adds r0, r6, #0
	bl func_080A0B44
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl func_080A0B20
	adds r1, r0, #0
	adds r0, r4, #0
	bl func_080A3468
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt .L080A0FA6
.L080A0FC6:
	cmp r8, r9
	bne .L080A0FCE
.L080A0FCA:
	movs r0, #2
	b .L080A0FDA
.L080A0FCE:
	mov r0, r9
.L080A0FD0:
	cmp r0, #0
	beq .L080A0FD8
	movs r0, #1
	b .L080A0FDA
.L080A0FD8:
	movs r0, #0
.L080A0FDA:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A0F6C

	THUMB_FUNC_START func_080A0FE8
func_080A0FE8: @ 0x080A0FE8
	push {r4, r5, r6, r7, lr}
	ldr r6, .L080A10A4  @ gUnknown_02013590
	bl func_080A3544
	adds r7, r0, #0
	adds r4, r6, #0
	subs r4, #8
	adds r0, r4, #0
	movs r1, #0x10
	bl InitText
	adds r0, r6, #0
	movs r1, #9
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, .L080A10A8  @ 0x000005AD
	bl GetMsg
	adds r5, r0, #0
	movs r0, #0x80
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	ldr r5, .L080A10AC  @ gBg0Tm+0x48E
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutText
	adds r0, r6, #0
	bl ClearText
	movs r4, #0
	cmp r7, #0x64
	bne .L080A1044
	movs r4, #4
.L080A1044:
	ldr r0, .L080A10B0  @ 0x000005AA
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertDrawString
	adds r0, r6, #0
	movs r1, #0x34
	bl Text_SetCursor
	movs r1, #2
	cmp r7, #0x64
	bne .L080A1066
	movs r1, #4
.L080A1066:
	adds r0, r6, #0
	bl Text_SetColor
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_DrawNumberOrBlank
	movs r4, #0
	cmp r7, #0x64
	bne .L080A107C
	movs r4, #4
.L080A107C:
	ldr r0, .L080A10B4  @ 0x000005AE
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x3c
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldr r0, .L080A10B8  @ 0xFFFFFC18
	adds r1, r5, r0
	adds r0, r6, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A10A4: .4byte gUnknown_02013590
.L080A10A8: .4byte 0x000005AD
.L080A10AC: .4byte gBg0Tm+0x48E
.L080A10B0: .4byte 0x000005AA
.L080A10B4: .4byte 0x000005AE
.L080A10B8: .4byte 0xFFFFFC18

	THUMB_FUNC_END func_080A0FE8

	THUMB_FUNC_START func_080A10BC
func_080A10BC: @ 0x080A10BC
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x40
	strb r1, [r2]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	subs r1, #1
	str r1, [r0, #0x3c]
	bx lr

	THUMB_FUNC_END func_080A10BC

	THUMB_FUNC_START func_080A10D0
func_080A10D0: @ 0x080A10D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080A10F0  @ gUnknown_08A1DD0C
	ldr r1, .L080A10F4  @ 0x06017800
	bl Decompress
	ldr r0, .L080A10F8  @ gUnknown_08A1E0D8
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A10F0: .4byte gUnknown_08A1DD0C
.L080A10F4: .4byte 0x06017800
.L080A10F8: .4byte gUnknown_08A1E0D8

	THUMB_FUNC_END func_080A10D0

	THUMB_FUNC_START func_080A10FC
func_080A10FC: @ 0x080A10FC
	push {r4, lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, .L080A1138  @ gUnknown_08A19700
	ldr r0, [r0, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xfc
	lsls r4, r4, #4
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldr r3, .L080A113C  @ gUnknown_08A19726
	movs r0, #0x87
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A1138: .4byte gUnknown_08A19700
.L080A113C: .4byte gUnknown_08A19726

	THUMB_FUNC_END func_080A10FC

	THUMB_FUNC_START func_080A1140
func_080A1140: @ 0x080A1140
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, .L080A115C  @ gUnknown_08A1973C
	bl SpawnProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A115C: .4byte gUnknown_08A1973C

	THUMB_FUNC_END func_080A1140

	THUMB_FUNC_START func_080A1160
func_080A1160: @ 0x080A1160
	push {lr}
	ldr r0, .L080A1170  @ gUnknown_08A1973C
	bl FindProc
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L080A1170: .4byte gUnknown_08A1973C

	THUMB_FUNC_END func_080A1160

	THUMB_FUNC_START func_080A1174
func_080A1174: @ 0x080A1174
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl func_080A0A94
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge .L080A11CE
.L080A118A:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x24
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x24
	cmp r0, #0x52
	bhi .L080A11C8
	adds r0, r6, #0
	bl func_080A0B58
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl PutUnitSpriteForJid
.L080A11C8:
	adds r6, #1
	cmp r6, r7
	blt .L080A118A
.L080A11CE:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A1174

	THUMB_FUNC_START func_080A11E0
func_080A11E0: @ 0x080A11E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L080A1268
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge .L080A1202
	adds r0, #0xf
.L080A1202:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x24
	bgt .L080A121C
	cmp r1, #0
	bne .L080A1216
	str r1, [r4, #0x34]
	b .L080A121C
.L080A1216:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
.L080A121C:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge .L080A122E
	adds r0, #0xf
.L080A122E:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x73
	ble .L080A1268
	bl func_080A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne .L080A125A
	bl func_080A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	b .L080A1264
.L080A125A:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #4
.L080A1264:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
.L080A1268:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A11E0

	THUMB_FUNC_START func_080A1270
func_080A1270: @ 0x080A1270
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r7, .L080A14D0  @ gDispIo
	ldrb r1, [r7]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldrb r2, [r7, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r0, #1
	mov r9, r0
	mov r0, r9
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	orrs r0, r2
	strb r0, [r7, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #1
	negs r1, r1
	bl LoadUiFrameGraphicsTo
	bl LoadObjUiGfx
	movs r0, #0xe
	bl ApplyIconPalettes
	adds r0, r6, #0
	bl func_080A11E0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #2
	bl SetBgOffset
	ldr r1, .L080A14D4  @ 0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	movs r5, #0
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl func_08086CE8
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	adds r0, r6, #0
	bl func_080A0EC0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	ldr r0, .L080A14D8  @ gUnknown_08A1DB80
	ldr r4, .L080A14DC  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L080A14E0  @ gBg1Tm+0x102
	movs r2, #0x90
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, .L080A14E4  @ gUnknown_08A1A8E4
	ldr r1, .L080A14E8  @ 0x06013800
	bl Decompress
	ldr r0, .L080A14EC  @ gUnknown_08A1B174
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #7
	bl EnableBgSync
	ldrb r0, [r7, #1]
	movs r1, #0x20
	mov ip, r1
	mov r2, ip
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x26
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x86
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r7
	mov r8, r0
	ldrb r1, [r0]
	mov r2, r9
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, r7, #0
	adds r5, #0x36
	ldrb r0, [r5]
	mov r7, r9
	orrs r0, r7
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, ip
	orrs r1, r2
	mov r7, r8
	strb r1, [r7]
	orrs r0, r2
	strb r0, [r5]
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
	ldr r5, .L080A14F0  @ gUnknown_02013498
	movs r4, #0x14
.L080A140A:
	adds r0, r5, #0
	movs r1, #5
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L080A140A
	bl func_080A0FE8
	bl func_080A0A94
	cmp r0, #0
	beq .L080A1476
	adds r0, r6, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge .L080A1456
	adds r1, #0xf
.L080A1456:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl func_080AD51C
	movs r0, #0xc0
	movs r1, #1
	movs r2, #9
	adds r3, r6, #0
	bl ShowRIsInfo
.L080A1476:
	movs r0, #0x88
	movs r1, #9
	movs r2, #0xb
	adds r3, r6, #0
	bl func_080A1140
	ldr r0, .L080A14F4  @ func_080A1174
	adds r1, r6, #0
	bl StartParallelWorker
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #4
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd8
	movs r2, #0x2d
	bl func_08097748
	ldrh r4, [r6, #0x34]
	bl func_080A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl func_080976CC
	bl func_08097668
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge .L080A14C8
	adds r1, #0xf
.L080A14C8:
	asrs r4, r1, #4
	adds r5, r6, #0
	adds r5, #0x43
	b .L080A1502
	.align 2, 0
.L080A14D0: .4byte gDispIo
.L080A14D4: .4byte 0x0000FFD8
.L080A14D8: .4byte gUnknown_08A1DB80
.L080A14DC: .4byte gBuf
.L080A14E0: .4byte gBg1Tm+0x102
.L080A14E4: .4byte gUnknown_08A1A8E4
.L080A14E8: .4byte 0x06013800
.L080A14EC: .4byte gUnknown_08A1B174
.L080A14F0: .4byte gUnknown_02013498
.L080A14F4: .4byte func_080A1174
.L080A14F8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_080A199C
	adds r4, #1
.L080A1502:
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge .L080A150A
	adds r0, #0xf
.L080A150A:
	asrs r0, r0, #4
	adds r0, #6
	cmp r4, r0
	blt .L080A14F8
	adds r0, r6, #0
	bl StartGreenText
	movs r0, #0
	strb r0, [r5]
	ldr r0, .L080A154C  @ 0x06014800
	movs r1, #0xa
	bl LoadHelpBoxGfx
	ldr r2, .L080A1550  @ gDispIo
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
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A154C: .4byte 0x06014800
.L080A1550: .4byte gDispIo

	THUMB_FUNC_END func_080A1270

	THUMB_FUNC_START func_080A1554
func_080A1554: @ 0x080A1554
	push {r4, lr}
	adds r4, r0, #0
	bl func_0808F270
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndScreenMenuScrollingBg
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	bl func_080A1160
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A1554

	THUMB_FUNC_START func_080A157C
func_080A157C: @ 0x080A157C
	push {lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A157C

	THUMB_FUNC_START func_080A15B0
func_080A15B0: @ 0x080A15B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl func_080A0A94
	cmp r0, #0
	bne .L080A15C6
	b .L080A18D8
.L080A15C6:
	adds r0, r6, #0
	adds r0, #0x40
	movs r7, #0
	ldrsb r7, [r0, r7]
	mov r8, r0
	cmp r7, #0
	beq .L080A15D6
	b .L080A1864
.L080A15D6:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r4, .L080A1620  @ gKeySt
	ldr r2, [r4]
	ldrh r5, [r2, #6]
	adds r3, r6, #0
	adds r3, #0x41
	movs r0, #4
	strb r0, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080A15FA
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r3]
.L080A15FA:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r9, r0
	cmp r1, #0
	beq .L080A1624
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080A16DC
	bl MoveableHelpBox_OnEnd
	mov r1, r9
	strb r7, [r1]
	b .L080A1900
	.align 2, 0
.L080A1620: .4byte gKeySt
.L080A1624:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080A1684
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge .L080A1654
	adds r0, #0xf
.L080A1654:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x24
	ldr r5, .L080A1680  @ gCharacterData
	adds r0, r7, #0
	bl func_080A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl ShowTextHelpBox
	movs r0, #1
	mov r1, r9
	strb r0, [r1]
	b .L080A1900
	.align 2, 0
.L080A1680: .4byte gCharacterData
.L080A1684:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080A16B0
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, .L080A16AC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080A16A2
	b .L080A1900
.L080A16A2:
	movs r0, #0x6a
	bl m4aSongNumStart
	b .L080A1900
	.align 2, 0
.L080A16AC: .4byte gPlaySt
.L080A16B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080A16DC
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, .L080A16D8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080A16CE
	b .L080A1900
.L080A16CE:
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L080A1900
	.align 2, 0
.L080A16D8: .4byte gPlaySt
.L080A16DC:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq .L080A16F6
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq .L080A16F6
	subs r0, r4, #1
	str r0, [r6, #0x38]
.L080A16F6:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq .L080A1722
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq .L080A1722
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl func_080A0A94
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt .L080A1722
	bl func_080A0A94
	subs r0, #1
	str r0, [r6, #0x38]
.L080A1722:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq .L080A1734
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble .L080A1734
	subs r0, #3
	str r0, [r6, #0x38]
.L080A1734:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq .L080A174E
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl func_080A0A94
	cmp r4, r0
	bge .L080A174E
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
.L080A174E:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne .L080A1756
	b .L080A185A
.L080A1756:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge .L080A1766
	adds r0, #0xf
.L080A1766:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, .L080A17A4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A1784
	movs r0, #0x65
	bl m4aSongNumStart
.L080A1784:
	cmp r4, #0xf
	bgt .L080A17A8
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq .L080A17A8
	cmp r1, #0
	bge .L080A1794
	adds r1, #0xf
.L080A1794:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl func_080A199C
	movs r0, #0xff
	b .L080A17D4
	.align 2, 0
.L080A17A4: .4byte gPlaySt
.L080A17A8:
	cmp r4, #0x4f
	ble .L080A17EA
	bl func_080A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq .L080A17EA
	cmp r1, #0
	bge .L080A17C8
	adds r1, #0xf
.L080A17C8:
	asrs r1, r1, #4
	adds r1, #6
	adds r0, r6, #0
	bl func_080A199C
	movs r0, #1
.L080A17D4:
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	bl func_080AD4E4
	b .L080A1804
.L080A17EA:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl func_080AD51C
.L080A1804:
	mov r1, r9
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L080A185A
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r9, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge .L080A182E
	adds r4, #0xf
.L080A182E:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x24
	subs r4, r4, r0
	ldr r5, .L080A18D0  @ gCharacterData
	adds r0, r7, #0
	bl func_080A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r9
	adds r1, r4, #0
	bl ShowTextHelpBox
.L080A185A:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L080A1900
.L080A1864:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge .L080A187A
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x34]
.L080A187A:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble .L080A188E
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	adds r0, r0, r1
	str r0, [r6, #0x34]
.L080A188E:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne .L080A189C
	mov r0, r8
	strb r1, [r0]
.L080A189C:
	ldrh r4, [r6, #0x34]
	bl func_080A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl func_080976CC
	ldr r1, .L080A18D4  @ 0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	b .L080A1900
	.align 2, 0
.L080A18D0: .4byte gCharacterData
.L080A18D4: .4byte 0x0000FFD8
.L080A18D8:
	ldr r0, .L080A1910  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080A1900
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, .L080A1914  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A1900
	movs r0, #0x6b
	bl m4aSongNumStart
.L080A1900:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A1910: .4byte gKeySt
.L080A1914: .4byte gPlaySt

	THUMB_FUNC_END func_080A15B0

	THUMB_FUNC_START func_080A1918
func_080A1918: @ 0x080A1918
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl func_080A2C08
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A1918

	THUMB_FUNC_START func_080A1930
func_080A1930: @ 0x080A1930
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080A1952
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x43
	movs r2, #0xc0
	movs r3, #0x18
	bl func_080029E8
	b .L080A1964
.L080A1952:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x18
	bl func_080029E8
.L080A1964:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A1930

	THUMB_FUNC_START func_080A196C
func_080A196C: @ 0x080A196C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080A1980  @ gUnknown_08A1975C
	bl SpawnProcLocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L080A1980: .4byte gUnknown_08A1975C

	THUMB_FUNC_END func_080A196C

	THUMB_FUNC_START func_080A1984
func_080A1984: @ 0x080A1984
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080A1998  @ gUnknown_08A1975C
	bl SpawnProcLocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L080A1998: .4byte gUnknown_08A1975C

	THUMB_FUNC_END func_080A1984

	THUMB_FUNC_START func_080A199C
func_080A199C: @ 0x080A199C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	adds r0, r4, #0
	movs r1, #0x15
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L080A1A10  @ gUnknown_02013498
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
.L080A19D0:
	adds r0, r5, #0
	bl ClearText
	bl func_080A0A94
	cmp r6, r0
	bge .L080A1A66
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r4, r1, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl func_080A0F6C
	cmp r0, #1
	beq .L080A1A1E
	cmp r0, #1
	bgt .L080A1A14
	cmp r0, #0
	beq .L080A1A1A
	b .L080A1A28
	.align 2, 0
.L080A1A10: .4byte gUnknown_02013498
.L080A1A14:
	cmp r0, #2
	beq .L080A1A24
	b .L080A1A28
.L080A1A1A:
	movs r0, #1
	b .L080A1A26
.L080A1A1E:
	movs r1, #0
	mov r9, r1
	b .L080A1A28
.L080A1A24:
	movs r0, #4
.L080A1A26:
	mov r9, r0
.L080A1A28:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, r9
	bl Text_SetColor
	adds r0, r6, #0
	bl func_080A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, .L080A1A88  @ gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, .L080A1A8C  @ gBg2Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
.L080A1A66:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble .L080A19D0
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A1A88: .4byte gCharacterData
.L080A1A8C: .4byte gBg2Tm

	THUMB_FUNC_END func_080A199C

	THUMB_FUNC_START func_080A1A90
func_080A1A90: @ 0x080A1A90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080A1AA8  @ gUnknown_08A1975C
	bl FindProc
	cmp r0, #0
	beq .L080A1AA0
	str r4, [r0, #0x3c]
.L080A1AA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A1AA8: .4byte gUnknown_08A1975C

	THUMB_FUNC_END func_080A1A90

	THUMB_FUNC_START func_080A1AAC
func_080A1AAC: @ 0x080A1AAC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl func_080A0B44
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_080A0B20
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl func_08083790
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A1AAC

	THUMB_FUNC_START func_080A1AE4
func_080A1AE4: @ 0x080A1AE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, .L080A1B58  @ gBg1Tm
	mov sl, r1
	ldr r6, .L080A1B5C  @ gBg2Tm
	mov r9, r6
	ldr r7, .L080A1B60  @ gUnknown_020136F4
	ldr r1, .L080A1B64  @ gBg0Tm
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
.L080A1B08:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, .L080A1B68  @ gUnknown_020146F4
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
.L080A1B18:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, r9
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge .L080A1B18
	ldr r0, [sp]
	cmp r0, #0x1d
	ble .L080A1B08
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A1B58: .4byte gBg1Tm
.L080A1B5C: .4byte gBg2Tm
.L080A1B60: .4byte gUnknown_020136F4
.L080A1B64: .4byte gBg0Tm
.L080A1B68: .4byte gUnknown_020146F4

	THUMB_FUNC_END func_080A1AE4

	THUMB_FUNC_START func_080A1B6C
func_080A1B6C: @ 0x080A1B6C
	push {lr}
	ldr r2, .L080A1B84  @ gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq .L080A1B88
	ldrb r0, [r0, #0x15]
	b .L080A1B8A
	.align 2, 0
.L080A1B84: .4byte gCharacterData
.L080A1B88:
	movs r0, #0
.L080A1B8A:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A1B6C

	THUMB_FUNC_START func_080A1B90
func_080A1B90: @ 0x080A1B90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r4, .L080A1C6C  @ 0x000001FF
	ands r1, r4
	ldr r3, .L080A1C70  @ gUnknown_08A1983C
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #8
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r4
	ldr r3, .L080A1C74  @ gUnknown_08A19850
	ldr r5, .L080A1C78  @ 0x0000E280
	str r5, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #5
	ands r1, r4
	ldr r3, .L080A1C7C  @ gUnknown_08A19700
	ldr r0, .L080A1C80  @ 0x0000ABC0
	str r0, [sp]
	movs r0, #4
	movs r2, #0x67
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x14
	ands r1, r4
	ldr r3, .L080A1C84  @ gUnknown_08A1985E
	str r5, [sp]
	movs r0, #4
	movs r2, #0x6f
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc
	ands r1, r4
	ldr r3, .L080A1C88  @ gUnknown_08A19872
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r4
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge .L080A1C60
	adds r5, r2, #0
.L080A1C1A:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x3f
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080A1C2E
	movs r3, #0xd0
	lsls r3, r3, #8
.L080A1C2E:
	cmp r0, #2
	bne .L080A1C36
	movs r3, #0xf0
	lsls r3, r3, #8
.L080A1C36:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4d
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutUnitSpriteForJid
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt .L080A1C1A
.L080A1C60:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A1C6C: .4byte 0x000001FF
.L080A1C70: .4byte gUnknown_08A1983C
.L080A1C74: .4byte gUnknown_08A19850
.L080A1C78: .4byte 0x0000E280
.L080A1C7C: .4byte gUnknown_08A19700
.L080A1C80: .4byte 0x0000ABC0
.L080A1C84: .4byte gUnknown_08A1985E
.L080A1C88: .4byte gUnknown_08A19872

	THUMB_FUNC_END func_080A1B90

	THUMB_FUNC_START func_080A1C8C
func_080A1C8C: @ 0x080A1C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r9, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, .L080A1D20  @ gUnknown_08205C90
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, r9
	adds r0, #0x3f
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080A1D28
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, .L080A1D24  @ gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
.L080A1CC6:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble .L080A1CC6
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, .L080A1D24  @ gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
.L080A1CE8:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble .L080A1CE8
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, .L080A1D24  @ gBg2Tm
	lsls r0, r0, #1
	adds r4, r0, r1
.L080A1D0A:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble .L080A1D0A
	b .L080A1E68
	.align 2, 0
.L080A1D20: .4byte gUnknown_08205C90
.L080A1D24: .4byte gBg2Tm
.L080A1D28:
	movs r7, #0
	mov r2, r9
	ldr r0, [r2, #0x2c]
	bl func_080A0B44
	str r0, [sp, #0x14]
	mov r3, r9
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl func_080A0B20
	str r0, [sp, #0x18]
	ldrb r0, [r4]
	cmp r0, #2
	bne .L080A1D48
	movs r7, #1
.L080A1D48:
	mov r4, r9
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl func_080A0B20
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, .L080A1DD8  @ gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, .L080A1DDC  @ gBg2Tm+0x20
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl PutDrawText
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, r9
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl func_080A0B20
	subs r0, #1
	muls r0, r6, r0
	ldr r2, .L080A1DD8  @ gCharacterData
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl func_080A3468
	cmp r0, #2
	bne .L080A1E24
	movs r5, #0
	mov r0, r9
	adds r0, #0x46
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov r9, r4
	lsls r4, r0, #1
.L080A1DCA:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne .L080A1DE0
	movs r7, #4
	b .L080A1DE8
	.align 2, 0
.L080A1DD8: .4byte gCharacterData
.L080A1DDC: .4byte gBg2Tm+0x20
.L080A1DE0:
	ldrb r0, [r6]
	cmp r0, r5
	ble .L080A1DE8
	movs r7, #0
.L080A1DE8:
	ldr r3, .L080A1E20  @ gBg2Tm
	adds r0, r4, r3
	mov r1, r9
	adds r1, #4
	mov r9, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble .L080A1DCA
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b .L080A1E68
	.align 2, 0
.L080A1E20: .4byte gBg2Tm
.L080A1E24:
	movs r5, #0
	mov r0, r9
	adds r0, #0x46
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
.L080A1E38:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne .L080A1E44
	movs r7, #4
	b .L080A1E4C
.L080A1E44:
	ldrb r0, [r6]
	cmp r0, r5
	ble .L080A1E4C
	movs r7, #0
.L080A1E4C:
	ldr r0, .L080A1E78  @ gBg2Tm
	adds r0, r4, r0
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble .L080A1E38
.L080A1E68:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A1E78: .4byte gBg2Tm

	THUMB_FUNC_END func_080A1C8C

	THUMB_FUNC_START func_080A1E7C
func_080A1E7C: @ 0x080A1E7C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r1, .L080A1F54  @ 0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, .L080A1F58  @ Pal_SystemText
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add r6, sp, #0x18
	adds r0, r6, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r6, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	ldr r4, .L080A1F5C  @ gCharacterData
	ldr r0, [r5, #0x2c]
	bl func_080A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r4, #0
	adds r5, #0x3d
	ldrb r0, [r5]
	cmp r0, #0
	bne .L080A1EEC
	movs r4, #1
.L080A1EEC:
	ldr r0, .L080A1F60  @ 0x000005AB
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x30
	adds r2, r4, #0
	bl Text_InsertDrawString
	movs r4, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne .L080A1F08
	movs r4, #1
.L080A1F08:
	ldr r0, .L080A1F64  @ 0x000005AC
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x60
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldrb r0, [r5]
	bl func_080AEBEC
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x60
	adds r0, r6, #0
	bl Text_SetCursor
	ldrb r0, [r5]
	movs r1, #2
	cmp r0, #0
	bne .L080A1F36
	movs r1, #1
.L080A1F36:
	adds r0, r6, #0
	bl Text_SetColor
	ldrb r1, [r5]
	adds r0, r6, #0
	bl Text_DrawNumberOrBlank
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A1F54: .4byte 0x06015000
.L080A1F58: .4byte Pal_SystemText
.L080A1F5C: .4byte gCharacterData
.L080A1F60: .4byte 0x000005AB
.L080A1F64: .4byte 0x000005AC

	THUMB_FUNC_END func_080A1E7C

	THUMB_FUNC_START func_080A1F68
func_080A1F68: @ 0x080A1F68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080A1FF4
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge .L080A203E
	movs r1, #0x3f
	adds r1, r1, r6
	mov sl, r1
.L080A1F94:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl func_080A0B20
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov r9, r4
	adds r4, r1, #0
.L080A1FAE:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L080A1FE2
	ldr r0, [r1]
	cmp r0, #0
	beq .L080A1FE2
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne .L080A1FE2
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne .L080A1FE2
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq .L080A1FDE
	movs r0, #2
	b .L080A1FE0
.L080A1FDE:
	movs r0, #1
.L080A1FE0:
	strb r0, [r4]
.L080A1FE2:
	adds r5, #1
	cmp r5, #0x3f
	ble .L080A1FAE
	mov r4, r9
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt .L080A1F94
	b .L080A203E
.L080A1FF4:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge .L080A203E
	adds r7, r1, #0
.L080A200A:
	adds r0, r6, #0
	adds r0, #0x3f
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl func_080A0B04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A2034
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl func_080A0AD4
	ldrb r1, [r7]
	adds r1, r1, r0
	strb r1, [r7]
.L080A2034:
	adds r4, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt .L080A200A
.L080A203E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A1F68

	THUMB_FUNC_START func_080A204C
func_080A204C: @ 0x080A204C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge .L080A2074
	adds r7, r5, #0
	adds r7, #0x46
	adds r6, r0, #0
.L080A2060:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl func_080A0AD4
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt .L080A2060
.L080A2074:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A204C

	THUMB_FUNC_START func_080A207C
func_080A207C: @ 0x080A207C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq .L080A20A2
	ldr r0, [r4, #0x2c]
	bl func_080A0F30
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b .L080A20EE
.L080A20A2:
	ldr r0, [r4, #0x2c]
	bl func_080A0B44
	mov r9, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge .L080A20E0
	mov r6, r8
.L080A20C2:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl func_080A0B20
	adds r1, r0, #0
	mov r0, r9
	bl func_080A3468
	ldrb r1, [r6]
	adds r1, r1, r0
	strb r1, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt .L080A20C2
.L080A20E0:
	ldr r0, [r4, #0x2c]
	bl func_080A0F30
	mov r2, r8
	ldrb r1, [r2]
	subs r1, r1, r0
	strb r1, [r2]
.L080A20EE:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A207C

	THUMB_FUNC_START func_080A20FC
func_080A20FC: @ 0x080A20FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ResetUnitSprites
	movs r4, #0
	b .L080A2124
.L080A2108:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl func_080A0AEC
	adds r1, r5, #0
	adds r1, #0x4d
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnitSpriteByJid
	bl UseUnitSprite
	adds r4, #1
.L080A2124:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt .L080A2108
	bl ForceSyncUnitSpriteSheet
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b .L080A2146
.L080A213C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_080A1C8C
	adds r4, #1
.L080A2146:
	ldrb r0, [r6]
	cmp r4, r0
	blt .L080A213C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A20FC

	THUMB_FUNC_START func_080A2154
func_080A2154: @ 0x080A2154
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
.L080A215C:
	cmp r5, #0
	blt .L080A21C8
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt .L080A21C8
	adds r0, r7, #0
	adds r0, #0x3f
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080A21C4
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl func_080A0AD4
	cmp r0, #0
	ble .L080A21C4
	adds r6, r7, #0
	adds r6, #0x39
	ldrb r0, [r6]
	movs r1, #0xe3
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl func_080A0AD4
	cmp r4, r0
	blt .L080A21C8
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl func_080A0AD4
	ldrb r2, [r6]
	movs r1, #0xfc
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b .L080A21C8
.L080A21C4:
	adds r5, r5, r4
	b .L080A215C
.L080A21C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A2154

	THUMB_FUNC_START func_080A21D0
func_080A21D0: @ 0x080A21D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl func_080A0B44
	bl func_080A1B6C
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl func_080A1F68
	adds r0, r4, #0
	bl func_080A204C
	adds r0, r4, #0
	bl func_080A207C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl func_080A2154
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A21D0

	THUMB_FUNC_START func_080A221C
func_080A221C: @ 0x080A221C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, .L080A2270  @ gPal+0x380
	adds r5, r3, #0
	adds r5, #0x20
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	movs r4, #0xf
	movs r0, #0x1f
	mov ip, r0
.L080A223A:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, r8
	ands r1, r0
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r7
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge .L080A223A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2270: .4byte gPal+0x380

	THUMB_FUNC_END func_080A221C

	THUMB_FUNC_START func_080A2274
func_080A2274: @ 0x080A2274
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, .L080A2418  @ gDispIo
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r2
	strb r0, [r4, #0x18]
	bl ResetText
	bl InitIcons
	bl LoadUiFrameGraphics
	bl LoadObjUiGfx
	bl ApplyUnitSpritePalettes
	bl func_080A221C
	movs r0, #0xd
	bl ApplyIconPalettes
	adds r0, r5, #0
	bl StartGreenText
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080A2340
	ldr r2, .L080A241C  @ gPlaySt
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl func_080AD4A0
	movs r0, #1
	bl func_080AD594
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080A2340
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl func_080AD51C
.L080A2340:
	movs r0, #0
	movs r1, #4
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	bl RestartScreenMenuScrollingBg
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl func_08098C3C
	ldr r0, .L080A2420  @ gUnknown_08A1DC1C
	ldr r4, .L080A2424  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L080A2428  @ gBg1Tm
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r4, .L080A242C  @ gCharacterData
	ldr r0, [r5, #0x2c]
	bl func_080A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r2, [r0, #6]
	ldr r1, .L080A2430  @ gBg0Tm+0x44
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	bl PutFace80x72
	adds r0, r5, #0
	bl func_080A20FC
	adds r0, r5, #0
	bl func_080A1E7C
	ldr r0, .L080A2434  @ gUnknown_08A1DD0C
	ldr r1, .L080A2438  @ 0x06017800
	bl Decompress
	ldr r0, .L080A243C  @ gUnknown_08A1E0D8
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080A2440  @ gUnknown_08A1D79C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080A2444  @ func_080A1B90
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2418: .4byte gDispIo
.L080A241C: .4byte gPlaySt
.L080A2420: .4byte gUnknown_08A1DC1C
.L080A2424: .4byte gBuf
.L080A2428: .4byte gBg1Tm
.L080A242C: .4byte gCharacterData
.L080A2430: .4byte gBg0Tm+0x44
.L080A2434: .4byte gUnknown_08A1DD0C
.L080A2438: .4byte 0x06017800
.L080A243C: .4byte gUnknown_08A1E0D8
.L080A2440: .4byte gUnknown_08A1D79C
.L080A2444: .4byte func_080A1B90

	THUMB_FUNC_END func_080A2274

	THUMB_FUNC_START func_080A2448
func_080A2448: @ 0x080A2448
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, .L080A247C  @ gKeySt
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq .L080A2484
	ldr r0, .L080A2480  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A2470
	movs r0, #0x6b
	bl m4aSongNumStart
.L080A2470:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b .L080A25EA
	.align 2, 0
.L080A247C: .4byte gKeySt
.L080A2480: .4byte gPlaySt
.L080A2484:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L080A249A
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b .L080A25EA
.L080A249A:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq .L080A24AE
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b .L080A25EA
.L080A24AE:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080A24BE
	b .L080A25EA
.L080A24BE:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080A24CA
	b .L080A25D0
.L080A24CA:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq .L080A24FC
	ldr r0, .L080A24F8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A24EC
	movs r0, #0x6a
	bl m4aSongNumStart
.L080A24EC:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b .L080A25EA
	.align 2, 0
.L080A24F8: .4byte gPlaySt
.L080A24FC:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq .L080A2516
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq .L080A2516
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
.L080A2516:
	ldr r0, .L080A25C8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080A2550
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl func_080A0AD4
	subs r0, #1
	cmp r4, r0
	bge .L080A2550
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
.L080A2550:
	ldr r4, .L080A25C8  @ gKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080A2572
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	negs r2, r2
	adds r0, r6, #0
	bl func_080A2154
.L080A2572:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L080A2590
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl func_080A2154
.L080A2590:
	ldrb r1, [r5]
	cmp r7, r1
	beq .L080A25EA
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl func_080AD51C
	ldr r0, .L080A25CC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A25EA
	movs r0, #0x65
	bl m4aSongNumStart
	b .L080A25EA
	.align 2, 0
.L080A25C8: .4byte gKeySt
.L080A25CC: .4byte gPlaySt
.L080A25D0:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq .L080A25EA
	ldr r0, .L080A25F4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A25EA
	movs r0, #0x6c
	bl m4aSongNumStart
.L080A25EA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A25F4: .4byte gPlaySt

	THUMB_FUNC_END func_080A2448

	THUMB_FUNC_START func_080A25F8
func_080A25F8: @ 0x080A25F8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r3, .L080A26A4  @ gDispIo
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
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl LoadLegacyUiFrameGraphics
	bl LoadObjUiGfx
	ldr r0, [r5, #0x2c]
	bl func_080A0B44
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl func_080A0B20
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r5]
	movs r2, #3
	ands r2, r0
	adds r2, #1
	adds r0, r4, #0
	bl StartSupportViewerTalk
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A26A4: .4byte gDispIo

	THUMB_FUNC_END func_080A25F8

	THUMB_FUNC_START func_080A26A8
func_080A26A8: @ 0x080A26A8
	push {r4, r5, lr}
	sub sp, #4
	adds r0, #0x3a
	movs r5, #0
	strb r5, [r0]
	bl HidePrepScreenHandCursor
	ldr r2, .L080A2728  @ gDispIo
	ldrb r1, [r2, #0xc]
	movs r3, #4
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x14]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r3, r0
	strb r3, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	bl func_080A1AE4
	ldr r0, .L080A272C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080A271E
	movs r0, #0xc8
	bl m4aSongNumStart
.L080A271E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2728: .4byte gDispIo
.L080A272C: .4byte gPlaySt

	THUMB_FUNC_END func_080A26A8

	THUMB_FUNC_START func_080A2730
func_080A2730: @ 0x080A2730
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, .L080A27A0  @ gBg2Tm
	mov sl, r0
.L080A2744:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi .L080A27B4
	adds r3, r4, #1
	mov r9, r3
	ldr r2, .L080A27A4  @ gUnknown_020136F4
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, .L080A27A8  @ gBg0Tm
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, .L080A27AC  @ gBg1Tm
	mov r8, r0
	movs r4, #0x13
.L080A2770:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, .L080A27B0  @ gUnknown_02013EF4
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge .L080A2770
	b .L080A27DC
	.align 2, 0
.L080A27A0: .4byte gBg2Tm
.L080A27A4: .4byte gUnknown_020136F4
.L080A27A8: .4byte gBg0Tm
.L080A27AC: .4byte gBg1Tm
.L080A27B0: .4byte gUnknown_02013EF4
.L080A27B4:
	adds r1, r4, #1
	mov r9, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, .L080A27F8  @ gBg1Tm
	adds r1, r0, r4
	ldr r4, .L080A27FC  @ gBg0Tm
	adds r0, r0, r4
	movs r4, #0x13
.L080A27CA:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge .L080A27CA
.L080A27DC:
	mov r4, r9
	cmp r4, #0x1d
	ble .L080A2744
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A27F8: .4byte gBg1Tm
.L080A27FC: .4byte gBg0Tm

	THUMB_FUNC_END func_080A2730

	THUMB_FUNC_START func_080A2800
func_080A2800: @ 0x080A2800
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	negs r0, r5
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	adds r0, r5, #0
	bl func_080A2730
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	ldrb r0, [r6]
	cmp r0, #0xa
	bne .L080A2864
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl func_080A0AA0
	str r0, [r7, #0x2c]
.L080A2864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A2800

	THUMB_FUNC_START func_080A286C
func_080A286C: @ 0x080A286C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	mov r0, r8
	str r5, [r0, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl func_080A2730
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl SetBlendConfig
	ldrb r0, [r7]
	cmp r0, #0xa
	bne .L080A28D4
	mov r0, r8
	bl Proc_Break
.L080A28D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A286C

	THUMB_FUNC_START func_080A28E0
func_080A28E0: @ 0x080A28E0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	negs r5, r5
	adds r0, r5, #0
	bl func_080A2730
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	ldrb r0, [r6]
	cmp r0, #0xa
	bne .L080A2944
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl func_080A0AC0
	str r0, [r7, #0x2c]
.L080A2944:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A28E0

	THUMB_FUNC_START func_080A294C
func_080A294C: @ 0x080A294C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r6, #8
	subs r5, r6, r5
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #3
	mov r1, r8
	str r0, [r1, #0x30]
	subs r6, r6, r5
	adds r0, r6, #0
	bl func_080A2730
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl SetBlendConfig
	ldrb r0, [r7]
	cmp r0, #0xa
	bne .L080A29B6
	mov r0, r8
	bl Proc_Break
.L080A29B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A294C

	THUMB_FUNC_START func_080A29C0
func_080A29C0: @ 0x080A29C0
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	bl InitFaces
	bl ResetText
	bl InitIcons
	ldr r6, .L080A2A94  @ gBg0Tm
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, .L080A2A98  @ gBg1Tm
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r0, .L080A2A9C  @ gBg2Tm
	movs r1, #0
	bl TmFill
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0
	mov r9, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl func_080A0B44
	bl func_080A1B6C
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl func_080A1F68
	adds r0, r4, #0
	bl func_080A204C
	adds r0, r4, #0
	bl func_080A207C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl func_080A2154
	ldr r0, .L080A2AA0  @ gUnknown_08A1DC1C
	ldr r5, .L080A2AA4  @ gBuf
	adds r1, r5, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #5
	mov r0, r8
	adds r1, r5, #0
	bl TmApplyTsa_thm
	ldr r5, .L080A2AA8  @ gCharacterData
	ldr r0, [r4, #0x2c]
	bl func_080A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #6]
	adds r6, #0x44
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl func_080A20FC
	adds r0, r4, #0
	bl func_080A1E7C
	bl func_080A1AE4
	adds r4, #0x3a
	mov r0, r9
	strb r0, [r4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2A94: .4byte gBg0Tm
.L080A2A98: .4byte gBg1Tm
.L080A2A9C: .4byte gBg2Tm
.L080A2AA0: .4byte gUnknown_08A1DC1C
.L080A2AA4: .4byte gBuf
.L080A2AA8: .4byte gCharacterData

	THUMB_FUNC_END func_080A29C0

	THUMB_FUNC_START func_080A2AAC
func_080A2AAC: @ 0x080A2AAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, .L080A2B58  @ gDispIo
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r3, #3
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	orrs r1, r4
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r3
	strb r0, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0xc
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080A2B50
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080A2B50
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl func_080AD51C
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
.L080A2B50:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2B58: .4byte gDispIo

	THUMB_FUNC_END func_080A2AAC

	THUMB_FUNC_START func_080A2B5C
func_080A2B5C: @ 0x080A2B5C
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndScreenMenuScrollingBg
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl func_080A1A90
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A2B5C

	THUMB_FUNC_START func_080A2B7C
func_080A2B7C: @ 0x080A2B7C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl func_080A1AAC
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A2BB8
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #9
	movs r2, #0x80
	movs r3, #0x10
	bl func_080029E8
	b .L080A2BC8
.L080A2BB8:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl func_080029E8
.L080A2BC8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A2B7C

	THUMB_FUNC_START func_080A2BD0
func_080A2BD0: @ 0x080A2BD0
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080A2BEE
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #9
	movs r1, #0x80
	movs r3, #0x10
	bl func_080029E8
	b .L080A2C00
.L080A2BEE:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	adds r1, r2, #0
	movs r3, #0x10
	bl func_080029E8
.L080A2C00:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A2BD0

	THUMB_FUNC_START func_080A2C08
func_080A2C08: @ 0x080A2C08
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L080A2C28  @ gUnknown_08A19880
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2C28: .4byte gUnknown_08A19880

	THUMB_FUNC_END func_080A2C08

	THUMB_FUNC_START func_080A2C2C
func_080A2C2C: @ 0x080A2C2C
	ldr r0, .L080A2C34  @ gBWLDataArray
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L080A2C34: .4byte gBWLDataArray

	THUMB_FUNC_END func_080A2C2C

	THUMB_FUNC_START func_080A2C38
func_080A2C38: @ 0x080A2C38
	bx lr

	THUMB_FUNC_END func_080A2C38

	THUMB_FUNC_START SramInit
SramInit: @ 0x080A2C3C
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, .L080A2C94  @ 0x12345678
	str r0, [sp]
	ldr r0, .L080A2C98  @ 0x87654321
	str r0, [sp, #4]
	bl SetSramFastFunc
	ldr r2, .L080A2C9C  @ 0x04000200
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r5, .L080A2CA0  @ gUnknown_08A1FAF4
	ldr r1, [r5]
	ldr r4, .L080A2CA4  @ 0x000073A0
	adds r1, r1, r4
	mov r0, sp
	movs r2, #4
	bl WriteSramFast
	ldr r2, .L080A2CA8  @ ReadSramFast
	ldr r0, [r5]
	adds r0, r0, r4
	add r1, sp, #4
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	ldr r3, .L080A2CAC  @ gBoolSramWorking
	movs r2, #0
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bne .L080A2C88
	movs r2, #1
.L080A2C88:
	strb r2, [r3]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2C94: .4byte 0x12345678
.L080A2C98: .4byte 0x87654321
.L080A2C9C: .4byte 0x04000200
.L080A2CA0: .4byte gUnknown_08A1FAF4
.L080A2CA4: .4byte 0x000073A0
.L080A2CA8: .4byte ReadSramFast
.L080A2CAC: .4byte gBoolSramWorking

	THUMB_FUNC_END SramInit

	THUMB_FUNC_START IsSramWorking
IsSramWorking: @ 0x080A2CB0
	ldr r0, .L080A2CBC  @ gBoolSramWorking
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
.L080A2CBC: .4byte gBoolSramWorking

	THUMB_FUNC_END IsSramWorking

	THUMB_FUNC_START func_080A2CC0
func_080A2CC0: @ 0x080A2CC0
	push {r4, r5, r6, lr}
	sub sp, #0x40
	movs r1, #1
	negs r1, r1
	add r0, sp, #0x3c
.L080A2CCA:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge .L080A2CCA
	movs r4, #0
	ldr r6, .L080A2CF4  @ gUnknown_08A1FAF4
	ldr r5, .L080A2CF8  @ 0x000001FF
.L080A2CD8:
	lsls r0, r4, #6
	ldr r1, [r6]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x40
	bl WriteAndVerifySramFast
	adds r4, #1
	cmp r4, r5
	ble .L080A2CD8
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2CF4: .4byte gUnknown_08A1FAF4
.L080A2CF8: .4byte 0x000001FF

	THUMB_FUNC_END func_080A2CC0

	THUMB_FUNC_START ComputeChecksum16
ComputeChecksum16: @ 0x080A2CFC
	push {r4, lr}
	adds r2, r0, #0
	movs r3, #0
	movs r4, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r3, r1
	bge .L080A2D1C
.L080A2D0E:
	ldrh r0, [r2]
	adds r3, r3, r0
	eors r4, r0
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne .L080A2D0E
.L080A2D1C:
	adds r0, r3, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END ComputeChecksum16

	THUMB_FUNC_START LoadGeneralGameMetadata
LoadGeneralGameMetadata: @ 0x080A2D28
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A2D9C
	cmp r5, #0
	bne .L080A2D3E
	mov r5, sp
.L080A2D3E:
	ldr r1, .L080A2D88  @ ReadSramFast
	ldr r0, .L080A2D8C  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x64
	bl _call_via_r3
	ldr r1, .L080A2D90  @ gUnknown_08205C9C
	adds r0, r5, #0
	bl StringEquals
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A2D9C
	ldr r1, [r5, #8]
	ldr r0, .L080A2D94  @ 0x00040624
	cmp r1, r0
	bne .L080A2D9C
	ldrh r1, [r5, #0xc]
	ldr r0, .L080A2D98  @ 0x0000200A
	cmp r1, r0
	bne .L080A2D9C
	adds r4, r5, #0
	adds r4, #0x60
	adds r0, r5, #0
	movs r1, #0x50
	bl ComputeChecksum16
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne .L080A2D9C
	movs r0, #1
	b .L080A2D9E
	.align 2, 0
.L080A2D88: .4byte ReadSramFast
.L080A2D8C: .4byte gUnknown_08A1FAF4
.L080A2D90: .4byte gUnknown_08205C9C
.L080A2D94: .4byte 0x00040624
.L080A2D98: .4byte 0x0000200A
.L080A2D9C:
	movs r0, #0
.L080A2D9E:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END LoadGeneralGameMetadata

	THUMB_FUNC_START SaveGeneralGameMetadata
SaveGeneralGameMetadata: @ 0x080A2DA8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x50
	bl ComputeChecksum16
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
	ldr r0, .L080A2DCC  @ gUnknown_08A1FAF4
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2DCC: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END SaveGeneralGameMetadata

	THUMB_FUNC_START SaveGeneralGameMetadataNoChecksum
SaveGeneralGameMetadataNoChecksum: @ 0x080A2DD0
	push {lr}
	ldr r1, .L080A2DE0  @ gUnknown_08A1FAF4
	ldr r1, [r1]
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
.L080A2DE0: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END SaveGeneralGameMetadataNoChecksum

	THUMB_FUNC_START InitSaveGeneralGameMetadata
InitSaveGeneralGameMetadata: @ 0x080A2DE4
	push {r4, r5, lr}
	sub sp, #0x64
	bl func_080A2CC0
	ldr r1, .L080A2E9C  @ gUnknown_08205C9C
	mov r0, sp
	bl StringCopy
	ldr r0, .L080A2EA0  @ 0x00040624
	str r0, [sp, #8]
	mov r1, sp
	movs r4, #0
	movs r5, #0
	ldr r0, .L080A2EA4  @ 0x0000200A
	strh r0, [r1, #0xc]
	mov r2, sp
	ldrb r1, [r2, #0xe]
	movs r3, #2
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #3
	negs r1, r1
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #5
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #9
	negs r1, r1
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #0x21
	negs r1, r1
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #0xe]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #0xe]
	ldrb r0, [r1, #0xf]
	ands r3, r0
	strb r3, [r1, #0xf]
	mov r0, sp
	strb r4, [r0, #0xf]
	strh r5, [r0, #0x10]
	strh r5, [r0, #0x12]
	adds r0, #0x63
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	add r3, sp, #0x20
	add r4, sp, #0x40
	add r1, sp, #0x14
	movs r2, #0
	subs r0, #0x43
.L080A2E66:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L080A2E66
	adds r1, r3, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
.L080A2E76:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L080A2E76
	adds r1, r4, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
.L080A2E86:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L080A2E86
	mov r0, sp
	bl SaveGeneralGameMetadata
	add sp, #0x64
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2E9C: .4byte gUnknown_08205C9C
.L080A2EA0: .4byte 0x00040624
.L080A2EA4: .4byte 0x0000200A

	THUMB_FUNC_END InitSaveGeneralGameMetadata

	THUMB_FUNC_START func_080A2EA8
func_080A2EA8: @ 0x080A2EA8
	push {r4, lr}
	sub sp, #4
	ldr r4, .L080A2ECC  @ gBuf
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, .L080A2ED0  @ 0x010000A2
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl SaveBonusContentData
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A2ECC: .4byte gBuf
.L080A2ED0: .4byte 0x010000A2

	THUMB_FUNC_END func_080A2EA8

	THUMB_FUNC_START GetSaveDataOffsetPointer
GetSaveDataOffsetPointer: @ 0x080A2ED4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, .L080A2EE4  @ gUnknown_08A1FAF4
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
.L080A2EE4: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END GetSaveDataOffsetPointer

	THUMB_FUNC_START func_080A2EE8
func_080A2EE8: @ 0x080A2EE8
	ldr r1, .L080A2EF4  @ gUnknown_08A1FAF4
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
.L080A2EF4: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END func_080A2EE8

	THUMB_FUNC_START SaveMetadata_Load
SaveMetadata_Load: @ 0x080A2EF8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne .L080A2F06
	mov r4, sp
.L080A2F06:
	ldr r2, .L080A2F34  @ ReadSramFast
	ldr r0, .L080A2F38  @ gUnknown_08A1FAF4
	lsls r1, r5, #4
	adds r1, #0x64
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0x10
	bl _call_via_r3
	ldrh r1, [r4, #4]
	ldr r0, .L080A2F3C  @ 0x0000200A
	cmp r1, r0
	bne .L080A2F88
	cmp r5, #6
	bhi .L080A2F88
	lsls r0, r5, #2
	ldr r1, .L080A2F40  @ .L080A2F44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080A2F34: .4byte ReadSramFast
.L080A2F38: .4byte gUnknown_08A1FAF4
.L080A2F3C: .4byte 0x0000200A
.L080A2F40: .4byte .L080A2F44
.L080A2F44: @ jump table
	.4byte .L080A2F60 @ case 0
	.4byte .L080A2F60 @ case 1
	.4byte .L080A2F60 @ case 2
	.4byte .L080A2F60 @ case 3
	.4byte .L080A2F60 @ case 4
	.4byte .L080A2F68 @ case 5
	.4byte .L080A2F70 @ case 6
.L080A2F60:
	ldr r1, .L080A2F64  @ 0x00040624
	b .L080A2F72
	.align 2, 0
.L080A2F64: .4byte 0x00040624
.L080A2F68:
	ldr r1, .L080A2F6C  @ 0x00020112
	b .L080A2F72
	.align 2, 0
.L080A2F6C: .4byte 0x00020112
.L080A2F70:
	ldr r1, .L080A2F84  @ 0x00020223
.L080A2F72:
	ldr r0, [r4]
	cmp r0, r1
	bne .L080A2F88
	adds r0, r4, #0
	bl SaveMetadata_VerifyChecksum
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L080A2F8A
	.align 2, 0
.L080A2F84: .4byte 0x00020223
.L080A2F88:
	movs r0, #0
.L080A2F8A:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END SaveMetadata_Load

	THUMB_FUNC_START SaveMetadata_Save
SaveMetadata_Save: @ 0x080A2F94
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r5, #0
	ldr r0, .L080A2FC4  @ 0x0000200A
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl GetSaveTargetAddress
	strh r0, [r4, #8]
	cmp r6, #6
	bgt .L080A301A
	ldrb r0, [r4, #6]
	cmp r0, #2
	beq .L080A2FE8
	cmp r0, #2
	bgt .L080A2FC8
	cmp r0, #0
	beq .L080A2FD2
	cmp r0, #1
	beq .L080A2FDC
	b .L080A301A
	.align 2, 0
.L080A2FC4: .4byte 0x0000200A
.L080A2FC8:
	cmp r0, #3
	beq .L080A2FF4
	cmp r0, #0xff
	beq .L080A2FFC
	b .L080A301A
.L080A2FD2:
	ldr r0, .L080A2FD8  @ 0x00000DC8
	strh r0, [r4, #0xa]
	b .L080A3002
	.align 2, 0
.L080A2FD8: .4byte 0x00000DC8
.L080A2FDC:
	ldr r0, .L080A2FE4  @ 0x00001F78
	strh r0, [r4, #0xa]
	b .L080A3002
	.align 2, 0
.L080A2FE4: .4byte 0x00001F78
.L080A2FE8:
	ldr r0, .L080A2FF0  @ 0x00000874
	strh r0, [r4, #0xa]
	b .L080A3002
	.align 2, 0
.L080A2FF0: .4byte 0x00000874
.L080A2FF4:
	movs r0, #0xc0
	lsls r0, r0, #4
	strh r0, [r4, #0xa]
	b .L080A3002
.L080A2FFC:
	strh r5, [r4, #0xa]
	strh r5, [r4, #8]
	strh r5, [r4, #4]
.L080A3002:
	adds r0, r4, #0
	bl SaveMetadata_ComputeChecksum
	ldr r0, .L080A3020  @ gUnknown_08A1FAF4
	lsls r2, r6, #4
	adds r2, #0x64
	ldr r1, [r0]
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
.L080A301A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A3020: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END SaveMetadata_Save

	THUMB_FUNC_START func_080A3024
func_080A3024: @ 0x080A3024
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	cmp r4, #6
	bgt .L080A3050
	add r0, sp, #0x10
	ldr r2, .L080A3058  @ 0x0000FFFF
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, .L080A305C  @ 0x01000008
	mov r1, sp
	bl CpuSet
	ldr r1, .L080A3060  @ gUnknown_08A1FAF4
	lsls r0, r4, #4
	adds r0, #0x64
	ldr r1, [r1]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x10
	bl WriteAndVerifySramFast
.L080A3050:
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A3058: .4byte 0x0000FFFF
.L080A305C: .4byte 0x01000008
.L080A3060: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END func_080A3024

	THUMB_FUNC_START GetSaveTargetAddress
GetSaveTargetAddress: @ 0x080A3064
	push {lr}
	cmp r0, #6
	bhi .L080A310C
	lsls r0, r0, #2
	ldr r1, .L080A3074  @ .L080A3078
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080A3074: .4byte .L080A3078
.L080A3078: @ jump table
	.4byte .L080A3094 @ case 0
	.4byte .L080A30A8 @ case 1
	.4byte .L080A30BC @ case 2
	.4byte .L080A30D0 @ case 3
	.4byte .L080A30DC @ case 4
	.4byte .L080A30F0 @ case 5
	.4byte .L080A3104 @ case 6
.L080A3094:
	ldr r0, .L080A30A0  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, .L080A30A4  @ 0x00003FC4
	adds r0, r0, r1
	b .L080A310E
	.align 2, 0
.L080A30A0: .4byte gUnknown_08A1FAF4
.L080A30A4: .4byte 0x00003FC4
.L080A30A8:
	ldr r0, .L080A30B4  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, .L080A30B8  @ 0x00004D8C
	adds r0, r0, r1
	b .L080A310E
	.align 2, 0
.L080A30B4: .4byte gUnknown_08A1FAF4
.L080A30B8: .4byte 0x00004D8C
.L080A30BC:
	ldr r0, .L080A30C8  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, .L080A30CC  @ 0x00005B54
	adds r0, r0, r1
	b .L080A310E
	.align 2, 0
.L080A30C8: .4byte gUnknown_08A1FAF4
.L080A30CC: .4byte 0x00005B54
.L080A30D0:
	ldr r0, .L080A30D8  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	adds r0, #0xd4
	b .L080A310E
	.align 2, 0
.L080A30D8: .4byte gUnknown_08A1FAF4
.L080A30DC:
	ldr r0, .L080A30E8  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, .L080A30EC  @ 0x0000204C
	adds r0, r0, r1
	b .L080A310E
	.align 2, 0
.L080A30E8: .4byte gUnknown_08A1FAF4
.L080A30EC: .4byte 0x0000204C
.L080A30F0:
	ldr r0, .L080A30FC  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, .L080A3100  @ 0x0000691C
	adds r0, r0, r1
	b .L080A310E
	.align 2, 0
.L080A30FC: .4byte gUnknown_08A1FAF4
.L080A3100: .4byte 0x0000691C
.L080A3104:
	ldr r0, .L080A3108  @ 0x0E007400
	b .L080A310E
	.align 2, 0
.L080A3108: .4byte 0x0E007400
.L080A310C:
	movs r0, #0
.L080A310E:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSaveTargetAddress

	THUMB_FUNC_START GetSaveSourceAddress
GetSaveSourceAddress: @ 0x080A3114
	push {lr}
	sub sp, #0x10
	adds r1, r0, #0
	mov r0, sp
	bl SaveMetadata_Load
	mov r0, sp
	ldrh r0, [r0, #8]
	bl GetSaveDataOffsetPointer
	add sp, #0x10
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSaveSourceAddress

	THUMB_FUNC_START SaveLocalEventIndexes
SaveLocalEventIndexes: @ 0x080A3130
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetTemporaryFlagData
	adds r5, r0, #0
	bl GetTemporaryFlagDataSize
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END SaveLocalEventIndexes

	THUMB_FUNC_START SaveGlobalEventIndexes
SaveGlobalEventIndexes: @ 0x080A3150
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetPermanentFlagData
	adds r5, r0, #0
	bl GetPermanentFlagDataSize
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END SaveGlobalEventIndexes

	THUMB_FUNC_START LoadLocalEventIds
LoadLocalEventIds: @ 0x080A3170
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L080A3194  @ ReadSramFast
	bl GetTemporaryFlagData
	adds r5, r0, #0
	bl GetTemporaryFlagDataSize
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A3194: .4byte ReadSramFast

	THUMB_FUNC_END LoadLocalEventIds

	THUMB_FUNC_START LoadPermanentEids
LoadPermanentEids: @ 0x080A3198
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L080A31BC  @ ReadSramFast
	bl GetPermanentFlagData
	adds r5, r0, #0
	bl GetPermanentFlagDataSize
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A31BC: .4byte ReadSramFast

	THUMB_FUNC_END LoadPermanentEids

	THUMB_FUNC_START LoadPermanentEidsIn
LoadPermanentEidsIn: @ 0x080A31C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, .L080A31E0  @ ReadSramFast
	bl GetPermanentFlagDataSize
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A31E0: .4byte ReadSramFast

	THUMB_FUNC_END LoadPermanentEidsIn

	THUMB_FUNC_START SaveConvoyItems
SaveConvoyItems: @ 0x080A31E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xb0
	mov r8, r0
	bl GetConvoyItemArray
	adds r6, r0, #0
	add r5, sp, #0x64
	movs r0, #0
	mov ip, r0
	movs r7, #0
.L080A31FC:
	mov r0, sp
	adds r1, r0, r7
	ldrh r0, [r6]
	strb r0, [r1]
	ldrh r0, [r6]
	lsrs r4, r0, #8
	movs r0, #0x3f
	ands r4, r0
	movs r3, #7
	mov r0, ip
	ands r3, r0
	ldr r0, .L080A3264  @ gUnknown_08205CA4
	adds r0, r3, r0
	ldrb r2, [r5]
	ldrb r1, [r0]
	ands r1, r2
	adds r0, r4, #0
	lsls r0, r3
	orrs r1, r0
	strb r1, [r5]
	cmp r3, #1
	ble .L080A3242
	adds r5, #1
	cmp r3, #2
	ble .L080A3242
	ldr r0, .L080A3268  @ gUnknown_08205CAC
	adds r0, r3, r0
	ldrb r2, [r5]
	ldrb r1, [r0]
	ands r1, r2
	movs r0, #8
	subs r0, r0, r3
	asrs r4, r0
	orrs r1, r4
	strb r1, [r5]
.L080A3242:
	movs r0, #6
	add ip, r0
	adds r6, #2
	adds r7, #1
	cmp r7, #0x63
	ble .L080A31FC
	mov r0, sp
	mov r1, r8
	movs r2, #0xb0
	bl WriteAndVerifySramFast
	add sp, #0xb0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A3264: .4byte gUnknown_08205CA4
.L080A3268: .4byte gUnknown_08205CAC

	THUMB_FUNC_END SaveConvoyItems

	THUMB_FUNC_START LoadConvoyItems
LoadConvoyItems: @ 0x080A326C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xb0
	ldr r1, .L080A32E0  @ ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0xb0
	bl _call_via_r3
	bl GetConvoyItemArray
	adds r4, r0, #0
	add r5, sp, #0x64
	movs r7, #0
	movs r6, #0
.L080A3288:
	mov r1, sp
	adds r0, r1, r6
	ldrb r0, [r0]
	strh r0, [r4]
	movs r3, #7
	ands r3, r7
	ldrb r1, [r5]
	ldr r0, .L080A32E4  @ gUnknown_08205CA4
	adds r0, r3, r0
	ldrb r0, [r0]
	bics r1, r0
	asrs r1, r3
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r3, #1
	ble .L080A32C4
	adds r5, #1
	cmp r3, #2
	ble .L080A32C4
	ldrb r1, [r5]
	ldr r0, .L080A32E8  @ gUnknown_08205CAC
	adds r0, r3, r0
	ldrb r0, [r0]
	bics r1, r0
	movs r0, #8
	subs r0, r0, r3
	lsls r1, r0
	orrs r2, r1
	lsls r0, r2, #0x18
	lsrs r2, r0, #0x18
.L080A32C4:
	lsls r0, r2, #8
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	adds r7, #6
	adds r4, #2
	adds r6, #1
	cmp r6, #0x63
	ble .L080A3288
	add sp, #0xb0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A32E0: .4byte ReadSramFast
.L080A32E4: .4byte gUnknown_08205CA4
.L080A32E8: .4byte gUnknown_08205CAC

	THUMB_FUNC_END LoadConvoyItems

	THUMB_FUNC_START func_080A32EC
func_080A32EC: @ 0x080A32EC
	movs r0, #1
	bx lr

	THUMB_FUNC_END func_080A32EC

	THUMB_FUNC_START func_080A32F0
func_080A32F0: @ 0x080A32F0
	push {r4, lr}
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A3304
	movs r0, #0
	b .L080A3320
.L080A3300:
	movs r0, #1
	b .L080A3320
.L080A3304:
	movs r4, #0
.L080A3306:
	adds r0, r4, #0
	bl func_080A52DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A3300
	adds r4, #1
	cmp r4, #2
	ble .L080A3306
	bl func_080A6A68
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
.L080A3320:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A32F0

	THUMB_FUNC_START func_080A3328
func_080A3328: @ 0x080A3328
	movs r0, #1
	bx lr

	THUMB_FUNC_END func_080A3328

	THUMB_FUNC_START func_080A332C
func_080A332C: @ 0x080A332C
	push {r4, lr}
	movs r0, #0
	bl GGM_IsAnyCharacterKnown
	adds r4, r0, #0
	bl func_080A3870
	ands r0, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A332C

	THUMB_FUNC_START func_080A3348
func_080A3348: @ 0x080A3348
	push {r4, lr}
	sub sp, #0x94
	movs r4, #0
	bl func_080A3870
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A335C
	movs r0, #0
	b .L080A33BC
.L080A335C:
	mov r0, sp
	bl VerifySavedRankingChecksum
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A33BA
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq .L080A3374
	movs r4, #1
.L080A3374:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq .L080A3382
	movs r0, #2
	orrs r4, r0
.L080A3382:
	add r0, sp, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq .L080A3390
	movs r0, #4
	orrs r4, r0
.L080A3390:
	add r0, sp, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq .L080A339E
	movs r0, #8
	orrs r4, r0
.L080A339E:
	add r0, sp, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq .L080A33AC
	movs r0, #0x10
	orrs r4, r0
.L080A33AC:
	add r0, sp, #0x78
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq .L080A33BA
	movs r0, #0x20
	orrs r4, r0
.L080A33BA:
	adds r0, r4, #0
.L080A33BC:
	add sp, #0x94
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3348

	THUMB_FUNC_START func_080A33C4
func_080A33C4: @ 0x080A33C4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A33E2
	bl func_080A6C1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A33E2
	movs r0, #1
	b .L080A33E4
.L080A33E2:
	movs r0, #0
.L080A33E4:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A33C4

	THUMB_FUNC_START func_080A33EC
func_080A33EC: @ 0x080A33EC
	push {r4, lr}
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A33FE
	b .L080A3412
.L080A33FA:
	movs r0, #1
	b .L080A3414
.L080A33FE:
	movs r4, #0
.L080A3400:
	adds r0, r4, #0
	bl func_080A530C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A33FA
	adds r4, #1
	cmp r4, #2
	ble .L080A3400
.L080A3412:
	movs r0, #0
.L080A3414:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A33EC

	THUMB_FUNC_START func_080A341C
func_080A341C: @ 0x080A341C
	push {r4, lr}
	sub sp, #0x4c
	ldr r4, .L080A3458  @ gBuf
	adds r0, r4, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A345C
	movs r3, #0
	adds r1, r4, #0
	movs r2, #0xf
.L080A3434:
	ldrb r0, [r1]
	cmp r0, #0
	beq .L080A3448
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne .L080A3442
	movs r3, #1
.L080A3442:
	cmp r0, #2
	bne .L080A3448
	movs r3, #1
.L080A3448:
	adds r1, #0x14
	subs r2, #1
	cmp r2, #0
	bge .L080A3434
	cmp r3, #0
	beq .L080A345C
	movs r0, #1
	b .L080A345E
	.align 2, 0
.L080A3458: .4byte gBuf
.L080A345C:
	movs r0, #0
.L080A345E:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A341C

	THUMB_FUNC_START func_080A3468
func_080A3468: @ 0x080A3468
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r7, .L080A3498  @ gUnknown_08A1FAF8
	ldr r0, [r7]
	cmp r0, #0
	beq .L080A34C4
	movs r6, #0
	adds r5, r7, #0
	adds r3, r7, #4
	adds r4, r7, #0
.L080A347C:
	ldr r0, [r4]
	cmp r0, r2
	bne .L080A3488
	ldr r0, [r3]
	cmp r0, r1
	bne .L080A3494
.L080A3488:
	ldr r0, [r4]
	cmp r0, r1
	bne .L080A349C
	ldr r0, [r3]
	cmp r0, r2
	beq .L080A34A2
.L080A3494:
	movs r0, #2
	b .L080A34C6
	.align 2, 0
.L080A3498: .4byte gUnknown_08A1FAF8
.L080A349C:
	ldr r0, [r3]
	cmp r0, r2
	bne .L080A34A8
.L080A34A2:
	ldr r0, [r4]
	cmp r0, r1
	bne .L080A3494
.L080A34A8:
	ldr r0, [r3]
	cmp r0, r1
	bne .L080A34B4
	ldr r0, [r5]
	cmp r0, r2
	bne .L080A3494
.L080A34B4:
	adds r6, #8
	adds r5, #8
	adds r3, #8
	adds r4, #8
	adds r0, r6, r7
	ldr r0, [r0]
	cmp r0, #0
	bne .L080A347C
.L080A34C4:
	movs r0, #3
.L080A34C6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3468

	THUMB_FUNC_START func_080A34CC
func_080A34CC: @ 0x080A34CC
	push {r4, r5, r6, lr}
	movs r5, #0
	bl GetSupportTalkInfoList
	adds r4, r0, #0
	ldrh r0, [r4]
	ldr r1, .L080A34FC  @ 0x0000FFFF
	cmp r0, r1
	beq .L080A34F2
	adds r6, r1, #0
.L080A34E0:
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl func_080A3468
	adds r5, r5, r0
	adds r4, #0x10
	ldrh r0, [r4]
	cmp r0, r6
	bne .L080A34E0
.L080A34F2:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080A34FC: .4byte 0x0000FFFF

	THUMB_FUNC_END func_080A34CC

	THUMB_FUNC_START func_080A3500
func_080A3500: @ 0x080A3500
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	bne .L080A3514
	mov r4, sp
	mov r0, sp
	bl LoadGeneralGameMetadata
.L080A3514:
	movs r0, #0
	adds r7, r4, #0
	adds r7, #0x20
	movs r6, #3
.L080A351C:
	movs r2, #0
	adds r4, r0, #1
	adds r0, r7, r0
	ldrb r3, [r0]
.L080A3524:
	lsls r1, r2, #1
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r6
	adds r5, r5, r0
	adds r2, #1
	cmp r2, #3
	ble .L080A3524
	adds r0, r4, #0
	cmp r0, #0x1f
	ble .L080A351C
	adds r0, r5, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3500

	THUMB_FUNC_START func_080A3544
func_080A3544: @ 0x080A3544
	push {r4, r5, lr}
	movs r0, #0
	bl func_080A3500
	adds r4, r0, #0
	bl func_080A34CC
	adds r5, r0, #0
	cmp r4, #0
	ble .L080A356A
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	cmp r0, #0
	bne .L080A356A
	movs r4, #1
	b .L080A3576
.L080A356A:
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r4, r0, #0
.L080A3576:
	cmp r4, #0x64
	ble .L080A357C
	movs r4, #0x64
.L080A357C:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3544

	THUMB_FUNC_START func_080A3584
func_080A3584: @ 0x080A3584
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x64
	mov r8, r0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r6, #0
	bl GetSupportTalkInfoList
	adds r4, r0, #0
	cmp r5, #0
	bne .L080A35A6
	mov r5, sp
	mov r0, sp
	bl LoadGeneralGameMetadata
.L080A35A6:
	adds r3, r5, #0
	adds r3, #0x20
	b .L080A35B0
.L080A35AC:
	adds r6, #1
	adds r4, #0x10
.L080A35B0:
	ldrh r1, [r4]
	ldr r0, .L080A35E8  @ 0x0000FFFF
	cmp r1, r0
	beq .L080A35CC
	cmp r1, r8
	bne .L080A35C2
	ldrh r0, [r4, #2]
	cmp r0, r7
	beq .L080A35CC
.L080A35C2:
	cmp r1, r7
	bne .L080A35AC
	ldrh r0, [r4, #2]
	cmp r0, r8
	bne .L080A35AC
.L080A35CC:
	asrs r0, r6, #2
	movs r2, #3
	ands r6, r2
	lsls r1, r6, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	asrs r0, r1
	ands r0, r2
	add sp, #0x64
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080A35E8: .4byte 0x0000FFFF

	THUMB_FUNC_END func_080A3584

	THUMB_FUNC_START func_080A35EC
func_080A35EC: @ 0x080A35EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x78
	str r0, [sp, #0x64]
	mov r8, r1
	str r2, [sp, #0x68]
	ldr r0, .L080A3630  @ gCharacterData
	mov sl, r0
	ldr r6, [sp, #0x64]
	subs r6, #1
	movs r0, #0x34
	adds r1, r6, #0
	muls r1, r0, r1
	mov r9, r1
	mov r0, sl
	adds r0, #0x2c
	adds r7, r1, r0
	ldr r0, [r7]
	cmp r0, #0
	bne .L080A3634
	movs r0, #0
	movs r3, #6
.L080A361E:
	mov r2, r8
	strb r0, [r2]
	movs r1, #1
	add r8, r1
	subs r3, #1
	cmp r3, #0
	bge .L080A361E
	b .L080A370A
	.align 2, 0
.L080A3630: .4byte gCharacterData
.L080A3634:
	movs r4, #0
	bl GetSupportTalkInfoList
	adds r5, r0, #0
	ldr r2, [sp, #0x68]
	cmp r2, #0
	bne .L080A364E
	mov r1, sp
	adds r0, r1, #0
	str r0, [sp, #0x68]
	mov r0, sp
	bl LoadGeneralGameMetadata
.L080A364E:
	ldrh r0, [r5]
	ldr r1, .L080A36CC  @ 0x0000FFFF
	str r6, [sp, #0x74]
	cmp r0, r1
	beq .L080A36E8
	str r7, [sp, #0x70]
	mov r2, r9
	str r2, [sp, #0x6c]
.L080A365E:
	ldrh r0, [r5]
	ldr r1, [sp, #0x64]
	cmp r0, r1
	beq .L080A3678
	ldrh r0, [r5, #2]
	adds r2, r4, #1
	mov r9, r2
	movs r1, #0x10
	adds r1, r1, r5
	mov ip, r1
	ldr r2, [sp, #0x64]
	cmp r0, r2
	bne .L080A36DC
.L080A3678:
	asrs r1, r4, #2
	adds r0, r4, #0
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #1
	mov sl, r0
	movs r3, #0
	ldr r2, [sp, #0x70]
	ldr r0, [r2]
	adds r4, #1
	mov r9, r4
	movs r2, #0x10
	adds r2, r2, r5
	mov ip, r2
	ldrb r0, [r0, #0x15]
	cmp r3, r0
	bge .L080A36DC
	ldr r0, .L080A36D0  @ gCharacterData+0x2C
	ldr r2, [sp, #0x6c]
	adds r6, r2, r0
	ldr r0, [sp, #0x68]
	adds r0, #0x20
	adds r7, r0, r1
.L080A36A6:
	ldr r4, [r6]
	adds r0, r4, r3
	ldrh r1, [r5]
	ldrb r2, [r0]
	cmp r1, r2
	beq .L080A36B8
	ldrh r0, [r5, #2]
	cmp r0, r2
	bne .L080A36D4
.L080A36B8:
	mov r0, r8
	adds r1, r0, r3
	ldrb r0, [r7]
	mov r2, sl
	asrs r0, r2
	movs r2, #3
	ands r0, r2
	strb r0, [r1]
	b .L080A36DC
	.align 2, 0
.L080A36CC: .4byte 0x0000FFFF
.L080A36D0: .4byte gCharacterData+0x2C
.L080A36D4:
	adds r3, #1
	ldrb r4, [r4, #0x15]
	cmp r3, r4
	blt .L080A36A6
.L080A36DC:
	mov r4, r9
	mov r5, ip
	ldrh r0, [r5]
	ldr r1, .L080A371C  @ 0x0000FFFF
	cmp r0, r1
	bne .L080A365E
.L080A36E8:
	movs r0, #0x34
	ldr r2, [sp, #0x74]
	muls r0, r2, r0
	ldr r1, .L080A3720  @ gCharacterData
	adds r1, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r3, [r0, #0x15]
	cmp r3, #6
	bgt .L080A370A
	movs r1, #0
.L080A36FE:
	mov r2, r8
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #6
	ble .L080A36FE
.L080A370A:
	add sp, #0x78
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A371C: .4byte 0x0000FFFF
.L080A3720: .4byte gCharacterData

	THUMB_FUNC_END func_080A35EC

	THUMB_FUNC_START SGM_SetSupportLevelKnown
SGM_SetSupportLevelKnown: @ 0x080A3724
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r7, r0, #0
	adds r5, r1, #0
	movs r6, #3
	ands r6, r2
	mov r0, sp
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A379C
	movs r4, #0
	bl GetSupportTalkInfoList
	adds r2, r0, #0
	add r0, sp, #0x20
	mov ip, r0
	b .L080A374E
.L080A374A:
	adds r4, #1
	adds r2, #0x10
.L080A374E:
	ldrh r1, [r2]
	ldr r0, .L080A3798  @ 0x0000FFFF
	cmp r1, r0
	beq .L080A376A
	cmp r1, r7
	bne .L080A3760
	ldrh r0, [r2, #2]
	cmp r0, r5
	beq .L080A376A
.L080A3760:
	cmp r1, r5
	bne .L080A374A
	ldrh r0, [r2, #2]
	cmp r0, r7
	bne .L080A374A
.L080A376A:
	asrs r0, r4, #2
	movs r3, #3
	ands r4, r3
	lsls r1, r4, #1
	mov r2, ip
	adds r4, r2, r0
	ldrb r2, [r4]
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, r6
	bge .L080A379C
	adds r0, r3, #0
	lsls r0, r1
	bics r2, r0
	lsls r6, r1
	adds r0, r2, r6
	strb r0, [r4]
	mov r0, sp
	bl SaveGeneralGameMetadata
	movs r0, #1
	b .L080A379E
	.align 2, 0
.L080A3798: .4byte 0x0000FFFF
.L080A379C:
	movs r0, #0
.L080A379E:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END SGM_SetSupportLevelKnown

	THUMB_FUNC_START SGM_SetCharacterKnown
SGM_SetCharacterKnown: @ 0x080A37A8
	push {r4, r5, lr}
	sub sp, #0x64
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bgt .L080A37E8
	cmp r5, #0
	bne .L080A37C8
	mov r5, sp
	mov r0, sp
	bl LoadGeneralGameMetadata
	movs r3, #1
.L080A37C8:
	asrs r0, r4, #3
	adds r2, r5, #0
	adds r2, #0x40
	adds r2, r2, r0
	movs r1, #7
	ands r1, r4
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	cmp r3, #0
	beq .L080A37E8
	adds r0, r5, #0
	bl SaveGeneralGameMetadata
.L080A37E8:
	add sp, #0x64
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END SGM_SetCharacterKnown

	THUMB_FUNC_START GGM_IsCharacterKnown
GGM_IsCharacterKnown: @ 0x080A37F0
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r5, r0
	bgt .L080A3824
	cmp r4, #0
	bne .L080A380C
	mov r4, sp
	mov r0, sp
	bl LoadGeneralGameMetadata
.L080A380C:
	asrs r1, r5, #3
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r5
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne .L080A3828
.L080A3824:
	movs r0, #0
	b .L080A382A
.L080A3828:
	movs r0, #1
.L080A382A:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GGM_IsCharacterKnown

	THUMB_FUNC_START GGM_IsAnyCharacterKnown
GGM_IsAnyCharacterKnown: @ 0x080A3834
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	cmp r4, #0
	bne .L080A3846
	mov r4, sp
	mov r0, sp
	bl LoadGeneralGameMetadata
.L080A3846:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x40
.L080A384C:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080A3858
	movs r0, #1
	b .L080A3860
.L080A3858:
	adds r1, #1
	cmp r1, #0x1f
	ble .L080A384C
	movs r0, #0
.L080A3860:
	add sp, #0x64
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GGM_IsAnyCharacterKnown

	THUMB_FUNC_START func_080A3868
func_080A3868: @ 0x080A3868
	bx lr

	THUMB_FUNC_END func_080A3868

	THUMB_FUNC_START __malloc_unlock_3
__malloc_unlock_3: @ 0x080A386C
	bx lr

	THUMB_FUNC_END __malloc_unlock_3

	THUMB_FUNC_START func_080A3870
func_080A3870: @ 0x080A3870
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A3890
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080A3890
	movs r0, #1
	b .L080A3892
.L080A3890:
	movs r0, #0
.L080A3892:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3870

	THUMB_FUNC_START VerifySavedRankingChecksum
VerifySavedRankingChecksum: @ 0x080A3898
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A38EC
	cmp r5, #0
	bne .L080A38AC
	ldr r5, .L080A38DC  @ gBuf
.L080A38AC:
	ldr r1, .L080A38E0  @ ReadSramFast
	ldr r0, .L080A38E4  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r2, .L080A38E8  @ 0x00007190
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x94
	bl _call_via_r3
	adds r4, r5, #0
	adds r4, #0x90
	adds r0, r5, #0
	movs r1, #0x90
	bl ComputeChecksum16
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne .L080A38EC
	movs r0, #1
	b .L080A38EE
	.align 2, 0
.L080A38DC: .4byte gBuf
.L080A38E0: .4byte ReadSramFast
.L080A38E4: .4byte gUnknown_08A1FAF4
.L080A38E8: .4byte 0x00007190
.L080A38EC:
	movs r0, #0
.L080A38EE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END VerifySavedRankingChecksum

	THUMB_FUNC_START LoadBonusContentData
LoadBonusContentData: @ 0x080A38F4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A3948
	cmp r5, #0
	bne .L080A3908
	ldr r5, .L080A3938  @ gBuf
.L080A3908:
	ldr r1, .L080A393C  @ ReadSramFast
	ldr r0, .L080A3940  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r2, .L080A3944  @ 0x0000725C
	adds r0, r0, r2
	movs r2, #0xa2
	lsls r2, r2, #1
	ldr r3, [r1]
	adds r1, r5, #0
	bl _call_via_r3
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r4, r5, r1
	adds r0, r5, #0
	bl ComputeChecksum16
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne .L080A3948
	movs r0, #1
	b .L080A394A
	.align 2, 0
.L080A3938: .4byte gBuf
.L080A393C: .4byte ReadSramFast
.L080A3940: .4byte gUnknown_08A1FAF4
.L080A3944: .4byte 0x0000725C
.L080A3948:
	movs r0, #0
.L080A394A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END LoadBonusContentData

	THUMB_FUNC_START SaveBonusContentData
SaveBonusContentData: @ 0x080A3950
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xa0
	lsls r4, r4, #1
	adds r1, r4, #0
	bl ComputeChecksum16
	adds r4, r5, r4
	strh r0, [r4]
	ldr r0, .L080A397C  @ gUnknown_08A1FAF4
	ldr r1, [r0]
	ldr r0, .L080A3980  @ 0x0000725C
	adds r1, r1, r0
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r5, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A397C: .4byte gUnknown_08A1FAF4
.L080A3980: .4byte 0x0000725C

	THUMB_FUNC_END SaveBonusContentData

	THUMB_FUNC_START SaveRankings
SaveRankings: @ 0x080A3984
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x90
	bl ComputeChecksum16
	adds r1, r4, #0
	adds r1, #0x90
	strh r0, [r1]
	ldr r0, .L080A39AC  @ gUnknown_08A1FAF4
	ldr r1, [r0]
	ldr r0, .L080A39B0  @ 0x00007190
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x94
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A39AC: .4byte gUnknown_08A1FAF4
.L080A39B0: .4byte 0x00007190

	THUMB_FUNC_END SaveRankings

	THUMB_FUNC_START func_080A39B4
func_080A39B4: @ 0x080A39B4
	push {lr}
	sub sp, #0x98
	add r0, sp, #0x94
	movs r1, #0
	strh r1, [r0]
	ldr r2, .L080A39D4  @ 0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl SaveRankings
	add sp, #0x98
	pop {r0}
	bx r0
	.align 2, 0
.L080A39D4: .4byte 0x0100004A

	THUMB_FUNC_END func_080A39B4

	THUMB_FUNC_START func_080A39D8
func_080A39D8: @ 0x080A39D8
	ldr r0, .L080A39E0  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	subs r0, #1
	bx lr
	.align 2, 0
.L080A39E0: .4byte gPlaySt

	THUMB_FUNC_END func_080A39D8

	THUMB_FUNC_START func_080A39E4
func_080A39E4: @ 0x080A39E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x98
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	add r0, sp, #0x94
	movs r4, #0
	strh r4, [r0]
	ldr r2, .L080A3A1C  @ 0x0100000C
	adds r1, r6, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x96
	strh r4, [r0]
	ldr r2, .L080A3A20  @ 0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl VerifySavedRankingChecksum
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A3A24
	movs r0, #0
	b .L080A3A40
	.align 2, 0
.L080A3A1C: .4byte 0x0100000C
.L080A3A20: .4byte 0x0100004A
.L080A3A24:
	lsls r0, r5, #1
	adds r0, r0, r5
	adds r0, r7, r0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r1, r6, #0
	mov r3, sp
	adds r0, r3, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
.L080A3A40:
	add sp, #0x98
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A39E4

	THUMB_FUNC_START func_080A3A48
func_080A3A48: @ 0x080A3A48
	push {r4, r5, r6, lr}
	sub sp, #0x94
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r0, sp
	bl VerifySavedRankingChecksum
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A3A7E
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, r5, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r2, sp
	adds r1, r2, r0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sp
	bl SaveRankings
.L080A3A7E:
	add sp, #0x94
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A3A48

	THUMB_FUNC_START func_080A3A88
func_080A3A88: @ 0x080A3A88
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r2, [r5]
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq .L080A3B36
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r1, r0, #0x1d
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	cmp r1, r0
	bgt .L080A3B36
	cmp r1, r0
	bne .L080A3B40
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq .L080A3AB4
	ldrb r1, [r5, #0x17]
	cmp r0, r1
	bne .L080A3B36
.L080A3AB4:
	ldrh r1, [r4, #2]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x18
	cmp r1, r0
	bgt .L080A3B36
	ldrb r1, [r4, #7]
	lsrs r1, r1, #5
	ldr r0, [r4, #8]
	ldr r2, .L080A3B3C  @ 0x001FFFFF
	ands r0, r2
	lsls r3, r0, #3
	orrs r3, r1
	ldrb r1, [r5, #7]
	lsrs r1, r1, #5
	ldr r0, [r5, #8]
	ands r0, r2
	lsls r0, r0, #3
	orrs r0, r1
	cmp r3, r0
	bgt .L080A3B36
	cmp r3, r0
	bne .L080A3B40
	ldr r0, [r4, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r3, r0, #3
	subs r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r0
	lsls r3, r3, #4
	ldrb r1, [r4, #6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldrh r0, [r4, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r3, r3, r0
	ldr r0, [r5, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r0
	lsls r2, r2, #4
	ldrb r1, [r5, #6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrh r0, [r5, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r2, r2, r0
	cmp r3, r2
	bge .L080A3B40
.L080A3B36:
	movs r0, #1
	b .L080A3B42
	.align 2, 0
.L080A3B3C: .4byte 0x001FFFFF
.L080A3B40:
	movs r0, #0
.L080A3B42:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3A88

	THUMB_FUNC_START func_080A3B48
func_080A3B48: @ 0x080A3B48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov r9, r0
	add r0, sp, #4
	movs r1, #0
	mov r8, r1
	mov r3, r9
	strh r3, [r0]
	ldr r2, .L080A3C54  @ 0x0100000C
	adds r1, r7, #0
	bl CpuSet
	ldrb r0, [r7]
	movs r6, #1
	orrs r0, r6
	strb r0, [r7]
	movs r0, #3
	ands r4, r0
	lsls r4, r4, #3
	ldrb r1, [r7, #2]
	movs r0, #0x19
	negs r0, r0
	ands r0, r1
	orrs r0, r4
	ands r5, r6
	lsls r5, r5, #5
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	orrs r0, r5
	strb r0, [r7, #2]
	bl GetTotalTeamGoldValue
	movs r2, #7
	ands r2, r0
	lsls r2, r2, #5
	ldrb r3, [r7, #7]
	movs r1, #0x1f
	ands r1, r3
	orrs r1, r2
	strb r1, [r7, #7]
	lsls r0, r0, #8
	lsrs r0, r0, #0xb
	ldr r1, [r7, #8]
	ldr r2, .L080A3C58  @ 0xFFE00000
	ands r1, r2
	orrs r1, r0
	str r1, [r7, #8]
	ldr r3, .L080A3C5C  @ gPlaySt
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	ands r1, r6
	lsls r1, r1, #6
	ldrb r2, [r7, #2]
	movs r0, #0x41
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #2]
	ldrh r1, [r3, #0x2c]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x17
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r7, #2]
	ldr r0, .L080A3C60  @ 0xFFFF807F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #2]
	bl GetGameTotalTime
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	mov r6, sp
	adds r6, #0xa
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl FormatTime
	ldrh r2, [r4]
	ldr r0, .L080A3C64  @ 0x000003FF
	ands r2, r0
	lsls r2, r2, #7
	ldr r0, [r7, #4]
	ldr r1, .L080A3C68  @ 0xFFFE007F
	ands r0, r1
	orrs r0, r2
	str r0, [r7, #4]
	ldrh r1, [r5]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r7, #6]
	movs r0, #0x7f
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #6]
	ldrh r1, [r6]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r7, #6]
	ldr r0, .L080A3C6C  @ 0xFFFFE07F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #6]
	ldrb r1, [r7, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r7, #3]
	ldrb r1, [r7, #4]
	movs r0, #0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r7, #4]
	mov r0, r8
	strb r0, [r7, #0x17]
	movs r4, #1
	b .L080A3C78
	.align 2, 0
.L080A3C54: .4byte 0x0100000C
.L080A3C58: .4byte 0xFFE00000
.L080A3C5C: .4byte gPlaySt
.L080A3C60: .4byte 0xFFFF807F
.L080A3C64: .4byte 0x000003FF
.L080A3C68: .4byte 0xFFFE007F
.L080A3C6C: .4byte 0xFFFFE07F
.L080A3C70:
	ldrb r0, [r2, #4]
	strb r0, [r7, #0x17]
	b .L080A3CA0
.L080A3C76:
	adds r4, #1
.L080A3C78:
	cmp r4, #0x3f
	bgt .L080A3CA0
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq .L080A3C76
	ldr r2, [r0]
	cmp r2, #0
	beq .L080A3C76
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq .L080A3C76
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq .L080A3C70
.L080A3CA0:
	movs r5, #1
	movs r1, #0xc
	adds r1, r1, r7
	mov sl, r1
	movs r3, #0x7f
	mov r8, r3
	movs r6, #0x7f
.L080A3CAE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L080A3D08
	ldr r2, [r4]
	cmp r2, #0
	beq .L080A3D08
	ldr r0, [r4, #0xc]
	ldr r1, .L080A3DCC  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L080A3D08
	ldrb r0, [r2, #4]
	bl BWL_GetFavoritismValue
	cmp r0, r9
	ble .L080A3D08
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl BWL_GetFavoritismValue
	mov r9, r0
	ldr r0, [r4]
	ldrb r2, [r0, #4]
	movs r1, #1
	ands r1, r2
	lsls r1, r1, #7
	ldrb r3, [r7, #3]
	adds r0, r6, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #3]
	lsrs r2, r2, #1
	ands r2, r6
	mov r0, r8
	ands r2, r0
	ldrb r0, [r7, #4]
	movs r3, #0x80
	negs r3, r3
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, #4]
.L080A3D08:
	adds r5, #1
	cmp r5, #0x3f
	ble .L080A3CAE
	bl func_080B5D74
	movs r5, #7
	ands r0, r5
	lsls r0, r0, #4
	ldrb r2, [r7]
	movs r1, #0x71
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl func_080B5FD0
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r7, #1]
	movs r1, #0x1d
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	bl func_080B5E6C
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #7
	ldrh r2, [r7]
	ldr r1, .L080A3DD0  @ 0xFFFFFC7F
	ands r1, r2
	orrs r1, r0
	strh r1, [r7]
	bl func_080B5EA4
	lsls r0, r0, #5
	ldrb r2, [r7, #1]
	movs r1, #0x1f
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	bl func_080B5F9C
	ands r0, r5
	ldrb r1, [r7, #2]
	movs r4, #8
	negs r4, r4
	ands r4, r1
	orrs r4, r0
	strb r4, [r7, #2]
	ldrb r0, [r7]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	ldrh r1, [r7]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x1d
	ldrb r3, [r7, #1]
	lsls r2, r3, #0x1b
	lsrs r2, r2, #0x1d
	lsrs r3, r3, #5
	lsls r4, r4, #0x1d
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl GetOverallRank
	ands r0, r5
	lsls r0, r0, #1
	ldrb r2, [r7]
	movs r1, #0xf
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl GetWonChapterCount
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #5
	ldrh r2, [r7, #0xa]
	ldr r1, .L080A3DD4  @ 0xFFFFF81F
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, #0xa]
	bl GetTacticianName
	adds r1, r0, #0
	mov r0, sl
	bl strcpy
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A3DCC: .4byte 0x00010004
.L080A3DD0: .4byte 0xFFFFFC7F
.L080A3DD4: .4byte 0xFFFFF81F

	THUMB_FUNC_END func_080A3B48

	THUMB_FUNC_START SaveEndgameRankingsMaybe
SaveEndgameRankingsMaybe: @ 0x080A3DD8
	push {r4, r5, r6, lr}
	sub sp, #0x30
	bl func_080A39D8
	adds r6, r0, #0
	ldr r0, .L080A3E24  @ gPlaySt
	ldrb r0, [r0, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	add r5, sp, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080A3B48
	mov r0, sp
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080A39E4
	mov r0, sp
	adds r1, r5, #0
	bl func_080A3A88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A3E1A
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080A3A48
.L080A3E1A:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A3E24: .4byte gPlaySt

	THUMB_FUNC_END SaveEndgameRankingsMaybe

	THUMB_FUNC_START func_080A3E28
func_080A3E28: @ 0x080A3E28
	push {lr}
	sub sp, #0x28
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, .L080A3E48  @ 0x01000012
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl func_080A3EA4
	add sp, #0x28
	pop {r0}
	bx r0
	.align 2, 0
.L080A3E48: .4byte 0x01000012

	THUMB_FUNC_END func_080A3E28

	THUMB_FUNC_START func_080A3E4C
func_080A3E4C: @ 0x080A3E4C
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A3E98
	cmp r4, #0
	bne .L080A3E62
	mov r4, sp
.L080A3E62:
	ldr r1, .L080A3E8C  @ ReadSramFast
	ldr r0, .L080A3E90  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r2, .L080A3E94  @ 0x00007224
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x20
	bl ComputeChecksum16
	ldrh r1, [r4, #0x20]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne .L080A3E98
	movs r0, #1
	b .L080A3E9A
	.align 2, 0
.L080A3E8C: .4byte ReadSramFast
.L080A3E90: .4byte gUnknown_08A1FAF4
.L080A3E94: .4byte 0x00007224
.L080A3E98:
	movs r0, #0
.L080A3E9A:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3E4C

	THUMB_FUNC_START func_080A3EA4
func_080A3EA4: @ 0x080A3EA4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	bl ComputeChecksum16
	strh r0, [r4, #0x20]
	ldr r0, .L080A3EC8  @ gUnknown_08A1FAF4
	ldr r1, [r0]
	ldr r0, .L080A3ECC  @ 0x00007224
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A3EC8: .4byte gUnknown_08A1FAF4
.L080A3ECC: .4byte 0x00007224

	THUMB_FUNC_END func_080A3EA4

	THUMB_FUNC_START func_080A3ED0
func_080A3ED0: @ 0x080A3ED0
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne .L080A3EE4
	mov r4, sp
	mov r0, sp
	bl func_080A3E4C
.L080A3EE4:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L080A3EFE
	movs r0, #0
	b .L080A3F00
.L080A3EFE:
	movs r0, #1
.L080A3F00:
	add sp, #0x24
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3ED0

	THUMB_FUNC_START func_080A3F08
func_080A3F08: @ 0x080A3F08
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne .L080A3F22
	mov r4, sp
	mov r0, sp
	bl func_080A3E4C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A3F7C
.L080A3F22:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne .L080A3F7C
	orrs r1, r2
	str r1, [r3]
	cmp r5, #0x43
	bne .L080A3F4C
	ldr r0, [r4]
	movs r1, #4
	orrs r0, r1
	str r0, [r4]
	b .L080A3F58
.L080A3F4C:
	cmp r5, #2
	bne .L080A3F58
	ldr r0, [r4, #8]
	movs r1, #8
	orrs r0, r1
	str r0, [r4, #8]
.L080A3F58:
	cmp r5, #0x54
	bne .L080A3F68
	ldr r0, [r4, #4]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r4, #4]
	b .L080A3F76
.L080A3F68:
	cmp r5, #0x30
	bne .L080A3F76
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r4, #8]
.L080A3F76:
	adds r0, r4, #0
	bl func_080A3EA4
.L080A3F7C:
	add sp, #0x24
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A3F08

	THUMB_FUNC_START func_080A3F84
func_080A3F84: @ 0x080A3F84
	push {lr}
	sub sp, #0x18
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	ldr r2, .L080A3FA4  @ 0x0100000A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl func_080A4000
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
.L080A3FA4: .4byte 0x0100000A

	THUMB_FUNC_END func_080A3F84

	THUMB_FUNC_START func_080A3FA8
func_080A3FA8: @ 0x080A3FA8
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A3FF4
	cmp r4, #0
	bne .L080A3FBE
	mov r4, sp
.L080A3FBE:
	ldr r1, .L080A3FE8  @ ReadSramFast
	ldr r0, .L080A3FEC  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r2, .L080A3FF0  @ 0x00007248
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x14
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x10
	bl ComputeChecksum16
	ldrh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne .L080A3FF4
	movs r0, #1
	b .L080A3FF6
	.align 2, 0
.L080A3FE8: .4byte ReadSramFast
.L080A3FEC: .4byte gUnknown_08A1FAF4
.L080A3FF0: .4byte 0x00007248
.L080A3FF4:
	movs r0, #0
.L080A3FF6:
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A3FA8

	THUMB_FUNC_START func_080A4000
func_080A4000: @ 0x080A4000
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl ComputeChecksum16
	strh r0, [r4, #0x10]
	ldr r0, .L080A4024  @ gUnknown_08A1FAF4
	ldr r1, [r0]
	ldr r0, .L080A4028  @ 0x00007248
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4024: .4byte gUnknown_08A1FAF4
.L080A4028: .4byte 0x00007248

	THUMB_FUNC_END func_080A4000

	THUMB_FUNC_START func_080A402C
func_080A402C: @ 0x080A402C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne .L080A4040
	mov r4, sp
	mov r0, sp
	bl func_080A3FA8
.L080A4040:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L080A405A
	movs r0, #0
	b .L080A405C
.L080A405A:
	movs r0, #1
.L080A405C:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A402C

	THUMB_FUNC_START func_080A4064
func_080A4064: @ 0x080A4064
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne .L080A407E
	mov r4, sp
	mov r0, sp
	bl func_080A3FA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A40A0
.L080A407E:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne .L080A40A0
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl func_080A4000
.L080A40A0:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A4064

	THUMB_FUNC_START func_080A40A8
func_080A40A8: @ 0x080A40A8
	push {lr}
	movs r0, #0
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A40BA
	bl InitSaveGeneralGameMetadata
.L080A40BA:
	movs r0, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A40CA
	bl func_080A2EA8
.L080A40CA:
	movs r0, #0
	bl VerifySavedRankingChecksum
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A40DA
	bl func_080A39B4
.L080A40DA:
	movs r0, #0
	bl func_080A3E4C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A40EA
	bl func_080A3E28
.L080A40EA:
	movs r0, #0
	bl func_080A3FA8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A40FA
	bl func_080A3F84
.L080A40FA:
	bl func_080A6AA0
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A40A8

	THUMB_FUNC_START SaveClearedBWLAndChapterWinData
SaveClearedBWLAndChapterWinData: @ 0x080A4104
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r5, .L080A4184  @ gBWLDataStorage
	ldr r2, .L080A4188  @ 0x01000230
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, .L080A418C  @ gChapterWinDataArray
	ldr r2, .L080A4190  @ 0x01000060
	bl CpuSet
	adds r7, r5, #0
	ldr r6, .L080A4194  @ 0x0000084C
	add r6, r8
	adds r4, r7, #0
	movs r5, #0x45
.L080A4136:
	ldr r0, [r4]
	ldr r1, .L080A4198  @ 0xFF0000FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r6, #0x10
	adds r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge .L080A4136
	ldr r4, .L080A419C  @ 0x00000CAC
	add r4, r8
	movs r5, #0x2f
.L080A415E:
	ldr r0, .L080A418C  @ gChapterWinDataArray
	adds r1, r4, #0
	movs r2, #4
	bl WriteAndVerifySramFast
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge .L080A415E
	ldr r1, .L080A41A0  @ gpBWLSaveTarget
	ldr r0, .L080A4194  @ 0x0000084C
	add r0, r8
	str r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4184: .4byte gBWLDataStorage
.L080A4188: .4byte 0x01000230
.L080A418C: .4byte gChapterWinDataArray
.L080A4190: .4byte 0x01000060
.L080A4194: .4byte 0x0000084C
.L080A4198: .4byte 0xFF0000FF
.L080A419C: .4byte 0x00000CAC
.L080A41A0: .4byte gpBWLSaveTarget

	THUMB_FUNC_END SaveClearedBWLAndChapterWinData

	THUMB_FUNC_START func_080A41A4
func_080A41A4: @ 0x080A41A4
	push {lr}
	ldr r2, .L080A41C0  @ gPlaySt
	ldrh r1, [r2, #0x2c]
	ldr r0, .L080A41C4  @ 0xFFFFE00F
	ands r0, r1
	strh r0, [r2, #0x2c]
	movs r0, #0
	bl SetGold
	bl func_080A41C8
	pop {r0}
	bx r0
	.align 2, 0
.L080A41C0: .4byte gPlaySt
.L080A41C4: .4byte 0xFFFFE00F

	THUMB_FUNC_END func_080A41A4

	THUMB_FUNC_START func_080A41C8
func_080A41C8: @ 0x080A41C8
	push {r4, r5, lr}
	sub sp, #4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r1, .L080A4208  @ gBWLDataStorage
	ldr r2, .L080A420C  @ 0x01000230
	bl CpuSet
	ldr r4, .L080A4210  @ gPlaySt
	ldr r0, [r4, #0x38]
	ldr r1, .L080A4214  @ 0xF00000FF
	ands r0, r1
	str r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x38
	strb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, .L080A4218  @ 0xFFF00000
	ands r0, r1
	str r0, [r4, #0x34]
	bl GetTotalTeamGoldValue
	str r0, [r4, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4208: .4byte gBWLDataStorage
.L080A420C: .4byte 0x01000230
.L080A4210: .4byte gPlaySt
.L080A4214: .4byte 0xF00000FF
.L080A4218: .4byte 0xFFF00000

	THUMB_FUNC_END func_080A41C8

	THUMB_FUNC_START LoadBWLEntries
LoadBWLEntries: @ 0x080A421C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080A423C  @ ReadSramFast
	ldr r1, .L080A4240  @ gBWLDataStorage
	movs r2, #0x8c
	lsls r2, r2, #3
	ldr r3, [r0]
	adds r0, r4, #0
	bl _call_via_r3
	ldr r0, .L080A4244  @ gpBWLSaveTarget
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A423C: .4byte ReadSramFast
.L080A4240: .4byte gBWLDataStorage
.L080A4244: .4byte gpBWLSaveTarget

	THUMB_FUNC_END LoadBWLEntries

	THUMB_FUNC_START LoadChapterDataWinArray
LoadChapterDataWinArray: @ 0x080A4248
	push {lr}
	ldr r2, .L080A425C  @ ReadSramFast
	ldr r1, .L080A4260  @ gChapterWinDataArray
	ldr r3, [r2]
	movs r2, #0xc0
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
.L080A425C: .4byte ReadSramFast
.L080A4260: .4byte gChapterWinDataArray

	THUMB_FUNC_END LoadChapterDataWinArray

	THUMB_FUNC_START SaveBWLEntries
SaveBWLEntries: @ 0x080A4264
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080A4280  @ gBWLDataStorage
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	ldr r0, .L080A4284  @ gpBWLSaveTarget
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4280: .4byte gBWLDataStorage
.L080A4284: .4byte gpBWLSaveTarget

	THUMB_FUNC_END SaveBWLEntries

	THUMB_FUNC_START SaveChapterWinData
SaveChapterWinData: @ 0x080A4288
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080A4298  @ gChapterWinDataArray
	movs r2, #0xc0
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
.L080A4298: .4byte gChapterWinDataArray

	THUMB_FUNC_END SaveChapterWinData

	THUMB_FUNC_START GetChapterWinDataEntry
GetChapterWinDataEntry: @ 0x080A429C
	lsls r0, r0, #2
	ldr r1, .L080A42A4  @ gChapterWinDataArray
	adds r0, r0, r1
	bx lr
	.align 2, 0
.L080A42A4: .4byte gChapterWinDataArray

	THUMB_FUNC_END GetChapterWinDataEntry

	THUMB_FUNC_START func_080A42A8
func_080A42A8: @ 0x080A42A8
	ldrh r0, [r0]
	ldr r1, .L080A42B8  @ 0x0000FF80
	ands r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
.L080A42B8: .4byte 0x0000FF80

	THUMB_FUNC_END func_080A42A8

	THUMB_FUNC_START GetNextChapterWinDataEntryIndex
GetNextChapterWinDataEntryIndex: @ 0x080A42BC
	push {r4, lr}
	movs r0, #0
	bl GetChapterWinDataEntry
	adds r2, r0, #0
	movs r3, #0
	ldrh r1, [r2]
	ldr r4, .L080A42D0  @ 0x0000FF80
	b .L080A42DA
	.align 2, 0
.L080A42D0: .4byte 0x0000FF80
.L080A42D4:
	adds r3, #1
	adds r2, #4
	ldrh r1, [r2]
.L080A42DA:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne .L080A42D4
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetNextChapterWinDataEntryIndex

	THUMB_FUNC_START GetWonChapterCount
GetWonChapterCount: @ 0x080A42EC
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetChapterWinDataEntry
	adds r4, r0, #0
	movs r5, #0
	ldrh r1, [r4]
	ldr r2, .L080A432C  @ 0x0000FF80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq .L080A4322
	adds r6, r2, #0
.L080A4306:
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl DoesThisChapterCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A4318
	adds r5, #1
.L080A4318:
	adds r4, #4
	ldrh r0, [r4]
	ands r0, r6
	cmp r0, #0
	bne .L080A4306
.L080A4322:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080A432C: .4byte 0x0000FF80

	THUMB_FUNC_END GetWonChapterCount

	THUMB_FUNC_START func_080A4330
func_080A4330: @ 0x080A4330
	push {lr}
	bl GetNextChapterWinDataEntryIndex
	cmp r0, #0
	beq .L080A4348
	subs r0, #1
	bl GetChapterWinDataEntry
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	b .L080A434C
.L080A4348:
	movs r0, #1
	negs r0, r0
.L080A434C:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A4330

	THUMB_FUNC_START RegisterChapterTimeAndTurnCount
RegisterChapterTimeAndTurnCount: @ 0x080A4350
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetNextChapterWinDataEntryIndex
	bl GetChapterWinDataEntry
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r6, r0, #0
	ldr r0, .L080A43A8  @ 0x0000EA60
	cmp r6, r0
	ble .L080A4376
	adds r6, r0, #0
.L080A4376:
	ldrh r3, [r4, #0x10]
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r3, r0
	ble .L080A4382
	adds r3, r0, #0
.L080A4382:
	movs r0, #0x7f
	ldrb r1, [r4, #0xe]
	ands r1, r0
	ldrb r2, [r5]
	movs r0, #0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	lsls r2, r3, #7
	ldrh r1, [r5]
	movs r0, #0x7f
	ands r0, r1
	orrs r0, r2
	strh r0, [r5]
	strh r6, [r5, #2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A43A8: .4byte 0x0000EA60

	THUMB_FUNC_END RegisterChapterTimeAndTurnCount

	THUMB_FUNC_START func_080A43AC
func_080A43AC: @ 0x080A43AC
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl GetNextChapterWinDataEntryIndex
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge .L080A43D0
	movs r7, #0xb4
.L080A43BE:
	adds r0, r4, #0
	bl GetChapterWinDataEntry
	ldrh r0, [r0, #2]
	muls r0, r7, r0
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt .L080A43BE
.L080A43D0:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A43AC

	THUMB_FUNC_START GetGameTotalTurnCount
GetGameTotalTurnCount: @ 0x080A43D8
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetNextChapterWinDataEntryIndex
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge .L080A43FC
.L080A43E8:
	adds r0, r4, #0
	bl GetChapterWinDataEntry
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt .L080A43E8
.L080A43FC:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetGameTotalTurnCount

	THUMB_FUNC_START DoesThisChapterCount
DoesThisChapterCount: @ 0x080A4404
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080A441C  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq .L080A442E
	cmp r0, #2
	bgt .L080A4420
	cmp r0, #1
	beq .L080A4426
	b .L080A4440
	.align 2, 0
.L080A441C: .4byte gPlaySt
.L080A4420:
	cmp r0, #3
	beq .L080A4434
	b .L080A4440
.L080A4426:
	cmp r1, #9
	bhi .L080A4440
	movs r0, #1
	b .L080A4442
.L080A442E:
	adds r0, r1, #0
	subs r0, #0xa
	b .L080A4438
.L080A4434:
	adds r0, r1, #0
	subs r0, #0x17
.L080A4438:
	cmp r0, #0xb
	bhi .L080A4440
	movs r0, #1
	b .L080A4442
.L080A4440:
	movs r0, #0
.L080A4442:
	pop {r1}
	bx r1

	THUMB_FUNC_END DoesThisChapterCount

	THUMB_FUNC_START GetGameTotalTime
GetGameTotalTime: @ 0x080A4448
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterWinDataEntryIndex
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge .L080A447E
.L080A4458:
	adds r0, r5, #0
	bl GetChapterWinDataEntry
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl DoesThisChapterCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A4478
	ldrh r0, [r4, #2]
	movs r1, #0xb4
	muls r0, r1, r0
	adds r7, r7, r0
.L080A4478:
	adds r5, #1
	cmp r5, r6
	blt .L080A4458
.L080A447E:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetGameTotalTime

	THUMB_FUNC_START GetGameTotalTurnCount2
GetGameTotalTurnCount2: @ 0x080A4488
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterWinDataEntryIndex
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge .L080A44BE
.L080A4498:
	adds r0, r5, #0
	bl GetChapterWinDataEntry
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl DoesThisChapterCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A44B8
	ldr r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
.L080A44B8:
	adds r5, #1
	cmp r5, r6
	blt .L080A4498
.L080A44BE:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetGameTotalTurnCount2

	THUMB_FUNC_START BWL_AddBattle
BWL_AddBattle: @ 0x080A44C8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L080A451E
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r5, r0, #0
	cmp r0, #0x45
	bhi .L080A451E
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A451E
	lsls r1, r5, #4
	ldr r0, .L080A4524  @ gBWLDataArray
	adds r2, r1, r0
	cmp r2, #0
	beq .L080A451E
	ldrh r3, [r2, #0xc]
	lsls r0, r3, #0x12
	lsrs r1, r0, #0x14
	ldr r0, .L080A4528  @ 0x00000F9F
	cmp r1, r0
	bgt .L080A4514
	adds r0, r1, #1
	ldr r5, .L080A452C  @ 0x00000FFF
	adds r1, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, .L080A4530  @ 0xFFFFC003
	ands r1, r3
	orrs r1, r0
	strh r1, [r2, #0xc]
.L080A4514:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #4
	bl BWL_AddFavoritismValue
.L080A451E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4524: .4byte gBWLDataArray
.L080A4528: .4byte 0x00000F9F
.L080A452C: .4byte 0x00000FFF
.L080A4530: .4byte 0xFFFFC003

	THUMB_FUNC_END BWL_AddBattle

	THUMB_FUNC_START BWL_AddWin
BWL_AddWin: @ 0x080A4534
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi .L080A4584
	adds r0, r4, #0
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4584
	lsls r1, r4, #4
	ldr r0, .L080A458C  @ gBWLDataArray
	adds r3, r1, r0
	cmp r3, #0
	beq .L080A4584
	ldrb r0, [r3, #0xb]
	ldrb r1, [r3, #0xc]
	movs r2, #3
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r0
	ldr r0, .L080A4590  @ 0x000003E7
	cmp r1, r0
	bgt .L080A457C
	adds r0, r1, #1
	strb r0, [r3, #0xb]
	lsrs r0, r0, #8
	ands r0, r2
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xc]
.L080A457C:
	adds r0, r5, #0
	movs r1, #0x10
	bl BWL_AddFavoritismValue
.L080A4584:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A458C: .4byte gBWLDataArray
.L080A4590: .4byte 0x000003E7

	THUMB_FUNC_END BWL_AddWin

	THUMB_FUNC_START BWL_AddLoss
BWL_AddLoss: @ 0x080A4594
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A4662
	cmp r4, #0x45
	bhi .L080A4662
	adds r0, r4, #0
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4662
	mov r0, r8
	lsls r6, r0, #4
	ldr r0, .L080A4670  @ gBWLDataArray
	adds r5, r6, r0
	cmp r5, #0
	beq .L080A4662
	ldr r1, .L080A4674  @ gBmSt
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq .L080A4662
	ldr r7, .L080A4678  @ gPlaySt
	ldrb r2, [r7, #0x14]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne .L080A4662
	ldrb r1, [r1, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L080A4662
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L080A4662
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne .L080A4662
	ldrb r0, [r5]
	cmp r0, #0xc7
	bhi .L080A4662
	adds r0, #1
	strb r0, [r5]
	movs r1, #0x80
	negs r1, r1
	mov r0, r8
	bl BWL_AddFavoritismValue
	bl GetLastSuspendSaveId
	adds r4, r0, #0
	adds r4, #3
	adds r0, r4, #0
	bl GetSaveTargetAddress
	adds r1, r0, #0
	ldr r2, .L080A467C  @ 0x000019E4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #1
	bl WriteAndVerifySramFast
	mov r0, sp
	adds r1, r4, #0
	bl SaveMetadata_Load
	mov r0, sp
	adds r1, r4, #0
	bl SaveMetadata_Save
	ldrb r0, [r7, #0xc]
	bl GetSaveTargetAddress
	adds r1, r0, #0
	ldr r2, .L080A4680  @ 0x0000083C
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #3
	bl WriteAndVerifySramFast
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl SaveMetadata_Load
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl SaveMetadata_Save
.L080A4662:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4670: .4byte gBWLDataArray
.L080A4674: .4byte gBmSt
.L080A4678: .4byte gPlaySt
.L080A467C: .4byte 0x000019E4
.L080A4680: .4byte 0x0000083C

	THUMB_FUNC_END BWL_AddLoss

	THUMB_FUNC_START BWL_SetDeathStats
BWL_SetDeathStats: @ 0x080A4684
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r0, #0x45
	bhi .L080A4734
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4734
	lsls r1, r4, #4
	ldr r0, .L080A46DC  @ gBWLDataArray
	adds r4, r1, r0
	cmp r4, #0
	beq .L080A4734
	bl GetBattleMapKind
	cmp r0, #0
	blt .L080A46E8
	cmp r0, #1
	ble .L080A46E8
	cmp r0, #2
	bne .L080A46E8
	ldrb r0, [r4, #0xe]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #0xe]
	ldr r0, .L080A46E0  @ gGmData
	ldrb r1, [r0, #0x11]
	movs r0, #0x3f
	ands r1, r0
	ldrb r2, [r4, #5]
	movs r0, #0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r3, .L080A46E4  @ gPlaySt
	b .L080A4706
	.align 2, 0
.L080A46DC: .4byte gBWLDataArray
.L080A46E0: .4byte gGmData
.L080A46E4: .4byte gPlaySt
.L080A46E8:
	ldrb r1, [r4, #0xe]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #0xe]
	ldr r3, .L080A473C  @ gPlaySt
	movs r1, #0xe
	ldrsb r1, [r3, r1]
	movs r0, #0x3f
	ands r1, r0
	ldrb r2, [r4, #5]
	movs r0, #0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
.L080A4706:
	ldrh r2, [r3, #0x10]
	ldr r0, .L080A4740  @ 0x000003FF
	ands r2, r0
	lsls r2, r2, #0xe
	ldr r0, [r4, #4]
	ldr r1, .L080A4744  @ 0xFF003FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #4]
	lsls r2, r6, #0xe
	ldr r0, [r4, #0xc]
	ldr r1, .L080A4748  @ 0xFF803FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r5, r0
	ldrb r1, [r4, #9]
	movs r0, #0x10
	negs r0, r0
	ands r0, r1
	orrs r0, r5
	strb r0, [r4, #9]
.L080A4734:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A473C: .4byte gPlaySt
.L080A4740: .4byte 0x000003FF
.L080A4744: .4byte 0xFF003FFF
.L080A4748: .4byte 0xFF803FFF

	THUMB_FUNC_END BWL_SetDeathStats

	THUMB_FUNC_START BWL_IncrementMoveValue
BWL_IncrementMoveValue: @ 0x080A474C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi .L080A4780
	adds r0, r4, #0
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4780
	lsls r1, r4, #4
	ldr r0, .L080A4788  @ gBWLDataArray
	adds r1, r1, r0
	cmp r1, #0
	beq .L080A4780
	ldrb r0, [r1, #3]
	cmp r0, #0xc7
	bhi .L080A4778
	adds r0, #1
	strb r0, [r1, #3]
.L080A4778:
	adds r0, r5, #0
	movs r1, #2
	bl BWL_AddFavoritismValue
.L080A4780:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4788: .4byte gBWLDataArray

	THUMB_FUNC_END BWL_IncrementMoveValue

	THUMB_FUNC_START BWL_IncrementStatScreenViews
BWL_IncrementStatScreenViews: @ 0x080A478C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi .L080A47C0
	adds r0, r4, #0
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A47C0
	lsls r1, r4, #4
	ldr r0, .L080A47C8  @ gBWLDataArray
	adds r1, r1, r0
	cmp r1, #0
	beq .L080A47C0
	ldrb r0, [r1, #4]
	cmp r0, #0xc7
	bhi .L080A47B8
	adds r0, #1
	strb r0, [r1, #4]
.L080A47B8:
	adds r0, r5, #0
	movs r1, #2
	bl BWL_AddFavoritismValue
.L080A47C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A47C8: .4byte gBWLDataArray

	THUMB_FUNC_END BWL_IncrementStatScreenViews

	THUMB_FUNC_START BWL_IncrementDeployCount
BWL_IncrementDeployCount: @ 0x080A47CC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi .L080A4810
	adds r0, r4, #0
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4810
	lsls r1, r4, #4
	ldr r0, .L080A4818  @ gBWLDataArray
	adds r2, r1, r0
	cmp r2, #0
	beq .L080A4810
	ldrb r3, [r2, #7]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #0x3b
	bgt .L080A4808
	adds r1, r0, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
.L080A4808:
	adds r0, r5, #0
	movs r1, #0x40
	bl BWL_AddFavoritismValue
.L080A4810:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4818: .4byte gBWLDataArray

	THUMB_FUNC_END BWL_IncrementDeployCount

	THUMB_FUNC_START BWL_AddTilesMoved
BWL_AddTilesMoved: @ 0x080A481C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi .L080A4870
	adds r0, r4, #0
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4870
	lsls r1, r4, #4
	ldr r0, .L080A4878  @ gBWLDataArray
	adds r3, r1, r0
	cmp r3, #0
	beq .L080A4870
	ldrb r4, [r3, #7]
	lsrs r1, r4, #6
	ldrb r0, [r3, #8]
	lsls r0, r0, #2
	orrs r0, r1
	adds r2, r0, r5
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble .L080A4856
	adds r2, r0, #0
.L080A4856:
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #6
	movs r1, #0x3f
	ands r1, r4
	orrs r1, r0
	strb r1, [r3, #7]
	lsrs r0, r2, #2
	strb r0, [r3, #8]
	adds r0, r6, #0
	movs r1, #2
	bl BWL_AddFavoritismValue
.L080A4870:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4878: .4byte gBWLDataArray

	THUMB_FUNC_END BWL_AddTilesMoved

	THUMB_FUNC_START BWL_AddExpGained
BWL_AddExpGained: @ 0x080A487C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi .L080A48C8
	adds r0, r4, #0
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A48C8
	lsls r1, r4, #4
	ldr r0, .L080A48D0  @ gBWLDataArray
	adds r2, r1, r0
	cmp r2, #0
	beq .L080A48C8
	ldr r3, [r2, #8]
	lsls r0, r3, #8
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	movs r1, #0xfa
	lsls r1, r1, #4
	cmp r0, r1
	ble .L080A48B2
	adds r0, r1, #0
.L080A48B2:
	ldr r1, .L080A48D4  @ 0x00000FFF
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, .L080A48D8  @ 0xFF000FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r2, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl BWL_AddFavoritismValue
.L080A48C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A48D0: .4byte gBWLDataArray
.L080A48D4: .4byte 0x00000FFF
.L080A48D8: .4byte 0xFF000FFF

	THUMB_FUNC_END BWL_AddExpGained

	THUMB_FUNC_START StoreSomeUnitSetFlags
StoreSomeUnitSetFlags: @ 0x080A48DC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	negs r1, r1
	bl BWL_AddFavoritismValue
	pop {r0}
	bx r0

	THUMB_FUNC_END StoreSomeUnitSetFlags

	THUMB_FUNC_START func_080A48F0
func_080A48F0: @ 0x080A48F0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080A4900  @ 0xFFFFFF00
	bl BWL_AddFavoritismValue
	pop {r0}
	bx r0
	.align 2, 0
.L080A4900: .4byte 0xFFFFFF00

	THUMB_FUNC_END func_080A48F0

	THUMB_FUNC_START BWL_GetTotalBattles
BWL_GetTotalBattles: @ 0x080A4904
	push {lr}
	movs r3, #0
	ldr r2, .L080A4924  @ gBWLDataStorage
	movs r1, #0x45
.L080A490C:
	ldrh r0, [r2, #0xc]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge .L080A490C
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
.L080A4924: .4byte gBWLDataStorage

	THUMB_FUNC_END BWL_GetTotalBattles

	THUMB_FUNC_START BWL_GetTotalWins
BWL_GetTotalWins: @ 0x080A4928
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, .L080A4954  @ gBWLDataStorage
	movs r5, #3
	adds r2, r0, #0
	adds r2, #0xb
	movs r3, #0x45
.L080A4936:
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	ands r0, r5
	lsls r0, r0, #8
	orrs r0, r1
	adds r4, r4, r0
	adds r2, #0x10
	subs r3, #1
	cmp r3, #0
	bge .L080A4936
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080A4954: .4byte gBWLDataStorage

	THUMB_FUNC_END BWL_GetTotalWins

	THUMB_FUNC_START BWL_GetTotalLosses
BWL_GetTotalLosses: @ 0x080A4958
	push {lr}
	movs r3, #0
	ldr r2, .L080A4974  @ gBWLDataStorage
	movs r1, #0x45
.L080A4960:
	ldrb r0, [r2]
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge .L080A4960
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
.L080A4974: .4byte gBWLDataStorage

	THUMB_FUNC_END BWL_GetTotalLosses

	THUMB_FUNC_START BWL_GetTotalLevelsGained
BWL_GetTotalLevelsGained: @ 0x080A4978
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, .L080A49A0  @ gBWLDataStorage
	movs r4, #0x45
.L080A4980:
	ldr r0, [r5, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	adds r5, #0x10
	subs r4, #1
	cmp r4, #0
	bge .L080A4980
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080A49A0: .4byte gBWLDataStorage

	THUMB_FUNC_END BWL_GetTotalLevelsGained

	THUMB_FUNC_START BWL_GetTotalExpGained
BWL_GetTotalExpGained: @ 0x080A49A4
	push {lr}
	movs r3, #0
	ldr r2, .L080A49C4  @ gBWLDataStorage
	movs r1, #0x45
.L080A49AC:
	ldr r0, [r2, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge .L080A49AC
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
.L080A49C4: .4byte gBWLDataStorage

	THUMB_FUNC_END BWL_GetTotalExpGained

	THUMB_FUNC_START BWL_GetExpGained
BWL_GetExpGained: @ 0x080A49C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi .L080A49E8
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A49E8
	lsls r1, r4, #4
	ldr r0, .L080A49EC  @ gBWLDataArray
	adds r1, r1, r0
	cmp r1, #0
	bne .L080A49F0
.L080A49E8:
	movs r0, #0
	b .L080A49F6
	.align 2, 0
.L080A49EC: .4byte gBWLDataArray
.L080A49F0:
	ldr r0, [r1, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
.L080A49F6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END BWL_GetExpGained

	THUMB_FUNC_START BWL_GetFavoritismValue
BWL_GetFavoritismValue: @ 0x080A49FC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi .L080A4A1C
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4A1C
	lsls r1, r4, #4
	ldr r0, .L080A4A24  @ gBWLDataArray
	adds r0, r1, r0
	cmp r0, #0
	bne .L080A4A28
.L080A4A1C:
	movs r0, #0x80
	lsls r0, r0, #6
	b .L080A4A2E
	.align 2, 0
.L080A4A24: .4byte gBWLDataArray
.L080A4A28:
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
.L080A4A2E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END BWL_GetFavoritismValue

	THUMB_FUNC_START BWL_AddFavoritismValue
BWL_AddFavoritismValue: @ 0x080A4A34
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi .L080A4A96
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4A96
	lsls r1, r4, #4
	ldr r0, .L080A4A70  @ gBWLDataArray
	adds r3, r1, r0
	cmp r3, #0
	beq .L080A4A96
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	adds r1, r0, r5
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	ble .L080A4A78
	ldr r0, .L080A4A74  @ 0xFF0000FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xf
	b .L080A4A92
	.align 2, 0
.L080A4A70: .4byte gBWLDataArray
.L080A4A74: .4byte 0xFF0000FF
.L080A4A78:
	cmp r1, #0
	bge .L080A4A88
	ldr r0, .L080A4A84  @ 0xFF0000FF
	ands r2, r0
	str r2, [r3]
	b .L080A4A96
	.align 2, 0
.L080A4A84: .4byte 0xFF0000FF
.L080A4A88:
	ldr r0, .L080A4A9C  @ 0x0000FFFF
	ands r1, r0
	lsls r1, r1, #8
	ldr r0, .L080A4AA0  @ 0xFF0000FF
	ands r0, r2
.L080A4A92:
	orrs r0, r1
	str r0, [r3]
.L080A4A96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4A9C: .4byte 0x0000FFFF
.L080A4AA0: .4byte 0xFF0000FF

	THUMB_FUNC_END BWL_AddFavoritismValue

	THUMB_FUNC_START func_080A4AA4
func_080A4AA4: @ 0x080A4AA4
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r5, #0
	ldr r4, .L080A4B10  @ gBattleUnitA
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L080A4ABA
	adds r7, r4, #0
	ldr r5, .L080A4B14  @ gBattleUnitB
.L080A4ABA:
	ldr r6, .L080A4B14  @ gBattleUnitB
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L080A4ACA
	adds r7, r6, #0
	adds r5, r4, #0
.L080A4ACA:
	cmp r7, #0
	beq .L080A4B08
	cmp r5, #0
	beq .L080A4AF0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L080A4AF0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl BWL_AddWin
	ldr r1, .L080A4B18  @ gPlaySt
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L080A4AF0:
	cmp r7, #0
	beq .L080A4B08
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L080A4B08
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl BWL_AddLoss
.L080A4B08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4B10: .4byte gBattleUnitA
.L080A4B14: .4byte gBattleUnitB
.L080A4B18: .4byte gPlaySt

	THUMB_FUNC_END func_080A4AA4

	THUMB_FUNC_START IsPlaythroughIdUnique
IsPlaythroughIdUnique: @ 0x080A4B1C
	push {r4, r5, r6, lr}
	sub sp, #0xb0
	adds r6, r0, #0
	mov r0, sp
	bl LoadGeneralGameMetadata
	movs r4, #0
	add r1, sp, #0x14
.L080A4B2C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq .L080A4B58
	adds r4, #1
	cmp r4, #0xb
	ble .L080A4B2C
	movs r4, #0
	add r5, sp, #0x64
.L080A4B3E:
	adds r0, r4, #0
	bl IsSaveBlockValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A4B5C
	adds r0, r4, #0
	adds r1, r5, #0
	bl LoadSavedChapterState
	ldrb r0, [r5, #0x18]
	cmp r0, r6
	bne .L080A4B5C
.L080A4B58:
	movs r0, #0
	b .L080A4B64
.L080A4B5C:
	adds r4, #1
	cmp r4, #2
	ble .L080A4B3E
	movs r0, #1
.L080A4B64:
	add sp, #0xb0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsPlaythroughIdUnique

	THUMB_FUNC_START GetNewPlaythroughId
GetNewPlaythroughId: @ 0x080A4B6C
	push {r4, lr}
	movs r4, #1
.L080A4B70:
	adds r0, r4, #0
	bl IsPlaythroughIdUnique
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq .L080A4B82
	adds r0, r4, #0
	b .L080A4B88
.L080A4B82:
	adds r4, #1
	cmp r4, #0xff
	ble .L080A4B70
.L080A4B88:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetNewPlaythroughId

	THUMB_FUNC_START GGM_GetCompletionCount
GGM_GetCompletionCount: @ 0x080A4B90
	push {lr}
	movs r2, #0
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0x14
.L080A4B9A:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080A4BA4
	adds r2, #1
.L080A4BA4:
	adds r1, #1
	cmp r1, #0xb
	ble .L080A4B9A
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END GGM_GetCompletionCount

	THUMB_FUNC_START GetGlobalCompletionCount
GetGlobalCompletionCount: @ 0x080A4BB0
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A4BC8
	mov r0, sp
	bl GGM_GetCompletionCount
	b .L080A4BCA
.L080A4BC8:
	movs r0, #0
.L080A4BCA:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END GetGlobalCompletionCount

	THUMB_FUNC_START GGM_RegisterCompletedPlaythrough
GGM_RegisterCompletedPlaythrough: @ 0x080A4BD0
	push {r4, lr}
	movs r3, #0
	adds r4, r0, #0
	adds r4, #0x14
	adds r2, r4, #0
.L080A4BDA:
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	beq .L080A4BFE
	adds r3, #1
	cmp r3, #0xb
	ble .L080A4BDA
	movs r3, #0
.L080A4BEA:
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne .L080A4BF8
	strb r1, [r2]
	movs r0, #1
	b .L080A4C00
.L080A4BF8:
	adds r3, #1
	cmp r3, #0xb
	ble .L080A4BEA
.L080A4BFE:
	movs r0, #0
.L080A4C00:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GGM_RegisterCompletedPlaythrough

	THUMB_FUNC_START GetCurerentGameMode
GetCurerentGameMode: @ 0x080A4C08
	ldr r0, .L080A4C10  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	bx lr
	.align 2, 0
.L080A4C10: .4byte gPlaySt

	THUMB_FUNC_END GetCurerentGameMode

	THUMB_FUNC_START RegisterCompletedPlaythrough
RegisterCompletedPlaythrough: @ 0x080A4C14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	bl GetCurerentGameMode
	adds r5, r0, #0
	ldr r6, .L080A4C6C  @ gPlaySt
	ldrb r0, [r6, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1f
	mov r0, sp
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A4C48
	bl InitSaveGeneralGameMetadata
	mov r0, sp
	bl LoadGeneralGameMetadata
.L080A4C48:
	ldrb r1, [r6, #0x18]
	mov r0, sp
	bl GGM_RegisterCompletedPlaythrough
	mov r2, sp
	ldrb r1, [r2, #0xe]
	movs r0, #1
	adds r3, r1, #0
	orrs r3, r0
	strb r3, [r2, #0xe]
	cmp r5, #2
	beq .L080A4C70
	cmp r5, #2
	ble .L080A4CA6
	cmp r5, #3
	beq .L080A4C8A
	b .L080A4CA6
	.align 2, 0
.L080A4C6C: .4byte gPlaySt
.L080A4C70:
	cmp r7, #0
	bne .L080A4C7A
	mov r1, sp
	movs r0, #4
	b .L080A4CA2
.L080A4C7A:
	cmp r4, #0
	beq .L080A4C84
	mov r1, sp
	movs r0, #0x10
	b .L080A4CA2
.L080A4C84:
	mov r1, sp
	movs r0, #8
	b .L080A4CA2
.L080A4C8A:
	cmp r7, #0
	bne .L080A4C94
	mov r1, sp
	movs r0, #0x20
	b .L080A4CA2
.L080A4C94:
	cmp r4, #0
	beq .L080A4C9E
	mov r1, sp
	movs r0, #0x80
	b .L080A4CA2
.L080A4C9E:
	mov r1, sp
	movs r0, #0x40
.L080A4CA2:
	orrs r3, r0
	strb r3, [r1, #0xe]
.L080A4CA6:
	mov r0, sp
	bl SaveGeneralGameMetadata
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END RegisterCompletedPlaythrough

	THUMB_FUNC_START func_080A4CB4
func_080A4CB4: @ 0x080A4CB4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080A4CC8
	movs r0, #0
	b .L080A4CD0
.L080A4CC8:
	mov r0, sp
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
.L080A4CD0:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A4CB4

	THUMB_FUNC_START func_080A4CD8
func_080A4CD8: @ 0x080A4CD8
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A4CF6
	mov r0, sp
	ldrb r1, [r0, #0xf]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #0xf]
	bl SaveGeneralGameMetadata
.L080A4CF6:
	add sp, #0x64
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A4CD8

	THUMB_FUNC_START BWL_GetEntry
BWL_GetEntry: @ 0x080A4CFC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0x45
	bhi .L080A4D20
	adds r0, r4, #0
	bl GetPInfo
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq .L080A4D20
	lsls r0, r4, #4
	ldr r1, .L080A4D1C  @ gBWLDataArray
	adds r0, r0, r1
	b .L080A4D22
	.align 2, 0
.L080A4D1C: .4byte gBWLDataArray
.L080A4D20:
	movs r0, #0
.L080A4D22:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END BWL_GetEntry

	THUMB_FUNC_START GetBonusContentClaimFlags
GetBonusContentClaimFlags: @ 0x080A4D28
	ldr r0, .L080A4D30  @ gBonusContentFlags
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L080A4D30: .4byte gBonusContentFlags

	THUMB_FUNC_END GetBonusContentClaimFlags

	THUMB_FUNC_START SetBonusContentClaimFlags
SetBonusContentClaimFlags: @ 0x080A4D34
	ldr r1, .L080A4D3C  @ gBonusContentFlags
	str r0, [r1]
	bx lr
	.align 2, 0
.L080A4D3C: .4byte gBonusContentFlags

	THUMB_FUNC_END SetBonusContentClaimFlags

	THUMB_FUNC_START SaveBonusContentClaimFlags
SaveBonusContentClaimFlags: @ 0x080A4D40
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080A4D54  @ gBonusContentFlags
	ldr r2, .L080A4D58  @ 0x00000D88
	adds r1, r1, r2
	movs r2, #4
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
.L080A4D54: .4byte gBonusContentFlags
.L080A4D58: .4byte 0x00000D88

	THUMB_FUNC_END SaveBonusContentClaimFlags

	THUMB_FUNC_START LoadBonusContentClaimFlags
LoadBonusContentClaimFlags: @ 0x080A4D5C
	push {lr}
	ldr r2, .L080A4D74  @ ReadSramFast
	ldr r1, .L080A4D78  @ 0x00000D88
	adds r0, r0, r1
	ldr r1, .L080A4D7C  @ gBonusContentFlags
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
.L080A4D74: .4byte ReadSramFast
.L080A4D78: .4byte 0x00000D88
.L080A4D7C: .4byte gBonusContentFlags

	THUMB_FUNC_END LoadBonusContentClaimFlags

	THUMB_FUNC_START UpdateLastUsedGameSaveSlot
UpdateLastUsedGameSaveSlot: @ 0x080A4D80
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl LoadGeneralGameMetadata
	mov r0, sp
	adds r0, #0x62
	strb r4, [r0]
	mov r0, sp
	bl SaveGeneralGameMetadataNoChecksum
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END UpdateLastUsedGameSaveSlot

	THUMB_FUNC_START GetLastUsedGameSaveSlot
GetLastUsedGameSaveSlot: @ 0x080A4DA0
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadGeneralGameMetadata
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A4DBE
	mov r0, sp
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #2
	bgt .L080A4DBE
	cmp r0, #0
	bge .L080A4DC0
.L080A4DBE:
	movs r0, #0
.L080A4DC0:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END GetLastUsedGameSaveSlot

	THUMB_FUNC_START func_080A4DC8
func_080A4DC8: @ 0x080A4DC8
	push {r4, r5, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	movs r0, #3
	bl func_080A5DA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A4DF0
	add r4, sp, #0x10
	movs r0, #3
	adds r1, r4, #0
	bl LoadSuspendedChapterState
	ldrb r0, [r4, #0xc]
	cmp r0, r5
	bne .L080A4DF0
	movs r0, #3
	bl ClearSaveBlock
.L080A4DF0:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl SaveMetadata_Save
	add sp, #0x5c
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080A4DC8

	THUMB_FUNC_START CopyGameSave
CopyGameSave: @ 0x080A4E08
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov r9, r1
	bl GetSaveSourceAddress
	adds r6, r0, #0
	mov r0, r9
	bl GetSaveTargetAddress
	mov r8, r0
	ldr r0, .L080A4E60  @ ReadSramFast
	ldr r4, .L080A4E64  @ gBuf
	ldr r5, .L080A4E68  @ 0x00000DC8
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl WriteAndVerifySramFast
	ldr r0, .L080A4E6C  @ 0x00040624
	str r0, [sp]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, r9
	bl SaveMetadata_Save
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4E60: .4byte ReadSramFast
.L080A4E64: .4byte gBuf
.L080A4E68: .4byte 0x00000DC8
.L080A4E6C: .4byte 0x00040624

	THUMB_FUNC_END CopyGameSave

	THUMB_FUNC_START SaveNewGame
SaveNewGame: @ 0x080A4E70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	mov sl, r0
	adds r5, r1, #0
	mov r8, r2
	adds r4, r3, #0
	bl GetSaveTargetAddress
	adds r7, r0, #0
	mov r0, r8
	cmp r0, #0
	bne .L080A4E96
	ldr r0, .L080A4FE4  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	mov r8, r0
.L080A4E96:
	cmp r4, #0
	bge .L080A4EA4
	ldr r0, .L080A4FE4  @ gPlaySt
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r4, r0, #0x1f
.L080A4EA4:
	movs r0, #0
	bl SetGameTime
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl InitPlayConfig
	bl InitUnits
	bl ClearConvoyItems
	bl ClearGlobalTriggerState
	movs r0, #3
	bl ClearSaveBlock
	ldr r6, .L080A4FE4  @ gPlaySt
	adds r2, r6, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r6, #0x2c]
	ldr r0, .L080A4FE8  @ 0xFFFFE00F
	ands r0, r1
	strh r0, [r6, #0x2c]
	add r0, sp, #0x34
	movs r4, #0
	strh r4, [r0]
	adds r1, r6, #0
	adds r1, #0x30
	ldr r2, .L080A4FEC  @ 0x01000008
	bl CpuSet
	ldr r0, [r6, #0x2c]
	ldr r1, .L080A4FF0  @ 0xFF801FFF
	ands r0, r1
	str r0, [r6, #0x2c]
	movs r5, #0
	mov r1, r8
	strb r1, [r6, #0x1b]
	adds r2, r6, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	strb r4, [r0]
	strb r4, [r6, #0xe]
	bl GetNewPlaythroughId
	strb r0, [r6, #0x18]
	mov r0, sl
	strb r0, [r6, #0xc]
	bl GetGlobalCompletionCount
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #7
	ldrh r2, [r6, #0x2e]
	ldr r1, .L080A4FF4  @ 0xFFFFF07F
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x2e]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x4c
	bl WriteAndVerifySramFast
	movs r0, #0
	bl SetBonusContentClaimFlags
	adds r0, r7, #0
	bl SaveBonusContentClaimFlags
	mov r0, sp
	adds r0, #0x36
	strh r5, [r0]
	add r4, sp, #0x10
	ldr r2, .L080A4FF8  @ 0x01000012
	adds r1, r4, #0
	bl CpuSet
	add r1, sp, #0x50
	mov r8, r1
	add r0, sp, #0x38
	mov r9, r0
	adds r5, r7, #0
	adds r5, #0x4c
	movs r6, #0x32
.L080A4F62:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r5, #0x24
	subs r6, #1
	cmp r6, #0
	bge .L080A4F62
	movs r5, #0
	movs r0, #0xef
	lsls r0, r0, #3
	adds r1, r7, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	ldr r1, .L080A4FFC  @ 0x0000079C
	adds r0, r7, r1
	bl SaveConvoyItems
	adds r0, r7, #0
	bl SaveClearedBWLAndChapterWinData
	ldr r1, .L080A5000  @ 0x00000D6C
	adds r0, r7, r1
	bl SaveGlobalEventIndexes
	ldr r1, .L080A5004  @ 0x00000D8C
	adds r0, r7, r1
	bl func_080A7074
	movs r4, #0
	mov r0, r8
	strh r5, [r0]
	ldr r2, .L080A5008  @ 0x0100000C
	mov r1, r9
	bl CpuSet
	movs r0, #0xdb
	lsls r0, r0, #4
	adds r1, r7, r0
	mov r0, r9
	movs r2, #0x18
	bl WriteAndVerifySramFast
	ldr r0, .L080A500C  @ 0x00040624
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sl
	bl SaveMetadata_Save
	mov r0, sl
	bl UpdateLastUsedGameSaveSlot
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A4FE4: .4byte gPlaySt
.L080A4FE8: .4byte 0xFFFFE00F
.L080A4FEC: .4byte 0x01000008
.L080A4FF0: .4byte 0xFF801FFF
.L080A4FF4: .4byte 0xFFFFF07F
.L080A4FF8: .4byte 0x01000012
.L080A4FFC: .4byte 0x0000079C
.L080A5000: .4byte 0x00000D6C
.L080A5004: .4byte 0x00000D8C
.L080A5008: .4byte 0x0100000C
.L080A500C: .4byte 0x00040624

	THUMB_FUNC_END SaveNewGame

	THUMB_FUNC_START SaveGame
SaveGame: @ 0x080A5010
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	mov sl, r0
	bl GetSaveTargetAddress
	adds r7, r0, #0
	movs r0, #3
	bl ClearSaveBlock
	ldr r4, .L080A5104  @ gPlaySt
	mov r0, sl
	strb r0, [r4, #0xc]
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x4c
	bl WriteAndVerifySramFast
	add r1, sp, #0x10
	mov r8, r1
	mov r0, sp
	adds r0, #0x74
	str r0, [sp, #0x8c]
	adds r4, r7, #0
	adds r4, #0x4c
	movs r6, #0
	ldr r1, .L080A5108  @ gUnitArrayBlue
	mov r9, r1
	movs r5, #0x32
.L080A5056:
	mov r1, r9
	adds r0, r6, r1
	adds r1, r4, #0
	bl SaveUnit
	adds r4, #0x24
	adds r6, #0x48
	subs r5, #1
	cmp r5, #0
	bge .L080A5056
	mov r0, r8
	bl LoadGeneralGameMetadata
	movs r4, #0
	ldr r6, .L080A5108  @ gUnitArrayBlue
	movs r5, #0x32
.L080A5076:
	adds r0, r4, r6
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	mov r1, r8
	bl SGM_SetCharacterKnown
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge .L080A5076
	movs r4, #0
	mov r0, r8
	bl SaveGeneralGameMetadata
	movs r1, #0xef
	lsls r1, r1, #3
	adds r0, r7, r1
	bl SaveGMMonsterRnState
	ldr r1, .L080A510C  @ 0x0000079C
	adds r0, r7, r1
	bl SaveConvoyItems
	ldr r1, .L080A5110  @ 0x0000084C
	adds r0, r7, r1
	bl SaveBWLEntries
	ldr r1, .L080A5114  @ 0x00000CAC
	adds r0, r7, r1
	bl SaveChapterWinData
	adds r0, r7, #0
	bl SaveBonusContentClaimFlags
	ldr r1, .L080A5118  @ 0x00000D6C
	adds r0, r7, r1
	bl SaveGlobalEventIndexes
	ldr r1, .L080A511C  @ 0x00000D8C
	adds r0, r7, r1
	ldr r1, .L080A5120  @ gGmData
	bl SaveWMStuff
	ldr r0, [sp, #0x8c]
	bl func_08037E4C
	movs r0, #0xdb
	lsls r0, r0, #4
	adds r1, r7, r0
	ldr r0, [sp, #0x8c]
	movs r2, #0x18
	bl WriteAndVerifySramFast
	ldr r0, .L080A5124  @ 0x00040624
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sl
	bl SaveMetadata_Save
	mov r0, sl
	bl UpdateLastUsedGameSaveSlot
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A5104: .4byte gPlaySt
.L080A5108: .4byte gUnitArrayBlue
.L080A510C: .4byte 0x0000079C
.L080A5110: .4byte 0x0000084C
.L080A5114: .4byte 0x00000CAC
.L080A5118: .4byte 0x00000D6C
.L080A511C: .4byte 0x00000D8C
.L080A5120: .4byte gGmData
.L080A5124: .4byte 0x00040624

	THUMB_FUNC_END SaveGame

	THUMB_FUNC_START LoadGame
LoadGame: @ 0x080A5128
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	mov r9, r0
	bl GetSaveSourceAddress
	adds r7, r0, #0
	ldr r0, .L080A51F0  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L080A514C
	movs r0, #3
	bl ClearSaveBlock
.L080A514C:
	ldr r0, .L080A51F4  @ ReadSramFast
	ldr r4, .L080A51F8  @ gPlaySt
	ldr r3, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x4c
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	mov r0, r9
	strb r0, [r4, #0xc]
	bl InitUnits
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x4c
	ldr r1, .L080A51FC  @ gUnitArrayBlue
	mov r8, r1
	movs r5, #0x32
.L080A5176:
	mov r2, r8
	adds r1, r6, r2
	adds r0, r4, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge .L080A5176
	movs r1, #0xef
	lsls r1, r1, #3
	adds r0, r7, r1
	bl LoadGMMonsterRnState
	ldr r2, .L080A5200  @ 0x0000079C
	adds r0, r7, r2
	bl LoadConvoyItems
	ldr r1, .L080A5204  @ 0x00000D6C
	adds r0, r7, r1
	bl LoadPermanentEids
	ldr r2, .L080A5208  @ 0x0000084C
	adds r0, r7, r2
	bl LoadBWLEntries
	ldr r1, .L080A520C  @ 0x00000CAC
	adds r0, r7, r1
	bl LoadChapterDataWinArray
	adds r0, r7, #0
	bl LoadBonusContentClaimFlags
	ldr r2, .L080A5210  @ 0x00000D8C
	adds r0, r7, r2
	ldr r1, .L080A5214  @ gGmData
	bl LoadWMStuff
	ldr r1, .L080A51F4  @ ReadSramFast
	movs r2, #0xdb
	lsls r2, r2, #4
	adds r0, r7, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x18
	bl _call_via_r3
	mov r0, sp
	bl func_08037E64
	mov r0, r9
	bl UpdateLastUsedGameSaveSlot
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080A51F0: .4byte gBmSt
.L080A51F4: .4byte ReadSramFast
.L080A51F8: .4byte gPlaySt
.L080A51FC: .4byte gUnitArrayBlue
.L080A5200: .4byte 0x0000079C
.L080A5204: .4byte 0x00000D6C
.L080A5208: .4byte 0x0000084C
.L080A520C: .4byte 0x00000CAC
.L080A5210: .4byte 0x00000D8C
.L080A5214: .4byte gGmData

	THUMB_FUNC_END LoadGame

	THUMB_FUNC_START IsSaveBlockValid
IsSaveBlockValid: @ 0x080A5218
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl SaveMetadata_Load
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END IsSaveBlockValid

	THUMB_FUNC_START LoadSavedChapterState
LoadSavedChapterState: @ 0x080A522C
	push {r4, lr}
	adds r4, r1, #0
	bl GetSaveSourceAddress
	ldr r1, .L080A5248  @ ReadSramFast
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x4c
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A5248: .4byte ReadSramFast

	THUMB_FUNC_END LoadSavedChapterState

	THUMB_FUNC_START LoadSavedBonusClaimFlags
LoadSavedBonusClaimFlags: @ 0x080A524C
	push {lr}
	sub sp, #4
	bl GetSaveSourceAddress
	ldr r1, .L080A526C  @ ReadSramFast
	ldr r2, .L080A5270  @ 0x00000D88
	adds r0, r0, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #4
	bl _call_via_r3
	ldr r0, [sp]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
.L080A526C: .4byte ReadSramFast
.L080A5270: .4byte 0x00000D88

	THUMB_FUNC_END LoadSavedBonusClaimFlags

	THUMB_FUNC_START LoadSavedWMStuff
LoadSavedWMStuff: @ 0x080A5274
	push {r4, lr}
	adds r4, r1, #0
	bl GetSaveSourceAddress
	ldr r1, .L080A528C  @ 0x00000D8C
	adds r0, r0, r1
	adds r1, r4, #0
	bl LoadWMStuff
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080A528C: .4byte 0x00000D8C

	THUMB_FUNC_END LoadSavedWMStuff

	THUMB_FUNC_START LoadSavedEid8A
LoadSavedEid8A: @ 0x080A5290
	push {r4, lr}
	bl GetSaveSourceAddress
	ldr r1, .L080A52B4  @ 0x00000D6C
	adds r0, r0, r1
	ldr r4, .L080A52B8  @ gBuf
	adds r1, r4, #0
	bl LoadPermanentEidsIn
	movs r0, #0x8a
	adds r1, r4, #0
	bl CheckGlobalEventIdFrom
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080A52B4: .4byte 0x00000D6C
.L080A52B8: .4byte gBuf

	THUMB_FUNC_END LoadSavedEid8A

	THUMB_FUNC_START func_080A52BC
func_080A52BC: @ 0x080A52BC
	push {lr}
	adds r2, r0, #0
	ldrb r1, [r2, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L080A52D6
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne .L080A52D6
	movs r0, #0
	b .L080A52D8
.L080A52D6:
	movs r0, #1
.L080A52D8:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A52BC

	THUMB_FUNC_START func_080A52DC
func_080A52DC: @ 0x080A52DC
	push {r4, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	bl IsSaveBlockValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A5300
	adds r0, r4, #0
	mov r1, sp
	bl LoadSavedChapterState
	mov r0, sp
	bl func_080A52BC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L080A5302
.L080A5300:
	movs r0, #0
.L080A5302:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A52DC

	THUMB_FUNC_START func_080A530C
func_080A530C: @ 0x080A530C
	push {r4, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	bl IsSaveBlockValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080A5332
	adds r0, r4, #0
	mov r1, sp
	bl LoadSavedChapterState
	mov r0, sp
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L080A5334
.L080A5332:
	movs r0, #0
.L080A5334:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080A530C

	THUMB_FUNC_START SaveUnit
SaveUnit: @ 0x080A533C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x70
	adds r7, r0, #0
	str r1, [sp, #0x6c]
	mov r1, sp
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	strb r0, [r1, #0x14]
	mov r3, sp
	ldr r0, [r7, #4]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r1, r0
	ldrb r2, [r3]
	movs r5, #0x80
	negs r5, r5
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r4, [r7]
	cmp r4, #0
	bne .L080A5388
	add r7, sp, #0x24
	adds r0, r7, #0
	bl ClearUnit
	mov r0, sp
	strb r4, [r0, #0x14]
	mov r2, sp
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
.L080A5388:
	mov r4, sp
	movs r1, #8
	ldrsb r1, [r7, r1]
	movs r0, #0x1f
	mov r9, r0
	mov r0, r9
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r4]
	ldr r3, .L080A5748  @ 0xFFFFF07F
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	ldrb r2, [r7, #9]
	movs r1, #0x7f
	mov sl, r1
	ands r2, r1
	lsls r2, r2, #0xc
	ldr r0, [sp]
	ldr r1, .L080A574C  @ 0xFFF80FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #3
	ldrh r2, [r4, #2]
	ldr r0, .L080A5750  @ 0xFFFFFE07
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x7f
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	movs r2, #0x12
	ldrsb r2, [r7, r2]
	movs r6, #0x3f
	ands r2, r6
	lsls r2, r2, #0xc
	ldr r0, [sp, #4]
	ldr r1, .L080A5754  @ 0xFFFC0FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	movs r1, #0x14
	ldrsb r1, [r7, r1]
	movs r5, #0x1f
	ands r1, r5
	lsls r1, r1, #2
	ldrb r2, [r4, #6]
	movs r0, #0x7d
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #6]
	mov r2, sp
	movs r0, #0x15
	ldrsb r0, [r7, r0]
	mov r4, r9
	ands r0, r4
	lsls r0, r0, #7
	ldrh r1, [r2, #6]
	ands r3, r1
	orrs r3, r0
	strh r3, [r2, #6]
	mov r4, sp
	movs r3, #0x16
	ldrsb r3, [r7, r3]
	movs r0, #0xf
	mov r8, r0
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r4, #7]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #7]
	lsrs r3, r3, #4
	movs r1, #1
	mov ip, r1
	ands r3, r1
	ldrb r1, [r4, #8]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r4, #8]
	mov r3, sp
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	ands r1, r5
	lsls r1, r1, #1
	movs r2, #0x3f
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	movs r1, #0x18
	ldrsb r1, [r7, r1]
	mov r4, r9
	ands r1, r4
	lsls r1, r1, #6
	ldrh r2, [r3, #8]
	ldr r0, .L080A5758  @ 0xFFFFF83F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #8]
	movs r1, #0x19
	ldrsb r1, [r7, r1]
	lsls r1, r1, #3
	ldrb r2, [r3, #9]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	movs r1, #0x1a
	ldrsb r1, [r7, r1]
	ands r1, r5
	ldrb r2, [r3, #0xa]
	pop {r0}