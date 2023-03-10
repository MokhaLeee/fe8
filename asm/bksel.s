	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Battle forecast window

	THUMB_FUNC_START func_080364D8
func_080364D8: @ 0x080364D8
	push {lr}
	ldr r0, .L080364F4  @ gBattleUnitB
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, .L080364F8  @ gBmSt
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	cmp r0, #0x6f
	bgt .L080364FC
	movs r0, #1
	b .L08036508
	.align 2, 0
.L080364F4: .4byte gBattleUnitB
.L080364F8: .4byte gBmSt
.L080364FC:
	cmp r0, #0x70
	bgt .L08036504
	movs r0, #0
	b .L08036508
.L08036504:
	movs r0, #1
	negs r0, r0
.L08036508:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080364D8

	THUMB_FUNC_START func_0803650C
func_0803650C: @ 0x0803650C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	movs r1, #3
	bl ApplyIconPalette
	movs r1, #1
	ldr r0, .L0803658C  @ gPal
	mov r9, r0
	movs r2, #0x1f
	mov ip, r2
	ldr r0, .L08036590  @ gUnknown_0200300C
	mov r8, r0
.L0803652A:
	adds r0, r1, #0
	adds r0, #0x30
	lsls r0, r0, #1
	add r0, r9
	ldrh r0, [r0]
	adds r4, r0, #0
	mov r2, ip
	ands r4, r2
	asrs r3, r0, #5
	ands r3, r2
	asrs r2, r0, #0xa
	mov r0, ip
	ands r2, r0
	lsls r0, r1, #1
	adds r7, r1, #1
	mov r1, r8
	adds r5, r0, r1
	movs r6, #7
.L0803654E:
	lsls r0, r2, #0xa
	lsls r1, r3, #5
	adds r0, r0, r1
	adds r0, r0, r4
	strh r0, [r5]
	adds r4, #3
	cmp r4, #0x1f
	ble .L08036560
	movs r4, #0x1f
.L08036560:
	adds r3, #3
	cmp r3, #0x1f
	ble .L08036568
	movs r3, #0x1f
.L08036568:
	adds r2, #3
	cmp r2, #0x1f
	ble .L08036570
	movs r2, #0x1f
.L08036570:
	adds r5, #0x20
	subs r6, #1
	cmp r6, #0
	bge .L0803654E
	adds r1, r7, #0
	cmp r1, #0xf
	ble .L0803652A
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0803658C: .4byte gPal
.L08036590: .4byte gUnknown_0200300C

	THUMB_FUNC_END func_0803650C

	THUMB_FUNC_START BattleForecase_SetupLabelText
BattleForecase_SetupLabelText: @ 0x08036594
	push {r4, r5, r6, r7, lr}
	movs r7, #0
.L08036598:
	lsls r5, r7, #3
	ldr r0, .L080365DC  @ gUnknown_02002FDC
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #4
	bl InitText
	ldr r1, .L080365E0  @ gUnknown_080D7FB0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r6, [r0]
	adds r0, r6, #0
	bl GetMsg
	adds r1, r0, #0
	movs r0, #0x20
	bl GetStringTextCenteredPos
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r7, #1
	cmp r7, #5
	ble .L08036598
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080365DC: .4byte gUnknown_02002FDC
.L080365E0: .4byte gUnknown_080D7FB0

	THUMB_FUNC_END BattleForecase_SetupLabelText

	THUMB_FUNC_START DrawUnitNameForBattleForecast
DrawUnitNameForBattleForecast: @ 0x080365E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r6, r1, #0
	ldr r0, [r2]
	ldrh r0, [r0]
	bl GetMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r0, r6, #0
	bl ClearText
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	adds r3, r5, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END DrawUnitNameForBattleForecast

	THUMB_FUNC_START func_08036628
func_08036628: @ 0x08036628
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r6, r1, #0
	adds r0, r2, #0
	bl GetItemName
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r0, r6, #0
	bl ClearText
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	adds r3, r5, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08036628

	THUMB_FUNC_START AddWeaponStatsAfterRound
