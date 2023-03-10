	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Proc Displaying Chapter Title in the middle of the screen

	THUMB_FUNC_START func_0802237C
func_0802237C: @ 0x0802237C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r1, .L080223A4  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	cmp r0, #0x16
	beq .L08022398
	cmp r0, #0x23
	bne .L080223AC
.L08022398:
	ldr r1, .L080223A8  @ 0x000003E7
	ldr r0, [sp]
	bl Proc_Goto
	b .L080224BE
	.align 2, 0
.L080223A4: .4byte gPlaySt
.L080223A8: .4byte 0x000003E7
.L080223AC:
	bl ResetHLayers
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, .L080224D0  @ gBg0Tm
	mov r8, r2
	mov r0, r8
	movs r1, #0
	bl TmFill
	ldr r0, .L080224D4  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080224D8  @ gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080224DC  @ gBg3Tm
	movs r1, #0
	bl TmFill
	ldr r7, .L080224E0  @ gDispIo
	ldrb r0, [r7, #1]
	movs r5, #0x20
	orrs r0, r5
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	movs r0, #0x34
	adds r0, r0, r7
	mov r9, r0
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r6, #4
	orrs r1, r6
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r0, #0x36
	adds r0, r0, r7
	mov ip, r0
	ldrb r2, [r0]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	movs r2, #3
	negs r2, r2
	mov sl, r2
	ands r0, r2
	orrs r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, r9
	strb r1, [r2]
	orrs r0, r5
	mov r1, ip
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r5, #0
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x40
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x60
	strb r0, [r1]
	movs r0, #8
	movs r1, #1
	bl func_080895B4
	movs r4, #0x80
	lsls r4, r4, #1
	ldr r0, .L080224E4  @ gPlaySt
	bl func_0808979C
	adds r1, r0, #0
	adds r0, r4, #0
	bl LoadChapterTitleGfx
	ldr r2, .L080224E8  @ 0x00000246
	add r8, r2
	mov r0, r8
	movs r1, #1
	bl func_080896D8
	bl EnablePalSync
	movs r0, #0xf
	bl EnableBgSync
	ldrb r0, [r7, #1]
	movs r1, #1
	orrs r0, r1
	mov r2, sl
	ands r0, r2
	subs r1, #6
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r7, #1]
	ldr r0, [sp]
	adds r0, #0x52
	strh r5, [r0]
.L080224BE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080224D0: .4byte gBg0Tm
.L080224D4: .4byte gBg1Tm
.L080224D8: .4byte gBg2Tm
.L080224DC: .4byte gBg3Tm
.L080224E0: .4byte gDispIo
.L080224E4: .4byte gPlaySt
.L080224E8: .4byte 0x00000246

	THUMB_FUNC_END func_0802237C

	THUMB_FUNC_START func_080224EC
func_080224EC: @ 0x080224EC
	push {lr}
	ldr r0, .L08022520  @ gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r2, .L08022524  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
.L08022520: .4byte gBg0Tm
.L08022524: .4byte gDispIo

	THUMB_FUNC_END func_080224EC

	THUMB_FUNC_START func_08022528
func_08022528: @ 0x08022528
	push {r4, r5, lr}
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, .L080225A0  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl DisableTilesetPaletteAnim
	ldr r4, .L080225A4  @ gPlaySt
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
	ldr r5, .L080225A8  @ gBmSt
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080225A0: .4byte gBg2Tm
.L080225A4: .4byte gPlaySt
.L080225A8: .4byte gBmSt

	THUMB_FUNC_END func_08022528

.align 2, 0
