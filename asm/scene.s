	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED
	THUMB_FUNC_START func_08006738
func_08006738: @ 0x08006738
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r3, .L08006770  @ gUnknown_080D77FC
	lsls r2, r2, #0x18
	cmp r2, #0
	bne .L08006792
	movs r2, #0
	ldr r1, .L08006774  @ 0x0000FFFF
	mov r8, r1
	movs r1, #0
	mov ip, r1
.L08006756:
	adds r6, r3, #0
	adds r6, #0x18
	adds r5, r0, #0
	adds r5, #0x40
	adds r4, r2, #1
	adds r2, r0, #0
	movs r1, #0xb
.L08006764:
	ldrh r0, [r3]
	cmp r0, r8
	bne .L08006778
	mov r0, ip
	b .L0800677A
	.align 2, 0
.L08006770: .4byte gUnknown_080D77FC
.L08006774: .4byte 0x0000FFFF
.L08006778:
	adds r0, r7, r0
.L0800677A:
	strh r0, [r2]
	adds r2, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bge .L08006764
	adds r3, r6, #0
	adds r0, r5, #0
	adds r2, r4, #0
	cmp r2, #9
	ble .L08006756
	b .L080067DA
.L08006792:
	movs r2, #0
	ldr r1, .L080067BC  @ 0x0000FFFF
	mov r9, r1
	movs r1, #0
	mov ip, r1
	movs r1, #0x80
	lsls r1, r1, #3
	mov r8, r1
.L080067A2:
	adds r6, r3, #0
	adds r6, #0x18
	adds r5, r0, #0
	adds r5, #0x40
	adds r4, r2, #1
	adds r2, r0, #0
	adds r3, #0x16
	movs r1, #0xb
.L080067B2:
	ldrh r0, [r3]
	cmp r0, r9
	bne .L080067C0
	mov r0, ip
	b .L080067C4
	.align 2, 0
.L080067BC: .4byte 0x0000FFFF
.L080067C0:
	adds r0, r7, r0
	add r0, r8
.L080067C4:
	strh r0, [r2]
	adds r2, #2
	subs r3, #2
	subs r1, #1
	cmp r1, #0
	bge .L080067B2
	adds r3, r6, #0
	adds r0, r5, #0
	adds r2, r4, #0
	cmp r2, #9
	ble .L080067A2
.L080067DA:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08006738

	THUMB_FUNC_START ClearTalkFaceRefs
ClearTalkFaceRefs: @ 0x080067E8
	push {r4, lr}
	movs r2, #0
	ldr r4, .L08006808  @ gUnknown_0859133C
	movs r3, #0
.L080067F0:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble .L080067F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08006808: .4byte gUnknown_0859133C

	THUMB_FUNC_END ClearTalkFaceRefs

	THUMB_FUNC_START InitTalk
InitTalk: @ 0x0800680C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, .L08006890  @ gTalkFont
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L08006894  @ 0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl InitTextFont
	bl SetInitTalkTextFont
	ldr r0, .L08006898  @ gUnknown_0859133C
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble .L08006862
	ldr r4, .L0800689C  @ gTalkText
	adds r5, r6, #0
.L0800684A:
	adds r0, r4, #0
	movs r1, #0x1e
	bl InitText
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColor
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne .L0800684A
.L08006862:
	cmp r7, #0
	beq .L08006884
	ldr r4, .L080068A0  @ gUnknown_089E8238
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L080068A4  @ 0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L080068A8  @ gUnknown_089E84D4
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
.L08006884:
	bl ClearTalkFaceRefs
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08006890: .4byte gTalkFont
.L08006894: .4byte 0x000003FF
.L08006898: .4byte gUnknown_0859133C
.L0800689C: .4byte gTalkText
.L080068A0: .4byte gUnknown_089E8238
.L080068A4: .4byte 0x06000200
.L080068A8: .4byte gUnknown_089E84D4

	THUMB_FUNC_END InitTalk

	THUMB_FUNC_START InitSpriteTalk
InitSpriteTalk: @ 0x080068AC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, .L0800693C  @ gTalkFont
	ldr r1, .L08006940  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, .L08006944  @ 0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl InitSpriteTextFont
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, .L08006948  @ Pal_TalkText
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, .L0800694C  @ gPal
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, .L08006950  @ 0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, .L08006954  @ 0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, .L08006958  @ 0x00007FFF
	strh r0, [r4]
	ldr r0, .L0800695C  @ gUnknown_0859133C
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge .L08006934
.L0800690C:
	lsls r4, r5, #3
	ldr r0, .L08006960  @ gTalkText
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl DrawSpriteTextBackgroundColor0
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r5, #1
	cmp r5, r6
	blt .L0800690C
.L08006934:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0800693C: .4byte gTalkFont
.L08006940: .4byte 0x000003FF
.L08006944: .4byte 0x06010000
.L08006948: .4byte Pal_TalkText
.L0800694C: .4byte gPal
.L08006950: .4byte 0x00007247
.L08006954: .4byte 0x000031AE
.L08006958: .4byte 0x00007FFF
.L0800695C: .4byte gUnknown_0859133C
.L08006960: .4byte gTalkText

	THUMB_FUNC_END InitSpriteTalk

	THUMB_FUNC_START func_08006964
func_08006964: @ 0x08006964
	push {lr}
	ldr r0, .L08006974  @ Pal_SystemText
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L08006974: .4byte Pal_SystemText

	THUMB_FUNC_END func_08006964

	THUMB_FUNC_START SetInitTalkTextFont
SetInitTalkTextFont: @ 0x08006978
	push {lr}
	ldr r0, .L08006988  @ gTalkFont
	bl SetTextFont
	bl InitTalkTextFont
	pop {r0}
	bx r0
	.align 2, 0
.L08006988: .4byte gTalkFont

	THUMB_FUNC_END SetInitTalkTextFont

	THUMB_FUNC_START StartTalkExt
