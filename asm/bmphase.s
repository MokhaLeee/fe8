	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ various phase/allegience checks and utility routines

	THUMB_FUNC_START GetPhaseAbleUnitCount
GetPhaseAbleUnitCount: @ 0x08024CEC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b .L08024D3C
.L08024CF6:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08024D38
	ldr r3, [r2]
	cmp r3, #0
	beq .L08024D38
	ldr r0, [r2, #0xc]
	ldr r1, .L08024D4C  @ 0x000100AE
	ands r0, r1
	cmp r0, #0
	bne .L08024D38
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq .L08024D38
	cmp r1, #4
	beq .L08024D38
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne .L08024D38
	adds r6, #1
.L08024D38:
	adds r4, #1
	adds r0, r5, #0
.L08024D3C:
	adds r0, #0x40
	cmp r4, r0
	blt .L08024CF6
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08024D4C: .4byte 0x000100AE

	THUMB_FUNC_END GetPhaseAbleUnitCount

	THUMB_FUNC_START func_08024D50
func_08024D50: @ 0x08024D50
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r4, r5, #1
	b .L08024D7C
.L08024D5C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L08024D78
	ldr r0, [r1]
	cmp r0, #0
	beq .L08024D78
	ldr r0, [r1, #0xc]
	ands r0, r7
	cmp r0, #0
	bne .L08024D78
	adds r6, #1
.L08024D78:
	adds r4, #1
	adds r0, r5, #0
.L08024D7C:
	adds r0, #0x40
	cmp r4, r0
	blt .L08024D5C
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08024D50

	THUMB_FUNC_START AreAllegiancesAllied
AreAllegiancesAllied: @ 0x08024D8C
	push {lr}
	movs r2, #0x80
	ands r1, r2
	movs r3, #0
	ands r2, r0
	cmp r2, r1
	bne .L08024D9C
	movs r3, #1
.L08024D9C:
	adds r0, r3, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END AreAllegiancesAllied

	THUMB_FUNC_START AreAllegiancesEqual
AreAllegiancesEqual: @ 0x08024DA4
	push {lr}
	movs r2, #0xc0
	ands r1, r2
	movs r3, #0
	ands r2, r0
	cmp r2, r1
	bne .L08024DB4
	movs r3, #1
.L08024DB4:
	adds r0, r3, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END AreAllegiancesEqual

	THUMB_FUNC_START GetCurrentPhase
GetCurrentPhase: @ 0x08024DBC
	ldr r0, .L08024DCC  @ gPlaySt
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
.L08024DCC: .4byte gPlaySt

	THUMB_FUNC_END GetCurrentPhase

	THUMB_FUNC_START IsNotEnemyPhaseMaybe
IsNotEnemyPhaseMaybe: @ 0x08024DD0
	ldr r0, .L08024DE4  @ gPlaySt
	ldrb r1, [r0, #0xf]
	movs r2, #0x80
	movs r0, #0x80
	ands r0, r1
	eors r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
.L08024DE4: .4byte gPlaySt

	THUMB_FUNC_END IsNotEnemyPhaseMaybe

.align 2, 0
