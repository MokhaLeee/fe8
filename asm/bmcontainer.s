	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ "Container" (aka Convoy) related things

	THUMB_FUNC_START GetConvoyItemArray
GetConvoyItemArray: @ 0x08031500
	ldr r0, .L08031504  @ gConvoyItemArray
	bx lr
	.align 2, 0
.L08031504: .4byte gConvoyItemArray

	THUMB_FUNC_END GetConvoyItemArray

	THUMB_FUNC_START ClearConvoyItems
ClearConvoyItems: @ 0x08031508
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, .L08031524  @ gConvoyItemArray
	ldr r2, .L08031528  @ 0x01000064
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08031524: .4byte gConvoyItemArray
.L08031528: .4byte 0x01000064

	THUMB_FUNC_END ClearConvoyItems

	THUMB_FUNC_START ShrinkConvoyItemList
ShrinkConvoyItemList: @ 0x0803152C
	push {r4, r5, r6, lr}
	ldr r6, .L0803156C  @ gBuf
	adds r4, r6, #0
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r5, #0
.L0803153A:
	ldrh r0, [r1]
	cmp r0, #0
	beq .L08031544
	strh r0, [r4]
	adds r4, #2
.L08031544:
	adds r1, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x63
	bls .L0803153A
	movs r0, #0
	strh r0, [r4]
	bl ClearConvoyItems
	bl GetConvoyItemArray
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r5, #0
	bl CpuSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803156C: .4byte gBuf

	THUMB_FUNC_END ShrinkConvoyItemList

	THUMB_FUNC_START GetConvoyItemCount
GetConvoyItemCount: @ 0x08031570
	push {lr}
	movs r3, #0
	ldr r2, .L08031590  @ gConvoyItemArray
	movs r1, #0x63
.L08031578:
	ldrh r0, [r2]
	cmp r0, #0
	beq .L08031580
	adds r3, #1
.L08031580:
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L08031578
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
.L08031590: .4byte gConvoyItemArray

	THUMB_FUNC_END GetConvoyItemCount

	THUMB_FUNC_START AddItemToConvoy
AddItemToConvoy: @ 0x08031594
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L080315B0  @ gBmSt
	movs r0, #0
	strh r0, [r1, #0x2e]
	movs r3, #0
	ldr r2, .L080315B4  @ gConvoyItemArray
.L080315A2:
	ldrh r0, [r2]
	cmp r0, #0
	bne .L080315B8
	strh r4, [r2]
	adds r0, r3, #0
	b .L080315C6
	.align 2, 0
.L080315B0: .4byte gBmSt
.L080315B4: .4byte gConvoyItemArray
.L080315B8:
	adds r2, #2
	adds r3, #1
	cmp r3, #0x63
	ble .L080315A2
	strh r4, [r1, #0x2e]
	movs r0, #1
	negs r0, r0
.L080315C6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END AddItemToConvoy

	THUMB_FUNC_START func_080315CC
func_080315CC: @ 0x080315CC
	push {lr}
	ldr r1, .L080315E0  @ gConvoyItemArray
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	bl ShrinkConvoyItemList
	pop {r0}
	bx r0
	.align 2, 0
.L080315E0: .4byte gConvoyItemArray

	THUMB_FUNC_END func_080315CC

	THUMB_FUNC_START GetConvoyItemSlot
GetConvoyItemSlot: @ 0x080315E4
	push {r4, r5, lr}
	adds r3, r0, #0
	bl GetItemIid
	adds r3, r0, #0
	movs r2, #0
	movs r5, #0xff
	ldr r4, .L08031604  @ gConvoyItemArray
.L080315F4:
	ldrh r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	cmp r3, r0
	bne .L08031608
	adds r0, r2, #0
	b .L08031614
	.align 2, 0
.L08031604: .4byte gConvoyItemArray
.L08031608:
	adds r4, #2
	adds r2, #1
	cmp r2, #0x63
	ble .L080315F4
	movs r0, #1
	negs r0, r0
.L08031614:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetConvoyItemSlot

	THUMB_FUNC_START HasConvoyAccess
HasConvoyAccess: @ 0x0803161C
	push {lr}
	ldr r0, .L08031638  @ gGmData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0803163C
	bl func_080BD048
	cmp r0, #1
	bls .L08031650
	cmp r0, #0x38
	beq .L08031650
	b .L08031658
	.align 2, 0
.L08031638: .4byte gGmData
.L0803163C:
	ldr r0, .L08031654  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble .L08031650
	cmp r0, #0x38
	beq .L08031650
	cmp r0, #5
	bne .L08031658
.L08031650:
	movs r0, #0
	b .L0803165A
	.align 2, 0
.L08031654: .4byte gPlaySt
.L08031658:
	movs r0, #1
.L0803165A:
	pop {r1}
	bx r1

	THUMB_FUNC_END HasConvoyAccess

	THUMB_FUNC_START func_08031660
func_08031660: @ 0x08031660
	push {lr}
	ldr r0, .L0803167C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0xff
	beq .L08031680
	movs r0, #1
	b .L08031682
	.align 2, 0
.L0803167C: .4byte gPlaySt
.L08031680:
	movs r0, #0
.L08031682:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08031660

	THUMB_FUNC_START func_08031688
func_08031688: @ 0x08031688
	push {r4, lr}
	movs r4, #1
.L0803168C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L080316B4
	ldr r1, [r2]
	cmp r1, #0
	beq .L080316B4
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq .L080316B4
	adds r0, r2, #0
	b .L080316BC
.L080316B4:
	adds r4, #1
	cmp r4, #0x3f
	ble .L0803168C
	movs r0, #0
.L080316BC:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08031688

.align 2, 0