StartTalkExt: @ 0x0800698C
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r4, .L08006A14  @ gUnknown_0859133C
	ldr r3, [r4]
	movs r5, #0
	strb r0, [r3, #0xc]
	ldr r0, [r4]
	strb r1, [r0, #0xd]
	ldr r0, [r4]
	str r2, [r0]
	str r5, [r0, #4]
	movs r6, #1
	strb r6, [r0, #8]
	ldr r0, [r4]
	strb r5, [r0, #9]
	ldr r0, [r4]
	adds r0, #0x82
	strb r5, [r0]
	ldr r0, [r4]
	strb r5, [r0, #0xb]
	bl GetTextPrintDelay
	ldr r1, [r4]
	strb r0, [r1, #0x13]
	ldr r0, [r4]
	strb r5, [r0, #0x14]
	movs r0, #0xff
	bl SetActiveTalkFace
	ldr r1, [r4]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, [r4]
	strb r5, [r0, #0x15]
	ldr r0, [r4]
	strb r5, [r0, #0x12]
	ldr r0, [r4]
	strb r6, [r0, #0x16]
	ldr r0, [r4]
	strb r5, [r0, #0x17]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x80
	movs r2, #0
	strh r5, [r1]
	str r5, [r0, #0x38]
	adds r0, #0x83
	strb r2, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, #0
	bl GetStrTalkLen
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	cmp r7, #0
	bne .L08006A1C
	ldr r0, .L08006A18  @ gUnknown_08591358
	movs r1, #3
	bl SpawnProc
	b .L08006A24
	.align 2, 0
.L08006A14: .4byte gUnknown_0859133C
.L08006A18: .4byte gUnknown_08591358
.L08006A1C:
	ldr r0, .L08006A2C  @ gUnknown_08591358
	adds r1, r7, #0
	bl SpawnProcLocking
.L08006A24:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08006A2C: .4byte gUnknown_08591358

	THUMB_FUNC_END StartTalkExt

	THUMB_FUNC_START StartTalkMsg
StartTalkMsg: @ 0x08006A30
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartTalkExt
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END StartTalkMsg

	THUMB_FUNC_START StartTalkMsgExt
StartTalkMsgExt: @ 0x08006A50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r6, r3, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl StartTalkExt
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END StartTalkMsgExt

	THUMB_FUNC_START StartTalk
StartTalk: @ 0x08006A70
	push {lr}
	movs r3, #0
	bl StartTalkExt
	pop {r1}
	bx r1

	THUMB_FUNC_END StartTalk

	THUMB_FUNC_START EndTalk
EndTalk: @ 0x08006A7C
	push {lr}
	ldr r0, .L08006A88  @ gUnknown_08591358
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08006A88: .4byte gUnknown_08591358

	THUMB_FUNC_END EndTalk

	THUMB_FUNC_START SetTalkLines
SetTalkLines: @ 0x08006A8C
	ldr r1, .L08006A94  @ gUnknown_0859133C
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
.L08006A94: .4byte gUnknown_0859133C

	THUMB_FUNC_END SetTalkLines

	THUMB_FUNC_START ClearTalkFlags
ClearTalkFlags: @ 0x08006A98
	ldr r0, .L08006AA4  @ gUnknown_0859133C
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
.L08006AA4: .4byte gUnknown_0859133C

	THUMB_FUNC_END ClearTalkFlags

	THUMB_FUNC_START SetTalkFlag
SetTalkFlag: @ 0x08006AA8
	ldr r1, .L08006AB8  @ gUnknown_0859133C
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
.L08006AB8: .4byte gUnknown_0859133C

	THUMB_FUNC_END SetTalkFlag

	THUMB_FUNC_START func_08006ABC
func_08006ABC: @ 0x08006ABC
	ldr r1, .L08006AC4  @ gUnknown_0859133C
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
.L08006AC4: .4byte gUnknown_0859133C

	THUMB_FUNC_END func_08006ABC

	THUMB_FUNC_START UnsetDialogueFlag
UnsetDialogueFlag: @ 0x08006AC8
	ldr r1, .L08006AD8  @ gUnknown_0859133C
	ldr r2, [r1]
	adds r2, #0x80
	ldrh r1, [r2]
	bics r1, r0
	strh r1, [r2]
	bx lr
	.align 2, 0
.L08006AD8: .4byte gUnknown_0859133C

	THUMB_FUNC_END UnsetDialogueFlag

	THUMB_FUNC_START CheckDialogueFlag
CheckDialogueFlag: @ 0x08006ADC
	adds r1, r0, #0
	ldr r0, .L08006AEC  @ gUnknown_0859133C
	ldr r0, [r0]
	adds r0, #0x80
	ldrh r0, [r0]
	ands r0, r1
	bx lr
	.align 2, 0
.L08006AEC: .4byte gUnknown_0859133C

	THUMB_FUNC_END CheckDialogueFlag

	THUMB_FUNC_START Dialogue_SetCharacterDisplayDelay
Dialogue_SetCharacterDisplayDelay: @ 0x08006AF0
	push {lr}
	ldr r2, .L08006B0C  @ gUnknown_0859133C
	ldr r1, [r2]
	strb r0, [r1, #0x13]
	ldr r2, [r2]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge .L08006B06
	movs r0, #0
	strb r0, [r2, #0x13]
.L08006B06:
	pop {r0}
	bx r0
	.align 2, 0
.L08006B0C: .4byte gUnknown_0859133C

	THUMB_FUNC_END Dialogue_SetCharacterDisplayDelay

	THUMB_FUNC_START Dialogue_SetDefaultTextColor
Dialogue_SetDefaultTextColor: @ 0x08006B10
	push {r4, r5, r6, lr}
	ldr r2, .L08006B44  @ gUnknown_0859133C
	ldr r1, [r2]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge .L08006B3C
	adds r6, r2, #0
	ldr r5, .L08006B48  @ gTalkText
.L08006B26:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl Text_SetColor
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt .L08006B26
.L08006B3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08006B44: .4byte gUnknown_0859133C
.L08006B48: .4byte gTalkText

	THUMB_FUNC_END Dialogue_SetDefaultTextColor

	THUMB_FUNC_START DialogueSkipInputListener_OnLoop
DialogueSkipInputListener_OnLoop: @ 0x08006B4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08006BAC  @ gUnknown_08591470
	bl FindProc
	cmp r0, #0
	bne .L08006BEE
	ldr r0, .L08006BB0  @ gUnknown_085914C8
	bl FindProc
	cmp r0, #0
	bne .L08006BEE
	movs r0, #4
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08006BC4
	ldr r0, .L08006BB4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq .L08006BC4
	bl func_0800D3E4
	ldr r0, .L08006BB8  @ gUnknown_0859133C
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl func_080089C4
	adds r0, r4, #0
	bl Proc_End
	bl EndTalk
	ldr r0, .L08006BBC  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08006BC0  @ gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	b .L08006BEE
	.align 2, 0
.L08006BAC: .4byte gUnknown_08591470
.L08006BB0: .4byte gUnknown_085914C8
.L08006BB4: .4byte gKeySt
.L08006BB8: .4byte gUnknown_0859133C
.L08006BBC: .4byte gBg0Tm
.L08006BC0: .4byte gBg1Tm
.L08006BC4:
	ldr r0, .L08006BF4  @ gUnknown_085913F0
	bl FindProc
	cmp r0, #0
	bne .L08006BEE
	movs r0, #8
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08006BEE
	ldr r0, .L08006BF8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq .L08006BEE
	ldr r0, .L08006BFC  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x12]
.L08006BEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08006BF4: .4byte gUnknown_085913F0
.L08006BF8: .4byte gKeySt
.L08006BFC: .4byte gUnknown_0859133C

	THUMB_FUNC_END DialogueSkipInputListener_OnLoop

	THUMB_FUNC_START DialogueMain_OnInit
DialogueMain_OnInit: @ 0x08006C00
	push {lr}
	movs r0, #0x20
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08006C24
	bl LoadObjUiGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08006C24:
	ldr r0, .L08006C30  @ gUnknown_08591340
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08006C30: .4byte gUnknown_08591340

	THUMB_FUNC_END DialogueMain_OnInit

	THUMB_FUNC_START DialogueMain_OnLoop
DialogueMain_OnLoop: @ 0x08006C34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl func_08007A3C
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	beq .L08006C4A
	b .L08006D94
.L08006C4A:
	ldr r2, .L08006C94  @ gUnknown_0859133C
	ldr r1, [r2]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L08006C6E
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge .L08006C6E
	b .L08006D94
.L08006C6E:
	ldr r0, [r2]
	strb r3, [r0, #0x14]
.L08006C72:
	ldr r7, .L08006C94  @ gUnknown_0859133C
	ldr r0, .L08006C98  @ gUnknown_0202BD31
	mov r8, r0
.L08006C78:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl func_080089C4
	adds r0, r6, #0
	bl DialogueInterpret
	cmp r0, #1
	beq .L08006CD0
	cmp r0, #1
	bgt .L08006C9C
	cmp r0, #0
	beq .L08006CA6
	b .L08006CD0
	.align 2, 0
.L08006C94: .4byte gUnknown_0859133C
.L08006C98: .4byte gUnknown_0202BD31
.L08006C9C:
	cmp r0, #2
	beq .L08006CAE
	cmp r0, #3
	beq .L08006CC2
	b .L08006CD0
.L08006CA6:
	adds r0, r6, #0
	bl Proc_Break
	b .L08006D94
.L08006CAE:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L08006C72
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble .L08006D7E
	b .L08006D94
.L08006CC2:
	ldr r0, [r7]
	ldrb r1, [r0, #0x13]
	movs r2, #0
	strb r1, [r0, #0x14]
	ldr r0, [r7]
	strb r2, [r0, #0x12]
	b .L08006D94
.L08006CD0:
	movs r0, #0x20
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08006CE2
	adds r0, r6, #0
	bl DialogueMain_UpdateDisplay
	b .L08006CE8
.L08006CE2:
	adds r0, r6, #0
	bl func_08006E8C
.L08006CE8:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L08006D94
	ldr r5, .L08006D38  @ gUnknown_0859133C
	ldr r4, [r5]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xb]
	adds r0, r0, r1
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L08006D3C  @ gTalkText
	adds r0, r0, r1
	ldr r1, [r4]
	bl Text_DrawCharacter
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x40
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08006D7E
	movs r0, #0x80
	bl CheckDialogueFlag
	cmp r0, #0
	beq .L08006D40
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08006D7E
	movs r0, #0x7a
	bl m4aSongNumStart
	b .L08006D7E
	.align 2, 0
.L08006D38: .4byte gUnknown_0859133C
.L08006D3C: .4byte gTalkText
.L08006D40:
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne .L08006D54
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq .L08006D7E
.L08006D54:
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08006D68
	adds r0, r1, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08006D7E
.L08006D68:
	adds r1, #0x82
	movs r0, #1
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08006D7E
	movs r0, #0x6e
	bl m4aSongNumStart
.L08006D7E:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08006D8A
	b .L08006C78
.L08006D8A:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt .L08006D94
	b .L08006C78
.L08006D94:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END DialogueMain_OnLoop

	THUMB_FUNC_START DialogueMain_UpdateDisplay
DialogueMain_UpdateDisplay: @ 0x08006DA0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl func_0800890C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08006E0C
	ldr r4, .L08006E08  @ gUnknown_0859133C
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	beq .L08006E0C
	movs r0, #2
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08006E0C
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne .L08006DCC
	ldr r0, [r1]
.L08006DCC:
	movs r1, #0
	bl GetStrTalkLen
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	bl Dialogue_ClearTextBoxes
	ldr r4, .L08006E08  @ gUnknown_0859133C
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r1, r7, #0
	bl func_080088A8
	ldr r0, [r4]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl CheckDialogueFlag
	adds r1, r0, #0
	adds r0, r4, #0
	bl func_0800798C
	movs r0, #1
	b .L08006E7C
	.align 2, 0
.L08006E08: .4byte gUnknown_0859133C
.L08006E0C:
	ldr r6, .L08006E28  @ gUnknown_0859133C
	ldr r5, [r6]
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	bcc .L08006E30
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, .L08006E2C  @ gUnknown_085914C8
	adds r1, r7, #0
	bl SpawnProcLocking
	movs r0, #1
	b .L08006E7C
	.align 2, 0
.L08006E28: .4byte gUnknown_0859133C
.L08006E2C: .4byte gUnknown_085914C8
.L08006E30:
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	bne .L08006E6C
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L08006E84  @ gTalkText
	adds r0, r0, r1
	lsls r4, r4, #1
	ldrb r1, [r5, #0xd]
	adds r4, r4, r1
	lsls r4, r4, #5
	ldrb r5, [r5, #0xc]
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r1, .L08006E88  @ gBg0Tm
	adds r4, r4, r1
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl DialogueEnableBgSyncByMask
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
.L08006E6C:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq .L08006E7A
	ldrb r0, [r1, #0x11]
	bl func_080089B8
.L08006E7A:
	movs r0, #0
.L08006E7C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08006E84: .4byte gTalkText
.L08006E88: .4byte gBg0Tm

	THUMB_FUNC_END DialogueMain_UpdateDisplay

	THUMB_FUNC_START func_08006E8C
func_08006E8C: @ 0x08006E8C
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08006EAC  @ gUnknown_0859133C
	ldr r2, [r0]
	ldrb r0, [r2, #9]
	ldrb r3, [r2, #0xa]
	cmp r0, r3
	bcc .L08006EB4
	movs r0, #0
	strb r0, [r2, #0x12]
	ldr r0, .L08006EB0  @ gUnknown_085914F0
	bl SpawnProcLocking
	movs r0, #1
	b .L08006EC0
	.align 2, 0
.L08006EAC: .4byte gUnknown_0859133C
.L08006EB0: .4byte gUnknown_085914F0
.L08006EB4:
	ldrb r0, [r2, #0x15]
	cmp r0, #0
	bne .L08006EBE
	movs r0, #1
	strb r0, [r2, #0x15]
.L08006EBE:
	movs r0, #0
.L08006EC0:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08006E8C

	THUMB_FUNC_START LockDialogue
LockDialogue: @ 0x08006EC4
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08006ED4  @ gUnknown_08591388
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08006ED4: .4byte gUnknown_08591388

	THUMB_FUNC_END LockDialogue

	THUMB_FUNC_START IsDialogueLocked
IsDialogueLocked: @ 0x08006ED8
	push {lr}
	ldr r0, .L08006EEC  @ gUnknown_08591388
	bl FindProc
	cmp r0, #0
	beq .L08006EE6
	movs r0, #1
.L08006EE6:
	pop {r1}
	bx r1
	.align 2, 0
.L08006EEC: .4byte gUnknown_08591388

	THUMB_FUNC_END IsDialogueLocked

	THUMB_FUNC_START UnlockDialogue
UnlockDialogue: @ 0x08006EF0
	push {lr}
	ldr r0, .L08006EFC  @ gUnknown_08591388
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08006EFC: .4byte gUnknown_08591388

	THUMB_FUNC_END UnlockDialogue

	THUMB_FUNC_START func_08006F00
func_08006F00: @ 0x08006F00
	push {r4, r5, lr}
	ldr r1, .L08006F40  @ gUnknown_0859133C
	ldr r2, [r1]
	ldrb r0, [r2, #8]
	cmp r0, #1
	bne .L08006F48
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge .L08006F38
	adds r5, r1, #0
.L08006F16:
	ldr r1, [r5]
	ldrb r0, [r1, #0xb]
	adds r0, r4, r0
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L08006F44  @ gTalkText
	adds r0, r0, r1
	movs r1, #4
	bl Text_SetColor
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt .L08006F16
.L08006F38:
	ldr r0, .L08006F40  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #4
	b .L08006F7A
	.align 2, 0
.L08006F40: .4byte gUnknown_0859133C
.L08006F44: .4byte gTalkText
.L08006F48:
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge .L08006F74
	adds r5, r1, #0
.L08006F52:
	ldr r1, [r5]
	ldrb r0, [r1, #0xb]
	adds r0, r4, r0
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L08006F84  @ gTalkText
	adds r0, r0, r1
	movs r1, #1
	bl Text_SetColor
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt .L08006F52
.L08006F74:
	ldr r0, .L08006F88  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #1
.L08006F7A:
	strb r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08006F84: .4byte gTalkText
.L08006F88: .4byte gUnknown_0859133C

	THUMB_FUNC_END func_08006F00

	THUMB_FUNC_START func_08006F8C
func_08006F8C: @ 0x08006F8C
	push {lr}
	cmp r0, #0
	beq .L08006FB0
	ldr r0, .L08006FA8  @ gUnknown_0859F000
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08006FAC  @ gUnknown_0859EFE0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b .L08006FC4
	.align 2, 0
.L08006FA8: .4byte gUnknown_0859F000
.L08006FAC: .4byte gUnknown_0859EFE0
.L08006FB0:
	ldr r0, .L08006FC8  @ gUnknown_089E84D4
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08006FCC  @ Pal_SystemText
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
.L08006FC4:
	pop {r0}
	bx r0
	.align 2, 0
.L08006FC8: .4byte gUnknown_089E84D4
.L08006FCC: .4byte Pal_SystemText

	THUMB_FUNC_END func_08006F8C

	THUMB_FUNC_START DialogueInterpret
DialogueInterpret: @ 0x08006FD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
.L08006FDA:
	ldr r7, .L08007010  @ gUnknown_0859133C
	adds r5, r7, #0
.L08006FDE:
	ldr r1, [r5]
	ldr r4, [r1]
	ldrb r0, [r4]
	cmp r0, #0x14
	bgt .L08007014
	cmp r0, #0x12
	blt .L08007014
	adds r4, #1
	str r4, [r1]
	bl func_0800890C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl GetStrTalkLen
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r5]
	adds r0, #2
	strb r0, [r1, #0xe]
	b .L08006FDE
	.align 2, 0
.L08007010: .4byte gUnknown_0859133C
.L08007014:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x81
	bls .L08007022
	bl .L08007828
.L08007022:
	lsls r0, r0, #2
	ldr r1, .L0800702C  @ .L08007030
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800702C: .4byte .L08007030
.L08007030: @ jump table
	.4byte .L08007298 @ case 0
	.4byte .L080072AE @ case 1
	.4byte .L080072CC @ case 2
	.4byte .L08007314 @ case 3
	.4byte .L08007350 @ case 4
	.4byte .L08007350 @ case 5
	.4byte .L08007350 @ case 6
	.4byte .L08007350 @ case 7
	.4byte .L08007450 @ case 8
	.4byte .L08007450 @ case 9
	.4byte .L08007450 @ case 10
	.4byte .L08007450 @ case 11
	.4byte .L08007450 @ case 12
	.4byte .L08007450 @ case 13
	.4byte .L08007450 @ case 14
	.4byte .L08007450 @ case 15
	.4byte .L080073AC @ case 16
	.4byte .L080073EC @ case 17
	.4byte .L08007828 @ case 18
	.4byte .L08007828 @ case 19
	.4byte .L08007828 @ case 20
	.4byte .L08007384 @ case 21
	.4byte .L08007394 @ case 22
	.4byte .L080073A0 @ case 23
	.4byte .L08007462 @ case 24
	.4byte .L080074AC @ case 25
	.4byte .L080074F8 @ case 26
	.4byte .L08007544 @ case 27
	.4byte .L08007430 @ case 28
	.4byte .L08007440 @ case 29
	.4byte .L08007828 @ case 30
	.4byte .L08007828 @ case 31
	.4byte .L08007828 @ case 32
	.4byte .L08007828 @ case 33
	.4byte .L08007828 @ case 34
	.4byte .L08007828 @ case 35
	.4byte .L08007828 @ case 36
	.4byte .L08007828 @ case 37
	.4byte .L08007828 @ case 38
	.4byte .L08007828 @ case 39
	.4byte .L08007828 @ case 40
	.4byte .L08007828 @ case 41
	.4byte .L08007828 @ case 42
	.4byte .L08007828 @ case 43
	.4byte .L08007828 @ case 44
	.4byte .L08007828 @ case 45
	.4byte .L08007828 @ case 46
	.4byte .L08007828 @ case 47
	.4byte .L08007828 @ case 48
	.4byte .L08007828 @ case 49
	.4byte .L08007828 @ case 50
	.4byte .L08007828 @ case 51
	.4byte .L08007828 @ case 52
	.4byte .L08007828 @ case 53
	.4byte .L08007828 @ case 54
	.4byte .L08007828 @ case 55
	.4byte .L08007828 @ case 56
	.4byte .L08007828 @ case 57
	.4byte .L08007828 @ case 58
	.4byte .L08007828 @ case 59
	.4byte .L08007828 @ case 60
	.4byte .L08007828 @ case 61
	.4byte .L08007828 @ case 62
	.4byte .L08007828 @ case 63
	.4byte .L08007828 @ case 64
	.4byte .L08007828 @ case 65
	.4byte .L08007828 @ case 66
	.4byte .L08007828 @ case 67
	.4byte .L08007828 @ case 68
	.4byte .L08007828 @ case 69
	.4byte .L08007828 @ case 70
	.4byte .L08007828 @ case 71
	.4byte .L08007828 @ case 72
	.4byte .L08007828 @ case 73
	.4byte .L08007828 @ case 74
	.4byte .L08007828 @ case 75
	.4byte .L08007828 @ case 76
	.4byte .L08007828 @ case 77
	.4byte .L08007828 @ case 78
	.4byte .L08007828 @ case 79
	.4byte .L08007828 @ case 80
	.4byte .L08007828 @ case 81
	.4byte .L08007828 @ case 82
	.4byte .L08007828 @ case 83
	.4byte .L08007828 @ case 84
	.4byte .L08007828 @ case 85
	.4byte .L08007828 @ case 86
	.4byte .L08007828 @ case 87
	.4byte .L08007828 @ case 88
	.4byte .L08007828 @ case 89
	.4byte .L08007828 @ case 90
	.4byte .L08007828 @ case 91
	.4byte .L08007828 @ case 92
	.4byte .L08007828 @ case 93
	.4byte .L08007828 @ case 94
	.4byte .L08007828 @ case 95
	.4byte .L08007828 @ case 96
	.4byte .L08007828 @ case 97
	.4byte .L08007828 @ case 98
	.4byte .L08007828 @ case 99
	.4byte .L08007828 @ case 100
	.4byte .L08007828 @ case 101
	.4byte .L08007828 @ case 102
	.4byte .L08007828 @ case 103
	.4byte .L08007828 @ case 104
	.4byte .L08007828 @ case 105
	.4byte .L08007828 @ case 106
	.4byte .L08007828 @ case 107
	.4byte .L08007828 @ case 108
	.4byte .L08007828 @ case 109
	.4byte .L08007828 @ case 110
	.4byte .L08007828 @ case 111
	.4byte .L08007828 @ case 112
	.4byte .L08007828 @ case 113
	.4byte .L08007828 @ case 114
	.4byte .L08007828 @ case 115
	.4byte .L08007828 @ case 116
	.4byte .L08007828 @ case 117
	.4byte .L08007828 @ case 118
	.4byte .L08007828 @ case 119
	.4byte .L08007828 @ case 120
	.4byte .L08007828 @ case 121
	.4byte .L08007828 @ case 122
	.4byte .L08007828 @ case 123
	.4byte .L08007828 @ case 124
	.4byte .L08007828 @ case 125
	.4byte .L08007828 @ case 126
	.4byte .L08007828 @ case 127
	.4byte .L08007590 @ case 128
	.4byte .L08007238 @ case 129
.L08007238:
	ldr r2, [r7]
	ldr r1, [r2]
	ldrb r0, [r1, #1]
	cmp r0, #0x40
	beq .L08007244
	b .L08007828
.L08007244:
	adds r0, r1, #2
	str r0, [r2]
	ldrb r0, [r2, #9]
	ldrb r1, [r2, #0xb]
	adds r0, r0, r1
	ldrb r1, [r2, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L08007290  @ gTalkText
	adds r0, r0, r1
	movs r1, #6
	bl Text_Skip
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L0800726C
	b .L08007360
.L0800726C:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble .L08007360
	ldr r0, .L08007294  @ gUnknown_085913D0
	mov r1, r8
	bl SpawnProcLocking
	adds r4, r0, #0
	movs r0, #4
	bl GetTextPauseDurationFromControlCode
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
.L0800728A:
	movs r0, #3
	b .L0800782A
	.align 2, 0
.L08007290: .4byte gTalkText
.L08007294: .4byte gUnknown_085913D0
.L08007298:
	ldr r1, [r7]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne .L080072A4
.L080072A0:
	movs r0, #0
	b .L0800782A
.L080072A4:
	adds r0, #2
	str r0, [r1]
	movs r0, #0
	str r0, [r1, #4]
	b .L08006FDA
.L080072AE:
	ldr r1, [r7]
	ldrb r0, [r1, #0x15]
	cmp r0, #1
	beq .L080072BC
	ldrb r0, [r1, #9]
	cmp r0, #1
	bne .L080072C2
.L080072BC:
	ldrb r0, [r1, #9]
	adds r0, #1
	strb r0, [r1, #9]
.L080072C2:
	ldr r1, [r7]
	movs r0, #0
	strb r0, [r1, #0x15]
	ldr r1, [r7]
	b .L0800735A
.L080072CC:
	movs r0, #0x80
	bl CheckDialogueFlag
	cmp r0, #0
	beq .L080072EC
	bl func_0800815C
	ldr r0, .L080072E8  @ gUnknown_0859133C
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b .L08007308
	.align 2, 0
.L080072E8: .4byte gUnknown_0859133C
.L080072EC:
	movs r0, #1
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08007304
	ldr r0, .L08007300  @ gUnknown_08591470
	mov r1, r8
	bl SpawnProcLocking
	b .L08007308
	.align 2, 0
.L08007300: .4byte gUnknown_08591470
.L08007304:
	bl Dialogue_ClearLines
.L08007308:
	ldr r0, .L08007310  @ gUnknown_0859133C
	ldr r1, [r0]
	b .L0800773C
	.align 2, 0
.L08007310: .4byte gUnknown_0859133C
.L08007314:
	ldr r1, [r7]
	ldrb r0, [r1, #9]
	ldrb r2, [r1, #0xb]
	adds r0, r0, r2
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L0800734C  @ gTalkText
	adds r0, r0, r1
	bl Text_GetCursor
	ldr r3, [r7]
	ldrb r1, [r3, #0xc]
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #4
	ldrb r2, [r3, #0xd]
	lsls r2, r2, #3
	ldrb r0, [r3, #9]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl NewTextBluArrowAndButtonChecker
	b .L0800773A
	.align 2, 0
.L0800734C: .4byte gTalkText
.L08007350:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08007364
.L0800735A:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
.L08007360:
	movs r0, #2
	b .L0800782A
.L08007364:
	ldr r0, .L08007380  @ gUnknown_085913D0
	mov r1, r8
	bl SpawnProcLocking
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	bl GetTextPauseDurationFromControlCode
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	b .L0800773A
	.align 2, 0
.L08007380: .4byte gUnknown_085913D0
.L08007384:
	bl Dialogue_ClearTextBoxes
	ldr r0, .L08007390  @ gUnknown_0859133C
	ldr r1, [r0]
	b .L0800773C
	.align 2, 0
.L08007390: .4byte gUnknown_0859133C
.L08007394:
	ldr r2, [r7]
	ldrb r1, [r2, #0x16]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2, #0x16]
	b .L0800773A
.L080073A0:
	ldr r2, [r7]
	ldrb r1, [r2, #0x17]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2, #0x17]
	b .L0800773A
.L080073AC:
	ldr r4, .L080073C4  @ gUnknown_0859133C
.L080073AE:
	ldr r2, [r4]
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #8
	bge .L080073BA
	b .L0800728A
.L080073BA:
	cmp r0, #0xf
	ble .L080073C8
	cmp r0, #0x10
	beq .L080073D8
	b .L0800728A
	.align 2, 0
.L080073C4: .4byte gUnknown_0859133C
.L080073C8:
	subs r0, #8
	bl SetActiveTalkFace
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b .L080073AE
.L080073D8:
	adds r0, r1, #1
	str r0, [r2]
	mov r0, r8
	bl func_08007854
	ldr r1, [r4]
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
	b .L080073AE
.L080073EC:
	bl func_0800890C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080073FA
	bl Dialogue_ClearTextBoxes
.L080073FA:
	ldr r4, .L0800742C  @ gUnknown_0859133C
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	lsls r1, r1, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	bl StartFaceFadeOut
	ldr r2, [r4]
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x18
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	mov r0, r8
	movs r1, #0x10
	bl StartBlockingTimer
	b .L0800728A
	.align 2, 0
.L0800742C: .4byte gUnknown_0859133C
.L08007430:
	movs r0, #0x10
	bl SetTalkFlag
	ldr r0, .L0800743C  @ gUnknown_0859133C
	ldr r1, [r0]
	b .L0800773C
	.align 2, 0
.L0800743C: .4byte gUnknown_0859133C
.L08007440:
	movs r0, #0x10
	bl UnsetDialogueFlag
	ldr r0, .L0800744C  @ gUnknown_0859133C
	ldr r1, [r0]
	b .L0800773C
	.align 2, 0
.L0800744C: .4byte gUnknown_0859133C
.L08007450:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl func_080089C4
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #8
	b .L08007736
.L08007462:
	ldr r6, .L080074A0  @ gUnknown_08591490
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, .L080074A4  @ gTalkText
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, .L080074A8  @ gBg0Tm
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl StartDialogueTextChoice
	b .L0800773A
	.align 2, 0
.L080074A0: .4byte gUnknown_08591490
.L080074A4: .4byte gTalkText
.L080074A8: .4byte gBg0Tm
.L080074AC:
	ldr r6, .L080074EC  @ gUnknown_08591490
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, .L080074F0  @ gTalkText
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, .L080074F4  @ gBg0Tm
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl StartDialogueTextChoice
	b .L0800773A
	.align 2, 0
.L080074EC: .4byte gUnknown_08591490
.L080074F0: .4byte gTalkText
.L080074F4: .4byte gBg0Tm
.L080074F8:
	ldr r6, .L08007538  @ gUnknown_085914A0
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, .L0800753C  @ gTalkText
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, .L08007540  @ gBg0Tm
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl StartDialogueTextChoice
	b .L0800773A
	.align 2, 0
.L08007538: .4byte gUnknown_085914A0
.L0800753C: .4byte gTalkText
.L08007540: .4byte gBg0Tm
.L08007544:
	ldr r6, .L08007584  @ gUnknown_085914A0
	ldr r5, [r7]
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, .L08007588  @ gTalkText
	adds r1, r1, r0
	lsls r4, r4, #1
	ldrb r0, [r5, #0xd]
	adds r4, r4, r0
	lsls r4, r4, #5
	ldrb r0, [r5, #0xc]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, .L0800758C  @ gBg0Tm
	adds r4, r4, r0
	ldrb r0, [r5, #8]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #2
	bl StartDialogueTextChoice
	b .L0800773A
	.align 2, 0
.L08007584: .4byte gUnknown_085914A0
.L08007588: .4byte gTalkText
.L0800758C: .4byte gBg0Tm
.L08007590:
	ldr r0, [r7]
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #0x25
	bls .L080075A0
	b .L080072A0
.L080075A0:
	lsls r0, r0, #2
	ldr r1, .L080075AC  @ .L080075B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080075AC: .4byte .L080075B0
.L080075B0: @ jump table
	.4byte .L0800766C @ case 0
	.4byte .L0800766C @ case 1
	.4byte .L0800766C @ case 2
	.4byte .L0800766C @ case 3
	.4byte .L080076BE @ case 4
	.4byte .L080076D0 @ case 5
	.4byte .L08007708 @ case 6
	.4byte .L0800773A @ case 7
	.4byte .L0800773A @ case 8
	.4byte .L080072A0 @ case 9
	.4byte .L08007720 @ case 10
	.4byte .L08007720 @ case 11
	.4byte .L08007720 @ case 12
	.4byte .L08007720 @ case 13
	.4byte .L08007720 @ case 14
	.4byte .L08007720 @ case 15
	.4byte .L08007720 @ case 16
	.4byte .L08007720 @ case 17
	.4byte .L080072A0 @ case 18
	.4byte .L080072A0 @ case 19
	.4byte .L080072A0 @ case 20
	.4byte .L080072A0 @ case 21
	.4byte .L08007744 @ case 22
	.4byte .L0800775A @ case 23
	.4byte .L08007770 @ case 24
	.4byte .L08007786 @ case 25
	.4byte .L0800779C @ case 26
	.4byte .L080077B2 @ case 27
	.4byte .L080077CC @ case 28
	.4byte .L080077E2 @ case 29
	.4byte .L080077F8 @ case 30
	.4byte .L0800780E @ case 31
	.4byte .L080076F0 @ case 32
	.4byte .L08007658 @ case 33
	.4byte .L080072A0 @ case 34
	.4byte .L080072A0 @ case 35
	.4byte .L08007648 @ case 36
	.4byte .L080076AC @ case 37
.L08007648:
	ldr r0, [r7]
	ldr r1, [r0, #0x38]
	cmp r1, #0
	beq .L0800773A
	mov r0, r8
	bl _call_via_r1
	b .L0800773A
.L08007658:
	bl func_08006F00
	ldr r0, .L08007668  @ gUnknown_0859133C
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b .L08006FDA
	.align 2, 0
.L08007668: .4byte gUnknown_0859133C
.L0800766C:
	ldr r3, .L080076A4  @ gUnknown_0859133C
	ldr r1, [r3]
	ldr r2, [r1]
	adds r0, r2, #1
	str r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r3]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge .L0800769E
	adds r6, r3, #0
	ldr r5, .L080076A8  @ gTalkText
.L08007688:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl Text_SetColor
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt .L08007688
.L0800769E:
	ldr r0, .L080076A4  @ gUnknown_0859133C
	ldr r1, [r0]
	b .L0800773C
	.align 2, 0
.L080076A4: .4byte gUnknown_0859133C
.L080076A8: .4byte gTalkText
.L080076AC:
	ldr r2, [r7]
	adds r2, #0x83
	ldrb r0, [r2]
	movs r1, #1
	ands r1, r0
	movs r0, #3
	subs r0, r0, r1
	strb r0, [r2]
	b .L0800773A
.L080076BE:
	mov r0, r8
	bl LockDialogue
	ldr r0, .L080076CC  @ gUnknown_0859133C
	ldr r1, [r0]
	b .L0800773C
	.align 2, 0
.L080076CC: .4byte gUnknown_0859133C
.L080076D0:
	ldr r4, .L080076EC  @ gUnknown_0859133C
	ldr r1, [r4]
	ldr r0, [r1, #0x3c]
	adds r1, #0x40
	bl String_FromNumber
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r1]
	b .L08006FDA
	.align 2, 0
.L080076EC: .4byte gUnknown_0859133C
.L080076F0:
	ldr r4, .L08007704  @ gUnknown_0859133C
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	bl GetTacticianName
	ldr r1, [r4]
	str r0, [r1]
	b .L08006FDA
	.align 2, 0
.L08007704: .4byte gUnknown_0859133C
.L08007708:
	ldr r0, .L0800771C  @ gUnknown_0859133C
	ldr r1, [r0]
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1, #4]
	adds r0, r1, #0
	adds r0, #0x60
	str r0, [r1]
	b .L08006FDA
	.align 2, 0
.L0800771C: .4byte gUnknown_0859133C
.L08007720:
	ldr r1, [r7]
	ldrb r0, [r1, #0x11]
	ldr r1, [r1]
	ldrb r1, [r1]
	subs r1, #0xa
	bl func_080079E4
	ldr r0, [r7]
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #0xa
.L08007736:
	bl SetActiveTalkFace
.L0800773A:
	ldr r1, [r7]
.L0800773C:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b .L0800728A
.L08007744:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b .L080077C6
.L0800775A:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #1
	b .L080077C6
.L08007770:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b .L080077C6
.L08007786:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b .L080077C6
.L0800779C:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
	b .L080077C6
.L080077B2:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #5
.L080077C6:
	bl SetFaceBlinkControl
	b .L0800728A
.L080077CC:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0
	b .L08007822
.L080077E2:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #2
	b .L08007822
.L080077F8:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #3
	b .L08007822
.L0800780E:
	ldr r1, [r7]
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r1, #0x18
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #4
.L08007822:
	bl func_080064D4
	b .L0800728A
.L08007828:
	movs r0, #1
.L0800782A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END DialogueInterpret

	THUMB_FUNC_START SetActiveTalkFace
SetActiveTalkFace: @ 0x08007838
	ldr r1, .L08007840  @ gUnknown_0859133C
	ldr r1, [r1]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
.L08007840: .4byte gUnknown_0859133C

	THUMB_FUNC_END SetActiveTalkFace

	THUMB_FUNC_START func_08007844
func_08007844: @ 0x08007844
	push {lr}
	ldr r0, .L08007850  @ gUnknown_08591390
	bl SetFaceConfig
	pop {r0}
	bx r0
	.align 2, 0
.L08007850: .4byte gUnknown_08591390

	THUMB_FUNC_END func_08007844

	THUMB_FUNC_START func_08007854
func_08007854: @ 0x08007854
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, .L0800787C  @ gUnknown_0859133C
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	bne .L0800786A
	movs r0, #1
	bl SetActiveTalkFace
.L0800786A:
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08007880
	bl func_08007844
	b .L08007882
	.align 2, 0
.L0800787C: .4byte gUnknown_0859133C
.L08007880:
	movs r6, #2
.L08007882:
	ldr r4, .L080078B4  @ gUnknown_0859133C
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	bl func_08008934
	cmp r0, #0xe
	bgt .L08007894
	movs r0, #1
	orrs r6, r0
.L08007894:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r4, [r0]
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	adds r4, r4, r0
	ldr r0, .L080078B8  @ 0x0000FFFF
	cmp r4, r0
	bne .L080078C0
	ldr r0, .L080078BC  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitFid
	adds r4, r0, #0
	b .L080078C4
	.align 2, 0
.L080078B4: .4byte gUnknown_0859133C
.L080078B8: .4byte 0x0000FFFF
.L080078BC: .4byte gActiveUnit
.L080078C0:
	ldr r0, .L080078E0  @ 0xFFFFFF00
	adds r4, r4, r0
.L080078C4:
	ldr r5, .L080078E4  @ gUnknown_0859133C
	ldr r0, [r5]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080078E8
	adds r1, r4, #0
	bl func_080066E0
	b .L08007930
	.align 2, 0
.L080078E0: .4byte 0xFFFFFF00
.L080078E4: .4byte gUnknown_0859133C
.L080078E8:
	adds r0, r2, #0
	bl func_08008934
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r0, r4, #0
	movs r2, #0x50
	adds r3, r6, #0
	bl StartFaceAuto
	ldr r3, [r5]
	ldrb r1, [r3, #0x11]
	lsls r1, r1, #2
	adds r2, r3, #0
	adds r2, #0x18
	adds r1, r2, r1
	str r0, [r1]
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	bl StartFaceFadeIn
	ldr r0, [r5]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl CheckDialogueFlag
	adds r1, r0, #0
	adds r0, r4, #0
	bl func_0800798C
	adds r0, r7, #0
	movs r1, #8
	bl StartBlockingTimer
.L08007930:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08007854

	THUMB_FUNC_START StartDialogueFace
StartDialogueFace: @ 0x08007938
	push {r4, lr}
	ldr r4, [sp, #8]
	bl StartFaceAuto
	ldr r1, .L08007954  @ gUnknown_0859133C
	ldr r1, [r1]
	lsls r4, r4, #2
	adds r1, #0x18
	adds r1, r1, r4
	str r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08007954: .4byte gUnknown_0859133C

	THUMB_FUNC_END StartDialogueFace

	THUMB_FUNC_START func_08007958
func_08007958: @ 0x08007958
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, .L08007974  @ gFaces
.L08007960:
	ldr r0, [r2]
	cmp r0, #0
	beq .L08007978
	movs r4, #0x34
	ldrsh r0, [r0, r4]
	cmp r0, r3
	bne .L08007978
	adds r0, r1, #0
	b .L08007984
	.align 2, 0
.L08007974: .4byte gFaces
.L08007978:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble .L08007960
	movs r0, #1
	negs r0, r0
.L08007984:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08007958

	THUMB_FUNC_START func_0800798C
func_0800798C: @ 0x0800798C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	cmp r1, #0
	bne .L080079DE
	movs r7, #5
	movs r6, #6
	cmp r3, #0
	blt .L080079A4
	cmp r3, #2
	ble .L080079A4
	cmp r3, #5
	ble .L080079AA
.L080079A4:
	movs r1, #0
	movs r4, #2
	b .L080079AE
.L080079AA:
	movs r1, #3
	movs r4, #5
.L080079AE:
	adds r2, r1, #0
	cmp r2, r4
	bgt .L080079DE
	ldr r5, .L080079D0  @ gUnknown_0859133C
.L080079B6:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq .L080079D8
	cmp r2, r3
	bne .L080079D4
	adds r0, #0x41
	strb r7, [r0]
	b .L080079D8
	.align 2, 0
.L080079D0: .4byte gUnknown_0859133C
.L080079D4:
	adds r0, #0x41
	strb r6, [r0]
.L080079D8:
	adds r2, #1
	cmp r2, r4
	ble .L080079B6
.L080079DE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800798C

	THUMB_FUNC_START func_080079E4
func_080079E4: @ 0x080079E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r7, #0
	ldr r0, .L08007A38  @ gUnknown_0859133C
	mov r8, r0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, #0x18
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq .L08007A0E
	movs r7, #1
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl func_08007A58
.L08007A0E:
	adds r2, r7, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_08007A58
	mov r1, r8
	ldr r0, [r1]
	lsls r2, r5, #2
	adds r0, #0x18
	adds r2, r0, r2
	ldr r3, [r2]
	adds r0, r0, r6
	ldr r1, [r0]
	str r1, [r2]
	str r3, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08007A38: .4byte gUnknown_0859133C

	THUMB_FUNC_END func_080079E4

	THUMB_FUNC_START func_08007A3C
func_08007A3C: @ 0x08007A3C
	push {lr}
	ldr r0, .L08007A4C  @ gUnknown_085913B0
	bl FindProc
	cmp r0, #0
	bne .L08007A50
	movs r0, #0
	b .L08007A52
	.align 2, 0
.L08007A4C: .4byte gUnknown_085913B0
.L08007A50:
	movs r0, #1
.L08007A52:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08007A3C

	THUMB_FUNC_START func_08007A58
func_08007A58: @ 0x08007A58
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	bl func_08008934
	lsls r0, r0, #3
	bl func_08007958
	adds r5, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq .L08007AA0
	ldr r0, .L08007AA8  @ gUnknown_085913B0
	ldr r1, .L08007AAC  @ gFaces
	lsls r4, r5, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl SpawnProc
	adds r3, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, [r4]
	ldrh r1, [r0, #0x34]
	adds r0, r3, #0
	adds r0, #0x68
	strh r1, [r0]
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x6a
	strh r0, [r1]
.L08007AA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08007AA8: .4byte gUnknown_085913B0
.L08007AAC: .4byte gFaces

	THUMB_FUNC_END func_08007A58

	THUMB_FUNC_START func_08007AB0
func_08007AB0: @ 0x08007AB0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x58]
	adds r4, r6, #0
	adds r4, #0x66
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl func_08008934
	adds r5, r6, #0
	adds r5, #0x68
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0
	bge .L08007AEA
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl func_08008934
	lsls r0, r0, #3
	movs r2, #0
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	cmp r0, #0x18
	bgt .L08007AFE
	b .L08007B02
.L08007AEA:
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl func_08008934
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r0, #3
	subs r1, r1, r0
	cmp r1, #0x18
	ble .L08007B02
.L08007AFE:
	movs r0, #0x20
	b .L08007B04
.L08007B02:
	movs r0, #0x10
.L08007B04:
	str r0, [r6, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08007AB0

	THUMB_FUNC_START func_08007B0C
func_08007B0C: @ 0x08007B0C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	cmp r2, #0x10
	ble .L08007B80
	adds r1, r2, #0
	cmp r2, #0
	bge .L08007B20
	adds r1, r2, #7
.L08007B20:
	asrs r1, r1, #3
	ldr r0, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, r1
	bne .L08007B3E
	ldr r1, .L08007B7C  @ gFaces
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
.L08007B3E:
	ldr r0, [r4, #0x5c]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	cmp r1, r0
	bne .L08007B5E
	ldr r1, .L08007B7C  @ gFaces
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
.L08007B5E:
	ldr r1, [r4, #0x5c]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge .L08007B6A
	adds r0, #7
.L08007B6A:
	asrs r1, r0, #3
	ldr r0, [r4, #0x58]
	cmp r0, r1
	bne .L08007BA2
	ldr r1, .L08007B7C  @ gFaces
	movs r2, #0
	ldrsh r0, [r5, r2]
	b .L08007B96
	.align 2, 0
.L08007B7C: .4byte gFaces
.L08007B80:
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	ldr r1, [r4, #0x58]
	adds r5, r4, #0
	adds r5, #0x64
	cmp r1, r0
	bne .L08007BA2
	ldr r1, .L08007BC4  @ gFaces
	movs r3, #0
	ldrsh r0, [r5, r3]
.L08007B96:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	adds r0, #1
	strh r0, [r1, #0x36]
.L08007BA2:
	ldr r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	blt .L08007BC8
	ldr r1, .L08007BC4  @ gFaces
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x36]
	subs r0, #1
	strh r0, [r1, #0x36]
	adds r0, r4, #0
	bl Proc_Break
	b .L08007C00
	.align 2, 0
.L08007BC4: .4byte gFaces
.L08007BC8:
	adds r0, r4, #0
	adds r0, #0x66
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl func_08008934
	adds r2, r0, #0
	lsls r2, r2, #3
	adds r0, r4, #0
	adds r0, #0x68
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x58]
	adds r3, r0, #0
	adds r0, #1
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	ldr r2, .L08007C08  @ gFaces
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	strh r0, [r1, #0x34]
.L08007C00:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08007C08: .4byte gFaces

	THUMB_FUNC_END func_08007B0C

	THUMB_FUNC_START DialogueMain_OnEnd
DialogueMain_OnEnd: @ 0x08007C0C
	push {lr}
	ldr r0, .L08007C20  @ gUnknown_08591340
	bl EndEachProc
	ldr r0, .L08007C24  @ gUnknown_08591470
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08007C20: .4byte gUnknown_08591340
.L08007C24: .4byte gUnknown_08591470

	THUMB_FUNC_END DialogueMain_OnEnd

	THUMB_FUNC_START DialoguePauseTimer_OnLoop
DialoguePauseTimer_OnLoop: @ 0x08007C28
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne .L08007C42
	adds r0, r2, #0
	bl Proc_Break
	b .L08007C46
.L08007C42:
	subs r0, r3, #1
	strh r0, [r1]
.L08007C46:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END DialoguePauseTimer_OnLoop

	THUMB_FUNC_START func_08007C4C
func_08007C4C: @ 0x08007C4C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameTime
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x80
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08007C8C
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, .L08007C88  @ gUnknown_08591430
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	bl PutSprite
	b .L08007CAC
	.align 2, 0
.L08007C88: .4byte gUnknown_08591430
.L08007C8C:
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, .L08007CC8  @ gUnknown_08591430
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, .L08007CCC  @ 0x0000B2BF
	str r0, [sp]
	movs r0, #0
	bl PutSprite
.L08007CAC:
	ldr r0, .L08007CD0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq .L08007CC0
	adds r0, r5, #0
	bl Proc_Break
.L08007CC0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08007CC8: .4byte gUnknown_08591430
.L08007CCC: .4byte 0x0000B2BF
.L08007CD0: .4byte gKeySt

	THUMB_FUNC_END func_08007C4C

	THUMB_FUNC_START func_08007CD4
func_08007CD4: @ 0x08007CD4
	bx lr

	THUMB_FUNC_END func_08007CD4

	THUMB_FUNC_START NewTextBluArrowAndButtonChecker
NewTextBluArrowAndButtonChecker: @ 0x08007CD8
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, .L08007D00  @ gUnknown_085913F0
	adds r1, r3, #0
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08007D00: .4byte gUnknown_085913F0

	THUMB_FUNC_END NewTextBluArrowAndButtonChecker

	THUMB_FUNC_START func_08007D04
func_08007D04: @ 0x08007D04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, .L08007D34  @ gUnknown_085913F0
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08007D34: .4byte gUnknown_085913F0

	THUMB_FUNC_END func_08007D04

	THUMB_FUNC_START func_08007D38
func_08007D38: @ 0x08007D38
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08007D80  @ gUnknown_0859133C
	ldr r2, [r4]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08007D84  @ gBg0Tm
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl DialogueEnableBgSyncByMask
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	cmp r0, #0
	bne .L08007D88
	adds r1, r5, #0
	adds r1, #0x66
	movs r0, #0x10
	strh r0, [r1]
	b .L08007D9E
	.align 2, 0
.L08007D80: .4byte gUnknown_0859133C
.L08007D84: .4byte gBg0Tm
.L08007D88:
	ldrb r0, [r1, #9]
	adds r0, #1
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	blt .L08007D96
	lsls r1, r1, #4
	b .L08007D98
.L08007D96:
	lsls r1, r0, #4
.L08007D98:
	adds r0, r5, #0
	adds r0, #0x66
	strh r1, [r0]
.L08007D9E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08007D38

	THUMB_FUNC_START func_08007DA4
func_08007DA4: @ 0x08007DA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	adds r0, r5, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt .L08007DE0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl Dialogue_ClearText
	adds r0, r5, #0
	bl Proc_Break
.L08007DE0:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08007DA4

	THUMB_FUNC_START StartDialogueTextChoice
StartDialogueTextChoice: @ 0x08007DE8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov r9, r3
	adds r0, r6, #0
	bl Text_GetCursor
	adds r4, r0, #0
	movs r0, #0x10
	adds r0, r0, r4
	mov r8, r0
	ldrh r0, [r7]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	mov r1, r8
	ldr r2, [sp, #0x1c]
	bl Text_InsertDrawString
	adds r4, #0x38
	ldrh r0, [r7, #8]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	bl Text_InsertDrawString
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	movs r0, #1
	bl DialogueEnableBgSyncByMask
	ldr r0, .L08007E90  @ gUnknown_085914B0
	ldr r1, [sp, #0x20]
	bl SpawnProcLocking
	adds r2, r0, #0
	mov r1, r9
	strh r1, [r2, #0x2a]
	ldr r0, .L08007E94  @ gBg0Tm
	subs r5, r5, r0
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #3
	ldr r3, .L08007E98  @ gDispIo
	ldrh r1, [r3, #0x1c]
	subs r0, r0, r1
	add r0, r8
	strh r0, [r2, #0x2c]
	cmp r5, #0
	bge .L08007E64
	adds r5, #0x1f
.L08007E64:
	asrs r0, r5, #5
	lsls r0, r0, #3
	ldrh r1, [r3, #0x1e]
	subs r0, r0, r1
	strh r0, [r2, #0x2e]
	str r7, [r2, #0x34]
	mov r1, r9
	lsls r0, r1, #3
	adds r0, r0, r7
	subs r0, #8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq .L08007E82
	bl _call_via_r0
.L08007E82:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08007E90: .4byte gUnknown_085914B0
.L08007E94: .4byte gBg0Tm
.L08007E98: .4byte gDispIo

	THUMB_FUNC_END StartDialogueTextChoice

	THUMB_FUNC_START DialogueTextChoice_OnLoop
DialogueTextChoice_OnLoop: @ 0x08007E9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L08007EC8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08007ED4
	ldr r0, .L08007ECC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08007EC0
	movs r0, #0x6b
	bl m4aSongNumStart
.L08007EC0:
	ldr r1, .L08007ED0  @ gTalkResult
	movs r0, #0
	b .L08007EF6
	.align 2, 0
.L08007EC8: .4byte gKeySt
.L08007ECC: .4byte gPlaySt
.L08007ED0: .4byte gTalkResult
.L08007ED4:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq .L08007F08
	ldr r0, .L08007F00  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08007EF0
	movs r0, #0x6a
	bl m4aSongNumStart
.L08007EF0:
	ldr r1, .L08007F04  @ gTalkResult
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
.L08007EF6:
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08007F8C
	.align 2, 0
.L08007F00: .4byte gPlaySt
.L08007F04: .4byte gTalkResult
.L08007F08:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L08007F38
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne .L08007F38
	ldr r0, .L08007F94  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08007F2A
	movs r0, #0x67
	bl m4aSongNumStart
.L08007F2A:
	strh r5, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq .L08007F38
	bl _call_via_r0
.L08007F38:
	ldr r0, .L08007F98  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08007F70
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bne .L08007F70
	ldr r0, .L08007F94  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08007F60
	movs r0, #0x67
	bl m4aSongNumStart
.L08007F60:
	movs r0, #2
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq .L08007F70
	bl _call_via_r0
.L08007F70:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
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
.L08007F8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08007F94: .4byte gPlaySt
.L08007F98: .4byte gKeySt

	THUMB_FUNC_END DialogueTextChoice_OnLoop

	THUMB_FUNC_START func_08007F9C
func_08007F9C: @ 0x08007F9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08007FD4  @ gUnknown_0859133C
	ldr r2, [r0]
	ldrb r0, [r2, #0xd]
	adds r0, #4
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08007FD8  @ gBg0Tm
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	ldrb r2, [r2, #0xa]
	lsls r2, r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl DialogueEnableBgSyncByMask
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08007FD4: .4byte gUnknown_0859133C
.L08007FD8: .4byte gBg0Tm

	THUMB_FUNC_END func_08007F9C

	THUMB_FUNC_START func_08007FDC
func_08007FDC: @ 0x08007FDC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble .L080080BC
	ldr r4, .L080080C4  @ gUnknown_0859133C
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	bge .L0800805A
	adds r6, r4, #0
.L08008026:
	ldr r4, [r6]
	ldrb r0, [r4, #0xb]
	adds r0, r5, r0
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, .L080080C8  @ gTalkText
	adds r0, r0, r1
	lsls r1, r5, #1
	ldrb r2, [r4, #0xd]
	adds r1, r1, r2
	lsls r1, r1, #5
	ldrb r4, [r4, #0xc]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r2, .L080080CC  @ gBg0Tm
	adds r1, r1, r2
	bl PutText
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	blt .L08008026
.L0800805A:
	ldr r4, .L080080C4  @ gUnknown_0859133C
	ldr r2, [r4]
	ldrb r0, [r2, #0xa]
	subs r0, #1
	lsls r0, r0, #1
	ldrb r1, [r2, #0xd]
	adds r0, r0, r1
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L080080CC  @ gBg0Tm
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	ldr r5, .L080080C8  @ gTalkText
	adds r0, r0, r5
	bl ClearText
	ldr r4, [r4]
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4, #8]
	bl Text_SetColor
	movs r0, #1
	bl DialogueEnableBgSyncByMask
	adds r0, r7, #0
	bl Proc_Break
.L080080BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080080C4: .4byte gUnknown_0859133C
.L080080C8: .4byte gTalkText
.L080080CC: .4byte gBg0Tm

	THUMB_FUNC_END func_08007FDC

	THUMB_FUNC_START func_080080D0
func_080080D0: @ 0x080080D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x80
	bl CheckDialogueFlag
	cmp r0, #0
	beq .L080080EE
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #0x1c
	movs r2, #0
	adds r3, r4, #0
	bl func_08008F64
	b .L080080FC
.L080080EE:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, .L08008104  @ 0x44444444
	movs r1, #0x19
	adds r3, r4, #0
	bl func_08008F64
.L080080FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08008104: .4byte 0x44444444

	THUMB_FUNC_END func_080080D0

	THUMB_FUNC_START func_08008108
func_08008108: @ 0x08008108
	push {r4, lr}
	ldr r0, .L08008130  @ gUnknown_0859133C
	ldr r1, [r0]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	movs r0, #0x80
	bl CheckDialogueFlag
	cmp r0, #0
	beq .L08008138
	ldr r4, .L08008134  @ gUnknown_030000D8
	adds r0, r4, #0
	bl DrawSpriteTextBackgroundColor0
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	b .L08008148
	.align 2, 0
.L08008130: .4byte gUnknown_0859133C
.L08008134: .4byte gUnknown_030000D8
.L08008138:
	ldr r4, .L08008158  @ gUnknown_030000D8
	adds r0, r4, #0
	bl DrawSpriteTextBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
.L08008148:
	ldr r0, .L08008158  @ gUnknown_030000D8
	movs r1, #4
	bl Text_SetCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08008158: .4byte gUnknown_030000D8

	THUMB_FUNC_END func_08008108

	THUMB_FUNC_START func_0800815C
func_0800815C: @ 0x0800815C
	push {r4, r5, lr}
	ldr r0, .L08008190  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #9]
	movs r5, #0
.L08008168:
	lsls r4, r5, #3
	ldr r0, .L08008194  @ gTalkText
	adds r4, r4, r0
	adds r0, r4, #0
	bl DrawSpriteTextBackgroundColor0
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r5, #1
	cmp r5, #1
	ble .L08008168
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08008190: .4byte gUnknown_0859133C
.L08008194: .4byte gTalkText

	THUMB_FUNC_END func_0800815C

	THUMB_FUNC_START GetTextPauseDurationFromControlCode
GetTextPauseDurationFromControlCode: @ 0x08008198
	ldr r1, .L080081A4  @ gUnknown_08591520
	subs r0, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L080081A4: .4byte gUnknown_08591520

	THUMB_FUNC_END GetTextPauseDurationFromControlCode

	THUMB_FUNC_START Dialogue_ClearTextBoxes
Dialogue_ClearTextBoxes: @ 0x080081A8
	push {lr}
	ldr r0, .L080081E0  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, .L080081E4  @ gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl DialogueEnableBgSyncByMask
	bl Dialogue_ClearText
	ldr r2, .L080081E8  @ gDispIo
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
	pop {r0}
	bx r0
	.align 2, 0
.L080081E0: .4byte gUnknown_0859133C
.L080081E4: .4byte gBg1Tm
.L080081E8: .4byte gDispIo

	THUMB_FUNC_END Dialogue_ClearTextBoxes

	THUMB_FUNC_START Dialogue_ClearText
Dialogue_ClearText: @ 0x080081EC
	push {r4, r5, r6, lr}
	ldr r0, .L08008244  @ gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl DialogueEnableBgSyncByMask
	ldr r2, .L08008248  @ gUnknown_0859133C
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge .L0800823E
	adds r6, r2, #0
.L0800821E:
	lsls r4, r5, #3
	ldr r0, .L0800824C  @ gTalkText
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl Text_SetColor
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt .L0800821E
.L0800823E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08008244: .4byte gBg0Tm
.L08008248: .4byte gUnknown_0859133C
.L0800824C: .4byte gTalkText

	THUMB_FUNC_END Dialogue_ClearText

	THUMB_FUNC_START Dialogue_ClearLines
Dialogue_ClearLines: @ 0x08008250
	push {r4, r5, r6, lr}
	ldr r2, .L0800829C  @ gUnknown_0859133C
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge .L08008294
	adds r6, r2, #0
.L08008274:
	lsls r4, r5, #3
	ldr r0, .L080082A0  @ gTalkText
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl Text_SetColor
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt .L08008274
.L08008294:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0800829C: .4byte gUnknown_0859133C
.L080082A0: .4byte gTalkText

	THUMB_FUNC_END Dialogue_ClearLines

	THUMB_FUNC_START func_080082A4
func_080082A4: @ 0x080082A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov sl, r1
	adds r4, r2, #0
	str r3, [sp, #4]
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r0, .L080082F4  @ gBg1Tm
	movs r1, #0
	bl TmFill
	movs r7, #1
	cmp r5, #0xf
	bgt .L080082CE
	movs r7, #0
.L080082CE:
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080082DA
	adds r7, #2
.L080082DA:
	mov r1, sl
	ldr r2, [sp, #4]
	subs r0, r1, r2
	adds r0, #1
	mov r9, r0
	cmp r7, #1
	beq .L08008316
	cmp r7, #1
	bgt .L080082F8
	cmp r7, #0
	beq .L08008302
	b .L0800835A
	.align 2, 0
.L080082F4: .4byte gBg1Tm
.L080082F8:
	cmp r7, #2
	beq .L0800833A
	cmp r7, #3
	beq .L0800834C
	b .L0800835A
.L08008302:
	adds r5, #3
	mov r8, r5
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r6, r5, r0
	cmp r6, #0
	bgt .L0800835A
	movs r6, #1
	b .L0800835A
.L08008316:
	subs r5, #5
	mov r8, r5
	adds r0, r4, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, r8
	cmp r0, #0x1d
	ble .L0800832E
	movs r0, #0x1d
	subs r6, r0, r4
	b .L0800835A
.L0800832E:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r1, r8
	subs r6, r1, r0
	b .L0800835A
.L0800833A:
	movs r6, #9
	movs r2, #0xe
	mov r9, r2
	movs r4, #0x14
	movs r0, #8
	mov r8, r0
	movs r1, #0x10
	mov sl, r1
	b .L0800835A
.L0800834C:
	movs r6, #1
	movs r2, #0xe
	mov r9, r2
	movs r4, #0x14
	mov r8, r4
	movs r0, #0x10
	mov sl, r0
.L0800835A:
	ldr r5, .L080083DC  @ gUnknown_0859133C
	ldr r1, [r5]
	adds r0, r6, #1
	strb r0, [r1, #0xc]
	ldr r1, [r5]
	mov r0, r9
	adds r0, #1
	strb r0, [r1, #0xd]
	ldr r1, [sp, #4]
	str r1, [sp]
	movs r0, #1
	adds r1, r6, #0
	mov r2, r9
	adds r3, r4, #0
	bl func_08008668
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0800839C
	movs r0, #1
	ands r0, r1
	bl func_08006F8C
	ldr r1, [r5]
	adds r1, #0x83
	ldrb r0, [r1]
	movs r2, #2
	eors r0, r2
	strb r0, [r1]
.L0800839C:
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L080083B6
	movs r0, #1
	mov r1, r8
	mov r2, sl
	adds r3, r7, #0
	bl func_080084E0
.L080083B6:
	adds r0, r6, #0
	mov r1, r9
	adds r2, r4, #0
	ldr r3, [sp, #4]
	bl func_08008464
	bl StartDialogueBoxAppearingAnimator
	movs r0, #2
	bl DialogueEnableBgSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080083DC: .4byte gUnknown_0859133C

	THUMB_FUNC_END func_080082A4

	THUMB_FUNC_START StartDialogueBoxAppearingAnimator
StartDialogueBoxAppearingAnimator: @ 0x080083E0
	push {lr}
	ldr r0, .L080083F4  @ gUnknown_08591530
	movs r1, #3
	bl SpawnProc
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L080083F4: .4byte gUnknown_08591530

	THUMB_FUNC_END StartDialogueBoxAppearingAnimator

	THUMB_FUNC_START func_080083F8
func_080083F8: @ 0x080083F8
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	mov r1, sp
	ldr r0, .L0800845C  @ gUnknown_080D78EC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r6, #0
	adds r5, #0x64
	ldrh r1, [r5]
	adds r2, r1, #1
	strh r2, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08008454
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #2
	add r0, sp
	ldr r4, [r0]
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L08008460  @ 0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0
	bne .L08008454
	adds r0, r6, #0
	bl Proc_Break
.L08008454:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0800845C: .4byte gUnknown_080D78EC
.L08008460: .4byte 0x06000200

	THUMB_FUNC_END func_080083F8

	THUMB_FUNC_START func_08008464
func_08008464: @ 0x08008464
	push {r4, r5, r6, lr}
	ldr r4, .L080084DC  @ gDispIo
	mov ip, r4
	ldrb r4, [r4, #1]
	movs r5, #0x20
	orrs r4, r5
	movs r5, #0x41
	negs r5, r5
	ands r4, r5
	movs r5, #0x7f
	ands r4, r5
	mov r5, ip
	strb r4, [r5, #1]
	adds r4, r0, #1
	lsls r4, r4, #3
	adds r5, #0x2d
	strb r4, [r5]
	adds r4, r1, #1
	lsls r4, r4, #3
	adds r5, #4
	strb r4, [r5]
	adds r0, r0, r2
	subs r0, #1
	lsls r0, r0, #3
	mov r2, ip
	adds r2, #0x2c
	strb r0, [r2]
	adds r1, r1, r3
	subs r1, #1
	lsls r1, r1, #3
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	adds r2, #8
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
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080084DC: .4byte gDispIo

	THUMB_FUNC_END func_08008464

	THUMB_FUNC_START func_080084E0
func_080084E0: @ 0x080084E0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl GetBgTilemap
	adds r3, r0, #0
	cmp r6, #5
	bls .L080084F4
	b .L08008656
.L080084F4:
	lsls r0, r6, #2
	ldr r1, .L08008500  @ .L08008504
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08008500: .4byte .L08008504
.L08008504: @ jump table
	.4byte .L0800851C @ case 0
	.4byte .L08008550 @ case 1
	.4byte .L08008588 @ case 2
	.4byte .L080085BC @ case 3
	.4byte .L080085F4 @ case 4
	.4byte .L0800862C @ case 5
.L0800851C:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, .L08008544  @ 0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, .L08008548  @ 0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, .L0800854C  @ 0x00003416
	adds r1, r3, #0
	strh r1, [r0]
	adds r2, #1
	b .L08008652
	.align 2, 0
.L08008544: .4byte 0x00003014
.L08008548: .4byte 0x00003414
.L0800854C: .4byte 0x00003416
.L08008550:
	lsls r0, r4, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, .L08008578  @ 0x00003014
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, .L0800857C  @ 0x00003414
	adds r1, r2, #0
	strh r1, [r0, #2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, .L08008580  @ 0x00003015
	adds r1, r3, #0
	strh r1, [r0]
	ldr r2, .L08008584  @ 0x00003016
	b .L08008652
	.align 2, 0
.L08008578: .4byte 0x00003014
.L0800857C: .4byte 0x00003414
.L08008580: .4byte 0x00003015
.L08008584: .4byte 0x00003016
.L08008588:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, .L080085B0  @ 0x00003418
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, .L080085B4  @ 0x00003419
	adds r1, r3, #0
	strh r1, [r0]
	subs r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, .L080085B8  @ 0x00003C17
	b .L08008652
	.align 2, 0
.L080085B0: .4byte 0x00003418
.L080085B4: .4byte 0x00003419
.L080085B8: .4byte 0x00003C17
.L080085BC:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, .L080085E4  @ 0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, .L080085E8  @ 0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, .L080085EC  @ 0x00003018
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, .L080085F0  @ 0x00003019
	b .L08008652
	.align 2, 0
.L080085E4: .4byte 0x00003017
.L080085E8: .4byte 0x00003817
.L080085EC: .4byte 0x00003018
.L080085F0: .4byte 0x00003019
.L080085F4:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, .L0800861C  @ 0x00003C19
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, .L08008620  @ 0x00003C18
	adds r1, r3, #0
	strh r1, [r0]
	ldr r3, .L08008624  @ 0x00003417
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, .L08008628  @ 0x00003C17
	b .L08008652
	.align 2, 0
.L0800861C: .4byte 0x00003C19
.L08008620: .4byte 0x00003C18
.L08008624: .4byte 0x00003417
.L08008628: .4byte 0x00003C17
.L0800862C:
	lsls r2, r4, #5
	adds r2, r5, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	ldr r1, .L0800865C  @ 0x00003017
	adds r0, r1, #0
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, .L08008660  @ 0x00003817
	adds r1, r3, #0
	strh r1, [r0]
	adds r3, #2
	adds r1, r3, #0
	strh r1, [r2, #2]
	ldr r2, .L08008664  @ 0x00003818
.L08008652:
	adds r1, r2, #0
	strh r1, [r0, #2]
.L08008656:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0800865C: .4byte 0x00003017
.L08008660: .4byte 0x00003817
.L08008664: .4byte 0x00003818

	THUMB_FUNC_END func_080084E0

	THUMB_FUNC_START func_08008668
func_08008668: @ 0x08008668
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r1
	str r2, [sp]
	adds r5, r3, #0
	ldr r4, [sp, #0x28]
	bl GetBgTilemap
	adds r7, r0, #0
	subs r5, #1
	subs r4, #1
	mov r0, r8
	adds r3, r0, r5
	cmp r8, r3
	bge .L080086C0
	ldr r1, .L08008780  @ 0x00003011
	mov r9, r1
	ldr r2, [sp]
	adds r0, r2, r4
	mov r6, r8
	lsls r1, r6, #1
	lsls r0, r0, #6
	adds r0, r0, r7
	adds r2, r1, r0
	ldr r6, [sp]
	lsls r0, r6, #6
	adds r0, r0, r7
	adds r1, r1, r0
	ldr r6, .L08008784  @ 0x00003811
	adds r0, r6, #0
	mov r6, r8
	subs r3, r3, r6
.L080086B0:
	mov r6, r9
	strh r6, [r1]
	strh r0, [r2]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne .L080086B0
.L080086C0:
	ldr r3, [sp]
	add r5, r8
	mov ip, r5
	lsls r0, r3, #5
	str r0, [sp, #4]
	adds r4, r4, r3
	mov r9, r4
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r3, r9
	bge .L08008704
	ldr r2, .L08008788  @ 0x00003012
	adds r6, r2, #0
	ldr r4, .L0800878C  @ 0x00003412
	adds r5, r4, #0
	lsls r0, r3, #6
	mov r2, ip
	lsls r1, r2, #1
	adds r1, r1, r7
	adds r2, r0, r1
	mov r4, r8
	lsls r1, r4, #1
	adds r1, r1, r7
	adds r0, r0, r1
	mov r1, r9
	subs r3, r1, r3
.L080086F6:
	strh r6, [r0]
	strh r5, [r2]
	adds r2, #0x40
	adds r0, #0x40
	subs r3, #1
	cmp r3, #0
	bne .L080086F6
.L08008704:
	mov r3, sl
	cmp r3, ip
	bge .L08008736
	mov r5, r9
	mov sl, ip
.L0800870E:
	ldr r2, [sp]
	adds r2, #1
	adds r4, r3, #1
	cmp r2, r5
	bge .L08008730
	ldr r0, .L08008790  @ 0x00003013
	adds r6, r0, #0
	lsls r1, r2, #6
	lsls r0, r3, #1
	adds r0, r0, r7
	adds r0, r1, r0
	subs r2, r5, r2
.L08008726:
	strh r6, [r0]
	adds r0, #0x40
	subs r2, #1
	cmp r2, #0
	bne .L08008726
.L08008730:
	adds r3, r4, #0
	cmp r3, sl
	blt .L0800870E
.L08008736:
	ldr r0, [sp, #4]
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r2, .L08008794  @ 0x00003010
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [sp, #4]
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, .L08008798  @ 0x00003410
	adds r1, r3, #0
	strh r1, [r0]
	mov r4, r9
	lsls r1, r4, #5
	mov r6, r8
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, .L0800879C  @ 0x00003810
	adds r2, r3, #0
	strh r2, [r0]
	add r1, ip
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r4, .L080087A0  @ 0x00003C10
	adds r0, r4, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08008780: .4byte 0x00003011
.L08008784: .4byte 0x00003811
.L08008788: .4byte 0x00003012
.L0800878C: .4byte 0x00003412
.L08008790: .4byte 0x00003013
.L08008794: .4byte 0x00003010
.L08008798: .4byte 0x00003410
.L0800879C: .4byte 0x00003810
.L080087A0: .4byte 0x00003C10

	THUMB_FUNC_END func_08008668

	THUMB_FUNC_START nullsub_74
nullsub_74: @ 0x080087A4
	bx lr

	THUMB_FUNC_END nullsub_74

	THUMB_FUNC_START func_080087A8
func_080087A8: @ 0x080087A8
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [r0, #0x58]
	movs r0, #0x80
	lsls r0, r0, #1
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08008802
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	ldr r1, .L08008808  @ gDispIo
	adds r2, r1, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
.L08008802:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08008808: .4byte gDispIo

	THUMB_FUNC_END func_080087A8

	THUMB_FUNC_START func_0800880C
func_0800880C: @ 0x0800880C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r2, r4, #0
	adds r2, #0x68
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r4, #0
	adds r3, #0x6a
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl func_080082A4
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800880C

	THUMB_FUNC_START func_08008840
func_08008840: @ 0x08008840
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x58]
	adds r3, #1
	str r3, [r5, #0x58]
	movs r1, #0x1e
	negs r1, r1
	movs r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r4, r0, #1
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #0x80
	lsls r0, r0, #1
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08008892
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #1
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
.L08008892:
	ldr r0, [r5, #0x58]
	cmp r0, #0xc
	bne .L0800889E
	adds r0, r5, #0
	bl Proc_Break
.L0800889E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08008840

	THUMB_FUNC_START func_080088A8
func_080088A8: @ 0x080088A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08008904  @ gUnknown_08591540
	bl SpawnProcLocking
	adds r4, r0, #0
	adds r0, r5, #0
	bl func_08008934
	adds r2, r4, #0
	adds r2, #0x64
	strh r0, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	movs r0, #8
	strh r0, [r1]
	ldr r3, .L08008908  @ gUnknown_0859133C
	ldr r0, [r3]
	ldrb r1, [r0, #0xe]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	movs r0, #6
	strh r0, [r1]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge .L080088E8
	movs r0, #0
	strh r0, [r2]
.L080088E8:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x1d
	ble .L080088F4
	movs r0, #0x1e
	strh r0, [r2]
.L080088F4:
	ldr r0, [r3]
	strb r5, [r0, #0xf]
	ldr r1, [r3]
	ldrb r0, [r1, #0xe]
	strb r0, [r1, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08008904: .4byte gUnknown_08591540
.L08008908: .4byte gUnknown_0859133C

	THUMB_FUNC_END func_080088A8

	THUMB_FUNC_START func_0800890C
func_0800890C: @ 0x0800890C
	push {lr}
	ldr r0, .L08008928  @ gUnknown_0859133C
	ldr r1, [r0]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	ldrb r2, [r1, #0x11]
	cmp r0, r2
	bne .L0800892C
	ldrb r0, [r1, #0x10]
	ldrb r1, [r1, #0xe]
	cmp r0, r1
	bne .L0800892C
	movs r0, #1
	b .L0800892E
	.align 2, 0
.L08008928: .4byte gUnknown_0859133C
.L0800892C:
	movs r0, #0
.L0800892E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0800890C

	THUMB_FUNC_START func_08008934
func_08008934: @ 0x08008934
	push {r4, lr}
	adds r4, r0, #0
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0800894E
	cmp r4, #2
	bgt .L0800894A
	movs r0, #4
	b .L08008956
.L0800894A:
	movs r0, #0x1a
	b .L08008956
.L0800894E:
	ldr r0, .L0800895C  @ gUnknown_08591570
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
.L08008956:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0800895C: .4byte gUnknown_08591570

	THUMB_FUNC_END func_08008934

	THUMB_FUNC_START func_08008960
func_08008960: @ 0x08008960
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L080089B0  @ gUnknown_080D7908
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r5, #0xff
	beq .L080089A6
	ldr r4, .L080089B4  @ gUnknown_0859133C
	ldr r0, [r4]
	lsls r5, r5, #2
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	bl GetFaceDisp
	movs r1, #0x39
	negs r1, r1
	ands r1, r0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	orrs r1, r6
	ldrb r2, [r2, #0x17]
	lsls r2, r2, #2
	add r2, sp
	ldr r2, [r2]
	orrs r1, r2
	bl SetFaceDisp
.L080089A6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080089B0: .4byte gUnknown_080D7908
.L080089B4: .4byte gUnknown_0859133C

	THUMB_FUNC_END func_08008960

	THUMB_FUNC_START func_080089B8
func_080089B8: @ 0x080089B8
	push {lr}
	movs r1, #0x10
	bl func_08008960
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080089B8

	THUMB_FUNC_START func_080089C4
func_080089C4: @ 0x080089C4
	push {lr}
	movs r1, #0
	bl func_08008960
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080089C4

	THUMB_FUNC_START DialogueExists
DialogueExists: @ 0x080089D0
	push {lr}
	ldr r0, .L080089E4  @ gUnknown_08591358
	bl FindProc
	cmp r0, #0
	beq .L080089DE
	movs r0, #1
.L080089DE:
	pop {r1}
	bx r1
	.align 2, 0
.L080089E4: .4byte gUnknown_08591358

	THUMB_FUNC_END DialogueExists

	THUMB_FUNC_START FaceExists
FaceExists: @ 0x080089E8
	push {lr}
	ldr r0, .L080089FC  @ ProcScr_Face
	bl FindProc
	cmp r0, #0
	beq .L080089F6
	movs r0, #1
.L080089F6:
	pop {r1}
	bx r1
	.align 2, 0
.L080089FC: .4byte ProcScr_Face

	THUMB_FUNC_END FaceExists

	THUMB_FUNC_START GetDialoguePromptResult
GetDialoguePromptResult: @ 0x08008A00
	ldr r0, .L08008A08  @ gTalkResult
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L08008A08: .4byte gTalkResult

	THUMB_FUNC_END GetDialoguePromptResult

	THUMB_FUNC_START SetDialoguePromptResult
SetDialoguePromptResult: @ 0x08008A0C
	adds r2, r0, #0
	ldr r1, .L08008A14  @ gTalkResult
	str r2, [r1]
	bx lr
	.align 2, 0
.L08008A14: .4byte gTalkResult

	THUMB_FUNC_END SetDialoguePromptResult

	THUMB_FUNC_START func_08008A18
func_08008A18: @ 0x08008A18
	ldr r1, .L08008A20  @ gUnknown_0859133C
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
.L08008A20: .4byte gUnknown_0859133C

	THUMB_FUNC_END func_08008A18

	THUMB_FUNC_START func_08008A24
func_08008A24: @ 0x08008A24
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08008A38  @ gUnknown_0859133C
	ldr r0, [r0]
	adds r0, #0x60
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
.L08008A38: .4byte gUnknown_0859133C

	THUMB_FUNC_END func_08008A24

	THUMB_FUNC_START func_08008A3C
func_08008A3C: @ 0x08008A3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	str r2, [sp]
	mov r9, r3
	movs r6, #0
	mov r7, sl
	adds r5, r2, #0
	b .L08008A62
.L08008A58:
	ldr r0, [r7]
	adds r1, r4, #0
	bl Text_DrawCharacter
	adds r4, r0, #0
.L08008A62:
	movs r0, #0
	mov r8, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08008A88
	cmp r0, #1
	bne .L08008A82
	ldm r7!, {r0}
	adds r1, r5, #0
	bl PutText
	adds r5, #0x80
	adds r6, #1
	adds r4, #1
	cmp r6, r9
	bge .L08008A98
.L08008A82:
	mov r2, r8
	cmp r2, #0
	beq .L08008A58
.L08008A88:
	lsls r0, r6, #2
	add r0, sl
	ldr r0, [r0]
	lsls r1, r6, #7
	ldr r2, [sp]
	adds r1, r2, r1
	bl PutText
.L08008A98:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08008A3C

	THUMB_FUNC_START func_08008AA8
func_08008AA8: @ 0x08008AA8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r0, .L08008B14  @ gUnknown_085915AA
	mov ip, r0
	movs r3, #0x52
	adds r3, r3, r7
	mov r9, r3
	ldrh r0, [r3]
	ldr r6, .L08008B18  @ 0x000003FF
	adds r4, r6, #0
	ands r4, r0
	adds r0, r7, #0
	adds r0, #0x64
	ldrh r0, [r0]
	mov r8, r0
	movs r5, #0xf
	adds r0, r5, #0
	mov r3, r8
	ands r0, r3
	lsls r0, r0, #0xc
	orrs r4, r0
	str r4, [sp]
	movs r0, #3
	mov r3, ip
	bl PutSprite
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, .L08008B1C  @ gUnknown_08591590
	mov r4, r9
	ldrh r0, [r4]
	ands r6, r0
	ldr r0, .L08008B20  @ gTalkFont
	ldrh r0, [r0, #0x14]
	ands r5, r0
	lsls r5, r5, #0xc
	orrs r6, r5
	str r6, [sp]
	movs r0, #3
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08008B14: .4byte gUnknown_085915AA
.L08008B18: .4byte 0x000003FF
.L08008B1C: .4byte gUnknown_08591590
.L08008B20: .4byte gTalkFont

	THUMB_FUNC_END func_08008AA8

	THUMB_FUNC_START func_08008B24
func_08008B24: @ 0x08008B24
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08008B24

	THUMB_FUNC_START func_08008B30
func_08008B30: @ 0x08008B30
	push {lr}
	ldr r0, .L08008B40  @ func_08008B24
	movs r1, #1
	bl SetupFutureCall2
	pop {r0}
	bx r0
	.align 2, 0
.L08008B40: .4byte func_08008B24

	THUMB_FUNC_END func_08008B30

	THUMB_FUNC_START GetStrTalkLen
GetStrTalkLen: @ 0x08008B44
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r0, .L08008B78  @ gUnknown_0859133C
	ldr r0, [r0]
	movs r1, #0xf
	ldrsb r1, [r0, r1]
	mov r9, r1
	ldrb r5, [r0, #0x11]
	movs r6, #0
	movs r7, #0x18
.L08008B66:
	ldrb r0, [r4]
	cmp r0, #0x81
	bls .L08008B6E
	b .L08008EE0
.L08008B6E:
	lsls r0, r0, #2
	ldr r1, .L08008B7C  @ .L08008B80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08008B78: .4byte gUnknown_0859133C
.L08008B7C: .4byte .L08008B80
.L08008B80: @ jump table
	.4byte .L08008D88 @ case 0
	.4byte .L08008D92 @ case 1
	.4byte .L08008D92 @ case 2
	.4byte .L08008D9E @ case 3
	.4byte .L08008D9A @ case 4
	.4byte .L08008D9A @ case 5
	.4byte .L08008D9A @ case 6
	.4byte .L08008D9A @ case 7
	.4byte .L08008DA2 @ case 8
	.4byte .L08008DA2 @ case 9
	.4byte .L08008DA2 @ case 10
	.4byte .L08008DA2 @ case 11
	.4byte .L08008DA2 @ case 12
	.4byte .L08008DA2 @ case 13
	.4byte .L08008DA2 @ case 14
	.4byte .L08008DA2 @ case 15
	.4byte .L08008DAA @ case 16
	.4byte .L08008DC8 @ case 17
	.4byte .L08008DCE @ case 18
	.4byte .L08008DCE @ case 19
	.4byte .L08008DCE @ case 20
	.4byte .L08008D88 @ case 21
	.4byte .L08008D9A @ case 22
	.4byte .L08008D9A @ case 23
	.4byte .L08008DD6 @ case 24
	.4byte .L08008DD6 @ case 25
	.4byte .L08008DD6 @ case 26
	.4byte .L08008DD6 @ case 27
	.4byte .L08008D9A @ case 28
	.4byte .L08008D9A @ case 29
	.4byte .L08008EE0 @ case 30
	.4byte .L08008EE0 @ case 31
	.4byte .L08008EE0 @ case 32
	.4byte .L08008EE0 @ case 33
	.4byte .L08008EE0 @ case 34
	.4byte .L08008EE0 @ case 35
	.4byte .L08008EE0 @ case 36
	.4byte .L08008EE0 @ case 37
	.4byte .L08008EE0 @ case 38
	.4byte .L08008EE0 @ case 39
	.4byte .L08008EE0 @ case 40
	.4byte .L08008EE0 @ case 41
	.4byte .L08008EE0 @ case 42
	.4byte .L08008EE0 @ case 43
	.4byte .L08008EE0 @ case 44
	.4byte .L08008EE0 @ case 45
	.4byte .L08008EE0 @ case 46
	.4byte .L08008EE0 @ case 47
	.4byte .L08008EE0 @ case 48
	.4byte .L08008EE0 @ case 49
	.4byte .L08008EE0 @ case 50
	.4byte .L08008EE0 @ case 51
	.4byte .L08008EE0 @ case 52
	.4byte .L08008EE0 @ case 53
	.4byte .L08008EE0 @ case 54
	.4byte .L08008EE0 @ case 55
	.4byte .L08008EE0 @ case 56
	.4byte .L08008EE0 @ case 57
	.4byte .L08008EE0 @ case 58
	.4byte .L08008EE0 @ case 59
	.4byte .L08008EE0 @ case 60
	.4byte .L08008EE0 @ case 61
	.4byte .L08008EE0 @ case 62
	.4byte .L08008EE0 @ case 63
	.4byte .L08008EE0 @ case 64
	.4byte .L08008EE0 @ case 65
	.4byte .L08008EE0 @ case 66
	.4byte .L08008EE0 @ case 67
	.4byte .L08008EE0 @ case 68
	.4byte .L08008EE0 @ case 69
	.4byte .L08008EE0 @ case 70
	.4byte .L08008EE0 @ case 71
	.4byte .L08008EE0 @ case 72
	.4byte .L08008EE0 @ case 73
	.4byte .L08008EE0 @ case 74
	.4byte .L08008EE0 @ case 75
	.4byte .L08008EE0 @ case 76
	.4byte .L08008EE0 @ case 77
	.4byte .L08008EE0 @ case 78
	.4byte .L08008EE0 @ case 79
	.4byte .L08008EE0 @ case 80
	.4byte .L08008EE0 @ case 81
	.4byte .L08008EE0 @ case 82
	.4byte .L08008EE0 @ case 83
	.4byte .L08008EE0 @ case 84
	.4byte .L08008EE0 @ case 85
	.4byte .L08008EE0 @ case 86
	.4byte .L08008EE0 @ case 87
	.4byte .L08008EE0 @ case 88
	.4byte .L08008EE0 @ case 89
	.4byte .L08008EE0 @ case 90
	.4byte .L08008EE0 @ case 91
	.4byte .L08008EE0 @ case 92
	.4byte .L08008EE0 @ case 93
	.4byte .L08008EE0 @ case 94
	.4byte .L08008EE0 @ case 95
	.4byte .L08008EE0 @ case 96
	.4byte .L08008EE0 @ case 97
	.4byte .L08008EE0 @ case 98
	.4byte .L08008EE0 @ case 99
	.4byte .L08008EE0 @ case 100
	.4byte .L08008EE0 @ case 101
	.4byte .L08008EE0 @ case 102
	.4byte .L08008EE0 @ case 103
	.4byte .L08008EE0 @ case 104
	.4byte .L08008EE0 @ case 105
	.4byte .L08008EE0 @ case 106
	.4byte .L08008EE0 @ case 107
	.4byte .L08008EE0 @ case 108
	.4byte .L08008EE0 @ case 109
	.4byte .L08008EE0 @ case 110
	.4byte .L08008EE0 @ case 111
	.4byte .L08008EE0 @ case 112
	.4byte .L08008EE0 @ case 113
	.4byte .L08008EE0 @ case 114
	.4byte .L08008EE0 @ case 115
	.4byte .L08008EE0 @ case 116
	.4byte .L08008EE0 @ case 117
	.4byte .L08008EE0 @ case 118
	.4byte .L08008EE0 @ case 119
	.4byte .L08008EE0 @ case 120
	.4byte .L08008EE0 @ case 121
	.4byte .L08008EE0 @ case 122
	.4byte .L08008EE0 @ case 123
	.4byte .L08008EE0 @ case 124
	.4byte .L08008EE0 @ case 125
	.4byte .L08008EE0 @ case 126
	.4byte .L08008EE0 @ case 127
	.4byte .L08008DDA @ case 128
	.4byte .L08008ED4 @ case 129
.L08008D88:
	cmp r6, r7
	bgt .L08008D8E
	b .L08008F06
.L08008D8E:
	adds r7, r6, #0
	b .L08008F06
.L08008D92:
	cmp r6, r7
	ble .L08008D98
	adds r7, r6, #0
.L08008D98:
	movs r6, #0
.L08008D9A:
	adds r4, #1
	b .L08008B66
.L08008D9E:
	adds r6, #0xc
	b .L08008D9A
.L08008DA2:
	ldrb r0, [r4]
	adds r5, r0, #0
	subs r5, #8
	b .L08008D9A
.L08008DAA:
	ldrb r0, [r4]
	cmp r0, #8
	bge .L08008DB2
	b .L08008B66
.L08008DB2:
	cmp r0, #0xf
	ble .L08008DBC
	cmp r0, #0x10
	beq .L08008DC4
	b .L08008B66
.L08008DBC:
	adds r5, r0, #0
	subs r5, #8
	adds r4, #1
	b .L08008DAA
.L08008DC4:
	adds r4, #3
	b .L08008DAA
.L08008DC8:
	cmp r5, r9
	beq .L08008D88
	b .L08008D9A
.L08008DCE:
	mov r2, r8
	cmp r2, #0
	beq .L08008D88
	b .L08008D9A
.L08008DD6:
	adds r6, #0x80
	b .L08008D9A
.L08008DDA:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0x25
	bls .L08008DE4
	b .L08008B66
.L08008DE4:
	lsls r0, r0, #2
	ldr r1, .L08008DF0  @ .L08008DF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08008DF0: .4byte .L08008DF4
.L08008DF4: @ jump table
	.4byte .L08008D9A @ case 0
	.4byte .L08008D9A @ case 1
	.4byte .L08008D9A @ case 2
	.4byte .L08008D9A @ case 3
	.4byte .L08008D9A @ case 4
	.4byte .L08008E8C @ case 5
	.4byte .L08008EB2 @ case 6
	.4byte .L08008D9A @ case 7
	.4byte .L08008D9A @ case 8
	.4byte .L08008D9A @ case 9
	.4byte .L08008ECC @ case 10
	.4byte .L08008ECC @ case 11
	.4byte .L08008ECC @ case 12
	.4byte .L08008ECC @ case 13
	.4byte .L08008ECC @ case 14
	.4byte .L08008ECC @ case 15
	.4byte .L08008ECC @ case 16
	.4byte .L08008ECC @ case 17
	.4byte .L08008B66 @ case 18
	.4byte .L08008B66 @ case 19
	.4byte .L08008B66 @ case 20
	.4byte .L08008B66 @ case 21
	.4byte .L08008D9A @ case 22
	.4byte .L08008D9A @ case 23
	.4byte .L08008D9A @ case 24
	.4byte .L08008D9A @ case 25
	.4byte .L08008D9A @ case 26
	.4byte .L08008D9A @ case 27
	.4byte .L08008D9A @ case 28
	.4byte .L08008D9A @ case 29
	.4byte .L08008D9A @ case 30
	.4byte .L08008D9A @ case 31
	.4byte .L08008EA8 @ case 32
	.4byte .L08008D9A @ case 33
	.4byte .L08008B66 @ case 34
	.4byte .L08008B66 @ case 35
	.4byte .L08008D9A @ case 36
	.4byte .L08008D9A @ case 37
.L08008E8C:
	ldr r0, .L08008EA4  @ gUnknown_0859133C
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	mov r1, sp
	bl func_08014270
	mov r0, r8
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sp
	b .L08008EBE
	.align 2, 0
.L08008EA4: .4byte gUnknown_0859133C
.L08008EA8:
	bl GetTacticianName
	bl GetStringTextLen
	b .L08008EC2
.L08008EB2:
	ldr r0, .L08008EC8  @ gUnknown_0859133C
	ldr r0, [r0]
	adds r0, #0x60
	mov r2, r8
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
.L08008EBE:
	bl GetStrTalkLen
.L08008EC2:
	adds r6, r6, r0
	b .L08008D9A
	.align 2, 0
.L08008EC8: .4byte gUnknown_0859133C
.L08008ECC:
	ldrb r0, [r4]
	adds r5, r0, #0
	subs r5, #0xa
	b .L08008D9A
.L08008ED4:
	ldrb r0, [r4, #1]
	cmp r0, #0x40
	bne .L08008EE0
	adds r4, #2
	adds r6, #6
	b .L08008B66
.L08008EE0:
	cmp r5, r9
	beq .L08008EF6
	cmp r5, #0xff
	beq .L08008EF6
	mov r0, r8
	cmp r0, #0
	beq .L08008EF0
	b .L08008D88
.L08008EF0:
	movs r1, #1
	mov r8, r1
	mov r9, r5
.L08008EF6:
	add r1, sp, #0x20
	adds r0, r4, #0
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	adds r6, r6, r0
	b .L08008B66
.L08008F06:
	adds r0, r7, #0
	add sp, #0x24
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetStrTalkLen

	THUMB_FUNC_START GetZero
GetZero: @ 0x08008F18
	movs r0, #0
	bx lr

	THUMB_FUNC_END GetZero

	THUMB_FUNC_START func_08008F1C
func_08008F1C: @ 0x08008F1C
	bx lr

	THUMB_FUNC_END func_08008F1C

	THUMB_FUNC_START DialogueEnableBgSyncByMask
DialogueEnableBgSyncByMask: @ 0x08008F20
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl CheckDialogueFlag
	cmp r0, #0
	bne .L08008F34
	adds r0, r4, #0
	bl EnableBgSync
.L08008F34:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END DialogueEnableBgSyncByMask

	THUMB_FUNC_START func_08008F3C
func_08008F3C: @ 0x08008F3C
	push {lr}
	ldr r0, .L08008F50  @ gUnknown_08591624
	bl FindProc
	adds r1, r0, #0
	cmp r1, #0
	beq .L08008F4C
	movs r0, #1
.L08008F4C:
	pop {r1}
	bx r1
	.align 2, 0
.L08008F50: .4byte gUnknown_08591624

	THUMB_FUNC_END func_08008F3C

	THUMB_FUNC_START func_08008F54
func_08008F54: @ 0x08008F54
	push {lr}
	ldr r0, .L08008F60  @ gUnknown_08591624
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08008F60: .4byte gUnknown_08591624

	THUMB_FUNC_END func_08008F54

	THUMB_FUNC_START func_08008F64
func_08008F64: @ 0x08008F64
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, .L08008F9C  @ gUnknown_08591624
	movs r1, #0
	bl SpawnProc
	ldr r1, .L08008FA0  @ 0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, .L08008FA4  @ 0x06010000
	adds r1, r1, r2
	str r1, [r0, #0x4c]
	str r5, [r0, #0x54]
	str r6, [r0, #0x58]
	ldr r0, .L08008FA8  @ gUnknown_0859160C
	mov r1, r8
	bl SpawnProcLocking
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08008F9C: .4byte gUnknown_08591624
.L08008FA0: .4byte 0x000003FF
.L08008FA4: .4byte 0x06010000
.L08008FA8: .4byte gUnknown_0859160C

	THUMB_FUNC_END func_08008F64

	THUMB_FUNC_START func_08008FAC
func_08008FAC: @ 0x08008FAC
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_08008FAC

	THUMB_FUNC_START func_08008FB4
func_08008FB4: @ 0x08008FB4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, [r3, #0x4c]
	movs r1, #0
	b .L08009010
.L08008FBE:
	movs r2, #0
	lsls r0, r1, #2
	adds r5, r1, #0
	adds r5, #8
	adds r4, r0, r6
.L08008FC8:
	lsls r0, r2, #2
	adds r1, r0, r4
	ldr r0, [r1, #4]
	str r0, [r1]
	ldr r0, [r1, #8]
	str r0, [r1, #4]
	ldr r0, [r1, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #0x10]
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldr r0, .L08008FF8  @ 0x000002FF
	cmp r2, r0
	bgt .L08008FFC
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r1, r7
	ldr r0, [r0]
	b .L08008FFE
	.align 2, 0
.L08008FF8: .4byte 0x000002FF
.L08008FFC:
	ldr r0, [r3, #0x58]
.L08008FFE:
	str r0, [r1, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble .L08008FC8
	adds r1, r5, #0
.L08009010:
	ldr r0, [r3, #0x54]
	lsls r0, r0, #3
	cmp r1, r0
	blt .L08008FBE
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble .L08009030
	adds r0, r3, #0
	bl Proc_Break
.L08009030:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08008FB4

	THUMB_FUNC_START nullsub_15
nullsub_15: @ 0x08009038
	bx lr

	THUMB_FUNC_END nullsub_15

	THUMB_FUNC_START func_0800903C
func_0800903C: @ 0x0800903C
	push {lr}
	movs r1, #0
	str r1, [r0, #0x3c]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800903C

	THUMB_FUNC_START func_0800904C
func_0800904C: @ 0x0800904C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	adds r2, r1, r0
	str r2, [r4, #0x3c]
	cmp r2, #0xff
	bgt .L08009088
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r2
	lsls r3, r0, #8
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r0, r3, r0
	cmp r0, #0
	bge .L08009070
	adds r0, #0xff
.L08009070:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r1, r3, r0
	cmp r1, #0
	bge .L0800907E
	adds r1, #0xff
.L0800907E:
	asrs r1, r1, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r3, r0
	b .L080090B8
.L08009088:
	movs r0, #0x80
	lsls r0, r0, #2
	subs r3, r0, r2
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r5, .L080090E8  @ 0xFFFFFF00
	adds r0, r2, r5
	lsls r2, r0, #8
	adds r0, r1, r2
	cmp r0, #0
	bge .L080090A2
	adds r0, #0xff
.L080090A2:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r3, r0
	adds r0, r0, r2
	cmp r0, #0
	bge .L080090B0
	adds r0, #0xff
.L080090B0:
	asrs r1, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r3, r0
	adds r0, r0, r2
.L080090B8:
	cmp r0, #0
	bge .L080090BE
	adds r0, #0xff
.L080090BE:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne .L080090EC
	ldr r0, [r4, #0x2c]
	subs r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #0
	bgt .L080090F8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	bl Proc_Break
	b .L080090F8
	.align 2, 0
.L080090E8: .4byte 0xFFFFFF00
.L080090EC:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne .L080090F8
	movs r0, #0
	str r0, [r4, #0x3c]
.L080090F8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800904C

	THUMB_FUNC_START func_08009100
func_08009100: @ 0x08009100
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x38]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r2, r7, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	lsls r1, r1, #8
	adds r0, r0, r1
	cmp r0, #0
	bge .L08009120
	adds r0, #0xff
.L08009120:
	asrs r6, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge .L0800912E
	adds r0, #0xff
.L0800912E:
	asrs r5, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge .L0800913C
	adds r0, #0xff
.L0800913C:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne .L08009154
	adds r0, r4, #0
	bl Proc_Break
.L08009154:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009100

	THUMB_FUNC_START func_0800915C
func_0800915C: @ 0x0800915C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, .L08009194  @ gUnknown_0859163C
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08009194: .4byte gUnknown_0859163C

	THUMB_FUNC_END func_0800915C

	THUMB_FUNC_START func_08009198
func_08009198: @ 0x08009198
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	mov r8, r0
	ldr r1, .L080091F8  @ gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	mov r5, r8
	ldr r3, [r5, #0x2c]
	subs r3, r3, r0
	adds r3, #8
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	ldr r4, [r5, #0x30]
	subs r4, r4, r0
	adds r4, #8
	ldr r6, [r5, #0x38]
	ldr r0, [r6, #4]
	ldr r1, [r6]
	ldr r2, [r6, #8]
	ldr r5, .L080091FC  @ 0x000001FF
	ands r3, r5
	movs r5, #0xff
	ands r4, r5
	ldrh r5, [r6, #0xc]
	adds r4, r4, r5
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldrb r4, [r6, #0x10]
	str r4, [sp, #8]
	ldrb r4, [r6, #0x11]
	str r4, [sp, #0xc]
	ldrh r4, [r6, #0xe]
	str r4, [sp, #0x10]
	movs r4, #4
	str r4, [sp, #0x14]
	bl func_080AE9B0
	mov r1, r8
	str r0, [r1, #0x34]
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080091F8: .4byte gBmSt
.L080091FC: .4byte 0x000001FF

	THUMB_FUNC_END func_08009198

	THUMB_FUNC_START func_08009200
func_08009200: @ 0x08009200
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x34]
	ldr r5, [r6]
	cmp r5, #0
	beq .L08009240
	ldr r2, .L08009238  @ gBmSt
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	ldr r1, [r4, #0x2c]
	subs r1, r1, r0
	adds r1, #8
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	ldr r2, [r4, #0x30]
	subs r2, r2, r0
	adds r2, #8
	ldr r0, .L0800923C  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	bl SetSpriteAnimProcParameters
	b .L08009248
	.align 2, 0
.L08009238: .4byte gBmSt
.L0800923C: .4byte 0x000001FF
.L08009240:
	adds r0, r4, #0
	bl Proc_Break
	str r5, [r4, #0x34]
.L08009248:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009200

	THUMB_FUNC_START func_08009250
func_08009250: @ 0x08009250
	push {lr}
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq .L0800925C
	bl EndSpriteAnimProc
.L0800925C:
	pop {r0}
	bx r0
	
	
		THUMB_FUNC_END func_08009250
