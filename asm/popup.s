	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START func_08010DC0
func_08010DC0: @ 0x08010DC0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ClearDialogueAndFaces
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
	ldr r5, .L08010E44  @ gUnknown_0895DD1C
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r6, [r0]
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	bl Decompress
	ldr r0, .L08010E48  @ gBg3Tm
	adds r1, r5, #4
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	ldr r1, .L08010E4C  @ gPal
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08010E44: .4byte gUnknown_0895DD1C
.L08010E48: .4byte gBg3Tm
.L08010E4C: .4byte gPal

	THUMB_FUNC_END func_08010DC0

	THUMB_FUNC_START ClearDialogueAndFaces
ClearDialogueAndFaces: @ 0x08010E50
	push {lr}
	bl Dialogue_ClearTextBoxes
	ldr r0, .L08010E68  @ ProcScr_Face
	bl EndEachProc
	bl InitFaces
	bl ClearTalkFaceRefs
	pop {r0}
	bx r0
	.align 2, 0
.L08010E68: .4byte ProcScr_Face

	THUMB_FUNC_END ClearDialogueAndFaces

	THUMB_FUNC_START DisplayFlashingCursor
DisplayFlashingCursor: @ 0x08010E6C
	push {r4, r5, lr}
	lsls r5, r2, #0x10
	lsrs r4, r5, #0x10
	ldr r3, .L08010EBC  @ gBmSt
	ldrh r2, [r3, #0xc]
	lsls r0, r0, #0x14
	asrs r0, r0, #0x10
	subs r0, r0, r2
	ldrh r2, [r3, #0xe]
	lsls r1, r1, #0x14
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	subs r2, #1
	ands r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r2, #0xff
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, .L08010EC0  @ gUnknown_085921AC
	ldr r3, .L08010EC4  @ 0x00002822
	bl PutOamHiRam
	cmp r4, #0xf
	bhi .L08010EC8
	lsrs r2, r5, #0x11
	movs r0, #0x10
	movs r1, #0
	bl func_08010EE8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b .L08010EE0
	.align 2, 0
.L08010EBC: .4byte gBmSt
.L08010EC0: .4byte gUnknown_085921AC
.L08010EC4: .4byte 0x00002822
.L08010EC8:
	lsrs r2, r5, #0x11
	subs r2, #8
	movs r0, #0
	movs r1, #0x10
	bl func_08010EE8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1f
	bls .L08010EE0
	movs r4, #0
.L08010EE0:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END DisplayFlashingCursor

	THUMB_FUNC_START func_08010EE8
func_08010EE8: @ 0x08010EE8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L08010F2C  @ gUnknown_085A7EE8
	ldr r4, .L08010F30  @ gPal+0x240
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L08010F34  @ 0xFFFFFDC0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl ApplyFlashingPaletteAnimation
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08010F2C: .4byte gUnknown_085A7EE8
.L08010F30: .4byte gPal+0x240
.L08010F34: .4byte 0xFFFFFDC0

	THUMB_FUNC_END func_08010EE8

	THUMB_FUNC_START PopupProc_GetInnerLength
PopupProc_GetInnerLength: @ 0x08010F38
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r4, #0
	ldr r5, [r6, #0x2c]
	b .L0801105A
.L08010F44:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #0xb
	bls .L08010F4E
	b .L08011058
.L08010F4E:
	lsls r0, r0, #2
	ldr r1, .L08010F58  @ .L08010F5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08010F58: .4byte .L08010F5C
.L08010F5C: @ jump table
	.4byte .L08011054 @ case 0
	.4byte .L08011018 @ case 1
	.4byte .L0801102C @ case 2
	.4byte .L08011040 @ case 3
	.4byte .L08011000 @ case 4
	.4byte .L08010FEC @ case 5
	.4byte .L08010FF8 @ case 6
	.4byte .L08011058 @ case 7
	.4byte .L08010FA8 @ case 8
	.4byte .L08010FC8 @ case 9
	.4byte .L08010F96 @ case 10
	.4byte .L08010F8C @ case 11
.L08010F8C:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	b .L08011058
.L08010F96:
	ldr r0, .L08010FA4  @ gPopupNumber
	ldr r0, [r0]
	mov r1, sp
	bl String_FromNumber
	lsls r0, r0, #3
	b .L08011056
	.align 2, 0
.L08010FA4: .4byte gPopupNumber
.L08010FA8:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, .L08010FC4  @ gPopupItem
	ldrh r0, [r0]
	bl GetItemIcon
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #0
	b .L08010FDE
	.align 2, 0
.L08010FC4: .4byte gPopupItem
.L08010FC8:
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	ldr r0, .L08010FE8  @ gPopupItem
	ldrh r0, [r0]
	adds r0, #0x70
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r0, #1
.L08010FDE:
	bl ApplyIconPalette
	adds r4, #0x10
	b .L08011058
	.align 2, 0
.L08010FE8: .4byte gPopupItem
.L08010FEC:
	ldr r0, [r5, #4]
	bl GetMsg
	bl GetStringTextLen
	b .L08011056
.L08010FF8:
	ldr r0, [r5, #4]
	bl GetStringTextLen
	b .L08011056
.L08011000:
	ldr r0, .L08011014  @ gpPopupUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	bl GetStringTextLen
	b .L08011056
	.align 2, 0
.L08011014: .4byte gpPopupUnit
.L08011018:
	ldr r0, .L08011028  @ gPopupItem
	ldrh r0, [r0]
	bl GetItemName
	bl GetStringTextLen
	b .L08011056
	.align 2, 0
.L08011028: .4byte gPopupItem
.L0801102C:
	ldr r0, .L0801103C  @ gPopupItem
	ldrh r0, [r0]
	movs r1, #1
	bl GetItemNameWithArticle
	bl GetStringTextLen
	b .L08011056
	.align 2, 0
.L0801103C: .4byte gPopupItem
.L08011040:
	ldr r0, .L08011050  @ gPopupItem
	ldrh r0, [r0]
	movs r1, #0
	bl GetItemNameWithArticle
	bl GetStringTextLen
	b .L08011056
	.align 2, 0
.L08011050: .4byte gPopupItem
.L08011054:
	ldr r0, [r5, #4]
.L08011056:
	adds r4, r4, r0
.L08011058:
	adds r5, #8
.L0801105A:
	ldrb r0, [r5]
	cmp r0, #0
	beq .L08011062
	b .L08010F44
.L08011062:
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END PopupProc_GetInnerLength

	THUMB_FUNC_START GenSomeLongPopupText
GenSomeLongPopupText: @ 0x0801106C
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	b .L08011156
.L08011078:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #0xa
	bhi .L08011154
	lsls r0, r0, #2
	ldr r1, .L0801108C  @ .L08011090
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0801108C: .4byte .L08011090
.L08011090: @ jump table
	.4byte .L0801114C @ case 0
	.4byte .L08011110 @ case 1
	.4byte .L08011120 @ case 2
	.4byte .L08011130 @ case 3
	.4byte .L080110FC @ case 4
	.4byte .L080110E8 @ case 5
	.4byte .L080110F2 @ case 6
	.4byte .L080110DE @ case 7
	.4byte .L080110D4 @ case 8
	.4byte .L080110D4 @ case 9
	.4byte .L080110BC @ case 10
.L080110BC:
	ldr r0, .L080110D0  @ gPopupNumber
	ldr r0, [r0]
	mov r1, sp
	bl String_FromNumber
	add r0, sp, #0x10
	mov r1, sp
	bl Text_DrawString
	b .L08011154
	.align 2, 0
.L080110D0: .4byte gPopupNumber
.L080110D4:
	add r0, sp, #0x10
	movs r1, #0x10
	bl Text_Skip
	b .L08011154
.L080110DE:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_SetColor
	b .L08011154
.L080110E8:
	add r4, sp, #0x10
	ldr r0, [r5, #4]
	bl GetMsg
	b .L0801113C
.L080110F2:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_DrawString
	b .L08011154
.L080110FC:
	add r4, sp, #0x10
	ldr r0, .L0801110C  @ gpPopupUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	b .L0801113C
	.align 2, 0
.L0801110C: .4byte gpPopupUnit
.L08011110:
	add r4, sp, #0x10
	ldr r0, .L0801111C  @ gPopupItem
	ldrh r0, [r0]
	bl GetItemName
	b .L0801113C
	.align 2, 0
.L0801111C: .4byte gPopupItem
.L08011120:
	add r4, sp, #0x10
	ldr r0, .L0801112C  @ gPopupItem
	ldrh r0, [r0]
	movs r1, #1
	b .L08011138
	.align 2, 0
.L0801112C: .4byte gPopupItem
.L08011130:
	add r4, sp, #0x10
	ldr r0, .L08011148  @ gPopupItem
	ldrh r0, [r0]
	movs r1, #0
.L08011138:
	bl GetItemNameWithArticle
.L0801113C:
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	b .L08011154
	.align 2, 0
.L08011148: .4byte gPopupItem
.L0801114C:
	add r0, sp, #0x10
	ldr r1, [r5, #4]
	bl Text_Skip
.L08011154:
	adds r5, #8
.L08011156:
	ldrb r0, [r5]
	cmp r0, #0
	bne .L08011078
	movs r0, #3
	bl EnableBgSync
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END GenSomeLongPopupText

	THUMB_FUNC_START func_0801116C
func_0801116C: @ 0x0801116C
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	ldr r0, .L08011198  @ 0x0000FFFF
	strh r0, [r2, #0x3e]
	adds r0, r2, #0
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
.L08011198: .4byte 0x0000FFFF

	THUMB_FUNC_END func_0801116C

	THUMB_FUNC_START PopupProc_InitGfx
PopupProc_InitGfx: @ 0x0801119C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L080111EC  @ 0x06002000
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #0
	bl InitTextFont
	bl ClearIcons
	bl LoadUiFrameGraphics
	bl SetBlendNone
	ldr r2, .L080111F0  @ gDispIo
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
	bl PopupProc_GetInnerLength
	adds r4, #0x46
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080111EC: .4byte 0x06002000
.L080111F0: .4byte gDispIo

	THUMB_FUNC_END PopupProc_InitGfx

	THUMB_FUNC_START func_080111F4
func_080111F4: @ 0x080111F4
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq .L0801120C
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
.L0801120C:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080111F4

	THUMB_FUNC_START PopupProc_PlaySound
PopupProc_PlaySound: @ 0x08011210
	push {lr}
	adds r1, r0, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq .L0801122E
	ldr r0, .L08011234  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0801122E
	ldrh r0, [r1]
	bl m4aSongNumStart
.L0801122E:
	pop {r0}
	bx r0
	.align 2, 0
.L08011234: .4byte gPlaySt

	THUMB_FUNC_END PopupProc_PlaySound

	THUMB_FUNC_START func_08011238
func_08011238: @ 0x08011238
	push {lr}
	adds r3, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08011250
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
.L08011250:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08011238

	THUMB_FUNC_START PopupIconUpdaterLoop
PopupIconUpdaterLoop: @ 0x08011254
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	ldr r2, .L0801126C  @ Sprite_16x16
	adds r0, #0x4a
	ldrh r3, [r0]
	adds r0, r4, #0
	bl PutOamHiRam
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801126C: .4byte Sprite_16x16

	THUMB_FUNC_END PopupIconUpdaterLoop

	THUMB_FUNC_START PopupProc_Display
PopupProc_Display: @ 0x08011270
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	bl PopupProc_GetInnerLength
	adds r2, r5, #0
	adds r2, #0x46
	strh r0, [r2]
	lsls r1, r0, #0x10
	lsrs r6, r1, #0x13
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	beq .L08011296
	adds r6, #1
.L08011296:
	lsls r0, r6, #3
	ldrh r1, [r2]
	subs r0, r0, r1
	asrs r0, r0, #1
	mov r9, r0
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080112BA
	movs r0, #0x1e
	subs r0, r0, r6
	asrs r0, r0, #1
	subs r7, r0, #1
	b .L080112BE
.L080112BA:
	movs r7, #0
	ldrsb r7, [r2, r7]
.L080112BE:
	adds r2, r5, #0
	adds r2, #0x35
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	negs r0, r0
	movs r3, #8
	mov r8, r3
	cmp r1, r0
	beq .L080112D6
	adds r2, r1, #0
	mov r8, r2
.L080112D6:
	adds r4, r6, #2
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #4
	bl DrawUiFrame2
	movs r0, #0x37
	adds r0, r0, r5
	mov sl, r0
	strb r7, [r0]
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp, #0xc]
	mov r2, r8
	strb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, #2
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x44
	ldrb r0, [r4]
	add r0, r9
	strb r0, [r4]
	add r0, sp, #4
	adds r1, r6, #0
	bl InitText
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	add r0, sp, #4
	bl Text_SetColor
	add r0, sp, #4
	mov r1, r9
	bl Text_SetCursor
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl GenSomeLongPopupText
	ldrh r0, [r5, #0x3e]
	ldr r6, .L080113B4  @ 0x0000FFFF
	cmp r0, r6
	beq .L0801134C
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	bl PutIconObjImg
.L0801134C:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, .L080113B8  @ gBg0Tm
	adds r1, r1, r0
	add r0, sp, #4
	bl PutText
	bl ResetText
	ldrh r0, [r5, #0x3e]
	cmp r0, r6
	beq .L080113A4
	ldr r0, .L080113BC  @ gUnknown_08592228
	adds r1, r5, #0
	bl SpawnProc
	mov r3, sl
	ldrb r1, [r3]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r4, [r4]
	adds r1, r1, r4
	str r1, [r0, #0x2c]
	ldr r2, [sp, #0xc]
	ldrb r1, [r2]
	adds r1, #1
	lsls r1, r1, #3
	str r1, [r0, #0x30]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r5, #0
	adds r1, #0x42
	ldrb r2, [r1]
	movs r1, #0xf
	ands r1, r2
	lsls r1, r1, #0xc
	ldrh r2, [r3]
	orrs r1, r2
	adds r0, #0x4a
	strh r1, [r0]
.L080113A4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080113B4: .4byte 0x0000FFFF
.L080113B8: .4byte gBg0Tm
.L080113BC: .4byte gUnknown_08592228

	THUMB_FUNC_END PopupProc_Display

	THUMB_FUNC_START PopupProc_WaitForPress
PopupProc_WaitForPress: @ 0x080113C0
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	bge .L080113E0
	ldr r0, .L080113DC  @ gKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq .L080113F2
	adds r0, r1, #0
	bl Proc_Break
	b .L080113F2
	.align 2, 0
.L080113DC: .4byte gKeySt
.L080113E0:
	cmp r0, #0
	beq .L080113F2
	subs r0, #1
	str r0, [r1, #0x30]
	cmp r0, #0
	bne .L080113F2
	adds r0, r1, #0
	bl Proc_Break
.L080113F2:
	pop {r0}
	bx r0

	THUMB_FUNC_END PopupProc_WaitForPress

	THUMB_FUNC_START LongPopup_Clear
LongPopup_Clear: @ 0x080113F8
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r2, #0
	adds r5, #0x38
	ldrb r0, [r5]
	adds r7, r2, #0
	adds r7, #0x37
	lsls r0, r0, #5
	ldrb r1, [r7]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08011448  @ gBg0Tm
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x39
	ldrb r1, [r6]
	adds r4, r2, #0
	adds r4, #0x3a
	ldrb r2, [r4]
	movs r3, #0
	bl TmFillRect_thm
	ldrb r0, [r5]
	lsls r0, r0, #5
	ldrb r7, [r7]
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, .L0801144C  @ gBg1Tm
	adds r0, r0, r1
	ldrb r1, [r6]
	ldrb r2, [r4]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08011448: .4byte gBg0Tm
.L0801144C: .4byte gBg1Tm

	THUMB_FUNC_END LongPopup_Clear

	THUMB_FUNC_START SetPopupUnit
SetPopupUnit: @ 0x08011450
	ldr r1, .L08011458  @ gpPopupUnit
	str r0, [r1]
	bx lr
	.align 2, 0
.L08011458: .4byte gpPopupUnit

	THUMB_FUNC_END SetPopupUnit

	THUMB_FUNC_START SetPopupItem
SetPopupItem: @ 0x0801145C
	ldr r1, .L08011464  @ gPopupItem
	strh r0, [r1]
	bx lr
	.align 2, 0
.L08011464: .4byte gPopupItem

	THUMB_FUNC_END SetPopupItem

	THUMB_FUNC_START SetPopupNumber
SetPopupNumber: @ 0x08011468
	ldr r1, .L08011470  @ gPopupNumber
	str r0, [r1]
	bx lr
	.align 2, 0
.L08011470: .4byte gPopupNumber

	THUMB_FUNC_END SetPopupNumber

	THUMB_FUNC_START Popup_Create
Popup_Create: @ 0x08011474
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #0x90
	lsls r5, r5, #2
	movs r4, #4
	str r4, [sp]
	str r3, [sp, #4]
	adds r3, r5, #0
	bl Popup_CreateExt
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Popup_Create

	THUMB_FUNC_START Popup_CreateExt
Popup_CreateExt: @ 0x08011490
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq .L080114AC
	ldr r0, .L080114A8  @ gUnknown_085921C8
	bl SpawnProcLocking
	b .L080114B4
	.align 2, 0
.L080114A8: .4byte gUnknown_085921C8
.L080114AC:
	ldr r0, .L080114D8  @ gUnknown_085921C8
	movs r1, #3
	bl SpawnProc
.L080114B4:
	adds r1, r0, #0
	str r4, [r1, #0x30]
	str r5, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x36
	strb r6, [r0]
	adds r0, #0xa
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	adds r2, r1, #0
	adds r2, #0x42
	strb r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080114D8: .4byte gUnknown_085921C8

	THUMB_FUNC_END Popup_CreateExt

	THUMB_FUNC_START NewGotItemPopup
NewGotItemPopup: @ 0x080114DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetPopupItem
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L0801150C
	ldr r0, .L08011508  @ gUnknown_08592230
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl Popup_Create
	b .L08011518
	.align 2, 0
.L08011508: .4byte gUnknown_08592230
.L0801150C:
	ldr r0, .L08011520  @ gUnknown_08592288
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl Popup_Create
.L08011518:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08011520: .4byte gUnknown_08592288

	THUMB_FUNC_END NewGotItemPopup

	THUMB_FUNC_START ItemGot_DisplayLePopup
ItemGot_DisplayLePopup: @ 0x08011524
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x58]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl NewGotItemPopup
	pop {r0}
	bx r0

	THUMB_FUNC_END ItemGot_DisplayLePopup

	THUMB_FUNC_START ItemGot_GotLeItem
ItemGot_GotLeItem: @ 0x08011538
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x58]
	bl CreateItem
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl HandleNewItemGetFromDrop
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END ItemGot_GotLeItem

	THUMB_FUNC_START NewItemGot
NewItemGot: @ 0x08011554
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	cmp r3, #7
	bhi .L08011570
	ldr r0, .L0801156C  @ gUnknown_085922D0
	adds r1, r3, #0
	bl SpawnProc
	b .L08011578
	.align 2, 0
.L0801156C: .4byte gUnknown_085922D0
.L08011570:
	ldr r0, .L08011598  @ gUnknown_085922D0
	adds r1, r3, #0
	bl SpawnProcLocking
.L08011578:
	str r5, [r0, #0x58]
	str r4, [r0, #0x54]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne .L08011592
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
.L08011592:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08011598: .4byte gUnknown_085922D0

	THUMB_FUNC_END NewItemGot

	THUMB_FUNC_START NewGeneralItemGot
NewGeneralItemGot: @ 0x0801159C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r0, #0xff
	ands r0, r2
	cmp r0, #0x9a
	blt .L080115CC
	cmp r0, #0xa0
	ble .L080115BA
	cmp r0, #0xb9
	bgt .L080115CC
	cmp r0, #0xb8
	blt .L080115CC
.L080115BA:
	adds r0, r2, #0
	bl GetItemCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl NewGoldGotPopup
	b .L080115D4
.L080115CC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl NewItemGot
.L080115D4:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewGeneralItemGot

	THUMB_FUNC_START func_080115DC
func_080115DC: @ 0x080115DC
	push {r4, lr}
	adds r4, r1, #0
	bl SetPopupNumber
	ldr r0, .L08011604  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L0801160C
	ldr r0, .L08011608  @ gUnknown_08592300
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl Popup_Create
	b .L08011618
	.align 2, 0
.L08011604: .4byte gActiveUnit
.L08011608: .4byte gUnknown_08592300
.L0801160C:
	ldr r0, .L08011620  @ gUnknown_08592348
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl Popup_Create
.L08011618:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08011620: .4byte gUnknown_08592348

	THUMB_FUNC_END func_080115DC

	THUMB_FUNC_START func_08011624
func_08011624: @ 0x08011624
	push {r4, lr}
	adds r4, r1, #0
	bl SetPopupNumber
	ldr r0, .L08011640  @ gUnknown_08592300
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl Popup_Create
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08011640: .4byte gUnknown_08592300

	THUMB_FUNC_END func_08011624

	THUMB_FUNC_START NewGoldGotPopup
NewGoldGotPopup: @ 0x08011644
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	bl SetPopupNumber
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L0801167C
	bl GetGold
	adds r5, r5, r0
	adds r0, r5, #0
	bl SetGold
	ldr r0, .L08011678  @ gUnknown_08592300
	movs r1, #0x60
	movs r2, #0
	adds r3, r6, #0
	bl Popup_Create
	b .L08011688
	.align 2, 0
.L08011678: .4byte gUnknown_08592300
.L0801167C:
	ldr r0, .L08011690  @ gUnknown_08592348
	movs r1, #0x60
	movs r2, #0
	adds r3, r6, #0
	bl Popup_Create
.L08011688:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08011690: .4byte gUnknown_08592348

	THUMB_FUNC_END NewGoldGotPopup

	THUMB_FUNC_START CreateItemStealingPopup
CreateItemStealingPopup: @ 0x08011694
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetPopupItem
	ldr r0, .L080116C0  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L080116C8
	ldr r0, .L080116C4  @ gUnknown_08592380
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl Popup_Create
	b .L080116D4
	.align 2, 0
.L080116C0: .4byte gActiveUnit
.L080116C4: .4byte gUnknown_08592380
.L080116C8:
	ldr r0, .L080116DC  @ gUnknown_085923D8
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl Popup_Create
.L080116D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080116DC: .4byte gUnknown_085923D8

	THUMB_FUNC_END CreateItemStealingPopup

	THUMB_FUNC_START NewPopup_WeaponBroke
NewPopup_WeaponBroke: @ 0x080116E0
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetPopupItem
	ldr r0, .L08011700  @ gUnknown_08592420
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl Popup_Create
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08011700: .4byte gUnknown_08592420

	THUMB_FUNC_END NewPopup_WeaponBroke

	THUMB_FUNC_START NewPopup_WRankIncrease
NewPopup_WRankIncrease: @ 0x08011704
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetPopupItem
	ldr r0, .L08011724  @ gUnknown_08592468
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl Popup_Create
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08011724: .4byte gUnknown_08592468

	THUMB_FUNC_END NewPopup_WRankIncrease

	THUMB_FUNC_START CreateNewUnitPopup
CreateNewUnitPopup: @ 0x08011728
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitByPid
	bl SetPopupUnit
	ldr r0, .L0801174C  @ gUnknown_08592490
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl Popup_Create
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801174C: .4byte gUnknown_08592490

	THUMB_FUNC_END CreateNewUnitPopup

	THUMB_FUNC_START func_08011750
func_08011750: @ 0x08011750
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r2, #0
	ldr r0, .L08011780  @ gUnknown_030005D0
	movs r4, #0
	movs r2, #0xc
	strb r2, [r0]
	str r1, [r0, #4]
	movs r1, #8
	strb r1, [r0, #8]
	str r4, [r0, #0xc]
	movs r1, #6
	strb r1, [r0, #0x10]
	str r5, [r0, #0x14]
	strb r4, [r0, #0x18]
	str r4, [r0, #0x1c]
	movs r1, #0x60
	movs r2, #0
	bl Popup_Create
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08011780: .4byte gUnknown_030005D0

	THUMB_FUNC_END func_08011750

	.align 2, 0 @ Don't pad with nop.
