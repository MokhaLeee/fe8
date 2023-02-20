	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Functions managing checking for event activations and such
	@ This is what reads codes such as TURN, CHAR or LOCA ("""main codes""")
	@ Also includes getters for knowing who is force deployed when

	THUMB_FUNC_START CallEventDefinition
CallEventDefinition: @ 0x08082E80
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, [r4, #4]
	cmp r0, #0
	beq .L08082EBE
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #4]
	cmp r0, #1
	beq .L08082EBE
	ldrh r1, [r4, #8]
	bl RegisterEventActivation
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl CallEvent
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08082EBE
	bl func_08019108
	movs r0, #0x84
	bl SetFlag
.L08082EBE:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END CallEventDefinition

	THUMB_FUNC_START CheckEventDefinition
CheckEventDefinition: @ 0x08082EC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldr r7, .L08082F0C  @ gUnknown_089E84F4
	adds r0, r7, #4
	mov r8, r0
.L08082ED8:
	ldr r0, [r4]
	ldrh r5, [r0]
	adds r6, r5, #0
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08082EFA
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	cmp r0, #1
	beq .L08082F10
.L08082EFA:
	lsls r0, r6, #3
	add r0, r8
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	b .L08082ED8
	.align 2, 0
.L08082F0C: .4byte gUnknown_089E84F4
.L08082F10:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne .L08082F1A
	movs r0, #0
	b .L08082F1C
.L08082F1A:
	adds r0, r4, #0
.L08082F1C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckEventDefinition

	THUMB_FUNC_START CheckNextEventDefinition
CheckNextEventDefinition: @ 0x08082F28
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bne .L08082F34
	movs r0, #0
	b .L08082F4E
.L08082F34:
	ldr r2, [r3]
	ldrh r1, [r2]
	ldr r0, .L08082F54  @ gUnknown_089E84F4
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r3, #0
	bl CheckEventDefinition
.L08082F4E:
	pop {r1}
	bx r1
	.align 2, 0
.L08082F54: .4byte gUnknown_089E84F4

	THUMB_FUNC_END CheckNextEventDefinition

	THUMB_FUNC_START func_08082F58
func_08082F58: @ 0x08082F58
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r3, #0x1a]
	cmp r0, r1
	bne .L08082F7E
	ldrb r0, [r3, #0x1b]
	cmp r0, r2
	bne .L08082F7E
	ldr r0, [r3]
	ldr r1, [r0, #4]
	str r1, [r3, #4]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	movs r0, #1
	b .L08082F80
.L08082F7E:
	movs r0, #0
.L08082F80:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08082F58

	THUMB_FUNC_START func_08082F84
func_08082F84: @ 0x08082F84
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, .L08082FAC  @ gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r1, r0
	blt .L08082FB0
	cmp r1, r4
	bgt .L08082FB0
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r1, r5
	blt .L08082FB0
	cmp r1, r3
	bgt .L08082FB0
	movs r0, #1
	b .L08082FB2
	.align 2, 0
.L08082FAC: .4byte gActiveUnit
.L08082FB0:
	movs r0, #0
.L08082FB2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08082F84

	THUMB_FUNC_START func_08082FB8
func_08082FB8: @ 0x08082FB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #1
.L08082FC8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08083004
	ldr r0, [r2]
	cmp r0, #0
	beq .L08083004
	ldr r0, [r2, #0xc]
	ldr r1, .L08083000  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L08083004
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt .L08083004
	cmp r0, r6
	bgt .L08083004
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt .L08083004
	cmp r0, r5
	bgt .L08083004
	movs r0, #1
	b .L0808300C
	.align 2, 0
.L08083000: .4byte 0x00010004
.L08083004:
	adds r4, #1
	cmp r4, #0x3f
	ble .L08082FC8
	movs r0, #0
.L0808300C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08082FB8

	THUMB_FUNC_START func_08083018
func_08083018: @ 0x08083018
	push {lr}
	ldr r0, .L08083038  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne .L0808303C
	movs r0, #0
	movs r1, #0xf
	movs r2, #0x19
	movs r3, #0x17
	bl func_08082FB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0808303C
	movs r0, #1
	b .L0808303E
	.align 2, 0
.L08083038: .4byte gPlaySt
.L0808303C:
	movs r0, #0
.L0808303E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083018

	THUMB_FUNC_START func_08083044
func_08083044: @ 0x08083044
	push {lr}
	ldr r0, .L08083088  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne .L08083084
	movs r0, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x1b
	bl func_08082FB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0808308C
	movs r0, #0
	movs r1, #0x15
	movs r2, #2
	movs r3, #0x17
	bl func_08082FB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0808308C
	movs r0, #3
	movs r1, #0x14
	movs r2, #5
	movs r3, #0x16
	bl func_08082FB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0808308C
.L08083084:
	movs r0, #0
	b .L0808308E
	.align 2, 0
.L08083088: .4byte gPlaySt
.L0808308C:
	movs r0, #1
.L0808308E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083044

	THUMB_FUNC_START func_08083094
func_08083094: @ 0x08083094
	push {lr}
	movs r0, #0xc
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x18
	bl func_08082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083094

	THUMB_FUNC_START func_080830AC
func_080830AC: @ 0x080830AC
	push {lr}
	ldr r0, .L080830C8  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne .L080830CC
	movs r0, #0x11
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x23
	bl func_08082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L080830CE
	.align 2, 0
.L080830C8: .4byte gPlaySt
.L080830CC:
	movs r0, #0
.L080830CE:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080830AC

	THUMB_FUNC_START func_080830D4
func_080830D4: @ 0x080830D4
	push {lr}
	ldr r0, .L080830F0  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne .L080830F4
	movs r0, #0
	movs r1, #0xf
	movs r2, #8
	movs r3, #0x12
	bl func_08082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L080830F6
	.align 2, 0
.L080830F0: .4byte gPlaySt
.L080830F4:
	movs r0, #0
.L080830F6:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080830D4

	THUMB_FUNC_START func_080830FC
func_080830FC: @ 0x080830FC
	push {lr}
	ldr r0, .L08083118  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne .L0808311C
	movs r0, #0
	movs r1, #0x18
	movs r2, #0xc
	movs r3, #0x1b
	bl func_08082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L0808311E
	.align 2, 0
.L08083118: .4byte gPlaySt
.L0808311C:
	movs r0, #0
.L0808311E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080830FC

	THUMB_FUNC_START func_08083124
func_08083124: @ 0x08083124
	push {lr}
	ldr r0, .L08083140  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne .L08083144
	movs r0, #0x15
	movs r1, #0
	movs r2, #0x1e
	movs r3, #6
	bl func_08082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L08083146
	.align 2, 0
.L08083140: .4byte gPlaySt
.L08083144:
	movs r0, #0
.L08083146:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083124

	THUMB_FUNC_START func_0808314C
func_0808314C: @ 0x0808314C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #0x81
.L0808315C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08083198
	ldr r0, [r2]
	cmp r0, #0
	beq .L08083198
	ldr r0, [r2, #0xc]
	ldr r1, .L08083194  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L08083198
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt .L08083198
	cmp r0, r6
	bgt .L08083198
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt .L08083198
	cmp r0, r5
	bgt .L08083198
	movs r0, #1
	b .L080831A0
	.align 2, 0
.L08083194: .4byte 0x00010004
.L08083198:
	adds r4, #1
	cmp r4, #0xbf
	ble .L0808315C
	movs r0, #0
.L080831A0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0808314C

	THUMB_FUNC_START IsThereClosedChestAt
IsThereClosedChestAt: @ 0x080831AC
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetLocationEventCommandAt
	cmp r0, #0x14
	beq .L080831C2
	movs r0, #0
	b .L080831C4
.L080831C2:
	movs r0, #1
.L080831C4:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsThereClosedChestAt

	THUMB_FUNC_START func_080831C8
func_080831C8: @ 0x080831C8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsThereClosedChestAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080831E8
	adds r0, r5, #0
	adds r1, r4, #0
	bl RunLocationEvents
.L080831E8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080831C8

	THUMB_FUNC_START IsThereClosedDoorAt
IsThereClosedDoorAt: @ 0x080831F0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetLocationEventCommandAt
	cmp r0, #0x12
	beq .L08083206
	movs r0, #0
	b .L08083208
.L08083206:
	movs r0, #1
.L08083208:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsThereClosedDoorAt

	THUMB_FUNC_START func_0808320C
func_0808320C: @ 0x0808320C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808322C
	adds r0, r5, #0
	adds r1, r4, #0
	bl RunLocationEvents
.L0808322C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0808320C

	THUMB_FUNC_START func_08083234
func_08083234: @ 0x08083234
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetLocationEventCommandAt
	cmp r0, #0x15
	beq .L0808324A
	movs r0, #0
	b .L0808324C
.L0808324A:
	movs r0, #1
.L0808324C:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083234

	THUMB_FUNC_START ShouldCallEndEvent
ShouldCallEndEvent: @ 0x08083250
	push {lr}
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08083264
	bl CheckWin
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L08083266
.L08083264:
	movs r0, #0
.L08083266:
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldCallEndEvent

	THUMB_FUNC_START MaybeCallEndEvent_
MaybeCallEndEvent_: @ 0x0808326C
	push {lr}
	bl GetBattleMapKind
	cmp r0, #2
	beq .L0808327A
	bl MaybeCallEndEvent
.L0808327A:
	pop {r0}
	bx r0

	THUMB_FUNC_END MaybeCallEndEvent_

	THUMB_FUNC_START CallEndEvent
CallEndEvent: @ 0x08083280
	push {r4, lr}
	ldr r0, .L080832A4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	adds r4, r0, #0
	bl GetBattleMapKind
	cmp r0, #2
	beq .L080832A8
	ldr r0, [r4, #0x4c]
	movs r1, #1
	bl CallEvent
	b .L080832B0
	.align 2, 0
.L080832A4: .4byte gPlaySt
.L080832A8:
	ldr r0, .L080832C0  @ gUnknown_089FFD64
	movs r1, #1
	bl CallEvent
.L080832B0:
	bl func_08019108
	movs r0, #0x84
	bl SetFlag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080832C0: .4byte gUnknown_089FFD64

	THUMB_FUNC_END CallEndEvent

	THUMB_FUNC_START func_080832C4
func_080832C4: @ 0x080832C4
	movs r0, #0
	bx lr

	THUMB_FUNC_END func_080832C4

	THUMB_FUNC_START func_080832C8
func_080832C8: @ 0x080832C8
	movs r0, #0
	bx lr

	THUMB_FUNC_END func_080832C8

	THUMB_FUNC_START func_080832CC
func_080832CC: @ 0x080832CC
	movs r0, #0
	bx lr

	THUMB_FUNC_END func_080832CC

	THUMB_FUNC_START func_080832D0
func_080832D0: @ 0x080832D0
	movs r0, #0
	bx lr

	THUMB_FUNC_END func_080832D0

	THUMB_FUNC_START func_080832D4
func_080832D4: @ 0x080832D4
	movs r0, #0
	bx lr

	THUMB_FUNC_END func_080832D4

	THUMB_FUNC_START CheckWin
CheckWin: @ 0x080832D8
	push {lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckWin

	THUMB_FUNC_START MaybeCallEndEvent
MaybeCallEndEvent: @ 0x080832E8
	push {lr}
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08083304
	bl ShouldCallEndEvent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08083304
	bl CallEndEvent
.L08083304:
	pop {r0}
	bx r0

	THUMB_FUNC_END MaybeCallEndEvent

	THUMB_FUNC_START GetCurrentChapterBallistaePtr
GetCurrentChapterBallistaePtr: @ 0x08083308
	push {lr}
	ldr r0, .L0808331C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x20]
	pop {r1}
	bx r1
	.align 2, 0
.L0808331C: .4byte gPlaySt

	THUMB_FUNC_END GetCurrentChapterBallistaePtr

	THUMB_FUNC_START GetCurrentChapterBallistae2Ptr
GetCurrentChapterBallistae2Ptr: @ 0x08083320
	push {r4, lr}
	ldr r4, .L0808333C  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	adds r2, r0, #0
	ldrb r1, [r4, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08083340
	movs r0, #0
	b .L08083342
	.align 2, 0
.L0808333C: .4byte gPlaySt
.L08083340:
	ldr r0, [r2, #0x24]
.L08083342:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetCurrentChapterBallistae2Ptr

	THUMB_FUNC_START GetChapterAllyUnitDefinitions
GetChapterAllyUnitDefinitions: @ 0x08083348
	push {r4, r5, lr}
	ldr r5, .L08083370  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventInfo
	adds r4, r0, #0
	bl GetBattleMapKind
	adds r1, r0, #0
	cmp r1, #2
	beq .L08083378
	ldrb r1, [r5, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08083374
	ldr r0, [r4, #0x2c]
	b .L080833A8
	.align 2, 0
.L08083370: .4byte gPlaySt
.L08083374:
	ldr r0, [r4, #0x28]
	b .L080833A8
.L08083378:
	ldr r1, .L08083394  @ gGmData
	adds r2, r1, #0
	adds r2, #0xcc
	adds r1, #0xc9
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r1, [r1]
	cmp r1, #1
	beq .L080833A2
	cmp r1, #1
	bgt .L08083398
	cmp r1, #0
	beq .L0808339E
	b .L080833A8
	.align 2, 0
.L08083394: .4byte gGmData
.L08083398:
	cmp r1, #2
	beq .L080833A6
	b .L080833A8
.L0808339E:
	ldr r0, [r4, #0x30]
	b .L080833A8
.L080833A2:
	ldr r0, [r4, #0x34]
	b .L080833A8
.L080833A6:
	ldr r0, [r4, #0x38]
.L080833A8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetChapterAllyUnitDefinitions

	THUMB_FUNC_START GetChapterEnemyUnitDefinitions
GetChapterEnemyUnitDefinitions: @ 0x080833B0
	push {lr}
	ldr r0, .L080833E0  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	adds r2, r0, #0
	movs r3, #0
	ldr r0, .L080833E4  @ gGmData
	adds r1, r0, #0
	adds r1, #0xcc
	adds r0, #0xc9
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq .L080833F2
	cmp r0, #1
	bgt .L080833E8
	cmp r0, #0
	beq .L080833EE
	b .L080833F8
	.align 2, 0
.L080833E0: .4byte gPlaySt
.L080833E4: .4byte gGmData
.L080833E8:
	cmp r0, #2
	beq .L080833F6
	b .L080833F8
.L080833EE:
	ldr r3, [r2, #0x3c]
	b .L080833F8
.L080833F2:
	ldr r3, [r2, #0x40]
	b .L080833F8
.L080833F6:
	ldr r3, [r2, #0x44]
.L080833F8:
	adds r0, r3, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END GetChapterEnemyUnitDefinitions

	THUMB_FUNC_START GetChapterSkirmishLeaderClasses
GetChapterSkirmishLeaderClasses: @ 0x08083400
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r1, [r0, #0x3c]
	ldrb r1, [r1, #1]
	strb r1, [r4]
	ldr r1, [r0, #0x40]
	ldrb r1, [r1, #1]
	strb r1, [r4, #1]
	ldr r0, [r0, #0x44]
	ldrb r0, [r0, #1]
	strb r0, [r4, #2]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END GetChapterSkirmishLeaderClasses

	THUMB_FUNC_START func_08083424
func_08083424: @ 0x08083424
	push {lr}
	ldr r0, .L0808345C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	beq .L08083460
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq .L08083460
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq .L08083460
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	beq .L08083460
	ldr r0, [r1, #0x40]
	cmp r0, #0
	beq .L08083460
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq .L08083460
	movs r0, #1
	b .L08083462
	.align 2, 0
.L0808345C: .4byte gPlaySt
.L08083460:
	movs r0, #0
.L08083462:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083424

	THUMB_FUNC_START func_08083468
func_08083468: @ 0x08083468
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b .L080834A2
.L08083472:
	ldr r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080834A0
	ldrb r0, [r4]
	cmp r5, r0
	bne .L080834A0
	ldrb r0, [r4, #1]
	cmp r0, #0x4f
	beq .L08083498
	ldr r0, .L0808349C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne .L080834A0
.L08083498:
	adds r0, r4, #0
	b .L080834AA
	.align 2, 0
.L0808349C: .4byte gPlaySt
.L080834A0:
	adds r4, #0xc
.L080834A2:
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08083472
	movs r0, #0
.L080834AA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083468

	THUMB_FUNC_START ShouldCallBattleQuote
ShouldCallBattleQuote: @ 0x080834B0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r7, r4, #0
	bl GetBattleMapKind
	cmp r0, #2
	beq .L080834F2
	ldr r0, .L080834F8  @ gAction
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne .L080834F2
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetBattleQuoteEntry
	cmp r0, #0
	bne .L080834FC
	adds r0, r6, #0
	movs r1, #0
	bl GetBattleQuoteEntry
	cmp r0, #0
	bne .L080834FC
	movs r0, #0
	adds r1, r7, #0
	bl GetBattleQuoteEntry
	cmp r0, #0
	bne .L080834FC
.L080834F2:
	movs r0, #0
	b .L080834FE
	.align 2, 0
.L080834F8: .4byte gAction
.L080834FC:
	movs r0, #1
.L080834FE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldCallBattleQuote

	THUMB_FUNC_START CallBattleQuoteEventsIfAny
CallBattleQuoteEventsIfAny: @ 0x08083504
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08083568
	ldr r0, .L08083554  @ gAction
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne .L08083568
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetBattleQuoteEntry
	adds r4, r0, #0
	cmp r4, #0
	bne .L08083548
	adds r0, r5, #0
	movs r1, #0
	bl GetBattleQuoteEntry
	adds r4, r0, #0
	cmp r4, #0
	bne .L08083548
	movs r0, #0
	adds r1, r6, #0
	bl GetBattleQuoteEntry
	adds r4, r0, #0
	cmp r4, #0
	beq .L08083568
.L08083548:
	ldrh r0, [r4, #8]
	cmp r0, #0
	beq .L08083558
	bl CallBattleQuoteEventInBattle
	b .L08083562
	.align 2, 0
.L08083554: .4byte gAction
.L08083558:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq .L08083562
	bl EventEngine_CreateBattle
.L08083562:
	ldrh r0, [r4, #6]
	bl SetFlag
.L08083568:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END CallBattleQuoteEventsIfAny

	THUMB_FUNC_START func_08083570
func_08083570: @ 0x08083570
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl GetBattleMapKind
	cmp r0, #0
	beq .L08083598
	ldr r0, .L080835A4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8e
	ldrb r0, [r0]
	cmp r5, r0
	bne .L08083598
	cmp r4, #0x65
	beq .L0808359E
.L08083598:
	adds r0, r4, #0
	bl SetFlag
.L0808359E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080835A4: .4byte gPlaySt

	THUMB_FUNC_END func_08083570

	THUMB_FUNC_START ShouldDisplayDeathQuoteForChar
ShouldDisplayDeathQuoteForChar: @ 0x080835A8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetCharDeathQuoteEntry
	adds r1, r0, #0
	cmp r1, #0
	beq .L080835D4
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne .L080835D0
	ldr r0, [r1, #8]
	cmp r0, #0
	bne .L080835D0
	ldrh r1, [r1, #4]
	adds r0, r4, #0
	bl func_08083570
	b .L080835D4
.L080835D0:
	movs r0, #1
	b .L080835D6
.L080835D4:
	movs r0, #0
.L080835D6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldDisplayDeathQuoteForChar

	THUMB_FUNC_START DisplayDeathQuoteForChar
DisplayDeathQuoteForChar: @ 0x080835DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl GetCharDeathQuoteEntry
	adds r4, r0, #0
	cmp r4, #0
	beq .L0808364E
	ldrb r0, [r4, #2]
	cmp r0, #1
	bne .L08083614
	ldrh r0, [r4, #4]
	cmp r0, #0x65
	bne .L08083614
	movs r0, #0x3e
	movs r1, #0
	bl StartBgm
	ldr r0, .L08083610  @ gPlaySt
	adds r0, #0x41
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b .L08083630
	.align 2, 0
.L08083610: .4byte gPlaySt
.L08083614:
	adds r0, r5, #0
	bl GetUnitByPid
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne .L08083630
	movs r0, #0x3f
	movs r1, #0
	bl StartBgm
.L08083630:
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq .L0808363C
	bl CallBattleQuoteEventInBattle
	b .L08083646
.L0808363C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq .L08083646
	bl EventEngine_CreateBattle
.L08083646:
	ldrh r1, [r4, #4]
	adds r0, r5, #0
	bl func_08083570
.L0808364E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END DisplayDeathQuoteForChar

	THUMB_FUNC_START func_08083654
func_08083654: @ 0x08083654
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #1
.L0808365E:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq .L0808370C
	ldr r0, [r4]
	cmp r0, #0
	beq .L0808370C
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne .L0808370C
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne .L0808370C
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #7
	bl BWL_SetDeathStats
	adds r0, r4, #0
	bl KillUnit
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r2, .L08083704  @ gBattleUnitA
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne .L080836B2
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
.L080836B2:
	ldr r2, .L08083708  @ gBattleUnitB
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne .L080836CA
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
.L080836CA:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L080836E2
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDropRescue
.L080836E2:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08083712
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDropPositionOnDeath
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDropRescue
	b .L08083712
	.align 2, 0
.L08083704: .4byte gBattleUnitA
.L08083708: .4byte gBattleUnitB
.L0808370C:
	adds r5, #1
	cmp r5, #0x3f
	ble .L0808365E
.L08083712:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08083654

	THUMB_FUNC_START StartSupportTalk
StartSupportTalk: @ 0x0808371C
	push {r4, r5, r6, r7, lr}
	adds r6, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetSupportTalkInfoForCharacters
	adds r7, r0, #0
	cmp r7, #0
	beq .L0808375E
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetSupportTalkSong
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r2, r6, #1
	lsls r2, r2, #1
	adds r1, r7, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CallMapSupportEvent
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SGM_SetSupportLevelKnown
.L0808375E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartSupportTalk

	THUMB_FUNC_START StartSupportViewerTalk
StartSupportViewerTalk: @ 0x08083764
	push {r4, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl GetSupportTalkInfoForCharacters
	adds r1, r0, #0
	cmp r1, #0
	beq .L08083788
	subs r0, r4, #1
	lsls r0, r0, #1
	adds r1, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	bl CallSupportViewerEvent
.L08083788:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END StartSupportViewerTalk

	THUMB_FUNC_START func_08083790
func_08083790: @ 0x08083790
	push {lr}
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl GetSupportTalkSong
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083790

	THUMB_FUNC_START func_080837B0
func_080837B0: @ 0x080837B0
	push {lr}
	movs r0, #0x65
	bl SetFlag
	movs r0, #0x3e
	movs r1, #0
	bl StartBgm
	ldr r0, .L080837D4  @ gPlaySt
	adds r0, #0x41
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	bl CallGameOverEvent
	pop {r0}
	bx r0
	.align 2, 0
.L080837D4: .4byte gPlaySt

	THUMB_FUNC_END func_080837B0

	THUMB_FUNC_START func_080837D8
func_080837D8: @ 0x080837D8
	push {lr}
	ldr r0, .L080837EC  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L080837F0
	movs r0, #0
	b .L080837F2
	.align 2, 0
.L080837EC: .4byte gPlaySt
.L080837F0:
	movs r0, #1
.L080837F2:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080837D8

	THUMB_FUNC_START func_080837F8
func_080837F8: @ 0x080837F8
	push {lr}
	movs r3, #0
	ldr r2, .L0808382C  @ gPlaySt
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08083824
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt .L08083824
	movs r0, #0x87
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	negs r1, r0
	orrs r1, r0
	lsrs r3, r1, #0x1f
.L08083824:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
.L0808382C: .4byte gPlaySt

	THUMB_FUNC_END func_080837F8

	THUMB_FUNC_START EvCheck00_Always
EvCheck00_Always: @ 0x08083830
	movs r0, #1
	bx lr

	THUMB_FUNC_END EvCheck00_Always

	THUMB_FUNC_START EvCheck01_AFEV
EvCheck01_AFEV: @ 0x08083834
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq .L08083850
	cmp r0, #0x64
	beq .L08083850
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0808385C
.L08083850:
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldrh r0, [r4, #2]
	str r0, [r5, #8]
	movs r0, #1
	b .L0808385E
.L0808385C:
	movs r0, #0
.L0808385E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck01_AFEV

	THUMB_FUNC_START EvCheck02_TURN
EvCheck02_TURN: @ 0x08083864
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldrb r4, [r2, #8]
	ldrb r0, [r2, #9]
	ldrh r6, [r2, #0xa]
	cmp r0, #0
	bne .L08083878
	adds r0, r4, #0
	b .L0808387E
.L08083878:
	cmp r0, #0xff
	bne .L0808387E
	ldr r0, .L0808389C  @ 0x7FFFFFFF
.L0808387E:
	ldr r5, .L080838A0  @ gPlaySt
	ldrh r1, [r5, #0x10]
	cmp r4, r1
	bgt .L080838A4
	cmp r1, r0
	bgt .L080838A4
	ldrb r0, [r5, #0xf]
	cmp r0, r6
	bne .L080838A4
	ldr r0, [r2, #4]
	str r0, [r3, #4]
	ldrh r0, [r2, #2]
	str r0, [r3, #8]
	movs r0, #1
	b .L080838A6
	.align 2, 0
.L0808389C: .4byte 0x7FFFFFFF
.L080838A0: .4byte gPlaySt
.L080838A4:
	movs r0, #0
.L080838A6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck02_TURN

	THUMB_FUNC_START EvCheck03_CHAR
EvCheck03_CHAR: @ 0x080838AC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldrb r6, [r4, #8]
	ldrb r7, [r4, #9]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	beq .L080838F2
	cmp r0, #2
	bgt .L080838C6
	cmp r0, #1
	beq .L080838F2
	b .L080838D6
.L080838C6:
	cmp r0, #3
	bne .L080838D6
	ldrh r0, [r4, #0xe]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080838F2
.L080838D6:
	ldrb r0, [r5, #0x1a]
	cmp r0, r6
	beq .L080838E0
	cmp r6, #0
	bne .L080838F2
.L080838E0:
	ldrb r0, [r5, #0x1b]
	cmp r0, r7
	bne .L080838F2
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldrh r0, [r4, #2]
	str r0, [r5, #8]
	movs r0, #1
	b .L080838F4
.L080838F2:
	movs r0, #0
.L080838F4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck03_CHAR

	THUMB_FUNC_START EvCheck04_CHARASM
EvCheck04_CHARASM: @ 0x080838FC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [r4]
	ldrb r6, [r5, #8]
	ldrb r7, [r5, #9]
	ldr r1, [r5, #0xc]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0808392E
	ldrb r0, [r4, #0x1a]
	cmp r0, r6
	beq .L0808391C
	cmp r6, #0
	bne .L0808392E
.L0808391C:
	ldrb r0, [r4, #0x1b]
	cmp r0, r7
	bne .L0808392E
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	str r0, [r4, #8]
	movs r0, #1
	b .L08083930
.L0808392E:
	movs r0, #0
.L08083930:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck04_CHARASM

	THUMB_FUNC_START EvCheck05_LOCA
EvCheck05_LOCA: @ 0x08083938
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldrb r1, [r3, #8]
	ldrb r4, [r3, #9]
	ldrh r5, [r3, #0xa]
	movs r6, #0
	str r6, [r2, #0x10]
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L0808396E
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne .L0808396E
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldrh r0, [r3, #2]
	str r0, [r2, #8]
	ldrh r0, [r3, #0xa]
	str r0, [r2, #0xc]
	cmp r5, #0x14
	bne .L0808396A
	str r6, [r2, #0x14]
.L0808396A:
	movs r0, #1
	b .L08083970
.L0808396E:
	movs r0, #0
.L08083970:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck05_LOCA

	THUMB_FUNC_START EvCheck06_VILL
EvCheck06_VILL: @ 0x08083978
	push {r4, lr}
	adds r4, r0, #0
	bl EvCheck05_LOCA
	movs r1, #3
	str r1, [r4, #0x10]
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck06_VILL

	THUMB_FUNC_START EvCheck07_CHES
EvCheck07_CHES: @ 0x0808398C
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldrb r1, [r3, #8]
	ldrb r4, [r3, #9]
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L080839BE
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne .L080839BE
	movs r0, #1
	str r0, [r2, #4]
	ldrh r0, [r3, #2]
	str r0, [r2, #8]
	ldrh r0, [r3, #0xa]
	str r0, [r2, #0xc]
	ldrh r0, [r3, #4]
	str r0, [r2, #0x14]
	ldrh r0, [r3, #6]
	str r0, [r2, #0x10]
	movs r0, #1
	b .L080839C0
.L080839BE:
	movs r0, #0
.L080839C0:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck07_CHES

	THUMB_FUNC_START EvCheck08_DOOR
EvCheck08_DOOR: @ 0x080839C8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r6, r0, #0x10
	lsrs r1, r1, #0x18
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne .L08083A06
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne .L08083A06
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	str r6, [r3, #0xc]
	str r1, [r3, #0x10]
	movs r0, #1
	b .L08083A08
.L08083A06:
	movs r0, #0
.L08083A08:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck08_DOOR

	THUMB_FUNC_START EvCheck09_
EvCheck09_: @ 0x08083A10
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r6, r0, #0x10
	lsrs r1, r1, #0x18
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne .L08083A4E
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne .L08083A4E
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	str r6, [r3, #0xc]
	str r1, [r3, #0x10]
	movs r0, #1
	b .L08083A50
.L08083A4E:
	movs r0, #0
.L08083A50:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck09_

	THUMB_FUNC_START EvCheck0A_SHOP
EvCheck0A_SHOP: @ 0x08083A58
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4]
	ldrb r1, [r5, #8]
	ldrb r2, [r5, #9]
	ldrh r6, [r5, #0xa]
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne .L08083A9C
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r2, r0
	bne .L08083A9C
	cmp r6, #0x18
	bne .L08083A8A
	ldr r0, .L08083A98  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x72
	bl FindUnitItemSlot
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L08083A9C
.L08083A8A:
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	str r0, [r4, #8]
	str r6, [r4, #0xc]
	movs r0, #1
	b .L08083A9E
	.align 2, 0
.L08083A98: .4byte gActiveUnit
.L08083A9C:
	movs r0, #0
.L08083A9E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck0A_SHOP

	THUMB_FUNC_START EvCheck0B_AREA
EvCheck0B_AREA: @ 0x08083AA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, .L08083B18  @ gActiveUnit
	ldr r3, [r0]
	ldrb r0, [r3, #0x11]
	mov ip, r0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r7, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	lsrs r6, r1, #0x18
	movs r1, #8
	ldrsb r1, [r2, r1]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	cmp r1, r2
	bgt .L08083ADC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r2, r0
	ble .L08083AE8
.L08083ADC:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, r2
	bgt .L08083B1C
	cmp r2, r1
	bgt .L08083B1C
.L08083AE8:
	lsls r0, r7, #0x18
	asrs r3, r0, #0x18
	mov r1, ip
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	lsls r1, r6, #0x18
	cmp r3, r2
	bgt .L08083AFE
	asrs r0, r1, #0x18
	cmp r2, r0
	ble .L08083B08
.L08083AFE:
	asrs r0, r1, #0x18
	cmp r0, r2
	bgt .L08083B1C
	cmp r2, r3
	bgt .L08083B1C
.L08083B08:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b .L08083B1E
	.align 2, 0
.L08083B18: .4byte gActiveUnit
.L08083B1C:
	movs r0, #0
.L08083B1E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck0B_AREA

	THUMB_FUNC_START EvCheck0C_Never
EvCheck0C_Never: @ 0x08083B24
	movs r0, #0
	bx lr

	THUMB_FUNC_END EvCheck0C_Never

	THUMB_FUNC_START EvCheck0D_Never
EvCheck0D_Never: @ 0x08083B28
	movs r0, #0
	bx lr

	THUMB_FUNC_END EvCheck0D_Never

	THUMB_FUNC_START EvCheck0E_FuncCondition
EvCheck0E_FuncCondition: @ 0x08083B2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08083B44
	movs r0, #0
	b .L08083B50
.L08083B44:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
.L08083B50:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck0E_FuncCondition

	THUMB_FUNC_START EvCheck0F_
EvCheck0F_: @ 0x08083B58
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, .L08083B8C  @ 0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08083B90
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08083B90
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b .L08083B92
	.align 2, 0
.L08083B8C: .4byte 0xFFFF0000
.L08083B90:
	movs r0, #0
.L08083B92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck0F_

	THUMB_FUNC_START EvCheck10_
EvCheck10_: @ 0x08083B98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, .L08083BCC  @ 0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08083BD0
	adds r0, r5, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08083BD0
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b .L08083BD2
	.align 2, 0
.L08083BCC: .4byte 0xFFFF0000
.L08083BD0:
	movs r0, #0
.L08083BD2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END EvCheck10_

	THUMB_FUNC_START SetTemporaryFlag
SetTemporaryFlag: @ 0x08083BD8
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq .L08083C00
	subs r3, #1
	ldr r1, .L08083C04  @ gTemporaryFlagData
	adds r0, r3, #0
	cmp r3, #0
	bge .L08083BEC
	adds r0, r3, #7
.L08083BEC:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, .L08083C08  @ gUnknown_089E857C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r2]
.L08083C00:
	pop {r0}
	bx r0
	.align 2, 0
.L08083C04: .4byte gTemporaryFlagData
.L08083C08: .4byte gUnknown_089E857C

	THUMB_FUNC_END SetTemporaryFlag

	THUMB_FUNC_START ClearTemporaryFlag
ClearTemporaryFlag: @ 0x08083C0C
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	beq .L08083C3A
	subs r2, #1
	ldr r3, .L08083C40  @ gUnknown_089E857C
	adds r1, r2, #0
	cmp r2, #0
	bge .L08083C20
	adds r1, r2, #7
.L08083C20:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, .L08083C44  @ gTemporaryFlagData
	adds r1, r1, r0
	ldrb r0, [r1]
	ands r0, r3
	strb r0, [r1]
.L08083C3A:
	pop {r0}
	bx r0
	.align 2, 0
.L08083C40: .4byte gUnknown_089E857C
.L08083C44: .4byte gTemporaryFlagData

	THUMB_FUNC_END ClearTemporaryFlag

	THUMB_FUNC_START ClearTemporaryFlags
ClearTemporaryFlags: @ 0x08083C48
	push {lr}
	ldr r1, .L08083C5C  @ gTemporaryFlagData
	movs r2, #0
	adds r0, r1, #4
.L08083C50:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L08083C50
	pop {r0}
	bx r0
	.align 2, 0
.L08083C5C: .4byte gTemporaryFlagData

	THUMB_FUNC_END ClearTemporaryFlags

	THUMB_FUNC_START CheckTemporaryFlag
CheckTemporaryFlag: @ 0x08083C60
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq .L08083C8A
	subs r3, #1
	ldr r1, .L08083C90  @ gTemporaryFlagData
	adds r0, r3, #0
	cmp r3, #0
	bge .L08083C74
	adds r0, r3, #7
.L08083C74:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, .L08083C94  @ gUnknown_089E857C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne .L08083C98
.L08083C8A:
	movs r0, #0
	b .L08083C9A
	.align 2, 0
.L08083C90: .4byte gTemporaryFlagData
.L08083C94: .4byte gUnknown_089E857C
.L08083C98:
	movs r0, #1
.L08083C9A:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckTemporaryFlag

	THUMB_FUNC_START SetPermanentFlag
SetPermanentFlag: @ 0x08083CA0
	push {lr}
	adds r3, r0, #0
	cmp r3, #0x63
	ble .L08083CCC
	cmp r3, #0x64
	beq .L08083CCC
	subs r3, #0x65
	ldr r1, .L08083CD0  @ gPermanentFlagData
	adds r0, r3, #0
	cmp r3, #0
	bge .L08083CB8
	adds r0, r3, #7
.L08083CB8:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, .L08083CD4  @ gUnknown_089E857C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r2]
.L08083CCC:
	pop {r0}
	bx r0
	.align 2, 0
.L08083CD0: .4byte gPermanentFlagData
.L08083CD4: .4byte gUnknown_089E857C

	THUMB_FUNC_END SetPermanentFlag

	THUMB_FUNC_START ClearPermanentFlag
ClearPermanentFlag: @ 0x08083CD8
	push {lr}
	adds r2, r0, #0
	cmp r2, #0x63
	ble .L08083D0A
	cmp r2, #0x64
	beq .L08083D0A
	subs r2, #0x65
	ldr r3, .L08083D10  @ gUnknown_089E857C
	adds r1, r2, #0
	cmp r2, #0
	bge .L08083CF0
	adds r1, r2, #7
.L08083CF0:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, .L08083D14  @ gPermanentFlagData
	adds r1, r1, r0
	ldrb r0, [r1]
	ands r0, r3
	strb r0, [r1]
.L08083D0A:
	pop {r0}
	bx r0
	.align 2, 0
.L08083D10: .4byte gUnknown_089E857C
.L08083D14: .4byte gPermanentFlagData

	THUMB_FUNC_END ClearPermanentFlag

	THUMB_FUNC_START ClearGlobalTriggerState
ClearGlobalTriggerState: @ 0x08083D18
	push {lr}
	ldr r1, .L08083D30  @ gPermanentFlagData
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x18
.L08083D22:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L08083D22
	pop {r0}
	bx r0
	.align 2, 0
.L08083D30: .4byte gPermanentFlagData

	THUMB_FUNC_END ClearGlobalTriggerState

	THUMB_FUNC_START CheckGlobalEventIdFrom
CheckGlobalEventIdFrom: @ 0x08083D34
	push {lr}
	adds r3, r0, #0
	cmp r3, #0x64
	ble .L08083D5C
	subs r3, #0x65
	adds r0, r3, #0
	cmp r3, #0
	bge .L08083D46
	adds r0, r3, #7
.L08083D46:
	asrs r0, r0, #3
	adds r2, r1, r0
	ldr r1, .L08083D60  @ gUnknown_089E857C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne .L08083D64
.L08083D5C:
	movs r0, #0
	b .L08083D66
	.align 2, 0
.L08083D60: .4byte gUnknown_089E857C
.L08083D64:
	movs r0, #1
.L08083D66:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckGlobalEventIdFrom

	THUMB_FUNC_START CheckPermanentFlag
CheckPermanentFlag: @ 0x08083D6C
	push {lr}
	ldr r1, .L08083D7C  @ gPermanentFlagData
	bl CheckGlobalEventIdFrom
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
.L08083D7C: .4byte gPermanentFlagData

	THUMB_FUNC_END CheckPermanentFlag

	THUMB_FUNC_START SetFlag
SetFlag: @ 0x08083D80
	push {lr}
	cmp r0, #0x63
	bgt .L08083D8C
	bl SetTemporaryFlag
	b .L08083D90
.L08083D8C:
	bl SetPermanentFlag
.L08083D90:
	pop {r0}
	bx r0

	THUMB_FUNC_END SetFlag

	THUMB_FUNC_START ClearFlag
ClearFlag: @ 0x08083D94
	push {lr}
	cmp r0, #0x63
	bgt .L08083DA0
	bl ClearTemporaryFlag
	b .L08083DA4
.L08083DA0:
	bl ClearPermanentFlag
.L08083DA4:
	pop {r0}
	bx r0

	THUMB_FUNC_END ClearFlag

	THUMB_FUNC_START CheckFlag
CheckFlag: @ 0x08083DA8
	push {lr}
	cmp r0, #0x63
	ble .L08083DB4
	bl CheckPermanentFlag
	b .L08083DB8
.L08083DB4:
	bl CheckTemporaryFlag
.L08083DB8:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckFlag

	THUMB_FUNC_START GetPermanentFlagData
GetPermanentFlagData: @ 0x08083DC0
	ldr r0, .L08083DC4  @ gPermanentFlagData
	bx lr
	.align 2, 0
.L08083DC4: .4byte gPermanentFlagData

	THUMB_FUNC_END GetPermanentFlagData

	THUMB_FUNC_START GetPermanentFlagDataSize
GetPermanentFlagDataSize: @ 0x08083DC8
	movs r0, #0x19
	bx lr

	THUMB_FUNC_END GetPermanentFlagDataSize

	THUMB_FUNC_START GetTemporaryFlagData
GetTemporaryFlagData: @ 0x08083DCC
	ldr r0, .L08083DD0  @ gTemporaryFlagData
	bx lr
	.align 2, 0
.L08083DD0: .4byte gTemporaryFlagData

	THUMB_FUNC_END GetTemporaryFlagData

	THUMB_FUNC_START GetTemporaryFlagDataSize
GetTemporaryFlagDataSize: @ 0x08083DD4
	movs r0, #5
	bx lr

	THUMB_FUNC_END GetTemporaryFlagDataSize

	THUMB_FUNC_START func_08083DD8
func_08083DD8: @ 0x08083DD8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r4, #0
	ldr r5, .L08083E18  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventInfo
	ldr r1, [r0, #0x1c]
	ldr r0, [r1]
	cmp r0, #0
	beq .L08083E2C
	adds r2, r5, #0
	adds r2, #0x4a
	lsls r3, r6, #4
	adds r5, #0x4b
	movs r6, #0xf
.L08083DFE:
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r7
	bne .L08083E1C
	adds r0, r4, #1
	strb r0, [r5]
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b .L08083E2C
	.align 2, 0
.L08083E18: .4byte gPlaySt
.L08083E1C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne .L08083DFE
.L08083E2C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08083DD8

	THUMB_FUNC_START CheckTutorialEvent
CheckTutorialEvent: @ 0x08083E34
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, .L08083E58  @ gPlaySt
	adds r0, r1, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08083E5C
	adds r0, r1, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, r2
	bne .L08083E5C
	movs r0, #1
	b .L08083E5E
	.align 2, 0
.L08083E58: .4byte gPlaySt
.L08083E5C:
	movs r0, #0
.L08083E5E:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckTutorialEvent

	THUMB_FUNC_START RunTutorialEvent
RunTutorialEvent: @ 0x08083E64
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, .L08083EAC  @ gPlaySt
	adds r6, r1, #0
	adds r6, #0x4b
	ldrb r0, [r6]
	cmp r0, #0
	beq .L08083EB0
	adds r5, r1, #0
	adds r5, #0x4a
	ldrb r0, [r5]
	lsrs r0, r0, #4
	cmp r0, r2
	bne .L08083EB0
	ldrb r4, [r6]
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterEventInfo
	ldr r0, [r0, #0x1c]
	lsls r4, r4, #2
	adds r4, r4, r0
	subs r4, #4
	ldr r0, [r4]
	movs r1, #1
	bl CallEvent
	movs r0, #0
	strb r0, [r6]
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r5]
	movs r0, #1
	b .L08083EB2
	.align 2, 0
.L08083EAC: .4byte gPlaySt
.L08083EB0:
	movs r0, #0
.L08083EB2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END RunTutorialEvent

	THUMB_FUNC_START RunPhaseSwitchEvents
RunPhaseSwitchEvents: @ 0x08083EB8
	push {r4, lr}
	sub sp, #0x1c
	bl GetBattleMapKind
	cmp r0, #2
	bne .L08083EC8
	movs r0, #0
	b .L08083F60
.L08083EC8:
	ldr r0, .L08083EEC  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq .L08083F18
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08083EF0
	adds r0, r4, #0
	bl GetChapterInfo
	adds r0, #0x8c
	ldrb r0, [r0]
	b .L08083EF2
	.align 2, 0
.L08083EEC: .4byte gPlaySt
.L08083EF0:
	movs r0, #1
.L08083EF2:
	cmp r0, #1
	beq .L08083EFA
	cmp r0, #3
	bne .L08083F18
.L08083EFA:
	bl IsAnyEnemyUnitAlive
	cmp r0, #0
	bne .L08083F18
	bl GetBattleMapKind
	cmp r0, #0
	bne .L08083F10
	movs r0, #3
	bl SetFlag
.L08083F10:
	bl CallEndEvent
	movs r0, #1
	b .L08083F60
.L08083F18:
	movs r0, #0
	bl RunTutorialEvent
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L08083F58  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl CheckEventDefinition
	cmp r0, #0
	beq .L08083F5C
	bl ClearActiveEventRegistry
.L08083F40:
	mov r0, sp
	movs r1, #1
	bl CallEventDefinition
	mov r0, sp
	bl CheckNextEventDefinition
	cmp r0, #0
	bne .L08083F40
	movs r0, #1
	b .L08083F60
	.align 2, 0
.L08083F58: .4byte gPlaySt
.L08083F5C:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
.L08083F60:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END RunPhaseSwitchEvents

	THUMB_FUNC_START CheckForCharacterEvents
CheckForCharacterEvents: @ 0x08083F68
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08083F9A
	ldr r0, .L08083FA0  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl CheckEventDefinition
	cmp r0, #0
	bne .L08083FA4
.L08083F9A:
	movs r0, #0
	b .L08083FA6
	.align 2, 0
.L08083FA0: .4byte gPlaySt
.L08083FA4:
	movs r0, #1
.L08083FA6:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckForCharacterEvents

	THUMB_FUNC_START RunCharacterEvents
RunCharacterEvents: @ 0x08083FB0
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08083FEE
	ldr r0, .L08083FF8  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl CheckEventDefinition
	cmp r0, #0
	beq .L08083FEE
	bl ClearActiveEventRegistry
	mov r0, sp
	movs r1, #1
	bl CallEventDefinition
.L08083FEE:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08083FF8: .4byte gPlaySt

	THUMB_FUNC_END RunCharacterEvents

	THUMB_FUNC_START func_08083FFC
func_08083FFC: @ 0x08083FFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0x72
	bne .L0808406C
	movs r0, #0x72
	bl GetConvoyItemSlot
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L0808401E
.L0808401A:
	movs r0, #0x74
	b .L0808406E
.L0808401E:
	movs r7, #1
.L08084020:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq .L08084066
	ldr r0, [r6]
	cmp r0, #0
	beq .L08084066
	ldr r0, [r6, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne .L08084066
	movs r5, #0
	b .L08084050
.L08084040:
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0x72
	beq .L0808401A
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L08084050:
	cmp r5, #4
	bhi .L08084066
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r0, [r4]
	bl GetItemIid
	cmp r0, #0
	bne .L08084040
.L08084066:
	adds r7, #1
	cmp r7, #0x3f
	ble .L08084020
.L0808406C:
	mov r0, r8
.L0808406E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08083FFC

	THUMB_FUNC_START GetLocationEventCommandAt
GetLocationEventCommandAt: @ 0x08084078
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, .L080840B4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl CheckEventDefinition
	cmp r0, #0
	beq .L080840B8
	bl GetBattleMapKind
	cmp r0, #2
	beq .L080840B8
	ldr r0, [sp, #0xc]
	b .L080840BA
	.align 2, 0
.L080840B4: .4byte gPlaySt
.L080840B8:
	movs r0, #0
.L080840BA:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetLocationEventCommandAt

	THUMB_FUNC_START RunLocationEvents
RunLocationEvents: @ 0x080840C4
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, .L08084104  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r5, [r0, #0x18]
	strb r4, [r0, #0x19]
	bl CheckEventDefinition
	cmp r0, #0
	bne .L080840F0
	b .L08084326
.L080840F0:
	ldr r0, [sp, #0xc]
	cmp r0, #0x20
	bls .L080840F8
	b .L08084326
.L080840F8:
	lsls r0, r0, #2
	ldr r1, .L08084108  @ .L0808410C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08084104: .4byte gPlaySt
.L08084108: .4byte .L0808410C
.L0808410C: @ jump table
	.4byte .L08084324 @ case 0
	.4byte .L08084326 @ case 1
	.4byte .L08084326 @ case 2
	.4byte .L08084326 @ case 3
	.4byte .L08084326 @ case 4
	.4byte .L08084326 @ case 5
	.4byte .L08084326 @ case 6
	.4byte .L08084326 @ case 7
	.4byte .L08084326 @ case 8
	.4byte .L08084326 @ case 9
	.4byte .L08084326 @ case 10
	.4byte .L08084326 @ case 11
	.4byte .L08084326 @ case 12
	.4byte .L08084326 @ case 13
	.4byte .L08084326 @ case 14
	.4byte .L08084326 @ case 15
	.4byte .L08084190 @ case 16
	.4byte .L080841AC @ case 17
	.4byte .L080841FC @ case 18
	.4byte .L080841FC @ case 19
	.4byte .L08084238 @ case 20
	.4byte .L08084326 @ case 21
	.4byte .L080842D8 @ case 22
	.4byte .L080842F0 @ case 23
	.4byte .L08084308 @ case 24
	.4byte .L08084320 @ case 25
	.4byte .L08084326 @ case 26
	.4byte .L08084326 @ case 27
	.4byte .L08084326 @ case 28
	.4byte .L08084326 @ case 29
	.4byte .L08084326 @ case 30
	.4byte .L08084326 @ case 31
	.4byte .L080841D4 @ case 32
.L08084190:
	lsls r1, r4, #0x18
	ldr r0, .L080841CC  @ gMapUnit
	ldr r0, [r0]
	asrs r1, r1, #0x16
	adds r1, r1, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r1]
	adds r1, r1, r0
	ldr r0, .L080841D0  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	strb r0, [r1]
.L080841AC:
	bl GetBattleMapKind
	cmp r0, #2
	bne .L080841B6
	b .L08084326
.L080841B6:
	bl ClearActiveEventRegistry
	mov r0, sp
	movs r1, #1
	bl CallEventDefinition
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq .L080841CA
	b .L08084326
.L080841CA:
	b .L080841DE
	.align 2, 0
.L080841CC: .4byte gMapUnit
.L080841D0: .4byte gActiveUnit
.L080841D4:
	bl GetBattleMapKind
	cmp r0, #2
	bne .L080841DE
	b .L08084326
.L080841DE:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CallTileChangeEvent
	b .L08084326
.L080841FC:
	bl GetBattleMapKind
	cmp r0, #2
	bne .L08084206
	b .L08084326
.L08084206:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne .L0808422A
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CallTileChangeEvent
	b .L080842D0
.L0808422A:
	bl ClearActiveEventRegistry
	mov r0, sp
	movs r1, #1
	bl CallEventDefinition
	b .L08084326
.L08084238:
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08084326
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne .L08084278
	bl RandNext_100
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	cmp r0, #0
	beq .L08084274
	ldrb r1, [r2, #1]
	cmp r3, r1
	bcc .L08084272
.L0808425C:
	adds r2, #2
	ldrb r0, [r2]
	cmp r0, #0
	beq .L08084274
	ldrb r0, [r2, #1]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r3, r1
	bcs .L0808425C
	ldrb r0, [r2]
.L08084272:
	str r0, [sp, #0x14]
.L08084274:
	ldr r0, [sp, #0x14]
	b .L0808427C
.L08084278:
	cmp r0, #0x77
	beq .L080842AE
.L0808427C:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl func_08083FFC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl CallChestOpeningEvent
	b .L080842D0
.L080842AE:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl CallChestOpeningEvent
.L080842D0:
	ldr r0, [sp, #8]
	bl SetFlag
	b .L08084326
.L080842D8:
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08084326
	ldr r0, .L080842EC  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl func_080B41D0
	b .L08084326
	.align 2, 0
.L080842EC: .4byte gActiveUnit
.L080842F0:
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08084326
	ldr r0, .L08084304  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl func_080B41F0
	b .L08084326
	.align 2, 0
.L08084304: .4byte gActiveUnit
.L08084308:
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08084326
	ldr r0, .L0808431C  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl func_080B4210
	b .L08084326
	.align 2, 0
.L0808431C: .4byte gActiveUnit
.L08084320:
	mov r8, r8
	b .L08084326
.L08084324:
	mov r8, r8
.L08084326:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END RunLocationEvents

	THUMB_FUNC_START CheckForPostActionEvents
CheckForPostActionEvents: @ 0x08084330
	push {r4, lr}
	sub sp, #0x1c
	bl IsAnyEnemyUnitAlive
	cmp r0, #0
	bne .L0808434C
	movs r0, #6
	bl SetFlag
	bl GetBattleMapKind
	cmp r0, #2
	bne .L08084352
	b .L080843B4
.L0808434C:
	movs r0, #6
	bl ClearFlag
.L08084352:
	movs r0, #0x65
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080843B4
	bl CountAvailableBlueUnits
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L080843B4
	bl GetBattleMapKind
	cmp r0, #2
	bne .L08084374
	movs r0, #0
	b .L080843B6
.L08084374:
	movs r0, #1
	bl CheckTutorialEvent
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L080843AC  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, .L080843B0  @ gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl CheckEventDefinition
	cmp r0, #0
	bne .L080843B4
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	b .L080843B6
	.align 2, 0
.L080843AC: .4byte gPlaySt
.L080843B0: .4byte gActiveUnit
.L080843B4:
	movs r0, #1
.L080843B6:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckForPostActionEvents

	THUMB_FUNC_START RunPostActionEvents
RunPostActionEvents: @ 0x080843C0
	push {lr}
	sub sp, #0x1c
	bl IsAnyEnemyUnitAlive
	cmp r0, #0
	bne .L080843E0
	movs r0, #6
	bl SetFlag
	bl GetBattleMapKind
	cmp r0, #2
	bne .L080843E6
	bl CallEndEvent
	b .L0808444E
.L080843E0:
	movs r0, #6
	bl ClearFlag
.L080843E6:
	movs r0, #0x65
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080843FC
	bl CountAvailableBlueUnits
	lsls r0, r0, #0x10
	cmp r0, #0
	bne .L08084402
.L080843FC:
	bl func_080837B0
	b .L0808444E
.L08084402:
	bl GetBattleMapKind
	cmp r0, #2
	beq .L0808444E
	movs r0, #1
	bl RunTutorialEvent
	ldr r0, .L08084454  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, .L08084458  @ gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl CheckEventDefinition
	cmp r0, #0
	beq .L0808444E
	bl ClearActiveEventRegistry
.L0808443C:
	mov r0, sp
	movs r1, #1
	bl CallEventDefinition
	mov r0, sp
	bl CheckNextEventDefinition
	cmp r0, #0
	bne .L0808443C
.L0808444E:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0
.L08084454: .4byte gPlaySt
.L08084458: .4byte gActiveUnit

	THUMB_FUNC_END RunPostActionEvents

	THUMB_FUNC_START RunSelectEvents
RunSelectEvents: @ 0x0808445C
	push {r4, lr}
	sub sp, #0x1c
	bl GetBattleMapKind
	cmp r0, #2
	bne .L0808446C
	movs r0, #0
	b .L080844A8
.L0808446C:
	movs r0, #2
	bl RunTutorialEvent
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L0808448C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x10]
	str r0, [sp]
	bl ClearActiveEventRegistry
	b .L0808449A
	.align 2, 0
.L0808448C: .4byte gPlaySt
.L08084490:
	mov r0, sp
	movs r1, #1
	bl CallEventDefinition
	movs r4, #1
.L0808449A:
	mov r0, sp
	bl CheckEventDefinition
	cmp r0, #0
	bne .L08084490
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
.L080844A8:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END RunSelectEvents

	THUMB_FUNC_START RunMoveEventsMaybe
RunMoveEventsMaybe: @ 0x080844B0
	push {r4, lr}
	sub sp, #0x1c
	bl GetBattleMapKind
	cmp r0, #2
	bne .L080844C0
	movs r0, #0
	b .L080844FE
.L080844C0:
	movs r0, #3
	bl RunTutorialEvent
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L080844EC  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x14]
	str r0, [sp]
	mov r0, sp
	bl CheckEventDefinition
	cmp r0, #0
	bne .L080844F0
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	b .L080844FE
	.align 2, 0
.L080844EC: .4byte gPlaySt
.L080844F0:
	bl ClearActiveEventRegistry
	mov r0, sp
	movs r1, #1
	bl CallEventDefinition
	movs r0, #1
.L080844FE:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END RunMoveEventsMaybe

	THUMB_FUNC_START RunPostMoveEvents
RunPostMoveEvents: @ 0x08084508
	push {r4, lr}
	sub sp, #0x1c
	bl GetBattleMapKind
	cmp r0, #2
	bne .L08084518
	movs r0, #0
	b .L08084556
.L08084518:
	movs r0, #4
	bl RunTutorialEvent
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L08084544  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x18]
	str r0, [sp]
	mov r0, sp
	bl CheckEventDefinition
	cmp r0, #0
	bne .L08084548
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	b .L08084556
	.align 2, 0
.L08084544: .4byte gPlaySt
.L08084548:
	bl ClearActiveEventRegistry
	mov r0, sp
	movs r1, #1
	bl CallEventDefinition
	movs r0, #1
.L08084556:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END RunPostMoveEvents

	THUMB_FUNC_START CheckBattleForecastTutorialEvent
CheckBattleForecastTutorialEvent: @ 0x08084560
	push {lr}
	bl GetBattleMapKind
	cmp r0, #2
	beq .L08084576
	movs r0, #5
	bl CheckTutorialEvent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b .L08084578
.L08084576:
	movs r0, #0
.L08084578:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckBattleForecastTutorialEvent

	THUMB_FUNC_START RunBattleForecastTutorialEvent
RunBattleForecastTutorialEvent: @ 0x0808457C
	push {lr}
	bl GetBattleMapKind
	cmp r0, #2
	beq .L0808458C
	movs r0, #5
	bl RunTutorialEvent
.L0808458C:
	pop {r0}
	bx r0

	THUMB_FUNC_END RunBattleForecastTutorialEvent

	THUMB_FUNC_START RunPlayerPhaseStartTutorialEvent
RunPlayerPhaseStartTutorialEvent: @ 0x08084590
	push {lr}
	bl GetBattleMapKind
	cmp r0, #2
	beq .L080845A0
	movs r0, #6
	bl RunTutorialEvent
.L080845A0:
	pop {r0}
	bx r0

	THUMB_FUNC_END RunPlayerPhaseStartTutorialEvent

	THUMB_FUNC_START ClearActiveEventRegistry
ClearActiveEventRegistry: @ 0x080845A4
	push {lr}
	ldr r0, .L080845B4  @ gActiveEventRegistry
	movs r1, #0
	movs r2, #0x40
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
.L080845B4: .4byte gActiveEventRegistry

	THUMB_FUNC_END ClearActiveEventRegistry

	THUMB_FUNC_START RegisterEventActivation
RegisterEventActivation: @ 0x080845B8
	push {r4, lr}
	ldr r3, .L080845E0  @ gActiveEventRegistry
	movs r4, #0x3c
	ldrsh r2, [r3, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	str r0, [r2]
	movs r2, #0x3c
	ldrsh r0, [r3, r2]
	lsls r0, r0, #1
	adds r2, r3, #0
	adds r2, #0x28
	adds r0, r0, r2
	strh r1, [r0]
	ldrh r0, [r3, #0x3c]
	adds r0, #1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080845E0: .4byte gActiveEventRegistry

	THUMB_FUNC_END RegisterEventActivation

	THUMB_FUNC_START GetEventTriggerId
GetEventTriggerId: @ 0x080845E4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0
	ldr r2, .L08084610  @ gActiveEventRegistry
	movs r3, #0x3c
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge .L08084620
	adds r3, r0, #0
	adds r5, r2, #0
	adds r5, #0x28
.L080845FA:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne .L08084614
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	b .L08084622
	.align 2, 0
.L08084610: .4byte gActiveEventRegistry
.L08084614:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	blt .L080845FA
.L08084620:
	movs r0, #0
.L08084622:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetEventTriggerId

	THUMB_FUNC_START SetFlag82
SetFlag82: @ 0x08084628
	push {lr}
	movs r0, #0x82
	bl SetFlag
	pop {r0}
	bx r0

	THUMB_FUNC_END SetFlag82

	THUMB_FUNC_START CheckFlag82
CheckFlag82: @ 0x08084634
	push {lr}
	movs r0, #0x82
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08084646
	movs r0, #0
	b .L08084648
.L08084646:
	movs r0, #1
.L08084648:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckFlag82

	THUMB_FUNC_START GetBattleQuoteEntry
GetBattleQuoteEntry: @ 0x0808464C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r4, .L080846AC  @ gUnknown_089EC6BC
	ldrh r0, [r4]
	ldr r1, .L080846B0  @ 0x0000FFFF
	cmp r0, r1
	beq .L080846DC
	adds r7, r1, #0
.L08084662:
	ldrh r0, [r4, #4]
	cmp r0, #0xff
	beq .L08084686
	adds r1, r0, #0
	ldr r0, .L080846B4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq .L08084686
	cmp r1, #0xfe
	bne .L080846D4
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L080846D4
.L08084686:
	ldrh r0, [r4, #6]
	bl GetEventTriggerState
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080846D4
	ldrh r0, [r4]
	adds r1, r0, #0
	adds r3, r0, #0
	cmp r1, #0
	beq .L080846B8
	ldrh r0, [r4, #2]
	adds r2, r0, #0
	cmp r2, #0
	bne .L080846C4
	cmp r6, r1
	bne .L080846D4
.L080846A8:
	adds r0, r4, #0
	b .L080846DE
	.align 2, 0
.L080846AC: .4byte gUnknown_089EC6BC
.L080846B0: .4byte 0x0000FFFF
.L080846B4: .4byte gPlaySt
.L080846B8:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq .L080846D4
	cmp r5, r0
	bne .L080846D4
	b .L080846A8
.L080846C4:
	cmp r6, r1
	bne .L080846CC
	cmp r5, r2
	beq .L080846A8
.L080846CC:
	cmp r5, r3
	bne .L080846D4
	cmp r6, r0
	beq .L080846A8
.L080846D4:
	adds r4, #0x10
	ldrh r0, [r4]
	cmp r0, r7
	bne .L08084662
.L080846DC:
	movs r0, #0
.L080846DE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBattleQuoteEntry

	THUMB_FUNC_START GetCharDeathQuoteEntry
GetCharDeathQuoteEntry: @ 0x080846E4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, .L0808472C  @ gUnknown_089ECD4C
	ldrh r0, [r4]
	ldr r1, .L08084730  @ 0x0000FFFF
	cmp r0, r1
	beq .L08084740
	ldr r5, .L08084734  @ gPlaySt
	adds r7, r1, #0
.L080846F8:
	ldrb r0, [r4, #2]
	cmp r0, #0xff
	beq .L08084704
	ldrb r1, [r5, #0x1b]
	cmp r0, r1
	bne .L08084738
.L08084704:
	ldrb r0, [r4, #3]
	cmp r0, #0xff
	beq .L08084714
	adds r1, r0, #0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne .L08084738
.L08084714:
	ldrh r0, [r4, #4]
	bl GetEventTriggerState
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08084738
	ldrh r0, [r4]
	cmp r6, r0
	bne .L08084738
	adds r0, r4, #0
	b .L08084742
	.align 2, 0
.L0808472C: .4byte gUnknown_089ECD4C
.L08084730: .4byte 0x0000FFFF
.L08084734: .4byte gPlaySt
.L08084738:
	adds r4, #0xc
	ldrh r0, [r4]
	cmp r0, r7
	bne .L080846F8
.L08084740:
	movs r0, #0
.L08084742:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetCharDeathQuoteEntry

	THUMB_FUNC_START GetSupportTalkInfoForCharacters
GetSupportTalkInfoForCharacters: @ 0x08084748
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, .L08084784  @ gUnknown_089ED10C
	ldrh r2, [r0]
	ldr r3, .L08084788  @ 0x0000FFFF
	cmp r2, r3
	beq .L0808477A
.L0808475C:
	cmp r4, r2
	bne .L08084766
	ldrh r2, [r0, #2]
	cmp r1, r2
	beq .L0808477C
.L08084766:
	ldrh r2, [r0]
	cmp r1, r2
	bne .L08084772
	ldrh r2, [r0, #2]
	cmp r4, r2
	beq .L0808477C
.L08084772:
	adds r0, #0x10
	ldrh r2, [r0]
	cmp r2, r3
	bne .L0808475C
.L0808477A:
	movs r0, #0
.L0808477C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08084784: .4byte gUnknown_089ED10C
.L08084788: .4byte 0x0000FFFF

	THUMB_FUNC_END GetSupportTalkInfoForCharacters

	THUMB_FUNC_START GetSupportTalkSong
GetSupportTalkSong: @ 0x0808478C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	adds r5, r4, #0
	bl GetSupportTalkInfoForCharacters
	cmp r0, #0
	beq .L080847EE
	cmp r4, #2
	beq .L080847BE
	cmp r4, #2
	bgt .L080847B2
	cmp r4, #1
	beq .L080847B8
	b .L080847EE
.L080847B2:
	cmp r5, #3
	beq .L080847C4
	b .L080847EE
.L080847B8:
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #0x1b
	b .L080847C8
.L080847BE:
	ldrh r0, [r0, #0xc]
	lsls r0, r0, #0x16
	b .L080847C8
.L080847C4:
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #0x19
.L080847C8:
	lsrs r0, r0, #0x1b
	cmp r0, #2
	beq .L080847E6
	cmp r0, #2
	bgt .L080847D8
	cmp r0, #1
	beq .L080847E2
	b .L080847EE
.L080847D8:
	cmp r0, #3
	beq .L080847EA
	cmp r0, #4
	beq .L080847EA
	b .L080847EE
.L080847E2:
	movs r0, #0x27
	b .L080847F0
.L080847E6:
	movs r0, #0x4c
	b .L080847F0
.L080847EA:
	movs r0, #0x6a
	b .L080847F0
.L080847EE:
	movs r0, #0
.L080847F0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSupportTalkSong

	THUMB_FUNC_START GetSupportTalkInfoList
GetSupportTalkInfoList: @ 0x080847F8
	ldr r0, .L080847FC  @ gUnknown_089ED10C
	bx lr
	.align 2, 0
.L080847FC: .4byte gUnknown_089ED10C

	THUMB_FUNC_END GetSupportTalkInfoList

	THUMB_FUNC_START IsCharacterForceDeployed_
IsCharacterForceDeployed_: @ 0x08084800
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, .L0808483C  @ gUnknown_089ED64C
	ldrh r0, [r2]
	ldr r1, .L08084840  @ 0x0000FFFF
	cmp r0, r1
	beq .L08084850
	ldr r3, .L08084844  @ gPlaySt
	adds r5, r1, #0
.L08084814:
	ldrb r0, [r2, #2]
	cmp r0, #0xff
	beq .L08084820
	ldrb r1, [r3, #0x1b]
	cmp r0, r1
	bne .L08084848
.L08084820:
	ldrb r0, [r2, #3]
	cmp r0, #0xff
	beq .L08084830
	adds r1, r0, #0
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne .L08084848
.L08084830:
	ldrh r0, [r2]
	cmp r4, r0
	bne .L08084848
	movs r0, #1
	b .L08084852
	.align 2, 0
.L0808483C: .4byte gUnknown_089ED64C
.L08084840: .4byte 0x0000FFFF
.L08084844: .4byte gPlaySt
.L08084848:
	adds r2, #4
	ldrh r0, [r2]
	cmp r0, r5
	bne .L08084814
.L08084850:
	movs r0, #0
.L08084852:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsCharacterForceDeployed_

	THUMB_FUNC_START IsSethLArachelMyrrhInnes
IsSethLArachelMyrrhInnes: @ 0x08084858
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, .L08084864  @ gUnknown_089ED674
	b .L08084874
	.align 2, 0
.L08084864: .4byte gUnknown_089ED674
.L08084868:
	ldrb r0, [r1]
	cmp r0, r2
	bne .L08084872
	movs r0, #1
	b .L0808487C
.L08084872:
	adds r1, #1
.L08084874:
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08084868
	movs r0, #0
.L0808487C:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsSethLArachelMyrrhInnes

.align 2, 0
