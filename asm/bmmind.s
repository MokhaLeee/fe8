	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Unit Action stuff (why "mind"?)

	THUMB_FUNC_START StoreRNStateToActionStruct
StoreRNStateToActionStruct: @ 0x08031FEC
	push {lr}
	ldr r0, .L08031FF8  @ gAction
	bl RandGetSt
	pop {r0}
	bx r0
	.align 2, 0
.L08031FF8: .4byte gAction

	THUMB_FUNC_END StoreRNStateToActionStruct

	THUMB_FUNC_START LoadRNStateFromActionStruct
LoadRNStateFromActionStruct: @ 0x08031FFC
	push {lr}
	ldr r0, .L08032008  @ gAction
	bl RandSetSt
	pop {r0}
	bx r0
	.align 2, 0
.L08032008: .4byte gAction

	THUMB_FUNC_END LoadRNStateFromActionStruct

	THUMB_FUNC_START ApplyUnitAction
ApplyUnitAction: @ 0x0803200C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L08032054  @ gAction
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldr r1, .L08032058  @ gActiveUnit
	str r0, [r1]
	ldrb r0, [r5, #0x11]
	cmp r0, #2
	bne .L0803203C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldrb r1, [r5, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIid
	cmp r0, #0xa6
	bne .L0803203C
	b .L08032148
.L0803203C:
	ldr r0, .L08032054  @ gAction
	ldrb r0, [r0, #0x11]
	subs r0, #1
	cmp r0, #0x1d
	bls .L08032048
	b .L0803215C
.L08032048:
	lsls r0, r0, #2
	ldr r1, .L0803205C  @ .L08032060
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08032054: .4byte gAction
.L08032058: .4byte gActiveUnit
.L0803205C: .4byte .L08032060
.L08032060: @ jump table
	.4byte .L080320D8 @ case 0
	.4byte .L08032104 @ case 1
	.4byte .L08032148 @ case 2
	.4byte .L0803210C @ case 3
	.4byte .L0803215C @ case 4
	.4byte .L08032124 @ case 5
	.4byte .L0803212C @ case 6
	.4byte .L08032134 @ case 7
	.4byte .L080320EC @ case 8
	.4byte .L080320F4 @ case 9
	.4byte .L0803215C @ case 10
	.4byte .L0803215C @ case 11
	.4byte .L0803215C @ case 12
	.4byte .L08032114 @ case 13
	.4byte .L0803211C @ case 14
	.4byte .L080320FC @ case 15
	.4byte .L080320FC @ case 16
	.4byte .L08032148 @ case 17
	.4byte .L0803215C @ case 18
	.4byte .L08032148 @ case 19
	.4byte .L08032152 @ case 20
	.4byte .L0803215C @ case 21
	.4byte .L0803215C @ case 22
	.4byte .L0803215C @ case 23
	.4byte .L0803213C @ case 24
	.4byte .L08032148 @ case 25
	.4byte .L0803215C @ case 26
	.4byte .L0803215C @ case 27
	.4byte .L0803215C @ case 28
	.4byte .L080320D8 @ case 29
.L080320D8:
	ldr r0, .L080320E8  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	b .L0803215C
	.align 2, 0
.L080320E8: .4byte gActiveUnit
.L080320EC:
	adds r0, r4, #0
	bl ActionRescue
	b .L08032142
.L080320F4:
	adds r0, r4, #0
	bl ActionDrop
	b .L08032142
.L080320FC:
	adds r0, r4, #0
	bl ActionVisitAndSieze
	b .L08032142
.L08032104:
	adds r0, r4, #0
	bl ActionCombat
	b .L08032142
.L0803210C:
	adds r0, r4, #0
	bl ActionDance
	b .L08032142
.L08032114:
	adds r0, r4, #0
	bl ActionTalk
	b .L08032142
.L0803211C:
	adds r0, r4, #0
	bl ActionSupport
	b .L08032142
.L08032124:
	adds r0, r4, #0
	bl ActionSteal
	b .L08032142
.L0803212C:
	adds r0, r4, #0
	bl ActionSummon
	b .L08032142
.L08032134:
	adds r0, r4, #0
	bl ActionSummonDK
	b .L08032142
.L0803213C:
	adds r0, r4, #0
	bl ActionArena
.L08032142:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L0803215E
.L08032148:
	adds r0, r4, #0
	bl ActionStaffDoorChestUseItem
	movs r0, #0
	b .L0803215E
.L08032152:
	adds r0, r4, #0
	bl ActionPick
	movs r0, #0
	b .L0803215E
.L0803215C:
	movs r0, #1
.L0803215E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ApplyUnitAction

	THUMB_FUNC_START ActionRescue
ActionRescue: @ 0x08032164
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L080321B4  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r4, r0, #0
	bl TryRemoveUnitFromBallista
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Make6CKOIDO
	adds r0, r5, #0
	adds r1, r4, #0
	bl UnitRescue
	adds r0, r4, #0
	bl HideUnitSprite
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080321B4: .4byte gAction

	THUMB_FUNC_END ActionRescue

	THUMB_FUNC_START func_080321B8
func_080321B8: @ 0x080321B8
	push {lr}
	ldr r1, [r0, #0x54]
	bl func_080377F0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080321B8

	THUMB_FUNC_START func_080321C8
func_080321C8: @ 0x080321C8
	push {lr}
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080321C8

	THUMB_FUNC_START ActionDrop
ActionDrop: @ 0x080321E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L08032248  @ gAction
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0x14]
	ldr r1, .L0803224C  @ gMapHidden
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r4, #0x13]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08032254
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #2
	adds r3, r6, #0
	bl Make6CKOIDO
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	bl UnitDropRescue
	ldr r0, .L08032250  @ gUnknown_0859DA6C
	adds r1, r6, #0
	bl SpawnProcLocking
	str r5, [r0, #0x54]
	b .L08032262
	.align 2, 0
.L08032248: .4byte gAction
.L0803224C: .4byte gMapHidden
.L08032250: .4byte gUnknown_0859DA6C
.L08032254:
	ldr r0, .L0803226C  @ gUnitMoveBuffer
	movs r1, #0xa
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	bl MU_StartMoveScript_Auto
.L08032262:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0803226C: .4byte gUnitMoveBuffer

	THUMB_FUNC_END ActionDrop

	THUMB_FUNC_START ActionVisitAndSieze
ActionVisitAndSieze: @ 0x08032270
	push {r4, r5, lr}
	ldr r5, .L08032298  @ gAction
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl RunLocationEvents
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08032298: .4byte gAction

	THUMB_FUNC_END ActionVisitAndSieze

	THUMB_FUNC_START ActionCombat
ActionCombat: @ 0x0803229C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, .L0803231C  @ gAction
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIid
	ldr r1, .L08032320  @ gBattleUnitA
	adds r1, #0x7e
	movs r2, #0
	strb r2, [r1]
	cmp r0, #0xa6
	bne .L080322FC
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl MakeTargetListForFuckingNightmare
	bl GetTargetListSize
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge .L080322FC
.L080322E0:
	adds r0, r4, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	movs r1, #2
	bl SetUnitStatus
	adds r4, #1
	cmp r4, r5
	blt .L080322E0
.L080322FC:
	cmp r6, #0
	bne .L08032304
	bl InitObstacleBattleUnit
.L08032304:
	ldr r1, .L0803231C  @ gAction
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne .L08032324
	ldrb r0, [r1, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl BattleGenerateBallistaReal
	b .L08032330
	.align 2, 0
.L0803231C: .4byte gAction
.L08032320: .4byte gBattleUnitA
.L08032324:
	ldrb r0, [r1, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl BattleGenerateReal
.L08032330:
	ldr r0, .L08032340  @ gUnknown_0859DABC
	adds r1, r7, #0
	bl SpawnProcLocking
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08032340: .4byte gUnknown_0859DABC

	THUMB_FUNC_END ActionCombat

	THUMB_FUNC_START ActionArena
ActionArena: @ 0x08032344
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08032354  @ gUnknown_0859DB24
	bl SpawnProcLocking
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
.L08032354: .4byte gUnknown_0859DB24

	THUMB_FUNC_END ActionArena

	THUMB_FUNC_START ActionDance
ActionDance: @ 0x08032358
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0803239C  @ gAction
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, .L080323A0  @ 0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #1
	negs r1, r1
	bl BattleInitItemEffect
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl BattleInitItemEffectTarget
	ldr r1, .L080323A4  @ gBattleStats
	movs r0, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	bl BattleApplyMiscAction
	bl BeginBattleAnimations
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0803239C: .4byte gAction
.L080323A0: .4byte 0xFFFFFBBD
.L080323A4: .4byte gBattleStats

	THUMB_FUNC_END ActionDance

	THUMB_FUNC_START ActionTalk
ActionTalk: @ 0x080323A8
	push {r4, r5, lr}
	ldr r4, .L080323D0  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r0, [r0]
	ldrb r5, [r0, #4]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl RunCharacterEvents
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080323D0: .4byte gAction

	THUMB_FUNC_END ActionTalk

	THUMB_FUNC_START ActionSupport
ActionSupport: @ 0x080323D4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	ldr r0, .L08032474  @ gAction
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, .L08032478  @ gActiveUnit
	mov r9, r0
	ldr r0, [r0]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl GetUnitSupportNumByPid
	adds r7, r0, #0
	mov r1, r9
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl GetUnitSupportNumByPid
	mov r8, r0
	adds r0, r4, #0
	mov r1, r8
	bl CanUnitSupportNow
	mov r2, r9
	ldr r0, [r2]
	adds r1, r7, #0
	bl UnitGainSupportLevel
	adds r0, r4, #0
	mov r1, r8
	bl UnitGainSupportLevel
	mov r1, r9
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r6, [r1, #4]
	ldr r1, [r4]
	ldrb r5, [r1, #4]
	adds r1, r7, #0
	bl GetUnitSupportLevel
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl StartSupportTalk
	mov r2, r9
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r4, #0x32
	add r4, r8
	ldrb r1, [r4]
	cmp r0, r1
	beq .L08032464
	cmp r0, r1
	ble .L08032456
	strb r0, [r4]
.L08032456:
	cmp r0, r1
	bge .L08032464
	mov r2, r9
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	strb r1, [r0]
.L08032464:
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08032474: .4byte gAction
.L08032478: .4byte gActiveUnit

	THUMB_FUNC_END ActionSupport

	THUMB_FUNC_START ActionSteal
ActionSteal: @ 0x0803247C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, .L080324F4  @ gAction
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq .L080324AC
	ldrb r4, [r4, #0x12]
	adds r0, r5, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne .L080324AC
	ldr r0, [r5, #0xc]
	ldr r1, .L080324F8  @ 0xFFFFEFFF
	ands r0, r1
	str r0, [r5, #0xc]
.L080324AC:
	ldr r4, .L080324F4  @ gAction
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl UnitRemoveItem
	movs r0, #0xff
	ands r0, r6
	cmp r0, #0x9a
	blt .L080324FC
	cmp r0, #0xa0
	ble .L080324DE
	cmp r0, #0xb9
	bgt .L080324FC
	cmp r0, #0xb8
	blt .L080324FC
.L080324DE:
	bl GetGold
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetItemCost
	adds r4, r4, r0
	adds r0, r4, #0
	bl SetGold
	b .L0803250A
	.align 2, 0
.L080324F4: .4byte gAction
.L080324F8: .4byte 0xFFFFEFFF
.L080324FC:
	ldr r0, .L0803254C  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl UnitAddItem
.L0803250A:
	ldr r5, .L0803254C  @ gAction
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #1
	negs r1, r1
	bl BattleInitItemEffect
	ldr r4, .L08032550  @ gBattleUnitB
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl InitBattleUnit
	adds r4, #0x48
	strh r6, [r4]
	adds r0, r7, #0
	bl BattleApplyMiscAction
	bl MU_EndAll
	bl BeginMapAnimForSteal
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0803254C: .4byte gAction
.L08032550: .4byte gBattleUnitB

	THUMB_FUNC_END ActionSteal

	THUMB_FUNC_START ActionSummon
ActionSummon: @ 0x08032554
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08032578  @ gBattleUnitA
	ldr r1, .L0803257C  @ gActiveUnit
	ldr r1, [r1]
	bl InitBattleUnit
	adds r0, r4, #0
	bl BattleApplyMiscAction
	bl MU_EndAll
	bl BeginMapAnimForSummon
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08032578: .4byte gBattleUnitA
.L0803257C: .4byte gActiveUnit

	THUMB_FUNC_END ActionSummon

	THUMB_FUNC_START ActionSummonDK
ActionSummonDK: @ 0x08032580
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080325A4  @ gBattleUnitA
	ldr r1, .L080325A8  @ gActiveUnit
	ldr r1, [r1]
	bl InitBattleUnit
	adds r0, r4, #0
	bl BattleApplyMiscAction
	bl MU_EndAll
	bl BeginMapAnimForSummonDK
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080325A4: .4byte gBattleUnitA
.L080325A8: .4byte gActiveUnit

	THUMB_FUNC_END ActionSummonDK

	THUMB_FUNC_START SpriteJumpAnimation_Loop
SpriteJumpAnimation_Loop: @ 0x080325AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x38
	ldrsh r1, [r6, r0]
	movs r3, #0x3c
	ldrsh r2, [r6, r3]
	adds r7, r6, #0
	adds r7, #0x46
	movs r4, #0
	ldrsh r3, [r7, r4]
	adds r5, r6, #0
	adds r5, #0x48
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	mov r8, r0
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r3, #0x3e
	ldrsh r2, [r6, r3]
	movs r4, #0
	ldrsh r3, [r7, r4]
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r2, r0, #0
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r2, r2, r0
	adds r3, r6, #0
	adds r3, #0x42
	ldrh r0, [r3]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	ldr r1, .L08032654  @ gBmSt
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	mov r3, r8
	subs r4, r3, r0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	ldr r3, [r6, #0x2c]
	movs r0, #7
	adds r1, r4, #0
	bl PutUnitSprite
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0
	ldrsh r1, [r5, r4]
	cmp r0, r1
	bne .L08032646
	adds r0, r6, #0
	bl Proc_Break
.L08032646:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08032654: .4byte gBmSt

	THUMB_FUNC_END SpriteJumpAnimation_Loop

	THUMB_FUNC_START SpriteJumpAnimation_ExecAnyTrap
SpriteJumpAnimation_ExecAnyTrap: @ 0x08032658
	push {lr}
	ldr r1, [r0, #0x2c]
	bl ExecTrap_QuietMaybe
	pop {r0}
	bx r0

	THUMB_FUNC_END SpriteJumpAnimation_ExecAnyTrap

	THUMB_FUNC_START SpriteJumpAnimation_Cleanup
SpriteJumpAnimation_Cleanup: @ 0x08032664
	push {lr}
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r0}
	bx r0

	THUMB_FUNC_END SpriteJumpAnimation_Cleanup

	THUMB_FUNC_START DropRescuedUnitIfDead
DropRescuedUnitIfDead: @ 0x08032674
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r6, r0, #0
	cmp r6, #0
	bne .L08032716
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08032716
	ldr r0, .L0803271C  @ gUnknown_0859DA94
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r4, r0, #0
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, r5, #0
	bl UnitGetDropPositionOnDeath
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	adds r0, r5, #0
	bl UnitDropRescue
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x38]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	adds r0, r4, #0
	adds r0, #0x40
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldr r0, .L08032720  @ 0x0000FFFB
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r1, #4
	movs r0, #0xb
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpriteId
	bl UseUnitSprite
	bl ForceSyncUnitSpriteSheet
	ldr r0, .L08032724  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08032716
	movs r0, #0xac
	bl m4aSongNumStart
.L08032716:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803271C: .4byte gUnknown_0859DA94
.L08032720: .4byte 0x0000FFFB
.L08032724: .4byte gPlaySt

	THUMB_FUNC_END DropRescuedUnitIfDead

	THUMB_FUNC_START KillUnitIfDefeatedBy
KillUnitIfDefeatedBy: @ 0x08032728
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0803274A
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	movs r2, #2
	bl BWL_SetDeathStats
	adds r0, r4, #0
	bl KillUnit
.L0803274A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END KillUnitIfDefeatedBy

	THUMB_FUNC_START KillUnitIfNoHealth
KillUnitIfNoHealth: @ 0x08032750
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0803276E
	adds r0, r4, #0
	bl KillUnit
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #6
	bl BWL_SetDeathStats
.L0803276E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END KillUnitIfNoHealth

	THUMB_FUNC_START BATTLE_GOTO1_IfNobodyIsDead
BATTLE_GOTO1_IfNobodyIsDead: @ 0x08032774
	push {lr}
	adds r2, r0, #0
	ldr r0, .L080327A8  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L0803279C
	ldr r0, .L080327AC  @ gBattleUnitA
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080327A4
	ldr r0, .L080327B0  @ gBattleUnitB
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080327A4
.L0803279C:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
.L080327A4:
	pop {r0}
	bx r0
	.align 2, 0
.L080327A8: .4byte gBattleStats
.L080327AC: .4byte gBattleUnitA
.L080327B0: .4byte gBattleUnitB

	THUMB_FUNC_END BATTLE_GOTO1_IfNobodyIsDead

	THUMB_FUNC_START DidUnitDie
DidUnitDie: @ 0x080327B4
	push {lr}
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L080327C2
	movs r0, #1
	b .L080327C4
.L080327C2:
	movs r0, #0
.L080327C4:
	pop {r1}
	bx r1

	THUMB_FUNC_END DidUnitDie

	THUMB_FUNC_START BATTLE_ProbablyMakesTheDeadUnitDissapear
BATTLE_ProbablyMakesTheDeadUnitDissapear: @ 0x080327C8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x54]
	ldr r7, .L08032850  @ gBattleUnitA
	adds r0, r7, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080327F2
	ldr r0, .L08032854  @ ProcScr_MoveUnit
	bl FindProc
	adds r4, r0, #0
	bl MU_StartDeathFade
	str r4, [r6, #0x54]
	adds r0, r7, #0
	bl TryRemoveUnitFromBallista
.L080327F2:
	ldr r5, .L08032858  @ gBattleUnitB
	adds r0, r5, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803284A
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl TryRemoveUnitFromBallista
	bl RefreshUnitSprites
	adds r0, r5, #0
	bl MU_Create
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingDirection
	ldr r1, .L0803285C  @ gUnitMoveBuffer
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl MU_StartMoveScript
	adds r0, r4, #0
	bl MU_StartDeathFade
	str r4, [r6, #0x54]
.L0803284A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08032850: .4byte gBattleUnitA
.L08032854: .4byte ProcScr_MoveUnit
.L08032858: .4byte gBattleUnitB
.L0803285C: .4byte gUnitMoveBuffer

	THUMB_FUNC_END BATTLE_ProbablyMakesTheDeadUnitDissapear

	THUMB_FUNC_START BATTLE_DeleteLinkedMOVEUNIT
BATTLE_DeleteLinkedMOVEUNIT: @ 0x08032860
	push {lr}
	ldr r0, [r0, #0x54]
	bl MU_End
	pop {r0}
	bx r0

	THUMB_FUNC_END BATTLE_DeleteLinkedMOVEUNIT

	THUMB_FUNC_START BATTLE_HandleUnitDeaths
BATTLE_HandleUnitDeaths: @ 0x0803286C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DropRescuedUnitIfDead
	adds r0, r5, #0
	adds r1, r4, #0
	bl DropRescuedUnitIfDead
	adds r0, r6, #0
	adds r1, r4, #0
	bl KillUnitIfDefeatedBy
	adds r0, r4, #0
	adds r1, r6, #0
	bl KillUnitIfDefeatedBy
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END BATTLE_HandleUnitDeaths

	THUMB_FUNC_START func_080328B0
func_080328B0: @ 0x080328B0
	push {r4, lr}
	bl GetCurrentMapMusicIndex
	adds r4, r0, #0
	bl GetCurrentBgmSong
	cmp r0, r4
	beq .L080328CA
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl StartBgmExt
.L080328CA:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080328B0

	THUMB_FUNC_START BATTLE_HandleItemDrop
BATTLE_HandleItemDrop: @ 0x080328D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r6, .L08032960  @ gBattleUnitA
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	adds r0, #0x64
	strh r1, [r0]
	ldr r4, .L08032964  @ gBattleUnitB
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	mov r1, r8
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne .L0803290C
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
.L0803290C:
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne .L08032928
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r5, r0, #0
.L08032928:
	cmp r7, #0
	beq .L08032968
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq .L08032968
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq .L08032968
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L08032968
	adds r0, r7, #0
	bl GetUnitLastItem
	adds r1, r0, #0
	adds r0, r5, #0
	mov r2, r8
	bl NewGeneralItemGot
	movs r0, #0
	b .L0803296A
	.align 2, 0
.L08032960: .4byte gBattleUnitA
.L08032964: .4byte gBattleUnitB
.L08032968:
	movs r0, #1
.L0803296A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END BATTLE_HandleItemDrop

	THUMB_FUNC_START func_08032974
func_08032974: @ 0x08032974
	push {lr}
	adds r2, r0, #0
	ldr r1, .L08032998  @ gBattleUnitB
	movs r0, #1
	strb r0, [r1, #0x12]
	strb r0, [r1, #0x13]
	ldr r0, .L0803299C  @ gBattleUnitA
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08032994
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
.L08032994:
	pop {r0}
	bx r0
	.align 2, 0
.L08032998: .4byte gBattleUnitB
.L0803299C: .4byte gBattleUnitA

	THUMB_FUNC_END func_08032974

	THUMB_FUNC_START BATTLE_HandleActiveUnitDeath
BATTLE_HandleActiveUnitDeath: @ 0x080329A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L080329BC  @ gActiveUnit
	ldr r0, [r4]
	bl KillUnitIfNoHealth
	ldr r1, [r4]
	adds r0, r5, #0
	bl DropRescuedUnitIfDead
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080329BC: .4byte gActiveUnit

	THUMB_FUNC_END BATTLE_HandleActiveUnitDeath

	THUMB_FUNC_START func_080329C0
func_080329C0: @ 0x080329C0
	push {r4, lr}
	ldr r4, .L080329D4  @ gUnknown_0203A974
	adds r1, r4, #0
	movs r2, #7
	bl CpuFastSet
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080329D4: .4byte gUnknown_0203A974

	THUMB_FUNC_END func_080329C0

.align 2, 0
