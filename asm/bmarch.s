	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Ballistae stuff
	@ Up with Arch

	THUMB_FUNC_START GetNonEmptyBallistaAt
GetNonEmptyBallistaAt: @ 0x0803795C
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq .L0803796E
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq .L08037972
.L0803796E:
	movs r0, #0
	b .L08037974
.L08037972:
	movs r0, #1
.L08037974:
	cmp r0, #0
	beq .L08037980
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L08037984
.L08037980:
	movs r0, #0
	b .L08037986
.L08037984:
	adds r0, r1, #0
.L08037986:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetNonEmptyBallistaAt

	THUMB_FUNC_START GetBallistaItemAt
GetBallistaItemAt: @ 0x0803798C
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq .L0803799E
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq .L080379A2
.L0803799E:
	movs r0, #0
	b .L080379A4
.L080379A2:
	movs r0, #1
.L080379A4:
	cmp r0, #0
	beq .L080379C4
	movs r2, #6
	ldrsb r2, [r1, r2]
	cmp r2, #0
	beq .L080379C4
	cmp r1, #0
	beq .L080379BA
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq .L080379BE
.L080379BA:
	movs r0, #0
	b .L080379C0
.L080379BE:
	movs r0, #1
.L080379C0:
	cmp r0, #0
	bne .L080379C8
.L080379C4:
	movs r0, #0
	b .L080379CE
.L080379C8:
	ldrb r1, [r1, #3]
	lsls r0, r2, #8
	adds r0, r1, r0
.L080379CE:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBallistaItemAt

	THUMB_FUNC_START GetSomeBallistaItemAt
GetSomeBallistaItemAt: @ 0x080379D4
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq .L080379E6
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq .L080379EA
.L080379E6:
	movs r0, #0
	b .L080379EC
.L080379EA:
	movs r0, #1
.L080379EC:
	cmp r0, #0
	beq .L080379F6
	ldrb r1, [r1, #3]
	cmp r1, #0
	bne .L080379FA
.L080379F6:
	movs r0, #0
	b .L08037A00
.L080379FA:
	movs r0, #0x80
	lsls r0, r0, #1
	adds r0, r1, r0
.L08037A00:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeBallistaItemAt

	THUMB_FUNC_START AddBallista
AddBallista: @ 0x08037A04
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	movs r2, #1
	movs r3, #0
	bl AddTrap
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemIid
	movs r6, #0
	strb r0, [r4, #3]
	adds r0, r5, #0
	bl CreateItem
	bl GetItemUses
	strb r0, [r4, #6]
	strb r6, [r4, #5]
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END AddBallista

	THUMB_FUNC_START RideBallista
RideBallista: @ 0x08037A34
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	adds r4, r0, #0
	movs r0, #1
	strb r0, [r4, #5]
	bl RefreshUnitSprites
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	bl GetTrap
	subs r4, r4, r0
	asrs r4, r4, #3
	strb r4, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END RideBallista

	THUMB_FUNC_START TryRemoveUnitFromBallista
TryRemoveUnitFromBallista: @ 0x08037A6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq .L08037A9C
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	ldr r1, [r4, #0xc]
	ldr r2, .L08037AA4  @ 0xFFFFF7FF
	ands r1, r2
	str r1, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #5]
	strb r1, [r4, #0x1c]
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
	bl RefreshUnitSprites
.L08037A9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08037AA4: .4byte 0xFFFFF7FF

	THUMB_FUNC_END TryRemoveUnitFromBallista

	THUMB_FUNC_START IsBallista
IsBallista: @ 0x08037AA8
	push {lr}
	cmp r0, #0
	beq .L08037AB8
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne .L08037AB8
	movs r0, #1
	b .L08037ABA
.L08037AB8:
	movs r0, #0
.L08037ABA:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsBallista

	THUMB_FUNC_START func_08037AC0
func_08037AC0: @ 0x08037AC0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq .L08037ACE
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq .L08037AD2
.L08037ACE:
	movs r0, #0
	b .L08037AD4
.L08037AD2:
	movs r0, #1
.L08037AD4:
	cmp r0, #0
	beq .L08037AE6
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #8
	adds r0, r0, r1
	b .L08037AE8
.L08037AE6:
	movs r0, #0
.L08037AE8:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08037AC0

	THUMB_FUNC_START func_08037AEC
func_08037AEC: @ 0x08037AEC
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq .L08037AFA
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq .L08037AFE
.L08037AFA:
	movs r0, #0
	b .L08037B00
.L08037AFE:
	movs r0, #1
.L08037B00:
	cmp r0, #0
	beq .L08037B08
	ldrb r0, [r1, #3]
	b .L08037B0A
.L08037B08:
	movs r0, #0
.L08037B0A:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08037AEC

	THUMB_FUNC_START GetBallistaItemUses
GetBallistaItemUses: @ 0x08037B10
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq .L08037B1E
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq .L08037B22
.L08037B1E:
	movs r0, #0
	b .L08037B24
.L08037B22:
	movs r0, #1
.L08037B24:
	cmp r0, #0
	beq .L08037B2E
	movs r0, #6
	ldrsb r0, [r1, r0]
	b .L08037B30
.L08037B2E:
	movs r0, #0
.L08037B30:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBallistaItemUses

	THUMB_FUNC_START func_08037B34
func_08037B34: @ 0x08037B34
	movs r1, #0
	strb r1, [r0, #5]
	bx lr

	THUMB_FUNC_END func_08037B34

	THUMB_FUNC_START func_08037B3C
func_08037B3C: @ 0x08037B3C
	movs r1, #1
	strb r1, [r0, #5]
	bx lr

	THUMB_FUNC_END func_08037B3C

.align 2, 0
