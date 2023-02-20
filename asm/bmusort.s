	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Utility functions for "sorting" player units

	THUMB_FUNC_START InitUnitStack
InitUnitStack: @ 0x080316C4
	ldr r2, .L080316D4  @ gpSomeUnitPool
	ldr r1, .L080316D8  @ gpSomeUnitIt
	str r0, [r1]
	str r0, [r2]
	ldr r1, .L080316DC  @ gSomeUnitCounter
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
.L080316D4: .4byte gpSomeUnitPool
.L080316D8: .4byte gpSomeUnitIt
.L080316DC: .4byte gSomeUnitCounter

	THUMB_FUNC_END InitUnitStack

	THUMB_FUNC_START PushUnit
PushUnit: @ 0x080316E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L0803170C  @ gpSomeUnitIt
	ldr r1, [r4]
	movs r5, #0
	str r5, [r1]
	bl CopyUnit
	ldr r2, [r4]
	ldr r1, .L08031710  @ gSomeUnitCounter
	ldrb r0, [r1]
	strb r0, [r2, #0xb]
	strb r5, [r6, #0x12]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x48
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803170C: .4byte gpSomeUnitIt
.L08031710: .4byte gSomeUnitCounter

	THUMB_FUNC_END PushUnit

	THUMB_FUNC_START LoadPlayerUnitsFromUnitStack
LoadPlayerUnitsFromUnitStack: @ 0x08031714
	push {r4, r5, lr}
	ldr r5, .L08031748  @ gUnitArrayBlue
	movs r4, #0x3d
.L0803171A:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge .L0803171A
	ldr r0, .L0803174C  @ gpSomeUnitPool
	ldr r0, [r0]
	ldr r1, .L08031748  @ gUnitArrayBlue
	ldr r2, .L08031750  @ gpSomeUnitIt
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08031748: .4byte gUnitArrayBlue
.L0803174C: .4byte gpSomeUnitPool
.L08031750: .4byte gpSomeUnitIt

	THUMB_FUNC_END LoadPlayerUnitsFromUnitStack

	THUMB_FUNC_START LoadPlayerUnitsFromUnitStack2
LoadPlayerUnitsFromUnitStack2: @ 0x08031754
	push {r4, r5, lr}
	ldr r5, .L08031788  @ gUnitArrayBlue
	movs r4, #0x3d
.L0803175A:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge .L0803175A
	ldr r0, .L0803178C  @ gpSomeUnitPool
	ldr r0, [r0]
	ldr r1, .L08031788  @ gUnitArrayBlue
	ldr r2, .L08031790  @ gpSomeUnitIt
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08031788: .4byte gUnitArrayBlue
.L0803178C: .4byte gpSomeUnitPool
.L08031790: .4byte gpSomeUnitIt

	THUMB_FUNC_END LoadPlayerUnitsFromUnitStack2

.align 2, 0
