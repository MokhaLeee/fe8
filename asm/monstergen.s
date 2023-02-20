	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Random monster unit generation utility
	@ (for skirmishes and valni/lagdou)

	THUMB_FUNC_START func_080782A8
func_080782A8: @ 0x080782A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	bl RandNext_100
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r5, #0
	movs r2, #0
	cmp r2, r6
	bcs .L080782E2
.L080782C0:
	adds r1, r5, #0
	ldrb r0, [r4]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r1, r3
	bhi .L080782D6
	cmp r3, r5
	bcs .L080782D6
	adds r0, r2, #0
	b .L080782E4
.L080782D6:
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r6
	bcc .L080782C0
.L080782E2:
	movs r0, #0xff
.L080782E4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080782A8

	THUMB_FUNC_START GenerateMonsterLevel
GenerateMonsterLevel: @ 0x080782EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, .L08078320  @ gUnknown_088D2058
	movs r1, #7
	bl func_080782A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0xfe
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r0, #0
	bgt .L0807830C
	movs r4, #1
.L0807830C:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	ble .L08078316
	movs r4, #0x14
.L08078316:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08078320: .4byte gUnknown_088D2058

	THUMB_FUNC_END GenerateMonsterLevel

	THUMB_FUNC_START GenerateMonsterClass
GenerateMonsterClass: @ 0x08078324
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, .L0807834C  @ gUnknown_088D2060
	adds r4, r4, r0
	adds r0, r4, #5
	movs r1, #5
	bl func_080782A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r4, r0
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0807834C: .4byte gUnknown_088D2060

	THUMB_FUNC_END GenerateMonsterClass

	THUMB_FUNC_START GenerateMonsterItems
GenerateMonsterItems: @ 0x08078350
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r5, .L08078360  @ gUnknown_088D2440
	b .L080783F6
	.align 2, 0
.L08078360: .4byte gUnknown_088D2440
.L08078364:
	cmp r1, r2
	bne .L080783F4
	adds r0, r5, #0
	adds r0, #0xb
	movs r1, #5
	bl func_080782A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #1
	adds r1, r1, r0
	ldrb r4, [r1]
	adds r1, r5, #0
	adds r1, #0x15
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r7, .L080783EC  @ gUnknown_088D22C7
	adds r0, r0, r7
	movs r1, #5
	bl func_080782A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080783F0  @ gUnknown_088D21C8
	mov r8, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	adds r0, r0, r1
	add r0, r8
	ldrb r0, [r0]
	lsls r6, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #5
	bl func_080782A8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq .L080783E6
	adds r0, r5, #6
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq .L080783E6
	adds r0, r5, #0
	adds r0, #0x1a
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r0, r7
	movs r1, #5
	bl func_080782A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #2
	adds r1, r1, r4
	adds r0, r0, r1
	add r0, r8
	ldrb r0, [r0]
	orrs r6, r0
.L080783E6:
	adds r0, r6, #0
	b .L08078400
	.align 2, 0
.L080783EC: .4byte gUnknown_088D22C7
.L080783F0: .4byte gUnknown_088D21C8
.L080783F4:
	adds r5, #0x20
.L080783F6:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne .L08078364
	movs r0, #0
.L08078400:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GenerateMonsterItems

.align 2, 0
