	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Everything related to (non-map) battle animations
	@ Needs further splitting

	THUMB_FUNC_START SetBattleAnimLinkArenaFlag
SetBattleAnimLinkArenaFlag: @ 0x0804FD48
	ldr r1, .L0804FD50  @ gBoolBattleIsLinkArena_maybe
	str r0, [r1]
	bx lr
	.align 2, 0
.L0804FD50: .4byte gBoolBattleIsLinkArena_maybe

	THUMB_FUNC_END SetBattleAnimLinkArenaFlag

	THUMB_FUNC_START GetBattleAnimLinkArenaFlag
GetBattleAnimLinkArenaFlag: @ 0x0804FD54
	ldr r0, .L0804FD5C  @ gBoolBattleIsLinkArena_maybe
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L0804FD5C: .4byte gBoolBattleIsLinkArena_maybe

	THUMB_FUNC_END GetBattleAnimLinkArenaFlag

	THUMB_FUNC_START StartEkrBattleDeamon
StartEkrBattleDeamon: @ 0x0804FD60
	push {r4, lr}
	ldr r4, .L0804FD80  @ gpEkrBattleDeamon
	ldr r0, .L0804FD84  @ gUnknown_085B9358
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	ldr r1, .L0804FD88  @ gBoolBattleDeamonActive
	movs r0, #1
	str r0, [r1]
	bl LockGameLogic
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FD80: .4byte gpEkrBattleDeamon
.L0804FD84: .4byte gUnknown_085B9358
.L0804FD88: .4byte gBoolBattleDeamonActive

	THUMB_FUNC_END StartEkrBattleDeamon

	THUMB_FUNC_START EndEkrBattleDeamon
EndEkrBattleDeamon: @ 0x0804FD8C
	push {lr}
	ldr r0, .L0804FD9C  @ gpEkrBattleDeamon
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0804FD9C: .4byte gpEkrBattleDeamon

	THUMB_FUNC_END EndEkrBattleDeamon

	THUMB_FUNC_START IsBattleDeamonActive
IsBattleDeamonActive: @ 0x0804FDA0
	push {lr}
	ldr r0, .L0804FDB0  @ gBoolBattleDeamonActive
	ldr r0, [r0]
	cmp r0, #1
	beq .L0804FDB4
	movs r0, #0
	b .L0804FDB6
	.align 2, 0
.L0804FDB0: .4byte gBoolBattleDeamonActive
.L0804FDB4:
	movs r0, #1
.L0804FDB6:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsBattleDeamonActive

	THUMB_FUNC_START EkrBattleDeamon_OnEnd
EkrBattleDeamon_OnEnd: @ 0x0804FDBC
	push {lr}
	ldr r1, .L0804FDCC  @ gBoolBattleDeamonActive
	movs r0, #0
	str r0, [r1]
	bl UnlockGameLogic
	pop {r0}
	bx r0
	.align 2, 0
.L0804FDCC: .4byte gBoolBattleDeamonActive

	THUMB_FUNC_END EkrBattleDeamon_OnEnd

	THUMB_FUNC_START nullsub_35
nullsub_35: @ 0x0804FDD0
	bx lr

	THUMB_FUNC_END nullsub_35

	THUMB_FUNC_START StartEkrBattle
StartEkrBattle: @ 0x0804FDD4
	push {r4, lr}
	bl BsoInit
	ldr r4, .L0804FE1C  @ gUnknown_02000064
	ldr r0, .L0804FE20  @ gUnknown_085B9378
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	ldr r0, .L0804FE24  @ InBattleMainRoutine
	bl SetMainFunc
	bl func_08052220
	ldr r0, .L0804FE28  @ gUnknown_02017724
	movs r1, #0
	str r1, [r0]
	ldr r0, .L0804FE2C  @ gUnknown_02000018
	str r1, [r0]
	ldr r0, .L0804FE30  @ gUnknown_0200001C
	str r1, [r0]
	ldr r0, .L0804FE34  @ gUnknown_02000020
	str r1, [r0]
	ldr r0, .L0804FE38  @ gUnknown_02000024
	str r1, [r0]
	ldr r0, .L0804FE3C  @ gUnknown_0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0804FE14
	bl InitBattleAnimMusic
.L0804FE14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FE1C: .4byte gUnknown_02000064
.L0804FE20: .4byte gUnknown_085B9378
.L0804FE24: .4byte InBattleMainRoutine
.L0804FE28: .4byte gUnknown_02017724
.L0804FE2C: .4byte gUnknown_02000018
.L0804FE30: .4byte gUnknown_0200001C
.L0804FE34: .4byte gUnknown_02000020
.L0804FE38: .4byte gUnknown_02000024
.L0804FE3C: .4byte gUnknown_0203E0FC

	THUMB_FUNC_END StartEkrBattle

	THUMB_FUNC_START InBattleMainRoutine
InBattleMainRoutine: @ 0x0804FE40
	push {lr}
	ldr r0, .L0804FE58  @ gKeySt
	ldr r0, [r0]
	bl RefreshKeySt
	ldr r0, .L0804FE5C  @ gUnknown_0200001C
	ldr r0, [r0]
	cmp r0, #0
	bne .L0804FE60
	bl GameLoop_Battle
	b .L0804FE6C
	.align 2, 0
.L0804FE58: .4byte gKeySt
.L0804FE5C: .4byte gUnknown_0200001C
.L0804FE60:
	ldr r0, .L0804FE80  @ gUnknown_02000020
	ldr r0, [r0]
	cmp r0, #1
	bne .L0804FE6C
	bl GameLoop_Battle
.L0804FE6C:
	ldr r0, .L0804FE84  @ gUnknown_02017724
	ldr r0, [r0]
	cmp r0, #1
	beq .L0804FE88
	cmp r0, #1
	bcc .L0804FEC4
	cmp r0, #2
	beq .L0804FE98
	b .L0804FEC4
	.align 2, 0
.L0804FE80: .4byte gUnknown_02000020
.L0804FE84: .4byte gUnknown_02017724
.L0804FE88:
	ldr r0, .L0804FE94  @ gUnknown_0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0804FEC4
	b .L0804FEA2
	.align 2, 0
.L0804FE94: .4byte gUnknown_0203E0FC
.L0804FE98:
	ldr r0, .L0804FEB0  @ gUnknown_0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0804FEB8
.L0804FEA2:
	ldr r0, .L0804FEB4  @ gUnknown_02000064
	ldr r0, [r0]
	bl Proc_End
	bl func_08055C38
	b .L0804FEC4
	.align 2, 0
.L0804FEB0: .4byte gUnknown_0203E0FC
.L0804FEB4: .4byte gUnknown_02000064
.L0804FEB8:
	ldr r0, .L0804FED8  @ gUnknown_02000064
	ldr r0, [r0]
	bl Proc_End
	bl EndEkrGauge
.L0804FEC4:
	ldr r1, .L0804FEDC  @ gBmSt
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L0804FEE0  @ 0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r0}
	bx r0
	.align 2, 0
.L0804FED8: .4byte gUnknown_02000064
.L0804FEDC: .4byte gBmSt
.L0804FEE0: .4byte 0x04000006

	THUMB_FUNC_END InBattleMainRoutine

	THUMB_FUNC_START GameLoop_Battle
GameLoop_Battle: @ 0x0804FEE4
	push {r4, lr}
	bl ClearSprites
	bl Unset20200AC
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0804FF00
	ldr r0, .L0804FF50  @ gProcTreeRootArray
	ldr r0, [r0, #8]
	bl Proc_Run
.L0804FF00:
	ldr r4, .L0804FF50  @ gProcTreeRootArray
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #4]
	bl Proc_Run
	bl BsoUpdateAll
	bl BattleAIS_ExecCommands
	ldr r0, [r4, #0x10]
	bl Proc_Run
	ldr r1, .L0804FF54  @ gUnknown_02000020
	movs r0, #0
	str r0, [r1]
	ldr r1, .L0804FF58  @ gUnknown_0201FB04
	ldr r0, [r1]
	ldr r1, [r1, #4]
	adds r0, r0, r1
	cmp r0, #2
	beq .L0804FF42
	ldr r1, .L0804FF5C  @ gUnknown_02000018
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
.L0804FF42:
	movs r0, #0xd
	bl PutSpriteLayerOam
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FF50: .4byte gProcTreeRootArray
.L0804FF54: .4byte gUnknown_02000020
.L0804FF58: .4byte gUnknown_0201FB04
.L0804FF5C: .4byte gUnknown_02000018

	THUMB_FUNC_END GameLoop_Battle

	THUMB_FUNC_START nullsub_36
nullsub_36: @ 0x0804FF60
	bx lr

	THUMB_FUNC_END nullsub_36

	THUMB_FUNC_START ekrBattle_Init
ekrBattle_Init: @ 0x0804FF64
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804FF88  @ gUnknown_0201FB0C
	movs r0, #0
	str r0, [r1]
	ldr r0, .L0804FF8C  @ gUnknown_02017744
	ldr r0, [r0]
	cmp r0, #0
	bne .L0804FF9A
	ldr r0, .L0804FF90  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne .L0804FF94
	movs r0, #0x20
	negs r0, r0
	b .L0804FF98
	.align 2, 0
.L0804FF88: .4byte gUnknown_0201FB0C
.L0804FF8C: .4byte gUnknown_02017744
.L0804FF90: .4byte gBattleAnimSceneLayoutEnum
.L0804FF94:
	movs r0, #0xf0
	negs r0, r0
.L0804FF98:
	str r0, [r1]
.L0804FF9A:
	bl func_08059D28
	bl func_08070B3C
	bl func_08070254
	ldr r0, .L0804FFB8  @ gUnknown_02000024
	movs r1, #1
	str r1, [r0]
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne .L0804FFBC
	movs r0, #0
	b .L0804FFBE
	.align 2, 0
.L0804FFB8: .4byte gUnknown_02000024
.L0804FFBC:
	movs r0, #0x1e
.L0804FFBE:
	strh r0, [r4, #0x2c]
	ldr r0, .L0804FFD4  @ gBattleAnimInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0804FFDC
	ldr r1, .L0804FFD8  @ gBattleCharacterIndices
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	b .L0804FFE2
	.align 2, 0
.L0804FFD4: .4byte gBattleAnimInitialHitSide
.L0804FFD8: .4byte gBattleCharacterIndices
.L0804FFDC:
	ldr r1, .L0804FFFC  @ gBattleCharacterIndices
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
.L0804FFE2:
	bl ShouldCallBattleQuote
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x54]
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FFFC: .4byte gBattleCharacterIndices

	THUMB_FUNC_END ekrBattle_Init

	THUMB_FUNC_START ekrBattle_8050000
ekrBattle_8050000: @ 0x08050000
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne .L08050048
	bl GetBattleAnimLinkArenaFlag
	cmp r0, #1
	beq .L08050040
	ldr r0, [r4, #0x54]
	cmp r0, #1
	beq .L08050026
	ldr r0, [r4, #0x58]
	cmp r0, #1
	bne .L08050040
.L08050026:
	movs r0, #1
	movs r1, #7
	bl StartEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl StartEkrNamewinAppear
	ldr r0, .L0805003C  @ EkrBattle_BattleQuoteInit
	b .L08050042
	.align 2, 0
.L0805003C: .4byte EkrBattle_BattleQuoteInit
.L08050040:
	ldr r0, .L08050050  @ ekrBattle_8050158
.L08050042:
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
.L08050048:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050050: .4byte ekrBattle_8050158

	THUMB_FUNC_END ekrBattle_8050000

	THUMB_FUNC_START EkrBattle_BattleQuoteInit
EkrBattle_BattleQuoteInit: @ 0x08050054
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl func_08056D74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L080500DE
	bl EkrGauge_8051218
	bl func_08051B90
	movs r0, #0
	str r0, [sp]
	ldr r1, .L080500B8  @ gBg0Tm
	ldr r2, .L080500BC  @ 0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, .L080500C0  @ gUnknown_02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_8051190
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne .L080500DA
	ldr r0, .L080500C4  @ gBattleAnimInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080500CC
	ldr r1, .L080500C8  @ gBattleCharacterIndices
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl CallBattleQuoteEventsIfAny
	b .L080500D6
	.align 2, 0
.L080500B8: .4byte gBg0Tm
.L080500BC: .4byte 0x01000200
.L080500C0: .4byte gUnknown_02000038
.L080500C4: .4byte gBattleAnimInitialHitSide
.L080500C8: .4byte gBattleCharacterIndices
.L080500CC:
	ldr r1, .L080500E8  @ gBattleCharacterIndices
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
	bl CallBattleQuoteEventsIfAny
.L080500D6:
	movs r0, #0
	str r0, [r4, #0x54]
.L080500DA:
	ldr r0, .L080500EC  @ EkrBattle_BattleQuoteWait
	str r0, [r4, #0xc]
.L080500DE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080500E8: .4byte gBattleCharacterIndices
.L080500EC: .4byte EkrBattle_BattleQuoteWait

	THUMB_FUNC_END EkrBattle_BattleQuoteInit

	THUMB_FUNC_START EkrBattle_BattleQuoteWait
EkrBattle_BattleQuoteWait: @ 0x080500F0
	push {r4, lr}
	adds r4, r0, #0
	bl BattleEventEngineExists
	cmp r0, #0
	bne .L08050128
	bl func_08051F1C
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl StartEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl StartEkrNamewinAppear
	bl EkrGauge_8051228
	bl func_08051BA0
	bl EkrGauge_8051180
	ldr r0, .L08050130  @ ekrBattle_8050134
	str r0, [r4, #0xc]
.L08050128:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050130: .4byte ekrBattle_8050134

	THUMB_FUNC_END EkrBattle_BattleQuoteWait

	THUMB_FUNC_START ekrBattle_8050134
ekrBattle_8050134: @ 0x08050134
	push {r4, lr}
	adds r4, r0, #0
	bl func_08056D74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0805014C
	ldr r0, .L08050154  @ ekrBattle_8050158
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
.L0805014C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050154: .4byte ekrBattle_8050158

	THUMB_FUNC_END ekrBattle_8050134

	THUMB_FUNC_START ekrBattle_8050158
ekrBattle_8050158: @ 0x08050158
	ldr r1, .L0805016C  @ gBattleAnimInitialHitSide
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r0, #0x44]
	movs r1, #0
	str r1, [r0, #0x48]
	ldr r1, .L08050170  @ ekrBattle_8050174
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
.L0805016C: .4byte gBattleAnimInitialHitSide
.L08050170: .4byte ekrBattle_8050174

	THUMB_FUNC_END ekrBattle_8050158

	THUMB_FUNC_START ekrBattle_8050174
ekrBattle_8050174: @ 0x08050174
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne .L08050188
	ldr r0, .L08050184  @ ekrBattle_8050244
	str r0, [r4, #0xc]
	b .L0805021A
	.align 2, 0
.L08050184: .4byte ekrBattle_8050244
.L08050188:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L080501D4
	ldr r0, .L080501A8  @ gUnknown_02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl func_0806FA6C
	cmp r0, #2
	beq .L080501BA
	cmp r0, #2
	bhi .L080501AC
	cmp r0, #1
	beq .L080501B2
	b .L080501CC
	.align 2, 0
.L080501A8: .4byte gUnknown_02000000
.L080501AC:
	cmp r0, #3
	beq .L080501C2
	b .L080501CC
.L080501B2:
	ldr r0, [r4, #0x5c]
	bl func_080701B8
	b .L080501C8
.L080501BA:
	ldr r0, [r4, #0x5c]
	bl func_08076540
	b .L080501C8
.L080501C2:
	ldr r0, [r4, #0x5c]
	bl func_080708CC
.L080501C8:
	ldr r0, .L080501D0  @ ekrBattle_8050224
	str r0, [r4, #0xc]
.L080501CC:
	movs r0, #1
	b .L08050212
	.align 2, 0
.L080501D0: .4byte ekrBattle_8050224
.L080501D4:
	ldr r0, .L080501EC  @ gUnknown_02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl func_0806FA6C
	cmp r0, #2
	beq .L080501FE
	cmp r0, #2
	bhi .L080501F0
	cmp r0, #1
	beq .L080501F6
	b .L08050210
	.align 2, 0
.L080501EC: .4byte gUnknown_02000000
.L080501F0:
	cmp r0, #3
	beq .L08050206
	b .L08050210
.L080501F6:
	ldr r0, [r4, #0x5c]
	bl func_080701B8
	b .L0805020C
.L080501FE:
	ldr r0, [r4, #0x5c]
	bl func_08076540
	b .L0805020C
.L08050206:
	ldr r0, [r4, #0x5c]
	bl func_080708CC
.L0805020C:
	ldr r0, .L08050220  @ ekrBattle_8050224
	str r0, [r4, #0xc]
.L08050210:
	movs r0, #0
.L08050212:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
.L0805021A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050220: .4byte ekrBattle_8050224

	THUMB_FUNC_END ekrBattle_8050174

	THUMB_FUNC_START ekrBattle_8050224
ekrBattle_8050224: @ 0x08050224
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl func_0806FBF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0805023A
	ldr r0, .L08050240  @ ekrBattle_8050174
	str r0, [r4, #0xc]
.L0805023A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050240: .4byte ekrBattle_8050174

	THUMB_FUNC_END ekrBattle_8050224

	THUMB_FUNC_START ekrBattle_8050244
ekrBattle_8050244: @ 0x08050244
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08050270  @ gBattleAnimInitialHitSide
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, .L08050274  @ gUnknown_02017744
	ldr r0, [r0]
	cmp r1, r0
	beq .L08050280
	ldr r1, .L08050278  @ gUnknown_02000000
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, .L0805027C  @ ekrBattle_WaitForFrame8
	b .L08050282
	.align 2, 0
.L08050270: .4byte gBattleAnimInitialHitSide
.L08050274: .4byte gUnknown_02017744
.L08050278: .4byte gUnknown_02000000
.L0805027C: .4byte ekrBattle_WaitForFrame8
.L08050280:
	ldr r0, .L0805028C  @ ekrBattle_StartUIPaletteAnimations
.L08050282:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805028C: .4byte ekrBattle_StartUIPaletteAnimations

	THUMB_FUNC_END ekrBattle_8050244

	THUMB_FUNC_START ekrBattle_WaitForFrame8
ekrBattle_WaitForFrame8: @ 0x08050290
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L080502A6
	ldr r0, .L080502AC  @ ekrBattle_StartUIPaletteAnimations
	str r0, [r1, #0xc]
.L080502A6:
	pop {r0}
	bx r0
	.align 2, 0
.L080502AC: .4byte ekrBattle_StartUIPaletteAnimations

	THUMB_FUNC_END ekrBattle_WaitForFrame8

	THUMB_FUNC_START ekrBattle_StartUIPaletteAnimations
ekrBattle_StartUIPaletteAnimations: @ 0x080502B0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L080502F4  @ gUnknown_02000000
	ldr r0, [r4]
	bl StartEfxStatusUnit
	ldr r0, [r4, #8]
	bl StartEfxStatusUnit
	ldr r1, .L080502F8  @ gUnknown_0203E1D8
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl StartEfxWeaponIcon
	ldr r0, .L080502FC  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080502E2
	ldr r0, [r4]
	bl func_08054B64
.L080502E2:
	ldr r0, [r4]
	bl StartEfxHPBarColorChange
	ldr r0, .L08050300  @ ekrBattle_8050304
	str r0, [r5, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080502F4: .4byte gUnknown_02000000
.L080502F8: .4byte gUnknown_0203E1D8
.L080502FC: .4byte gBattleStats
.L08050300: .4byte ekrBattle_8050304

	THUMB_FUNC_END ekrBattle_StartUIPaletteAnimations

	THUMB_FUNC_START ekrBattle_8050304
ekrBattle_8050304: @ 0x08050304
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805031C  @ gpBattleAnimTAUnits
	ldr r0, [r0]
	cmp r0, #0
	beq .L08050328
	ldr r0, .L08050320  @ gUnknown_02000000
	ldr r0, [r0, #8]
	bl StartEkrTriangle
	ldr r0, .L08050324  @ ekrBattle_WaitForTriangleAttackAnim
	b .L0805032A
	.align 2, 0
.L0805031C: .4byte gpBattleAnimTAUnits
.L08050320: .4byte gUnknown_02000000
.L08050324: .4byte ekrBattle_WaitForTriangleAttackAnim
.L08050328:
	ldr r0, .L08050334  @ ekrBattle_InitMainAnimations
.L0805032A:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050334: .4byte ekrBattle_InitMainAnimations

	THUMB_FUNC_END ekrBattle_8050304

	THUMB_FUNC_START ekrBattle_WaitForTriangleAttackAnim
ekrBattle_WaitForTriangleAttackAnim: @ 0x08050338
	push {r4, lr}
	adds r4, r0, #0
	bl HasBattleAnimTriangeAttackEnded
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08050354
	bl nullsub_18
	movs r0, #0x1e
	strh r0, [r4, #0x2c]
	ldr r0, .L0805035C  @ ekrBattle_InitMainAnimations
	str r0, [r4, #0xc]
.L08050354:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805035C: .4byte ekrBattle_InitMainAnimations

	THUMB_FUNC_END ekrBattle_WaitForTriangleAttackAnim

	THUMB_FUNC_START ekrBattle_InitMainAnimations
ekrBattle_InitMainAnimations: @ 0x08050360
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r1, #0
	mov ip, r1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble .L080503D4
	ldr r6, .L080503DC  @ gBattleAnimUnitEnabledLookup
	movs r7, #0
	ldrsh r0, [r6, r7]
	cmp r0, #1
	bne .L080503A0
	ldr r3, .L080503E0  @ gUnknown_02000000
	ldr r4, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	movs r7, #0x80
	lsls r7, r7, #7
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #4]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
.L080503A0:
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bne .L080503C8
	ldr r3, .L080503E0  @ gUnknown_02000000
	ldr r4, [r3, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	movs r6, #0x80
	lsls r6, r6, #7
	adds r1, r6, #0
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #0xc]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
.L080503C8:
	ldr r0, .L080503E4  @ gUnknown_0201FB04
	mov r7, ip
	str r7, [r0]
	str r7, [r0, #4]
	ldr r0, .L080503E8  @ ekrBattle_80503EC
	str r0, [r5, #0xc]
.L080503D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080503DC: .4byte gBattleAnimUnitEnabledLookup
.L080503E0: .4byte gUnknown_02000000
.L080503E4: .4byte gUnknown_0201FB04
.L080503E8: .4byte ekrBattle_80503EC

	THUMB_FUNC_END ekrBattle_InitMainAnimations

	THUMB_FUNC_START ekrBattle_80503EC
ekrBattle_80503EC: @ 0x080503EC
	ldr r2, .L080503F8  @ gUnknown_02000024
	movs r1, #0
	str r1, [r2]
	ldr r1, .L080503FC  @ ekrBattle_StartMainAnimations
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
.L080503F8: .4byte gUnknown_02000024
.L080503FC: .4byte ekrBattle_StartMainAnimations

	THUMB_FUNC_END ekrBattle_80503EC

	THUMB_FUNC_START ekrBattle_StartMainAnimations
ekrBattle_StartMainAnimations: @ 0x08050400
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805041C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne .L08050428
	ldr r0, .L08050420  @ gUnknown_02000000
	ldr r0, [r0, #8]
	bl NewEkrClassChg
	ldr r0, .L08050424  @ ekrBattle_WaitForClassChange
	b .L08050432
	.align 2, 0
.L0805041C: .4byte gBattleAnimSceneLayoutEnum
.L08050420: .4byte gUnknown_02000000
.L08050424: .4byte ekrBattle_WaitForClassChange
.L08050428:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldr r0, .L0805043C  @ ekrBattle_WaitForRoundAnimations
.L08050432:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805043C: .4byte ekrBattle_WaitForRoundAnimations

	THUMB_FUNC_END ekrBattle_StartMainAnimations

	THUMB_FUNC_START ekrBattle_WaitForClassChange
ekrBattle_WaitForClassChange: @ 0x08050440
	push {r4, r5, lr}
	adds r5, r0, #0
	bl EkrClasschgFinished
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne .L0805045C
	bl EndEkrClasschg
	ldr r0, .L08050464  @ gUnknown_0203E1C8
	strh r4, [r0]
	ldr r0, .L08050468  @ ekrBattle_CheckForLevelup_8050C34
	str r0, [r5, #0xc]
.L0805045C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08050464: .4byte gUnknown_0203E1C8
.L08050468: .4byte ekrBattle_CheckForLevelup_8050C34

	THUMB_FUNC_END ekrBattle_WaitForClassChange

	THUMB_FUNC_START ekrBattle_WaitForRoundAnimations
ekrBattle_WaitForRoundAnimations: @ 0x0805046C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r0, .L080504A4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0805048C
	mov r1, r8
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
.L0805048C:
	ldr r0, .L080504A8  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bne .L08050498
	b .L080505C0
.L08050498:
	cmp r0, #3
	ble .L080504AC
	cmp r0, #4
	bne .L080504A2
	b .L080505CC
.L080504A2:
	b .L080505CE
	.align 2, 0
.L080504A4: .4byte gKeySt
.L080504A8: .4byte gBattleAnimSceneLayoutEnum
.L080504AC:
	cmp r0, #0
	bge .L080504B2
	b .L080505CE
.L080504B2:
	ldr r0, .L080504FC  @ gUnknown_0201FB04
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #2
	beq .L080504C0
	b .L080505CE
.L080504C0:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L080504CA
	b .L080505CC
.L080504CA:
	ldr r4, .L08050500  @ gUnknown_0203E1C8
	ldr r0, .L08050504  @ gpUnitLeft_BattleStruct
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
	ldr r0, .L08050508  @ gpUnitRight_BattleStruct
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
	ldr r1, .L0805050C  @ gBattleHpDisplayedValue
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne .L08050510
	movs r0, #1
	bl func_08031EE4
	b .L080505CC
	.align 2, 0
.L080504FC: .4byte gUnknown_0201FB04
.L08050500: .4byte gUnknown_0203E1C8
.L08050504: .4byte gpUnitLeft_BattleStruct
.L08050508: .4byte gpUnitRight_BattleStruct
.L0805050C: .4byte gBattleHpDisplayedValue
.L08050510:
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne .L08050522
	movs r0, #2
.L0805051A:
	bl func_08031EE4
	strh r7, [r4, #2]
	b .L080505CC
.L08050522:
	mov r0, r8
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08050534
	bl func_0805B094
	movs r0, #4
	b .L0805051A
.L08050534:
	movs r1, #0
	ldr r0, .L080505B8  @ gUnknown_02000000
	ldr r4, [r0]
	ldr r5, [r0, #8]
	ldrb r0, [r4, #0x12]
	cmp r0, #8
	bgt .L08050548
	cmp r0, #6
	blt .L08050548
	movs r1, #1
.L08050548:
	ldrb r0, [r5, #0x12]
	cmp r0, #8
	bgt .L08050558
	cmp r0, #6
	blt .L08050558
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
.L08050558:
	cmp r1, #2
	bne .L080505CE
	adds r0, r4, #0
	bl func_08054BD4
	movs r6, #0xc
	ands r0, r6
	cmp r0, #0
	beq .L08050572
	adds r0, r4, #0
	movs r1, #0
	bl func_08054BA4
.L08050572:
	adds r0, r5, #0
	bl func_08054BD4
	ands r0, r6
	cmp r0, #0
	beq .L08050586
	adds r0, r5, #0
	movs r1, #0
	bl func_08054BA4
.L08050586:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0x44
	bne .L08050598
	movs r1, #1
	negs r1, r1
	adds r0, r4, #0
	bl MoveBattleCameraOnto
.L08050598:
	bl func_08031EF0
	bl InitBattleAnimHitArrays
	bl BsoInit
	bl func_080599E8
	bl func_08059D28
	movs r0, #0
	mov r2, r8
	strh r0, [r2, #0x2c]
	ldr r0, .L080505BC  @ ekrBattle_InitMainAnimations
	str r0, [r2, #0xc]
	b .L080505CE
	.align 2, 0
.L080505B8: .4byte gUnknown_02000000
.L080505BC: .4byte ekrBattle_InitMainAnimations
.L080505C0:
	ldr r0, .L080505E4  @ gUnknown_0201FB04
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #1
	bne .L080505CE
.L080505CC:
	movs r7, #1
.L080505CE:
	cmp r7, #1
	bne .L080505D8
	ldr r0, .L080505E8  @ ekrBattle_80505EC
	mov r1, r8
	str r0, [r1, #0xc]
.L080505D8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080505E4: .4byte gUnknown_0201FB04
.L080505E8: .4byte ekrBattle_80505EC

	THUMB_FUNC_END ekrBattle_WaitForRoundAnimations

	THUMB_FUNC_START ekrBattle_80505EC
ekrBattle_80505EC: @ 0x080505EC
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	ldr r1, .L080505FC  @ ekrBattle_8050600
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
.L080505FC: .4byte ekrBattle_8050600

	THUMB_FUNC_END ekrBattle_80505EC

	THUMB_FUNC_START ekrBattle_8050600
ekrBattle_8050600: @ 0x08050600
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, .L0805066C  @ gUnknown_02017728
	ldr r0, [r0]
	cmp r0, #0
	bne .L08050666
	ldr r0, .L08050670  @ gUnknown_02017738
	ldr r4, [r0]
	cmp r4, #0
	bne .L08050666
	bl HasEkrNamewinAppearEnded
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne .L08050666
	strh r4, [r5, #0x2c]
	ldr r0, .L08050674  @ ekrBattle_8050684
	str r0, [r5, #0xc]
	ldr r4, .L08050678  @ gUnknown_02000000
	ldr r0, [r4]
	bl func_08070214
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08050666
	ldr r0, .L0805067C  @ gUnknown_0203E1C8
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #1
	cmp r0, #0
	beq .L08050642
	movs r2, #0
.L08050642:
	ldr r3, .L08050680  @ gUnknown_02017744
	ldr r0, [r3]
	adds r1, r5, #0
	adds r1, #0x29
	cmp r2, r0
	beq .L08050650
	strb r6, [r1]
.L08050650:
	ldrb r0, [r1]
	cmp r0, #1
	bne .L08050666
	ldr r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L08050666:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805066C: .4byte gUnknown_02017728
.L08050670: .4byte gUnknown_02017738
.L08050674: .4byte ekrBattle_8050684
.L08050678: .4byte gUnknown_02000000
.L0805067C: .4byte gUnknown_0203E1C8
.L08050680: .4byte gUnknown_02017744

	THUMB_FUNC_END ekrBattle_8050600

	THUMB_FUNC_START ekrBattle_8050684
ekrBattle_8050684: @ 0x08050684
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble .L080506BC
	bl GetBattleAnimLinkArenaFlag
	cmp r0, #1
	beq .L080506B8
	ldr r0, .L080506B0  @ gUnknown_0203E1C8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmn r1, r0
	beq .L080506B8
	ldr r0, .L080506B4  @ ekrBattle_80506C8
	b .L080506BA
	.align 2, 0
.L080506B0: .4byte gUnknown_0203E1C8
.L080506B4: .4byte ekrBattle_80506C8
.L080506B8:
	ldr r0, .L080506C4  @ ekrBattle_MakePopups
.L080506BA:
	str r0, [r4, #0xc]
.L080506BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080506C4: .4byte ekrBattle_MakePopups

	THUMB_FUNC_END ekrBattle_8050684

	THUMB_FUNC_START ekrBattle_80506C8
ekrBattle_80506C8: @ 0x080506C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r0, .L080507CC  @ gUnknown_02019490
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	mov sl, r0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r7, .L080507D0  @ gDispIo
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
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	movs r2, #0x94
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r6, r7, #0
	adds r6, #0x34
	ldrb r1, [r6]
	movs r2, #1
	mov r8, r2
	mov r0, r8
	orrs r1, r0
	movs r2, #2
	mov r9, r2
	mov r0, r9
	orrs r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x36
	adds r2, r2, r7
	mov ip, r2
	ldrb r0, [r2]
	mov r2, r8
	orrs r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	subs r2, #0x1e
	ands r1, r2
	strb r1, [r6]
	ands r0, r2
	mov r1, ip
	strb r0, [r1]
	ldr r0, .L080507D4  @ gUnknown_08802D44
	ldr r1, .L080507D8  @ 0x06002000
	movs r2, #0xc0
	lsls r2, r2, #2
	bl RegisterDataMove
	ldr r0, .L080507DC  @ gUnknown_08803524
	ldr r1, .L080507E0  @ gBg1Tm+0x44C
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x12
	movs r3, #3
	bl func_08070E94
	ldr r0, .L080507E4  @ gUnknown_08803590
	ldr r1, .L080507E8  @ gPal+0x20
	movs r2, #8
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	bl EnablePalSync
	bl func_0806FAB0
	cmp r0, #2
	bhi .L080507EC
	cmp r0, #1
	bcc .L080507EC
	ldrb r2, [r7, #0x10]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0x10]
	ldrb r2, [r7, #0xc]
	adds r0, r1, #0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x18]
	ands r1, r0
	mov r0, r9
	orrs r1, r0
	strb r1, [r7, #0x18]
	ldrb r0, [r7, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x14]
	b .L08050818
	.align 2, 0
.L080507CC: .4byte gUnknown_02019490
.L080507D0: .4byte gDispIo
.L080507D4: .4byte gUnknown_08802D44
.L080507D8: .4byte 0x06002000
.L080507DC: .4byte gUnknown_08803524
.L080507E0: .4byte gBg1Tm+0x44C
.L080507E4: .4byte gUnknown_08803590
.L080507E8: .4byte gPal+0x20
.L080507EC:
	ldr r3, .L08050830  @ gDispIo
	ldrb r2, [r3, #0x10]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0x10]
	ldrb r2, [r3, #0xc]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
.L08050818:
	movs r0, #1
	bl EkrGauge_80511C0
	ldr r0, .L08050834  @ gUnknown_0203E1C8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805083C
	ldr r0, .L08050838  @ gUnknown_0203E1C4
	movs r2, #0
	ldrsh r0, [r0, r2]
	b .L08050842
	.align 2, 0
.L08050830: .4byte gDispIo
.L08050834: .4byte gUnknown_0203E1C8
.L08050838: .4byte gUnknown_0203E1C4
.L0805083C:
	ldr r0, .L080508D8  @ gUnknown_0203E1C4
	movs r1, #2
	ldrsh r0, [r0, r1]
.L08050842:
	movs r1, #0x64
	bl DivRem
	adds r6, r0, #0
	movs r1, #0xa
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	subs r4, r6, r0
	cmp r5, #0
	bne .L08050860
	movs r5, #0xa
.L08050860:
	ldr r0, .L080508DC  @ gUnknown_02019490
	adds r1, r6, #0
	bl func_08071140
	lsls r5, r5, #5
	mov r8, r5
	lsls r4, r4, #5
	mov r9, r4
	mov r5, sl
	ldr r4, .L080508DC  @ gUnknown_02019490
	ldr r7, .L080508E0  @ gUnknown_088030C4
	movs r6, #0xc
.L08050878:
	ldrh r0, [r4]
	lsls r0, r0, #5
	adds r0, r0, r7
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge .L08050878
	ldr r4, .L080508E4  @ gUnknown_088033C4
	mov r2, r8
	adds r0, r2, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	add r4, r9
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, .L080508E8  @ 0x060021A0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	movs r0, #0
	ldr r1, [sp, #8]
	strh r0, [r1, #0x2c]
	ldr r0, .L080508EC  @ ekrBattle_80508F0
	str r0, [r1, #0xc]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080508D8: .4byte gUnknown_0203E1C4
.L080508DC: .4byte gUnknown_02019490
.L080508E0: .4byte gUnknown_088030C4
.L080508E4: .4byte gUnknown_088033C4
.L080508E8: .4byte 0x060021A0
.L080508EC: .4byte ekrBattle_80508F0

	THUMB_FUNC_END ekrBattle_80506C8

	THUMB_FUNC_START ekrBattle_80508F0
ekrBattle_80508F0: @ 0x080508F0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r1, r0, #1
	strh r1, [r2, #0x2c]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble .L08050910
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r0, .L0805090C  @ ekrBattle_8050940
	str r0, [r2, #0xc]
	b .L08050936
	.align 2, 0
.L0805090C: .4byte ekrBattle_8050940
.L08050910:
	ldr r3, .L0805093C  @ gDispIo
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r2, #0x6c
	negs r2, r2
	adds r0, r2, #0
	subs r0, r0, r1
	adds r2, r3, #0
	adds r2, #0x31
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	subs r1, #0x6c
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
.L08050936:
	pop {r0}
	bx r0
	.align 2, 0
.L0805093C: .4byte gDispIo

	THUMB_FUNC_END ekrBattle_80508F0

	THUMB_FUNC_START ekrBattle_8050940
ekrBattle_8050940: @ 0x08050940
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble .L08050998
	ldr r2, .L08050964  @ gUnknown_0203E1C8
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq .L0805096C
	ldr r0, .L08050968  @ gUnknown_0203E1C4
	ldrh r0, [r0]
	b .L0805097A
	.align 2, 0
.L08050964: .4byte gUnknown_0203E1C8
.L08050968: .4byte gUnknown_0203E1C4
.L0805096C:
	ldrh r3, [r2, #2]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq .L08050980
	ldr r0, .L080509A0  @ gUnknown_0203E1C4
	ldrh r0, [r0, #2]
.L0805097A:
	strh r0, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2e]
.L08050980:
	ldr r0, .L080509A4  @ ekrBattle_80509A8
	str r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x74
	bl SomeBattlePlaySound_8071990
	movs r0, #0x74
	movs r1, #0x78
	movs r2, #0
	bl func_08071AB0
.L08050998:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080509A0: .4byte gUnknown_0203E1C4
.L080509A4: .4byte ekrBattle_80509A8

	THUMB_FUNC_END ekrBattle_8050940

	THUMB_FUNC_START ekrBattle_80509A8
ekrBattle_80509A8: @ 0x080509A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, .L08050A70  @ gUnknown_02019490
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, r8
	mov sl, r1
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	movs r1, #0x64
	bl DivRem
	adds r5, r0, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r6, r5, r0
	cmp r4, #0
	bne .L080509E4
	movs r4, #0xa
.L080509E4:
	mov r0, r8
	adds r1, r5, #0
	bl func_08071140
	lsls r4, r4, #5
	mov r9, r4
	lsls r6, r6, #5
	str r6, [sp]
	mov r6, sl
	mov r5, r8
	ldr r0, .L08050A74  @ gUnknown_088030C4
	mov r8, r0
	movs r4, #0xc
.L080509FE:
	ldrh r0, [r5]
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge .L080509FE
	ldr r4, .L08050A78  @ gUnknown_088033C4
	mov r1, r9
	adds r0, r1, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	ldr r2, [sp]
	adds r4, r2, r4
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, .L08050A7C  @ 0x060021A0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble .L08050A60
	movs r0, #0
	strh r0, [r7, #0x2c]
	ldr r0, .L08050A80  @ ekrBattle_8050A84
	str r0, [r7, #0xc]
.L08050A60:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08050A70: .4byte gUnknown_02019490
.L08050A74: .4byte gUnknown_088030C4
.L08050A78: .4byte gUnknown_088033C4
.L08050A7C: .4byte 0x060021A0
.L08050A80: .4byte ekrBattle_8050A84

	THUMB_FUNC_END ekrBattle_80509A8

	THUMB_FUNC_START ekrBattle_8050A84
ekrBattle_8050A84: @ 0x08050A84
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne .L08050A96
	movs r0, #0x74
	bl func_08071A44
.L08050A96:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble .L08050AAC
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, .L08050AB4  @ ekrBattle_8050AB8
	str r0, [r4, #0xc]
.L08050AAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050AB4: .4byte ekrBattle_8050AB8

	THUMB_FUNC_END ekrBattle_8050A84

	THUMB_FUNC_START ekrBattle_8050AB8
ekrBattle_8050AB8: @ 0x08050AB8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r2, r0, #1
	strh r2, [r1, #0x2c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble .L08050AD8
	movs r0, #0
	strh r0, [r1, #0x2c]
	ldr r0, .L08050AD4  @ ekrBattle_8050B08
	str r0, [r1, #0xc]
	b .L08050AFE
	.align 2, 0
.L08050AD4: .4byte ekrBattle_8050B08
.L08050AD8:
	ldr r3, .L08050B04  @ gDispIo
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	subs r0, #0x78
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	negs r1, r1
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
.L08050AFE:
	pop {r0}
	bx r0
	.align 2, 0
.L08050B04: .4byte gDispIo

	THUMB_FUNC_END ekrBattle_8050AB8

	THUMB_FUNC_START ekrBattle_8050B08
ekrBattle_8050B08: @ 0x08050B08
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne .L08050B4C
	ldr r2, .L08050B30  @ gUnknown_0203E1C8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq .L08050B38
	ldr r0, .L08050B34  @ gUnknown_0203E1C4
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b .L08050B42
	.align 2, 0
.L08050B30: .4byte gUnknown_0203E1C8
.L08050B34: .4byte gUnknown_0203E1C4
.L08050B38:
	ldr r0, .L08050B98  @ gUnknown_0203E1C4
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
.L08050B42:
	adds r1, r1, r0
	cmp r1, #0x63
	ble .L08050B4C
	bl NewEkrLvlupFan
.L08050B4C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x28
	ble .L08050C28
	bl SpellFx_ClearBg1
	movs r0, #0
	bl EkrGauge_80511C0
	bl func_0806FAB0
	cmp r0, #2
	bhi .L08050BA0
	cmp r0, #1
	bcc .L08050BA0
	ldr r3, .L08050B9C  @ gDispIo
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
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
	b .L08050BCC
	.align 2, 0
.L08050B98: .4byte gUnknown_0203E1C4
.L08050B9C: .4byte gDispIo
.L08050BA0:
	ldr r3, .L08050BFC  @ gDispIo
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
.L08050BCC:
	adds r2, r3, #0
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldr r2, .L08050C00  @ gUnknown_0203E1C8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq .L08050C08
	ldr r0, .L08050C04  @ gUnknown_0203E1C4
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b .L08050C12
	.align 2, 0
.L08050BFC: .4byte gDispIo
.L08050C00: .4byte gUnknown_0203E1C8
.L08050C04: .4byte gUnknown_0203E1C4
.L08050C08:
	ldr r0, .L08050C1C  @ gUnknown_0203E1C4
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
.L08050C12:
	adds r1, r1, r0
	cmp r1, #0x63
	ble .L08050C24
	ldr r0, .L08050C20  @ ekrBattle_CheckForLevelup_8050C34
	b .L08050C26
	.align 2, 0
.L08050C1C: .4byte gUnknown_0203E1C4
.L08050C20: .4byte ekrBattle_CheckForLevelup_8050C34
.L08050C24:
	ldr r0, .L08050C30  @ ekrBattle_MakePopups
.L08050C26:
	str r0, [r4, #0xc]
.L08050C28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050C30: .4byte ekrBattle_MakePopups

	THUMB_FUNC_END ekrBattle_8050B08

	THUMB_FUNC_START ekrBattle_CheckForLevelup_8050C34
ekrBattle_CheckForLevelup_8050C34: @ 0x08050C34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08050C48  @ gUnknown_0203E1C8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08050C50
	ldr r0, .L08050C4C  @ gUnknown_02000000
	ldr r0, [r0]
	b .L08050C54
	.align 2, 0
.L08050C48: .4byte gUnknown_0203E1C8
.L08050C4C: .4byte gUnknown_02000000
.L08050C50:
	ldr r0, .L08050C64  @ gUnknown_02000000
	ldr r0, [r0, #8]
.L08050C54:
	bl NewEkrLevelup
	ldr r0, .L08050C68  @ ekrBattle_WaitForLevelup_8050C6C
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050C64: .4byte gUnknown_02000000
.L08050C68: .4byte ekrBattle_WaitForLevelup_8050C6C

	THUMB_FUNC_END ekrBattle_CheckForLevelup_8050C34

	THUMB_FUNC_START ekrBattle_WaitForLevelup_8050C6C
ekrBattle_WaitForLevelup_8050C6C: @ 0x08050C6C
	push {r4, lr}
	adds r4, r0, #0
	bl DoesEkrLevelUpSomething
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08050C84
	bl EndEkrLevelUp
	ldr r0, .L08050C8C  @ ekrBattle_MakePopups
	str r0, [r4, #0xc]
.L08050C84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050C8C: .4byte ekrBattle_MakePopups

	THUMB_FUNC_END ekrBattle_WaitForLevelup_8050C6C

	THUMB_FUNC_START ekrBattle_MakePopups
ekrBattle_MakePopups: @ 0x08050C90
	push {r4, lr}
	adds r4, r0, #0
	bl StartAnimsOnPopups
	ldr r0, .L08050CA4  @ ekrBattle_WaitForPopup
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050CA4: .4byte ekrBattle_WaitForPopup

	THUMB_FUNC_END ekrBattle_MakePopups

	THUMB_FUNC_START ekrBattle_WaitForPopup
ekrBattle_WaitForPopup: @ 0x08050CA8
	push {r4, lr}
	adds r4, r0, #0
	bl DoesBattlePopupExist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08050CC0
	bl DeleteAnimsOnPopup
	ldr r0, .L08050CC8  @ ekrBattle_8050CCC
	str r0, [r4, #0xc]
.L08050CC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050CC8: .4byte ekrBattle_8050CCC

	THUMB_FUNC_END ekrBattle_WaitForPopup

	THUMB_FUNC_START ekrBattle_8050CCC
ekrBattle_8050CCC: @ 0x08050CCC
	push {r4, lr}
	adds r4, r0, #0
	bl EndEfxWeaponIcon
	bl EndEfxHPBarColorChange
	ldr r0, .L08050CF0  @ gBattleAnimInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	str r0, [r4, #0x44]
	movs r0, #0
	str r0, [r4, #0x48]
	ldr r0, .L08050CF4  @ ekrBattle_8050CF8
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050CF0: .4byte gBattleAnimInitialHitSide
.L08050CF4: .4byte ekrBattle_8050CF8

	THUMB_FUNC_END ekrBattle_8050CCC

	THUMB_FUNC_START ekrBattle_8050CF8
ekrBattle_8050CF8: @ 0x08050CF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne .L08050D0C
	ldr r0, .L08050D08  @ ekrBattle_8050DA8
	str r0, [r4, #0xc]
	b .L08050D7C
	.align 2, 0
.L08050D08: .4byte ekrBattle_8050DA8
.L08050D0C:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08050D48
	ldr r0, .L08050D2C  @ gUnknown_02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl func_0806FA6C
	cmp r0, #2
	beq .L08050D34
	cmp r0, #2
	bhi .L08050D30
	cmp r0, #1
	beq .L08050D34
	b .L08050D3E
	.align 2, 0
.L08050D2C: .4byte gUnknown_02000000
.L08050D30:
	cmp r0, #3
	bne .L08050D3E
.L08050D34:
	ldr r0, [r4, #0x5c]
	bl func_080701E8
	ldr r0, .L08050D44  @ ekrBattle_8050D88
	str r0, [r4, #0xc]
.L08050D3E:
	movs r0, #1
	b .L08050D74
	.align 2, 0
.L08050D44: .4byte ekrBattle_8050D88
.L08050D48:
	ldr r0, .L08050D60  @ gUnknown_02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl func_0806FA6C
	cmp r0, #2
	beq .L08050D68
	cmp r0, #2
	bhi .L08050D64
	cmp r0, #1
	beq .L08050D68
	b .L08050D72
	.align 2, 0
.L08050D60: .4byte gUnknown_02000000
.L08050D64:
	cmp r0, #3
	bne .L08050D72
.L08050D68:
	ldr r0, [r4, #0x5c]
	bl func_080701E8
	ldr r0, .L08050D84  @ ekrBattle_8050D88
	str r0, [r4, #0xc]
.L08050D72:
	movs r0, #0
.L08050D74:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
.L08050D7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050D84: .4byte ekrBattle_8050D88

	THUMB_FUNC_END ekrBattle_8050CF8

	THUMB_FUNC_START ekrBattle_8050D88
ekrBattle_8050D88: @ 0x08050D88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl func_0806FC14
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08050D9E
	ldr r0, .L08050DA4  @ ekrBattle_8050CF8
	str r0, [r4, #0xc]
.L08050D9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050DA4: .4byte ekrBattle_8050CF8

	THUMB_FUNC_END ekrBattle_8050D88

	THUMB_FUNC_START ekrBattle_8050DA8
ekrBattle_8050DA8: @ 0x08050DA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08050DD4  @ gUnknown_02017724
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08050DD8  @ gUnknown_0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08050DCA
	movs r0, #2
	movs r1, #7
	movs r2, #0
	bl StartEkrNamewinAppear
	bl func_0807289C
.L08050DCA:
	ldr r0, .L08050DDC  @ nullsub_69
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08050DD4: .4byte gUnknown_02017724
.L08050DD8: .4byte gUnknown_0203E0FC
.L08050DDC: .4byte nullsub_69

	THUMB_FUNC_END ekrBattle_8050DA8

	THUMB_FUNC_START nullsub_69
nullsub_69: @ 0x08050DE0
	bx lr

	THUMB_FUNC_END nullsub_69

	THUMB_FUNC_START NewEkrLvlupFan
NewEkrLvlupFan: @ 0x08050DE4
	push {lr}
	ldr r0, .L08050DFC  @ gUnknown_085B93A0
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r0, #0x80
	bl SetBgmVolume
	pop {r0}
	bx r0
	.align 2, 0
.L08050DFC: .4byte gUnknown_085B93A0

	THUMB_FUNC_END NewEkrLvlupFan

	THUMB_FUNC_START func_08050E00
func_08050E00: @ 0x08050E00
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne .L08050E28
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x5b
	bl SomeBattlePlaySound_8071990
	movs r0, #0x5b
	movs r1, #0x78
	movs r2, #0
	bl func_08071AB0
	b .L08050E3A
.L08050E28:
	cmp r0, #0x74
	bne .L08050E3A
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	adds r0, r4, #0
	bl Proc_Break
.L08050E3A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08050E00

	THUMB_FUNC_START func_08050E40
func_08050E40: @ 0x08050E40
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r5, r7, #0
.L08050E4C:
	ldrh r0, [r4]
	movs r1, #0xf
	cmp r0, #0xff
	beq .L08050E56
	adds r1, r0, #0
.L08050E56:
	lsls r0, r1, #5
	ldr r1, .L08050E88  @ gUnknown_08802904
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #2
	adds r5, #0x20
	adds r6, #1
	cmp r6, #0xa
	bls .L08050E4C
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r2, .L08050E8C  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08050E88: .4byte gUnknown_08802904
.L08050E8C: .4byte 0x01000008

	THUMB_FUNC_END func_08050E40

	THUMB_FUNC_START func_08050E90
func_08050E90: @ 0x08050E90
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #1
	negs r0, r0
	cmp r6, r0
	bne .L08050EAC
	movs r0, #0xb
	strh r0, [r5]
	movs r0, #0xa
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	b .L08050EF0
.L08050EAC:
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r1, [r5]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	subs r4, r6, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	strh r0, [r5, #2]
	ldrh r1, [r5, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r4, r4, r0
	strh r4, [r5, #4]
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	cmn r1, r0
	bne .L08050EE6
	movs r0, #0xb
	strh r0, [r5, #2]
.L08050EE6:
	ldrh r0, [r5]
	cmp r0, #0
	bne .L08050EF0
	movs r0, #0xb
	strh r0, [r5]
.L08050EF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08050E90

	THUMB_FUNC_START StartEkrGauge
StartEkrGauge: @ 0x08050EF8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, .L08050F44  @ gUnknown_02000068
	ldr r0, .L08050F48  @ gUnknown_085B93B8
	movs r1, #1
	bl SpawnProc
	str r0, [r4]
	movs r0, #0
	bl EkrGauge_80511C0
	bl EkrGauge_8051180
	bl EkrGauge_8051228
	bl EkrGauge_8051208
	ldr r1, .L08050F4C  @ gUnknown_02000038
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl EkrGauge_80511D0
	ldr r0, .L08050F50  @ gBattleHpDisplayedValue
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble .L08050F5C
	ldr r0, .L08050F54  @ gUnknown_08802C84
	ldr r1, .L08050F58  @ gPal+0x360
	movs r2, #0x10
	bl CpuSet
	b .L08050F70
	.align 2, 0
.L08050F44: .4byte gUnknown_02000068
.L08050F48: .4byte gUnknown_085B93B8
.L08050F4C: .4byte gUnknown_02000038
.L08050F50: .4byte gBattleHpDisplayedValue
.L08050F54: .4byte gUnknown_08802C84
.L08050F58: .4byte gPal+0x360
.L08050F5C:
	ldr r0, .L08050F88  @ gUnknown_0203E114
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, .L08050F8C  @ gUnknown_08802B04
	adds r0, r0, r1
	ldr r1, .L08050F90  @ gPal+0x360
	movs r2, #0x10
	bl CpuSet
.L08050F70:
	ldr r0, .L08050F94  @ gBattleHpDisplayedValue
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble .L08050FA0
	ldr r0, .L08050F98  @ gUnknown_08802C84
	ldr r1, .L08050F9C  @ gPal+0x380
	movs r2, #0x10
	bl CpuSet
	b .L08050FB4
	.align 2, 0
.L08050F88: .4byte gUnknown_0203E114
.L08050F8C: .4byte gUnknown_08802B04
.L08050F90: .4byte gPal+0x360
.L08050F94: .4byte gBattleHpDisplayedValue
.L08050F98: .4byte gUnknown_08802C84
.L08050F9C: .4byte gPal+0x380
.L08050FA0:
	ldr r0, .L08051108  @ gUnknown_0203E114
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, .L0805110C  @ gUnknown_08802B04
	adds r0, r0, r1
	ldr r1, .L08051110  @ gPal+0x380
	movs r2, #0x10
	bl CpuSet
.L08050FB4:
	ldr r1, .L08051114  @ gUnknown_0203E1B4
	ldr r0, .L08051118  @ 0x0000FFFF
	strh r0, [r1]
	movs r0, #1
	negs r0, r0
	strh r0, [r1, #2]
	ldr r0, .L0805111C  @ gUnknown_088025D8
	ldr r1, .L08051120  @ 0x06013800
	bl LZ77UnCompVram
	ldr r0, .L08051124  @ gUnknown_08802674
	ldr r1, .L08051128  @ 0x06013940
	bl LZ77UnCompVram
	ldr r0, .L0805112C  @ gUnknown_08802698
	ldr r1, .L08051130  @ 0x06013D40
	bl LZ77UnCompVram
	ldr r6, .L08051108  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, .L08051134  @ gUnknown_08802884
	adds r0, r0, r5
	ldr r4, .L08051138  @ gPal+0x2A0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r6, .L0805113C  @ gUnknown_0203E1B8
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r7, .L08051140  @ gUnknown_02017700
	adds r1, r7, #0
	bl func_08050E90
	ldr r5, .L08051144  @ gUnknown_0203E1BC
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r7, #6
	bl func_08050E90
	ldr r4, .L08051148  @ gUnknown_0203E1C0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r7, #0
	adds r1, #0xc
	bl func_08050E90
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r7, #0
	adds r1, #0x12
	bl func_08050E90
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r1, r7, #0
	adds r1, #0x18
	bl func_08050E90
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r1, r7, #0
	adds r1, #0x1e
	bl func_08050E90
	movs r0, #0
	str r0, [sp]
	ldr r1, .L0805114C  @ gUnknown_020169C8
	ldr r2, .L08051150  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	movs r6, #0
	mov r9, r7
.L08051062:
	movs r5, #0
	lsls r3, r6, #1
	adds r0, r6, #1
	mov r8, r0
	lsls r4, r6, #7
.L0805106C:
	adds r0, r3, r6
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, r9
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, .L08051154  @ gUnknown_088026E4
	adds r0, r0, r1
	ldr r7, .L0805114C  @ gUnknown_020169C8
	adds r1, r4, r7
	movs r2, #0x10
	str r3, [sp, #4]
	bl CpuSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp, #4]
	cmp r5, #2
	bls .L0805106C
	mov r6, r8
	cmp r6, #5
	bls .L08051062
	ldr r1, .L08051158  @ 0x06013A00
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r7, #0
	adds r2, r4, #0
	bl RegisterDataMove
	adds r0, r7, r4
	ldr r1, .L0805115C  @ 0x06013E00
	adds r2, r4, #0
	bl RegisterDataMove
	bl InitIcons
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, .L08051160  @ gpUnitLeft_BattleStruct
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	movs r1, #0xee
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, .L08051164  @ gpUnitRight_BattleStruct
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIcon
	movs r1, #0xef
	lsls r1, r1, #1
	bl PutIconObjImg
	ldr r0, .L08051168  @ gUnknown_0859ED70
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051108: .4byte gUnknown_0203E114
.L0805110C: .4byte gUnknown_08802B04
.L08051110: .4byte gPal+0x380
.L08051114: .4byte gUnknown_0203E1B4
.L08051118: .4byte 0x0000FFFF
.L0805111C: .4byte gUnknown_088025D8
.L08051120: .4byte 0x06013800
.L08051124: .4byte gUnknown_08802674
.L08051128: .4byte 0x06013940
.L0805112C: .4byte gUnknown_08802698
.L08051130: .4byte 0x06013D40
.L08051134: .4byte gUnknown_08802884
.L08051138: .4byte gPal+0x2A0
.L0805113C: .4byte gUnknown_0203E1B8
.L08051140: .4byte gUnknown_02017700
.L08051144: .4byte gUnknown_0203E1BC
.L08051148: .4byte gUnknown_0203E1C0
.L0805114C: .4byte gUnknown_020169C8
.L08051150: .4byte 0x01000100
.L08051154: .4byte gUnknown_088026E4
.L08051158: .4byte 0x06013A00
.L0805115C: .4byte 0x06013E00
.L08051160: .4byte gpUnitLeft_BattleStruct
.L08051164: .4byte gpUnitRight_BattleStruct
.L08051168: .4byte gUnknown_0859ED70

	THUMB_FUNC_END StartEkrGauge

	THUMB_FUNC_START EndEkrGauge
EndEkrGauge: @ 0x0805116C
	push {lr}
	ldr r0, .L0805117C  @ gUnknown_02000068
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0805117C: .4byte gUnknown_02000068

	THUMB_FUNC_END EndEkrGauge

	THUMB_FUNC_START EkrGauge_8051180
EkrGauge_8051180: @ 0x08051180
	ldr r0, .L0805118C  @ gUnknown_02000068
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L0805118C: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051180

	THUMB_FUNC_START EkrGauge_8051190
EkrGauge_8051190: @ 0x08051190
	ldr r0, .L0805119C  @ gUnknown_02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L0805119C: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051190

	THUMB_FUNC_START EkrGauge_80511A0
EkrGauge_80511A0: @ 0x080511A0
	ldr r0, .L080511AC  @ gUnknown_02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
.L080511AC: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511A0

	THUMB_FUNC_START EkrGauge_80511B0
EkrGauge_80511B0: @ 0x080511B0
	ldr r0, .L080511BC  @ gUnknown_02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L080511BC: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511B0

	THUMB_FUNC_START EkrGauge_80511C0
EkrGauge_80511C0: @ 0x080511C0
	lsls r0, r0, #0x10
	ldr r1, .L080511CC  @ gUnknown_02000068
	ldr r1, [r1]
	lsrs r0, r0, #6
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
.L080511CC: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511C0

	THUMB_FUNC_START EkrGauge_80511D0
EkrGauge_80511D0: @ 0x080511D0
	ldr r2, .L080511E0  @ gUnknown_02000068
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
.L080511E0: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511D0

	THUMB_FUNC_START EkrGauge_80511E4
EkrGauge_80511E4: @ 0x080511E4
	ldr r2, .L080511F4  @ gUnknown_02000068
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L080511F4: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511E4

	THUMB_FUNC_START EkrGauge_80511F8
EkrGauge_80511F8: @ 0x080511F8
	ldr r0, .L08051204  @ gUnknown_02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08051204: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511F8

	THUMB_FUNC_START EkrGauge_8051208
EkrGauge_8051208: @ 0x08051208
	ldr r0, .L08051214  @ gUnknown_02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08051214: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051208

	THUMB_FUNC_START EkrGauge_8051218
EkrGauge_8051218: @ 0x08051218
	ldr r0, .L08051224  @ gUnknown_02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08051224: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051218

	THUMB_FUNC_START EkrGauge_8051228
EkrGauge_8051228: @ 0x08051228
	ldr r0, .L08051234  @ gUnknown_02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08051234: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051228

	THUMB_FUNC_START func_08051238
func_08051238: @ 0x08051238
	push {lr}
	adds r3, r0, #0
	cmp r1, #0
	ble .L08051260
	cmp r2, #1
	beq .L08051250
	cmp r2, #1
	bcs .L08051258
	ldr r0, .L0805124C  @ gUnknown_085B955C
	b .L0805127A
	.align 2, 0
.L0805124C: .4byte gUnknown_085B955C
.L08051250:
	ldr r0, .L08051254  @ gUnknown_085B9574
	b .L0805127A
	.align 2, 0
.L08051254: .4byte gUnknown_085B9574
.L08051258:
	ldr r0, .L0805125C  @ gUnknown_085B958C
	b .L0805127A
	.align 2, 0
.L0805125C: .4byte gUnknown_085B958C
.L08051260:
	cmp r2, #1
	beq .L08051270
	cmp r2, #1
	bcs .L08051278
	ldr r0, .L0805126C  @ gUnknown_085B95A4
	b .L0805127A
	.align 2, 0
.L0805126C: .4byte gUnknown_085B95A4
.L08051270:
	ldr r0, .L08051274  @ gUnknown_085B95BC
	b .L0805127A
	.align 2, 0
.L08051274: .4byte gUnknown_085B95BC
.L08051278:
	ldr r0, .L08051280  @ gUnknown_085B95D4
.L0805127A:
	str r0, [r3, #0x3c]
	pop {r0}
	bx r0
	.align 2, 0
.L08051280: .4byte gUnknown_085B95D4

	THUMB_FUNC_END func_08051238

	THUMB_FUNC_START ekrGauge_Loop
ekrGauge_Loop: @ 0x08051284
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x118
	mov sl, r0
	movs r0, #0
	str r0, [sp, #0xd8]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl DivRem
	str r0, [sp, #0xe8]
	mov r0, sl
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne .L080512B0
	b .L08051A7E
.L080512B0:
	mov r0, sl
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #0x110]
	cmp r1, #0
	beq .L080512BE
	b .L080513C4
.L080512BE:
	mov r1, sl
	ldrh r0, [r1, #0x3a]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x13
	lsls r0, r4, #5
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r7, r0, r2
	cmp r7, #0
	bge .L080512D4
	movs r7, #0
.L080512D4:
	adds r6, r4, #7
	cmp r6, #7
	ble .L080512DC
	movs r6, #7
.L080512DC:
	movs r0, #7
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov r8, r1
	ldr r0, .L08051300  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt .L08051304
	cmp r0, #2
	bgt .L08051304
	movs r4, #0
	mov r9, r4
	movs r5, #0xf
	str r5, [sp, #0xdc]
	b .L0805130A
	.align 2, 0
.L08051300: .4byte gBattleAnimSceneLayoutEnum
.L08051304:
	movs r0, #8
	str r0, [sp, #0xdc]
	mov r9, r0
.L0805130A:
	ldr r4, .L08051374  @ gBg0Tm+0x340
	movs r1, #0x80
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #8
	movs r3, #0
	bl FillBGRect
	mov r2, sl
	ldr r0, [r2, #0x4c]
	cmp r0, #0
	bne .L0805135C
	ldr r0, .L08051378  @ gUnknown_08802274
	add r0, r8
	lsls r5, r7, #1
	mov r3, r9
	lsls r1, r3, #1
	ldr r3, .L0805137C  @ 0xFFFFFCC0
	adds r2, r4, r3
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	negs r1, r1
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl func_08070E94
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl func_08070D04
.L0805135C:
	mov r1, sl
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne .L080513BE
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	bne .L08051384
	ldr r0, .L08051380  @ gUnknown_08802348
	mov r3, r8
	adds r2, r3, r0
	b .L0805138A
	.align 2, 0
.L08051374: .4byte gBg0Tm+0x340
.L08051378: .4byte gUnknown_08802274
.L0805137C: .4byte 0xFFFFFCC0
.L08051380: .4byte gUnknown_08802348
.L08051384:
	ldr r0, .L0805141C  @ gUnknown_08802428
	mov r4, r8
	adds r2, r4, r0
.L0805138A:
	lsls r5, r7, #1
	ldr r1, [sp, #0xdc]
	lsls r0, r1, #1
	ldr r1, .L08051420  @ gBg0Tm
	adds r0, r0, r1
	adds r5, r5, r0
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r5, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl func_08070E94
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	movs r3, #3
	bl func_08070D04
.L080513BE:
	movs r0, #1
	bl EnableBgSync
.L080513C4:
	ldr r3, .L08051424  @ gUnknown_0203E1B4
	ldr r0, .L08051428  @ gBattleHpDisplayedValue
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldrh r4, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	adds r5, r0, #0
	cmp r2, r1
	beq .L080513DC
	movs r6, #1
	str r6, [sp, #0xd8]
.L080513DC:
	movs r0, #2
	ldrsh r1, [r3, r0]
	ldrh r2, [r5, #2]
	movs r6, #2
	ldrsh r0, [r5, r6]
	cmp r1, r0
	beq .L080513EE
	movs r0, #1
	str r0, [sp, #0xd8]
.L080513EE:
	strh r4, [r3]
	strh r2, [r3, #2]
	ldrh r7, [r5]
	ldr r0, .L0805142C  @ gUnknown_0203E1B0
	ldrh r6, [r0]
	ldrh r1, [r5, #2]
	mov r8, r1
	ldrh r0, [r0, #2]
	str r0, [sp, #0xd4]
	ldr r0, .L08051430  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #3
	beq .L08051434
	cmp r0, #3
	bgt .L08051454
	cmp r0, #0
	blt .L08051454
	mov r3, sl
	movs r4, #0x32
	ldrsh r3, [r3, r4]
	str r3, [sp, #0xe0]
	b .L0805145E
	.align 2, 0
.L0805141C: .4byte gUnknown_08802428
.L08051420: .4byte gBg0Tm
.L08051424: .4byte gUnknown_0203E1B4
.L08051428: .4byte gBattleHpDisplayedValue
.L0805142C: .4byte gUnknown_0203E1B0
.L08051430: .4byte gBattleAnimSceneLayoutEnum
.L08051434:
	ldr r0, .L08051448  @ gBattleAnimUnitEnabledLookup
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne .L0805144C
	mov r2, sl
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	adds r0, #0x38
	b .L0805145C
	.align 2, 0
.L08051448: .4byte gBattleAnimUnitEnabledLookup
.L0805144C:
	mov r4, sl
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	b .L0805145A
.L08051454:
	mov r2, sl
	movs r3, #0x32
	ldrsh r0, [r2, r3]
.L0805145A:
	subs r0, #0x38
.L0805145C:
	str r0, [sp, #0xe0]
.L0805145E:
	ldr r4, [sp, #0x110]
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805147C
	mov r0, sl
	movs r1, #0x3a
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xe4]
	ldr r0, .L08051478  @ 0x0000FFF8
	ldr r2, [sp, #0xe4]
	ands r2, r0
	str r2, [sp, #0xe4]
	b .L08051484
	.align 2, 0
.L08051478: .4byte 0x0000FFF8
.L0805147C:
	mov r3, sl
	movs r4, #0x3a
	ldrsh r3, [r3, r4]
	str r3, [sp, #0xe4]
.L08051484:
	adds r4, r5, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Div
	add r3, sp, #0x68
	strh r0, [r3]
	ldrh r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #1
	ldrh r1, [r4]
	subs r1, r1, r2
	strh r1, [r3, #2]
	lsls r0, r0, #0x10
	mov r9, r3
	cmp r0, #0
	bne .L080514AE
	movs r0, #0xb
	strh r0, [r3]
.L080514AE:
	movs r2, #2
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl Div
	mov r3, r9
	strh r0, [r3, #4]
	ldrh r1, [r3, #4]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #1
	ldrh r1, [r4, #2]
	subs r1, r1, r2
	strh r1, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L080514D4
	movs r0, #0xb
	strh r0, [r3, #4]
.L080514D4:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble .L080514E4
	movs r0, #0xc
	mov r2, r9
	strh r0, [r2]
	strh r0, [r2, #2]
.L080514E4:
	movs r3, #2
	ldrsh r0, [r5, r3]
	cmp r0, #0x50
	ble .L080514F4
	movs r0, #0xc
	mov r4, r9
	strh r0, [r4, #4]
	strh r0, [r4, #6]
.L080514F4:
	ldr r5, [sp, #0xe0]
	adds r5, #9
	str r5, [sp, #0xfc]
	ldr r0, [sp, #0xe4]
	adds r0, #0x91
	str r0, [sp, #0xf4]
	ldr r1, [sp, #0xe0]
	adds r1, #0x81
	str r1, [sp, #0xf0]
	lsls r2, r7, #0x10
	str r2, [sp, #0x100]
	lsls r6, r6, #0x10
	str r6, [sp, #0x104]
	ldr r3, [sp, #0xe0]
	adds r3, #0x1d
	str r3, [sp, #0x114]
	mov r4, r8
	lsls r4, r4, #0x10
	str r4, [sp, #0x108]
	ldr r5, [sp, #0xd4]
	lsls r5, r5, #0x10
	str r5, [sp, #0x10c]
	ldr r6, [sp, #0xe0]
	adds r6, #0x95
	str r6, [sp, #0xf8]
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne .L08051582
	add r0, sp, #0xd0
	movs r1, #0
	str r1, [r0]
	ldr r1, .L080515BC  @ gUnknown_02016DC8
	ldr r2, .L080515C0  @ 0x01000020
	bl CpuFastSet
	movs r0, #0
.L0805153C:
	adds r1, r0, #1
	mov r8, r1
	lsls r5, r0, #6
	lsls r0, r0, #2
	mov r2, r9
	adds r4, r0, r2
	movs r6, #1
.L0805154A:
	ldrh r0, [r4]
	lsls r0, r0, #5
	ldr r1, .L080515C4  @ gUnknown_088026E4
	adds r0, r0, r1
	ldr r7, .L080515BC  @ gUnknown_02016DC8
	adds r1, r5, r7
	movs r2, #0x10
	bl CpuSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge .L0805154A
	mov r0, r8
	cmp r0, #1
	ble .L0805153C
	ldr r1, .L080515C8  @ 0x060139C0
	adds r0, r7, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, .L080515CC  @ 0x06013DC0
	movs r2, #0x40
	bl RegisterDataMove
.L08051582:
	add r0, sp, #8
	movs r4, #0
	ldr r1, .L080515D0  @ 0x0000B1CE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r5, sp, #0xfc
	ldrh r5, [r5]
	strh r5, [r0, #2]
	add r6, sp, #0xf4
	ldrh r6, [r6]
	strh r6, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #0
	bl func_080522F4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq .L080515D8
	ldr r0, .L080515D4  @ gUnknown_085B940C
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b .L08051602
	.align 2, 0
.L080515BC: .4byte gUnknown_02016DC8
.L080515C0: .4byte 0x01000020
.L080515C4: .4byte gUnknown_088026E4
.L080515C8: .4byte 0x060139C0
.L080515CC: .4byte 0x06013DC0
.L080515D0: .4byte 0x0000B1CE
.L080515D4: .4byte gUnknown_085B940C
.L080515D8:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, .L0805164C  @ gUnknown_085B940C
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl func_0807180C
.L08051602:
	mov r1, sl
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	bne .L08051610
	add r0, sp, #8
	bl BsoPutOam
.L08051610:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #8
	ldr r1, .L08051650  @ 0x0000C1EE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r5, sp, #0xf0
	ldrh r5, [r5]
	strh r5, [r0, #2]
	add r6, sp, #0xf4
	ldrh r6, [r6]
	strh r6, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #1
	bl func_080522F4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq .L08051654
	ldr r0, .L0805164C  @ gUnknown_085B940C
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b .L0805167E
	.align 2, 0
.L0805164C: .4byte gUnknown_085B940C
.L08051650: .4byte 0x0000C1EE
.L08051654:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, .L08051778  @ gUnknown_085B940C
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl func_0807180C
.L0805167E:
	mov r1, sl
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne .L0805168C
	add r0, sp, #8
	bl BsoPutOam
.L0805168C:
	ldr r2, [sp, #0x100]
	ldr r3, .L0805177C  @ 0xFFD80000
	adds r1, r2, r3
	ldr r4, [sp, #0x104]
	adds r0, r4, r3
	lsrs r5, r0, #0x10
	lsrs r7, r2, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble .L080516A8
	movs r6, #0x28
.L080516A8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L080516B2
	movs r5, #0x28
.L080516B2:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge .L080516BA
	movs r6, #0
.L080516BA:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge .L080516C2
	movs r5, #0
.L080516C2:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L080516CC
	movs r7, #0x28
.L080516CC:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L080516DA
	movs r2, #0x28
	mov r8, r2
.L080516DA:
	add r0, sp, #8
	movs r3, #0
	movs r1, #0xb0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sl
	ldr r0, [r4, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	str r3, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, .L08051780  @ gUnknown_085B93D0
	str r0, [sp, #0x44]
	ldr r2, [r4, #0x4c]
	mov r9, r2
	cmp r2, #0
	bne .L080517B0
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	add r4, sp, #0x50
	cmp r2, #0
	beq .L0805174A
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl func_08071068
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne .L08051726
	ldr r1, .L08051784  @ gUnknown_02016E48
	adds r0, r4, #0
	bl func_08050E40
.L08051726:
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	adds r0, r1, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	strh r0, [r1, #8]
	adds r0, r1, #0
	mov r6, r9
	strh r6, [r0, #0xc]
	bl BsoPutOam
.L0805174A:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl func_08071068
	ldr r1, [sp, #0xd8]
	cmp r1, #1
	bne .L08051768
	ldr r1, .L08051788  @ gUnknown_02017248
	adds r0, r4, #0
	bl func_08050E40
.L08051768:
	cmp r5, #0
	beq .L0805178C
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x95
	strh r0, [r1, #4]
	b .L08051794
	.align 2, 0
.L08051778: .4byte gUnknown_085B940C
.L0805177C: .4byte 0xFFD80000
.L08051780: .4byte gUnknown_085B93D0
.L08051784: .4byte gUnknown_02016E48
.L08051788: .4byte gUnknown_02017248
.L0805178C:
	add r0, sp, #8
	add r2, sp, #0xf4
	ldrh r2, [r2]
	strh r2, [r0, #4]
.L08051794:
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r3, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl BsoPutOam
.L080517B0:
	ldr r3, [sp, #0x108]
	ldr r4, .L080518A8  @ 0xFFD80000
	adds r1, r3, r4
	ldr r5, [sp, #0x10c]
	adds r0, r5, r4
	lsrs r5, r0, #0x10
	lsrs r7, r3, #0x10
	ldr r6, [sp, #0x10c]
	lsrs r6, r6, #0x10
	mov r8, r6
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble .L080517CE
	movs r6, #0x28
.L080517CE:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L080517D8
	movs r5, #0x28
.L080517D8:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge .L080517E0
	movs r6, #0
.L080517E0:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge .L080517E8
	movs r5, #0
.L080517E8:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L080517F2
	movs r7, #0x28
.L080517F2:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L08051800
	movs r2, #0x28
	mov r8, r2
.L08051800:
	add r0, sp, #8
	movs r3, #0
	mov r9, r3
	movs r1, #0xc0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sl
	ldr r0, [r4, #0x44]
	add r4, sp, #0xec
	strh r3, [r4]
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, r9
	str r0, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0xf8
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, .L080518AC  @ gUnknown_085B93D0
	str r0, [sp, #0x44]
	mov r2, sl
	ldr r2, [r2, #0x50]
	mov r9, r2
	cmp r2, #0
	bne .L080518DC
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	add r4, sp, #0x50
	cmp r2, #0
	beq .L0805187C
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl func_08071068
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne .L08051858
	ldr r1, .L080518B0  @ gUnknown_02017048
	adds r0, r4, #0
	bl func_08050E40
.L08051858:
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	adds r0, r1, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	mov r6, r9
	strh r6, [r0, #0xc]
	bl BsoPutOam
.L0805187C:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl func_08071068
	ldr r1, [sp, #0xd8]
	cmp r1, #1
	bne .L0805189A
	ldr r1, .L080518B4  @ gUnknown_02017448
	adds r0, r4, #0
	bl func_08050E40
.L0805189A:
	cmp r5, #0
	beq .L080518B8
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x95
	strh r0, [r1, #4]
	b .L080518C0
	.align 2, 0
.L080518A8: .4byte 0xFFD80000
.L080518AC: .4byte gUnknown_085B93D0
.L080518B0: .4byte gUnknown_02017048
.L080518B4: .4byte gUnknown_02017448
.L080518B8:
	add r0, sp, #8
	add r2, sp, #0xf4
	ldrh r2, [r2]
	strh r2, [r0, #4]
.L080518C0:
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r3, #0
	movs r1, #0x30
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl BsoPutOam
.L080518DC:
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne .L080518EE
	ldr r0, .L08051A90  @ gUnknown_02016E48
	ldr r1, .L08051A94  @ 0x06013000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
.L080518EE:
	mov r5, sl
	ldr r4, [r5, #0x4c]
	cmp r4, #0
	bne .L0805194A
	str r4, [sp, #0x24]
	ldr r0, .L08051A98  @ gUnknown_085B9424
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08051A9C  @ 0x0000B1D0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r5, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x12
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl BsoPutOam
	str r4, [sp, #0x24]
	ldr r0, .L08051AA0  @ gUnknown_085B949C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08051AA4  @ 0x0000B1C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r5, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x65
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl BsoPutOam
.L0805194A:
	mov r6, sl
	ldr r4, [r6, #0x50]
	cmp r4, #0
	bne .L080519A6
	str r4, [sp, #0x24]
	ldr r0, .L08051A98  @ gUnknown_085B9424
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08051AA8  @ 0x0000C1F0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0xd8
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl BsoPutOam
	str r4, [sp, #0x24]
	ldr r0, .L08051AAC  @ gUnknown_085B94F0
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08051AB0  @ 0x0000C1C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x87
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl BsoPutOam
.L080519A6:
	mov r0, sl
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne .L08051A12
	str r4, [sp, #0x24]
	ldr r1, .L08051AB4  @ gUnknown_0203E1D4
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe4]
	adds r5, #0x79
	cmp r0, #0
	beq .L080519EC
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe8]
	bl func_08051238
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r6, sl
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x36
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl BsoPutOam
.L080519EC:
	ldr r0, .L08051AB8  @ gUnknown_085B9544
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08051ABC  @ 0x0000D1DC
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x2c
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl BsoPutOam
.L08051A12:
	mov r5, sl
	ldr r4, [r5, #0x50]
	cmp r4, #0
	bne .L08051A7E
	str r4, [sp, #0x24]
	ldr r1, .L08051AB4  @ gUnknown_0203E1D4
	movs r6, #2
	ldrsh r0, [r1, r6]
	ldr r5, [sp, #0xe4]
	adds r5, #0x79
	cmp r0, #0
	beq .L08051A58
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe8]
	bl func_08051238
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x85
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl BsoPutOam
.L08051A58:
	ldr r0, .L08051AB8  @ gUnknown_085B9544
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, .L08051AC0  @ 0x0000E1DE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r6, sl
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x7b
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl BsoPutOam
.L08051A7E:
	add sp, #0x118
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051A90: .4byte gUnknown_02016E48
.L08051A94: .4byte 0x06013000
.L08051A98: .4byte gUnknown_085B9424
.L08051A9C: .4byte 0x0000B1D0
.L08051AA0: .4byte gUnknown_085B949C
.L08051AA4: .4byte 0x0000B1C0
.L08051AA8: .4byte 0x0000C1F0
.L08051AAC: .4byte gUnknown_085B94F0
.L08051AB0: .4byte 0x0000C1C0
.L08051AB4: .4byte gUnknown_0203E1D4
.L08051AB8: .4byte gUnknown_085B9544
.L08051ABC: .4byte 0x0000D1DC
.L08051AC0: .4byte 0x0000E1DE

	THUMB_FUNC_END ekrGauge_Loop

	THUMB_FUNC_START StartEkrDispUP
StartEkrDispUP: @ 0x08051AC4
	push {r4, lr}
	ldr r4, .L08051AEC  @ gUnknown_0200006C
	ldr r0, .L08051AF0  @ gUnknown_085B95EC
	movs r1, #5
	bl SpawnProc
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_8051B48
	bl func_08051B08
	bl func_08051BA0
	bl func_08051B80
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08051AEC: .4byte gUnknown_0200006C
.L08051AF0: .4byte gUnknown_085B95EC

	THUMB_FUNC_END StartEkrDispUP

	THUMB_FUNC_START func_08051AF4
func_08051AF4: @ 0x08051AF4
	push {lr}
	ldr r0, .L08051B04  @ gUnknown_0200006C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L08051B04: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051AF4

	THUMB_FUNC_START func_08051B08
func_08051B08: @ 0x08051B08
	ldr r0, .L08051B14  @ gUnknown_0200006C
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08051B14: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051B08

	THUMB_FUNC_START func_08051B18
func_08051B18: @ 0x08051B18
	ldr r0, .L08051B24  @ gUnknown_0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08051B24: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051B18

	THUMB_FUNC_START func_08051B28
func_08051B28: @ 0x08051B28
	ldr r0, .L08051B34  @ gUnknown_0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
.L08051B34: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051B28

	THUMB_FUNC_START func_08051B38
func_08051B38: @ 0x08051B38
	ldr r0, .L08051B44  @ gUnknown_0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08051B44: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051B38

	THUMB_FUNC_START EkrDispUP_8051B48
EkrDispUP_8051B48: @ 0x08051B48
	ldr r2, .L08051B58  @ gUnknown_0200006C
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
.L08051B58: .4byte gUnknown_0200006C

	THUMB_FUNC_END EkrDispUP_8051B48

	THUMB_FUNC_START func_08051B5C
func_08051B5C: @ 0x08051B5C
	ldr r2, .L08051B6C  @ gUnknown_0200006C
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L08051B6C: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051B5C

	THUMB_FUNC_START func_08051B70
func_08051B70: @ 0x08051B70
	ldr r0, .L08051B7C  @ gUnknown_0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08051B7C: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051B70

	THUMB_FUNC_START func_08051B80
func_08051B80: @ 0x08051B80
	ldr r0, .L08051B8C  @ gUnknown_0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08051B8C: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051B80

	THUMB_FUNC_START func_08051B90
func_08051B90: @ 0x08051B90
	ldr r0, .L08051B9C  @ gUnknown_0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08051B9C: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051B90

	THUMB_FUNC_START func_08051BA0
func_08051BA0: @ 0x08051BA0
	ldr r0, .L08051BAC  @ gUnknown_0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08051BAC: .4byte gUnknown_0200006C

	THUMB_FUNC_END func_08051BA0

	THUMB_FUNC_START ekrDispUP_Loop
ekrDispUP_Loop: @ 0x08051BB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	beq .L08051CA6
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08051CA6
	ldrh r0, [r7, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r1, r0, #5
	mov r8, r1
	cmp r1, #0
	bge .L08051BE2
	movs r2, #0
	mov r8, r2
.L08051BE2:
	adds r6, r0, #7
	cmp r6, #6
	ble .L08051BEA
	movs r6, #6
.L08051BEA:
	movs r0, #6
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	str r1, [sp, #8]
	ldr r0, .L08051C08  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt .L08051C0C
	cmp r0, #2
	bgt .L08051C0C
	movs r4, #0
	b .L08051C0E
	.align 2, 0
.L08051C08: .4byte gBattleAnimSceneLayoutEnum
.L08051C0C:
	movs r4, #0xf
.L08051C0E:
	ldr r2, .L08051CB8  @ gBg0Tm
	mov r9, r2
	movs r0, #0x80
	mov sl, r0
	str r0, [sp]
	mov r0, r9
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl FillBGRect
	cmp r6, #0
	ble .L08051CA0
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne .L08051C64
	ldr r0, .L08051CBC  @ gUnknown_0880210C
	ldr r1, [sp, #8]
	adds r0, r1, r0
	mov r2, r8
	lsls r5, r2, #1
	lsls r1, r4, #1
	add r1, r9
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	negs r1, r1
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl func_08070E94
	mov r0, sl
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl func_08070D04
.L08051C64:
	ldr r0, [r7, #0x50]
	cmp r0, #0
	bne .L08051CA0
	ldr r0, .L08051CC0  @ gUnknown_088021C0
	ldr r1, [sp, #8]
	adds r0, r1, r0
	mov r2, r8
	lsls r5, r2, #1
	movs r2, #0xf
	lsls r1, r2, #1
	add r1, r9
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	negs r1, r1
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r3, r4, #0
	bl func_08070E94
	mov r0, sl
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #3
	bl func_08070D04
.L08051CA0:
	movs r0, #1
	bl EnableBgSync
.L08051CA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051CB8: .4byte gBg0Tm
.L08051CBC: .4byte gUnknown_0880210C
.L08051CC0: .4byte gUnknown_088021C0

	THUMB_FUNC_END ekrDispUP_Loop

	THUMB_FUNC_START func_08051CC4
func_08051CC4: @ 0x08051CC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, .L08051DB8  @ gDispIo
	ldrb r0, [r4]
	movs r2, #8
	negs r2, r2
	ands r2, r0
	ldrb r0, [r4, #1]
	movs r5, #1
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x41
	negs r0, r0
	ands r2, r0
	strb r2, [r4]
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
	movs r0, #0
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #1
	movs r1, #0
	bl SetBgChrOffset
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #3
	bl SetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBgTilemapOffset
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r4, #0
	str r4, [sp]
	ldr r1, .L08051DBC  @ gBg0Tm
	ldr r5, .L08051DC0  @ 0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, .L08051DC4  @ gBg1Tm
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r6, .L08051DC8  @ gBg2Tm
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L08051DCC
	bl func_08051E00
	b .L08051DD8
	.align 2, 0
.L08051DB8: .4byte gDispIo
.L08051DBC: .4byte gBg0Tm
.L08051DC0: .4byte 0x01000200
.L08051DC4: .4byte gBg1Tm
.L08051DC8: .4byte gBg2Tm
.L08051DCC:
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
.L08051DD8:
	bl func_08051F1C
	bl EnablePalSync
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	bl SetBlendNone
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08051CC4

	THUMB_FUNC_START func_08051E00
func_08051E00: @ 0x08051E00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, .L08051E40  @ gUnknown_0201FADC
	ldr r2, .L08051E44  @ gUnknown_0203E11C
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, .L08051E48  @ battle_terrain_table
	adds r5, r0, r3
	movs r6, #2
	ldrsh r1, [r2, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldr r0, .L08051E4C  @ gBattleAnimSceneLayoutEnum
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r8, r2
	adds r6, r0, #0
	cmp r1, #3
	bgt .L08051E54
	cmp r1, #1
	bge .L08051E78
	cmp r1, #0
	beq .L08051E5C
	ldr r0, .L08051E50  @ gUnknown_020145C8
	b .L08051E8A
	.align 2, 0
.L08051E40: .4byte gUnknown_0201FADC
.L08051E44: .4byte gUnknown_0203E11C
.L08051E48: .4byte battle_terrain_table
.L08051E4C: .4byte gBattleAnimSceneLayoutEnum
.L08051E50: .4byte gUnknown_020145C8
.L08051E54:
	ldr r7, .L08051E70  @ gUnknown_020145C8
	mov ip, r7
	cmp r1, #4
	bne .L08051E8C
.L08051E5C:
	ldr r0, .L08051E74  @ gUnknown_0200003C
	ldr r1, .L08051E70  @ gUnknown_020145C8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	mov ip, r1
	b .L08051E8C
	.align 2, 0
.L08051E70: .4byte gUnknown_020145C8
.L08051E74: .4byte gUnknown_0200003C
.L08051E78:
	ldr r0, .L08051EFC  @ gUnknown_0200003C
	ldr r1, .L08051F00  @ gUnknown_02014DC8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	ldr r0, .L08051F04  @ 0xFFFFF800
	adds r0, r0, r1
.L08051E8A:
	mov ip, r0
.L08051E8C:
	ldr r0, .L08051F08  @ gPlaySt
	ldrb r0, [r0, #0x15]
	ldr r0, .L08051F0C  @ gUnknown_0200004C
	ldr r1, [r5, #0x10]
	str r1, [r0]
	ldr r1, [r3, #0x10]
	str r1, [r0, #4]
	ldr r2, .L08051F10  @ gUnknown_02000044
	ldr r1, .L08051F14  @ gUnknown_085B9D6C
	movs r3, #0
	ldrsh r0, [r6, r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r6, r7]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	mov r3, r8
	ldrh r0, [r3, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldrh r0, [r6]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r2, [r4, #0x1c]
	mov r6, ip
	str r6, [r4, #0x20]
	ldr r0, .L08051F18  @ gUnknown_0203E102
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl func_0805AA68
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08051EFC: .4byte gUnknown_0200003C
.L08051F00: .4byte gUnknown_02014DC8
.L08051F04: .4byte 0xFFFFF800
.L08051F08: .4byte gPlaySt
.L08051F0C: .4byte gUnknown_0200004C
.L08051F10: .4byte gUnknown_02000044
.L08051F14: .4byte gUnknown_085B9D6C
.L08051F18: .4byte gUnknown_0203E102

	THUMB_FUNC_END func_08051E00

	THUMB_FUNC_START func_08051F1C
func_08051F1C: @ 0x08051F1C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, .L08051F5C  @ Pal_SystemText
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08051F60  @ gUnknown_02017648
	ldr r1, .L08051F64  @ 0x06001880
	movs r2, #0xc4
	movs r3, #2
	bl InitTextFont
	bl SetTextDrawNoClear
	ldr r0, .L08051F68  @ gUnknown_08801C14
	ldr r1, .L08051F6C  @ 0x06001000
	bl LZ77UnCompVram
	ldr r0, .L08051F70  @ gBattleAnimUnitEnabledLookup
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08051F78
	ldr r5, .L08051F74  @ gUnknown_085B9354
	b .L08051F86
	.align 2, 0
.L08051F5C: .4byte Pal_SystemText
.L08051F60: .4byte gUnknown_02017648
.L08051F64: .4byte 0x06001880
.L08051F68: .4byte gUnknown_08801C14
.L08051F6C: .4byte 0x06001000
.L08051F70: .4byte gBattleAnimUnitEnabledLookup
.L08051F74: .4byte gUnknown_085B9354
.L08051F78:
	ldr r0, .L08051FC0  @ gpUnitLeft_BattleStruct
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r5, r0, #0
.L08051F86:
	ldr r4, .L08051FC4  @ gUnknown_02017660
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08051FC8  @ gUnknown_08801F7C
	ldr r1, .L08051FCC  @ 0x06001880
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L08051FD0  @ gBattleAnimUnitEnabledLookup
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08051FD8
	ldr r5, .L08051FD4  @ gUnknown_085B9354
	b .L08051FE6
	.align 2, 0
.L08051FC0: .4byte gpUnitLeft_BattleStruct
.L08051FC4: .4byte gUnknown_02017660
.L08051FC8: .4byte gUnknown_08801F7C
.L08051FCC: .4byte 0x06001880
.L08051FD0: .4byte gBattleAnimUnitEnabledLookup
.L08051FD4: .4byte gUnknown_085B9354
.L08051FD8:
	ldr r0, .L08052020  @ gpUnitLeft_BattleStruct
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
.L08051FE6:
	ldr r4, .L08052024  @ gUnknown_02017670
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08052028  @ gUnknown_08801FF4
	ldr r1, .L0805202C  @ 0x06001A40
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L08052030  @ gBattleAnimUnitEnabledLookup
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08052038
	ldr r5, .L08052034  @ gUnknown_085B9354
	b .L08052046
	.align 2, 0
.L08052020: .4byte gpUnitLeft_BattleStruct
.L08052024: .4byte gUnknown_02017670
.L08052028: .4byte gUnknown_08801FF4
.L0805202C: .4byte 0x06001A40
.L08052030: .4byte gBattleAnimUnitEnabledLookup
.L08052034: .4byte gUnknown_085B9354
.L08052038:
	ldr r0, .L08052080  @ gpUnitRight_BattleStruct
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetMsg
	adds r5, r0, #0
.L08052046:
	ldr r4, .L08052084  @ gUnknown_02017678
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08052088  @ gUnknown_08802044
	ldr r1, .L0805208C  @ 0x06001C40
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r0, .L08052090  @ gBattleAnimUnitEnabledLookup
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08052098
	ldr r5, .L08052094  @ gUnknown_085B9354
	b .L080520A6
	.align 2, 0
.L08052080: .4byte gpUnitRight_BattleStruct
.L08052084: .4byte gUnknown_02017678
.L08052088: .4byte gUnknown_08802044
.L0805208C: .4byte 0x06001C40
.L08052090: .4byte gBattleAnimUnitEnabledLookup
.L08052094: .4byte gUnknown_085B9354
.L08052098:
	ldr r0, .L0805215C  @ gpUnitRight_BattleStruct
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
.L080520A6:
	ldr r4, .L08052160  @ gUnknown_02017668
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	movs r0, #0x3e
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	ldr r0, .L08052164  @ gUnknown_088020BC
	ldr r1, .L08052168  @ 0x06001E00
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	ldr r4, .L0805216C  @ gBg0Tm
	adds r0, r4, #0
	movs r1, #0x80
	bl TmFill
	ldr r0, .L08052170  @ gUnknown_08802508
	adds r6, r4, #0
	adds r6, #0x3c
	movs r1, #1
	negs r1, r1
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x14
	bl func_08070E94
	adds r4, #0x3e
	movs r5, #0x80
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #2
	bl func_08070D04
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #3
	bl func_08070D04
	movs r0, #1
	bl EnableBgSync
	ldr r6, .L08052174  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, .L08052178  @ gUnknown_08802558
	adds r0, r0, r5
	ldr r4, .L0805217C  @ gPal+0x40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r1, .L08052180  @ gUnknown_02000038
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805215C: .4byte gpUnitRight_BattleStruct
.L08052160: .4byte gUnknown_02017668
.L08052164: .4byte gUnknown_088020BC
.L08052168: .4byte 0x06001E00
.L0805216C: .4byte gBg0Tm
.L08052170: .4byte gUnknown_08802508
.L08052174: .4byte gUnknown_0203E114
.L08052178: .4byte gUnknown_08802558
.L0805217C: .4byte gPal+0x40
.L08052180: .4byte gUnknown_02000038

	THUMB_FUNC_END func_08051F1C

	THUMB_FUNC_START func_08052184
func_08052184: @ 0x08052184
	push {r4, r5, lr}
	ldr r0, .L0805219C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi .L080521C4
	lsls r0, r0, #2
	ldr r1, .L080521A0  @ .L080521A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805219C: .4byte gBattleAnimSceneLayoutEnum
.L080521A0: .4byte .L080521A4
.L080521A4: @ jump table
	.4byte .L0805220C @ case 0
	.4byte .L080521B8 @ case 1
	.4byte .L080521C4 @ case 2
	.4byte .L0805220C @ case 3
	.4byte .L0805220C @ case 4
.L080521B8:
	ldr r0, .L080521C0  @ gBattleAnimInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	b .L0805220E
	.align 2, 0
.L080521C0: .4byte gBattleAnimInitialHitSide
.L080521C4:
	movs r1, #0
	movs r5, #0
	ldr r0, .L080521F4  @ gUnknown_0203E0FC
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne .L080521EC
	ldr r4, .L080521F8  @ gBattleCharacterIndices
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl ShouldCallBattleQuote
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	bl ShouldCallBattleQuote
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
.L080521EC:
	cmp r5, #1
	bne .L080521FC
	movs r0, #0
	b .L0805220E
	.align 2, 0
.L080521F4: .4byte gUnknown_0203E0FC
.L080521F8: .4byte gBattleCharacterIndices
.L080521FC:
	cmp r1, #1
	beq .L0805220C
	ldr r0, .L08052208  @ gBattleAnimInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	b .L0805220E
	.align 2, 0
.L08052208: .4byte gBattleAnimInitialHitSide
.L0805220C:
	movs r0, #1
.L0805220E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08052184

	THUMB_FUNC_START func_08052214
func_08052214: @ 0x08052214
	ldr r2, .L0805221C  @ gUnknown_02017760
	strh r0, [r2]
	strh r1, [r2, #2]
	bx lr
	.align 2, 0
.L0805221C: .4byte gUnknown_02017760

	THUMB_FUNC_END func_08052214

	THUMB_FUNC_START func_08052220
func_08052220: @ 0x08052220
	push {r4, lr}
	ldr r0, .L08052284  @ gUnknown_02017728
	movs r4, #0
	str r4, [r0]
	ldr r0, .L08052288  @ gUnknown_0201772C
	str r4, [r0]
	ldr r0, .L0805228C  @ gUnknown_02017730
	str r4, [r0]
	ldr r0, .L08052290  @ gUnknown_02017738
	str r4, [r0]
	ldr r0, .L08052294  @ gUnknown_0201773C
	str r4, [r0]
	ldr r0, .L08052298  @ gUnknown_02017740
	str r4, [r0]
	ldr r0, .L0805229C  @ gUnknown_02017748
	str r4, [r0]
	ldr r0, .L080522A0  @ gUnknown_0201774C
	str r4, [r0]
	ldr r0, .L080522A4  @ gUnknown_02017750
	str r4, [r0]
	ldr r0, .L080522A8  @ gUnknown_02017754
	str r4, [r0]
	ldr r0, .L080522AC  @ gUnknown_02017758
	str r4, [r0]
	ldr r0, .L080522B0  @ gUnknown_0201775C
	str r4, [r0]
	movs r0, #0
	movs r1, #0
	bl func_08052214
	ldr r0, .L080522B4  @ gUnknown_02017764
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, .L080522B8  @ gUnknown_02017768
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, .L080522BC  @ gUnknown_02017780
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, .L080522C0  @ gUnknown_0201776C
	str r4, [r0]
	str r4, [r0, #4]
	ldr r0, .L080522C4  @ gUnknown_02017778
	str r4, [r0]
	ldr r0, .L080522C8  @ gUnknown_0201777C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052284: .4byte gUnknown_02017728
.L08052288: .4byte gUnknown_0201772C
.L0805228C: .4byte gUnknown_02017730
.L08052290: .4byte gUnknown_02017738
.L08052294: .4byte gUnknown_0201773C
.L08052298: .4byte gUnknown_02017740
.L0805229C: .4byte gUnknown_02017748
.L080522A0: .4byte gUnknown_0201774C
.L080522A4: .4byte gUnknown_02017750
.L080522A8: .4byte gUnknown_02017754
.L080522AC: .4byte gUnknown_02017758
.L080522B0: .4byte gUnknown_0201775C
.L080522B4: .4byte gUnknown_02017764
.L080522B8: .4byte gUnknown_02017768
.L080522BC: .4byte gUnknown_02017780
.L080522C0: .4byte gUnknown_0201776C
.L080522C4: .4byte gUnknown_02017778
.L080522C8: .4byte gUnknown_0201777C

	THUMB_FUNC_END func_08052220

	THUMB_FUNC_START func_080522CC
func_080522CC: @ 0x080522CC
	push {lr}
	ldr r0, .L080522E4  @ gUnknown_02017728
	ldr r0, [r0]
	cmp r0, #0
	bne .L080522EC
	ldr r0, .L080522E8  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne .L080522EC
	movs r0, #1
	b .L080522EE
	.align 2, 0
.L080522E4: .4byte gUnknown_02017728
.L080522E8: .4byte gUnknown_0201772C
.L080522EC:
	movs r0, #0
.L080522EE:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080522CC

	THUMB_FUNC_START func_080522F4
func_080522F4: @ 0x080522F4
	ldr r1, .L08052300  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
.L08052300: .4byte gUnknown_02017780

	THUMB_FUNC_END func_080522F4

	THUMB_FUNC_START StartEfxHpBar
StartEfxHpBar: @ 0x08052304
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L080523E0
	ldr r1, .L08052350  @ gUnknown_02017728
	ldr r0, [r1]
	cmp r0, #0
	bne .L080523E0
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08052354  @ gUnknown_085B9604
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x64]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805235C
	ldr r0, .L08052358  @ gUnknown_02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b .L08052364
	.align 2, 0
.L08052350: .4byte gUnknown_02017728
.L08052354: .4byte gUnknown_085B9604
.L08052358: .4byte gUnknown_02000000
.L0805235C:
	ldr r0, .L080523B8  @ gUnknown_02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
.L08052364:
	str r0, [r6, #0x60]
	ldr r4, .L080523BC  @ gUnknown_0203E152
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble .L080523C0
	movs r0, #1
	negs r0, r0
	b .L080523C2
	.align 2, 0
.L080523B8: .4byte gUnknown_02000000
.L080523BC: .4byte gUnknown_0203E152
.L080523C0:
	movs r0, #1
.L080523C2:
	str r0, [r6, #0x48]
	movs r1, #0
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	ldr r1, .L080523E8  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
.L080523E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080523E8: .4byte gUnknown_02017780

	THUMB_FUNC_END StartEfxHpBar

	THUMB_FUNC_START func_080523EC
func_080523EC: @ 0x080523EC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, .L08052490  @ gUnknown_02000000
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne .L0805244E
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L0805244E
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, .L08052494  @ gBattleHpDisplayedValue
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne .L0805244E
	movs r0, #1
	str r0, [r5, #0x58]
.L0805244E:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne .L080524F0
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne .L080524F0
	ldr r4, .L08052498  @ gUnknown_0203E152
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, .L0805249C  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne .L080524E4
	bl GetBattleAnimLinkArenaFlag
	cmp r0, #1
	bne .L080524A0
	movs r0, #0
	b .L080524B4
	.align 2, 0
.L08052490: .4byte gUnknown_02000000
.L08052494: .4byte gBattleHpDisplayedValue
.L08052498: .4byte gUnknown_0203E152
.L0805249C: .4byte gUnknown_02017780
.L080524A0:
	ldr r4, .L080524C4  @ gBattleCharacterIndices
	adds r0, r6, #0
	bl GetAISSubjectId
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ShouldDisplayDeathQuoteForChar
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
.L080524B4:
	cmp r0, #1
	bne .L080524C8
	adds r0, r6, #0
	adds r1, r7, #0
	bl StartEfxDeadEVTENT
	b .L080524E4
	.align 2, 0
.L080524C4: .4byte gBattleCharacterIndices
.L080524C8:
	bl PlayBattleCroudSfxIfArena
	adds r0, r6, #0
	adds r1, r7, #0
	bl StartEfxDead
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, .L080524EC  @ gBattleAnimUnitEnabledLookup
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
.L080524E4:
	adds r0, r5, #0
	bl Proc_Break
	b .L080524FC
	.align 2, 0
.L080524EC: .4byte gBattleAnimUnitEnabledLookup
.L080524F0:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls .L080524FC
	movs r0, #0x1e
	str r0, [r5, #0x54]
.L080524FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080523EC

	THUMB_FUNC_START func_08052504
func_08052504: @ 0x08052504
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L0805254C  @ gUnknown_0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne .L0805259C
	ldr r0, .L08052550  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne .L0805259C
	strh r0, [r5, #0x2c]
	movs r0, #1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x64]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl func_0805A21C
	cmp r0, #1
	bne .L08052596
	ldr r0, .L08052554  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi .L08052596
	lsls r0, r0, #2
	ldr r1, .L08052558  @ .L0805255C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805254C: .4byte gUnknown_0201774C
.L08052550: .4byte gUnknown_0201772C
.L08052554: .4byte gBattleAnimSceneLayoutEnum
.L08052558: .4byte .L0805255C
.L0805255C: @ jump table
	.4byte .L08052570 @ case 0
	.4byte .L08052570 @ case 1
	.4byte .L08052584 @ case 2
	.4byte .L08052570 @ case 3
	.4byte .L08052570 @ case 4
.L08052570:
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L08052596
.L08052584:
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L08052596:
	adds r0, r5, #0
	bl Proc_Break
.L0805259C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08052504

	THUMB_FUNC_START func_080525A4
func_080525A4: @ 0x080525A4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	subs r0, #4
	cmp r1, r0
	bne .L080525CA
	ldr r0, [r2, #0x64]
	bl GetOpponentFrontAIS
	movs r0, #4
	bl EnableBgSync
	b .L080525E0
.L080525CA:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne .L080525E0
	ldr r1, .L080525E4  @ gUnknown_02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
.L080525E0:
	pop {r0}
	bx r0
	.align 2, 0
.L080525E4: .4byte gUnknown_02017728

	THUMB_FUNC_END func_080525A4

	THUMB_FUNC_START StartEfxHpBarResire
StartEfxHpBarResire: @ 0x080525E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, .L08052620  @ gUnknown_02017728
	ldr r0, [r1]
	cmp r0, #0
	bne .L080526BA
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08052624  @ gUnknown_085B962C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r6, #0x64]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805262C
	ldr r0, .L08052628  @ gUnknown_02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b .L08052634
	.align 2, 0
.L08052620: .4byte gUnknown_02017728
.L08052624: .4byte gUnknown_085B962C
.L08052628: .4byte gUnknown_02000000
.L0805262C:
	ldr r0, .L08052688  @ gUnknown_02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
.L08052634:
	str r0, [r6, #0x60]
	ldr r4, .L0805268C  @ gUnknown_0203E152
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble .L08052690
	movs r0, #1
	negs r0, r0
	b .L08052692
	.align 2, 0
.L08052688: .4byte gUnknown_02000000
.L0805268C: .4byte gUnknown_0203E152
.L08052690:
	movs r0, #1
.L08052692:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, .L080526C0  @ gUnknown_02017750
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	ldr r1, .L080526C4  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
.L080526BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080526C0: .4byte gUnknown_02017750
.L080526C4: .4byte gUnknown_02017780

	THUMB_FUNC_END StartEfxHpBarResire

	THUMB_FUNC_START func_080526C8
func_080526C8: @ 0x080526C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne .L08052718
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L08052718
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, .L08052764  @ gBattleHpDisplayedValue
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne .L08052718
	movs r0, #1
	str r0, [r5, #0x58]
.L08052718:
	ldr r0, [r5, #0x54]
	cmp r0, #0x54
	bne .L08052774
	ldr r6, [r5, #0x58]
	cmp r6, #1
	bne .L08052774
	ldr r4, .L08052768  @ gUnknown_0203E152
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, .L0805276C  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne .L08052752
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
.L08052752:
	strh r4, [r5, #0x2c]
	movs r0, #0xa
	strh r0, [r5, #0x2e]
	ldr r0, .L08052770  @ gUnknown_02017750
	str r6, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b .L08052780
	.align 2, 0
.L08052764: .4byte gBattleHpDisplayedValue
.L08052768: .4byte gUnknown_0203E152
.L0805276C: .4byte gUnknown_02017780
.L08052770: .4byte gUnknown_02017750
.L08052774:
	adds r0, #1
	str r0, [r5, #0x54]
	cmp r0, #0x53
	bls .L08052780
	movs r0, #0x54
	str r0, [r5, #0x54]
.L08052780:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080526C8

	THUMB_FUNC_START func_08052788
func_08052788: @ 0x08052788
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble .L08052822
	ldr r4, .L08052804  @ gUnknown_0203E152
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	strh r7, [r6, #0x2c]
	ldr r1, [r6, #0x4c]
	strh r1, [r6, #0x2e]
	str r7, [r6, #0x54]
	str r7, [r6, #0x58]
	cmp r1, r0
	bne .L080527F6
	movs r0, #1
	str r0, [r6, #0x58]
.L080527F6:
	ldr r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble .L08052808
	movs r0, #1
	negs r0, r0
	b .L0805280A
	.align 2, 0
.L08052804: .4byte gUnknown_0203E152
.L08052808:
	movs r0, #1
.L0805280A:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	ldr r1, .L08052828  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
.L08052822:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052828: .4byte gUnknown_02017780

	THUMB_FUNC_END func_08052788

	THUMB_FUNC_START func_0805282C
func_0805282C: @ 0x0805282C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, .L08052900  @ gUnknown_02000000
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	mov r8, r0
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne .L080528BC
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne .L080528BC
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, .L08052904  @ gBattleHpDisplayedValue
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x75
	bl SomeBattlePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r0, #0x75
	movs r2, #1
	bl func_08071AB0
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne .L080528BC
	movs r0, #1
	str r0, [r5, #0x58]
.L080528BC:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne .L08052960
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne .L08052960
	ldr r4, .L08052908  @ gUnknown_0203E152
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, .L0805290C  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08052954
	bl GetBattleAnimLinkArenaFlag
	cmp r0, #1
	bne .L08052910
	movs r0, #0
	b .L08052924
	.align 2, 0
.L08052900: .4byte gUnknown_02000000
.L08052904: .4byte gBattleHpDisplayedValue
.L08052908: .4byte gUnknown_0203E152
.L0805290C: .4byte gUnknown_02017780
.L08052910:
	ldr r4, .L08052934  @ gBattleCharacterIndices
	adds r0, r6, #0
	bl GetAISSubjectId
	adds r0, r0, r4
	ldrb r0, [r0]
	bl ShouldDisplayDeathQuoteForChar
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
.L08052924:
	cmp r0, #1
	bne .L08052938
	adds r0, r6, #0
	mov r1, r8
	bl StartEfxDeadEVTENT
	b .L08052954
	.align 2, 0
.L08052934: .4byte gBattleCharacterIndices
.L08052938:
	bl PlayBattleCroudSfxIfArena
	adds r0, r6, #0
	mov r1, r8
	bl StartEfxDead
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, .L0805295C  @ gBattleAnimUnitEnabledLookup
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
.L08052954:
	adds r0, r5, #0
	bl Proc_Break
	b .L0805296C
	.align 2, 0
.L0805295C: .4byte gBattleAnimUnitEnabledLookup
.L08052960:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls .L0805296C
	movs r0, #0x1e
	str r0, [r5, #0x54]
.L0805296C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805282C

	THUMB_FUNC_START StartEfxAvoid
StartEfxAvoid: @ 0x08052978
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, .L080529A8  @ gUnknown_02017728
	ldr r5, [r1]
	cmp r5, #0
	bne .L080529E6
	movs r0, #1
	str r0, [r1]
	ldr r0, .L080529AC  @ gUnknown_085B9664
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080529B4
	ldr r0, .L080529B0  @ gUnknown_02000000
	ldr r1, [r0, #8]
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	b .L080529BC
	.align 2, 0
.L080529A8: .4byte gUnknown_02017728
.L080529AC: .4byte gUnknown_085B9664
.L080529B0: .4byte gUnknown_02000000
.L080529B4:
	ldr r0, .L080529EC  @ gUnknown_02000000
	ldr r1, [r0]
	str r1, [r4, #0x5c]
	ldr r0, [r0, #8]
.L080529BC:
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl StartEfxDamagaMojiEffect
	str r6, [r4, #0x64]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd7
	bl SomeBattlePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd7
	movs r2, #1
	bl func_08071AB0
.L080529E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080529EC: .4byte gUnknown_02000000

	THUMB_FUNC_END StartEfxAvoid

	THUMB_FUNC_START func_080529F0
func_080529F0: @ 0x080529F0
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bne .L08052A08
	adds r0, r1, #0
	bl Proc_Break
.L08052A08:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080529F0

	THUMB_FUNC_START StartEfxHpBarLive
StartEfxHpBarLive: @ 0x08052A0C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, .L08052A3C  @ gUnknown_02017728
	ldr r0, [r1]
	cmp r0, #0
	bne .L08052AD8
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08052A40  @ gUnknown_085B968C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08052A48
	ldr r0, .L08052A44  @ gUnknown_02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b .L08052A50
	.align 2, 0
.L08052A3C: .4byte gUnknown_02017728
.L08052A40: .4byte gUnknown_085B968C
.L08052A44: .4byte gUnknown_02000000
.L08052A48:
	ldr r0, .L08052AA8  @ gUnknown_02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
.L08052A50:
	str r0, [r6, #0x60]
	ldr r4, .L08052AAC  @ gUnknown_0203E152
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	str r1, [r6, #0x50]
	movs r0, #0
	str r0, [r6, #0x54]
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x4c]
	cmp r0, r1
	bne .L08052AB0
	movs r0, #1
	str r0, [r6, #0x58]
	b .L08052ABE
	.align 2, 0
.L08052AA8: .4byte gUnknown_02000000
.L08052AAC: .4byte gUnknown_0203E152
.L08052AB0:
	cmp r0, r1
	ble .L08052ABA
	movs r0, #1
	negs r0, r0
	b .L08052ABC
.L08052ABA:
	movs r0, #1
.L08052ABC:
	str r0, [r6, #0x48]
.L08052ABE:
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r7, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	ldr r1, .L08052AE0  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
.L08052AD8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052AE0: .4byte gUnknown_02017780

	THUMB_FUNC_END StartEfxHpBarLive

	THUMB_FUNC_START func_08052AE4
func_08052AE4: @ 0x08052AE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne .L08052B40
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne .L08052B40
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAISSubjectId
	ldr r1, .L08052B78  @ gBattleHpDisplayedValue
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x75
	bl SomeBattlePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0x75
	movs r2, #1
	bl func_08071AB0
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne .L08052B40
	movs r0, #1
	str r0, [r5, #0x58]
.L08052B40:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne .L08052B84
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne .L08052B84
	ldr r4, .L08052B7C  @ gUnknown_0203E152
	adds r0, r6, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	adds r0, r6, #0
	bl GetAISSubjectId
	ldr r1, .L08052B80  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b .L08052B90
	.align 2, 0
.L08052B78: .4byte gBattleHpDisplayedValue
.L08052B7C: .4byte gUnknown_0203E152
.L08052B80: .4byte gUnknown_02017780
.L08052B84:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls .L08052B90
	movs r0, #0x1e
	str r0, [r5, #0x54]
.L08052B90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08052AE4

	THUMB_FUNC_START StartEfxNoDamage
StartEfxNoDamage: @ 0x08052B98
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L08052C12
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08052BD0
	ldr r0, .L08052BCC  @ gpUnitRight_BattleStruct
	b .L08052BD2
	.align 2, 0
.L08052BCC: .4byte gpUnitRight_BattleStruct
.L08052BD0:
	ldr r0, .L08052C18  @ gpUnitLeft_BattleStruct
.L08052BD2:
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0xb5
	beq .L08052C12
	ldr r1, .L08052C1C  @ gUnknown_02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08052C20  @ gUnknown_085B96B4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	strb r7, [r0]
	str r5, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl StartEfxDamagaMojiEffect
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl func_08052C7C
.L08052C12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052C18: .4byte gpUnitLeft_BattleStruct
.L08052C1C: .4byte gUnknown_02017728
.L08052C20: .4byte gUnknown_085B96B4

	THUMB_FUNC_END StartEfxNoDamage

	THUMB_FUNC_START func_08052C24
func_08052C24: @ 0x08052C24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #8
	bne .L08052C70
	ldr r6, .L08052C78  @ gUnknown_0203E152
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08052C6A
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
.L08052C6A:
	adds r0, r4, #0
	bl Proc_Break
.L08052C70:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08052C78: .4byte gUnknown_0203E152

	THUMB_FUNC_END func_08052C24

	THUMB_FUNC_START func_08052C7C
func_08052C7C: @ 0x08052C7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08052C9C  @ gUnknown_085B96DC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052C9C: .4byte gUnknown_085B96DC

	THUMB_FUNC_END func_08052C7C

	THUMB_FUNC_START func_08052CA0
func_08052CA0: @ 0x08052CA0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	mov r8, r0
	ldr r1, [r7, #0x60]
	mov r9, r1
	ldr r4, .L08052D04  @ gUnknown_080DA438
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08052D10
	bl func_0806FAB0
	cmp r0, #0
	bne .L08052CFC
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	ldr r5, .L08052D08  @ gUnknown_02000028
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r4, .L08052D0C  @ gUnknown_0201FB0C
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #2]
	ldr r0, [r7, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	mov r2, r9
	strh r0, [r2, #2]
.L08052CFC:
	adds r0, r7, #0
	bl Proc_Break
	b .L08052D78
	.align 2, 0
.L08052D04: .4byte gUnknown_080DA438
.L08052D08: .4byte gUnknown_02000028
.L08052D0C: .4byte gUnknown_0201FB0C
.L08052D10:
	mov r0, r8
	bl GetAISSubjectId
	cmp r0, #1
	bne .L08052D2C
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b .L08052D36
.L08052D2C:
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r4, [r0]
.L08052D36:
	bl func_0806FAB0
	cmp r0, #0
	bne .L08052D72
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	ldr r6, .L08052D84  @ gUnknown_02000028
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r5, .L08052D88  @ gUnknown_0201FB0C
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r0, r0, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, r0
	mov r1, r8
	strh r0, [r1, #2]
	ldr r0, [r7, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r0, r0, r1
	adds r4, r4, r0
	mov r2, r9
	strh r4, [r2, #2]
.L08052D72:
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
.L08052D78:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052D84: .4byte gUnknown_02000028
.L08052D88: .4byte gUnknown_0201FB0C

	THUMB_FUNC_END func_08052CA0

	THUMB_FUNC_START StartEfxStatusCHG
StartEfxStatusCHG: @ 0x08052D8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L08052DB0  @ gUnknown_02017728
	ldr r4, [r1]
	cmp r4, #0
	bne .L08052DA8
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08052DB4  @ gUnknown_085B96F4
	movs r1, #3
	bl SpawnProc
	strh r4, [r0, #0x2c]
	str r5, [r0, #0x64]
.L08052DA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052DB0: .4byte gUnknown_02017728
.L08052DB4: .4byte gUnknown_085B96F4

	THUMB_FUNC_END StartEfxStatusCHG

	THUMB_FUNC_START func_08052DB8
func_08052DB8: @ 0x08052DB8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L08052DD0
	adds r0, r1, #0
	bl Proc_Break
.L08052DD0:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08052DB8

	THUMB_FUNC_START StartEfxDeadEVTENT
StartEfxDeadEVTENT: @ 0x08052DD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08052DF4  @ gUnknown_085B9724
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	ldr r1, .L08052DF8  @ gUnknown_02017738
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052DF4: .4byte gUnknown_085B9724
.L08052DF8: .4byte gUnknown_02017738

	THUMB_FUNC_END StartEfxDeadEVTENT

	THUMB_FUNC_START func_08052DFC
func_08052DFC: @ 0x08052DFC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r7, r0, #0
	movs r6, #0
	ldr r0, .L08052E68  @ gUnknown_0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne .L08052E2E
	ldr r0, .L08052E6C  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne .L08052E2E
	ldr r4, .L08052E70  @ gUnknown_0201FB04
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #1
	bne .L08052E2E
	movs r6, #1
.L08052E2E:
	cmp r6, #1
	bne .L08052E62
	movs r0, #7
	strh r0, [r5, #0x2c]
	ldr r0, .L08052E74  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08052E5C
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, .L08052E78  @ gUnknown_02017744
	ldr r1, [r1]
	cmp r0, r1
	beq .L08052E5C
	movs r1, #1
	negs r1, r1
	adds r0, r7, #0
	bl MoveBattleCameraOnto
	movs r0, #0
	strh r0, [r5, #0x2c]
.L08052E5C:
	adds r0, r5, #0
	bl Proc_Break
.L08052E62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08052E68: .4byte gUnknown_0201774C
.L08052E6C: .4byte gUnknown_0201772C
.L08052E70: .4byte gUnknown_0201FB04
.L08052E74: .4byte gBattleAnimSceneLayoutEnum
.L08052E78: .4byte gUnknown_02017744

	THUMB_FUNC_END func_08052DFC

	THUMB_FUNC_START func_08052E7C
func_08052E7C: @ 0x08052E7C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L08052EA6
	movs r0, #1
	movs r1, #7
	bl StartEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl StartEkrNamewinAppear
	adds r0, r4, #0
	bl Proc_Break
.L08052EA6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08052E7C

	THUMB_FUNC_START func_08052EAC
func_08052EAC: @ 0x08052EAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl func_08056D74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08052F0A
	bl EkrGauge_8051218
	bl func_08051B90
	movs r0, #0
	str r0, [sp]
	ldr r1, .L08052F14  @ gBg0Tm
	ldr r2, .L08052F18  @ 0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, .L08052F1C  @ gUnknown_02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	bl EkrGauge_8051190
	ldr r4, .L08052F20  @ gBattleCharacterIndices
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r0, r0, r4
	ldrb r0, [r0]
	bl DisplayDeathQuoteForChar
	adds r0, r5, #0
	bl Proc_Break
.L08052F0A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052F14: .4byte gBg0Tm
.L08052F18: .4byte 0x01000200
.L08052F1C: .4byte gUnknown_02000038
.L08052F20: .4byte gBattleCharacterIndices

	THUMB_FUNC_END func_08052EAC

	THUMB_FUNC_START func_08052F24
func_08052F24: @ 0x08052F24
	push {r4, r5, lr}
	adds r4, r0, #0
	bl BattleEventEngineExists
	adds r5, r0, #0
	cmp r5, #0
	bne .L08052F7A
	bl PlayBattleCroudSfxIfArena
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl StartEfxDead
	bl func_08051F1C
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	ldr r1, .L08052F80  @ gBattleAnimUnitEnabledLookup
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	movs r1, #7
	bl StartEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl StartEkrNamewinAppear
	bl EkrGauge_8051228
	bl func_08051BA0
	bl EkrGauge_8051180
	adds r0, r4, #0
	bl Proc_Break
.L08052F7A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052F80: .4byte gBattleAnimUnitEnabledLookup

	THUMB_FUNC_END func_08052F24

	THUMB_FUNC_START func_08052F84
func_08052F84: @ 0x08052F84
	push {r4, lr}
	adds r4, r0, #0
	bl func_08056D74
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08052FA0
	ldr r1, .L08052FA8  @ gUnknown_02017738
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08052FA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08052FA8: .4byte gUnknown_02017738

	THUMB_FUNC_END func_08052F84

	THUMB_FUNC_START StartEfxDead
StartEfxDead: @ 0x08052FAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08052FE0  @ gUnknown_02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, .L08052FE4  @ gUnknown_02017734
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08052FE8  @ gUnknown_085B975C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl func_08054B64
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08052FE0: .4byte gUnknown_02017728
.L08052FE4: .4byte gUnknown_02017734
.L08052FE8: .4byte gUnknown_085B975C

	THUMB_FUNC_END StartEfxDead

	THUMB_FUNC_START func_08052FEC
func_08052FEC: @ 0x08052FEC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl func_0806FAB0
	cmp r0, #1
	bne .L08053030
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08053030
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r4, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	ldr r0, .L0805302C  @ gUnknown_0203E152
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	b .L08053032
	.align 2, 0
.L0805302C: .4byte gUnknown_0203E152
.L08053030:
	movs r4, #1
.L08053032:
	ldr r0, .L08053054  @ gUnknown_0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne .L0805307A
	ldr r0, .L08053058  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne .L0805307A
	bl func_0806FAB0
	cmp r0, #2
	bne .L0805305C
	ldr r0, [r5, #0x5c]
	bl func_080701F4
	b .L08053070
	.align 2, 0
.L08053054: .4byte gUnknown_0201774C
.L08053058: .4byte gUnknown_0201772C
.L0805305C:
	cmp r4, #0
	bne .L08053068
	ldr r0, [r5, #0x5c]
	bl func_08070204
	b .L08053070
.L08053068:
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	bl StartEfxDeadPika
.L08053070:
	movs r0, #0x32
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
.L0805307A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08052FEC

	THUMB_FUNC_START func_08053080
func_08053080: @ 0x08053080
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne .L080530F6
	adds r0, r5, #0
	bl func_08070214
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L08053112
	ldr r0, [r4, #0x5c]
	bl func_08070234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080530D2
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl func_0805328C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl SomeBattlePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xd6
	movs r2, #1
	bl func_08071AB0
	movs r0, #0x64
	strh r0, [r4, #0x2e]
	b .L08053112
.L080530D2:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl func_080531A4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl SomeBattlePlaySound_8071990
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r0, #0xd6
	movs r2, #1
	bl func_08071AB0
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b .L08053112
.L080530F6:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne .L08053112
	ldr r1, .L08053118  @ gUnknown_02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, .L0805311C  @ gUnknown_02017734
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08053112:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053118: .4byte gUnknown_02017728
.L0805311C: .4byte gUnknown_02017734

	THUMB_FUNC_END func_08053080

	THUMB_FUNC_START StartEfxDeadPika
StartEfxDeadPika: @ 0x08053120
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08053140  @ gUnknown_085B977C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053140: .4byte gUnknown_085B977C

	THUMB_FUNC_END StartEfxDeadPika

	THUMB_FUNC_START func_08053144
func_08053144: @ 0x08053144
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x5c]
	ldr r5, [r3, #0x60]
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble .L0805317C
	ldrh r2, [r4]
	ldr r1, .L08053178  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldrh r0, [r5]
	ands r1, r0
	strh r1, [r5]
	movs r0, #0
	strh r0, [r3, #0x2c]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b .L0805318A
	.align 2, 0
.L08053178: .4byte 0x0000FFFD
.L0805317C:
	ldrh r0, [r4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r5]
	orrs r0, r1
	strh r0, [r5]
.L0805318A:
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #5
	ble .L0805319E
	movs r0, #0
	strh r0, [r3, #0x2c]
	strh r0, [r3, #0x2e]
	adds r0, r3, #0
	bl Proc_Break
.L0805319E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08053144

	THUMB_FUNC_START func_080531A4
func_080531A4: @ 0x080531A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L08053204  @ gUnknown_085B9794
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	str r6, [r0, #0x60]
	movs r4, #0
	strh r4, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r5, #0xa]
	strh r0, [r6, #0xa]
	bl BsoSort
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r1, .L08053208  @ gDispIo
	adds r1, #0x3d
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053204: .4byte gUnknown_085B9794
.L08053208: .4byte gDispIo

	THUMB_FUNC_END func_080531A4

	THUMB_FUNC_START func_0805320C
func_0805320C: @ 0x0805320C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	orrs r0, r1
	str r0, [r3, #0x1c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L08053260
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, .L0805325C  @ 0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	ands r0, r1
	str r0, [r3, #0x1c]
	bl SetBlendNone
	adds r0, r4, #0
	bl Proc_Break
	b .L08053282
	.align 2, 0
.L0805325C: .4byte 0xFFFFFBFF
.L08053260:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
.L08053282:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805320C

	THUMB_FUNC_START func_0805328C
func_0805328C: @ 0x0805328C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, .L08053360  @ gUnknown_085B97AC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	ldrh r0, [r5]
	movs r1, #2
	movs r2, #0
	mov r9, r2
	movs r2, #0
	mov r8, r2
	orrs r0, r1
	strh r0, [r5]
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl func_0806FC8C
	mov r0, r8
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	mov r2, r8
	str r2, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r4, .L08053364  @ gDispIo
	ldrb r0, [r4, #1]
	movs r2, #0x20
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x2d
	mov r1, r9
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x34
	ldrb r0, [r3]
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
	orrs r0, r2
	strb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08053360: .4byte gUnknown_085B97AC
.L08053364: .4byte gDispIo

	THUMB_FUNC_END func_0805328C

	THUMB_FUNC_START func_08053368
func_08053368: @ 0x08053368
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L080533A4
	movs r0, #0
	bl func_080559D0
	ldr r0, .L080533A0  @ gBg3Tm
	movs r1, #0xf0
	lsls r1, r1, #8
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	bl SetBlendNone
	adds r0, r4, #0
	bl Proc_Break
	b .L080533C6
	.align 2, 0
.L080533A0: .4byte gBg3Tm
.L080533A4:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
.L080533C6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08053368

	THUMB_FUNC_START MoveBattleCameraOnto
MoveBattleCameraOnto: @ 0x080533D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, .L080533EC  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi .L0805349E
	lsls r0, r0, #2
	ldr r1, .L080533F0  @ .L080533F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080533EC: .4byte gBattleAnimSceneLayoutEnum
.L080533F0: .4byte .L080533F4
.L080533F4: @ jump table
	.4byte .L0805349E @ case 0
	.4byte .L08053408 @ case 1
	.4byte .L08053408 @ case 2
	.4byte .L0805349E @ case 3
	.4byte .L0805349E @ case 4
.L08053408:
	ldr r0, .L0805343C  @ gUnknown_085B97C4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r2, r4, #0
	adds r2, #0x29
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #0x2c]
	lsls r1, r6, #0x10
	asrs r2, r1, #0x10
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	beq .L08053444
	asrs r0, r1, #0x11
	strh r0, [r4, #0x2e]
	subs r0, r2, r0
	strh r0, [r4, #0x30]
	ldr r2, .L08053440  @ gBattleAnimSceneLayoutEnum
	b .L0805345E
	.align 2, 0
.L0805343C: .4byte gUnknown_085B97C4
.L08053440: .4byte gBattleAnimSceneLayoutEnum
.L08053444:
	ldr r0, .L08053454  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #1
	bne .L08053458
	movs r0, #5
	b .L0805345A
	.align 2, 0
.L08053454: .4byte gBattleAnimSceneLayoutEnum
.L08053458:
	movs r0, #7
.L0805345A:
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
.L0805345E:
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	cmp r0, #1
	bne .L0805346A
	movs r1, #0x20
.L0805346A:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #0
	bne .L08053482
	negs r0, r1
	strh r0, [r4, #0x32]
	lsrs r0, r0, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	b .L08053490
.L08053482:
	movs r0, #0
	strh r0, [r4, #0x32]
	negs r1, r1
	lsrs r0, r1, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
.L08053490:
	ldr r1, .L080534A4  @ gUnknown_0201FB0C
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	str r0, [r1]
	ldr r1, .L080534A8  @ gUnknown_02017748
	movs r0, #1
	str r0, [r1]
.L0805349E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080534A4: .4byte gUnknown_0201FB0C
.L080534A8: .4byte gUnknown_02017748

	THUMB_FUNC_END MoveBattleCameraOnto

	THUMB_FUNC_START func_080534AC
func_080534AC: @ 0x080534AC
	push {r4, lr}
	ldr r3, .L080534DC  @ gUnknown_02000000
	ldr r4, [r3]
	negs r1, r1
	ldr r2, .L080534E0  @ gUnknown_02000028
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #4]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #8]
	ldrh r0, [r2, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #0xc]
	ldrh r0, [r2, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080534DC: .4byte gUnknown_02000000
.L080534E0: .4byte gUnknown_02000028

	THUMB_FUNC_END func_080534AC

	THUMB_FUNC_START func_080534E4
func_080534E4: @ 0x080534E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl func_080534AC
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl func_0806FB2C
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl func_08053618
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080534E4

	THUMB_FUNC_START func_08053514
func_08053514: @ 0x08053514
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r1, r0, #0
	ldr r5, .L08053580  @ gUnknown_0201FB0C
	str r1, [r5]
	adds r0, r4, #0
	bl func_080534AC
	ldr r0, [r5]
	movs r1, #0
	bl func_0806FB2C
	ldr r0, [r5]
	bl func_08053618
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L0805355A
	ldr r0, [r5]
	bl func_0805B034
.L0805355A:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L08053576
	movs r0, #1
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
.L08053576:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053580: .4byte gUnknown_0201FB0C

	THUMB_FUNC_END func_08053514

	THUMB_FUNC_START func_08053584
func_08053584: @ 0x08053584
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r5, #0x38
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r5, .L080535EC  @ gUnknown_0201FB0C
	str r1, [r5]
	adds r0, r4, #0
	bl func_080534AC
	ldr r0, [r5]
	movs r1, #0
	bl func_0806FB2C
	ldr r0, [r5]
	bl func_08053618
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L080535CA
	ldr r0, [r5]
	bl func_0805B034
.L080535CA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L08053606
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L080535F4
	ldr r1, .L080535F0  @ gUnknown_02017744
	movs r0, #1
	b .L080535F8
	.align 2, 0
.L080535EC: .4byte gUnknown_0201FB0C
.L080535F0: .4byte gUnknown_02017744
.L080535F4:
	ldr r1, .L08053610  @ gUnknown_02017744
	movs r0, #0
.L080535F8:
	str r0, [r1]
	ldr r1, .L08053614  @ gUnknown_02017748
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08053606:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053610: .4byte gUnknown_02017744
.L08053614: .4byte gUnknown_02017748

	THUMB_FUNC_END func_08053584

	THUMB_FUNC_START func_08053618
func_08053618: @ 0x08053618
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl func_0806FAB0
	cmp r0, #2
	beq .L08053668
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne .L08053668
	asrs r4, r5, #3
	movs r1, #7
	ands r1, r5
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, .L08053670  @ gUnknown_0201C912
	adds r4, r4, r0
	movs r0, #0x84
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, .L08053674  @ gBg2Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	subs r0, #0x15
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl func_08070EF4
	movs r0, #4
	bl EnableBgSync
.L08053668:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053670: .4byte gUnknown_0201C912
.L08053674: .4byte gBg2Tm

	THUMB_FUNC_END func_08053618

	THUMB_FUNC_START func_08053678
func_08053678: @ 0x08053678
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080536B0  @ gUnknown_085B97EC
	movs r1, #3
	bl SpawnProc
	ldr r2, .L080536B4  @ gUnknown_085B9804
	lsls r1, r4, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x44]
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r2
	ldr r1, [r4]
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	strb r1, [r3]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080536B0: .4byte gUnknown_085B97EC
.L080536B4: .4byte gUnknown_085B9804

	THUMB_FUNC_END func_08053678

	THUMB_FUNC_START func_080536B8
func_080536B8: @ 0x080536B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r2, r0, r3
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, .L080536E4  @ 0x00007FFF
	cmp r1, r0
	beq .L080536E8
	adds r0, r1, #0
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl func_08052214
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	b .L08053710
	.align 2, 0
.L080536E4: .4byte 0x00007FFF
.L080536E8:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080536F8
	cmp r0, #1
	beq .L08053708
	b .L08053710
.L080536F8:
	strh r0, [r4, #0x2c]
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r2, #2
	ldrsh r1, [r3, r2]
	bl func_08052214
	b .L08053710
.L08053708:
	movs r0, #0
	movs r1, #0
	bl func_08052214
.L08053710:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080536B8

	THUMB_FUNC_START func_08053718
func_08053718: @ 0x08053718
	push {lr}
	ldr r0, .L08053728  @ gUnknown_085B9884
	movs r1, #3
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
.L08053728: .4byte gUnknown_085B9884

	THUMB_FUNC_END func_08053718

	THUMB_FUNC_START nullsub_56
nullsub_56: @ 0x0805372C
	bx lr

	THUMB_FUNC_END nullsub_56

	THUMB_FUNC_START StartEfxQuake
StartEfxQuake: @ 0x08053730
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08053740  @ gUnknown_02017748
	ldr r0, [r0]
	cmp r0, #1
	bne .L08053744
	movs r0, #0
	b .L08053820
	.align 2, 0
.L08053740: .4byte gUnknown_02017748
.L08053744:
	ldr r1, .L08053770  @ gUnknown_0201773C
	movs r0, #1
	str r0, [r1]
	ldr r0, .L08053774  @ gUnknown_085B989C
	movs r1, #3
	bl SpawnProc
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r1, .L08053778  @ gUnknown_02000000
	ldr r0, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1, #8]
	str r0, [r2, #0x60]
	cmp r4, #6
	bhi .L0805380C
	lsls r0, r4, #2
	ldr r1, .L0805377C  @ .L08053780
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08053770: .4byte gUnknown_0201773C
.L08053774: .4byte gUnknown_085B989C
.L08053778: .4byte gUnknown_02000000
.L0805377C: .4byte .L08053780
.L08053780: @ jump table
	.4byte .L0805379C @ case 0
	.4byte .L080537AC @ case 1
	.4byte .L080537BC @ case 2
	.4byte .L080537CC @ case 3
	.4byte .L080537DC @ case 4
	.4byte .L080537EC @ case 5
	.4byte .L080537FC @ case 6
.L0805379C:
	ldr r0, .L080537A8  @ gUnknown_080DA4BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L08053816
	.align 2, 0
.L080537A8: .4byte gUnknown_080DA4BA
.L080537AC:
	ldr r0, .L080537B8  @ gUnknown_080DA4DC
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L08053816
	.align 2, 0
.L080537B8: .4byte gUnknown_080DA4DC
.L080537BC:
	ldr r0, .L080537C8  @ gUnknown_080DA526
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L08053816
	.align 2, 0
.L080537C8: .4byte gUnknown_080DA526
.L080537CC:
	ldr r0, .L080537D8  @ gUnknown_080DA570
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L08053816
	.align 2, 0
.L080537D8: .4byte gUnknown_080DA570
.L080537DC:
	ldr r0, .L080537E8  @ gUnknown_080DA5BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b .L08053816
	.align 2, 0
.L080537E8: .4byte gUnknown_080DA5BA
.L080537EC:
	ldr r0, .L080537F8  @ gUnknown_080DA604
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b .L08053816
	.align 2, 0
.L080537F8: .4byte gUnknown_080DA604
.L080537FC:
	ldr r0, .L08053808  @ gUnknown_080DA66E
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b .L08053816
	.align 2, 0
.L08053808: .4byte gUnknown_080DA66E
.L0805380C:
	ldr r0, .L08053828  @ gUnknown_080DA4BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
.L08053816:
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x3c]
	adds r0, r2, #0
.L08053820:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08053828: .4byte gUnknown_080DA4BA

	THUMB_FUNC_END StartEfxQuake

	THUMB_FUNC_START func_0805382C
func_0805382C: @ 0x0805382C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, [r7, #0x44]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #2
	adds r2, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, .L080538AC  @ 0x00007FFF
	cmp r1, r0
	bne .L080538C0
	ldr r3, .L080538B0  @ gUnknown_02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, .L080538B4  @ gUnknown_0201FB0C
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, .L080538B8  @ gUnknown_0200002C
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl func_080559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl func_080559F0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl func_0806FAB0
	cmp r0, #0
	beq .L0805389E
	ldrh r1, [r7, #0x34]
	ldrh r2, [r7, #0x3c]
	movs r0, #3
	bl SetBgOffset
	movs r0, #0
	movs r1, #0
	bl func_08052214
.L0805389E:
	ldr r1, .L080538BC  @ gUnknown_0201773C
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b .L080539D2
	.align 2, 0
.L080538AC: .4byte 0x00007FFF
.L080538B0: .4byte gUnknown_02000028
.L080538B4: .4byte gUnknown_0201FB0C
.L080538B8: .4byte gUnknown_0200002C
.L080538BC: .4byte gUnknown_0201773C
.L080538C0:
	movs r4, #0
	ldrsh r0, [r2, r4]
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl func_08052214
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r5, .L08053918  @ gUnknown_02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	bl func_0806FAB0
	cmp r0, #0
	beq .L08053900
	ldrh r1, [r5]
	ldrh r4, [r7, #0x34]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r5, #2]
	ldrh r0, [r7, #0x3c]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
.L08053900:
	bl func_0806FAB0
	cmp r0, #0
	beq .L08053920
	ldr r4, .L0805391C  @ gUnknown_02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	b .L0805392C
	.align 2, 0
.L08053918: .4byte gUnknown_02017760
.L0805391C: .4byte gUnknown_02000028
.L08053920:
	ldr r4, .L0805398C  @ gUnknown_02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
.L0805392C:
	ldr r3, .L08053990  @ gUnknown_0201FB0C
	ldr r0, [r3]
	subs r6, r1, r0
	ldr r2, .L08053994  @ gUnknown_0200002C
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r5, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, .L08053998  @ gUnknown_02017760
	movs r4, #0
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	ldr r0, [r3]
	subs r4, r1, r0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, .L0805399C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080539A0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl func_080559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl func_080559F0
	b .L080539D2
	.align 2, 0
.L0805398C: .4byte gUnknown_02000028
.L08053990: .4byte gUnknown_0201FB0C
.L08053994: .4byte gUnknown_0200002C
.L08053998: .4byte gUnknown_02017760
.L0805399C: .4byte gBattleAnimSceneLayoutEnum
.L080539A0:
	cmp r0, #0
	blt .L080539D2
	cmp r0, #2
	bgt .L080539D2
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080539C4
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl func_080559F0
	b .L080539D2
.L080539C4:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl func_080559F0
.L080539D2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805382C

	THUMB_FUNC_START StartEfxHitQuake
StartEfxHitQuake: @ 0x080539DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	adds r6, r2, #0
	ldr r0, .L08053A20  @ gUnknown_02017740
	ldr r7, [r0]
	cmp r7, #0
	beq .L080539F4
	b .L08053B90
.L080539F4:
	movs r4, #1
	str r4, [r0]
	ldr r0, .L08053A24  @ gUnknown_085B98B4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	mov r1, r9
	str r1, [r5, #0x60]
	strh r7, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r6, #0
	beq .L08053A5C
	cmp r6, #1
	bne .L08053A2C
	ldr r0, .L08053A28  @ gUnknown_080DA4DC
	b .L08053A5E
	.align 2, 0
.L08053A20: .4byte gUnknown_02017740
.L08053A24: .4byte gUnknown_085B98B4
.L08053A28: .4byte gUnknown_080DA4DC
.L08053A2C:
	cmp r6, #2
	bne .L08053A38
	ldr r0, .L08053A34  @ gUnknown_080DA526
	b .L08053A5E
	.align 2, 0
.L08053A34: .4byte gUnknown_080DA526
.L08053A38:
	cmp r6, #3
	bne .L08053A44
	ldr r0, .L08053A40  @ gUnknown_080DA570
	b .L08053A5E
	.align 2, 0
.L08053A40: .4byte gUnknown_080DA570
.L08053A44:
	cmp r6, #4
	bne .L08053A50
	ldr r0, .L08053A4C  @ gUnknown_080DA9F8
	b .L08053A5E
	.align 2, 0
.L08053A4C: .4byte gUnknown_080DA9F8
.L08053A50:
	cmp r6, #5
	bne .L08053A5C
	ldr r0, .L08053A58  @ gUnknown_080DAA8E
	b .L08053A5E
	.align 2, 0
.L08053A58: .4byte gUnknown_080DAA8E
.L08053A5C:
	ldr r0, .L08053A74  @ gUnknown_080DA4BA
.L08053A5E:
	str r0, [r5, #0x44]
	movs r0, #1
	str r0, [r5, #0x48]
	bl func_0806FAB0
	adds r4, r0, #0
	cmp r4, #0
	beq .L08053A78
	movs r0, #0
	str r0, [r5, #0x64]
	b .L08053B90
	.align 2, 0
.L08053A74: .4byte gUnknown_080DA4BA
.L08053A78:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L08053A84
	str r4, [r5, #0x64]
	b .L08053B90
.L08053A84:
	ldr r0, .L08053A94  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08053A98
	str r0, [r5, #0x64]
	b .L08053B90
	.align 2, 0
.L08053A94: .4byte gBattleAnimSceneLayoutEnum
.L08053A98:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, .L08053AC8  @ gUnknown_0201FB0C
	ldr r1, [r1]
	ldr r2, .L08053ACC  @ gUnknown_02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	mov r0, r8
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08053AD4
	movs r0, #0x40
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, .L08053AD0  @ gUnknown_085C7338
	b .L08053ADE
	.align 2, 0
.L08053AC8: .4byte gUnknown_0201FB0C
.L08053ACC: .4byte gUnknown_02000030
.L08053AD0: .4byte gUnknown_085C7338
.L08053AD4:
	movs r0, #0xb0
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, .L08053B04  @ gUnknown_085C72AC
.L08053ADE:
	movs r1, #5
	bl BsoCreate
	adds r2, r0, #0
	ldrh r1, [r5, #0x36]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r2, #2]
	ldrh r0, [r5, #0x3e]
	strh r0, [r2, #4]
	ldr r0, .L08053B08  @ gUnknown_0201775C
	ldr r0, [r0]
	cmp r0, #1
	bne .L08053B0C
	movs r0, #0xd3
	lsls r0, r0, #6
	b .L08053B10
	.align 2, 0
.L08053B04: .4byte gUnknown_085C72AC
.L08053B08: .4byte gUnknown_0201775C
.L08053B0C:
	movs r0, #0xf3
	lsls r0, r0, #6
.L08053B10:
	strh r0, [r2, #8]
	str r2, [r5, #0x64]
	ldr r4, .L08053B9C  @ gUnknown_0200003C
	mov r0, r8
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, .L08053BA0  @ 0x06011800
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r4, .L08053BA4  @ gBattleSpellAnimationId1
	mov r0, r9
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x39
	bne .L08053B56
	ldr r4, .L08053BA8  @ gUnknown_0200004C
	mov r0, r9
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, .L08053BAC  @ gUnknown_02016828
	movs r2, #8
	bl CpuFastSet
.L08053B56:
	ldr r4, .L08053BA8  @ gUnknown_0200004C
	mov r0, r8
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, .L08053BB0  @ gPal+0x260
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, .L08053BB4  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov r0, r8
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl func_0805AFA0
	ldr r0, .L08053BB8  @ gUnknown_0201FB0C
	ldr r0, [r0]
	bl func_08053618
.L08053B90:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08053B9C: .4byte gUnknown_0200003C
.L08053BA0: .4byte 0x06011800
.L08053BA4: .4byte gBattleSpellAnimationId1
.L08053BA8: .4byte gUnknown_0200004C
.L08053BAC: .4byte gUnknown_02016828
.L08053BB0: .4byte gPal+0x260
.L08053BB4: .4byte gBattleAnimSceneLayoutEnum
.L08053BB8: .4byte gUnknown_0201FB0C

	THUMB_FUNC_END StartEfxHitQuake

	THUMB_FUNC_START func_08053BBC
func_08053BBC: @ 0x08053BBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, .L08053C0C  @ 0x00007FFF
	cmp r1, r0
	beq .L08053BDC
	b .L08053CF0
.L08053BDC:
	movs r0, #0
	movs r1, #0
	bl func_08052214
	ldr r0, .L08053C10  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne .L08053C14
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl func_0806FAB0
	cmp r0, #0
	beq .L08053C36
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b .L08053C36
	.align 2, 0
.L08053C0C: .4byte 0x00007FFF
.L08053C10: .4byte gBattleAnimSceneLayoutEnum
.L08053C14:
	cmp r0, #0
	blt .L08053C36
	cmp r0, #2
	bgt .L08053C36
	bl func_0806FAB0
	cmp r0, #0
	beq .L08053C2E
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08053C2E:
	ldr r0, .L08053CD8  @ gUnknown_0201FB0C
	ldr r0, [r0]
	bl func_08053618
.L08053C36:
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq .L08053C46
	bl BsoRemove
	ldr r0, .L08053CDC  @ gUnknown_0201FADC
	bl func_0805AE58
.L08053C46:
	ldr r3, .L08053CE0  @ gUnknown_02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, .L08053CD8  @ gUnknown_0201FB0C
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, .L08053CE4  @ gUnknown_0200002C
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl func_080559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl func_080559F0
	ldr r1, .L08053CE8  @ gUnknown_02017740
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08053CCE
	bl func_0806FAB0
	cmp r0, #0
	beq .L08053C9A
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08053C9A:
	ldr r4, .L08053CEC  @ gUnknown_02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl func_08051B5C
.L08053CCE:
	adds r0, r7, #0
	bl Proc_End
	b .L08053F02
	.align 2, 0
.L08053CD8: .4byte gUnknown_0201FB0C
.L08053CDC: .4byte gUnknown_0201FADC
.L08053CE0: .4byte gUnknown_02000028
.L08053CE4: .4byte gUnknown_0200002C
.L08053CE8: .4byte gUnknown_02017740
.L08053CEC: .4byte gUnknown_02000038
.L08053CF0:
	movs r6, #0x2c
	ldrsh r4, [r7, r6]
	cmp r4, #0
	bne .L08053D1C
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq .L08053D1C
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L08053D70  @ gBg2Tm+0x2C0
	adds r0, r0, r1
	str r4, [sp]
	movs r1, #0xf
	movs r2, #5
	movs r3, #0
	bl FillBGRect
.L08053D1C:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r4, [r0, r2]
	movs r3, #2
	ldrsh r5, [r0, r3]
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_08052214
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq .L08053D80
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	ldr r1, .L08053D74  @ gUnknown_0201FB0C
	ldr r1, [r1]
	ldr r2, .L08053D78  @ gUnknown_02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	ldr r3, [r7, #0x64]
	ldr r2, .L08053D7C  @ gUnknown_02017760
	ldrh r0, [r2]
	ldrh r6, [r7, #0x36]
	adds r0, r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r7, #0x3e]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	strh r0, [r3, #4]
	b .L08053D8C
	.align 2, 0
.L08053D70: .4byte gBg2Tm+0x2C0
.L08053D74: .4byte gUnknown_0201FB0C
.L08053D78: .4byte gUnknown_02000030
.L08053D7C: .4byte gUnknown_02017760
.L08053D80:
	ldr r0, .L08053E40  @ gUnknown_02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #2
	bl SetBgOffset
.L08053D8C:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08053E04
	bl func_0806FAB0
	cmp r0, #0
	beq .L08053DAE
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
.L08053DAE:
	ldr r5, .L08053E40  @ gUnknown_02017760
	ldr r4, .L08053E44  @ gUnknown_02000038
	ldrh r1, [r4]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r5, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r0, [r4]
	ldrh r6, [r5]
	adds r0, r0, r6
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r4]
	ldrh r3, [r5]
	adds r0, r0, r3
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r5, [r5, #2]
	adds r1, r1, r5
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl func_08051B5C
.L08053E04:
	bl func_0806FAB0
	cmp r0, #0
	beq .L08053E18
	ldr r0, .L08053E40  @ gUnknown_02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl SetBgOffset
.L08053E18:
	bl func_0806FAB0
	cmp r0, #0
	beq .L08053E54
	ldr r4, .L08053E48  @ gUnknown_02000028
	mov ip, r4
	movs r5, #0
	ldrsh r1, [r4, r5]
	ldr r2, .L08053E40  @ gUnknown_02017760
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	ldr r4, .L08053E4C  @ gUnknown_0201FB0C
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, .L08053E50  @ gUnknown_0200002C
	movs r0, #0
	ldrsh r1, [r3, r0]
	b .L08053E70
	.align 2, 0
.L08053E40: .4byte gUnknown_02017760
.L08053E44: .4byte gUnknown_02000038
.L08053E48: .4byte gUnknown_02000028
.L08053E4C: .4byte gUnknown_0201FB0C
.L08053E50: .4byte gUnknown_0200002C
.L08053E54:
	ldr r6, .L08053EBC  @ gUnknown_02000028
	mov ip, r6
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, .L08053EC0  @ gUnknown_02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	ldr r4, .L08053EC4  @ gUnknown_0201FB0C
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, .L08053EC8  @ gUnknown_0200002C
	movs r5, #0
	ldrsh r1, [r3, r5]
.L08053E70:
	movs r5, #2
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	mov r8, r1
	mov r5, ip
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r0, r0, r1
	ldr r1, [r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, .L08053ECC  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08053ED0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl func_080559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl func_080559F0
	b .L08053F02
	.align 2, 0
.L08053EBC: .4byte gUnknown_02000028
.L08053EC0: .4byte gUnknown_02017760
.L08053EC4: .4byte gUnknown_0201FB0C
.L08053EC8: .4byte gUnknown_0200002C
.L08053ECC: .4byte gBattleAnimSceneLayoutEnum
.L08053ED0:
	cmp r0, #0
	blt .L08053F02
	cmp r0, #2
	bgt .L08053F02
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08053EF4
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl func_080559F0
	b .L08053F02
.L08053EF4:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl func_080559F0
.L08053F02:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08053BBC

	THUMB_FUNC_START StartEfxFlashBG
StartEfxFlashBG: @ 0x08053F10
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08053F40  @ gUnknown_085B98CC
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	ldr r1, .L08053F44  @ gUnknown_020165C8
	ldr r2, .L08053F48  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053F40: .4byte gUnknown_085B98CC
.L08053F44: .4byte gUnknown_020165C8
.L08053F48: .4byte 0x01000100

	THUMB_FUNC_END StartEfxFlashBG

	THUMB_FUNC_START func_08053F4C
func_08053F4C: @ 0x08053F4C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08053F7C  @ gUnknown_085B98CC
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, .L08053F80  @ 0x001F001F
	str r0, [sp]
	ldr r1, .L08053F84  @ gUnknown_020165C8
	ldr r2, .L08053F88  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053F7C: .4byte gUnknown_085B98CC
.L08053F80: .4byte 0x001F001F
.L08053F84: .4byte gUnknown_020165C8
.L08053F88: .4byte 0x01000100

	THUMB_FUNC_END func_08053F4C

	THUMB_FUNC_START func_08053F8C
func_08053F8C: @ 0x08053F8C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08053FB8  @ gUnknown_085B98CC
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [sp]
	ldr r1, .L08053FBC  @ gUnknown_020165C8
	ldr r2, .L08053FC0  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053FB8: .4byte gUnknown_085B98CC
.L08053FBC: .4byte gUnknown_020165C8
.L08053FC0: .4byte 0x01000100

	THUMB_FUNC_END func_08053F8C

	THUMB_FUNC_START func_08053FC4
func_08053FC4: @ 0x08053FC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08053FE0  @ gUnknown_085B98CC
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08053FE0: .4byte gUnknown_085B98CC

	THUMB_FUNC_END func_08053FC4

	THUMB_FUNC_START func_08053FE4
func_08053FE4: @ 0x08053FE4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08054018  @ gUnknown_020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt .L08054012
	adds r0, r4, #0
	bl Proc_Break
.L08054012:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054018: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_08053FE4

	THUMB_FUNC_START func_0805401C
func_0805401C: @ 0x0805401C
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805401C

	THUMB_FUNC_START func_08054030
func_08054030: @ 0x08054030
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08054050  @ gUnknown_085B98F4
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054050: .4byte gUnknown_085B98F4

	THUMB_FUNC_END func_08054030

	THUMB_FUNC_START func_08054054
func_08054054: @ 0x08054054
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L080540A8  @ gPal
	ldr r4, .L080540AC  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl ApplyFlashingPaletteAnimation
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble .L080540A0
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
.L080540A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080540A8: .4byte gPal
.L080540AC: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_08054054

	THUMB_FUNC_START func_080540B0
func_080540B0: @ 0x080540B0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, .L08054118  @ gPal
	ldr r4, .L0805411C  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl ApplyFlashingPaletteAnimation
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble .L08054110
	adds r0, r7, #0
	bl Proc_Break
.L08054110:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08054118: .4byte gPal
.L0805411C: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_080540B0

	THUMB_FUNC_START func_08054120
func_08054120: @ 0x08054120
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08054120

	THUMB_FUNC_START func_08054134
func_08054134: @ 0x08054134
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08054154  @ gUnknown_085B991C
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054154: .4byte gUnknown_085B991C

	THUMB_FUNC_END func_08054134

	THUMB_FUNC_START func_08054158
func_08054158: @ 0x08054158
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L080541AC  @ gPal
	ldr r4, .L080541B0  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl ApplyFlashingPaletteAnimation
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble .L080541A4
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
.L080541A4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080541AC: .4byte gPal
.L080541B0: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_08054158

	THUMB_FUNC_START func_080541B4
func_080541B4: @ 0x080541B4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, .L0805421C  @ gPal
	ldr r4, .L08054220  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl ApplyFlashingPaletteAnimation
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble .L08054214
	adds r0, r7, #0
	bl Proc_Break
.L08054214:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805421C: .4byte gPal
.L08054220: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_080541B4

	THUMB_FUNC_START func_08054224
func_08054224: @ 0x08054224
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08054224

	THUMB_FUNC_START func_08054238
func_08054238: @ 0x08054238
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08054258  @ gUnknown_085B9944
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054258: .4byte gUnknown_085B9944

	THUMB_FUNC_END func_08054238

	THUMB_FUNC_START func_0805425C
func_0805425C: @ 0x0805425C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L080542B0  @ gPal
	ldr r4, .L080542B4  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl ApplyColorDarken_Unsure
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble .L080542A8
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
.L080542A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080542B0: .4byte gPal
.L080542B4: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_0805425C

	THUMB_FUNC_START func_080542B8
func_080542B8: @ 0x080542B8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, .L08054320  @ gPal
	ldr r4, .L08054324  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl ApplyColorDarken_Unsure
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble .L08054318
	adds r0, r7, #0
	bl Proc_Break
.L08054318:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08054320: .4byte gPal
.L08054324: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_080542B8

	THUMB_FUNC_START func_08054328
func_08054328: @ 0x08054328
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08054328

	THUMB_FUNC_START func_0805433C
func_0805433C: @ 0x0805433C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L0805435C  @ gUnknown_085B996C
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805435C: .4byte gUnknown_085B996C

	THUMB_FUNC_END func_0805433C

	THUMB_FUNC_START func_08054360
func_08054360: @ 0x08054360
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L080543B4  @ gPal
	ldr r4, .L080543B8  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl ApplyColorDarken_Unsure
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble .L080543AC
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
.L080543AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080543B4: .4byte gPal
.L080543B8: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_08054360

	THUMB_FUNC_START func_080543BC
func_080543BC: @ 0x080543BC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, .L08054424  @ gPal
	ldr r4, .L08054428  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl ApplyColorDarken_Unsure
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble .L0805441C
	adds r0, r7, #0
	bl Proc_Break
.L0805441C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08054424: .4byte gPal
.L08054428: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_080543BC

	THUMB_FUNC_START func_0805442C
func_0805442C: @ 0x0805442C
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805442C

	THUMB_FUNC_START StartEfxFlashHPBar
StartEfxFlashHPBar: @ 0x08054440
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, .L08054474  @ gUnknown_085B9994
	movs r1, #4
	bl SpawnProc
	adds r1, r0, #0
	str r6, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r4, [r1, #0x2e]
	strh r5, [r1, #0x30]
	cmp r4, #0
	bne .L0805446E
	adds r0, r1, #0
	bl Proc_Break
.L0805446E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054474: .4byte gUnknown_085B9994

	THUMB_FUNC_END StartEfxFlashHPBar

	THUMB_FUNC_START func_08054478
func_08054478: @ 0x08054478
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt .L08054494
	adds r0, r2, #0
	bl Proc_Break
.L08054494:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08054478

	THUMB_FUNC_START func_08054498
func_08054498: @ 0x08054498
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080544D4
	ldr r0, .L080544B8  @ gBattleHpDisplayedValue
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt .L080544C4
	ldr r0, .L080544BC  @ gUnknown_08802B84
	ldr r1, .L080544C0  @ gPal+0x360
	b .L080544E2
	.align 2, 0
.L080544B8: .4byte gBattleHpDisplayedValue
.L080544BC: .4byte gUnknown_08802B84
.L080544C0: .4byte gPal+0x360
.L080544C4:
	ldr r0, .L080544CC  @ gUnknown_08802C84
	ldr r1, .L080544D0  @ gPal+0x360
	b .L080544E2
	.align 2, 0
.L080544CC: .4byte gUnknown_08802C84
.L080544D0: .4byte gPal+0x360
.L080544D4:
	ldr r0, .L080544EC  @ gBattleHpDisplayedValue
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x50
	bgt .L080544F8
	ldr r0, .L080544F0  @ gUnknown_08802B84
	ldr r1, .L080544F4  @ gPal+0x380
.L080544E2:
	movs r2, #0x10
	bl CpuSet
	b .L08054502
	.align 2, 0
.L080544EC: .4byte gBattleHpDisplayedValue
.L080544F0: .4byte gUnknown_08802B84
.L080544F4: .4byte gPal+0x380
.L080544F8:
	ldr r0, .L08054524  @ gUnknown_08802C84
	ldr r1, .L08054528  @ gPal+0x380
	movs r2, #0x10
	bl CpuSet
.L08054502:
	bl EnablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt .L0805451E
	adds r0, r4, #0
	bl Proc_Break
.L0805451E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054524: .4byte gUnknown_08802C84
.L08054528: .4byte gPal+0x380

	THUMB_FUNC_END func_08054498

	THUMB_FUNC_START func_0805452C
func_0805452C: @ 0x0805452C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805456C
	ldr r0, .L08054554  @ gBattleHpDisplayedValue
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt .L08054564
	ldr r0, .L08054558  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, .L0805455C  @ gUnknown_08802B04
	adds r0, r0, r1
	ldr r1, .L08054560  @ gPal+0x360
	b .L08054584
	.align 2, 0
.L08054554: .4byte gBattleHpDisplayedValue
.L08054558: .4byte gUnknown_0203E114
.L0805455C: .4byte gUnknown_08802B04
.L08054560: .4byte gPal+0x360
.L08054564:
	ldr r0, .L08054568  @ gUnknown_08802C84
	b .L08054582
	.align 2, 0
.L08054568: .4byte gUnknown_08802C84
.L0805456C:
	ldr r0, .L0805458C  @ gBattleHpDisplayedValue
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt .L0805459C
	ldr r0, .L08054590  @ gUnknown_0203E114
	movs r1, #2
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, .L08054594  @ gUnknown_08802B04
	adds r0, r0, r1
.L08054582:
	ldr r1, .L08054598  @ gPal+0x380
.L08054584:
	movs r2, #0x10
	bl CpuSet
	b .L080545A6
	.align 2, 0
.L0805458C: .4byte gBattleHpDisplayedValue
.L08054590: .4byte gUnknown_0203E114
.L08054594: .4byte gUnknown_08802B04
.L08054598: .4byte gPal+0x380
.L0805459C:
	ldr r0, .L080545B8  @ gUnknown_08802C84
	ldr r1, .L080545BC  @ gPal+0x380
	movs r2, #0x10
	bl CpuSet
.L080545A6:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080545B8: .4byte gUnknown_08802C84
.L080545BC: .4byte gPal+0x380

	THUMB_FUNC_END func_0805452C

	THUMB_FUNC_START StartEfxHPBarColorChange
StartEfxHPBarColorChange: @ 0x080545C0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, .L0805467C  @ gUnknown_0201777C
	ldr r0, .L08054680  @ gUnknown_085B99C4
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r3, #0
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L08054684  @ gUnknown_080DAC58
	str r1, [r0, #0x48]
	str r2, [r0, #0x54]
	strh r2, [r0, #0x2e]
	str r2, [r0, #0x4c]
	ldr r1, .L08054688  @ gUnknown_080DAC82
	str r1, [r0, #0x50]
	str r2, [r0, #0x58]
	adds r0, #0x29
	strb r3, [r0]
	ldr r5, .L0805468C  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	ldr r1, .L08054690  @ gUnknown_08802B04
	mov sl, r1
	add r0, sl
	ldr r6, .L08054694  @ gUnknown_0201F948
	adds r1, r6, #0
	movs r2, #0x10
	bl func_080714DC
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	ldr r1, .L08054698  @ gUnknown_08802BC4
	mov r9, r1
	add r0, r9
	ldr r4, .L0805469C  @ gUnknown_0201F978
	adds r1, r4, #0
	movs r2, #0x10
	bl func_080714DC
	ldr r2, .L080546A0  @ gUnknown_0201F9A8
	movs r0, #5
	mov r8, r0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl func_08071574
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r6, .L080546A4  @ gUnknown_0201FA08
	adds r1, r6, #0
	movs r2, #0x10
	bl func_080714DC
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, r9
	ldr r4, .L080546A8  @ gUnknown_0201FA38
	adds r1, r4, #0
	movs r2, #0x10
	bl func_080714DC
	ldr r2, .L080546AC  @ gUnknown_0201FA68
	mov r0, r8
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl func_08071574
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805467C: .4byte gUnknown_0201777C
.L08054680: .4byte gUnknown_085B99C4
.L08054684: .4byte gUnknown_080DAC58
.L08054688: .4byte gUnknown_080DAC82
.L0805468C: .4byte gUnknown_0203E114
.L08054690: .4byte gUnknown_08802B04
.L08054694: .4byte gUnknown_0201F948
.L08054698: .4byte gUnknown_08802BC4
.L0805469C: .4byte gUnknown_0201F978
.L080546A0: .4byte gUnknown_0201F9A8
.L080546A4: .4byte gUnknown_0201FA08
.L080546A8: .4byte gUnknown_0201FA38
.L080546AC: .4byte gUnknown_0201FA68

	THUMB_FUNC_END StartEfxHPBarColorChange

	THUMB_FUNC_START EndEfxHPBarColorChange
EndEfxHPBarColorChange: @ 0x080546B0
	push {lr}
	ldr r0, .L080546C0  @ gUnknown_0201777C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L080546C0: .4byte gUnknown_0201777C

	THUMB_FUNC_END EndEfxHPBarColorChange

	THUMB_FUNC_START func_080546C4
func_080546C4: @ 0x080546C4
	ldr r0, .L080546D0  @ gUnknown_0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
.L080546D0: .4byte gUnknown_0201777C

	THUMB_FUNC_END func_080546C4

	THUMB_FUNC_START func_080546D4
func_080546D4: @ 0x080546D4
	ldr r0, .L080546E0  @ gUnknown_0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
.L080546E0: .4byte gUnknown_0201777C

	THUMB_FUNC_END func_080546D4

	THUMB_FUNC_START func_080546E4
func_080546E4: @ 0x080546E4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq .L080547CC
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt .L0805470A
	str r0, [r4, #0x54]
.L0805470A:
	adds r0, r4, #0
	adds r0, #0x2e
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r2, [r4, #0x50]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt .L08054722
	str r0, [r4, #0x58]
.L08054722:
	ldr r0, .L0805474C  @ gBattleHpDisplayedValue
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt .L08054760
	ldr r2, .L08054750  @ gUnknown_0201F948
	ldr r3, .L08054754  @ gUnknown_0201F978
	ldr r5, .L08054758  @ gUnknown_0201F9A8
	ldr r0, .L0805475C  @ gPal+0x360
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl func_080715F4
	b .L08054770
	.align 2, 0
.L0805474C: .4byte gBattleHpDisplayedValue
.L08054750: .4byte gUnknown_0201F948
.L08054754: .4byte gUnknown_0201F978
.L08054758: .4byte gUnknown_0201F9A8
.L0805475C: .4byte gPal+0x360
.L08054760:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, .L0805479C  @ gUnknown_08802C84
	adds r0, r0, r1
	ldr r1, .L080547A0  @ gPal+0x360
	movs r2, #8
	bl CpuFastSet
.L08054770:
	ldr r0, .L080547A4  @ gBattleHpDisplayedValue
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt .L080547B8
	ldr r2, .L080547A8  @ gUnknown_0201FA08
	ldr r3, .L080547AC  @ gUnknown_0201FA38
	ldr r5, .L080547B0  @ gUnknown_0201FA68
	ldr r0, .L080547B4  @ gPal+0x380
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl func_080715F4
	b .L080547C8
	.align 2, 0
.L0805479C: .4byte gUnknown_08802C84
.L080547A0: .4byte gPal+0x360
.L080547A4: .4byte gBattleHpDisplayedValue
.L080547A8: .4byte gUnknown_0201FA08
.L080547AC: .4byte gUnknown_0201FA38
.L080547B0: .4byte gUnknown_0201FA68
.L080547B4: .4byte gPal+0x380
.L080547B8:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, .L080547D4  @ gUnknown_08802C84
	adds r0, r0, r1
	ldr r1, .L080547D8  @ gPal+0x380
	movs r2, #8
	bl CpuFastSet
.L080547C8:
	bl EnablePalSync
.L080547CC:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080547D4: .4byte gUnknown_08802C84
.L080547D8: .4byte gPal+0x380

	THUMB_FUNC_END func_080546E4

	THUMB_FUNC_START StartEfxFlashUnit
StartEfxFlashUnit: @ 0x080547DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, .L08054814  @ gUnknown_085B99E4
	movs r1, #4
	bl SpawnProc
	str r6, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054814: .4byte gUnknown_085B99E4

	THUMB_FUNC_END StartEfxFlashUnit

	THUMB_FUNC_START func_08054818
func_08054818: @ 0x08054818
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt .L0805487A
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08054854
	ldr r0, .L0805484C  @ gUnknown_08802D24
	ldr r1, .L08054850  @ gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl func_0807027C
	b .L08054864
	.align 2, 0
.L0805484C: .4byte gUnknown_08802D24
.L08054850: .4byte gPal+0x2E0
.L08054854:
	ldr r0, .L08054880  @ gUnknown_08802D24
	ldr r1, .L08054884  @ gPal+0x320
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl func_0807027C
.L08054864:
	bl EnablePalSync
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt .L0805487A
	adds r0, r4, #0
	bl Proc_Break
.L0805487A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054880: .4byte gUnknown_08802D24
.L08054884: .4byte gPal+0x320

	THUMB_FUNC_END func_08054818

	THUMB_FUNC_START func_08054888
func_08054888: @ 0x08054888
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080548B4
	ldr r0, .L080548AC  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r1, .L080548B0  @ gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl func_0807035C
	b .L080548C6
	.align 2, 0
.L080548AC: .4byte gUnknown_02000054
.L080548B0: .4byte gPal+0x2E0
.L080548B4:
	ldr r0, .L080548D8  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r1, .L080548DC  @ gPal+0x320
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl func_0807035C
.L080548C6:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080548D8: .4byte gUnknown_02000054
.L080548DC: .4byte gPal+0x320

	THUMB_FUNC_END func_08054888

	THUMB_FUNC_START func_080548E0
func_080548E0: @ 0x080548E0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, .L0805492C  @ gUnknown_085B9A0C
	movs r1, #4
	bl SpawnProc
	str r6, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	ldrh r0, [r6, #0x10]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldrh r1, [r6]
	movs r0, #8
	orrs r0, r1
	strh r0, [r6]
	movs r0, #2
	strh r0, [r6, #6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805492C: .4byte gUnknown_085B9A0C

	THUMB_FUNC_END func_080548E0

	THUMB_FUNC_START func_08054930
func_08054930: @ 0x08054930
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt .L080549A8
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805496C
	ldr r0, .L08054964  @ gUnknown_08802D24
	ldr r1, .L08054968  @ gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl func_0807027C
	b .L0805497C
	.align 2, 0
.L08054964: .4byte gUnknown_08802D24
.L08054968: .4byte gPal+0x2E0
.L0805496C:
	ldr r0, .L080549B0  @ gUnknown_08802D24
	ldr r1, .L080549B4  @ gPal+0x320
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl func_0807027C
.L0805497C:
	bl EnablePalSync
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt .L080549A8
	ldr r1, [r4, #0x5c]
	ldrh r2, [r1, #0x10]
	movs r0, #0x40
	movs r3, #0
	orrs r0, r2
	strh r0, [r1, #0x10]
	ldrh r2, [r1]
	ldr r0, .L080549B8  @ 0x0000FFF7
	ands r0, r2
	strh r0, [r1]
	strh r3, [r1, #6]
	adds r0, r4, #0
	bl Proc_Break
.L080549A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080549B0: .4byte gUnknown_08802D24
.L080549B4: .4byte gPal+0x320
.L080549B8: .4byte 0x0000FFF7

	THUMB_FUNC_END func_08054930

	THUMB_FUNC_START func_080549BC
func_080549BC: @ 0x080549BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080549E8
	ldr r0, .L080549E0  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r1, .L080549E4  @ gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl func_0807035C
	b .L080549FA
	.align 2, 0
.L080549E0: .4byte gUnknown_02000054
.L080549E4: .4byte gPal+0x2E0
.L080549E8:
	ldr r0, .L08054A14  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r1, .L08054A18  @ gPal+0x320
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl func_0807035C
.L080549FA:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	ldr r2, [r4, #0x5c]
	ldrh r1, [r2, #0x10]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r2, #0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054A14: .4byte gUnknown_02000054
.L08054A18: .4byte gPal+0x320

	THUMB_FUNC_END func_080549BC

	THUMB_FUNC_START StartEfxStatusUnit
StartEfxStatusUnit: @ 0x08054A1C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08054A34
	ldr r0, .L08054A30  @ gpUnitLeft_BattleStruct
	b .L08054A36
	.align 2, 0
.L08054A30: .4byte gpUnitLeft_BattleStruct
.L08054A34:
	ldr r0, .L08054ABC  @ gpUnitRight_BattleStruct
.L08054A36:
	ldr r6, [r0]
	ldr r0, .L08054AC0  @ gUnknown_085B9A34
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	str r5, [r4, #0x5c]
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, .L08054AC4  @ gUnknown_080DACDA
	str r0, [r4, #0x48]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [r4, #0x4c]
	ldr r0, .L08054AC8  @ gUnknown_0203E0FC
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne .L08054A6A
	str r1, [r4, #0x4c]
.L08054A6A:
	str r1, [r4, #0x50]
	strh r1, [r4, #0x36]
	strh r1, [r4, #0x34]
	strh r1, [r4, #0x32]
	adds r0, r5, #0
	bl GetAISSubjectId
	ldr r1, .L08054ACC  @ gUnknown_0201776C
	lsls r0, r0, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08054AD8
	ldr r5, .L08054AD0  @ gUnknown_02000054
	ldr r0, [r5]
	ldr r4, .L08054AD4  @ gUnknown_020222A8
	adds r1, r4, #0
	movs r2, #0x10
	bl func_080714DC
	ldr r0, [r5]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl func_0807151C
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl func_08071574
	b .L08054B08
	.align 2, 0
.L08054ABC: .4byte gpUnitRight_BattleStruct
.L08054AC0: .4byte gUnknown_085B9A34
.L08054AC4: .4byte gUnknown_080DACDA
.L08054AC8: .4byte gUnknown_0203E0FC
.L08054ACC: .4byte gUnknown_0201776C
.L08054AD0: .4byte gUnknown_02000054
.L08054AD4: .4byte gUnknown_020222A8
.L08054AD8:
	ldr r5, .L08054B10  @ gUnknown_02000054
	ldr r0, [r5, #4]
	ldr r4, .L08054B14  @ gUnknown_020222A8+0x60
	adds r1, r4, #0
	movs r2, #0x10
	bl func_080714DC
	ldr r0, [r5, #4]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl func_0807151C
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl func_08071574
.L08054B08:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054B10: .4byte gUnknown_02000054
.L08054B14: .4byte gUnknown_020222A8+0x60

	THUMB_FUNC_END StartEfxStatusUnit

	THUMB_FUNC_START func_08054B18
func_08054B18: @ 0x08054B18
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L08054B50  @ gUnknown_0201776C
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq .L08054B4A
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl Proc_End
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	str r1, [r0]
.L08054B4A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054B50: .4byte gUnknown_0201776C

	THUMB_FUNC_END func_08054B18

	THUMB_FUNC_START DeleteEach6C_efxStatusUnit
DeleteEach6C_efxStatusUnit: @ 0x08054B54
	push {lr}
	ldr r0, .L08054B60  @ gUnknown_085B9A34
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08054B60: .4byte gUnknown_085B9A34

	THUMB_FUNC_END DeleteEach6C_efxStatusUnit

	THUMB_FUNC_START func_08054B64
func_08054B64: @ 0x08054B64
	push {r4, lr}
	ldr r4, .L08054B80  @ gUnknown_0201776C
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054B80: .4byte gUnknown_0201776C

	THUMB_FUNC_END func_08054B64

	THUMB_FUNC_START func_08054B84
func_08054B84: @ 0x08054B84
	push {r4, lr}
	ldr r4, .L08054BA0  @ gUnknown_0201776C
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054BA0: .4byte gUnknown_0201776C

	THUMB_FUNC_END func_08054B84

	THUMB_FUNC_START func_08054BA4
func_08054BA4: @ 0x08054BA4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, .L08054BD0  @ gUnknown_0201776C
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	str r5, [r0, #0x4c]
	cmp r5, #0
	bne .L08054BC8
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl func_08054BF0
.L08054BC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08054BD0: .4byte gUnknown_0201776C

	THUMB_FUNC_END func_08054BA4

	THUMB_FUNC_START func_08054BD4
func_08054BD4: @ 0x08054BD4
	push {r4, lr}
	ldr r4, .L08054BEC  @ gUnknown_0201776C
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x4c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08054BEC: .4byte gUnknown_0201776C

	THUMB_FUNC_END func_08054BD4

	THUMB_FUNC_START func_08054BF0
func_08054BF0: @ 0x08054BF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08054C58
	ldr r0, .L08054C4C  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r4, .L08054C50  @ gPal+0x2E0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L08054C54  @ 0xFFFFFD20
	adds r4, r4, r0
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r7, #0
	bl func_080713B0
	bl func_0806FA98
	cmp r0, #0
	beq .L08054C7A
	mov r0, r8
	bl func_0807035C
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r7, #0
	bl func_080713B0
	b .L08054C7A
	.align 2, 0
.L08054C4C: .4byte gUnknown_02000054
.L08054C50: .4byte gPal+0x2E0
.L08054C54: .4byte 0xFFFFFD20
.L08054C58:
	ldr r0, .L08054C88  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r4, .L08054C8C  @ gPal+0x320
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L08054C90  @ 0xFFFFFCE0
	adds r4, r4, r0
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r7, #0
	bl func_080713B0
.L08054C7A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08054C88: .4byte gUnknown_02000054
.L08054C8C: .4byte gPal+0x320
.L08054C90: .4byte 0xFFFFFCE0

	THUMB_FUNC_END func_08054BF0

	THUMB_FUNC_START func_08054C94
func_08054C94: @ 0x08054C94
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl func_08054BD4
	cmp r0, #0
	bne .L08054CA6
	b .L08054E42
.L08054CA6:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08054CB2
	b .L08054E42
.L08054CB2:
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	cmp r1, r0
	beq .L08054CC2
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	str r1, [r4, #0x50]
.L08054CC2:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08054D5C
	ldr r0, [r4, #0x4c]
	subs r0, #1
	cmp r0, #0xc
	bhi .L08054D56
	lsls r0, r0, #2
	ldr r1, .L08054CEC  @ .L08054CF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08054CEC: .4byte .L08054CF0
.L08054CF0: @ jump table
	.4byte .L08054D24 @ case 0
	.4byte .L08054D2C @ case 1
	.4byte .L08054D56 @ case 2
	.4byte .L08054D34 @ case 3
	.4byte .L08054D56 @ case 4
	.4byte .L08054D56 @ case 5
	.4byte .L08054D56 @ case 6
	.4byte .L08054D56 @ case 7
	.4byte .L08054D56 @ case 8
	.4byte .L08054D56 @ case 9
	.4byte .L08054D3A @ case 10
	.4byte .L08054D44 @ case 11
	.4byte .L08054D3A @ case 12
.L08054D24:
	movs r0, #0
	strh r2, [r4, #0x32]
	strh r0, [r4, #0x34]
	b .L08054D5A
.L08054D2C:
	movs r0, #0
	strh r0, [r4, #0x32]
	strh r0, [r4, #0x34]
	b .L08054D5A
.L08054D34:
	movs r0, #0
	strh r2, [r4, #0x32]
	b .L08054D3E
.L08054D3A:
	movs r0, #0x10
	strh r0, [r4, #0x32]
.L08054D3E:
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	b .L08054D5C
.L08054D44:
	strh r2, [r4, #0x32]
	strh r2, [r4, #0x34]
	adds r0, r2, #1
	cmp r0, #0
	bge .L08054D50
	adds r0, r2, #4
.L08054D50:
	asrs r0, r0, #2
	strh r0, [r4, #0x36]
	b .L08054D5C
.L08054D56:
	strh r2, [r4, #0x32]
	strh r2, [r4, #0x34]
.L08054D5A:
	strh r2, [r4, #0x36]
.L08054D5C:
	ldr r0, [r4, #0x4c]
	subs r0, #1
	cmp r0, #0xc
	bhi .L08054E3E
	lsls r0, r0, #2
	ldr r1, .L08054D70  @ .L08054D74
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08054D70: .4byte .L08054D74
.L08054D74: @ jump table
	.4byte .L08054DA8 @ case 0
	.4byte .L08054DA8 @ case 1
	.4byte .L08054E2C @ case 2
	.4byte .L08054DA8 @ case 3
	.4byte .L08054E3E @ case 4
	.4byte .L08054E3E @ case 5
	.4byte .L08054E3E @ case 6
	.4byte .L08054E3E @ case 7
	.4byte .L08054E3E @ case 8
	.4byte .L08054E3E @ case 9
	.4byte .L08054DC4 @ case 10
	.4byte .L08054DB0 @ case 11
	.4byte .L08054DC4 @ case 12
.L08054DA8:
	ldr r0, [r4, #0x5c]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	b .L08054DB6
.L08054DB0:
	ldr r0, [r4, #0x5c]
	movs r6, #0x32
	ldrsh r1, [r4, r6]
.L08054DB6:
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl func_08054BF0
	b .L08054E3E
.L08054DC4:
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08054DF8
	ldr r0, .L08054DF0  @ gPal+0x2E0
	ldr r1, .L08054DF4  @ gUnknown_020222A8
	adds r2, r1, #0
	adds r2, #0x30
	movs r6, #0xc0
	lsls r6, r6, #1
	adds r3, r1, r6
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl func_080715F4
	b .L08054E16
	.align 2, 0
.L08054DF0: .4byte gPal+0x2E0
.L08054DF4: .4byte gUnknown_020222A8
.L08054DF8:
	ldr r0, .L08054E24  @ gPal+0x320
	ldr r1, .L08054E28  @ gUnknown_020222A8+0x60
	adds r2, r1, #0
	adds r2, #0x30
	movs r5, #0xa8
	lsls r5, r5, #2
	adds r3, r1, r5
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl func_080715F4
.L08054E16:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl MU_EndAll
	b .L08054E3E
	.align 2, 0
.L08054E24: .4byte gPal+0x320
.L08054E28: .4byte gUnknown_020222A8+0x60
.L08054E2C:
	ldr r0, [r4, #0x5c]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl func_08054BF0
.L08054E3E:
	bl EnablePalSync
.L08054E42:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08054C94

	THUMB_FUNC_START func_08054E4C
func_08054E4C: @ 0x08054E4C
	push {lr}
	ldr r0, [r0, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08054E70
	ldr r0, .L08054E68  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r1, .L08054E6C  @ gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	b .L08054E7C
	.align 2, 0
.L08054E68: .4byte gUnknown_02000054
.L08054E6C: .4byte gPal+0x2E0
.L08054E70:
	ldr r0, .L08054E84  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r1, .L08054E88  @ gPal+0x320
	movs r2, #8
	bl CpuFastSet
.L08054E7C:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
.L08054E84: .4byte gUnknown_02000054
.L08054E88: .4byte gPal+0x320

	THUMB_FUNC_END func_08054E4C

	THUMB_FUNC_START StartEfxWeaponIcon
StartEfxWeaponIcon: @ 0x08054E8C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, .L08054EC8  @ gUnknown_085B9A5C
	movs r1, #3
	bl SpawnProc
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L08054ECC  @ gUnknown_080DAD0A
	str r1, [r0, #0x48]
	str r2, [r0, #0x4c]
	str r2, [r0, #0x50]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x54]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [r0, #0x58]
	ldr r1, .L08054ED0  @ gUnknown_02017774
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054EC8: .4byte gUnknown_085B9A5C
.L08054ECC: .4byte gUnknown_080DAD0A
.L08054ED0: .4byte gUnknown_02017774

	THUMB_FUNC_END StartEfxWeaponIcon

	THUMB_FUNC_START EndEfxWeaponIcon
EndEfxWeaponIcon: @ 0x08054ED4
	push {r4, lr}
	ldr r4, .L08054EEC  @ gUnknown_02017774
	ldr r0, [r4]
	cmp r0, #0
	beq .L08054EE6
	bl Proc_End
	movs r0, #0
	str r0, [r4]
.L08054EE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054EEC: .4byte gUnknown_02017774

	THUMB_FUNC_END EndEfxWeaponIcon

	THUMB_FUNC_START PauseEfxWeaponIcon
PauseEfxWeaponIcon: @ 0x08054EF0
	ldr r0, .L08054EFC  @ gUnknown_02017774
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08054EFC: .4byte gUnknown_02017774

	THUMB_FUNC_END PauseEfxWeaponIcon

	THUMB_FUNC_START ResumeEfxWeaponIcon
ResumeEfxWeaponIcon: @ 0x08054F00
	ldr r0, .L08054F0C  @ gUnknown_02017774
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
.L08054F0C: .4byte gUnknown_02017774

	THUMB_FUNC_END ResumeEfxWeaponIcon

	THUMB_FUNC_START EfxWeaponIcon_OnLoop
EfxWeaponIcon_OnLoop: @ 0x08054F10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #1
	beq .L08054F6E
	bl InitIcons
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt .L08054F36
	str r0, [r4, #0x4c]
.L08054F36:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq .L08054F50
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
	ldr r0, .L08054F74  @ gPal
	ldr r3, [r4, #0x4c]
	movs r1, #0x1d
	movs r2, #1
	bl ApplyFlashingPaletteAnimation
.L08054F50:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq .L08054F6A
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
	ldr r0, .L08054F74  @ gPal
	ldr r3, [r4, #0x4c]
	movs r1, #0x1e
	movs r2, #1
	bl ApplyFlashingPaletteAnimation
.L08054F6A:
	bl EnablePalSync
.L08054F6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08054F74: .4byte gPal

	THUMB_FUNC_END EfxWeaponIcon_OnLoop

	THUMB_FUNC_START EfxWeaponIcon_OnEnd
EfxWeaponIcon_OnEnd: @ 0x08054F78
	push {r4, lr}
	adds r4, r0, #0
	bl InitIcons
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq .L08054F8E
	movs r0, #0
	movs r1, #0x1d
	bl ApplyIconPalette
.L08054F8E:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq .L08054F9C
	movs r0, #0
	movs r1, #0x1e
	bl ApplyIconPalette
.L08054F9C:
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxWeaponIcon_OnEnd

	THUMB_FUNC_START StartEfxSpellCast
StartEfxSpellCast: @ 0x08054FA8
	push {r4, r5, lr}
	bl func_0806FAB0
	adds r4, r0, #0
	cmp r4, #0
	bne .L08054FF4
	ldr r0, .L08054FDC  @ gUnknown_085B9A84
	movs r1, #4
	bl SpawnProc
	adds r5, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	strh r4, [r5, #0x2c]
	movs r0, #4
	strh r0, [r5, #0x2e]
	ldr r0, .L08054FE0  @ gUnknown_02017778
	ldr r0, [r0]
	cmp r0, #0
	bne .L08054FEC
	ldr r0, .L08054FE4  @ gPal+0xC0
	ldr r1, .L08054FE8  @ gUnknown_0201C790
	movs r2, #0x50
	bl CpuFastSet
	b .L08054FF0
	.align 2, 0
.L08054FDC: .4byte gUnknown_085B9A84
.L08054FE0: .4byte gUnknown_02017778
.L08054FE4: .4byte gPal+0xC0
.L08054FE8: .4byte gUnknown_0201C790
.L08054FEC:
	bl Proc_End
.L08054FF0:
	ldr r0, .L08054FFC  @ gUnknown_02017778
	str r5, [r0]
.L08054FF4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08054FFC: .4byte gUnknown_02017778

	THUMB_FUNC_END StartEfxSpellCast

	THUMB_FUNC_START StartEndEfxSpellCast
StartEndEfxSpellCast: @ 0x08055000
	push {lr}
	ldr r0, .L08055018  @ gUnknown_02017778
	ldr r0, [r0]
	cmp r0, #0
	beq .L08055012
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
.L08055012:
	pop {r0}
	bx r0
	.align 2, 0
.L08055018: .4byte gUnknown_02017778

	THUMB_FUNC_END StartEndEfxSpellCast

	THUMB_FUNC_START func_0805501C
func_0805501C: @ 0x0805501C
	push {lr}
	ldr r1, .L08055034  @ gUnknown_02017778
	ldr r0, [r1]
	cmp r0, #0
	beq .L0805502E
	movs r0, #0
	str r0, [r1]
	bl Proc_End
.L0805502E:
	pop {r0}
	bx r0
	.align 2, 0
.L08055034: .4byte gUnknown_02017778

	THUMB_FUNC_END func_0805501C

	THUMB_FUNC_START func_08055038
func_08055038: @ 0x08055038
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L08055094  @ gUnknown_0201C790
	ldr r4, .L08055098  @ gPal+0xC0
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne .L0805508C
	adds r0, r6, #0
	bl Proc_Break
.L0805508C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08055094: .4byte gUnknown_0201C790
.L08055098: .4byte gPal+0xC0

	THUMB_FUNC_END func_08055038

	THUMB_FUNC_START func_0805509C
func_0805509C: @ 0x0805509C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L080550D4  @ gUnknown_0201C790
	ldr r4, .L080550D8  @ gPal+0xC0
	adds r1, r4, #0
	movs r2, #0x50
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #8
	bl ApplyColorDarken_Unsure
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L080550CE
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L080550CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080550D4: .4byte gUnknown_0201C790
.L080550D8: .4byte gPal+0xC0

	THUMB_FUNC_END func_0805509C

	THUMB_FUNC_START func_080550DC
func_080550DC: @ 0x080550DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r7, .L08055150  @ gUnknown_0201C790
	ldr r6, .L08055154  @ gPal+0xC0
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl CpuFastSet
	adds r0, r6, #0
	subs r0, #0xc0
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne .L08055146
	ldr r1, .L08055158  @ gUnknown_02017778
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x50
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
.L08055146:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08055150: .4byte gUnknown_0201C790
.L08055154: .4byte gPal+0xC0
.L08055158: .4byte gUnknown_02017778

	THUMB_FUNC_END func_080550DC

	THUMB_FUNC_START func_0805515C
func_0805515C: @ 0x0805515C
	bx lr

	THUMB_FUNC_END func_0805515C

	THUMB_FUNC_START SpellFx_Begin
SpellFx_Begin: @ 0x08055160
	ldr r1, .L08055168  @ gUnknown_0201772C
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055168: .4byte gUnknown_0201772C

	THUMB_FUNC_END SpellFx_Begin

	THUMB_FUNC_START SpellFx_Finish
SpellFx_Finish: @ 0x0805516C
	ldr r1, .L08055174  @ gUnknown_0201772C
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055174: .4byte gUnknown_0201772C

	THUMB_FUNC_END SpellFx_Finish

	THUMB_FUNC_START SpellFx_ResetBg1Offset
SpellFx_ResetBg1Offset: @ 0x08055178
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	THUMB_FUNC_END SpellFx_ResetBg1Offset

	THUMB_FUNC_START SpellFx_ClearBg1
SpellFx_ClearBg1: @ 0x08055188
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, .L080551A8  @ gBg1Tm
	ldr r2, .L080551AC  @ 0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L080551A8: .4byte gBg1Tm
.L080551AC: .4byte 0x01000200

	THUMB_FUNC_END SpellFx_ClearBg1

	THUMB_FUNC_START SpellFx_InitBg1Blend
SpellFx_InitBg1Blend: @ 0x080551B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
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
	ldr r0, .L08055268  @ gDispIo
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov r8, r2
	ldrb r1, [r2]
	movs r2, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r0, [r7]
	orrs r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08055268: .4byte gDispIo

	THUMB_FUNC_END SpellFx_InitBg1Blend

	THUMB_FUNC_START SpellFx_EndBlend
SpellFx_EndBlend: @ 0x0805526C
	push {lr}
	bl SetBlendNone
	pop {r0}
	bx r0

	THUMB_FUNC_END SpellFx_EndBlend

	THUMB_FUNC_START StartBattleAnimHitEffectsDefault
StartBattleAnimHitEffectsDefault: @ 0x08055278
	push {lr}
	movs r2, #3
	movs r3, #4
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0

	THUMB_FUNC_END StartBattleAnimHitEffectsDefault

	THUMB_FUNC_START func_08055288
func_08055288: @ 0x08055288
	push {lr}
	movs r2, #5
	movs r3, #5
	bl StartBattleAnimHitEffects
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08055288

	THUMB_FUNC_START StartBattleAnimHitEffects
StartBattleAnimHitEffects: @ 0x08055298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r1, #0
	str r2, [sp]
	mov sl, r3
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080552C4
	ldr r0, .L080552C0  @ gUnknown_02000000
	ldr r7, [r0, #8]
	ldr r1, [r0, #0xc]
	mov r9, r1
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b .L080552D0
	.align 2, 0
.L080552C0: .4byte gUnknown_02000000
.L080552C4:
	ldr r0, .L080552E0  @ gUnknown_02000000
	ldr r7, [r0]
	ldr r1, [r0, #4]
	mov r9, r1
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
.L080552D0:
	mov r8, r0
	cmp r4, #0
	beq .L080552E4
	cmp r4, #1
	bne .L080552DC
	b .L0805540E
.L080552DC:
	b .L08055414
	.align 2, 0
.L080552E0: .4byte gUnknown_02000000
.L080552E4:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq .L08055334
	adds r0, r7, #0
	bl func_08054BD4
	cmp r0, #0
	bne .L08055334
	adds r0, r7, #0
	movs r1, #1
	bl func_08054BA4
.L08055334:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	ands r1, r2
	adds r4, r0, #0
	cmp r1, #0
	beq .L08055356
	adds r0, r5, #0
	bl func_08054BD4
	cmp r0, #0
	bne .L08055356
	adds r0, r5, #0
	movs r1, #1
	bl func_08054BA4
.L08055356:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne .L0805536C
	asrs r0, r4, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08055374
.L0805536C:
	adds r0, r5, #0
	adds r5, r7, #0
	adds r7, r0, #0
	mov r8, r9
.L08055374:
	ldr r4, .L080553DC  @ gUnknown_0203E152
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r6, r4
	beq .L08055402
	adds r0, r5, #0
	bl StartEfxHpBar
	adds r0, r7, #0
	bl func_0805A268
	cmp r0, #1
	bne .L080553E0
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sl
	bl StartEfxHitQuake
	b .L080553EA
	.align 2, 0
.L080553DC: .4byte gUnknown_0203E152
.L080553E0:
	adds r0, r5, #0
	adds r1, r7, #0
	ldr r2, [sp]
	bl StartEfxHitQuake
.L080553EA:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl StartEfxFlashHPBar
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl StartEfxFlashUnit
	b .L08055414
.L08055402:
	adds r0, r5, #0
	mov r1, r8
	movs r2, #0
	bl StartEfxNoDamage
	b .L08055414
.L0805540E:
	adds r0, r5, #0
	bl StartEfxAvoid
.L08055414:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartBattleAnimHitEffects

	THUMB_FUNC_START StartBattleAnimResireHitEffects
StartBattleAnimResireHitEffects: @ 0x08055424
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r1
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08055444
	ldr r0, .L08055440  @ gUnknown_02000000
	ldr r7, [r0, #8]
	ldr r5, [r0]
	ldr r0, [r0, #4]
	b .L0805544C
	.align 2, 0
.L08055440: .4byte gUnknown_02000000
.L08055444:
	ldr r0, .L080554A4  @ gUnknown_02000000
	ldr r7, [r0]
	ldr r5, [r0, #8]
	ldr r0, [r0, #0xc]
.L0805544C:
	mov r8, r0
	ldr r4, .L080554A8  @ gUnknown_0203E152
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r4, #1
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r1
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r1
	bl GetBattleAnimHpValue
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	mov r0, r9
	cmp r0, #0
	beq .L080554AC
	cmp r0, #1
	beq .L08055504
	b .L0805550A
	.align 2, 0
.L080554A4: .4byte gUnknown_02000000
.L080554A8: .4byte gUnknown_0203E152
.L080554AC:
	cmp r6, r4
	beq .L080554EE
	adds r0, r5, #0
	bl StartEfxHpBarResire
	adds r0, r7, #0
	bl func_0805A268
	cmp r0, #1
	bne .L080554CC
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #4
	bl StartEfxHitQuake
	b .L080554D6
.L080554CC:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #3
	bl StartEfxHitQuake
.L080554D6:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	bl StartEfxFlashHPBar
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl StartEfxFlashUnit
	b .L0805550A
.L080554EE:
	ldr r1, .L08055500  @ gUnknown_02017750
	movs r0, #2
	str r0, [r1]
	adds r0, r5, #0
	mov r1, r8
	movs r2, #1
	bl StartEfxNoDamage
	b .L0805550A
	.align 2, 0
.L08055500: .4byte gUnknown_02017750
.L08055504:
	adds r0, r5, #0
	bl StartEfxAvoid
.L0805550A:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartBattleAnimResireHitEffects

	THUMB_FUNC_START func_08055518
func_08055518: @ 0x08055518
	push {r4, lr}
	adds r4, r1, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08055530
	ldr r0, .L0805552C  @ gUnknown_02000000
	ldr r0, [r0]
	b .L08055534
	.align 2, 0
.L0805552C: .4byte gUnknown_02000000
.L08055530:
	ldr r0, .L08055540  @ gUnknown_02000000
	ldr r0, [r0, #8]
.L08055534:
	cmp r4, #0
	beq .L08055544
	cmp r4, #1
	beq .L0805554A
	b .L0805554E
	.align 2, 0
.L08055540: .4byte gUnknown_02000000
.L08055544:
	bl StartEfxStatusCHG
	b .L0805554E
.L0805554A:
	bl StartEfxAvoid
.L0805554E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08055518

	THUMB_FUNC_START func_08055554
func_08055554: @ 0x08055554
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, .L08055578  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08055580
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805557C
	adds r0, r7, #0
	b .L08055590
	.align 2, 0
.L08055578: .4byte gBattleAnimSceneLayoutEnum
.L0805557C:
	adds r0, r6, #0
	b .L08055590
.L08055580:
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805558E
	adds r0, r5, #0
	b .L08055590
.L0805558E:
	ldr r0, [sp, #0x14]
.L08055590:
	movs r1, #0x78
	bl BsoCreate
	adds r1, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08055554

	THUMB_FUNC_START func_080555B0
func_080555B0: @ 0x080555B0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, .L080555D4  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080555DC
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080555D8
	adds r0, r7, #0
	b .L080555EC
	.align 2, 0
.L080555D4: .4byte gBattleAnimSceneLayoutEnum
.L080555D8:
	adds r0, r6, #0
	b .L080555EC
.L080555DC:
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080555EA
	adds r0, r5, #0
	b .L080555EC
.L080555EA:
	ldr r0, [sp, #0x14]
.L080555EC:
	movs r1, #0x14
	bl BsoCreate
	adds r1, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080555B0

	THUMB_FUNC_START func_0805560C
func_0805560C: @ 0x0805560C
	push {r4, lr}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, .L08055640  @ gBattleAnimSceneLayoutEnum
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r2, #0
	cmp r0, #0
	bne .L08055620
	adds r4, r1, #0
.L08055620:
	adds r0, r3, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08055648
	ldr r1, .L08055644  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070EC4
	b .L0805565C
	.align 2, 0
.L08055640: .4byte gBattleAnimSceneLayoutEnum
.L08055644: .4byte gBg1Tm
.L08055648:
	ldr r1, .L0805566C  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070E94
.L0805565C:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805566C: .4byte gBg1Tm

	THUMB_FUNC_END func_0805560C

	THUMB_FUNC_START SpellFx_WriteBgMap
SpellFx_WriteBgMap: @ 0x08055670
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, .L0805568C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08055694
	ldr r1, .L08055690  @ gUnknown_02019790
	adds r0, r3, #0
	bl LZ77UnCompWram
	b .L0805569C
	.align 2, 0
.L0805568C: .4byte gBattleAnimSceneLayoutEnum
.L08055690: .4byte gUnknown_02019790
.L08055694:
	ldr r1, .L080556C0  @ gUnknown_02019790
	adds r0, r2, #0
	bl LZ77UnCompWram
.L0805569C:
	ldr r5, .L080556C0  @ gUnknown_02019790
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080556C8
	ldr r1, .L080556C4  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070EC4
	b .L080556DC
	.align 2, 0
.L080556C0: .4byte gUnknown_02019790
.L080556C4: .4byte gBg1Tm
.L080556C8:
	ldr r1, .L080556EC  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070E94
.L080556DC:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080556EC: .4byte gBg1Tm

	THUMB_FUNC_END SpellFx_WriteBgMap

	THUMB_FUNC_START func_080556F0
func_080556F0: @ 0x080556F0
	push {r4, lr}
	sub sp, #8
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L08055710  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08055718
	ldr r1, .L08055714  @ gUnknown_02019790
	adds r0, r3, #0
	bl LZ77UnCompWram
	b .L08055720
	.align 2, 0
.L08055710: .4byte gBattleAnimSceneLayoutEnum
.L08055714: .4byte gUnknown_02019790
.L08055718:
	ldr r1, .L0805573C  @ gUnknown_02019790
	adds r0, r2, #0
	bl LZ77UnCompWram
.L08055720:
	ldr r2, .L0805573C  @ gUnknown_02019790
	cmp r4, #0
	bne .L08055744
	ldr r1, .L08055740  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070EC4
	b .L08055758
	.align 2, 0
.L0805573C: .4byte gUnknown_02019790
.L08055740: .4byte gBg1Tm
.L08055744:
	ldr r1, .L08055768  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070E94
.L08055758:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055768: .4byte gBg1Tm

	THUMB_FUNC_END func_080556F0

	THUMB_FUNC_START func_0805576C
func_0805576C: @ 0x0805576C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, .L080557A4  @ gUnknown_02019790
	adds r1, r7, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080557AC
	ldr r1, .L080557A8  @ gBg1Tm
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl func_08070EC4
	b .L080557C4
	.align 2, 0
.L080557A4: .4byte gUnknown_02019790
.L080557A8: .4byte gBg1Tm
.L080557AC:
	ldr r1, .L080557D4  @ gBg1Tm
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl func_08070E94
.L080557C4:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080557D4: .4byte gBg1Tm

	THUMB_FUNC_END func_0805576C

	THUMB_FUNC_START SpellFx_RegisterObjGfx
SpellFx_RegisterObjGfx: @ 0x080557D8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, .L080557F8  @ 0x06010800
	ldr r4, .L080557FC  @ gUnknown_0201A790
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080557F8: .4byte 0x06010800
.L080557FC: .4byte gUnknown_0201A790

	THUMB_FUNC_END SpellFx_RegisterObjGfx

	THUMB_FUNC_START SpellFx_RegisterObjPal
SpellFx_RegisterObjPal: @ 0x08055800
	push {lr}
	adds r2, r1, #0
	ldr r1, .L08055818  @ gPal+0x240
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
.L08055818: .4byte gPal+0x240

	THUMB_FUNC_END SpellFx_RegisterObjPal

	THUMB_FUNC_START SpellFx_RegisterBgGfx
SpellFx_RegisterBgGfx: @ 0x0805581C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, .L0805583C  @ 0x06002000
	ldr r4, .L08055840  @ gUnknown_02017790
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805583C: .4byte 0x06002000
.L08055840: .4byte gUnknown_02017790

	THUMB_FUNC_END SpellFx_RegisterBgGfx

	THUMB_FUNC_START SpellFx_RegisterBgPal
SpellFx_RegisterBgPal: @ 0x08055844
	push {lr}
	adds r2, r1, #0
	ldr r1, .L0805585C  @ gPal+0x20
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
.L0805585C: .4byte gPal+0x20

	THUMB_FUNC_END SpellFx_RegisterBgPal

	THUMB_FUNC_START func_08055860
func_08055860: @ 0x08055860
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bcs .L08055886
.L0805586E:
	cmp r2, r5
	bcc .L08055874
	movs r2, #0
.L08055874:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	bcc .L0805586E
.L08055886:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08055860

	THUMB_FUNC_START func_0805588C
func_0805588C: @ 0x0805588C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bcs .L080558B2
.L0805589A:
	cmp r2, r5
	bcc .L080558A0
	movs r2, #0
.L080558A0:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1, #0x20]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	bcc .L0805589A
.L080558B2:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805588C

	THUMB_FUNC_START func_080558BC
func_080558BC: @ 0x080558BC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x10]
	movs r3, #0
	cmp r3, r4
	bcs .L080558E8
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r1, r0
.L080558D0:
	cmp r2, r5
	bcc .L080558D6
	movs r2, #0
.L080558D6:
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	adds r2, #1
	cmp r3, r4
	bcc .L080558D0
.L080558E8:
	bl EnablePalSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080558BC

	THUMB_FUNC_START SpellFx_InterpretBgAnimScript
SpellFx_InterpretBgAnimScript: @ 0x080558F4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	ldrh r0, [r5]
	adds r6, r0, #0
	cmp r6, #0
	bne .L08055970
	ldrh r0, [r3]
	mov ip, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L08055930
	movs r0, #6
	negs r0, r0
	cmp r1, r0
	beq .L08055930
	movs r0, #5
	negs r0, r0
	cmp r1, r0
	beq .L08055930
	movs r0, #4
	negs r0, r0
	cmp r1, r0
	bne .L08055934
.L08055930:
	adds r0, r1, #0
	b .L08055978
.L08055934:
	movs r0, #2
	negs r0, r0
	cmp r1, r0
	bne .L08055942
	strh r6, [r3]
	ldrh r4, [r2]
	b .L08055958
.L08055942:
	movs r0, #3
	negs r0, r0
	cmp r1, r0
	bne .L08055958
	mov r0, ip
	subs r0, #1
	strh r0, [r3]
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
.L08055958:
	ldrh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	subs r1, #1
	strh r1, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	b .L08055978
.L08055970:
	subs r0, #1
	strh r0, [r5]
	movs r0, #7
	negs r0, r0
.L08055978:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END SpellFx_InterpretBgAnimScript

	THUMB_FUNC_START func_08055980
func_08055980: @ 0x08055980
	ldr r1, .L08055988  @ gUnknown_0201775C
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055988: .4byte gUnknown_0201775C

	THUMB_FUNC_END func_08055980

	THUMB_FUNC_START GetSpellAnimationStartFrame
GetSpellAnimationStartFrame: @ 0x0805598C
	push {lr}
	ldr r0, .L0805599C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne .L080559A0
	movs r0, #0x18
	b .L080559AA
	.align 2, 0
.L0805599C: .4byte gBattleAnimSceneLayoutEnum
.L080559A0:
	cmp r0, #1
	beq .L080559A8
	movs r0, #0
	b .L080559AA
.L080559A8:
	movs r0, #0x10
.L080559AA:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSpellAnimationStartFrame

	THUMB_FUNC_START func_080559B0
func_080559B0: @ 0x080559B0
	push {lr}
	sub sp, #4
	ldr r1, .L080559C8  @ gUnknown_0201C8D0
	str r0, [sp]
	ldr r2, .L080559CC  @ 0x050002D6
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L080559C8: .4byte gUnknown_0201C8D0
.L080559CC: .4byte 0x050002D6

	THUMB_FUNC_END func_080559B0

	THUMB_FUNC_START func_080559D0
func_080559D0: @ 0x080559D0
	push {lr}
	sub sp, #4
	ldr r1, .L080559E8  @ gUnknown_0201D428
	str r0, [sp]
	ldr r2, .L080559EC  @ 0x05000948
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L080559E8: .4byte gUnknown_0201D428
.L080559EC: .4byte 0x05000948

	THUMB_FUNC_END func_080559D0

	THUMB_FUNC_START func_080559F0
func_080559F0: @ 0x080559F0
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #0
	bne .L08055A10
	ldr r0, .L08055A0C  @ gUnknown_02000000
	ldr r3, [r0]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #4]
	b .L08055A1A
	.align 2, 0
.L08055A0C: .4byte gUnknown_02000000
.L08055A10:
	ldr r0, .L08055A24  @ gUnknown_02000000
	ldr r3, [r0, #8]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #0xc]
.L08055A1A:
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	pop {r0}
	bx r0
	.align 2, 0
.L08055A24: .4byte gUnknown_02000000

	THUMB_FUNC_END func_080559F0

	THUMB_FUNC_START func_08055A28
func_08055A28: @ 0x08055A28
	ldr r0, .L08055A30  @ gUnknown_0201FAC8
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L08055A30: .4byte gUnknown_0201FAC8

	THUMB_FUNC_END func_08055A28

	THUMB_FUNC_START func_08055A34
func_08055A34: @ 0x08055A34
	ldr r1, .L08055A3C  @ gUnknown_0201FAC8
	str r0, [r1]
	bx lr
	.align 2, 0
.L08055A3C: .4byte gUnknown_0201FAC8

	THUMB_FUNC_END func_08055A34

	THUMB_FUNC_START func_08055A40
func_08055A40: @ 0x08055A40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08055A5C  @ gUnknown_085B9AB4
	movs r1, #1
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r1, .L08055A60  @ gUnknown_080DA4DC
	str r1, [r0, #0x44]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055A5C: .4byte gUnknown_085B9AB4
.L08055A60: .4byte gUnknown_080DA4DC

	THUMB_FUNC_END func_08055A40

	THUMB_FUNC_START func_08055A64
func_08055A64: @ 0x08055A64
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x44]
	mov r8, r0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	add r0, r8
	ldrh r4, [r0, #2]
	ldr r3, .L08055AE8  @ gUnknown_02000000
	ldr r6, [r3]
	ldrh r1, [r6, #2]
	ldrh r2, [r0]
	mov ip, r2
	movs r5, #0
	ldrsh r2, [r0, r5]
	adds r1, r2, r1
	movs r0, #0
	mov r9, r0
	strh r1, [r6, #2]
	ldrh r0, [r6, #4]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, r0
	strh r0, [r6, #4]
	ldr r6, [r3, #4]
	ldrh r0, [r6, #2]
	adds r0, r2, r0
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	adds r0, r1, r0
	strh r0, [r6, #4]
	ldr r6, [r3, #8]
	ldrh r0, [r6, #2]
	adds r0, r2, r0
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	adds r0, r1, r0
	strh r0, [r6, #4]
	ldr r6, [r3, #0xc]
	ldrh r0, [r6, #2]
	adds r2, r2, r0
	strh r2, [r6, #2]
	ldrh r0, [r6, #4]
	adds r1, r1, r0
	strh r1, [r6, #4]
	ldr r1, .L08055AEC  @ gDispIo
	ldrh r0, [r1, #0x26]
	mov r2, ip
	subs r0, r0, r2
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #0x24]
	subs r0, r0, r4
	strh r0, [r1, #0x24]
	bl func_08055A28
	cmp r0, #0
	bne .L08055AF0
	adds r0, r7, #0
	bl Proc_Break
	b .L08055B28
	.align 2, 0
.L08055AE8: .4byte gUnknown_02000000
.L08055AEC: .4byte gDispIo
.L08055AF0:
	bl func_08055A28
	cmp r0, #2
	bne .L08055B0C
	ldr r0, .L08055B08  @ gUnknown_080DA570
	str r0, [r7, #0x44]
	mov r5, r9
	strh r5, [r7, #0x2c]
	movs r0, #3
	bl func_08055A34
	b .L08055B28
	.align 2, 0
.L08055B08: .4byte gUnknown_080DA570
.L08055B0C:
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	add r0, r8
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, .L08055B34  @ 0x00007FFF
	cmp r1, r0
	bne .L08055B28
	mov r5, r9
	strh r5, [r7, #0x2c]
.L08055B28:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08055B34: .4byte 0x00007FFF

	THUMB_FUNC_END func_08055A64

	THUMB_FUNC_START func_08055B38
func_08055B38: @ 0x08055B38
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r2, .L08055B88  @ gUnknown_02000028
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r6, .L08055B8C  @ gUnknown_0201FB0C
	ldr r0, [r6]
	subs r1, r1, r0
	ldr r3, .L08055B90  @ gUnknown_0200002C
	movs r5, #2
	ldrsh r4, [r2, r5]
	subs r4, r4, r0
	movs r0, #2
	ldrsh r5, [r3, r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0
	bl func_080559F0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl func_080559F0
	ldr r0, .L08055B94  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08055B98
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b .L08055BA6
	.align 2, 0
.L08055B88: .4byte gUnknown_02000028
.L08055B8C: .4byte gUnknown_0201FB0C
.L08055B90: .4byte gUnknown_0200002C
.L08055B94: .4byte gBattleAnimSceneLayoutEnum
.L08055B98:
	cmp r0, #0
	blt .L08055BA6
	cmp r0, #2
	bgt .L08055BA6
	ldr r0, [r6]
	bl func_08053618
.L08055BA6:
	adds r0, r7, #0
	bl Proc_Break
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08055B38

	THUMB_FUNC_START func_08055BB4
func_08055BB4: @ 0x08055BB4
	push {lr}
	bl PrepareBattleGraphics
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08055BB4

	THUMB_FUNC_START func_08055BC4
func_08055BC4: @ 0x08055BC4
	push {lr}
	bl PrepareBattleGraphics
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08055BC4

	THUMB_FUNC_START BeginAnimsOnBattleAnimations
BeginAnimsOnBattleAnimations: @ 0x08055BD4
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne .L08055BE4
	bl BeginAnimsOnBattle_Arena
	b .L08055C24
.L08055BE4:
	bl IsBattleAnimPromotion
	cmp r0, #1
	bne .L08055BF2
	bl BeginAnimsOnBattle_Hensei
	b .L08055C24
.L08055BF2:
	bl StartEkrBattleDeamon
	bl BsoInit
	bl func_08052184
	ldr r1, .L08055C28  @ gUnknown_02017744
	str r0, [r1]
	bl StartEkrBattleStarting
	ldr r0, .L08055C2C  @ gUnknown_02000000
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, .L08055C30  @ gUnknown_02000010
	str r1, [r0]
	str r1, [r0, #4]
	ldr r0, .L08055C34  @ MainUpdate_8055C68
	bl SetMainFunc
	movs r0, #0
	bl SetOnHBlankA
.L08055C24:
	pop {r0}
	bx r0
	.align 2, 0
.L08055C28: .4byte gUnknown_02017744
.L08055C2C: .4byte gUnknown_02000000
.L08055C30: .4byte gUnknown_02000010
.L08055C34: .4byte MainUpdate_8055C68

	THUMB_FUNC_END BeginAnimsOnBattleAnimations

	THUMB_FUNC_START func_08055C38
func_08055C38: @ 0x08055C38
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne .L08055C48
	bl func_0805B0CC
	b .L08055C60
.L08055C48:
	bl IsBattleAnimPromotion
	cmp r0, #1
	bne .L08055C56
	bl func_08076354
	b .L08055C60
.L08055C56:
	bl func_080560D8
	ldr r0, .L08055C64  @ MainUpdate_8055C68
	bl SetMainFunc
.L08055C60:
	pop {r0}
	bx r0
	.align 2, 0
.L08055C64: .4byte MainUpdate_8055C68

	THUMB_FUNC_END func_08055C38

	THUMB_FUNC_START MainUpdate_8055C68
MainUpdate_8055C68: @ 0x08055C68
	push {r4, lr}
	ldr r0, .L08055CCC  @ gKeySt
	ldr r0, [r0]
	bl RefreshKeySt
	bl ClearSprites
	ldr r4, .L08055CD0  @ gProcTreeRootArray
	ldr r0, [r4, #4]
	bl Proc_Run
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08055C8E
	ldr r0, [r4, #8]
	bl Proc_Run
.L08055C8E:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PutSpriteLayerOam
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl BsoUpdateAll
	bl BattleAIS_ExecCommands
	movs r0, #0xd
	bl PutSpriteLayerOam
	ldr r1, .L08055CD4  @ gBmSt
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L08055CD8  @ 0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08055CCC: .4byte gKeySt
.L08055CD0: .4byte gProcTreeRootArray
.L08055CD4: .4byte gBmSt
.L08055CD8: .4byte 0x04000006

	THUMB_FUNC_END MainUpdate_8055C68

	THUMB_FUNC_START StartEkrBattleStarting
StartEkrBattleStarting: @ 0x08055CDC
	push {lr}
	ldr r0, .L08055CEC  @ gUnknown_085B9AD4
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08055CEC: .4byte gUnknown_085B9AD4

	THUMB_FUNC_END StartEkrBattleStarting

	THUMB_FUNC_START ekrBattleStarting_8055CF0
ekrBattleStarting_8055CF0: @ 0x08055CF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	strh r5, [r4, #0x2c]
	movs r0, #0xf
	strh r0, [r4, #0x2e]
	ldr r2, .L08055DE4  @ gUnknown_0203E122
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r7, #2
	ldrsh r0, [r2, r7]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	str r5, [sp, #4]
	ldr r1, .L08055DE8  @ gBg2Tm
	ldr r2, .L08055DEC  @ 0x01000200
	add r0, sp, #4
	bl CpuFastSet
	movs r0, #4
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #4
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	ldr r7, .L08055DF0  @ gDispIo
	mov r8, r7
	mov r1, r8
	ldrb r0, [r1, #1]
	movs r2, #0x20
	mov sl, r2
	mov r3, sl
	orrs r0, r3
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	mov r0, r8
	adds r0, #0x2d
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	mov r1, r8
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x34
	add r0, r8
	mov r9, r0
	ldrb r1, [r0]
	movs r6, #1
	orrs r1, r6
	movs r5, #2
	orrs r1, r5
	movs r3, #4
	orrs r1, r3
	movs r2, #8
	orrs r1, r2
	movs r0, #0x10
	orrs r1, r0
	movs r7, #0x36
	add r8, r7
	mov r7, r8
	ldrb r0, [r7]
	orrs r0, r6
	orrs r0, r5
	orrs r0, r3
	orrs r0, r2
	movs r2, #0x11
	negs r2, r2
	ands r0, r2
	subs r2, #0x10
	ands r1, r2
	mov r2, r9
	strb r1, [r2]
	mov r3, sl
	orrs r0, r3
	strb r0, [r7]
	adds r0, r4, #0
	bl Proc_Break
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08055DE4: .4byte gUnknown_0203E122
.L08055DE8: .4byte gBg2Tm
.L08055DEC: .4byte 0x01000200
.L08055DF0: .4byte gDispIo

	THUMB_FUNC_END ekrBattleStarting_8055CF0

	THUMB_FUNC_START ekrBattleStarting_8055DF4
ekrBattleStarting_8055DF4: @ 0x08055DF4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r2, [r7, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	movs r3, #0x2e
	ldrsh r0, [r7, r3]
	cmp r1, r0
	beq .L08055E12
	adds r0, r2, #1
	strh r0, [r7, #0x2c]
.L08055E12:
	movs r0, #0x32
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r6, r0, #0
	movs r3, #0x3a
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r3, #0x34
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r3, #0x3c
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	bl Interpolate
	ldr r2, .L08055EF8  @ gDispIo
	movs r3, #0x2d
	adds r3, r3, r2
	mov r8, r3
	movs r1, #0
	mov r9, r1
	strb r6, [r3]
	adds r6, r2, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r2, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r2, #0
	adds r4, #0x30
	strb r0, [r4]
	movs r3, #0x2c
	ldrsh r1, [r7, r3]
	movs r3, #0x2e
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bne .L08055EEA
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
	strb r0, [r2]
	movs r0, #0
	bl InitOam
	bl LockBmDisplay
	mov r1, r9
	mov r0, r8
	strb r1, [r0]
	strb r1, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	ldr r0, .L08055EFC  @ gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #4
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	bl MU_EndAll
	adds r0, r7, #0
	bl Proc_Break
.L08055EEA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08055EF8: .4byte gDispIo
.L08055EFC: .4byte gPal

	THUMB_FUNC_END ekrBattleStarting_8055DF4

	THUMB_FUNC_START ekrBattleStarting_8055F00
ekrBattleStarting_8055F00: @ 0x08055F00
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08055F2C  @ gUnknown_0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08055F64
	bl StartEkrGauge
	bl StartEkrDispUP
	ldr r0, .L08055F30  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq .L08055F34
	cmp r0, #3
	ble .L08055F64
	cmp r0, #4
	beq .L08055F5C
	b .L08055F64
	.align 2, 0
.L08055F2C: .4byte gUnknown_0203E0FC
.L08055F30: .4byte gBattleAnimSceneLayoutEnum
.L08055F34:
	ldr r4, .L08055F58  @ gBattleAnimUnitEnabledLookup
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne .L08055F46
	bl EkrGauge_80511A0
	bl func_08051B28
.L08055F46:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne .L08055F64
	bl EkrGauge_80511B0
	bl func_08051B38
	b .L08055F64
	.align 2, 0
.L08055F58: .4byte gBattleAnimUnitEnabledLookup
.L08055F5C:
	bl EkrGauge_80511A0
	bl func_08051B28
.L08055F64:
	bl func_08051CC4
	movs r0, #0
	bl func_08056900
	movs r0, #0
	bl func_0805649C
	movs r0, #0
	movs r1, #0xb
	bl StartEkrWindowAppear
	movs r0, #0
	movs r1, #0xb
	movs r2, #0
	bl StartEkrNamewinAppear
	movs r0, #0
	movs r1, #0xb
	bl func_08056F20
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleStarting_8055F00

	THUMB_FUNC_START ekrBattleStarting_8055FA0
ekrBattleStarting_8055FA0: @ 0x08055FA0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble .L08055FE0
	ldr r0, .L08055FD0  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08055FC4
	bl func_0806FAB0
	cmp r0, #0
	beq .L08055FD4
.L08055FC4:
	bl StartEkrBattle
	adds r0, r4, #0
	bl Proc_End
	b .L08055FE0
	.align 2, 0
.L08055FD0: .4byte gUnknown_0203E0FE
.L08055FD4:
	strh r0, [r4, #0x2c]
	bl StartEkrBattle
	adds r0, r4, #0
	bl Proc_Break
.L08055FE0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleStarting_8055FA0

	THUMB_FUNC_START ekrBattleStarting_8055FE8
ekrBattleStarting_8055FE8: @ 0x08055FE8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl func_0807168C
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L0805601C
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
.L0805601C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleStarting_8055FE8

	THUMB_FUNC_START ekrBattleStarting_8056024
ekrBattleStarting_8056024: @ 0x08056024
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08056038  @ gUnknown_0203E102
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08056040
	ldr r1, .L0805603C  @ gUnknown_0201FAD8
	movs r0, #6
	b .L08056044
	.align 2, 0
.L08056038: .4byte gUnknown_0203E102
.L0805603C: .4byte gUnknown_0201FAD8
.L08056040:
	ldr r1, .L0805606C  @ gUnknown_0201FAD8
	movs r0, #0xa
.L08056044:
	str r0, [r1]
	ldr r0, .L08056070  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl func_08075AD8
	ldr r0, .L08056074  @ gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl ApplyColorDarken_Unsure
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805606C: .4byte gUnknown_0201FAD8
.L08056070: .4byte gUnknown_0203E0FE
.L08056074: .4byte gPal

	THUMB_FUNC_END ekrBattleStarting_8056024

	THUMB_FUNC_START ekrBattleStarting_8056078
ekrBattleStarting_8056078: @ 0x08056078
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, .L080560D0  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl func_08075AB4
	ldr r0, .L080560D4  @ gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L080560C6
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L080560C6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080560D0: .4byte gUnknown_0203E0FE
.L080560D4: .4byte gPal

	THUMB_FUNC_END ekrBattleStarting_8056078

	THUMB_FUNC_START func_080560D8
func_080560D8: @ 0x080560D8
	push {lr}
	ldr r0, .L080560EC  @ gUnknown_085B9B1C
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
.L080560EC: .4byte gUnknown_085B9B1C

	THUMB_FUNC_END func_080560D8

	THUMB_FUNC_START ekrBattleEnding_80560F0
ekrBattleEnding_80560F0: @ 0x080560F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, .L08056114  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805610C
	bl func_0806FAB0
	cmp r0, #1
	bcc .L08056118
	cmp r0, #2
	bhi .L08056118
.L0805610C:
	adds r0, r5, #0
	bl Proc_Break
	b .L08056160
	.align 2, 0
.L08056114: .4byte gUnknown_0203E0FE
.L08056118:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r0, .L08056168  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl func_08075AB4
	ldr r0, .L0805616C  @ gPal
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L08056160
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L08056160:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056168: .4byte gUnknown_0203E0FE
.L0805616C: .4byte gPal

	THUMB_FUNC_END ekrBattleEnding_80560F0

	THUMB_FUNC_START ekrBattleEnding_8056170
ekrBattleEnding_8056170: @ 0x08056170
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08056194  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805618A
	bl func_0806FAB0
	cmp r0, #1
	bcc .L08056198
	cmp r0, #2
	bhi .L08056198
.L0805618A:
	adds r0, r4, #0
	bl Proc_Break
	b .L080561BE
	.align 2, 0
.L08056194: .4byte gUnknown_0203E0FE
.L08056198:
	ldr r0, .L080561C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl ApplyChapterMapGraphics
	movs r0, #0x10
	bl func_0807168C
	bl RenderMap
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	bl Proc_Break
.L080561BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080561C4: .4byte gPlaySt

	THUMB_FUNC_END ekrBattleEnding_8056170

	THUMB_FUNC_START ekrBattleEnding_80561C8
ekrBattleEnding_80561C8: @ 0x080561C8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, .L080561EC  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080561E4
	bl func_0806FAB0
	cmp r0, #1
	bcc .L080561F0
	cmp r0, #2
	bhi .L080561F0
.L080561E4:
	adds r0, r4, #0
	bl Proc_Break
	b .L0805621E
	.align 2, 0
.L080561EC: .4byte gUnknown_0203E0FE
.L080561F0:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl func_0807168C
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne .L0805621E
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
.L0805621E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleEnding_80561C8

	THUMB_FUNC_START ekrBattleEnding_8056228
ekrBattleEnding_8056228: @ 0x08056228
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, .L08056284  @ gUnknown_0203E122
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	bl BsoInit
	movs r0, #1
	bl func_08056900
	movs r0, #1
	bl func_0805649C
	movs r0, #1
	movs r1, #0xb
	bl StartEkrWindowAppear
	movs r0, #1
	movs r1, #0xb
	bl func_08056F20
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056284: .4byte gUnknown_0203E122

	THUMB_FUNC_END ekrBattleEnding_8056228

	THUMB_FUNC_START ekrBattleEnding_8056288
ekrBattleEnding_8056288: @ 0x08056288
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble .L08056304
	bl EndEkrGauge
	adds r0, r4, #0
	bl Proc_Break
	bl ResetHLayers
	ldr r0, .L0805630C  @ gDispIo
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
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	subs r0, #5
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r6, #1
	orrs r0, r6
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
.L08056304:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805630C: .4byte gDispIo

	THUMB_FUNC_END ekrBattleEnding_8056288

	THUMB_FUNC_START ekrBattleEnding_8056310
ekrBattleEnding_8056310: @ 0x08056310
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	strh r4, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	bl ResetUnitSprites
	bl BMapDispResume_FromBattleDelayed
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	bl ApplyUnitSpritePalettes
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #4
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	ldr r2, .L0805638C  @ gDispIo
	adds r3, r2, #0
	adds r3, #0x34
	ldrb r1, [r3]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	beq .L08056372
	bl ApplyChapterMapPalettes
.L08056372:
	bl GetBattleAnimLinkArenaFlag
	cmp r0, #1
	bne .L0805637E
	bl func_08049788
.L0805637E:
	adds r0, r5, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805638C: .4byte gDispIo

	THUMB_FUNC_END ekrBattleEnding_8056310

	THUMB_FUNC_START ekrBattleEnding_8056390
ekrBattleEnding_8056390: @ 0x08056390
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldrh r2, [r7, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	movs r3, #0x2e
	ldrsh r0, [r7, r3]
	cmp r1, r0
	beq .L080563AE
	adds r0, r2, #1
	strh r0, [r7, #0x2c]
.L080563AE:
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	movs r3, #0x3a
	ldrsh r1, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	movs r3, #0x34
	ldrsh r1, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r3, #0x3c
	ldrsh r1, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xa0
	bl Interpolate
	ldr r1, .L08056478  @ gDispIo
	movs r3, #0x2d
	adds r3, r3, r1
	mov r9, r3
	movs r2, #0
	mov r8, r2
	strb r6, [r3]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	str r2, [sp, #4]
	ldr r1, .L0805647C  @ gBg2Tm
	ldr r2, .L08056480  @ 0x01000200
	add r0, sp, #4
	bl CpuFastSet
	movs r0, #4
	bl EnableBgSync
	movs r3, #0x2c
	ldrsh r1, [r7, r3]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	cmp r1, r0
	bne .L08056468
	movs r0, #0
	mov r3, r8
	strh r3, [r7, #0x2c]
	mov r1, r9
	strb r0, [r1]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	bl EnablePalSync
	adds r0, r7, #0
	bl Proc_Break
.L08056468:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08056478: .4byte gDispIo
.L0805647C: .4byte gBg2Tm
.L08056480: .4byte 0x01000200

	THUMB_FUNC_END ekrBattleEnding_8056390

	THUMB_FUNC_START ekrBattleEnding_8056484
ekrBattleEnding_8056484: @ 0x08056484
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl RefreshBMapDisplay_FromBattle
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleEnding_8056484

	THUMB_FUNC_START func_0805649C
func_0805649C: @ 0x0805649C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0
	movs r1, #0xa
	movs r2, #6
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
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r1, .L080564F8  @ gDispIo
	adds r1, #0x3d
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, .L080564FC  @ gUnknown_0203E122
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r4, #4
	ldrsh r2, [r0, r4]
	cmp r3, r2
	bne .L08056500
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r3, #6
	ldrsh r0, [r0, r3]
	movs r4, #2
	cmp r1, r0
	blt .L0805652C
	movs r4, #6
	b .L0805652C
	.align 2, 0
.L080564F8: .4byte gDispIo
.L080564FC: .4byte gUnknown_0203E122
.L08056500:
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r4, #6
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne .L08056516
	movs r4, #4
	cmp r3, r2
	bge .L0805652C
	movs r4, #0
	b .L0805652C
.L08056516:
	cmp r3, r2
	bge .L08056524
	movs r4, #1
	cmp r1, r0
	blt .L0805652C
	movs r4, #7
	b .L0805652C
.L08056524:
	movs r4, #3
	cmp r1, r0
	blt .L0805652C
	movs r4, #5
.L0805652C:
	ldr r0, .L08056540  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt .L08056544
	cmp r0, #1
	bge .L08056550
	cmp r0, #0
	beq .L08056548
	b .L08056550
	.align 2, 0
.L08056540: .4byte gBattleAnimSceneLayoutEnum
.L08056544:
	cmp r0, #4
	bne .L08056550
.L08056548:
	ldr r0, .L0805654C  @ gUnknown_085B9B84
	b .L08056552
	.align 2, 0
.L0805654C: .4byte gUnknown_085B9B84
.L08056550:
	ldr r0, .L08056584  @ gUnknown_085B9BA4
.L08056552:
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r1, .L08056588  @ 0x06010000
	bl LZ77UnCompVram
	ldr r0, .L0805658C  @ gUnknown_080DC85C
	ldr r1, .L08056590  @ gPal+0x280
	movs r2, #1
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, .L08056594  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bls .L0805657A
	b .L08056856
.L0805657A:
	lsls r0, r0, #2
	ldr r1, .L08056598  @ .L0805659C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08056584: .4byte gUnknown_085B9BA4
.L08056588: .4byte 0x06010000
.L0805658C: .4byte gUnknown_080DC85C
.L08056590: .4byte gPal+0x280
.L08056594: .4byte gBattleAnimSceneLayoutEnum
.L08056598: .4byte .L0805659C
.L0805659C: @ jump table
	.4byte .L080565B0 @ case 0
	.4byte .L08056650 @ case 1
	.4byte .L08056650 @ case 2
	.4byte .L080567BC @ case 3
	.4byte .L080565B0 @ case 4
.L080565B0:
	ldr r0, .L08056600  @ gUnknown_085B9B6C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r2, .L08056604  @ gUnknown_0203E122
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #4
	ldrsh r1, [r2, r4]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L0805660C
	ldr r0, .L08056608  @ gUnknown_085B9BC4
	b .L0805660E
	.align 2, 0
.L08056600: .4byte gUnknown_085B9B6C
.L08056604: .4byte gUnknown_0203E122
.L08056608: .4byte gUnknown_085B9BC4
.L0805660C:
	ldr r0, .L0805663C  @ gUnknown_085B9C24
.L0805660E:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl BsoCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L08056640
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b .L08056646
	.align 2, 0
.L0805663C: .4byte gUnknown_085B9C24
.L08056640:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
.L08056646:
	strh r0, [r2, #4]
	ldr r0, .L0805664C  @ gUnknown_085B9C84
	b .L0805684A
	.align 2, 0
.L0805664C: .4byte gUnknown_085B9C84
.L08056650:
	ldr r0, .L080566AC  @ gUnknown_085B9B6C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, .L080566B0  @ gUnknown_0203E122
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r2, #0x48
	strh r2, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, .L080566B4  @ gUnknown_02017744
	ldr r0, [r0]
	cmp r0, #1
	bne .L080566A2
	ldr r1, .L080566B8  @ gUnknown_080DAF28
	ldr r0, .L080566BC  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r5, #0x34]
.L080566A2:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L080566C4
	ldr r0, .L080566C0  @ gUnknown_085B9BE4
	b .L080566C6
	.align 2, 0
.L080566AC: .4byte gUnknown_085B9B6C
.L080566B0: .4byte gUnknown_0203E122
.L080566B4: .4byte gUnknown_02017744
.L080566B8: .4byte gUnknown_080DAF28
.L080566BC: .4byte gBattleAnimSceneLayoutEnum
.L080566C0: .4byte gUnknown_085B9BE4
.L080566C4:
	ldr r0, .L080566F4  @ gUnknown_085B9C44
.L080566C6:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl BsoCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L080566F8
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b .L080566FE
	.align 2, 0
.L080566F4: .4byte gUnknown_085B9C44
.L080566F8:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
.L080566FE:
	strh r0, [r2, #4]
	ldr r0, .L0805676C  @ gUnknown_085B9CA4
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r4, #0
	strh r4, [r5, #0x3e]
	strh r4, [r5, #0x36]
	ldr r0, .L08056770  @ gUnknown_085B9B6C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	strh r4, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, .L08056774  @ gUnknown_0203E122
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0xa8
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, .L08056778  @ gUnknown_02017744
	ldr r0, [r0]
	cmp r0, #0
	bne .L08056760
	ldr r1, .L0805677C  @ gUnknown_080DAF28
	ldr r0, .L08056780  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0xa8
	strh r0, [r5, #0x34]
.L08056760:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L08056788
	ldr r0, .L08056784  @ gUnknown_085B9C04
	b .L0805678A
	.align 2, 0
.L0805676C: .4byte gUnknown_085B9CA4
.L08056770: .4byte gUnknown_085B9B6C
.L08056774: .4byte gUnknown_0203E122
.L08056778: .4byte gUnknown_02017744
.L0805677C: .4byte gUnknown_080DAF28
.L08056780: .4byte gBattleAnimSceneLayoutEnum
.L08056784: .4byte gUnknown_085B9C04
.L08056788:
	ldr r0, .L080567B8  @ gUnknown_085B9C64
.L0805678A:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl BsoCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L08056840
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b .L08056846
	.align 2, 0
.L080567B8: .4byte gUnknown_085B9C64
.L080567BC:
	ldr r0, .L08056800  @ gUnknown_085B9B6C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, .L08056804  @ gUnknown_0203E122
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L0805680C
	ldr r0, .L08056808  @ gUnknown_085B9C04
	b .L0805680E
	.align 2, 0
.L08056800: .4byte gUnknown_085B9B6C
.L08056804: .4byte gUnknown_0203E122
.L08056808: .4byte gUnknown_085B9C04
.L0805680C:
	ldr r0, .L0805683C  @ gUnknown_085B9C64
.L0805680E:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl BsoCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne .L08056840
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b .L08056846
	.align 2, 0
.L0805683C: .4byte gUnknown_085B9C64
.L08056840:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
.L08056846:
	strh r0, [r2, #4]
	ldr r0, .L08056860  @ gUnknown_085B9CC4
.L0805684A:
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x3e]
	strh r0, [r5, #0x36]
.L08056856:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08056860: .4byte gUnknown_085B9CC4

	THUMB_FUNC_END func_0805649C

	THUMB_FUNC_START func_08056864
func_08056864: @ 0x08056864
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt .L08056886
	adds r0, r5, #0
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
	b .L080568F6
.L08056886:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L080568B0
	movs r3, #0x32
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	b .L080568D2
.L080568B0:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r3, #0x3a
	ldrsh r2, [r4, r3]
.L080568D2:
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bgt .L080568F6
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
.L080568F6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08056864

	THUMB_FUNC_START func_08056900
func_08056900: @ 0x08056900
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L0805692C  @ gUnknown_085B9CE4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x44]
	movs r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #0x4c]
	ldr r0, .L08056930  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt .L0805696E
	cmp r0, #3
	ble .L08056934
	cmp r0, #4
	beq .L0805695C
	b .L0805696E
	.align 2, 0
.L0805692C: .4byte gUnknown_085B9CE4
.L08056930: .4byte gBattleAnimSceneLayoutEnum
.L08056934:
	ldr r0, .L08056958  @ gBattleAnimUnitEnabledLookup
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	bne .L08056948
	bl func_0806FAB0
	cmp r0, #0
	bne .L08056948
	str r5, [r4, #0x4c]
.L08056948:
	ldr r0, .L08056958  @ gBattleAnimUnitEnabledLookup
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne .L0805696E
	str r0, [r4, #0x50]
	b .L0805696E
	.align 2, 0
.L08056958: .4byte gBattleAnimUnitEnabledLookup
.L0805695C:
	cmp r5, #0
	bne .L08056968
	str r1, [r4, #0x4c]
	movs r0, #1
	str r0, [r4, #0x50]
	b .L0805696E
.L08056968:
	movs r0, #1
	str r0, [r4, #0x4c]
	str r1, [r4, #0x50]
.L0805696E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08056900

	THUMB_FUNC_START func_08056974
func_08056974: @ 0x08056974
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, .L08056AE4  @ gUnknown_080DAF18
	ldr r0, .L08056AE8  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r1, .L08056AEC  @ gUnknown_080DAEF0
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r6, [r0]
	bl func_080599E8
	ldr r0, .L08056AF0  @ gUnknown_02017724
	ldr r0, [r0]
	cmp r0, #0
	beq .L080569B2
	ldr r5, .L08056AF4  @ gUnknown_02000000
	ldr r0, [r5, #8]
	cmp r0, #0
	beq .L080569A4
	bl func_08054B18
.L080569A4:
	ldr r0, [r5]
	cmp r0, #0
	beq .L080569AE
	bl func_08054B18
.L080569AE:
	bl DeleteEach6C_efxStatusUnit
.L080569B2:
	ldr r0, .L08056AF8  @ gpUnitRight_BattleStruct
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq .L080569C6
	cmp r1, #0xd
	bne .L080569D0
.L080569C6:
	ldr r0, .L08056AFC  @ gPal
	movs r1, #0x19
	movs r2, #1
	bl func_08071468
.L080569D0:
	ldr r0, .L08056B00  @ gpUnitLeft_BattleStruct
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq .L080569E4
	cmp r1, #0xd
	bne .L080569EE
.L080569E4:
	ldr r0, .L08056AFC  @ gPal
	movs r1, #0x17
	movs r2, #1
	bl func_08071468
.L080569EE:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08056A0A
	ldr r0, .L08056B04  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08056A0A
	ldr r0, .L08056AFC  @ gPal
	movs r1, #0x17
	movs r2, #1
	bl func_08071468
.L08056A0A:
	ldr r5, .L08056B08  @ gBattleAnimUnitEnabledLookup
	movs r3, #0
	ldrsh r0, [r5, r3]
	cmp r0, #1
	bne .L08056A32
	ldr r0, .L08056B0C  @ gUnknown_0200005C
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, .L08056B10  @ gUnknown_0200F1C8
	adds r2, r2, r0
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, .L08056B14  @ gUnknown_020041C8
	adds r1, r1, r2
	str r1, [r4, #0x54]
	ldr r1, .L08056B18  @ gUnknown_02000088
	bl LZ77UnCompWram
.L08056A32:
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne .L08056A58
	ldr r0, .L08056B1C  @ gUnknown_02000060
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, .L08056B20  @ gUnknown_02011BC8
	adds r2, r2, r0
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, .L08056B24  @ gUnknown_020099C8
	adds r1, r1, r2
	str r1, [r4, #0x58]
	ldr r1, .L08056B28  @ gUnknown_02002088
	bl LZ77UnCompWram
.L08056A58:
	ldr r5, .L08056B2C  @ gBattleAnimBoolLockSheetGraphicsMaybe
	ldr r0, [r5]
	cmp r0, #0
	beq .L08056A66
	ldr r1, .L08056B30  @ gUnknown_02001088
	bl LZ77UnCompWram
.L08056A66:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq .L08056A72
	ldr r1, .L08056B34  @ gUnknown_02003088
	bl LZ77UnCompWram
.L08056A72:
	ldr r1, .L08056B38  @ 0x06014000
	ldr r0, .L08056B18  @ gUnknown_02000088
	movs r2, #0x80
	lsls r2, r2, #7
	bl RegisterDataMove
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xb
	strh r0, [r4, #0x2e]
	ldr r1, .L08056B3C  @ gUnknown_0203E122
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x32]
	movs r3, #2
	ldrsh r0, [r1, r3]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3a]
	movs r5, #4
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x34]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3c]
	ldr r1, .L08056B40  @ gUnknown_080DAF1D
	ldr r2, .L08056AE8  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r5, [r0]
	strh r5, [r4, #0x36]
	ldr r1, .L08056B44  @ gUnknown_080DAF22
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r3, [r0]
	strh r3, [r4, #0x38]
	ldr r0, .L08056B48  @ gUnknown_02017744
	ldr r0, [r0]
	cmp r0, #0
	bne .L08056B50
	ldr r0, .L08056B4C  @ gUnknown_080DAF28
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r3, r0
	strh r0, [r4, #0x38]
	b .L08056B60
	.align 2, 0
.L08056AE4: .4byte gUnknown_080DAF18
.L08056AE8: .4byte gBattleAnimSceneLayoutEnum
.L08056AEC: .4byte gUnknown_080DAEF0
.L08056AF0: .4byte gUnknown_02017724
.L08056AF4: .4byte gUnknown_02000000
.L08056AF8: .4byte gpUnitRight_BattleStruct
.L08056AFC: .4byte gPal
.L08056B00: .4byte gpUnitLeft_BattleStruct
.L08056B04: .4byte gBattleStats
.L08056B08: .4byte gBattleAnimUnitEnabledLookup
.L08056B0C: .4byte gUnknown_0200005C
.L08056B10: .4byte gUnknown_0200F1C8
.L08056B14: .4byte gUnknown_020041C8
.L08056B18: .4byte gUnknown_02000088
.L08056B1C: .4byte gUnknown_02000060
.L08056B20: .4byte gUnknown_02011BC8
.L08056B24: .4byte gUnknown_020099C8
.L08056B28: .4byte gUnknown_02002088
.L08056B2C: .4byte gBattleAnimBoolLockSheetGraphicsMaybe
.L08056B30: .4byte gUnknown_02001088
.L08056B34: .4byte gUnknown_02003088
.L08056B38: .4byte 0x06014000
.L08056B3C: .4byte gUnknown_0203E122
.L08056B40: .4byte gUnknown_080DAF1D
.L08056B44: .4byte gUnknown_080DAF22
.L08056B48: .4byte gUnknown_02017744
.L08056B4C: .4byte gUnknown_080DAF28
.L08056B50:
	ldr r0, .L08056B6C  @ gUnknown_080DAF28
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x36]
.L08056B60:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08056B6C: .4byte gUnknown_080DAF28

	THUMB_FUNC_END func_08056974

	THUMB_FUNC_START func_08056B70
func_08056B70: @ 0x08056B70
	push {r4, r5, r6, r7, lr}
	ldr r4, .L08056B90  @ 0xFFFFFCB4
	add sp, r4
	adds r4, r0, #0
	add r5, sp, #0x304
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08056B94
	adds r0, r4, #0
	bl Proc_Break
	b .L08056D0A
	.align 2, 0
.L08056B90: .4byte 0xFFFFFCB4
.L08056B94:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08056BAC
	movs r1, #0x94
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	b .L08056BB8
.L08056BAC:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x94
	lsls r2, r2, #2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
.L08056BB8:
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne .L08056C6A
	ldr r0, [r4, #0x54]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl func_0807180C
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08056C16
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b .L08056C44
.L08056C16:
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r6, #0x32
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
.L08056C44:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0xe4
	lsls r1, r1, #7
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl BsoPutOam
.L08056C6A:
	ldr r1, [r4, #0x50]
	cmp r1, #1
	bne .L08056D0A
	ldr r0, [r4, #0x58]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl func_0807180C
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08056CB6
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	movs r6, #0x38
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b .L08056CE4
.L08056CB6:
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
.L08056CE4:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0x93
	lsls r1, r1, #8
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl BsoPutOam
.L08056D0A:
	movs r3, #0xd3
	lsls r3, r3, #2
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08056B70

	THUMB_FUNC_START func_08056D18
func_08056D18: @ 0x08056D18
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08056D18

	THUMB_FUNC_START StartEkrWindowAppear
StartEkrWindowAppear: @ 0x08056D24
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L08056D68  @ gUnknown_085B9D0C
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r1, #0x39
	strh r1, [r0, #0x30]
	movs r2, #0
	cmp r5, #0
	bne .L08056D46
	movs r2, #0x39
.L08056D46:
	ldr r1, .L08056D6C  @ gUnknown_02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511D0
	ldr r1, .L08056D70  @ gUnknown_0201FACC
	movs r0, #1
	str r0, [r1]
	bl EkrGauge_8051208
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056D68: .4byte gUnknown_085B9D0C
.L08056D6C: .4byte gUnknown_02000038
.L08056D70: .4byte gUnknown_0201FACC

	THUMB_FUNC_END StartEkrWindowAppear

	THUMB_FUNC_START func_08056D74
func_08056D74: @ 0x08056D74
	push {lr}
	ldr r0, .L08056D84  @ gUnknown_0201FACC
	ldr r0, [r0]
	cmp r0, #0
	beq .L08056D88
	movs r0, #0
	b .L08056D8A
	.align 2, 0
.L08056D84: .4byte gUnknown_0201FACC
.L08056D88:
	movs r0, #1
.L08056D8A:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08056D74

	THUMB_FUNC_START EkrWindowAppear_Loop
EkrWindowAppear_Loop: @ 0x08056D90
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08056DBC
	ldr r1, .L08056DB8  @ gUnknown_0201FACC
	movs r0, #0
	str r0, [r1]
	bl EkrGauge_80511F8
	adds r0, r4, #0
	bl Proc_Break
	b .L08056E04
	.align 2, 0
.L08056DB8: .4byte gUnknown_0201FACC
.L08056DBC:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08056DDA
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	b .L08056DEC
.L08056DDA:
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
.L08056DEC:
	bl Interpolate
	adds r2, r0, #0
	ldr r1, .L08056E0C  @ gUnknown_02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511D0
.L08056E04:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08056E0C: .4byte gUnknown_02000038

	THUMB_FUNC_END EkrWindowAppear_Loop

	THUMB_FUNC_START StartEkrNamewinAppear
StartEkrNamewinAppear: @ 0x08056E10
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08056E40  @ gUnknown_085B9D24
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	subs r1, #0x31
	str r1, [r0, #0x48]
	cmp r4, #0
	bne .L08056E44
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_8051B48
	b .L08056E4C
	.align 2, 0
.L08056E40: .4byte gUnknown_085B9D24
.L08056E44:
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_8051B48
.L08056E4C:
	ldr r1, .L08056E5C  @ gUnknown_0201FAD0
	movs r0, #1
	str r0, [r1]
	bl func_08051B80
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08056E5C: .4byte gUnknown_0201FAD0

	THUMB_FUNC_END StartEkrNamewinAppear

	THUMB_FUNC_START HasEkrNamewinAppearEnded
HasEkrNamewinAppearEnded: @ 0x08056E60
	push {lr}
	ldr r0, .L08056E70  @ gUnknown_0201FAD0
	ldr r0, [r0]
	cmp r0, #0
	beq .L08056E74
	movs r0, #0
	b .L08056E76
	.align 2, 0
.L08056E70: .4byte gUnknown_0201FAD0
.L08056E74:
	movs r0, #1
.L08056E76:
	pop {r1}
	bx r1

	THUMB_FUNC_END HasEkrNamewinAppearEnded

	THUMB_FUNC_START func_08056E7C
func_08056E7C: @ 0x08056E7C
	push {r4, lr}
	adds r2, r0, #0
	ldrh r3, [r2, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	movs r4, #0x30
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne .L08056E9A
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
	b .L08056E9E
.L08056E9A:
	adds r0, r3, #1
	strh r0, [r2, #0x2c]
.L08056E9E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08056E7C

	THUMB_FUNC_START func_08056EA4
func_08056EA4: @ 0x08056EA4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08056ED8
	ldr r0, .L08056ED4  @ gUnknown_0201FAD0
	movs r1, #0
	str r1, [r0]
	bl func_08051B70
	ldr r0, [r4, #0x44]
	cmp r0, #2
	bne .L08056ECC
	bl func_08051AF4
.L08056ECC:
	adds r0, r4, #0
	bl Proc_Break
	b .L08056F16
	.align 2, 0
.L08056ED4: .4byte gUnknown_0201FAD0
.L08056ED8:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08056EF8
	ldr r1, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b .L08056F0C
.L08056EF8:
	ldr r2, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
.L08056F0C:
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_8051B48
.L08056F16:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08056EA4

	THUMB_FUNC_START func_08056F20
func_08056F20: @ 0x08056F20
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L08056F44  @ gUnknown_085B9D44
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	cmp r4, #0
	bne .L08056F4C
	ldr r2, .L08056F48  @ 0x0000FFA8
	movs r0, #2
	bl SetBgOffset
	b .L08056F56
	.align 2, 0
.L08056F44: .4byte gUnknown_085B9D44
.L08056F48: .4byte 0x0000FFA8
.L08056F4C:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08056F56:
	ldr r1, .L08056F64  @ gUnknown_0201FAD4
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08056F64: .4byte gUnknown_0201FAD4

	THUMB_FUNC_END func_08056F20

	THUMB_FUNC_START func_08056F68
func_08056F68: @ 0x08056F68
	push {lr}
	ldr r0, .L08056F78  @ gUnknown_0201FAD4
	ldr r0, [r0]
	cmp r0, #0
	beq .L08056F7C
	movs r0, #0
	b .L08056F7E
	.align 2, 0
.L08056F78: .4byte gUnknown_0201FAD4
.L08056F7C:
	movs r0, #1
.L08056F7E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08056F68

	THUMB_FUNC_START func_08056F84
func_08056F84: @ 0x08056F84
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt .L08056FAC
	ldr r1, .L08056FA8  @ gUnknown_0201FAD4
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08056FF0
	.align 2, 0
.L08056FA8: .4byte gUnknown_0201FAD4
.L08056FAC:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne .L08056FCE
	movs r1, #0x50
	negs r1, r1
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b .L08056FE4
.L08056FCE:
	movs r2, #0x50
	negs r2, r2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
.L08056FE4:
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
.L08056FF0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08056F84

	THUMB_FUNC_START PrepareBattleGraphics
PrepareBattleGraphics: @ 0x08056FF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	movs r0, #1
	str r0, [sp, #0x20]
	bl func_0806F9FC
	ldr r0, .L08057020  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08057024
	movs r0, #0
	bl SetBattleAnimArenaFlag
	b .L0805702A
	.align 2, 0
.L08057020: .4byte gBattleStats
.L08057024:
	movs r0, #1
	bl SetBattleAnimArenaFlag
.L0805702A:
	ldr r0, .L08057040  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08057044
	movs r0, #0
	bl SetBattleAnimLinkArenaFlag
	b .L0805704A
	.align 2, 0
.L08057040: .4byte gBmSt
.L08057044:
	movs r0, #1
	bl SetBattleAnimLinkArenaFlag
.L0805704A:
	ldr r0, .L08057064  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq .L0805706C
	ldr r1, .L08057068  @ gBattleAnimSceneLayoutEnum
	movs r0, #4
	strh r0, [r1]
	mov r8, r1
	b .L08057072
	.align 2, 0
.L08057064: .4byte gBattleStats
.L08057068: .4byte gBattleAnimSceneLayoutEnum
.L0805706C:
	ldr r0, .L080570A4  @ gBattleAnimSceneLayoutEnum
	strh r2, [r0]
	mov r8, r0
.L08057072:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #4
	bne .L080570C0
	ldr r1, .L080570A8  @ gpUnitLeft_BattleStruct
	ldr r0, .L080570AC  @ gBattleUnitA
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, .L080570B0  @ gpUnitRight_BattleStruct
	ldr r0, .L080570B4  @ gBattleUnitB
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, .L080570B8  @ gBattleAnimBoolIsActorOnTheRight
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r0, .L080570BC  @ gBattleAnimUnitEnabledLookup
	movs r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r6, [sp, #8]
	adds r3, r0, #0
	b .L080571C6
	.align 2, 0
.L080570A4: .4byte gBattleAnimSceneLayoutEnum
.L080570A8: .4byte gpUnitLeft_BattleStruct
.L080570AC: .4byte gBattleUnitA
.L080570B0: .4byte gpUnitRight_BattleStruct
.L080570B4: .4byte gBattleUnitB
.L080570B8: .4byte gBattleAnimBoolIsActorOnTheRight
.L080570BC: .4byte gBattleAnimUnitEnabledLookup
.L080570C0:
	ldr r5, .L080570F8  @ gBattleUnitA
	ldrb r1, [r5, #0xb]
	movs r4, #0x40
	negs r4, r4
	adds r0, r4, #0
	ands r0, r1
	bl GetAllegienceId
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, .L080570FC  @ gBattleUnitB
	ldrb r0, [r0, #0xb]
	ands r4, r0
	adds r0, r4, #0
	bl GetAllegienceId
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, .L08057100  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08057104
	movs r3, #2
	str r3, [sp, #0x20]
	b .L08057128
	.align 2, 0
.L080570F8: .4byte gBattleUnitA
.L080570FC: .4byte gBattleUnitB
.L08057100: .4byte gBattleStats
.L08057104:
	adds r1, r5, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	cmp r0, #0
	bne .L08057114
	movs r4, #2
	str r4, [sp, #0x20]
	b .L08057128
.L08057114:
	ldrh r0, [r1]
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocCharCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
.L08057128:
	ldr r1, .L08057180  @ gBattleAnimUnitEnabledLookup
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	bl GetBattleAnimLinkArenaFlag
	cmp r0, #1
	beq .L08057150
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq .L0805714E
	cmp r0, #2
	beq .L0805714E
	cmp r0, #1
	bne .L08057150
	cmp r6, #1
	bne .L08057150
.L0805714E:
	movs r4, #1
.L08057150:
	adds r2, r4, #0
	cmp r2, #1
	bne .L0805719C
	ldr r1, .L08057184  @ gpUnitLeft_BattleStruct
	ldr r0, .L08057188  @ gBattleUnitB
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, .L0805718C  @ gpUnitRight_BattleStruct
	ldr r0, .L08057190  @ gBattleUnitA
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r0, .L08057194  @ gBattleAnimBoolIsActorOnTheRight
	movs r1, #0
	strh r2, [r0]
	strh r1, [r0, #2]
	ldr r5, .L08057198  @ gBattleAnimSceneLayoutEnum
	mov r8, r5
	ldr r6, [sp, #0xc]
	ldr r3, .L08057180  @ gBattleAnimUnitEnabledLookup
	ldr r7, [sp, #0x20]
	cmp r7, #1
	bne .L080571C6
	strh r1, [r3]
	b .L080571C6
	.align 2, 0
.L08057180: .4byte gBattleAnimUnitEnabledLookup
.L08057184: .4byte gpUnitLeft_BattleStruct
.L08057188: .4byte gBattleUnitB
.L0805718C: .4byte gpUnitRight_BattleStruct
.L08057190: .4byte gBattleUnitA
.L08057194: .4byte gBattleAnimBoolIsActorOnTheRight
.L08057198: .4byte gBattleAnimSceneLayoutEnum
.L0805719C:
	ldr r1, .L08057284  @ gpUnitLeft_BattleStruct
	ldr r0, .L08057288  @ gBattleUnitA
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, .L0805728C  @ gpUnitRight_BattleStruct
	ldr r0, .L08057290  @ gBattleUnitB
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, .L08057294  @ gBattleAnimBoolIsActorOnTheRight
	movs r2, #0
	strh r2, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	ldr r0, .L08057298  @ gBattleAnimSceneLayoutEnum
	mov r8, r0
	ldr r6, [sp, #8]
	ldr r3, .L0805729C  @ gBattleAnimUnitEnabledLookup
	ldr r1, [sp, #0x20]
	cmp r1, #1
	bne .L080571C6
	strh r2, [r3, #2]
.L080571C6:
	ldr r2, [sp, #8]
	mov r9, r2
	ldr r4, [sp, #0xc]
	mov sl, r4
	ldr r5, [r2]
	str r5, [sp, #0x10]
	ldr r7, [r4]
	str r7, [sp, #0x14]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x3c]
	ldrh r1, [r3, #2]
	ldrh r2, [r3]
	str r2, [sp, #0x1c]
	movs r4, #0
	ldrsh r5, [r3, r4]
	cmp r5, #0
	beq .L080571F4
	mov r7, r9
	ldr r0, [r7, #4]
	ldr r0, [r0, #0x34]
	str r0, [sp, #0x3c]
.L080571F4:
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	str r0, [sp, #0x28]
	cmp r4, #0
	beq .L08057206
	mov r1, sl
	ldr r0, [r1, #4]
	ldr r0, [r0, #0x34]
	str r0, [sp, #0x18]
.L08057206:
	cmp r5, #0
	beq .L08057232
	ldr r3, .L080572A0  @ gUnknown_0203E122
	mov r2, r9
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	ldr r2, .L080572A4  @ gBmSt
	movs r7, #0xc
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3]
	mov r1, r9
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r7, #0xe
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #2]
.L08057232:
	cmp r4, #0
	beq .L0805725E
	ldr r3, .L080572A0  @ gUnknown_0203E122
	mov r1, sl
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, .L080572A4  @ gBmSt
	movs r7, #0xc
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #4]
	mov r1, sl
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r7, #0xe
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #6]
.L0805725E:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #4
	beq .L08057336
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq .L080572A8
	movs r0, #2
	mov r3, r8
	strh r0, [r3]
	b .L0805732C
	.align 2, 0
.L08057284: .4byte gpUnitLeft_BattleStruct
.L08057288: .4byte gBattleUnitA
.L0805728C: .4byte gpUnitRight_BattleStruct
.L08057290: .4byte gBattleUnitB
.L08057294: .4byte gBattleAnimBoolIsActorOnTheRight
.L08057298: .4byte gBattleAnimSceneLayoutEnum
.L0805729C: .4byte gBattleAnimUnitEnabledLookup
.L080572A0: .4byte gUnknown_0203E122
.L080572A4: .4byte gBmSt
.L080572A8:
	movs r0, #3
	mov r7, r8
	strh r0, [r7]
	adds r0, r5, r4
	cmp r0, #2
	bne .L0805732C
	ldr r0, .L080572CC  @ gUnknown_0203E122
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #4
	ldrsh r2, [r0, r3]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0
	blt .L080572D0
	ldrh r0, [r2]
	ldrh r1, [r2, #4]
	b .L080572D4
	.align 2, 0
.L080572CC: .4byte gUnknown_0203E122
.L080572D0:
	ldrh r0, [r2, #4]
	ldrh r1, [r2]
.L080572D4:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	movs r4, #2
	ldrsh r0, [r2, r4]
	movs r5, #6
	ldrsh r1, [r2, r5]
	subs r0, r0, r1
	cmp r0, #0
	blt .L080572F0
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #6]
	b .L080572F4
.L080572F0:
	ldrh r0, [r2, #6]
	ldrh r1, [r2, #2]
.L080572F4:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r1, r0
	cmp r0, #1
	bgt .L08057314
	ldr r1, .L08057310  @ gBattleAnimSceneLayoutEnum
	movs r0, #0
	b .L08057328
	.align 2, 0
.L08057310: .4byte gBattleAnimSceneLayoutEnum
.L08057314:
	cmp r0, #3
	bgt .L08057324
	ldr r1, .L08057320  @ gBattleAnimSceneLayoutEnum
	movs r0, #1
	b .L08057328
	.align 2, 0
.L08057320: .4byte gBattleAnimSceneLayoutEnum
.L08057324:
	ldr r1, .L08057374  @ gBattleAnimSceneLayoutEnum
	movs r0, #2
.L08057328:
	strh r0, [r1]
	mov r8, r1
.L0805732C:
	mov r7, r8
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bne .L080573B0
.L08057336:
	ldr r2, [sp, #8]
	adds r2, #0x48
	mov r8, r2
	ldrh r2, [r2]
	mov r0, r9
	ldr r1, [sp, #0x3c]
	mov r3, sp
	bl GetBattleAnimationId
	ldr r6, .L08057378  @ gBattleAnimAnimationIndex
	ldr r4, .L0805737C  @ gStoredBattleAnimId21Ptr
	strh r0, [r4]
	strh r0, [r6]
	ldr r5, [sp, #0xc]
	adds r5, #0x48
	ldrh r2, [r5]
	add r3, sp, #4
	mov r0, sl
	ldr r1, [sp, #0x18]
	bl GetBattleAnimationId
	strh r0, [r4, #2]
	strh r0, [r6, #2]
	ldr r3, [sp, #0x1c]
	lsls r3, r3, #0x10
	str r3, [sp, #0x24]
	mov r4, r8
	str r4, [sp, #0x2c]
	str r5, [sp, #0x30]
	b .L080573FC
	.align 2, 0
.L08057374: .4byte gBattleAnimSceneLayoutEnum
.L08057378: .4byte gBattleAnimAnimationIndex
.L0805737C: .4byte gStoredBattleAnimId21Ptr
.L08057380:
	ldr r0, .L08057390  @ gUnknown_0203E110
	ldr r1, .L08057394  @ gUnknown_0895EEA4
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r1, #1
	strh r1, [r0]
	b .L08057448
	.align 2, 0
.L08057390: .4byte gUnknown_0203E110
.L08057394: .4byte gUnknown_0895EEA4
.L08057398:
	ldr r0, .L080573A8  @ gUnknown_0203E110
	ldr r1, .L080573AC  @ gUnknown_0895EEA4
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r1, #1
	strh r1, [r0, #2]
	b .L08057486
	.align 2, 0
.L080573A8: .4byte gUnknown_0203E110
.L080573AC: .4byte gUnknown_0895EEA4
.L080573B0:
	ldr r5, [sp, #0x1c]
	lsls r0, r5, #0x10
	str r0, [sp, #0x24]
	cmp r0, #0
	beq .L080573D2
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r2, [r0]
	mov r0, r9
	ldr r1, [sp, #0x3c]
	mov r3, sp
	bl GetBattleAnimationId
	ldr r2, .L080575A4  @ gBattleAnimAnimationIndex
	ldr r1, .L080575A8  @ gStoredBattleAnimId21Ptr
	strh r0, [r1]
	strh r0, [r2]
.L080573D2:
	ldr r7, [sp, #8]
	adds r7, #0x48
	str r7, [sp, #0x2c]
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x28]
	cmp r1, #0
	beq .L080573FC
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r2, [r0]
	add r3, sp, #4
	mov r0, sl
	ldr r1, [sp, #0x18]
	bl GetBattleAnimationId
	ldr r2, .L080575A4  @ gBattleAnimAnimationIndex
	ldr r1, .L080575A8  @ gStoredBattleAnimId21Ptr
	strh r0, [r1, #2]
	strh r0, [r2, #2]
.L080573FC:
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r3, r9
	ldr r0, [r3, #4]
	ldrb r4, [r0, #4]
	ldr r5, [sp, #0x24]
	asrs r3, r5, #0x10
	cmp r3, #0
	beq .L0805741C
	ldr r1, .L080575AC  @ gUnknown_0203E110
	ldr r0, .L080575B0  @ 0x0000FFFF
	strh r0, [r1]
.L0805741C:
	movs r1, #0
	lsls r0, r2, #3
	ldr r7, [sp, #8]
	adds r7, #0x55
	str r7, [sp, #0x34]
	ldr r5, [sp, #0xc]
	adds r5, #0x55
	str r5, [sp, #0x38]
	ldr r7, .L080575B4  @ gUnknown_0895E0A4
	subs r6, r0, r2
.L08057430:
	adds r2, r1, r6
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, r4
	bne .L0805743E
	cmp r3, #0
	bne .L08057380
.L0805743E:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #6
	bls .L08057430
.L08057448:
	mov r7, sl
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r7, #4]
	ldrb r4, [r0, #4]
	ldr r0, [sp, #0x28]
	asrs r3, r0, #0x10
	cmp r3, #0
	beq .L08057466
	ldr r1, .L080575AC  @ gUnknown_0203E110
	ldr r0, .L080575B0  @ 0x0000FFFF
	strh r0, [r1, #2]
.L08057466:
	movs r1, #0
	lsls r0, r2, #3
	ldr r7, .L080575B4  @ gUnknown_0895E0A4
	subs r6, r0, r2
.L0805746E:
	adds r2, r1, r6
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, r4
	bne .L0805747C
	cmp r3, #0
	bne .L08057398
.L0805747C:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #6
	bls .L0805746E
.L08057486:
	ldr r1, [sp, #0x24]
	asrs r6, r1, #0x10
	cmp r6, #0
	beq .L080574A2
	ldr r0, .L080575A4  @ gBattleAnimAnimationIndex
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl SomethingFilterBattleAnimId
	ldr r1, .L080575B8  @ gUnknown_0203E19C
	str r0, [r1]
.L080574A2:
	ldr r3, [sp, #0x28]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq .L080574BE
	ldr r0, .L080575A4  @ gBattleAnimAnimationIndex
	movs r4, #2
	ldrsh r0, [r0, r4]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl SomethingFilterBattleAnimId
	ldr r1, .L080575B8  @ gUnknown_0203E19C
	str r0, [r1, #4]
.L080574BE:
	ldr r7, .L080575BC  @ gUnknown_0203E1CC
	mov r8, r7
	ldr r1, [sp, #0x34]
	ldrb r0, [r1]
	mov r2, r8
	strh r0, [r2]
	ldr r3, [sp, #0x38]
	ldrb r0, [r3]
	strh r0, [r2, #2]
	ldr r7, .L080575C0  @ gUnknown_0203E11C
	ldr r0, .L080575B0  @ 0x0000FFFF
	strh r0, [r7, #2]
	movs r0, #1
	negs r0, r0
	strh r0, [r7]
	cmp r6, #0
	beq .L080574F8
	ldrb r4, [r1]
	ldr r0, .L080575C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl func_08057DA8
	strh r0, [r7]
.L080574F8:
	cmp r5, #0
	beq .L08057516
	ldr r0, [sp, #0x38]
	ldrb r4, [r0]
	ldr r0, .L080575C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl func_08057DA8
	strh r0, [r7, #2]
.L08057516:
	ldr r0, .L080575C8  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08057562
	movs r0, #0x30
	mov r1, r8
	strh r0, [r1]
	strh r0, [r1, #2]
	cmp r6, #0
	beq .L08057544
	ldr r0, .L080575C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	movs r0, #0x30
	bl func_08057DA8
	strh r0, [r7]
.L08057544:
	cmp r5, #0
	beq .L08057562
	mov r2, r8
	ldrh r4, [r2, #2]
	ldr r0, .L080575C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl func_08057DA8
	strh r0, [r7, #2]
.L08057562:
	bl IsBattleAnimPromotion
	cmp r0, #1
	bne .L0805757A
	ldr r1, .L080575C0  @ gUnknown_0203E11C
	movs r0, #0x14
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r1, .L080575BC  @ gUnknown_0203E1CC
	movs r0, #0x30
	strh r0, [r1, #2]
	strh r0, [r1]
.L0805757A:
	ldr r0, .L080575CC  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt .L08057592
	cmp r0, #3
	ble .L08057592
	cmp r0, #4
	bne .L08057592
	ldr r1, .L080575C0  @ gUnknown_0203E11C
	ldrh r0, [r1, #2]
	strh r0, [r1]
.L08057592:
	ldr r0, .L080575C4  @ gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #2
	bgt .L080575D4
	cmp r0, #1
	blt .L080575D4
	ldr r1, .L080575D0  @ gUnknown_0203E102
	movs r0, #1
	b .L080575D8
	.align 2, 0
.L080575A4: .4byte gBattleAnimAnimationIndex
.L080575A8: .4byte gStoredBattleAnimId21Ptr
.L080575AC: .4byte gUnknown_0203E110
.L080575B0: .4byte 0x0000FFFF
.L080575B4: .4byte gUnknown_0895E0A4
.L080575B8: .4byte gUnknown_0203E19C
.L080575BC: .4byte gUnknown_0203E1CC
.L080575C0: .4byte gUnknown_0203E11C
.L080575C4: .4byte gPlaySt
.L080575C8: .4byte gBmSt
.L080575CC: .4byte gBattleAnimSceneLayoutEnum
.L080575D0: .4byte gUnknown_0203E102
.L080575D4:
	ldr r1, .L08057658  @ gUnknown_0203E102
	movs r0, #0
.L080575D8:
	strh r0, [r1]
	ldr r5, [sp, #0x24]
	asrs r4, r5, #0x10
	cmp r4, #0
	beq .L080575F0
	ldr r0, .L0805765C  @ gUnknown_0203E1D0
	mov r7, r9
	ldr r1, [r7, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0]
.L080575F0:
	ldr r0, [sp, #0x28]
	asrs r6, r0, #0x10
	cmp r6, #0
	beq .L08057606
	ldr r0, .L0805765C  @ gUnknown_0203E1D0
	mov r2, sl
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #2]
.L08057606:
	cmp r4, #0
	beq .L08057622
	ldr r1, .L08057660  @ gBattleHpDisplayedValue
	ldr r0, [sp, #8]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	ldr r1, .L08057664  @ gUnknown_0203E1B0
	mov r3, r9
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r1]
.L08057622:
	cmp r6, #0
	beq .L0805763E
	ldr r1, .L08057660  @ gBattleHpDisplayedValue
	ldr r0, [sp, #0xc]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
	ldr r1, .L08057664  @ gUnknown_0203E1B0
	mov r5, sl
	movs r0, #0x12
	ldrsb r0, [r5, r0]
	strh r0, [r1, #2]
.L0805763E:
	bl InitBattleAnimHitArrays
	ldr r0, .L08057668  @ gBattleAnimSceneLayoutEnum
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, #4
	bne .L08057670
	ldr r1, .L0805766C  @ gBattleSpellAnimationId1
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b .L080576CC
	.align 2, 0
.L08057658: .4byte gUnknown_0203E102
.L0805765C: .4byte gUnknown_0203E1D0
.L08057660: .4byte gBattleHpDisplayedValue
.L08057664: .4byte gUnknown_0203E1B0
.L08057668: .4byte gBattleAnimSceneLayoutEnum
.L0805766C: .4byte gBattleSpellAnimationId1
.L08057670:
	cmp r4, #0
	beq .L08057688
	mov r1, r9
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl GetSpellAnimId
	ldr r1, .L08057714  @ gBattleSpellAnimationId1
	strh r0, [r1]
.L08057688:
	cmp r6, #0
	beq .L080576A0
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl GetSpellAnimId
	ldr r1, .L08057714  @ gBattleSpellAnimationId1
	strh r0, [r1, #2]
.L080576A0:
	ldr r0, .L08057718  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080576CC
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L080576CC
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4d
	bne .L080576CC
	ldr r1, .L08057714  @ gBattleSpellAnimationId1
	movs r0, #0xf
	strh r0, [r1, #2]
.L080576CC:
	ldr r4, [sp, #0x24]
	cmp r4, #0
	beq .L080576E0
	ldr r0, .L08057714  @ gBattleSpellAnimationId1
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	bl func_080581A0
.L080576E0:
	ldr r5, [sp, #0x28]
	cmp r5, #0
	beq .L080576F4
	ldr r0, .L0805771C  @ gBattleSpellAnimationId2
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #1
	bl func_080581A0
.L080576F4:
	ldr r0, .L08057720  @ gBattleAnimSceneLayoutEnum
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, #0
	blt .L0805773E
	cmp r0, #2
	bgt .L0805773E
	mov r1, r9
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x65
	beq .L08057724
	cmp r0, #0x66
	beq .L08057734
	b .L0805773E
	.align 2, 0
.L08057714: .4byte gBattleSpellAnimationId1
.L08057718: .4byte gBattleStats
.L0805771C: .4byte gBattleSpellAnimationId2
.L08057720: .4byte gBattleAnimSceneLayoutEnum
.L08057724:
	ldr r0, .L08057730  @ gUnknown_02000000
	ldr r0, [r0]
	movs r1, #1
	bl func_0806FA84
	b .L0805773E
	.align 2, 0
.L08057730: .4byte gUnknown_02000000
.L08057734:
	ldr r0, .L080579DC  @ gUnknown_02000000
	ldr r0, [r0]
	movs r1, #2
	bl func_0806FA84
.L0805773E:
	ldr r2, [sp, #0x24]
	asrs r6, r2, #0x10
	cmp r6, #0
	beq .L08057758
	mov r3, r9
	ldrb r1, [r3, #0xb]
	movs r0, #0x40
	negs r0, r0
	ands r0, r1
	bl GetAllegienceId
	ldr r1, .L080579E0  @ gUnknown_0203E114
	strh r0, [r1]
.L08057758:
	ldr r5, [sp, #0x28]
	asrs r4, r5, #0x10
	cmp r4, #0
	beq .L08057772
	mov r7, sl
	ldrb r1, [r7, #0xb]
	movs r0, #0x40
	negs r0, r0
	ands r0, r1
	bl GetAllegienceId
	ldr r1, .L080579E0  @ gUnknown_0203E114
	strh r0, [r1, #2]
.L08057772:
	ldr r1, .L080579E4  @ gBattleCharacterIndices
	movs r7, #0
	strb r7, [r1, #1]
	strb r7, [r1]
	cmp r6, #0
	beq .L08057784
	ldr r2, [sp, #0x10]
	ldrb r0, [r2, #4]
	strb r0, [r1]
.L08057784:
	cmp r4, #0
	beq .L0805778E
	ldr r3, [sp, #0x14]
	ldrb r0, [r3, #4]
	strb r0, [r1, #1]
.L0805778E:
	ldr r3, .L080579E8  @ gUnknown_0203E1B8
	cmp r6, #0
	beq .L0805779C
	ldr r0, [sp, #8]
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r3]
.L0805779C:
	cmp r4, #0
	beq .L080577A8
	ldr r0, [sp, #0xc]
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r3, #2]
.L080577A8:
	adds r1, r3, #0
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0xff
	bne .L080577B8
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r1]
.L080577B8:
	ldrh r1, [r3, #2]
	movs r5, #2
	ldrsh r0, [r3, r5]
	cmp r0, #0xff
	bne .L080577C6
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r3, #2]
.L080577C6:
	cmp r6, #0
	beq .L08057800
	ldr r4, .L080579F0  @ gUnknown_0203E1BC
	ldr r2, [sp, #8]
	adds r2, #0x5a
	ldr r0, [sp, #0xc]
	adds r0, #0x5c
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge .L080577E4
	strh r7, [r4]
.L080577E4:
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0xff
	bne .L080577F0
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r4]
.L080577F0:
	ldr r1, [sp, #0x2c]
	ldrh r0, [r1]
	bl GetItemIid
	cmp r0, #0xb5
	bne .L08057800
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r4]
.L08057800:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	beq .L0805783E
	ldr r4, .L080579F0  @ gUnknown_0203E1BC
	ldr r2, [sp, #0xc]
	adds r2, #0x5a
	ldr r0, [sp, #8]
	adds r0, #0x5c
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r4, #2]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge .L08057822
	movs r0, #0
	strh r0, [r4, #2]
.L08057822:
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0xff
	bne .L0805782E
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r4, #2]
.L0805782E:
	ldr r5, [sp, #0x30]
	ldrh r0, [r5]
	bl GetItemIid
	cmp r0, #0xb5
	bne .L0805783E
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r4, #2]
.L0805783E:
	ldr r7, [sp, #0x24]
	asrs r5, r7, #0x10
	ldr r7, .L080579F4  @ gUnknown_0203E1C0
	cmp r5, #0
	beq .L08057850
	ldr r0, [sp, #8]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r7]
.L08057850:
	ldr r0, [sp, #0x28]
	asrs r6, r0, #0x10
	cmp r6, #0
	beq .L08057860
	ldr r0, [sp, #0xc]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r7, #2]
.L08057860:
	adds r4, r7, #0
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0xff
	bne .L08057870
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r4]
.L08057870:
	ldrh r1, [r4, #2]
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r0, #0xff
	bne .L0805787E
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r4, #2]
.L0805787E:
	ldr r1, [sp, #0x2c]
	ldrh r0, [r1]
	bl GetItemIid
	cmp r0, #0xb5
	bne .L0805788E
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r4]
.L0805788E:
	ldr r2, [sp, #0x30]
	ldrh r0, [r2]
	bl GetItemIid
	cmp r0, #0xb5
	bne .L0805789E
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r4, #2]
.L0805789E:
	ldr r2, .L080579F8  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #4
	bne .L080578B8
	ldr r1, .L080579E8  @ gUnknown_0203E1B8
	ldr r0, .L080579EC  @ 0x0000FFFF
	strh r0, [r1, #2]
	ldr r1, .L080579F0  @ gUnknown_0203E1BC
	movs r0, #1
	negs r0, r0
	strh r0, [r1, #2]
	strh r0, [r7, #2]
.L080578B8:
	cmp r5, #0
	beq .L080578CA
	ldr r1, .L080579FC  @ gUnknown_0203E1C4
	ldr r0, [sp, #8]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
.L080578CA:
	cmp r6, #0
	beq .L080578DC
	ldr r1, .L080579FC  @ gUnknown_0203E1C4
	ldr r0, [sp, #0xc]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
.L080578DC:
	cmp r5, #0
	beq .L080578EE
	ldr r1, .L08057A00  @ gUnknown_0203E1C8
	ldr r0, [sp, #8]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
.L080578EE:
	cmp r6, #0
	beq .L08057900
	ldr r1, .L08057A00  @ gUnknown_0203E1C8
	ldr r0, [sp, #0xc]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
.L08057900:
	ldr r1, .L08057A04  @ gUnknown_0203E1D4
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #4
	beq .L08057996
	cmp r5, #0
	beq .L08057920
	ldr r0, [sp, #8]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
.L08057920:
	cmp r6, #0
	beq .L08057930
	ldr r0, [sp, #0xc]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
.L08057930:
	cmp r5, #0
	beq .L08057944
	mov r0, r9
	mov r1, sl
	bl IsUnitEffectiveAgainst
	ldr r1, .L08057A08  @ gUnknown_0203E1D8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
.L08057944:
	cmp r6, #0
	beq .L08057958
	mov r0, sl
	mov r1, r9
	bl IsUnitEffectiveAgainst
	ldr r1, .L08057A08  @ gUnknown_0203E1D8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
.L08057958:
	ldr r4, .L08057A08  @ gUnknown_0203E1D8
	movs r7, #0
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bne .L08057976
	cmp r5, #0
	beq .L08057976
	ldr r1, [sp, #0x2c]
	ldrh r0, [r1]
	mov r1, sl
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
.L08057976:
	ldr r4, .L08057A08  @ gUnknown_0203E1D8
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne .L08057996
	ldr r3, [sp, #0x28]
	cmp r3, #0
	beq .L08057996
	ldr r5, [sp, #0x30]
	ldrh r0, [r5]
	mov r1, r9
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
.L08057996:
	ldr r0, .L08057A0C  @ gBattleAnimBoolLockSheetGraphicsMaybe
	movs r4, #0
	str r4, [r0, #4]
	str r4, [r0]
	ldr r7, [sp, #0x24]
	cmp r7, #0
	beq .L080579AE
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
.L080579AE:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq .L080579BE
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
.L080579BE:
	bl GetBattleAnimLinkArenaFlag
	cmp r0, #1
	beq .L080579D2
	ldr r0, .L08057A10  @ gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq .L08057A18
.L080579D2:
	ldr r1, .L08057A14  @ gUnknown_0203E1DC
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b .L08057A1E
	.align 2, 0
.L080579DC: .4byte gUnknown_02000000
.L080579E0: .4byte gUnknown_0203E114
.L080579E4: .4byte gBattleCharacterIndices
.L080579E8: .4byte gUnknown_0203E1B8
.L080579EC: .4byte 0x0000FFFF
.L080579F0: .4byte gUnknown_0203E1BC
.L080579F4: .4byte gUnknown_0203E1C0
.L080579F8: .4byte gBattleAnimSceneLayoutEnum
.L080579FC: .4byte gUnknown_0203E1C4
.L08057A00: .4byte gUnknown_0203E1C8
.L08057A04: .4byte gUnknown_0203E1D4
.L08057A08: .4byte gUnknown_0203E1D8
.L08057A0C: .4byte gBattleAnimBoolLockSheetGraphicsMaybe
.L08057A10: .4byte gPlaySt
.L08057A14: .4byte gUnknown_0203E1DC
.L08057A18:
	ldr r0, .L08057A3C  @ gUnknown_0203E1DC
	strh r4, [r0, #2]
	strh r4, [r0]
.L08057A1E:
	ldr r5, .L08057A40  @ gUnknown_0203E0FE
	movs r0, #0
	strh r0, [r5]
	bl GetBattleAnimType
	cmp r0, #3
	bne .L08057A66
	ldr r0, .L08057A44  @ gBattleAnimUnitEnabledLookup
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08057A4C
	ldr r0, .L08057A48  @ gUnknown_0203E1CC
	ldrh r4, [r0]
	b .L08057A50
	.align 2, 0
.L08057A3C: .4byte gUnknown_0203E1DC
.L08057A40: .4byte gUnknown_0203E0FE
.L08057A44: .4byte gBattleAnimUnitEnabledLookup
.L08057A48: .4byte gUnknown_0203E1CC
.L08057A4C:
	ldr r0, .L08057C78  @ gUnknown_0203E1CC
	ldrh r4, [r0, #2]
.L08057A50:
	ldr r0, .L08057C7C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl func_08057ED0
	strh r0, [r5]
.L08057A66:
	bl IsBattleAnimPromotion
	cmp r0, #1
	bne .L08057A74
	ldr r1, .L08057C80  @ gUnknown_0203E0FE
	movs r0, #0x3c
	strh r0, [r1]
.L08057A74:
	movs r4, #0
	bl GetBattleAnimType
	cmp r0, #0
	bne .L08057A80
	movs r4, #1
.L08057A80:
	bl GetBattleAnimType
	cmp r0, #3
	bne .L08057A8A
	movs r4, #1
.L08057A8A:
	bl GetBattleAnimType
	cmp r0, #1
	bne .L08057AB6
	ldr r0, .L08057C84  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bne .L08057A9E
	movs r4, #1
.L08057A9E:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne .L08057AA8
	movs r4, #1
.L08057AA8:
	bl func_08058B7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08057AB6
	movs r4, #1
.L08057AB6:
	bl func_08058B70
	ldr r0, .L08057C84  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #4
	beq .L08057AE0
	mov r5, r9
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L08057AD4
	b .L08057C72
.L08057AD4:
	mov r7, sl
	ldr r0, [r7, #0xc]
	ands r0, r1
	cmp r0, #0
	beq .L08057AE0
	b .L08057C72
.L08057AE0:
	mov r1, r9
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne .L08057AFA
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x52
	bne .L08057AFA
	b .L08057C72
.L08057AFA:
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne .L08057B14
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x52
	bne .L08057B14
	b .L08057C72
.L08057B14:
	mov r3, r9
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne .L08057B2E
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x53
	bne .L08057B2E
	b .L08057C72
.L08057B2E:
	mov r5, sl
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne .L08057B48
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x53
	bne .L08057B48
	b .L08057C72
.L08057B48:
	mov r7, r9
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne .L08057B62
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x51
	bne .L08057B62
	b .L08057C72
.L08057B62:
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne .L08057B7A
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x51
	beq .L08057C72
.L08057B7A:
	mov r2, r9
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne .L08057B92
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0xb5
	beq .L08057C72
.L08057B92:
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne .L08057BAA
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0xb5
	beq .L08057C72
.L08057BAA:
	ldr r5, [sp, #0x20]
	cmp r5, #1
	beq .L08057BD6
	mov r7, r9
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne .L08057BD6
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0xa6
	beq .L08057BD6
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq .L08057BD6
	cmp r0, #0x65
	bne .L08057C98
.L08057BD6:
	cmp r4, #0
	beq .L08057C72
	ldr r0, .L08057C88  @ gBattleAnimUnitEnabledLookup
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #1
	bne .L08057C28
	mov r0, r9
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq .L08057C72
	ldr r0, .L08057C8C  @ gBattleAnimAnimationIndex
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r2, #1
	negs r2, r2
	cmp r0, r2
	beq .L08057C72
	ldr r0, .L08057C90  @ gBattleSpellAnimationId1
	movs r5, #0
	ldrsh r1, [r0, r5]
	movs r0, #2
	negs r0, r0
	cmp r1, r0
	beq .L08057C72
	ldr r0, .L08057C94  @ gUnknown_0203E11C
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r2
	beq .L08057C72
	ldr r0, .L08057C78  @ gUnknown_0203E1CC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x1b
	beq .L08057C72
	cmp r0, #0x33
	beq .L08057C72
.L08057C28:
	movs r2, #2
	ldrsh r0, [r3, r2]
	cmp r0, #1
	bne .L08057C98
	mov r0, sl
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq .L08057C72
	ldr r0, .L08057C8C  @ gBattleAnimAnimationIndex
	movs r3, #2
	ldrsh r0, [r0, r3]
	movs r2, #1
	negs r2, r2
	cmp r0, r2
	beq .L08057C72
	ldr r0, .L08057C90  @ gBattleSpellAnimationId1
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r0, #2
	negs r0, r0
	cmp r1, r0
	beq .L08057C72
	ldr r0, .L08057C94  @ gUnknown_0203E11C
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, r2
	beq .L08057C72
	ldr r0, .L08057C78  @ gUnknown_0203E1CC
	movs r7, #2
	ldrsh r0, [r0, r7]
	cmp r0, #0x1b
	beq .L08057C72
	cmp r0, #0x33
	bne .L08057C98
.L08057C72:
	movs r0, #0
	b .L08057C9A
	.align 2, 0
.L08057C78: .4byte gUnknown_0203E1CC
.L08057C7C: .4byte gPlaySt
.L08057C80: .4byte gUnknown_0203E0FE
.L08057C84: .4byte gBattleAnimSceneLayoutEnum
.L08057C88: .4byte gBattleAnimUnitEnabledLookup
.L08057C8C: .4byte gBattleAnimAnimationIndex
.L08057C90: .4byte gBattleSpellAnimationId1
.L08057C94: .4byte gUnknown_0203E11C
.L08057C98:
	movs r0, #1
.L08057C9A:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepareBattleGraphics

	THUMB_FUNC_START func_08057CAC
func_08057CAC: @ 0x08057CAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	mov r9, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq .L08057CE2
	mov r0, r8
	bl GetItemKind
	cmp r0, #9
	bne .L08057CEC
	mov r0, r8
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08057CEC
.L08057CE2:
	ldr r0, .L08057CE8  @ 0x0000FFFF
	b .L08057D98
	.align 2, 0
.L08057CE8: .4byte 0x0000FFFF
.L08057CEC:
	mov r1, r8
	cmp r1, #0
	bne .L08057CF6
	movs r3, #9
	b .L08057D00
.L08057CF6:
	mov r0, r8
	bl GetItemKind
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
.L08057D00:
	str r4, [sp]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x25
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq .L08057D26
	ldr r1, .L08057D38  @ gUnknown_088AF834
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
.L08057D26:
	movs r0, #0
	mov r2, r9
	str r0, [r2]
	movs r7, #0
	movs r1, #0
.L08057D30:
	ldr r5, [sp]
	movs r6, #0
	b .L08057D80
	.align 2, 0
.L08057D38: .4byte gUnknown_088AF834
.L08057D3C:
	cmp r7, #0
	bne .L08057D44
	cmp r0, #0xff
	bhi .L08057D7C
.L08057D44:
	cmp r7, #1
	bne .L08057D4E
	ldrh r0, [r5]
	cmp r0, #0xff
	bls .L08057D7C
.L08057D4E:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r3, [sp, #8]
	bl GetItemIid
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	cmp r4, r0
	beq .L08057D6C
	ldrh r0, [r5]
	ldr r2, .L08057D78  @ 0xFFFFFF00
	adds r0, r0, r2
	cmp r0, r3
	bne .L08057D7C
.L08057D6C:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, r9
	str r6, [r0]
	movs r1, #1
	b .L08057D86
	.align 2, 0
.L08057D78: .4byte 0xFFFFFF00
.L08057D7C:
	adds r5, #4
	adds r6, #1
.L08057D80:
	ldrh r0, [r5]
	cmp r0, #0
	bne .L08057D3C
.L08057D86:
	cmp r1, #1
	beq .L08057D90
	adds r7, #1
	cmp r7, #1
	ble .L08057D30
.L08057D90:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
.L08057D98:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08057CAC

	THUMB_FUNC_START func_08057DA8
func_08057DA8: @ 0x08057DA8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x14
	bls .L08057DB8
	b .L08057EBC
.L08057DB8:
	lsls r0, r0, #2
	ldr r1, .L08057DC4  @ .L08057DC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08057DC4: .4byte .L08057DC8
.L08057DC8: @ jump table
	.4byte .L08057EBC @ case 0
	.4byte .L08057E1C @ case 1
	.4byte .L08057E24 @ case 2
	.4byte .L08057E2C @ case 3
	.4byte .L08057E34 @ case 4
	.4byte .L08057E3C @ case 5
	.4byte .L08057E44 @ case 6
	.4byte .L08057E4C @ case 7
	.4byte .L08057E54 @ case 8
	.4byte .L08057E5C @ case 9
	.4byte .L08057E64 @ case 10
	.4byte .L08057E6C @ case 11
	.4byte .L08057E74 @ case 12
	.4byte .L08057E7C @ case 13
	.4byte .L08057E84 @ case 14
	.4byte .L08057E8C @ case 15
	.4byte .L08057E94 @ case 16
	.4byte .L08057E9C @ case 17
	.4byte .L08057EA4 @ case 18
	.4byte .L08057EAC @ case 19
	.4byte .L08057EB4 @ case 20
.L08057E1C:
	ldr r0, .L08057E20  @ gUnknown_0880C807
	b .L08057EBE
	.align 2, 0
.L08057E20: .4byte gUnknown_0880C807
.L08057E24:
	ldr r0, .L08057E28  @ gUnknown_0880C848
	b .L08057EBE
	.align 2, 0
.L08057E28: .4byte gUnknown_0880C848
.L08057E2C:
	ldr r0, .L08057E30  @ gUnknown_0880C889
	b .L08057EBE
	.align 2, 0
.L08057E30: .4byte gUnknown_0880C889
.L08057E34:
	ldr r0, .L08057E38  @ gUnknown_0880C8CA
	b .L08057EBE
	.align 2, 0
.L08057E38: .4byte gUnknown_0880C8CA
.L08057E3C:
	ldr r0, .L08057E40  @ gUnknown_0880C90B
	b .L08057EBE
	.align 2, 0
.L08057E40: .4byte gUnknown_0880C90B
.L08057E44:
	ldr r0, .L08057E48  @ gUnknown_0880C94C
	b .L08057EBE
	.align 2, 0
.L08057E48: .4byte gUnknown_0880C94C
.L08057E4C:
	ldr r0, .L08057E50  @ gUnknown_0880C98D
	b .L08057EBE
	.align 2, 0
.L08057E50: .4byte gUnknown_0880C98D
.L08057E54:
	ldr r0, .L08057E58  @ gUnknown_0880C9CE
	b .L08057EBE
	.align 2, 0
.L08057E58: .4byte gUnknown_0880C9CE
.L08057E5C:
	ldr r0, .L08057E60  @ gUnknown_0880CA0F
	b .L08057EBE
	.align 2, 0
.L08057E60: .4byte gUnknown_0880CA0F
.L08057E64:
	ldr r0, .L08057E68  @ gUnknown_0880CA50
	b .L08057EBE
	.align 2, 0
.L08057E68: .4byte gUnknown_0880CA50
.L08057E6C:
	ldr r0, .L08057E70  @ gUnknown_0880CA91
	b .L08057EBE
	.align 2, 0
.L08057E70: .4byte gUnknown_0880CA91
.L08057E74:
	ldr r0, .L08057E78  @ gUnknown_0880CAD2
	b .L08057EBE
	.align 2, 0
.L08057E78: .4byte gUnknown_0880CAD2
.L08057E7C:
	ldr r0, .L08057E80  @ gUnknown_0880CB13
	b .L08057EBE
	.align 2, 0
.L08057E80: .4byte gUnknown_0880CB13
.L08057E84:
	ldr r0, .L08057E88  @ gUnknown_0880CB54
	b .L08057EBE
	.align 2, 0
.L08057E88: .4byte gUnknown_0880CB54
.L08057E8C:
	ldr r0, .L08057E90  @ gUnknown_0880CB95
	b .L08057EBE
	.align 2, 0
.L08057E90: .4byte gUnknown_0880CB95
.L08057E94:
	ldr r0, .L08057E98  @ gUnknown_0880CBD6
	b .L08057EBE
	.align 2, 0
.L08057E98: .4byte gUnknown_0880CBD6
.L08057E9C:
	ldr r0, .L08057EA0  @ gUnknown_0880CC17
	b .L08057EBE
	.align 2, 0
.L08057EA0: .4byte gUnknown_0880CC17
.L08057EA4:
	ldr r0, .L08057EA8  @ gUnknown_0880CC58
	b .L08057EBE
	.align 2, 0
.L08057EA8: .4byte gUnknown_0880CC58
.L08057EAC:
	ldr r0, .L08057EB0  @ gUnknown_0880CC99
	b .L08057EBE
	.align 2, 0
.L08057EB0: .4byte gUnknown_0880CC99
.L08057EB4:
	ldr r0, .L08057EB8  @ gUnknown_0880CCDA
	b .L08057EBE
	.align 2, 0
.L08057EB8: .4byte gUnknown_0880CCDA
.L08057EBC:
	ldr r0, .L08057ECC  @ gUnknown_0880C7C6
.L08057EBE:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
.L08057ECC: .4byte gUnknown_0880C7C6

	THUMB_FUNC_END func_08057DA8

	THUMB_FUNC_START func_08057ED0
func_08057ED0: @ 0x08057ED0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x14
	bls .L08057EE0
	b .L08057FE4
.L08057EE0:
	lsls r0, r0, #2
	ldr r1, .L08057EEC  @ .L08057EF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08057EEC: .4byte .L08057EF0
.L08057EF0: @ jump table
	.4byte .L08057FE4 @ case 0
	.4byte .L08057F44 @ case 1
	.4byte .L08057F4C @ case 2
	.4byte .L08057F54 @ case 3
	.4byte .L08057F5C @ case 4
	.4byte .L08057F64 @ case 5
	.4byte .L08057F6C @ case 6
	.4byte .L08057F74 @ case 7
	.4byte .L08057F7C @ case 8
	.4byte .L08057F84 @ case 9
	.4byte .L08057F8C @ case 10
	.4byte .L08057F94 @ case 11
	.4byte .L08057F9C @ case 12
	.4byte .L08057FA4 @ case 13
	.4byte .L08057FAC @ case 14
	.4byte .L08057FB4 @ case 15
	.4byte .L08057FBC @ case 16
	.4byte .L08057FC4 @ case 17
	.4byte .L08057FCC @ case 18
	.4byte .L08057FD4 @ case 19
	.4byte .L08057FDC @ case 20
.L08057F44:
	ldr r0, .L08057F48  @ gUnknown_0880CD5C
	b .L08057FE6
	.align 2, 0
.L08057F48: .4byte gUnknown_0880CD5C
.L08057F4C:
	ldr r0, .L08057F50  @ gUnknown_0880CD9D
	b .L08057FE6
	.align 2, 0
.L08057F50: .4byte gUnknown_0880CD9D
.L08057F54:
	ldr r0, .L08057F58  @ gUnknown_0880CDDE
	b .L08057FE6
	.align 2, 0
.L08057F58: .4byte gUnknown_0880CDDE
.L08057F5C:
	ldr r0, .L08057F60  @ gUnknown_0880CE1F
	b .L08057FE6
	.align 2, 0
.L08057F60: .4byte gUnknown_0880CE1F
.L08057F64:
	ldr r0, .L08057F68  @ gUnknown_0880CE60
	b .L08057FE6
	.align 2, 0
.L08057F68: .4byte gUnknown_0880CE60
.L08057F6C:
	ldr r0, .L08057F70  @ gUnknown_0880CEA1
	b .L08057FE6
	.align 2, 0
.L08057F70: .4byte gUnknown_0880CEA1
.L08057F74:
	ldr r0, .L08057F78  @ gUnknown_0880CEE2
	b .L08057FE6
	.align 2, 0
.L08057F78: .4byte gUnknown_0880CEE2
.L08057F7C:
	ldr r0, .L08057F80  @ gUnknown_0880CF23
	b .L08057FE6
	.align 2, 0
.L08057F80: .4byte gUnknown_0880CF23
.L08057F84:
	ldr r0, .L08057F88  @ gUnknown_0880CF64
	b .L08057FE6
	.align 2, 0
.L08057F88: .4byte gUnknown_0880CF64
.L08057F8C:
	ldr r0, .L08057F90  @ gUnknown_0880CFA5
	b .L08057FE6
	.align 2, 0
.L08057F90: .4byte gUnknown_0880CFA5
.L08057F94:
	ldr r0, .L08057F98  @ gUnknown_0880CFE6
	b .L08057FE6
	.align 2, 0
.L08057F98: .4byte gUnknown_0880CFE6
.L08057F9C:
	ldr r0, .L08057FA0  @ gUnknown_0880D027
	b .L08057FE6
	.align 2, 0
.L08057FA0: .4byte gUnknown_0880D027
.L08057FA4:
	ldr r0, .L08057FA8  @ gUnknown_0880D068
	b .L08057FE6
	.align 2, 0
.L08057FA8: .4byte gUnknown_0880D068
.L08057FAC:
	ldr r0, .L08057FB0  @ gUnknown_0880D0A9
	b .L08057FE6
	.align 2, 0
.L08057FB0: .4byte gUnknown_0880D0A9
.L08057FB4:
	ldr r0, .L08057FB8  @ gUnknown_0880D0EA
	b .L08057FE6
	.align 2, 0
.L08057FB8: .4byte gUnknown_0880D0EA
.L08057FBC:
	ldr r0, .L08057FC0  @ gUnknown_0880D12B
	b .L08057FE6
	.align 2, 0
.L08057FC0: .4byte gUnknown_0880D12B
.L08057FC4:
	ldr r0, .L08057FC8  @ gUnknown_0880D16C
	b .L08057FE6
	.align 2, 0
.L08057FC8: .4byte gUnknown_0880D16C
.L08057FCC:
	ldr r0, .L08057FD0  @ gUnknown_0880D1AD
	b .L08057FE6
	.align 2, 0
.L08057FD0: .4byte gUnknown_0880D1AD
.L08057FD4:
	ldr r0, .L08057FD8  @ gUnknown_0880D1EE
	b .L08057FE6
	.align 2, 0
.L08057FD8: .4byte gUnknown_0880D1EE
.L08057FDC:
	ldr r0, .L08057FE0  @ gUnknown_0880D22F
	b .L08057FE6
	.align 2, 0
.L08057FE0: .4byte gUnknown_0880D22F
.L08057FE4:
	ldr r0, .L08057FF4  @ gUnknown_0880CD1B
.L08057FE6:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
.L08057FF4: .4byte gUnknown_0880CD1B

	THUMB_FUNC_END func_08057ED0

	THUMB_FUNC_START GetSpellAnimId
GetSpellAnimId: @ 0x08057FF8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, .L08058014  @ gUnknown_088AFBD8
	ldrh r1, [r3]
	ldr r2, .L08058018  @ 0x0000FFFF
	b .L08058020
	.align 2, 0
.L08058014: .4byte gUnknown_088AFBD8
.L08058018: .4byte 0x0000FFFF
.L0805801C:
	adds r3, #0x10
	ldrh r1, [r3]
.L08058020:
	cmp r1, r2
	beq .L08058028
	cmp r1, r0
	bne .L0805801C
.L08058028:
	ldrh r2, [r3, #4]
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #3
	beq .L08058034
	b .L08058196
.L08058034:
	subs r0, r4, #5
	cmp r0, #0x49
	bls .L0805803C
	b .L08058196
.L0805803C:
	lsls r0, r0, #2
	ldr r1, .L08058048  @ .L0805804C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08058048: .4byte .L0805804C
.L0805804C: @ jump table
	.4byte .L08058174 @ case 0
	.4byte .L08058174 @ case 1
	.4byte .L0805817C @ case 2
	.4byte .L08058180 @ case 3
	.4byte .L08058196 @ case 4
	.4byte .L08058196 @ case 5
	.4byte .L08058194 @ case 6
	.4byte .L08058194 @ case 7
	.4byte .L08058196 @ case 8
	.4byte .L08058196 @ case 9
	.4byte .L08058196 @ case 10
	.4byte .L08058196 @ case 11
	.4byte .L08058196 @ case 12
	.4byte .L08058196 @ case 13
	.4byte .L08058196 @ case 14
	.4byte .L08058196 @ case 15
	.4byte .L08058196 @ case 16
	.4byte .L08058196 @ case 17
	.4byte .L08058196 @ case 18
	.4byte .L08058196 @ case 19
	.4byte .L08058196 @ case 20
	.4byte .L08058196 @ case 21
	.4byte .L08058196 @ case 22
	.4byte .L08058196 @ case 23
	.4byte .L08058196 @ case 24
	.4byte .L08058196 @ case 25
	.4byte .L0805818C @ case 26
	.4byte .L0805818C @ case 27
	.4byte .L08058190 @ case 28
	.4byte .L08058190 @ case 29
	.4byte .L08058196 @ case 30
	.4byte .L08058196 @ case 31
	.4byte .L08058196 @ case 32
	.4byte .L08058196 @ case 33
	.4byte .L08058196 @ case 34
	.4byte .L08058196 @ case 35
	.4byte .L08058196 @ case 36
	.4byte .L08058196 @ case 37
	.4byte .L08058196 @ case 38
	.4byte .L08058196 @ case 39
	.4byte .L08058196 @ case 40
	.4byte .L08058196 @ case 41
	.4byte .L08058196 @ case 42
	.4byte .L08058196 @ case 43
	.4byte .L08058196 @ case 44
	.4byte .L08058196 @ case 45
	.4byte .L08058196 @ case 46
	.4byte .L08058196 @ case 47
	.4byte .L08058196 @ case 48
	.4byte .L08058196 @ case 49
	.4byte .L08058196 @ case 50
	.4byte .L08058196 @ case 51
	.4byte .L08058196 @ case 52
	.4byte .L08058196 @ case 53
	.4byte .L08058196 @ case 54
	.4byte .L08058196 @ case 55
	.4byte .L08058196 @ case 56
	.4byte .L08058196 @ case 57
	.4byte .L08058196 @ case 58
	.4byte .L08058196 @ case 59
	.4byte .L08058196 @ case 60
	.4byte .L08058196 @ case 61
	.4byte .L08058196 @ case 62
	.4byte .L08058196 @ case 63
	.4byte .L08058196 @ case 64
	.4byte .L08058196 @ case 65
	.4byte .L08058196 @ case 66
	.4byte .L08058184 @ case 67
	.4byte .L08058188 @ case 68
	.4byte .L08058196 @ case 69
	.4byte .L08058196 @ case 70
	.4byte .L08058196 @ case 71
	.4byte .L08058196 @ case 72
	.4byte .L08058178 @ case 73
.L08058174:
	movs r2, #4
	b .L08058196
.L08058178:
	movs r2, #5
	b .L08058196
.L0805817C:
	movs r2, #6
	b .L08058196
.L08058180:
	movs r2, #0xd
	b .L08058196
.L08058184:
	movs r2, #7
	b .L08058196
.L08058188:
	movs r2, #8
	b .L08058196
.L0805818C:
	movs r2, #9
	b .L08058196
.L08058190:
	movs r2, #0xa
	b .L08058196
.L08058194:
	movs r2, #0xb
.L08058196:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSpellAnimId

	THUMB_FUNC_START func_080581A0
func_080581A0: @ 0x080581A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080581C6
	movs r0, #0
	strh r0, [r4]
.L080581C6:
	ldr r0, .L080581E8  @ gBattleAnimInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r5
	beq .L080581E0
	cmp r2, #0x54
	blt .L080581E0
	cmp r2, #0x56
	ble .L080581DC
	cmp r2, #0x58
	bne .L080581E0
.L080581DC:
	movs r0, #0
	strh r0, [r4]
.L080581E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080581E8: .4byte gBattleAnimInitialHitSide

	THUMB_FUNC_END func_080581A0

	THUMB_FUNC_START InitBattleAnimHitArrays
InitBattleAnimHitArrays: @ 0x080581EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r7, .L08058244  @ gBattleHitArray
	movs r2, #0
	ldr r4, .L08058248  @ gBattleAnimRoundTypeArray
	ldr r5, .L0805824C  @ gpBattleAnimTAUnits
	ldr r6, .L08058250  @ gBattleAnimSceneLayoutEnum
	ldr r0, .L08058254  @ 0x0000FFFF
	adds r3, r0, #0
	adds r1, r4, #0
.L08058208:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls .L08058208
	movs r2, #0
	ldr r0, .L08058258  @ gBattleAnimHpValueArray
	ldr r1, .L08058254  @ 0x0000FFFF
	adds r3, r1, #0
	adds r1, r0, #4
.L08058220:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls .L08058220
	movs r2, #0
	str r2, [r5, #4]
	str r2, [r5]
	movs r3, #0
	ldrsh r0, [r6, r3]
	cmp r0, #4
	bne .L0805825C
	strh r0, [r4]
	strh r0, [r4, #2]
	b .L08058834
	.align 2, 0
.L08058244: .4byte gBattleHitArray
.L08058248: .4byte gBattleAnimRoundTypeArray
.L0805824C: .4byte gpBattleAnimTAUnits
.L08058250: .4byte gBattleAnimSceneLayoutEnum
.L08058254: .4byte 0x0000FFFF
.L08058258: .4byte gBattleAnimHpValueArray
.L0805825C:
	ldr r0, .L08058270  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08058274
	movs r0, #6
	strh r0, [r4]
	strh r2, [r4, #2]
	b .L08058834
	.align 2, 0
.L08058270: .4byte gBattleStats
.L08058274:
	ldrh r6, [r6]
	str r6, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, .L08058348  @ gpUnitLeft_BattleStruct
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, .L0805834C  @ gpUnitRight_BattleStruct
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0x11
	bne .L0805829C
	cmp r6, #0
	bne .L0805829C
	movs r5, #1
	str r5, [sp, #0x14]
.L0805829C:
	ldr r4, [sp, #8]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIid
	adds r5, r4, #0
	cmp r0, #0x11
	bne .L080582B6
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L080582B6
	movs r1, #1
	str r1, [sp, #0x18]
.L080582B6:
	ldr r4, [sp, #4]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x28
	bne .L080582CE
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne .L080582CE
	movs r3, #1
	str r3, [sp, #0x14]
.L080582CE:
	ldrh r0, [r5]
	bl GetItemIid
	cmp r0, #0x28
	bne .L080582E2
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L080582E2
	movs r1, #1
	str r1, [sp, #0x18]
.L080582E2:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x29
	bne .L080582F6
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne .L080582F6
	movs r3, #1
	str r3, [sp, #0x14]
.L080582F6:
	ldrh r0, [r5]
	bl GetItemIid
	cmp r0, #0x29
	bne .L0805830A
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne .L0805830A
	movs r1, #1
	str r1, [sp, #0x18]
.L0805830A:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x2c
	bne .L0805831E
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne .L0805831E
	movs r3, #1
	str r3, [sp, #0x14]
.L0805831E:
	ldrh r0, [r5]
	bl GetItemIid
	cmp r0, #0x2c
	bne .L08058332
	ldr r5, [sp, #0x18]
	cmp r5, #0
	bne .L08058332
	movs r0, #1
	str r0, [sp, #0x18]
.L08058332:
	ldr r3, .L08058350  @ gBattleAnimHpValueArray
	ldr r1, .L08058354  @ gBattleHpDisplayedValue
	ldrh r0, [r1]
	strh r0, [r3]
	ldrh r0, [r1, #2]
	strh r0, [r3, #2]
	movs r1, #0
	str r1, [sp, #0xc]
	mov sl, r1
	mov r9, r1
	b .L08058824
	.align 2, 0
.L08058348: .4byte gpUnitLeft_BattleStruct
.L0805834C: .4byte gpUnitRight_BattleStruct
.L08058350: .4byte gBattleAnimHpValueArray
.L08058354: .4byte gBattleHpDisplayedValue
.L08058358:
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	movs r1, #8
	ands r0, r1
	negs r0, r0
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, .L08058390  @ gBattleAnimBoolIsActorOnTheRight
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, [sp, #0x10]
	cmp r0, r3
	bne .L08058398
	mov r5, sp
	movs r0, #2
	add r0, sp
	mov r8, r0
	ldr r4, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r6, [sp, #4]
	movs r3, #0
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne .L080583B4
	ldr r0, .L08058394  @ gBattleAnimInitialHitSide
	strh r2, [r0]
	b .L080583B4
	.align 2, 0
.L08058390: .4byte gBattleAnimBoolIsActorOnTheRight
.L08058394: .4byte gBattleAnimInitialHitSide
.L08058398:
	mov r5, sp
	adds r5, #2
	mov r8, sp
	ldr r4, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #8]
	movs r3, #0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne .L080583B4
	ldr r1, .L080583F0  @ gBattleAnimInitialHitSide
	movs r0, #1
	strh r0, [r1]
.L080583B4:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq .L080583D0
	ldr r2, .L080583F4  @ gpBattleAnimTAUnits
	ldr r1, .L080583F8  @ gBattleStats
	ldr r0, [r1, #0x10]
	str r0, [r2]
	ldr r0, [r1, #0x14]
	str r0, [r2, #4]
.L080583D0:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08058408
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08058400
	ldr r0, .L080583FC  @ gUnknown_080DAEA0
	b .L08058482
	.align 2, 0
.L080583F0: .4byte gBattleAnimInitialHitSide
.L080583F4: .4byte gpBattleAnimTAUnits
.L080583F8: .4byte gBattleStats
.L080583FC: .4byte gUnknown_080DAEA0
.L08058400:
	ldr r0, .L08058404  @ gUnknown_080DAEC8
	b .L08058482
	.align 2, 0
.L08058404: .4byte gUnknown_080DAEC8
.L08058408:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	beq .L08058430
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08058428
	ldr r0, .L08058424  @ gUnknown_080DAEA0
	b .L08058482
	.align 2, 0
.L08058424: .4byte gUnknown_080DAEA0
.L08058428:
	ldr r0, .L0805842C  @ gUnknown_080DAEC8
	b .L08058482
	.align 2, 0
.L0805842C: .4byte gUnknown_080DAEC8
.L08058430:
	lsls r0, r3, #0x10
	cmp r0, #0
	blt .L08058454
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0805844C
	ldr r0, .L08058448  @ gUnknown_080DAE8C
	b .L08058482
	.align 2, 0
.L08058448: .4byte gUnknown_080DAE8C
.L0805844C:
	ldr r0, .L08058450  @ gUnknown_080DAEBE
	b .L08058482
	.align 2, 0
.L08058450: .4byte gUnknown_080DAEBE
.L08058454:
	movs r0, #2
	bl AestheticRandNext_N1
	cmp r0, #1
	beq .L08058478
	cmp r0, #1
	bgt .L08058468
	cmp r0, #0
	beq .L0805846E
	b .L0805848C
.L08058468:
	cmp r0, #2
	beq .L08058480
	b .L0805848C
.L0805846E:
	ldr r0, .L08058474  @ gUnknown_080DAED2
	b .L08058482
	.align 2, 0
.L08058474: .4byte gUnknown_080DAED2
.L08058478:
	ldr r0, .L0805847C  @ gUnknown_080DAEDC
	b .L08058482
	.align 2, 0
.L0805847C: .4byte gUnknown_080DAEDC
.L08058480:
	ldr r0, .L080584AC  @ gUnknown_080DAEE6
.L08058482:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
.L0805848C:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L080584DC
	adds r0, r6, #0
	bl UnitKnowsMagic
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080584B4
	ldr r0, .L080584B0  @ gUnknown_080DAE96
	b .L080584B6
	.align 2, 0
.L080584AC: .4byte gUnknown_080DAEE6
.L080584B0: .4byte gUnknown_080DAE96
.L080584B4:
	ldr r0, .L080584D4  @ gUnknown_080DAEBE
.L080584B6:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
	ldr r0, .L080584D8  @ gUnknown_080DAEAA
	ldr r2, [sp, #0x1c]
	lsls r1, r2, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r3, r8
	strh r0, [r3]
	b .L080584EC
	.align 2, 0
.L080584D4: .4byte gUnknown_080DAEBE
.L080584D8: .4byte gUnknown_080DAEAA
.L080584DC:
	ldr r0, .L08058560  @ gUnknown_080DAEB4
	ldr r5, [sp, #0x1c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r1, r8
	strh r0, [r1]
.L080584EC:
	ldr r1, .L08058564  @ gBattleAnimRoundTypeArray
	ldr r2, [sp, #0xc]
	lsls r0, r2, #2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	movs r6, #0
	strh r0, [r5]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r4, r0, r1
	mov r3, sp
	ldrh r0, [r3, #2]
	strh r0, [r4]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0805851A
	b .L0805881C
.L0805851A:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L080585B4
	ldr r0, .L08058568  @ gBattleAnimBoolIsActorOnTheRight
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne .L08058574
	mov r3, r9
	lsls r0, r3, #1
	bl GetBattleAnimHpValue
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L08058546
	movs r2, #0
.L08058546:
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r0, #2
	ldr r1, .L0805856C  @ gBattleAnimHpValueArray
	adds r0, r0, r1
	strh r2, [r0]
	ldrh r0, [r5]
	ldr r2, .L08058570  @ 0xFFFF8000
	adds r1, r2, #0
	b .L0805875E
	.align 2, 0
.L08058560: .4byte gUnknown_080DAEB4
.L08058564: .4byte gBattleAnimRoundTypeArray
.L08058568: .4byte gBattleAnimBoolIsActorOnTheRight
.L0805856C: .4byte gBattleAnimHpValueArray
.L08058570: .4byte 0xFFFF8000
.L08058574:
	mov r3, sl
	lsls r0, r3, #1
	adds r0, #1
	bl GetBattleAnimHpValue
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0805858E
	movs r2, #0
.L0805858E:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r5, .L080585AC  @ gBattleAnimHpValueArray
	adds r0, r0, r5
	strh r2, [r0]
	ldrh r0, [r4]
	ldr r2, .L080585B0  @ 0xFFFF8000
	b .L08058816
	.align 2, 0
.L080585AC: .4byte gBattleAnimHpValueArray
.L080585B0: .4byte 0xFFFF8000
.L080585B4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	cmp r1, #0
	beq .L080586A0
	ldr r0, .L08058628  @ gBattleAnimBoolIsActorOnTheRight
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r5, [sp, #0x10]
	cmp r0, r5
	bne .L08058634
	mov r1, sl
	lsls r0, r1, #1
	adds r0, #1
	bl GetBattleAnimHpValue
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L080585E4
	movs r2, #0
.L080585E4:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r4, .L0805862C  @ gBattleAnimHpValueArray
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r2, [r0]
	mov r2, r9
	lsls r0, r2, #1
	bl GetBattleAnimHpValue
	movs r1, #3
	ldrsb r1, [r7, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, .L08058630  @ gUnknown_0203E1B0
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	ble .L0805861A
	ldrh r2, [r3]
.L0805861A:
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r0, #2
	b .L08058690
	.align 2, 0
.L08058628: .4byte gBattleAnimBoolIsActorOnTheRight
.L0805862C: .4byte gBattleAnimHpValueArray
.L08058630: .4byte gUnknown_0203E1B0
.L08058634:
	mov r1, r9
	lsls r0, r1, #1
	bl GetBattleAnimHpValue
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0805864C
	movs r2, #0
.L0805864C:
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	ldr r4, .L08058698  @ gBattleAnimHpValueArray
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0]
	mov r2, sl
	lsls r0, r2, #1
	adds r0, #1
	bl GetBattleAnimHpValue
	movs r1, #3
	ldrsb r1, [r7, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, .L0805869C  @ gUnknown_0203E1B0
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #2
	ldrsh r1, [r3, r5]
	cmp r0, r1
	ble .L08058680
	ldrh r2, [r3, #2]
.L08058680:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
.L08058690:
	adds r0, r0, r4
	strh r2, [r0]
	b .L0805881C
	.align 2, 0
.L08058698: .4byte gBattleAnimHpValueArray
.L0805869C: .4byte gUnknown_0203E1B0
.L080586A0:
	ldr r0, .L08058764  @ gBattleAnimBoolIsActorOnTheRight
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne .L0805876C
	mov r3, sl
	lsls r0, r3, #1
	adds r0, #1
	bl GetBattleAnimHpValue
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L080586C6
	movs r2, #0
.L080586C6:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, .L08058768  @ gBattleAnimHpValueArray
	adds r0, r0, r1
	strh r2, [r0]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080586F6
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
.L080586F6:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq .L08058712
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
.L08058712:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq .L0805872A
	ldrh r1, [r5]
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
.L0805872A:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq .L08058746
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
.L08058746:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq .L0805881C
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
.L0805875E:
	orrs r0, r1
	strh r0, [r5]
	b .L0805881C
	.align 2, 0
.L08058764: .4byte gBattleAnimBoolIsActorOnTheRight
.L08058768: .4byte gBattleAnimHpValueArray
.L0805876C:
	mov r1, r9
	lsls r0, r1, #1
	bl GetBattleAnimHpValue
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L08058784
	movs r2, #0
.L08058784:
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r0, #2
	ldr r3, .L08058844  @ gBattleAnimHpValueArray
	adds r0, r0, r3
	strh r2, [r0]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080587B0
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
.L080587B0:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq .L080587CC
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4]
.L080587CC:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq .L080587E4
	ldrh r1, [r4]
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
.L080587E4:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq .L08058800
	ldrh r0, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4]
.L08058800:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq .L0805881C
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
.L08058816:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
.L0805881C:
	adds r7, #4
	ldr r3, [sp, #0xc]
	adds r3, #1
	str r3, [sp, #0xc]
.L08058824:
	ldr r2, [r7]
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne .L08058834
	b .L08058358
.L08058834:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08058844: .4byte gBattleAnimHpValueArray

	THUMB_FUNC_END InitBattleAnimHitArrays

	THUMB_FUNC_START GetBattleAnimationId
GetBattleAnimationId: @ 0x08058848
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r1, #0
	mov r9, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq .L0805887C
	mov r0, r8
	bl GetItemKind
	cmp r0, #9
	bne .L08058884
	mov r0, r8
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08058884
.L0805887C:
	ldr r0, .L08058880  @ 0x0000FFFF
	b .L08058908
	.align 2, 0
.L08058880: .4byte 0x0000FFFF
.L08058884:
	mov r1, r8
	cmp r1, #0
	bne .L0805888E
	movs r2, #9
	b .L08058898
.L0805888E:
	mov r0, r8
	bl GetItemKind
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
.L08058898:
	str r4, [sp]
	movs r0, #0
	mov r3, r9
	str r0, [r3]
	movs r7, #0
	movs r1, #0
.L080588A4:
	ldr r5, [sp]
	movs r6, #0
	b .L080588F0
.L080588AA:
	cmp r7, #0
	bne .L080588B2
	cmp r0, #0xff
	bhi .L080588EC
.L080588B2:
	cmp r7, #1
	bne .L080588BC
	ldrh r0, [r5]
	cmp r0, #0xff
	bls .L080588EC
.L080588BC:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r2, [sp, #8]
	bl GetItemIid
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	cmp r4, r0
	beq .L080588DA
	ldrh r0, [r5]
	ldr r3, .L080588E8  @ 0xFFFFFF00
	adds r0, r0, r3
	cmp r0, r2
	bne .L080588EC
.L080588DA:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, r9
	str r6, [r0]
	movs r1, #1
	b .L080588F6
	.align 2, 0
.L080588E8: .4byte 0xFFFFFF00
.L080588EC:
	adds r5, #4
	adds r6, #1
.L080588F0:
	ldrh r0, [r5]
	cmp r0, #0
	bne .L080588AA
.L080588F6:
	cmp r1, #1
	beq .L08058900
	adds r7, #1
	cmp r7, #1
	ble .L080588A4
.L08058900:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
.L08058908:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBattleAnimationId

	THUMB_FUNC_START func_08058918
func_08058918: @ 0x08058918
	push {lr}
	ldr r0, .L08058930  @ gBattleHitArray
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L08058934
	movs r0, #0
	b .L08058936
	.align 2, 0
.L08058930: .4byte gBattleHitArray
.L08058934:
	movs r0, #1
.L08058936:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08058918

	THUMB_FUNC_START func_0805893C
func_0805893C: @ 0x0805893C
	ldr r3, .L0805895C  @ gUnknown_030018F0
	ldr r2, [r0]
	ldr r1, [r0, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x23
	adds r2, r2, r0
	ldrb r0, [r2]
	strh r0, [r3]
	subs r0, #1
	bx lr
	.align 2, 0
.L0805895C: .4byte gUnknown_030018F0

	THUMB_FUNC_END func_0805893C

	THUMB_FUNC_START SomethingFilterBattleAnimId
SomethingFilterBattleAnimId: @ 0x08058960
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9e
	beq .L0805897A
	cmp r0, #0x9e
	blt .L080589AC
	cmp r0, #0xcb
	bgt .L080589AC
	cmp r0, #0xc9
	blt .L080589AC
.L0805897A:
	adds r0, r1, #0
	bl GetItemIid
	cmp r0, #0x36
	beq .L0805899C
	cmp r0, #0x36
	bgt .L0805898E
	cmp r0, #0x35
	beq .L08058994
	b .L080589AC
.L0805898E:
	cmp r0, #0x37
	beq .L080589A4
	b .L080589AC
.L08058994:
	ldr r0, .L08058998  @ gUnknown_085BA300
	b .L080589AE
	.align 2, 0
.L08058998: .4byte gUnknown_085BA300
.L0805899C:
	ldr r0, .L080589A0  @ gUnknown_085BA2E0
	b .L080589AE
	.align 2, 0
.L080589A0: .4byte gUnknown_085BA2E0
.L080589A4:
	ldr r0, .L080589A8  @ gUnknown_085BA320
	b .L080589AE
	.align 2, 0
.L080589A8: .4byte gUnknown_085BA320
.L080589AC:
	movs r0, #0
.L080589AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END SomethingFilterBattleAnimId

	THUMB_FUNC_START GetAllegienceId
GetAllegienceId: @ 0x080589B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x40
	beq .L080589D2
	cmp r0, #0x40
	ble .L080589DA
	cmp r1, #0x80
	beq .L080589CE
	cmp r1, #0xc0
	beq .L080589D6
	b .L080589DA
.L080589CE:
	movs r0, #1
	b .L080589DC
.L080589D2:
	movs r0, #2
	b .L080589DC
.L080589D6:
	movs r0, #3
	b .L080589DC
.L080589DA:
	movs r0, #0
.L080589DC:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAllegienceId

	THUMB_FUNC_START func_080589E0
func_080589E0: @ 0x080589E0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl GetAISSubjectId
	ldr r1, .L08058A08  @ gBattleAnimAnimationIndex
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	bl func_080599E8
	adds r0, r5, #0
	movs r1, #6
	bl SwitchAISFrameDataFromBARoundType
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08058A08: .4byte gBattleAnimAnimationIndex

	THUMB_FUNC_END func_080589E0

	THUMB_FUNC_START GetBattleAnimHitType
GetBattleAnimHitType: @ 0x08058A0C
	push {lr}
	ldr r1, .L08058A28  @ gBattleAnimRoundTypeArray
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L08058A2C
	movs r0, #0xff
	ands r0, r2
	b .L08058A2E
	.align 2, 0
.L08058A28: .4byte gBattleAnimRoundTypeArray
.L08058A2C:
	adds r0, r1, #0
.L08058A2E:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBattleAnimHitType

	THUMB_FUNC_START GetBattleAnimHitFlags
GetBattleAnimHitFlags: @ 0x08058A34
	push {lr}
	ldr r1, .L08058A54  @ gBattleAnimRoundTypeArray
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L08058A58
	subs r0, #0xff
	ands r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b .L08058A5A
	.align 2, 0
.L08058A54: .4byte gBattleAnimRoundTypeArray
.L08058A58:
	movs r0, #0
.L08058A5A:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBattleAnimHitFlags

	THUMB_FUNC_START GetBattleAnimHpValue
GetBattleAnimHpValue: @ 0x08058A60
	ldr r1, .L08058A6C  @ gBattleAnimHpValueArray
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
.L08058A6C: .4byte gBattleAnimHpValueArray

	THUMB_FUNC_END GetBattleAnimHpValue

	THUMB_FUNC_START func_08058A70
func_08058A70: @ 0x08058A70
	ldr r1, .L08058A84  @ gBattleAnimHpValueArray
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, .L08058A88  @ 0xFFFFFF00
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bx lr
	.align 2, 0
.L08058A84: .4byte gBattleAnimHpValueArray
.L08058A88: .4byte 0xFFFFFF00

	THUMB_FUNC_END func_08058A70

	THUMB_FUNC_START IsItemDisplayedInBattle
IsItemDisplayedInBattle: @ 0x08058A8C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x7d
	beq .L08058AC0
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x7e
	beq .L08058AC0
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x7f
	beq .L08058AC0
	adds r0, r5, #0
	bl GetItemIid
	cmp r0, #0x80
	beq .L08058AC0
	movs r0, #0
	b .L08058AC2
.L08058AC0:
	movs r0, #1
.L08058AC2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsItemDisplayedInBattle

	THUMB_FUNC_START func_08058AC8
func_08058AC8: @ 0x08058AC8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	cmp r0, #0x87
	beq .L08058AFE
	cmp r0, #0x87
	bgt .L08058AEE
	cmp r0, #0x4a
	beq .L08058AFE
	cmp r0, #0x4a
	bgt .L08058AE8
	cmp r0, #0x3e
	beq .L08058AFE
	b .L08058B02
.L08058AE8:
	cmp r0, #0x85
	beq .L08058AFE
	b .L08058B02
.L08058AEE:
	cmp r0, #0x8e
	beq .L08058AFE
	cmp r0, #0x8e
	blt .L08058B02
	cmp r0, #0x94
	bgt .L08058B02
	cmp r0, #0x91
	blt .L08058B02
.L08058AFE:
	movs r0, #1
	b .L08058B04
.L08058B02:
	movs r0, #0
.L08058B04:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08058AC8

	THUMB_FUNC_START IsHolyRenaisTwinWeapon
IsHolyRenaisTwinWeapon: @ 0x08058B08
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIid
	cmp r0, #0x85
	beq .L08058B1A
	cmp r0, #0x92
	bne .L08058B1E
.L08058B1A:
	movs r0, #1
	b .L08058B20
.L08058B1E:
	movs r0, #0
.L08058B20:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsHolyRenaisTwinWeapon

	THUMB_FUNC_START DoesBattleAnimSideTakeAction
DoesBattleAnimSideTakeAction: @ 0x08058B24
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bgt .L08058B5C
	ldr r1, .L08058B50  @ gBattleAnimRoundTypeArray
	lsls r0, r2, #1
	adds r0, r0, r1
.L08058B34:
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	beq .L08058B4C
	cmp r1, #1
	beq .L08058B4C
	cmp r1, #2
	beq .L08058B4C
	cmp r1, #3
	beq .L08058B4C
	cmp r1, #9
	bne .L08058B54
.L08058B4C:
	movs r0, #1
	b .L08058B5E
	.align 2, 0
.L08058B50: .4byte gBattleAnimRoundTypeArray
.L08058B54:
	adds r0, #4
	adds r2, #2
	cmp r2, #0x13
	ble .L08058B34
.L08058B5C:
	movs r0, #0
.L08058B5E:
	pop {r1}
	bx r1

	THUMB_FUNC_END DoesBattleAnimSideTakeAction

	THUMB_FUNC_START func_08058B64
func_08058B64: @ 0x08058B64
	ldr r1, .L08058B6C  @ gBoolBattleIsScripted_maybe
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08058B6C: .4byte gBoolBattleIsScripted_maybe

	THUMB_FUNC_END func_08058B64

	THUMB_FUNC_START func_08058B70
func_08058B70: @ 0x08058B70
	ldr r1, .L08058B78  @ gBoolBattleIsScripted_maybe
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
.L08058B78: .4byte gBoolBattleIsScripted_maybe

	THUMB_FUNC_END func_08058B70

	THUMB_FUNC_START func_08058B7C
func_08058B7C: @ 0x08058B7C
	push {lr}
	ldr r0, .L08058B8C  @ gBoolBattleIsScripted_maybe
	ldr r0, [r0]
	cmp r0, #0
	beq .L08058B90
	movs r0, #1
	b .L08058B92
	.align 2, 0
.L08058B8C: .4byte gBoolBattleIsScripted_maybe
.L08058B90:
	movs r0, #0
.L08058B92:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08058B7C

	THUMB_FUNC_START func_08058B98
func_08058B98: @ 0x08058B98
	ldr r1, .L08058BA4  @ gUnknown_0203E1B8
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
.L08058BA4: .4byte gUnknown_0203E1B8

	THUMB_FUNC_END func_08058B98

	THUMB_FUNC_START func_08058BA8
func_08058BA8: @ 0x08058BA8
	ldr r1, .L08058BB4  @ gUnknown_0203E1BC
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
.L08058BB4: .4byte gUnknown_0203E1BC

	THUMB_FUNC_END func_08058BA8

	THUMB_FUNC_START func_08058BB8
func_08058BB8: @ 0x08058BB8
	ldr r1, .L08058BC4  @ gUnknown_0203E1C0
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
.L08058BC4: .4byte gUnknown_0203E1C0

	THUMB_FUNC_END func_08058BB8

	THUMB_FUNC_START BattleAIS_ExecCommands
BattleAIS_ExecCommands: @ 0x08058BC8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r2, #0

	THUMB_FUNC_END BattleAIS_ExecCommands

	THUMB_FUNC_START func_08058BD4
func_08058BD4: @ 0x08058BD4
	ldr r0, .L08058C38  @ gBattleAnimCurrentAISIndex
	str r2, [r0]
	ldr r1, .L08058C3C  @ gUnknown_02000000
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r7, [r0]
	adds r2, #1
	mov r9, r2
	cmp r7, #0
	bne .L08058BEC
	bl .L080598AE
.L08058BEC:
	ldrh r0, [r7, #0xc]
	movs r1, #0xf0
	lsls r1, r1, #8
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	cmp r2, #0
	bne .L08058C02
	bl .L080598AE
.L08058C02:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	bne .L08058C10
	bl func_080596E0
.L08058C10:
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	bne .L08058C1A
	bl .L080596D6
.L08058C1A:
	subs r1, r0, #1
	adds r2, r7, #0
	adds r2, #0x15
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0x7b
	bls .L08058C2E
	bl .L080596CC
.L08058C2E:
	lsls r0, r1, #2
	ldr r1, .L08058C40  @ .L08058C44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08058C38: .4byte gBattleAnimCurrentAISIndex
.L08058C3C: .4byte gUnknown_02000000
.L08058C40: .4byte .L08058C44
.L08058C44: @ jump table
	.4byte .L080596CC @ case 0
	.4byte .L08058E34 @ case 1
	.4byte .L08058E98 @ case 2
	.4byte .L08058EB0 @ case 3
	.4byte .L08058F30 @ case 4
	.4byte .L08058FB4 @ case 5
	.4byte .L08059018 @ case 6
	.4byte .L08059048 @ case 7
	.4byte .L08059158 @ case 8
	.4byte .L08059158 @ case 9
	.4byte .L08059158 @ case 10
	.4byte .L08059158 @ case 11
	.4byte .L08059158 @ case 12
	.4byte .L080591F2 @ case 13
	.4byte .L080596CC @ case 14
	.4byte .L080596CC @ case 15
	.4byte .L080596CC @ case 16
	.4byte .L080596CC @ case 17
	.4byte .L080596CC @ case 18
	.4byte .L080593A0 @ case 19
	.4byte .L080593D0 @ case 20
	.4byte .L080593E4 @ case 21
	.4byte .L080596CC @ case 22
	.4byte .L080596CC @ case 23
	.4byte .L080593F8 @ case 24
	.4byte .L08059698 @ case 25
	.4byte .L0805942C @ case 26
	.4byte .L08059698 @ case 27
	.4byte .L08059698 @ case 28
	.4byte .L08059698 @ case 29
	.4byte .L08059698 @ case 30
	.4byte .L08059698 @ case 31
	.4byte .L08059698 @ case 32
	.4byte .L08059698 @ case 33
	.4byte .L08059698 @ case 34
	.4byte .L08059698 @ case 35
	.4byte .L08059698 @ case 36
	.4byte .L08059698 @ case 37
	.4byte .L080594AC @ case 38
	.4byte .L080594C2 @ case 39
	.4byte .L08059698 @ case 40
	.4byte .L08059698 @ case 41
	.4byte .L08059698 @ case 42
	.4byte .L08059698 @ case 43
	.4byte .L080594D8 @ case 44
	.4byte .L080594EC @ case 45
	.4byte .L08059536 @ case 46
	.4byte .L0805954C @ case 47
	.4byte .L08059562 @ case 48
	.4byte .L08059578 @ case 49
	.4byte .L0805958E @ case 50
	.4byte .L08059698 @ case 51
	.4byte .L08059698 @ case 52
	.4byte .L08059698 @ case 53
	.4byte .L08059698 @ case 54
	.4byte .L08059698 @ case 55
	.4byte .L08059698 @ case 56
	.4byte .L080595A4 @ case 57
	.4byte .L08059698 @ case 58
	.4byte .L080596CC @ case 59
	.4byte .L08059698 @ case 60
	.4byte .L080595CA @ case 61
	.4byte .L08059698 @ case 62
	.4byte .L08059698 @ case 63
	.4byte .L08059698 @ case 64
	.4byte .L08059698 @ case 65
	.4byte .L08059698 @ case 66
	.4byte .L08059698 @ case 67
	.4byte .L08059698 @ case 68
	.4byte .L08059698 @ case 69
	.4byte .L08059698 @ case 70
	.4byte .L080595FC @ case 71
	.4byte .L08059698 @ case 72
	.4byte .L08059698 @ case 73
	.4byte .L08059698 @ case 74
	.4byte .L08059698 @ case 75
	.4byte .L08059698 @ case 76
	.4byte .L08059698 @ case 77
	.4byte .L08059604 @ case 78
	.4byte .L08059698 @ case 79
	.4byte .L080596CC @ case 80
	.4byte .L0805960C @ case 81
	.4byte .L08059630 @ case 82
	.4byte .L080596CC @ case 83
	.4byte .L080596CC @ case 84
	.4byte .L080596CC @ case 85
	.4byte .L08059698 @ case 86
	.4byte .L08059698 @ case 87
	.4byte .L08059698 @ case 88
	.4byte .L08059698 @ case 89
	.4byte .L08059698 @ case 90
	.4byte .L08059698 @ case 91
	.4byte .L08059698 @ case 92
	.4byte .L08059698 @ case 93
	.4byte .L08059698 @ case 94
	.4byte .L08059698 @ case 95
	.4byte .L08059698 @ case 96
	.4byte .L08059698 @ case 97
	.4byte .L08059698 @ case 98
	.4byte .L08059698 @ case 99
	.4byte .L08059698 @ case 100
	.4byte .L08059698 @ case 101
	.4byte .L08059698 @ case 102
	.4byte .L08059698 @ case 103
	.4byte .L08059698 @ case 104
	.4byte .L080596CC @ case 105
	.4byte .L08059698 @ case 106
	.4byte .L08059698 @ case 107
	.4byte .L08059698 @ case 108
	.4byte .L08059698 @ case 109
	.4byte .L08059698 @ case 110
	.4byte .L08059698 @ case 111
	.4byte .L08059698 @ case 112
	.4byte .L080596A6 @ case 113
	.4byte .L080596BA @ case 114
	.4byte .L08059698 @ case 115
	.4byte .L08059698 @ case 116
	.4byte .L08059698 @ case 117
	.4byte .L08059698 @ case 118
	.4byte .L08059698 @ case 119
	.4byte .L08059698 @ case 120
	.4byte .L08059698 @ case 121
	.4byte .L08059698 @ case 122
	.4byte .L08059698 @ case 123
.L08058E34:
	ldr r0, .L08058E44  @ gUnknown_02000024
	ldr r0, [r0]
	cmp r0, #1
	bne .L08058E48
	ldr r0, [r7, #0x24]
	str r0, [r7, #0x20]
	bl .L080596CC
	.align 2, 0
.L08058E44: .4byte gUnknown_02000024
.L08058E48:
	ldrh r1, [r7, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08058E56
	bl .L08059686
.L08058E56:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne .L08058E62
	bl .L080596CC
.L08058E62:
	bl func_080522CC
	cmp r0, #1
	beq .L08058E6E
	bl .L080596CC
.L08058E6E:
	ldrh r1, [r7, #0x10]
	ldr r0, .L08058E94  @ 0x0000FFF2
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	bl func_08055A28
	cmp r0, #0
	bne .L08058E88
	bl .L080596CC
.L08058E88:
	movs r0, #0
	bl func_08055A34
	bl .L080596CC
	.align 2, 0
.L08058E94: .4byte 0x0000FFF2
.L08058E98:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08058EA6
	bl .L080596CC
.L08058EA6:
	ldr r0, .L08058EAC  @ 0x0000FFFE
	b .L08059682
	.align 2, 0
.L08058EAC: .4byte 0x0000FFFE
.L08058EB0:
	ldr r4, .L08058F2C  @ gUnknown_02000000
	ldr r0, [r4]
	bl func_08054BD4
	movs r5, #0xc
	ands r0, r5
	cmp r0, #0
	beq .L08058EC8
	ldr r0, [r4]
	movs r1, #0
	bl func_08054BA4
.L08058EC8:
	ldr r0, [r4, #4]
	bl func_08054BD4
	ands r0, r5
	cmp r0, #0
	beq .L08058EDC
	ldr r0, [r4, #4]
	movs r1, #0
	bl func_08054BA4
.L08058EDC:
	ldr r0, [r4, #8]
	bl func_08054BD4
	ands r0, r5
	cmp r0, #0
	beq .L08058EF0
	ldr r0, [r4, #8]
	movs r1, #0
	bl func_08054BA4
.L08058EF0:
	ldr r0, [r4, #0xc]
	bl func_08054BD4
	ands r0, r5
	cmp r0, #0
	beq .L08058F04
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl func_08054BA4
.L08058F04:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08058F26
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L08058F26
	adds r0, r7, #0
	bl func_0806D8D0
.L08058F26:
	ldrh r1, [r7, #0x10]
	b .L08059674
	.align 2, 0
.L08058F2C: .4byte gUnknown_02000000
.L08058F30:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08058F46
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
.L08058F46:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L08058F52
	b .L080596CC
.L08058F52:
	ldr r1, .L08058FAC  @ 0x0000FFDF
	ands r1, r2
	ldr r0, .L08058FB0  @ 0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r5, #9
	movs r6, #0
	orrs r1, r5
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetOpponentFrontAIS
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r4, r8
	adds r0, r4, #0
	bl IsBatteRoundTypeAMiss
	ldr r2, [sp]
	cmp r0, #1
	beq .L08058F8E
	b .L080596CC
.L08058F8E:
	cmp r2, #0
	bne .L08058F94
	b .L080596CC
.L08058F94:
	ldrh r0, [r2, #0x10]
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISLayerId
	cmp r0, #0
	beq .L08058FA8
	b .L080596CC
.L08058FA8:
	adds r0, r4, #0
	b .L080591E2
	.align 2, 0
.L08058FAC: .4byte 0x0000FFDF
.L08058FB0: .4byte 0x0000FFBF
.L08058FB4:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08058FCA
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
.L08058FCA:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L08058FD6
	b .L080596CC
.L08058FD6:
	ldr r1, .L08059010  @ 0x0000FFDF
	ands r1, r2
	ldr r0, .L08059014  @ 0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r0, #9
	orrs r1, r0
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L08058FF6
	b .L080596CC
.L08058FF6:
	adds r0, r7, #0
	bl StartSpellAnimation
	bl func_08055A28
	cmp r0, #0
	bne .L08059006
	b .L080596CC
.L08059006:
	movs r0, #2
	bl func_08055A34
	b .L080596CC
	.align 2, 0
.L08059010: .4byte 0x0000FFDF
.L08059014: .4byte 0x0000FFBF
.L08059018:
	adds r0, r7, #0
	bl GetOpponentFrontAIS
	adds r2, r0, #0
	cmp r2, #0
	bne .L08059026
	b .L080596CC
.L08059026:
	str r2, [sp]
	bl func_0805A334
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	negs r0, r0
	ldr r2, [sp]
	cmp r8, r0
	bne .L0805903E
	b .L080596CC
.L0805903E:
	ldrh r1, [r2, #0x10]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2, #0x10]
	b .L080596CC
.L08059048:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #4
	ands r1, r0
	cmp r1, #0
	beq .L0805908C
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L08059074
	b .L08059674
.L08059074:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L08059140
	adds r0, r7, #0
	bl func_0806E310
	b .L08059140
.L0805908C:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq .L080590D2
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L080590B8
	b .L08059674
.L080590B8:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L08059140
	adds r0, r7, #0
	movs r1, #1
	bl func_0806E58C
	b .L08059140
.L080590D2:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq .L08059140
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r5, #0x20
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq .L08059100
	b .L08059674
.L08059100:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L08059140
	adds r0, r7, #0
	bl func_0806E310
	ldr r4, .L08059150  @ gUnknown_02000000
	ldr r1, [r4, #8]
	ldrh r2, [r1, #0x10]
	adds r0, r5, #0
	ands r0, r2
	strh r0, [r1, #0x10]
	ldr r1, [r4, #8]
	ldrh r3, [r1]
	ldr r2, .L08059154  @ 0x0000FFF7
	adds r0, r2, #0
	ands r0, r3
	strh r0, [r1]
	ldr r1, [r4, #0xc]
	ldrh r3, [r1, #0x10]
	adds r0, r5, #0
	ands r0, r3
	strh r0, [r1, #0x10]
	ldr r0, [r4, #0xc]
	ldrh r1, [r0]
	ands r2, r1
	strh r2, [r0]
.L08059140:
	ldrh r1, [r7, #0x10]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L0805914C
	b .L080596CC
.L0805914C:
	b .L08059674
	.align 2, 0
.L08059150: .4byte gUnknown_02000000
.L08059154: .4byte 0x0000FFF7
.L08059158:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L08059164
	b .L080596CC
.L08059164:
	adds r0, r7, #0
	bl GetOpponentFrontAIS
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl IsBatteRoundTypeAMiss
	ldr r2, [sp]
	cmp r0, #0
	bne .L080591C6
	adds r0, r2, #0
	bl func_08072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r0, #2
	beq .L080591C6
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq .L080591BC
	adds r0, r2, #0
	bl StartEfxChillEffect
	b .L080591C4
.L080591BC:
	adds r0, r2, #0
	str r2, [sp]
	bl StartEfxCriticalEffect
.L080591C4:
	ldr r2, [sp]
.L080591C6:
	cmp r2, #0
	bne .L080591CC
	b .L080596CC
.L080591CC:
	ldrh r1, [r2, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
.L080591E2:
	bl IsBatteRoundTypeAMiss
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl StartBattleAnimHitEffectsDefault
	b .L080596CC
.L080591F2:
	adds r0, r7, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r4, .L08059234  @ gUnknown_02000000
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r6, [r0]
	ldrb r0, [r7, #0x12]
	ldr r2, [sp]
	cmp r0, #9
	bls .L08059228
	b .L080596CC
.L08059228:
	lsls r0, r0, #2
	ldr r1, .L08059238  @ .L0805923C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08059234: .4byte gUnknown_02000000
.L08059238: .4byte .L0805923C
.L0805923C: @ jump table
	.4byte .L08059264 @ case 0
	.4byte .L08059264 @ case 1
	.4byte .L08059264 @ case 2
	.4byte .L08059264 @ case 3
	.4byte .L08059368 @ case 4
	.4byte .L08059368 @ case 5
	.4byte .L08059376 @ case 6
	.4byte .L08059376 @ case 7
	.4byte .L08059376 @ case 8
	.4byte .L08059264 @ case 9
.L08059264:
	movs r0, #1
	negs r0, r0
	cmp r8, r0
	bne .L0805926E
	b .L08059368
.L0805926E:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
	ldrh r0, [r2, #0x10]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r6, #0x10]
	orrs r1, r0
	strh r1, [r6, #0x10]
	ldr r1, .L080592C4  @ gUnknown_080DAF18
	ldr r0, .L080592C8  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, .L080592CC  @ gUnknown_080DAEF0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	ldr r2, [sp]
	cmp r0, #0
	bne .L080592D4
	ldr r0, .L080592D0  @ gUnknown_0200005C
	b .L080592D6
	.align 2, 0
.L080592C4: .4byte gUnknown_080DAF18
.L080592C8: .4byte gBattleAnimSceneLayoutEnum
.L080592CC: .4byte gUnknown_080DAEF0
.L080592D0: .4byte gUnknown_0200005C
.L080592D4:
	ldr r0, .L08059354  @ gUnknown_02000060
.L080592D6:
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #9
	ldr r0, .L08059358  @ gUnknown_0200F1C8
	adds r1, r1, r0
	adds r1, r4, r1
	ldr r0, [r1, #4]
	ldr r2, [sp]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r6, #0x30]
	ldr r0, .L0805935C  @ 0x000057F0
	adds r4, r4, r0
	str r4, [r6, #0x3c]
	ldr r4, .L08059360  @ gBattleAnimBoolLockSheetGraphicsMaybe
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [sp]
	cmp r0, #0
	bne .L0805938A
	ldr r4, .L08059364  @ gUnknown_0201FB1C
	adds r0, r2, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r2, [sp]
	ldr r0, [r2, #0x28]
	cmp r1, r0
	beq .L0805938A
	adds r0, r2, #0
	bl StartEkrChienCHR
	ldr r2, [sp]
	adds r0, r2, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [sp]
	ldr r1, [r2, #0x28]
	str r1, [r0]
	b .L0805938A
	.align 2, 0
.L08059354: .4byte gUnknown_02000060
.L08059358: .4byte gUnknown_0200F1C8
.L0805935C: .4byte 0x000057F0
.L08059360: .4byte gBattleAnimBoolLockSheetGraphicsMaybe
.L08059364: .4byte gUnknown_0201FB1C
.L08059368:
	ldr r1, .L08059398  @ gUnknown_080DAF18
	ldr r0, .L0805939C  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
.L08059376:
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
.L0805938A:
	adds r0, r2, #0
	bl func_080598CC
	adds r0, r6, #0
	bl func_080598CC
	b .L080596D6
	.align 2, 0
.L08059398: .4byte gUnknown_080DAF18
.L0805939C: .4byte gBattleAnimSceneLayoutEnum
.L080593A0:
	ldrh r2, [r7, #0x10]
	movs r1, #0x20
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne .L080593B4
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r7, #0x10]
	b .L080596CC
.L080593B4:
	ldr r1, .L080593C8  @ gUnknown_02017758
	ldr r0, [r1]
	cmp r0, #1
	beq .L080593BE
	b .L080596CC
.L080593BE:
	movs r0, #0
	str r0, [r1]
	ldr r0, .L080593CC  @ 0x0000FFDF
	ands r0, r2
	b .L08059684
	.align 2, 0
.L080593C8: .4byte gUnknown_02017758
.L080593CC: .4byte 0x0000FFDF
.L080593D0:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L080593DC
	b .L080596CC
.L080593DC:
	movs r0, #3
	bl StartEfxQuake
	b .L080596CC
.L080593E4:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L080593F0
	b .L080596CC
.L080593F0:
	movs r0, #0
	bl StartEfxQuake
	b .L080596CC
.L080593F8:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08059404
	b .L080596CC
.L08059404:
	ldr r0, .L08059424  @ 0x0000FFFE
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	ldrh r1, [r7, #8]
	ldr r0, .L08059428  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #8]
	movs r0, #0x8c
	b .L080596B2
	.align 2, 0
.L08059424: .4byte 0x0000FFFE
.L08059428: .4byte 0x0000F3FF
.L0805942C:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L08059438
	b .L080596CC
.L08059438:
	adds r0, r7, #0
	bl GetOpponentFrontAIS
	adds r2, r0, #0
	cmp r2, #0
	beq .L0805946A
	ldrh r1, [r2, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl IsBatteRoundTypeAMiss
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r2, [sp]
.L0805946A:
	adds r0, r2, #0
	str r2, [sp]
	bl func_08072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L0805947C
	b .L080596CC
.L0805947C:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq .L080594A4
	adds r0, r2, #0
	bl StartEfxChillEffect
	b .L080596CC
.L080594A4:
	adds r0, r7, #0
	bl func_0806C87C
	b .L080596CC
.L080594AC:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L080594B8
	b .L080596CC
.L080594B8:
	adds r0, r7, #0
	movs r1, #0
	bl func_0806CC60
	b .L080596CC
.L080594C2:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L080594CE
	b .L080596CC
.L080594CE:
	adds r0, r7, #0
	movs r1, #1
	bl func_0806CC60
	b .L080596CC
.L080594D8:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L080594E4
	b .L080596CC
.L080594E4:
	adds r0, r7, #0
	bl func_0806CE30
	b .L080596CC
.L080594EC:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	bne .L0805950C
	b .L08059686
.L0805950C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0805951A
	b .L08059674
.L0805951A:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L0805952C
	b .L080596CC
.L0805952C:
	adds r0, r7, #0
	movs r1, #0
	bl StartEfxChillAnime
	b .L080596CC
.L08059536:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L08059542
	b .L080596CC
.L08059542:
	adds r0, r7, #0
	movs r1, #0
	bl func_0806D080
	b .L080596CC
.L0805954C:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L08059558
	b .L080596CC
.L08059558:
	adds r0, r7, #0
	movs r1, #1
	bl func_0806D080
	b .L080596CC
.L08059562:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L0805956E
	b .L080596CC
.L0805956E:
	adds r0, r7, #0
	movs r1, #0
	bl func_0806D320
	b .L080596CC
.L08059578:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L08059584
	b .L080596CC
.L08059584:
	adds r0, r7, #0
	movs r1, #1
	bl func_0806D320
	b .L080596CC
.L0805958E:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L0805959A
	b .L080596CC
.L0805959A:
	adds r0, r7, #0
	movs r1, #2
	bl func_0806D320
	b .L080596CC
.L080595A4:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08059674
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	beq .L080595C2
	b .L080596CC
.L080595C2:
	adds r0, r7, #0
	bl func_0806D65C
	b .L080596CC
.L080595CA:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L080595D8
	b .L08058F26
.L080595D8:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L080595EE
	movs r0, #1
	bl func_08055A34
.L080595EE:
	adds r0, r7, #0
	bl nullsub_17
	adds r0, r7, #0
	bl func_08055A40
	b .L08058F26
.L080595FC:
	adds r0, r7, #0
	bl func_0806DD34
	b .L080596CC
.L08059604:
	adds r0, r7, #0
	bl func_0806D570
	b .L080596CC
.L0805960C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08059674
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L080596CC
	adds r0, r7, #0
	bl func_0806D6E8
	b .L080596CC
.L08059630:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitFlags
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	beq .L08059686
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08059674
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L080596CC
	adds r0, r7, #0
	movs r1, #1
	bl StartEfxChillAnime
	b .L080596CC
.L08059674:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080596CC
	ldr r0, .L08059690  @ 0x0000FFDF
	ands r0, r1
	ldr r1, .L08059694  @ 0x0000FFBF
.L08059682:
	ands r0, r1
.L08059684:
	strh r0, [r7, #0x10]
.L08059686:
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	b .L080596CC
	.align 2, 0
.L08059690: .4byte 0x0000FFDF
.L08059694: .4byte 0x0000FFBF
.L08059698:
	subs r0, r3, #1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	bl func_08071B6C
	b .L080596CC
.L080596A6:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L080596CC
	movs r0, #0x14
.L080596B2:
	strh r0, [r7, #0xa]
	bl BsoSort
	b .L080596CC
.L080596BA:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L080596CC
	movs r0, #0x64
	strh r0, [r7, #0xa]
	bl BsoSort
.L080596CC:
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	bl .L08058C10
.L080596D6:
	ldrh r1, [r7, #0xc]
	movs r0, #0xe7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r7, #0xc]

	THUMB_FUNC_END func_08058BD4

	THUMB_FUNC_START func_080596E0
func_080596E0: @ 0x080596E0
	movs r0, #0x80
	lsls r0, r0, #6
	mov r3, r8
	ands r0, r3
	cmp r0, #0
	beq .L08059746
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L0805973C
	ldr r4, .L0805979C  @ gBattleAnimBoolLockSheetGraphicsMaybe
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne .L0805973C
	ldrh r1, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne .L0805973C
	ldr r4, .L080597A0  @ gUnknown_0201FB1C
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq .L0805973C
	adds r0, r7, #0
	bl RegisterAISSheetGraphics
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r7, #0x28]
	str r1, [r0]
.L0805973C:
	ldrh r1, [r7, #0xc]
	movs r0, #0xd7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r7, #0xc]
.L08059746:
	movs r0, #0x80
	lsls r0, r0, #7
	mov r1, r8
	ands r1, r0
	cmp r1, #0
	bne .L0805975C
	ldr r0, .L080597A4  @ gUnknown_02000024
	ldr r0, [r0]
	cmp r0, #1
	beq .L0805975C
	b .L080598AE
.L0805975C:
	ldrh r1, [r7, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080597E8
	adds r0, r7, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	negs r0, r0
	cmp r8, r0
	beq .L080597B0
	ldr r6, .L080597A8  @ gUnknown_02000000
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
	ldrh r1, [r2, #0x10]
	ldr r4, .L080597AC  @ 0x0000FFFD
	b .L08059824
	.align 2, 0
.L0805979C: .4byte gBattleAnimBoolLockSheetGraphicsMaybe
.L080597A0: .4byte gUnknown_0201FB1C
.L080597A4: .4byte gUnknown_02000024
.L080597A8: .4byte gUnknown_02000000
.L080597AC: .4byte 0x0000FFFD
.L080597B0:
	ldr r5, .L080597E0  @ gUnknown_02000000
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [r0]
	ldrh r1, [r2, #0x10]
	ldr r4, .L080597E4  @ 0x0000FFFD
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r6, [r0]
	ldrh r0, [r6, #0x10]
	ands r4, r0
	strh r4, [r6, #0x10]
	b .L080598AE
	.align 2, 0
.L080597E0: .4byte gUnknown_02000000
.L080597E4: .4byte 0x0000FFFD
.L080597E8:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L08059874
	adds r0, r7, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	negs r0, r0
	cmp r8, r0
	beq .L080598AE
	ldr r6, .L0805986C  @ gUnknown_02000000
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
	ldrh r1, [r2, #0x10]
	ldr r4, .L08059870  @ 0x00007FFF
.L08059824:
	adds r0, r4, #0
	ands r0, r1
	movs r5, #4
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r6, [r0]
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldrh r0, [r6, #0x10]
	ands r4, r0
	orrs r4, r5
	strh r4, [r6, #0x10]
	ldr r2, [sp]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	bl func_080598CC
	adds r0, r6, #0
	bl func_080598CC
	b .L080598AE
	.align 2, 0
.L0805986C: .4byte gUnknown_02000000
.L08059870: .4byte 0x00007FFF
.L08059874:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L080598AE
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	negs r0, r0
	cmp r8, r0
	bne .L080598AE
	adds r0, r7, #0
	bl GetAISSubjectId
	ldr r1, .L080598C8  @ gUnknown_0201FB04
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
.L080598AE:
	mov r2, r9
	cmp r2, #3
	bhi .L080598B8
	bl func_08058BD4
.L080598B8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080598C8: .4byte gUnknown_0201FB04

	THUMB_FUNC_END func_080596E0

	THUMB_FUNC_START func_080598CC
func_080598CC: @ 0x080598CC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x12]
	bl func_0805A1D0
	cmp r0, #0
	beq .L08059906
	ldr r1, [r4, #0x20]
	ldr r0, .L080598E8  @ gUnknown_085B9D5C
	cmp r1, r0
	beq .L08059906
	movs r2, #0x3f
	b .L080598F4
	.align 2, 0
.L080598E8: .4byte gUnknown_085B9D5C
.L080598EC:
	cmp r1, #6
	bne .L080598F4
	adds r0, #0xc
	str r0, [r4, #0x20]
.L080598F4:
	ldr r0, [r4, #0x20]
	ldrb r1, [r0, #3]
	ands r1, r2
	cmp r1, #0
	beq .L08059902
	cmp r1, #5
	bne .L080598EC
.L08059902:
	subs r0, #0xc
	str r0, [r4, #0x20]
.L08059906:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080598CC

	THUMB_FUNC_START StartEkrChienCHR
StartEkrChienCHR: @ 0x0805990C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08059920  @ gUnknown_085B9D94
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08059920: .4byte gUnknown_085B9D94

	THUMB_FUNC_END StartEkrChienCHR

	THUMB_FUNC_START EkrChienCHR_OnLoop
EkrChienCHR_OnLoop: @ 0x08059924
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl RegisterAISSheetGraphics
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrChienCHR_OnLoop

	THUMB_FUNC_START RegisterAISSheetGraphics
RegisterAISSheetGraphics: @ 0x0805993C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #8]
	ldr r4, .L08059968  @ 0x000003FF
	ands r4, r0
	lsls r4, r4, #5
	ldr r0, .L0805996C  @ 0x06010000
	adds r4, r4, r0
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	bl LZ77UnCompWram
	ldr r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r4, #0
	bl RegisterDataMove
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08059968: .4byte 0x000003FF
.L0805996C: .4byte 0x06010000

	THUMB_FUNC_END RegisterAISSheetGraphics

	THUMB_FUNC_START func_08059970
func_08059970: @ 0x08059970
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08059998  @ gUnknown_0203E1DC
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq .L08059992
	movs r1, #0
	adds r3, r2, #0
	adds r3, #0x80
.L08059988:
	ldm r3!, {r0}
	stm r2!, {r0}
	adds r1, #1
	cmp r1, #7
	bls .L08059988
.L08059992:
	pop {r0}
	bx r0
	.align 2, 0
.L08059998: .4byte gUnknown_0203E1DC

	THUMB_FUNC_END func_08059970

	THUMB_FUNC_START func_0805999C
func_0805999C: @ 0x0805999C
	push {lr}
	adds r2, r0, #0
	cmp r1, #0
	bne .L080599AC
	ldr r0, .L080599A8  @ gpUnitLeft_BattleStruct
	b .L080599AE
	.align 2, 0
.L080599A8: .4byte gpUnitLeft_BattleStruct
.L080599AC:
	ldr r0, .L080599C4  @ gpUnitRight_BattleStruct
.L080599AE:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x1a
	beq .L080599D6
	cmp r0, #0x1a
	bhi .L080599C8
	cmp r0, #0x19
	beq .L080599D2
	b .L080599E2
	.align 2, 0
.L080599C4: .4byte gpUnitRight_BattleStruct
.L080599C8:
	cmp r0, #0x1b
	beq .L080599DA
	cmp r0, #0x1c
	beq .L080599DE
	b .L080599E2
.L080599D2:
	movs r0, #0x25
	b .L080599E4
.L080599D6:
	movs r0, #0x27
	b .L080599E4
.L080599DA:
	movs r0, #0x29
	b .L080599E4
.L080599DE:
	movs r0, #0x2b
	b .L080599E4
.L080599E2:
	adds r0, r2, #0
.L080599E4:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0805999C

	THUMB_FUNC_START func_080599E8
func_080599E8: @ 0x080599E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, .L08059BD8  @ banim_data
	mov sl, r0
	ldr r1, .L08059BDC  @ gUnknown_0201FB1C
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1]
	ldr r0, .L08059BE0  @ gBattleAnimUnitEnabledLookup
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne .L08059ADE
	ldr r0, .L08059BE4  @ gBattleAnimAnimationIndex
	movs r2, #0
	ldrsh r7, [r0, r2]
	ldr r0, .L08059BE8  @ gUnknown_0203E114
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, .L08059BEC  @ gUnknown_0203E110
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r7, #5
	add r4, sl
	ldr r0, [r4, #0x10]
	ldr r1, .L08059BF0  @ gUnknown_0200F1C8
	bl LZ77UnCompWram
	ldr r1, .L08059BF4  @ gUnknown_0200005C
	ldr r0, [r4, #0xc]
	str r0, [r1]
	adds r0, r7, #0
	movs r1, #0
	bl func_0805999C
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r4, .L08059BF8  @ gUnknown_02004088
	adds r1, r4, #0
	bl LZ77UnCompWram
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq .L08059A64
	lsls r0, r5, #4
	ldr r2, .L08059BFC  @ character_battle_animation_palette_table
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0
	bl func_08059970
.L08059A64:
	ldr r1, .L08059C00  @ gUnknown_02000054
	mov r2, r8
	lsls r0, r2, #5
	adds r0, r0, r4
	str r0, [r1]
	ldr r4, .L08059C04  @ gPal+0x2E0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L08059C08  @ gUnknown_0203E19C
	ldr r0, [r0]
	adds r1, r4, #0
	adds r1, #0x20
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L08059C0C  @ gBattleUnitA
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq .L08059A98
	cmp r1, #0xd
	bne .L08059AA4
.L08059A98:
	ldr r1, .L08059C10  @ 0xFFFFFD20
	adds r0, r4, r1
	adds r1, r4, #0
	movs r2, #1
	bl func_08071468
.L08059AA4:
	ldr r0, .L08059C14  @ gBattleUnitB
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq .L08059AB6
	cmp r1, #0xd
	bne .L08059AC4
.L08059AB6:
	ldr r0, .L08059C18  @ gPal
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #1
	bl func_08071468
.L08059AC4:
	bl EnablePalSync
	lsls r0, r7, #5
	add r0, sl
	ldr r0, [r0, #0x18]
	ldr r4, .L08059C1C  @ gUnknown_020041C8
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, .L08059C20  @ 0x000057F0
	adds r4, r4, r0
	movs r0, #1
	str r0, [r4]
.L08059ADE:
	ldr r0, .L08059BE0  @ gBattleAnimUnitEnabledLookup
	movs r2, #2
	ldrsh r1, [r0, r2]
	mov r9, r1
	cmp r1, #1
	bne .L08059B7E
	ldr r0, .L08059BE4  @ gBattleAnimAnimationIndex
	movs r1, #2
	ldrsh r7, [r0, r1]
	ldr r0, .L08059BE8  @ gUnknown_0203E114
	movs r1, #2
	ldrsh r2, [r0, r1]
	mov r8, r2
	ldr r0, .L08059BEC  @ gUnknown_0203E110
	movs r2, #2
	ldrsh r5, [r0, r2]
	lsls r0, r7, #5
	mov r1, sl
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, .L08059C24  @ gUnknown_02011BC8
	bl LZ77UnCompWram
	ldr r1, .L08059C28  @ gUnknown_02000060
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r7, #0
	movs r1, #1
	bl func_0805999C
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r4, .L08059C2C  @ gUnknown_02004128
	adds r1, r4, #0
	bl LZ77UnCompWram
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq .L08059B46
	lsls r0, r5, #4
	ldr r2, .L08059BFC  @ character_battle_animation_palette_table
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #1
	bl func_08059970
.L08059B46:
	ldr r1, .L08059C00  @ gUnknown_02000054
	mov r2, r8
	lsls r0, r2, #5
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r4, .L08059C30  @ gPal+0x320
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, .L08059C08  @ gUnknown_0203E19C
	ldr r0, [r0, #4]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x14]
	ldr r4, .L08059C34  @ gUnknown_020099C8
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, .L08059C20  @ 0x000057F0
	adds r4, r4, r0
	mov r1, r9
	str r1, [r4]
.L08059B7E:
	ldr r4, .L08059C38  @ gpBattleAnimTAUnits
	ldr r2, [r4]
	cmp r2, #0
	bne .L08059B88
	b .L08059D06
.L08059B88:
	ldr r0, [r2, #4]
	ldr r1, [r0, #0x34]
	adds r0, r2, #0
	movs r2, #0
	mov r3, sp
	bl func_08057CAC
	lsls r0, r0, #0x10
	ldr r2, .L08059C08  @ gUnknown_0203E19C
	lsrs r0, r0, #0xb
	add r0, sl
	ldr r0, [r0, #0x1c]
	str r0, [r2]
	ldr r1, [r4]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r1, #4]
	ldrb r5, [r0, #4]
	movs r3, #0
	ldr r0, .L08059C3C  @ gUnknown_0895E0A4
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne .L08059C44
	ldr r0, .L08059C40  @ gUnknown_0895EEA4
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, .L08059BFC  @ character_battle_animation_palette_table
	adds r0, r0, r1
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r2]
	b .L08059C72
	.align 2, 0
.L08059BD8: .4byte banim_data
.L08059BDC: .4byte gUnknown_0201FB1C
.L08059BE0: .4byte gBattleAnimUnitEnabledLookup
.L08059BE4: .4byte gBattleAnimAnimationIndex
.L08059BE8: .4byte gUnknown_0203E114
.L08059BEC: .4byte gUnknown_0203E110
.L08059BF0: .4byte gUnknown_0200F1C8
.L08059BF4: .4byte gUnknown_0200005C
.L08059BF8: .4byte gUnknown_02004088
.L08059BFC: .4byte character_battle_animation_palette_table
.L08059C00: .4byte gUnknown_02000054
.L08059C04: .4byte gPal+0x2E0
.L08059C08: .4byte gUnknown_0203E19C
.L08059C0C: .4byte gBattleUnitA
.L08059C10: .4byte 0xFFFFFD20
.L08059C14: .4byte gBattleUnitB
.L08059C18: .4byte gPal
.L08059C1C: .4byte gUnknown_020041C8
.L08059C20: .4byte 0x000057F0
.L08059C24: .4byte gUnknown_02011BC8
.L08059C28: .4byte gUnknown_02000060
.L08059C2C: .4byte gUnknown_02004128
.L08059C30: .4byte gPal+0x320
.L08059C34: .4byte gUnknown_020099C8
.L08059C38: .4byte gpBattleAnimTAUnits
.L08059C3C: .4byte gUnknown_0895E0A4
.L08059C40: .4byte gUnknown_0895EEA4
.L08059C44:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #6
	bhi .L08059C72
	ldr r0, .L08059CC4  @ gUnknown_0895E0A4
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r2, r3, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne .L08059C44
	ldr r1, .L08059CC8  @ gUnknown_0203E19C
	ldr r0, .L08059CCC  @ gUnknown_0895EEA4
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r2, .L08059CD0  @ character_battle_animation_palette_table
	adds r0, r0, r2
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r1]
.L08059C72:
	ldr r4, .L08059CD4  @ gpBattleAnimTAUnits
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x34]
	movs r2, #0
	mov r3, sp
	bl func_08057CAC
	lsls r0, r0, #0x10
	ldr r2, .L08059CC8  @ gUnknown_0203E19C
	lsrs r0, r0, #0xb
	add r0, sl
	ldr r0, [r0, #0x1c]
	str r0, [r2, #4]
	ldr r1, [r4, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r1, #4]
	ldrb r5, [r0, #4]
	movs r3, #0
	ldr r0, .L08059CC4  @ gUnknown_0895E0A4
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne .L08059CD8
	ldr r0, .L08059CCC  @ gUnknown_0895EEA4
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, .L08059CD0  @ character_battle_animation_palette_table
	adds r0, r0, r1
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r2, #4]
	b .L08059D06
	.align 2, 0
.L08059CC4: .4byte gUnknown_0895E0A4
.L08059CC8: .4byte gUnknown_0203E19C
.L08059CCC: .4byte gUnknown_0895EEA4
.L08059CD0: .4byte character_battle_animation_palette_table
.L08059CD4: .4byte gpBattleAnimTAUnits
.L08059CD8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #6
	bhi .L08059D06
	ldr r0, .L08059D18  @ gUnknown_0895E0A4
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r2, r3, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne .L08059CD8
	ldr r1, .L08059D1C  @ gUnknown_0203E19C
	ldr r0, .L08059D20  @ gUnknown_0895EEA4
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r2, .L08059D24  @ character_battle_animation_palette_table
	adds r0, r0, r2
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r1, #4]
.L08059D06:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08059D18: .4byte gUnknown_0895E0A4
.L08059D1C: .4byte gUnknown_0203E19C
.L08059D20: .4byte gUnknown_0895EEA4
.L08059D24: .4byte character_battle_animation_palette_table

	THUMB_FUNC_END func_080599E8

	THUMB_FUNC_START func_08059D28
func_08059D28: @ 0x08059D28
	push {lr}
	ldr r0, .L08059D40  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi .L08059DA2
	lsls r0, r0, #2
	ldr r1, .L08059D44  @ .L08059D48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08059D40: .4byte gBattleAnimSceneLayoutEnum
.L08059D44: .4byte .L08059D48
.L08059D48: @ jump table
	.4byte .L08059D5C @ case 0
	.4byte .L08059D66 @ case 1
	.4byte .L08059D70 @ case 2
	.4byte .L08059D5C @ case 3
	.4byte .L08059D5C @ case 4
.L08059D5C:
	movs r0, #6
	movs r1, #6
	bl func_08059DB8
	b .L08059DA2
.L08059D66:
	movs r0, #8
	movs r1, #8
	bl func_08059DB8
	b .L08059DA2
.L08059D70:
	movs r0, #8
	movs r1, #8
	bl func_08059DB8
	bl func_08052184
	cmp r0, #0
	bne .L08059D94
	ldr r1, .L08059D90  @ gUnknown_02000000
	ldr r2, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #0xc]
	b .L08059DA0
	.align 2, 0
.L08059D90: .4byte gUnknown_02000000
.L08059D94:
	ldr r1, .L08059DB0  @ gUnknown_02000000
	ldr r2, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #4]
.L08059DA0:
	strh r0, [r1, #2]
.L08059DA2:
	ldr r1, .L08059DB4  @ gUnknown_0203E152
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
.L08059DB0: .4byte gUnknown_02000000
.L08059DB4: .4byte gUnknown_0203E152

	THUMB_FUNC_END func_08059D28

	THUMB_FUNC_START func_08059DB8
func_08059DB8: @ 0x08059DB8
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r4, .L08059E0C  @ gUnknown_02000000
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r5, .L08059E10  @ gBattleAnimUnitEnabledLookup
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne .L08059DDA
	adds r0, r2, #0
	bl func_08059E18
.L08059DDA:
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne .L08059DE8
	adds r0, r6, #0
	bl func_08059F5C
.L08059DE8:
	ldr r0, .L08059E14  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne .L08059E04
	ldr r2, [r4]
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, [r4, #4]
	ldrh r0, [r2]
	orrs r1, r0
	strh r1, [r2]
.L08059E04:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08059E0C: .4byte gUnknown_02000000
.L08059E10: .4byte gBattleAnimUnitEnabledLookup
.L08059E14: .4byte gBattleAnimSceneLayoutEnum

	THUMB_FUNC_END func_08059DB8

	THUMB_FUNC_START func_08059E18
func_08059E18: @ 0x08059E18
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, .L08059F20  @ gUnknown_080DAEF0
	lsls r1, r7, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov r9, r1
	ldr r0, .L08059F24  @ gUnknown_080DAF1D
	ldr r1, .L08059F28  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r1, r0
	ldrb r4, [r0]
	ldr r3, .L08059F2C  @ gUnknown_02000030
	ldr r0, .L08059F30  @ gUnknown_080DAF28
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	negs r1, r1
	movs r2, #0
	strh r1, [r3]
	ldr r0, .L08059F34  @ gUnknown_02000034
	strh r2, [r0]
	ldr r0, .L08059F38  @ gUnknown_02000028
	adds r1, r1, r4
	strh r1, [r0]
	ldr r1, .L08059F3C  @ gUnknown_0200002C
	movs r0, #0x58
	strh r0, [r1]
	ldr r0, .L08059F40  @ gUnknown_0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L08059F44  @ gUnknown_0200F1C8
	adds r0, r1, r0
	cmp r5, #0xff
	bne .L08059E80
	ldr r0, .L08059F48  @ gUnknown_085B9D5C
.L08059E80:
	adds r1, r6, #0
	bl BsoCreate
	adds r3, r0, #0
	ldr r2, .L08059F38  @ gUnknown_02000028
	ldr r0, .L08059F4C  @ gUnknown_0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, .L08059F3C  @ gUnknown_0200002C
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r7, [r3, #0x12]
	ldr r0, .L08059F50  @ gUnknown_02000088
	str r0, [r3, #0x2c]
	ldr r0, .L08059F54  @ gUnknown_020041C8
	str r0, [r3, #0x30]
	ldr r0, .L08059F58  @ gUnknown_02000000
	str r3, [r0]
	ldr r0, .L08059F40  @ gUnknown_0200005C
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L08059F44  @ gUnknown_0200F1C8
	adds r0, r1, r0
	cmp r2, #0xff
	bne .L08059ED4
	ldr r0, .L08059F48  @ gUnknown_085B9D5C
.L08059ED4:
	mov r1, r9
	bl BsoCreate
	adds r3, r0, #0
	ldr r2, .L08059F38  @ gUnknown_02000028
	ldr r0, .L08059F4C  @ gUnknown_0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, .L08059F3C  @ gUnknown_0200002C
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r7, [r3, #0x12]
	ldr r0, .L08059F50  @ gUnknown_02000088
	str r0, [r3, #0x2c]
	ldr r0, .L08059F54  @ gUnknown_020041C8
	str r0, [r3, #0x30]
	ldr r0, .L08059F58  @ gUnknown_02000000
	str r3, [r0, #4]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08059F20: .4byte gUnknown_080DAEF0
.L08059F24: .4byte gUnknown_080DAF1D
.L08059F28: .4byte gBattleAnimSceneLayoutEnum
.L08059F2C: .4byte gUnknown_02000030
.L08059F30: .4byte gUnknown_080DAF28
.L08059F34: .4byte gUnknown_02000034
.L08059F38: .4byte gUnknown_02000028
.L08059F3C: .4byte gUnknown_0200002C
.L08059F40: .4byte gUnknown_0200005C
.L08059F44: .4byte gUnknown_0200F1C8
.L08059F48: .4byte gUnknown_085B9D5C
.L08059F4C: .4byte gUnknown_0201FB0C
.L08059F50: .4byte gUnknown_02000088
.L08059F54: .4byte gUnknown_020041C8
.L08059F58: .4byte gUnknown_02000000

	THUMB_FUNC_END func_08059E18

	THUMB_FUNC_START func_08059F5C
func_08059F5C: @ 0x08059F5C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, .L0805A044  @ gUnknown_080DAEF0
	lsls r1, r5, #2
	adds r0, r1, r2
	ldrb r3, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r7, [r1]
	ldr r1, .L0805A048  @ gUnknown_080DAF22
	ldr r0, .L0805A04C  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, .L0805A050  @ gUnknown_02000030
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, .L0805A054  @ gUnknown_02000034
	strh r1, [r0, #2]
	ldr r0, .L0805A058  @ gUnknown_02000028
	strh r2, [r0, #2]
	ldr r1, .L0805A05C  @ gUnknown_0200002C
	movs r0, #0x58
	strh r0, [r1, #2]
	ldr r0, .L0805A060  @ gUnknown_02000060
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0805A064  @ gUnknown_02011BC8
	adds r0, r1, r0
	cmp r3, #0xff
	bne .L08059FAE
	ldr r0, .L0805A068  @ gUnknown_085B9D5C
.L08059FAE:
	adds r1, r4, #0
	bl BsoCreate
	adds r3, r0, #0
	ldr r2, .L0805A058  @ gUnknown_02000028
	ldr r0, .L0805A06C  @ gUnknown_0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, .L0805A05C  @ gUnknown_0200002C
	ldrh r0, [r0, #2]
	strh r0, [r3, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xc0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r5, [r3, #0x12]
	ldr r0, .L0805A070  @ gUnknown_02002088
	str r0, [r3, #0x2c]
	ldr r0, .L0805A074  @ gUnknown_020099C8
	str r0, [r3, #0x30]
	ldr r0, .L0805A078  @ gUnknown_02000000
	str r3, [r0, #8]
	ldr r0, .L0805A060  @ gUnknown_02000060
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0805A064  @ gUnknown_02011BC8
	adds r0, r1, r0
	cmp r6, #0xff
	bne .L0805A000
	ldr r0, .L0805A068  @ gUnknown_085B9D5C
.L0805A000:
	adds r1, r7, #0
	bl BsoCreate
	adds r3, r0, #0
	ldr r2, .L0805A058  @ gUnknown_02000028
	ldr r0, .L0805A06C  @ gUnknown_0201FB0C
	ldr r1, [r0]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, .L0805A05C  @ gUnknown_0200002C
	ldrh r0, [r0, #2]
	strh r0, [r3, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xe0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r5, [r3, #0x12]
	ldr r0, .L0805A070  @ gUnknown_02002088
	str r0, [r3, #0x2c]
	ldr r0, .L0805A074  @ gUnknown_020099C8
	str r0, [r3, #0x30]
	ldr r0, .L0805A078  @ gUnknown_02000000
	str r3, [r0, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805A044: .4byte gUnknown_080DAEF0
.L0805A048: .4byte gUnknown_080DAF22
.L0805A04C: .4byte gBattleAnimSceneLayoutEnum
.L0805A050: .4byte gUnknown_02000030
.L0805A054: .4byte gUnknown_02000034
.L0805A058: .4byte gUnknown_02000028
.L0805A05C: .4byte gUnknown_0200002C
.L0805A060: .4byte gUnknown_02000060
.L0805A064: .4byte gUnknown_02011BC8
.L0805A068: .4byte gUnknown_085B9D5C
.L0805A06C: .4byte gUnknown_0201FB0C
.L0805A070: .4byte gUnknown_02002088
.L0805A074: .4byte gUnknown_020099C8
.L0805A078: .4byte gUnknown_02000000

	THUMB_FUNC_END func_08059F5C

	THUMB_FUNC_START SwitchAISFrameDataFromBARoundType
SwitchAISFrameDataFromBARoundType: @ 0x0805A07C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L0805A09C
	ldr r0, .L0805A098  @ gUnknown_080DAEF0
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrb r5, [r2]
	adds r1, #1
	adds r1, r1, r0
	b .L0805A0AA
	.align 2, 0
.L0805A098: .4byte gUnknown_080DAEF0
.L0805A09C:
	ldr r2, .L0805A0C8  @ gUnknown_080DAEF0
	lsls r1, r6, #2
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
.L0805A0AA:
	ldrb r7, [r1]
	cmp r5, #0xff
	beq .L0805A0F0
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805A0D4
	ldr r0, .L0805A0CC  @ gUnknown_0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0805A0D0  @ gUnknown_0200F1C8
	b .L0805A0E0
	.align 2, 0
.L0805A0C8: .4byte gUnknown_080DAEF0
.L0805A0CC: .4byte gUnknown_0200005C
.L0805A0D0: .4byte gUnknown_0200F1C8
.L0805A0D4:
	ldr r0, .L0805A0E8  @ gUnknown_02000060
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, .L0805A0EC  @ gUnknown_02011BC8
.L0805A0E0:
	adds r1, r1, r0
	str r1, [r4, #0x24]
	str r1, [r4, #0x20]
	b .L0805A0FA
	.align 2, 0
.L0805A0E8: .4byte gUnknown_02000060
.L0805A0EC: .4byte gUnknown_02011BC8
.L0805A0F0:
	ldr r0, .L0805A148  @ gUnknown_085B9D5C
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x10]
.L0805A0FA:
	movs r3, #0
	movs r2, #0
	strh r7, [r4, #0xa]
	ldrh r1, [r4, #8]
	ldr r0, .L0805A14C  @ 0x0000F3FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4, #8]
	strh r2, [r4, #6]
	ldrh r1, [r4, #0xc]
	movs r0, #0xe0
	lsls r0, r0, #3
	ands r0, r1
	strh r0, [r4, #0xc]
	strb r6, [r4, #0x12]
	strb r3, [r4, #0x14]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0xb
	ldr r0, .L0805A150  @ gUnknown_020041C8
	adds r1, r1, r0
	str r1, [r4, #0x30]
	bl BsoSort
	adds r0, r4, #0
	bl func_0807705C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805A148: .4byte gUnknown_085B9D5C
.L0805A14C: .4byte 0x0000F3FF
.L0805A150: .4byte gUnknown_020041C8

	THUMB_FUNC_END SwitchAISFrameDataFromBARoundType

	THUMB_FUNC_START GetAISLayerId
GetAISLayerId: @ 0x0805A154
	push {lr}
	ldrh r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0805A166
	movs r0, #1
	b .L0805A168
.L0805A166:
	movs r0, #0
.L0805A168:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAISLayerId

	THUMB_FUNC_START GetAISSubjectId
GetAISSubjectId: @ 0x0805A16C
	push {lr}
	ldrh r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0805A17E
	movs r0, #1
	b .L0805A180
.L0805A17E:
	movs r0, #0
.L0805A180:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAISSubjectId

	THUMB_FUNC_START IsBatteRoundTypeAMiss
IsBatteRoundTypeAMiss: @ 0x0805A184
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi .L0805A1C8
	lsls r0, r0, #2
	ldr r1, .L0805A198  @ .L0805A19C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805A198: .4byte .L0805A19C
.L0805A19C: @ jump table
	.4byte .L0805A1C8 @ case 0
	.4byte .L0805A1C8 @ case 1
	.4byte .L0805A1C8 @ case 2
	.4byte .L0805A1C8 @ case 3
	.4byte .L0805A1C4 @ case 4
	.4byte .L0805A1C4 @ case 5
	.4byte .L0805A1C8 @ case 6
	.4byte .L0805A1C8 @ case 7
	.4byte .L0805A1C8 @ case 8
	.4byte .L0805A1C8 @ case 9
.L0805A1C4:
	movs r0, #1
	b .L0805A1CA
.L0805A1C8:
	movs r0, #0
.L0805A1CA:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsBatteRoundTypeAMiss

	THUMB_FUNC_START func_0805A1D0
func_0805A1D0: @ 0x0805A1D0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi .L0805A214
	lsls r0, r0, #2
	ldr r1, .L0805A1E4  @ .L0805A1E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805A1E4: .4byte .L0805A1E8
.L0805A1E8: @ jump table
	.4byte .L0805A214 @ case 0
	.4byte .L0805A214 @ case 1
	.4byte .L0805A214 @ case 2
	.4byte .L0805A214 @ case 3
	.4byte .L0805A214 @ case 4
	.4byte .L0805A214 @ case 5
	.4byte .L0805A210 @ case 6
	.4byte .L0805A210 @ case 7
	.4byte .L0805A210 @ case 8
	.4byte .L0805A214 @ case 9
.L0805A210:
	movs r0, #1
	b .L0805A216
.L0805A214:
	movs r0, #0
.L0805A216:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0805A1D0

	THUMB_FUNC_START func_0805A21C
func_0805A21C: @ 0x0805A21C
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi .L0805A260
	lsls r0, r0, #2
	ldr r1, .L0805A230  @ .L0805A234
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805A230: .4byte .L0805A234
.L0805A234: @ jump table
	.4byte .L0805A25C @ case 0
	.4byte .L0805A25C @ case 1
	.4byte .L0805A25C @ case 2
	.4byte .L0805A25C @ case 3
	.4byte .L0805A260 @ case 4
	.4byte .L0805A260 @ case 5
	.4byte .L0805A260 @ case 6
	.4byte .L0805A260 @ case 7
	.4byte .L0805A260 @ case 8
	.4byte .L0805A25C @ case 9
.L0805A25C:
	movs r0, #1
	b .L0805A262
.L0805A260:
	movs r0, #0
.L0805A262:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0805A21C

	THUMB_FUNC_START func_0805A268
func_0805A268: @ 0x0805A268
	push {lr}
	ldrb r0, [r0, #0x12]
	cmp r0, #9
	bhi .L0805A2AC
	lsls r0, r0, #2
	ldr r1, .L0805A27C  @ .L0805A280
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805A27C: .4byte .L0805A280
.L0805A280: @ jump table
	.4byte .L0805A2AC @ case 0
	.4byte .L0805A2A8 @ case 1
	.4byte .L0805A2AC @ case 2
	.4byte .L0805A2A8 @ case 3
	.4byte .L0805A2AC @ case 4
	.4byte .L0805A2AC @ case 5
	.4byte .L0805A2AC @ case 6
	.4byte .L0805A2AC @ case 7
	.4byte .L0805A2AC @ case 8
	.4byte .L0805A2AC @ case 9
.L0805A2A8:
	movs r0, #1
	b .L0805A2AE
.L0805A2AC:
	movs r0, #0
.L0805A2AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0805A268

	THUMB_FUNC_START GetOpponentFrontAIS
GetOpponentFrontAIS: @ 0x0805A2B4
	push {r4, lr}
	ldr r4, .L0805A2CC  @ gUnknown_02000000
	bl GetAISSubjectId
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0805A2CC: .4byte gUnknown_02000000

	THUMB_FUNC_END GetOpponentFrontAIS

	THUMB_FUNC_START func_0805A2D0
func_0805A2D0: @ 0x0805A2D0
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0805A2D0

	THUMB_FUNC_START GetAISNextBattleAnimRoundType
GetAISNextBattleAnimRoundType: @ 0x0805A2F0
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimHitType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAISNextBattleAnimRoundType

	THUMB_FUNC_START GetAISCurrentRoundType
GetAISCurrentRoundType: @ 0x0805A310
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimHitType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAISCurrentRoundType

	THUMB_FUNC_START func_0805A334
func_0805A334: @ 0x0805A334
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimHitType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0805A334

	THUMB_FUNC_START func_0805A358
func_0805A358: @ 0x0805A358
	push {lr}
	cmp r0, #0
	bne .L0805A374
	ldr r2, .L0805A370  @ gUnknown_02000000
	ldr r3, [r2]
	ldrh r0, [r3]
	movs r1, #2
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #4]
	b .L0805A386
	.align 2, 0
.L0805A370: .4byte gUnknown_02000000
.L0805A374:
	cmp r0, #1
	bne .L0805A38C
	ldr r2, .L0805A390  @ gUnknown_02000000
	ldr r3, [r2, #8]
	ldrh r0, [r3]
	movs r1, #2
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #0xc]
.L0805A386:
	ldrh r0, [r3]
	orrs r1, r0
	strh r1, [r3]
.L0805A38C:
	pop {r0}
	bx r0
	.align 2, 0
.L0805A390: .4byte gUnknown_02000000

	THUMB_FUNC_END func_0805A358

	THUMB_FUNC_START func_0805A394
func_0805A394: @ 0x0805A394
	push {r4, lr}
	cmp r0, #0
	bne .L0805A3B4
	ldr r3, .L0805A3AC  @ gUnknown_02000000
	ldr r4, [r3]
	ldrh r2, [r4]
	ldr r1, .L0805A3B0  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldr r4, [r3, #4]
	b .L0805A3C8
	.align 2, 0
.L0805A3AC: .4byte gUnknown_02000000
.L0805A3B0: .4byte 0x0000FFFD
.L0805A3B4:
	cmp r0, #1
	bne .L0805A3CE
	ldr r3, .L0805A3D4  @ gUnknown_02000000
	ldr r4, [r3, #8]
	ldrh r2, [r4]
	ldr r1, .L0805A3D8  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldr r4, [r3, #0xc]
.L0805A3C8:
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
.L0805A3CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805A3D4: .4byte gUnknown_02000000
.L0805A3D8: .4byte 0x0000FFFD

	THUMB_FUNC_END func_0805A394

	THUMB_FUNC_START func_0805A3DC
func_0805A3DC: @ 0x0805A3DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne .L0805A3E8
	b .L0805A576
.L0805A3E8:
	ldrh r0, [r4, #0xc]
	movs r5, #0xf0
	lsls r5, r5, #8
	ands r5, r0
	cmp r5, #0
	bne .L0805A3F6
	b .L0805A576
.L0805A3F6:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r5
	cmp r0, #0
	bne .L0805A402
	b .L0805A538
.L0805A402:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne .L0805A40A
	b .L0805A52E
.L0805A40A:
	adds r0, r4, r0
	ldrb r0, [r0, #0x14]
	cmp r0, #0x32
	bls .L0805A414
	b .L0805A526
.L0805A414:
	lsls r0, r0, #2
	ldr r1, .L0805A420  @ .L0805A424
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805A420: .4byte .L0805A424
.L0805A424: @ jump table
	.4byte .L0805A526 @ case 0
	.4byte .L0805A4F0 @ case 1
	.4byte .L0805A4F0 @ case 2
	.4byte .L0805A508 @ case 3
	.4byte .L0805A508 @ case 4
	.4byte .L0805A4F8 @ case 5
	.4byte .L0805A526 @ case 6
	.4byte .L0805A526 @ case 7
	.4byte .L0805A526 @ case 8
	.4byte .L0805A526 @ case 9
	.4byte .L0805A526 @ case 10
	.4byte .L0805A526 @ case 11
	.4byte .L0805A526 @ case 12
	.4byte .L0805A510 @ case 13
	.4byte .L0805A518 @ case 14
	.4byte .L0805A526 @ case 15
	.4byte .L0805A526 @ case 16
	.4byte .L0805A526 @ case 17
	.4byte .L0805A526 @ case 18
	.4byte .L0805A526 @ case 19
	.4byte .L0805A526 @ case 20
	.4byte .L0805A526 @ case 21
	.4byte .L0805A526 @ case 22
	.4byte .L0805A526 @ case 23
	.4byte .L0805A520 @ case 24
	.4byte .L0805A526 @ case 25
	.4byte .L0805A526 @ case 26
	.4byte .L0805A526 @ case 27
	.4byte .L0805A526 @ case 28
	.4byte .L0805A526 @ case 29
	.4byte .L0805A526 @ case 30
	.4byte .L0805A526 @ case 31
	.4byte .L0805A526 @ case 32
	.4byte .L0805A526 @ case 33
	.4byte .L0805A526 @ case 34
	.4byte .L0805A526 @ case 35
	.4byte .L0805A526 @ case 36
	.4byte .L0805A526 @ case 37
	.4byte .L0805A526 @ case 38
	.4byte .L0805A526 @ case 39
	.4byte .L0805A526 @ case 40
	.4byte .L0805A526 @ case 41
	.4byte .L0805A526 @ case 42
	.4byte .L0805A526 @ case 43
	.4byte .L0805A526 @ case 44
	.4byte .L0805A526 @ case 45
	.4byte .L0805A526 @ case 46
	.4byte .L0805A526 @ case 47
	.4byte .L0805A526 @ case 48
	.4byte .L0805A526 @ case 49
	.4byte .L0805A526 @ case 50
.L0805A4F0:
	adds r0, r4, #0
	bl func_0805A580
	b .L0805A526
.L0805A4F8:
	adds r0, r4, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L0805A508
	adds r0, r4, #0
	bl func_0806EB54
.L0805A508:
	ldr r0, [r4, #0x20]
	adds r0, #4
	str r0, [r4, #0x20]
	b .L0805A526
.L0805A510:
	adds r0, r4, #0
	bl func_0805A5A8
	b .L0805A526
.L0805A518:
	adds r0, r4, #0
	bl func_0806EB54
	b .L0805A526
.L0805A520:
	adds r0, r4, #0
	bl func_0805A580
.L0805A526:
	ldrb r0, [r4, #0x14]
	subs r0, #1
	strb r0, [r4, #0x14]
	b .L0805A402
.L0805A52E:
	ldrh r1, [r4, #0xc]
	movs r0, #0xe7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r4, #0xc]
.L0805A538:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r5
	cmp r0, #0
	beq .L0805A568
	adds r0, r4, #0
	bl GetAISLayerId
	cmp r0, #0
	bne .L0805A55E
	ldr r1, [r6, #0x2c]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq .L0805A55E
	adds r0, r4, #0
	bl RegisterAISSheetGraphics
	ldr r0, [r4, #0x28]
	str r0, [r6, #0x2c]
.L0805A55E:
	ldrh r1, [r4, #0xc]
	movs r0, #0xd7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r4, #0xc]
.L0805A568:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r5, r0
	cmp r5, #0
	beq .L0805A576
	ldr r0, .L0805A57C  @ 0x0000FFFF
	strh r0, [r4, #0xe]
.L0805A576:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805A57C: .4byte 0x0000FFFF

	THUMB_FUNC_END func_0805A3DC

	THUMB_FUNC_START func_0805A580
func_0805A580: @ 0x0805A580
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0805A5A4  @ 0x0000FFFE
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0x10]
	movs r2, #8
	ands r2, r0
	cmp r2, #0
	beq .L0805A59E
	strh r2, [r1, #0x10]
	movs r0, #0
	strh r0, [r1, #0xe]
	ldr r0, [r1, #0x20]
	adds r0, #4
	str r0, [r1, #0x20]
.L0805A59E:
	pop {r0}
	bx r0
	.align 2, 0
.L0805A5A4: .4byte 0x0000FFFE

	THUMB_FUNC_END func_0805A580

	THUMB_FUNC_START func_0805A5A8
func_0805A5A8: @ 0x0805A5A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x44]
	ldr r4, .L0805A600  @ banim_data
	bl GetAISLayerId
	cmp r0, #0
	bne .L0805A5FA
	ldr r0, .L0805A604  @ gUnknown_080DAEF0
	ldrb r1, [r0, #0x18]
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0, #0xc]
	ldr r2, [r5, #0x14]
	ldr r3, [r5, #0x18]
	ldr r4, [r5, #0x28]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r1, r4, r1
	ldr r0, [r1, #4]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r3, #0x30]
	ldr r0, .L0805A608  @ 0x000057F0
	adds r4, r4, r0
	str r4, [r3, #0x3c]
	ldr r1, [r5, #0x2c]
	ldr r0, [r6, #0x28]
	cmp r1, r0
	beq .L0805A5FA
	adds r0, r6, #0
	bl StartEkrChienCHR
	ldr r0, [r6, #0x28]
	str r0, [r5, #0x2c]
.L0805A5FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805A600: .4byte banim_data
.L0805A604: .4byte gUnknown_080DAEF0
.L0805A608: .4byte 0x000057F0

	THUMB_FUNC_END func_0805A5A8

	THUMB_FUNC_START func_0805A60C
func_0805A60C: @ 0x0805A60C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, .L0805A694  @ banim_data
	mov r9, r0
	ldr r2, .L0805A698  @ gUnknown_080DAEF0
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sl, r1
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	add r0, r9
	ldr r0, [r0, #0x10]
	ldr r1, [r4, #0x28]
	bl LZ77UnCompWram
	movs r2, #6
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	mov r3, r9
	adds r1, r0, r3
	ldr r2, [r1, #0xc]
	ldr r3, [r4, #0x28]
	ldr r7, .L0805A69C  @ gUnknown_085B9D5C
	cmp r5, #0xff
	beq .L0805A66A
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
.L0805A66A:
	ldr r0, .L0805A69C  @ gUnknown_085B9D5C
	str r0, [sp]
	cmp r6, #0xff
	beq .L0805A67C
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	str r3, [sp]
.L0805A67C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne .L0805A6A4
	ldr r5, [r4, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r2, .L0805A6A0  @ 0x000057F0
	adds r1, r5, r2
	b .L0805A6B2
	.align 2, 0
.L0805A694: .4byte banim_data
.L0805A698: .4byte gUnknown_080DAEF0
.L0805A69C: .4byte gUnknown_085B9D5C
.L0805A6A0: .4byte 0x000057F0
.L0805A6A4:
	ldr r5, [r4, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r3, .L0805A70C  @ 0x000057F0
	adds r1, r5, r3
.L0805A6B2:
	movs r0, #1
	str r0, [r1]
	mov r1, r8
	adds r0, r7, #0
	bl BsoCreate
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r4, #2]
	movs r5, #0
	strh r0, [r2, #2]
	ldrh r0, [r4, #4]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0xc
	movs r1, #0x80
	lsls r1, r1, #4
	adds r6, r1, #0
	orrs r0, r6
	ldrh r1, [r4, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #9
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r5, [r2, #0xe]
	ldrh r0, [r4, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r4, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r4, #0x14]
	str r4, [r2, #0x44]
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0xc4
	bne .L0805A710
	str r5, [r4, #0x18]
	b .L0805A752
	.align 2, 0
.L0805A70C: .4byte 0x000057F0
.L0805A710:
	mov r1, sl
	ldr r0, [sp]
	bl BsoCreate
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r4, #2]
	strh r0, [r2, #2]
	ldrh r0, [r4, #4]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0xc
	orrs r0, r6
	ldrh r1, [r4, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #9
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r5, [r2, #0xe]
	ldrh r0, [r4, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r4, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r4, #0x18]
	str r4, [r2, #0x44]
.L0805A752:
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	add r0, r9
	ldr r0, [r0, #0x1c]
	ldr r1, [r4, #0x20]
	bl LZ77UnCompWram
	movs r2, #8
	ldrsh r1, [r4, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0805A77E
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r1, .L0805A7AC  @ character_battle_animation_palette_table
	adds r0, r0, r1
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x20]
	bl LZ77UnCompWram
.L0805A77E:
	ldrb r1, [r4, #1]
	lsls r1, r1, #5
	ldr r0, [r4, #0x20]
	adds r0, r0, r1
	ldrh r1, [r4, #0x10]
	lsls r1, r1, #5
	ldr r2, .L0805A7B0  @ gPal+0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	movs r0, #0
	str r0, [r4, #0x2c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805A7AC: .4byte character_battle_animation_palette_table
.L0805A7B0: .4byte gPal+0x200

	THUMB_FUNC_END func_0805A60C

	THUMB_FUNC_START func_0805A7B4
func_0805A7B4: @ 0x0805A7B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, .L0805A82C  @ banim_data
	mov sl, r0
	ldr r2, .L0805A830  @ gUnknown_080DAEF0
	ldrh r0, [r7, #0xa]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r4, [r1]
	adds r0, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	movs r1, #6
	ldrsh r0, [r7, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x10]
	ldr r1, [r7, #0x28]
	bl LZ77UnCompWram
	movs r2, #6
	ldrsh r0, [r7, r2]
	lsls r0, r0, #5
	mov r2, sl
	adds r1, r0, r2
	ldr r2, [r1, #0xc]
	ldr r3, [r7, #0x28]
	ldr r0, .L0805A834  @ gUnknown_085B9D5C
	mov r8, r0
	cmp r4, #0xff
	beq .L0805A804
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r3
	mov r8, r0
.L0805A804:
	ldr r0, .L0805A834  @ gUnknown_085B9D5C
	mov r9, r0
	cmp r5, #0xff
	beq .L0805A816
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov r9, r3
.L0805A816:
	ldrh r0, [r7, #0xc]
	cmp r0, #0
	bne .L0805A83C
	ldr r4, [r7, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, .L0805A838  @ 0x000057F0
	adds r1, r4, r2
	b .L0805A84A
	.align 2, 0
.L0805A82C: .4byte banim_data
.L0805A830: .4byte gUnknown_080DAEF0
.L0805A834: .4byte gUnknown_085B9D5C
.L0805A838: .4byte 0x000057F0
.L0805A83C:
	ldr r4, [r7, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, .L0805A924  @ 0x000057F0
	adds r1, r4, r0
.L0805A84A:
	movs r0, #1
	str r0, [r1]
	ldr r6, [r7, #0x14]
	mov r1, r8
	str r1, [r6, #0x24]
	str r1, [r6, #0x20]
	ldr r0, [r7, #0x24]
	str r0, [r6, #0x30]
	ldrh r0, [r7, #2]
	movs r5, #0
	movs r3, #0
	strh r0, [r6, #2]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #0x10]
	lsls r0, r0, #0xc
	movs r2, #0x80
	lsls r2, r2, #4
	adds r4, r2, #0
	orrs r0, r4
	ldrh r1, [r7, #0xe]
	orrs r0, r1
	strh r0, [r6, #8]
	ldrh r1, [r6, #0xc]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r2, #0
	ands r0, r1
	strh r0, [r6, #0xc]
	strh r3, [r6, #0x10]
	strh r3, [r6, #6]
	strh r3, [r6, #0xe]
	ldrh r0, [r7, #0xa]
	strb r0, [r6, #0x12]
	ldr r0, [r7, #0x1c]
	str r0, [r6, #0x2c]
	strb r5, [r6, #0x14]
	str r6, [r7, #0x14]
	ldr r6, [r7, #0x18]
	mov r0, r9
	str r0, [r6, #0x24]
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x24]
	str r0, [r6, #0x30]
	ldrh r0, [r7, #2]
	strh r0, [r6, #2]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #0x10]
	lsls r0, r0, #0xc
	orrs r0, r4
	ldrh r1, [r7, #0xe]
	orrs r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #0xc]
	ands r2, r0
	strh r2, [r6, #0xc]
	strh r3, [r6, #0x10]
	strh r3, [r6, #6]
	strh r3, [r6, #0xe]
	ldrh r0, [r7, #0xa]
	strb r0, [r6, #0x12]
	ldr r0, [r7, #0x1c]
	str r0, [r6, #0x2c]
	strb r5, [r6, #0x14]
	str r6, [r7, #0x18]
	movs r1, #6
	ldrsh r0, [r7, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r1, [r7, #0x20]
	bl LZ77UnCompWram
	movs r2, #8
	ldrsh r1, [r7, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0805A8FA
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r2, .L0805A928  @ character_battle_animation_palette_table
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	ldr r1, [r7, #0x20]
	bl LZ77UnCompWram
.L0805A8FA:
	ldrb r1, [r7, #1]
	lsls r1, r1, #5
	ldr r0, [r7, #0x20]
	adds r0, r0, r1
	ldrh r1, [r7, #0x10]
	lsls r1, r1, #5
	ldr r2, .L0805A92C  @ gPal+0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805A924: .4byte 0x000057F0
.L0805A928: .4byte character_battle_animation_palette_table
.L0805A92C: .4byte gPal+0x200

	THUMB_FUNC_END func_0805A7B4

	THUMB_FUNC_START func_0805A930
func_0805A930: @ 0x0805A930
	push {lr}
	strh r1, [r0, #6]
	strh r2, [r0, #8]
	bl func_0805A7B4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805A930

	THUMB_FUNC_START func_0805A940
func_0805A940: @ 0x0805A940
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	ldr r2, [r0, #0x14]
	strh r1, [r2, #2]
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldr r2, [r0, #0x18]
	ldrh r1, [r0, #2]
	strh r1, [r2, #2]
	ldrh r0, [r0, #4]
	strh r0, [r2, #4]
	bx lr

	THUMB_FUNC_END func_0805A940

	THUMB_FUNC_START func_0805A95C
func_0805A95C: @ 0x0805A95C
	lsls r1, r1, #0x10
	ldr r2, [r0, #0x14]
	lsrs r1, r1, #6
	strh r1, [r2, #8]
	ldr r2, [r0, #0x18]
	strh r1, [r2, #8]
	bx lr

	THUMB_FUNC_END func_0805A95C

	THUMB_FUNC_START func_0805A96C
func_0805A96C: @ 0x0805A96C
	push {lr}
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x18]
	ldrh r0, [r1, #0xe]
	ldr r1, .L0805A984  @ 0x0000FFFE
	cmp r0, r1
	beq .L0805A988
	ldrh r0, [r2, #0xe]
	cmp r0, r1
	beq .L0805A988
	movs r0, #0
	b .L0805A98A
	.align 2, 0
.L0805A984: .4byte 0x0000FFFE
.L0805A988:
	movs r0, #1
.L0805A98A:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0805A96C

	THUMB_FUNC_START func_0805A990
func_0805A990: @ 0x0805A990
	ldr r3, [r0, #0x14]
	ldrh r1, [r3, #0x10]
	movs r2, #8
	orrs r1, r2
	strh r1, [r3, #0x10]
	ldr r3, [r0, #0x18]
	ldrh r0, [r3, #0x10]
	orrs r2, r0
	strh r2, [r3, #0x10]
	bx lr

	THUMB_FUNC_END func_0805A990

	THUMB_FUNC_START func_0805A9A4
func_0805A9A4: @ 0x0805A9A4
	push {lr}
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #0xe]
	ldr r0, .L0805A9B4  @ 0x0000FFFF
	cmp r1, r0
	bne .L0805A9B8
	movs r0, #1
	b .L0805A9BA
	.align 2, 0
.L0805A9B4: .4byte 0x0000FFFF
.L0805A9B8:
	movs r0, #0
.L0805A9BA:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0805A9A4

	THUMB_FUNC_START StartEkrAnimeDrvProc
StartEkrAnimeDrvProc: @ 0x0805A9C0
	push {r4, lr}
	ldr r4, .L0805A9D8  @ gUnknown_0201FB18
	ldr r0, .L0805A9DC  @ gUnknown_085B9DAC
	movs r1, #4
	bl SpawnProc
	str r0, [r4]
	bl BsoInit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805A9D8: .4byte gUnknown_0201FB18
.L0805A9DC: .4byte gUnknown_085B9DAC

	THUMB_FUNC_END StartEkrAnimeDrvProc

	THUMB_FUNC_START EndEkrAnimeDrvProc
EndEkrAnimeDrvProc: @ 0x0805A9E0
	push {lr}
	ldr r0, .L0805A9F0  @ gUnknown_0201FB18
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0805A9F0: .4byte gUnknown_0201FB18

	THUMB_FUNC_END EndEkrAnimeDrvProc

	THUMB_FUNC_START ExecAllAIS
ExecAllAIS: @ 0x0805A9F4
	push {lr}
	bl BsoUpdateAll
	pop {r0}
	bx r0

	THUMB_FUNC_END ExecAllAIS

	THUMB_FUNC_START StartEkrUnitMainMini
StartEkrUnitMainMini: @ 0x0805AA00
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L0805AA24  @ gUnknown_085B9DC4
	movs r1, #4
	bl SpawnProc
	adds r5, r0, #0
	adds r0, r4, #0
	bl func_0805A60C
	str r4, [r5, #0x5c]
	str r5, [r4, #0x34]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805AA24: .4byte gUnknown_085B9DC4

	THUMB_FUNC_END StartEkrUnitMainMini

	THUMB_FUNC_START func_0805AA28
func_0805AA28: @ 0x0805AA28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl BsoRemove
	ldr r0, [r4, #0x18]
	bl BsoRemove
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x34]
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805AA28

	THUMB_FUNC_START EkrUnitMainMini_OnLoop
EkrUnitMainMini_OnLoop: @ 0x0805AA4C
	push {r4, lr}
	ldr r4, [r0, #0x5c]
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl func_0805A3DC
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl func_0805A3DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrUnitMainMini_OnLoop

	THUMB_FUNC_START func_0805AA68
func_0805AA68: @ 0x0805AA68
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, .L0805AAD0  @ battle_terrain_table
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	negs r4, r4
	cmp r0, r4
	beq .L0805AAA6
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
.L0805AAA6:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0805AABC
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZ77UnCompWram
.L0805AABC:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt .L0805AAD4
	cmp r0, #1
	bge .L0805AAE2
	cmp r0, #0
	beq .L0805AAD8
	b .L0805AAE2
	.align 2, 0
.L0805AAD0: .4byte battle_terrain_table
.L0805AAD4:
	cmp r0, #4
	bne .L0805AAE2
.L0805AAD8:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b .L0805AAF0
.L0805AAE2:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
.L0805AAF0:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov r9, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq .L0805AB74
	cmp r4, r0
	blt .L0805ABD4
	cmp r4, #3
	bgt .L0805ABD4
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, .L0805AB70  @ gPal
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, r9
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r6, #0
	bl func_0805AE58
	b .L0805ABD4
	.align 2, 0
.L0805AB70: .4byte gPal
.L0805AB74:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0805ABA2
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterDataMove
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, .L0805ABEC  @ gPal+0x200
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
.L0805ABA2:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq .L0805ABD0
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterDataMove
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, .L0805ABEC  @ gPal+0x200
	adds r1, r1, r0
	mov r0, r9
	movs r2, #8
	bl CpuFastSet
.L0805ABD0:
	bl EnablePalSync
.L0805ABD4:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls .L0805ABE2
	b .L0805AE02
.L0805ABE2:
	lsls r0, r0, #2
	ldr r1, .L0805ABF0  @ .L0805ABF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805ABEC: .4byte gPal+0x200
.L0805ABF0: .4byte .L0805ABF4
.L0805ABF4: @ jump table
	.4byte .L0805AC28 @ case 0
	.4byte .L0805AC08 @ case 1
	.4byte .L0805AC10 @ case 2
	.4byte .L0805AC18 @ case 3
	.4byte .L0805AC20 @ case 4
.L0805AC08:
	movs r0, #1
	bl EnableBgSync
	b .L0805AE02
.L0805AC10:
	movs r0, #2
	bl EnableBgSync
	b .L0805AE02
.L0805AC18:
	movs r0, #4
	bl EnableBgSync
	b .L0805AE02
.L0805AC20:
	movs r0, #8
	bl EnableBgSync
	b .L0805AE02
.L0805AC28:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #6
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq .L0805AD16
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi .L0805AD16
	lsls r0, r0, #2
	ldr r1, .L0805AC4C  @ .L0805AC50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805AC4C: .4byte .L0805AC50
.L0805AC50: @ jump table
	.4byte .L0805AC64 @ case 0
	.4byte .L0805AC90 @ case 1
	.4byte .L0805ACBC @ case 2
	.4byte .L0805ACE8 @ case 3
	.4byte .L0805AC64 @ case 4
.L0805AC64:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0805AC8C  @ gUnknown_085C73B8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b .L0805AD0C
	.align 2, 0
.L0805AC8C: .4byte gUnknown_085C73B8
.L0805AC90:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0805ACB8  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b .L0805AD0C
	.align 2, 0
.L0805ACB8: .4byte gUnknown_085C72AC
.L0805ACBC:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0805ACE4  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b .L0805AD0C
	.align 2, 0
.L0805ACE4: .4byte gUnknown_085C72AC
.L0805ACE8:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0805AD34  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
.L0805AD0C:
	movs r1, #0x68
	movs r3, #2
	bl StartEkrsubAnimeEmulator
	str r0, [r6, #0x18]
.L0805AD16:
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0805AE02
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi .L0805AE02
	lsls r0, r0, #2
	ldr r1, .L0805AD38  @ .L0805AD3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805AD34: .4byte gUnknown_085C72AC
.L0805AD38: .4byte .L0805AD3C
.L0805AD3C: @ jump table
	.4byte .L0805AD50 @ case 0
	.4byte .L0805AD7C @ case 1
	.4byte .L0805ADA8 @ case 2
	.4byte .L0805ADD4 @ case 3
	.4byte .L0805AD50 @ case 4
.L0805AD50:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0805AD78  @ gUnknown_085C7438
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b .L0805ADF8
	.align 2, 0
.L0805AD78: .4byte gUnknown_085C7438
.L0805AD7C:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0805ADA4  @ gUnknown_085C7338
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b .L0805ADF8
	.align 2, 0
.L0805ADA4: .4byte gUnknown_085C7338
.L0805ADA8:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0805ADD0  @ gUnknown_085C7338
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b .L0805ADF8
	.align 2, 0
.L0805ADD0: .4byte gUnknown_085C7338
.L0805ADD4:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, .L0805AE10  @ gUnknown_085C7438
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
.L0805ADF8:
	movs r1, #0x68
	movs r3, #2
	bl StartEkrsubAnimeEmulator
	str r0, [r6, #0x14]
.L0805AE02:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805AE10: .4byte gUnknown_085C7438

	THUMB_FUNC_END func_0805AA68

	THUMB_FUNC_START func_0805AE14
func_0805AE14: @ 0x0805AE14
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0805AE38
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq .L0805AE2E
	bl Proc_End
.L0805AE2E:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq .L0805AE38
	bl Proc_End
.L0805AE38:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805AE14

	THUMB_FUNC_START func_0805AE40
func_0805AE40: @ 0x0805AE40
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [r0, #0x14]
	strh r1, [r5, #0x32]
	strh r2, [r5, #0x3a]
	ldr r5, [r0, #0x18]
	strh r3, [r5, #0x32]
	strh r4, [r5, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805AE40

	THUMB_FUNC_START func_0805AE58
func_0805AE58: @ 0x0805AE58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r4, #0
	mov sl, r4
	ldr r0, .L0805AE9C  @ gUnknown_085B9D6C
	movs r2, #0xc
	ldrsh r1, [r7, r2]
	lsls r2, r1, #3
	adds r2, r2, r0
	ldr r2, [r2]
	str r2, [sp, #0x10]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #0x14]
	movs r0, #0
	bl func_080559B0
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bhi .L0805AEEC
	lsls r0, r0, #2
	ldr r1, .L0805AEA0  @ .L0805AEA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805AE9C: .4byte gUnknown_085B9D6C
.L0805AEA0: .4byte .L0805AEA4
.L0805AEA4: @ jump table
	.4byte .L0805AEB8 @ case 0
	.4byte .L0805AEC0 @ case 1
	.4byte .L0805AED8 @ case 2
	.4byte .L0805AEEC @ case 3
	.4byte .L0805AEB8 @ case 4
.L0805AEB8:
	movs r4, #0x21
	movs r2, #0x30
	mov sl, r2
	b .L0805AF0C
.L0805AEC0:
	movs r4, #0x1d
	movs r0, #0x30
	mov sl, r0
	ldr r0, .L0805AED4  @ gUnknown_02017744
	ldr r0, [r0]
	movs r5, #4
	negs r5, r5
.L0805AECE:
	cmp r0, #1
	bne .L0805AF0E
	b .L0805AF0C
	.align 2, 0
.L0805AED4: .4byte gUnknown_02017744
.L0805AED8:
	movs r4, #3
	movs r1, #0x30
	mov sl, r1
	ldr r0, .L0805AEE8  @ gUnknown_02017744
	ldr r0, [r0]
	movs r5, #0x1e
	negs r5, r5
	b .L0805AECE
	.align 2, 0
.L0805AEE8: .4byte gUnknown_02017744
.L0805AEEC:
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L0805AEFE
	movs r4, #0x27
	movs r0, #3
	mov sl, r0
.L0805AEFE:
	movs r2, #6
	ldrsh r0, [r7, r2]
	cmp r0, r1
	beq .L0805AF0C
	movs r4, #3
	movs r0, #0x2a
	mov sl, r0
.L0805AF0C:
	movs r5, #0
.L0805AF0E:
	movs r1, #1
	negs r1, r1
	mov r9, r1
	lsls r2, r4, #1
	ldr r4, .L0805AF94  @ gUnknown_0201CF84
	adds r2, r2, r4
	movs r0, #0xf
	mov r8, r0
	str r0, [sp]
	movs r6, #5
	str r6, [sp, #4]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #4
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, r9
	movs r3, #0x42
	bl func_08070EF4
	mov r0, sl
	lsls r2, r0, #1
	adds r2, r2, r4
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #8
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, r9
	movs r3, #0x42
	bl func_08070EF4
	lsls r0, r5, #1
	adds r4, r4, r0
	ldr r2, .L0805AF98  @ 0xFFFFFA96
	adds r4, r4, r2
	ldr r2, .L0805AF9C  @ gBg2Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	mov r0, r9
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl func_08070EF4
	movs r0, #4
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805AF94: .4byte gUnknown_0201CF84
.L0805AF98: .4byte 0xFFFFFA96
.L0805AF9C: .4byte gBg2Tm

	THUMB_FUNC_END func_0805AE58

	THUMB_FUNC_START func_0805AFA0
func_0805AFA0: @ 0x0805AFA0
	push {lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi .L0805AFE8
	lsls r0, r0, #2
	ldr r1, .L0805AFBC  @ .L0805AFC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0805AFBC: .4byte .L0805AFC0
.L0805AFC0: @ jump table
	.4byte .L0805AFD4 @ case 0
	.4byte .L0805AFDE @ case 1
	.4byte .L0805AFE8 @ case 2
	.4byte .L0805AFE8 @ case 3
	.4byte .L0805AFD4 @ case 4
.L0805AFD4:
	movs r2, #0x30
	cmp r3, #0
	bne .L0805AFF0
	movs r2, #0x21
	b .L0805AFF0
.L0805AFDE:
	movs r2, #0x30
	cmp r3, #0
	bne .L0805AFF0
	movs r2, #0x1d
	b .L0805AFF0
.L0805AFE8:
	movs r2, #0x30
	cmp r3, #0
	bne .L0805AFF0
	movs r2, #3
.L0805AFF0:
	ldr r0, .L0805B014  @ gUnknown_080DAF60
	movs r1, #1
	negs r1, r1
	lsls r2, r2, #1
	ldr r3, .L0805B018  @ gUnknown_0201CF84
	adds r2, r2, r3
	movs r3, #0xf
	str r3, [sp]
	movs r3, #5
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x42
	bl func_08070EF4
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
.L0805B014: .4byte gUnknown_080DAF60
.L0805B018: .4byte gUnknown_0201CF84

	THUMB_FUNC_END func_0805AFA0

	THUMB_FUNC_START SetBattleAnimArenaFlag
SetBattleAnimArenaFlag: @ 0x0805B01C
	ldr r1, .L0805B024  @ gBoolBattleAnimIsArena
	str r0, [r1]
	bx lr
	.align 2, 0
.L0805B024: .4byte gBoolBattleAnimIsArena

	THUMB_FUNC_END SetBattleAnimArenaFlag

	THUMB_FUNC_START GetBattleAnimArenaFlag
GetBattleAnimArenaFlag: @ 0x0805B028
	ldr r0, .L0805B030  @ gBoolBattleAnimIsArena
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L0805B030: .4byte gBoolBattleAnimIsArena

	THUMB_FUNC_END GetBattleAnimArenaFlag

	THUMB_FUNC_START func_0805B034
func_0805B034: @ 0x0805B034
	push {r4, lr}
	sub sp, #0x10
	asrs r4, r0, #3
	movs r1, #7
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, .L0805B074  @ gUnknown_0201D438
	adds r4, r4, r0
	ldr r2, .L0805B078  @ gBg3Tm
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	subs r0, #0x17
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl func_08070EF4
	movs r0, #8
	bl EnableBgSync
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B074: .4byte gUnknown_0201D438
.L0805B078: .4byte gBg3Tm

	THUMB_FUNC_END func_0805B034

	THUMB_FUNC_START PlayBattleCroudSfxIfArena
PlayBattleCroudSfxIfArena: @ 0x0805B07C
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L0805B090
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8f
	bl SomeBattlePlaySound_8071990
.L0805B090:
	pop {r0}
	bx r0

	THUMB_FUNC_END PlayBattleCroudSfxIfArena

	THUMB_FUNC_START func_0805B094
func_0805B094: @ 0x0805B094
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq .L0805B0A4
	movs r0, #0x8e
	bl func_08071A44
.L0805B0A4:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805B094

	THUMB_FUNC_START BeginAnimsOnBattle_Arena
BeginAnimsOnBattle_Arena: @ 0x0805B0A8
	push {lr}
	bl StartEkrBattleDeamon
	bl BsoInit
	bl func_08052184
	ldr r1, .L0805B0C8  @ gUnknown_02017744
	str r0, [r1]
	bl NewEkrTogiInitPROC
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
.L0805B0C8: .4byte gUnknown_02017744

	THUMB_FUNC_END BeginAnimsOnBattle_Arena

	THUMB_FUNC_START func_0805B0CC
func_0805B0CC: @ 0x0805B0CC
	push {lr}
	bl BsoInit
	bl NewEkrTogiEndPROC
	ldr r0, .L0805B0E8  @ MainUpdate_8055C68
	bl SetMainFunc
	ldr r0, .L0805B0EC  @ gUnknown_085B9A34
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0805B0E8: .4byte MainUpdate_8055C68
.L0805B0EC: .4byte gUnknown_085B9A34

	THUMB_FUNC_END func_0805B0CC

	THUMB_FUNC_START NewEkrTogiInitPROC
NewEkrTogiInitPROC: @ 0x0805B0F0
	push {lr}
	ldr r0, .L0805B100  @ gUnknown_085B9DDC
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0805B100: .4byte gUnknown_085B9DDC

	THUMB_FUNC_END NewEkrTogiInitPROC

	THUMB_FUNC_START func_0805B104
func_0805B104: @ 0x0805B104
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl InitOam
	ldr r1, .L0805B178  @ gUnknown_02017744
	ldr r0, .L0805B17C  @ gBattleAnimInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	bl func_08051CC4
	bl func_080599E8
	bl StartEkrGauge
	bl StartEkrDispUP
	bl StartEkrBattle
	ldr r0, .L0805B180  @ gUnknown_085BEF94
	ldr r4, .L0805B184  @ gPal+0xC0
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	subs r4, #0xc0
	ldr r5, .L0805B188  @ gUnknown_020165C8
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	mov r0, r8
	bl Proc_Break
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B178: .4byte gUnknown_02017744
.L0805B17C: .4byte gBattleAnimInitialHitSide
.L0805B180: .4byte gUnknown_085BEF94
.L0805B184: .4byte gPal+0xC0
.L0805B188: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_0805B104

	THUMB_FUNC_START func_0805B18C
func_0805B18C: @ 0x0805B18C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, .L0805B1EC  @ gUnknown_085BC188
	ldr r1, .L0805B1F0  @ 0x06008000
	bl LZ77UnCompVram
	ldr r0, .L0805B1F4  @ gUnknown_085BE7F4
	ldr r6, .L0805B1F8  @ gUnknown_02019790
	adds r1, r6, #0
	bl LZ77UnCompWram
	movs r1, #1
	negs r1, r1
	ldr r2, .L0805B1FC  @ gUnknown_0201D428
	movs r0, #0x2e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	adds r0, r6, #0
	movs r3, #0x42
	bl func_08070EF4
	movs r0, #0
	bl func_0805B034
	movs r0, #8
	bl EnableBgSync
	strh r4, [r5, #0x2c]
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8e
	bl SomeBattlePlaySound_8071990
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B1EC: .4byte gUnknown_085BC188
.L0805B1F0: .4byte 0x06008000
.L0805B1F4: .4byte gUnknown_085BE7F4
.L0805B1F8: .4byte gUnknown_02019790
.L0805B1FC: .4byte gUnknown_0201D428

	THUMB_FUNC_END func_0805B18C

	THUMB_FUNC_START func_0805B200
func_0805B200: @ 0x0805B200
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L0805B25C  @ gUnknown_020165C8
	ldr r4, .L0805B260  @ gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne .L0805B254
	adds r0, r6, #0
	bl Proc_Break
.L0805B254:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B25C: .4byte gUnknown_020165C8
.L0805B260: .4byte gPal

	THUMB_FUNC_END func_0805B200

	THUMB_FUNC_START func_0805B264
func_0805B264: @ 0x0805B264
	push {r4, lr}
	adds r4, r0, #0
	bl NewEkrTogiColor
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805B264

	THUMB_FUNC_START NewEkrTogiEndPROC
NewEkrTogiEndPROC: @ 0x0805B278
	push {lr}
	ldr r0, .L0805B28C  @ gUnknown_085B9E0C
	movs r1, #3
	bl SpawnProc
	bl EndEkrTogiColor
	pop {r0}
	bx r0
	.align 2, 0
.L0805B28C: .4byte gUnknown_085B9E0C

	THUMB_FUNC_END NewEkrTogiEndPROC

	THUMB_FUNC_START func_0805B290
func_0805B290: @ 0x0805B290
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805B2B4  @ gPal
	ldr r1, .L0805B2B8  @ gUnknown_020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B2B4: .4byte gPal
.L0805B2B8: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_0805B290

	THUMB_FUNC_START func_0805B2BC
func_0805B2BC: @ 0x0805B2BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L0805B318  @ gUnknown_020165C8
	ldr r4, .L0805B31C  @ gPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne .L0805B310
	adds r0, r6, #0
	bl Proc_Break
.L0805B310:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B318: .4byte gUnknown_020165C8
.L0805B31C: .4byte gPal

	THUMB_FUNC_END func_0805B2BC

	THUMB_FUNC_START func_0805B320
func_0805B320: @ 0x0805B320
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl EndEkrGauge
	ldr r0, .L0805B344  @ OnGameLoopMain
	bl SetMainFunc
	ldr r0, .L0805B348  @ OnVBlank
	bl SetOnVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B344: .4byte OnGameLoopMain
.L0805B348: .4byte OnVBlank

	THUMB_FUNC_END func_0805B320

	THUMB_FUNC_START NewEkrTogiColor
NewEkrTogiColor: @ 0x0805B34C
	push {r4, lr}
	ldr r4, .L0805B370  @ gUnknown_0201FB24
	ldr r0, .L0805B374  @ gUnknown_085B9E34
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805B378  @ gUnknown_080DB026
	str r1, [r0, #0x48]
	ldr r1, .L0805B37C  @ gUnknown_085B9E4C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B370: .4byte gUnknown_0201FB24
.L0805B374: .4byte gUnknown_085B9E34
.L0805B378: .4byte gUnknown_080DB026
.L0805B37C: .4byte gUnknown_085B9E4C

	THUMB_FUNC_END NewEkrTogiColor

	THUMB_FUNC_START EndEkrTogiColor
EndEkrTogiColor: @ 0x0805B380
	push {lr}
	ldr r0, .L0805B390  @ gUnknown_0201FB24
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L0805B390: .4byte gUnknown_0201FB24

	THUMB_FUNC_END EndEkrTogiColor

	THUMB_FUNC_START func_0805B394
func_0805B394: @ 0x0805B394
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt .L0805B3C0
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, .L0805B3C8  @ gPal+0xC0
	movs r2, #0x20
	bl CpuFastSet
	bl EnablePalSync
.L0805B3C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B3C8: .4byte gPal+0xC0

	THUMB_FUNC_END func_0805B394

	THUMB_FUNC_START StartSpellAnimation
StartSpellAnimation: @ 0x0805B3CC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0805B3F4  @ gBattleSpellAnimationId1
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, .L0805B3F8  @ gUnknown_085D4E60
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B3F4: .4byte gBattleSpellAnimationId1
.L0805B3F8: .4byte gUnknown_085D4E60

	THUMB_FUNC_END StartSpellAnimation

	THUMB_FUNC_START func_0805B3FC
func_0805B3FC: @ 0x0805B3FC
	bx lr

	THUMB_FUNC_END func_0805B3FC

	THUMB_FUNC_START func_0805B400
func_0805B400: @ 0x0805B400
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, .L0805B43C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805B440  @ gUnknown_085D4F98
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0805B43C: .4byte gUnknown_0201774C
.L0805B440: .4byte gUnknown_085D4F98

	THUMB_FUNC_END func_0805B400

	THUMB_FUNC_START func_0805B444
func_0805B444: @ 0x0805B444
	ldr r1, .L0805B450  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L0805B450: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805B444

	THUMB_FUNC_START func_0805B454
func_0805B454: @ 0x0805B454
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	ldr r0, .L0805B4D4  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r4, .L0805B4D8  @ gUnknown_0201FDC4
	cmp r0, #0
	bne .L0805B46C
	ldr r4, .L0805B4DC  @ gUnknown_0201FF04
.L0805B46C:
	ldrh r0, [r2, #0x2e]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	ldr r1, [r2, #0x50]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	movs r1, #0
	ldr r0, [r2, #0x44]
	mov r8, r0
	ldr r6, [r2, #0x48]
	mov sl, r6
	ldr r7, .L0805B4E0  @ gUnknown_0875879C
	mov ip, r7
	ldr r5, [r2, #0x4c]
	ldr r0, .L0805B4E4  @ gDispIo
	mov r9, r0
.L0805B48C:
	mov r6, sl
	adds r0, r3, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov r6, r9
	ldrh r6, [r6, #0x20]
	adds r0, r0, r6
	strh r0, [r4]
	adds r4, #2
	adds r1, #1
	cmp r1, #0x77
	bls .L0805B48C
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne .L0805B4C6
	adds r0, r2, #0
	bl Proc_End
.L0805B4C6:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B4D4: .4byte gUnknown_0201FDB8
.L0805B4D8: .4byte gUnknown_0201FDC4
.L0805B4DC: .4byte gUnknown_0201FF04
.L0805B4E0: .4byte gUnknown_0875879C
.L0805B4E4: .4byte gDispIo

	THUMB_FUNC_END func_0805B454

	THUMB_FUNC_START func_0805B4E8
func_0805B4E8: @ 0x0805B4E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0805B528  @ gUnknown_085D4FB8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	ldr r2, .L0805B52C  @ gUnknown_0201FDC4
.L0805B502:
	lsrs r0, r1, #1
	negs r0, r0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls .L0805B502
	ldr r2, .L0805B530  @ gUnknown_0201FF04
	movs r1, #0
.L0805B514:
	lsrs r0, r1, #1
	negs r0, r0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls .L0805B514
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B528: .4byte gUnknown_085D4FB8
.L0805B52C: .4byte gUnknown_0201FDC4
.L0805B530: .4byte gUnknown_0201FF04

	THUMB_FUNC_END func_0805B4E8

	THUMB_FUNC_START func_0805B534
func_0805B534: @ 0x0805B534
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x44]
	cmp r0, r1
	bne .L0805B54E
	adds r0, r2, #0
	bl Proc_Break
.L0805B54E:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805B534

	THUMB_FUNC_START func_0805B554
func_0805B554: @ 0x0805B554
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805B57C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805B580  @ gUnknown_085D4FD0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B57C: .4byte gUnknown_0201774C
.L0805B580: .4byte gUnknown_085D4FD0

	THUMB_FUNC_END func_0805B554

	THUMB_FUNC_START func_0805B584
func_0805B584: @ 0x0805B584
	ldr r1, .L0805B590  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L0805B590: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805B584

	THUMB_FUNC_START func_0805B594
func_0805B594: @ 0x0805B594
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, .L0805B5D0  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r1, .L0805B5D4  @ gUnknown_0201FDC4
	cmp r0, #0
	bne .L0805B5A4
	ldr r1, .L0805B5D8  @ gUnknown_0201FF04
.L0805B5A4:
	movs r2, #0
	ldr r5, [r3, #0x44]
	ldr r4, .L0805B5DC  @ gDispIo
.L0805B5AA:
	ldrh r0, [r4, #0x20]
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x77
	bls .L0805B5AA
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bne .L0805B5CA
	adds r0, r3, #0
	bl Proc_End
.L0805B5CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B5D0: .4byte gUnknown_0201FDB8
.L0805B5D4: .4byte gUnknown_0201FDC4
.L0805B5D8: .4byte gUnknown_0201FF04
.L0805B5DC: .4byte gDispIo

	THUMB_FUNC_END func_0805B594

	THUMB_FUNC_START func_0805B5E0
func_0805B5E0: @ 0x0805B5E0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r1, .L0805B628  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805B62C  @ gUnknown_085D4FF0
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	mov r0, r8
	str r0, [r7, #0x5c]
	movs r1, #0
	mov r9, r1
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	str r4, [r7, #0x44]
	str r5, [r7, #0x54]
	str r6, [r7, #0x58]
	mov r0, r8
	bl GetOpponentFrontAIS
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805B634
	ldr r0, .L0805B630  @ 0x0000FFB8
	b .L0805B636
	.align 2, 0
.L0805B628: .4byte gUnknown_0201774C
.L0805B62C: .4byte gUnknown_085D4FF0
.L0805B630: .4byte 0x0000FFB8
.L0805B634:
	ldr r0, .L0805B654  @ 0x0000FFF8
.L0805B636:
	strh r0, [r7, #0x32]
	ldr r0, .L0805B658  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805B662
	mov r0, r8
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805B65C
	ldrh r0, [r7, #0x32]
	adds r0, #0x18
	b .L0805B660
	.align 2, 0
.L0805B654: .4byte 0x0000FFF8
.L0805B658: .4byte gBattleAnimSceneLayoutEnum
.L0805B65C:
	ldrh r0, [r7, #0x32]
	subs r0, #0x18
.L0805B660:
	strh r0, [r7, #0x32]
.L0805B662:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805B5E0

	THUMB_FUNC_START func_0805B670
func_0805B670: @ 0x0805B670
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, .L0805B6B8  @ gUnknown_0201FB2C
	ldr r0, [r0]
	ldr r5, .L0805B6BC  @ gUnknown_0201FB38
	cmp r0, #0
	bne .L0805B680
	ldr r5, .L0805B6C0  @ gUnknown_0201FC78
.L0805B680:
	ldr r1, [r4, #0x54]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r1, [r4, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, .L0805B6C4  @ 0x0000FFFF
	cmp r2, r0
	beq .L0805B6EC
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r2, #0
	ldr r6, [r4, #0x44]
	ldr r7, .L0805B6C8  @ 0x00007FFF
	mov ip, r7
.L0805B6A8:
	ldrh r1, [r3]
	movs r7, #0
	ldrsh r0, [r3, r7]
	cmp r0, ip
	bne .L0805B6CC
	movs r0, #0
	b .L0805B6DE
	.align 2, 0
.L0805B6B8: .4byte gUnknown_0201FB2C
.L0805B6BC: .4byte gUnknown_0201FB38
.L0805B6C0: .4byte gUnknown_0201FC78
.L0805B6C4: .4byte 0x0000FFFF
.L0805B6C8: .4byte 0x00007FFF
.L0805B6CC:
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	ldrh r7, [r3, #2]
	adds r0, r0, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
.L0805B6DE:
	strh r0, [r5]
	adds r3, #4
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls .L0805B6A8
	b .L0805B6FC
.L0805B6EC:
	movs r2, #0
	ldr r6, [r4, #0x44]
	movs r0, #0
.L0805B6F2:
	strh r0, [r5]
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls .L0805B6F2
.L0805B6FC:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r6
	bne .L0805B718
	ldr r1, .L0805B720  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805B718:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B720: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805B670

	THUMB_FUNC_START func_0805B724
func_0805B724: @ 0x0805B724
	push {lr}
	ldr r0, .L0805B744  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805B740
	ldr r3, .L0805B748  @ 0x04000014
	ldr r2, .L0805B74C  @ gUnknown_0201FDC0
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805B740:
	pop {r0}
	bx r0
	.align 2, 0
.L0805B744: .4byte 0x04000004
.L0805B748: .4byte 0x04000014
.L0805B74C: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END func_0805B724

	THUMB_FUNC_START func_0805B750
func_0805B750: @ 0x0805B750
	push {lr}
	ldr r0, .L0805B770  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805B76C
	ldr r3, .L0805B774  @ 0x04000016
	ldr r2, .L0805B778  @ gUnknown_0201FDC0
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805B76C:
	pop {r0}
	bx r0
	.align 2, 0
.L0805B770: .4byte 0x04000004
.L0805B774: .4byte 0x04000016
.L0805B778: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END func_0805B750

	THUMB_FUNC_START func_0805B77C
func_0805B77C: @ 0x0805B77C
	push {lr}
	ldr r0, .L0805B7AC  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805B7A6
	ldr r3, .L0805B7B0  @ 0x0400001A
	ldr r2, .L0805B7B4  @ gUnknown_0201FB34
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #6
	ldr r2, .L0805B7B8  @ gUnknown_0201FDC0
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805B7A6:
	pop {r0}
	bx r0
	.align 2, 0
.L0805B7AC: .4byte 0x04000004
.L0805B7B0: .4byte 0x0400001A
.L0805B7B4: .4byte gUnknown_0201FB34
.L0805B7B8: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END func_0805B77C

	THUMB_FUNC_START func_0805B7BC
func_0805B7BC: @ 0x0805B7BC
	push {lr}
	ldr r0, .L0805B7EC  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805B7E6
	ldr r3, .L0805B7F0  @ 0x0400001A
	ldr r2, .L0805B7F4  @ gUnknown_0201FB34
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, .L0805B7F8  @ gUnknown_0201FDC0
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805B7E6:
	pop {r0}
	bx r0
	.align 2, 0
.L0805B7EC: .4byte 0x04000004
.L0805B7F0: .4byte 0x0400001A
.L0805B7F4: .4byte gUnknown_0201FB34
.L0805B7F8: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END func_0805B7BC

	THUMB_FUNC_START func_0805B7FC
func_0805B7FC: @ 0x0805B7FC
	push {lr}
	ldr r0, .L0805B81C  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0805B818
	ldr r3, .L0805B820  @ 0x0400001A
	ldr r2, .L0805B824  @ gUnknown_0201FB34
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
.L0805B818:
	pop {r0}
	bx r0
	.align 2, 0
.L0805B81C: .4byte 0x04000004
.L0805B820: .4byte 0x0400001A
.L0805B824: .4byte gUnknown_0201FB34

	THUMB_FUNC_END func_0805B7FC

	THUMB_FUNC_START func_0805B828
func_0805B828: @ 0x0805B828
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, .L0805B8C4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r6, .L0805B8C8  @ gUnknown_0201FDC4
	ldr r7, .L0805B8CC  @ gUnknown_0201FF04
	ldr r0, .L0805B8D0  @ gUnknown_0201FDBC
	mov sl, r0
	cmp r4, #2
	bne .L0805B88A
	ldr r1, .L0805B8D4  @ gUnknown_0201FB38
	movs r0, #0
	adds r5, r1, #0
	ldr r3, .L0805B8D8  @ gUnknown_0201FB2C
	mov ip, r3
	ldr r3, .L0805B8DC  @ gUnknown_0201FB30
	mov r8, r3
	ldr r3, .L0805B8E0  @ gUnknown_0201FB34
	mov r9, r3
.L0805B864:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls .L0805B864
	ldr r1, .L0805B8E4  @ gUnknown_0201FC78
	movs r0, #0
.L0805B872:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls .L0805B872
	movs r0, #0
	mov r1, ip
	str r0, [r1]
	mov r3, r8
	str r5, [r3]
	mov r0, r9
	str r5, [r0]
.L0805B88A:
	adds r1, r6, #0
	movs r0, #0
.L0805B88E:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls .L0805B88E
	adds r1, r7, #0
	movs r0, #0
.L0805B89C:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls .L0805B89C
	movs r0, #0
	ldr r1, .L0805B8E8  @ gUnknown_0201FDB8
	str r0, [r1]
	mov r3, sl
	str r6, [r3]
	ldr r0, .L0805B8EC  @ gUnknown_0201FDC0
	str r6, [r0]
	cmp r4, #1
	beq .L0805B8FC
	cmp r4, #1
	bcc .L0805B8F0
	cmp r4, #2
	beq .L0805B908
	b .L0805B90E
	.align 2, 0
.L0805B8C4: .4byte gUnknown_0201774C
.L0805B8C8: .4byte gUnknown_0201FDC4
.L0805B8CC: .4byte gUnknown_0201FF04
.L0805B8D0: .4byte gUnknown_0201FDBC
.L0805B8D4: .4byte gUnknown_0201FB38
.L0805B8D8: .4byte gUnknown_0201FB2C
.L0805B8DC: .4byte gUnknown_0201FB30
.L0805B8E0: .4byte gUnknown_0201FB34
.L0805B8E4: .4byte gUnknown_0201FC78
.L0805B8E8: .4byte gUnknown_0201FDB8
.L0805B8EC: .4byte gUnknown_0201FDC0
.L0805B8F0:
	ldr r0, .L0805B8F8  @ func_0805B724
	bl SetOnHBlankA
	b .L0805B90E
	.align 2, 0
.L0805B8F8: .4byte func_0805B724
.L0805B8FC:
	ldr r0, .L0805B904  @ func_0805B750
	bl SetOnHBlankA
	b .L0805B90E
	.align 2, 0
.L0805B904: .4byte func_0805B750
.L0805B908:
	ldr r0, .L0805B934  @ func_0805B750
	bl SetOnHBlankA
.L0805B90E:
	ldr r0, .L0805B938  @ gUnknown_085D5008
	movs r1, #0
	bl SpawnProc
	ldr r1, [sp]
	str r1, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r3, [sp, #4]
	str r3, [r0, #0x44]
	str r4, [r0, #0x48]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805B934: .4byte func_0805B750
.L0805B938: .4byte gUnknown_085D5008

	THUMB_FUNC_END func_0805B828

	THUMB_FUNC_START func_0805B93C
func_0805B93C: @ 0x0805B93C
	push {lr}
	adds r3, r2, #0
	movs r2, #0
	bl func_0805B828
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805B93C

	THUMB_FUNC_START func_0805B94C
func_0805B94C: @ 0x0805B94C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805B94C

	THUMB_FUNC_START func_0805B958
func_0805B958: @ 0x0805B958
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805B984  @ gBmSt
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, .L0805B988  @ gUnknown_0201FB30
	ldr r2, .L0805B98C  @ gUnknown_0201FDBC
	cmp r0, #0
	beq .L0805B9D0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne .L0805B9A0
	ldr r1, .L0805B990  @ gUnknown_0201FB2C
	ldr r0, [r1]
	cmp r0, #1
	bne .L0805B998
	movs r0, #0
	str r0, [r1]
	ldr r0, .L0805B994  @ gUnknown_0201FB38
	b .L0805B99E
	.align 2, 0
.L0805B984: .4byte gBmSt
.L0805B988: .4byte gUnknown_0201FB30
.L0805B98C: .4byte gUnknown_0201FDBC
.L0805B990: .4byte gUnknown_0201FB2C
.L0805B994: .4byte gUnknown_0201FB38
.L0805B998:
	movs r0, #1
	str r0, [r1]
	ldr r0, .L0805B9B4  @ gUnknown_0201FC78
.L0805B99E:
	str r0, [r3]
.L0805B9A0:
	ldr r1, .L0805B9B8  @ gUnknown_0201FDB8
	ldr r0, [r1]
	cmp r0, #1
	bne .L0805B9C4
	movs r0, #0
	str r0, [r1]
	ldr r1, .L0805B9BC  @ gUnknown_0201FDBC
	ldr r0, .L0805B9C0  @ gUnknown_0201FDC4
	b .L0805B9CC
	.align 2, 0
.L0805B9B4: .4byte gUnknown_0201FC78
.L0805B9B8: .4byte gUnknown_0201FDB8
.L0805B9BC: .4byte gUnknown_0201FDBC
.L0805B9C0: .4byte gUnknown_0201FDC4
.L0805B9C4:
	movs r0, #1
	str r0, [r1]
	ldr r1, .L0805BA08  @ gUnknown_0201FDBC
	ldr r0, .L0805BA0C  @ gUnknown_0201FF04
.L0805B9CC:
	str r0, [r1]
	adds r2, r1, #0
.L0805B9D0:
	ldr r1, .L0805BA10  @ gUnknown_0201FB34
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, .L0805BA14  @ gUnknown_0201FDC0
	ldr r0, [r2]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne .L0805BA00
	ldr r1, .L0805BA18  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
.L0805BA00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BA08: .4byte gUnknown_0201FDBC
.L0805BA0C: .4byte gUnknown_0201FF04
.L0805BA10: .4byte gUnknown_0201FB34
.L0805BA14: .4byte gUnknown_0201FDC0
.L0805BA18: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805B958

	THUMB_FUNC_START func_0805BA1C
func_0805BA1C: @ 0x0805BA1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, .L0805BA5C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805BA60  @ gUnknown_085D5028
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	adds r4, r4, r6
	strh r4, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x44]
	str r7, [r0, #0x48]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BA5C: .4byte gUnknown_0201774C
.L0805BA60: .4byte gUnknown_085D5028

	THUMB_FUNC_END func_0805BA1C

	THUMB_FUNC_START func_0805BA64
func_0805BA64: @ 0x0805BA64
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt .L0805BB18
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r6, #0x2c
	ldrsh r3, [r5, r6]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	subs r3, r3, r4
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r4
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r5, #0x4c]
	cmp r0, #1
	beq .L0805BAC0
	cmp r0, #1
	bgt .L0805BAAA
	cmp r0, #0
	beq .L0805BAB0
	b .L0805BAFE
.L0805BAAA:
	cmp r0, #2
	beq .L0805BAD0
	b .L0805BAFE
.L0805BAB0:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	b .L0805BAFE
.L0805BAC0:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBlendConfig
	b .L0805BAFE
.L0805BAD0:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r3, r3, r1
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x10
	bl Interpolate
	adds r2, r0, #0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
.L0805BAFE:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r1, r0
	blt .L0805BB18
	ldr r1, .L0805BB20  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L0805BB18:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BB20: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805BA64

	THUMB_FUNC_START func_0805BB24
func_0805BB24: @ 0x0805BB24
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	mov r8, r0
	mov r9, r1
	mov sl, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r1, .L0805BB7C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805BB80  @ gUnknown_085D5040
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r0, r9
	str r0, [r4, #0x44]
	mov r0, sl
	str r0, [r4, #0x54]
	mov r0, r8
	bl GetOpponentFrontAIS
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x3a]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BB7C: .4byte gUnknown_0201774C
.L0805BB80: .4byte gUnknown_085D5040

	THUMB_FUNC_END func_0805BB24

	THUMB_FUNC_START func_0805BB84
func_0805BB84: @ 0x0805BB84
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, .L0805BC04  @ gUnknown_0201FB2C
	ldr r0, [r0]
	ldr r1, .L0805BC08  @ gUnknown_0201FB38
	mov r8, r1
	cmp r0, #0
	bne .L0805BB9E
	ldr r2, .L0805BC0C  @ gUnknown_0201FC78
	mov r8, r2
.L0805BB9E:
	ldr r4, [r5, #0x54]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r7, [r0]
	adds r0, r7, #0
	bl func_08013278
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0, #2]
	ldr r0, .L0805BC10  @ 0x0000FFFF
	cmp r1, r0
	beq .L0805BBC8
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
.L0805BBC8:
	ldrh r1, [r5, #0x3a]
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0805BBD6
	movs r2, #0
.L0805BBD6:
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble .L0805BBE4
	movs r1, #0xa0
.L0805BBE4:
	movs r3, #0
	lsls r0, r2, #0x10
	ldr r2, [r5, #0x44]
	mov ip, r2
	asrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
.L0805BBF4:
	cmp r9, r3
	bhi .L0805BBFC
	cmp r4, r3
	bcs .L0805BC14
.L0805BBFC:
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	b .L0805BC44
	.align 2, 0
.L0805BC04: .4byte gUnknown_0201FB2C
.L0805BC08: .4byte gUnknown_0201FB38
.L0805BC0C: .4byte gUnknown_0201FC78
.L0805BC10: .4byte 0x0000FFFF
.L0805BC14:
	ldrh r2, [r5, #0x32]
	ldrh r1, [r6]
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge .L0805BC24
	movs r1, #0
.L0805BC24:
	ldrh r7, [r6, #2]
	adds r0, r2, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble .L0805BC34
	movs r2, #0xf0
.L0805BC34:
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r6, #4
.L0805BC44:
	movs r2, #2
	add r8, r2
	adds r3, #1
	cmp r3, #0x9f
	bls .L0805BBF4
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	movs r7, #0x2c
	ldrsh r0, [r5, r7]
	cmp r0, ip
	bne .L0805BC6E
	ldr r1, .L0805BC7C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetBlendNone
	adds r0, r5, #0
	bl Proc_Break
.L0805BC6E:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BC7C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805BB84

	THUMB_FUNC_START StartSpellThing_MagicQuake
StartSpellThing_MagicQuake: @ 0x0805BC80
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r1, .L0805BCBC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805BCC0  @ gUnknown_085D5058
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl func_08053678
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BCBC: .4byte gUnknown_0201774C
.L0805BCC0: .4byte gUnknown_085D5058

	THUMB_FUNC_END StartSpellThing_MagicQuake

	THUMB_FUNC_START Loop6C_efxMagicQUAKE
Loop6C_efxMagicQUAKE: @ 0x0805BCC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r5, .L0805BD54  @ gUnknown_02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r4, .L0805BD58  @ gUnknown_02000038
	ldrh r1, [r4]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r5, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r0, r1
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r4]
	ldrh r3, [r5]
	adds r0, r0, r3
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl func_08051B5C
	bl func_0806FAB0
	cmp r0, #0
	beq .L0805BD42
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #3
	bl SetBgOffset
.L0805BD42:
	bl func_0806FAB0
	cmp r0, #0
	beq .L0805BD60
	ldr r4, .L0805BD5C  @ gUnknown_02000028
	ldrh r0, [r4]
	ldrh r1, [r5]
	subs r0, r0, r1
	b .L0805BD68
	.align 2, 0
.L0805BD54: .4byte gUnknown_02017760
.L0805BD58: .4byte gUnknown_02000038
.L0805BD5C: .4byte gUnknown_02000028
.L0805BD60:
	ldr r4, .L0805BE78  @ gUnknown_02000028
	ldrh r0, [r5]
	ldrh r3, [r4]
	adds r0, r0, r3
.L0805BD68:
	ldr r3, .L0805BE7C  @ gUnknown_0201FB0C
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, .L0805BE80  @ gUnknown_0200002C
	ldrh r0, [r2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r9, r4
	mov sl, r2
	ldr r2, .L0805BE84  @ gUnknown_02017760
	ldrh r0, [r2]
	mov r1, r9
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	ldr r3, .L0805BE7C  @ gUnknown_0201FB0C
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sl
	ldrh r0, [r1, #2]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl func_080559F0
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl func_080559F0
	mov r2, r8
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L0805BE6A
	ldr r1, .L0805BE88  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, .L0805BE8C  @ gUnknown_02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl func_08051B5C
	bl func_0806FAB0
	cmp r0, #0
	beq .L0805BE2A
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L0805BE2A:
	ldr r0, .L0805BE7C  @ gUnknown_0201FB0C
	ldr r2, [r0]
	mov r3, r9
	ldrh r1, [r3]
	subs r1, r1, r2
	ldrh r0, [r3, #2]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sl
	ldrh r4, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl func_080559F0
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl func_080559F0
	mov r1, r8
	ldr r0, [r1, #0x60]
	bl Proc_End
	mov r0, r8
	bl Proc_Break
.L0805BE6A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BE78: .4byte gUnknown_02000028
.L0805BE7C: .4byte gUnknown_0201FB0C
.L0805BE80: .4byte gUnknown_0200002C
.L0805BE84: .4byte gUnknown_02017760
.L0805BE88: .4byte gUnknown_0201774C
.L0805BE8C: .4byte gUnknown_02000038

	THUMB_FUNC_END Loop6C_efxMagicQUAKE

	THUMB_FUNC_START StartSpellAnimDummy
StartSpellAnimDummy: @ 0x0805BE90
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805BEB0  @ gUnknown_085D5070
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BEB0: .4byte gUnknown_085D5070

	THUMB_FUNC_END StartSpellAnimDummy

	THUMB_FUNC_START Loop6C_efxDummymagic
Loop6C_efxDummymagic: @ 0x0805BEB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805BEDA
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	b .L0805BF02
.L0805BEDA:
	cmp r0, #0xa
	bne .L0805BF02
	adds r0, r4, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L0805BEF8
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
.L0805BEF8:
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0805BF02:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_efxDummymagic

	THUMB_FUNC_START StartSpellAnimHandAxe
StartSpellAnimHandAxe: @ 0x0805BF08
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805BF3C  @ gUnknown_085D5088
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805BF3C: .4byte gUnknown_085D5088

	THUMB_FUNC_END StartSpellAnimHandAxe

	THUMB_FUNC_START func_0805BF40
func_0805BF40: @ 0x0805BF40
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805BFC0
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	ldr r0, [r5, #0x5c]
	bl func_0805BFDC
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne .L0805BFC0
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl func_08072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq .L0805BFB2
	ldr r0, [r5, #0x5c]
	bl func_0805A268
	cmp r0, #1
	bne .L0805BFA6
	adds r0, r6, #0
	bl StartEfxCriticalEffect
	b .L0805BFB2
.L0805BFA6:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805BFD6
	ldr r0, [r5, #0x5c]
	bl func_0806C87C
.L0805BFB2:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805BFD6
	adds r0, r6, #0
	bl func_08072450
	b .L0805BFD6
.L0805BFC0:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x46
	beq .L0805BFD6
	cmp r0, #0x50
	bne .L0805BFD6
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0805BFD6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805BF40

	THUMB_FUNC_START func_0805BFDC
func_0805BFDC: @ 0x0805BFDC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0805C020  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805C024  @ gUnknown_085D50A0
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, .L0805C028  @ gUnknown_085DA6FC
	ldr r2, .L0805C02C  @ gUnknown_085DA364
	ldr r3, .L0805C030  @ gUnknown_085DA758
	ldr r0, .L0805C034  @ gUnknown_085DA3C0
	str r0, [sp]
	adds r0, r4, #0
	bl func_08055554
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805C038
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b .L0805C03C
	.align 2, 0
.L0805C020: .4byte gUnknown_0201774C
.L0805C024: .4byte gUnknown_085D50A0
.L0805C028: .4byte gUnknown_085DA6FC
.L0805C02C: .4byte gUnknown_085DA364
.L0805C030: .4byte gUnknown_085DA758
.L0805C034: .4byte gUnknown_085DA3C0
.L0805C038:
	ldrh r0, [r5, #2]
	subs r0, #0x48
.L0805C03C:
	strh r0, [r5, #2]
	ldr r0, .L0805C04C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0805C050
	movs r0, #0x23
	b .L0805C052
	.align 2, 0
.L0805C04C: .4byte gBattleAnimSceneLayoutEnum
.L0805C050:
	movs r0, #0xa
.L0805C052:
	strh r0, [r6, #0x2e]
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl func_0805C1C8
	str r0, [r6, #0x64]
	ldr r0, .L0805C078  @ gUnknown_085DA05C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C07C  @ gUnknown_085D9C5C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C078: .4byte gUnknown_085DA05C
.L0805C07C: .4byte gUnknown_085D9C5C

	THUMB_FUNC_END func_0805BFDC

	THUMB_FUNC_START func_0805C080
func_0805C080: @ 0x0805C080
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L0805C0D6
	ldr r1, .L0805C0C4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r0, .L0805C0C8  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0805C0D0
	ldr r0, .L0805C0CC  @ gUnknown_02017758
	movs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	b .L0805C0D6
	.align 2, 0
.L0805C0C4: .4byte gUnknown_0201774C
.L0805C0C8: .4byte gBattleAnimSceneLayoutEnum
.L0805C0CC: .4byte gUnknown_02017758
.L0805C0D0:
	adds r0, r4, #0
	bl Proc_Break
.L0805C0D6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805C080

	THUMB_FUNC_START func_0805C0DC
func_0805C0DC: @ 0x0805C0DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805C100  @ gUnknown_02017754
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl func_0805C104
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C100: .4byte gUnknown_02017754

	THUMB_FUNC_END func_0805C0DC

	THUMB_FUNC_START func_0805C104
func_0805C104: @ 0x0805C104
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0805C144  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805C148  @ gUnknown_085D50C0
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r3, .L0805C14C  @ gUnknown_085DA778
	ldr r2, .L0805C150  @ gUnknown_085DA3E0
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl func_08055554
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805C154
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b .L0805C158
	.align 2, 0
.L0805C144: .4byte gUnknown_0201774C
.L0805C148: .4byte gUnknown_085D50C0
.L0805C14C: .4byte gUnknown_085DA778
.L0805C150: .4byte gUnknown_085DA3E0
.L0805C154:
	ldrh r0, [r5, #2]
	subs r0, #0x48
.L0805C158:
	strh r0, [r5, #2]
	ldr r0, .L0805C180  @ gUnknown_085DA05C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C184  @ gUnknown_085D9C5C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl func_0805C1C8
	str r0, [r6, #0x64]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C180: .4byte gUnknown_085DA05C
.L0805C184: .4byte gUnknown_085D9C5C

	THUMB_FUNC_END func_0805C104

	THUMB_FUNC_START func_0805C188
func_0805C188: @ 0x0805C188
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L0805C1BA
	ldr r1, .L0805C1C0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, .L0805C1C4  @ gUnknown_02017758
	movs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L0805C1BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C1C0: .4byte gUnknown_0201774C
.L0805C1C4: .4byte gUnknown_02017758

	THUMB_FUNC_END func_0805C188

	THUMB_FUNC_START func_0805C1C8
func_0805C1C8: @ 0x0805C1C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805C204  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805C208  @ gUnknown_085D50D8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	str r5, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xcd
	movs r3, #1
	bl func_080729A4
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0805C204: .4byte gUnknown_0201774C
.L0805C208: .4byte gUnknown_085D50D8

	THUMB_FUNC_END func_0805C1C8

	THUMB_FUNC_START func_0805C20C
func_0805C20C: @ 0x0805C20C
	ldr r1, .L0805C218  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L0805C218: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805C20C

	THUMB_FUNC_START func_0805C21C
func_0805C21C: @ 0x0805C21C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L0805C25C
	ldr r0, [r4, #0x60]
	bl func_0807290C
	ldr r1, [r4, #0x60]
	ldrh r2, [r1, #2]
	adds r2, r2, r0
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xcd
	movs r3, #1
	bl func_080729A4
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bgt .L0805C25C
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
.L0805C25C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805C21C

	THUMB_FUNC_START StartSpellAnimArrow
StartSpellAnimArrow: @ 0x0805C264
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C298  @ gUnknown_085D50F8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C298: .4byte gUnknown_085D50F8

	THUMB_FUNC_END StartSpellAnimArrow

	THUMB_FUNC_START func_0805C29C
func_0805C29C: @ 0x0805C29C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805C334
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	ldr r0, [r5, #0x5c]
	bl func_0805C358
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xcc
	movs r3, #1
	bl func_080729A4
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne .L0805C334
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl func_08072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq .L0805C326
	ldr r0, [r5, #0x5c]
	bl func_0805A268
	cmp r0, #1
	bne .L0805C31A
	adds r0, r6, #0
	bl StartEfxCriticalEffect
	b .L0805C326
.L0805C31A:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805C350
	ldr r0, [r5, #0x5c]
	bl func_0806C87C
.L0805C326:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805C350
	adds r0, r6, #0
	bl func_08072450
	b .L0805C350
.L0805C334:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r4, #0
	adds r0, #9
	cmp r1, r0
	beq .L0805C350
	adds r0, #1
	cmp r1, r0
	bne .L0805C350
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0805C350:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805C29C

	THUMB_FUNC_START func_0805C358
func_0805C358: @ 0x0805C358
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805C3A0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805C3A4  @ gUnknown_085D5110
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, .L0805C3A8  @ gUnknown_085DA8E0
	ldr r2, .L0805C3AC  @ gUnknown_085DA854
	ldr r3, .L0805C3B0  @ gUnknown_085DA8F0
	ldr r0, .L0805C3B4  @ gUnknown_085DA864
	str r0, [sp]
	adds r0, r5, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L0805C3B8  @ gUnknown_085DA05C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C3BC  @ gUnknown_085DA7AC
	movs r1, #0x60
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C3A0: .4byte gUnknown_0201774C
.L0805C3A4: .4byte gUnknown_085D5110
.L0805C3A8: .4byte gUnknown_085DA8E0
.L0805C3AC: .4byte gUnknown_085DA854
.L0805C3B0: .4byte gUnknown_085DA8F0
.L0805C3B4: .4byte gUnknown_085DA864
.L0805C3B8: .4byte gUnknown_085DA05C
.L0805C3BC: .4byte gUnknown_085DA7AC

	THUMB_FUNC_END func_0805C358

	THUMB_FUNC_START func_0805C3C0
func_0805C3C0: @ 0x0805C3C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne .L0805C3E6
	ldr r0, .L0805C3EC  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L0805C3E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C3EC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805C3C0

	THUMB_FUNC_START StartSpellAnimJavelin
StartSpellAnimJavelin: @ 0x0805C3F0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C440  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl func_0805C88C
	ldr r0, .L0805C444  @ gUnknown_085DAB30
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C448  @ gUnknown_085DA900
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C440: .4byte gUnknown_085D5128
.L0805C444: .4byte gUnknown_085DAB30
.L0805C448: .4byte gUnknown_085DA900

	THUMB_FUNC_END StartSpellAnimJavelin

	THUMB_FUNC_START func_0805C44C
func_0805C44C: @ 0x0805C44C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C49C  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C4A0  @ gUnknown_085DAD6C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C4A4  @ gUnknown_085DAB50
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C49C: .4byte gUnknown_085D5128
.L0805C4A0: .4byte gUnknown_085DAD6C
.L0805C4A4: .4byte gUnknown_085DAB50

	THUMB_FUNC_END func_0805C44C

	THUMB_FUNC_START func_0805C4A8
func_0805C4A8: @ 0x0805C4A8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C4F8  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl func_0805C88C
	ldr r0, .L0805C4FC  @ gUnknown_085DAFA4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C500  @ gUnknown_085DAD8C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C4F8: .4byte gUnknown_085D5128
.L0805C4FC: .4byte gUnknown_085DAFA4
.L0805C500: .4byte gUnknown_085DAD8C

	THUMB_FUNC_END func_0805C4A8

	THUMB_FUNC_START func_0805C504
func_0805C504: @ 0x0805C504
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C554  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C558  @ gUnknown_085DB1E0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C55C  @ gUnknown_085DAFC4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C554: .4byte gUnknown_085D5128
.L0805C558: .4byte gUnknown_085DB1E0
.L0805C55C: .4byte gUnknown_085DAFC4

	THUMB_FUNC_END func_0805C504

	THUMB_FUNC_START func_0805C560
func_0805C560: @ 0x0805C560
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C5B0  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C5B4  @ gUnknown_085DB42C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C5B8  @ gUnknown_085DB200
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C5B0: .4byte gUnknown_085D5128
.L0805C5B4: .4byte gUnknown_085DB42C
.L0805C5B8: .4byte gUnknown_085DB200

	THUMB_FUNC_END func_0805C560

	THUMB_FUNC_START func_0805C5BC
func_0805C5BC: @ 0x0805C5BC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C60C  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C610  @ gUnknown_085DB694
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C614  @ gUnknown_085DB44C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C60C: .4byte gUnknown_085D5128
.L0805C610: .4byte gUnknown_085DB694
.L0805C614: .4byte gUnknown_085DB44C

	THUMB_FUNC_END func_0805C5BC

	THUMB_FUNC_START func_0805C618
func_0805C618: @ 0x0805C618
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C668  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C66C  @ gUnknown_085DB8EC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C670  @ gUnknown_085DB6B4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C668: .4byte gUnknown_085D5128
.L0805C66C: .4byte gUnknown_085DB8EC
.L0805C670: .4byte gUnknown_085DB6B4

	THUMB_FUNC_END func_0805C618

	THUMB_FUNC_START func_0805C674
func_0805C674: @ 0x0805C674
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C6C4  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C6C8  @ gUnknown_085DBB70
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C6CC  @ gUnknown_085DB90C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C6C4: .4byte gUnknown_085D5128
.L0805C6C8: .4byte gUnknown_085DBB70
.L0805C6CC: .4byte gUnknown_085DB90C

	THUMB_FUNC_END func_0805C674

	THUMB_FUNC_START func_0805C6D0
func_0805C6D0: @ 0x0805C6D0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C720  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C724  @ gUnknown_085DBE00
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C728  @ gUnknown_085DBB90
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C720: .4byte gUnknown_085D5128
.L0805C724: .4byte gUnknown_085DBE00
.L0805C728: .4byte gUnknown_085DBB90

	THUMB_FUNC_END func_0805C6D0

	THUMB_FUNC_START func_0805C72C
func_0805C72C: @ 0x0805C72C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C77C  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C780  @ gUnknown_085DC050
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C784  @ gUnknown_085DBE20
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C77C: .4byte gUnknown_085D5128
.L0805C780: .4byte gUnknown_085DC050
.L0805C784: .4byte gUnknown_085DBE20

	THUMB_FUNC_END func_0805C72C

	THUMB_FUNC_START func_0805C788
func_0805C788: @ 0x0805C788
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C7D8  @ gUnknown_085D5128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl func_0805C88C
	ldr r0, .L0805C7DC  @ gUnknown_085DB1E0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805C7E0  @ gUnknown_085DAFC4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C7D8: .4byte gUnknown_085D5128
.L0805C7DC: .4byte gUnknown_085DB1E0
.L0805C7E0: .4byte gUnknown_085DAFC4

	THUMB_FUNC_END func_0805C788

	THUMB_FUNC_START func_0805C7E4
func_0805C7E4: @ 0x0805C7E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805C870
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xca
	movs r3, #1
	bl func_080729A4
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne .L0805C870
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl func_08072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq .L0805C862
	ldr r0, [r5, #0x5c]
	bl func_0805A268
	cmp r0, #1
	bne .L0805C856
	adds r0, r6, #0
	bl StartEfxCriticalEffect
	b .L0805C862
.L0805C856:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805C886
	ldr r0, [r5, #0x5c]
	bl func_0806C87C
.L0805C862:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805C886
	adds r0, r6, #0
	bl func_08072450
	b .L0805C886
.L0805C870:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0xe
	beq .L0805C886
	cmp r0, #0x10
	bne .L0805C886
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0805C886:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805C7E4

	THUMB_FUNC_START func_0805C88C
func_0805C88C: @ 0x0805C88C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L0805C8B8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805C8BC  @ gUnknown_085D5140
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne .L0805C8C8
	ldr r2, .L0805C8C0  @ gUnknown_085DC244
	ldr r3, .L0805C8C4  @ gUnknown_085DC498
	b .L0805C8CC
	.align 2, 0
.L0805C8B8: .4byte gUnknown_0201774C
.L0805C8BC: .4byte gUnknown_085D5140
.L0805C8C0: .4byte gUnknown_085DC244
.L0805C8C4: .4byte gUnknown_085DC498
.L0805C8C8:
	ldr r2, .L0805C8EC  @ gUnknown_085DC6F8
	ldr r3, .L0805C8F0  @ gUnknown_085DC958
.L0805C8CC:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r5, #0x60]
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805C8F4
	ldrh r0, [r4, #2]
	adds r0, #0x38
	b .L0805C8F8
	.align 2, 0
.L0805C8EC: .4byte gUnknown_085DC6F8
.L0805C8F0: .4byte gUnknown_085DC958
.L0805C8F4:
	ldrh r0, [r4, #2]
	subs r0, #0x38
.L0805C8F8:
	strh r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805C88C

	THUMB_FUNC_START func_0805C904
func_0805C904: @ 0x0805C904
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne .L0805C92A
	ldr r0, .L0805C930  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L0805C92A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C930: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805C904

	THUMB_FUNC_START StartSpellAnimSong
StartSpellAnimSong: @ 0x0805C934
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805C968  @ gUnknown_085D5158
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805C968: .4byte gUnknown_085D5158

	THUMB_FUNC_END StartSpellAnimSong

	THUMB_FUNC_START func_0805C96C
func_0805C96C: @ 0x0805C96C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	bne .L0805C9EC
	adds r0, r4, #0
	movs r1, #0
	bl func_0805CA64
	adds r0, r4, #0
	movs r1, #0
	bl func_0805CB40
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl func_0805B93C
	adds r0, r4, #0
	movs r1, #0x64
	bl func_0805B4E8
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl func_0805BA1C
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl func_0805BA1C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl func_080729A4
.L0805C9EC:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x8b
	bne .L0805CA44
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl func_08055518
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805CA28
	ldr r0, .L0805CA20  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r1, .L0805CA24  @ gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	b .L0805CA34
	.align 2, 0
.L0805CA20: .4byte gUnknown_02000054
.L0805CA24: .4byte gPal+0x2E0
.L0805CA28:
	ldr r0, .L0805CA3C  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r1, .L0805CA40  @ gPal+0x320
	movs r2, #8
	bl CpuFastSet
.L0805CA34:
	adds r0, r4, #0
	bl func_08054B84
	b .L0805CA5A
	.align 2, 0
.L0805CA3C: .4byte gUnknown_02000054
.L0805CA40: .4byte gPal+0x320
.L0805CA44:
	cmp r0, #0xb3
	bne .L0805CA5A
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0805CA5A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805C96C

	THUMB_FUNC_START func_0805CA64
func_0805CA64: @ 0x0805CA64
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L0805CAAC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805CAB0  @ gUnknown_085D5170
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L0805CAB4  @ gUnknown_080DC956
	str r1, [r0, #0x48]
	ldr r1, .L0805CAB8  @ gUnknown_085D5188
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L0805CABC  @ gUnknown_085D51F4
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	lsls r4, r4, #5
	ldr r0, .L0805CAC0  @ gUnknown_08754870
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805CAAC: .4byte gUnknown_0201774C
.L0805CAB0: .4byte gUnknown_085D5170
.L0805CAB4: .4byte gUnknown_080DC956
.L0805CAB8: .4byte gUnknown_085D5188
.L0805CABC: .4byte gUnknown_085D51F4
.L0805CAC0: .4byte gUnknown_08754870

	THUMB_FUNC_END func_0805CA64

	THUMB_FUNC_START func_0805CAC4
func_0805CAC4: @ 0x0805CAC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805CB14
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq .L0805CAFE
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
.L0805CAFE:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L0805CB32
.L0805CB14:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0805CB32
	bl SpellFx_ClearBg1
	ldr r1, .L0805CB3C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0805CB32:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805CB3C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805CAC4

	THUMB_FUNC_START func_0805CB40
func_0805CB40: @ 0x0805CB40
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805CB94  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805CB98  @ gUnknown_085D5260
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x38
	strh r0, [r4, #0x2e]
	ldr r3, .L0805CB9C  @ gUnknown_08758134
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	lsls r5, r5, #5
	ldr r0, .L0805CBA0  @ gUnknown_08754870
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805CBA4  @ gUnknown_08755FD4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805CB94: .4byte gUnknown_0201774C
.L0805CB98: .4byte gUnknown_085D5260
.L0805CB9C: .4byte gUnknown_08758134
.L0805CBA0: .4byte gUnknown_08754870
.L0805CBA4: .4byte gUnknown_08755FD4

	THUMB_FUNC_END func_0805CB40

	THUMB_FUNC_START func_0805CBA8
func_0805CBA8: @ 0x0805CBA8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L0805CBD2
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805CBD8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805CBD2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805CBD8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805CBA8

	THUMB_FUNC_START StartSpellAnimDance
StartSpellAnimDance: @ 0x0805CBDC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805CC10  @ gUnknown_085D5278
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805CC10: .4byte gUnknown_085D5278

	THUMB_FUNC_END StartSpellAnimDance

	THUMB_FUNC_START func_0805CC14
func_0805CC14: @ 0x0805CC14
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x19
	bne .L0805CC94
	adds r0, r4, #0
	movs r1, #0
	bl func_0805CA64
	adds r0, r4, #0
	movs r1, #0
	bl func_0805CB40
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl func_0805B93C
	adds r0, r4, #0
	movs r1, #0x64
	bl func_0805B4E8
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl func_0805BA1C
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl func_0805BA1C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl func_080729A4
.L0805CC94:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne .L0805CCEC
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl func_08055518
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805CCD0
	ldr r0, .L0805CCC8  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r1, .L0805CCCC  @ gPal+0x2E0
	movs r2, #8
	bl CpuFastSet
	b .L0805CCDC
	.align 2, 0
.L0805CCC8: .4byte gUnknown_02000054
.L0805CCCC: .4byte gPal+0x2E0
.L0805CCD0:
	ldr r0, .L0805CCE4  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r1, .L0805CCE8  @ gPal+0x320
	movs r2, #8
	bl CpuFastSet
.L0805CCDC:
	adds r0, r4, #0
	bl func_08054B84
	b .L0805CD02
	.align 2, 0
.L0805CCE4: .4byte gUnknown_02000054
.L0805CCE8: .4byte gPal+0x320
.L0805CCEC:
	cmp r0, #0xa5
	bne .L0805CD02
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0805CD02:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805CC14

	THUMB_FUNC_START func_0805CD0C
func_0805CD0C: @ 0x0805CD0C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805CD58  @ gUnknown_085D5290
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0x9b
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805CD58: .4byte gUnknown_085D5290

	THUMB_FUNC_END func_0805CD0C

	THUMB_FUNC_START func_0805CD5C
func_0805CD5C: @ 0x0805CD5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L0805CD82
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L0805CE14
.L0805CD82:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x22
	bne .L0805CDA4
	ldr r0, .L0805CDA0  @ 0x00000137
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	b .L0805CE14
	.align 2, 0
.L0805CDA0: .4byte 0x00000137
.L0805CDA4:
	cmp r0, #0x2a
	bne .L0805CDB0
	adds r0, r6, #0
	bl func_0805CE1C
	b .L0805CE14
.L0805CDB0:
	cmp r0, #0x2d
	bne .L0805CE02
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl func_08072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq .L0805CDF4
	ldr r0, [r5, #0x5c]
	bl func_0805A268
	cmp r0, #1
	bne .L0805CDE8
	adds r0, r6, #0
	bl StartEfxCriticalEffect
	b .L0805CDF4
.L0805CDE8:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805CE14
	ldr r0, [r5, #0x5c]
	bl func_0806C87C
.L0805CDF4:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805CE14
	adds r0, r6, #0
	bl func_08072450
	b .L0805CE14
.L0805CE02:
	cmp r0, #0x3e
	beq .L0805CE14
	cmp r0, #0x40
	bne .L0805CE14
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L0805CE14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805CD5C

	THUMB_FUNC_START func_0805CE1C
func_0805CE1C: @ 0x0805CE1C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805CE70  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805CE74  @ gUnknown_085D52A8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L0805CE78  @ gUnknown_085DCA5C
	ldr r2, .L0805CE7C  @ gUnknown_085DCAF8
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl func_08055554
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r0, [r6, #4]
	adds r0, #0x10
	strh r0, [r6, #4]
	ldrh r1, [r6, #8]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #1
	bne .L0805CE80
	ldrh r0, [r6, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b .L0805CE86
	.align 2, 0
.L0805CE70: .4byte gUnknown_0201774C
.L0805CE74: .4byte gUnknown_085D52A8
.L0805CE78: .4byte gUnknown_085DCA5C
.L0805CE7C: .4byte gUnknown_085DCAF8
.L0805CE80:
	ldrh r0, [r6, #8]
	movs r2, #0x93
	lsls r2, r2, #8
.L0805CE86:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805CE1C

	THUMB_FUNC_START func_0805CE94
func_0805CE94: @ 0x0805CE94
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble .L0805CEBA
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805CEC0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805CEBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805CEC0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805CE94

	THUMB_FUNC_START nullsub_42
nullsub_42: @ 0x0805CEC4
	bx lr

	THUMB_FUNC_END nullsub_42

	THUMB_FUNC_START func_0805CEC8
func_0805CEC8: @ 0x0805CEC8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805CF00  @ gUnknown_085D52C0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805CF00: .4byte gUnknown_085D52C0

	THUMB_FUNC_END func_0805CEC8

	THUMB_FUNC_START func_0805CF04
func_0805CF04: @ 0x0805CF04
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805CF32
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805CF32:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0805CF80
	ldr r0, .L0805CF7C  @ 0x0000010D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	bl func_0805CFC0
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl StartEfxFlashBG
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805CFB6
	adds r0, r5, #0
	bl func_08072450
	b .L0805CFB6
	.align 2, 0
.L0805CF7C: .4byte 0x0000010D
.L0805CF80:
	adds r0, r6, #0
	adds r0, #0x1c
	cmp r1, r0
	bne .L0805CF9A
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x10
	bl func_0805BA1C
	b .L0805CFB6
.L0805CF9A:
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	beq .L0805CFB6
	adds r0, #5
	cmp r1, r0
	bne .L0805CFB6
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805CFB6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805CF04

	THUMB_FUNC_START func_0805CFC0
func_0805CFC0: @ 0x0805CFC0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805D018  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D01C  @ gUnknown_085D52D8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x34
	strh r0, [r4, #0x2e]
	adds r0, r5, #0
	bl GetAISSubjectId
	ldr r3, .L0805D020  @ gUnknown_085E12DC
	cmp r0, #0
	bne .L0805CFF0
	ldr r3, .L0805D024  @ gUnknown_085E067C
.L0805CFF0:
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L0805D028  @ gUnknown_085DE964
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805D02C  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D018: .4byte gUnknown_0201774C
.L0805D01C: .4byte gUnknown_085D52D8
.L0805D020: .4byte gUnknown_085E12DC
.L0805D024: .4byte gUnknown_085E067C
.L0805D028: .4byte gUnknown_085DE964
.L0805D02C: .4byte gUnknown_085DDC64

	THUMB_FUNC_END func_0805CFC0

	THUMB_FUNC_START func_0805D030
func_0805D030: @ 0x0805D030
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L0805D05A
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805D060  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805D05A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D060: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805D030

	THUMB_FUNC_START StartSpellAnimFireBreath
StartSpellAnimFireBreath: @ 0x0805D064
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805D098  @ gUnknown_085D52F0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D098: .4byte gUnknown_085D52F0

	THUMB_FUNC_END StartSpellAnimFireBreath

	THUMB_FUNC_START func_0805D09C
func_0805D09C: @ 0x0805D09C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805D0C4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805D0C4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne .L0805D110
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	bl func_0805D14C
	adds r0, r5, #0
	bl func_0805D260
	adds r0, r5, #0
	bl func_0805D2EC
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xf
	movs r3, #0x10
	bl func_0805BA1C
	ldr r0, .L0805D10C  @ 0x0000011D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	b .L0805D142
	.align 2, 0
.L0805D10C: .4byte 0x0000011D
.L0805D110:
	cmp r0, #0xf
	bne .L0805D134
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805D142
	adds r0, r5, #0
	bl func_08072450
	b .L0805D142
.L0805D134:
	cmp r0, #0x82
	bne .L0805D142
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
.L0805D142:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805D09C

	THUMB_FUNC_START func_0805D14C
func_0805D14C: @ 0x0805D14C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, .L0805D1A8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D1AC  @ gUnknown_085D5308
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x34
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAISSubjectId
	ldr r3, .L0805D1B0  @ gUnknown_085E35DC
	cmp r0, #0
	bne .L0805D17C
	ldr r3, .L0805D1B4  @ gUnknown_085E2A24
.L0805D17C:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, .L0805D1B8  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0805D1C2
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805D1BC
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b .L0805D1D6
	.align 2, 0
.L0805D1A8: .4byte gUnknown_0201774C
.L0805D1AC: .4byte gUnknown_085D5308
.L0805D1B0: .4byte gUnknown_085E35DC
.L0805D1B4: .4byte gUnknown_085E2A24
.L0805D1B8: .4byte gBattleAnimSceneLayoutEnum
.L0805D1BC:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	b .L0805D1D6
.L0805D1C2:
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805D1D2
	ldrh r0, [r4, #2]
	adds r0, #0x48
	b .L0805D1D6
.L0805D1D2:
	ldrh r0, [r4, #2]
	subs r0, #0x48
.L0805D1D6:
	strh r0, [r4, #2]
	ldr r0, .L0805D1F4  @ gUnknown_085DE964
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805D1F8  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D1F4: .4byte gUnknown_085DE964
.L0805D1F8: .4byte gUnknown_085DDC64

	THUMB_FUNC_END func_0805D14C

	THUMB_FUNC_START func_0805D1FC
func_0805D1FC: @ 0x0805D1FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805D220  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805D22E
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805D224
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x48
	b .L0805D22C
	.align 2, 0
.L0805D220: .4byte gBattleAnimSceneLayoutEnum
.L0805D224:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x48
.L0805D22C:
	strh r0, [r1, #2]
.L0805D22E:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L0805D254
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805D25C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805D254:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D25C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805D1FC

	THUMB_FUNC_START func_0805D260
func_0805D260: @ 0x0805D260
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L0805D2A4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D2A8  @ gUnknown_085D5320
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x70
	strh r0, [r4, #0x2e]
	ldr r0, .L0805D2AC  @ gUnknown_087246D8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r2, .L0805D2B0  @ gUnknown_08725AF0
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_ResetBg1Offset
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D2A4: .4byte gUnknown_0201774C
.L0805D2A8: .4byte gUnknown_085D5320
.L0805D2AC: .4byte gUnknown_087246D8
.L0805D2B0: .4byte gUnknown_08725AF0

	THUMB_FUNC_END func_0805D260

	THUMB_FUNC_START func_0805D2B4
func_0805D2B4: @ 0x0805D2B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L0805D2E0
	bl SpellFx_ClearBg1
	bl SpellFx_EndBlend
	ldr r1, .L0805D2E8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805D2E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D2E8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805D2B4

	THUMB_FUNC_START func_0805D2EC
func_0805D2EC: @ 0x0805D2EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805D318  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D31C  @ gUnknown_085D5338
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805D320  @ gUnknown_080DCA5C
	str r1, [r0, #0x48]
	ldr r1, .L0805D324  @ gUnknown_08725AD0
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D318: .4byte gUnknown_0201774C
.L0805D31C: .4byte gUnknown_085D5338
.L0805D320: .4byte gUnknown_080DCA5C
.L0805D324: .4byte gUnknown_08725AD0

	THUMB_FUNC_END func_0805D2EC

	THUMB_FUNC_START func_0805D328
func_0805D328: @ 0x0805D328
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L0805D368
	ldr r0, [r4, #0x4c]
	ldr r4, .L0805D364  @ gUnknown_020165C8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl ApplyFlashingPaletteAnimation
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0805D37E
	.align 2, 0
.L0805D364: .4byte gUnknown_020165C8
.L0805D368:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne .L0805D37E
	ldr r1, .L0805D384  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805D37E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D384: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805D328

	THUMB_FUNC_START StartSpellAnimIceBreath
StartSpellAnimIceBreath: @ 0x0805D388
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805D3C0  @ gUnknown_085D5358
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D3C0: .4byte gUnknown_085D5358

	THUMB_FUNC_END StartSpellAnimIceBreath

	THUMB_FUNC_START func_0805D3C4
func_0805D3C4: @ 0x0805D3C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805D400
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	ldr r0, [r4, #0x5c]
	bl func_0805D444
	movs r0, #0x8f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
.L0805D400:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne .L0805D428
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805D43E
	adds r0, r5, #0
	bl func_08072450
	b .L0805D43E
.L0805D428:
	cmp r0, #0x32
	beq .L0805D43E
	cmp r0, #0x3c
	bne .L0805D43E
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805D43E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805D3C4

	THUMB_FUNC_START func_0805D444
func_0805D444: @ 0x0805D444
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0805D480  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D484  @ gUnknown_085D5370
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r2, .L0805D488  @ gUnknown_085E420C
	ldr r3, .L0805D48C  @ gUnknown_085E4E3C
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl func_08055554
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805D490
	ldrh r0, [r6, #2]
	adds r0, #0x20
	b .L0805D494
	.align 2, 0
.L0805D480: .4byte gUnknown_0201774C
.L0805D484: .4byte gUnknown_085D5370
.L0805D488: .4byte gUnknown_085E420C
.L0805D48C: .4byte gUnknown_085E4E3C
.L0805D490:
	ldrh r0, [r6, #2]
	subs r0, #0x20
.L0805D494:
	strh r0, [r6, #2]
	ldr r0, .L0805D4B0  @ gUnknown_085DFA28
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805D4B4  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D4B0: .4byte gUnknown_085DFA28
.L0805D4B4: .4byte gUnknown_085DDC64

	THUMB_FUNC_END func_0805D444

	THUMB_FUNC_START func_0805D4B8
func_0805D4B8: @ 0x0805D4B8
	push {lr}
	ldr r2, .L0805D4CC  @ gUnknown_0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BsoRemove
	pop {r0}
	bx r0
	.align 2, 0
.L0805D4CC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805D4B8

	THUMB_FUNC_START StartSpellAnimDarkBreath
StartSpellAnimDarkBreath: @ 0x0805D4D0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805D504  @ gUnknown_085D5390
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D504: .4byte gUnknown_085D5390

	THUMB_FUNC_END StartSpellAnimDarkBreath

	THUMB_FUNC_START Loop6C_efxDarkbreath
Loop6C_efxDarkbreath: @ 0x0805D508
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805D558
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	ldr r0, [r4, #0x5c]
	bl func_0805D59C
	ldr r0, [r4, #0x5c]
	bl func_0805D644
	ldr r0, [r4, #0x5c]
	bl func_0805D6CC
	ldr r0, .L0805D580  @ 0x0000011F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
.L0805D558:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne .L0805D584
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805D596
	adds r0, r5, #0
	bl func_08072450
	b .L0805D596
	.align 2, 0
.L0805D580: .4byte 0x0000011F
.L0805D584:
	cmp r0, #0x20
	beq .L0805D596
	cmp r0, #0x30
	bne .L0805D596
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
.L0805D596:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_efxDarkbreath

	THUMB_FUNC_START func_0805D59C
func_0805D59C: @ 0x0805D59C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805D5D8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D5DC  @ gUnknown_085D53A8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805D5E0  @ gUnknown_080DCB78
	str r1, [r0, #0x48]
	ldr r1, .L0805D5E4  @ gUnknown_085D53C0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L0805D5E8  @ gUnknown_085E5AE4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D5D8: .4byte gUnknown_0201774C
.L0805D5DC: .4byte gUnknown_085D53A8
.L0805D5E0: .4byte gUnknown_080DCB78
.L0805D5E4: .4byte gUnknown_085D53C0
.L0805D5E8: .4byte gUnknown_085E5AE4

	THUMB_FUNC_END func_0805D59C

	THUMB_FUNC_START func_0805D5EC
func_0805D5EC: @ 0x0805D5EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L0805D61A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L0805D638
.L0805D61A:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L0805D638
	bl SpellFx_ClearBg1
	ldr r1, .L0805D640  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0805D638:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D640: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805D5EC

	THUMB_FUNC_START func_0805D644
func_0805D644: @ 0x0805D644
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805D670  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D674  @ gUnknown_085D53F0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805D678  @ gUnknown_080DCBD4
	str r1, [r0, #0x48]
	ldr r1, .L0805D67C  @ gUnknown_08608838
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D670: .4byte gUnknown_0201774C
.L0805D674: .4byte gUnknown_085D53F0
.L0805D678: .4byte gUnknown_080DCBD4
.L0805D67C: .4byte gUnknown_08608838

	THUMB_FUNC_END func_0805D644

	THUMB_FUNC_START func_0805D680
func_0805D680: @ 0x0805D680
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805D6A6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0805D6C0
.L0805D6A6:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0805D6C0
	bl SpellFx_EndBlend
	ldr r1, .L0805D6C8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805D6C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D6C8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805D680

	THUMB_FUNC_START func_0805D6CC
func_0805D6CC: @ 0x0805D6CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, .L0805D728  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D72C  @ gUnknown_085D5410
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x37
	strh r0, [r5, #0x2e]
	ldr r2, .L0805D730  @ gUnknown_085E5A78
	ldr r3, .L0805D734  @ gUnknown_08723208
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r2, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r5, #0x60]
	movs r0, #0x14
	strh r0, [r5, #0x32]
	ldr r0, .L0805D738  @ 0x0000FFFC
	strh r0, [r5, #0x3a]
	ldr r0, .L0805D73C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805D716
	movs r0, #0x2c
	strh r0, [r5, #0x32]
.L0805D716:
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805D740
	ldrh r0, [r5, #0x32]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	b .L0805D746
	.align 2, 0
.L0805D728: .4byte gUnknown_0201774C
.L0805D72C: .4byte gUnknown_085D5410
.L0805D730: .4byte gUnknown_085E5A78
.L0805D734: .4byte gUnknown_08723208
.L0805D738: .4byte 0x0000FFFC
.L0805D73C: .4byte gBattleAnimSceneLayoutEnum
.L0805D740:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #0x32]
	subs r0, r0, r1
.L0805D746:
	strh r0, [r4, #2]
	ldrh r0, [r5, #0x3a]
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r4, #4]
	ldr r0, .L0805D76C  @ gUnknown_085DFA48
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805D770  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D76C: .4byte gUnknown_085DFA48
.L0805D770: .4byte gUnknown_085DDC64

	THUMB_FUNC_END func_0805D6CC

	THUMB_FUNC_START func_0805D774
func_0805D774: @ 0x0805D774
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805D798  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805D7A8
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805D79C
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r0, [r4, #0x32]
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	b .L0805D7A6
	.align 2, 0
.L0805D798: .4byte gBattleAnimSceneLayoutEnum
.L0805D79C:
	ldr r2, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #0x32]
	subs r0, r0, r1
.L0805D7A6:
	strh r0, [r2, #2]
.L0805D7A8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L0805D7CE
	ldr r0, .L0805D7D4  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L0805D7CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D7D4: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805D774

	THUMB_FUNC_START StartSpellAnimThunder
StartSpellAnimThunder: @ 0x0805D7D8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805D810  @ gUnknown_085D5428
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D810: .4byte gUnknown_085D5428

	THUMB_FUNC_END StartSpellAnimThunder

	THUMB_FUNC_START EfxThunder_Main
EfxThunder_Main: @ 0x0805D814
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805D83E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805D83E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0805D85C
	adds r0, r5, #0
	bl StartEfxThunderBG
	adds r0, r5, #0
	bl StartEfxThunderBGCOL
	adds r0, r5, #0
	bl StartEfxThunderOBJ
	b .L0805D8AE
.L0805D85C:
	adds r0, r6, #4
	cmp r1, r0
	bne .L0805D892
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xf5
	movs r3, #1
	bl func_080729A4
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805D8AE
	adds r0, r5, #0
	bl func_08072450
	b .L0805D8AE
.L0805D892:
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	beq .L0805D8AE
	adds r0, #0x10
	cmp r1, r0
	bne .L0805D8AE
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805D8AE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxThunder_Main

	THUMB_FUNC_START StartEfxThunderBG
StartEfxThunderBG: @ 0x0805D8B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805D90C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D910  @ gUnknown_085D5440
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0805D914  @ gUnknown_080DCCA6
	str r0, [r5, #0x48]
	ldr r0, .L0805D918  @ gUnknown_085D5458
	str r0, [r5, #0x4c]
	ldr r0, .L0805D91C  @ gUnknown_085D5460
	str r0, [r5, #0x50]
	ldr r0, .L0805D920  @ gUnknown_085F2DC0
	movs r1, #0x86
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	ldr r0, .L0805D924  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805D932
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805D928
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805D932
	.align 2, 0
.L0805D90C: .4byte gUnknown_0201774C
.L0805D910: .4byte gUnknown_085D5440
.L0805D914: .4byte gUnknown_080DCCA6
.L0805D918: .4byte gUnknown_085D5458
.L0805D91C: .4byte gUnknown_085D5460
.L0805D920: .4byte gUnknown_085F2DC0
.L0805D924: .4byte gBattleAnimSceneLayoutEnum
.L0805D928:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805D932:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartEfxThunderBG

	THUMB_FUNC_START EfxThunderBG_Main
EfxThunderBG_Main: @ 0x0805D938
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L0805D990
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r5, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	cmp r5, #0
	bne .L0805D96E
	ldr r6, .L0805D988  @ 0x0000011F
.L0805D96E:
	cmp r5, #1
	bne .L0805D976
	movs r6, #0xa8
	lsls r6, r6, #1
.L0805D976:
	ldr r0, .L0805D98C  @ gBg1Tm+0x3C
	str r6, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	b .L0805D9AE
	.align 2, 0
.L0805D988: .4byte 0x0000011F
.L0805D98C: .4byte gBg1Tm+0x3C
.L0805D990:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne .L0805D9AE
	bl SpellFx_ClearBg1
	ldr r1, .L0805D9B8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0805D9AE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D9B8: .4byte gUnknown_0201774C

	THUMB_FUNC_END EfxThunderBG_Main

	THUMB_FUNC_START StartEfxThunderBGCOL
StartEfxThunderBGCOL: @ 0x0805D9BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805D9E8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805D9EC  @ gUnknown_085D5468
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805D9F0  @ gUnknown_080DCCC0
	str r1, [r0, #0x48]
	ldr r1, .L0805D9F4  @ gUnknown_085F367C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805D9E8: .4byte gUnknown_0201774C
.L0805D9EC: .4byte gUnknown_085D5468
.L0805D9F0: .4byte gUnknown_080DCCC0
.L0805D9F4: .4byte gUnknown_085F367C

	THUMB_FUNC_END StartEfxThunderBGCOL

	THUMB_FUNC_START EfxThunderBGCOL_Main
EfxThunderBGCOL_Main: @ 0x0805D9F8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805DA1E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0805DA38
.L0805DA1E:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0805DA38
	bl SpellFx_EndBlend
	ldr r1, .L0805DA40  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805DA38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DA40: .4byte gUnknown_0201774C

	THUMB_FUNC_END EfxThunderBGCOL_Main

	THUMB_FUNC_START StartEfxThunderOBJ
StartEfxThunderOBJ: @ 0x0805DA44
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805DA8C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805DA90  @ gUnknown_085D5488
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L0805DA94  @ gUnknown_085F5550
	ldr r2, .L0805DA98  @ gUnknown_085F4A24
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L0805DA9C  @ gUnknown_085F3F40
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805DAA0  @ gUnknown_085F3AA8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DA8C: .4byte gUnknown_0201774C
.L0805DA90: .4byte gUnknown_085D5488
.L0805DA94: .4byte gUnknown_085F5550
.L0805DA98: .4byte gUnknown_085F4A24
.L0805DA9C: .4byte gUnknown_085F3F40
.L0805DAA0: .4byte gUnknown_085F3AA8

	THUMB_FUNC_END StartEfxThunderOBJ

	THUMB_FUNC_START EfxThunderOBJ_Main
EfxThunderOBJ_Main: @ 0x0805DAA4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble .L0805DACA
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805DAD0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805DACA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DAD0: .4byte gUnknown_0201774C

	THUMB_FUNC_END EfxThunderOBJ_Main

	THUMB_FUNC_START StartSpellAnimFire
StartSpellAnimFire: @ 0x0805DAD4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805DB14  @ gUnknown_085D54A0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DB14: .4byte gUnknown_085D54A0

	THUMB_FUNC_END StartSpellAnimFire

	THUMB_FUNC_START StartSpellAnimElfire
StartSpellAnimElfire: @ 0x0805DB18
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805DB58  @ gUnknown_085D54A0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DB58: .4byte gUnknown_085D54A0

	THUMB_FUNC_END StartSpellAnimElfire

	THUMB_FUNC_START EfxFire_Main
EfxFire_Main: @ 0x0805DB5C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	ldr r0, .L0805DB88  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0805DB8C
	movs r5, #0x20
	movs r7, #0x34
	movs r3, #0x36
	mov r8, r3
	movs r0, #0x55
	mov r9, r0
	b .L0805DB98
	.align 2, 0
.L0805DB88: .4byte gBattleAnimSceneLayoutEnum
.L0805DB8C:
	movs r5, #0x28
	movs r7, #0x3c
	movs r1, #0x41
	mov r8, r1
	movs r3, #0x60
	mov r9, r3
.L0805DB98:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805DBC4
	ldr r0, [r4, #0x5c]
	bl func_0805DC64
	ldr r0, [r4, #0x5c]
	bl func_0805DD1C
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf1
	movs r3, #1
	bl func_080729A4
.L0805DBC4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bne .L0805DBD8
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L0805DC58
.L0805DBD8:
	cmp r0, r7
	bne .L0805DC42
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r5]
	cmp r0, #0
	bne .L0805DC58
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805DC18
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #0xf7
	movs r3, #1
	bl func_080729A4
	adds r0, r6, #0
	bl StartSubSpell_efxFireHITBG
	b .L0805DC3A
.L0805DC18:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xf8
	movs r3, #1
	bl func_080729A4
	adds r0, r6, #0
	bl StartSubSpell_efxElfireBG
	adds r0, r6, #0
	bl StartSubSpell_efxElfireBGCOL
	adds r0, r6, #0
	bl StartSubSpell_efxElfireOBJ
.L0805DC3A:
	adds r0, r6, #0
	bl func_08072450
	b .L0805DC58
.L0805DC42:
	cmp r0, r8
	beq .L0805DC58
	cmp r0, r9
	bne .L0805DC58
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805DC58:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxFire_Main

	THUMB_FUNC_START func_0805DC64
func_0805DC64: @ 0x0805DC64
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805DCA8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805DCAC  @ gUnknown_085D54B8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805DCB0  @ gUnknown_080DCD26
	str r1, [r0, #0x48]
	ldr r1, .L0805DCB4  @ gUnknown_085D54D0
	str r1, [r0, #0x4c]
	ldr r1, .L0805DCB8  @ gUnknown_085D5500
	str r1, [r0, #0x50]
	ldr r0, .L0805DCBC  @ gUnknown_085F6230
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0805DCC0  @ gUnknown_085F5638
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DCA8: .4byte gUnknown_0201774C
.L0805DCAC: .4byte gUnknown_085D54B8
.L0805DCB0: .4byte gUnknown_080DCD26
.L0805DCB4: .4byte gUnknown_085D54D0
.L0805DCB8: .4byte gUnknown_085D5500
.L0805DCBC: .4byte gUnknown_085F6230
.L0805DCC0: .4byte gUnknown_085F5638

	THUMB_FUNC_END func_0805DC64

	THUMB_FUNC_START Loop6C_efxFireBG
Loop6C_efxFireBG: @ 0x0805DCC4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L0805DCF2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L0805DD10
.L0805DCF2:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L0805DD10
	bl SpellFx_ClearBg1
	ldr r1, .L0805DD18  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0805DD10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DD18: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxFireBG

	THUMB_FUNC_START func_0805DD1C
func_0805DD1C: @ 0x0805DD1C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, .L0805DD60  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805DD64  @ gUnknown_085D5530
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, .L0805DD68  @ gUnknown_085F843C
	ldr r2, .L0805DD6C  @ gUnknown_085F80B4
	ldr r3, .L0805DD70  @ gUnknown_085F8468
	ldr r0, .L0805DD74  @ gUnknown_085F80E0
	str r0, [sp]
	adds r0, r6, #0
	bl func_08055554
	adds r5, r0, #0
	str r5, [r4, #0x60]
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805DD78
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L0805DD7C
	.align 2, 0
.L0805DD60: .4byte gUnknown_0201774C
.L0805DD64: .4byte gUnknown_085D5530
.L0805DD68: .4byte gUnknown_085F843C
.L0805DD6C: .4byte gUnknown_085F80B4
.L0805DD70: .4byte gUnknown_085F8468
.L0805DD74: .4byte gUnknown_085F80E0
.L0805DD78:
	ldrh r0, [r6, #2]
	adds r0, #8
.L0805DD7C:
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	adds r0, #8
	strh r0, [r5, #4]
	ldr r0, .L0805DDA0  @ gUnknown_085F7D64
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805DDA4  @ gUnknown_085F7768
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DDA0: .4byte gUnknown_085F7D64
.L0805DDA4: .4byte gUnknown_085F7768

	THUMB_FUNC_END func_0805DD1C

	THUMB_FUNC_START func_0805DDA8
func_0805DDA8: @ 0x0805DDA8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x25
	bne .L0805DDCE
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf2
	movs r3, #1
	bl func_080729A4
	b .L0805DDE6
.L0805DDCE:
	cmp r0, #0x32
	ble .L0805DDE6
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805DDEC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805DDE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DDEC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805DDA8

	THUMB_FUNC_START StartSubSpell_efxFireHITBG
StartSubSpell_efxFireHITBG: @ 0x0805DDF0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805DE48  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805DE4C  @ gUnknown_085D5548
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0805DE50  @ gUnknown_080DCD72
	str r0, [r5, #0x48]
	ldr r0, .L0805DE54  @ gUnknown_085D55B4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0805DE58  @ gUnknown_085D5560
	str r0, [r5, #0x54]
	ldr r0, .L0805DE5C  @ gUnknown_0860108C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r0, .L0805DE60  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805DE6E
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805DE64
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805DE6E
	.align 2, 0
.L0805DE48: .4byte gUnknown_0201774C
.L0805DE4C: .4byte gUnknown_085D5548
.L0805DE50: .4byte gUnknown_080DCD72
.L0805DE54: .4byte gUnknown_085D55B4
.L0805DE58: .4byte gUnknown_085D5560
.L0805DE5C: .4byte gUnknown_0860108C
.L0805DE60: .4byte gBattleAnimSceneLayoutEnum
.L0805DE64:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805DE6E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartSubSpell_efxFireHITBG

	THUMB_FUNC_START func_0805DE74
func_0805DE74: @ 0x0805DE74
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805DEB0
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L0805DECE
.L0805DEB0:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L0805DECE
	bl SpellFx_ClearBg1
	ldr r1, .L0805DED4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_End
.L0805DECE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DED4: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805DE74

	THUMB_FUNC_START StartSubSpell_efxElfireBG
StartSubSpell_efxElfireBG: @ 0x0805DED8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0805DF34  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805DF38  @ gUnknown_085D5608
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, .L0805DF3C  @ gUnknown_08602B94
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r5, #0x5c]
	ldr r2, .L0805DF40  @ gUnknown_08603D50
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_ResetBg1Offset
	bl SpellFx_InitBg1Blend
	ldr r0, .L0805DF44  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805DF64
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805DF48
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805DF52
	.align 2, 0
.L0805DF34: .4byte gUnknown_0201774C
.L0805DF38: .4byte gUnknown_085D5608
.L0805DF3C: .4byte gUnknown_08602B94
.L0805DF40: .4byte gUnknown_08603D50
.L0805DF44: .4byte gBattleAnimSceneLayoutEnum
.L0805DF48:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805DF52:
	ldr r0, .L0805DF6C  @ gBg1Tm+0x3C
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl func_08070DBC
.L0805DF64:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DF6C: .4byte gBg1Tm+0x3C

	THUMB_FUNC_END StartSubSpell_efxElfireBG

	THUMB_FUNC_START func_0805DF70
func_0805DF70: @ 0x0805DF70
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne .L0805DF98
	bl SpellFx_ClearBg1
	bl SpellFx_EndBlend
	ldr r1, .L0805DFA0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805DF98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DFA0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805DF70

	THUMB_FUNC_START StartSubSpell_efxElfireBGCOL
StartSubSpell_efxElfireBGCOL: @ 0x0805DFA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805DFD8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805DFDC  @ gUnknown_085D5620
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805DFE0  @ gUnknown_080DCDE4
	str r1, [r0, #0x48]
	ldr r1, .L0805DFE4  @ gUnknown_08603B50
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805DFD8: .4byte gUnknown_0201774C
.L0805DFDC: .4byte gUnknown_085D5620
.L0805DFE0: .4byte gUnknown_080DCDE4
.L0805DFE4: .4byte gUnknown_08603B50

	THUMB_FUNC_END StartSubSpell_efxElfireBGCOL

	THUMB_FUNC_START func_0805DFE8
func_0805DFE8: @ 0x0805DFE8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805E00E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0805E024
.L0805E00E:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0805E024
	ldr r1, .L0805E02C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805E024:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E02C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805DFE8

	THUMB_FUNC_START StartSubSpell_efxElfireOBJ
StartSubSpell_efxElfireOBJ: @ 0x0805E030
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805E070  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E074  @ gUnknown_085D5640
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L0805E078  @ gUnknown_08605DF4
	ldr r2, .L0805E07C  @ gUnknown_08604FD4
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl func_08055554
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805E080
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L0805E084
	.align 2, 0
.L0805E070: .4byte gUnknown_0201774C
.L0805E074: .4byte gUnknown_085D5640
.L0805E078: .4byte gUnknown_08605DF4
.L0805E07C: .4byte gUnknown_08604FD4
.L0805E080:
	ldrh r0, [r6, #2]
	adds r0, #8
.L0805E084:
	strh r0, [r6, #2]
	ldr r0, [r6, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x1c]
	ldr r0, .L0805E0AC  @ gUnknown_08604210
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805E0B0  @ gUnknown_08603F98
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E0AC: .4byte gUnknown_08604210
.L0805E0B0: .4byte gUnknown_08603F98

	THUMB_FUNC_END StartSubSpell_efxElfireOBJ

	THUMB_FUNC_START func_0805E0B4
func_0805E0B4: @ 0x0805E0B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble .L0805E0DA
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805E0E0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805E0DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E0E0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805E0B4

	THUMB_FUNC_START StartSpellAnimFimbulvetr
StartSpellAnimFimbulvetr: @ 0x0805E0E4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805E11C  @ gUnknown_085D5658
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E11C: .4byte gUnknown_085D5658

	THUMB_FUNC_END StartSpellAnimFimbulvetr

	THUMB_FUNC_START func_0805E120
func_0805E120: @ 0x0805E120
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805E14E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805E14E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0805E194
	adds r0, r5, #0
	bl func_0805E230
	adds r0, r5, #0
	bl func_0805E4C4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl func_0805BA1C
	movs r0, #0x91
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
.L0805E194:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x52
	cmp r1, r0
	bne .L0805E1AA
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl StartEfxFlashBG
	b .L0805E228
.L0805E1AA:
	adds r0, r6, #0
	adds r0, #0x55
	cmp r1, r0
	bne .L0805E1E4
	adds r0, r5, #0
	bl func_0805E318
	adds r0, r5, #0
	bl func_0805E430
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x10
	bl func_0805BA1C
	ldr r0, .L0805E1E0  @ 0x00000123
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	b .L0805E228
	.align 2, 0
.L0805E1E0: .4byte 0x00000123
.L0805E1E4:
	adds r0, r6, #0
	adds r0, #0x58
	cmp r1, r0
	bne .L0805E20C
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805E228
	adds r0, r5, #0
	bl func_08072450
	b .L0805E228
.L0805E20C:
	adds r0, r6, #0
	adds r0, #0x88
	cmp r1, r0
	beq .L0805E228
	adds r0, #0x19
	cmp r1, r0
	bne .L0805E228
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805E228:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805E120

	THUMB_FUNC_START func_0805E230
func_0805E230: @ 0x0805E230
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805E284  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E288  @ gUnknown_085D5670
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0805E28C  @ gUnknown_080DCE6E
	str r0, [r5, #0x48]
	ldr r0, .L0805E290  @ gUnknown_085D5688
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0805E294  @ gUnknown_085D56A0
	str r0, [r5, #0x54]
	ldr r0, .L0805E298  @ gUnknown_08617F04
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0805E29C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805E2AA
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805E2A0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805E2AA
	.align 2, 0
.L0805E284: .4byte gUnknown_0201774C
.L0805E288: .4byte gUnknown_085D5670
.L0805E28C: .4byte gUnknown_080DCE6E
.L0805E290: .4byte gUnknown_085D5688
.L0805E294: .4byte gUnknown_085D56A0
.L0805E298: .4byte gUnknown_08617F04
.L0805E29C: .4byte gBattleAnimSceneLayoutEnum
.L0805E2A0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805E2AA:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805E230

	THUMB_FUNC_START func_0805E2B4
func_0805E2B4: @ 0x0805E2B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L0805E2F0
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0805E30E
.L0805E2F0:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L0805E30E
	bl SpellFx_ClearBg1
	ldr r1, .L0805E314  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0805E30E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E314: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805E2B4

	THUMB_FUNC_START func_0805E318
func_0805E318: @ 0x0805E318
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805E36C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E370  @ gUnknown_085D56B8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0805E374  @ gUnknown_080DCEEC
	str r0, [r5, #0x48]
	ldr r0, .L0805E378  @ gUnknown_085D56D0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0805E37C  @ gUnknown_085D56FC
	str r0, [r5, #0x54]
	ldr r0, .L0805E380  @ gUnknown_086101DC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0805E384  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805E392
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805E388
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0805E392
	.align 2, 0
.L0805E36C: .4byte gUnknown_0201774C
.L0805E370: .4byte gUnknown_085D56B8
.L0805E374: .4byte gUnknown_080DCEEC
.L0805E378: .4byte gUnknown_085D56D0
.L0805E37C: .4byte gUnknown_085D56FC
.L0805E380: .4byte gUnknown_086101DC
.L0805E384: .4byte gBattleAnimSceneLayoutEnum
.L0805E388:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0805E392:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805E318

	THUMB_FUNC_START func_0805E39C
func_0805E39C: @ 0x0805E39C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L0805E3C0  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805E3CE
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805E3C4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805E3CE
	.align 2, 0
.L0805E3C0: .4byte gBattleAnimSceneLayoutEnum
.L0805E3C4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805E3CE:
	adds r0, r6, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805E408
	ldr r1, [r6, #0x4c]
	ldr r2, [r6, #0x50]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0805E426
.L0805E408:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L0805E426
	bl SpellFx_ClearBg1
	ldr r1, .L0805E42C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r6, #0
	bl Proc_Break
.L0805E426:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E42C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805E39C

	THUMB_FUNC_START func_0805E430
func_0805E430: @ 0x0805E430
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805E480  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E484  @ gUnknown_085D5728
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L0805E488  @ gUnknown_0861ACB8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	adds r1, #0x18
	strh r1, [r0, #2]
	ldr r0, .L0805E48C  @ gUnknown_08670528
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805E490  @ gUnknown_08618BBC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E480: .4byte gUnknown_0201774C
.L0805E484: .4byte gUnknown_085D5728
.L0805E488: .4byte gUnknown_0861ACB8
.L0805E48C: .4byte gUnknown_08670528
.L0805E490: .4byte gUnknown_08618BBC

	THUMB_FUNC_END func_0805E430

	THUMB_FUNC_START func_0805E494
func_0805E494: @ 0x0805E494
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	ble .L0805E4BA
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805E4C0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805E4BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E4C0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805E494

	THUMB_FUNC_START func_0805E4C4
func_0805E4C4: @ 0x0805E4C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805E500  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E504  @ gUnknown_085D5740
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, .L0805E508  @ gUnknown_08670528
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805E50C  @ gUnknown_08618BBC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E500: .4byte gUnknown_0201774C
.L0805E504: .4byte gUnknown_085D5740
.L0805E508: .4byte gUnknown_08670528
.L0805E50C: .4byte gUnknown_08618BBC

	THUMB_FUNC_END func_0805E4C4

	THUMB_FUNC_START func_0805E510
func_0805E510: @ 0x0805E510
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
.L0805E516:
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl func_0805E53C
	adds r4, #1
	cmp r4, #0x1f
	ble .L0805E516
	ldr r1, .L0805E538  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E538: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805E510

	THUMB_FUNC_START func_0805E53C
func_0805E53C: @ 0x0805E53C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r5, #0
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r1, .L0805E5CC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E5D0  @ gUnknown_085D5758
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	strh r5, [r7, #0x2c]
	movs r0, #0x64
	strh r0, [r7, #0x2e]
	movs r0, #7
	mov r1, r8
	ands r0, r1
	mov r2, sp
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x29
	strb r0, [r1]
	ldr r0, .L0805E5D4  @ gUnknown_0861AD24
	movs r1, #0x78
	bl BsoCreate
	str r0, [r7, #0x60]
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r5, .L0805E5D8  @ 0x0000FFFF
	adds r0, r5, #0
	bl AestheticRandNext_N1
	strh r0, [r7, #0x32]
	adds r0, r5, #0
	bl AestheticRandNext_N1
	strh r0, [r7, #0x3a]
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805E5E0
	adds r0, r5, #0
	bl AestheticRandNext_N1
	ldr r2, .L0805E5DC  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b .L0805E5F2
	.align 2, 0
.L0805E5CC: .4byte gUnknown_0201774C
.L0805E5D0: .4byte gUnknown_085D5758
.L0805E5D4: .4byte gUnknown_0861AD24
.L0805E5D8: .4byte 0x0000FFFF
.L0805E5DC: .4byte 0x000001FF
.L0805E5E0:
	adds r0, r5, #0
	bl AestheticRandNext_N1
	ldr r2, .L0805E63C  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
.L0805E5F2:
	adds r0, r0, r1
	strh r0, [r7, #0x34]
	ldr r4, .L0805E640  @ 0x0000FF0F
	adds r0, r4, #0
	bl AestheticRandNext_N1
	ldr r2, .L0805E644  @ 0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, .L0805E648  @ 0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl AestheticRandNext_N1
	strh r0, [r7, #0x36]
	adds r0, r4, #0
	bl AestheticRandNext_N1
	strh r0, [r7, #0x3e]
	movs r0, #7
	mov r2, r8
	ands r0, r2
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805E64C
	adds r0, r4, #0
	bl AestheticRandNext_N1
	ldr r2, .L0805E63C  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b .L0805E65E
	.align 2, 0
.L0805E63C: .4byte 0x000001FF
.L0805E640: .4byte 0x0000FF0F
.L0805E644: .4byte 0x000003FF
.L0805E648: .4byte 0xFFFFFF00
.L0805E64C:
	adds r0, r4, #0
	bl AestheticRandNext_N1
	ldr r2, .L0805E684  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
.L0805E65E:
	adds r0, r0, r1
	strh r0, [r7, #0x38]
	ldr r0, .L0805E688  @ 0x0000FF0F
	bl AestheticRandNext_N1
	ldr r2, .L0805E68C  @ 0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, .L0805E690  @ 0xFFFFFF00
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E684: .4byte 0x000001FF
.L0805E688: .4byte 0x0000FF0F
.L0805E68C: .4byte 0x000003FF
.L0805E690: .4byte 0xFFFFFF00

	THUMB_FUNC_END func_0805E53C

	THUMB_FUNC_START func_0805E694
func_0805E694: @ 0x0805E694
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x60]
	ldrh r0, [r4, #0x2c]
	adds r2, r0, #1
	strh r2, [r4, #0x2c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x2e
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble .L0805E6C8
	ldr r1, .L0805E6C4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
	b .L0805E748
	.align 2, 0
.L0805E6C4: .4byte gUnknown_0201774C
.L0805E6C8:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne .L0805E70C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805E6E4
	ldr r0, .L0805E6E0  @ gUnknown_0861AD84
	b .L0805E6E6
	.align 2, 0
.L0805E6E0: .4byte gUnknown_0861AD84
.L0805E6E4:
	ldr r0, .L0805E708  @ gUnknown_0861AD8C
.L0805E6E6:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r1, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	strh r1, [r4, #0x32]
	ldrh r0, [r4, #0x3c]
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r0, [r4, #0x3a]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	strh r1, [r3, #2]
	ldrh r0, [r4, #0x3a]
	b .L0805E744
	.align 2, 0
.L0805E708: .4byte gUnknown_0861AD8C
.L0805E70C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0805E720
	ldr r0, .L0805E71C  @ gUnknown_0861AD84
	b .L0805E722
	.align 2, 0
.L0805E71C: .4byte gUnknown_0861AD84
.L0805E720:
	ldr r0, .L0805E750  @ gUnknown_0861AD8C
.L0805E722:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r0, [r4, #0x38]
	ldrh r5, [r4, #0x3e]
	adds r0, r0, r5
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x36]
	lsrs r0, r0, #8
	strh r0, [r3, #2]
	ldrh r0, [r4, #0x3e]
.L0805E744:
	lsrs r0, r0, #8
	strh r0, [r3, #4]
.L0805E748:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E750: .4byte gUnknown_0861AD8C

	THUMB_FUNC_END func_0805E694

	THUMB_FUNC_START func_0805E754
func_0805E754: @ 0x0805E754
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805E78C  @ gUnknown_085D5770
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E78C: .4byte gUnknown_085D5770

	THUMB_FUNC_END func_0805E754

	THUMB_FUNC_START func_0805E790
func_0805E790: @ 0x0805E790
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805E7BA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805E7BA:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0805E7E0
	ldr r0, .L0805E828  @ 0x00000119
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	bl func_0805E850
	adds r0, r5, #0
	bl func_0805E98C
.L0805E7E0:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x59
	cmp r1, r0
	bne .L0805E7F6
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl func_0805EAAC
.L0805E7F6:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x5e
	cmp r1, r0
	bne .L0805E82C
	adds r0, r5, #0
	bl func_0805E900
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805E848
	adds r0, r5, #0
	bl func_08072450
	b .L0805E848
	.align 2, 0
.L0805E828: .4byte 0x00000119
.L0805E82C:
	adds r0, r6, #0
	adds r0, #0xc3
	cmp r1, r0
	beq .L0805E848
	adds r0, #5
	cmp r1, r0
	bne .L0805E848
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805E848:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805E790

	THUMB_FUNC_START func_0805E850
func_0805E850: @ 0x0805E850
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805E88C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E890  @ gUnknown_085D5788
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805E894  @ gUnknown_080DCF7E
	str r1, [r0, #0x48]
	ldr r1, .L0805E898  @ gUnknown_085D57CC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L0805E89C  @ gUnknown_085D57A0
	str r1, [r0, #0x54]
	ldr r0, .L0805E8A0  @ gUnknown_08608838
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E88C: .4byte gUnknown_0201774C
.L0805E890: .4byte gUnknown_085D5788
.L0805E894: .4byte gUnknown_080DCF7E
.L0805E898: .4byte gUnknown_085D57CC
.L0805E89C: .4byte gUnknown_085D57A0
.L0805E8A0: .4byte gUnknown_08608838

	THUMB_FUNC_END func_0805E850

	THUMB_FUNC_START func_0805E8A4
func_0805E8A4: @ 0x0805E8A4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805E8E0
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L0805E8F6
.L0805E8E0:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L0805E8F6
	ldr r1, .L0805E8FC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
.L0805E8F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E8FC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805E8A4

	THUMB_FUNC_START func_0805E900
func_0805E900: @ 0x0805E900
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805E91C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E920  @ gUnknown_085D57F8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E91C: .4byte gUnknown_0201774C
.L0805E920: .4byte gUnknown_085D57F8

	THUMB_FUNC_END func_0805E900

	THUMB_FUNC_START func_0805E924
func_0805E924: @ 0x0805E924
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldr r3, .L0805E95C  @ gUnknown_0860A5D4
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L0805E960  @ gUnknown_085F3F40
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805E964  @ gUnknown_085F3AA8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E95C: .4byte gUnknown_0860A5D4
.L0805E960: .4byte gUnknown_085F3F40
.L0805E964: .4byte gUnknown_085F3AA8

	THUMB_FUNC_END func_0805E924

	THUMB_FUNC_START func_0805E968
func_0805E968: @ 0x0805E968
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L0805E988  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E988: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805E968

	THUMB_FUNC_START func_0805E98C
func_0805E98C: @ 0x0805E98C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805E9A8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805E9AC  @ gUnknown_085D5820
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805E9A8: .4byte gUnknown_0201774C
.L0805E9AC: .4byte gUnknown_085D5820

	THUMB_FUNC_END func_0805E98C

	THUMB_FUNC_START func_0805E9B0
func_0805E9B0: @ 0x0805E9B0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	ldr r0, [r4, #0x5c]
	movs r1, #0x26
	bl StartEfxFlashBG
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805E9B0

	THUMB_FUNC_START func_0805E9E4
func_0805E9E4: @ 0x0805E9E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L0805EA44  @ gPal
	ldr r4, .L0805EA48  @ gUnknown_020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl ApplyFlashingPaletteAnimation
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble .L0805EA3A
	movs r0, #0
	strh r0, [r6, #0x2c]
	movs r0, #0xa
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl Proc_Break
.L0805EA3A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EA44: .4byte gPal
.L0805EA48: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_0805E9E4

	THUMB_FUNC_START func_0805EA4C
func_0805EA4C: @ 0x0805EA4C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L0805EA9E
	bl SpellFx_ClearBg1
	bl SpellFx_EndBlend
	ldr r1, .L0805EAA8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805EA9E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EAA8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805EA4C

	THUMB_FUNC_START func_0805EAAC
func_0805EAAC: @ 0x0805EAAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, .L0805EAE0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805EAE4  @ gPal
	ldr r1, .L0805EAE8  @ gUnknown_020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, .L0805EAEC  @ gUnknown_085D5860
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EAE0: .4byte gUnknown_0201774C
.L0805EAE4: .4byte gPal
.L0805EAE8: .4byte gUnknown_020165C8
.L0805EAEC: .4byte gUnknown_085D5860

	THUMB_FUNC_END func_0805EAAC

	THUMB_FUNC_START func_0805EAF0
func_0805EAF0: @ 0x0805EAF0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r3, r0, #0
	ldr r4, .L0805EB50  @ gUnknown_020165C8
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl ApplyColorDarken_Unsure
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble .L0805EB46
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
.L0805EB46:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EB50: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_0805EAF0

	THUMB_FUNC_START func_0805EB54
func_0805EB54: @ 0x0805EB54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0805EB90  @ gUnknown_020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L0805EB8A
	ldr r1, .L0805EB94  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805EB8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EB90: .4byte gUnknown_020165C8
.L0805EB94: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805EB54

	THUMB_FUNC_START func_0805EB98
func_0805EB98: @ 0x0805EB98
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805EBD0  @ gUnknown_085D5880
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EBD0: .4byte gUnknown_085D5880

	THUMB_FUNC_END func_0805EB98

	THUMB_FUNC_START func_0805EBD4
func_0805EBD4: @ 0x0805EBD4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldr r0, .L0805EC2C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0x3a
	cmp r0, #0
	beq .L0805EBF6
	movs r3, #0x32
.L0805EBF6:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805EC30
	ldr r0, [r4, #0x5c]
	bl func_0805EE24
	movs r0, #0x84
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L0805ECCC
	.align 2, 0
.L0805EC2C: .4byte gBattleAnimSceneLayoutEnum
.L0805EC30:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, r2
	cmp r1, r0
	bne .L0805EC44
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl StartEfxFlashBG
	b .L0805ECCC
.L0805EC44:
	adds r0, r2, #6
	adds r0, r3, r0
	cmp r1, r0
	bne .L0805EC80
	adds r0, r5, #0
	bl func_0805ECD4
	adds r0, r5, #0
	bl func_0805ED98
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #6
	movs r2, #5
	movs r3, #0x10
	bl func_0805BA1C
	ldr r0, .L0805EC7C  @ 0x00000109
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	b .L0805ECCC
	.align 2, 0
.L0805EC7C: .4byte 0x00000109
.L0805EC80:
	adds r0, r2, #0
	adds r0, #8
	adds r0, r3, r0
	cmp r1, r0
	bne .L0805ECAA
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805ECCC
	adds r0, r5, #0
	bl func_08072450
	b .L0805ECCC
.L0805ECAA:
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r3, r0
	cmp r1, r0
	beq .L0805ECCC
	adds r0, r2, #0
	adds r0, #0xe
	adds r0, r3, r0
	cmp r1, r0
	bne .L0805ECCC
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805ECCC:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805EBD4

	THUMB_FUNC_START func_0805ECD4
func_0805ECD4: @ 0x0805ECD4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L0805ED20  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805ED24  @ gUnknown_085D5898
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L0805ED28  @ gUnknown_080DD024
	str r0, [r4, #0x48]
	ldr r0, .L0805ED2C  @ gUnknown_085D58B0
	str r0, [r4, #0x4c]
	ldr r0, .L0805ED30  @ gUnknown_08621960
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805ED34
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805ED3E
	.align 2, 0
.L0805ED20: .4byte gUnknown_0201774C
.L0805ED24: .4byte gUnknown_085D5898
.L0805ED28: .4byte gUnknown_080DD024
.L0805ED2C: .4byte gUnknown_085D58B0
.L0805ED30: .4byte gUnknown_08621960
.L0805ED34:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805ED3E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805ECD4

	THUMB_FUNC_START func_0805ED44
func_0805ED44: @ 0x0805ED44
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805ED70
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x20
	movs r3, #0x14
	bl func_0805576C
	b .L0805ED8E
.L0805ED70:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0805ED8E
	bl SpellFx_ClearBg1
	ldr r1, .L0805ED94  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0805ED8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805ED94: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805ED44

	THUMB_FUNC_START func_0805ED98
func_0805ED98: @ 0x0805ED98
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805EDCC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805EDD0  @ gUnknown_085D58B8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, .L0805EDD4  @ gUnknown_080DD044
	str r1, [r0, #0x48]
	ldr r1, .L0805EDD8  @ gUnknown_08622F2C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EDCC: .4byte gUnknown_0201774C
.L0805EDD0: .4byte gUnknown_085D58B8
.L0805EDD4: .4byte gUnknown_080DD044
.L0805EDD8: .4byte gUnknown_08622F2C

	THUMB_FUNC_END func_0805ED98

	THUMB_FUNC_START func_0805EDDC
func_0805EDDC: @ 0x0805EDDC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0805EE02
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0805EE18
.L0805EE02:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0805EE18
	ldr r1, .L0805EE20  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0805EE18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EE20: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805EDDC

	THUMB_FUNC_START func_0805EE24
func_0805EE24: @ 0x0805EE24
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L0805EE68  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805EE6C  @ gUnknown_085D58D8
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, .L0805EE70  @ gUnknown_086267D8
	ldr r2, .L0805EE74  @ gUnknown_08625094
	ldr r3, .L0805EE78  @ gUnknown_0862688C
	ldr r0, .L0805EE7C  @ gUnknown_08625148
	str r0, [sp]
	adds r0, r4, #0
	bl func_08055554
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805EE80
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b .L0805EE84
	.align 2, 0
.L0805EE68: .4byte gUnknown_0201774C
.L0805EE6C: .4byte gUnknown_085D58D8
.L0805EE70: .4byte gUnknown_086267D8
.L0805EE74: .4byte gUnknown_08625094
.L0805EE78: .4byte gUnknown_0862688C
.L0805EE7C: .4byte gUnknown_08625148
.L0805EE80:
	ldrh r0, [r5, #2]
	subs r0, #0x48
.L0805EE84:
	strh r0, [r5, #2]
	movs r0, #0x60
	strh r0, [r6, #0x2e]
	ldr r0, .L0805EEA4  @ gUnknown_08623A9C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805EEA8  @ gUnknown_086234D8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EEA4: .4byte gUnknown_08623A9C
.L0805EEA8: .4byte gUnknown_086234D8

	THUMB_FUNC_END func_0805EE24

	THUMB_FUNC_START func_0805EEAC
func_0805EEAC: @ 0x0805EEAC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne .L0805EED0
	ldr r1, .L0805EED4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
.L0805EED0:
	pop {r0}
	bx r0
	.align 2, 0
.L0805EED4: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805EEAC

	THUMB_FUNC_START func_0805EED8
func_0805EED8: @ 0x0805EED8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805EF10  @ gUnknown_085D58F0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805EF10: .4byte gUnknown_085D58F0

	THUMB_FUNC_END func_0805EED8

	THUMB_FUNC_START func_0805EF14
func_0805EF14: @ 0x0805EF14
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805EF50
	movs r0, #0x85
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	bl func_0805F004
	b .L0805EFFE
.L0805EF50:
	cmp r0, #0x10
	bne .L0805EF5C
	ldr r0, [r4, #0x5c]
	bl func_0805F1A4
	b .L0805EFFE
.L0805EF5C:
	cmp r0, #0x4a
	bne .L0805EF6C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L0805EFFE
.L0805EF6C:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x4b
	cmp r1, r0
	bne .L0805EF82
	adds r0, r5, #0
	bl func_0805F1E8
	str r0, [r4, #0x64]
	b .L0805EFFE
.L0805EF82:
	adds r0, r2, #0
	adds r0, #0x5e
	cmp r1, r0
	bne .L0805EFA8
	ldr r0, .L0805EFA4  @ 0x000002E1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	ldr r0, [r4, #0x5c]
	bl func_0805F0B0
	b .L0805EFFE
	.align 2, 0
.L0805EFA4: .4byte 0x000002E1
.L0805EFA8:
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne .L0805EFB8
	ldr r0, [r4, #0x64]
	bl Proc_End
	b .L0805EFFE
.L0805EFB8:
	adds r0, r2, #0
	adds r0, #0x83
	cmp r1, r0
	bne .L0805EFE8
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl StartEfxFlashBG
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805EFFE
	adds r0, r5, #0
	bl func_08072450
	b .L0805EFFE
.L0805EFE8:
	adds r0, r2, #0
	adds r0, #0xa4
	cmp r1, r0
	bne .L0805EFFE
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805EFFE:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805EF14

	THUMB_FUNC_START func_0805F004
func_0805F004: @ 0x0805F004
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805F05C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805F060  @ gUnknown_085D5908
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0805F064  @ gUnknown_080DD094
	str r0, [r5, #0x48]
	ldr r0, .L0805F068  @ gUnknown_085D5920
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0805F06C  @ gUnknown_085D59C4
	str r0, [r5, #0x54]
	ldr r0, .L0805F070  @ gUnknown_0862A2D0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r0, .L0805F074  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805F082
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805F078
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0805F082
	.align 2, 0
.L0805F05C: .4byte gUnknown_0201774C
.L0805F060: .4byte gUnknown_085D5908
.L0805F064: .4byte gUnknown_080DD094
.L0805F068: .4byte gUnknown_085D5920
.L0805F06C: .4byte gUnknown_085D59C4
.L0805F070: .4byte gUnknown_0862A2D0
.L0805F074: .4byte gBattleAnimSceneLayoutEnum
.L0805F078:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0805F082:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805F098
	ldr r1, .L0805F094  @ gDispIo
	ldrh r0, [r1, #0x20]
	adds r0, #4
	b .L0805F09E
	.align 2, 0
.L0805F094: .4byte gDispIo
.L0805F098:
	ldr r1, .L0805F0AC  @ gDispIo
	ldrh r0, [r1, #0x20]
	subs r0, #4
.L0805F09E:
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x22]
	adds r0, #8
	strh r0, [r1, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F0AC: .4byte gDispIo

	THUMB_FUNC_END func_0805F004

	THUMB_FUNC_START func_0805F0B0
func_0805F0B0: @ 0x0805F0B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805F114  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805F118  @ gUnknown_085D5908
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0805F11C  @ gUnknown_080DD0C6
	str r0, [r5, #0x48]
	ldr r0, .L0805F120  @ gUnknown_085D5920
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0805F124  @ gUnknown_085D59C4
	str r0, [r5, #0x54]
	ldr r0, .L0805F128  @ gUnknown_0862A2F0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0xa
	movs r2, #7
	movs r3, #0
	bl SetBlendConfig
	ldr r0, .L0805F12C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805F13A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805F130
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0805F13A
	.align 2, 0
.L0805F114: .4byte gUnknown_0201774C
.L0805F118: .4byte gUnknown_085D5908
.L0805F11C: .4byte gUnknown_080DD0C6
.L0805F120: .4byte gUnknown_085D5920
.L0805F124: .4byte gUnknown_085D59C4
.L0805F128: .4byte gUnknown_0862A2F0
.L0805F12C: .4byte gBattleAnimSceneLayoutEnum
.L0805F130:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0805F13A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805F0B0

	THUMB_FUNC_START func_0805F140
func_0805F140: @ 0x0805F140
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805F17C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L0805F19A
.L0805F17C:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L0805F19A
	bl SpellFx_ClearBg1
	ldr r1, .L0805F1A0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_End
.L0805F19A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F1A0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805F140

	THUMB_FUNC_START func_0805F1A4
func_0805F1A4: @ 0x0805F1A4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805F1DC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805F1E0  @ gUnknown_085D5A68
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	ldr r3, .L0805F1E4  @ gUnknown_085D4F90
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F1DC: .4byte gUnknown_0201774C
.L0805F1E0: .4byte gUnknown_085D5A68
.L0805F1E4: .4byte gUnknown_085D4F90

	THUMB_FUNC_END func_0805F1A4

	THUMB_FUNC_START func_0805F1E8
func_0805F1E8: @ 0x0805F1E8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0805F228  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805F22C  @ gUnknown_085D5AB0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	ldr r3, .L0805F230  @ gUnknown_085D4F90
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #4
	strh r1, [r0, #4]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0805F228: .4byte gUnknown_0201774C
.L0805F22C: .4byte gUnknown_085D5AB0
.L0805F230: .4byte gUnknown_085D4F90

	THUMB_FUNC_END func_0805F1E8

	THUMB_FUNC_START func_0805F234
func_0805F234: @ 0x0805F234
	push {lr}
	ldr r2, .L0805F248  @ gUnknown_0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BsoRemove
	pop {r0}
	bx r0
	.align 2, 0
.L0805F248: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805F234

	THUMB_FUNC_START func_0805F24C
func_0805F24C: @ 0x0805F24C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L0805F27C  @ gUnknown_0862D6A8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805F280  @ gUnknown_0862D424
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805F284  @ gUnknown_0862C82C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F27C: .4byte gUnknown_0862D6A8
.L0805F280: .4byte gUnknown_0862D424
.L0805F284: .4byte gUnknown_0862C82C

	THUMB_FUNC_END func_0805F24C

	THUMB_FUNC_START func_0805F288
func_0805F288: @ 0x0805F288
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L0805F2B8  @ gUnknown_0862D82C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805F2BC  @ gUnknown_0862D424
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805F2C0  @ gUnknown_0862CC2C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F2B8: .4byte gUnknown_0862D82C
.L0805F2BC: .4byte gUnknown_0862D424
.L0805F2C0: .4byte gUnknown_0862CC2C

	THUMB_FUNC_END func_0805F288

	THUMB_FUNC_START func_0805F2C4
func_0805F2C4: @ 0x0805F2C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L0805F2F4  @ gUnknown_0862DCE0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0805F2F8  @ gUnknown_0862D424
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805F2FC  @ gUnknown_0862D06C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F2F4: .4byte gUnknown_0862DCE0
.L0805F2F8: .4byte gUnknown_0862D424
.L0805F2FC: .4byte gUnknown_0862D06C

	THUMB_FUNC_END func_0805F2C4

	THUMB_FUNC_START func_0805F300
func_0805F300: @ 0x0805F300
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L0805F328  @ gUnknown_0862DC24
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl BsoSort
	movs r0, #0x27
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F328: .4byte gUnknown_0862DC24

	THUMB_FUNC_END func_0805F300

	THUMB_FUNC_START func_0805F32C
func_0805F32C: @ 0x0805F32C
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne .L0805F34C
	ldr r0, .L0805F350  @ gUnknown_0862DC58
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	strh r3, [r1, #0x2c]
.L0805F34C:
	pop {r0}
	bx r0
	.align 2, 0
.L0805F350: .4byte gUnknown_0862DC58

	THUMB_FUNC_END func_0805F32C

	THUMB_FUNC_START StartSpellAnimNosferatu
StartSpellAnimNosferatu: @ 0x0805F354
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805F38C  @ gUnknown_085D5AE0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F38C: .4byte gUnknown_085D5AE0

	THUMB_FUNC_END StartSpellAnimNosferatu

	THUMB_FUNC_START EfxResire_Main
EfxResire_Main: @ 0x0805F390
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805F3BE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805F3BE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0805F402
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl func_0805BA1C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x23
	movs r2, #0x14
	movs r3, #0x10
	bl func_0805BA1C
	adds r0, r5, #0
	bl func_0805F53C
	movs r0, #0x92
	lsls r0, r0, #1
	b .L0805F452
.L0805F402:
	adds r0, r6, #0
	adds r0, #0xf
	cmp r1, r0
	bne .L0805F43C
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl func_0805B400
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x1e
	bl func_0805F838
	ldr r0, .L0805F438  @ gDispIo
	movs r1, #0x20
	ldrsh r2, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x2b
	movs r3, #0
	bl func_0805B828
	b .L0805F4A8
	.align 2, 0
.L0805F438: .4byte gDispIo
.L0805F43C:
	adds r0, r6, #0
	adds r0, #0x3c
	cmp r1, r0
	bne .L0805F468
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r5, #0
	bl func_0805F4B0
	ldr r0, .L0805F464  @ 0x00000125
.L0805F452:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	b .L0805F4A8
	.align 2, 0
.L0805F464: .4byte 0x00000125
.L0805F468:
	adds r0, r6, #0
	adds r0, #0x41
	cmp r1, r0
	bne .L0805F490
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimResireHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805F4A8
	adds r0, r5, #0
	bl func_08072450
	b .L0805F4A8
.L0805F490:
	adds r0, r6, #0
	adds r0, #0x6e
	cmp r1, r0
	beq .L0805F4A8
	adds r0, #0x14
	cmp r1, r0
	bne .L0805F4A8
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
.L0805F4A8:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxResire_Main

	THUMB_FUNC_START func_0805F4B0
func_0805F4B0: @ 0x0805F4B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0805F510  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805F514  @ gUnknown_085D5AF8
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r5, [r1]
	strh r0, [r6, #0x2c]
	str r0, [r6, #0x44]
	ldr r0, .L0805F518  @ gUnknown_080DD186
	str r0, [r6, #0x48]
	ldr r0, .L0805F51C  @ gUnknown_085D5C0C
	str r0, [r6, #0x4c]
	str r0, [r6, #0x50]
	ldr r0, .L0805F520  @ gUnknown_085D5B40
	str r0, [r6, #0x54]
	ldr r0, .L0805F524  @ gUnknown_08636640
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r0, .L0805F528  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805F536
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805F52C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805F536
	.align 2, 0
.L0805F510: .4byte gUnknown_0201774C
.L0805F514: .4byte gUnknown_085D5AF8
.L0805F518: .4byte gUnknown_080DD186
.L0805F51C: .4byte gUnknown_085D5C0C
.L0805F520: .4byte gUnknown_085D5B40
.L0805F524: .4byte gUnknown_08636640
.L0805F528: .4byte gBattleAnimSceneLayoutEnum
.L0805F52C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805F536:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805F4B0

	THUMB_FUNC_START func_0805F53C
func_0805F53C: @ 0x0805F53C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805F5AC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805F5B0  @ gUnknown_085D5B28
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0805F5B4  @ gUnknown_080DD252
	str r0, [r5, #0x48]
	ldr r0, .L0805F5B8  @ gUnknown_085D5C0C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0805F5BC  @ gUnknown_085D5B40
	str r0, [r5, #0x54]
	ldr r0, .L0805F5C0  @ gUnknown_08636640
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r2, .L0805F5C4  @ gDispIo
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
	ldr r0, .L0805F5C8  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805F5D6
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805F5CC
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805F5D6
	.align 2, 0
.L0805F5AC: .4byte gUnknown_0201774C
.L0805F5B0: .4byte gUnknown_085D5B28
.L0805F5B4: .4byte gUnknown_080DD252
.L0805F5B8: .4byte gUnknown_085D5C0C
.L0805F5BC: .4byte gUnknown_085D5B40
.L0805F5C0: .4byte gUnknown_08636640
.L0805F5C4: .4byte gDispIo
.L0805F5C8: .4byte gBattleAnimSceneLayoutEnum
.L0805F5CC:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805F5D6:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805F53C

	THUMB_FUNC_START func_0805F5DC
func_0805F5DC: @ 0x0805F5DC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805F618
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L0805F65A
.L0805F618:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L0805F65A
	bl SpellFx_ClearBg1
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0805F64C
	ldr r1, .L0805F648  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	bl StartEndEfxSpellCast
	adds r0, r7, #0
	bl Proc_End
	b .L0805F65A
	.align 2, 0
.L0805F648: .4byte gUnknown_0201774C
.L0805F64C:
	movs r0, #0
	strh r0, [r7, #0x2c]
	movs r0, #1
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl Proc_Break
.L0805F65A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805F5DC

	THUMB_FUNC_START func_0805F660
func_0805F660: @ 0x0805F660
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L0805F684  @ gUnknown_02017750
	ldr r0, [r5]
	cmp r0, #2
	bne .L0805F68C
	ldr r1, .L0805F688  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_End
	b .L0805F6E6
	.align 2, 0
.L0805F684: .4byte gUnknown_02017750
.L0805F688: .4byte gUnknown_0201774C
.L0805F68C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	ldrh r1, [r4, #0x2e]
	cmp r0, r2
	ble .L0805F6A4
	strh r1, [r4, #0x2c]
.L0805F6A4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bne .L0805F6E6
	ldr r0, [r5]
	cmp r0, #1
	bne .L0805F6E6
	strh r3, [r4, #0x2c]
	strh r3, [r4, #0x2e]
	str r3, [r4, #0x44]
	ldr r0, .L0805F6EC  @ gUnknown_080DD1F4
	str r0, [r4, #0x48]
	ldr r0, .L0805F6F0  @ gUnknown_085D5C0C
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, .L0805F6F4  @ gUnknown_085D5B40
	str r0, [r4, #0x54]
	ldr r0, .L0805F6F8  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805F6E0
	bl GetSpellAnimationStartFrame
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805F6E0:
	adds r0, r4, #0
	bl Proc_Break
.L0805F6E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F6EC: .4byte gUnknown_080DD1F4
.L0805F6F0: .4byte gUnknown_085D5C0C
.L0805F6F4: .4byte gUnknown_085D5B40
.L0805F6F8: .4byte gBattleAnimSceneLayoutEnum

	THUMB_FUNC_END func_0805F660

	THUMB_FUNC_START func_0805F6FC
func_0805F6FC: @ 0x0805F6FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L0805F766
	ldr r0, .L0805F73C  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq .L0805F74A
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805F740
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0805F74A
	.align 2, 0
.L0805F73C: .4byte gBattleAnimSceneLayoutEnum
.L0805F740:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0805F74A:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x93
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r4, #0
	bl Proc_Break
.L0805F766:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805F6FC

	THUMB_FUNC_START func_0805F76C
func_0805F76C: @ 0x0805F76C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805F7A8
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L0805F7CA
.L0805F7A8:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L0805F7CA
	bl SpellFx_ClearBg1
	ldr r1, .L0805F7D0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	bl StartEndEfxSpellCast
	adds r0, r7, #0
	bl Proc_Break
.L0805F7CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F7D0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805F76C

	THUMB_FUNC_START func_0805F7D4
func_0805F7D4: @ 0x0805F7D4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0805F810
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L0805F82E
.L0805F810:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L0805F82E
	bl SpellFx_ClearBg1
	ldr r1, .L0805F834  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_Break
.L0805F82E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F834: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805F7D4

	THUMB_FUNC_START func_0805F838
func_0805F838: @ 0x0805F838
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, .L0805F860  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805F864  @ gUnknown_085D5CD8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F860: .4byte gUnknown_0201774C
.L0805F864: .4byte gUnknown_085D5CD8

	THUMB_FUNC_END func_0805F838

	THUMB_FUNC_START func_0805F868
func_0805F868: @ 0x0805F868
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x80
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble .L0805F8A6
	ldr r1, .L0805F8B0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L0805F8A6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F8B0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805F868

	THUMB_FUNC_START func_0805F8B4
func_0805F8B4: @ 0x0805F8B4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805F8EC  @ gUnknown_085D5CF0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805F8EC: .4byte gUnknown_085D5CF0

	THUMB_FUNC_END func_0805F8B4

	THUMB_FUNC_START func_0805F8F0
func_0805F8F0: @ 0x0805F8F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805F91A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805F91A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L0805F93E
	movs r0, #0x90
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	bl func_0805F9A8
	b .L0805F9A0
.L0805F93E:
	adds r0, r6, #0
	adds r0, #0x1a
	cmp r1, r0
	bne .L0805F984
	ldr r0, .L0805F980  @ 0x00000121
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl StartEfxFlashBG
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805F9A0
	adds r0, r5, #0
	bl func_08072450
	b .L0805F9A0
	.align 2, 0
.L0805F980: .4byte 0x00000121
.L0805F984:
	adds r0, r6, #0
	adds r0, #0x2f
	cmp r1, r0
	beq .L0805F9A0
	adds r0, #1
	cmp r1, r0
	bne .L0805F9A0
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805F9A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805F8F0

	THUMB_FUNC_START func_0805F9A8
func_0805F9A8: @ 0x0805F9A8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0805F9FC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805FA00  @ gUnknown_085D5D08
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0805FA04  @ gUnknown_080DD288
	str r0, [r5, #0x48]
	ldr r0, .L0805FA08  @ gUnknown_085D5E28
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0805FA0C  @ gUnknown_085D5D20
	str r0, [r5, #0x54]
	ldr r0, .L0805FA10  @ gUnknown_085D5DA4
	str r0, [r5, #0x58]
	bl SpellFx_InitBg1Blend
	ldr r0, .L0805FA14  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805FA22
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0805FA18
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L0805FA22
	.align 2, 0
.L0805F9FC: .4byte gUnknown_0201774C
.L0805FA00: .4byte gUnknown_085D5D08
.L0805FA04: .4byte gUnknown_080DD288
.L0805FA08: .4byte gUnknown_085D5E28
.L0805FA0C: .4byte gUnknown_085D5D20
.L0805FA10: .4byte gUnknown_085D5DA4
.L0805FA14: .4byte gBattleAnimSceneLayoutEnum
.L0805FA18:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L0805FA22:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805F9A8

	THUMB_FUNC_START func_0805FA28
func_0805FA28: @ 0x0805FA28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L0805FAB0
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	ldr r0, .L0805FA90  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0805FACE
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne .L0805FA98
	ldr r0, .L0805FA94  @ gBg1Tm
	b .L0805FA9C
	.align 2, 0
.L0805FA90: .4byte gBattleAnimSceneLayoutEnum
.L0805FA94: .4byte gBg1Tm
.L0805FA98:
	ldr r0, .L0805FAAC  @ gBg1Tm+0x3A
	movs r1, #0
.L0805FA9C:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L0805FACE
	.align 2, 0
.L0805FAAC: .4byte gBg1Tm+0x3A
.L0805FAB0:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne .L0805FACE
	bl SpellFx_ClearBg1
	ldr r1, .L0805FADC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_End
.L0805FACE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805FADC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805FA28

	THUMB_FUNC_START StartSpellAnimPurge
StartSpellAnimPurge: @ 0x0805FAE0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805FB1C  @ gUnknown_085D5EAC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r6, #0
	strh r6, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	ldr r0, .L0805FB20  @ gUnknown_02020044
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805FB1C: .4byte gUnknown_085D5EAC
.L0805FB20: .4byte gUnknown_02020044

	THUMB_FUNC_END StartSpellAnimPurge

	THUMB_FUNC_START func_0805FB24
func_0805FB24: @ 0x0805FB24
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, .L0805FB40  @ gUnknown_02020044
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0805FB44
	adds r1, #0xff
	movs r0, #0xfe
	bl func_080729A4
	b .L0805FB4E
	.align 2, 0
.L0805FB40: .4byte gUnknown_02020044
.L0805FB44:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xff
	bl func_080729A4
.L0805FB4E:
	ldr r1, .L0805FB5C  @ gUnknown_02020044
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0805FB5C: .4byte gUnknown_02020044

	THUMB_FUNC_END func_0805FB24

	THUMB_FUNC_START func_0805FB60
func_0805FB60: @ 0x0805FB60
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0805FB8E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0805FB8E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L0805FBB0
	adds r0, r5, #0
	movs r1, #4
	bl StartEfxFlashBG
	adds r0, r5, #0
	bl func_0805FC90
	adds r0, r5, #0
	bl func_0805FD5C
	movs r0, #0x30
	b .L0805FBD6
.L0805FBB0:
	adds r0, r4, #0
	adds r0, #0x15
	cmp r1, r0
	bne .L0805FBC4
	adds r0, r5, #0
	movs r1, #4
	bl StartEfxFlashBG
	movs r0, #0xa0
	b .L0805FBD6
.L0805FBC4:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne .L0805FBDE
	adds r0, r5, #0
	movs r1, #4
	bl StartEfxFlashBG
	movs r0, #0x70
.L0805FBD6:
	movs r1, #0
	bl func_0805FB24
	b .L0805FC88
.L0805FBDE:
	adds r0, r4, #0
	adds r0, #0x3d
	cmp r1, r0
	bne .L0805FC12
	adds r0, r5, #0
	movs r1, #4
	bl StartEfxFlashBG
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl func_0805BA1C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r0, r1, #0
	movs r3, #1
	bl func_080729A4
	b .L0805FC88
.L0805FC12:
	adds r0, r4, #0
	adds r0, #0x5e
	cmp r1, r0
	bne .L0805FC58
	adds r0, r5, #0
	movs r1, #4
	bl StartEfxFlashBG
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, .L0805FC54  @ 0x00000101
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805FC88
	adds r0, r5, #0
	bl func_08072450
	b .L0805FC88
	.align 2, 0
.L0805FC54: .4byte 0x00000101
.L0805FC58:
	adds r0, r4, #0
	adds r0, #0x69
	cmp r1, r0
	bne .L0805FC72
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #8
	bl func_0805BA1C
	b .L0805FC88
.L0805FC72:
	adds r0, r4, #0
	adds r0, #0x71
	cmp r1, r0
	bne .L0805FC88
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r6, #0
	bl Proc_Break
.L0805FC88:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805FB60

	THUMB_FUNC_START func_0805FC90
func_0805FC90: @ 0x0805FC90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805FCC8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805FCCC  @ gUnknown_085D5EC4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0805FCD0  @ gUnknown_080DD328
	str r1, [r0, #0x48]
	ldr r1, .L0805FCD4  @ gUnknown_085D614C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L0805FCD8  @ gUnknown_085D5EDC
	str r1, [r0, #0x54]
	ldr r1, .L0805FCDC  @ gUnknown_085D6014
	str r1, [r0, #0x58]
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805FCC8: .4byte gUnknown_0201774C
.L0805FCCC: .4byte gUnknown_085D5EC4
.L0805FCD0: .4byte gUnknown_080DD328
.L0805FCD4: .4byte gUnknown_085D614C
.L0805FCD8: .4byte gUnknown_085D5EDC
.L0805FCDC: .4byte gUnknown_085D6014

	THUMB_FUNC_END func_0805FC90

	THUMB_FUNC_START func_0805FCE0
func_0805FCE0: @ 0x0805FCE0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L0805FD2E
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	b .L0805FD4C
.L0805FD2E:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne .L0805FD4C
	bl SpellFx_ClearBg1
	ldr r1, .L0805FD58  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_End
.L0805FD4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0805FD58: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805FCE0

	THUMB_FUNC_START func_0805FD5C
func_0805FD5C: @ 0x0805FD5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0805FD88  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805FD8C  @ gUnknown_085D6284
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #6
	str r1, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0805FD88: .4byte gUnknown_0201774C
.L0805FD8C: .4byte gUnknown_085D6284

	THUMB_FUNC_END func_0805FD5C

	THUMB_FUNC_START func_0805FD90
func_0805FD90: @ 0x0805FD90
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble .L0805FDEC
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, .L0805FDF4  @ gUnknown_085D62A4
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl func_0805FDFC
	adds r0, r4, #0
	movs r1, #1
	bl func_0805FB24
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x48]
	cmp r0, r1
	ble .L0805FDEC
	ldr r1, .L0805FDF8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L0805FDEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805FDF4: .4byte gUnknown_085D62A4
.L0805FDF8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805FD90

	THUMB_FUNC_START func_0805FDFC
func_0805FDFC: @ 0x0805FDFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L0805FE54  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0805FE58  @ gUnknown_085D62DC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L0805FE5C  @ gUnknown_0866F58C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, .L0805FE60  @ gUnknown_0866F2B4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0805FE64  @ gUnknown_0866EFF0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0805FE54: .4byte gUnknown_0201774C
.L0805FE58: .4byte gUnknown_085D62DC
.L0805FE5C: .4byte gUnknown_0866F58C
.L0805FE60: .4byte gUnknown_0866F2B4
.L0805FE64: .4byte gUnknown_0866EFF0

	THUMB_FUNC_END func_0805FDFC

	THUMB_FUNC_START func_0805FE68
func_0805FE68: @ 0x0805FE68
	push {lr}
	ldr r0, [r0, #0x60]
	bl BsoRemove
	ldr r1, .L0805FE7C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0805FE7C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0805FE68

	THUMB_FUNC_START nullsub_41
nullsub_41: @ 0x0805FE80
	bx lr

	THUMB_FUNC_END nullsub_41

	THUMB_FUNC_START StartSpellAnimDivine
StartSpellAnimDivine: @ 0x0805FE84
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0805FEBC  @ gUnknown_085D62FC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0805FEBC: .4byte gUnknown_085D62FC

	THUMB_FUNC_END StartSpellAnimDivine

	THUMB_FUNC_START DivineSfxLoop
DivineSfxLoop: @ 0x0805FEC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r3, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #1
	bne .L0805FF04
	ldr r0, .L0805FF00  @ 0x00000127
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	bl func_0805FFB0
	ldr r0, [r4, #0x5c]
	bl func_080601E0
	b .L0805FFAA
	.align 2, 0
.L0805FF00: .4byte 0x00000127
.L0805FF04:
	cmp r2, #0x14
	bne .L0805FF18
	movs r0, #0x94
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L0805FF44
.L0805FF18:
	cmp r2, #0x32
	bne .L0805FF28
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L0805FFAA
.L0805FF28:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x46
	cmp r1, r0
	bne .L0805FF50
	adds r0, r5, #0
	bl func_08060034
	ldr r0, .L0805FF4C  @ 0x00000129
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L0805FF44:
	movs r3, #1
	bl func_080729A4
	b .L0805FFAA
	.align 2, 0
.L0805FF4C: .4byte 0x00000129
.L0805FF50:
	adds r0, r3, #0
	adds r0, #0x49
	cmp r1, r0
	bne .L0805FF62
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl StartEfxFlashBG
	b .L0805FFAA
.L0805FF62:
	adds r0, r3, #0
	adds r0, #0x4b
	cmp r1, r0
	bne .L0805FF90
	adds r0, r5, #0
	bl func_080600B8
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L0805FFAA
	adds r0, r5, #0
	bl func_08072450
	b .L0805FFAA
.L0805FF90:
	adds r0, r3, #0
	adds r0, #0x5a
	cmp r1, r0
	beq .L0805FFAA
	cmp r2, #0x64
	bne .L0805FFAA
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L0805FFAA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END DivineSfxLoop

	THUMB_FUNC_START func_0805FFB0
func_0805FFB0: @ 0x0805FFB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08060004  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060008  @ gUnknown_085D6314
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0806000C  @ gUnknown_080DD4D4
	str r0, [r5, #0x48]
	ldr r0, .L08060010  @ gUnknown_085D637C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08060014  @ gUnknown_085D632C
	str r0, [r5, #0x54]
	ldr r0, .L08060018  @ gUnknown_08641D84
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L0806001C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0806002A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08060020
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0806002A
	.align 2, 0
.L08060004: .4byte gUnknown_0201774C
.L08060008: .4byte gUnknown_085D6314
.L0806000C: .4byte gUnknown_080DD4D4
.L08060010: .4byte gUnknown_085D637C
.L08060014: .4byte gUnknown_085D632C
.L08060018: .4byte gUnknown_08641D84
.L0806001C: .4byte gBattleAnimSceneLayoutEnum
.L08060020:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0806002A:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0805FFB0

	THUMB_FUNC_START func_08060034
func_08060034: @ 0x08060034
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08060088  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0806008C  @ gUnknown_085D6314
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08060090  @ gUnknown_080DD542
	str r0, [r5, #0x48]
	ldr r0, .L08060094  @ gUnknown_085D63D8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08060098  @ gUnknown_085D63CC
	str r0, [r5, #0x54]
	ldr r0, .L0806009C  @ gUnknown_08641D84
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L080600A0  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080600AE
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080600A4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L080600AE
	.align 2, 0
.L08060088: .4byte gUnknown_0201774C
.L0806008C: .4byte gUnknown_085D6314
.L08060090: .4byte gUnknown_080DD542
.L08060094: .4byte gUnknown_085D63D8
.L08060098: .4byte gUnknown_085D63CC
.L0806009C: .4byte gUnknown_08641D84
.L080600A0: .4byte gBattleAnimSceneLayoutEnum
.L080600A4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L080600AE:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08060034

	THUMB_FUNC_START func_080600B8
func_080600B8: @ 0x080600B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0806010C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060110  @ gUnknown_085D6314
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08060114  @ gUnknown_080DD550
	str r0, [r5, #0x48]
	ldr r0, .L08060118  @ gUnknown_085D6438
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0806011C  @ gUnknown_085D63E4
	str r0, [r5, #0x54]
	ldr r0, .L08060120  @ gUnknown_08641D64
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08060124  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08060132
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08060128
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08060132
	.align 2, 0
.L0806010C: .4byte gUnknown_0201774C
.L08060110: .4byte gUnknown_085D6314
.L08060114: .4byte gUnknown_080DD550
.L08060118: .4byte gUnknown_085D6438
.L0806011C: .4byte gUnknown_085D63E4
.L08060120: .4byte gUnknown_08641D64
.L08060124: .4byte gBattleAnimSceneLayoutEnum
.L08060128:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08060132:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080600B8

	THUMB_FUNC_START func_0806013C
func_0806013C: @ 0x0806013C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L080601B4
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	ldr r0, .L08060194  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080601D2
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne .L0806019C
	ldr r0, .L08060198  @ gBg1Tm
	b .L080601A0
	.align 2, 0
.L08060194: .4byte gBattleAnimSceneLayoutEnum
.L08060198: .4byte gBg1Tm
.L0806019C:
	ldr r0, .L080601B0  @ gBg1Tm+0x3A
	movs r1, #0
.L080601A0:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L080601D2
	.align 2, 0
.L080601B0: .4byte gBg1Tm+0x3A
.L080601B4:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L080601D2
	bl SpellFx_ClearBg1
	ldr r1, .L080601DC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_Break
.L080601D2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080601DC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806013C

	THUMB_FUNC_START func_080601E0
func_080601E0: @ 0x080601E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08060220  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060224  @ gUnknown_085D648C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08060228  @ gUnknown_08646510
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0806022C
	ldrh r0, [r6, #2]
	subs r0, #6
	b .L08060230
	.align 2, 0
.L08060220: .4byte gUnknown_0201774C
.L08060224: .4byte gUnknown_085D648C
.L08060228: .4byte gUnknown_08646510
.L0806022C:
	ldrh r0, [r6, #2]
	adds r0, #6
.L08060230:
	strh r0, [r6, #2]
	ldr r0, .L0806024C  @ gUnknown_08645F44
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08060250  @ gUnknown_08645DD8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0806024C: .4byte gUnknown_08645F44
.L08060250: .4byte gUnknown_08645DD8

	THUMB_FUNC_END func_080601E0

	THUMB_FUNC_START func_08060254
func_08060254: @ 0x08060254
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bne .L0806027A
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L08060280  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0806027A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08060280: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08060254

	THUMB_FUNC_START nullsub_39
nullsub_39: @ 0x08060284
	bx lr

	THUMB_FUNC_END nullsub_39

	THUMB_FUNC_START nullsub_40
nullsub_40: @ 0x08060288
	bx lr

	THUMB_FUNC_END nullsub_40

	THUMB_FUNC_START func_0806028C
func_0806028C: @ 0x0806028C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080602C4  @ gUnknown_085D64A4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080602C4: .4byte gUnknown_085D64A4

	THUMB_FUNC_END func_0806028C

	THUMB_FUNC_START func_080602C8
func_080602C8: @ 0x080602C8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080602F6
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L080602F6:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L0806034C
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl func_0805BA1C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0xf
	movs r3, #0x10
	bl func_0805BA1C
	ldr r0, [r6, #0x5c]
	bl func_08060440
	ldr r0, [r6, #0x5c]
	bl func_08060790
	movs r0, #0x9c
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl func_080729A4
	b .L08060438
.L0806034C:
	adds r0, r4, #0
	adds r0, #0x46
	cmp r1, r0
	bne .L0806037A
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl func_0805B400
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x1e
	bl func_0805F838
	adds r0, r5, #0
	movs r1, #0x2b
	movs r2, #0
	bl func_0805B93C
	b .L08060438
.L0806037A:
	adds r0, r4, #0
	adds r0, #0x78
	cmp r1, r0
	bne .L0806038A
	adds r0, r5, #0
	bl func_080604B0
	b .L08060438
.L0806038A:
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	bne .L080603A8
	ldr r0, .L080603A4  @ 0x00000139
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	b .L08060438
	.align 2, 0
.L080603A4: .4byte 0x00000139
.L080603A8:
	adds r0, r4, #0
	adds r0, #0x97
	cmp r1, r0
	bne .L080603B8
	ldr r0, [r6, #0x5c]
	bl func_080605E8
	b .L08060438
.L080603B8:
	adds r0, r4, #0
	adds r0, #0xe2
	cmp r1, r0
	bne .L08060400
	ldr r0, .L080603FC  @ 0x000002E2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	movs r1, #0xa
	bl StartEfxFlashBG
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08060438
	adds r0, r5, #0
	bl func_08072450
	b .L08060438
	.align 2, 0
.L080603FC: .4byte 0x000002E2
.L08060400:
	adds r0, r4, #0
	adds r0, #0xec
	cmp r1, r0
	bne .L08060420
	adds r0, r5, #0
	bl func_08060514
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl func_0805BA1C
	b .L08060438
.L08060420:
	movs r2, #0x87
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne .L08060438
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r6, #0
	bl Proc_Break
.L08060438:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080602C8

	THUMB_FUNC_START func_08060440
func_08060440: @ 0x08060440
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08060494  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060498  @ gUnknown_085D64BC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L0806049C  @ gUnknown_080DD5D2
	str r1, [r0, #0x48]
	ldr r1, .L080604A0  @ gUnknown_085D64D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L080604A4  @ gUnknown_085D6540
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, .L080604A8  @ gUnknown_08636640
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r2, .L080604AC  @ gDispIo
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08060494: .4byte gUnknown_0201774C
.L08060498: .4byte gUnknown_085D64BC
.L0806049C: .4byte gUnknown_080DD5D2
.L080604A0: .4byte gUnknown_085D64D4
.L080604A4: .4byte gUnknown_085D6540
.L080604A8: .4byte gUnknown_08636640
.L080604AC: .4byte gDispIo

	THUMB_FUNC_END func_08060440

	THUMB_FUNC_START func_080604B0
func_080604B0: @ 0x080604B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080604FC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060500  @ gUnknown_085D64BC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L08060504  @ gUnknown_080DD5D8
	str r1, [r0, #0x48]
	ldr r1, .L08060508  @ gUnknown_085D64D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L0806050C  @ gUnknown_085D6540
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, .L08060510  @ gUnknown_0864E790
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl SetBlendConfig
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080604FC: .4byte gUnknown_0201774C
.L08060500: .4byte gUnknown_085D64BC
.L08060504: .4byte gUnknown_080DD5D8
.L08060508: .4byte gUnknown_085D64D4
.L0806050C: .4byte gUnknown_085D6540
.L08060510: .4byte gUnknown_0864E790

	THUMB_FUNC_END func_080604B0

	THUMB_FUNC_START func_08060514
func_08060514: @ 0x08060514
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08060554  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060558  @ gUnknown_085D64BC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L0806055C  @ gUnknown_080DD67A
	str r1, [r0, #0x48]
	ldr r1, .L08060560  @ gUnknown_085D64D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08060564  @ gUnknown_085D6540
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, .L08060568  @ gUnknown_0864E7B0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08060554: .4byte gUnknown_0201774C
.L08060558: .4byte gUnknown_085D64BC
.L0806055C: .4byte gUnknown_080DD67A
.L08060560: .4byte gUnknown_085D64D4
.L08060564: .4byte gUnknown_085D6540
.L08060568: .4byte gUnknown_0864E7B0

	THUMB_FUNC_END func_08060514

	THUMB_FUNC_START func_0806056C
func_0806056C: @ 0x0806056C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080605BC
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq .L080605A6
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
.L080605A6:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L080605DA
.L080605BC:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080605DA
	bl SpellFx_ClearBg1
	ldr r1, .L080605E4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L080605DA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080605E4: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806056C

	THUMB_FUNC_START func_080605E8
func_080605E8: @ 0x080605E8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08060640  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060644  @ gUnknown_085D65AC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08060648  @ gUnknown_085D4F90
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r1, [r6, #8]
	ldr r0, .L0806064C  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08060650
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L08060654
	.align 2, 0
.L08060640: .4byte gUnknown_0201774C
.L08060644: .4byte gUnknown_085D65AC
.L08060648: .4byte gUnknown_085D4F90
.L0806064C: .4byte 0x0000F3FF
.L08060650:
	ldrh r0, [r6, #2]
	adds r0, #8
.L08060654:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	strh r0, [r6, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080605E8

	THUMB_FUNC_START func_08060664
func_08060664: @ 0x08060664
	push {lr}
	ldr r2, .L08060678  @ gUnknown_0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BsoRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08060678: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08060664

	THUMB_FUNC_START func_0806067C
func_0806067C: @ 0x0806067C
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L080606C0
	ldr r0, .L080606B4  @ gUnknown_086517DC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L080606B8  @ gUnknown_0865163C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080606BC  @ gUnknown_086508DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L080606D0
	.align 2, 0
.L080606B4: .4byte gUnknown_086517DC
.L080606B8: .4byte gUnknown_0865163C
.L080606BC: .4byte gUnknown_086508DC
.L080606C0:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L080606D0
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L080606D0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806067C

	THUMB_FUNC_START func_080606D8
func_080606D8: @ 0x080606D8
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L0806071C
	ldr r0, .L08060710  @ gUnknown_08651AE4
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L08060714  @ gUnknown_0865163C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08060718  @ gUnknown_08650DA8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L0806072C
	.align 2, 0
.L08060710: .4byte gUnknown_08651AE4
.L08060714: .4byte gUnknown_0865163C
.L08060718: .4byte gUnknown_08650DA8
.L0806071C:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L0806072C
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L0806072C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080606D8

	THUMB_FUNC_START func_08060734
func_08060734: @ 0x08060734
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne .L08060778
	ldr r0, .L0806076C  @ gUnknown_08651DE0
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, .L08060770  @ gUnknown_0865163C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08060774  @ gUnknown_08651240
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b .L08060788
	.align 2, 0
.L0806076C: .4byte gUnknown_08651DE0
.L08060770: .4byte gUnknown_0865163C
.L08060774: .4byte gUnknown_08651240
.L08060778:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne .L08060788
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
.L08060788:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08060734

	THUMB_FUNC_START func_08060790
func_08060790: @ 0x08060790
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080607C8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080607CC  @ gUnknown_085D65F4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r1, #0x2c
	strh r1, [r0, #0x30]
	ldr r0, .L080607D0  @ gUnknown_0862D424
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080607D4  @ gUnknown_0862C82C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080607C8: .4byte gUnknown_0201774C
.L080607CC: .4byte gUnknown_085D65F4
.L080607D0: .4byte gUnknown_0862D424
.L080607D4: .4byte gUnknown_0862C82C

	THUMB_FUNC_END func_08060790

	THUMB_FUNC_START func_080607D8
func_080607D8: @ 0x080607D8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L0806082A
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, .L08060830  @ gUnknown_085D660C
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	lsls r1, r2, #2
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r0, [r4, #0x5c]
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl func_08060838
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne .L0806082A
	ldr r1, .L08060834  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L0806082A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08060830: .4byte gUnknown_085D660C
.L08060834: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080607D8

	THUMB_FUNC_START func_08060838
func_08060838: @ 0x08060838
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L08060880  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060884  @ gUnknown_085D6624
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, .L08060888  @ gUnknown_0862D6E0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08060880: .4byte gUnknown_0201774C
.L08060884: .4byte gUnknown_085D6624
.L08060888: .4byte gUnknown_0862D6E0

	THUMB_FUNC_END func_08060838

	THUMB_FUNC_START func_0806088C
func_0806088C: @ 0x0806088C
	push {lr}
	ldr r2, .L080608A0  @ gUnknown_0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BsoRemove
	pop {r0}
	bx r0
	.align 2, 0
.L080608A0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806088C

	THUMB_FUNC_START StartSpellAnimFenrir
StartSpellAnimFenrir: @ 0x080608A4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080608DC  @ gUnknown_085D6644
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080608DC: .4byte gUnknown_085D6644

	THUMB_FUNC_END StartSpellAnimFenrir

	THUMB_FUNC_START func_080608E0
func_080608E0: @ 0x080608E0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0806090E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0806090E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L08060984
	adds r0, r5, #0
	movs r1, #0x64
	bl func_08060A9C
	adds r0, r5, #0
	movs r1, #0x64
	bl func_08060B7C
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #2
	adds r3, r4, #0
	bl func_0805B400
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0
	bl func_0805B93C
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl func_0805BA1C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0xf
	movs r3, #0x10
	bl func_0805BA1C
	movs r0, #0x98
	lsls r0, r0, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0
	bl func_080729A4
	b .L08060A94
.L08060984:
	adds r0, r4, #0
	adds r0, #0x28
	cmp r1, r0
	bne .L0806099C
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_08060C18
	ldr r0, .L08060998  @ 0x00000131
	b .L080609F4
	.align 2, 0
.L08060998: .4byte 0x00000131
.L0806099C:
	adds r0, r4, #0
	adds r0, #0x6e
	cmp r1, r0
	bne .L080609AC
	adds r0, r5, #0
	bl func_08060CAC
	b .L08060A94
.L080609AC:
	adds r0, r4, #0
	adds r0, #0x6f
	cmp r1, r0
	beq .L080609F0
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	beq .L080609F0
	adds r0, r4, #0
	adds r0, #0x8b
	cmp r1, r0
	beq .L080609F0
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	beq .L080609F0
	adds r0, r4, #0
	adds r0, #0xa7
	cmp r1, r0
	beq .L080609F0
	adds r0, r4, #0
	adds r0, #0xb5
	cmp r1, r0
	beq .L080609F0
	adds r0, r4, #0
	adds r0, #0xc3
	cmp r1, r0
	beq .L080609F0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	adds r0, #0xd1
	cmp r1, r0
	bne .L08060A04
.L080609F0:
	movs r0, #0x99
	lsls r0, r0, #1
.L080609F4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	b .L08060A94
.L08060A04:
	adds r0, r4, #0
	adds r0, #0xee
	cmp r1, r0
	bne .L08060A50
	adds r0, r5, #0
	movs r1, #0xa
	bl StartEfxFlashBG
	adds r0, r5, #0
	bl func_08060E90
	ldrh r1, [r5, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, .L08060A4C  @ 0x00000133
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08060A94
	adds r0, r5, #0
	bl func_08072450
	b .L08060A94
	.align 2, 0
.L08060A4C: .4byte 0x00000133
.L08060A50:
	adds r0, r4, #0
	adds r0, #0xf8
	cmp r1, r0
	bne .L08060A72
	adds r0, r5, #0
	bl func_08060D3C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #8
	movs r3, #0x10
	bl func_0805BA1C
	b .L08060A94
.L08060A72:
	movs r2, #0x91
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	beq .L08060A94
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	bne .L08060A94
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r6, #0
	bl Proc_Break
.L08060A94:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080608E0

	THUMB_FUNC_START func_08060A9C
func_08060A9C: @ 0x08060A9C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08060B10  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060B14  @ gUnknown_085D665C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, .L08060B18  @ gUnknown_08651DF4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBg1
	ldr r0, .L08060B1C  @ gUnknown_08652734
	ldr r4, .L08060B20  @ gUnknown_02019790
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L08060B24  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl func_08070E94
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_InitBg1Blend
	ldr r2, .L08060B28  @ gDispIo
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08060B10: .4byte gUnknown_0201774C
.L08060B14: .4byte gUnknown_085D665C
.L08060B18: .4byte gUnknown_08651DF4
.L08060B1C: .4byte gUnknown_08652734
.L08060B20: .4byte gUnknown_02019790
.L08060B24: .4byte gBg1Tm
.L08060B28: .4byte gDispIo

	THUMB_FUNC_END func_08060A9C

	THUMB_FUNC_START func_08060B2C
func_08060B2C: @ 0x08060B2C
	push {lr}
	bl SpellFx_ClearBg1
	ldr r1, .L08060B44  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	pop {r0}
	bx r0
	.align 2, 0
.L08060B44: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08060B2C

	THUMB_FUNC_START func_08060B48
func_08060B48: @ 0x08060B48
	push {lr}
	adds r2, r0, #0
	ldr r1, .L08060B78  @ gDispIo
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r1, #0x20]
	subs r0, #1
	strh r0, [r1, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L08060B72
	adds r0, r2, #0
	bl Proc_Break
.L08060B72:
	pop {r0}
	bx r0
	.align 2, 0
.L08060B78: .4byte gDispIo

	THUMB_FUNC_END func_08060B48

	THUMB_FUNC_START func_08060B7C
func_08060B7C: @ 0x08060B7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08060BB4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060BB8  @ gUnknown_085D667C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08060BBC  @ gUnknown_080DD70C
	str r1, [r0, #0x48]
	ldr r1, .L08060BC0  @ gUnknown_08652554
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08060BB4: .4byte gUnknown_0201774C
.L08060BB8: .4byte gUnknown_085D667C
.L08060BBC: .4byte gUnknown_080DD70C
.L08060BC0: .4byte gUnknown_08652554

	THUMB_FUNC_END func_08060B7C

	THUMB_FUNC_START func_08060BC4
func_08060BC4: @ 0x08060BC4
	ldr r1, .L08060BD0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08060BD0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08060BC4

	THUMB_FUNC_START func_08060BD4
func_08060BD4: @ 0x08060BD4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L08060BF8
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L08060BF8:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L08060C10
	adds r0, r4, #0
	bl Proc_Break
.L08060C10:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08060BD4

	THUMB_FUNC_START func_08060C18
func_08060C18: @ 0x08060C18
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, .L08060C64  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060C68  @ gUnknown_085D66A4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, .L08060C6C  @ gUnknown_0865C7D4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L08060C70  @ gUnknown_0865BAB8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08060C74  @ gUnknown_0865AF3C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08060C64: .4byte gUnknown_0201774C
.L08060C68: .4byte gUnknown_085D66A4
.L08060C6C: .4byte gUnknown_0865C7D4
.L08060C70: .4byte gUnknown_0865BAB8
.L08060C74: .4byte gUnknown_0865AF3C

	THUMB_FUNC_END func_08060C18

	THUMB_FUNC_START func_08060C78
func_08060C78: @ 0x08060C78
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L08060CA2
	ldr r0, .L08060CA8  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08060CA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08060CA8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08060C78

	THUMB_FUNC_START func_08060CAC
func_08060CAC: @ 0x08060CAC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08060D10  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060D14  @ gUnknown_085D66BC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, .L08060D18  @ gUnknown_080DD76A
	str r0, [r5, #0x48]
	ldr r0, .L08060D1C  @ gUnknown_085D67A0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08060D20  @ gUnknown_085D66D4
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, .L08060D24  @ gUnknown_086568F4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08060D28  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08060D36
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08060D2C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08060D36
	.align 2, 0
.L08060D10: .4byte gUnknown_0201774C
.L08060D14: .4byte gUnknown_085D66BC
.L08060D18: .4byte gUnknown_080DD76A
.L08060D1C: .4byte gUnknown_085D67A0
.L08060D20: .4byte gUnknown_085D66D4
.L08060D24: .4byte gUnknown_086568F4
.L08060D28: .4byte gBattleAnimSceneLayoutEnum
.L08060D2C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08060D36:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08060CAC

	THUMB_FUNC_START func_08060D3C
func_08060D3C: @ 0x08060D3C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08060D98  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060D9C  @ gUnknown_085D66BC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, .L08060DA0  @ gUnknown_080DCD72
	str r0, [r5, #0x48]
	ldr r0, .L08060DA4  @ gUnknown_085D55B4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08060DA8  @ gUnknown_085D5560
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, .L08060DAC  @ gUnknown_08656914
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r0, .L08060DB0  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08060DBE
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08060DB4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08060DBE
	.align 2, 0
.L08060D98: .4byte gUnknown_0201774C
.L08060D9C: .4byte gUnknown_085D66BC
.L08060DA0: .4byte gUnknown_080DCD72
.L08060DA4: .4byte gUnknown_085D55B4
.L08060DA8: .4byte gUnknown_085D5560
.L08060DAC: .4byte gUnknown_08656914
.L08060DB0: .4byte gBattleAnimSceneLayoutEnum
.L08060DB4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08060DBE:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08060D3C

	THUMB_FUNC_START func_08060DC4
func_08060DC4: @ 0x08060DC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L08060E60
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq .L08060E00
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
.L08060E00:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, .L08060E3C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08060E7E
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne .L08060E44
	ldr r0, .L08060E40  @ gBg1Tm
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L08060E54
	.align 2, 0
.L08060E3C: .4byte gBattleAnimSceneLayoutEnum
.L08060E40: .4byte gBg1Tm
.L08060E44:
	ldr r0, .L08060E5C  @ gBg1Tm+0x3A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
.L08060E54:
	movs r0, #2
	bl EnableBgSync
	b .L08060E7E
	.align 2, 0
.L08060E5C: .4byte gBg1Tm+0x3A
.L08060E60:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08060E7E
	bl SpellFx_ClearBg1
	ldr r1, .L08060E8C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L08060E7E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08060E8C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08060DC4

	THUMB_FUNC_START func_08060E90
func_08060E90: @ 0x08060E90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08060EC8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060ECC  @ gUnknown_085D686C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, .L08060ED0  @ gUnknown_0865BAD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08060ED4  @ gUnknown_0865AF3C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08060EC8: .4byte gUnknown_0201774C
.L08060ECC: .4byte gUnknown_085D686C
.L08060ED0: .4byte gUnknown_0865BAD8
.L08060ED4: .4byte gUnknown_0865AF3C

	THUMB_FUNC_END func_08060E90

	THUMB_FUNC_START func_08060ED8
func_08060ED8: @ 0x08060ED8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L08060F18
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x44]
	bl func_08060F24
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne .L08060F18
	ldr r1, .L08060F20  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08060F18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08060F20: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08060ED8

	THUMB_FUNC_START func_08060F24
func_08060F24: @ 0x08060F24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, .L08060F64  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08060F68  @ gUnknown_085D6884
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r1, .L08060F6C  @ gUnknown_085D689C
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #0x44]
	movs r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq .L08060F70
	cmp r0, #1
	beq .L08060F78
	b .L08060F84
	.align 2, 0
.L08060F64: .4byte gUnknown_0201774C
.L08060F68: .4byte gUnknown_085D6884
.L08060F6C: .4byte gUnknown_085D689C
.L08060F70:
	ldr r0, .L08060F74  @ gUnknown_0865C77C
	b .L08060F7A
	.align 2, 0
.L08060F74: .4byte gUnknown_0865C77C
.L08060F78:
	ldr r0, .L08060FA0  @ gUnknown_0865C7A8
.L08060F7A:
	movs r1, #0x78
	bl BsoCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
.L08060F84:
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08060FA0: .4byte gUnknown_0865C7A8

	THUMB_FUNC_END func_08060F24

	THUMB_FUNC_START func_08060FA4
func_08060FA4: @ 0x08060FA4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r2, #0x96
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r4, .L0806101C  @ gSinLut
	ldr r2, [r6, #0x44]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r3, r0, #0
	muls r3, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	muls r0, r1, r0
	asrs r3, r3, #0xc
	ldrh r1, [r6, #0x32]
	adds r3, r3, r1
	strh r3, [r5, #2]
	asrs r0, r0, #0xc
	ldrh r2, [r6, #0x3a]
	adds r0, r0, r2
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r6, r3]
	cmp r0, r1
	ble .L08061014
	ldr r0, .L08061020  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl BsoRemove
	adds r0, r6, #0
	bl Proc_Break
.L08061014:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0806101C: .4byte gSinLut
.L08061020: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08060FA4

	THUMB_FUNC_START StartSpellAnimHeal
StartSpellAnimHeal: @ 0x08061024
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08061048  @ gUnknown_085D68BC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061048: .4byte gUnknown_085D68BC

	THUMB_FUNC_END StartSpellAnimHeal

	THUMB_FUNC_START func_0806104C
func_0806104C: @ 0x0806104C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0806107E
	ldr r0, [r4, #0x5c]
	bl func_0806196C
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L0806110A
.L0806107E:
	cmp r0, #0x34
	bne .L080610C6
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_08061594
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_08061774
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_0806189C
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L0806110A
.L080610C6:
	cmp r0, #0x37
	bne .L080610D4
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L08061150
.L080610D4:
	cmp r0, #0x71
	bne .L08061118
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_08061650
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_080617E4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl func_0806189C
	ldr r0, .L08061114  @ 0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L0806110A:
	movs r3, #1
	bl func_080729A4
	b .L08061150
	.align 2, 0
.L08061114: .4byte 0x0000010F
.L08061118:
	cmp r0, #0xa6
	bne .L08061124
	adds r0, r5, #0
	bl StartEfxHpBarLive
	b .L08061150
.L08061124:
	cmp r0, #0xb5
	bne .L08061150
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r5, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L0806114A
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
.L0806114A:
	adds r0, r4, #0
	bl Proc_Break
.L08061150:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806104C

	THUMB_FUNC_START StartSpellAnimMend
StartSpellAnimMend: @ 0x08061158
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0806117C  @ gUnknown_085D68D4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0806117C: .4byte gUnknown_085D68D4

	THUMB_FUNC_END StartSpellAnimMend

	THUMB_FUNC_START func_08061180
func_08061180: @ 0x08061180
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080611B8
	ldr r0, [r4, #0x5c]
	bl func_0806196C
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08061268
.L080611B8:
	cmp r0, #0x34
	bne .L08061200
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_08061594
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_08061774
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_0806189C
	movs r0, #0x88
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08061268
.L08061200:
	cmp r0, #0x37
	bne .L0806120E
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L080612B4
.L0806120E:
	cmp r0, #0x71
	bne .L0806121E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L080612B4
.L0806121E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne .L08061274
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_08061650
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_080617E4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl func_0806189C
	ldr r0, .L08061270  @ 0x00000111
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L08061268:
	movs r3, #1
	bl func_080729A4
	b .L080612B4
	.align 2, 0
.L08061270: .4byte 0x00000111
.L08061274:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne .L08061284
	adds r0, r5, #0
	bl StartEfxHpBarLive
	b .L080612B4
.L08061284:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne .L080612B4
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r5, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L080612AE
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
.L080612AE:
	adds r0, r4, #0
	bl Proc_Break
.L080612B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08061180

	THUMB_FUNC_START StartSpellAnimRecover
StartSpellAnimRecover: @ 0x080612BC
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080612E0  @ gUnknown_085D68EC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080612E0: .4byte gUnknown_085D68EC

	THUMB_FUNC_END StartSpellAnimRecover

	THUMB_FUNC_START func_080612E4
func_080612E4: @ 0x080612E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0806131C
	ldr r0, [r4, #0x5c]
	bl func_0806196C
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L080613CC
.L0806131C:
	cmp r0, #0x34
	bne .L08061364
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl func_08061594
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl func_08061774
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_0806189C
	movs r0, #0x89
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L080613CC
.L08061364:
	cmp r0, #0x37
	bne .L08061372
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L08061418
.L08061372:
	cmp r0, #0x71
	bne .L08061382
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L08061418
.L08061382:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne .L080613D8
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl func_08061650
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl func_080617E4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl func_0806189C
	ldr r0, .L080613D4  @ 0x00000113
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L080613CC:
	movs r3, #1
	bl func_080729A4
	b .L08061418
	.align 2, 0
.L080613D4: .4byte 0x00000113
.L080613D8:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne .L080613E8
	adds r0, r5, #0
	bl StartEfxHpBarLive
	b .L08061418
.L080613E8:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne .L08061418
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r5, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L08061412
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
.L08061412:
	adds r0, r4, #0
	bl Proc_Break
.L08061418:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080612E4

	THUMB_FUNC_START func_08061420
func_08061420: @ 0x08061420
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08061444  @ gUnknown_085D6904
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061444: .4byte gUnknown_085D6904

	THUMB_FUNC_END func_08061420

	THUMB_FUNC_START func_08061448
func_08061448: @ 0x08061448
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08061488
	ldr r0, [r4, #0x5c]
	bl func_0806196C
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_08061ACC
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08061540
.L08061488:
	cmp r0, #0x34
	bne .L080614D0
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_08061594
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_08061774
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl func_0806189C
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08061540
.L080614D0:
	cmp r0, #0x37
	bne .L080614DE
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b .L0806158C
.L080614DE:
	cmp r0, #0x97
	bne .L080614F6
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl func_08061ACC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L0806158C
.L080614F6:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xa1
	cmp r1, r0
	bne .L0806154C
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_08061650
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl func_080617E4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl func_0806189C
	ldr r0, .L08061548  @ 0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L08061540:
	movs r3, #1
	bl func_080729A4
	b .L0806158C
	.align 2, 0
.L08061548: .4byte 0x0000010F
.L0806154C:
	adds r0, r2, #0
	adds r0, #0xd3
	cmp r1, r0
	bne .L0806155C
	adds r0, r5, #0
	bl StartEfxHpBarLive
	b .L0806158C
.L0806155C:
	adds r0, r2, #0
	adds r0, #0xdd
	cmp r1, r0
	bne .L0806158C
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r5, #0
	bl GetAISNextBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L08061586
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
.L08061586:
	adds r0, r4, #0
	bl Proc_Break
.L0806158C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08061448

	THUMB_FUNC_START func_08061594
func_08061594: @ 0x08061594
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, .L080615DC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080615E0  @ gUnknown_085D691C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #0
	beq .L080615F4
	cmp r6, #2
	bhi .L08061646
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L080615E4  @ gUnknown_080DD8D2
	str r0, [r5, #0x48]
	ldr r0, .L080615E8  @ gUnknown_08670D40
	str r0, [r5, #0x4c]
	ldr r0, .L080615EC  @ gUnknown_086716A0
	str r0, [r5, #0x50]
	ldr r0, .L080615F0  @ gUnknown_08670548
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b .L08061646
	.align 2, 0
.L080615DC: .4byte gUnknown_0201774C
.L080615E0: .4byte gUnknown_085D691C
.L080615E4: .4byte gUnknown_080DD8D2
.L080615E8: .4byte gUnknown_08670D40
.L080615EC: .4byte gUnknown_086716A0
.L080615F0: .4byte gUnknown_08670548
.L080615F4:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, .L0806162C  @ gUnknown_080DD8C6
	str r0, [r5, #0x48]
	ldr r0, .L08061630  @ gUnknown_0866F774
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08061634  @ gUnknown_0866F5E4
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08061638  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08061646
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0806163C
	movs r0, #1
	movs r1, #0x18
	b .L08061640
	.align 2, 0
.L0806162C: .4byte gUnknown_080DD8C6
.L08061630: .4byte gUnknown_0866F774
.L08061634: .4byte gUnknown_0866F5E4
.L08061638: .4byte gBattleAnimSceneLayoutEnum
.L0806163C:
	movs r0, #1
	movs r1, #0xe8
.L08061640:
	movs r2, #0
	bl SetBgOffset
.L08061646:
	bl SpellFx_InitBg1Blend
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08061594

	THUMB_FUNC_START func_08061650
func_08061650: @ 0x08061650
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, .L08061698  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0806169C  @ gUnknown_085D691C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	cmp r6, #0
	beq .L080616B0
	cmp r6, #2
	bhi .L080616FA
	ldr r0, .L080616A0  @ gUnknown_080DD8D8
	str r0, [r5, #0x48]
	ldr r0, .L080616A4  @ gUnknown_08670D40
	str r0, [r5, #0x4c]
	ldr r0, .L080616A8  @ gUnknown_086716A0
	str r0, [r5, #0x50]
	ldr r0, .L080616AC  @ gUnknown_08670548
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b .L080616FA
	.align 2, 0
.L08061698: .4byte gUnknown_0201774C
.L0806169C: .4byte gUnknown_085D691C
.L080616A0: .4byte gUnknown_080DD8D8
.L080616A4: .4byte gUnknown_08670D40
.L080616A8: .4byte gUnknown_086716A0
.L080616AC: .4byte gUnknown_08670548
.L080616B0:
	ldr r0, .L080616E0  @ gUnknown_080DD8CC
	str r0, [r5, #0x48]
	ldr r0, .L080616E4  @ gUnknown_0866F774
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L080616E8  @ gUnknown_0866F5E4
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, .L080616EC  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080616FA
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080616F0
	movs r0, #1
	movs r1, #0xe8
	b .L080616F4
	.align 2, 0
.L080616E0: .4byte gUnknown_080DD8CC
.L080616E4: .4byte gUnknown_0866F774
.L080616E8: .4byte gUnknown_0866F5E4
.L080616EC: .4byte gBattleAnimSceneLayoutEnum
.L080616F0:
	movs r0, #1
	movs r1, #0x18
.L080616F4:
	movs r2, #0
	bl SetBgOffset
.L080616FA:
	bl SpellFx_InitBg1Blend
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08061650

	THUMB_FUNC_START func_08061704
func_08061704: @ 0x08061704
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08061736
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r2, r2, r3
	bl func_0805560C
	b .L08061768
.L08061736:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L08061768
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08061750
	bl SpellFx_ClearBg1
	bl SpellFx_EndBlend
.L08061750:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, .L08061770  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08061768:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061770: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08061704

	THUMB_FUNC_START func_08061774
func_08061774: @ 0x08061774
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0806179C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080617A0  @ gUnknown_085D6934
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne .L080617A8
	ldr r0, .L080617A4  @ gUnknown_080DD8EE
	b .L080617B6
	.align 2, 0
.L0806179C: .4byte gUnknown_0201774C
.L080617A0: .4byte gUnknown_085D6934
.L080617A4: .4byte gUnknown_080DD8EE
.L080617A8:
	cmp r5, #1
	bne .L080617B4
	ldr r0, .L080617B0  @ gUnknown_080DD972
	b .L080617B6
	.align 2, 0
.L080617B0: .4byte gUnknown_080DD972
.L080617B4:
	ldr r0, .L080617C0  @ gUnknown_080DD9A4
.L080617B6:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L080617C8
	ldr r0, .L080617C4  @ gUnknown_086700D4
	b .L080617D6
	.align 2, 0
.L080617C0: .4byte gUnknown_080DD9A4
.L080617C4: .4byte gUnknown_086700D4
.L080617C8:
	cmp r5, #1
	bne .L080617D4
	ldr r0, .L080617D0  @ gUnknown_08672220
	b .L080617D6
	.align 2, 0
.L080617D0: .4byte gUnknown_08672220
.L080617D4:
	ldr r0, .L080617E0  @ gUnknown_08672000
.L080617D6:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080617E0: .4byte gUnknown_08672000

	THUMB_FUNC_END func_08061774

	THUMB_FUNC_START func_080617E4
func_080617E4: @ 0x080617E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L0806180C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08061810  @ gUnknown_085D6934
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne .L08061818
	ldr r0, .L08061814  @ gUnknown_080DD930
	b .L08061826
	.align 2, 0
.L0806180C: .4byte gUnknown_0201774C
.L08061810: .4byte gUnknown_085D6934
.L08061814: .4byte gUnknown_080DD930
.L08061818:
	cmp r5, #1
	bne .L08061824
	ldr r0, .L08061820  @ gUnknown_080DD972
	b .L08061826
	.align 2, 0
.L08061820: .4byte gUnknown_080DD972
.L08061824:
	ldr r0, .L08061830  @ gUnknown_080DD9A4
.L08061826:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08061838
	ldr r0, .L08061834  @ gUnknown_086700D4
	b .L08061846
	.align 2, 0
.L08061830: .4byte gUnknown_080DD9A4
.L08061834: .4byte gUnknown_086700D4
.L08061838:
	cmp r5, #1
	bne .L08061844
	ldr r0, .L08061840  @ gUnknown_08672220
	b .L08061846
	.align 2, 0
.L08061840: .4byte gUnknown_08672220
.L08061844:
	ldr r0, .L08061850  @ gUnknown_08672000
.L08061846:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08061850: .4byte gUnknown_08672000

	THUMB_FUNC_END func_080617E4

	THUMB_FUNC_START func_08061854
func_08061854: @ 0x08061854
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L0806187A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08061890
.L0806187A:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08061890
	ldr r1, .L08061898  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08061890:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061898: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08061854

	THUMB_FUNC_START func_0806189C
func_0806189C: @ 0x0806189C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, .L080618D0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080618D4  @ gUnknown_085D6954
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080618D0: .4byte gUnknown_0201774C
.L080618D4: .4byte gUnknown_085D6954

	THUMB_FUNC_END func_0806189C

	THUMB_FUNC_START func_080618D8
func_080618D8: @ 0x080618D8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L080618EE
	adds r0, r1, #0
	bl Proc_Break
.L080618EE:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080618D8

	THUMB_FUNC_START func_080618F4
func_080618F4: @ 0x080618F4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble .L0806191C
	ldr r1, .L08061918  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b .L08061964
	.align 2, 0
.L08061918: .4byte gUnknown_0201774C
.L0806191C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0806193C
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	b .L08061950
.L0806193C:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
.L08061950:
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
.L08061964:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080618F4

	THUMB_FUNC_START func_0806196C
func_0806196C: @ 0x0806196C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080619B8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080619BC  @ gUnknown_085D6974
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, .L080619C0  @ gUnknown_08675114
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L080619C4  @ gUnknown_08670528
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080619C8  @ gUnknown_086702D4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080619B8: .4byte gUnknown_0201774C
.L080619BC: .4byte gUnknown_085D6974
.L080619C0: .4byte gUnknown_08675114
.L080619C4: .4byte gUnknown_08670528
.L080619C8: .4byte gUnknown_086702D4

	THUMB_FUNC_END func_0806196C

	THUMB_FUNC_START func_080619CC
func_080619CC: @ 0x080619CC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08061A1C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08061A20  @ gUnknown_085D698C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	movs r0, #0x34
	strh r0, [r4, #0x30]
	ldr r3, .L08061A24  @ gUnknown_08675114
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L08061A28  @ gUnknown_08670528
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08061A2C  @ gUnknown_086702D4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08061A1C: .4byte gUnknown_0201774C
.L08061A20: .4byte gUnknown_085D698C
.L08061A24: .4byte gUnknown_08675114
.L08061A28: .4byte gUnknown_08670528
.L08061A2C: .4byte gUnknown_086702D4

	THUMB_FUNC_END func_080619CC

	THUMB_FUNC_START func_08061A30
func_08061A30: @ 0x08061A30
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08061A5A
	ldr r0, .L08061A60  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08061A5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061A60: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08061A30

	THUMB_FUNC_START func_08061A64
func_08061A64: @ 0x08061A64
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x2e
	ldrsh r1, [r2, r5]
	cmp r0, r1
	bne .L08061A8E
	ldr r0, .L08061A94  @ gUnknown_086751A4
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	strh r4, [r3, #6]
	strh r4, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
.L08061A8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08061A94: .4byte gUnknown_086751A4

	THUMB_FUNC_END func_08061A64

	THUMB_FUNC_START func_08061A98
func_08061A98: @ 0x08061A98
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08061AC2
	ldr r0, .L08061AC8  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08061AC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061AC8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08061A98

	THUMB_FUNC_START func_08061ACC
func_08061ACC: @ 0x08061ACC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L08061AFC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08061B00  @ gUnknown_085D69AC
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r5, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne .L08061B04
	movs r0, #0x2b
	strh r0, [r1, #0x2e]
	movs r0, #0x44
	b .L08061B0A
	.align 2, 0
.L08061AFC: .4byte gUnknown_0201774C
.L08061B00: .4byte gUnknown_085D69AC
.L08061B04:
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	movs r0, #0x3d
.L08061B0A:
	strh r0, [r1, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08061ACC

	THUMB_FUNC_START func_08061B14
func_08061B14: @ 0x08061B14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08061BD6
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08061B7E
	ldr r0, .L08061B60  @ gUnknown_086766C0
	mov r8, r0
	ldr r7, .L08061B64  @ gUnknown_08677CC0
	ldr r0, .L08061B68  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08061B6C
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	movs r5, #0x88
	cmp r0, #0
	bne .L08061B7A
	movs r5, #0x68
	b .L08061B7A
	.align 2, 0
.L08061B60: .4byte gUnknown_086766C0
.L08061B64: .4byte gUnknown_08677CC0
.L08061B68: .4byte gBattleAnimSceneLayoutEnum
.L08061B6C:
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	movs r5, #0x70
	cmp r0, #0
	bne .L08061B7A
	movs r5, #0x80
.L08061B7A:
	movs r6, #0x4e
	b .L08061BBC
.L08061B7E:
	ldr r2, .L08061BA0  @ gUnknown_08676734
	mov r8, r2
	ldr r7, .L08061BA4  @ gUnknown_08677D34
	ldr r0, .L08061BA8  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08061BAC
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	movs r5, #0x4c
	cmp r0, #0
	bne .L08061BBA
	movs r5, #0xa4
	b .L08061BBA
	.align 2, 0
.L08061BA0: .4byte gUnknown_08676734
.L08061BA4: .4byte gUnknown_08677D34
.L08061BA8: .4byte gBattleAnimSceneLayoutEnum
.L08061BAC:
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	movs r5, #0x64
	cmp r0, #0
	bne .L08061BBA
	movs r5, #0x8c
.L08061BBA:
	movs r6, #0x40
.L08061BBC:
	ldr r0, [r4, #0x5c]
	mov r2, r8
	str r2, [sp]
	adds r1, r7, #0
	adds r3, r7, #0
	bl func_08055554
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	adds r0, r4, #0
	bl Proc_Break
.L08061BD6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08061B14

	THUMB_FUNC_START func_08061BE4
func_08061BE4: @ 0x08061BE4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08061C0E
	ldr r0, .L08061C14  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08061C0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061C14: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08061BE4

	THUMB_FUNC_START func_08061C18
func_08061C18: @ 0x08061C18
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08061C44  @ gUnknown_085D69CC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061C44: .4byte gUnknown_085D69CC

	THUMB_FUNC_END func_08061C18

	THUMB_FUNC_START func_08061C48
func_08061C48: @ 0x08061C48
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08061C74  @ gUnknown_085D69CC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061C74: .4byte gUnknown_085D69CC

	THUMB_FUNC_END func_08061C48

	THUMB_FUNC_START func_08061C78
func_08061C78: @ 0x08061C78
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne .L08061CA6
	ldr r0, [r4, #0x5c]
	bl func_080619CC
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	b .L08061D1E
.L08061CA6:
	cmp r1, #0x34
	bne .L08061CBE
	ldr r0, [r4, #0x5c]
	bl func_08061D28
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl func_08061DF8
	b .L08061D1E
.L08061CBE:
	cmp r1, #0xb7
	bne .L08061D0A
	movs r0, #0x8a
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl func_080729A4
	ldr r0, [r4, #0x5c]
	bl func_08061E8C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl func_08062058
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0x14
	movs r3, #0
	bl func_0806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0xb4
	movs r2, #0x28
	movs r3, #1
	bl func_0806189C
	b .L08061D1E
.L08061D0A:
	ldr r0, .L08061D24  @ 0x000001C5
	cmp r1, r0
	bne .L08061D1E
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08061D1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061D24: .4byte 0x000001C5

	THUMB_FUNC_END func_08061C78

	THUMB_FUNC_START func_08061D28
func_08061D28: @ 0x08061D28
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08061D64  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08061D68  @ gUnknown_085D69E4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08061D6C  @ gUnknown_080DDA3E
	str r1, [r0, #0x48]
	ldr r1, .L08061D70  @ gUnknown_085D69FC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08061D74  @ gUnknown_0866F5E4
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061D64: .4byte gUnknown_0201774C
.L08061D68: .4byte gUnknown_085D69E4
.L08061D6C: .4byte gUnknown_080DDA3E
.L08061D70: .4byte gUnknown_085D69FC
.L08061D74: .4byte gUnknown_0866F5E4

	THUMB_FUNC_END func_08061D28

	THUMB_FUNC_START func_08061D78
func_08061D78: @ 0x08061D78
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L08061DD0
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r6, #0
	bl SpellFx_WriteBgMap
	ldr r0, .L08061DC8  @ gUnknown_080DDA50
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, .L08061DCC  @ gUnknown_080DDA58
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl func_080729A4
	b .L08061DEE
	.align 2, 0
.L08061DC8: .4byte gUnknown_080DDA50
.L08061DCC: .4byte gUnknown_080DDA58
.L08061DD0:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne .L08061DEE
	bl SpellFx_ClearBg1
	ldr r1, .L08061DF4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L08061DEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08061DF4: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08061D78

	THUMB_FUNC_START func_08061DF8
func_08061DF8: @ 0x08061DF8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08061E24  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08061E28  @ gUnknown_085D6A0C
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L08061E2C  @ gUnknown_080DDA70
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08061E34
	ldr r0, .L08061E30  @ gUnknown_08678720
	b .L08061E36
	.align 2, 0
.L08061E24: .4byte gUnknown_0201774C
.L08061E28: .4byte gUnknown_085D6A0C
.L08061E2C: .4byte gUnknown_080DDA70
.L08061E30: .4byte gUnknown_08678720
.L08061E34:
	ldr r0, .L08061E40  @ gUnknown_08678920
.L08061E36:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08061E40: .4byte gUnknown_08678920

	THUMB_FUNC_END func_08061DF8

	THUMB_FUNC_START func_08061E44
func_08061E44: @ 0x08061E44
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L08061E6A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08061E80
.L08061E6A:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08061E80
	ldr r1, .L08061E88  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08061E80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08061E88: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08061E44

	THUMB_FUNC_START func_08061E8C
func_08061E8C: @ 0x08061E8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08061F58  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08061F5C  @ gUnknown_085D6A2C
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	mov r8, r1
	mov r1, r8
	strh r1, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x44]
	ldr r1, .L08061F60  @ gUnknown_080DDB82
	str r1, [r0, #0x48]
	ldr r1, .L08061F64  @ gUnknown_085D6A44
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08061F68  @ gUnknown_08670548
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	ldr r3, .L08061F6C  @ gDispIo
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl func_08055980
	ldrh r1, [r5, #8]
	ldr r7, .L08061F70  @ 0x0000F3FF
	adds r0, r7, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r6, r1, #0
	orrs r0, r6
	strh r0, [r5, #8]
	ldr r4, .L08061F74  @ gUnknown_02000010
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq .L08061F26
	ldrh r1, [r2, #8]
	adds r0, r7, #0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2, #8]
.L08061F26:
	bl SpellFx_InitBg1Blend
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08061F58: .4byte gUnknown_0201774C
.L08061F5C: .4byte gUnknown_085D6A2C
.L08061F60: .4byte gUnknown_080DDB82
.L08061F64: .4byte gUnknown_085D6A44
.L08061F68: .4byte gUnknown_08670548
.L08061F6C: .4byte gDispIo
.L08061F70: .4byte 0x0000F3FF
.L08061F74: .4byte gUnknown_02000010

	THUMB_FUNC_END func_08061E8C

	THUMB_FUNC_START func_08061F78
func_08061F78: @ 0x08061F78
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x5c]
	adds r0, r6, #0
	bl GetOpponentFrontAIS
	adds r7, r0, #0
	ldr r4, .L08061FD4  @ gUnknown_02000010
	adds r0, r6, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq .L08061FA8
	ldrh r0, [r4, #8]
	ldr r1, .L08061FD8  @ 0x0000F3FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r4, #8]
.L08061FA8:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08061FDC
	ldr r1, [r5, #0x4c]
	ldr r2, [r5, #0x50]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r7, #0
	bl SpellFx_WriteBgMap
	b .L08062046
	.align 2, 0
.L08061FD4: .4byte gUnknown_02000010
.L08061FD8: .4byte 0x0000F3FF
.L08061FDC:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L08062046
	bl SpellFx_ClearBg1
	ldr r1, .L0806204C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r3, .L08062050  @ gDispIo
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
	ldrh r1, [r6, #8]
	ldr r3, .L08062054  @ 0x0000F3FF
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	adds r2, r1, #0
	orrs r0, r2
	strh r0, [r6, #8]
	cmp r4, #0
	beq .L0806203C
	ldrh r1, [r4, #8]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, #8]
.L0806203C:
	bl SpellFx_EndBlend
	adds r0, r5, #0
	bl Proc_Break
.L08062046:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0806204C: .4byte gUnknown_0201774C
.L08062050: .4byte gDispIo
.L08062054: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08061F78

	THUMB_FUNC_START func_08062058
func_08062058: @ 0x08062058
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08062084  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062088  @ gUnknown_085D6A48
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L0806208C  @ gUnknown_080DDB9A
	str r0, [r1, #0x48]
	cmp r5, #0
	bne .L08062094
	ldr r0, .L08062090  @ gUnknown_086700D4
	b .L08062096
	.align 2, 0
.L08062084: .4byte gUnknown_0201774C
.L08062088: .4byte gUnknown_085D6A48
.L0806208C: .4byte gUnknown_080DDB9A
.L08062090: .4byte gUnknown_086700D4
.L08062094:
	ldr r0, .L080620A0  @ gUnknown_08678B20
.L08062096:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080620A0: .4byte gUnknown_08678B20

	THUMB_FUNC_END func_08062058

	THUMB_FUNC_START func_080620A4
func_080620A4: @ 0x080620A4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080620CA
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080620E0
.L080620CA:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080620E0
	ldr r1, .L080620E8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080620E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080620E8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080620A4

	THUMB_FUNC_START func_080620EC
func_080620EC: @ 0x080620EC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08062124  @ gUnknown_085D6A68
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062124: .4byte gUnknown_085D6A68

	THUMB_FUNC_END func_080620EC

	THUMB_FUNC_START func_08062128
func_08062128: @ 0x08062128
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0806215E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0806215E:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne .L080621D4
	adds r0, r6, #0
	bl func_080622A0
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl func_0805BA1C
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl func_0805BA1C
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl func_0805BA1C
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl func_0805BA1C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl func_0805BA1C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xfd
	movs r3, #1
	bl func_080729A4
	b .L08062294
.L080621D4:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L080621E4
	adds r0, r6, #0
	bl func_08062358
	b .L08062294
.L080621E4:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne .L080621FA
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl StartEfxFlashUnit
	b .L08062294
.L080621FA:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne .L08062274
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl func_08055518
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08062228
	ldr r0, .L08062224  @ gpUnitLeft_BattleStruct
	b .L0806222A
	.align 2, 0
.L08062224: .4byte gpUnitLeft_BattleStruct
.L08062228:
	ldr r0, .L0806226C  @ gpUnitRight_BattleStruct
.L0806222A:
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xb
	bne .L08062260
	adds r0, r6, #0
	movs r1, #0
	bl func_08054BA4
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, .L08062270  @ 0xFFFFFBBD
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl MU_EndAll
.L08062260:
	adds r0, r6, #0
	movs r1, #0
	bl func_08054BA4
	b .L08062294
	.align 2, 0
.L0806226C: .4byte gpUnitRight_BattleStruct
.L08062270: .4byte 0xFFFFFBBD
.L08062274:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne .L08062294
	ldrh r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08062294:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08062128

	THUMB_FUNC_START func_080622A0
func_080622A0: @ 0x080622A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080622DC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080622E0  @ gUnknown_085D6A80
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080622E4  @ gUnknown_080DDC8A
	str r1, [r0, #0x48]
	ldr r1, .L080622E8  @ gUnknown_085D6A98
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L080622EC  @ gUnknown_085D6ACC
	str r1, [r0, #0x54]
	ldr r0, .L080622F0  @ gUnknown_0867B5A4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080622DC: .4byte gUnknown_0201774C
.L080622E0: .4byte gUnknown_085D6A80
.L080622E4: .4byte gUnknown_080DDC8A
.L080622E8: .4byte gUnknown_085D6A98
.L080622EC: .4byte gUnknown_085D6ACC
.L080622F0: .4byte gUnknown_0867B5A4

	THUMB_FUNC_END func_080622A0

	THUMB_FUNC_START func_080622F4
func_080622F4: @ 0x080622F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08062330
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0806234E
.L08062330:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L0806234E
	bl SpellFx_ClearBg1
	ldr r1, .L08062354  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0806234E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062354: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080622F4

	THUMB_FUNC_START func_08062358
func_08062358: @ 0x08062358
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L08062394  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062398  @ gUnknown_085D6B00
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, .L0806239C  @ gUnknown_0867EE04
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080623A0
	ldrh r0, [r6, #2]
	subs r0, #8
	b .L080623A4
	.align 2, 0
.L08062394: .4byte gUnknown_0201774C
.L08062398: .4byte gUnknown_085D6B00
.L0806239C: .4byte gUnknown_0867EE04
.L080623A0:
	ldrh r0, [r6, #2]
	adds r0, #8
.L080623A4:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, .L080623C8  @ gUnknown_0868716C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080623CC  @ gUnknown_08686F84
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080623C8: .4byte gUnknown_0868716C
.L080623CC: .4byte gUnknown_08686F84

	THUMB_FUNC_END func_08062358

	THUMB_FUNC_START func_080623D0
func_080623D0: @ 0x080623D0
	ldr r1, .L080623DC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L080623DC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080623D0

	THUMB_FUNC_START StartSpellAnimSilence
StartSpellAnimSilence: @ 0x080623E0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08062418  @ gUnknown_085D6B20
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062418: .4byte gUnknown_085D6B20

	THUMB_FUNC_END StartSpellAnimSilence

	THUMB_FUNC_START func_0806241C
func_0806241C: @ 0x0806241C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08062460
	ldr r0, [r4, #0x5c]
	bl func_08062608
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xfa
	movs r3, #1
	bl func_080729A4
.L08062460:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x29
	bne .L08062474
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L08062518
.L08062474:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x44
	cmp r1, r0
	bne .L080624A8
	ldr r0, [r4, #0x5c]
	bl func_08062524
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xfb
	movs r3, #1
	bl func_080729A4
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0x42
	movs r2, #0x14
	movs r3, #0x10
	bl func_0805BA1C
	b .L08062518
.L080624A8:
	adds r0, r6, #0
	adds r0, #0x86
	cmp r1, r0
	bne .L080624FA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r0, #0xfc
	movs r3, #1
	bl func_080729A4
	bl StopBattleMusic
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r5, #0
	bl func_08055518
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl StartEfxFlashBG
	ldrb r0, [r6]
	cmp r0, #0
	bne .L08062518
	adds r0, r5, #0
	bl func_08054BD4
	cmp r0, #0
	bne .L08062518
	adds r0, r5, #0
	movs r1, #3
	bl func_08054BA4
	b .L08062518
.L080624FA:
	adds r0, r6, #0
	adds r0, #0x9e
	cmp r1, r0
	bne .L08062518
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08062518:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806241C

	THUMB_FUNC_START func_08062524
func_08062524: @ 0x08062524
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08062584  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062588  @ gUnknown_085D6B38
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0806258C  @ gUnknown_080DDCE6
	str r0, [r5, #0x48]
	ldr r0, .L08062590  @ gUnknown_085D6B50
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08062594  @ gUnknown_08680DC0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08062598  @ gUnknown_0867EEB4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	ldr r0, .L0806259C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080625AA
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080625A0
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L080625AA
	.align 2, 0
.L08062584: .4byte gUnknown_0201774C
.L08062588: .4byte gUnknown_085D6B38
.L0806258C: .4byte gUnknown_080DDCE6
.L08062590: .4byte gUnknown_085D6B50
.L08062594: .4byte gUnknown_08680DC0
.L08062598: .4byte gUnknown_0867EEB4
.L0806259C: .4byte gBattleAnimSceneLayoutEnum
.L080625A0:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L080625AA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08062524

	THUMB_FUNC_START func_080625B0
func_080625B0: @ 0x080625B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L080625DE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L080625FC
.L080625DE:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L080625FC
	bl SpellFx_ClearBg1
	ldr r1, .L08062604  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L080625FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08062604: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080625B0

	THUMB_FUNC_START func_08062608
func_08062608: @ 0x08062608
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0806264C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062650  @ gUnknown_085D6B98
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08062654  @ gUnknown_08680FFC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L08062658  @ gUnknown_08680DC0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0806265C  @ gUnknown_086808A0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0806264C: .4byte gUnknown_0201774C
.L08062650: .4byte gUnknown_085D6B98
.L08062654: .4byte gUnknown_08680FFC
.L08062658: .4byte gUnknown_08680DC0
.L0806265C: .4byte gUnknown_086808A0

	THUMB_FUNC_END func_08062608

	THUMB_FUNC_START func_08062660
func_08062660: @ 0x08062660
	push {lr}
	ldr r0, [r0, #0x60]
	bl BsoRemove
	ldr r1, .L08062674  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08062674: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062660

	THUMB_FUNC_START StartSpellAnimSleep
StartSpellAnimSleep: @ 0x08062678
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080626B0  @ gUnknown_085D6BB8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080626B0: .4byte gUnknown_085D6BB8

	THUMB_FUNC_END StartSpellAnimSleep

	THUMB_FUNC_START func_080626B4
func_080626B4: @ 0x080626B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080626F8
	ldr r0, [r4, #0x5c]
	bl func_08062898
	ldr r0, .L0806274C  @ 0x0000011B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
.L080626F8:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x64
	bne .L0806270A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0806270A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #0
	adds r0, #0x82
	cmp r1, r0
	bne .L08062750
	adds r0, r5, #0
	bl func_080628F0
	adds r0, r5, #0
	bl func_08062944
	ldr r0, [r4, #0x5c]
	bl func_080627B4
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl func_0805BA1C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xe6
	movs r2, #0x14
	movs r3, #0x10
	bl func_0805BA1C
	b .L080627A6
	.align 2, 0
.L0806274C: .4byte 0x0000011B
.L08062750:
	movs r3, #0xa5
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne .L08062786
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl func_08055518
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080627A6
	adds r0, r5, #0
	bl func_08054BD4
	cmp r0, #0
	bne .L080627A6
	adds r0, r5, #0
	movs r1, #2
	bl func_08054BA4
	b .L080627A6
.L08062786:
	movs r2, #0xb9
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne .L080627A6
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L080627A6:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080626B4

	THUMB_FUNC_START func_080627B4
func_080627B4: @ 0x080627B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08062814  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062818  @ gUnknown_085D6BD0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0806281C  @ gUnknown_080DDD58
	str r0, [r5, #0x48]
	ldr r0, .L08062820  @ gUnknown_085D6BE8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08062824  @ gUnknown_086861A4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08062828  @ gUnknown_086852D8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	ldr r0, .L0806282C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0806283A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08062830
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0806283A
	.align 2, 0
.L08062814: .4byte gUnknown_0201774C
.L08062818: .4byte gUnknown_085D6BD0
.L0806281C: .4byte gUnknown_080DDD58
.L08062820: .4byte gUnknown_085D6BE8
.L08062824: .4byte gUnknown_086861A4
.L08062828: .4byte gUnknown_086852D8
.L0806282C: .4byte gBattleAnimSceneLayoutEnum
.L08062830:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0806283A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080627B4

	THUMB_FUNC_START func_08062840
func_08062840: @ 0x08062840
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L0806286E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L0806288C
.L0806286E:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L0806288C
	bl SpellFx_ClearBg1
	ldr r1, .L08062894  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0806288C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08062894: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062840

	THUMB_FUNC_START func_08062898
func_08062898: @ 0x08062898
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L080628DC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080628E0  @ gUnknown_085D6C28
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L080628E4  @ gUnknown_0868C2E8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L080628E8  @ gUnknown_0868716C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080628EC  @ gUnknown_08686F84
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080628DC: .4byte gUnknown_0201774C
.L080628E0: .4byte gUnknown_085D6C28
.L080628E4: .4byte gUnknown_0868C2E8
.L080628E8: .4byte gUnknown_0868716C
.L080628EC: .4byte gUnknown_08686F84

	THUMB_FUNC_END func_08062898

	THUMB_FUNC_START func_080628F0
func_080628F0: @ 0x080628F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08062928  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0806292C  @ gUnknown_085D6C48
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08062930  @ gUnknown_0868C168
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #8
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062928: .4byte gUnknown_0201774C
.L0806292C: .4byte gUnknown_085D6C48
.L08062930: .4byte gUnknown_0868C168

	THUMB_FUNC_END func_080628F0

	THUMB_FUNC_START func_08062934
func_08062934: @ 0x08062934
	ldr r1, .L08062940  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08062940: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062934

	THUMB_FUNC_START func_08062944
func_08062944: @ 0x08062944
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08062960  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062964  @ gUnknown_085D6C68
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08062960: .4byte gUnknown_0201774C
.L08062964: .4byte gUnknown_085D6C68

	THUMB_FUNC_END func_08062944

	THUMB_FUNC_START func_08062968
func_08062968: @ 0x08062968
	push {r4, lr}
	movs r3, #0x8e
	lsls r3, r3, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r0, #0x5c]
	movs r4, #2
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	movs r3, #1
	bl func_080729A4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08062968

	THUMB_FUNC_START func_08062988
func_08062988: @ 0x08062988
	ldr r1, .L08062994  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08062994: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062988

	THUMB_FUNC_START StartSpellAnimHammerne
StartSpellAnimHammerne: @ 0x08062998
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080629D0  @ gUnknown_085D6CB0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080629D0: .4byte gUnknown_085D6CB0

	THUMB_FUNC_END StartSpellAnimHammerne

	THUMB_FUNC_START func_080629D4
func_080629D4: @ 0x080629D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08062A0A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L08062A0A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne .L08062A84
	adds r0, r6, #0
	bl func_08062AF4
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl func_0805BA1C
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl func_0805BA1C
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl func_0805BA1C
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl func_0805BA1C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl func_0805BA1C
	ldr r0, .L08062A80  @ 0x00000103
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl func_080729A4
	b .L08062AE8
	.align 2, 0
.L08062A80: .4byte 0x00000103
.L08062A84:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L08062A94
	adds r0, r6, #0
	bl func_08062BAC
	b .L08062AE8
.L08062A94:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne .L08062AAA
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl StartEfxFlashUnit
	b .L08062AE8
.L08062AAA:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne .L08062AC8
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl func_08055518
	b .L08062AE8
.L08062AC8:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne .L08062AE8
	ldrh r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08062AE8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080629D4

	THUMB_FUNC_START func_08062AF4
func_08062AF4: @ 0x08062AF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08062B30  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062B34  @ gUnknown_085D6CC8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08062B38  @ gUnknown_080DDE9E
	str r1, [r0, #0x48]
	ldr r1, .L08062B3C  @ gUnknown_085D6CE0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08062B40  @ gUnknown_085D6D14
	str r1, [r0, #0x54]
	ldr r0, .L08062B44  @ gUnknown_086810B8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08062B30: .4byte gUnknown_0201774C
.L08062B34: .4byte gUnknown_085D6CC8
.L08062B38: .4byte gUnknown_080DDE9E
.L08062B3C: .4byte gUnknown_085D6CE0
.L08062B40: .4byte gUnknown_085D6D14
.L08062B44: .4byte gUnknown_086810B8

	THUMB_FUNC_END func_08062AF4

	THUMB_FUNC_START func_08062B48
func_08062B48: @ 0x08062B48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08062B84
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L08062BA2
.L08062B84:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L08062BA2
	bl SpellFx_ClearBg1
	ldr r1, .L08062BA8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L08062BA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062BA8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062B48

	THUMB_FUNC_START func_08062BAC
func_08062BAC: @ 0x08062BAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08062BF0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062BF4  @ gUnknown_085D6D48
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08062BF8  @ gUnknown_08684908
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L08062BFC  @ gUnknown_0868718C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08062C00  @ gUnknown_08686F84
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062BF0: .4byte gUnknown_0201774C
.L08062BF4: .4byte gUnknown_085D6D48
.L08062BF8: .4byte gUnknown_08684908
.L08062BFC: .4byte gUnknown_0868718C
.L08062C00: .4byte gUnknown_08686F84

	THUMB_FUNC_END func_08062BAC

	THUMB_FUNC_START func_08062C04
func_08062C04: @ 0x08062C04
	ldr r1, .L08062C10  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08062C10: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062C04

	THUMB_FUNC_START StartSpellAnimBerserk
StartSpellAnimBerserk: @ 0x08062C14
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08062C4C  @ gUnknown_085D6D68
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062C4C: .4byte gUnknown_085D6D68

	THUMB_FUNC_END StartSpellAnimBerserk

	THUMB_FUNC_START func_08062C50
func_08062C50: @ 0x08062C50
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08062C7E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L08062C7E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L08062CCC
	adds r0, r5, #0
	bl func_08062F4C
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_08062D30
	adds r0, r5, #0
	movs r1, #0x4a
	bl func_08062EAC
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0xa
	adds r3, r4, #0
	bl func_0805B400
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0
	bl func_0805B93C
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xf9
	adds r1, r4, #0
	movs r3, #1
	bl func_080729A4
	b .L08062D26
.L08062CCC:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne .L08062D08
	adds r0, r5, #0
	movs r1, #5
	bl StartEfxFlashBG
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl func_08055518
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08062D26
	adds r0, r5, #0
	bl func_08054BD4
	cmp r0, #0
	bne .L08062D26
	adds r0, r5, #0
	movs r1, #4
	bl func_08054BA4
	b .L08062D26
.L08062D08:
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne .L08062D26
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08062D26:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08062C50

	THUMB_FUNC_START func_08062D30
func_08062D30: @ 0x08062D30
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L08062E24  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062E28  @ gUnknown_085D6D80
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	mov r9, r1
	mov r2, r9
	strh r2, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, .L08062E2C  @ gUnknown_0868C338
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08062E30  @ gUnknown_086849B8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08062E34  @ gUnknown_08684AB8
	ldr r1, .L08062E38  @ gBg1Tm
	movs r2, #1
	mov r8, r2
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl func_08070E94
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0xe
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	bl func_080708A0
	ldr r4, .L08062E3C  @ gDispIo
	adds r3, r4, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r6, #0x20
	orrs r1, r6
	ldrb r2, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r2
	movs r2, #0x41
	negs r2, r2
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #8
	orrs r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r3]
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r4, #0x3d
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, .L08062E40  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08062E24: .4byte gUnknown_0201774C
.L08062E28: .4byte gUnknown_085D6D80
.L08062E2C: .4byte gUnknown_0868C338
.L08062E30: .4byte gUnknown_086849B8
.L08062E34: .4byte gUnknown_08684AB8
.L08062E38: .4byte gBg1Tm
.L08062E3C: .4byte gDispIo
.L08062E40: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08062D30

	THUMB_FUNC_START func_08062E44
func_08062E44: @ 0x08062E44
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, .L08062E9C  @ gDispIo
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08062E96
	bl SpellFx_ClearBg1
	bl SpellFx_EndBlend
	bl func_08070874
	ldr r0, [r5, #0x1c]
	ldr r1, .L08062EA0  @ 0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, .L08062EA4  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	ldr r1, .L08062EA8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08062E96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062E9C: .4byte gDispIo
.L08062EA0: .4byte 0xFFFFF7FF
.L08062EA4: .4byte 0x0000F3FF
.L08062EA8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062E44

	THUMB_FUNC_START func_08062EAC
func_08062EAC: @ 0x08062EAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08062ED0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062ED4  @ gUnknown_085D6D98
	movs r1, #4
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062ED0: .4byte gUnknown_0201774C
.L08062ED4: .4byte gUnknown_085D6D98

	THUMB_FUNC_END func_08062EAC

	THUMB_FUNC_START func_08062ED8
func_08062ED8: @ 0x08062ED8
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, .L08062F34  @ 0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, .L08062F38  @ 0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl BsoPutOam
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08062F2C
	adds r0, r4, #0
	bl Proc_Break
.L08062F2C:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08062F34: .4byte 0xFFFFF7FF
.L08062F38: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08062ED8

	THUMB_FUNC_START func_08062F3C
func_08062F3C: @ 0x08062F3C
	ldr r1, .L08062F48  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08062F48: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062F3C

	THUMB_FUNC_START func_08062F4C
func_08062F4C: @ 0x08062F4C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08062F94  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08062F98  @ gUnknown_085D6DB8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	ldr r3, .L08062F9C  @ gUnknown_085D4F90
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldrh r2, [r0, #8]
	ldr r1, .L08062FA0  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08062F94: .4byte gUnknown_0201774C
.L08062F98: .4byte gUnknown_085D6DB8
.L08062F9C: .4byte gUnknown_085D4F90
.L08062FA0: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08062F4C

	THUMB_FUNC_START func_08062FA4
func_08062FA4: @ 0x08062FA4
	push {lr}
	ldr r2, .L08062FB8  @ gUnknown_0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl BsoRemove
	pop {r0}
	bx r0
	.align 2, 0
.L08062FB8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08062FA4

	THUMB_FUNC_START func_08062FBC
func_08062FBC: @ 0x08062FBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08062FEC  @ gUnknown_0868D2B4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08062FF0  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08062FF4  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08062FEC: .4byte gUnknown_0868D2B4
.L08062FF0: .4byte gUnknown_0868CC10
.L08062FF4: .4byte gUnknown_0868C358

	THUMB_FUNC_END func_08062FBC

	THUMB_FUNC_START func_08062FF8
func_08062FF8: @ 0x08062FF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08063028  @ gUnknown_0868D2C8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0806302C  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08063030  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063028: .4byte gUnknown_0868D2C8
.L0806302C: .4byte gUnknown_0868CC10
.L08063030: .4byte gUnknown_0868C358

	THUMB_FUNC_END func_08062FF8

	THUMB_FUNC_START func_08063034
func_08063034: @ 0x08063034
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08063064  @ gUnknown_0868D2DC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08063068  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0806306C  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063064: .4byte gUnknown_0868D2DC
.L08063068: .4byte gUnknown_0868CC10
.L0806306C: .4byte gUnknown_0868C358

	THUMB_FUNC_END func_08063034

	THUMB_FUNC_START func_08063070
func_08063070: @ 0x08063070
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080630A0  @ gUnknown_0868D2F0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080630A4  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080630A8  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080630A0: .4byte gUnknown_0868D2F0
.L080630A4: .4byte gUnknown_0868CC10
.L080630A8: .4byte gUnknown_0868C358

	THUMB_FUNC_END func_08063070

	THUMB_FUNC_START func_080630AC
func_080630AC: @ 0x080630AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080630DC  @ gUnknown_0868D304
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080630E0  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080630E4  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080630DC: .4byte gUnknown_0868D304
.L080630E0: .4byte gUnknown_0868CC10
.L080630E4: .4byte gUnknown_0868C358

	THUMB_FUNC_END func_080630AC

	THUMB_FUNC_START func_080630E8
func_080630E8: @ 0x080630E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08063118  @ gUnknown_0868D678
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0806311C  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08063120  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063118: .4byte gUnknown_0868D678
.L0806311C: .4byte gUnknown_0868CC10
.L08063120: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END func_080630E8

	THUMB_FUNC_START func_08063124
func_08063124: @ 0x08063124
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08063154  @ gUnknown_0868D684
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08063158  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0806315C  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063154: .4byte gUnknown_0868D684
.L08063158: .4byte gUnknown_0868CC10
.L0806315C: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END func_08063124

	THUMB_FUNC_START func_08063160
func_08063160: @ 0x08063160
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08063190  @ gUnknown_0868D690
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L08063194  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08063198  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063190: .4byte gUnknown_0868D690
.L08063194: .4byte gUnknown_0868CC10
.L08063198: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END func_08063160

	THUMB_FUNC_START func_0806319C
func_0806319C: @ 0x0806319C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L080631CC  @ gUnknown_0868D69C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L080631D0  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080631D4  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080631CC: .4byte gUnknown_0868D69C
.L080631D0: .4byte gUnknown_0868CC10
.L080631D4: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END func_0806319C

	THUMB_FUNC_START func_080631D8
func_080631D8: @ 0x080631D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, .L08063208  @ gUnknown_0868D6A8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, .L0806320C  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08063210  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063208: .4byte gUnknown_0868D6A8
.L0806320C: .4byte gUnknown_0868CC10
.L08063210: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END func_080631D8

	THUMB_FUNC_START func_08063214
func_08063214: @ 0x08063214
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0806324C  @ gUnknown_085D6E70
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0806324C: .4byte gUnknown_085D6E70

	THUMB_FUNC_END func_08063214

	THUMB_FUNC_START func_08063250
func_08063250: @ 0x08063250
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0806327C
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0806327C:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L080632AC
	ldr r0, [r5, #0x5c]
	bl func_0806331C
	adds r0, r4, #0
	bl func_080633D0
	adds r0, r4, #0
	bl func_08063428
	movs r0, #0x81
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl func_080729A4
	b .L08063316
.L080632AC:
	adds r0, r6, #0
	adds r0, #0x28
	cmp r1, r0
	beq .L080632BC
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	bne .L080632C4
.L080632BC:
	adds r0, r4, #0
	bl func_08063428
	b .L08063316
.L080632C4:
	adds r0, r6, #0
	adds r0, #0xb0
	cmp r1, r0
	bne .L080632DA
	adds r0, r4, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl StartEfxFlashUnit
	b .L08063316
.L080632DA:
	adds r0, r6, #0
	adds r0, #0xe1
	cmp r1, r0
	bne .L080632F8
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl func_08055518
	b .L08063316
.L080632F8:
	adds r0, r6, #0
	adds r0, #0xe6
	cmp r1, r0
	bne .L08063316
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r5, #0
	bl Proc_Break
.L08063316:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08063250

	THUMB_FUNC_START func_0806331C
func_0806331C: @ 0x0806331C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08063360  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063364  @ gUnknown_085D6E88
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08063368  @ gUnknown_080DDF3A
	str r1, [r0, #0x48]
	ldr r1, .L0806336C  @ gUnknown_085D6EA0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08063370  @ gUnknown_0868DF5C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08063374  @ gUnknown_0868D6D0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063360: .4byte gUnknown_0201774C
.L08063364: .4byte gUnknown_085D6E88
.L08063368: .4byte gUnknown_080DDF3A
.L0806336C: .4byte gUnknown_085D6EA0
.L08063370: .4byte gUnknown_0868DF5C
.L08063374: .4byte gUnknown_0868D6D0

	THUMB_FUNC_END func_0806331C

	THUMB_FUNC_START func_08063378
func_08063378: @ 0x08063378
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L080633A6
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L080633C4
.L080633A6:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L080633C4
	bl SpellFx_ClearBg1
	ldr r1, .L080633CC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L080633C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080633CC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08063378

	THUMB_FUNC_START func_080633D0
func_080633D0: @ 0x080633D0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08063414  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063418  @ gUnknown_085D6EB4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L0806341C  @ gUnknown_08692524
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r0, .L08063420  @ gUnknown_0868E46C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08063424  @ gUnknown_08686F84
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08063414: .4byte gUnknown_0201774C
.L08063418: .4byte gUnknown_085D6EB4
.L0806341C: .4byte gUnknown_08692524
.L08063420: .4byte gUnknown_0868E46C
.L08063424: .4byte gUnknown_08686F84

	THUMB_FUNC_END func_080633D0

	THUMB_FUNC_START func_08063428
func_08063428: @ 0x08063428
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L0806345C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063460  @ gUnknown_085D6ED4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, .L08063464  @ gUnknown_08692674
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0806345C: .4byte gUnknown_0201774C
.L08063460: .4byte gUnknown_085D6ED4
.L08063464: .4byte gUnknown_08692674

	THUMB_FUNC_END func_08063428

	THUMB_FUNC_START func_08063468
func_08063468: @ 0x08063468
	push {lr}
	ldr r0, [r0, #0x60]
	bl BsoRemove
	ldr r1, .L0806347C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0806347C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08063468

	THUMB_FUNC_START StartSpellAnimShine
StartSpellAnimShine: @ 0x08063480
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080634B8  @ gUnknown_085D6EF4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080634B8: .4byte gUnknown_085D6EF4

	THUMB_FUNC_END StartSpellAnimShine

	THUMB_FUNC_START func_080634BC
func_080634BC: @ 0x080634BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080634E6
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L080634E6:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L080634FA
	adds r0, r5, #0
	movs r1, #0xa
	bl StartEfxFlashBG
	b .L08063588
.L080634FA:
	adds r0, r6, #0
	adds r0, #0xb
	cmp r1, r0
	bne .L0806351C
	adds r0, r5, #0
	bl func_0806364C
	movs r0, #0xaf
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	b .L08063588
.L0806351C:
	adds r0, r6, #0
	adds r0, #0x17
	cmp r1, r0
	bne .L08063534
	adds r0, r5, #0
	movs r1, #5
	bl StartEfxFlashBG
	adds r0, r5, #0
	bl func_080637F8
	b .L08063588
.L08063534:
	adds r0, r6, #0
	adds r0, #0x1d
	cmp r1, r0
	bne .L0806354A
	adds r0, r5, #0
	bl func_08063590
	adds r0, r5, #0
	bl func_0806376C
	b .L08063588
.L0806354A:
	adds r0, r6, #0
	adds r0, #0x1e
	cmp r1, r0
	bne .L08063572
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08063588
	adds r0, r5, #0
	bl func_08072450
	b .L08063588
.L08063572:
	adds r0, r6, #0
	adds r0, #0x23
	cmp r1, r0
	bne .L08063588
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08063588:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080634BC

	THUMB_FUNC_START func_08063590
func_08063590: @ 0x08063590
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080635D0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080635D4  @ gUnknown_085D6F0C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080635D8  @ gUnknown_080DE03C
	str r1, [r0, #0x48]
	ldr r1, .L080635DC  @ gUnknown_085D6F24
	str r1, [r0, #0x4c]
	ldr r1, .L080635E0  @ gUnknown_085D6F28
	str r1, [r0, #0x50]
	ldr r1, .L080635E4  @ gUnknown_085D6F2C
	str r1, [r0, #0x54]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080635D0: .4byte gUnknown_0201774C
.L080635D4: .4byte gUnknown_085D6F0C
.L080635D8: .4byte gUnknown_080DE03C
.L080635DC: .4byte gUnknown_085D6F24
.L080635E0: .4byte gUnknown_085D6F28
.L080635E4: .4byte gUnknown_085D6F2C

	THUMB_FUNC_END func_08063590

	THUMB_FUNC_START func_080635E8
func_080635E8: @ 0x080635E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08063624
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L08063642
.L08063624:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L08063642
	bl SpellFx_ClearBg1
	ldr r1, .L08063648  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_Break
.L08063642:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08063648: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080635E8

	THUMB_FUNC_START func_0806364C
func_0806364C: @ 0x0806364C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L080636A8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080636AC  @ gUnknown_085D6F30
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L080636B0  @ gUnknown_080DE050
	str r0, [r5, #0x48]
	ldr r0, .L080636B4  @ gUnknown_085D6F48
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L080636B8  @ gUnknown_08727C48
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L080636BC  @ gUnknown_0872796C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L080636C0  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080636CE
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080636C4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L080636CE
	.align 2, 0
.L080636A8: .4byte gUnknown_0201774C
.L080636AC: .4byte gUnknown_085D6F30
.L080636B0: .4byte gUnknown_080DE050
.L080636B4: .4byte gUnknown_085D6F48
.L080636B8: .4byte gUnknown_08727C48
.L080636BC: .4byte gUnknown_0872796C
.L080636C0: .4byte gBattleAnimSceneLayoutEnum
.L080636C4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L080636CE:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806364C

	THUMB_FUNC_START func_080636D8
func_080636D8: @ 0x080636D8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08063740
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, .L08063720  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0806375E
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne .L08063728
	ldr r0, .L08063724  @ gBg1Tm
	b .L0806372C
	.align 2, 0
.L08063720: .4byte gBattleAnimSceneLayoutEnum
.L08063724: .4byte gBg1Tm
.L08063728:
	ldr r0, .L0806373C  @ gBg1Tm+0x3A
	movs r1, #0
.L0806372C:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L0806375E
	.align 2, 0
.L0806373C: .4byte gBg1Tm+0x3A
.L08063740:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L0806375E
	bl SpellFx_ClearBg1
	ldr r1, .L08063768  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0806375E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063768: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080636D8

	THUMB_FUNC_START func_0806376C
func_0806376C: @ 0x0806376C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080637A0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080637A4  @ gUnknown_085D6F6C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, .L080637A8  @ gUnknown_080DE086
	str r1, [r0, #0x48]
	ldr r1, .L080637AC  @ gUnknown_08726FF4
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080637A0: .4byte gUnknown_0201774C
.L080637A4: .4byte gUnknown_085D6F6C
.L080637A8: .4byte gUnknown_080DE086
.L080637AC: .4byte gUnknown_08726FF4

	THUMB_FUNC_END func_0806376C

	THUMB_FUNC_START func_080637B0
func_080637B0: @ 0x080637B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080637D6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080637EC
.L080637D6:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080637EC
	ldr r1, .L080637F4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080637EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080637F4: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080637B0

	THUMB_FUNC_START func_080637F8
func_080637F8: @ 0x080637F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08063830  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063834  @ gUnknown_085D6F8C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #2
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	ldr r0, .L08063838  @ gUnknown_08728920
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0806383C  @ gUnknown_0872865C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063830: .4byte gUnknown_0201774C
.L08063834: .4byte gUnknown_085D6F8C
.L08063838: .4byte gUnknown_08728920
.L0806383C: .4byte gUnknown_0872865C

	THUMB_FUNC_END func_080637F8

	THUMB_FUNC_START func_08063840
func_08063840: @ 0x08063840
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	bne .L080638E0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08063894
	ldr r0, [r5, #0x5c]
	movs r4, #2
	ldrsh r3, [r0, r4]
	ldr r4, .L08063890  @ gUnknown_085D6FA4
	movs r6, #0x30
	ldrsh r2, [r5, r6]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	adds r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl func_080638F0
	b .L080638C0
	.align 2, 0
.L08063890: .4byte gUnknown_085D6FA4
.L08063894:
	ldr r0, [r5, #0x5c]
	movs r6, #2
	ldrsh r3, [r0, r6]
	ldr r4, .L080638E8  @ gUnknown_085D6FA4
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	subs r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl func_080638F0
.L080638C0:
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldrh r0, [r5, #0x30]
	adds r0, #2
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble .L080638E0
	ldr r1, .L080638EC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L080638E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080638E8: .4byte gUnknown_085D6FA4
.L080638EC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08063840

	THUMB_FUNC_START func_080638F0
func_080638F0: @ 0x080638F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, .L0806393C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063940  @ gUnknown_085D6FB4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x46
	strh r0, [r4, #0x2e]
	ldr r3, .L08063944  @ gUnknown_08728C04
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0806393C: .4byte gUnknown_0201774C
.L08063940: .4byte gUnknown_085D6FB4
.L08063944: .4byte gUnknown_08728C04

	THUMB_FUNC_END func_080638F0

	THUMB_FUNC_START func_08063948
func_08063948: @ 0x08063948
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne .L0806396C
	ldr r1, .L08063970  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
.L0806396C:
	pop {r0}
	bx r0
	.align 2, 0
.L08063970: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08063948

	THUMB_FUNC_START StartSpellAnimLuna
StartSpellAnimLuna: @ 0x08063974
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080639AC  @ gUnknown_085D6FCC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080639AC: .4byte gUnknown_085D6FCC

	THUMB_FUNC_END StartSpellAnimLuna

	THUMB_FUNC_START func_080639B0
func_080639B0: @ 0x080639B0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r6, r0, #0
	bl GetSpellAnimationStartFrame
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L080639DE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L080639DE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r5, #1
	cmp r1, r0
	bne .L08063A64
	adds r0, r6, #0
	bl func_08063B6C
	ldr r4, .L08063A5C  @ gDispIo
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl func_0805BA1C
	movs r5, #0x80
	lsls r5, r5, #1
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x14
	movs r2, #0xf
	adds r3, r5, #0
	bl func_0805B400
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x14
	bl func_0806428C
	movs r3, #0x20
	ldrsh r2, [r4, r3]
	adds r0, r6, #0
	movs r1, #0x14
	movs r3, #0
	bl func_0805B828
	ldr r0, .L08063A60  @ 0x000002BD
	adds r1, r5, #0
	movs r2, #0x78
	movs r3, #1
	bl func_080729A4
	b .L08063B62
	.align 2, 0
.L08063A5C: .4byte gDispIo
.L08063A60: .4byte 0x000002BD
.L08063A64:
	adds r0, r5, #0
	adds r0, #0x29
	cmp r1, r0
	bne .L08063A92
	bl func_08063C20
	adds r0, r6, #0
	movs r1, #0x15
	movs r2, #1
	bl func_0805B93C
	adds r0, r6, #0
	bl func_08064024
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x19
	movs r3, #0x10
	bl func_0805BA1C
	b .L08063B62
.L08063A92:
	adds r0, r5, #0
	adds r0, #0x37
	cmp r1, r0
	bne .L08063AB0
	ldr r0, .L08063AAC  @ 0x000002BE
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #0
	bl func_080729A4
	b .L08063B62
	.align 2, 0
.L08063AAC: .4byte 0x000002BE
.L08063AB0:
	adds r0, r5, #0
	adds r0, #0x46
	cmp r1, r0
	bne .L08063B02
	adds r0, r6, #0
	movs r1, #0x41
	bl func_08063D64
	adds r0, r6, #0
	movs r1, #0x41
	bl func_08063EA0
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl func_0805BA1C
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x41
	movs r2, #2
	movs r3, #0x80
	bl func_0805B400
	adds r0, r6, #0
	movs r1, #0x44
	movs r2, #0
	bl func_0805B93C
	b .L08063B62
.L08063B02:
	adds r0, r5, #0
	adds r0, #0x87
	cmp r1, r0
	bne .L08063B32
	adds r0, r6, #0
	movs r1, #5
	bl StartEfxFlashBG
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08063B62
	adds r0, r6, #0
	bl func_08072450
	b .L08063B62
.L08063B32:
	adds r0, r5, #0
	adds r0, #0x8c
	cmp r1, r0
	bne .L08063B4C
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r4, #0x5c]
	bl func_08063F3C
	b .L08063B62
.L08063B4C:
	adds r0, r5, #0
	adds r0, #0xbe
	cmp r1, r0
	bne .L08063B62
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08063B62:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080639B0

	THUMB_FUNC_START func_08063B6C
func_08063B6C: @ 0x08063B6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08063BB0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063BB4  @ gUnknown_085D6FE4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08063BB8  @ gUnknown_080DE0CE
	str r1, [r0, #0x48]
	ldr r1, .L08063BBC  @ gUnknown_085D6FFC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08063BC0  @ gUnknown_0872972C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08063BC4  @ gUnknown_08728C5C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063BB0: .4byte gUnknown_0201774C
.L08063BB4: .4byte gUnknown_085D6FE4
.L08063BB8: .4byte gUnknown_080DE0CE
.L08063BBC: .4byte gUnknown_085D6FFC
.L08063BC0: .4byte gUnknown_0872972C
.L08063BC4: .4byte gUnknown_08728C5C

	THUMB_FUNC_END func_08063B6C

	THUMB_FUNC_START func_08063BC8
func_08063BC8: @ 0x08063BC8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08063BF6
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08063C14
.L08063BF6:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L08063C14
	bl SpellFx_ClearBg1
	ldr r1, .L08063C1C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L08063C14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063C1C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08063BC8

	THUMB_FUNC_START func_08063C20
func_08063C20: @ 0x08063C20
	push {lr}
	ldr r0, .L08063C3C  @ gUnknown_085D7000
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl func_08063CFC
	pop {r0}
	bx r0
	.align 2, 0
.L08063C3C: .4byte gUnknown_085D7000

	THUMB_FUNC_END func_08063C20

	THUMB_FUNC_START func_08063C40
func_08063C40: @ 0x08063C40
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	ldr r0, .L08063CA4  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r5, .L08063CA8  @ gUnknown_0201FB38
	cmp r0, #0
	bne .L08063C56
	ldr r5, .L08063CAC  @ gUnknown_0201FC78
.L08063C56:
	ldr r3, .L08063CB0  @ gUnknown_0201FDC4
	cmp r0, #0
	bne .L08063C5E
	ldr r3, .L08063CB4  @ gUnknown_0201FF04
.L08063C5E:
	movs r4, #0
	movs r6, #0
	ldr r0, .L08063CB8  @ gUnknown_085D7030
	movs r1, #0xe0
	lsls r1, r1, #0xf
	mov r8, r1
	movs r2, #0x70
	mov ip, r2
	adds r7, r0, #0
	subs r7, #0x20
.L08063C72:
	cmp r4, #0xf
	bls .L08063CD0
	cmp r4, #0x6f
	bhi .L08063CD0
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r9
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq .L08063CC8
	cmp r4, #0x3f
	bhi .L08063CC0
	adds r0, r4, #0
	subs r0, #0x70
	cmp r1, r0
	bcs .L08063CC8
	ldr r1, .L08063CBC  @ 0x0000FF90
	adds r0, r4, r1
	lsls r0, r0, #0x10
	b .L08063CC6
	.align 2, 0
.L08063CA4: .4byte gUnknown_0201FDB8
.L08063CA8: .4byte gUnknown_0201FB38
.L08063CAC: .4byte gUnknown_0201FC78
.L08063CB0: .4byte gUnknown_0201FDC4
.L08063CB4: .4byte gUnknown_0201FF04
.L08063CB8: .4byte gUnknown_085D7030
.L08063CBC: .4byte 0x0000FF90
.L08063CC0:
	cmp r1, ip
	bls .L08063CC8
	mov r0, r8
.L08063CC6:
	lsrs r2, r0, #0x10
.L08063CC8:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r3]
	b .L08063CD6
.L08063CD0:
	strh r6, [r5]
	adds r5, #2
	strh r6, [r3]
.L08063CD6:
	adds r3, #2
	ldr r1, .L08063CF8  @ 0xFFFF0000
	add r8, r1
	movs r2, #1
	negs r2, r2
	add ip, r2
	adds r7, #2
	adds r4, #1
	cmp r4, #0x9f
	bls .L08063C72
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08063CF8: .4byte 0xFFFF0000

	THUMB_FUNC_END func_08063C40

	THUMB_FUNC_START func_08063CFC
func_08063CFC: @ 0x08063CFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08063D18  @ gUnknown_085D7018
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08063D18: .4byte gUnknown_085D7018

	THUMB_FUNC_END func_08063CFC

	THUMB_FUNC_START func_08063D1C
func_08063D1C: @ 0x08063D1C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L08063D5A
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
.L08063D5A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08063D1C

	THUMB_FUNC_START func_08063D64
func_08063D64: @ 0x08063D64
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08063DC8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063DCC  @ gUnknown_085D70F0
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	ldr r0, .L08063DD0  @ gUnknown_0872987C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08063DD4  @ gUnknown_08729FDC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBg1
	ldr r0, .L08063DD8  @ gUnknown_0872A1BC
	ldr r4, .L08063DDC  @ gUnknown_02019790
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08063DE4
	ldr r1, .L08063DE0  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl func_08070EC4
	b .L08063DF8
	.align 2, 0
.L08063DC8: .4byte gUnknown_0201774C
.L08063DCC: .4byte gUnknown_085D70F0
.L08063DD0: .4byte gUnknown_0872987C
.L08063DD4: .4byte gUnknown_08729FDC
.L08063DD8: .4byte gUnknown_0872A1BC
.L08063DDC: .4byte gUnknown_02019790
.L08063DE0: .4byte gBg1Tm
.L08063DE4:
	ldr r1, .L08063E24  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl func_08070E94
.L08063DF8:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_InitBg1Blend
	ldr r0, .L08063E28  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08063E36
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08063E2C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08063E36
	.align 2, 0
.L08063E24: .4byte gBg1Tm
.L08063E28: .4byte gBattleAnimSceneLayoutEnum
.L08063E2C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08063E36:
	ldr r2, .L08063E54  @ gDispIo
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
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08063E54: .4byte gDispIo

	THUMB_FUNC_END func_08063D64

	THUMB_FUNC_START func_08063E58
func_08063E58: @ 0x08063E58
	push {lr}
	bl SpellFx_ClearBg1
	ldr r1, .L08063E70  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	pop {r0}
	bx r0
	.align 2, 0
.L08063E70: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08063E58

	THUMB_FUNC_START func_08063E74
func_08063E74: @ 0x08063E74
	push {lr}
	adds r2, r0, #0
	ldr r1, .L08063E9C  @ gDispIo
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L08063E98
	adds r0, r2, #0
	bl Proc_Break
.L08063E98:
	pop {r0}
	bx r0
	.align 2, 0
.L08063E9C: .4byte gDispIo

	THUMB_FUNC_END func_08063E74

	THUMB_FUNC_START func_08063EA0
func_08063EA0: @ 0x08063EA0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08063ED8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063EDC  @ gUnknown_085D7110
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, .L08063EE0  @ gUnknown_080DE106
	str r1, [r0, #0x48]
	ldr r1, .L08063EE4  @ gUnknown_08729FDC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08063ED8: .4byte gUnknown_0201774C
.L08063EDC: .4byte gUnknown_085D7110
.L08063EE0: .4byte gUnknown_080DE106
.L08063EE4: .4byte gUnknown_08729FDC

	THUMB_FUNC_END func_08063EA0

	THUMB_FUNC_START func_08063EE8
func_08063EE8: @ 0x08063EE8
	ldr r1, .L08063EF4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08063EF4: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08063EE8

	THUMB_FUNC_START func_08063EF8
func_08063EF8: @ 0x08063EF8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L08063F1C
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L08063F1C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L08063F34
	adds r0, r4, #0
	bl Proc_Break
.L08063F34:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08063EF8

	THUMB_FUNC_START func_08063F3C
func_08063F3C: @ 0x08063F3C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08063F94  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08063F98  @ gUnknown_085D7138
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08063F9C  @ gUnknown_080DE150
	str r0, [r5, #0x48]
	ldr r0, .L08063FA0  @ gUnknown_085D7150
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08063FA4  @ gUnknown_085D7180
	str r0, [r5, #0x54]
	ldr r0, .L08063FA8  @ gUnknown_0872CE60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r0, .L08063FAC  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08063FBA
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08063FB0
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08063FBA
	.align 2, 0
.L08063F94: .4byte gUnknown_0201774C
.L08063F98: .4byte gUnknown_085D7138
.L08063F9C: .4byte gUnknown_080DE150
.L08063FA0: .4byte gUnknown_085D7150
.L08063FA4: .4byte gUnknown_085D7180
.L08063FA8: .4byte gUnknown_0872CE60
.L08063FAC: .4byte gBattleAnimSceneLayoutEnum
.L08063FB0:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08063FBA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08063F3C

	THUMB_FUNC_START func_08063FC0
func_08063FC0: @ 0x08063FC0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08063FFC
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0806401A
.L08063FFC:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L0806401A
	bl SpellFx_ClearBg1
	ldr r1, .L08064020  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L0806401A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064020: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08063FC0

	THUMB_FUNC_START func_08064024
func_08064024: @ 0x08064024
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
.L0806402A:
	ldr r0, .L08064054  @ gUnknown_085D71B0
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	str r4, [r0, #0x44]
	adds r4, #1
	cmp r4, #7
	bls .L0806402A
	ldr r0, .L08064058  @ gUnknown_0872DE04
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0806405C  @ gUnknown_0872DA04
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064054: .4byte gUnknown_085D71B0
.L08064058: .4byte gUnknown_0872DE04
.L0806405C: .4byte gUnknown_0872DA04

	THUMB_FUNC_END func_08064024

	THUMB_FUNC_START func_08064060
func_08064060: @ 0x08064060
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L080640C0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r5, #0
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x2e]
	ldr r1, [r4, #0x44]
	ldr r0, .L080640C4  @ 0x00002AAA
	muls r0, r1, r0
	strh r0, [r4, #0x30]
	ldr r3, .L080640C8  @ gUnknown_0872DFEC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	strh r5, [r0, #6]
	ldrh r2, [r0, #8]
	ldr r1, .L080640CC  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, [r4, #0x5c]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080640C0: .4byte gUnknown_0201774C
.L080640C4: .4byte 0x00002AAA
.L080640C8: .4byte gUnknown_0872DFEC
.L080640CC: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08064060

	THUMB_FUNC_START func_080640D0
func_080640D0: @ 0x080640D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r7, #0x14
	str r7, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x32
	bl Interpolate
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r3, [r4, #0x30]
	adds r1, r1, r3
	movs r6, #0
	strh r1, [r4, #0x30]
	ldrh r2, [r4, #0x30]
	lsrs r2, r2, #8
	ldr r3, .L08064164  @ gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x32]
	adds r1, r1, r2
	asrs r0, r0, #0x10
	ldrh r3, [r4, #0x3a]
	adds r0, r0, r3
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble .L0806413C
	strh r7, [r4, #0x2c]
.L0806413C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble .L0806415C
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, .L08064168  @ gUnknown_0872E24C
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
.L0806415C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08064164: .4byte gSinLut
.L08064168: .4byte gUnknown_0872E24C

	THUMB_FUNC_END func_080640D0

	THUMB_FUNC_START func_0806416C
func_0806416C: @ 0x0806416C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r3, #0x32
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r4, #0x30]
	adds r0, r0, r2
	movs r6, #0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x30]
	lsrs r0, r0, #8
	ldr r2, .L080641E8  @ gSinLut
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	muls r1, r3, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r3, r0
	asrs r1, r1, #0xc
	ldrh r2, [r4, #0x32]
	adds r1, r1, r2
	asrs r0, r0, #0xc
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L080641C0
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
.L080641C0:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble .L080641E0
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, .L080641EC  @ gUnknown_0872E024
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
.L080641E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080641E8: .4byte gSinLut
.L080641EC: .4byte gUnknown_0872E024

	THUMB_FUNC_END func_0806416C

	THUMB_FUNC_START func_080641F0
func_080641F0: @ 0x080641F0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0xa
	str r6, [sp]
	movs r0, #1
	movs r1, #0x32
	movs r2, #0
	bl Interpolate
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	ldrh r3, [r5, #0x30]
	adds r1, r1, r3
	strh r1, [r5, #0x30]
	ldrh r2, [r5, #0x30]
	lsrs r2, r2, #8
	ldr r3, .L08064284  @ gSinLut
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r1, r2
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r0, r3
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble .L0806425A
	strh r6, [r5, #0x2c]
.L0806425A:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble .L0806427C
	ldr r0, .L08064288  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r5, #0x60]
	bl BsoRemove
	adds r0, r5, #0
	bl Proc_Break
.L0806427C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08064284: .4byte gSinLut
.L08064288: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080641F0

	THUMB_FUNC_START func_0806428C
func_0806428C: @ 0x0806428C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, .L080642B4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080642B8  @ gUnknown_085D71E0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080642B4: .4byte gUnknown_0201774C
.L080642B8: .4byte gUnknown_085D71E0

	THUMB_FUNC_END func_0806428C

	THUMB_FUNC_START func_080642BC
func_080642BC: @ 0x080642BC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble .L080642FA
	ldr r1, .L08064304  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L080642FA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064304: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080642BC

	THUMB_FUNC_START func_08064308
func_08064308: @ 0x08064308
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08064340  @ gUnknown_085D71F8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064340: .4byte gUnknown_085D71F8

	THUMB_FUNC_END func_08064308

	THUMB_FUNC_START func_08064344
func_08064344: @ 0x08064344
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	bl GetSpellAnimationStartFrame
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08064374
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L0806441C
.L08064374:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne .L080643A0
	movs r0, #0x10
	str r0, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl func_0805BA1C
	adds r0, r4, #0
	bl func_08064C28
	ldr r0, .L0806439C  @ 0x000003B5
	b .L080643EA
	.align 2, 0
.L0806439C: .4byte 0x000003B5
.L080643A0:
	adds r0, r6, #0
	adds r0, #0x29
	cmp r1, r0
	bne .L080643BA
	str r2, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0x10
	bl func_0805BA1C
	b .L0806441C
.L080643BA:
	adds r0, r6, #0
	adds r0, #0x3f
	cmp r1, r0
	bne .L080643D4
	movs r0, #0xf
	bl func_080646FC
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #1
	bl func_0805B93C
	b .L0806441C
.L080643D4:
	adds r0, r6, #0
	adds r0, #0x40
	cmp r1, r0
	bne .L08064400
	adds r0, r4, #0
	bl func_080644E0
	adds r0, r4, #0
	bl func_0806466C
	ldr r0, .L080643FC  @ 0x000002BF
.L080643EA:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl func_080729A4
	b .L0806441C
	.align 2, 0
.L080643FC: .4byte 0x000002BF
.L08064400:
	adds r0, r6, #0
	adds r0, #0x6c
	cmp r1, r0
	bne .L0806441C
	movs r0, #0xb0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
.L0806441C:
	adds r7, r5, #0
	adds r7, #0x29
	ldrb r0, [r7]
	cmp r0, #0
	bne .L080644A2
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x71
	cmp r1, r0
	bne .L08064444
	adds r0, r4, #0
	bl func_08064B90
	adds r0, r4, #0
	bl func_08064838
	adds r0, r4, #0
	bl func_08064958
.L08064444:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x92
	cmp r1, r0
	bne .L0806446E
	adds r0, r4, #0
	movs r1, #5
	bl StartEfxFlashBG
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r4, #0
	bl func_08072450
.L0806446E:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x98
	cmp r1, r0
	bne .L08064486
	adds r0, r4, #0
	bl func_080649E4
	adds r0, r4, #0
	bl func_08064B04
.L08064486:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0xa7
	cmp r1, r0
	bne .L080644D8
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r5, #0
	bl Proc_Break
	b .L080644D8
.L080644A2:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x6e
	cmp r1, r0
	bne .L080644BE
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
.L080644BE:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x6f
	cmp r1, r0
	bne .L080644D8
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r5, #0
	bl Proc_Break
.L080644D8:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08064344

	THUMB_FUNC_START func_080644E0
func_080644E0: @ 0x080644E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08064534  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064538  @ gUnknown_085D7210
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	ldr r0, .L0806453C  @ gUnknown_0872E25C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBg1
	ldr r0, .L08064540  @ gUnknown_0872E7EC
	ldr r1, .L08064544  @ gUnknown_02019790
	bl LZ77UnCompWram
	bl SpellFx_InitBg1Blend
	ldr r2, .L08064548  @ gDispIo
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08064534: .4byte gUnknown_0201774C
.L08064538: .4byte gUnknown_085D7210
.L0806453C: .4byte gUnknown_0872E25C
.L08064540: .4byte gUnknown_0872E7EC
.L08064544: .4byte gUnknown_02019790
.L08064548: .4byte gDispIo

	THUMB_FUNC_END func_080644E0

	THUMB_FUNC_START func_0806454C
func_0806454C: @ 0x0806454C
	push {lr}
	bl SpellFx_ClearBg1
	ldr r1, .L08064564  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	pop {r0}
	bx r0
	.align 2, 0
.L08064564: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806454C

	THUMB_FUNC_START func_08064568
func_08064568: @ 0x08064568
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08064598
	ldr r0, .L08064590  @ gUnknown_02019790
	ldr r1, .L08064594  @ gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl func_08070EC4
	b .L080645AC
	.align 2, 0
.L08064590: .4byte gUnknown_02019790
.L08064594: .4byte gBg1Tm
.L08064598:
	ldr r0, .L080645DC  @ gUnknown_02019790
	ldr r1, .L080645E0  @ gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl func_08070E94
.L080645AC:
	movs r0, #2
	bl EnableBgSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble .L080645EE
	strh r2, [r4, #0x2c]
	movs r0, #6
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x32]
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080645E4
	movs r0, #0x80
	b .L080645E6
	.align 2, 0
.L080645DC: .4byte gUnknown_02019790
.L080645E0: .4byte gBg1Tm
.L080645E4:
	ldr r0, .L080645F8  @ 0x0000FF80
.L080645E6:
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
.L080645EE:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080645F8: .4byte 0x0000FF80

	THUMB_FUNC_END func_08064568

	THUMB_FUNC_START func_080645FC
func_080645FC: @ 0x080645FC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	ldr r1, .L08064648  @ gDispIo
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L0806463E
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xc
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
.L0806463E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064648: .4byte gDispIo

	THUMB_FUNC_END func_080645FC

	THUMB_FUNC_START func_0806464C
func_0806464C: @ 0x0806464C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L08064668
	adds r0, r2, #0
	bl Proc_Break
.L08064668:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806464C

	THUMB_FUNC_START func_0806466C
func_0806466C: @ 0x0806466C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080646A0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080646A4  @ gUnknown_085D7240
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, .L080646A8  @ gUnknown_080DE1CE
	str r1, [r0, #0x48]
	ldr r1, .L080646AC  @ gUnknown_0872E64C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080646A0: .4byte gUnknown_0201774C
.L080646A4: .4byte gUnknown_085D7240
.L080646A8: .4byte gUnknown_080DE1CE
.L080646AC: .4byte gUnknown_0872E64C

	THUMB_FUNC_END func_0806466C

	THUMB_FUNC_START func_080646B0
func_080646B0: @ 0x080646B0
	ldr r1, .L080646BC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L080646BC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080646B0

	THUMB_FUNC_START func_080646C0
func_080646C0: @ 0x080646C0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080646E6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080646F4
.L080646E6:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080646F4
	adds r0, r4, #0
	bl Proc_Break
.L080646F4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080646C0

	THUMB_FUNC_START func_080646FC
func_080646FC: @ 0x080646FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0806471C  @ gUnknown_085D7268
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	adds r1, r4, #0
	bl func_080647D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0806471C: .4byte gUnknown_085D7268

	THUMB_FUNC_END func_080646FC

	THUMB_FUNC_START func_08064720
func_08064720: @ 0x08064720
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	ldr r0, .L0806477C  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r5, .L08064780  @ gUnknown_0201FB38
	cmp r0, #0
	bne .L08064736
	ldr r5, .L08064784  @ gUnknown_0201FC78
.L08064736:
	ldr r4, .L08064788  @ gUnknown_0201FDC4
	cmp r0, #0
	bne .L0806473E
	ldr r4, .L0806478C  @ gUnknown_0201FF04
.L0806473E:
	movs r3, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #0x10
	mov ip, r1
	movs r7, #0x80
	ldr r6, .L08064790  @ gUnknown_085D7298
.L0806474E:
	cmp r3, #0x7f
	bhi .L080647A8
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r2, r9
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq .L080647A0
	cmp r3, #0x3f
	bhi .L08064798
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bcs .L080647A0
	ldr r1, .L08064794  @ 0x0000FF80
	adds r0, r3, r1
	lsls r0, r0, #0x10
	b .L0806479E
	.align 2, 0
.L0806477C: .4byte gUnknown_0201FDB8
.L08064780: .4byte gUnknown_0201FB38
.L08064784: .4byte gUnknown_0201FC78
.L08064788: .4byte gUnknown_0201FDC4
.L0806478C: .4byte gUnknown_0201FF04
.L08064790: .4byte gUnknown_085D7298
.L08064794: .4byte 0x0000FF80
.L08064798:
	cmp r1, r7
	bls .L080647A0
	mov r0, ip
.L0806479E:
	lsrs r2, r0, #0x10
.L080647A0:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r4]
	b .L080647B0
.L080647A8:
	mov r1, r8
	strh r1, [r5]
	adds r5, #2
	strh r1, [r4]
.L080647B0:
	adds r4, #2
	ldr r2, .L080647CC  @ 0xFFFF0000
	add ip, r2
	subs r7, #1
	adds r6, #2
	adds r3, #1
	cmp r3, #0x9f
	bls .L0806474E
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080647CC: .4byte 0xFFFF0000

	THUMB_FUNC_END func_08064720

	THUMB_FUNC_START func_080647D0
func_080647D0: @ 0x080647D0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L080647EC  @ gUnknown_085D7280
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080647EC: .4byte gUnknown_085D7280

	THUMB_FUNC_END func_080647D0

	THUMB_FUNC_START func_080647F0
func_080647F0: @ 0x080647F0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L0806482E
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
.L0806482E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080647F0

	THUMB_FUNC_START func_08064838
func_08064838: @ 0x08064838
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, .L0806487C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064880  @ gUnknown_085D7398
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, .L08064884  @ gUnknown_0872E998
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBg1
	ldr r0, .L08064888  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08064894
	ldr r0, .L0806488C  @ gUnknown_0872FA84
	ldr r1, .L08064890  @ gUnknown_02019790
	bl LZ77UnCompWram
	b .L0806489C
	.align 2, 0
.L0806487C: .4byte gUnknown_0201774C
.L08064880: .4byte gUnknown_085D7398
.L08064884: .4byte gUnknown_0872E998
.L08064888: .4byte gBattleAnimSceneLayoutEnum
.L0806488C: .4byte gUnknown_0872FA84
.L08064890: .4byte gUnknown_02019790
.L08064894:
	ldr r0, .L080648BC  @ gUnknown_0872FEB8
	ldr r1, .L080648C0  @ gUnknown_02019790
	bl LZ77UnCompWram
.L0806489C:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080648C8
	ldr r0, .L080648C0  @ gUnknown_02019790
	ldr r1, .L080648C4  @ gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070EC4
	b .L080648DC
	.align 2, 0
.L080648BC: .4byte gUnknown_0872FEB8
.L080648C0: .4byte gUnknown_02019790
.L080648C4: .4byte gBg1Tm
.L080648C8:
	ldr r0, .L08064910  @ gUnknown_02019790
	ldr r1, .L08064914  @ gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070E94
.L080648DC:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, .L08064918  @ gDispIo
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064910: .4byte gUnknown_02019790
.L08064914: .4byte gBg1Tm
.L08064918: .4byte gDispIo

	THUMB_FUNC_END func_08064838

	THUMB_FUNC_START func_0806491C
func_0806491C: @ 0x0806491C
	push {lr}
	bl SpellFx_ClearBg1
	ldr r1, .L08064934  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	pop {r0}
	bx r0
	.align 2, 0
.L08064934: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806491C

	THUMB_FUNC_START func_08064938
func_08064938: @ 0x08064938
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L08064954
	adds r0, r2, #0
	bl Proc_Break
.L08064954:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08064938

	THUMB_FUNC_START func_08064958
func_08064958: @ 0x08064958
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0806498C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064990  @ gUnknown_085D73B8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, .L08064994  @ gUnknown_080DE24C
	str r1, [r0, #0x48]
	ldr r1, .L08064998  @ gUnknown_0872FA04
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0806498C: .4byte gUnknown_0201774C
.L08064990: .4byte gUnknown_085D73B8
.L08064994: .4byte gUnknown_080DE24C
.L08064998: .4byte gUnknown_0872FA04

	THUMB_FUNC_END func_08064958

	THUMB_FUNC_START func_0806499C
func_0806499C: @ 0x0806499C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080649C2
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080649D8
.L080649C2:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080649D8
	ldr r1, .L080649E0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080649D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080649E0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806499C

	THUMB_FUNC_START func_080649E4
func_080649E4: @ 0x080649E4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, .L08064A28  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064A2C  @ gUnknown_085D73D8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, .L08064A30  @ gUnknown_08725DCC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBg1
	ldr r0, .L08064A34  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08064A40
	ldr r0, .L08064A38  @ gUnknown_087270B4
	ldr r1, .L08064A3C  @ gUnknown_02019790
	bl LZ77UnCompWram
	b .L08064A48
	.align 2, 0
.L08064A28: .4byte gUnknown_0201774C
.L08064A2C: .4byte gUnknown_085D73D8
.L08064A30: .4byte gUnknown_08725DCC
.L08064A34: .4byte gBattleAnimSceneLayoutEnum
.L08064A38: .4byte gUnknown_087270B4
.L08064A3C: .4byte gUnknown_02019790
.L08064A40:
	ldr r0, .L08064A68  @ gUnknown_08727510
	ldr r1, .L08064A6C  @ gUnknown_02019790
	bl LZ77UnCompWram
.L08064A48:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08064A74
	ldr r0, .L08064A6C  @ gUnknown_02019790
	ldr r1, .L08064A70  @ gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070EC4
	b .L08064A88
	.align 2, 0
.L08064A68: .4byte gUnknown_08727510
.L08064A6C: .4byte gUnknown_02019790
.L08064A70: .4byte gBg1Tm
.L08064A74:
	ldr r0, .L08064ABC  @ gUnknown_02019790
	ldr r1, .L08064AC0  @ gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070E94
.L08064A88:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, .L08064AC4  @ gDispIo
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064ABC: .4byte gUnknown_02019790
.L08064AC0: .4byte gBg1Tm
.L08064AC4: .4byte gDispIo

	THUMB_FUNC_END func_080649E4

	THUMB_FUNC_START func_08064AC8
func_08064AC8: @ 0x08064AC8
	push {lr}
	bl SpellFx_ClearBg1
	ldr r1, .L08064AE0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	pop {r0}
	bx r0
	.align 2, 0
.L08064AE0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08064AC8

	THUMB_FUNC_START func_08064AE4
func_08064AE4: @ 0x08064AE4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L08064B00
	adds r0, r2, #0
	bl Proc_Break
.L08064B00:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08064AE4

	THUMB_FUNC_START func_08064B04
func_08064B04: @ 0x08064B04
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08064B38  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064B3C  @ gUnknown_085D73F8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, .L08064B40  @ gUnknown_080DE284
	str r1, [r0, #0x48]
	ldr r1, .L08064B44  @ gUnknown_087302A4
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08064B38: .4byte gUnknown_0201774C
.L08064B3C: .4byte gUnknown_085D73F8
.L08064B40: .4byte gUnknown_080DE284
.L08064B44: .4byte gUnknown_087302A4

	THUMB_FUNC_END func_08064B04

	THUMB_FUNC_START func_08064B48
func_08064B48: @ 0x08064B48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L08064B6E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08064B84
.L08064B6E:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08064B84
	ldr r1, .L08064B8C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08064B84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08064B8C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08064B48

	THUMB_FUNC_START func_08064B90
func_08064B90: @ 0x08064B90
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, .L08064BE8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064BEC  @ gUnknown_085D7418
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, .L08064BF0  @ gUnknown_087312BC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #2]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldr r0, .L08064BF4  @ gUnknown_08730780
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08064BF8  @ gUnknown_08730324
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064BE8: .4byte gUnknown_0201774C
.L08064BEC: .4byte gUnknown_085D7418
.L08064BF0: .4byte gUnknown_087312BC
.L08064BF4: .4byte gUnknown_08730780
.L08064BF8: .4byte gUnknown_08730324

	THUMB_FUNC_END func_08064B90

	THUMB_FUNC_START func_08064BFC
func_08064BFC: @ 0x08064BFC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne .L08064C20
	ldr r1, .L08064C24  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
.L08064C20:
	pop {r0}
	bx r0
	.align 2, 0
.L08064C24: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08064BFC

	THUMB_FUNC_START func_08064C28
func_08064C28: @ 0x08064C28
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08064C68  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064C6C  @ gUnknown_085D7430
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	strh r1, [r0, #0x32]
	ldr r1, .L08064C70  @ gUnknown_080DE2B8
	str r1, [r0, #0x48]
	ldr r1, .L08064C74  @ gUnknown_085D744C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08064C78  @ gUnknown_085D7448
	str r1, [r0, #0x54]
	ldr r0, .L08064C7C  @ gUnknown_08724424
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08064C68: .4byte gUnknown_0201774C
.L08064C6C: .4byte gUnknown_085D7430
.L08064C70: .4byte gUnknown_080DE2B8
.L08064C74: .4byte gUnknown_085D744C
.L08064C78: .4byte gUnknown_085D7448
.L08064C7C: .4byte gUnknown_08724424

	THUMB_FUNC_END func_08064C28

	THUMB_FUNC_START func_08064C80
func_08064C80: @ 0x08064C80
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	adds r0, #0x10
	movs r1, #0xf0
	bl __modsi3
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x32]
	movs r0, #1
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08064CD4
	ldr r1, [r4, #0x4c]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r2, #2
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x20
	movs r3, #0x14
	bl func_0805576C
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L08064CF2
.L08064CD4:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L08064CF2
	bl SpellFx_ClearBg1
	ldr r1, .L08064CF8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_End
.L08064CF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064CF8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08064C80

	THUMB_FUNC_START nullsub_51
nullsub_51: @ 0x08064CFC
	bx lr

	THUMB_FUNC_END nullsub_51

	THUMB_FUNC_START func_08064D00
func_08064D00: @ 0x08064D00
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, .L08064D88  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064D8C  @ gUnknown_085D7450
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, .L08064D90  @ gUnknown_087313C8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08064D94  @ gUnknown_08732228
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBg1
	ldr r0, .L08064D98  @ gUnknown_08732368
	ldr r4, .L08064D9C  @ gUnknown_02019790
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, .L08064DA0  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070EC4
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, .L08064DA4  @ gDispIo
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064D88: .4byte gUnknown_0201774C
.L08064D8C: .4byte gUnknown_085D7450
.L08064D90: .4byte gUnknown_087313C8
.L08064D94: .4byte gUnknown_08732228
.L08064D98: .4byte gUnknown_08732368
.L08064D9C: .4byte gUnknown_02019790
.L08064DA0: .4byte gBg1Tm
.L08064DA4: .4byte gDispIo

	THUMB_FUNC_END func_08064D00

	THUMB_FUNC_START func_08064DA8
func_08064DA8: @ 0x08064DA8
	push {lr}
	bl SpellFx_ClearBg1
	ldr r1, .L08064DC0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	pop {r0}
	bx r0
	.align 2, 0
.L08064DC0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08064DA8

	THUMB_FUNC_START func_08064DC4
func_08064DC4: @ 0x08064DC4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L08064DE0
	adds r0, r2, #0
	bl Proc_Break
.L08064DE0:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08064DC4

	THUMB_FUNC_START func_08064DE4
func_08064DE4: @ 0x08064DE4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08064E18  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08064E1C  @ gUnknown_085D7470
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, .L08064E20  @ gUnknown_080DE2E2
	str r1, [r0, #0x48]
	ldr r1, .L08064E24  @ gUnknown_08732228
	str r1, [r0, #0x4c]
	ldr r0, .L08064E28  @ gUnknown_08731348
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08064E18: .4byte gUnknown_0201774C
.L08064E1C: .4byte gUnknown_085D7470
.L08064E20: .4byte gUnknown_080DE2E2
.L08064E24: .4byte gUnknown_08732228
.L08064E28: .4byte gUnknown_08731348

	THUMB_FUNC_END func_08064DE4

	THUMB_FUNC_START func_08064E2C
func_08064E2C: @ 0x08064E2C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L08064E52
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08064E68
.L08064E52:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08064E68
	ldr r1, .L08064E70  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08064E68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08064E70: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08064E2C

	THUMB_FUNC_START StartSpellAnimAura
StartSpellAnimAura: @ 0x08064E74
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08064EAC  @ gUnknown_085D7490
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08064EAC: .4byte gUnknown_085D7490

	THUMB_FUNC_END StartSpellAnimAura

	THUMB_FUNC_START func_08064EB0
func_08064EB0: @ 0x08064EB0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08064EEC
	adds r0, r5, #0
	bl func_08065008
	ldr r0, .L08064EE8  @ 0x000002C1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08064F4E
	.align 2, 0
.L08064EE8: .4byte 0x000002C1
.L08064EEC:
	cmp r0, #0xe
	bne .L08064EF8
	adds r0, r5, #0
	bl func_0806509C
	b .L08064FFE
.L08064EF8:
	cmp r0, #0x2c
	bne .L08064F10
	ldr r0, .L08064F0C  @ 0x000002C2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b .L08064F4E
	.align 2, 0
.L08064F0C: .4byte 0x000002C2
.L08064F10:
	cmp r0, #0x53
	bne .L08064F28
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	adds r0, r5, #0
	movs r1, #0xa
	bl StartEfxFlashBG
	b .L08064FFE
.L08064F28:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x5d
	cmp r1, r0
	bne .L08064F3C
	adds r0, r5, #0
	bl func_08065130
	b .L08064FFE
.L08064F3C:
	adds r0, r2, #0
	adds r0, #0x67
	cmp r1, r0
	bne .L08064F5C
	ldr r0, .L08064F58  @ 0x000002C3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
.L08064F4E:
	movs r3, #1
	bl func_080729A4
	b .L08064FFE
	.align 2, 0
.L08064F58: .4byte 0x000002C3
.L08064F5C:
	adds r0, r2, #0
	adds r0, #0x7d
	cmp r1, r0
	bne .L08064F70
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	b .L08064FE0
.L08064F70:
	adds r0, r2, #0
	adds r0, #0x89
	cmp r1, r0
	bne .L08064F86
	adds r0, r5, #0
	bl func_0806521C
	adds r0, r5, #0
	bl func_0806533C
	b .L08064FFE
.L08064F86:
	adds r0, r2, #0
	adds r0, #0x90
	cmp r1, r0
	bne .L08064FB6
	adds r0, r5, #0
	movs r1, #0xa
	bl StartEfxFlashBG
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08064FFE
	adds r0, r5, #0
	bl func_08072450
	b .L08064FFE
.L08064FB6:
	adds r0, r2, #0
	adds r0, #0x9a
	cmp r1, r0
	bne .L08064FE8
	ldr r0, [r4, #0x5c]
	movs r1, #0x5f
	movs r2, #1
	bl func_0805B93C
	ldr r0, [r4, #0x5c]
	movs r1, #0x42
	bl func_0805B4E8
	adds r0, r5, #0
	bl func_080653CC
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0xc
.L08064FE0:
	movs r3, #0x10
	bl func_0805BA1C
	b .L08064FFE
.L08064FE8:
	adds r0, r2, #0
	adds r0, #0xf5
	cmp r1, r0
	bne .L08064FFE
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08064FFE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08064EB0

	THUMB_FUNC_START func_08065008
func_08065008: @ 0x08065008
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0806506C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065070  @ gUnknown_085D74A8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08065074  @ gUnknown_080DE346
	str r0, [r5, #0x48]
	ldr r0, .L08065078  @ gUnknown_085D74C0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L0806507C  @ gUnknown_087327C4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08065080  @ gUnknown_0873313C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08065084  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08065092
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08065088
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08065092
	.align 2, 0
.L0806506C: .4byte gUnknown_0201774C
.L08065070: .4byte gUnknown_085D74A8
.L08065074: .4byte gUnknown_080DE346
.L08065078: .4byte gUnknown_085D74C0
.L0806507C: .4byte gUnknown_087327C4
.L08065080: .4byte gUnknown_0873313C
.L08065084: .4byte gBattleAnimSceneLayoutEnum
.L08065088:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L08065092:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08065008

	THUMB_FUNC_START func_0806509C
func_0806509C: @ 0x0806509C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08065100  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065104  @ gUnknown_085D74A8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08065108  @ gUnknown_080DE374
	str r0, [r5, #0x48]
	ldr r0, .L0806510C  @ gUnknown_085D74C0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08065110  @ gUnknown_087327C4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08065114  @ gUnknown_0873313C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08065118  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08065126
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0806511C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08065126
	.align 2, 0
.L08065100: .4byte gUnknown_0201774C
.L08065104: .4byte gUnknown_085D74A8
.L08065108: .4byte gUnknown_080DE374
.L0806510C: .4byte gUnknown_085D74C0
.L08065110: .4byte gUnknown_087327C4
.L08065114: .4byte gUnknown_0873313C
.L08065118: .4byte gBattleAnimSceneLayoutEnum
.L0806511C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08065126:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806509C

	THUMB_FUNC_START func_08065130
func_08065130: @ 0x08065130
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08065194  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065198  @ gUnknown_085D74A8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0806519C  @ gUnknown_080DE3A6
	str r0, [r5, #0x48]
	ldr r0, .L080651A0  @ gUnknown_085D74C0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L080651A4  @ gUnknown_087327C4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L080651A8  @ gUnknown_0873313C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L080651AC  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080651BA
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080651B0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L080651BA
	.align 2, 0
.L08065194: .4byte gUnknown_0201774C
.L08065198: .4byte gUnknown_085D74A8
.L0806519C: .4byte gUnknown_080DE3A6
.L080651A0: .4byte gUnknown_085D74C0
.L080651A4: .4byte gUnknown_087327C4
.L080651A8: .4byte gUnknown_0873313C
.L080651AC: .4byte gBattleAnimSceneLayoutEnum
.L080651B0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
.L080651BA:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08065130

	THUMB_FUNC_START func_080651C4
func_080651C4: @ 0x080651C4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L080651F2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08065210
.L080651F2:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L08065210
	bl SpellFx_ClearBg1
	ldr r1, .L08065218  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L08065210:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08065218: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080651C4

	THUMB_FUNC_START func_0806521C
func_0806521C: @ 0x0806521C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, .L08065260  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065264  @ gUnknown_085D7530
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #5
	strh r0, [r5, #0x2e]
	ldr r0, .L08065268  @ gUnknown_08725DCC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBg1
	ldr r0, .L0806526C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08065278
	ldr r0, .L08065270  @ gUnknown_087270B4
	ldr r1, .L08065274  @ gUnknown_02019790
	bl LZ77UnCompWram
	b .L08065280
	.align 2, 0
.L08065260: .4byte gUnknown_0201774C
.L08065264: .4byte gUnknown_085D7530
.L08065268: .4byte gUnknown_08725DCC
.L0806526C: .4byte gBattleAnimSceneLayoutEnum
.L08065270: .4byte gUnknown_087270B4
.L08065274: .4byte gUnknown_02019790
.L08065278:
	ldr r0, .L080652A0  @ gUnknown_08727510
	ldr r1, .L080652A4  @ gUnknown_02019790
	bl LZ77UnCompWram
.L08065280:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080652AC
	ldr r0, .L080652A4  @ gUnknown_02019790
	ldr r1, .L080652A8  @ gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070EC4
	b .L080652C0
	.align 2, 0
.L080652A0: .4byte gUnknown_08727510
.L080652A4: .4byte gUnknown_02019790
.L080652A8: .4byte gBg1Tm
.L080652AC:
	ldr r0, .L080652F4  @ gUnknown_02019790
	ldr r1, .L080652F8  @ gBg1Tm
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl func_08070E94
.L080652C0:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, .L080652FC  @ gDispIo
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080652F4: .4byte gUnknown_02019790
.L080652F8: .4byte gBg1Tm
.L080652FC: .4byte gDispIo

	THUMB_FUNC_END func_0806521C

	THUMB_FUNC_START func_08065300
func_08065300: @ 0x08065300
	push {lr}
	bl SpellFx_ClearBg1
	ldr r1, .L08065318  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	pop {r0}
	bx r0
	.align 2, 0
.L08065318: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08065300

	THUMB_FUNC_START func_0806531C
func_0806531C: @ 0x0806531C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble .L08065338
	adds r0, r2, #0
	bl Proc_Break
.L08065338:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806531C

	THUMB_FUNC_START func_0806533C
func_0806533C: @ 0x0806533C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08065374  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065378  @ gUnknown_085D7550
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
	str r0, [r1, #0x44]
	ldr r0, .L0806537C  @ gUnknown_080DE3DA
	str r0, [r1, #0x48]
	ldr r0, .L08065380  @ gUnknown_08726FF4
	str r0, [r1, #0x4c]
	adds r0, #0x60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08065374: .4byte gUnknown_0201774C
.L08065378: .4byte gUnknown_085D7550
.L0806537C: .4byte gUnknown_080DE3DA
.L08065380: .4byte gUnknown_08726FF4

	THUMB_FUNC_END func_0806533C

	THUMB_FUNC_START func_08065384
func_08065384: @ 0x08065384
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080653AA
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080653C0
.L080653AA:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080653C0
	ldr r1, .L080653C8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080653C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080653C8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08065384

	THUMB_FUNC_START func_080653CC
func_080653CC: @ 0x080653CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08065414  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065418  @ gUnknown_085D7570
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0806541C  @ gUnknown_080DE3F8
	str r1, [r0, #0x48]
	ldr r1, .L08065420  @ gUnknown_085D7588
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08065424  @ gUnknown_085D75B8
	str r1, [r0, #0x54]
	ldr r0, .L08065428  @ gUnknown_0874394C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08065414: .4byte gUnknown_0201774C
.L08065418: .4byte gUnknown_085D7570
.L0806541C: .4byte gUnknown_080DE3F8
.L08065420: .4byte gUnknown_085D7588
.L08065424: .4byte gUnknown_085D75B8
.L08065428: .4byte gUnknown_0874394C

	THUMB_FUNC_END func_080653CC

	THUMB_FUNC_START func_0806542C
func_0806542C: @ 0x0806542C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08065468
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	b .L08065486
.L08065468:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L08065486
	bl SpellFx_ClearBg1
	ldr r1, .L0806548C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_Break
.L08065486:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0806548C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806542C

	THUMB_FUNC_START nullsub_52
nullsub_52: @ 0x08065490
	bx lr

	THUMB_FUNC_END nullsub_52

	THUMB_FUNC_START nullsub_53
nullsub_53: @ 0x08065494
	bx lr

	THUMB_FUNC_END nullsub_53

	THUMB_FUNC_START func_08065498
func_08065498: @ 0x08065498
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080654E0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080654E4  @ gUnknown_085D75E8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, .L080654E8  @ gUnknown_080DE47E
	str r1, [r0, #0x48]
	ldr r1, .L080654EC  @ gUnknown_085D7628
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L080654F0  @ gUnknown_085D7600
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, .L080654F4  @ gUnknown_08750268
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080654E0: .4byte gUnknown_0201774C
.L080654E4: .4byte gUnknown_085D75E8
.L080654E8: .4byte gUnknown_080DE47E
.L080654EC: .4byte gUnknown_085D7628
.L080654F0: .4byte gUnknown_085D7600
.L080654F4: .4byte gUnknown_08750268

	THUMB_FUNC_END func_08065498

	THUMB_FUNC_START func_080654F8
func_080654F8: @ 0x080654F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L08065594
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq .L08065534
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
.L08065534:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, .L08065570  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne .L080655B2
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne .L08065578
	ldr r0, .L08065574  @ gBg1Tm
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b .L08065588
	.align 2, 0
.L08065570: .4byte gBattleAnimSceneLayoutEnum
.L08065574: .4byte gBg1Tm
.L08065578:
	ldr r0, .L08065590  @ gBg1Tm+0x3A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
.L08065588:
	movs r0, #2
	bl EnableBgSync
	b .L080655B2
	.align 2, 0
.L08065590: .4byte gBg1Tm+0x3A
.L08065594:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L080655B2
	bl SpellFx_ClearBg1
	ldr r1, .L080655C0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L080655B2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080655C0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080654F8

	THUMB_FUNC_START func_080655C4
func_080655C4: @ 0x080655C4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L08065610  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065614  @ gUnknown_085D7650
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, .L08065618  @ gUnknown_08752020
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r5, #0x60]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	ldr r0, .L0806561C  @ gUnknown_08751808
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, .L08065620  @ gUnknown_08751DB4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08065610: .4byte gUnknown_0201774C
.L08065614: .4byte gUnknown_085D7650
.L08065618: .4byte gUnknown_08752020
.L0806561C: .4byte gUnknown_08751808
.L08065620: .4byte gUnknown_08751DB4

	THUMB_FUNC_END func_080655C4

	THUMB_FUNC_START func_08065624
func_08065624: @ 0x08065624
	ldr r1, .L08065630  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
.L08065630: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08065624

	THUMB_FUNC_START func_08065634
func_08065634: @ 0x08065634
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0806566C  @ gUnknown_085D7670
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0806566C: .4byte gUnknown_085D7670

	THUMB_FUNC_END func_08065634

	THUMB_FUNC_START func_08065670
func_08065670: @ 0x08065670
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080656A8  @ gUnknown_085D7670
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #2
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080656A8: .4byte gUnknown_085D7670

	THUMB_FUNC_END func_08065670

	THUMB_FUNC_START func_080656AC
func_080656AC: @ 0x080656AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080656E4  @ gUnknown_085D7670
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #3
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080656E4: .4byte gUnknown_085D7670

	THUMB_FUNC_END func_080656AC

	THUMB_FUNC_START func_080656E8
func_080656E8: @ 0x080656E8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08065720  @ gUnknown_085D7670
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #4
	str r0, [r4, #0x44]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08065720: .4byte gUnknown_085D7670

	THUMB_FUNC_END func_080656E8

	THUMB_FUNC_START func_08065724
func_08065724: @ 0x08065724
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x19
	bne .L080657A4
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
	bl func_0805CA64
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
	bl func_0805CB40
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl func_0805B93C
	adds r0, r4, #0
	movs r1, #0x64
	bl func_0805B4E8
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl func_0805BA1C
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl func_0805BA1C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl func_080729A4
.L080657A4:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne .L080657B6
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	b .L080657CC
.L080657B6:
	cmp r0, #0xa5
	bne .L080657CC
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
.L080657CC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08065724

	THUMB_FUNC_START StartSpellAnimIvaldi
StartSpellAnimIvaldi: @ 0x080657D4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0806580C  @ gUnknown_085D7688
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0806580C: .4byte gUnknown_085D7688

	THUMB_FUNC_END StartSpellAnimIvaldi

	THUMB_FUNC_START Loop6C_efxIvaldi
Loop6C_efxIvaldi: @ 0x08065810
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r4, r0, #0
	movs r7, #0x3e
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0806583E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L0806583E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne .L0806584E
	bl PrepareSomeIvaldiParticleGraphics
	b .L080659A4
.L0806584E:
	adds r0, r4, #0
	adds r0, #0xb
	cmp r1, r0
	bne .L08065860
	adds r0, r5, #0
	movs r1, #0x1a
	bl StartSpellOBJ_IvaldiSideWash
	b .L080659A4
.L08065860:
	adds r3, r4, #0
	adds r3, #0x14
	cmp r1, r3
	bne .L08065888
	ldr r0, .L08065884  @ 0x000003D3
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG1
	b .L080659A4
	.align 2, 0
.L08065884: .4byte 0x000003D3
.L08065888:
	adds r0, r4, #0
	adds r0, #0x49
	cmp r1, r0
	bne .L080658AC
	movs r0, #0xf5
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG2
	b .L080659A4
.L080658AC:
	adds r0, r4, #0
	adds r0, #0x76
	cmp r1, r0
	bne .L080658BC
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG3
	b .L080659A4
.L080658BC:
	adds r0, r4, #0
	adds r0, #0x7c
	cmp r1, r0
	bne .L080658CE
	adds r0, r5, #0
	movs r1, #0x46
	bl StartSpellOBJ_IvaldiFall
	b .L080659A4
.L080658CE:
	adds r0, r4, #0
	adds r0, #0xc6
	cmp r1, r0
	bne .L08065902
	movs r0, #0
	str r0, [sp]
	movs r0, #1
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
	adds r0, r5, #0
	movs r1, #0x3c
	movs r2, #0x1e
	bl func_08066470
	b .L080659A4
.L08065902:
	adds r0, r7, #0
	adds r0, #0xc4
	adds r0, r4, r0
	cmp r1, r0
	bne .L0806592A
	adds r0, r5, #0
	movs r1, #0x78
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG4
	b .L080659A4
.L0806592A:
	ldr r2, .L0806595C  @ 0x00000107
	adds r0, r4, r2
	cmp r1, r0
	bne .L08065960
	adds r0, r5, #0
	movs r1, #0x5c
	bl func_08066060
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080659A4
	adds r0, r5, #0
	bl func_08072450
	b .L080659A4
	.align 2, 0
.L0806595C: .4byte 0x00000107
.L08065960:
	movs r0, #0xc4
	adds r2, r7, r0
	adds r0, r2, r3
	cmp r1, r0
	beq .L08065982
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #0
	adds r0, #0x52
	adds r0, r2, r0
	cmp r1, r0
	beq .L08065982
	adds r0, r4, #0
	adds r0, #0x5e
	adds r0, r2, r0
	cmp r1, r0
	bne .L0806598C
.L08065982:
	adds r0, r5, #0
	movs r1, #2
	bl StartEfxFlashBG
	b .L080659A4
.L0806598C:
	adds r0, r4, #0
	adds r0, #0x64
	adds r0, r2, r0
	cmp r1, r0
	bne .L080659A4
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r6, #0
	bl Proc_Break
.L080659A4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_efxIvaldi

	THUMB_FUNC_START StartSpellBG_IvaldiBG1
StartSpellBG_IvaldiBG1: @ 0x080659AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080659F8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080659FC  @ gUnknown_085D76A0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08065A00  @ gUnknown_080DE4E6
	str r1, [r0, #0x48]
	ldr r1, .L08065A04  @ gUnknown_085D76B8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08065A08  @ gUnknown_086937C0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08065A0C  @ gUnknown_086945C4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080659F8: .4byte gUnknown_0201774C
.L080659FC: .4byte gUnknown_085D76A0
.L08065A00: .4byte gUnknown_080DE4E6
.L08065A04: .4byte gUnknown_085D76B8
.L08065A08: .4byte gUnknown_086937C0
.L08065A0C: .4byte gUnknown_086945C4

	THUMB_FUNC_END StartSpellBG_IvaldiBG1

	THUMB_FUNC_START Loop6C_efxIvaldiBG1
Loop6C_efxIvaldiBG1: @ 0x08065A10
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetOpponentFrontAIS
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl SpellFx_InterpretBgAnimScript
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	cmp r2, #0
	blt .L08065A56
	ldr r1, [r5, #0x4c]
	ldr r3, [r5, #0x50]
	ldr r0, [r5, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08065A74
.L08065A56:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L08065A74
	bl SpellFx_ClearBg1
	ldr r1, .L08065A7C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r5, #0
	bl Proc_Break
.L08065A74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08065A7C: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxIvaldiBG1

	THUMB_FUNC_START StartSpellBG_IvaldiBG2
StartSpellBG_IvaldiBG2: @ 0x08065A80
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L08065AD4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065AD8  @ gUnknown_085D76E8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, .L08065ADC  @ gUnknown_080DE526
	str r0, [r4, #0x48]
	ldr r0, .L08065AE0  @ gUnknown_085D7700
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, .L08065AE4  @ gUnknown_08695B10
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08065AE8  @ gUnknown_08696840
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08065AD4: .4byte gUnknown_0201774C
.L08065AD8: .4byte gUnknown_085D76E8
.L08065ADC: .4byte gUnknown_080DE526
.L08065AE0: .4byte gUnknown_085D7700
.L08065AE4: .4byte gUnknown_08695B10
.L08065AE8: .4byte gUnknown_08696840

	THUMB_FUNC_END StartSpellBG_IvaldiBG2

	THUMB_FUNC_START Loop6C_efxIvaldiBG2
Loop6C_efxIvaldiBG2: @ 0x08065AEC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl SpellFx_InterpretBgAnimScript
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	cmp r2, #0
	blt .L08065B2A
	ldr r1, [r5, #0x4c]
	ldr r3, [r5, #0x50]
	ldr r0, [r5, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b .L08065B48
.L08065B2A:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L08065B48
	bl SpellFx_ClearBg1
	ldr r1, .L08065B50  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r5, #0
	bl Proc_Break
.L08065B48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08065B50: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxIvaldiBG2

	THUMB_FUNC_START StartSpellBG_IvaldiBG3
StartSpellBG_IvaldiBG3: @ 0x08065B54
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_ClearBg1
	bl SpellFx_EndBlend
	ldr r1, .L08065BA0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065BA4  @ gUnknown_085D7714
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08065BA8  @ gUnknown_080DE552
	str r1, [r0, #0x48]
	ldr r1, .L08065BAC  @ gUnknown_085D772C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08065BB0  @ gUnknown_085D7758
	str r1, [r0, #0x54]
	ldr r1, .L08065BB4  @ gUnknown_085D7784
	str r1, [r0, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08065BA0: .4byte gUnknown_0201774C
.L08065BA4: .4byte gUnknown_085D7714
.L08065BA8: .4byte gUnknown_080DE552
.L08065BAC: .4byte gUnknown_085D772C
.L08065BB0: .4byte gUnknown_085D7758
.L08065BB4: .4byte gUnknown_085D7784

	THUMB_FUNC_END StartSpellBG_IvaldiBG3

	THUMB_FUNC_START Loop6C_efxIvaldiBG3
Loop6C_efxIvaldiBG3: @ 0x08065BB8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0
	blt .L08065C10
	ldr r1, [r7, #0x4c]
	ldr r2, [r7, #0x50]
	ldr r5, [r7, #0x54]
	ldr r6, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08065C2E
.L08065C10:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L08065C2E
	bl SpellFx_ClearBg1
	ldr r1, .L08065C34  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_Break
.L08065C2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08065C34: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxIvaldiBG3

	THUMB_FUNC_START StartSpellBG_IvaldiBG4
StartSpellBG_IvaldiBG4: @ 0x08065C38
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08065C88  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065C8C  @ gUnknown_085D77B0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	str r1, [r0, #0x44]
	ldr r1, .L08065C90  @ gUnknown_080DE58E
	str r1, [r0, #0x48]
	ldr r1, .L08065C94  @ gUnknown_085D77C8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, .L08065C98  @ gUnknown_086A06A8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, .L08065C9C  @ gUnknown_086A1CE0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08065C88: .4byte gUnknown_0201774C
.L08065C8C: .4byte gUnknown_085D77B0
.L08065C90: .4byte gUnknown_080DE58E
.L08065C94: .4byte gUnknown_085D77C8
.L08065C98: .4byte gUnknown_086A06A8
.L08065C9C: .4byte gUnknown_086A1CE0

	THUMB_FUNC_END StartSpellBG_IvaldiBG4

	THUMB_FUNC_START func_08065CA0
func_08065CA0: @ 0x08065CA0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x3c]
	adds r0, #0x18
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl SpellFx_InterpretBgAnimScript
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r1, [r5, #0x34]
	ldrh r2, [r5, #0x3c]
	movs r0, #1
	bl SetBgOffset
	movs r0, #2
	bl EnableBgSync
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0
	blt .L08065D58
	ldr r2, [r5, #0x4c]
	ldr r1, [r5, #0x50]
	ldr r0, .L08065CF8  @ gBattleAnimSceneLayoutEnum
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne .L08065D00
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, .L08065CFC  @ gUnknown_02019790
	bl LZ77UnCompWram
	b .L08065D0C
	.align 2, 0
.L08065CF8: .4byte gBattleAnimSceneLayoutEnum
.L08065CFC: .4byte gUnknown_02019790
.L08065D00:
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, .L08065D30  @ gUnknown_02019790
	bl LZ77UnCompWram
.L08065D0C:
	ldr r4, .L08065D30  @ gUnknown_02019790
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08065D38
	ldr r1, .L08065D34  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl func_08070EC4
	b .L08065D4C
	.align 2, 0
.L08065D30: .4byte gUnknown_02019790
.L08065D34: .4byte gBg1Tm
.L08065D38:
	ldr r1, .L08065D54  @ gBg1Tm
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl func_08070E94
.L08065D4C:
	movs r0, #2
	bl EnableBgSync
	b .L08065D76
	.align 2, 0
.L08065D54: .4byte gBg1Tm
.L08065D58:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L08065D76
	bl SpellFx_ClearBg1
	ldr r1, .L08065D80  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r5, #0
	bl Proc_Break
.L08065D76:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08065D80: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08065CA0

	THUMB_FUNC_START PrepareSomeIvaldiParticleGraphics
PrepareSomeIvaldiParticleGraphics: @ 0x08065D84
	push {lr}
	ldr r0, .L08065D9C  @ gUnknown_08692B10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08065DA0  @ gUnknown_086926E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r0}
	bx r0
	.align 2, 0
.L08065D9C: .4byte gUnknown_08692B10
.L08065DA0: .4byte gUnknown_086926E0

	THUMB_FUNC_END PrepareSomeIvaldiParticleGraphics

	THUMB_FUNC_START StartSpellOBJ_IvaldiFall
StartSpellOBJ_IvaldiFall: @ 0x08065DA4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetAISSubjectId
	ldr r0, .L08065DE8  @ gUnknown_08692B10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08065DEC  @ gUnknown_086926E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r1, .L08065DF0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065DF4  @ gUnknown_085D77CC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08065DE8: .4byte gUnknown_08692B10
.L08065DEC: .4byte gUnknown_086926E0
.L08065DF0: .4byte gUnknown_0201774C
.L08065DF4: .4byte gUnknown_085D77CC

	THUMB_FUNC_END StartSpellOBJ_IvaldiFall

	THUMB_FUNC_START func_08065DF8
func_08065DF8: @ 0x08065DF8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bne .L08065E18
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x98
	b .L08065E26
.L08065E18:
	cmp r0, #0xd
	bne .L08065E2E
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x30
.L08065E26:
	movs r3, #0x54
	bl func_08066258
	b .L08065EEA
.L08065E2E:
	cmp r0, #0x13
	bne .L08065E44
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xbc
	movs r3, #0x6a
	bl func_08066258
	b .L08065EEA
.L08065E44:
	cmp r0, #0x19
	bne .L08065E54
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x68
	b .L08065EA4
.L08065E54:
	cmp r0, #0x1f
	bne .L08065E6A
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x24
	movs r3, #0x66
	bl func_08066258
	b .L08065EEA
.L08065E6A:
	cmp r0, #0x25
	bne .L08065E80
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xb0
	movs r3, #0x61
	bl func_08066258
	b .L08065EEA
.L08065E80:
	cmp r0, #0x2b
	bne .L08065E96
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x38
	movs r3, #0x64
	bl func_08066258
	b .L08065EEA
.L08065E96:
	cmp r0, #0x31
	bne .L08065EAC
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x9e
.L08065EA4:
	movs r3, #0x67
	bl func_08066258
	b .L08065EEA
.L08065EAC:
	cmp r0, #0x37
	bne .L08065EBC
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x42
	b .L08065ECA
.L08065EBC:
	cmp r0, #0x3d
	bne .L08065ED2
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xe6
.L08065ECA:
	movs r3, #0x5c
	bl func_08066258
	b .L08065EEA
.L08065ED2:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x43
	bne .L08065EEA
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x68
	movs r3, #0x6c
	bl func_08066258
.L08065EEA:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne .L08065F04
	ldr r1, .L08065F0C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08065F04:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08065F0C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08065DF8

	THUMB_FUNC_START StartSpellOBJ_IvaldiSideWash
StartSpellOBJ_IvaldiSideWash: @ 0x08065F10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetAISSubjectId
	ldr r0, .L08065F54  @ gUnknown_08692B10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08065F58  @ gUnknown_086926E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r1, .L08065F5C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08065F60  @ gUnknown_085D77E4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08065F54: .4byte gUnknown_08692B10
.L08065F58: .4byte gUnknown_086926E0
.L08065F5C: .4byte gUnknown_0201774C
.L08065F60: .4byte gUnknown_085D77E4

	THUMB_FUNC_END StartSpellOBJ_IvaldiSideWash

	THUMB_FUNC_START Loop6C_efxIvaldiOBJSideWash
Loop6C_efxIvaldiOBJSideWash: @ 0x08065F64
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne .L08065F90
	ldr r0, [r4, #0x5c]
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0xc
	bl func_08066258
	b .L08066052
.L08065F90:
	cmp r1, #3
	bne .L08065FA6
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0x5f
	bl func_08066258
	b .L08066052
.L08065FA6:
	cmp r1, #6
	bne .L08065FBC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x78
	movs r3, #0x24
	bl func_08066258
	b .L08066052
.L08065FBC:
	cmp r1, #9
	bne .L08065FD2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x64
	movs r3, #0xa
	bl func_08066258
	b .L08066052
.L08065FD2:
	cmp r1, #0xc
	bne .L08065FE6
	ldr r0, [r4, #0x5c]
	str r2, [sp]
	movs r1, #0x1a
	movs r2, #0x5e
	movs r3, #0x36
	bl func_08066258
	b .L08066052
.L08065FE6:
	cmp r1, #0xf
	bne .L08065FFC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x64
	movs r3, #0x30
	bl func_08066258
	b .L08066052
.L08065FFC:
	cmp r1, #0x12
	bne .L08066010
	ldr r0, [r4, #0x5c]
	str r2, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0x66
	bl func_08066258
	b .L08066052
.L08066010:
	cmp r1, #0x15
	bne .L08066026
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x60
	movs r3, #0x10
	bl func_08066258
	b .L08066052
.L08066026:
	cmp r1, #0x18
	bne .L0806603C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x80
	movs r3, #0x50
	bl func_08066258
	b .L08066052
.L0806603C:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne .L08066052
	ldr r1, .L0806605C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08066052:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0806605C: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxIvaldiOBJSideWash

	THUMB_FUNC_START func_08066060
func_08066060: @ 0x08066060
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetAISSubjectId
	ldr r0, .L080660A4  @ gUnknown_08692B10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080660A8  @ gUnknown_086926E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r1, .L080660AC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080660B0  @ gUnknown_085D77FC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080660A4: .4byte gUnknown_08692B10
.L080660A8: .4byte gUnknown_086926E0
.L080660AC: .4byte gUnknown_0201774C
.L080660B0: .4byte gUnknown_085D77FC

	THUMB_FUNC_END func_08066060

	THUMB_FUNC_START func_080660B4
func_080660B4: @ 0x080660B4
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne .L080660D6
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xc8
	b .L08066218
.L080660D6:
	cmp r0, #0xa
	bne .L080660EC
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x43
	movs r3, #0x5b
	bl func_08066390
	b .L0806624C
.L080660EC:
	cmp r0, #0xf
	bne .L08066102
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xd
	movs r3, #0x59
	bl func_08066390
	b .L0806624C
.L08066102:
	cmp r0, #0x14
	bne .L08066118
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xcb
	movs r3, #0x4c
	bl func_08066390
	b .L0806624C
.L08066118:
	cmp r0, #0x19
	bne .L0806612E
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xdf
	movs r3, #2
	bl func_08066390
	b .L0806624C
.L0806612E:
	cmp r0, #0x1e
	bne .L08066144
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xe
	movs r3, #0x6f
	bl func_08066390
	b .L0806624C
.L08066144:
	cmp r0, #0x23
	bne .L0806615A
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xe0
	movs r3, #0x6c
	bl func_08066390
	b .L0806624C
.L0806615A:
	cmp r0, #0x28
	bne .L0806616C
	ldr r0, [r2, #0x5c]
	movs r2, #0xb8
	lsls r2, r2, #1
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	b .L08066218
.L0806616C:
	cmp r0, #0x2d
	bne .L08066180
	ldr r0, [r2, #0x5c]
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x3a
	movs r3, #0x2d
	bl func_08066390
	b .L0806624C
.L08066180:
	cmp r0, #0x32
	bne .L0806618E
	ldr r0, [r2, #0x5c]
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x7f
	b .L080661E2
.L0806618E:
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	cmp r1, #0x37
	bne .L080661A8
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa3
	movs r3, #0x14
	bl func_08066390
	b .L0806624C
.L080661A8:
	cmp r1, #0x3c
	bne .L080661BE
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa7
	movs r3, #0x3e
	bl func_08066390
	b .L0806624C
.L080661BE:
	cmp r1, #0x41
	bne .L080661D4
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x38
	movs r3, #0x60
	bl func_08066390
	b .L0806624C
.L080661D4:
	cmp r1, #0x46
	bne .L080661EA
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x80
.L080661E2:
	movs r3, #0x42
	bl func_08066390
	b .L0806624C
.L080661EA:
	cmp r1, #0x4b
	bne .L080661FA
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x38
	b .L08066218
.L080661FA:
	cmp r1, #0x50
	bne .L0806620A
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa8
	b .L08066218
.L0806620A:
	cmp r1, #0x55
	bne .L08066220
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa4
.L08066218:
	movs r3, #0x70
	bl func_08066390
	b .L0806624C
.L08066220:
	cmp r1, #0x5a
	bne .L08066236
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x41
	movs r3, #0x78
	bl func_08066390
	b .L0806624C
.L08066236:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne .L0806624C
	ldr r1, .L08066254  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
.L0806624C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08066254: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080660B4

	THUMB_FUNC_START func_08066258
func_08066258: @ 0x08066258
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	mov r8, r1
	ldr r0, [sp, #0x54]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	add r1, sp, #4
	ldr r0, .L080662C8  @ gUnknown_080DE5E4
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, .L080662CC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080662D0  @ gUnknown_085D7814
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	mov r0, r8
	strh r0, [r7, #0x2e]
	cmp r5, #5
	bhi .L08066318
	lsls r0, r5, #2
	ldr r1, .L080662D4  @ .L080662D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080662C8: .4byte gUnknown_080DE5E4
.L080662CC: .4byte gUnknown_0201774C
.L080662D0: .4byte gUnknown_085D7814
.L080662D4: .4byte .L080662D8
.L080662D8: @ jump table
	.4byte .L08066318 @ case 0
	.4byte .L080662F0 @ case 1
	.4byte .L080662F8 @ case 2
	.4byte .L08066300 @ case 3
	.4byte .L08066308 @ case 4
	.4byte .L08066310 @ case 5
.L080662F0:
	lsls r1, r6, #2
	add r0, sp, #0xc
	adds r0, r0, r1
	b .L0806631E
.L080662F8:
	lsls r1, r6, #2
	add r0, sp, #0x14
	adds r0, r0, r1
	b .L0806631E
.L08066300:
	lsls r1, r6, #2
	add r0, sp, #0x1c
	adds r0, r0, r1
	b .L0806631E
.L08066308:
	lsls r1, r6, #2
	add r0, sp, #0x24
	adds r0, r0, r1
	b .L0806631E
.L08066310:
	lsls r1, r6, #2
	add r0, sp, #0x2c
	adds r0, r0, r1
	b .L0806631E
.L08066318:
	lsls r0, r6, #2
	add r0, sp
	adds r0, #4
.L0806631E:
	ldr r3, [r0]
	ldr r0, [r7, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r7, #0x60]
	mov r1, sl
	strh r1, [r0, #2]
	mov r2, r9
	strh r2, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, .L08066358  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08066358: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08066258

	THUMB_FUNC_START func_0806635C
func_0806635C: @ 0x0806635C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08066386
	ldr r0, .L0806638C  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08066386:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0806638C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806635C

	THUMB_FUNC_START func_08066390
func_08066390: @ 0x08066390
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov r9, r1
	ldr r0, [sp, #0x28]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L080663E8  @ gUnknown_080DE624
	ldr r6, [r0]
	ldr r7, [r0, #4]
	ldr r1, .L080663EC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080663F0  @ gUnknown_085D782C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	mov r0, r8
	bl GetOpponentFrontAIS
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	mov r0, r9
	strh r0, [r5, #0x2e]
	cmp r4, #0
	beq .L080663E2
	cmp r4, #1
	beq .L080663F4
.L080663E2:
	adds r3, r6, #0
	b .L080663F6
	.align 2, 0
.L080663E8: .4byte gUnknown_080DE624
.L080663EC: .4byte gUnknown_0201774C
.L080663F0: .4byte gUnknown_085D782C
.L080663F4:
	adds r3, r7, #0
.L080663F6:
	ldr r0, [r5, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r5, #0x60]
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0, #2]
	mov r2, sl
	strh r2, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, .L08066430  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08066430: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08066390

	THUMB_FUNC_START func_08066434
func_08066434: @ 0x08066434
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #4]
	subs r0, #0x10
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08066466
	ldr r0, .L0806646C  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08066466:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0806646C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08066434

	THUMB_FUNC_START func_08066470
func_08066470: @ 0x08066470
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, .L080664A0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080664A4  @ gUnknown_085D7844
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	adds r0, r4, #0
	adds r1, r6, #0
	bl StartEfxFlashBG
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080664A0: .4byte gUnknown_0201774C
.L080664A4: .4byte gUnknown_085D7844

	THUMB_FUNC_END func_08066470

	THUMB_FUNC_START func_080664A8
func_080664A8: @ 0x080664A8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L08066508  @ gPal
	ldr r4, .L0806650C  @ gUnknown_020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl ApplyFlashingPaletteAnimation
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble .L080664FE
	ldr r1, .L08066510  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L080664FE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08066508: .4byte gPal
.L0806650C: .4byte gUnknown_020165C8
.L08066510: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080664A8

	THUMB_FUNC_START func_08066514
func_08066514: @ 0x08066514
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0806654C  @ gUnknown_085D785C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0806654C: .4byte gUnknown_085D785C

	THUMB_FUNC_END func_08066514

	THUMB_FUNC_START func_08066550
func_08066550: @ 0x08066550
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	bl GetSpellAnimationStartFrame
	adds r7, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	cmp r1, #0xff
	beq .L080665EC
	cmp r1, #0xff
	bgt .L08066580
	cmp r1, #0xb
	beq .L08066594
	cmp r1, #0xb1
	beq .L080665E4
	b .L08066636
.L08066580:
	ldr r0, .L08066590  @ 0x00000109
	cmp r1, r0
	beq .L0806660A
	adds r0, #0x24
	cmp r1, r0
	beq .L08066624
	b .L08066636
	.align 2, 0
.L08066590: .4byte 0x00000109
.L08066594:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl func_0805BA1C
	adds r0, r4, #0
	movs r1, #0xa6
	movs r2, #1
	bl func_0805B93C
	adds r0, r4, #0
	movs r1, #0xa6
	bl func_0805B4E8
	adds r0, r4, #0
	bl func_080666D0
	ldr r0, .L080665E0  @ 0x000003B2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl func_080729A4
	b .L08066636
	.align 2, 0
.L080665E0: .4byte 0x000003B2
.L080665E4:
	adds r0, r4, #0
	bl func_08066914
	b .L08066636
.L080665EC:
	bl func_08066C98
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xad
	movs r3, #0x2c
	bl func_08066CB8
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x9f
	movs r3, #0x30
	bl func_08066DB0
	b .L08066636
.L0806660A:
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #1
	bl func_0805B93C
	adds r0, r4, #0
	movs r1, #0x22
	bl func_0805B4E8
	adds r0, r4, #0
	bl func_08066A0C
	b .L08066636
.L08066624:
	adds r0, r4, #0
	movs r1, #4
	bl StartEfxFlashBG
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L08066636:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	ldr r2, .L08066694  @ 0x00000133
	adds r0, r7, r2
	cmp r1, r0
	bne .L080666A6
	ldrh r1, [r4, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r5, r6, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r5]
	cmp r0, #0
	bne .L0806669C
	adds r0, r4, #0
	bl func_08072450
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r4, #0
	bl func_080667E0
	adds r0, r4, #0
	bl func_08066BD4
	adds r0, r4, #0
	movs r1, #0x4a
	bl func_080671F4
	ldr r0, .L08066698  @ 0x000003B3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl func_080729A4
	b .L080666C4
	.align 2, 0
.L08066694: .4byte 0x00000133
.L08066698: .4byte 0x000003B3
.L0806669C:
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r0, [r6, #0x2c]
	b .L080666C4
.L080666A6:
	ldr r2, .L080666CC  @ 0x000001C9
	adds r0, r7, r2
	cmp r1, r0
	bne .L080666C4
	ldrh r1, [r4, #0x10]
	movs r0, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r6, #0
	bl Proc_Break
.L080666C4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080666CC: .4byte 0x000001C9

	THUMB_FUNC_END func_08066550

	THUMB_FUNC_START func_080666D0
func_080666D0: @ 0x080666D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0806670C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066710  @ gUnknown_085D7874
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L08066714  @ gUnknown_080DE65C
	str r0, [r1, #0x48]
	ldr r0, .L08066718  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq .L08066728
	ldr r0, .L0806671C  @ gUnknown_085D7A0C
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, .L08066720  @ gUnknown_085D7A8C
	str r0, [r1, #0x54]
	ldr r0, .L08066724  @ gUnknown_085D7B0C
	b .L08066734
	.align 2, 0
.L0806670C: .4byte gUnknown_0201774C
.L08066710: .4byte gUnknown_085D7874
.L08066714: .4byte gUnknown_080DE65C
.L08066718: .4byte gBattleAnimSceneLayoutEnum
.L0806671C: .4byte gUnknown_085D7A0C
.L08066720: .4byte gUnknown_085D7A8C
.L08066724: .4byte gUnknown_085D7B0C
.L08066728:
	ldr r0, .L0806674C  @ gUnknown_085D788C
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, .L08066750  @ gUnknown_085D790C
	str r0, [r1, #0x54]
	ldr r0, .L08066754  @ gUnknown_085D798C
.L08066734:
	str r0, [r1, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0806674C: .4byte gUnknown_085D788C
.L08066750: .4byte gUnknown_085D790C
.L08066754: .4byte gUnknown_085D798C

	THUMB_FUNC_END func_080666D0

	THUMB_FUNC_START func_08066758
func_08066758: @ 0x08066758
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	bl GetOpponentFrontAIS
	adds r0, r7, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0
	blt .L080667B8
	ldr r1, [r7, #0x4c]
	ldr r2, [r7, #0x50]
	ldr r5, [r7, #0x54]
	ldr r6, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080667D6
.L080667B8:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L080667D6
	bl SpellFx_ClearBg1
	ldr r1, .L080667DC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_Break
.L080667D6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080667DC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08066758

	THUMB_FUNC_START func_080667E0
func_080667E0: @ 0x080667E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08066824  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066828  @ gUnknown_085D7B8C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0806682C  @ gUnknown_080DE6F0
	str r1, [r0, #0x48]
	ldr r1, .L08066830  @ gUnknown_085D7BA4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08066834  @ gUnknown_085D7BB0
	str r1, [r0, #0x54]
	ldr r1, .L08066838  @ gUnknown_085D7BBC
	str r1, [r0, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08066824: .4byte gUnknown_0201774C
.L08066828: .4byte gUnknown_085D7B8C
.L0806682C: .4byte gUnknown_080DE6F0
.L08066830: .4byte gUnknown_085D7BA4
.L08066834: .4byte gUnknown_085D7BB0
.L08066838: .4byte gUnknown_085D7BBC

	THUMB_FUNC_END func_080667E0

	THUMB_FUNC_START func_0806683C
func_0806683C: @ 0x0806683C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, .L08066868  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L0806686C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b .L08066876
	.align 2, 0
.L08066868: .4byte gBattleAnimSceneLayoutEnum
.L0806686C:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08066876:
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080668B2
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r6, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	bl func_080668DC
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080668D0
.L080668B2:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L080668D0
	bl SpellFx_ClearBg1
	ldr r1, .L080668D8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L080668D0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080668D8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806683C

	THUMB_FUNC_START func_080668DC
func_080668DC: @ 0x080668DC
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, .L08066910  @ gBg1Tm
.L080668E2:
	movs r3, #0
	lsls r0, r1, #5
	adds r4, r1, #1
	adds r1, r0, #0
	adds r1, #0x1d
	adds r0, #0x1c
	lsls r0, r0, #1
	adds r2, r0, r5
	lsls r1, r1, #1
	adds r1, r1, r5
.L080668F6:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	cmp r3, #2
	ble .L080668F6
	adds r1, r4, #0
	cmp r1, #0xf
	ble .L080668E2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08066910: .4byte gBg1Tm

	THUMB_FUNC_END func_080668DC

	THUMB_FUNC_START func_08066914
func_08066914: @ 0x08066914
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08066950  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066954  @ gUnknown_085D7BC8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L08066958  @ gUnknown_080DE710
	str r0, [r1, #0x48]
	ldr r0, .L0806695C  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq .L0806696C
	ldr r0, .L08066960  @ gUnknown_085D7C1C
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, .L08066964  @ gUnknown_085D7C30
	str r0, [r1, #0x54]
	ldr r0, .L08066968  @ gUnknown_085D7C44
	b .L08066978
	.align 2, 0
.L08066950: .4byte gUnknown_0201774C
.L08066954: .4byte gUnknown_085D7BC8
.L08066958: .4byte gUnknown_080DE710
.L0806695C: .4byte gBattleAnimSceneLayoutEnum
.L08066960: .4byte gUnknown_085D7C1C
.L08066964: .4byte gUnknown_085D7C30
.L08066968: .4byte gUnknown_085D7C44
.L0806696C:
	ldr r0, .L08066990  @ gUnknown_085D7BE0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, .L08066994  @ gUnknown_085D7BF4
	str r0, [r1, #0x54]
	ldr r0, .L08066998  @ gUnknown_085D7C08
.L08066978:
	str r0, [r1, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08066990: .4byte gUnknown_085D7BE0
.L08066994: .4byte gUnknown_085D7BF4
.L08066998: .4byte gUnknown_085D7C08

	THUMB_FUNC_END func_08066914

	THUMB_FUNC_START func_0806699C
func_0806699C: @ 0x0806699C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080669E4
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r6, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08066A02
.L080669E4:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L08066A02
	bl SpellFx_ClearBg1
	ldr r1, .L08066A08  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L08066A02:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08066A08: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806699C

	THUMB_FUNC_START func_08066A0C
func_08066A0C: @ 0x08066A0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08066A48  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066A4C  @ gUnknown_085D7C58
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, .L08066A50  @ gUnknown_080DE748
	str r0, [r1, #0x48]
	ldr r0, .L08066A54  @ gBattleAnimSceneLayoutEnum
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq .L08066A64
	ldr r0, .L08066A58  @ gUnknown_085D7CD0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, .L08066A5C  @ gUnknown_085D7CF0
	str r0, [r1, #0x54]
	ldr r0, .L08066A60  @ gUnknown_085D7D10
	b .L08066A70
	.align 2, 0
.L08066A48: .4byte gUnknown_0201774C
.L08066A4C: .4byte gUnknown_085D7C58
.L08066A50: .4byte gUnknown_080DE748
.L08066A54: .4byte gBattleAnimSceneLayoutEnum
.L08066A58: .4byte gUnknown_085D7CD0
.L08066A5C: .4byte gUnknown_085D7CF0
.L08066A60: .4byte gUnknown_085D7D10
.L08066A64:
	ldr r0, .L08066A88  @ gUnknown_085D7C70
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, .L08066A8C  @ gUnknown_085D7C90
	str r0, [r1, #0x54]
	ldr r0, .L08066A90  @ gUnknown_085D7CB0
.L08066A70:
	str r0, [r1, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08066A88: .4byte gUnknown_085D7C70
.L08066A8C: .4byte gUnknown_085D7C90
.L08066A90: .4byte gUnknown_085D7CB0

	THUMB_FUNC_END func_08066A0C

	THUMB_FUNC_START func_08066A94
func_08066A94: @ 0x08066A94
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0
	blt .L08066AEC
	ldr r1, [r7, #0x4c]
	ldr r2, [r7, #0x50]
	ldr r5, [r7, #0x54]
	ldr r6, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08066B0A
.L08066AEC:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L08066B0A
	bl SpellFx_ClearBg1
	ldr r1, .L08066B10  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_Break
.L08066B0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08066B10: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08066A94

	THUMB_FUNC_START func_08066B14
func_08066B14: @ 0x08066B14
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	ldr r1, .L08066B38  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066B3C  @ gUnknown_085D7D30
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08066B38: .4byte gUnknown_0201774C
.L08066B3C: .4byte gUnknown_085D7D30

	THUMB_FUNC_END func_08066B14

	THUMB_FUNC_START func_08066B40
func_08066B40: @ 0x08066B40
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, .L08066BB4  @ gPal
	ldr r4, .L08066BB8  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl ApplyFlashingPaletteAnimation
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble .L08066BAA
	ldr r0, [r7, #0x5c]
	movs r1, #0
	movs r2, #0x20
	bl func_08054134
	adds r0, r7, #0
	bl Proc_Break
.L08066BAA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08066BB4: .4byte gPal
.L08066BB8: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_08066B40

	THUMB_FUNC_START func_08066BBC
func_08066BBC: @ 0x08066BBC
	push {lr}
	ldr r2, .L08066BD0  @ gUnknown_0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
.L08066BD0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08066BBC

	THUMB_FUNC_START func_08066BD4
func_08066BD4: @ 0x08066BD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08066C08  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066C0C  @ gUnknown_085D7D58
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x32]
	str r1, [r0, #0x44]
	ldr r1, .L08066C10  @ gUnknown_080DE792
	str r1, [r0, #0x48]
	ldr r1, .L08066C14  @ gUnknown_087F3C54
	str r1, [r0, #0x4c]
	ldr r0, .L08066C18  @ gUnknown_08603B50
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08066C08: .4byte gUnknown_0201774C
.L08066C0C: .4byte gUnknown_085D7D58
.L08066C10: .4byte gUnknown_080DE792
.L08066C14: .4byte gUnknown_087F3C54
.L08066C18: .4byte gUnknown_08603B50

	THUMB_FUNC_END func_08066BD4

	THUMB_FUNC_START func_08066C1C
func_08066C1C: @ 0x08066C1C
	push {r4, lr}
	sub sp, #0x20
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08066C50
	ldr r0, .L08066C4C  @ gUnknown_087F3C54
	subs r2, #4
	mov r1, sp
	bl func_08077FC8
	mov r0, sp
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08066C66
	.align 2, 0
.L08066C4C: .4byte gUnknown_087F3C54
.L08066C50:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L08066C66
	ldr r1, .L08066C70  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08066C66:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08066C70: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08066C1C

	THUMB_FUNC_START func_08066C74
func_08066C74: @ 0x08066C74
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08066C94  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0
	cmp r0, #0
	bne .L08066C86
	movs r1, #0x18
.L08066C86:
	cmp r2, #0
	bne .L08066C8C
	negs r1, r1
.L08066C8C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
.L08066C94: .4byte gBattleAnimSceneLayoutEnum

	THUMB_FUNC_END func_08066C74

	THUMB_FUNC_START func_08066C98
func_08066C98: @ 0x08066C98
	push {lr}
	ldr r0, .L08066CB0  @ gUnknown_087A574C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08066CB4  @ gUnknown_087A5390
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r0}
	bx r0
	.align 2, 0
.L08066CB0: .4byte gUnknown_087A574C
.L08066CB4: .4byte gUnknown_087A5390

	THUMB_FUNC_END func_08066C98

	THUMB_FUNC_START func_08066CB8
func_08066CB8: @ 0x08066CB8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	ldr r0, .L08066D34  @ gUnknown_080DE8A0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, .L08066D38  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066D3C  @ gUnknown_085D7D78
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r6, #0x5c]
	movs r1, #0
	strh r1, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	lsls r1, r7, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r5, r4, #0
	cmp r7, #0
	beq .L08066D40
	adds r0, r7, #0
	bl func_08066C74
	adds r0, #0xf0
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	b .L08066D4E
	.align 2, 0
.L08066D34: .4byte gUnknown_080DE8A0
.L08066D38: .4byte gUnknown_0201774C
.L08066D3C: .4byte gUnknown_085D7D78
.L08066D40:
	movs r0, #0
	bl func_08066C74
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, r0
.L08066D4E:
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [r6, #0x60]
	mov r1, r9
	strh r1, [r4, #4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #8]
	ldr r0, .L08066D78  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08066D78: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08066CB8

	THUMB_FUNC_START func_08066D7C
func_08066D7C: @ 0x08066D7C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08066DA6
	ldr r0, .L08066DAC  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08066DA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08066DAC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08066D7C

	THUMB_FUNC_START func_08066DB0
func_08066DB0: @ 0x08066DB0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	ldr r0, .L08066E2C  @ gUnknown_080DE8C0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, .L08066E30  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066E34  @ gUnknown_085D7D90
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r6, #0x5c]
	movs r1, #0
	strh r1, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	lsls r1, r7, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r5, r4, #0
	cmp r7, #0
	beq .L08066E38
	adds r0, r7, #0
	bl func_08066C74
	adds r0, #0xf0
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	b .L08066E46
	.align 2, 0
.L08066E2C: .4byte gUnknown_080DE8C0
.L08066E30: .4byte gUnknown_0201774C
.L08066E34: .4byte gUnknown_085D7D90
.L08066E38:
	movs r0, #0
	bl func_08066C74
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, r0
.L08066E46:
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [r6, #0x60]
	mov r1, r9
	strh r1, [r4, #4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #8]
	ldr r0, .L08066E70  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08066E70: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08066DB0

	THUMB_FUNC_START func_08066E74
func_08066E74: @ 0x08066E74
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08066E9E
	ldr r0, .L08066EA4  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08066E9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08066EA4: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08066E74

	THUMB_FUNC_START func_08066EA8
func_08066EA8: @ 0x08066EA8
	push {lr}
	ldr r0, .L08066EC0  @ gUnknown_087A5118
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08066EC4  @ gUnknown_087A4EEC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r0}
	bx r0
	.align 2, 0
.L08066EC0: .4byte gUnknown_087A5118
.L08066EC4: .4byte gUnknown_087A4EEC

	THUMB_FUNC_END func_08066EA8

	THUMB_FUNC_START func_08066EC8
func_08066EC8: @ 0x08066EC8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	ldr r0, .L08066F48  @ gUnknown_080DE8DC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, .L08066F4C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08066F50  @ gUnknown_085D7DA8
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	lsls r0, r7, #2
	add r0, sp
	adds r0, #4
	ldr r3, [r0]
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r5, r4, #0
	cmp r7, #0
	beq .L08066F54
	adds r0, r7, #0
	bl func_08066C74
	adds r0, #0xf0
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	b .L08066F62
	.align 2, 0
.L08066F48: .4byte gUnknown_080DE8DC
.L08066F4C: .4byte gUnknown_0201774C
.L08066F50: .4byte gUnknown_085D7DA8
.L08066F54:
	movs r0, #0
	bl func_08066C74
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, r0
.L08066F62:
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [r6, #0x60]
	mov r1, r9
	strh r1, [r4, #4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #8]
	ldr r0, .L08066F8C  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08066F8C: .4byte 0x0000F3FF

	THUMB_FUNC_END func_08066EC8

	THUMB_FUNC_START func_08066F90
func_08066F90: @ 0x08066F90
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08066FBA
	ldr r0, .L08066FC0  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08066FBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08066FC0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08066F90

	THUMB_FUNC_START func_08066FC4
func_08066FC4: @ 0x08066FC4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	ldr r0, .L08067044  @ gUnknown_080DE900
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, .L08067048  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0806704C  @ gUnknown_085D7DC0
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	lsls r0, r7, #2
	add r0, sp
	adds r0, #4
	ldr r3, [r0]
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r5, r4, #0
	cmp r7, #0
	beq .L08067050
	adds r0, r7, #0
	bl func_08066C74
	adds r0, #0xf0
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	b .L0806705E
	.align 2, 0
.L08067044: .4byte gUnknown_080DE900
.L08067048: .4byte gUnknown_0201774C
.L0806704C: .4byte gUnknown_085D7DC0
.L08067050:
	movs r0, #0
	bl func_08066C74
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, r0
.L0806705E:
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [r6, #0x60]
	mov r1, r9
	strh r1, [r4, #4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #8]
	ldr r0, .L0806709C  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, .L080670A0  @ gUnknown_087A61EC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080670A4  @ gUnknown_087A5BA4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0806709C: .4byte 0x0000F3FF
.L080670A0: .4byte gUnknown_087A61EC
.L080670A4: .4byte gUnknown_087A5BA4

	THUMB_FUNC_END func_08066FC4

	THUMB_FUNC_START func_080670A8
func_080670A8: @ 0x080670A8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L080670D2
	ldr r0, .L080670D8  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L080670D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080670D8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080670A8

	THUMB_FUNC_START func_080670DC
func_080670DC: @ 0x080670DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	ldr r0, .L0806715C  @ gUnknown_080DE924
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, .L08067160  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08067164  @ gUnknown_085D7DD8
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	lsls r0, r7, #2
	add r0, sp
	adds r0, #4
	ldr r3, [r0]
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r5, r4, #0
	cmp r7, #0
	beq .L08067168
	adds r0, r7, #0
	bl func_08066C74
	adds r0, #0xf0
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	b .L08067176
	.align 2, 0
.L0806715C: .4byte gUnknown_080DE924
.L08067160: .4byte gUnknown_0201774C
.L08067164: .4byte gUnknown_085D7DD8
.L08067168:
	movs r0, #0
	bl func_08066C74
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, r0
.L08067176:
	strh r0, [r4, #2]
	strh r0, [r5, #2]
	ldr r0, [r6, #0x60]
	mov r1, r9
	strh r1, [r4, #4]
	strh r1, [r0, #4]
	ldrh r1, [r4, #8]
	ldr r0, .L080671B4  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, .L080671B8  @ gUnknown_087A61EC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080671BC  @ gUnknown_087A5E9C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080671B4: .4byte 0x0000F3FF
.L080671B8: .4byte gUnknown_087A61EC
.L080671BC: .4byte gUnknown_087A5E9C

	THUMB_FUNC_END func_080670DC

	THUMB_FUNC_START func_080671C0
func_080671C0: @ 0x080671C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L080671EA
	ldr r0, .L080671F0  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L080671EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080671F0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080671C0

	THUMB_FUNC_START func_080671F4
func_080671F4: @ 0x080671F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, .L08067234  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08067238  @ gUnknown_085D7DF0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, .L0806723C  @ gUnknown_087A574C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08067240  @ gUnknown_087A5390
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08067234: .4byte gUnknown_0201774C
.L08067238: .4byte gUnknown_085D7DF0
.L0806723C: .4byte gUnknown_087A574C
.L08067240: .4byte gUnknown_087A5390

	THUMB_FUNC_END func_080671F4

	THUMB_FUNC_START func_08067244
func_08067244: @ 0x08067244
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl func_08066C74
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne .L08067280
	cmp r4, #0
	beq .L08067278
	lsls r0, r2, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xe
	adds r0, r0, r1
	b .L08067362
.L08067278:
	lsls r0, r2, #0x10
	movs r2, #0xb8
	lsls r2, r2, #0x10
	b .L08067360
.L08067280:
	cmp r0, #0xa
	bne .L0806729A
	cmp r4, #0
	beq .L08067292
	lsls r0, r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	b .L0806738E
.L08067292:
	lsls r0, r2, #0x10
	movs r2, #0xd0
	lsls r2, r2, #0x10
	b .L0806738C
.L0806729A:
	cmp r0, #0xe
	bne .L080672B4
	cmp r4, #0
	beq .L080672AC
	lsls r0, r2, #0x10
	movs r1, #0xe0
	lsls r1, r1, #0xc
	adds r0, r0, r1
	b .L080673C0
.L080672AC:
	lsls r0, r2, #0x10
	movs r2, #0xe2
	lsls r2, r2, #0x10
	b .L080673BE
.L080672B4:
	cmp r0, #0x18
	bne .L080672CE
	cmp r4, #0
	beq .L080672C6
	lsls r0, r2, #0x10
	movs r1, #0xc4
	lsls r1, r1, #0xf
	adds r0, r0, r1
	b .L08067336
.L080672C6:
	lsls r0, r2, #0x10
	movs r2, #0x8e
	lsls r2, r2, #0x10
	b .L08067334
.L080672CE:
	cmp r0, #0x22
	bne .L080672E8
	cmp r4, #0
	beq .L080672E0
	lsls r0, r2, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xe
	adds r0, r0, r1
	b .L08067362
.L080672E0:
	lsls r0, r2, #0x10
	movs r2, #0xc0
	lsls r2, r2, #0x10
	b .L08067360
.L080672E8:
	cmp r0, #0x2c
	bne .L08067302
	cmp r4, #0
	beq .L080672FA
	lsls r0, r2, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xd
	adds r0, r0, r1
	b .L0806738E
.L080672FA:
	lsls r0, r2, #0x10
	movs r2, #0xd8
	lsls r2, r2, #0x10
	b .L0806738C
.L08067302:
	cmp r0, #0x30
	bne .L0806731C
	cmp r4, #0
	beq .L08067314
	lsls r0, r2, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0xb
	adds r0, r0, r1
	b .L080673C0
.L08067314:
	lsls r0, r2, #0x10
	movs r2, #0xea
	lsls r2, r2, #0x10
	b .L080673BE
.L0806731C:
	cmp r0, #0x34
	bne .L08067348
	cmp r4, #0
	beq .L0806732E
	lsls r0, r2, #0x10
	movs r1, #0xd4
	lsls r1, r1, #0xf
	adds r0, r0, r1
	b .L08067336
.L0806732E:
	lsls r0, r2, #0x10
	movs r2, #0x86
	lsls r2, r2, #0x10
.L08067334:
	adds r0, r0, r2
.L08067336:
	lsrs r2, r0, #0x10
	ldr r0, [r5, #0x5c]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xa
	movs r3, #0x62
	bl func_08067400
	b .L080673F4
.L08067348:
	cmp r0, #0x38
	bne .L08067374
	cmp r4, #0
	beq .L0806735A
	lsls r0, r2, #0x10
	movs r1, #0xb0
	lsls r1, r1, #0xf
	adds r0, r0, r1
	b .L08067362
.L0806735A:
	lsls r0, r2, #0x10
	movs r2, #0x98
	lsls r2, r2, #0x10
.L08067360:
	adds r0, r0, r2
.L08067362:
	lsrs r2, r0, #0x10
	ldr r0, [r5, #0x5c]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xa
	movs r3, #0x6e
	bl func_08067400
	b .L080673F4
.L08067374:
	cmp r0, #0x3c
	bne .L080673A0
	cmp r4, #0
	beq .L08067386
	lsls r0, r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xd
	adds r0, r0, r1
	b .L0806738E
.L08067386:
	lsls r0, r2, #0x10
	movs r2, #0xe0
	lsls r2, r2, #0x10
.L0806738C:
	adds r0, r0, r2
.L0806738E:
	lsrs r2, r0, #0x10
	ldr r0, [r5, #0x5c]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xa
	movs r3, #0x6c
	bl func_08067400
	b .L080673F4
.L080673A0:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	cmp r1, #0x40
	bne .L080673D2
	cmp r4, #0
	beq .L080673B8
	lsls r0, r2, #0x10
	ldr r1, .L080673B4  @ 0xFFFE0000
	adds r0, r0, r1
	b .L080673C0
	.align 2, 0
.L080673B4: .4byte 0xFFFE0000
.L080673B8:
	lsls r0, r2, #0x10
	movs r2, #0xf2
	lsls r2, r2, #0x10
.L080673BE:
	adds r0, r0, r2
.L080673C0:
	lsrs r2, r0, #0x10
	ldr r0, [r5, #0x5c]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xa
	movs r3, #0x68
	bl func_08067400
	b .L080673F4
.L080673D2:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne .L080673F4
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x5c]
	movs r1, #0x5a
	movs r2, #0x2d
	bl func_08066B14
	ldr r1, .L080673FC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
.L080673F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080673FC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08067244

	THUMB_FUNC_START func_08067400
func_08067400: @ 0x08067400
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	mov r9, r1
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r1, .L08067488  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L0806748C  @ gUnknown_085D7E08
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	mov r0, r8
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r9
	strh r0, [r4, #0x2e]
	ldr r3, .L08067490  @ gUnknown_087A5B5C
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	ldr r1, [r4, #0x60]
	strh r5, [r1, #2]
	ldr r1, [r4, #0x60]
	strh r6, [r1, #4]
	ldrh r2, [r0, #8]
	ldr r1, .L08067494  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, .L08067498  @ gUnknown_087A574C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0806749C  @ gUnknown_087A5390
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08067488: .4byte gUnknown_0201774C
.L0806748C: .4byte gUnknown_085D7E08
.L08067490: .4byte gUnknown_087A5B5C
.L08067494: .4byte 0x0000F3FF
.L08067498: .4byte gUnknown_087A574C
.L0806749C: .4byte gUnknown_087A5390

	THUMB_FUNC_END func_08067400

	THUMB_FUNC_START func_080674A0
func_080674A0: @ 0x080674A0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L080674CA
	ldr r0, .L080674D0  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L080674CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080674D0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080674A0

	THUMB_FUNC_START StartSpellAnimStone
StartSpellAnimStone: @ 0x080674D4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L0806750C  @ gUnknown_085D7E20
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0806750C: .4byte gUnknown_085D7E20

	THUMB_FUNC_END StartSpellAnimStone

	THUMB_FUNC_START func_08067510
func_08067510: @ 0x08067510
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L0806753C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L080675CE
.L0806753C:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xa
	cmp r1, r0
	bne .L08067564
	movs r0, #0xee
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	movs r1, #0xc8
	bl func_080676E4
	b .L080675CE
.L08067564:
	adds r0, r2, #0
	adds r0, #0x48
	cmp r1, r0
	bne .L080675B8
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne .L080675A8
	ldr r0, .L080675B4  @ 0x000003B9
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	bl func_080675D4
	adds r0, r5, #0
	bl func_08054BD4
	cmp r0, #0
	bne .L080675A8
	adds r0, r5, #0
	movs r1, #0xb
	bl func_08054BA4
.L080675A8:
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	b .L080675CE
	.align 2, 0
.L080675B4: .4byte 0x000003B9
.L080675B8:
	adds r0, r2, #0
	adds r0, #0xec
	cmp r1, r0
	bne .L080675CE
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L080675CE:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08067510

	THUMB_FUNC_START func_080675D4
func_080675D4: @ 0x080675D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L08067634  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08067638  @ gUnknown_085D7E38
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L0806763C  @ gUnknown_080DE974
	str r0, [r5, #0x48]
	ldr r0, .L08067640  @ gUnknown_085D7E9C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08067644  @ gUnknown_085D7E50
	str r0, [r5, #0x54]
	ldr r0, .L08067648  @ gUnknown_086C790C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r0, .L0806764C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0806765A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08067650
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0806765A
	.align 2, 0
.L08067634: .4byte gUnknown_0201774C
.L08067638: .4byte gUnknown_085D7E38
.L0806763C: .4byte gUnknown_080DE974
.L08067640: .4byte gUnknown_085D7E9C
.L08067644: .4byte gUnknown_085D7E50
.L08067648: .4byte gUnknown_086C790C
.L0806764C: .4byte gBattleAnimSceneLayoutEnum
.L08067650:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0806765A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080675D4

	THUMB_FUNC_START func_08067660
func_08067660: @ 0x08067660
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	cmp r6, #0
	blt .L080676BC
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r6, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	cmp r6, #0x11
	bne .L080676A6
	ldr r0, .L080676B4  @ gUnknown_086C792C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
.L080676A6:
	cmp r6, #0x12
	bne .L080676DA
	ldr r0, .L080676B8  @ gUnknown_086C794C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L080676DA
	.align 2, 0
.L080676B4: .4byte gUnknown_086C792C
.L080676B8: .4byte gUnknown_086C794C
.L080676BC:
	movs r0, #1
	negs r0, r0
	cmp r6, r0
	bne .L080676DA
	bl SpellFx_ClearBg1
	ldr r1, .L080676E0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_Break
.L080676DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080676E0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08067660

	THUMB_FUNC_START func_080676E4
func_080676E4: @ 0x080676E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	ldr r1, .L08067750  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08067754  @ gUnknown_085D7EE8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r5, #0
	strh r5, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	ldr r3, .L08067758  @ gUnknown_086BDA5C
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	adds r1, #0xc
	strh r1, [r0, #4]
	strh r5, [r0, #6]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	bl BsoSort
	ldr r0, .L0806775C  @ gUnknown_086BD76C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08067760  @ gUnknown_086BD260
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08067750: .4byte gUnknown_0201774C
.L08067754: .4byte gUnknown_085D7EE8
.L08067758: .4byte gUnknown_086BDA5C
.L0806775C: .4byte gUnknown_086BD76C
.L08067760: .4byte gUnknown_086BD260

	THUMB_FUNC_END func_080676E4

	THUMB_FUNC_START func_08067764
func_08067764: @ 0x08067764
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L0806778E
	ldr r0, .L08067794  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L0806778E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08067794: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08067764

	THUMB_FUNC_START StartSpellAnimEvilEye
StartSpellAnimEvilEye: @ 0x08067798
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L080677D0  @ gUnknown_085D7F00
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080677D0: .4byte gUnknown_085D7F00

	THUMB_FUNC_END StartSpellAnimEvilEye

	THUMB_FUNC_START func_080677D4
func_080677D4: @ 0x080677D4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08067800
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L08067886
.L08067800:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #2
	cmp r1, r0
	bne .L08067828
	ldr r0, .L08067824  @ 0x000003C6
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	adds r0, r5, #0
	movs r1, #0x3c
	bl func_08067AA0
	b .L08067886
	.align 2, 0
.L08067824: .4byte 0x000003C6
.L08067828:
	adds r0, r2, #0
	adds r0, #0x1a
	cmp r1, r0
	bne .L08067838
	adds r0, r5, #0
	bl func_0806788C
	b .L08067886
.L08067838:
	adds r0, r2, #0
	adds r0, #0x58
	cmp r1, r0
	bne .L08067848
	adds r0, r5, #0
	bl func_08067984
	b .L08067886
.L08067848:
	adds r0, r2, #0
	adds r0, #0x5a
	cmp r1, r0
	bne .L08067870
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08067886
	adds r0, r5, #0
	bl func_08072450
	b .L08067886
.L08067870:
	adds r0, r2, #0
	adds r0, #0x74
	cmp r1, r0
	bne .L08067886
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08067886:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080677D4

	THUMB_FUNC_START func_0806788C
func_0806788C: @ 0x0806788C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L080678E8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080678EC  @ gUnknown_085D7F18
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L080678F0  @ gUnknown_080DE9EA
	str r0, [r5, #0x48]
	ldr r0, .L080678F4  @ gUnknown_085D7F80
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L080678F8  @ gUnknown_085D7F30
	str r0, [r5, #0x54]
	ldr r0, .L080678FC  @ gUnknown_085D7FD0
	str r0, [r5, #0x58]
	bl SpellFx_InitBg1Blend
	ldr r0, .L08067900  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L0806790E
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08067904
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L0806790E
	.align 2, 0
.L080678E8: .4byte gUnknown_0201774C
.L080678EC: .4byte gUnknown_085D7F18
.L080678F0: .4byte gUnknown_080DE9EA
.L080678F4: .4byte gUnknown_085D7F80
.L080678F8: .4byte gUnknown_085D7F30
.L080678FC: .4byte gUnknown_085D7FD0
.L08067900: .4byte gBattleAnimSceneLayoutEnum
.L08067904:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L0806790E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806788C

	THUMB_FUNC_START func_08067914
func_08067914: @ 0x08067914
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L0806795C
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r6, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L0806797A
.L0806795C:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L0806797A
	bl SpellFx_ClearBg1
	ldr r1, .L08067980  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_End
.L0806797A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08067980: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08067914

	THUMB_FUNC_START func_08067984
func_08067984: @ 0x08067984
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L080679BC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080679C0  @ gUnknown_085D8020
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetOpponentFrontAIS
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L080679C4  @ gUnknown_080DEA4A
	str r0, [r5, #0x48]
	ldr r0, .L080679C8  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080679D0
	ldr r0, .L080679CC  @ gUnknown_085D8068
	b .L080679D2
	.align 2, 0
.L080679BC: .4byte gUnknown_0201774C
.L080679C0: .4byte gUnknown_085D8020
.L080679C4: .4byte gUnknown_080DEA4A
.L080679C8: .4byte gBattleAnimSceneLayoutEnum
.L080679CC: .4byte gUnknown_085D8068
.L080679D0:
	ldr r0, .L08067A0C  @ gUnknown_085D8050
.L080679D2:
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08067A10  @ gUnknown_085D8038
	str r0, [r5, #0x54]
	ldr r0, .L08067A14  @ gUnknown_085D8080
	str r0, [r5, #0x58]
	ldr r0, .L08067A18  @ gUnknown_086D8A94
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	ldr r0, .L08067A1C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L08067A2A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08067A20
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b .L08067A2A
	.align 2, 0
.L08067A0C: .4byte gUnknown_085D8050
.L08067A10: .4byte gUnknown_085D8038
.L08067A14: .4byte gUnknown_085D8080
.L08067A18: .4byte gUnknown_086D8A94
.L08067A1C: .4byte gBattleAnimSceneLayoutEnum
.L08067A20:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
.L08067A2A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08067984

	THUMB_FUNC_START func_08067A30
func_08067A30: @ 0x08067A30
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08067A78
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r6, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08067A96
.L08067A78:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L08067A96
	bl SpellFx_ClearBg1
	ldr r1, .L08067A9C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_End
.L08067A96:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08067A9C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08067A30

	THUMB_FUNC_START func_08067AA0
func_08067AA0: @ 0x08067AA0
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov r9, r1
	ldr r0, .L08067B34  @ gUnknown_080DEA74
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r6, #0
	bl GetAISSubjectId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, .L08067B38  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08067B3C  @ gUnknown_085D8098
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r0, r6, #0
	bl GetOpponentFrontAIS
	str r0, [r5, #0x5c]
	movs r0, #0
	mov r8, r0
	mov r1, r8
	strh r1, [r5, #0x2c]
	mov r0, r9
	strh r0, [r5, #0x2e]
	lsls r4, r4, #2
	add r4, sp
	adds r4, #4
	ldr r3, [r4]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r5, #0x60]
	ldrh r1, [r0, #4]
	adds r1, #0x18
	strh r1, [r0, #4]
	mov r1, r8
	strh r1, [r0, #6]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	bl BsoSort
	ldr r0, .L08067B40  @ gUnknown_086C93FC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08067B44  @ gUnknown_086C90A4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08067B34: .4byte gUnknown_080DEA74
.L08067B38: .4byte gUnknown_0201774C
.L08067B3C: .4byte gUnknown_085D8098
.L08067B40: .4byte gUnknown_086C93FC
.L08067B44: .4byte gUnknown_086C90A4

	THUMB_FUNC_END func_08067AA0

	THUMB_FUNC_START func_08067B48
func_08067B48: @ 0x08067B48
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08067B72
	ldr r0, .L08067B78  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08067B72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08067B78: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08067B48

	THUMB_FUNC_START StartSpellAnimNaglfar
StartSpellAnimNaglfar: @ 0x08067B7C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl StartEfxSpellCast
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08067BB4  @ gUnknown_085D80B0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08067BB4: .4byte gUnknown_085D80B0

	THUMB_FUNC_END StartSpellAnimNaglfar

	THUMB_FUNC_START Loop6C_efxNaglfar
Loop6C_efxNaglfar: @ 0x08067BB8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	bl GetOpponentFrontAIS
	adds r4, r0, #0
	bl GetSpellAnimationStartFrame
	adds r5, r0, #0
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08067BE8
	ldr r0, [r7, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L08067DBC
.L08067BE8:
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	adds r0, r5, #0
	adds r0, #0x1a
	cmp r1, r0
	bne .L08067C30
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #1
	bl func_0805B93C
	adds r0, r4, #0
	movs r1, #0x3e
	bl func_0805B4E8
	adds r0, r4, #0
	bl func_08067DC4
	movs r0, #0x10
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0
	bl func_0805BA1C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl func_0806823C
	ldr r0, .L08067C2C  @ 0x000003AF
	b .L08067D74
	.align 2, 0
.L08067C2C: .4byte 0x000003AF
.L08067C30:
	adds r0, r5, #0
	adds r0, #0x32
	cmp r1, r0
	beq .L08067C62
	adds r0, r5, #0
	adds r0, #0x37
	cmp r1, r0
	beq .L08067C7E
	adds r0, r5, #0
	adds r0, #0x38
	cmp r1, r0
	bne .L08067C5A
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0x10
	bl func_0805BA1C
	b .L08067DBC
.L08067C5A:
	adds r0, r5, #0
	adds r0, #0x42
	cmp r1, r0
	bne .L08067C6C
.L08067C62:
	adds r0, r4, #0
	movs r1, #2
	bl StartEfxFlashBG
	b .L08067DBC
.L08067C6C:
	adds r0, r5, #0
	adds r0, #0x46
	cmp r1, r0
	bne .L08067C8A
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1e
	bl func_08068614
.L08067C7E:
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	bl func_0806823C
	b .L08067DBC
.L08067C8A:
	adds r0, r5, #0
	adds r0, #0x6e
	cmp r1, r0
	bne .L08067CAC
	adds r0, r4, #0
	movs r1, #0x68
	movs r2, #1
	bl func_0805B93C
	adds r0, r4, #0
	movs r1, #0x68
	bl func_0805B4E8
	adds r0, r4, #0
	bl func_08067E98
	b .L08067DBC
.L08067CAC:
	adds r0, r5, #0
	adds r0, #0xa6
	cmp r1, r0
	bne .L08067CC0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1e
	bl func_08054030
	b .L08067DBC
.L08067CC0:
	adds r0, r5, #0
	adds r0, #0xc4
	cmp r1, r0
	bne .L08067CF4
	ldr r2, .L08067CF0  @ gDispIo
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
	movs r1, #0x1e
	movs r2, #0
	bl func_08054134
	b .L08067DBC
	.align 2, 0
.L08067CF0: .4byte gDispIo
.L08067CF4:
	adds r0, r5, #0
	adds r0, #0xe2
	cmp r1, r0
	bne .L08067D20
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r4, #0
	bl func_08067F64
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	bl func_08054134
	adds r0, r4, #0
	movs r1, #0x4c
	bl func_08068314
	b .L08067DBC
.L08067D20:
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	movs r2, #0x97
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne .L08067D8E
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	adds r6, r7, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r6, [r6]
	cmp r6, #0
	bne .L08067D84
	adds r0, r4, #0
	movs r1, #0x42
	movs r2, #1
	bl func_0805B93C
	adds r0, r4, #0
	movs r1, #0x42
	bl func_0805B4E8
	adds r0, r4, #0
	bl func_08068028
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0x20
	movs r3, #0x10
	bl func_0805BA1C
	movs r0, #0xec
	lsls r0, r0, #2
.L08067D74:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl func_080729A4
	b .L08067DBC
.L08067D84:
	movs r1, #0x9d
	lsls r1, r1, #1
	adds r0, r5, r1
	strh r0, [r7, #0x2c]
	b .L08067DBC
.L08067D8E:
	movs r2, #0x9d
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne .L08067DA4
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl func_0806823C
	b .L08067DBC
.L08067DA4:
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r0, r5, r3
	cmp r1, r0
	bne .L08067DBC
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r7, #0
	bl Proc_Break
.L08067DBC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_efxNaglfar

	THUMB_FUNC_START func_08067DC4
func_08067DC4: @ 0x08067DC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08067E04  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08067E08  @ gUnknown_085D80C8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	strh r1, [r0, #0x32]
	ldr r1, .L08067E0C  @ gUnknown_080DEA96
	str r1, [r0, #0x48]
	ldr r1, .L08067E10  @ gUnknown_085D80E4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08067E14  @ gUnknown_085D80E0
	str r1, [r0, #0x54]
	ldr r0, .L08067E18  @ gUnknown_087013A0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08067E04: .4byte gUnknown_0201774C
.L08067E08: .4byte gUnknown_085D80C8
.L08067E0C: .4byte gUnknown_080DEA96
.L08067E10: .4byte gUnknown_085D80E4
.L08067E14: .4byte gUnknown_085D80E0
.L08067E18: .4byte gUnknown_087013A0

	THUMB_FUNC_END func_08067DC4

	THUMB_FUNC_START Loop6C_efxNaglfarBG
Loop6C_efxNaglfarBG: @ 0x08067E1C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	adds r0, #4
	movs r1, #0xf0
	bl __modsi3
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x32]
	movs r0, #1
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt .L08067E70
	ldr r1, [r4, #0x4c]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r2, #2
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x20
	movs r3, #0x14
	bl func_0805576C
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L08067E8E
.L08067E70:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L08067E8E
	bl SpellFx_ClearBg1
	ldr r1, .L08067E94  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_End
.L08067E8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08067E94: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxNaglfarBG

	THUMB_FUNC_START func_08067E98
func_08067E98: @ 0x08067E98
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08067ED0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08067ED4  @ gUnknown_085D80E8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08067ED8  @ gUnknown_080DEAAA
	str r1, [r0, #0x48]
	ldr r1, .L08067EDC  @ gUnknown_085D8140
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08067EE0  @ gUnknown_085D8100
	str r1, [r0, #0x54]
	ldr r1, .L08067EE4  @ gUnknown_085D8180
	str r1, [r0, #0x58]
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08067ED0: .4byte gUnknown_0201774C
.L08067ED4: .4byte gUnknown_085D80E8
.L08067ED8: .4byte gUnknown_080DEAAA
.L08067EDC: .4byte gUnknown_085D8140
.L08067EE0: .4byte gUnknown_085D8100
.L08067EE4: .4byte gUnknown_085D8180

	THUMB_FUNC_END func_08067E98

	THUMB_FUNC_START Loop6C_efxNaglfarBG2
Loop6C_efxNaglfarBG2: @ 0x08067EE8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08067F3C
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r6, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08067F5A
.L08067F3C:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L08067F5A
	bl SpellFx_ClearBg1
	ldr r1, .L08067F60  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_End
.L08067F5A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08067F60: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxNaglfarBG2

	THUMB_FUNC_START func_08067F64
func_08067F64: @ 0x08067F64
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08067FA0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08067FA4  @ gUnknown_085D81C0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08067FA8  @ gUnknown_080DEAFA
	str r1, [r0, #0x48]
	ldr r1, .L08067FAC  @ gUnknown_085D81E8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08067FB0  @ gUnknown_085D81D8
	str r1, [r0, #0x54]
	ldr r0, .L08067FB4  @ gUnknown_087197E4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08067FA0: .4byte gUnknown_0201774C
.L08067FA4: .4byte gUnknown_085D81C0
.L08067FA8: .4byte gUnknown_080DEAFA
.L08067FAC: .4byte gUnknown_085D81E8
.L08067FB0: .4byte gUnknown_085D81D8
.L08067FB4: .4byte gUnknown_087197E4

	THUMB_FUNC_END func_08067F64

	THUMB_FUNC_START func_08067FB8
func_08067FB8: @ 0x08067FB8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L08068000
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L0806801E
.L08068000:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L0806801E
	bl SpellFx_ClearBg1
	ldr r1, .L08068024  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_End
.L0806801E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08068024: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08067FB8

	THUMB_FUNC_START func_08068028
func_08068028: @ 0x08068028
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08068064  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08068068  @ gUnknown_085D81F8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L0806806C  @ gUnknown_080DEB6A
	str r1, [r0, #0x48]
	ldr r1, .L08068070  @ gUnknown_085D8224
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, .L08068074  @ gUnknown_085D8210
	str r1, [r0, #0x54]
	ldr r0, .L08068078  @ gUnknown_08720D84
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_InitBg1Blend
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068064: .4byte gUnknown_0201774C
.L08068068: .4byte gUnknown_085D81F8
.L0806806C: .4byte gUnknown_080DEB6A
.L08068070: .4byte gUnknown_085D8224
.L08068074: .4byte gUnknown_085D8210
.L08068078: .4byte gUnknown_08720D84

	THUMB_FUNC_END func_08068028

	THUMB_FUNC_START func_0806807C
func_0806807C: @ 0x0806807C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt .L080680C4
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b .L080680E2
.L080680C4:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne .L080680E2
	bl SpellFx_ClearBg1
	ldr r1, .L080680E8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r4, #0
	bl Proc_End
.L080680E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080680E8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_0806807C

	THUMB_FUNC_START func_080680EC
func_080680EC: @ 0x080680EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x64
	adds r5, r0, #0
	str r1, [sp, #0x5c]
	ldr r0, [sp, #0x84]
	ldr r1, [sp, #0x88]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x60]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	add r1, sp, #4
	ldr r0, .L08068190  @ gUnknown_080DEBC8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	add r0, sp, #0x34
	mov r8, r0
	ldr r1, .L08068194  @ gUnknown_080DEBF8
	movs r2, #0x14
	bl memcpy
	add r6, sp, #0x48
	ldr r1, .L08068198  @ gUnknown_080DEC0C
	adds r0, r6, #0
	movs r2, #0x14
	bl memcpy
	adds r0, r5, #0
	bl GetAISSubjectId
	ldr r1, .L0806819C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080681A0  @ gUnknown_085D8238
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	add r1, sp, #0x5c
	ldrh r1, [r1]
	strh r1, [r4, #0x2e]
	lsls r0, r7, #3
	add r0, sp
	adds r0, #4
	ldr r3, [r0]
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r3, r0, #0
	str r3, [r4, #0x60]
	mov r2, r9
	cmp r2, #0
	beq .L080681A4
	cmp r2, #1
	beq .L080681BC
	b .L080681DE
	.align 2, 0
.L08068190: .4byte gUnknown_080DEBC8
.L08068194: .4byte gUnknown_080DEBF8
.L08068198: .4byte gUnknown_080DEC0C
.L0806819C: .4byte gUnknown_0201774C
.L080681A0: .4byte gUnknown_085D8238
.L080681A4:
	lsls r2, r7, #2
	mov r4, r8
	adds r1, r4, r2
	mov r4, sl
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	mov r1, sp
	adds r1, #0x36
	b .L080681D0
.L080681BC:
	lsls r2, r7, #2
	adds r1, r6, r2
	mov r4, sl
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	mov r1, sp
	adds r1, #0x4a
.L080681D0:
	adds r1, r1, r2
	ldr r2, [sp, #0x60]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #4]
.L080681DE:
	ldr r0, .L08068200  @ gUnknown_086FF3A4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L08068204  @ gUnknown_086FE938
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #0x64
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08068200: .4byte gUnknown_086FF3A4
.L08068204: .4byte gUnknown_086FE938

	THUMB_FUNC_END func_080680EC

	THUMB_FUNC_START func_08068208
func_08068208: @ 0x08068208
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08068232
	ldr r0, .L08068238  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L08068232:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068238: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08068208

	THUMB_FUNC_START func_0806823C
func_0806823C: @ 0x0806823C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #0x14
	mov r8, r0
	mov r9, r1
	lsls r6, r2, #0x18
	lsrs r6, r6, #0x18
	add r1, sp, #4
	ldr r0, .L080682CC  @ gUnknown_080DEC30
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	mov r0, r8
	bl GetAISSubjectId
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, .L080682D0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080682D4  @ gUnknown_085D8250
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	mov r0, r8
	bl GetOpponentFrontAIS
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	mov r0, r9
	strh r0, [r5, #0x2e]
	lsls r4, r4, #2
	lsls r6, r6, #3
	adds r4, r4, r6
	mov r0, sp
	adds r0, r0, r4
	adds r0, #4
	ldr r3, [r0]
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	str r0, [r5, #0x60]
	ldrh r1, [r0, #4]
	adds r1, #0x18
	strh r1, [r0, #4]
	ldr r0, .L080682D8  @ gUnknown_086FFD3C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L080682DC  @ gUnknown_086FF5EC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080682CC: .4byte gUnknown_080DEC30
.L080682D0: .4byte gUnknown_0201774C
.L080682D4: .4byte gUnknown_085D8250
.L080682D8: .4byte gUnknown_086FFD3C
.L080682DC: .4byte gUnknown_086FF5EC

	THUMB_FUNC_END func_0806823C

	THUMB_FUNC_START func_080682E0
func_080682E0: @ 0x080682E0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L0806830A
	ldr r0, .L08068310  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L0806830A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068310: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080682E0

	THUMB_FUNC_START func_08068314
func_08068314: @ 0x08068314
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, .L08068340  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08068344  @ gUnknown_085D8268
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetOpponentFrontAIS
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08068340: .4byte gUnknown_0201774C
.L08068344: .4byte gUnknown_085D8268

	THUMB_FUNC_END func_08068314

	THUMB_FUNC_START func_08068348
func_08068348: @ 0x08068348
	push {lr}
	sub sp, #8
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne .L0806836E
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #2
	movs r2, #0
	bl func_080680EC
	b .L0806860A
.L0806836E:
	cmp r0, #5
	bne .L08068380
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b .L08068596
.L08068380:
	cmp r0, #7
	bne .L08068390
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r2, #0
	b .L08068596
.L08068390:
	cmp r0, #9
	bne .L080683A2
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	movs r1, #3
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b .L08068596
.L080683A2:
	cmp r0, #0xb
	bne .L080683B4
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b .L08068596
.L080683B4:
	cmp r0, #0xd
	bne .L080683C6
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	str r3, [sp, #4]
	movs r1, #2
	movs r2, #0
	b .L08068596
.L080683C6:
	cmp r0, #0xf
	bne .L080683D8
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b .L08068596
.L080683D8:
	cmp r0, #0x11
	bne .L080683EA
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r2, #0
	b .L08068596
.L080683EA:
	cmp r0, #0x13
	bne .L080683FE
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b .L08068596
.L080683FE:
	cmp r0, #0x15
	bne .L08068412
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #2
	movs r2, #0
	b .L08068596
.L08068412:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	ldrh r1, [r2, #0x2c]
	cmp r0, #0x17
	bne .L08068424
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	b .L0806845C
.L08068424:
	cmp r0, #0x19
	bne .L08068432
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	b .L0806845C
.L08068432:
	cmp r0, #0x1b
	bne .L08068442
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	b .L08068460
.L08068442:
	cmp r0, #0x1d
	bne .L08068450
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	b .L0806845C
.L08068450:
	cmp r0, #0x1f
	bne .L0806846A
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #4
.L0806845C:
	str r1, [sp, #4]
	movs r1, #2
.L08068460:
	movs r2, #8
	movs r3, #8
	bl func_080680EC
	b .L0806860A
.L0806846A:
	cmp r0, #0x21
	bne .L08068480
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	negs r2, r2
	movs r3, #8
	negs r3, r3
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	b .L080684DA
.L08068480:
	cmp r0, #0x23
	bne .L08068494
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	negs r2, r2
	movs r3, #8
	negs r3, r3
	movs r1, #1
	str r1, [sp]
	b .L080684DA
.L08068494:
	cmp r0, #0x25
	bne .L080684B0
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	negs r2, r2
	movs r3, #8
	negs r3, r3
	movs r1, #1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	bl func_080680EC
	b .L0806860A
.L080684B0:
	cmp r0, #0x27
	bne .L080684C6
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	negs r2, r2
	movs r3, #8
	negs r3, r3
	movs r1, #1
	str r1, [sp]
	movs r1, #3
	b .L080684DA
.L080684C6:
	cmp r0, #0x29
	bne .L080684E4
	ldr r0, [r2, #0x5c]
	movs r2, #0x10
	negs r2, r2
	movs r3, #8
	negs r3, r3
	movs r1, #1
	str r1, [sp]
	movs r1, #4
.L080684DA:
	str r1, [sp, #4]
	movs r1, #2
	bl func_080680EC
	b .L0806860A
.L080684E4:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2b
	bne .L080684F4
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	b .L0806852C
.L080684F4:
	cmp r0, #0x2d
	bne .L08068502
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	b .L0806852C
.L08068502:
	cmp r0, #0x2f
	bne .L08068512
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	b .L08068530
.L08068512:
	cmp r0, #0x31
	bne .L08068520
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	b .L0806852C
.L08068520:
	cmp r0, #0x33
	bne .L0806853A
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #4
.L0806852C:
	str r1, [sp, #4]
	movs r1, #2
.L08068530:
	movs r2, #0x12
	movs r3, #0x12
	bl func_080680EC
	b .L0806860A
.L0806853A:
	cmp r0, #0x35
	bne .L0806854C
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	negs r2, r2
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	b .L08068592
.L0806854C:
	cmp r0, #0x37
	bne .L0806855C
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	negs r2, r2
	movs r1, #1
	str r1, [sp]
	b .L08068592
.L0806855C:
	cmp r0, #0x39
	bne .L08068570
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	negs r2, r2
	movs r1, #1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	b .L08068596
.L08068570:
	cmp r0, #0x3b
	bne .L08068582
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	negs r2, r2
	movs r1, #1
	str r1, [sp]
	movs r1, #3
	b .L08068592
.L08068582:
	cmp r0, #0x3d
	bne .L0806859E
	ldr r0, [r2, #0x5c]
	movs r2, #0x18
	negs r2, r2
	movs r1, #1
	str r1, [sp]
	movs r1, #4
.L08068592:
	str r1, [sp, #4]
	movs r1, #2
.L08068596:
	movs r3, #0
	bl func_080680EC
	b .L0806860A
.L0806859E:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x3f
	bne .L080685AE
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	b .L080685E6
.L080685AE:
	cmp r1, #0x41
	bne .L080685BC
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	b .L080685E6
.L080685BC:
	cmp r1, #0x43
	bne .L080685CC
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	b .L080685EA
.L080685CC:
	cmp r1, #0x45
	bne .L080685DA
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	b .L080685E6
.L080685DA:
	cmp r1, #0x47
	bne .L080685F4
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #4
.L080685E6:
	str r1, [sp, #4]
	movs r1, #2
.L080685EA:
	movs r2, #0xc
	movs r3, #0xc
	bl func_080680EC
	b .L0806860A
.L080685F4:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne .L0806860A
	ldr r1, .L08068610  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
.L0806860A:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
.L08068610: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08068348

	THUMB_FUNC_START func_08068614
func_08068614: @ 0x08068614
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08068634  @ gUnknown_085D8280
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08068634: .4byte gUnknown_085D8280

	THUMB_FUNC_END func_08068614

	THUMB_FUNC_START func_08068638
func_08068638: @ 0x08068638
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, .L08068678  @ gPal
	ldr r4, .L0806867C  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl ApplyColorDarken_Unsure
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08068678: .4byte gPal
.L0806867C: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_08068638

	THUMB_FUNC_START func_08068680
func_08068680: @ 0x08068680
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L0806872C  @ gPal
	ldr r4, .L08068730  @ gUnknown_020165C8
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble .L08068724
	movs r0, #0
	strh r0, [r7, #0x2c]
	ldr r2, .L08068734  @ gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r7, #0
	bl Proc_Break
.L08068724:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0806872C: .4byte gPal
.L08068730: .4byte gUnknown_020165C8
.L08068734: .4byte gDispIo

	THUMB_FUNC_END func_08068680

	THUMB_FUNC_START func_08068738
func_08068738: @ 0x08068738
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, .L080687C8  @ gPal
	ldr r4, .L080687CC  @ gUnknown_020165C8
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	movs r3, #0x10
	bl ApplyColorDarken_Unsure
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl ApplyColorDarken_Unsure
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r5, #0
	bl ApplyColorDarken_Unsure
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble .L080687C0
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
.L080687C0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080687C8: .4byte gPal
.L080687CC: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_08068738

	THUMB_FUNC_START func_080687D0
func_080687D0: @ 0x080687D0
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080687D0

	THUMB_FUNC_START func_080687E4
func_080687E4: @ 0x080687E4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08068818  @ gUnknown_085D82B0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08068818: .4byte gUnknown_085D82B0

	THUMB_FUNC_END func_080687E4

	THUMB_FUNC_START func_0806881C
func_0806881C: @ 0x0806881C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08068844
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
.L08068844:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne .L08068884
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	bl func_080688C0
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xf
	movs r3, #0x10
	bl func_0805BA1C
	ldr r0, .L08068880  @ 0x0000011D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl func_080729A4
	b .L080688B6
	.align 2, 0
.L08068880: .4byte 0x0000011D
.L08068884:
	cmp r0, #0xf
	bne .L080688A8
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080688B6
	adds r0, r5, #0
	bl func_08072450
	b .L080688B6
.L080688A8:
	cmp r0, #0x82
	bne .L080688B6
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
.L080688B6:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806881C

	THUMB_FUNC_START func_080688C0
func_080688C0: @ 0x080688C0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, .L0806891C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08068920  @ gUnknown_085D82C8
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x34
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAISSubjectId
	ldr r3, .L08068924  @ gUnknown_085E35DC
	cmp r0, #0
	bne .L080688F0
	ldr r3, .L08068928  @ gUnknown_085E2A24
.L080688F0:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, .L0806892C  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08068936
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08068930
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b .L0806894A
	.align 2, 0
.L0806891C: .4byte gUnknown_0201774C
.L08068920: .4byte gUnknown_085D82C8
.L08068924: .4byte gUnknown_085E35DC
.L08068928: .4byte gUnknown_085E2A24
.L0806892C: .4byte gBattleAnimSceneLayoutEnum
.L08068930:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	b .L0806894A
.L08068936:
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08068946
	ldrh r0, [r4, #2]
	adds r0, #0x48
	b .L0806894A
.L08068946:
	ldrh r0, [r4, #2]
	subs r0, #0x48
.L0806894A:
	strh r0, [r4, #2]
	ldr r0, .L08068968  @ gUnknown_085DFA68
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, .L0806896C  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08068968: .4byte gUnknown_085DFA68
.L0806896C: .4byte gUnknown_085DDC64

	THUMB_FUNC_END func_080688C0

	THUMB_FUNC_START func_08068970
func_08068970: @ 0x08068970
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08068994  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq .L080689A2
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08068998
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x48
	b .L080689A0
	.align 2, 0
.L08068994: .4byte gBattleAnimSceneLayoutEnum
.L08068998:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x48
.L080689A0:
	strh r0, [r1, #2]
.L080689A2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble .L080689C8
	ldr r0, [r4, #0x60]
	bl BsoRemove
	ldr r1, .L080689D0  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080689C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080689D0: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08068970

	THUMB_FUNC_START func_080689D4
func_080689D4: @ 0x080689D4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, .L08068A18  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08068A1C  @ gUnknown_085D82E0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x70
	strh r0, [r4, #0x2e]
	ldr r0, .L08068A20  @ gUnknown_087246D8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r2, .L08068A24  @ gUnknown_08725AF0
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_ResetBg1Offset
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08068A18: .4byte gUnknown_0201774C
.L08068A1C: .4byte gUnknown_085D82E0
.L08068A20: .4byte gUnknown_087246D8
.L08068A24: .4byte gUnknown_08725AF0

	THUMB_FUNC_END func_080689D4

	THUMB_FUNC_START func_08068A28
func_08068A28: @ 0x08068A28
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne .L08068A54
	bl SpellFx_ClearBg1
	bl SpellFx_EndBlend
	ldr r1, .L08068A5C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08068A54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068A5C: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08068A28

	THUMB_FUNC_START func_08068A60
func_08068A60: @ 0x08068A60
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L08068A8C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08068A90  @ gUnknown_085D82F8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L08068A94  @ gUnknown_080DECBA
	str r1, [r0, #0x48]
	ldr r1, .L08068A98  @ gUnknown_08725DAC
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068A8C: .4byte gUnknown_0201774C
.L08068A90: .4byte gUnknown_085D82F8
.L08068A94: .4byte gUnknown_080DECBA
.L08068A98: .4byte gUnknown_08725DAC

	THUMB_FUNC_END func_08068A60

	THUMB_FUNC_START func_08068A9C
func_08068A9C: @ 0x08068A9C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L08068ADC
	ldr r0, [r4, #0x4c]
	ldr r4, .L08068AD8  @ gUnknown_020165C8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl ApplyFlashingPaletteAnimation
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b .L08068AF2
	.align 2, 0
.L08068AD8: .4byte gUnknown_020165C8
.L08068ADC:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne .L08068AF2
	ldr r1, .L08068AF8  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08068AF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08068AF8: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08068A9C

	THUMB_FUNC_START func_08068AFC
func_08068AFC: @ 0x08068AFC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	bl SpellFx_WriteBgMap
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08068B18
	adds r5, #1
	movs r0, #1
	ands r5, r0
.L08068B18:
	cmp r5, #0
	beq .L08068B4C
	ldr r0, .L08068B44  @ gBg1Tm
	adds r2, r0, #0
	adds r2, #0x3a
	adds r4, r0, #0
	ldr r5, .L08068B48  @ gBattleAnimSceneLayoutEnum
	movs r3, #0x13
.L08068B28:
	ldrh r1, [r2]
	strh r1, [r2, #2]
	strh r1, [r2, #4]
	movs r6, #0
	ldrsh r0, [r5, r6]
	cmp r0, #0
	beq .L08068B38
	strh r1, [r4]
.L08068B38:
	adds r2, #0x40
	adds r4, #0x40
	subs r3, #1
	cmp r3, #0
	bge .L08068B28
	b .L08068B70
	.align 2, 0
.L08068B44: .4byte gBg1Tm
.L08068B48: .4byte gBattleAnimSceneLayoutEnum
.L08068B4C:
	ldr r2, .L08068B78  @ gBg1Tm
	adds r4, r2, #0
	adds r4, #0x3a
	ldr r5, .L08068B7C  @ gBattleAnimSceneLayoutEnum
	movs r3, #0x13
.L08068B56:
	ldrh r1, [r2]
	strh r1, [r2, #0x3c]
	strh r1, [r2, #0x3e]
	movs r6, #0
	ldrsh r0, [r5, r6]
	cmp r0, #0
	beq .L08068B66
	strh r1, [r4]
.L08068B66:
	adds r2, #0x40
	adds r4, #0x40
	subs r3, #1
	cmp r3, #0
	bge .L08068B56
.L08068B70:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08068B78: .4byte gBg1Tm
.L08068B7C: .4byte gBattleAnimSceneLayoutEnum

	THUMB_FUNC_END func_08068AFC

	THUMB_FUNC_START func_08068B80
func_08068B80: @ 0x08068B80
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ResetBg1Offset
	ldr r0, .L08068BB4  @ gUnknown_085D8318
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAISCurrentRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl IsBatteRoundTypeAMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08068BB4: .4byte gUnknown_085D8318

	THUMB_FUNC_END func_08068B80

	THUMB_FUNC_START func_08068BB8
func_08068BB8: @ 0x08068BB8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetOpponentFrontAIS
	adds r5, r0, #0
	bl GetSpellAnimationStartFrame
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne .L08068BE4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl MoveBattleCameraOnto
	b .L08068D14
.L08068BE4:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #2
	cmp r1, r0
	bne .L08068C08
	bl func_0806FAB0
	cmp r0, #1
	bne .L08068BF8
	b .L08068D14
.L08068BF8:
	bl func_0806FAB0
	cmp r0, #2
	bne .L08068C02
	b .L08068D14
.L08068C02:
	bl func_08068D78
	b .L08068D14
.L08068C08:
	adds r0, r2, #0
	adds r0, #0x22
	cmp r1, r0
	bne .L08068C1C
	adds r0, r5, #0
	bl func_080692B0
	movs r0, #0xeb
	lsls r0, r0, #2
	b .L08068CD4
.L08068C1C:
	adds r0, r2, #0
	adds r0, #0x60
	cmp r1, r0
	bne .L08068C32
	adds r0, r5, #0
	bl func_08069488
	adds r0, r5, #0
	bl func_08069AC4
	b .L08068D14
.L08068C32:
	adds r0, r2, #0
	adds r0, #0xce
	cmp r1, r0
	bne .L08068C42
	adds r0, r5, #0
	bl func_08069E88
	b .L08068D14
.L08068C42:
	movs r3, #0x97
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne .L08068C8C
	adds r0, r5, #0
	movs r1, #0xa
	bl StartEfxFlashBG
	bl func_0806FAB0
	cmp r0, #1
	beq .L08068C68
	bl func_0806FAB0
	cmp r0, #2
	beq .L08068C68
	bl func_08068D9C
.L08068C68:
	bl StartEfxSpellCast
	ldrh r1, [r5, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08068D14
	adds r0, r5, #0
	bl func_08072450
	b .L08068D14
.L08068C8C:
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne .L08068CB0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08068D14
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
	b .L08068D14
.L08068CB0:
	movs r3, #0x9c
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne .L08068CE8
	ldr r0, [r4, #0x5c]
	movs r1, #0xf
	movs r2, #9
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x1e
	bl func_08064D00
	adds r0, r5, #0
	bl func_08064DE4
	ldr r0, .L08068CE4  @ 0x000003AD
.L08068CD4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #1
	bl func_080729A4
	b .L08068D14
	.align 2, 0
.L08068CE4: .4byte 0x000003AD
.L08068CE8:
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne .L08068CFE
	ldr r0, [r4, #0x5c]
	movs r1, #0xf
	movs r2, #8
	bl StartSpellThing_MagicQuake
	b .L08068D14
.L08068CFE:
	ldr r3, .L08068D1C  @ 0x00000161
	adds r0, r2, r3
	cmp r1, r0
	bne .L08068D14
	bl SpellFx_Finish
	bl StartEndEfxSpellCast
	adds r0, r4, #0
	bl Proc_Break
.L08068D14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08068D1C: .4byte 0x00000161

	THUMB_FUNC_END func_08068BB8

	THUMB_FUNC_START func_08068D20
func_08068D20: @ 0x08068D20
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	adds r3, r0, #0
	ldr r0, .L08068D70  @ gPal
	movs r1, #6
	movs r2, #0xa
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne .L08068D68
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, .L08068D74  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08068D68:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068D70: .4byte gPal
.L08068D74: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08068D20

	THUMB_FUNC_START func_08068D78
func_08068D78: @ 0x08068D78
	push {lr}
	ldr r1, .L08068D94  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L08068D98  @ gUnknown_085D8330
	movs r1, #3
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
.L08068D94: .4byte gUnknown_0201774C
.L08068D98: .4byte gUnknown_085D8330

	THUMB_FUNC_END func_08068D78

	THUMB_FUNC_START func_08068D9C
func_08068D9C: @ 0x08068D9C
	push {lr}
	ldr r1, .L08068DB0  @ gUnknown_0203E0FE
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne .L08068DB4
	movs r0, #4
	bl func_0807168C
	b .L08068DCE
	.align 2, 0
.L08068DB0: .4byte gUnknown_0203E0FE
.L08068DB4:
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r0, #1
	bl func_08075AB4
	ldr r0, .L08068DD4  @ gPal
	movs r1, #6
	movs r2, #0xa
	movs r3, #0
	bl ApplyColorDarken_Unsure
	bl EnablePalSync
.L08068DCE:
	pop {r0}
	bx r0
	.align 2, 0
.L08068DD4: .4byte gPal

	THUMB_FUNC_END func_08068D9C

	THUMB_FUNC_START func_08068DD8
func_08068DD8: @ 0x08068DD8
	push {r4, lr}
	ldr r0, .L08068E08  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068E02
	ldr r4, .L08068E0C  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #0xd
	bl Div
	ldr r2, .L08068E10  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068E02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068E08: .4byte 0x04000006
.L08068E0C: .4byte gUnknown_0201FB28
.L08068E10: .4byte 0x04000016

	THUMB_FUNC_END func_08068DD8

	THUMB_FUNC_START func_08068E14
func_08068E14: @ 0x08068E14
	push {r4, lr}
	ldr r0, .L08068E44  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068E3E
	ldr r4, .L08068E48  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #0xc
	bl Div
	ldr r2, .L08068E4C  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068E3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068E44: .4byte 0x04000006
.L08068E48: .4byte gUnknown_0201FB28
.L08068E4C: .4byte 0x04000016

	THUMB_FUNC_END func_08068E14

	THUMB_FUNC_START func_08068E50
func_08068E50: @ 0x08068E50
	push {r4, lr}
	ldr r0, .L08068E80  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068E7A
	ldr r4, .L08068E84  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #0xb
	bl Div
	ldr r2, .L08068E88  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068E7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068E80: .4byte 0x04000006
.L08068E84: .4byte gUnknown_0201FB28
.L08068E88: .4byte 0x04000016

	THUMB_FUNC_END func_08068E50

	THUMB_FUNC_START func_08068E8C
func_08068E8C: @ 0x08068E8C
	push {r4, lr}
	ldr r0, .L08068EBC  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068EB6
	ldr r4, .L08068EC0  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #0xa
	bl Div
	ldr r2, .L08068EC4  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068EB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068EBC: .4byte 0x04000006
.L08068EC0: .4byte gUnknown_0201FB28
.L08068EC4: .4byte 0x04000016

	THUMB_FUNC_END func_08068E8C

	THUMB_FUNC_START func_08068EC8
func_08068EC8: @ 0x08068EC8
	push {r4, lr}
	ldr r0, .L08068EF8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068EF2
	ldr r4, .L08068EFC  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #9
	bl Div
	ldr r2, .L08068F00  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068EF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068EF8: .4byte 0x04000006
.L08068EFC: .4byte gUnknown_0201FB28
.L08068F00: .4byte 0x04000016

	THUMB_FUNC_END func_08068EC8

	THUMB_FUNC_START func_08068F04
func_08068F04: @ 0x08068F04
	push {r4, lr}
	ldr r0, .L08068F34  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068F2E
	ldr r4, .L08068F38  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #8
	bl Div
	ldr r2, .L08068F3C  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068F2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068F34: .4byte 0x04000006
.L08068F38: .4byte gUnknown_0201FB28
.L08068F3C: .4byte 0x04000016

	THUMB_FUNC_END func_08068F04

	THUMB_FUNC_START func_08068F40
func_08068F40: @ 0x08068F40
	push {r4, lr}
	ldr r0, .L08068F70  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068F6A
	ldr r4, .L08068F74  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #7
	bl Div
	ldr r2, .L08068F78  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068F6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068F70: .4byte 0x04000006
.L08068F74: .4byte gUnknown_0201FB28
.L08068F78: .4byte 0x04000016

	THUMB_FUNC_END func_08068F40

	THUMB_FUNC_START func_08068F7C
func_08068F7C: @ 0x08068F7C
	push {r4, lr}
	ldr r0, .L08068FAC  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068FA6
	ldr r4, .L08068FB0  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #6
	bl Div
	ldr r2, .L08068FB4  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068FA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068FAC: .4byte 0x04000006
.L08068FB0: .4byte gUnknown_0201FB28
.L08068FB4: .4byte 0x04000016

	THUMB_FUNC_END func_08068F7C

	THUMB_FUNC_START func_08068FB8
func_08068FB8: @ 0x08068FB8
	push {r4, lr}
	ldr r0, .L08068FE8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08068FE2
	ldr r4, .L08068FEC  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #5
	bl Div
	ldr r2, .L08068FF0  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08068FE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08068FE8: .4byte 0x04000006
.L08068FEC: .4byte gUnknown_0201FB28
.L08068FF0: .4byte 0x04000016

	THUMB_FUNC_END func_08068FB8

	THUMB_FUNC_START func_08068FF4
func_08068FF4: @ 0x08068FF4
	push {r4, lr}
	ldr r0, .L08069024  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L0806901E
	ldr r4, .L08069028  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #4
	bl Div
	ldr r2, .L0806902C  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L0806901E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08069024: .4byte 0x04000006
.L08069028: .4byte gUnknown_0201FB28
.L0806902C: .4byte 0x04000016

	THUMB_FUNC_END func_08068FF4

	THUMB_FUNC_START func_08069030
func_08069030: @ 0x08069030
	push {r4, lr}
	ldr r0, .L08069060  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L0806905A
	ldr r4, .L08069064  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #3
	bl Div
	ldr r2, .L08069068  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L0806905A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08069060: .4byte 0x04000006
.L08069064: .4byte gUnknown_0201FB28
.L08069068: .4byte 0x04000016

	THUMB_FUNC_END func_08069030

	THUMB_FUNC_START func_0806906C
func_0806906C: @ 0x0806906C
	push {r4, lr}
	ldr r0, .L0806909C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L08069096
	ldr r4, .L080690A0  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #2
	bl Div
	ldr r2, .L080690A4  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L08069096:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0806909C: .4byte 0x04000006
.L080690A0: .4byte gUnknown_0201FB28
.L080690A4: .4byte 0x04000016

	THUMB_FUNC_END func_0806906C

	THUMB_FUNC_START func_080690A8
func_080690A8: @ 0x080690A8
	push {r4, lr}
	ldr r0, .L080690D8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi .L080690D2
	ldr r4, .L080690DC  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #1
	bl Div
	ldr r2, .L080690E0  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
.L080690D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080690D8: .4byte 0x04000006
.L080690DC: .4byte gUnknown_0201FB28
.L080690E0: .4byte 0x04000016

	THUMB_FUNC_END func_080690A8

	THUMB_FUNC_START func_080690E4
func_080690E4: @ 0x080690E4
	ldr r0, .L080690F4  @ 0x04000006
	ldrh r0, [r0]
	ldr r1, .L080690F8  @ 0x04000016
	ldr r0, .L080690FC  @ gUnknown_0201FB28
	ldr r0, [r0]
	negs r0, r0
	strh r0, [r1]
	bx lr
	.align 2, 0
.L080690F4: .4byte 0x04000006
.L080690F8: .4byte 0x04000016
.L080690FC: .4byte gUnknown_0201FB28

	THUMB_FUNC_END func_080690E4

	THUMB_FUNC_START func_08069100
func_08069100: @ 0x08069100
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, [r7, #0x44]
	subs r0, #1
	cmp r0, #4
	bls .L08069124
	b .L08069240
.L08069124:
	lsls r0, r0, #2
	ldr r1, .L08069130  @ .L08069134
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08069130: .4byte .L08069134
.L08069134: @ jump table
	.4byte .L08069148 @ case 0
	.4byte .L08069164 @ case 1
	.4byte .L08069198 @ case 2
	.4byte .L080691CC @ case 3
	.4byte .L08069200 @ case 4
.L08069148:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq .L0806918C
	cmp r0, #1
	beq .L08069156
	b .L08069246
.L08069156:
	ldr r0, .L08069160  @ func_08068DD8
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L08069160: .4byte func_08068DD8
.L08069164:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq .L0806918C
	cmp r0, #1
	bgt .L08069176
	cmp r0, #0
	beq .L080691B4
	b .L08069246
.L08069176:
	cmp r0, #2
	beq .L0806921C
	cmp r0, #3
	bne .L08069246
	ldr r0, .L08069188  @ func_08068F40
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L08069188: .4byte func_08068F40
.L0806918C:
	ldr r0, .L08069194  @ func_08068E8C
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L08069194: .4byte func_08068E8C
.L08069198:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq .L080691B4
	cmp r0, #1
	bgt .L080691AA
	cmp r0, #0
	beq .L080691C0
	b .L08069246
.L080691AA:
	cmp r0, #2
	beq .L0806921C
	cmp r0, #3
	bne .L08069246
	b .L080691C0
.L080691B4:
	ldr r0, .L080691BC  @ func_08068F04
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L080691BC: .4byte func_08068F04
.L080691C0:
	ldr r0, .L080691C8  @ func_08068F7C
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L080691C8: .4byte func_08068F7C
.L080691CC:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq .L080691E8
	cmp r0, #1
	bgt .L080691DE
	cmp r0, #0
	beq .L080691F4
	b .L08069246
.L080691DE:
	cmp r0, #2
	beq .L0806921C
	cmp r0, #3
	bne .L08069246
	b .L080691F4
.L080691E8:
	ldr r0, .L080691F0  @ func_08068FB8
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L080691F0: .4byte func_08068FB8
.L080691F4:
	ldr r0, .L080691FC  @ func_08068FF4
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L080691FC: .4byte func_08068FF4
.L08069200:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq .L08069228
	cmp r0, #1
	bgt .L08069212
	cmp r0, #0
	beq .L08069234
	b .L08069246
.L08069212:
	cmp r0, #2
	beq .L0806921C
	cmp r0, #3
	bne .L08069246
	b .L08069228
.L0806921C:
	ldr r0, .L08069224  @ func_080690E4
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L08069224: .4byte func_080690E4
.L08069228:
	ldr r0, .L08069230  @ func_08069030
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L08069230: .4byte func_08069030
.L08069234:
	ldr r0, .L0806923C  @ func_0806906C
	bl SetOnHBlankA
	b .L08069246
	.align 2, 0
.L0806923C: .4byte func_0806906C
.L08069240:
	ldr r0, .L08069278  @ func_080690E4
	bl SetOnHBlankA
.L08069246:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L0806927C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	mov r0, r8
	strh r0, [r7, #0x2e]
	b .L080692A0
	.align 2, 0
.L08069278: .4byte func_080690E4
.L0806927C:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L080692A0
	bl SpellFx_ClearBg1
	movs r0, #0
	bl SetOnHBlankA
	ldr r1, .L080692AC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r7, #0
	bl Proc_Break
.L080692A0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080692AC: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08069100

	THUMB_FUNC_START func_080692B0
func_080692B0: @ 0x080692B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0806930C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, .L08069310  @ gUnknown_0201FB28
	movs r0, #0x10
	str r0, [r1]
	ldr r0, .L08069314  @ gUnknown_085D83A0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, .L08069318  @ gUnknown_080DEDBC
	str r0, [r5, #0x48]
	ldr r0, .L0806931C  @ gUnknown_085D8348
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, .L08069320  @ gUnknown_085D8374
	str r0, [r5, #0x54]
	ldr r0, .L08069324  @ gUnknown_086A66D8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, .L08069328  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne .L08069344
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08069330
	ldr r2, .L0806932C  @ 0x0000FFF0
	movs r0, #1
	movs r1, #0x18
	bl SetBgOffset
	b .L0806934E
	.align 2, 0
.L0806930C: .4byte gUnknown_0201774C
.L08069310: .4byte gUnknown_0201FB28
.L08069314: .4byte gUnknown_085D83A0
.L08069318: .4byte gUnknown_080DEDBC
.L0806931C: .4byte gUnknown_085D8348
.L08069320: .4byte gUnknown_085D8374
.L08069324: .4byte gUnknown_086A66D8
.L08069328: .4byte gBattleAnimSceneLayoutEnum
.L0806932C: .4byte 0x0000FFF0
.L08069330:
	ldr r1, .L0806933C  @ 0x0000FFE8
	ldr r2, .L08069340  @ 0x0000FFF0
	movs r0, #1
	bl SetBgOffset
	b .L0806934E
	.align 2, 0
.L0806933C: .4byte 0x0000FFE8
.L08069340: .4byte 0x0000FFF0
.L08069344:
	ldr r2, .L08069358  @ 0x0000FFF0
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
.L0806934E:
	bl SpellFx_InitBg1Blend
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08069358: .4byte 0x0000FFF0

	THUMB_FUNC_END func_080692B0

	THUMB_FUNC_START func_0806935C
func_0806935C: @ 0x0806935C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt .L080693A2
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r5, r5, r6
	ldr r1, [r5]
	movs r2, #0x20
	movs r3, #0x14
	bl func_0805576C
	b .L080693C4
.L080693A2:
	movs r0, #6
	negs r0, r0
	cmp r5, r0
	bne .L080693B6
	bl func_080696F0
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	b .L080693C4
.L080693B6:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne .L080693C4
	adds r0, r7, #0
	bl Proc_Break
.L080693C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0806935C

	THUMB_FUNC_START func_080693CC
func_080693CC: @ 0x080693CC
	push {lr}
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, .L080693F0  @ gUnknown_080DEE40
	str r1, [r0, #0x48]
	ldr r1, .L080693F4  @ gUnknown_085D8478
	str r1, [r0, #0x4c]
	ldr r1, .L080693F8  @ gUnknown_085D847C
	str r1, [r0, #0x54]
	ldr r0, .L080693FC  @ gUnknown_086B52CC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r0}
	bx r0
	.align 2, 0
.L080693F0: .4byte gUnknown_080DEE40
.L080693F4: .4byte gUnknown_085D8478
.L080693F8: .4byte gUnknown_085D847C
.L080693FC: .4byte gUnknown_086B52CC

	THUMB_FUNC_END func_080693CC

	THUMB_FUNC_START func_08069400
func_08069400: @ 0x08069400
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x11
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	beq .L08069416
	negs r4, r4
.L08069416:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	movs r2, #0
	bl SetBgOffset
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt .L08069460
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	movs r2, #0x20
	movs r3, #0x14
	bl func_0805576C
	b .L0806947E
.L08069460:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne .L0806947E
	bl SpellFx_ClearBg1
	ldr r1, .L08069484  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_EndBlend
	adds r0, r6, #0
	bl Proc_Break
.L0806947E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08069484: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_08069400

	THUMB_FUNC_START func_08069488
func_08069488: @ 0x08069488
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080694D0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080694D4  @ gUnknown_085D8484
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, .L080694D8  @ gUnknown_080DEDFA
	str r1, [r0, #0x48]
	ldr r1, .L080694DC  @ gUnknown_085D83B8
	str r1, [r0, #0x4c]
	ldr r1, .L080694E0  @ gUnknown_085D83F8
	str r1, [r0, #0x54]
	ldr r1, .L080694E4  @ gUnknown_085D8438
	str r1, [r0, #0x58]
	ldr r0, .L080694E8  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne .L080694F8
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L080694EC
	movs r0, #1
	movs r1, #0x28
	b .L08069506
	.align 2, 0
.L080694D0: .4byte gUnknown_0201774C
.L080694D4: .4byte gUnknown_085D8484
.L080694D8: .4byte gUnknown_080DEDFA
.L080694DC: .4byte gUnknown_085D83B8
.L080694E0: .4byte gUnknown_085D83F8
.L080694E4: .4byte gUnknown_085D8438
.L080694E8: .4byte gBattleAnimSceneLayoutEnum
.L080694EC:
	ldr r1, .L080694F4  @ 0x0000FFE8
	movs r0, #1
	b .L08069506
	.align 2, 0
.L080694F4: .4byte 0x0000FFE8
.L080694F8:
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0806950E
	movs r0, #1
	movs r1, #0x10
.L08069506:
	movs r2, #0
	bl SetBgOffset
	b .L08069518
.L0806950E:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
.L08069518:
	bl SpellFx_InitBg1Blend
	movs r0, #0
	bl SetBlendBackdropB
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08069488

	THUMB_FUNC_START func_08069528
func_08069528: @ 0x08069528
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_08069528

	THUMB_FUNC_START func_08069530
func_08069530: @ 0x08069530
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	ldr r0, .L08069564  @ gPal
	mov r9, r0
	ldr r1, .L08069568  @ gUnknown_020165C8
	mov r8, r1
	ldr r0, [sp, #4]
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x28
	ble .L0806956C
	adds r3, r1, #0
	subs r3, #0x28
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	b .L08069582
	.align 2, 0
.L08069564: .4byte gPal
.L08069568: .4byte gUnknown_020165C8
.L0806956C:
	cmp r1, #0x18
	ble .L08069574
	movs r6, #0x10
	b .L08069588
.L08069574:
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
.L08069582:
	bl Interpolate
	adds r6, r0, #0
.L08069588:
	mov r2, r9
	ldrh r0, [r2]
	mov r7, r8
	strh r0, [r7]
	movs r2, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	str r0, [sp, #8]
.L08069598:
	subs r0, r2, #1
	cmp r0, #0x1d
	bhi .L0806962C
	lsls r0, r0, #2
	ldr r1, .L080695A8  @ .L080695AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080695A8: .4byte .L080695AC
.L080695AC: @ jump table
	.4byte .L08069624 @ case 0
	.4byte .L08069624 @ case 1
	.4byte .L08069624 @ case 2
	.4byte .L0806962C @ case 3
	.4byte .L0806962C @ case 4
	.4byte .L0806962C @ case 5
	.4byte .L0806962C @ case 6
	.4byte .L0806962C @ case 7
	.4byte .L0806962C @ case 8
	.4byte .L0806962C @ case 9
	.4byte .L0806962C @ case 10
	.4byte .L0806962C @ case 11
	.4byte .L0806962C @ case 12
	.4byte .L0806962C @ case 13
	.4byte .L0806962C @ case 14
	.4byte .L08069624 @ case 15
	.4byte .L0806962C @ case 16
	.4byte .L0806962C @ case 17
	.4byte .L0806962C @ case 18
	.4byte .L0806962C @ case 19
	.4byte .L08069624 @ case 20
	.4byte .L08069624 @ case 21
	.4byte .L0806962C @ case 22
	.4byte .L0806962C @ case 23
	.4byte .L0806962C @ case 24
	.4byte .L0806962C @ case 25
	.4byte .L08069624 @ case 26
	.4byte .L08069624 @ case 27
	.4byte .L08069624 @ case 28
	.4byte .L08069624 @ case 29
.L08069624:
	ldr r1, .L08069628  @ 0x00007C1F
	b .L0806962E
	.align 2, 0
.L08069628: .4byte 0x00007C1F
.L0806962C:
	movs r1, #0
.L0806962E:
	movs r7, #2
	add r9, r7
	movs r0, #2
	add r8, r0
	lsrs r7, r1, #5
	str r7, [sp, #0x10]
	lsrs r0, r1, #0xa
	str r0, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0xc]
	movs r2, #0x1f
	mov ip, r2
	movs r5, #0x1f
	movs r0, #0x10
	subs r4, r0, r6
	movs r7, #0xe
	str r7, [sp, #0x18]
	ands r1, r5
	adds r0, r1, #0
	muls r0, r6, r0
	mov sl, r0
.L08069658:
	mov r2, r9
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	add r3, sl
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r7, ip
	ands r0, r7
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, ip
	ands r1, r0
	muls r1, r4, r1
	ldr r0, [sp, #0x14]
	ands r0, r7
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	ands r1, r5
	lsls r1, r1, #0xa
	ands r2, r5
	lsls r2, r2, #5
	orrs r1, r2
	ands r3, r5
	orrs r3, r1
	mov r0, r8
	strh r3, [r0]
	movs r1, #2
	add r9, r1
	add r8, r1
	ldr r2, [sp, #0x18]
	subs r2, #1
	str r2, [sp, #0x18]
	cmp r2, #0
	bge .L08069658
	ldr r2, [sp, #0xc]
	cmp r2, #0x1f
	bgt .L080696B2
	b .L08069598
.L080696B2:
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r0, .L080696EC  @ gUnknown_020165C8
	bl CpuFastSet
	bl DisablePalSync
	ldr r7, [sp, #8]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0x40
	bne .L080696D4
	ldr r0, [sp, #4]
	bl Proc_Break
.L080696D4:
	ldr r2, [sp, #8]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080696EC: .4byte gUnknown_020165C8

	THUMB_FUNC_END func_08069530

	THUMB_FUNC_START func_080696F0
func_080696F0: @ 0x080696F0
	push {lr}
	ldr r0, .L08069700  @ gUnknown_085D84B4
	movs r1, #0
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08069700: .4byte gUnknown_085D84B4

	THUMB_FUNC_END func_080696F0

	THUMB_FUNC_START func_08069704
func_08069704: @ 0x08069704
	push {lr}
	adds r3, r0, #0
	cmp r1, #5
	bhi .L08069764
	lsls r0, r1, #2
	ldr r1, .L08069718  @ .L0806971C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08069718: .4byte .L0806971C
.L0806971C: @ jump table
	.4byte .L08069734 @ case 0
	.4byte .L0806973C @ case 1
	.4byte .L08069744 @ case 2
	.4byte .L0806974C @ case 3
	.4byte .L08069754 @ case 4
	.4byte .L0806975C @ case 5
.L08069734:
	ldr r1, .L08069738  @ gUnknown_085D84D4
	b .L08069766
	.align 2, 0
.L08069738: .4byte gUnknown_085D84D4
.L0806973C:
	ldr r1, .L08069740  @ gUnknown_085D8524
	b .L08069766
	.align 2, 0
.L08069740: .4byte gUnknown_085D8524
.L08069744:
	ldr r1, .L08069748  @ gUnknown_085D8574
	b .L08069766
	.align 2, 0
.L08069748: .4byte gUnknown_085D8574
.L0806974C:
	ldr r1, .L08069750  @ gUnknown_085D85C4
	b .L08069766
	.align 2, 0
.L08069750: .4byte gUnknown_085D85C4
.L08069754:
	ldr r1, .L08069758  @ gUnknown_085D8614
	b .L08069766
	.align 2, 0
.L08069758: .4byte gUnknown_085D8614
.L0806975C:
	ldr r1, .L08069760  @ gUnknown_085D8664
	b .L08069766
	.align 2, 0
.L08069760: .4byte gUnknown_085D8664
.L08069764:
	ldr r1, .L08069778  @ gUnknown_085D86B4
.L08069766:
	lsls r0, r3, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #8
	pop {r1}
	bx r1
	.align 2, 0
.L08069778: .4byte gUnknown_085D86B4

	THUMB_FUNC_END func_08069704

	THUMB_FUNC_START func_0806977C
func_0806977C: @ 0x0806977C
	push {lr}
	adds r3, r0, #0
	cmp r1, #5
	bhi .L080697DC
	lsls r0, r1, #2
	ldr r1, .L08069790  @ .L08069794
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08069790: .4byte .L08069794
.L08069794: @ jump table
	.4byte .L080697AC @ case 0
	.4byte .L080697B4 @ case 1
	.4byte .L080697BC @ case 2
	.4byte .L080697C4 @ case 3
	.4byte .L080697CC @ case 4
	.4byte .L080697D4 @ case 5
.L080697AC:
	ldr r1, .L080697B0  @ gUnknown_085D84D4
	b .L080697DE
	.align 2, 0
.L080697B0: .4byte gUnknown_085D84D4
.L080697B4:
	ldr r1, .L080697B8  @ gUnknown_085D8524
	b .L080697DE
	.align 2, 0
.L080697B8: .4byte gUnknown_085D8524
.L080697BC:
	ldr r1, .L080697C0  @ gUnknown_085D8574
	b .L080697DE
	.align 2, 0
.L080697C0: .4byte gUnknown_085D8574
.L080697C4:
	ldr r1, .L080697C8  @ gUnknown_085D85C4
	b .L080697DE
	.align 2, 0
.L080697C8: .4byte gUnknown_085D85C4
.L080697CC:
	ldr r1, .L080697D0  @ gUnknown_085D8614
	b .L080697DE
	.align 2, 0
.L080697D0: .4byte gUnknown_085D8614
.L080697D4:
	ldr r1, .L080697D8  @ gUnknown_085D8664
	b .L080697DE
	.align 2, 0
.L080697D8: .4byte gUnknown_085D8664
.L080697DC:
	ldr r1, .L080697F0  @ gUnknown_085D86B4
.L080697DE:
	lsls r0, r3, #2
	adds r0, r0, r1
	movs r1, #2
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #8
	pop {r1}
	bx r1
	.align 2, 0
.L080697F0: .4byte gUnknown_085D86B4

	THUMB_FUNC_END func_0806977C

	THUMB_FUNC_START func_080697F4
func_080697F4: @ 0x080697F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08069816
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl func_08069704
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	adds r1, r1, r0
	b .L08069828
.L08069816:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl func_08069704
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	subs r1, r1, r0
.L08069828:
	strh r1, [r2, #2]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl func_0806977C
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x3a]
	adds r1, r1, r0
	strh r1, [r2, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq .L0806985A
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x4c]
	cmp r1, r0
	bne .L0806986E
.L0806985A:
	ldr r0, .L08069874  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl BsoRemove
	adds r0, r4, #0
	bl Proc_Break
.L0806986E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08069874: .4byte gUnknown_0201774C

	THUMB_FUNC_END func_080697F4

	THUMB_FUNC_START func_08069878
func_08069878: @ 0x08069878
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	ldr r1, .L080698CC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, .L080698D0  @ gUnknown_085D8704
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #1
	beq .L080698E4
	cmp r4, #1
	bgt .L080698D4
	cmp r4, #0
	beq .L080698DA
	b .L080698F4
	.align 2, 0
.L080698CC: .4byte gUnknown_0201774C
.L080698D0: .4byte gUnknown_085D8704
.L080698D4:
	cmp r4, #2
	beq .L080698EC
	b .L080698F4
.L080698DA:
	ldr r3, .L080698E0  @ gUnknown_086A2724
	b .L080698F6
	.align 2, 0
.L080698E0: .4byte gUnknown_086A2724
.L080698E4:
	ldr r3, .L080698E8  @ gUnknown_086A2844
	b .L080698F6
	.align 2, 0
.L080698E8: .4byte gUnknown_086A2844
.L080698EC:
	ldr r3, .L080698F0  @ gUnknown_086A273C
	b .L080698F6
	.align 2, 0
.L080698F0: .4byte gUnknown_086A273C
.L080698F4:
	ldr r3, .L08069928  @ gUnknown_086A285C
.L080698F6:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [r5, #0x44]
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [r5, #0x48]
	mov r0, r9
	str r0, [r5, #0x4c]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl func_08055554
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L0806992C
	movs r0, #0x58
	b .L0806992E
	.align 2, 0
.L08069928: .4byte gUnknown_086A285C
.L0806992C:
	movs r0, #0x98
.L0806992E:
	strh r0, [r5, #0x32]
	movs r0, #0x50
	strh r0, [r5, #0x3a]
	ldr r0, .L08069950  @ gBattleAnimSceneLayoutEnum
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne .L0806995A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08069954
	ldrh r0, [r5, #0x32]
	subs r0, #0x18
	b .L08069958
	.align 2, 0
.L08069950: .4byte gBattleAnimSceneLayoutEnum
.L08069954:
	ldrh r0, [r5, #0x32]
	adds r0, #0x18
.L08069958:
	strh r0, [r5, #0x32]
.L0806995A:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne .L08069976
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	bl func_08069704
	ldrh r1, [r5, #0x32]
	adds r1, r1, r0
	b .L08069986
.L08069976:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	bl func_08069704
	ldrh r1, [r5, #0x32]
	subs r1, r1, r0
.L08069986:
	strh r1, [r4, #2]
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	bl func_0806977C
	ldrh r1, [r5, #0x3a]
	adds r1, r1, r0
	strh r1, [r4, #4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08069878

	THUMB_FUNC_START func_080699A8
func_080699A8: @ 0x080699A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