AddWeaponStatsAfterRound: @ 0x0803666C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	cmp r0, #0
	ble .L0803669A
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	ldr r0, [r4, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0803669A
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
.L0803669A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END AddWeaponStatsAfterRound

	THUMB_FUNC_START BKSEL_SetupHitAndSuchStats
BKSEL_SetupHitAndSuchStats: @ 0x080366A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r7, .L08036810  @ gBattleUnitA
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemUses
	str r0, [sp, #8]
	ldr r0, .L08036814  @ gBattleUnitB
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemUses
	str r0, [sp, #0xc]
	add r1, sp, #4
	mov r0, sp
	bl BattleGetFollowUpOrder
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0x50
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne .L080366F8
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803676E
.L080366F8:
	add r6, sp, #8
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl AddWeaponStatsAfterRound
	mov r0, r8
	cmp r0, #0
	beq .L08036718
	ldr r0, [sp]
	cmp r0, r7
	bne .L08036718
	adds r1, r4, #0
	adds r2, r6, #0
	bl AddWeaponStatsAfterRound
.L08036718:
	ldr r4, .L08036810  @ gBattleUnitA
	ldr r6, .L08036814  @ gBattleUnitB
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsUnitEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08036732
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
.L08036732:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r1, r6, #0
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803674C
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
.L0803674C:
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L0803676E
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803676E
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
.L0803676E:
	adds r4, r5, #0
	adds r4, #0x51
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x53
	strb r0, [r1]
	ldr r5, .L08036814  @ gBattleUnitB
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	bne .L08036798
	adds r0, r5, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08036802
.L08036798:
	add r6, sp, #0xc
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl AddWeaponStatsAfterRound
	mov r0, r8
	cmp r0, #0
	beq .L080367B8
	ldr r0, [sp]
	cmp r0, r5
	bne .L080367B8
	adds r1, r4, #0
	adds r2, r6, #0
	bl AddWeaponStatsAfterRound
.L080367B8:
	ldr r4, .L08036814  @ gBattleUnitB
	ldr r5, .L08036810  @ gBattleUnitA
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsUnitEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080367CE
	movs r0, #1
	strb r0, [r7]
.L080367CE:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r1, r5, #0
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080367E4
	movs r0, #1
	strb r0, [r7]
.L080367E4:
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L08036802
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L08036802
	movs r0, #1
	strb r0, [r7]
.L08036802:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08036810: .4byte gBattleUnitA
.L08036814: .4byte gBattleUnitB

	THUMB_FUNC_END BKSEL_SetupHitAndSuchStats

	THUMB_FUNC_START BKSEL_DrawStandard
BKSEL_DrawStandard: @ 0x08036818
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, .L0803689C  @ gUnknown_0200422C
	ldr r1, .L080368A0  @ gUnknown_085A09A8
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r4, .L080368A4  @ gBmFrameTmap0
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xf
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r4, #0
	adds r0, #0x46
	adds r5, r6, #0
	adds r5, #0x38
	ldr r2, .L080368A8  @ gBattleUnitA
	adds r1, r5, #0
	bl DrawUnitNameForBattleForecast
	ldr r1, .L080368AC  @ 0x000002C2
	adds r0, r4, r1
	ldr r7, .L080368B0  @ gBattleUnitB
	adds r1, r5, #0
	adds r2, r7, #0
	bl DrawUnitNameForBattleForecast
	ldr r2, .L080368B4  @ 0x00000342
	adds r4, r4, r2
	adds r6, #0x48
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_08036628
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne .L080368B8
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080368B8
	movs r3, #1
	negs r3, r3
	mov r8, r3
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r2, r7, #0
	b .L080368D6
	.align 2, 0
.L0803689C: .4byte gUnknown_0200422C
.L080368A0: .4byte gUnknown_085A09A8
.L080368A4: .4byte gBmFrameTmap0
.L080368A8: .4byte gBattleUnitA
.L080368AC: .4byte 0x000002C2
.L080368B0: .4byte gBattleUnitB
.L080368B4: .4byte 0x00000342
.L080368B8:
	ldr r2, .L080368EC  @ gBattleUnitB
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, .L080368F0  @ gBattleUnitA
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	mov r8, r1
	cmp r1, #0
	bge .L080368D6
	movs r0, #0
	mov r8, r0
.L080368D6:
	adds r2, #0x72
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x63
	ble .L080368F8
	ldr r0, .L080368F4  @ gUnknown_02003DF0
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b .L08036906
	.align 2, 0
.L080368EC: .4byte gBattleUnitB
.L080368F0: .4byte gBattleUnitA
.L080368F4: .4byte gUnknown_02003DF0
.L080368F8:
	ldr r0, .L080369A0  @ gUnknown_02003DF0
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #2
	bl PutNumberTwoChr
.L08036906:
	ldr r7, .L080369A4  @ gUnknown_02003E70
	adds r0, r7, #0
	movs r1, #2
	mov r2, r8
	bl PutNumberTwoChr
	adds r0, r7, #0
	adds r0, #0x80
	ldr r4, .L080369A8  @ gBattleUnitB
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	ldr r5, .L080369AC  @ gBattleUnitA
	adds r0, r5, #0
	adds r0, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	mov r8, r1
	adds r6, r5, #0
	adds r6, #0x48
	ldrh r0, [r6]
	bl GetItemIid
	cmp r0, #0xb5
	bne .L08036962
	movs r0, #0xff
	mov r8, r0
.L08036962:
	mov r1, r8
	cmp r1, #0
	bge .L0803696C
	movs r2, #0
	mov r8, r2
.L0803696C:
	adds r0, r5, #0
	adds r0, #0x6a
	movs r3, #0
	ldrsh r4, [r0, r3]
	ldrh r0, [r6]
	bl GetItemIid
	cmp r0, #0xb5
	bne .L08036980
	movs r4, #0xff
.L08036980:
	cmp r4, #0
	bge .L08036986
	movs r4, #0
.L08036986:
	adds r1, r5, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble .L080369B0
	adds r0, r7, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b .L080369BE
	.align 2, 0
.L080369A0: .4byte gUnknown_02003DF0
.L080369A4: .4byte gUnknown_02003E70
.L080369A8: .4byte gBattleUnitB
.L080369AC: .4byte gBattleUnitA
.L080369B0:
	adds r0, r7, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberTwoChr
.L080369BE:
	ldr r6, .L08036A5C  @ gUnknown_02003E7C
	adds r0, r6, #0
	movs r1, #2
	mov r2, r8
	bl PutNumberTwoChr
	adds r0, r6, #0
	adds r0, #0x80
	ldr r5, .L08036A60  @ gBattleUnitA
	adds r1, r5, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #2
	adds r2, r4, #0
	bl PutNumberTwoChr
	adds r0, r6, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, .L08036A64  @ gUnknown_02002FDC
	adds r1, r6, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl PutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r6, #0
	adds r1, #0x76
	bl PutText
	adds r4, #0x10
	adds r1, r6, #0
	adds r1, #0xf6
	adds r0, r4, #0
	bl PutText
	movs r2, #0xbf
	lsls r2, r2, #1
	adds r4, r6, r2
	ldr r0, .L08036A68  @ gBattleUnitB
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r3, .L08036A6C  @ 0xFFFFFEF2
	adds r4, r6, r3
	adds r5, #0x4a
	ldrh r0, [r5]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl PutIcon
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08036A5C: .4byte gUnknown_02003E7C
.L08036A60: .4byte gBattleUnitA
.L08036A64: .4byte gUnknown_02002FDC
.L08036A68: .4byte gBattleUnitB
.L08036A6C: .4byte 0xFFFFFEF2

	THUMB_FUNC_END BKSEL_DrawStandard

	THUMB_FUNC_START BKSEL_DrawDetailed
BKSEL_DrawDetailed: @ 0x08036A70
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, .L08036B04  @ gUnknown_0200422C
	ldr r1, .L08036B08  @ gUnknown_085A0AEC
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r4, .L08036B0C  @ gBmFrameTmap0
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x13
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r4, #0
	adds r0, #0x46
	adds r5, r6, #0
	adds r5, #0x38
	ldr r2, .L08036B10  @ gBattleUnitA
	adds r1, r5, #0
	bl DrawUnitNameForBattleForecast
	ldr r1, .L08036B14  @ 0x000003C2
	adds r0, r4, r1
	ldr r7, .L08036B18  @ gBattleUnitB
	adds r1, r5, #0
	adds r2, r7, #0
	bl DrawUnitNameForBattleForecast
	ldr r2, .L08036B1C  @ 0x00000442
	adds r4, r4, r2
	adds r6, #0x48
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl func_08036628
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne .L08036AE8
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08036AE8
	adds r1, r7, #0
	adds r1, #0x5a
	movs r0, #0xff
	strh r0, [r1]
	adds r1, #0xa
	strh r0, [r1]
	adds r1, #6
	strh r0, [r1]
.L08036AE8:
	ldr r0, .L08036B18  @ gBattleUnitB
	adds r1, r0, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble .L08036B24
	ldr r0, .L08036B20  @ gUnknown_02003DF0
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b .L08036B30
	.align 2, 0
.L08036B04: .4byte gUnknown_0200422C
.L08036B08: .4byte gUnknown_085A0AEC
.L08036B0C: .4byte gBmFrameTmap0
.L08036B10: .4byte gBattleUnitA
.L08036B14: .4byte 0x000003C2
.L08036B18: .4byte gBattleUnitB
.L08036B1C: .4byte 0x00000442
.L08036B20: .4byte gUnknown_02003DF0
.L08036B24:
	ldr r0, .L08036BB0  @ gUnknown_02003DF0
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberTwoChr
.L08036B30:
	ldr r5, .L08036BB4  @ gUnknown_02003E70
	ldr r4, .L08036BB8  @ gBattleUnitB
	adds r0, r4, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	ldr r0, .L08036BBC  @ gBattleUnitA
	adds r1, r0, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble .L08036BC0
	adds r0, r5, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl PutNumberTwoChr
	b .L08036BCE
	.align 2, 0
.L08036BB0: .4byte gUnknown_02003DF0
.L08036BB4: .4byte gUnknown_02003E70
.L08036BB8: .4byte gBattleUnitB
.L08036BBC: .4byte gBattleUnitA
.L08036BC0:
	adds r0, r5, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberTwoChr
.L08036BCE:
	ldr r5, .L08036CB8  @ gUnknown_02003E7C
	ldr r6, .L08036CBC  @ gBattleUnitA
	adds r0, r6, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r5, #0
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r6, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl PutNumberTwoChr
	adds r0, r5, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, .L08036CC0  @ gUnknown_02002FF4
	adds r1, r5, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl PutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	adds r1, #0x76
	bl PutText
	adds r0, r4, #0
	subs r0, #0x10
	adds r1, r5, #0
	adds r1, #0xf6
	bl PutText
	adds r0, r4, #0
	subs r0, #8
	movs r2, #0xbb
	lsls r2, r2, #1
	adds r1, r5, r2
	bl PutText
	adds r0, r4, #0
	adds r0, #0x10
	movs r3, #0xfb
	lsls r3, r3, #1
	adds r1, r5, r3
	bl PutText
	ldr r0, .L08036CC4  @ 0x0000027E
	adds r4, r5, r0
	ldr r0, .L08036CC8  @ gBattleUnitB
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r1, .L08036CCC  @ 0xFFFFFEF2
	adds r4, r5, r1
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl PutIcon
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08036CB8: .4byte gUnknown_02003E7C
.L08036CBC: .4byte gBattleUnitA
.L08036CC0: .4byte gUnknown_02002FF4
.L08036CC4: .4byte 0x0000027E
.L08036CC8: .4byte gBattleUnitB
.L08036CCC: .4byte 0xFFFFFEF2

	THUMB_FUNC_END BKSEL_DrawDetailed

	THUMB_FUNC_START BKSEL_Draw
BKSEL_Draw: @ 0x08036CD0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x2c]
	adds r0, #0x34
	strb r1, [r0]
	subs r0, #2
	ldrb r0, [r0]
	cmp r0, #1
	beq .L08036CEA
	cmp r0, #2
	beq .L08036CF8
	b .L08036D04
.L08036CEA:
	adds r0, r4, #0
	bl BKSEL_SetupHitAndSuchStats
	adds r0, r4, #0
	bl BKSEL_DrawStandard
	b .L08036D04
.L08036CF8:
	adds r0, r4, #0
	bl BKSEL_SetupHitAndSuchStats
	adds r0, r4, #0
	bl BKSEL_DrawDetailed
.L08036D04:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END BKSEL_Draw

	THUMB_FUNC_START func_08036D0C
func_08036D0C: @ 0x08036D0C
	push {lr}
	adds r1, r0, #0
	cmp r1, #0x40
	beq .L08036D38
	cmp r1, #0x40
	bgt .L08036D1E
	cmp r1, #0
	beq .L08036D28
	b .L08036D42
.L08036D1E:
	cmp r1, #0x80
	beq .L08036D30
	cmp r1, #0xc0
	beq .L08036D40
	b .L08036D42
.L08036D28:
	ldr r0, .L08036D2C  @ gUiFramePaletteA
	b .L08036D42
	.align 2, 0
.L08036D2C: .4byte gUiFramePaletteA
.L08036D30:
	ldr r0, .L08036D34  @ gUiFramePaletteB
	b .L08036D42
	.align 2, 0
.L08036D34: .4byte gUiFramePaletteB
.L08036D38:
	ldr r0, .L08036D3C  @ gUiFramePaletteC
	b .L08036D42
	.align 2, 0
.L08036D3C: .4byte gUiFramePaletteC
.L08036D40:
	ldr r0, .L08036D48  @ gUiFramePaletteD
.L08036D42:
	pop {r1}
	bx r1
	.align 2, 0
.L08036D48: .4byte gUiFramePaletteD

	THUMB_FUNC_END func_08036D0C

	THUMB_FUNC_START func_08036D4C
func_08036D4C: @ 0x08036D4C
	push {r4, lr}
	ldr r0, .L08036D80  @ gBattleUnitA
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0xc0
	ands r0, r4
	bl func_08036D0C
	movs r1, #0x20
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, .L08036D84  @ gBattleUnitB
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08036D88
	ands r0, r4
	bl func_08036D0C
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b .L08036D96
	.align 2, 0
.L08036D80: .4byte gBattleUnitA
.L08036D84: .4byte gBattleUnitB
.L08036D88:
	movs r0, #0xc0
	bl func_08036D0C
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
.L08036D96:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08036D4C

	THUMB_FUNC_START BKSEL_InitGfx
BKSEL_InitGfx: @ 0x08036D9C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08036E08  @ gUnknown_085A0C80
	ldr r4, .L08036E0C  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r1, .L08036E10  @ 0x06015D00
	adds r0, r4, #0
	movs r2, #4
	movs r3, #2
	bl CopyTileGfxForObj
	ldr r0, .L08036E14  @ gUnknown_085A0D2C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl ResetTextFont
	bl InitIcons
	bl func_0803650C
	bl BattleForecase_SetupLabelText
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #6
	bl InitTextDb
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #6
	bl InitTextDb
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #7
	bl InitTextDb
	ldr r2, .L08036E18  @ 0x0000FFFF
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	adds r1, r5, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08036E08: .4byte gUnknown_085A0C80
.L08036E0C: .4byte gBuf
.L08036E10: .4byte 0x06015D00
.L08036E14: .4byte gUnknown_085A0D2C
.L08036E18: .4byte 0x0000FFFF

	THUMB_FUNC_END BKSEL_InitGfx

	THUMB_FUNC_START BKSEL_Destructor
BKSEL_Destructor: @ 0x08036E1C
	push {lr}
	movs r0, #1
	negs r0, r0
	bl UnpackUiFrameBuffered
	pop {r0}
	bx r0

	THUMB_FUNC_END BKSEL_Destructor

	THUMB_FUNC_START BKSEL_Display
BKSEL_Display: @ 0x08036E2C
	push {r4, lr}
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	movs r4, #0x14
	cmp r0, #1
	bne .L08036E3C
	movs r4, #0x10
.L08036E3C:
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge .L08036E74
	ldr r0, .L08036E64  @ gBmFrameTmap0
	ldr r1, .L08036E68  @ gBg0Tm
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	ldr r0, .L08036E6C  @ gUnknown_0200422C
	ldr r1, .L08036E70  @ gBg1Tm
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	b .L08036E8C
	.align 2, 0
.L08036E64: .4byte gBmFrameTmap0
.L08036E68: .4byte gBg0Tm
.L08036E6C: .4byte gUnknown_0200422C
.L08036E70: .4byte gBg1Tm
.L08036E74:
	ldr r0, .L08036E98  @ gBmFrameTmap0
	ldr r1, .L08036E9C  @ gBg0Tm+0x28
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
	ldr r0, .L08036EA0  @ gUnknown_0200422C
	ldr r1, .L08036EA4  @ gBg1Tm+0x28
	movs r2, #0xa
	adds r3, r4, #0
	bl TmCopyRect_thm
.L08036E8C:
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08036E98: .4byte gBmFrameTmap0
.L08036E9C: .4byte gBg0Tm+0x28
.L08036EA0: .4byte gUnknown_0200422C
.L08036EA4: .4byte gBg1Tm+0x28

	THUMB_FUNC_END BKSEL_Display

	THUMB_FUNC_START func_08036EA8
func_08036EA8: @ 0x08036EA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	ldr r0, .L08036F44  @ gBattleUnitA
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L08036EC0
	movs r6, #1
.L08036EC0:
	cmp r0, #0
	bge .L08036EC6
	movs r6, #2
.L08036EC6:
	ldr r0, .L08036F48  @ gBattleUnitB
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble .L08036ED6
	movs r5, #1
.L08036ED6:
	cmp r0, #0
	bge .L08036EDC
	movs r5, #2
.L08036EDC:
	cmp r5, #0
	beq .L08036F0C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #8
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0xb
	lsls r1, r0, #3
	movs r2, #0
	cmp r5, #2
	bne .L08036F06
	movs r2, #1
.L08036F06:
	adds r0, r3, #0
	bl func_08015BD4
.L08036F0C:
	cmp r6, #0
	beq .L08036F3C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #2
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	lsls r1, r0, #3
	movs r2, #0
	cmp r6, #2
	bne .L08036F36
	movs r2, #1
.L08036F36:
	adds r0, r3, #0
	bl func_08015BD4
.L08036F3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08036F44: .4byte gBattleUnitA
.L08036F48: .4byte gBattleUnitB

	THUMB_FUNC_END func_08036EA8

	THUMB_FUNC_START func_08036F4C
func_08036F4C: @ 0x08036F4C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	lsls r1, r1, #2
	movs r0, #0xff
	ldr r2, .L08036FDC  @ gSinLut
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r6, r0, #0xa
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r5, r0, #0xb
	subs r1, r6, #3
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r6, r1, r0
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r7, #0
	adds r4, #0x50
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble .L08036FB2
	adds r1, r6, #0
	adds r1, #0x48
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, .L08036FE0  @ Sprite_16x16
	ldr r4, .L08036FE4  @ 0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
.L08036FB2:
	adds r4, r7, #0
	adds r4, #0x51
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble .L08036FD4
	adds r1, r6, #0
	adds r1, #0x18
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, .L08036FE0  @ Sprite_16x16
	ldr r4, .L08036FE4  @ 0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
.L08036FD4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08036FDC: .4byte gSinLut
.L08036FE0: .4byte Sprite_16x16
.L08036FE4: .4byte 0x000022E6

	THUMB_FUNC_END func_08036F4C

	THUMB_FUNC_START func_08036FE8
func_08036FE8: @ 0x08036FE8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0803700C
	ldr r0, .L08037008  @ gUnknown_0859E4F8
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b .L0803700E
	.align 2, 0
.L08037008: .4byte gUnknown_0859E4F8
.L0803700C:
	movs r0, #0
.L0803700E:
	lsls r0, r0, #5
	ldr r1, .L08037038  @ gUnknown_0200300C
	adds r0, r0, r1
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08037040
	ldr r0, .L0803703C  @ gUnknown_0859E4F8
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b .L08037042
	.align 2, 0
.L08037038: .4byte gUnknown_0200300C
.L0803703C: .4byte gUnknown_0859E4F8
.L08037040:
	movs r0, #0
.L08037042:
	lsls r0, r0, #5
	ldr r1, .L08037058  @ gUnknown_0200300C
	adds r0, r0, r1
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08037058: .4byte gUnknown_0200300C

	THUMB_FUNC_END func_08036FE8

	THUMB_FUNC_START func_0803705C
func_0803705C: @ 0x0803705C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080370A4
	bl func_080364D8
	adds r1, r0, #0
	cmp r1, #0
	beq .L08037094
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq .L08037094
	adds r0, r4, #0
	bl Proc_Break
	b .L080370C0
.L08037094:
	adds r0, r4, #0
	bl BKSEL_Draw
	adds r0, r4, #0
	bl BKSEL_Display
	bl func_08036D4C
.L080370A4:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	bne .L080370C0
	adds r0, r4, #0
	bl func_08036EA8
	adds r0, r4, #0
	bl func_08036F4C
	adds r0, r4, #0
	bl func_08036FE8
.L080370C0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0803705C

	THUMB_FUNC_START func_080370C8
func_080370C8: @ 0x080370C8
	push {r4, lr}
	adds r4, r0, #0
	bl BKSEL_Draw
	bl func_080364D8
	adds r1, r4, #0
	adds r1, #0x35
	movs r2, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x36
	strb r2, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge .L080370F2
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	b .L080370FA
.L080370F2:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x14
	strb r0, [r1]
.L080370FA:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	bl func_08036D4C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080370C8

	THUMB_FUNC_START func_0803710C
func_0803710C: @ 0x0803710C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	movs r1, #0x14
	mov r9, r1
	cmp r0, #1
	bne .L08037128
	movs r2, #0x10
	mov r9, r2
.L08037128:
	ldr r0, .L0803718C  @ gBg0Tm
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r1, .L08037190  @ gBg1Tm
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	ldr r1, .L08037194  @ gUnknown_0859E518
	adds r2, r7, #0
	adds r2, #0x36
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	bge .L080371A0
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, .L08037198  @ gBmFrameTmap0
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, r9
	bl TmCopyRect_thm
	ldr r0, .L0803719C  @ gUnknown_0200422C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, r9
	bl TmCopyRect_thm
	b .L080371C2
	.align 2, 0
.L0803718C: .4byte gBg0Tm
.L08037190: .4byte gBg1Tm
.L08037194: .4byte gUnknown_0859E518
.L08037198: .4byte gBmFrameTmap0
.L0803719C: .4byte gUnknown_0200422C
.L080371A0:
	ldr r0, .L080371E8  @ gBmFrameTmap0
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, r9
	bl TmCopyRect_thm
	ldr r0, .L080371EC  @ gUnknown_0200422C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, r9
	bl TmCopyRect_thm
.L080371C2:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne .L080371DA
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
.L080371DA:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080371E8: .4byte gBmFrameTmap0
.L080371EC: .4byte gUnknown_0200422C

	THUMB_FUNC_END func_0803710C

	THUMB_FUNC_START func_080371F0
func_080371F0: @ 0x080371F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	movs r1, #0x14
	mov r9, r1
	cmp r0, #1
	bne .L0803720C
	movs r2, #0x10
	mov r9, r2
.L0803720C:
	ldr r0, .L08037270  @ gBg0Tm
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r1, .L08037274  @ gBg1Tm
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	ldr r1, .L08037278  @ gUnknown_0859E51C
	adds r2, r7, #0
	adds r2, #0x36
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	bge .L08037284
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, .L0803727C  @ gBmFrameTmap0
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, r9
	bl TmCopyRect_thm
	ldr r0, .L08037280  @ gUnknown_0200422C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, r9
	bl TmCopyRect_thm
	b .L080372A6
	.align 2, 0
.L08037270: .4byte gBg0Tm
.L08037274: .4byte gBg1Tm
.L08037278: .4byte gUnknown_0859E51C
.L0803727C: .4byte gBmFrameTmap0
.L08037280: .4byte gUnknown_0200422C
.L08037284:
	ldr r0, .L080372CC  @ gBmFrameTmap0
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, r9
	bl TmCopyRect_thm
	ldr r0, .L080372D0  @ gUnknown_0200422C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, r9
	bl TmCopyRect_thm
.L080372A6:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne .L080372BE
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
.L080372BE:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080372CC: .4byte gBmFrameTmap0
.L080372D0: .4byte gUnknown_0200422C

	THUMB_FUNC_END func_080371F0

	THUMB_FUNC_START MapEventEngineExists_
MapEventEngineExists_: @ 0x080372D4
	push {lr}
	bl EventEngineExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END MapEventEngineExists_

	THUMB_FUNC_START func_080372E4
func_080372E4: @ 0x080372E4
	push {lr}
	bl CheckBattleForecastTutorialEvent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08037306
	bl GetKeyIgnore
	adds r1, r0, #0
	movs r0, #2
	negs r0, r0
	ands r0, r1
	bl SetKeyIgnore
	bl RunBattleForecastTutorialEvent
.L08037306:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080372E4

	THUMB_FUNC_START StartBattleForecast
StartBattleForecast: @ 0x0803730C
	push {r4, r5, r6, lr}
	ldr r0, .L08037324  @ gPlaySt
	adds r6, r0, #0
	adds r6, #0x42
	ldrb r0, [r6]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne .L08037328
	bl ResetTextFont
	b .L08037380
	.align 2, 0
.L08037324: .4byte gPlaySt
.L08037328:
	ldr r0, .L08037360  @ gUnknown_0859E520
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	bl CheckBattleForecastTutorialEvent
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L08037350
	bl GetKeyIgnore
	orrs r0, r4
	bl SetKeyIgnore
.L08037350:
	ldrb r0, [r6]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq .L08037364
	cmp r0, #1
	beq .L0803736C
	b .L08037374
	.align 2, 0
.L08037360: .4byte gUnknown_0859E520
.L08037364:
	adds r1, r5, #0
	adds r1, #0x32
	movs r0, #1
	b .L08037372
.L0803736C:
	adds r1, r5, #0
	adds r1, #0x32
	movs r0, #2
.L08037372:
	strb r0, [r1]
.L08037374:
	ldr r0, .L08037388  @ gMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MapFill
.L08037380:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08037388: .4byte gMapMovement

	THUMB_FUNC_END StartBattleForecast

	THUMB_FUNC_START func_0803738C
func_0803738C: @ 0x0803738C
	push {lr}
	ldr r0, .L080373B0  @ gUnknown_0859E520
	bl FindProc
	adds r1, r0, #0
	cmp r1, #0
	beq .L080373AC
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080373AC
	adds r1, #0x34
	movs r0, #1
	strb r0, [r1]
.L080373AC:
	pop {r0}
	bx r0
	.align 2, 0
.L080373B0: .4byte gUnknown_0859E520

	THUMB_FUNC_END func_0803738C

	THUMB_FUNC_START func_080373B4
func_080373B4: @ 0x080373B4
	push {r4, lr}
	ldr r0, .L080373DC  @ gUnknown_0859E520
	bl FindProc
	adds r4, r0, #0
	cmp r4, #0
	beq .L080373E8
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080373E0
	bl ClearBg0Bg1
	adds r0, r4, #0
	bl Proc_End
	b .L080373E8
	.align 2, 0
.L080373DC: .4byte gUnknown_0859E520
.L080373E0:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L080373E8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080373B4

	THUMB_FUNC_START func_080373F0
func_080373F0: @ 0x080373F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L0803743C  @ gUnknown_0859E520
	bl FindProc
	adds r4, r0, #0
	cmp r4, #0
	beq .L08037460
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08037460
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r5, #0x14
	cmp r0, #0
	bge .L08037420
	movs r5, #0
.L08037420:
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadHelpBoxGfx
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	beq .L08037440
	cmp r0, #2
	beq .L08037454
	b .L08037460
	.align 2, 0
.L0803743C: .4byte gUnknown_0859E520
.L08037440:
	ldr r0, .L08037450  @ gHelpInfo_MbpHp
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl StartMoveableHelpBoxExt
	b .L08037460
	.align 2, 0
.L08037450: .4byte gHelpInfo_MbpHp
.L08037454:
	ldr r0, .L08037468  @ gHelpInfo_CbpHp
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl StartMoveableHelpBoxExt
.L08037460:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08037468: .4byte gHelpInfo_CbpHp

	THUMB_FUNC_END func_080373F0

.align 2, 0
