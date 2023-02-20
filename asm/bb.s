	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ BB is the proc that does the scrolling help text at the bottom of the screen when doing certain actions
	@ It also contains a weird part that seems to just kill every enemy in a somewhat convoluted way???

	THUMB_FUNC_START func_0803547C
func_0803547C: @ 0x0803547C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	movs r5, #0
.L08035486:
	lsls r4, r5, #5
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #0x20
	adds r4, r4, r0
	adds r0, r6, #0
	adds r0, #0x5c
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r5
	adds r1, r6, #0
	adds r1, #0x5e
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl __modsi3
	ldr r1, .L080354D4  @ gUnknown_0859E14C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, .L080354D8  @ 0x00004240
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r7, #0
	ldr r3, .L080354DC  @ Sprite_32x16
	bl PutSprite
	adds r5, #1
	cmp r5, #8
	ble .L08035486
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080354D4: .4byte gUnknown_0859E14C
.L080354D8: .4byte 0x00004240
.L080354DC: .4byte Sprite_32x16

	THUMB_FUNC_END func_0803547C

	THUMB_FUNC_START func_080354E0
func_080354E0: @ 0x080354E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x2c]
	adds r0, #0x30
	ldr r1, .L080355A4  @ 0x06014800
	movs r2, #0x14
	bl InitSpriteTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, .L080355A8  @ Pal_TalkText
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #1
.L0803550E:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge .L0803550E
	cmp r5, #0
	beq .L08035592
	ldrb r0, [r5]
	movs r1, #0x5e
	adds r1, r1, r7
	mov r8, r1
	adds r6, r7, #0
	adds r6, #0x5c
	cmp r0, #1
	bls .L08035580
	adds r4, r7, #0
	adds r4, #0x48
.L08035544:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawCharacter
	adds r5, r0, #0
	adds r0, r4, #0
	bl Text_GetCursor
	cmp r0, #0xe0
	ble .L0803557A
	subs r5, #2
	adds r4, #8
	adds r0, r5, #0
	mov r1, sp
	bl GetCharTextLen
	adds r0, r7, #0
	adds r0, #0x48
	bl Text_GetCursor
	adds r1, r0, #0
	ldr r0, [sp]
	subs r1, r1, r0
	subs r1, #0xc0
	adds r0, r4, #0
	bl Text_SetCursor
.L0803557A:
	ldrb r0, [r5]
	cmp r0, #1
	bhi .L08035544
