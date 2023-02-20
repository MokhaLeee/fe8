	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START Event00_Nop
Event00_Nop: @ 0x0800D5A0
	movs r0, #0
	bx lr

	THUMB_FUNC_END Event00_Nop

	THUMB_FUNC_START Event01_End
Event01_End: @ 0x0800D5A4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x3c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0800D668
	ldr r0, [r3, #0x38]
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	ldr r7, .L0800D62C  @ gEventCallStack
	cmp r0, #1
	bne .L0800D5E2
	movs r2, #0
	adds r6, r7, #0
	movs r4, #0
	adds r5, r7, #4
.L0800D5C8:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #3
	adds r1, r2, r6
	str r4, [r1]
	adds r2, r2, r5
	str r4, [r2]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble .L0800D5C8
.L0800D5E2:
	ldr r0, [r7]
	cmp r0, #0
	beq .L0800D630
	str r0, [r3, #0x34]
	ldr r0, [r7, #4]
	str r0, [r3, #0x38]
	movs r2, #0
	adds r6, r7, #0
	adds r5, r7, #4
.L0800D5F4:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	lsls r3, r1, #3
	adds r4, r3, r6
	adds r1, #1
	lsls r2, r1, #3
	adds r0, r2, r6
	ldr r0, [r0]
	str r0, [r4]
	adds r3, r3, r5
	adds r2, r2, r5
	ldr r0, [r2]
	str r0, [r3]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r0, r1, #0x18
	cmp r0, #6
	ble .L0800D5F4
	lsls r1, r0, #3
	adds r0, r1, r7
	movs r2, #0
	str r2, [r0]
	adds r0, r7, #4
	adds r1, r1, r0
	str r2, [r1]
	movs r0, #0
	b .L0800D66A
	.align 2, 0
.L0800D62C: .4byte gEventCallStack
.L0800D630:
	adds r2, r3, #0
	adds r2, #0x41
	ldrb r0, [r2]
	cmp r0, #0
	beq .L0800D640
	cmp r0, #1
	beq .L0800D646
	b .L0800D668
.L0800D640:
	movs r0, #4
	strb r0, [r2]
	b .L0800D668
.L0800D646:
	ldrh r1, [r3, #0x3c]
	ldr r0, .L0800D660  @ 0x0000FFFB
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #5
	strb r0, [r2]
	ldr r0, .L0800D664  @ gUnknown_08592114
	str r0, [r3, #0x34]
	str r0, [r3, #0x38]
	movs r0, #1
	b .L0800D66A
	.align 2, 0
.L0800D660: .4byte 0x0000FFFB
.L0800D664: .4byte gUnknown_08592114
.L0800D668:
	movs r0, #5
.L0800D66A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event01_End

	THUMB_FUNC_START Event02_EvBitAndIdMod
Event02_EvBitAndIdMod: @ 0x0800D670
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x38]
	ldrh r2, [r1]
	movs r4, #7
	ands r4, r2
	movs r0, #0xf
	ands r0, r2
	lsrs r5, r0, #3
	ldrh r2, [r1, #2]
	movs r6, #2
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bge .L0800D690
	ldr r0, .L0800D69C  @ gEventSlots
	ldrh r2, [r0, #8]
.L0800D690:
	cmp r4, #0
	beq .L0800D6A0
	cmp r4, #1
	beq .L0800D6C4
	b .L0800D6DA
	.align 2, 0
.L0800D69C: .4byte gEventSlots
.L0800D6A0:
	cmp r5, #0
	bne .L0800D6B4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	lsls r1, r0
	ldrh r0, [r3, #0x3c]
	bics r0, r1
	strh r0, [r3, #0x3c]
	b .L0800D6DA
.L0800D6B4:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	lsls r1, r0
	ldrh r0, [r3, #0x3c]
	orrs r1, r0
	strh r1, [r3, #0x3c]
	b .L0800D6DA
.L0800D6C4:
	cmp r5, #0
	bne .L0800D6D2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl ClearFlag
	b .L0800D6DA
.L0800D6D2:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl SetFlag
.L0800D6DA:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event02_EvBitAndIdMod

	THUMB_FUNC_START Event03_CheckEvBitOrId
Event03_CheckEvBitOrId: @ 0x0800D6E4
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrh r2, [r0, #2]
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge .L0800D6FE
	ldr r0, .L0800D708  @ gEventSlots
	ldrh r2, [r0, #8]
.L0800D6FE:
	cmp r4, #0
	beq .L0800D70C
	cmp r4, #1
	beq .L0800D728
	b .L0800D748
	.align 2, 0
.L0800D708: .4byte gEventSlots
.L0800D70C:
	ldrh r1, [r3, #0x3c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	asrs r1, r0
	movs r2, #1
	ands r1, r2
	cmp r1, #0
	beq .L0800D744
	ldr r0, .L0800D724  @ gEventSlots
	str r2, [r0, #0x30]
	b .L0800D748
	.align 2, 0
.L0800D724: .4byte gEventSlots
.L0800D728:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne .L0800D744
	ldr r0, .L0800D740  @ gEventSlots
	str r1, [r0, #0x30]
	b .L0800D748
	.align 2, 0
.L0800D740: .4byte gEventSlots
.L0800D744:
	ldr r0, .L0800D750  @ gEventSlots
	str r4, [r0, #0x30]
.L0800D748:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0800D750: .4byte gEventSlots

	THUMB_FUNC_END Event03_CheckEvBitOrId

	THUMB_FUNC_START Event04_CheckRandom
Event04_CheckRandom: @ 0x0800D754
	push {lr}
	ldr r0, [r0, #0x38]
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne .L0800D768
	ldr r0, .L0800D764  @ gEventSlots
	str r1, [r0, #0x30]
	b .L0800D772
	.align 2, 0
.L0800D764: .4byte gEventSlots
.L0800D768:
	adds r0, r1, #1
	bl RandNext
	ldr r1, .L0800D778  @ gEventSlots
	str r0, [r1, #0x30]
.L0800D772:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0800D778: .4byte gEventSlots

	THUMB_FUNC_END Event04_CheckRandom

	THUMB_FUNC_START Event05_SetSlot
Event05_SetSlot: @ 0x0800D77C
	ldr r1, [r0, #0x38]
	ldrh r0, [r1, #2]
	ldr r2, [r1, #4]
	ldr r1, .L0800D790  @ gEventSlots
	lsls r0, r0, #2
	adds r0, r0, r1
	str r2, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
.L0800D790: .4byte gEventSlots

	THUMB_FUNC_END Event05_SetSlot

	THUMB_FUNC_START Event06_SlotOperation
Event06_SlotOperation: @ 0x0800D794
	push {r4, r5, r6, lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	adds r4, r1, #0
	ands r4, r0
	ldrh r0, [r2, #2]
	adds r3, r1, #0
	ands r3, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x14
	ands r5, r1
	lsrs r6, r0, #0x18
	ands r6, r1
	cmp r4, #9
	bls .L0800D7B6
	b .L0800D910
.L0800D7B6:
	lsls r0, r4, #2
	ldr r1, .L0800D7C0  @ .L0800D7C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800D7C0: .4byte .L0800D7C4
.L0800D7C4: @ jump table
	.4byte .L0800D7EC @ case 0
	.4byte .L0800D808 @ case 1
	.4byte .L0800D824 @ case 2
	.4byte .L0800D844 @ case 3
	.4byte .L0800D860 @ case 4
	.4byte .L0800D880 @ case 5
	.4byte .L0800D89C @ case 6
	.4byte .L0800D8B8 @ case 7
	.4byte .L0800D8D4 @ case 8
	.4byte .L0800D8F0 @ case 9
.L0800D7EC:
	ldr r2, .L0800D804  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	b .L0800D904
	.align 2, 0
.L0800D804: .4byte gEventSlots
.L0800D808:
	ldr r2, .L0800D820  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	subs r1, r1, r0
	b .L0800D904
	.align 2, 0
.L0800D820: .4byte gEventSlots
.L0800D824:
	ldr r2, .L0800D840  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	muls r0, r1, r0
	str r0, [r3]
	movs r0, #0
	b .L0800D912
	.align 2, 0
.L0800D840: .4byte gEventSlots
.L0800D844:
	ldr r2, .L0800D85C  @ gEventSlots
	lsls r4, r3, #2
	adds r4, r4, r2
	lsls r0, r5, #2
	adds r0, r0, r2
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	bl __udivsi3
	b .L0800D876
	.align 2, 0
.L0800D85C: .4byte gEventSlots
.L0800D860:
	ldr r2, .L0800D87C  @ gEventSlots
	lsls r4, r3, #2
	adds r4, r4, r2
	lsls r0, r5, #2
	adds r0, r0, r2
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	bl __umodsi3
.L0800D876:
	str r0, [r4]
	movs r0, #0
	b .L0800D912
	.align 2, 0
.L0800D87C: .4byte gEventSlots
.L0800D880:
	ldr r2, .L0800D898  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	ands r1, r0
	b .L0800D904
	.align 2, 0
.L0800D898: .4byte gEventSlots
.L0800D89C:
	ldr r2, .L0800D8B4  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	b .L0800D904
	.align 2, 0
.L0800D8B4: .4byte gEventSlots
.L0800D8B8:
	ldr r2, .L0800D8D0  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	eors r1, r0
	b .L0800D904
	.align 2, 0
.L0800D8D0: .4byte gEventSlots
.L0800D8D4:
	ldr r2, .L0800D8EC  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	lsls r1, r0
	b .L0800D904
	.align 2, 0
.L0800D8EC: .4byte gEventSlots
.L0800D8F0:
	ldr r2, .L0800D90C  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	lsrs r1, r0
.L0800D904:
	str r1, [r3]
	movs r0, #0
	b .L0800D912
	.align 2, 0
.L0800D90C: .4byte gEventSlots
.L0800D910:
	movs r0, #6
.L0800D912:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event06_SlotOperation

	THUMB_FUNC_START Event07_QueueOperation
Event07_QueueOperation: @ 0x0800D918
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	adds r0, r2, #0
	cmp r2, #1
	beq .L0800D950
	cmp r2, #1
	bgt .L0800D932
	cmp r2, #0
	beq .L0800D938
	b .L0800D970
.L0800D932:
	cmp r0, #2
	beq .L0800D960
	b .L0800D970
.L0800D938:
	ldr r0, .L0800D94C  @ gEventSlots
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl SlotQueuePush
	b .L0800D970
	.align 2, 0
.L0800D94C: .4byte gEventSlots
.L0800D950:
	ldr r0, .L0800D95C  @ gEventSlots
	ldr r0, [r0, #4]
	bl SlotQueuePush
	b .L0800D970
	.align 2, 0
.L0800D95C: .4byte gEventSlots
.L0800D960:
	ldrh r4, [r1, #2]
	bl SlotQueuePop
	ldr r2, .L0800D978  @ gEventSlots
	lsls r1, r4, #0x10
	asrs r1, r1, #0xe
	adds r1, r1, r2
	str r0, [r1]
.L0800D970:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0800D978: .4byte gEventSlots

	THUMB_FUNC_END Event07_QueueOperation

	THUMB_FUNC_START Event08_Label
Event08_Label: @ 0x0800D97C
	movs r0, #0
	bx lr

	THUMB_FUNC_END Event08_Label

	THUMB_FUNC_START Event09_Goto
Event09_Goto: @ 0x0800D980
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrh r0, [r0, #2]
	lsls r2, r0, #0x10
	movs r0, #0x82
	lsls r0, r0, #4
	orrs r2, r0
	ldr r1, [r3, #0x34]
	str r1, [r3, #0x38]
	ldr r0, [r1]
	cmp r0, r2
	beq .L0800D9AE
	movs r4, #0xf
.L0800D99C:
	ldrh r0, [r1]
	lsrs r0, r0, #4
	ands r0, r4
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, r2
	bne .L0800D99C
	str r1, [r3, #0x38]
.L0800D9AE:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event09_Goto

	THUMB_FUNC_START Event0A_Call
Event0A_Call: @ 0x0800D9B8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrh r5, [r0, #4]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	orrs r5, r0
	cmp r5, #0
	bge .L0800D9D4
	ldr r0, .L0800DA24  @ gEventSlots
	ldr r5, [r0, #8]
.L0800D9D4:
	movs r0, #7
	ldr r1, .L0800DA28  @ gEventCallStack
	mov r8, r1
	mov ip, r8
	movs r7, #4
	add r7, r8
	mov r9, r7
.L0800D9E2:
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	lsls r3, r1, #3
	mov r0, ip
	adds r4, r3, r0
	subs r1, #1
	lsls r2, r1, #3
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r4]
	add r3, r9
	add r2, r9
	ldr r0, [r2]
	str r0, [r3]
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r1, #0
	bgt .L0800D9E2
	ldr r0, [r6, #0x34]
	mov r1, r8
	str r0, [r1]
	ldr r0, [r6, #0x38]
	str r0, [r1, #4]
	str r5, [r6, #0x34]
	str r5, [r6, #0x38]
	movs r0, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0800DA24: .4byte gEventSlots
.L0800DA28: .4byte gEventCallStack

	THUMB_FUNC_END Event0A_Call

	THUMB_FUNC_START Event0B_EnqueueCall
Event0B_EnqueueCall: @ 0x0800DA2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r3, #0xf
	ands r3, r1
	ldrh r1, [r0, #2]
	ldr r2, [r0, #4]
	cmp r2, #0
	bge .L0800DA44
	ldr r0, .L0800DA54  @ gEventSlots
	ldr r2, [r0, #8]
.L0800DA44:
	cmp r2, #0
	beq .L0800DA70
	cmp r3, #0
	beq .L0800DA58
	cmp r3, #1
	beq .L0800DA66
	b .L0800DA70
	.align 2, 0
.L0800DA54: .4byte gEventSlots
.L0800DA58:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r1, [r0]
	adds r0, r2, #0
	bl CallEvent
	b .L0800DA70
.L0800DA66:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl func_08083DD8
.L0800DA70:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event0B_EnqueueCall

	THUMB_FUNC_START Event0C_Branch
Event0C_Branch: @ 0x0800DA78
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r5, #0xf
	ands r5, r1
	ldrh r3, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, .L0800DAA4  @ gEventSlots
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r3, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r5, #5
	bhi .L0800DAF6
	lsls r0, r5, #2
	ldr r1, .L0800DAA8  @ .L0800DAAC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800DAA4: .4byte gEventSlots
.L0800DAA8: .4byte .L0800DAAC
.L0800DAAC: @ jump table
	.4byte .L0800DAC4 @ case 0
	.4byte .L0800DACA @ case 1
	.4byte .L0800DAD0 @ case 2
	.4byte .L0800DAD6 @ case 3
	.4byte .L0800DADC @ case 4
	.4byte .L0800DAE2 @ case 5
.L0800DAC4:
	cmp r3, r2
	beq .L0800DAE6
	b .L0800DAF2
.L0800DACA:
	cmp r3, r2
	bne .L0800DAE6
	b .L0800DAF2
.L0800DAD0:
	cmp r3, r2
	bge .L0800DAE6
	b .L0800DAF2
.L0800DAD6:
	cmp r3, r2
	bgt .L0800DAE6
	b .L0800DAF2
.L0800DADC:
	cmp r3, r2
	ble .L0800DAE6
	b .L0800DAF2
.L0800DAE2:
	cmp r3, r2
	bge .L0800DAF2
.L0800DAE6:
	adds r0, r4, #0
	bl Event09_Goto
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b .L0800DAF8
.L0800DAF2:
	movs r0, #0
	b .L0800DAF8
.L0800DAF6:
	movs r0, #6
.L0800DAF8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event0C_Branch

	THUMB_FUNC_START Event0D_AsmCall
Event0D_AsmCall: @ 0x0800DB00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r2, [r0]
	movs r1, #0xf
	ldrh r3, [r0, #4]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	orrs r3, r0
	ands r1, r2
	cmp r1, #1
	bne .L0800DB28
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800DB28
	movs r0, #0
	b .L0800DB30
.L0800DB28:
	adds r0, r4, #0
	bl _call_via_r3
	movs r0, #2
.L0800DB30:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event0D_AsmCall

	THUMB_FUNC_START Event0E_STAL
Event0E_STAL: @ 0x0800DB38
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r7, [r2, #0x38]
	ldrb r0, [r7]
	movs r1, #0xf
	ands r1, r0
	adds r4, r1, #0
	ldrh r6, [r2, #0x3c]
	lsls r3, r6, #0x10
	lsrs r0, r3, #0x12
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne .L0800DBC4
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq .L0800DB72
	lsrs r0, r3, #0x13
	ands r0, r5
	cmp r0, #0
	bne .L0800DBC4
	ldr r0, .L0800DB84  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne .L0800DBC4
.L0800DB72:
	ldrh r3, [r2, #0x3e]
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt .L0800DB88
	ldrh r0, [r7, #2]
	strh r0, [r2, #0x3e]
	b .L0800DBD6
	.align 2, 0
.L0800DB84: .4byte gKeySt
.L0800DB88:
	movs r5, #1
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	bne .L0800DBB6
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	beq .L0800DBB6
	ldr r0, .L0800DBCC  @ gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne .L0800DBB4
	ldr r0, .L0800DBD0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq .L0800DBB6
.L0800DBB4:
	movs r5, #4
.L0800DBB6:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bgt .L0800DBD4
.L0800DBC4:
	movs r0, #0
	strh r0, [r2, #0x3e]
	b .L0800DBD8
	.align 2, 0
.L0800DBCC: .4byte gPlaySt
.L0800DBD0: .4byte gKeySt
.L0800DBD4:
	strh r3, [r2, #0x3e]
.L0800DBD6:
	movs r0, #3
.L0800DBD8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event0E_STAL

	THUMB_FUNC_START Event0F_CounterOperation
Event0F_CounterOperation: @ 0x0800DBE0
	push {r4, r5, r6, r7, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	mov ip, r2
	movs r7, #0xf
	adds r2, r7, #0
	ands r2, r1
	adds r4, r2, #0
	ldrh r5, [r0, #2]
	ldrb r0, [r0, #2]
	movs r1, #7
	ands r0, r1
	lsls r6, r0, #2
	cmp r2, #1
	beq .L0800DC38
	cmp r2, #1
	bgt .L0800DC10
	cmp r2, #0
	beq .L0800DC20
	ldr r4, .L0800DC0C  @ gEventSlotCounter
	b .L0800DC78
	.align 2, 0
.L0800DC0C: .4byte gEventSlotCounter
.L0800DC10:
	cmp r4, #2
	beq .L0800DC44
	cmp r4, #3
	beq .L0800DC60
	ldr r4, .L0800DC1C  @ gEventSlotCounter
	b .L0800DC78
	.align 2, 0
.L0800DC1C: .4byte gEventSlotCounter
.L0800DC20:
	ldr r1, .L0800DC30  @ gEventSlots
	ldr r0, .L0800DC34  @ gEventSlotCounter
	ldr r0, [r0]
	lsrs r0, r6
	ands r0, r7
	str r0, [r1, #0x30]
	b .L0800DC8A
	.align 2, 0
.L0800DC30: .4byte gEventSlots
.L0800DC34: .4byte gEventSlotCounter
.L0800DC38:
	lsls r0, r5, #0x10
	lsrs r3, r0, #0x18
	ldr r4, .L0800DC40  @ gEventSlotCounter
	b .L0800DC78
	.align 2, 0
.L0800DC40: .4byte gEventSlotCounter
.L0800DC44:
	ldr r1, .L0800DC5C  @ gEventSlotCounter
	ldr r0, [r1]
	lsrs r0, r6
	mov r2, ip
	ands r0, r2
	adds r3, r0, #1
	adds r4, r1, #0
	cmp r3, #0xf
	ble .L0800DC78
	movs r3, #0xf
	b .L0800DC78
	.align 2, 0
.L0800DC5C: .4byte gEventSlotCounter
.L0800DC60:
	ldr r1, .L0800DC94  @ gEventSlotCounter
	ldr r0, [r1]
	lsrs r0, r6
	mov r2, ip
	ands r0, r2
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0
	bge .L0800DC78
	movs r3, #0
.L0800DC78:
	movs r0, #0xf
	adds r1, r0, #0
	lsls r1, r6
	ldr r2, [r4]
	bics r2, r1
	ands r3, r0
	lsls r3, r6
	orrs r2, r3
	str r2, [r4]
.L0800DC8A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0800DC94: .4byte gEventSlotCounter

	THUMB_FUNC_END Event0F_CounterOperation

	THUMB_FUNC_START Event10_ModifyEvBit
Event10_ModifyEvBit: @ 0x0800DC98
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrh r3, [r0, #2]
	ldrh r4, [r2, #0x3c]
	lsrs r0, r4, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800DCBE
	cmp r3, #0
	beq .L0800DCBE
	ldr r0, .L0800DCCC  @ 0x0000FFFB
	ands r0, r4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
.L0800DCBE:
	cmp r3, #4
	bhi .L0800DD50
	lsls r0, r3, #2
	ldr r1, .L0800DCD0  @ .L0800DCD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800DCCC: .4byte 0x0000FFFB
.L0800DCD0: .4byte .L0800DCD4
.L0800DCD4: @ jump table
	.4byte .L0800DCE8 @ case 0
	.4byte .L0800DCFC @ case 1
	.4byte .L0800DD0C @ case 2
	.4byte .L0800DD24 @ case 3
	.4byte .L0800DD38 @ case 4
.L0800DCE8:
	ldrh r1, [r2, #0x3c]
	ldr r0, .L0800DCF4  @ 0x0000FFEF
	ands r0, r1
	ldr r1, .L0800DCF8  @ 0x0000FFDF
	ands r0, r1
	b .L0800DD42
	.align 2, 0
.L0800DCF4: .4byte 0x0000FFEF
.L0800DCF8: .4byte 0x0000FFDF
.L0800DCFC:
	ldrh r1, [r2, #0x3c]
	movs r0, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	b .L0800DD46
.L0800DD0C:
	ldrh r1, [r2, #0x3c]
	ldr r0, .L0800DD1C  @ 0x0000FFEF
	ands r0, r1
	ldr r1, .L0800DD20  @ 0x0000FFDF
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	b .L0800DD46
	.align 2, 0
.L0800DD1C: .4byte 0x0000FFEF
.L0800DD20: .4byte 0x0000FFDF
.L0800DD24:
	ldrh r1, [r2, #0x3c]
	movs r0, #0x10
	orrs r0, r1
	ldr r1, .L0800DD34  @ 0x0000FFDF
	ands r0, r1
	subs r1, #0x20
	b .L0800DD44
	.align 2, 0
.L0800DD34: .4byte 0x0000FFDF
.L0800DD38:
	ldrh r1, [r2, #0x3c]
	movs r0, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
.L0800DD42:
	ldr r1, .L0800DD4C  @ 0x0000FFBF
.L0800DD44:
	ands r0, r1
.L0800DD46:
	strh r0, [r2, #0x3c]
	movs r0, #0
	b .L0800DD52
	.align 2, 0
.L0800DD4C: .4byte 0x0000FFBF
.L0800DD50:
	movs r0, #6
.L0800DD52:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event10_ModifyEvBit

	THUMB_FUNC_START Event11_SetIgnoredKeys
Event11_SetIgnoredKeys: @ 0x0800DD58
	push {lr}
	ldr r2, [r0, #0x38]
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	ldrh r1, [r2, #2]
	cmp r0, #0
	bne .L0800DD6E
	adds r0, r1, #0
	bl SetKeyIgnore
.L0800DD6E:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END Event11_SetIgnoredKeys

	THUMB_FUNC_START Event12_SetBGM
Event12_SetBGM: @ 0x0800DD74
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800DD88
	movs r0, #0
	b .L0800DDA6
.L0800DD88:
	ldr r0, [r2, #0x38]
	ldrh r1, [r0, #2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge .L0800DD98
	ldr r0, .L0800DDAC  @ gEventSlots
	ldrh r1, [r0, #8]
.L0800DD98:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #3
	movs r2, #0
	bl StartBgmExt
	movs r0, #2
.L0800DDA6:
	pop {r1}
	bx r1
	.align 2, 0
.L0800DDAC: .4byte gEventSlots

	THUMB_FUNC_END Event12_SetBGM

	THUMB_FUNC_START Event13_SetBGM2
Event13_SetBGM2: @ 0x0800DDB0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrh r1, [r0, #2]
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge .L0800DDCA
	ldr r0, .L0800DDE4  @ gEventSlots
	ldrh r1, [r0, #8]
.L0800DDCA:
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	ldr r0, .L0800DDE8  @ 0x00007FFF
	cmp r3, r0
	beq .L0800DDF8
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800DDEC
	movs r0, #0
	b .L0800DE0E
	.align 2, 0
.L0800DDE4: .4byte gEventSlots
.L0800DDE8: .4byte 0x00007FFF
.L0800DDEC:
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #0
	bl StartBgmFadeIn
	b .L0800DE0C
.L0800DDF8:
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800DE06
	movs r4, #1
.L0800DE06:
	adds r0, r4, #0
	bl FadeBgmOut
.L0800DE0C:
	movs r0, #2
.L0800DE0E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event13_SetBGM2

	THUMB_FUNC_START Event14_OverwriteBGM
Event14_OverwriteBGM: @ 0x0800DE14
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r4, [r1, #2]
	cmp r2, #0
	beq .L0800DE2C
	cmp r2, #1
	beq .L0800DE60
	b .L0800DE6A
.L0800DE2C:
	ldrh r0, [r3, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne .L0800DE42
	lsrs r0, r1, #0x13
	ands r0, r2
	cmp r0, #0
	beq .L0800DE46
.L0800DE42:
	movs r0, #0
	b .L0800DE6C
.L0800DE46:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge .L0800DE50
	ldr r0, .L0800DE5C  @ gEventSlots
	ldrh r4, [r0, #8]
.L0800DE50:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl OverrideBgm
	b .L0800DE6A
	.align 2, 0
.L0800DE5C: .4byte gEventSlots
.L0800DE60:
	bl CancelDelaySong
	adds r0, r4, #0
	bl func_080026BC
.L0800DE6A:
	movs r0, #2
.L0800DE6C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event14_OverwriteBGM

	THUMB_FUNC_START Event15_QuietBGM
Event15_QuietBGM: @ 0x0800DE74
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq .L0800DE8A
	cmp r1, #1
	beq .L0800DEA8
	b .L0800DECC
.L0800DE8A:
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800DE9A
	movs r0, #0
	b .L0800DECE
.L0800DE9A:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	b .L0800DECC
.L0800DEA8:
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800DEC0
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetBgmVolume
	movs r0, #0
	b .L0800DECE
.L0800DEC0:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
.L0800DECC:
	movs r0, #2
.L0800DECE:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event15_QuietBGM

	THUMB_FUNC_START Event16_PlaySound
Event16_PlaySound: @ 0x0800DED4
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne .L0800DF10
	lsrs r0, r1, #0x13
	ands r0, r2
	cmp r0, #0
	bne .L0800DF10
	ldr r0, [r3, #0x38]
	ldrh r1, [r0, #2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge .L0800DEFE
	ldr r0, .L0800DF18  @ gEventSlots
	ldrh r1, [r0, #8]
.L0800DEFE:
	ldr r0, .L0800DF1C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0800DF10
	adds r0, r1, #0
	bl m4aSongNumStart
.L0800DF10:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0800DF18: .4byte gEventSlots
.L0800DF1C: .4byte gPlaySt

	THUMB_FUNC_END Event16_PlaySound

	THUMB_FUNC_START Event17_Fade
Event17_Fade: @ 0x0800DF20
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800DF34
	movs r0, #0
	b .L0800DFB4
.L0800DF34:
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r0, [r1, #2]
	cmp r2, #1
	beq .L0800DF5E
	cmp r2, #1
	bgt .L0800DF4C
	cmp r2, #0
	beq .L0800DF56
	b .L0800DFB2
.L0800DF4C:
	cmp r2, #2
	beq .L0800DF66
	cmp r2, #3
	beq .L0800DF9C
	b .L0800DFB2
.L0800DF56:
	adds r1, r4, #0
	bl StartBlockingFadeOutBlack
	b .L0800DF6C
.L0800DF5E:
	adds r1, r4, #0
	bl StartBlockingFadeInBlack
	b .L0800DFA2
.L0800DF66:
	adds r1, r4, #0
	bl StartBlockingFadeOutWhite
.L0800DF6C:
	ldrh r1, [r4, #0x3c]
	ldr r0, .L0800DF94  @ 0x0000FEFF
	ands r0, r1
	strh r0, [r4, #0x3c]
	ldr r2, .L0800DF98  @ gDispIo
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
	movs r0, #2
	b .L0800DFB4
	.align 2, 0
.L0800DF94: .4byte 0x0000FEFF
.L0800DF98: .4byte gDispIo
.L0800DF9C:
	adds r1, r4, #0
	bl StartBlockingFadeInWhite
.L0800DFA2:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	b .L0800DFB4
.L0800DFB2:
	movs r0, #6
.L0800DFB4:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event17_Fade

	THUMB_FUNC_START Event18_ColorEffects
Event18_ColorEffects: @ 0x0800DFBC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	ands r2, r1
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ldrb r3, [r0, #2]
	lsrs r6, r1, #8
	ldrh r7, [r0, #4]
	ldrh r1, [r0, #6]
	mov r8, r1
	ldrh r1, [r0, #8]
	mov r9, r1
	ldrh r0, [r0, #0xa]
	mov ip, r0
	cmp r2, #1
	beq .L0800E002
	cmp r2, #1
	bgt .L0800DFF4
	cmp r2, #0
	beq .L0800DFFA
	b .L0800E05E
.L0800DFF4:
	cmp r4, #2
	beq .L0800E00A
	b .L0800E05E
.L0800DFFA:
	bl func_080127C4
	movs r0, #2
	b .L0800E060
.L0800E002:
	bl func_08012824
	movs r0, #2
	b .L0800E060
.L0800E00A:
	ldrh r2, [r5, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L0800E020
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L0800E022
.L0800E020:
	movs r7, #0
.L0800E022:
	movs r4, #0
	lsls r2, r6, #0x18
	cmp r2, #0
	ble .L0800E048
	movs r6, #1
.L0800E02C:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	lsls r1, r0
	orrs r4, r1
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r2, r2, r0
	asrs r0, r2, #0x18
	cmp r0, #0
	bgt .L0800E02C
.L0800E048:
	mov r1, ip
	str r1, [sp]
	str r5, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	mov r2, r8
	mov r3, r9
	bl func_08012890
	movs r0, #2
	b .L0800E060
.L0800E05E:
	movs r0, #6
.L0800E060:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event18_ColorEffects

	THUMB_FUNC_START Event19_
Event19_: @ 0x0800E070
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xa
	bls .L0800E082
	b .L0800E17C
.L0800E082:
	lsls r0, r1, #2
	ldr r1, .L0800E08C  @ .L0800E090
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800E08C: .4byte .L0800E090
.L0800E090: @ jump table
	.4byte .L0800E0BC @ case 0
	.4byte .L0800E0CC @ case 1
	.4byte .L0800E0DC @ case 2
	.4byte .L0800E0E8 @ case 3
	.4byte .L0800E0F8 @ case 4
	.4byte .L0800E0FE @ case 5
	.4byte .L0800E104 @ case 6
	.4byte .L0800E10A @ case 7
	.4byte .L0800E134 @ case 8
	.4byte .L0800E144 @ case 9
	.4byte .L0800E158 @ case 10
.L0800E0BC:
	ldr r0, .L0800E0C4  @ gEventSlots
	ldr r1, .L0800E0C8  @ gPlaySt
	ldrb r1, [r1, #0x1b]
	b .L0800E17A
	.align 2, 0
.L0800E0C4: .4byte gEventSlots
.L0800E0C8: .4byte gPlaySt
.L0800E0CC:
	ldr r0, .L0800E0D8  @ gEventSlots
	adds r1, r2, #0
	adds r1, #0x43
	ldrb r1, [r1]
	b .L0800E17A
	.align 2, 0
.L0800E0D8: .4byte gEventSlots
.L0800E0DC:
	ldr r0, .L0800E0E4  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	b .L0800E15E
	.align 2, 0
.L0800E0E4: .4byte gPlaySt
.L0800E0E8:
	ldr r0, .L0800E0F0  @ gEventSlots
	ldr r1, .L0800E0F4  @ gPlaySt
	ldrh r1, [r1, #0x10]
	b .L0800E17A
	.align 2, 0
.L0800E0F0: .4byte gEventSlots
.L0800E0F4: .4byte gPlaySt
.L0800E0F8:
	bl CountRedUnits
	b .L0800E14A
.L0800E0FE:
	bl CountGreenUnits
	b .L0800E14A
.L0800E104:
	bl GetBattleMapKind
	b .L0800E138
.L0800E10A:
	ldr r1, .L0800E12C  @ gPlaySt
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt .L0800E122
	ldrb r1, [r1, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0800E168
.L0800E122:
	ldr r1, .L0800E130  @ gEventSlots
	movs r0, #0
	str r0, [r1, #0x30]
	b .L0800E17C
	.align 2, 0
.L0800E12C: .4byte gPlaySt
.L0800E130: .4byte gEventSlots
.L0800E134:
	bl GetGold
.L0800E138:
	ldr r1, .L0800E140  @ gEventSlots
	str r0, [r1, #0x30]
	b .L0800E17C
	.align 2, 0
.L0800E140: .4byte gEventSlots
.L0800E144:
	ldr r0, [r2, #0x30]
	bl GetEventTriggerId
.L0800E14A:
	ldr r1, .L0800E154  @ gEventSlots
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1, #0x30]
	b .L0800E17C
	.align 2, 0
.L0800E154: .4byte gEventSlots
.L0800E158:
	ldr r0, .L0800E170  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
.L0800E15E:
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq .L0800E178
.L0800E168:
	ldr r1, .L0800E174  @ gEventSlots
	movs r0, #1
	str r0, [r1, #0x30]
	b .L0800E17C
	.align 2, 0
.L0800E170: .4byte gPlaySt
.L0800E174: .4byte gEventSlots
.L0800E178:
	ldr r0, .L0800E184  @ gEventSlots
.L0800E17A:
	str r1, [r0, #0x30]
.L0800E17C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0800E184: .4byte gEventSlots

	THUMB_FUNC_END Event19_

	THUMB_FUNC_START Event1A_TEXTSTART
Event1A_TEXTSTART: @ 0x0800E188
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	movs r5, #0xf
	ands r5, r0
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r5, r0
	beq .L0800E1C8
	cmp r5, #5
	beq .L0800E1C8
	bl EndTalk
	bl func_0808F270
	bl func_0808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0800E1C2
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl func_0800BCDC
.L0800E1C2:
	adds r0, r4, #0
	bl func_0800E640
.L0800E1C8:
	adds r0, r4, #0
	adds r0, #0x42
	strb r5, [r0]
	cmp r5, #5
	bhi .L0800E208
	lsls r0, r5, #2
	ldr r1, .L0800E1DC  @ .L0800E1E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800E1DC: .4byte .L0800E1E0
.L0800E1E0: @ jump table
	.4byte .L0800E1F8 @ case 0
	.4byte .L0800E1FC @ case 1
	.4byte .L0800E1FC @ case 2
	.4byte .L0800E1F8 @ case 3
	.4byte .L0800E1F8 @ case 4
	.4byte .L0800E1F8 @ case 5
.L0800E1F8:
	movs r0, #2
	b .L0800E20A
.L0800E1FC:
	adds r0, r4, #0
	bl Event23_BlockGameGraphics
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b .L0800E20A
.L0800E208:
	movs r0, #6
.L0800E20A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event1A_TEXTSTART

	THUMB_FUNC_START func_0800E210
func_0800E210: @ 0x0800E210
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r2, #1
	bne .L0800E22A
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
.L0800E22A:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #1
	bne .L0800E258
	ldr r2, .L0800E254  @ gPlaySt
	adds r2, #0x40
	ldrb r3, [r2]
	lsls r0, r3, #0x19
	lsrs r0, r0, #0x1e
	adds r1, r4, #0
	adds r1, #0x40
	strb r0, [r1]
	movs r0, #0x61
	negs r0, r0
	ands r0, r3
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	b .L0800E260
	.align 2, 0
.L0800E254: .4byte gPlaySt
.L0800E258:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
.L0800E260:
	movs r0, #1
	movs r1, #1
	adds r2, r5, #0
	bl StartTalkMsg
	ldrh r1, [r4, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0800E27A
	movs r0, #4
	bl SetTalkFlag
.L0800E27A:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0800E28A
	movs r0, #8
	bl SetTalkFlag
.L0800E28A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800E210

	THUMB_FUNC_START func_0800E290
func_0800E290: @ 0x0800E290
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r4, r1
	ldrh r1, [r0, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0800E2AE
	movs r0, #0x40
	orrs r4, r0
.L0800E2AE:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0800E2BA
	ldr r0, .L0800E310  @ 0x00002820
	orrs r4, r0
.L0800E2BA:
	ldr r2, .L0800E314  @ gDispIo
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
	bl LoadObjUiGfx
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	bl InitTalk
	movs r0, #1
	bl EnableBgSync
	str r5, [sp]
	ldr r0, .L0800E318  @ 0x06011000
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #3
	movs r1, #0x12
	movs r2, #0x14
	movs r3, #4
	bl func_0808F128
	adds r0, r4, #0
	bl func_0808E9D8
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0800E310: .4byte 0x00002820
.L0800E314: .4byte gDispIo
.L0800E318: .4byte 0x06011000

	THUMB_FUNC_END func_0800E290

	THUMB_FUNC_START func_0800E31C
func_0800E31C: @ 0x0800E31C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, .L0800E348  @ gUnknown_030004E4
	ldrb r6, [r0]
	ldrb r5, [r0, #2]
	cmp r6, #0xff
	bne .L0800E34C
	cmp r5, #0xff
	bne .L0800E34C
	movs r6, #0
	movs r5, #0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r4, r0
	b .L0800E38A
	.align 2, 0
.L0800E348: .4byte gUnknown_030004E4
.L0800E34C:
	adds r0, r7, #0
	bl GetMsg
	bl StrExpandNames
	add r2, sp, #4
	mov r1, sp
	bl func_0808AADC
	cmp r6, #0xff
	bne .L0800E376
	ldr r0, [sp]
	movs r1, #0xe0
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	subs r1, #8
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	b .L0800E38A
.L0800E376:
	cmp r5, #0xff
	bne .L0800E38A
	ldr r0, [sp, #4]
	movs r1, #0x90
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
.L0800E38A:
	mov r0, r8
	ldrh r1, [r0, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0800E39A
	movs r0, #0x80
	orrs r4, r0
.L0800E39A:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0800E3A6
	movs r0, #8
	orrs r4, r0
.L0800E3A6:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl func_0808AA04
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl SetDialogueBoxConfig
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800E31C

	THUMB_FUNC_START Event1B_TEXTSHOW
Event1B_TEXTSHOW: @ 0x0800E3C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r3, [r1, #2]
	movs r5, #0
	cmp r2, #2
	beq .L0800E3EC
	lsls r0, r3, #0x10
	cmp r0, #0
	bge .L0800E3E6
	ldr r0, .L0800E3FC  @ gEventSlots
	ldrh r3, [r0, #8]
.L0800E3E6:
	cmp r3, #0
	bne .L0800E3EC
	b .L0800E514
.L0800E3EC:
	cmp r2, #1
	beq .L0800E462
	cmp r2, #1
	bgt .L0800E400
	cmp r2, #0
	beq .L0800E406
	b .L0800E514
	.align 2, 0
.L0800E3FC: .4byte gEventSlots
.L0800E400:
	cmp r2, #2
	beq .L0800E4DE
	b .L0800E514
.L0800E406:
	ldrh r0, [r4, #0x3c]
	ldr r1, .L0800E430  @ 0x0000FFF7
	ands r1, r0
	strh r1, [r4, #0x3c]
	lsrs r1, r1, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq .L0800E41A
	b .L0800E514
.L0800E41A:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi .L0800E514
	lsls r0, r0, #2
	ldr r1, .L0800E434  @ .L0800E438
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800E430: .4byte 0x0000FFF7
.L0800E434: .4byte .L0800E438
.L0800E438: @ jump table
	.4byte .L0800E450 @ case 0
	.4byte .L0800E450 @ case 1
	.4byte .L0800E4B4 @ case 2
	.4byte .L0800E45C @ case 3
	.4byte .L0800E4C6 @ case 4
	.4byte .L0800E4D2 @ case 5
.L0800E450:
	adds r1, r3, #0
	adds r0, r4, #0
	movs r2, #1
	bl func_0800E210
	b .L0800E514
.L0800E45C:
	adds r1, r3, #0
	movs r2, #0x10
	b .L0800E4D6
.L0800E462:
	ldrh r0, [r4, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne .L0800E514
	lsrs r0, r1, #0x13
	ands r0, r2
	cmp r0, #0
	bne .L0800E514
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi .L0800E514
	lsls r0, r0, #2
	ldr r1, .L0800E48C  @ .L0800E490
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800E48C: .4byte .L0800E490
.L0800E490: @ jump table
	.4byte .L0800E4A8 @ case 0
	.4byte .L0800E4A8 @ case 1
	.4byte .L0800E4B4 @ case 2
	.4byte .L0800E4C0 @ case 3
	.4byte .L0800E4C6 @ case 4
	.4byte .L0800E4D2 @ case 5
.L0800E4A8:
	adds r1, r3, #0
	adds r0, r4, #0
	movs r2, #0
	bl func_0800E210
	b .L0800E514
.L0800E4B4:
	adds r1, r3, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl func_0800E290
	b .L0800E514
.L0800E4C0:
	adds r1, r3, #0
	movs r2, #0x10
	b .L0800E4D6
.L0800E4C6:
	adds r1, r3, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl func_0800E31C
	b .L0800E514
.L0800E4D2:
	adds r1, r3, #0
	movs r2, #0x30
.L0800E4D6:
	adds r0, r4, #0
	bl func_0800E31C
	b .L0800E514
.L0800E4DE:
	ldrh r0, [r4, #0x3c]
	ldr r1, .L0800E510  @ 0x0000FFF7
	ands r1, r0
	strh r1, [r4, #0x3c]
	bl EndTalk
	bl func_0808F270
	bl func_0808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0800E506
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl func_0800BCDC
.L0800E506:
	adds r0, r4, #0
	bl func_0800E640
	movs r0, #2
	b .L0800E516
	.align 2, 0
.L0800E510: .4byte 0x0000FFF7
.L0800E514:
	movs r0, #0
.L0800E516:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event1B_TEXTSHOW

	THUMB_FUNC_START Event1C_TEXTCONT
Event1C_TEXTCONT: @ 0x0800E51C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800E554
	bl EndTalk
	bl func_0808F270
	bl func_0808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0800E54C
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl func_0800BCDC
.L0800E54C:
	adds r0, r4, #0
	bl func_0800E640
	b .L0800E558
.L0800E554:
	bl UnlockDialogue
.L0800E558:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event1C_TEXTCONT

	THUMB_FUNC_START Event1D_TEXTEND
Event1D_TEXTEND: @ 0x0800E560
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800E5A0
	bl EndTalk
	bl func_0808F270
	bl func_0808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0800E590
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl func_0800BCDC
.L0800E590:
	adds r0, r4, #0
	bl func_0800E640
	ldr r1, .L0800E59C  @ gEventSlots
	movs r0, #0
	b .L0800E606
	.align 2, 0
.L0800E59C: .4byte gEventSlots
.L0800E5A0:
	movs r5, #0
	bl DialogueExists
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0800E5B6
	bl IsDialogueLocked
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0800E5CA
.L0800E5B6:
	bl func_0808F284
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0800E5CA
	ldr r0, .L0800E5FC  @ gUnknown_08A016E0
	bl FindProc
	cmp r0, #0
	beq .L0800E5CC
.L0800E5CA:
	movs r5, #1
.L0800E5CC:
	cmp r5, #1
	bne .L0800E600
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0800E5F8
	cmp r0, #4
	beq .L0800E5F8
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #0
	blt .L0800E5F8
	cmp r0, #2
	bgt .L0800E5F8
	movs r0, #1
	movs r1, #0x10
	movs r2, #1
	movs r3, #0
	bl SetBlendConfig
.L0800E5F8:
	movs r0, #3
	b .L0800E630
	.align 2, 0
.L0800E5FC: .4byte gUnknown_08A016E0
.L0800E600:
	bl GetDialoguePromptResult
	ldr r1, .L0800E638  @ gEventSlots
.L0800E606:
	str r0, [r1, #0x30]
	adds r3, r4, #0
	adds r3, #0x40
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0800E62E
	ldr r2, .L0800E63C  @ gPlaySt
	adds r2, #0x40
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #5
	ldrb r3, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
.L0800E62E:
	movs r0, #2
.L0800E630:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0800E638: .4byte gEventSlots
.L0800E63C: .4byte gPlaySt

	THUMB_FUNC_END Event1D_TEXTEND

	THUMB_FUNC_START func_0800E640
func_0800E640: @ 0x0800E640
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800E668
	bl Dialogue_ClearTextBoxes
	ldr r0, .L0800E664  @ ProcScr_Face
	bl EndEachProc
	bl InitFaces
	bl ClearTalkFaceRefs
	b .L0800E686
	.align 2, 0
.L0800E664: .4byte ProcScr_Face
.L0800E668:
	bl FaceExists
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0800E686
	bl Dialogue_ClearTextBoxes
	ldr r0, .L0800E68C  @ ProcScr_Face
	ldr r1, .L0800E690  @ StartFaceFadeOut
	bl ForEachProc
	ldr r0, .L0800E694  @ gUnknown_08591DE8
	adds r1, r4, #0
	bl SpawnProcLocking
.L0800E686:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0800E68C: .4byte ProcScr_Face
.L0800E690: .4byte StartFaceFadeOut
.L0800E694: .4byte gUnknown_08591DE8

	THUMB_FUNC_END func_0800E640

	THUMB_FUNC_START FaceWitnessProc_Main
FaceWitnessProc_Main: @ 0x0800E698
	push {r4, lr}
	adds r4, r0, #0
	bl FaceExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0800E6AC
	adds r0, r4, #0
	bl Proc_Break
.L0800E6AC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FaceWitnessProc_Main

	THUMB_FUNC_START Event1E_
Event1E_: @ 0x0800E6B4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r6, #0xf
	ands r6, r1
	adds r2, r6, #0
	ldrh r5, [r0, #2]
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0800E6D4
	ldr r0, .L0800E714  @ gEventSlots
	ldrh r5, [r0, #8]
.L0800E6D4:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	movs r0, #3
	negs r0, r0
	cmp r1, r0
	beq .L0800E73C
	adds r0, #1
	cmp r1, r0
	beq .L0800E71C
	ldrh r0, [r4, #0x3c]
	lsrs r2, r0, #2
	movs r3, #1
	ands r2, r3
	cmp r2, #0
	bne .L0800E770
	ldr r0, .L0800E718  @ gEvent1EData
	adds r1, r6, #0
	adds r1, #8
	strb r1, [r0]
	movs r1, #0x10
	strb r1, [r0, #1]
	strb r5, [r0, #2]
	strb r3, [r0, #3]
	strb r3, [r0, #4]
	strb r2, [r0, #5]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	b .L0800E766
	.align 2, 0
.L0800E714: .4byte gEventSlots
.L0800E718: .4byte gEvent1EData
.L0800E71C:
	ldr r1, .L0800E738  @ gEvent1EData
	adds r0, r2, #0
	adds r0, #8
	movs r2, #0
	strb r0, [r1]
	movs r0, #0x11
	strb r0, [r1, #1]
	movs r0, #1
	strb r0, [r1, #2]
	strb r2, [r1, #3]
	bl Dialogue_ClearTextBoxes
	b .L0800E766
	.align 2, 0
.L0800E738: .4byte gEvent1EData
.L0800E73C:
	bl EndTalk
	bl func_0808F270
	bl func_0808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0800E75C
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl func_0800BCDC
.L0800E75C:
	adds r0, r4, #0
	bl func_0800E640
	movs r0, #2
	b .L0800E772
.L0800E766:
	ldr r2, .L0800E778  @ gEvent1EData
	movs r0, #0
	movs r1, #0
	bl StartTalk
.L0800E770:
	movs r0, #0
.L0800E772:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0800E778: .4byte gEvent1EData

	THUMB_FUNC_END Event1E_

	THUMB_FUNC_START Event1F_
Event1F_: @ 0x0800E77C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne .L0800E7B6
	lsrs r3, r1, #0x13
	ands r3, r2
	cmp r3, #0
	bne .L0800E7B6
	ldr r0, [r4, #0x38]
	ldrh r1, [r0, #2]
	ldrb r0, [r0, #2]
	lsrs r1, r1, #8
	ldr r2, .L0800E7C0  @ gUnknown_03000430
	adds r0, #8
	strb r0, [r2]
	movs r0, #0x80
	strb r0, [r2, #1]
	adds r1, #0xa
	strb r1, [r2, #2]
	strb r3, [r2, #3]
	movs r0, #0
	movs r1, #0
	bl StartTalk
.L0800E7B6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0800E7C0: .4byte gUnknown_03000430

	THUMB_FUNC_END Event1F_

	THUMB_FUNC_START Event20_
Event20_: @ 0x0800E7C4
	push {lr}
	bl Dialogue_ClearTextBoxes
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END Event20_

	THUMB_FUNC_START func_0800E7D0
func_0800E7D0: @ 0x0800E7D0
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
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
	cmp r4, #5
	bhi .L0800E8BE
	lsls r0, r4, #2
	ldr r1, .L0800E814  @ .L0800E818
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800E814: .4byte .L0800E818
.L0800E818: @ jump table
	.4byte .L0800E830 @ case 0
	.4byte .L0800E834 @ case 1
	.4byte .L0800E8A0 @ case 2
	.4byte .L0800E830 @ case 3
	.4byte .L0800E830 @ case 4
	.4byte .L0800E830 @ case 5
.L0800E830:
	movs r0, #6
	b .L0800E8C0
.L0800E834:
	cmp r6, #0x37
	bne .L0800E842
	movs r0, #0x35
	bl RandNext
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
.L0800E842:
	ldr r5, .L0800E894  @ gUnknown_0895DD1C
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
	ldr r0, .L0800E898  @ gBg3Tm
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
	bl EnablePalSync
	ldr r1, .L0800E89C  @ gPal
	movs r0, #0
	strh r0, [r1]
	b .L0800E8BE
	.align 2, 0
.L0800E894: .4byte gUnknown_0895DD1C
.L0800E898: .4byte gBg3Tm
.L0800E89C: .4byte gPal
.L0800E8A0:
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0800E8C8  @ gBg3Tm
	str r6, [sp]
	movs r2, #8
	movs r3, #8
	bl func_080B65F8
	movs r0, #8
	bl EnableBgSync
	bl EnablePalSync
.L0800E8BE:
	movs r0, #2
.L0800E8C0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0800E8C8: .4byte gBg3Tm

	THUMB_FUNC_END func_0800E7D0

	THUMB_FUNC_START Event21_TextBGStuff
Event21_TextBGStuff: @ 0x0800E8CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r2, [r5, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	ldrh r0, [r2, #2]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge .L0800E8EE
	ldr r0, .L0800E8FC  @ gEventSlots
	ldrh r0, [r0, #8]
	mov r8, r0
.L0800E8EE:
	cmp r3, #1
	beq .L0800E91C
	cmp r3, #1
	bgt .L0800E900
	cmp r3, #0
	beq .L0800E90E
	b .L0800EA76
	.align 2, 0
.L0800E8FC: .4byte gEventSlots
.L0800E900:
	cmp r3, #2
	bne .L0800E906
	b .L0800EA20
.L0800E906:
	cmp r3, #3
	bne .L0800E90C
	b .L0800EA56
.L0800E90C:
	b .L0800EA76
.L0800E90E:
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	mov r1, r8
	bl func_0800E7D0
	b .L0800E9CE
.L0800E91C:
	ldrh r6, [r2, #4]
	ldrh r7, [r2, #6]
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi .L0800EA06
	lsls r0, r0, #2
	ldr r1, .L0800E934  @ .L0800E938
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800E934: .4byte .L0800E938
.L0800E938: @ jump table
	.4byte .L0800E950 @ case 0
	.4byte .L0800E990 @ case 1
	.4byte .L0800E990 @ case 2
	.4byte .L0800E950 @ case 3
	.4byte .L0800E950 @ case 4
	.4byte .L0800E950 @ case 5
.L0800E950:
	cmp r6, #5
	bhi .L0800EA06
	lsls r0, r6, #2
	ldr r1, .L0800E960  @ .L0800E964
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800E960: .4byte .L0800E964
.L0800E964: @ jump table
	.4byte .L0800EA44 @ case 0
	.4byte .L0800E97C @ case 1
	.4byte .L0800E97C @ case 2
	.4byte .L0800EA44 @ case 3
	.4byte .L0800EA44 @ case 4
	.4byte .L0800EA44 @ case 5
.L0800E97C:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne .L0800EA66
	ldr r0, .L0800E98C  @ gUnknown_08591E58
	b .L0800E9FA
	.align 2, 0
.L0800E98C: .4byte gUnknown_08591E58
.L0800E990:
	cmp r6, #5
	bhi .L0800EA06
	lsls r0, r6, #2
	ldr r1, .L0800E9A0  @ .L0800E9A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800E9A0: .4byte .L0800E9A4
.L0800E9A4: @ jump table
	.4byte .L0800E9BC @ case 0
	.4byte .L0800E9EC @ case 1
	.4byte .L0800E9EC @ case 2
	.4byte .L0800E9BC @ case 3
	.4byte .L0800E9BC @ case 4
	.4byte .L0800E9BC @ case 5
.L0800E9BC:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800E9D4
	adds r0, r5, #0
	bl Event22_CLEAN
.L0800E9CE:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b .L0800EA78
.L0800E9D4:
	ldr r0, .L0800E9E8  @ gUnknown_08591EB0
	adds r1, r5, #0
	bl SpawnProcLocking
	mov ip, r0
	mov r1, ip
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	b .L0800EA06
	.align 2, 0
.L0800E9E8: .4byte gUnknown_08591EB0
.L0800E9EC:
	ldrh r0, [r5, #0x3c]
	lsrs r4, r0, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne .L0800EA66
	ldr r0, .L0800EA1C  @ gUnknown_08591E00
.L0800E9FA:
	adds r1, r5, #0
	bl SpawnProcLocking
	mov ip, r0
	adds r0, #0x29
	strb r4, [r0]
.L0800EA06:
	mov r1, ip
	adds r1, #0x2a
	movs r0, #0
	strb r6, [r1]
	mov r1, r8
	mov r2, ip
	strh r1, [r2, #0x2c]
	strh r7, [r2, #0x2e]
	strh r0, [r2, #0x30]
	str r5, [r2, #0x34]
	b .L0800EA76
	.align 2, 0
.L0800EA1C: .4byte gUnknown_08591E00
.L0800EA20:
	ldrh r4, [r2, #4]
	ldrh r7, [r2, #6]
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L0800EA66
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	mov r1, r8
	bl func_0800E7D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne .L0800EA48
.L0800EA44:
	movs r0, #6
	b .L0800EA78
.L0800EA48:
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl func_080B2780
	b .L0800EA76
.L0800EA56:
	ldrh r4, [r2, #4]
	ldrh r7, [r2, #6]
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800EA6A
.L0800EA66:
	movs r0, #0
	b .L0800EA78
.L0800EA6A:
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl func_080B272C
.L0800EA76:
	movs r0, #2
.L0800EA78:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event21_TextBGStuff

	THUMB_FUNC_START func_0800EA84
func_0800EA84: @ 0x0800EA84
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, .L0800EAC4  @ gDispIo
	ldrb r1, [r5, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r4, #0x29
	ldrb r4, [r4]
	cmp r4, #1
	beq .L0800EB22
	cmp r4, #1
	bgt .L0800EAC8
	cmp r4, #0
	beq .L0800EACE
	b .L0800EB94
	.align 2, 0
.L0800EAC4: .4byte gDispIo
.L0800EAC8:
	cmp r4, #2
	beq .L0800EB40
	b .L0800EB94
.L0800EACE:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldrb r1, [r5, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r5, #0xc]
	ldrb r1, [r5, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r5, #0x18]
	b .L0800EB94
.L0800EB22:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	b .L0800EB5E
.L0800EB40:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
.L0800EB5E:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldrb r1, [r5, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0xc]
	ldrb r1, [r5, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r2, r0
	strb r2, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
.L0800EB94:
	movs r0, #1
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #0
	movs r1, #6
	bl func_0800BA04
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800EA84

	THUMB_FUNC_START func_0800EBB0
func_0800EBB0: @ 0x0800EBB0
	push {lr}
	movs r0, #3
	movs r1, #2
	movs r2, #0xa
	bl func_0800B910
	movs r0, #3
	movs r1, #2
	movs r2, #1
	bl func_0800B954
	movs r0, #8
	movs r1, #0
	movs r2, #6
	bl func_0800B994
	movs r1, #8
	negs r1, r1
	movs r0, #2
	bl func_0800B9B8
	ldr r2, .L0800EBFC  @ gDispIo
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
.L0800EBFC: .4byte gDispIo

	THUMB_FUNC_END func_0800EBB0

	THUMB_FUNC_START func_0800EC00
func_0800EC00: @ 0x0800EC00
	push {lr}
	movs r0, #2
	movs r1, #3
	movs r2, #0xa
	bl func_0800B910
	movs r0, #2
	movs r1, #3
	movs r2, #1
	bl func_0800B954
	movs r0, #0
	movs r1, #8
	movs r2, #6
	bl func_0800B994
	movs r0, #3
	movs r1, #8
	bl func_0800B9B8
	ldr r2, .L0800EC4C  @ gDispIo
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
.L0800EC4C: .4byte gDispIo

	THUMB_FUNC_END func_0800EC00

	THUMB_FUNC_START func_0800EC50
func_0800EC50: @ 0x0800EC50
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #5
	bhi .L0800ED20
	lsls r0, r0, #2
	ldr r1, .L0800EC68  @ .L0800EC6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800EC68: .4byte .L0800EC6C
.L0800EC6C: @ jump table
	.4byte .L0800EC84 @ case 0
	.4byte .L0800EC86 @ case 1
	.4byte .L0800ED00 @ case 2
	.4byte .L0800EC84 @ case 3
	.4byte .L0800EC84 @ case 4
	.4byte .L0800EC84 @ case 5
.L0800EC84:
	b .L0800EC84
.L0800EC86:
	ldrh r0, [r6, #0x2c]
	cmp r0, #0x37
	bne .L0800EC94
	movs r0, #0x35
	bl RandNext
	strh r0, [r6, #0x2c]
.L0800EC94:
	ldr r5, .L0800ECF4  @ gUnknown_0895DD1C
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r0]
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0800ECF8  @ gBg2Tm
	ldrh r2, [r6, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r5, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0
	bl TmApplyTsa_thm
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, #8
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0xc0
	bl ApplyPaletteExt
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r1, .L0800ECFC  @ gPal
	movs r0, #0
	strh r0, [r1]
	b .L0800ED20
	.align 2, 0
.L0800ECF4: .4byte gUnknown_0895DD1C
.L0800ECF8: .4byte gBg2Tm
.L0800ECFC: .4byte gPal
.L0800ED00:
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0800ED48  @ gBg2Tm
	ldrh r2, [r6, #0x2c]
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl func_080B65F8
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
.L0800ED20:
	ldr r2, .L0800ED4C  @ gDispIo
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
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0800ED48: .4byte gBg2Tm
.L0800ED4C: .4byte gDispIo

	THUMB_FUNC_END func_0800EC50

	THUMB_FUNC_START func_0800ED50
func_0800ED50: @ 0x0800ED50
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #5
	bhi .L0800EE24
	lsls r0, r0, #2
	ldr r1, .L0800ED68  @ .L0800ED6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800ED68: .4byte .L0800ED6C
.L0800ED6C: @ jump table
	.4byte .L0800ED84 @ case 0
	.4byte .L0800ED86 @ case 1
	.4byte .L0800EE04 @ case 2
	.4byte .L0800ED84 @ case 3
	.4byte .L0800ED84 @ case 4
	.4byte .L0800ED84 @ case 5
.L0800ED84:
	b .L0800ED84
.L0800ED86:
	ldrh r0, [r6, #0x2c]
	cmp r0, #0x37
	bne .L0800ED94
	movs r0, #0x35
	bl RandNext
	strh r0, [r6, #0x2c]
.L0800ED94:
	ldr r5, .L0800EDF8  @ gUnknown_0895DD1C
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r0]
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L0800EDFC  @ gBg3Tm
	ldrh r2, [r6, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r5, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, #8
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	bl EnablePalSync
	ldr r1, .L0800EE00  @ gPal
	movs r0, #0
	strh r0, [r1]
	b .L0800EE24
	.align 2, 0
.L0800EDF8: .4byte gUnknown_0895DD1C
.L0800EDFC: .4byte gBg3Tm
.L0800EE00: .4byte gPal
.L0800EE04:
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L0800EE4C  @ gBg3Tm
	ldrh r2, [r6, #0x2c]
	str r2, [sp]
	movs r2, #8
	movs r3, #6
	bl func_080B65F8
	movs r0, #8
	bl EnableBgSync
	bl EnablePalSync
.L0800EE24:
	ldr r2, .L0800EE50  @ gDispIo
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
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0800EE4C: .4byte gBg3Tm
.L0800EE50: .4byte gDispIo

	THUMB_FUNC_END func_0800ED50

	THUMB_FUNC_START func_0800EE54
func_0800EE54: @ 0x0800EE54
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #5
	bhi .L0800EEBE
	lsls r0, r0, #2
	ldr r1, .L0800EE6C  @ .L0800EE70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800EE6C: .4byte .L0800EE70
.L0800EE70: @ jump table
	.4byte .L0800EE88 @ case 0
	.4byte .L0800EEBC @ case 1
	.4byte .L0800EEBC @ case 2
	.4byte .L0800EE88 @ case 3
	.4byte .L0800EE88 @ case 4
	.4byte .L0800EE88 @ case 5
.L0800EE88:
	ldr r4, .L0800EEB8  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl ApplyChapterMapGraphics
	ldrb r0, [r4, #0x15]
	bl AllocWeatherParticles
	bl RenderMap
	bl RefreshUnitSprites
	ldr r0, [r5, #0x34]
	adds r0, #0x44
	ldrh r0, [r0]
	bl func_0800BCDC
	bl ForceSyncUnitSpriteSheet
	ldr r0, [r5, #0x34]
	bl Event24_UnblockGameGraphics
	b .L0800EEBE
	.align 2, 0
.L0800EEB8: .4byte gPlaySt
.L0800EEBC:
	b .L0800EEBC
.L0800EEBE:
	ldr r2, .L0800EEE4  @ gDispIo
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0800EEE4: .4byte gDispIo

	THUMB_FUNC_END func_0800EE54

	THUMB_FUNC_START func_0800EEE8
func_0800EEE8: @ 0x0800EEE8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x30]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x14
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	blt .L0800EF36
	cmp r0, #1
	ble .L0800EF0C
	cmp r0, #2
	beq .L0800EF22
	b .L0800EF36
.L0800EF0C:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	b .L0800EF36
.L0800EF22:
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
.L0800EF36:
	cmp r4, #0xf
	bls .L0800EF40
	adds r0, r5, #0
	bl Proc_Break
.L0800EF40:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800EEE8

	THUMB_FUNC_START func_0800EF48
func_0800EF48: @ 0x0800EF48
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r3, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0800EF90
	cmp r0, #1
	bgt .L0800EF64
	cmp r0, #0
	beq .L0800EF6A
	b .L0800EFE2
.L0800EF64:
	cmp r0, #2
	beq .L0800EFBC
	b .L0800EFE2
.L0800EF6A:
	ldr r2, .L0800EF8C  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	b .L0800EFE2
	.align 2, 0
.L0800EF8C: .4byte gDispIo
.L0800EF90:
	ldr r2, .L0800EFB8  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, [r3, #0x34]
	bl Event23_BlockGameGraphics
	b .L0800EFE2
	.align 2, 0
.L0800EFB8: .4byte gDispIo
.L0800EFBC:
	ldr r2, .L0800F0BC  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl InitSystemTextFont
	bl func_080156D4
.L0800EFE2:
	ldr r3, .L0800F0BC  @ gDispIo
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
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropA
	movs r0, #1
	bl SetBlendBackdropB
	bl func_0800BA34
	ldr r0, .L0800F0C0  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	ldr r6, .L0800F0C4  @ 0x01000008
	add r0, sp, #4
	adds r2, r6, #0
	bl CpuFastSet
	mov r0, r8
	str r0, [sp, #8]
	add r4, sp, #8
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	mov r0, r8
	str r0, [sp, #0xc]
	add r4, sp, #0xc
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0800F0BC: .4byte gDispIo
.L0800F0C0: .4byte gBg2Tm
.L0800F0C4: .4byte 0x01000008

	THUMB_FUNC_END func_0800EF48

	THUMB_FUNC_START Event22_CLEAN
Event22_CLEAN: @ 0x0800F0C8
	push {r4, lr}
	adds r4, r0, #0
	bl InitBmDisplay
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl func_0800BCDC
	ldr r0, .L0800F118  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L0800F11C  @ gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl Dialogue_ClearTextBoxes
	ldr r0, .L0800F120  @ ProcScr_Face
	bl EndEachProc
	bl InitFaces
	bl ClearTalkFaceRefs
	adds r0, r4, #0
	bl Event24_UnblockGameGraphics
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0800F118: .4byte gBg0Tm
.L0800F11C: .4byte gBg1Tm
.L0800F120: .4byte ProcScr_Face

	THUMB_FUNC_END Event22_CLEAN

	THUMB_FUNC_START Event23_BlockGameGraphics
Event23_BlockGameGraphics: @ 0x0800F124
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne .L0800F13E
	bl LockBmDisplay
	bl MU_AllDisable
.L0800F13E:
	ldrh r1, [r4, #0x3c]
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event23_BlockGameGraphics

	THUMB_FUNC_START Event24_UnblockGameGraphics
Event24_UnblockGameGraphics: @ 0x0800F150
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq .L0800F168
	bl UnlockBmDisplay
	bl MU_AllEnable
.L0800F168:
	ldrh r1, [r4, #0x3c]
	ldr r0, .L0800F178  @ 0x0000EFFF
	ands r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0800F178: .4byte 0x0000EFFF

	THUMB_FUNC_END Event24_UnblockGameGraphics

	THUMB_FUNC_START Event25_LOMA
Event25_LOMA: @ 0x0800F17C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	ldr r1, .L0800F1F8  @ gUnknown_030004E4
	ldrb r6, [r1]
	ldrb r7, [r1, #2]
	ldrh r4, [r0, #2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge .L0800F198
	adds r0, r1, #0
	subs r0, #0x2c
	ldrh r4, [r0, #8]
.L0800F198:
	adds r0, r5, #0
	bl Event24_UnblockGameGraphics
	ldr r0, .L0800F1FC  @ gPlaySt
	strb r4, [r0, #0xe]
	bl RestartBattleMap
	lsls r0, r6, #4
	bl func_08015A40
	ldr r4, .L0800F200  @ gBmSt
	strh r0, [r4, #0xc]
	lsls r0, r7, #4
	bl func_08015A6C
	strh r0, [r4, #0xe]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl InitBmDisplay
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl func_0800BCDC
	ldr r0, .L0800F204  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L0800F208  @ gBg1Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	movs r0, #2
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0800F1F8: .4byte gUnknown_030004E4
.L0800F1FC: .4byte gPlaySt
.L0800F200: .4byte gBmSt
.L0800F204: .4byte gBg0Tm
.L0800F208: .4byte gBg1Tm

	THUMB_FUNC_END Event25_LOMA

	THUMB_FUNC_START Event26_CameraControlMaybe
Event26_CameraControlMaybe: @ 0x0800F20C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r2, [r7, #0x38]
	ldrh r1, [r2]
	movs r3, #7
	ands r3, r1
	movs r0, #0xf
	ands r0, r1
	lsrs r0, r0, #3
	mov r8, r0
	cmp r3, #0
	beq .L0800F22E
	cmp r3, #1
	beq .L0800F250
	b .L0800F264
.L0800F22E:
	ldrh r0, [r2, #2]
	lsrs r6, r0, #8
	ldrb r4, [r2, #2]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt .L0800F242
	lsls r0, r6, #0x18
	cmp r0, #0
	bge .L0800F264
.L0800F242:
	ldr r0, .L0800F24C  @ gUnknown_030004E4
	ldrb r4, [r0]
	ldrb r6, [r0, #2]
	b .L0800F264
	.align 2, 0
.L0800F24C: .4byte gUnknown_030004E4
.L0800F250:
	movs r1, #2
	ldrsh r0, [r2, r1]
	bl GetUnitStructFromEventParameter
	cmp r0, #0
	bne .L0800F260
	movs r0, #6
	b .L0800F2CA
.L0800F260:
	ldrb r4, [r0, #0x10]
	ldrb r6, [r0, #0x11]
.L0800F264:
	ldrh r2, [r7, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L0800F27A
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L0800F29C
.L0800F27A:
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r6, #0x18
	asrs r5, r5, #0x18
	mov r2, r8
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetSomeRealCamPos
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetCursorMapPosition
	bl RenderMap
	movs r0, #0
	b .L0800F2CA
.L0800F29C:
	mov r0, r8
	cmp r0, #0
	bne .L0800F2B2
	lsls r5, r4, #0x18
	asrs r1, r5, #0x18
	lsls r4, r6, #0x18
	asrs r2, r4, #0x18
	adds r0, r7, #0
	bl EnsureCameraOntoPosition
	b .L0800F2C0
.L0800F2B2:
	lsls r5, r4, #0x18
	asrs r1, r5, #0x18
	lsls r4, r6, #0x18
	asrs r2, r4, #0x18
	adds r0, r7, #0
	bl CenterCameraOntoPosition
.L0800F2C0:
	asrs r0, r5, #0x18
	asrs r1, r4, #0x18
	bl SetCursorMapPosition
	movs r0, #2
.L0800F2CA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event26_CameraControlMaybe

	THUMB_FUNC_START Event27_MapChange
Event27_MapChange: @ 0x0800F2D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r7, #1
	ldr r0, [r5, #0x38]
	ldrb r1, [r0]
	movs r6, #0xf
	ands r6, r1
	ldrh r2, [r0, #2]
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r0, #2
	negs r0, r0
	cmp r1, r0
	beq .L0800F314
	cmp r1, r0
	bgt .L0800F300
	subs r0, #1
	cmp r1, r0
	beq .L0800F330
	b .L0800F34A
.L0800F300:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L0800F34A
	ldr r1, .L0800F310  @ gUnknown_030004E4
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	b .L0800F31C
	.align 2, 0
.L0800F310: .4byte gUnknown_030004E4
.L0800F314:
	ldr r0, .L0800F32C  @ gActiveUnit
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	ldrb r1, [r1, #0x11]
.L0800F31C:
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge .L0800F34A
	movs r0, #6
	b .L0800F3E0
	.align 2, 0
.L0800F32C: .4byte gActiveUnit
.L0800F330:
	ldr r0, .L0800F368  @ gEventSlotQueue
	mov r8, r0
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, .L0800F36C  @ gEventSlots
	ldr r0, [r0, #0x34]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
.L0800F34A:
	ldrh r1, [r5, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800F3A0
	movs r4, #0
	cmp r4, r7
	bcs .L0800F3DE
.L0800F35C:
	cmp r6, #0
	beq .L0800F370
	cmp r6, #1
	beq .L0800F37C
	b .L0800F386
	.align 2, 0
.L0800F368: .4byte gEventSlotQueue
.L0800F36C: .4byte gEventSlots
.L0800F370:
	adds r0, r2, #0
	movs r1, #0
	adds r2, r5, #0
	bl TriggerMapChanges
	b .L0800F386
.L0800F37C:
	adds r0, r2, #0
	movs r1, #0
	adds r2, r5, #0
	bl UntriggerMapChange
.L0800F386:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	bcc .L0800F35C
	b .L0800F3DE
.L0800F3A0:
	movs r1, #1
	movs r4, #0
	cmp r4, r7
	bcs .L0800F3DE
.L0800F3A8:
	cmp r6, #0
	beq .L0800F3B2
	cmp r6, #1
	beq .L0800F3BC
	b .L0800F3C4
.L0800F3B2:
	adds r0, r2, #0
	adds r2, r5, #0
	bl TriggerMapChanges
	b .L0800F3C4
.L0800F3BC:
	adds r0, r2, #0
	adds r2, r5, #0
	bl UntriggerMapChange
.L0800F3C4:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	bcc .L0800F3A8
.L0800F3DE:
	movs r0, #2
.L0800F3E0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event27_MapChange

	THUMB_FUNC_START Event28_ChangeWeather
Event28_ChangeWeather: @ 0x0800F3EC
	push {lr}
	ldr r0, [r0, #0x38]
	ldrh r0, [r0, #2]
	bl SetWeather
	movs r0, #2
	pop {r1}
	bx r1

	THUMB_FUNC_END Event28_ChangeWeather

	THUMB_FUNC_START Event29_SetFogVision
Event29_SetFogVision: @ 0x0800F3FC
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x38]
	ldrb r0, [r1]
	movs r3, #0xf
	ands r3, r0
	ldrh r4, [r1, #2]
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800F418
	movs r3, #0
.L0800F418:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r3, #0
	bl func_0800BAA8
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event29_SetFogVision

	THUMB_FUNC_START Event2A_MoveToChapter
Event2A_MoveToChapter: @ 0x0800F42C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r3, #0xf
	ands r3, r1
	ldrh r2, [r0, #2]
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge .L0800F446
	ldr r0, .L0800F454  @ gEventSlots
	ldrh r2, [r0, #8]
.L0800F446:
	cmp r3, #4
	bhi .L0800F4E8
	lsls r0, r3, #2
	ldr r1, .L0800F458  @ .L0800F45C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0800F454: .4byte gEventSlots
.L0800F458: .4byte .L0800F45C
.L0800F45C: @ jump table
	.4byte .L0800F470 @ case 0
	.4byte .L0800F474 @ case 1
	.4byte .L0800F498 @ case 2
	.4byte .L0800F4BC @ case 3
	.4byte .L0800F4C4 @ case 4
.L0800F470:
	movs r0, #0
	b .L0800F4D8
.L0800F474:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl SetNextChapterId
	ldr r2, .L0800F494  @ gPlaySt
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	b .L0800F4D8
	.align 2, 0
.L0800F494: .4byte gPlaySt
.L0800F498:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl SetNextChapterId
	ldr r2, .L0800F4B8  @ gPlaySt
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	b .L0800F4D8
	.align 2, 0
.L0800F4B8: .4byte gPlaySt
.L0800F4BC:
	adds r0, r2, #0
	bl GotoChapterWithoutSave
	b .L0800F4E8
.L0800F4C4:
	ldr r2, .L0800F508  @ gPlaySt
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #6
	orrs r0, r1
	strb r0, [r2]
	movs r0, #3
.L0800F4D8:
	bl SetNextGameActionId
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
.L0800F4E8:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	bl CancelDelaySong
	movs r0, #4
	bl FadeBgmOut
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0800F508: .4byte gPlaySt

	THUMB_FUNC_END Event2A_MoveToChapter

	THUMB_FUNC_START UNIT_GetListSize
UNIT_GetListSize: @ 0x0800F50C
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	b .L0800F51C
.L0800F514:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r1, #0x14
.L0800F51C:
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0800F514
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END UNIT_GetListSize

	THUMB_FUNC_START UNIT_ShouldBeLoaded
UNIT_ShouldBeLoaded: @ 0x0800F528
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldrb r1, [r4, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne .L0800F564
	cmp r5, #1
	beq .L0800F564
	ldrb r0, [r4]
	bl GetUnitByPid
	cmp r0, #0
	beq .L0800F564
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L0800F564
	cmp r5, #0
	beq .L0800F5A2
	cmp r5, #2
	bne .L0800F564
	ldrb r0, [r4]
	bl IsSethLArachelMyrrhInnes
	cmp r0, #0
	beq .L0800F5A2
.L0800F564:
	ldrb r1, [r4, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #4
	bne .L0800F5B0
	ldr r0, [r4, #4]
	ldr r1, .L0800F5A8  @ 0xFF004000
	ands r0, r1
	cmp r0, #0
	bne .L0800F596
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	ldr r1, .L0800F5AC  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0800F5A2
.L0800F596:
	movs r0, #0x80
	bl IsUnitSlotAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0800F5B0
.L0800F5A2:
	movs r0, #0
	b .L0800F5B2
	.align 2, 0
.L0800F5A8: .4byte 0xFF004000
.L0800F5AC: .4byte gMapUnit
.L0800F5B0:
	movs r0, #1
.L0800F5B2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END UNIT_ShouldBeLoaded

	THUMB_FUNC_START LoadUnitsIdle
LoadUnitsIdle: @ 0x0800F5B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x48]
	adds r5, r6, #0
	adds r5, #0x4c
	ldrh r7, [r5]
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r9, r0
	adds r0, r6, #0
	movs r1, #1
	bl GetSomeEventEngineMoveRelatedBitfield
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r3, #0
	mov r0, r9
	cmp r0, #2
	bne .L0800F5F0
	movs r3, #1
.L0800F5F0:
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800F614
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	mov r2, r9
	bl UNITs_LoadInstant_800F698
	mov r8, r5
	b .L0800F674
.L0800F60C:
	str r4, [r6, #0x48]
	mov r1, r8
	strh r7, [r1]
	b .L0800F684
.L0800F614:
	ldrb r0, [r4]
	mov r8, r5
	cmp r0, #0
	beq .L0800F674
	lsls r0, r7, #0x10
	adds r5, r0, #0
	cmp r5, #0
	ble .L0800F674
	lsls r3, r3, #0x18
	mov sl, r3
.L0800F628:
	adds r0, r4, #0
	mov r1, r9
	bl UNIT_ShouldBeLoaded
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0800F664
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x1a
	adds r0, r6, #0
	bl CanStartEventUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0800F60C
	adds r0, r4, #0
	ldr r1, [sp]
	movs r2, #0
	mov r7, sl
	asrs r3, r7, #0x18
	bl UNIT_Load_800F704
	ldr r1, .L0800F694  @ 0xFFFF0000
	adds r0, r5, r1
	lsrs r7, r0, #0x10
.L0800F664:
	adds r4, #0x14
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0800F674
	lsls r0, r7, #0x10
	adds r5, r0, #0
	cmp r5, #0
	bgt .L0800F628
.L0800F674:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2]
	adds r2, r6, #0
	adds r2, #0x4e
	strb r1, [r2]
	str r0, [r6, #0x2c]
.L0800F684:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0800F694: .4byte 0xFFFF0000

	THUMB_FUNC_END LoadUnitsIdle

	THUMB_FUNC_START UNITs_LoadInstant_800F698
UNITs_LoadInstant_800F698: @ 0x0800F698
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r3, #0
	cmp r7, #2
	bne .L0800F6B0
	movs r3, #1
.L0800F6B0:
	ldrb r0, [r5]
	cmp r0, #0
	beq .L0800F6F6
	lsls r0, r6, #0x10
	adds r4, r0, #0
	cmp r4, #0
	ble .L0800F6F6
	lsls r3, r3, #0x18
	mov r8, r3
.L0800F6C2:
	adds r0, r5, #0
	adds r1, r7, #0
	bl UNIT_ShouldBeLoaded
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0800F6E6
	adds r0, r5, #0
	movs r1, #1
	movs r2, #1
	mov r6, r8
	asrs r3, r6, #0x18
	bl UNIT_Load_800F704
	ldr r1, .L0800F700  @ 0xFFFF0000
	adds r0, r4, r1
	lsrs r6, r0, #0x10
.L0800F6E6:
	adds r5, #0x14
	ldrb r0, [r5]
	cmp r0, #0
	beq .L0800F6F6
	lsls r0, r6, #0x10
	adds r4, r0, #0
	cmp r4, #0
	bgt .L0800F6C2
.L0800F6F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0800F700: .4byte 0xFFFF0000

	THUMB_FUNC_END UNITs_LoadInstant_800F698

	THUMB_FUNC_START UNIT_Load_800F704
UNIT_Load_800F704: @ 0x0800F704
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r9, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r1, .L0800F740  @ gUnknown_080D793C
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne .L0800F744
	ldrb r0, [r6]
	movs r1, #0
	bl GetUnitByPidAndFaction
	b .L0800F768
	.align 2, 0
.L0800F740: .4byte gUnknown_080D793C
.L0800F744:
	ldrb r0, [r6]
	movs r1, #0
	bl GetUnitByPidAndFaction
	adds r5, r0, #0
	cmp r5, #0
	beq .L0800F76E
	ldrb r0, [r6, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	bl UnitChangeFaction
	ldrb r0, [r6]
	bl GetUnitByPid
.L0800F768:
	adds r5, r0, #0
	cmp r5, #0
	bne .L0800F790
.L0800F76E:
	adds r0, r6, #0
	bl CreateUnit
	adds r5, r0, #0
	cmp r4, #1
	bne .L0800F7FA
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne .L0800F7FA
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0xc]
	b .L0800F7FA
.L0800F790:
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne .L0800F7FA
	ldr r1, [r5, #0xc]
	movs r0, #3
	negs r0, r0
	ands r1, r0
	str r1, [r5, #0xc]
	cmp r4, #1
	bne .L0800F7B8
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L0800F7C8
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r1, r0
	b .L0800F7C6
.L0800F7B8:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L0800F7C8
	ldr r0, .L0800F848  @ 0xFFBFFFFF
	ands r1, r0
.L0800F7C6:
	str r1, [r5, #0xc]
.L0800F7C8:
	add r4, sp, #4
	mov r7, sp
	adds r7, #5
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #0
	bl GenUnitDefinitionFinalPosition
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne .L0800F7FA
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r1, r0
	bne .L0800F7FA
	ldr r0, .L0800F84C  @ 0x0000FFFE
	mov r1, r8
	ands r1, r0
	mov r8, r1
.L0800F7FA:
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	strb r0, [r5, #0x10]
	ldrh r0, [r6, #4]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	strb r0, [r5, #0x11]
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #4
	bne .L0800F888
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x3b
	bls .L0800F888
	ldr r2, .L0800F850  @ gPlaySt
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	adds r3, r2, #0
	cmp r0, #0
	blt .L0800F854
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L0800F85E
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	bl GetChapterInfo
	ldrb r1, [r0, #0x14]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	negs r1, r1
	b .L0800F86A
	.align 2, 0
.L0800F848: .4byte 0xFFBFFFFF
.L0800F84C: .4byte 0x0000FFFE
.L0800F850: .4byte gPlaySt
.L0800F854:
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0800F872
.L0800F85E:
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	bl GetChapterInfo
	ldrb r1, [r0, #0x14]
	lsrs r1, r1, #4
.L0800F86A:
	adds r0, r5, #0
	bl UnitApplyBonusLevels
	b .L0800F888
.L0800F872:
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	bl GetChapterInfo
	ldrb r1, [r0, #0x15]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	negs r1, r1
	adds r0, r5, #0
	bl UnitApplyBonusLevels
.L0800F888:
	mov r0, r9
	lsls r3, r0, #0x18
	asrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	bl func_0800F8A8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END UNIT_Load_800F704

	THUMB_FUNC_START func_0800F8A8
func_0800F8A8: @ 0x0800F8A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r5, #0
	beq .L0800F90C
	ldrb r1, [r4, #5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0800F8C8
	movs r0, #2
	orrs r6, r0
.L0800F8C8:
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne .L0800F8E4
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x1a
	adds r0, r5, #0
	adds r3, r6, #0
	bl MoveUnit_
	b .L0800F90C
.L0800F8E4:
	cmp r3, #1
	beq .L0800F8F2
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L0800F900
.L0800F8F2:
	ldr r1, [r4, #8]
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r3, r6, #0
	bl func_08079FA8
	b .L0800F90C
.L0800F900:
	ldr r1, [r4, #8]
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r3, r6, #0
	bl MuCtr_StartDefinedMove
.L0800F90C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800F8A8

	THUMB_FUNC_START UNIT_Filter
UNIT_Filter: @ 0x0800F914
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	adds r6, r0, #0
	ldr r0, [sp, #0x80]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x40]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x44]
	movs r0, #0
	mov r8, r0
	movs r3, #0
	cmp r2, #0
	beq .L0800F994
	str r6, [sp, #0x54]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r3, r0
	bge .L0800F982
	movs r1, #0x40
	mov r9, r1
	adds r7, r0, #0
.L0800F956:
	ldr r2, [sp, #0x54]
	ldrb r1, [r2, #5]
	mov r0, r9
	ands r0, r1
	cmp r0, #0
	beq .L0800F972
	mov r0, sp
	add r0, r8
	strb r3, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
.L0800F972:
	ldr r4, [sp, #0x54]
	adds r4, #0x14
	str r4, [sp, #0x54]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r7
	blt .L0800F956
.L0800F982:
	mov r5, ip
	mov r0, r8
	muls r0, r5, r0
	adds r0, #0x32
	movs r1, #0x64
	bl Div
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
.L0800F994:
	movs r0, #0
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	mov r1, sl
	lsls r1, r1, #0x10
	mov r9, r1
	ldr r2, [sp, #0x44]
	lsls r2, r2, #0x18
	str r2, [sp, #0x4c]
	ldr r4, [sp, #0x40]
	lsls r4, r4, #0x18
	str r4, [sp, #0x48]
	cmp r3, #0
	beq .L0800FA0C
	movs r7, #1
.L0800F9B2:
	mov r0, r8
	str r3, [sp, #0x50]
	bl RandNext
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r5, sp
	adds r0, r5, r2
	ldrb r2, [r0]
	ldr r3, [sp, #0x50]
	cmp r2, #0x1f
	bhi .L0800F9D4
	adds r0, r7, #0
	lsls r0, r2
	ldr r1, [sp, #0x58]
	ands r0, r1
	b .L0800F9E0
.L0800F9D4:
	adds r1, r2, #0
	subs r1, #0x20
	adds r0, r7, #0
	lsls r0, r1
	ldr r4, [sp, #0x5c]
	ands r0, r4
.L0800F9E0:
	cmp r0, #0
	bne .L0800FA08
	cmp r2, #0x1f
	bhi .L0800F9F4
	adds r0, r7, #0
	lsls r0, r2
	ldr r5, [sp, #0x58]
	orrs r5, r0
	str r5, [sp, #0x58]
	b .L0800FA02
.L0800F9F4:
	adds r1, r2, #0
	subs r1, #0x20
	adds r0, r7, #0
	lsls r0, r1
	ldr r1, [sp, #0x5c]
	orrs r1, r0
	str r1, [sp, #0x5c]
.L0800FA02:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
.L0800FA08:
	cmp r3, #0
	bne .L0800F9B2
.L0800FA0C:
	str r6, [sp, #0x54]
	ldr r6, .L0800FA34  @ end
	movs r3, #0
	mov r2, r9
	asrs r0, r2, #0x10
	mov ip, r6
	cmp r3, r0
	bge .L0800FA70
	movs r4, #0x41
	negs r4, r4
	mov sl, r4
	mov r8, r0
.L0800FA24:
	cmp r3, #0x1f
	bhi .L0800FA38
	movs r0, #1
	lsls r0, r3
	ldr r5, [sp, #0x58]
	ands r0, r5
	b .L0800FA44
	.align 2, 0
.L0800FA34: .4byte end
.L0800FA38:
	adds r1, r3, #0
	subs r1, #0x20
	movs r0, #1
	lsls r0, r1
	ldr r1, [sp, #0x5c]
	ands r0, r1
.L0800FA44:
	cmp r0, #0
	bne .L0800FA66
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x54]
	adds r0, r0, r2
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r4, r5}
	stm r1!, {r4, r5}
	ldrb r1, [r6, #5]
	mov r0, sl
	ands r0, r1
	strb r0, [r6, #5]
	adds r6, #0x14
.L0800FA66:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt .L0800FA24
.L0800FA70:
	movs r3, #0
	mov r1, r9
	asrs r0, r1, #0x10
	cmp r3, r0
	bge .L0800FACA
	movs r2, #1
	mov sl, r2
	mov r8, r0
.L0800FA80:
	cmp r3, #0x1f
	bhi .L0800FA92
	mov r0, sl
	lsls r0, r3
	ldr r4, [sp, #0x58]
	ands r0, r4
	cmp r0, #0
	bne .L0800FAA2
	b .L0800FAC0
.L0800FA92:
	adds r1, r3, #0
	subs r1, #0x20
	mov r0, sl
	lsls r0, r1
	ldr r5, [sp, #0x5c]
	ands r0, r5
	cmp r0, #0
	beq .L0800FAC0
.L0800FAA2:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x54]
	adds r0, r0, r2
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r4, r5}
	stm r1!, {r4, r5}
	ldrb r0, [r6, #5]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r6, #5]
	adds r6, #0x14
.L0800FAC0:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt .L0800FA80
.L0800FACA:
	movs r0, #0
	strb r0, [r6]
	ldr r1, [sp, #0x4c]
	asrs r0, r1, #0x18
	cmp r0, #1
	bne .L0800FAF6
	mov r6, ip
	movs r3, #0
	mov r2, r9
	asrs r0, r2, #0x10
	cmp r3, r0
	bge .L0800FAF6
	movs r2, #0
	adds r1, r0, #0
.L0800FAE6:
	strb r2, [r6, #7]
	str r2, [r6, #8]
	adds r6, #0x14
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	blt .L0800FAE6
.L0800FAF6:
	mov r6, ip
	ldr r4, [sp, #0x48]
	asrs r0, r4, #0x18
	cmp r0, #1
	bne .L0800FB06
	adds r0, r6, #0
	bl func_080125C0
.L0800FB06:
	adds r0, r6, #0
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END UNIT_Filter

	THUMB_FUNC_START Event2B_
Event2B_: @ 0x0800FB18
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	ands r2, r1
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, #0
	bge .L0800FB34
	ldr r0, .L0800FB44  @ gEventSlots
	ldrh r1, [r0, #8]
.L0800FB34:
	cmp r2, #1
	beq .L0800FB56
	cmp r2, #1
	bgt .L0800FB48
	cmp r2, #0
	beq .L0800FB4E
	b .L0800FB7A
	.align 2, 0
.L0800FB44: .4byte gEventSlots
.L0800FB48:
	cmp r4, #2
	beq .L0800FB6E
	b .L0800FB7A
.L0800FB4E:
	adds r0, r3, #0
	adds r0, #0x4c
	strh r1, [r0]
	b .L0800FB7A
.L0800FB56:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge .L0800FB5E
	movs r1, #0
.L0800FB5E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x64
	ble .L0800FB68
	movs r1, #0x64
.L0800FB68:
	adds r0, r3, #0
	adds r0, #0x4e
	b .L0800FB78
.L0800FB6E:
	adds r0, r3, #0
	adds r0, #0x4f
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
.L0800FB78:
	strb r1, [r0]
.L0800FB7A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event2B_

	THUMB_FUNC_START Event2C_LoadUnits
Event2C_LoadUnits: @ 0x0800FB84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrb r1, [r0, #2]
	mov r8, r1
	ldr r5, [r0, #4]
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r7, [r0]
	cmp r4, #1
	beq .L0800FBBE
	cmp r4, #1
	bgt .L0800FBB4
	cmp r4, #0
	beq .L0800FBC2
	b .L0800FBD6
.L0800FBB4:
	cmp r4, #2
	beq .L0800FBC2
	cmp r4, #3
	beq .L0800FBD0
	b .L0800FBD6
.L0800FBBE:
	movs r0, #2
	mov r8, r0
.L0800FBC2:
	cmp r5, #0
	bge .L0800FBD6
	ldr r0, .L0800FBCC  @ gEventSlots
	ldr r5, [r0, #8]
	b .L0800FBD6
	.align 2, 0
.L0800FBCC: .4byte gEventSlots
.L0800FBD0:
	bl GetChapterEnemyUnitDefinitions
	adds r5, r0, #0
.L0800FBD6:
	cmp r7, #0
	bne .L0800FBE4
	adds r0, r5, #0
	bl UNIT_GetListSize
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
.L0800FBE4:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r9, r0
	movs r1, #0x4e
	adds r1, r1, r6
	mov sl, r1
	ldrb r2, [r1]
	movs r3, #0
	cmp r4, #2
	bne .L0800FBFA
	movs r3, #1
.L0800FBFA:
	adds r4, r6, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	lsrs r0, r0, #7
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r9
	bl UNIT_Filter
	adds r5, r0, #0
	ldr r0, .L0800FC48  @ gMapOther
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldrh r2, [r6, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L0800FC2E
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L0800FC4C
.L0800FC2E:
	adds r0, r5, #0
	mov r1, r9
	mov r2, r8
	bl UNITs_LoadInstant_800F698
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	mov r0, sl
	strb r2, [r0]
	b .L0800FC72
	.align 2, 0
.L0800FC48: .4byte gMapOther
.L0800FC4C:
	str r5, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r7, [r0]
	movs r0, #0x7f
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r1, [r4]
	subs r0, #0xff
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4]
	ldr r1, .L0800FC8C  @ LoadUnitsIdle
	str r1, [r6, #0x2c]
	adds r0, r6, #0
	bl _call_via_r1
.L0800FC72:
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	movs r0, #2
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0800FC8C: .4byte LoadUnitsIdle

	THUMB_FUNC_END Event2C_LoadUnits

	THUMB_FUNC_START CanStartEventUnitMovement
CanStartEventUnitMovement: @ 0x0800FC90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0800FCBE
	ldr r0, .L0800FCCC  @ ProcScr_CameraPan
	bl FindProc
	cmp r0, #0
	bne .L0800FCD0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0800FCD0
.L0800FCBE:
	bl MU_CanStart
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0800FCD0
	movs r0, #1
	b .L0800FCD2
	.align 2, 0
.L0800FCCC: .4byte ProcScr_CameraPan
.L0800FCD0:
	movs r0, #0
.L0800FCD2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanStartEventUnitMovement

	THUMB_FUNC_START GetSomeEventEngineMoveRelatedBitfield
GetSomeEventEngineMoveRelatedBitfield: @ 0x0800FCD8
	push {lr}
	movs r2, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne .L0800FCE6
	movs r2, #1
.L0800FCE6:
	ldrh r1, [r0, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0800FCF6
	movs r0, #4
	orrs r2, r0
.L0800FCF6:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0800FD06
	movs r0, #8
	orrs r2, r0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
.L0800FD06:
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeEventEngineMoveRelatedBitfield

	THUMB_FUNC_START Event2D_
Event2D_: @ 0x0800FD0C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrh r5, [r0, #2]
	adds r0, r5, #0
	bl func_0800BCDC
	adds r4, #0x44
	strh r5, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event2D_

	THUMB_FUNC_START Event2E_CheckAt
Event2E_CheckAt: @ 0x0800FD28
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	ands r2, r1
	ldrh r1, [r0, #2]
	ldrb r5, [r0, #2]
	lsrs r3, r1, #8
	cmp r2, #0
	beq .L0800FD42
	cmp r2, #1
	beq .L0800FD60
	b .L0800FD64
.L0800FD42:
	ldr r0, .L0800FD5C  @ gMapUnit
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0800FD68
	bl GetUnit
	adds r4, r0, #0
	b .L0800FD64
	.align 2, 0
.L0800FD5C: .4byte gMapUnit
.L0800FD60:
	ldr r0, .L0800FD70  @ gActiveUnit
	ldr r4, [r0]
.L0800FD64:
	cmp r4, #0
	bne .L0800FD78
.L0800FD68:
	ldr r1, .L0800FD74  @ gEventSlots
	movs r0, #0
	str r0, [r1, #0x30]
	b .L0800FD80
	.align 2, 0
.L0800FD70: .4byte gActiveUnit
.L0800FD74: .4byte gEventSlots
.L0800FD78:
	ldr r0, .L0800FD88  @ gEventSlots
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	str r1, [r0, #0x30]
.L0800FD80:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0800FD88: .4byte gEventSlots

	THUMB_FUNC_END Event2E_CheckAt

	THUMB_FUNC_START Event2F_MoveUnit
Event2F_MoveUnit: @ 0x0800FD8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, [r7, #0x38]
	ldrh r2, [r1]
	movs r4, #7
	ands r4, r2
	movs r0, #0xf
	ands r0, r2
	lsrs r0, r0, #3
	str r0, [sp, #4]
	ldrh r0, [r1, #2]
	str r0, [sp, #8]
	movs r2, #4
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	mov r8, r0
	cmp r0, #0
	bne .L0800FDBE
	b .L0800FF0C
.L0800FDBE:
	mov r0, r8
	ldrb r0, [r0, #0x10]
	mov r9, r0
	mov r1, r8
	ldrb r1, [r1, #0x11]
	mov sl, r1
	mov r2, r8
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne .L0800FDE2
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq .L0800FDE2
	b .L0800FF0C
.L0800FDE2:
	cmp r4, #1
	beq .L0800FE04
	cmp r4, #1
	bgt .L0800FDF0
	cmp r4, #0
	beq .L0800FDFA
	b .L0800FE7C
.L0800FDF0:
	cmp r4, #2
	beq .L0800FE28
	cmp r4, #3
	beq .L0800FE78
	b .L0800FE7C
.L0800FDFA:
	ldr r0, [r7, #0x38]
	ldrh r1, [r0, #6]
	ldrb r6, [r0, #6]
	lsrs r5, r1, #8
	b .L0800FE72
.L0800FE04:
	ldr r0, [r7, #0x38]
	ldrh r1, [r0, #6]
	movs r2, #6
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge .L0800FE12
	movs r1, #0
.L0800FE12:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl GetUnitStructFromEventParameter
	cmp r0, #0
	bne .L0800FE22
	movs r0, #6
	b .L0800FF0E
.L0800FE22:
	ldrb r6, [r0, #0x10]
	ldrb r5, [r0, #0x11]
	b .L0800FE72
.L0800FE28:
	ldr r0, [r7, #0x38]
	ldrh r0, [r0, #6]
	mov r6, r9
	mov r5, sl
	cmp r0, #1
	beq .L0800FE68
	cmp r0, #1
	bgt .L0800FE3E
	cmp r0, #0
	beq .L0800FE5E
	b .L0800FE72
.L0800FE3E:
	cmp r0, #2
	beq .L0800FE52
	cmp r0, #3
	bne .L0800FE72
	lsls r0, r5, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r5, r0, #0x18
	b .L0800FE72
.L0800FE52:
	lsls r0, r5, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r5, r0, #0x18
	b .L0800FE72
.L0800FE5E:
	lsls r0, r6, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	b .L0800FE70
.L0800FE68:
	lsls r0, r6, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
.L0800FE70:
	lsrs r6, r0, #0x18
.L0800FE72:
	movs r0, #0
	str r0, [sp, #0xc]
	b .L0800FE7C
.L0800FE78:
	ldr r1, .L0800FEB8  @ gEventSlotQueue
	str r1, [sp, #0xc]
.L0800FE7C:
	ldr r1, [sp, #4]
	adds r0, r7, #0
	bl GetSomeEventEngineMoveRelatedBitfield
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, .L0800FEBC  @ gMapOther
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldrh r0, [r7, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L0800FEA6
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge .L0800FEC0
.L0800FEA6:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	mov r0, r8
	adds r3, r4, #0
	bl MoveUnit_
	b .L0800FF0C
	.align 2, 0
.L0800FEB8: .4byte gEventSlotQueue
.L0800FEBC: .4byte gMapOther
.L0800FEC0:
	mov r0, r9
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sl
	lsls r2, r0, #0x18
	asrs r2, r2, #0x18
	adds r0, r7, #0
	bl CanStartEventUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0800FEDC
	movs r0, #3
	b .L0800FF0E
.L0800FEDC:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bne .L0800FEFA
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	ldr r0, [sp, #8]
	lsls r3, r0, #0x18
	lsrs r3, r3, #0x18
	str r4, [sp]
	mov r0, r8
	bl MuCtr_StartMoveTowards
	b .L0800FF0C
.L0800FEFA:
	ldr r0, .L0800FF20  @ gEventSlots
	ldr r2, [r0, #0x34]
	lsls r2, r2, #0xf
	asrs r2, r2, #0x10
	mov r0, r8
	ldr r1, [sp, #0xc]
	adds r3, r4, #0
	bl MuCtr_StartDefinedMove
.L0800FF0C:
	movs r0, #0
.L0800FF0E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0800FF20: .4byte gEventSlots

	THUMB_FUNC_END Event2F_MoveUnit

	THUMB_FUNC_START Event30_WaitForUnitMovement
Event30_WaitForUnitMovement: @ 0x0800FF24
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0800FF36
	bl MU_AllForceSetMaxMoveSpeed_
.L0800FF36:
	bl MuCtr_Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0800FF60
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
	ldr r0, .L0800FF5C  @ gMapOther
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	movs r0, #2
	b .L0800FF62
	.align 2, 0
.L0800FF5C: .4byte gMapOther
.L0800FF60:
	movs r0, #3
.L0800FF62:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event30_WaitForUnitMovement

	THUMB_FUNC_START Event31_DisplayEffectRange
Event31_DisplayEffectRange: @ 0x0800FF68
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x3c]
	lsrs r4, r0, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq .L0800FF7C
	movs r0, #0
	b .L0800FFE8
.L0800FF7C:
	ldr r2, [r1, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq .L0800FF8E
	cmp r1, #1
	beq .L0800FFD4
	b .L0800FFE6
.L0800FF8E:
	movs r1, #2
	ldrsh r0, [r2, r1]
	bl GetUnitStructFromEventParameter
	adds r4, r0, #0
	cmp r4, #0
	bne .L0800FFA0
	movs r0, #6
	b .L0800FFE8
.L0800FFA0:
	ldr r0, .L0800FFC8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0800FFB2
	movs r0, #0x68
	bl m4aSongNumStart
.L0800FFB2:
	ldr r2, .L0800FFCC  @ gEventRangeDisplayUnit
	ldr r1, .L0800FFD0  @ gActiveUnit
	ldr r0, [r1]
	str r0, [r2]
	str r4, [r1]
	bl HideMoveRangeGraphics
	adds r0, r4, #0
	bl DisplayUnitEffectRange
	b .L0800FFE6
	.align 2, 0
.L0800FFC8: .4byte gPlaySt
.L0800FFCC: .4byte gEventRangeDisplayUnit
.L0800FFD0: .4byte gActiveUnit
.L0800FFD4:
	bl HideMoveRangeGraphics
	ldr r2, .L0800FFF0  @ gEventRangeDisplayUnit
	ldr r1, [r2]
	cmp r1, #0
	beq .L0800FFE6
	ldr r0, .L0800FFF4  @ gActiveUnit
	str r1, [r0]
	str r4, [r2]
.L0800FFE6:
	movs r0, #2
.L0800FFE8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0800FFF0: .4byte gEventRangeDisplayUnit
.L0800FFF4: .4byte gActiveUnit

	THUMB_FUNC_END Event31_DisplayEffectRange

	THUMB_FUNC_START Event32_SpawnSingleUnit
Event32_SpawnSingleUnit: @ 0x0800FFF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	mov ip, r2
	ands r2, r1
	mov ip, r2
	ldrh r1, [r0, #4]
	ldrb r6, [r0, #4]
	lsrs r7, r1, #8
	ldrh r4, [r0, #2]
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r0, #3
	negs r0, r0
	cmp r1, r0
	bne .L08010020
	ldr r0, .L08010100  @ gEventSlots
	ldrh r4, [r0, #8]
.L08010020:
	lsls r0, r6, #0x18
	cmp r0, #0
	blt .L0801002C
	lsls r0, r7, #0x18
	cmp r0, #0
	bge .L08010032
.L0801002C:
	ldr r0, .L08010104  @ gUnknown_030004E4
	ldrb r6, [r0]
	ldrb r7, [r0, #2]
.L08010032:
	mov r0, sp
	movs r5, #0
	strb r4, [r0]
	mov r3, sp
	ldr r2, .L08010108  @ gCharacterData
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, r0, r2
	ldrb r0, [r4, #5]
	strb r0, [r3, #1]
	mov r0, sp
	strb r5, [r0, #2]
	mov r1, sp
	ldrb r0, [r1, #3]
	movs r2, #2
	negs r2, r2
	ands r2, r0
	strb r2, [r1, #3]
	movs r0, #0
	mov r1, ip
	cmp r1, #0xf
	beq .L08010066
	mov r0, ip
.L08010066:
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #7
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	mov r3, sp
	ldrb r1, [r4, #0xb]
	lsls r1, r1, #3
	movs r2, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	mov r2, sp
	movs r0, #0x3f
	ands r6, r0
	ldrb r1, [r2, #4]
	movs r0, #0x40
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	strb r0, [r2, #4]
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r3, #4]
	ldr r0, .L0801010C  @ 0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	mov r2, sp
	ldrb r1, [r2, #5]
	movs r0, #0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #5]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #5]
	movs r1, #0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r2, #5]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #5]
	mov r0, sp
	strb r5, [r0, #6]
	strb r5, [r0, #7]
	str r5, [sp, #8]
	strb r5, [r0, #0xc]
	strb r5, [r0, #0xd]
	strb r5, [r0, #0xe]
	strb r5, [r0, #0xf]
	strb r5, [r0, #0x10]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x12]
	strb r5, [r0, #0x13]
	movs r3, #0
	mov r2, ip
	cmp r2, #0xf
	bne .L080100EC
	movs r3, #1
.L080100EC:
	mov r0, sp
	movs r1, #0
	movs r2, #0
	bl UNIT_Load_800F704
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08010100: .4byte gEventSlots
.L08010104: .4byte gUnknown_030004E4
.L08010108: .4byte gCharacterData
.L0801010C: .4byte 0xFFFFF03F

	THUMB_FUNC_END Event32_SpawnSingleUnit

	THUMB_FUNC_START Event33_CheckUnitVarious
Event33_CheckUnitVarious: @ 0x08010110
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrh r5, [r0, #2]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	adds r2, r0, #0
	cmp r4, #8
	bls .L0801012C
	b .L0801028A
.L0801012C:
	lsls r0, r4, #2
	ldr r1, .L08010138  @ .L0801013C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08010138: .4byte .L0801013C
.L0801013C: @ jump table
	.4byte .L08010160 @ case 0
	.4byte .L08010170 @ case 1
	.4byte .L08010188 @ case 2
	.4byte .L080101B8 @ case 3
	.4byte .L080101E4 @ case 4
	.4byte .L08010214 @ case 5
	.4byte .L0801024C @ case 6
	.4byte .L08010264 @ case 7
	.4byte .L08010278 @ case 8
.L08010160:
	cmp r2, #0
	beq .L0801018C
	ldr r1, .L0801016C  @ gEventSlots
	movs r0, #1
	b .L08010288
	.align 2, 0
.L0801016C: .4byte gEventSlots
.L08010170:
	cmp r2, #0
	bne .L08010176
	b .L0801027C
.L08010176:
	ldr r0, .L08010184  @ gEventSlots
	ldr r1, [r2]
	adds r1, #0x30
	ldrb r1, [r1]
	str r1, [r0, #0x30]
	b .L0801028A
	.align 2, 0
.L08010184: .4byte gEventSlots
.L08010188:
	cmp r2, #0
	bne .L08010198
.L0801018C:
	ldr r0, .L08010194  @ gEventSlots
	str r2, [r0, #0x30]
	b .L0801028A
	.align 2, 0
.L08010194: .4byte gEventSlots
.L08010198:
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L080101AC
	ldr r1, .L080101A8  @ gEventSlots
	movs r0, #0
	b .L08010288
	.align 2, 0
.L080101A8: .4byte gEventSlots
.L080101AC:
	ldr r1, .L080101B4  @ gEventSlots
	movs r0, #1
	b .L08010288
	.align 2, 0
.L080101B4: .4byte gEventSlots
.L080101B8:
	cmp r2, #0
	beq .L0801027C
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq .L080101D0
	ldr r1, .L080101CC  @ gEventSlots
	movs r0, #0
	b .L08010288
	.align 2, 0
.L080101CC: .4byte gEventSlots
.L080101D0:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt .L08010234
	ldr r1, .L080101E0  @ gEventSlots
	movs r0, #1
	b .L08010288
	.align 2, 0
.L080101E0: .4byte gEventSlots
.L080101E4:
	cmp r2, #0
	beq .L0801027C
	ldr r0, .L08010200  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	beq .L08010208
	ldr r1, .L08010204  @ gEventSlots
	movs r0, #0
	b .L08010288
	.align 2, 0
.L08010200: .4byte gActiveUnit
.L08010204: .4byte gEventSlots
.L08010208:
	ldr r1, .L08010210  @ gEventSlots
	movs r0, #1
	b .L08010288
	.align 2, 0
.L08010210: .4byte gEventSlots
.L08010214:
	cmp r2, #0
	beq .L0801027C
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0
	beq .L08010234
	cmp r1, #0x80
	beq .L08010240
	ldr r1, .L08010230  @ gEventSlots
	movs r0, #1
	b .L08010288
	.align 2, 0
.L08010230: .4byte gEventSlots
.L08010234:
	ldr r0, .L0801023C  @ gEventSlots
	str r1, [r0, #0x30]
	b .L0801028A
	.align 2, 0
.L0801023C: .4byte gEventSlots
.L08010240:
	ldr r1, .L08010248  @ gEventSlots
	movs r0, #2
	b .L08010288
	.align 2, 0
.L08010248: .4byte gEventSlots
.L0801024C:
	cmp r2, #0
	beq .L0801027C
	ldr r0, .L08010260  @ gUnknown_030004E8
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	strh r1, [r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	strh r1, [r0, #2]
	b .L0801028A
	.align 2, 0
.L08010260: .4byte gUnknown_030004E8
.L08010264:
	cmp r2, #0
	beq .L0801027C
	ldr r0, .L08010274  @ gEventSlots
	ldr r1, [r2, #4]
	ldrb r1, [r1, #4]
	str r1, [r0, #0x30]
	b .L0801028A
	.align 2, 0
.L08010274: .4byte gEventSlots
.L08010278:
	cmp r2, #0
	bne .L08010280
.L0801027C:
	movs r0, #6
	b .L0801028C
.L08010280:
	adds r0, r2, #0
	bl GetUnitLuck
	ldr r1, .L08010294  @ gEventSlots
.L08010288:
	str r0, [r1, #0x30]
.L0801028A:
	movs r0, #0
.L0801028C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08010294: .4byte gEventSlots

	THUMB_FUNC_END Event33_CheckUnitVarious

	THUMB_FUNC_START Event34_MessWithUnitState
Event34_MessWithUnitState: @ 0x08010298
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, .L080102CC  @ gUnknown_080D793C
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r1, [r6, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	adds r5, r0, #0
	cmp r4, #0xa
	blt .L080102D0
	cmp r4, #0xc
	ble .L080102D8
	cmp r4, #0xf
	bgt .L080102D0
	cmp r5, #0
	bne .L080102D8
	b .L080104A6
	.align 2, 0
.L080102CC: .4byte gUnknown_080D793C
.L080102D0:
	cmp r5, #0
	bne .L080102D8
	movs r0, #6
	b .L080104A8
.L080102D8:
	cmp r4, #0xf
	bls .L080102DE
	b .L0801049A
.L080102DE:
	lsls r0, r4, #2
	ldr r1, .L080102E8  @ .L080102EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080102E8: .4byte .L080102EC
.L080102EC: @ jump table
	.4byte .L0801032C @ case 0
	.4byte .L08010338 @ case 1
	.4byte .L08010344 @ case 2
	.4byte .L08010344 @ case 3
	.4byte .L08010344 @ case 4
	.4byte .L08010352 @ case 5
	.4byte .L08010370 @ case 6
	.4byte .L08010376 @ case 7
	.4byte .L0801037C @ case 8
	.4byte .L0801049A @ case 9
	.4byte .L080103CC @ case 10
	.4byte .L08010400 @ case 11
	.4byte .L08010426 @ case 12
	.4byte .L0801044C @ case 13
	.4byte .L0801047C @ case 14
	.4byte .L08010494 @ case 15
.L0801032C:
	ldr r0, [r5, #0xc]
	ldr r1, .L08010334  @ 0x04010001
	b .L080103A8
	.align 2, 0
.L08010334: .4byte 0x04010001
.L08010338:
	ldr r0, [r5, #0xc]
	ldr r1, .L08010340  @ 0xFBFEFFFE
	b .L0801039E
	.align 2, 0
.L08010340: .4byte 0xFBFEFFFE
.L08010344:
	subs r0, r4, #2
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	bl UnitChangeFaction
	b .L0801049A
.L08010352:
	ldr r4, .L0801036C  @ gEventSlots
	ldr r1, [r4, #4]
	adds r0, r5, #0
	bl SetUnitHp
	ldr r0, [r4, #4]
	cmp r0, #0
	beq .L08010364
	b .L0801049A
.L08010364:
	ldr r0, [r5, #0xc]
	movs r1, #4
	b .L080103A8
	.align 2, 0
.L0801036C: .4byte gEventSlots
.L08010370:
	ldr r0, [r5, #0xc]
	movs r1, #2
	b .L080103A8
.L08010376:
	ldr r0, [r5, #0xc]
	movs r1, #0x40
	b .L080103A8
.L0801037C:
	ldr r0, .L08010394  @ gEventSlots
	ldr r1, [r0, #4]
	cmp r1, #1
	beq .L08010398
	cmp r1, #1
	bcc .L080103A4
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L080103AE
	b .L0801049A
	.align 2, 0
.L08010394: .4byte gEventSlots
.L08010398:
	ldr r0, [r5, #0xc]
	movs r1, #9
	negs r1, r1
.L0801039E:
	ands r0, r1
	str r0, [r5, #0xc]
	b .L0801049A
.L080103A4:
	ldr r0, [r5, #0xc]
	movs r1, #8
.L080103A8:
	orrs r0, r1
	str r0, [r5, #0xc]
	b .L0801049A
.L080103AE:
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq .L080103C2
	movs r0, #8
	orrs r1, r0
	str r1, [r5, #0xc]
	b .L0801049A
.L080103C2:
	movs r0, #9
	negs r0, r0
	ands r1, r0
	str r1, [r5, #0xc]
	b .L0801049A
.L080103CC:
	bl MU_EndAll
	movs r4, #1
.L080103D2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L080103F4
	ldr r0, [r2]
	cmp r0, #0
	beq .L080103F4
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #0x2e
	ands r0, r1
	str r0, [r2, #0xc]
.L080103F4:
	adds r4, #1
	cmp r4, #0x3f
	ble .L080103D2
	bl ClearCutsceneUnits
	b .L0801049A
.L08010400:
	bl MU_EndAll
	movs r4, #0x41
.L08010406:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L0801041E
	ldr r0, [r1]
	cmp r0, #0
	beq .L0801041E
	adds r0, r1, #0
	bl ClearUnit
.L0801041E:
	adds r4, #1
	cmp r4, #0x7f
	ble .L08010406
	b .L0801049A
.L08010426:
	bl MU_EndAll
	movs r4, #0x81
.L0801042C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L08010444
	ldr r0, [r1]
	cmp r0, #0
	beq .L08010444
	adds r0, r1, #0
	bl ClearUnit
.L08010444:
	adds r4, #1
	cmp r4, #0xbf
	ble .L0801042C
	b .L0801049A
.L0801044C:
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L080104A6
	adds r0, r5, #0
	bl HideUnitSprite
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl MU_Create
	adds r4, r0, #0
	bl MU_SetDefaultFacing_Auto
	adds r0, r4, #0
	bl MU_StartDeathFade
	movs r0, #2
	b .L080104A8
.L0801047C:
	ldr r0, .L08010490  @ ProcScr_MUDeathFade
	bl FindProc
	negs r1, r0
	orrs r1, r0
	cmp r1, #0
	bge .L08010494
	movs r0, #3
	b .L080104A8
	.align 2, 0
.L08010490: .4byte ProcScr_MUDeathFade
.L08010494:
	adds r0, r5, #0
	bl ClearUnit
.L0801049A:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
.L080104A6:
	movs r0, #0
.L080104A8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event34_MessWithUnitState

	THUMB_FUNC_START Event35_UnitClassChanging
Event35_UnitClassChanging: @ 0x080104B0
	push {r4, r5, r6, r7, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrh r6, [r0, #4]
	ldrh r7, [r0, #6]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	adds r5, r0, #0
	cmp r5, #0
	beq .L0801052E
	cmp r4, #0
	beq .L080104D6
	cmp r4, #1
	beq .L080104F0
	b .L08010522
.L080104D6:
	cmp r6, #0
	bne .L08010518
	ldr r2, .L080104EC  @ gCharacterData
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r6, [r0, #5]
	b .L08010518
	.align 2, 0
.L080104EC: .4byte gCharacterData
.L080104F0:
	adds r4, r6, #0
	ldr r0, [r5, #4]
	ldrb r6, [r0, #4]
	ldr r2, .L08010538  @ gCharacterData
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r1, r4, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
	bl GetJInfo
	str r0, [r5, #4]
	adds r0, r4, #0
	bl GetUnitByPid
	adds r5, r0, #0
	cmp r5, #0
	beq .L0801052E
.L08010518:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	bl GetJInfo
	str r0, [r5, #4]
.L08010522:
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	bl RenderMap
.L0801052E:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08010538: .4byte gCharacterData

	THUMB_FUNC_END Event35_UnitClassChanging

	THUMB_FUNC_START Event36_CheckInArea
Event36_CheckInArea: @ 0x0801053C
	push {r4, r5, r6, r7, lr}
	ldr r2, [r0, #0x38]
	ldrh r0, [r2, #4]
	ldrb r4, [r2, #4]
	lsrs r0, r0, #8
	adds r6, r0, #0
	ldrh r1, [r2, #6]
	adds r0, r1, r4
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsrs r1, r1, #8
	adds r1, r1, r6
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r1, #2
	ldrsh r0, [r2, r1]
	bl GetUnitStructFromEventParameter
	adds r2, r0, #0
	ldr r3, .L080105A0  @ gEventSlots
	movs r0, #0
	str r0, [r3, #0x30]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	cmp r1, r4
	blt .L0801059A
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	blt .L08010598
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt .L08010598
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	blt .L08010598
	movs r0, #1
	str r0, [r3, #0x30]
.L08010598:
	movs r0, #0
.L0801059A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080105A0: .4byte gEventSlots

	THUMB_FUNC_END Event36_CheckInArea

	THUMB_FUNC_START Event37_GiveItem
Event37_GiveItem: @ 0x080105A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	adds r6, r4, #0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	adds r1, r0, #0
	cmp r1, #0
	bne .L080105C4
	movs r0, #6
	b .L0801060E
.L080105C4:
	cmp r4, #1
	beq .L080105E8
	cmp r4, #1
	bgt .L080105D2
	cmp r4, #0
	beq .L080105D8
	b .L0801060C
.L080105D2:
	cmp r6, #2
	beq .L080105F8
	b .L0801060C
.L080105D8:
	ldr r0, .L080105E4  @ gEventSlots
	ldrh r2, [r0, #0xc]
	adds r0, r5, #0
	bl NewItemGot
	b .L0801060C
	.align 2, 0
.L080105E4: .4byte gEventSlots
.L080105E8:
	ldr r0, .L080105F4  @ gEventSlots
	ldr r2, [r0, #0xc]
	adds r0, r5, #0
	bl NewGoldGotPopup
	b .L0801060C
	.align 2, 0
.L080105F4: .4byte gEventSlots
.L080105F8:
	bl GetGold
	ldr r1, .L08010614  @ gEventSlots
	ldr r1, [r1, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bge .L08010608
	movs r0, #0
.L08010608:
	bl SetGold
.L0801060C:
	movs r0, #2
.L0801060E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08010614: .4byte gEventSlots

	THUMB_FUNC_END Event37_GiveItem

	THUMB_FUNC_START Event38_ChangeActiveUnit
Event38_ChangeActiveUnit: @ 0x08010618
	push {r4, lr}
	ldr r0, [r0, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	adds r4, r0, #0
	cmp r4, #0
	beq .L0801063C
	bl ClearActiveUnit
	ldr r0, .L08010638  @ gActiveUnit
	str r4, [r0]
	movs r0, #0
	b .L0801063E
	.align 2, 0
.L08010638: .4byte gActiveUnit
.L0801063C:
	movs r0, #6
.L0801063E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event38_ChangeActiveUnit

	THUMB_FUNC_START Event39_CHAI
Event39_CHAI: @ 0x08010644
	push {r4, r5, r6, r7, lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	ldr r4, .L0801066C  @ gEventSlots
	ldr r1, [r4, #4]
	ldrb r7, [r4, #4]
	lsrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsrs r1, r1, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r3, #0
	beq .L08010670
	cmp r3, #1
	beq .L0801068C
	b .L080106DC
	.align 2, 0
.L0801066C: .4byte gEventSlots
.L08010670:
	ldrh r1, [r2, #2]
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge .L0801067C
	ldrh r1, [r4, #8]
.L0801067C:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl ChangeAiForCharacter
	b .L080106DC
.L0801068C:
	ldrh r0, [r2, #2]
	lsrs r1, r0, #8
	ldrb r3, [r2, #2]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt .L080106A0
	lsls r0, r1, #0x18
	cmp r0, #0
	bge .L080106AC
.L080106A0:
	ldrh r0, [r4, #0x2c]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
.L080106AC:
	lsls r1, r1, #0x18
	ldr r0, .L080106CC  @ gMapUnit
	ldr r0, [r0]
	asrs r1, r1, #0x16
	adds r1, r1, r0
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq .L080106D0
	bl GetUnit
	b .L080106D2
	.align 2, 0
.L080106CC: .4byte gMapUnit
.L080106D0:
	movs r0, #0
.L080106D2:
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl ChangeUnitAi
.L080106DC:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event39_CHAI

	THUMB_FUNC_START Event3A_
Event3A_: @ 0x080106E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L080106F8
	movs r0, #0
	b .L08010742
.L080106F8:
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r3, [r1, #2]
	movs r5, #2
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bge .L0801070E
	ldr r0, .L08010718  @ gEventSlots
	ldrh r3, [r0, #8]
.L0801070E:
	cmp r2, #0
	beq .L0801071C
	cmp r2, #1
	beq .L0801072A
	b .L08010740
	.align 2, 0
.L08010718: .4byte gEventSlots
.L0801071C:
	ldrh r1, [r1, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r2, r4, #0
	bl func_08011750
	b .L08010740
.L0801072A:
	ldrh r2, [r1, #6]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x10
	asrs r2, r2, #0x18
	adds r3, r4, #0
	bl func_08011C94
.L08010740:
	movs r0, #2
.L08010742:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event3A_

	THUMB_FUNC_START EventDisplayCursorProc_Loop
EventDisplayCursorProc_Loop: @ 0x08010748
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #0xc
	ands r1, r0
	cmp r1, #0
	beq .L0801075E
	cmp r1, #4
	beq .L0801077A
	b .L08010796
.L0801075E:
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r2, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	movs r2, #0
	bl DisplayCursor
	b .L08010796
.L0801077A:
	adds r0, r2, #0
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r2, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r4, r2, #0
	adds r4, #0x6a
	ldrh r2, [r4]
	bl DisplayFlashingCursor
	strh r0, [r4]
.L08010796:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EventDisplayCursorProc_Loop

	THUMB_FUNC_START Event3B_DisplayCursor
Event3B_DisplayCursor: @ 0x0801079C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L080107B8
	ldr r0, .L080107B4  @ gUnknown_08591F08
	bl EndEachProc
	b .L08010844
	.align 2, 0
.L080107B4: .4byte gUnknown_08591F08
.L080107B8:
	ldr r1, [r6, #0x38]
	ldrb r0, [r1]
	movs r7, #0xf
	ands r7, r0
	movs r0, #3
	ands r0, r7
	cmp r0, #1
	beq .L080107F8
	cmp r0, #1
	bgt .L080107D2
	cmp r0, #0
	beq .L080107D8
	b .L0801081C
.L080107D2:
	cmp r0, #2
	beq .L0801080E
	b .L0801081C
.L080107D8:
	ldrh r0, [r1, #2]
	lsrs r4, r0, #8
	ldrb r5, [r1, #2]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt .L080107EC
	lsls r0, r4, #0x18
	cmp r0, #0
	bge .L0801081C
.L080107EC:
	ldr r0, .L080107F4  @ gUnknown_030004E4
	ldrb r5, [r0]
	ldrb r4, [r0, #2]
	b .L0801081C
	.align 2, 0
.L080107F4: .4byte gUnknown_030004E4
.L080107F8:
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	cmp r0, #0
	bne .L08010808
	movs r0, #6
	b .L08010846
.L08010808:
	ldrb r5, [r0, #0x10]
	ldrb r4, [r0, #0x11]
	b .L0801081C
.L0801080E:
	ldr r0, .L08010818  @ gUnknown_08591F08
	bl EndEachProc
	movs r0, #2
	b .L08010846
	.align 2, 0
.L08010818: .4byte gUnknown_08591F08
.L0801081C:
	ldr r0, .L0801084C  @ gUnknown_08591F08
	adds r1, r6, #0
	bl SpawnProc
	adds r3, r0, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x64
	movs r2, #0
	strh r0, [r1]
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	adds r1, #2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x68
	strh r7, [r0]
	adds r0, #2
	strh r2, [r0]
.L08010844:
	movs r0, #0
.L08010846:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0801084C: .4byte gUnknown_08591F08

	THUMB_FUNC_END Event3B_DisplayCursor

	THUMB_FUNC_START Event3C_GetSetCursor
Event3C_GetSetCursor: @ 0x08010850
	push {lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq .L08010864
	cmp r1, #1
	beq .L0801087C
	b .L080108A2
.L08010864:
	ldr r2, .L08010874  @ gUnknown_030004E8
	ldr r1, .L08010878  @ gBmSt
	ldrh r0, [r1, #0x14]
	strh r0, [r2]
	ldrh r0, [r1, #0x16]
	strh r0, [r2, #2]
	b .L080108A2
	.align 2, 0
.L08010874: .4byte gUnknown_030004E8
.L08010878: .4byte gBmSt
.L0801087C:
	ldrh r0, [r2, #2]
	lsrs r1, r0, #8
	ldrb r3, [r2, #2]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt .L08010890
	lsls r0, r1, #0x18
	cmp r0, #0
	bge .L08010896
.L08010890:
	ldr r0, .L080108A8  @ gUnknown_030004E4
	ldrb r3, [r0]
	ldrb r1, [r0, #2]
.L08010896:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
.L080108A2:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
.L080108A8: .4byte gUnknown_030004E4

	THUMB_FUNC_END Event3C_GetSetCursor

	THUMB_FUNC_START Event3D_DisableMenuCommands
Event3D_DisableMenuCommands: @ 0x080108AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, .L08010914  @ gUnknown_080D793F
	mov r0, sp
	movs r2, #0xf
	bl memcpy
	add r4, sp, #0x10
	ldr r1, .L08010918  @ gUnknown_080D794E
	adds r0, r4, #0
	movs r2, #5
	bl memcpy
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r5, #0xf
	ands r5, r0
	ldrh r7, [r1, #2]
	bl ClearMenuCommandOverride
	movs r6, #1
	mov r8, r4
	cmp r5, #1
	beq .L08010920
	cmp r5, #1
	bgt .L08010950
	cmp r5, #0
	bne .L08010950
	movs r5, #0
.L080108EC:
	adds r0, r7, #0
	ands r0, r6
	cmp r0, #0
	beq .L08010902
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	movs r1, #1
	ldr r2, .L0801091C  @ MenuCommandNeverUsable
	bl SetMenuCommandOverride
.L08010902:
	lsls r0, r6, #0x11
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xe
	bls .L080108EC
	b .L08010950
	.align 2, 0
.L08010914: .4byte gUnknown_080D793F
.L08010918: .4byte gUnknown_080D794E
.L0801091C: .4byte MenuCommandNeverUsable
.L08010920:
	movs r5, #0
.L08010922:
	adds r0, r7, #0
	ands r0, r6
	cmp r0, #0
	beq .L08010942
	mov r0, r8
	adds r4, r0, r5
	ldrb r0, [r4]
	movs r1, #1
	ldr r2, .L08010960  @ MenuCommandAlwaysGrayed
	bl SetMenuCommandOverride
	ldrb r0, [r4]
	movs r1, #2
	ldr r2, .L08010964  @ Get8
	bl SetMenuCommandOverride
.L08010942:
	lsls r0, r6, #0x11
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls .L08010922
.L08010950:
	movs r0, #0
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08010960: .4byte MenuCommandAlwaysGrayed
.L08010964: .4byte Get8

	THUMB_FUNC_END Event3D_DisableMenuCommands

	THUMB_FUNC_START Event3E_PrepScreenCall
Event3E_PrepScreenCall: @ 0x08010968
	push {r4, lr}
	adds r4, r0, #0
	bl HideAllUnits
	movs r0, #0x84
	bl ClearFlag
	ldr r0, .L08010988  @ gUnknown_0859DBBC
	adds r1, r4, #0
	bl SpawnProcLocking
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08010988: .4byte gUnknown_0859DBBC

	THUMB_FUNC_END Event3E_PrepScreenCall

	THUMB_FUNC_START DecodeEventScriptedBattle
DecodeEventScriptedBattle: @ 0x0801098C
	push {r4, r5, r6, r7, lr}
	ldr r4, .L08010A18  @ gEventSlotQueue
	ldr r3, .L08010A1C  @ gUnknown_0203A974
	movs r5, #0
	ldr r0, .L08010A20  @ gEventSlots
	ldr r1, [r0, #0x34]
	adds r7, r0, #0
	cmp r5, r1
	bcs .L08010A04
	ldrb r0, [r4]
	cmp r0, #0xff
	beq .L08010A04
	movs r6, #7
.L080109A6:
	ldrh r2, [r4, #2]
	ldr r0, [r3]
	ldr r1, .L08010A24  @ 0xFFF80000
	ands r0, r1
	orrs r0, r2
	str r0, [r3]
	ldrb r0, [r3, #2]
	adds r2, r6, #0
	ands r2, r0
	strb r2, [r3, #2]
	cmp r5, #0
	bne .L080109CE
	ldr r0, [r3]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #1
	orrs r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	strb r0, [r3, #2]
.L080109CE:
	ldrb r0, [r4]
	cmp r0, #1
	bne .L080109EA
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
.L080109EA:
	ldrb r0, [r4, #1]
	strb r0, [r3, #3]
	adds r3, #4
	adds r4, #4
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r7, #0x34]
	cmp r5, r0
	bcs .L08010A04
	ldrb r0, [r4]
	cmp r0, #0xff
	bne .L080109A6
.L08010A04:
	ldrb r0, [r3, #2]
	movs r1, #7
	ands r1, r0
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r3, #2]
	ldr r0, .L08010A1C  @ gUnknown_0203A974
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08010A18: .4byte gEventSlotQueue
.L08010A1C: .4byte gUnknown_0203A974
.L08010A20: .4byte gEventSlots
.L08010A24: .4byte 0xFFF80000

	THUMB_FUNC_END DecodeEventScriptedBattle

	THUMB_FUNC_START func_08010A28
func_08010A28: @ 0x08010A28
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne .L08010A50
	bl func_080121D4
	ldr r0, [r5, #0x58]
	movs r1, #6
	bl Proc_SetMark
	adds r0, r5, #0
	bl Proc_Break
.L08010A50:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08010A28

	THUMB_FUNC_START Event3F_
Event3F_: @ 0x08010A58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrb r1, [r0]
	movs r7, #0xf
	ands r7, r1
	ldrh r4, [r0, #2]
	ldrh r5, [r0, #4]
	ldrh r1, [r0, #6]
	ldrb r0, [r0, #6]
	str r0, [sp, #0xc]
	lsrs r1, r1, #8
	str r1, [sp, #0x10]
	ldr r0, .L08010A88  @ gEventSlots
	ldr r0, [r0, #0x34]
	cmp r0, #0
	bne .L08010A8C
	movs r0, #0
	b .L08010A90
	.align 2, 0
.L08010A88: .4byte gEventSlots
.L08010A8C:
	bl DecodeEventScriptedBattle
.L08010A90:
	mov r8, r0
	cmp r7, #0
	blt .L08010B36
	cmp r7, #1
	ble .L08010AA0
	cmp r7, #2
	beq .L08010B2C
	b .L08010B36
.L08010AA0:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge .L08010AA8
	ldr r4, .L08010AE0  @ 0x0000FFFE
.L08010AA8:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge .L08010AB0
	ldr r5, .L08010AE0  @ 0x0000FFFE
.L08010AB0:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl GetUnitStructFromEventParameter
	mov sl, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl GetUnitStructFromEventParameter
	mov r9, r0
	ldrh r2, [r6, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L08010ADA
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq .L08010AE4
.L08010ADA:
	movs r5, #0
	b .L08010B06
	.align 2, 0
.L08010AE0: .4byte 0x0000FFFE
.L08010AE4:
	movs r5, #1
	ldr r0, .L08010B28  @ gUnknown_08591F18
	adds r1, r6, #0
	bl SpawnProcLocking
	adds r4, r0, #0
	str r6, [r4, #0x58]
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl Proc_SetMark
.L08010B06:
	adds r3, r5, #0
	ldr r0, [sp, #0xc]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	negs r0, r7
	orrs r0, r7
	lsrs r0, r0, #0x1f
	str r0, [sp, #8]
	mov r0, sl
	mov r1, r9
	ldr r2, [sp, #0x10]
	bl func_08011F5C
	movs r0, #2
	b .L08010B38
	.align 2, 0
.L08010B28: .4byte gUnknown_08591F18
.L08010B2C:
	mov r0, r8
	bl SetScriptedBattle
	movs r0, #0
	b .L08010B38
.L08010B36:
	movs r0, #6
.L08010B38:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event3F_

	THUMB_FUNC_START func_08010B48
func_08010B48: @ 0x08010B48
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne .L08010B70
	bl func_08012324
	ldr r0, [r5, #0x58]
	movs r1, #6
	bl Proc_SetMark
	adds r0, r5, #0
	bl Proc_Break
.L08010B70:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08010B48

	THUMB_FUNC_START Event40_PROM
Event40_PROM: @ 0x08010B78
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrh r5, [r0, #2]
	ldrh r1, [r0, #4]
	mov r8, r1
	ldrh r0, [r0, #6]
	mov r9, r0
	ldr r0, .L08010BE8  @ gUnknown_08591F28
	adds r1, r6, #0
	bl SpawnProcLocking
	adds r4, r0, #0
	str r6, [r4, #0x58]
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl Proc_SetMark
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	bl GetUnitStructFromEventParameter
	adds r4, r0, #0
	movs r1, #0
	bl SetUnitStatus
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r1, r9
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r9, r1
	adds r0, r4, #0
	mov r1, r8
	mov r2, r9
	bl func_08012270
	movs r0, #2
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08010BE8: .4byte gUnknown_08591F28

	THUMB_FUNC_END Event40_PROM

	THUMB_FUNC_START Event41_WarpAnim
Event41_WarpAnim: @ 0x08010BEC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r6, [r5, #0x3c]
	lsrs r4, r6, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq .L08010C02
	movs r0, #0
	b .L08010C68
.L08010C02:
	ldr r2, [r5, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	cmp r3, #0
	blt .L08010C66
	cmp r3, #1
	ble .L08010C18
	cmp r3, #0xf
	beq .L08010C56
	b .L08010C66
.L08010C18:
	ldrb r2, [r2, #2]
	adds r1, r2, #0
	lsls r0, r2, #0x18
	cmp r0, #0
	bge .L08010C28
	ldr r0, .L08010C40  @ gUnknown_030004E4
	ldrb r1, [r0]
	ldrb r2, [r0, #2]
.L08010C28:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	bne .L08010C44
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #1
	str r0, [sp]
	b .L08010C4E
	.align 2, 0
.L08010C40: .4byte gUnknown_030004E4
.L08010C44:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	str r4, [sp]
.L08010C4E:
	adds r0, r5, #0
	bl func_08012950
	b .L08010C66
.L08010C56:
	bl func_08012974
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08010C66
	movs r0, #3
	b .L08010C68
.L08010C66:
	movs r0, #2
.L08010C68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event41_WarpAnim

	THUMB_FUNC_START Event42_
Event42_: @ 0x08010C70
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrb r1, [r0]
	movs r3, #0xf
	ands r3, r1
	ldrh r1, [r0, #2]
	ldrb r5, [r0, #2]
	lsrs r4, r1, #8
	cmp r3, #0
	beq .L08010C8C
	cmp r3, #0xf
	beq .L08010CE2
	b .L08010CE6
.L08010C8C:
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L08010CE6
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi .L08010CD4
	lsls r0, r0, #2
	ldr r1, .L08010CAC  @ .L08010CB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08010CAC: .4byte .L08010CB0
.L08010CB0: @ jump table
	.4byte .L08010CC8 @ case 0
	.4byte .L08010CCC @ case 1
	.4byte .L08010CD0 @ case 2
	.4byte .L08010CC8 @ case 3
	.4byte .L08010CC8 @ case 4
	.4byte .L08010CD0 @ case 5
.L08010CC8:
	movs r3, #0
	b .L08010CD4
.L08010CCC:
	movs r3, #1
	b .L08010CD4
.L08010CD0:
	movs r0, #6
	b .L08010CE8
.L08010CD4:
	lsls r2, r4, #0x18
	asrs r2, r2, #0x18
	adds r0, r3, #0
	adds r1, r5, #0
	bl func_08012C34
	b .L08010CE6
.L08010CE2:
	bl func_08012C88
.L08010CE6:
	movs r0, #0
.L08010CE8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event42_

	THUMB_FUNC_START Event43_
Event43_: @ 0x08010CF0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L08010D04
	movs r0, #0
	b .L08010D20
.L08010D04:
	ldr r0, [r4, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	adds r1, r0, #0
	cmp r1, #0
	beq .L08010D1E
	adds r0, r4, #0
	bl func_08080E9C
	movs r0, #2
	b .L08010D20
.L08010D1E:
	movs r0, #6
.L08010D20:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event43_

	THUMB_FUNC_START Event44_
Event44_: @ 0x08010D28
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L08010D3C
	movs r0, #0
	b .L08010D56
.L08010D3C:
	ldr r0, [r4, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	cmp r0, #0
	beq .L08010D54
	adds r1, r4, #0
	bl func_08012CFC
	movs r0, #2
	b .L08010D56
.L08010D54:
	movs r0, #6
.L08010D56:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event44_

	THUMB_FUNC_START Event45_
Event45_: @ 0x08010D5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	adds r2, r0, #0
	cmp r2, #0
	bne .L08010D7A
	movs r0, #6
	b .L08010DB8
.L08010D7A:
	cmp r4, #0
	beq .L08010D84
	cmp r4, #0xf
	beq .L08010D9A
	b .L08010DB6
.L08010D84:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L08010DB6
	adds r0, r5, #0
	adds r1, r2, #0
	bl func_08081020
	b .L08010DB6
.L08010D9A:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L08010DB2
	adds r0, r5, #0
	movs r1, #0x78
	bl func_080811D0
	movs r0, #2
	b .L08010DB8
.L08010DB2:
	bl func_08081068
.L08010DB6:
	movs r0, #0
.L08010DB8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event45_

	.align 2, 0 @ Don't pad with nop.