.L08035580:
	ldr r0, [r7, #0x2c]
	bl GetStringTextLen
	adds r0, #0x10
	asrs r0, r0, #5
	adds r1, r0, #1
	mov r2, r8
	strh r1, [r2]
	strh r0, [r6]
.L08035592:
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080355A4: .4byte 0x06014800
.L080355A8: .4byte Pal_TalkText

	THUMB_FUNC_END func_080354E0

	THUMB_FUNC_START func_080355AC
func_080355AC: @ 0x080355AC
	push {lr}
	ldr r0, .L080355D4  @ 0x04000006
	ldrh r0, [r0]
	adds r2, r0, #0
	subs r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bls .L080355E0
	ldr r2, .L080355D8  @ 0x04000050
	ldr r1, .L080355DC  @ gDispIo+0x3C
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strb r0, [r2]
	b .L08035602
	.align 2, 0
.L080355D4: .4byte 0x04000006
.L080355D8: .4byte 0x04000050
.L080355DC: .4byte gDispIo+0x3C
.L080355E0:
	ldr r1, .L08035608  @ gUnknown_0859E166
	adds r0, r2, #0
	subs r0, #0x80
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, .L0803560C  @ gBmSt
	adds r0, #0x38
	ldrb r0, [r0]
	subs r2, r2, r0
	cmp r2, #0
	bge .L080355F8
	movs r2, #0
.L080355F8:
	ldr r0, .L08035610  @ 0x04000050
	movs r1, #0xec
	strh r1, [r0]
	adds r0, #4
	strb r2, [r0]
.L08035602:
	pop {r0}
	bx r0
	.align 2, 0
.L08035608: .4byte gUnknown_0859E166
.L0803560C: .4byte gBmSt
.L08035610: .4byte 0x04000050

	THUMB_FUNC_END func_080355AC

	THUMB_FUNC_START func_08035614
func_08035614: @ 0x08035614
	push {lr}
	ldr r0, .L08035628  @ gBmSt
	adds r0, #0x38
	movs r1, #8
	strb r1, [r0]
	ldr r0, .L0803562C  @ func_080355AC
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
.L08035628: .4byte gBmSt
.L0803562C: .4byte func_080355AC

	THUMB_FUNC_END func_08035614

	THUMB_FUNC_START func_08035630
func_08035630: @ 0x08035630
	push {lr}
	ldr r0, .L08035648  @ gBmSt
	adds r1, r0, #0
	adds r1, #0x38
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08035642
	subs r0, #1
	strb r0, [r1]
.L08035642:
	pop {r0}
	bx r0
	.align 2, 0
.L08035648: .4byte gBmSt

	THUMB_FUNC_END func_08035630

	THUMB_FUNC_START func_0803564C
func_0803564C: @ 0x0803564C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08035674  @ gBmSt
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne .L0803566E
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
.L0803566E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08035674: .4byte gBmSt

	THUMB_FUNC_END func_0803564C

	THUMB_FUNC_START func_08035678
func_08035678: @ 0x08035678
	push {lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0x1f
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, .L08035694  @ gUnknown_0859E188
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08035694: .4byte gUnknown_0859E188

	THUMB_FUNC_END func_08035678

	THUMB_FUNC_START func_08035698
func_08035698: @ 0x08035698
	push {lr}
	ldr r0, .L080356B4  @ gBmSt
	ldrh r1, [r0, #0x2a]
	subs r1, #0x10
	strh r1, [r0, #0x2a]
	movs r0, #0
	bl func_08015EDC
	ldr r0, .L080356B8  @ gUnknown_0859E188
	bl BreakEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L080356B4: .4byte gBmSt
.L080356B8: .4byte gUnknown_0859E188

	THUMB_FUNC_END func_08035698

	THUMB_FUNC_START func_080356BC
func_080356BC: @ 0x080356BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L08035704  @ gUnknown_0859E1B0
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r5, #0
	bl func_0803547C
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq .L080356E2
	subs r0, r1, #1
	strh r0, [r4]
.L080356E2:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L080356FE
	movs r0, #0x1f
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
.L080356FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08035704: .4byte gUnknown_0859E1B0

	THUMB_FUNC_END func_080356BC

	THUMB_FUNC_START StartBottomHelpText
StartBottomHelpText: @ 0x08035708
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, .L0803573C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #1
	beq .L08035734
	ldr r0, .L08035740  @ gUnknown_0859E1B8
	adds r1, r2, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
	bl func_080354E0
	bl func_0801A278
	ldr r1, .L08035744  @ gBmSt
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
.L08035734:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803573C: .4byte gPlaySt
.L08035740: .4byte gUnknown_0859E1B8
.L08035744: .4byte gBmSt

	THUMB_FUNC_END StartBottomHelpText

	THUMB_FUNC_START EndBottomHelpText
EndBottomHelpText: @ 0x08035748
	push {lr}
	ldr r0, .L08035754  @ gUnknown_0859E1B8
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08035754: .4byte gUnknown_0859E1B8

	THUMB_FUNC_END EndBottomHelpText

	THUMB_FUNC_START IsBottomHelpTextActive
IsBottomHelpTextActive: @ 0x08035758
	push {lr}
	ldr r0, .L0803576C  @ gUnknown_0859E1B8
	bl FindProc
	cmp r0, #0
	beq .L08035766
	movs r0, #1
.L08035766:
	pop {r1}
	bx r1
	.align 2, 0
.L0803576C: .4byte gUnknown_0859E1B8

	THUMB_FUNC_END IsBottomHelpTextActive

	THUMB_FUNC_START func_08035770
func_08035770: @ 0x08035770
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, .L080357A4  @ gUnknown_0859E1B8
	adds r0, r5, #0
	bl FindProc
	adds r4, r0, #0
	cmp r4, #0
	bne .L0803578E
	adds r0, r5, #0
	adds r1, r6, #0
	bl SpawnProc
	adds r4, r0, #0
.L0803578E:
	str r7, [r4, #0x2c]
	adds r0, r4, #0
	bl func_080354E0
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0x1f
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080357A4: .4byte gUnknown_0859E1B8

	THUMB_FUNC_END func_08035770

	THUMB_FUNC_START func_080357A8
func_080357A8: @ 0x080357A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	blt .L080357BC
	adds r0, r4, #0
	bl SetUnitStatus
.L080357BC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl AddUnitHp
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt .L080357D4
	adds r0, r4, #0
	bl KillUnit
.L080357D4:
	adds r0, r6, #0
	adds r1, r4, #0
	bl DropRescuedUnitIfDead
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080357A8

	THUMB_FUNC_START func_080357E4
func_080357E4: @ 0x080357E4
	push {lr}
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L080357FA
	ldr r0, .L08035800  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L080357FA
	bl RenderMapForFade
.L080357FA:
	pop {r0}
	bx r0
	.align 2, 0
.L08035800: .4byte gPlaySt

	THUMB_FUNC_END func_080357E4

	THUMB_FUNC_START func_08035804
func_08035804: @ 0x08035804
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r1, #1
	negs r1, r1
	bl BattleInitItemEffect
	ldr r5, .L08035844  @ gBattleUnitA
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0x6c
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	ldr r0, .L08035848  @ gBattleHitIterator
	ldr r2, [r0]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r1, [r5, #0x13]
	subs r0, r0, r1
	strb r0, [r2, #3]
	bl BattleHitTerminate
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08035844: .4byte gBattleUnitA
.L08035848: .4byte gBattleHitIterator

	THUMB_FUNC_END func_08035804

	THUMB_FUNC_START func_0803584C
func_0803584C: @ 0x0803584C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	negs r1, r1
	bl BattleInitItemEffect
	ldr r5, .L080358B8  @ gBattleUnitA
	negs r4, r4
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge .L08035872
	movs r0, #0
	strb r0, [r5, #0x13]
.L08035872:
	ldr r3, .L080358BC  @ gBattleHitIterator
	ldr r2, [r3]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r1, [r5, #0x13]
	subs r0, r0, r1
	strb r0, [r2, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L080358A2
	ldr r3, [r3]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
.L080358A2:
	bl BattleHitTerminate
	bl func_0807B5DC
	adds r0, r6, #0
	bl func_080357E4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080358B8: .4byte gBattleUnitA
.L080358BC: .4byte gBattleHitIterator

	THUMB_FUNC_END func_0803584C

	THUMB_FUNC_START func_080358C0
func_080358C0: @ 0x080358C0
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r1, #1
	negs r1, r1
	bl BattleInitItemEffect
	ldr r5, .L08035924  @ gBattleUnitA
	negs r4, r4
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge .L080358E4
	movs r0, #0
	strb r0, [r5, #0x13]
.L080358E4:
	ldr r3, .L08035928  @ gBattleHitIterator
	ldr r2, [r3]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r1, [r5, #0x13]
	subs r0, r0, r1
	strb r0, [r2, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L08035914
	ldr r3, [r3]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
.L08035914:
	bl BattleHitTerminate
	bl func_0807B634
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08035924: .4byte gBattleUnitA
.L08035928: .4byte gBattleHitIterator

	THUMB_FUNC_END func_080358C0

	THUMB_FUNC_START ExecSelfDamage
ExecSelfDamage: @ 0x0803592C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	negs r1, r1
	bl BattleInitItemEffect
	ldr r5, .L080359A8  @ gBattleUnitA
	negs r4, r4
	adds r0, r5, #0
	adds r1, r4, #0
	bl AddUnitHp
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge .L08035952
	movs r0, #0
	strb r0, [r5, #0x13]
.L08035952:
	ldr r3, .L080359AC  @ gBattleHitIterator
	ldr r2, [r3]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r1, [r5, #0x13]
	subs r0, r0, r1
	strb r0, [r2, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L08035992
	ldr r3, [r3]
	ldr r2, [r3]
	lsls r0, r2, #0xd
	lsrs r0, r0, #0xd
	movs r1, #1
	orrs r0, r1
	ldr r1, .L080359B0  @ 0xFFF80000
	ands r1, r2
	orrs r1, r0
	str r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
.L08035992:
	bl BattleHitTerminate
	bl StartSomeMapAnim_807B68C
	adds r0, r6, #0
	bl func_080357E4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080359A8: .4byte gBattleUnitA
.L080359AC: .4byte gBattleHitIterator
.L080359B0: .4byte 0xFFF80000

	THUMB_FUNC_END ExecSelfDamage

	THUMB_FUNC_START func_080359B4
func_080359B4: @ 0x080359B4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	movs r4, #0x81
.L080359C2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L080359F2
	ldr r0, [r2]
	cmp r0, #0
	beq .L080359F2
	ldr r0, [r2, #0xc]
	ldr r1, .L08035A08  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L080359F2
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0xb]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #0
	bl AddTarget
.L080359F2:
	adds r4, #1
	cmp r4, #0xbf
	ble .L080359C2
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08035A08: .4byte 0x0001000C

	THUMB_FUNC_END func_080359B4

	THUMB_FUNC_START func_08035A0C
func_08035A0C: @ 0x08035A0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r4, [r6, r0]
	bl GetTargetListSize
	cmp r4, r0
	bne .L08035A2A
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b .L08035A9E
.L08035A2A:
	movs r1, #0
	ldrsh r0, [r6, r1]
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl KillUnit
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	ldr r1, .L08035A84  @ gBmSt
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r2, #0xf0
	bhi .L08035A6E
	cmp r0, #0
	blt .L08035A6E
	cmp r0, #0xa0
	ble .L08035A88
.L08035A6E:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b .L08035A9E
	.align 2, 0
.L08035A84: .4byte gBmSt
.L08035A88:
	adds r0, r4, #0
	bl MU_Create
	bl MU_StartDeathFade
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	adds r0, r5, #0
	bl Proc_Break
.L08035A9E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035A0C

.align 2, 0
