	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Everything related to link arena multiplayer stuff

	@ Needs further splitting, but since I know nothing about
	@ all this, this will have to wait.

	THUMB_FUNC_START func_080415B0
func_080415B0: @ 0x080415B0
	push {r4, r5, lr}
	ldr r4, .L080415C4  @ gUnknown_03004F08
	ldr r3, [r4]
	cmp r3, #0
	beq .L080415CC
	cmp r3, #1
	beq .L08041638
	ldr r0, .L080415C8  @ gUnknown_030017E4
	ldr r0, [r0]
	b .L080416C6
	.align 2, 0
.L080415C4: .4byte gUnknown_03004F08
.L080415C8: .4byte gUnknown_030017E4
.L080415CC:
	ldr r0, .L0804161C  @ 0x04000134
	strh r3, [r0]
	ldr r2, .L08041620  @ 0x04000128
	ldr r0, .L08041624  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldr r1, .L08041628  @ 0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r0, .L0804162C  @ gSioBaudRate
	ldrb r0, [r0]
	movs r5, #0xc0
	lsls r5, r5, #7
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq .L080416C2
	ldr r1, .L08041630  @ gUnknown_030017E4
	movs r0, #4
	ands r2, r0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1]
	cmp r0, #0
	beq .L08041610
	movs r0, #1
	negs r0, r0
	str r0, [r1]
.L08041610:
	ldr r0, .L08041634  @ gUnknown_03004E74
	str r3, [r0]
	movs r0, #1
	str r0, [r4]
	b .L080416C2
	.align 2, 0
.L0804161C: .4byte 0x04000134
.L08041620: .4byte 0x04000128
.L08041624: .4byte gUnknown_085A92E0
.L08041628: .4byte 0x00001B78
.L0804162C: .4byte gSioBaudRate
.L08041630: .4byte gUnknown_030017E4
.L08041634: .4byte gUnknown_03004E74
.L08041638:
	ldr r0, .L0804166C  @ 0x04000128
	ldrh r0, [r0]
	adds r2, r0, #0
	ldr r0, .L08041670  @ gUnknown_03004E74
	ldr r0, [r0]
	ldr r3, .L08041674  @ gUnknown_085A92E0
	cmp r0, #0
	beq .L08041680
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne .L08041680
	ldr r0, [r3]
	ldrh r1, [r0, #0x14]
	ldr r0, .L08041678  @ 0x0000FFFF
	cmp r1, r0
	beq .L08041680
	ldr r1, .L0804167C  @ gUnknown_030017E4
	movs r0, #0x30
	ands r2, r0
	lsrs r0, r2, #4
	str r0, [r1]
	movs r1, #2
	str r1, [r4]
	b .L080416C6
	.align 2, 0
.L0804166C: .4byte 0x04000128
.L08041670: .4byte gUnknown_03004E74
.L08041674: .4byte gUnknown_085A92E0
.L08041678: .4byte 0x0000FFFF
.L0804167C: .4byte gUnknown_030017E4
.L08041680:
	ldr r2, .L080416A4  @ 0x04000128
	ldr r0, [r3]
	ldr r1, .L080416A8  @ 0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r0, .L080416AC  @ gUnknown_030017E4
	ldr r0, [r0]
	cmp r0, #0
	beq .L080416B4
	ldr r0, .L080416B0  @ gSioBaudRate
	ldrb r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r1, r3, #0
	b .L080416BE
	.align 2, 0
.L080416A4: .4byte 0x04000128
.L080416A8: .4byte 0x00001B78
.L080416AC: .4byte gUnknown_030017E4
.L080416B0: .4byte gSioBaudRate
.L080416B4:
	ldr r0, .L080416CC  @ gSioBaudRate
	ldrb r0, [r0]
	movs r5, #0xc1
	lsls r5, r5, #7
	adds r1, r5, #0
.L080416BE:
	orrs r0, r1
	strh r0, [r2]
.L080416C2:
	movs r0, #1
	negs r0, r0
.L080416C6:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080416CC: .4byte gSioBaudRate

	THUMB_FUNC_END func_080415B0

	THUMB_FUNC_START func_080416D0
func_080416D0: @ 0x080416D0
	ldr r0, .L080416DC  @ 0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
.L080416DC: .4byte 0x04000128

	THUMB_FUNC_END func_080416D0

	THUMB_FUNC_START func_080416E0
func_080416E0: @ 0x080416E0
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, .L08041708  @ gUnknown_085A92E0
	ldr r3, [r3]
	ldr r5, .L0804170C  @ 0x00001B78
	adds r4, r3, r5
	strh r0, [r4]
	ldr r4, .L08041710  @ 0x00001B7A
	adds r0, r3, r4
	strh r1, [r0]
	adds r5, #4
	adds r3, r3, r5
	strh r2, [r3]
	ldr r0, .L08041714  @ gSioBaudRate
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08041708: .4byte gUnknown_085A92E0
.L0804170C: .4byte 0x00001B78
.L08041710: .4byte 0x00001B7A
.L08041714: .4byte gSioBaudRate

	THUMB_FUNC_END func_080416E0

	THUMB_FUNC_START func_08041718
func_08041718: @ 0x08041718
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	ldr r0, .L08041868  @ gUnknown_03004E70
	movs r3, #0
	str r3, [r0]
	ldr r2, .L0804186C  @ gUnknown_085A92E0
	ldr r0, [r2]
	movs r1, #0
	strh r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	ldr r4, .L08041870  @ 0x00001B74
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x1e]
	ldr r0, [r2]
	strb r1, [r0, #0x1f]
	ldr r0, [r2]
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, [r2]
	strh r3, [r0, #0x30]
	ldr r0, .L08041874  @ gUnknown_030017F0
	mov r9, r0
	ldr r1, .L08041878  @ gUnknown_030017F2
	mov r8, r1
	adds r5, r2, #0
	movs r4, #0
.L0804176C:
	ldr r0, [r5]
	adds r0, #0xb
	adds r0, r0, r3
	strb r4, [r0]
	ldr r1, [r5]
	lsls r2, r3, #1
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r2
	strh r4, [r0]
	adds r1, #0x1a
	adds r1, r1, r3
	strb r4, [r1]
	ldr r0, [r5]
	adds r0, #0x26
	adds r0, r0, r2
	strh r4, [r0]
	adds r3, #1
	cmp r3, #3
	ble .L0804176C
	movs r3, #0
	ldr r5, .L0804187C  @ gUnknown_03004F20
	movs r2, #0
	ldr r4, .L0804186C  @ gUnknown_085A92E0
.L0804179C:
	adds r0, r3, r5
	strb r2, [r0]
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x32
	adds r0, r0, r1
	strh r2, [r0]
	adds r3, #1
	cmp r3, #0x7f
	ble .L0804179C
	movs r4, #0
	ldr r5, .L0804186C  @ gUnknown_085A92E0
	movs r1, #0
	movs r2, #0x9a
	lsls r2, r2, #1
.L080417BA:
	ldr r0, [r5]
	adds r0, r0, r2
	strb r1, [r0]
	strb r1, [r0, #4]
	movs r3, #0x7f
	adds r0, #0x89
.L080417C6:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge .L080417C6
	adds r2, #0x8c
	adds r4, #1
	cmp r4, #0x1f
	ble .L080417BA
	movs r4, #0
	ldr r2, .L0804186C  @ gUnknown_085A92E0
	mov ip, r2
	movs r5, #0
	movs r7, #0x8c
	ldr r6, .L08041880  @ 0x000012B4
.L080417E4:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r2, ip
	ldr r1, [r2]
	adds r1, r1, r0
	strb r5, [r1]
	strb r5, [r1, #4]
	adds r2, r4, #1
	movs r3, #0x7f
	adds r1, #0x89
.L080417FA:
	strb r5, [r1]
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge .L080417FA
	adds r4, r2, #0
	cmp r4, #0xf
	ble .L080417E4
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	mov r1, r9
	strh r0, [r1]
	movs r1, #0
	ldr r0, .L08041884  @ gUnknown_0203C624
	movs r3, #0x80
	lsls r3, r3, #2
.L0804181C:
	strh r1, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bne .L0804181C
	movs r4, #0
	ldr r2, .L08041888  @ gUnknown_030017F8
	mov r8, r2
	movs r5, #0
	ldr r0, .L0804188C  @ 0x000001FF
	mov ip, r0
	ldr r7, .L08041890  @ gUnknown_0203CA24
	ldr r6, .L08041894  @ gUnknown_03001800
.L08041836:
	lsls r0, r4, #1
	mov r1, r8
	adds r2, r0, r1
	adds r1, r0, r6
	strh r5, [r1]
	strh r5, [r2]
	adds r2, r4, #1
	adds r0, r0, r7
	mov r3, ip
	adds r3, #1
.L0804184A:
	strh r5, [r0]
	adds r0, #8
	subs r3, #1
	cmp r3, #0
	bne .L0804184A
	adds r4, r2, #0
	cmp r4, #3
	ble .L08041836
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08041868: .4byte gUnknown_03004E70
.L0804186C: .4byte gUnknown_085A92E0
.L08041870: .4byte 0x00001B74
.L08041874: .4byte gUnknown_030017F0
.L08041878: .4byte gUnknown_030017F2
.L0804187C: .4byte gUnknown_03004F20
.L08041880: .4byte 0x000012B4
.L08041884: .4byte gUnknown_0203C624
.L08041888: .4byte gUnknown_030017F8
.L0804188C: .4byte 0x000001FF
.L08041890: .4byte gUnknown_0203CA24
.L08041894: .4byte gUnknown_03001800

	THUMB_FUNC_END func_08041718

	THUMB_FUNC_START func_08041898
func_08041898: @ 0x08041898
	push {r4, lr}
	ldr r2, .L080418F4  @ gUnknown_085A92E0
	ldr r0, [r2]
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r2]
	strb r4, [r0, #1]
	ldr r1, [r2]
	movs r3, #0
	strh r4, [r1, #2]
	strh r4, [r1, #4]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r2]
	strb r3, [r0, #7]
	ldr r0, [r2]
	strb r3, [r0, #8]
	ldr r0, [r2]
	strb r3, [r0, #9]
	ldr r0, [r2]
	strb r3, [r0, #0xf]
	ldr r0, [r2]
	strb r3, [r0, #0x10]
	ldr r0, [r2]
	strb r3, [r0, #0x11]
	ldr r0, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r2]
	strb r3, [r0, #0xa]
	ldr r0, .L080418F8  @ 0x00006584
	movs r1, #3
	movs r2, #0x88
	bl func_080416E0
	movs r0, #0
	bl func_08042980
	bl func_08041718
	ldr r0, .L080418FC  @ gUnknown_030017EC
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080418F4: .4byte gUnknown_085A92E0
.L080418F8: .4byte 0x00006584
.L080418FC: .4byte gUnknown_030017EC

	THUMB_FUNC_END func_08041898

	THUMB_FUNC_START func_08041900
func_08041900: @ 0x08041900
	push {r4, lr}
	ldr r0, .L08041950  @ 0x04000134
	movs r3, #0
	strh r3, [r0]
	ldr r2, .L08041954  @ 0x04000128
	ldr r0, .L08041958  @ gSioBaudRate
	ldrb r0, [r0]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, .L0804195C  @ 0x0400010E
	strh r3, [r0]
	ldr r2, .L08041960  @ gUnknown_03004E74
	ldr r1, .L08041964  @ gUnknown_03004E70
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, .L08041968  @ gUnknown_03004F08
	str r0, [r1]
	ldr r1, .L0804196C  @ gUnknown_030017E4
	subs r0, #1
	str r0, [r1]
	ldr r1, .L08041970  @ OnSerialCommunication
	movs r0, #7
	bl SetIrqFunc
	ldr r1, .L08041974  @ SioReady
	movs r0, #6
	bl SetIrqFunc
	ldr r2, .L08041978  @ 0x04000200
	ldrh r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08041950: .4byte 0x04000134
.L08041954: .4byte 0x04000128
.L08041958: .4byte gSioBaudRate
.L0804195C: .4byte 0x0400010E
.L08041960: .4byte gUnknown_03004E74
.L08041964: .4byte gUnknown_03004E70
.L08041968: .4byte gUnknown_03004F08
.L0804196C: .4byte gUnknown_030017E4
.L08041970: .4byte OnSerialCommunication
.L08041974: .4byte SioReady
.L08041978: .4byte 0x04000200

	THUMB_FUNC_END func_08041900

	THUMB_FUNC_START func_0804197C
func_0804197C: @ 0x0804197C
	push {lr}
	ldr r1, .L080419C0  @ 0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r2, .L080419C4  @ gUnknown_03004E74
	ldr r1, .L080419C8  @ gUnknown_03004E70
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, .L080419CC  @ gUnknown_03004F08
	str r0, [r1]
	ldr r1, .L080419D0  @ gUnknown_030017E4
	subs r0, #1
	str r0, [r1]
	movs r0, #7
	movs r1, #0
	bl SetIrqFunc
	movs r0, #6
	movs r1, #0
	bl SetIrqFunc
	ldr r2, .L080419D4  @ 0x04000200
	ldrh r1, [r2]
	ldr r0, .L080419D8  @ 0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
.L080419C0: .4byte 0x04000134
.L080419C4: .4byte gUnknown_03004E74
.L080419C8: .4byte gUnknown_03004E70
.L080419CC: .4byte gUnknown_03004F08
.L080419D0: .4byte gUnknown_030017E4
.L080419D4: .4byte 0x04000200
.L080419D8: .4byte 0x0000FF3F

	THUMB_FUNC_END func_0804197C

	THUMB_FUNC_START OnSerialCommunication
OnSerialCommunication: @ 0x080419DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov r9, r0
	ldr r0, .L08041A70  @ gUnknown_03004E74
	movs r2, #1
	str r2, [r0]
	ldr r1, .L08041A74  @ gUnknown_085A92E0
	ldr r0, [r1]
	mov r3, r9
	strb r3, [r0, #0x1e]
	ldr r0, .L08041A78  @ gUnknown_03004E70
	str r2, [r0]
	ldr r0, [r1]
	strb r3, [r0, #8]
	ldr r0, .L08041A7C  @ 0x0400010E
	mov r2, r9
	strh r2, [r0]
	ldr r2, [r1]
	ldr r3, .L08041A80  @ 0x04000128
	ldrh r0, [r3]
	lsls r1, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	cmp r0, #6
	beq .L08041A20
	lsrs r0, r1, #0x14
	movs r1, #3
	ands r0, r1
	strb r0, [r2, #6]
.L08041A20:
	ldr r0, .L08041A84  @ 0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, .L08041A88  @ gSioBaudRate
	ldrb r0, [r0]
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r0, .L08041A8C  @ 0x00007FFF
	strh r0, [r3, #2]
	movs r5, #0
	ldr r3, .L08041A90  @ 0x0000FFFF
	mov sl, r3
	mov r4, sp
	movs r7, #0
.L08041A46:
	ldrh r0, [r4]
	cmp r0, #0
	beq .L08041A94
	cmp r0, sl
	beq .L08041A94
	ldr r2, .L08041A74  @ gUnknown_085A92E0
	ldr r0, [r2]
	adds r0, #0xb
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08041A62
	movs r0, #1
	strb r0, [r1]
.L08041A62:
	ldr r0, [r2]
	movs r1, #1
	lsls r1, r5
	ldrb r2, [r0, #8]
	orrs r1, r2
	strb r1, [r0, #8]
	b .L08041ACE
	.align 2, 0
.L08041A70: .4byte gUnknown_03004E74
.L08041A74: .4byte gUnknown_085A92E0
.L08041A78: .4byte gUnknown_03004E70
.L08041A7C: .4byte 0x0400010E
.L08041A80: .4byte 0x04000128
.L08041A84: .4byte 0x04000120
.L08041A88: .4byte gSioBaudRate
.L08041A8C: .4byte 0x00007FFF
.L08041A90: .4byte 0x0000FFFF
.L08041A94:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08041ACE
	ldr r0, .L08041AC0  @ gUnknown_085A92E0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, sl
	bne .L08041AC4
	adds r1, #0x1a
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b .L08041ACE
	.align 2, 0
.L08041AC0: .4byte gUnknown_085A92E0
.L08041AC4:
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
.L08041ACE:
	ldr r0, .L08041B24  @ gUnknown_085A92E0
	mov r8, r0
	ldr r6, [r0]
	adds r3, r6, #0
	adds r3, #0x12
	adds r3, r3, r7
	ldr r1, .L08041B28  @ gUnknown_0203CA24
	ldr r2, .L08041B2C  @ gUnknown_03001800
	adds r2, r7, r2
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r7, r0
	adds r0, r0, r1
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r0, [r4]
	ldr r1, .L08041B30  @ 0x0000FFFF
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, #1
	ldr r3, .L08041B34  @ 0x000001FF
	mov ip, r3
	mov r1, ip
	ands r0, r1
	strh r0, [r2]
	adds r4, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #3
	ble .L08041A46
	mov r4, r8
	adds r1, r6, #0
	ldrh r0, [r1, #4]
	cmp r0, #4
	bls .L08041BF0
	ldrb r0, [r1, #1]
	cmp r0, #1
	beq .L08041B38
	cmp r0, #3
	beq .L08041B98
	b .L08041BF0
	.align 2, 0
.L08041B24: .4byte gUnknown_085A92E0
.L08041B28: .4byte gUnknown_0203CA24
.L08041B2C: .4byte gUnknown_03001800
.L08041B30: .4byte 0x0000FFFF
.L08041B34: .4byte 0x000001FF
.L08041B38:
	ldr r0, .L08041B84  @ gUnknown_030017F2
	ldr r2, .L08041B88  @ gUnknown_030017F0
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r0, r3
	beq .L08041B60
	ldr r1, .L08041B8C  @ gUnknown_0203C624
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	adds r1, r3, #1
	mov r3, ip
	ands r1, r3
	strh r1, [r2]
	movs r1, #1
	bl func_08042568
.L08041B60:
	ldr r1, [r4]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L08041BF0
	ldr r0, .L08041B90  @ 0x00001B7C
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0
	beq .L08041BF0
	ldr r1, .L08041B94  @ 0x0400010C
	negs r0, r0
	str r0, [r1]
	adds r1, #2
	movs r0, #0xc3
	strh r0, [r1]
	b .L08041BF0
	.align 2, 0
.L08041B84: .4byte gUnknown_030017F2
.L08041B88: .4byte gUnknown_030017F0
.L08041B8C: .4byte gUnknown_0203C624
.L08041B90: .4byte 0x00001B7C
.L08041B94: .4byte 0x0400010C
.L08041B98:
	movs r0, #6
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq .L08041BB2
	adds r0, r6, #0
	adds r0, #0x30
	movs r1, #1
	bl func_08042568
	mov r2, r8
	ldr r1, [r2]
	ldr r0, .L08041C08  @ 0x00005FFF
	strh r0, [r1, #0x30]
.L08041BB2:
	movs r5, #0
	ldr r6, .L08041C0C  @ 0x00001288
	mov r4, sp
.L08041BB8:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08041BD6
	ldrh r0, [r4]
	cmp r0, r6
	beq .L08041BD6
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
.L08041BD6:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble .L08041BB8
	mov r3, r9
	cmp r3, #0
	bne .L08041BF0
	ldr r0, .L08041C10  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldr r1, .L08041C14  @ 0x00001B7E
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
.L08041BF0:
	ldr r1, .L08041C18  @ gUnknown_03004E70
	movs r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08041C08: .4byte 0x00005FFF
.L08041C0C: .4byte 0x00001288
.L08041C10: .4byte gUnknown_085A92E0
.L08041C14: .4byte 0x00001B7E
.L08041C18: .4byte gUnknown_03004E70

	THUMB_FUNC_END OnSerialCommunication

	THUMB_FUNC_START SioVSync_8041C1C
SioVSync_8041C1C: @ 0x08041C1C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, .L08041C58  @ gUnknown_085A92E0
	ldr r2, [r0]
	ldrh r1, [r2, #4]
	adds r5, r0, #0
	cmp r1, #4
	bhi .L08041C2E
	b .L08041D5C
.L08041C2E:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne .L08041C36
	b .L08041D5C
.L08041C36:
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	strb r0, [r2, #0x1e]
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	cmp r0, #6
	bne .L08041CC4
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #2
	beq .L08041C76
	cmp r0, #2
	bgt .L08041C5C
	cmp r0, #1
	beq .L08041C9C
	b .L08041CC4
	.align 2, 0
.L08041C58: .4byte gUnknown_085A92E0
.L08041C5C:
	cmp r0, #3
	bne .L08041CC4
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bls .L08041C76
	movs r0, #6
	ldrsb r0, [r1, r0]
	adds r1, #0xb
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bl SioLinkError
.L08041C76:
	ldr r4, .L08041CE8  @ gUnknown_085A92E0
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq .L08041C9C
	bl func_080421E4
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	bne .L08041C9C
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	strb r2, [r0]
	bl SioLinkError
.L08041C9C:
	movs r4, #0
	ldr r5, .L08041CE8  @ gUnknown_085A92E0
.L08041CA0:
	ldr r0, .L08041CE8  @ gUnknown_085A92E0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls .L08041CBE
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	bl SioLinkError
.L08041CBE:
	adds r4, #1
	cmp r4, #3
	ble .L08041CA0
.L08041CC4:
	adds r4, r5, #0
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r6, r0, #0
	cmp r6, #1
	bne .L08041D38
	ldrb r5, [r1, #0x10]
	cmp r5, #0
	bne .L08041D1A
	ldrb r0, [r1, #0x11]
	cmp r0, #0x3c
	bls .L08041CEC
	bl SioLinkError
	ldr r1, [r4]
	movs r0, #2
	strh r0, [r1, #4]
	b .L08041D5C
	.align 2, 0
.L08041CE8: .4byte gUnknown_085A92E0
.L08041CEC:
	mov r0, sp
	bl func_08042694
	cmp r0, #0
	beq .L08041D1A
	ldr r1, [sp]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl func_080422B8
	lsls r0, r0, #0x10
	cmp r0, #0
	ble .L08041D1A
	ldr r0, [r4]
	strb r5, [r0, #0x10]
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	adds r0, #0x2e
	strb r6, [r0]
.L08041D1A:
	ldr r2, .L08041D34  @ gUnknown_085A92E0
	ldr r1, [r2]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	ldr r4, [r2]
	ldrb r0, [r4, #0x10]
	movs r1, #0x26
	bl __umodsi3
	strb r0, [r4, #0x10]
	b .L08041D5C
	.align 2, 0
.L08041D34: .4byte gUnknown_085A92E0
.L08041D38:
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi .L08041D5C
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L08041D5C
	adds r0, r1, #0
	adds r0, #0x30
	movs r1, #1
	negs r1, r1
	bl func_08042568
	ldr r1, [r5]
	ldr r0, .L08041D64  @ 0x00005FFF
	strh r0, [r1, #0x30]
.L08041D5C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08041D64: .4byte 0x00005FFF

	THUMB_FUNC_END SioVSync_8041C1C

	THUMB_FUNC_START SioReady
SioReady: @ 0x08041D68
	ldr r1, .L08041D80  @ 0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r2, .L08041D84  @ 0x04000128
	ldr r0, .L08041D88  @ gSioBaudRate
	ldrb r0, [r0]
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
.L08041D80: .4byte 0x0400010E
.L08041D84: .4byte 0x04000128
.L08041D88: .4byte gSioBaudRate

	THUMB_FUNC_END SioReady

	THUMB_FUNC_START func_08041D8C
func_08041D8C: @ 0x08041D8C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	mov r1, sp
	ldr r0, .L08041DBC  @ gUnknown_080D8714
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L08041DC0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08041DB4
	lsls r0, r2, #2
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
.L08041DB4:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08041DBC: .4byte gUnknown_080D8714
.L08041DC0: .4byte gPlaySt

	THUMB_FUNC_END func_08041D8C

	THUMB_FUNC_START SioMain_8041DC4
SioMain_8041DC4: @ 0x08041DC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, .L08041E18  @ gUnknown_085A92E0
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq .L08041DD6
	b .L0804212E
.L08041DD6:
	movs r0, #6
	ldrsb r0, [r2, r0]
	lsls r1, r0
	ldrb r0, [r2, #0xf]
	orrs r1, r0
	strb r1, [r2, #0xf]
	movs r7, #0
.L08041DE4:
	lsls r4, r7, #0x18
	asrs r0, r4, #0x18
	ldr r5, .L08041E18  @ gUnknown_085A92E0
	ldr r1, [r5]
	adds r1, #0x32
	bl func_080423B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	adds r2, r7, #1
	mov r8, r2
	cmp r0, #0
	bne .L08041E02
	b .L08042126
.L08041E02:
	cmp r0, #0x16
	beq .L08041E30
	cmp r0, #0x16
	bgt .L08041E1C
	cmp r0, #4
	bne .L08041E10
	b .L08041F60
.L08041E10:
	cmp r0, #0xa
	beq .L08041E30
	b .L08042126
	.align 2, 0
.L08041E18: .4byte gUnknown_085A92E0
.L08041E1C:
	cmp r0, #0x2e
	beq .L08041E30
	cmp r0, #0x2e
	bgt .L08041E2A
	cmp r0, #0x2a
	beq .L08041E30
	b .L08042126
.L08041E2A:
	cmp r1, #0x80
	beq .L08041E30
	b .L08042126
.L08041E30:
	ldr r6, .L08041E88  @ gUnknown_085A92E0
	ldr r3, [r6]
	adds r5, r3, #0
	adds r5, #0x32
	ldrb r0, [r5]
	cmp r0, #0x8c
	beq .L08041EBC
	adds r1, r7, #1
	mov r8, r1
	cmp r0, #0x8f
	beq .L08041E48
	b .L08042126
.L08041E48:
	ldrb r1, [r5, #1]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne .L08041E54
	b .L08042126
.L08041E54:
	lsls r1, r1, #1
	adds r4, r3, #0
	adds r4, #0x26
	adds r1, r4, r1
	ldrh r0, [r5, #2]
	ldrh r1, [r1]
	cmp r0, r1
	beq .L08041E90
	ldr r0, .L08041E8C  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r5, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r5, #1]
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1]
	strh r1, [r0, #2]
	movs r1, #4
	bl func_080422B8
	b .L08041DE4
	.align 2, 0
.L08041E88: .4byte gUnknown_085A92E0
.L08041E8C: .4byte gUnknown_03004F0C
.L08041E90:
	adds r0, r5, #0
	bl func_08042620
	ldr r0, .L08041EB8  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldr r3, [r6]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r5, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r5, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	adds r1, #1
	strh r1, [r0, #2]
	b .L08041F50
	.align 2, 0
.L08041EB8: .4byte gUnknown_03004F0C
.L08041EBC:
	movs r2, #0
	lsls r1, r7, #4
	adds r0, r7, #1
	mov r8, r0
	ldr r0, .L08041F20  @ gUnknown_0203DA24
	subs r1, r1, r7
	adds r3, #0x38
	adds r0, #0xa1
	adds r1, r1, r0
.L08041ECE:
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #0xe
	ble .L08041ECE
	lsrs r0, r4, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08041EFA
	ldr r0, .L08041F24  @ gUnknown_085A92E0
	ldr r1, [r0]
	ldrb r0, [r1]
	ldrh r2, [r5, #2]
	cmp r0, r2
	bne .L08041EFA
	ldrh r0, [r1, #4]
	cmp r0, #5
	bls .L08041F08
.L08041EFA:
	lsrs r0, r4, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08041F2C
.L08041F08:
	ldr r0, .L08041F24  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq .L08041F16
	b .L08042126
.L08041F16:
	ldr r0, .L08041F28  @ gUnknown_03004F0C
	movs r1, #0x86
	strb r1, [r0]
	ldrb r1, [r2, #6]
	b .L08041F4C
	.align 2, 0
.L08041F20: .4byte gUnknown_0203DA24
.L08041F24: .4byte gUnknown_085A92E0
.L08041F28: .4byte gUnknown_03004F0C
.L08041F2C:
	ldr r0, .L08041F58  @ gUnknown_085A92E0
	ldr r1, [r0]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08041F3A
	b .L08042126
.L08041F3A:
	ldrb r0, [r1]
	movs r2, #0x85
	ldrh r5, [r5, #2]
	cmp r0, r5
	beq .L08041F46
	movs r2, #0x87
.L08041F46:
	ldr r0, .L08041F5C  @ gUnknown_03004F0C
	strb r2, [r0]
	ldrb r1, [r1, #6]
.L08041F4C:
	strb r1, [r0, #1]
	strh r7, [r0, #2]
.L08041F50:
	movs r1, #4
	bl func_080422B8
	b .L08042126
	.align 2, 0
.L08041F58: .4byte gUnknown_085A92E0
.L08041F5C: .4byte gUnknown_03004F0C
.L08041F60:
	ldr r0, [r5]
	adds r5, r0, #0
	adds r5, #0x32
	ldrb r0, [r5]
	subs r0, #0x84
	cmp r0, #0xa
	bls .L08041F70
	b .L08042126
.L08041F70:
	lsls r0, r0, #2
	ldr r1, .L08041F7C  @ .L08041F80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08041F7C: .4byte .L08041F80
.L08041F80: @ jump table
	.4byte .L0804211C @ case 0
	.4byte .L080420B4 @ case 1
	.4byte .L080420E0 @ case 2
	.4byte .L08042070 @ case 3
	.4byte .L08042126 @ case 4
	.4byte .L08041FAC @ case 5
	.4byte .L08042126 @ case 6
	.4byte .L08042126 @ case 7
	.4byte .L08042126 @ case 8
	.4byte .L08042126 @ case 9
	.4byte .L08041FC4 @ case 10
.L08041FAC:
	ldr r0, .L08041FC0  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r0, #1
	ldrb r5, [r5, #1]
	lsls r0, r5
	ldrb r1, [r2, #0xa]
	orrs r0, r1
	strb r0, [r2, #0xa]
	b .L08042122
	.align 2, 0
.L08041FC0: .4byte gUnknown_085A92E0
.L08041FC4:
	ldr r6, .L08042064  @ gUnknown_085A92E0
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne .L08041FD8
	b .L08042126
.L08041FD8:
	ldrb r2, [r5, #1]
	lsrs r4, r2, #4
	movs r1, #6
	ldrsb r1, [r3, r1]
	cmp r4, r1
	bne .L08041FE6
	b .L08042126
.L08041FE6:
	movs r0, #0xf
	ands r0, r2
	cmp r0, r1
	beq .L08041FF0
	b .L08042126
.L08041FF0:
	ldrh r0, [r3, #0x24]
	adds r0, #1
	ldrh r1, [r5, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	beq .L08042000
	b .L08042126
.L08042000:
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r3, #0xf]
	orrs r0, r1
	strb r0, [r3, #0xf]
	ldr r0, .L08042068  @ gUnknown_030017E8
	ldr r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0xf]
	strb r0, [r1]
	ldr r4, [r6]
	ldrb r0, [r4, #0xf]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	beq .L08042022
	b .L08042126
.L08042022:
	ldrh r0, [r4, #0x24]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x24]
	ldr r2, .L0804206C  @ 0x00001B74
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	strb r3, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r6]
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x11]
	strb r3, [r0, #0x10]
	b .L08042126
	.align 2, 0
.L08042064: .4byte gUnknown_085A92E0
.L08042068: .4byte gUnknown_030017E8
.L0804206C: .4byte 0x00001B74
.L08042070:
	ldrb r0, [r5, #2]
	bl func_08042194
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne .L08042126
	ldr r4, .L080420B0  @ gUnknown_085A92E0
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	movs r3, #2
	strb r3, [r0]
	ldr r1, [r4]
	ldrh r2, [r1, #2]
	movs r0, #0x30
	ands r0, r2
	lsrs r0, r0, #4
	adds r1, #0xb
	adds r1, r1, r0
	strb r3, [r1]
	ldr r0, [r4]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	strb r3, [r0]
	ldr r1, [r4]
	b .L080420D4
	.align 2, 0
.L080420B0: .4byte gUnknown_085A92E0
.L080420B4:
	ldrb r0, [r5, #2]
	bl func_08042194
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne .L08042126
	ldr r2, .L080420DC  @ gUnknown_085A92E0
	ldr r0, [r2]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r2]
.L080420D4:
	movs r0, #6
	strh r0, [r1, #4]
	b .L08042126
	.align 2, 0
.L080420DC: .4byte gUnknown_085A92E0
.L080420E0:
	ldr r0, .L08042114  @ gUnknown_0203DA24
	adds r0, #0x9c
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	movs r4, #0
	movs r2, #1
	strb r2, [r0]
	ldr r3, .L08042118  @ gUnknown_085A92E0
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	ldr r1, [r3]
	ldrh r0, [r5, #2]
	lsls r2, r0
	ldrb r0, [r1, #9]
	orrs r2, r0
	strb r2, [r1, #9]
	ldr r0, [r3]
	adds r0, #0x1a
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	strb r4, [r0]
	b .L08042122
	.align 2, 0
.L08042114: .4byte gUnknown_0203DA24
.L08042118: .4byte gUnknown_085A92E0
.L0804211C:
	ldrb r0, [r5, #1]
	bl func_08041D8C
.L08042122:
	adds r7, #1
	mov r8, r7
.L08042126:
	mov r7, r8
	cmp r7, #3
	bgt .L0804212E
	b .L08041DE4
.L0804212E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END SioMain_8041DC4

	THUMB_FUNC_START func_08042138
func_08042138: @ 0x08042138
	bx lr

	THUMB_FUNC_END func_08042138

	THUMB_FUNC_START func_0804213C
func_0804213C: @ 0x0804213C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
.L08042142:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08042158
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L08042158:
	adds r4, #1
	cmp r4, #3
	ble .L08042142
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804213C

	THUMB_FUNC_START func_08042168
func_08042168: @ 0x08042168
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
.L0804216E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_080421BC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08042184
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L08042184:
	adds r4, #1
	cmp r4, #3
	ble .L0804216E
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08042168

	THUMB_FUNC_START func_08042194
func_08042194: @ 0x08042194
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080421B0  @ gUnknown_085A92E0
	ldr r1, [r1]
	ldrb r1, [r1, #9]
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne .L080421B4
	movs r0, #0
	b .L080421B6
	.align 2, 0
.L080421B0: .4byte gUnknown_085A92E0
.L080421B4:
	movs r0, #1
.L080421B6:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08042194

	THUMB_FUNC_START func_080421BC
func_080421BC: @ 0x080421BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, .L080421D8  @ gUnknown_085A92E0
	ldr r1, [r1]
	ldrb r1, [r1, #8]
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne .L080421DC
	movs r0, #0
	b .L080421DE
	.align 2, 0
.L080421D8: .4byte gUnknown_085A92E0
.L080421DC:
	movs r0, #1
.L080421DE:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080421BC

	THUMB_FUNC_START func_080421E4
func_080421E4: @ 0x080421E4
	push {r4, lr}
	ldr r2, .L08042210  @ gUnknown_085A92E0
	ldr r3, [r2]
	ldrh r1, [r3, #2]
	movs r0, #0
	strh r0, [r3, #2]
	movs r4, #8
	ands r1, r4
	cmp r1, #0
	bne .L08042218
	ldr r0, .L08042214  @ 0x04000128
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne .L08042218
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b .L08042220
	.align 2, 0
.L08042210: .4byte gUnknown_085A92E0
.L08042214: .4byte 0x04000128
.L08042218:
	ldr r0, [r2]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
.L08042220:
	ldr r0, [r2]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi .L0804222E
	movs r0, #1
	b .L08042230
.L0804222E:
	movs r0, #0
.L08042230:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080421E4

	THUMB_FUNC_START func_08042238
func_08042238: @ 0x08042238
	push {lr}
	ldr r0, .L08042254  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldr r2, .L08042258  @ 0x00001B75
	adds r1, r0, r2
	ldr r3, .L0804225C  @ 0x00001B74
	adds r2, r0, r3
	ldrb r0, [r1]
	ldrb r3, [r2]
	cmp r0, r3
	bcs .L08042260
	ldrb r1, [r2]
	subs r1, #0x20
	b .L08042264
	.align 2, 0
.L08042254: .4byte gUnknown_085A92E0
.L08042258: .4byte 0x00001B75
.L0804225C: .4byte 0x00001B74
.L08042260:
	ldrb r0, [r1]
	ldrb r1, [r2]
.L08042264:
	subs r0, r0, r1
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08042238

	THUMB_FUNC_START func_0804226C
func_0804226C: @ 0x0804226C
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r4, .L080422AC  @ gUnknown_085A92E0
	ldr r0, [r4]
	adds r3, r0, #0
	adds r3, #0xb
.L0804227A:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne .L08042284
	adds r2, #1
.L08042284:
	adds r1, #1
	cmp r1, #3
	ble .L0804227A
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bne .L08042296
	cmp r2, #2
	beq .L080422A6
.L08042296:
	cmp r0, #7
	bne .L0804229E
	cmp r2, #3
	beq .L080422A6
.L0804229E:
	cmp r0, #0xf
	bne .L080422B0
	cmp r2, #4
	bne .L080422B0
.L080422A6:
	movs r0, #1
	b .L080422B2
	.align 2, 0
.L080422AC: .4byte gUnknown_085A92E0
.L080422B0:
	movs r0, #0
.L080422B2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804226C

	THUMB_FUNC_START func_080422B8
func_080422B8: @ 0x080422B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, .L08042358  @ gUnknown_030017F2
	ldrh r3, [r0]
	cmp r5, #0x80
	bhi .L08042350
	lsrs r5, r1, #0x11
	ldr r1, .L0804235C  @ 0x00004FFF
	adds r4, r5, r1
	ldr r2, .L08042360  @ gUnknown_0203C624
	lsls r0, r3, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r3, #1
	ldr r6, .L08042364  @ 0x000001FF
	ands r3, r6
	ldr r0, .L08042368  @ gUnknown_030017F0
	ldrh r1, [r0]
	mov ip, r2
	mov sl, r0
	cmp r3, r1
	beq .L08042350
	lsls r0, r3, #1
	add r0, ip
	strh r5, [r0]
	adds r3, #1
	ands r3, r6
	lsls r6, r3, #1
	adds r7, r3, #1
	cmp r3, r1
	beq .L08042350
	movs r2, #0
	cmp r2, r5
	bge .L0804232C
	mov r3, r9
.L0804230E:
	ldrh r0, [r3]
	adds r2, #1
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mvns r1, r1
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r3, #2
	cmp r2, r5
	blt .L0804230E
.L0804232C:
	mov r1, ip
	adds r0, r6, r1
	strh r4, [r0]
	ldr r4, .L08042364  @ 0x000001FF
	adds r3, r4, #0
	ands r3, r7
	mov r2, sl
	ldrh r1, [r2]
	cmp r3, r1
	beq .L08042350
	lsls r0, r3, #1
	add r0, ip
	mov r2, r8
	strh r2, [r0]
	adds r3, #1
	ands r3, r4
	cmp r3, r1
	bne .L0804236C
.L08042350:
	movs r0, #1
	negs r0, r0
	b .L0804239C
	.align 2, 0
.L08042358: .4byte gUnknown_030017F2
.L0804235C: .4byte 0x00004FFF
.L08042360: .4byte gUnknown_0203C624
.L08042364: .4byte 0x000001FF
.L08042368: .4byte gUnknown_030017F0
.L0804236C:
	movs r2, #0
	cmp r2, r5
	bge .L08042394
	mov r8, ip
	adds r7, r4, #0
	mov r4, r9
	mov r6, sl
.L0804237A:
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r3, #1
	ands r3, r7
	ldrh r0, [r6]
	cmp r3, r0
	beq .L08042350
	adds r4, #2
	adds r2, #1
	cmp r2, r5
	blt .L0804237A
.L08042394:
	ldr r1, .L080423AC  @ gUnknown_030017F2
	strh r3, [r1]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
.L0804239C:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080423AC: .4byte gUnknown_030017F2

	THUMB_FUNC_END func_080422B8

	THUMB_FUNC_START func_080423B0
func_080423B0: @ 0x080423B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	movs r3, #0
	str r3, [sp, #0xc]
	ldr r2, .L08042428  @ gUnknown_030017F8
	lsrs r7, r0, #0x18
	str r7, [sp]
	asrs r3, r0, #0x17
	adds r4, r3, r2
	ldr r0, .L0804242C  @ gUnknown_03001800
	adds r7, r3, r0
	ldrh r1, [r4]
	ldrh r5, [r7]
	mov sl, r2
	cmp r1, r5
	beq .L080424B2
	ldr r0, .L08042430  @ gUnknown_0203CA24
	ldrh r2, [r4]
	lsls r1, r2, #3
	adds r1, r3, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r6, .L08042434  @ 0x00004FFF
	mov r9, r0
	cmp r1, r6
	beq .L0804243C
	cmp r2, r5
	beq .L0804246A
	adds r1, r3, #0
	adds r3, r4, #0
	mov ip, r6
	adds r4, r7, #0
	ldr r6, .L08042438  @ 0x000001FF
	mov r5, r9
.L08042404:
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r6
	strh r0, [r3]
	ldrh r2, [r3]
	lsls r0, r2, #3
	adds r0, r1, r0
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, ip
	bne .L08042420
	ldrh r0, [r4]
	cmp r2, r0
	bne .L0804243C
.L08042420:
	ldrh r7, [r4]
	cmp r2, r7
	bne .L08042404
	b .L0804246A
	.align 2, 0
.L08042428: .4byte gUnknown_030017F8
.L0804242C: .4byte gUnknown_03001800
.L08042430: .4byte gUnknown_0203CA24
.L08042434: .4byte 0x00004FFF
.L08042438: .4byte 0x000001FF
.L0804243C:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	asrs r1, r0, #0x17
	ldr r3, .L0804245C  @ gUnknown_03001800
	adds r2, r1, r3
	add r1, sl
	ldrh r2, [r2]
	ldrh r1, [r1]
	adds r4, r0, #0
	cmp r2, r1
	bcs .L08042460
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r2, r7
	subs r0, r0, r1
	b .L08042462
	.align 2, 0
.L0804245C: .4byte gUnknown_03001800
.L08042460:
	subs r0, r2, r1
.L08042462:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #4
	bhi .L08042470
.L0804246A:
	movs r0, #4
	negs r0, r0
	b .L08042558
.L08042470:
	asrs r0, r4, #0x17
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #1
	ldr r0, .L08042484  @ 0x000001FF
	cmp r3, r0
	bgt .L08042488
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	b .L0804248A
	.align 2, 0
.L08042484: .4byte 0x000001FF
.L08042488:
	movs r0, #0
.L0804248A:
	asrs r4, r4, #0x17
	lsls r0, r0, #3
	adds r0, r4, r0
	add r0, r9
	ldrh r6, [r0]
	cmp r6, #0x80
	bls .L080424AC
	mov r1, sl
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, .L080424A8  @ 0x000001FF
	ands r1, r2
	strh r1, [r0]
	b .L0804246A
	.align 2, 0
.L080424A8: .4byte 0x000001FF
.L080424AC:
	adds r0, r6, #6
	cmp r0, r1
	ble .L080424B8
.L080424B2:
	movs r0, #2
	negs r0, r0
	b .L08042558
.L080424B8:
	mov r3, sl
	adds r2, r4, r3
	ldrh r0, [r2]
	adds r0, #2
	ldr r7, .L0804254C  @ 0x000001FF
	ands r0, r7
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, r9
	ldrh r0, [r0]
	str r0, [sp, #8]
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, r9
	ldrh r0, [r0]
	mov sl, r0
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldr r0, .L08042550  @ 0x00004FFF
	add r0, r8
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r3, #0
	cmp r3, r6
	bge .L0804253A
	mov ip, r4
	adds r4, r2, #0
	ldr r5, [sp, #4]
.L08042502:
	ldrh r0, [r4]
	lsls r0, r0, #3
	add r0, ip
	add r0, r9
	ldrh r2, [r0]
	adds r3, #1
	adds r1, r2, #0
	muls r1, r3, r1
	mov r7, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mvns r1, r1
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	strh r2, [r5]
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, .L0804254C  @ 0x000001FF
	ands r0, r1
	strh r0, [r4]
	adds r5, #2
	cmp r3, r6
	blt .L08042502
.L0804253A:
	ldr r3, [sp, #8]
	cmp r8, r3
	bne .L08042546
	ldr r7, [sp, #0xc]
	cmp r7, sl
	beq .L08042554
.L08042546:
	movs r0, #3
	negs r0, r0
	b .L08042558
	.align 2, 0
.L0804254C: .4byte 0x000001FF
.L08042550: .4byte 0x00004FFF
.L08042554:
	lsls r0, r6, #0x11
	asrs r0, r0, #0x10
.L08042558:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080423B0

	THUMB_FUNC_START func_08042568
func_08042568: @ 0x08042568
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08042580  @ gUnknown_085A92E0
	ldr r3, [r0]
	movs r2, #6
	ldrsb r2, [r3, r2]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne .L08042584
	adds r0, r2, #0
	b .L080425A6
	.align 2, 0
.L08042580: .4byte gUnknown_085A92E0
.L08042584:
	ldr r2, .L080425AC  @ 0x04000128
	ldrh r0, [r4]
	strh r0, [r2, #2]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne .L080425A4
	cmp r1, #0
	bge .L080425A4
	ldr r0, .L080425B0  @ gSioBaudRate
	ldrb r0, [r0]
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
.L080425A4:
	movs r0, #0
.L080425A6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080425AC: .4byte 0x04000128
.L080425B0: .4byte gSioBaudRate

	THUMB_FUNC_END func_08042568

	THUMB_FUNC_START func_080425B4
func_080425B4: @ 0x080425B4
	push {r4, r5, r6, lr}
	adds r2, r1, #0
	ldr r3, .L080425DC  @ gUnknown_030017F8
	ldr r1, .L080425E0  @ gUnknown_03001800
	ldrh r0, [r3]
	ldrh r1, [r1]
	cmp r0, r1
	bne .L080425E8
	ldr r1, .L080425E4  @ 0x00007FFF
	adds r0, r1, #0
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	strh r0, [r2, #2]
	movs r0, #2
	negs r0, r0
	b .L08042610
	.align 2, 0
.L080425DC: .4byte gUnknown_030017F8
.L080425E0: .4byte gUnknown_03001800
.L080425E4: .4byte 0x00007FFF
.L080425E8:
	movs r4, #0
	ldr r6, .L08042618  @ gUnknown_0203CA24
	ldr r5, .L0804261C  @ 0x000001FF
.L080425EE:
	lsls r1, r4, #1
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble .L080425EE
	movs r0, #0
.L08042610:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L08042618: .4byte gUnknown_0203CA24
.L0804261C: .4byte 0x000001FF

	THUMB_FUNC_END func_080425B4

	THUMB_FUNC_START func_08042620
func_08042620: @ 0x08042620
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, .L08042688  @ gUnknown_085A92E0
	ldr r2, [r3]
	ldr r1, .L0804268C  @ 0x00001B77
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	ldr r1, .L08042690  @ 0x000012B4
	adds r0, r0, r1
	adds r1, r2, r0
	ldrb r0, [r4]
	strb r0, [r1, #4]
	ldrb r0, [r4, #1]
	strb r0, [r1, #5]
	ldrh r0, [r4, #2]
	strh r0, [r1, #6]
	ldrh r0, [r4, #4]
	strh r0, [r1, #8]
	movs r2, #0
	adds r6, r3, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bge .L08042668
	adds r5, r1, #0
	adds r5, #0xa
	adds r3, r4, #6
.L08042658:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrh r1, [r4, #4]
	cmp r2, r1
	blt .L08042658
.L08042668:
	ldr r1, [r6]
	ldr r2, .L0804268C  @ 0x00001B77
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08042688: .4byte gUnknown_085A92E0
.L0804268C: .4byte 0x00001B77
.L08042690: .4byte 0x000012B4

	THUMB_FUNC_END func_08042620

	THUMB_FUNC_START func_08042694
func_08042694: @ 0x08042694
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, .L080426E0  @ gUnknown_085A92E0
	ldr r3, [r0]
	ldr r0, .L080426E4  @ 0x00001B74
	adds r4, r3, r0
	ldrb r0, [r4]
	movs r6, #0x8c
	adds r5, r0, #0
	muls r5, r6, r5
	adds r0, r3, r5
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x8f
	bne .L080426EC
	ldr r1, .L080426E8  @ gUnknown_030017E8
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r3, r0
	str r0, [r1]
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r3, r0
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r7]
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r2
	adds r0, r3, r0
	adds r0, #4
	b .L080426EE
	.align 2, 0
.L080426E0: .4byte gUnknown_085A92E0
.L080426E4: .4byte 0x00001B74
.L080426E8: .4byte gUnknown_030017E8
.L080426EC:
	movs r0, #0
.L080426EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08042694

	THUMB_FUNC_START func_080426F4
func_080426F4: @ 0x080426F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r6, .L08042790  @ gUnknown_030017EC
	movs r0, #1
	str r0, [r6]
	ldr r4, .L08042794  @ gUnknown_085A92E0
	ldr r1, [r4]
	ldr r2, .L08042798  @ 0x00001B75
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r5, #0x8c
	muls r0, r5, r0
	adds r1, r1, r0
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r1, r1, r3
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r2, r1, r2
	ldrb r0, [r2]
	muls r0, r5, r0
	adds r0, r0, r3
	adds r5, r1, r0
	adds r2, r5, #4
	movs r0, #0x8f
	strb r0, [r5, #4]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r2, #1]
	ldr r1, [r4]
	ldrh r0, [r1, #0x22]
	strh r0, [r2, #2]
	strh r7, [r2, #4]
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	movs r3, #0
	mov r8, r6
	adds r6, r4, #0
	cmp r3, r7
	bcs .L08042766
	adds r2, #6
.L08042752:
	adds r1, r2, r3
	mov r4, ip
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r7
	bcc .L08042752
.L08042766:
	ldr r1, [r6]
	ldr r3, .L08042798  @ 0x00001B75
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r2, r0, #1
	movs r4, #0
	strb r2, [r1]
	ldr r2, [r6]
	adds r2, r2, r3
	ldrb r3, [r2]
	movs r1, #0x1f
	ands r1, r3
	strb r1, [r2]
	mov r1, r8
	str r4, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08042790: .4byte gUnknown_030017EC
.L08042794: .4byte gUnknown_085A92E0
.L08042798: .4byte 0x00001B75

	THUMB_FUNC_END func_080426F4

	THUMB_FUNC_START func_0804279C
func_0804279C: @ 0x0804279C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	str r1, [sp]
	mov sl, r2
.L080427AE:
	ldr r0, .L080427DC  @ gUnknown_085A92E0
	mov r8, r0
	ldr r2, [r0]
	ldr r7, .L080427E0  @ 0x00001B76
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	ldr r1, .L080427E4  @ 0x000012B4
	adds r0, r0, r1
	adds r5, r2, r0
	adds r6, r5, #4
	ldrb r0, [r5, #4]
	cmp r0, #0x8f
	bne .L080427D6
	ldrb r1, [r6, #1]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne .L080427E8
.L080427D6:
	movs r0, #0
	b .L08042910
	.align 2, 0
.L080427DC: .4byte gUnknown_085A92E0
.L080427E0: .4byte 0x00001B76
.L080427E4: .4byte 0x000012B4
.L080427E8:
	lsls r0, r1, #1
	adds r3, r2, #0
	adds r3, #0x26
	adds r0, r3, r0
	ldrh r1, [r6, #2]
	ldrh r0, [r0]
	cmp r1, r0
	beq .L08042834
	ldr r0, .L08042830  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldrb r1, [r2, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl func_080422B8
	strb r4, [r5, #4]
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r7
	b .L080428A2
	.align 2, 0
.L08042830: .4byte gUnknown_03004F0C
.L08042834:
	movs r2, #0
	ldrh r1, [r6, #4]
	cmp r2, r1
	bcs .L08042856
	adds r3, r5, #0
	adds r3, #0xa
.L08042840:
	mov r0, r9
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r6, #4]
	cmp r2, r1
	bcc .L08042840
.L08042856:
	mov r0, sl
	cmp r0, #0
	beq .L080428B8
	mov r0, r9
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080428B8
	ldr r0, .L080428AC  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldr r5, .L080428B0  @ gUnknown_085A92E0
	ldr r3, [r5]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl func_080422B8
	strb r4, [r6]
	ldr r1, [r5]
	ldr r2, .L080428B4  @ 0x00001B76
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r2
.L080428A2:
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	b .L080427AE
	.align 2, 0
.L080428AC: .4byte gUnknown_03004F0C
.L080428B0: .4byte gUnknown_085A92E0
.L080428B4: .4byte 0x00001B76
.L080428B8:
	movs r0, #0
	strb r0, [r6]
	ldrb r5, [r6, #1]
	ldr r4, .L08042920  @ gUnknown_085A92E0
	ldr r2, [r4]
	lsls r0, r5, #1
	adds r1, r2, #0
	adds r1, #0x26
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, .L08042924  @ 0x00001B76
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	ldr r1, [sp]
	strb r5, [r1]
	ldr r0, .L08042928  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldr r3, [r4]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	strh r1, [r0, #2]
	movs r1, #4
	bl func_080422B8
	ldrh r0, [r6, #4]
.L08042910:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08042920: .4byte gUnknown_085A92E0
.L08042924: .4byte 0x00001B76
.L08042928: .4byte gUnknown_03004F0C

	THUMB_FUNC_END func_0804279C

	THUMB_FUNC_START func_0804292C
func_0804292C: @ 0x0804292C
	push {lr}
	sub sp, #4
	ldr r1, .L08042968  @ 0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, .L0804296C  @ gUnknown_085A92E0
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl func_08042568
	ldr r1, .L08042970  @ gUnknown_030017F2
	ldr r0, .L08042974  @ gUnknown_030017F0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, .L08042978  @ gUnknown_030017F8
	ldr r2, .L0804297C  @ gUnknown_03001800
	movs r1, #3
.L08042954:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L08042954
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08042968: .4byte 0x00007FFF
.L0804296C: .4byte gUnknown_085A92E0
.L08042970: .4byte gUnknown_030017F2
.L08042974: .4byte gUnknown_030017F0
.L08042978: .4byte gUnknown_030017F8
.L0804297C: .4byte gUnknown_03001800

	THUMB_FUNC_END func_0804292C

	THUMB_FUNC_START func_08042980
func_08042980: @ 0x08042980
	ldr r1, .L0804298C  @ gUnknown_085A92E0
	ldr r1, [r1]
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0804298C: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08042980

	THUMB_FUNC_START func_08042990
func_08042990: @ 0x08042990
	push {lr}
	sub sp, #4
	ldr r1, .L080429E4  @ 0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r1, .L080429E8  @ gUnknown_085A92E0
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #1]
	ldr r0, [r1]
	ldr r1, .L080429EC  @ 0x00001B7C
	adds r0, r0, r1
	strh r2, [r0]
	mov r0, sp
	movs r1, #1
	bl func_08042568
	ldr r1, .L080429F0  @ gUnknown_030017F2
	ldr r0, .L080429F4  @ gUnknown_030017F0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, .L080429F8  @ gUnknown_030017F8
	ldr r2, .L080429FC  @ gUnknown_03001800
	movs r1, #3
.L080429C0:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L080429C0
	ldr r0, .L080429E8  @ gUnknown_085A92E0
	ldr r2, [r0]
	ldr r0, .L08042A00  @ 0x00001B7E
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L080429E4: .4byte 0x00007FFF
.L080429E8: .4byte gUnknown_085A92E0
.L080429EC: .4byte 0x00001B7C
.L080429F0: .4byte gUnknown_030017F2
.L080429F4: .4byte gUnknown_030017F0
.L080429F8: .4byte gUnknown_030017F8
.L080429FC: .4byte gUnknown_03001800
.L08042A00: .4byte 0x00001B7E

	THUMB_FUNC_END func_08042990

	THUMB_FUNC_START func_08042A04
func_08042A04: @ 0x08042A04
	push {r4, lr}
	sub sp, #4
	ldr r1, .L08042A60  @ 0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, .L08042A64  @ gUnknown_085A92E0
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, .L08042A68  @ 0x00001B7C
	adds r0, r0, r1
	movs r1, #0x88
	strh r1, [r0]
	ldr r1, .L08042A6C  @ gUnknown_030017F2
	ldr r0, .L08042A70  @ gUnknown_030017F0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, .L08042A74  @ gUnknown_030017F8
	ldr r2, .L08042A78  @ gUnknown_03001800
	movs r1, #3
.L08042A34:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L08042A34
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	negs r1, r1
	mov r0, sp
	bl func_08042568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08042A60: .4byte 0x00002586
.L08042A64: .4byte gUnknown_085A92E0
.L08042A68: .4byte 0x00001B7C
.L08042A6C: .4byte gUnknown_030017F2
.L08042A70: .4byte gUnknown_030017F0
.L08042A74: .4byte gUnknown_030017F8
.L08042A78: .4byte gUnknown_03001800

	THUMB_FUNC_END func_08042A04

	THUMB_FUNC_START func_08042A7C
func_08042A7C: @ 0x08042A7C
	push {r4, lr}
	sub sp, #4
	ldr r1, .L08042AD8  @ 0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, .L08042ADC  @ gUnknown_085A92E0
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, .L08042AE0  @ 0x00001B7C
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0]
	ldr r1, .L08042AE4  @ gUnknown_030017F2
	ldr r0, .L08042AE8  @ gUnknown_030017F0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, .L08042AEC  @ gUnknown_030017F8
	ldr r2, .L08042AF0  @ gUnknown_03001800
	movs r1, #3
.L08042AAC:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge .L08042AAC
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	negs r1, r1
	mov r0, sp
	bl func_08042568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08042AD8: .4byte 0x00002586
.L08042ADC: .4byte gUnknown_085A92E0
.L08042AE0: .4byte 0x00001B7C
.L08042AE4: .4byte gUnknown_030017F2
.L08042AE8: .4byte gUnknown_030017F0
.L08042AEC: .4byte gUnknown_030017F8
.L08042AF0: .4byte gUnknown_03001800

	THUMB_FUNC_END func_08042A7C

	THUMB_FUNC_START func_08042AF4
func_08042AF4: @ 0x08042AF4
	ldr r0, .L08042B00  @ gUnknown_030017F2
	ldr r1, .L08042B04  @ gUnknown_030017F0
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
.L08042B00: .4byte gUnknown_030017F2
.L08042B04: .4byte gUnknown_030017F0

	THUMB_FUNC_END func_08042AF4

	THUMB_FUNC_START func_08042B08
func_08042B08: @ 0x08042B08
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, .L08042B64  @ gUnknown_085A92E0
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r5]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl func_08041718
	mov r1, sp
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	mov r2, sp
	ldrh r1, [r4, #0x36]
	lsrs r0, r1, #8
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #2]
	mov r1, sp
	adds r4, #0x3a
	ldrb r0, [r4]
	strb r0, [r1, #3]
	mov r0, sp
	movs r1, #4
	bl func_080426F4
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08042B64: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08042B08

	THUMB_FUNC_START func_08042B68
func_08042B68: @ 0x08042B68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq .L08042B76
	bl _call_via_r1
.L08042B76:
	ldr r5, .L08042BD4  @ gUnknown_085A92E0
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r6, [r0]
	cmp r6, #0
	bne .L08042BCC
	ldrh r2, [r4, #0x38]
	ldrh r0, [r1, #0x24]
	subs r0, #1
	cmp r2, r0
	beq .L08042BAA
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
.L08042BAA:
	ldr r0, [r4, #0x30]
	movs r1, #0x7a
	bl func_080426F4
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	bcc .L08042BCC
	adds r0, r4, #0
	bl Proc_Break
.L08042BCC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08042BD4: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08042B68

	THUMB_FUNC_START func_08042BD8
func_08042BD8: @ 0x08042BD8
	push {lr}
	ldr r2, .L08042BFC  @ gUnknown_085A92E0
	ldr r1, [r2]
	adds r3, r1, #0
	adds r3, #0x2e
	movs r0, #0
	strb r0, [r3]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl func_08041718
	pop {r0}
	bx r0
	.align 2, 0
.L08042BFC: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08042BD8

	THUMB_FUNC_START func_08042C00
func_08042C00: @ 0x08042C00
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08042C3C
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x34
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r4, #0
	adds r1, #0x3a
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08042C3C:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08042C00

	THUMB_FUNC_START func_08042C44
func_08042C44: @ 0x08042C44
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, .L08042C80  @ gBuf
	ldrh r1, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	subs r0, #1
	cmp r1, r0
	bge .L08042C84
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r2, #0
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08042CCE
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	ldrh r1, [r4, #0x38]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	b .L08042CC8
	.align 2, 0
.L08042C80: .4byte gBuf
.L08042C84:
	adds r0, r5, #0
	mov r1, sp
	movs r2, #0
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08042CCE
	movs r2, #0
	adds r3, r4, #0
	adds r3, #0x3a
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r0, [r3]
	cmp r2, r0
	bge .L08042CBA
.L08042CA4:
	ldr r1, [r4, #0x30]
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blt .L08042CA4
.L08042CBA:
	ldrh r1, [r4, #0x38]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	strb r0, [r6]
.L08042CC8:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
.L08042CCE:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq .L08042CDA
	adds r0, r4, #0
	bl _call_via_r1
.L08042CDA:
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	bcc .L08042CE8
	adds r0, r4, #0
	bl Proc_Break
.L08042CE8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08042C44

	THUMB_FUNC_START func_08042CF0
func_08042CF0: @ 0x08042CF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, .L08042D0C  @ 0x0079FF86
	cmp r4, r0
	bls .L08042D10
	movs r0, #1
	negs r0, r0
	b .L08042D62
	.align 2, 0
.L08042D0C: .4byte 0x0079FF86
.L08042D10:
	adds r0, r4, #0
	movs r1, #0x7a
	bl __udivsi3
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x7a
	bl __umodsi3
	adds r4, r0, #0
	cmp r4, #0
	beq .L08042D32
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
.L08042D32:
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L08042D6C  @ gUnknown_085A92E4
	ldr r1, [sp, #0x18]
	bl SpawnProcLocking
	adds r3, r0, #0
	str r7, [r3, #0x30]
	adds r0, #0x34
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	str r0, [r3, #0x2c]
	movs r1, #0
	strh r5, [r3, #0x36]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r2, [r3, #0x38]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
.L08042D62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08042D6C: .4byte gUnknown_085A92E4

	THUMB_FUNC_END func_08042CF0

	THUMB_FUNC_START func_08042D70
func_08042D70: @ 0x08042D70
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, .L08042D98  @ gUnknown_085A9304
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r2, r0, #0
	adds r2, #0x3b
	movs r1, #0
	strb r1, [r2]
	movs r2, #0
	strh r1, [r0, #0x38]
	adds r0, #0x3c
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08042D98: .4byte gUnknown_085A9304

	THUMB_FUNC_END func_08042D70

	THUMB_FUNC_START func_08042D9C
func_08042D9C: @ 0x08042D9C
	push {lr}
	ldr r0, .L08042DB8  @ gUnknown_085A92E4
	bl FindProc
	cmp r0, #0
	bne .L08042DC0
	ldr r0, .L08042DBC  @ gUnknown_085A9304
	bl FindProc
	cmp r0, #0
	bne .L08042DC0
	movs r0, #0
	b .L08042DC2
	.align 2, 0
.L08042DB8: .4byte gUnknown_085A92E4
.L08042DBC: .4byte gUnknown_085A9304
.L08042DC0:
	movs r0, #1
.L08042DC2:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08042D9C

	THUMB_FUNC_START func_08042DC8
func_08042DC8: @ 0x08042DC8
	push {lr}
	movs r3, #0
	b .L08042DD6
.L08042DCE:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
	adds r3, #1
.L08042DD6:
	ldrb r2, [r0]
	cmp r2, #0
	bne .L08042DCE
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08042DC8

	THUMB_FUNC_START func_08042DE8
func_08042DE8: @ 0x08042DE8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08042DE8

	THUMB_FUNC_START SioCon_8042E0C
SioCon_8042E0C: @ 0x08042E0C
	push {lr}
	bl func_08041900
	bl func_08041898
	ldr r2, .L08042E28  @ gUnknown_085A92E0
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
.L08042E28: .4byte gUnknown_085A92E0

	THUMB_FUNC_END SioCon_8042E0C

	THUMB_FUNC_START SioCon_8042E2C
SioCon_8042E2C: @ 0x08042E2C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L08042E70  @ 0x00002586
	mov r1, sp
	strh r0, [r1]
	bl func_080415B0
	movs r5, #1
	negs r5, r5
	cmp r0, r5
	beq .L08042E68
	ldr r4, .L08042E74  @ gUnknown_085A92E0
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl func_080416D0
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl func_08042568
	adds r0, r6, #0
	bl Proc_Break
.L08042E68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08042E70: .4byte 0x00002586
.L08042E74: .4byte gUnknown_085A92E0

	THUMB_FUNC_END SioCon_8042E2C

	THUMB_FUNC_START SetGameLinkArenaBit
SetGameLinkArenaBit: @ 0x08042E78
	ldr r2, .L08042E84  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2, #4]
	bx lr
	.align 2, 0
.L08042E84: .4byte gBmSt

	THUMB_FUNC_END SetGameLinkArenaBit

	THUMB_FUNC_START ClearGameLinkArenaBit
ClearGameLinkArenaBit: @ 0x08042E88
	ldr r2, .L08042E94  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2, #4]
	bx lr
	.align 2, 0
.L08042E94: .4byte gBmSt

	THUMB_FUNC_END ClearGameLinkArenaBit

	THUMB_FUNC_START CheckGameLinkArenaBit
CheckGameLinkArenaBit: @ 0x08042E98
	ldr r0, .L08042EA4  @ gBmSt
	ldrb r0, [r0, #4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
.L08042EA4: .4byte gBmSt

	THUMB_FUNC_END CheckGameLinkArenaBit

	THUMB_FUNC_START func_08042EA8
func_08042EA8: @ 0x08042EA8
	ldr r1, .L08042EB0  @ gUnknown_0203DA24
	movs r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
.L08042EB0: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08042EA8

	THUMB_FUNC_START func_08042EB4
func_08042EB4: @ 0x08042EB4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	str r4, [r5, #0x58]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08042EB4

	THUMB_FUNC_START func_08042EF0
func_08042EF0: @ 0x08042EF0
	push {r4, lr}
	sub sp, #4
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	movs r4, #0x3f
	ands r4, r1
	cmp r4, #0x1f
	ble .L08042F06
	movs r0, #0x40
	subs r4, r0, r4
.L08042F06:
	cmp r4, #0x10
	ble .L08042F0C
	movs r4, #0x10
.L08042F0C:
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08042EF0

	THUMB_FUNC_START func_08042F44
func_08042F44: @ 0x08042F44
	ldr r0, .L08042F54  @ gDispIo
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x24]
	subs r1, #1
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
.L08042F54: .4byte gDispIo

	THUMB_FUNC_END func_08042F44

	THUMB_FUNC_START func_08042F58
func_08042F58: @ 0x08042F58
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08042F78  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldr r1, .L08042F7C  @ 0x00001288
	strh r1, [r0, #0x30]
	ldr r1, .L08042F80  @ 0x00001B7E
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq .L08042F74
	adds r0, r2, #0
	bl Proc_Break
.L08042F74:
	pop {r0}
	bx r0
	.align 2, 0
.L08042F78: .4byte gUnknown_085A92E0
.L08042F7C: .4byte 0x00001288
.L08042F80: .4byte 0x00001B7E

	THUMB_FUNC_END func_08042F58

	THUMB_FUNC_START func_08042F84
func_08042F84: @ 0x08042F84
	ldr r0, .L08042F94  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
.L08042F94: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08042F84

	THUMB_FUNC_START func_08042F98
func_08042F98: @ 0x08042F98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08042FD8  @ gUnknown_03004F0C
	movs r2, #0
	movs r1, #0x89
	strb r1, [r0]
	ldr r4, .L08042FDC  @ gUnknown_085A92E0
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl func_080422B8
	ldr r4, [r4]
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	bne .L08042FD0
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	bl Proc_Break
.L08042FD0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08042FD8: .4byte gUnknown_03004F0C
.L08042FDC: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08042F98

	THUMB_FUNC_START func_08042FE0
func_08042FE0: @ 0x08042FE0
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	ldr r0, [r2, #0x38]
	cmp r1, r0
	bge .L08042FF8
	ldr r0, [r2, #0x34]
	cmp r1, r0
	ble .L08042FF8
	ldr r0, [r2, #0x2c]
	bl DisplayFrozenUiHand
.L08042FF8:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08042FE0

	THUMB_FUNC_START func_08042FFC
func_08042FFC: @ 0x08042FFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, .L08043028  @ gUnknown_085A93B8
	adds r1, r4, #0
	bl SpawnProc
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x38]
	str r7, [r0, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08043028: .4byte gUnknown_085A93B8

	THUMB_FUNC_END func_08042FFC

	THUMB_FUNC_START func_0804302C
func_0804302C: @ 0x0804302C
	push {lr}
	ldr r0, .L08043038  @ gUnknown_085A93B8
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08043038: .4byte gUnknown_085A93B8

	THUMB_FUNC_END func_0804302C

	THUMB_FUNC_START func_0804303C
func_0804303C: @ 0x0804303C
	ldr r2, [r0, #0x30]
	adds r2, r2, r1
	str r2, [r0, #0x30]
	bx lr

	THUMB_FUNC_END func_0804303C

	THUMB_FUNC_START func_08043044
func_08043044: @ 0x08043044
	push {lr}
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
	ldr r0, .L08043090  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08043094  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08043098  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L08043090: .4byte gBg0Tm
.L08043094: .4byte gBg1Tm
.L08043098: .4byte gBg2Tm

	THUMB_FUNC_END func_08043044

	THUMB_FUNC_START func_0804309C
func_0804309C: @ 0x0804309C
	push {lr}
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
	ldr r0, .L080430F0  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080430F4  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080430F8  @ gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080430FC  @ gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L080430F0: .4byte gBg0Tm
.L080430F4: .4byte gBg1Tm
.L080430F8: .4byte gBg2Tm
.L080430FC: .4byte gBg3Tm

	THUMB_FUNC_END func_0804309C

	THUMB_FUNC_START func_08043100
func_08043100: @ 0x08043100
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r1, r4, #3
	ldr r0, .L0804312C  @ gUnknown_0203DD0C
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	cmp r6, #0
	bge .L08043134
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, .L08043130  @ gBg2Tm+0x2
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	b .L0804315A
	.align 2, 0
.L0804312C: .4byte gUnknown_0203DD0C
.L08043130: .4byte gBg2Tm+0x2
.L08043134:
	adds r0, r6, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, .L08043160  @ gBg2Tm+0x2
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #4
	bl EnableBgSync
.L0804315A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08043160: .4byte gBg2Tm+0x2

	THUMB_FUNC_END func_08043100

	THUMB_FUNC_START func_08043164
func_08043164: @ 0x08043164
	push {r4, r5, lr}
	ldr r5, .L080431A8  @ gUnknown_0203DA88
	movs r4, #5
.L0804316A:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0804316A
	ldr r5, .L080431AC  @ gUnknown_0203DA30
	movs r4, #0xa
.L0804317E:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L0804317E
	ldr r5, .L080431B0  @ gUnknown_0203DD0C
	movs r4, #1
.L08043192:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08043192
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080431A8: .4byte gUnknown_0203DA88
.L080431AC: .4byte gUnknown_0203DA30
.L080431B0: .4byte gUnknown_0203DD0C

	THUMB_FUNC_END func_08043164

	THUMB_FUNC_START func_080431B4
func_080431B4: @ 0x080431B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, .L08043208  @ gUnknown_080D9D4D
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r1, #0
	movs r4, #4
	adds r0, r5, #0
	adds r0, #0x26
.L080431CC:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge .L080431CC
	movs r4, #0
.L080431D8:
	cmp r4, #4
	beq .L080431FA
	adds r0, r5, #0
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080431FA
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	orrs r1, r0
	adds r0, r5, #0
	bl UnitAddItem
.L080431FA:
	adds r4, #1
	cmp r4, #7
	ble .L080431D8
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08043208: .4byte gUnknown_080D9D4D

	THUMB_FUNC_END func_080431B4

	THUMB_FUNC_START SioPlaySomeIndexedSfx
SioPlaySomeIndexedSfx: @ 0x0804320C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, .L0804323C  @ gUnknown_080D9D56
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, .L08043240  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08043232
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
.L08043232:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804323C: .4byte gUnknown_080D9D56
.L08043240: .4byte gPlaySt

	THUMB_FUNC_END SioPlaySomeIndexedSfx

	THUMB_FUNC_START func_08043244
func_08043244: @ 0x08043244
	push {r4, lr}
	ldr r4, .L08043264  @ gUnknown_0203DB10
	adds r0, r4, #0
	bl func_080A6A40
	ldrb r0, [r4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r0, r4, #0
	bl func_080A6A04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08043264: .4byte gUnknown_0203DB10

	THUMB_FUNC_END func_08043244

	THUMB_FUNC_START func_08043268
func_08043268: @ 0x08043268
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, .L0804328C  @ gKeySt
	ldr r0, [r0]
	ldrh r4, [r0, #8]
	adds r3, r4, #0
	cmp r3, #0
	bne .L08043298
	ldr r1, .L08043290  @ gUnknown_0203DD4C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3b
	ble .L080432EC
	ldr r0, .L08043294  @ gUnknown_0300180C
	str r3, [r1]
	str r3, [r0]
	b .L080432EC
	.align 2, 0
.L0804328C: .4byte gKeySt
.L08043290: .4byte gUnknown_0203DD4C
.L08043294: .4byte gUnknown_0300180C
.L08043298:
	ldr r0, .L080432CC  @ gUnknown_0203DD4C
	movs r6, #0
	str r6, [r0]
	ldr r1, .L080432D0  @ gUnknown_0203DD2C
	ldr r2, .L080432D4  @ gUnknown_03001808
	ldr r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r1, .L080432D8  @ gUnknown_0300180C
	ldr r4, [r1]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r3, r0
	bne .L080432E0
	adds r0, r4, #1
	str r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, .L080432DC  @ 0x0000FFFF
	cmp r1, r0
	bne .L080432E2
	movs r0, #1
	b .L080432EE
	.align 2, 0
.L080432CC: .4byte gUnknown_0203DD4C
.L080432D0: .4byte gUnknown_0203DD2C
.L080432D4: .4byte gUnknown_03001808
.L080432D8: .4byte gUnknown_0300180C
.L080432DC: .4byte 0x0000FFFF
.L080432E0:
	str r6, [r1]
.L080432E2:
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	str r0, [r2]
.L080432EC:
	movs r0, #0
.L080432EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08043268

	THUMB_FUNC_START func_080432F4
func_080432F4: @ 0x080432F4
	push {lr}
	ldr r0, .L08043304  @ gUnknown_085A93F0
	bl func_08043268
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
.L08043304: .4byte gUnknown_085A93F0

	THUMB_FUNC_END func_080432F4

	THUMB_FUNC_START func_08043308
func_08043308: @ 0x08043308
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08043318  @ gUnknown_085A94AC
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08043318: .4byte gUnknown_085A94AC

	THUMB_FUNC_END func_08043308

	THUMB_FUNC_START func_0804331C
func_0804331C: @ 0x0804331C
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x4a
	adds r0, r0, r3
	mov ip, r0
	movs r2, #0
	movs r1, #0
	movs r0, #0xd8
	mov r4, ip
	strh r0, [r4]
	adds r0, r3, #0
	adds r0, #0x48
	strb r2, [r0]
	str r1, [r3, #0x40]
	str r1, [r3, #0x3c]
	adds r0, #0xa
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x54
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804331C

	THUMB_FUNC_START func_0804335C
func_0804335C: @ 0x0804335C
	push {r4, lr}
	ldr r0, .L08043368  @ gUnknown_0203DA24
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne .L08043370
	b .L08043388
	.align 2, 0
.L08043368: .4byte gUnknown_0203DA24
.L0804336C:
	movs r0, #1
	b .L0804338A
.L08043370:
	movs r3, #0
	movs r4, #0x80
	ldr r2, .L08043390  @ gUnknown_0203DB7C
.L08043376:
	ldrb r1, [r2, #0xf]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne .L0804336C
	adds r2, #0x14
	adds r3, #1
	cmp r3, #9
	ble .L08043376
.L08043388:
	movs r0, #0
.L0804338A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08043390: .4byte gUnknown_0203DB7C

	THUMB_FUNC_END func_0804335C

	THUMB_FUNC_START func_08043394
func_08043394: @ 0x08043394
	push {r4, lr}
	movs r3, #0
	movs r4, #0x80
	ldr r2, .L080433AC  @ gUnknown_0203DB7C
.L0804339C:
	ldrb r1, [r2, #0xf]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne .L080433B0
	movs r0, #1
	b .L080433BA
	.align 2, 0
.L080433AC: .4byte gUnknown_0203DB7C
.L080433B0:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #9
	ble .L0804339C
	movs r0, #0
.L080433BA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08043394

	THUMB_FUNC_START func_080433C0
func_080433C0: @ 0x080433C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov r9, r0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r7, #0
	ldr r1, .L080433F0  @ gUnknown_085A94A0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	bl InitUnits
	cmp r4, #0
	beq .L080433F4
	cmp r4, #0
	blt .L0804349E
	cmp r4, #2
	bgt .L0804349E
	movs r6, #0
	b .L08043460
	.align 2, 0
.L080433F0: .4byte gUnknown_085A94A0
.L080433F4:
	movs r6, #0
	mov r1, r9
	lsls r0, r1, #4
	mov r1, r8
	adds r5, r0, r1
	movs r0, #1
	mov r8, r0
	movs r7, #0
.L08043404:
	ldr r0, .L08043420  @ gUnknown_0203DB7C
	adds r4, r7, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_080A66F4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08043424
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	b .L08043440
	.align 2, 0
.L08043420: .4byte gUnknown_0203DB7C
.L08043424:
	movs r0, #0xcc
	bl GetMsg
	adds r1, r4, #0
	bl func_08042DC8
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x10]
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
.L08043440:
	mov r0, r8
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl func_080A693C
	movs r1, #5
	add r8, r1
	adds r7, #0x14
	adds r6, #1
	cmp r6, #9
	ble .L08043404
	adds r7, r6, #0
	b .L0804349E
.L08043460:
	lsls r0, r7, #2
	adds r5, r0, r7
	lsls r1, r5, #2
	ldr r0, .L080434B0  @ gUnknown_0203DB7C
	adds r4, r1, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl func_080A66F4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08043498
	mov r1, r9
	lsls r0, r1, #4
	add r0, r8
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	adds r0, r5, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl func_080A693C
	adds r7, #1
.L08043498:
	adds r6, #1
	cmp r6, #9
	ble .L08043460
.L0804349E:
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080434B0: .4byte gUnknown_0203DB7C

	THUMB_FUNC_END func_080433C0

	THUMB_FUNC_START func_080434B4
func_080434B4: @ 0x080434B4
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r0, r5, #3
	mov r8, r0
	ldr r6, .L0804351C  @ gUnknown_0203DA30
	adds r0, r0, r6
	mov r9, r0
	bl ClearText
	mov r0, r9
	movs r1, #0
	bl Text_SetColor
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, .L08043520  @ gUnknown_0203DB7C
	adds r4, r4, r0
	mov r0, r9
	adds r1, r4, #0
	bl Text_DrawString
	subs r6, #0xc
	add r8, r6
	mov r1, r8
	ldrh r0, [r1, #0xc]
	ldr r1, .L08043524  @ 0x00000FFF
	ands r1, r0
	ldrb r2, [r4, #0x10]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	orrs r1, r0
	mov r0, r8
	strh r1, [r0, #0xc]
	lsls r5, r5, #7
	ldr r0, .L08043528  @ gBg1Tm+0x16
	adds r5, r5, r0
	mov r0, r9
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804351C: .4byte gUnknown_0203DA30
.L08043520: .4byte gUnknown_0203DB7C
.L08043524: .4byte 0x00000FFF
.L08043528: .4byte gBg1Tm+0x16

	THUMB_FUNC_END func_080434B4

	THUMB_FUNC_START func_0804352C
func_0804352C: @ 0x0804352C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b .L0804353C
.L08043534:
	adds r0, r4, #0
	bl func_080434B4
	adds r4, #1
.L0804353C:
	ldr r0, [r5, #0x38]
	cmp r4, r0
	blt .L08043534
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804352C

	THUMB_FUNC_START func_08043548
func_08043548: @ 0x08043548
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldr r0, .L08043588  @ gUnknown_085A94A0
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r7, [r1]
	movs r6, #0
	ldr r0, [r4, #0x38]
	cmp r6, r0
	bge .L080435D4
	ldr r0, .L0804358C  @ gUnknown_0203DA24
	adds r5, r0, #0
	adds r5, #0xc
	ldr r0, .L08043590  @ gUnknown_0203DB7C
	mov r8, r0
	movs r3, #0
.L08043570:
	ldr r0, .L08043590  @ gUnknown_0203DB7C
	adds r2, r3, r0
	ldrb r1, [r2, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L08043594
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #4]
	b .L0804359C
	.align 2, 0
.L08043588: .4byte gUnknown_085A94A0
.L0804358C: .4byte gUnknown_0203DA24
.L08043590: .4byte gUnknown_0203DB7C
.L08043594:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #5]
.L0804359C:
	strb r0, [r2, #0x10]
	ldrh r1, [r5]
	ldr r2, .L080435E8  @ 0x00000FFF
	adds r0, r2, #0
	ands r1, r0
	mov r0, r8
	ldrb r2, [r0, #0x10]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r5]
	lsls r1, r6, #7
	ldr r0, .L080435EC  @ gBg1Tm+0x16
	adds r1, r1, r0
	adds r0, r5, #0
	str r3, [sp]
	bl PutText
	adds r5, #8
	movs r2, #0x14
	add r8, r2
	ldr r3, [sp]
	adds r3, #0x14
	adds r6, #1
	ldr r0, [r4, #0x38]
	cmp r6, r0
	blt .L08043570
.L080435D4:
	movs r0, #2
	bl EnableBgSync
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080435E8: .4byte 0x00000FFF
.L080435EC: .4byte gBg1Tm+0x16

	THUMB_FUNC_END func_08043548

	THUMB_FUNC_START func_080435F0
func_080435F0: @ 0x080435F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x40]
	ldr r1, .L08043678  @ gUnknown_085A94A0
	ldr r0, .L0804367C  @ gUnknown_0203DA24
	mov r9, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	lsls r4, r5, #2
	adds r4, r4, r5
	adds r0, r4, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, .L08043680  @ gUnknown_0203DB7C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r1, [r4, #0xf]
	movs r0, #0x7f
	ands r0, r1
	bl func_080A6774
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl func_080A693C
	movs r0, #0xcc
	bl GetMsg
	adds r1, r4, #0
	bl func_08042DC8
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r4, #0x10]
	movs r2, #0x80
	negs r2, r2
	adds r1, r2, #0
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	adds r0, r5, #0
	bl func_080434B4
	bl func_08043394
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08043684
	mov r1, r9
	ldrb r0, [r1]
	adds r1, r7, #0
	bl func_080437C0
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b .L08043698
	.align 2, 0
.L08043678: .4byte gUnknown_085A94A0
.L0804367C: .4byte gUnknown_0203DA24
.L08043680: .4byte gUnknown_0203DB7C
.L08043684:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08043698
	mov r2, r9
	ldrb r0, [r2]
	adds r1, r7, #0
	bl func_080437C0
.L08043698:
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_0804D24C
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080435F0

	THUMB_FUNC_START func_080436C0
func_080436C0: @ 0x080436C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	ldr r7, [r0, #0x40]
	adds r0, #0x53
	ldrb r0, [r0]
	mov r8, r0
	ldr r3, .L08043730  @ gUnknown_0203DB7C
	lsls r5, r0, #2
	add r5, r8
	lsls r0, r5, #2
	adds r6, r0, r3
	ldrb r2, [r6, #0xf]
	movs r1, #0x7f
	adds r0, r1, #0
	ands r0, r2
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r3
	ldrb r2, [r4, #0xf]
	ands r1, r2
	bl func_080A6840
	ldrb r1, [r6, #0x10]
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x10]
	strb r1, [r4, #0x10]
	adds r5, #1
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	mov r0, r8
	adds r2, r6, #0
	bl func_080A693C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08043734
	movs r0, #0xcc
	bl GetMsg
	adds r1, r6, #0
	bl func_08042DC8
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	mov r0, r8
	orrs r0, r1
	strb r0, [r6, #0xf]
	b .L08043738
	.align 2, 0
.L08043730: .4byte gUnknown_0203DB7C
.L08043734:
	mov r1, r8
	strb r1, [r6, #0xf]
.L08043738:
	lsls r4, r7, #2
	adds r4, r4, r7
	adds r0, r4, #1
	bl GetUnit
	adds r1, r0, #0
	lsls r4, r4, #2
	ldr r0, .L08043774  @ gUnknown_0203DB7C
	adds r4, r4, r0
	adds r0, r7, #0
	adds r2, r4, #0
	bl func_080A693C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08043778
	movs r0, #0xcc
	bl GetMsg
	adds r1, r4, #0
	bl func_08042DC8
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	b .L0804377A
	.align 2, 0
.L08043774: .4byte gUnknown_0203DB7C
.L08043778:
	strb r7, [r4, #0xf]
.L0804377A:
	adds r0, r7, #0
	bl func_080434B4
	mov r0, r8
	bl func_080434B4
	mov r1, r9
	ldr r0, [r1, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_0804D24C
	mov r1, r9
	ldr r0, [r1, #0x30]
	bl Proc_End
	mov r1, r9
	adds r1, #0x52
	movs r0, #4
	strb r0, [r1]
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080436C0

	THUMB_FUNC_START func_080437C0
func_080437C0: @ 0x080437C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r2, .L08043838  @ gUnknown_085A94A0
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r7, [r1]
	cmp r0, #1
	bne .L08043848
	ldr r1, .L0804383C  @ gUnknown_0203DA24
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge .L0804382E
	mov r9, r1
	movs r0, #5
	mov r8, r0
	mov r5, r9
	adds r5, #0x64
	movs r7, #0
.L080437F4:
	ldr r0, .L08043840  @ 0x0000076B
	bl GetMsg
	ldr r4, .L08043844  @ gUnknown_0203DD50
	adds r4, r7, r4
	adds r1, r4, #0
	bl func_08042DC8
	adds r0, r5, #0
	bl ClearText
	movs r0, #0xa
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r4, #0
	bl func_08014C54
	movs r1, #3
	add r8, r1
	adds r5, #8
	adds r7, #0xf
	adds r6, #1
	mov r1, r9
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt .L080437F4
.L0804382E:
	ldr r0, .L0804383C  @ gUnknown_0203DA24
	ldrb r0, [r0, #5]
	adds r0, #2
	b .L080438B0
	.align 2, 0
.L08043838: .4byte gUnknown_085A94A0
.L0804383C: .4byte gUnknown_0203DA24
.L08043840: .4byte 0x0000076B
.L08043844: .4byte gUnknown_0203DD50
.L08043848:
	lsls r0, r6, #4
	adds r1, r0, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	bne .L08043856
	adds r0, r6, #0
	b .L080438B0
.L08043856:
	mov r0, r8
	adds r0, #0x4d
	adds r4, r0, r6
	movs r0, #1
	strb r0, [r4]
	movs r5, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq .L08043876
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08043876
	strb r5, [r4]
	movs r5, #1
.L08043876:
	lsls r4, r6, #3
	ldr r0, .L080438AC  @ gUnknown_0203DA88
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	lsls r0, r6, #4
	adds r0, r0, r7
	ldr r0, [r0, #8]
	bl GetMsg
	adds r3, r0, #0
	lsls r2, r6, #1
	adds r2, #5
	movs r0, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	bl func_08014C54
	adds r6, #1
	b .L08043848
	.align 2, 0
.L080438AC: .4byte gUnknown_0203DA88
.L080438B0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080437C0

	THUMB_FUNC_START func_080438C0
func_080438C0: @ 0x080438C0
	push {lr}
	adds r3, r0, #0
	ldr r2, .L080438E0  @ gUnknown_085A94A0
	ldr r0, .L080438E4  @ gUnknown_0203DA24
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r1, #1
	beq .L080438E8
	ldr r0, [r3, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b .L080438FA
	.align 2, 0
.L080438E0: .4byte gUnknown_085A94A0
.L080438E4: .4byte gUnknown_0203DA24
.L080438E8:
	ldr r0, [r3, #0x3c]
	cmp r0, #0
	beq .L080438F8
	ldr r0, .L080438F4  @ 0x00000743
	b .L080438FA
	.align 2, 0
.L080438F4: .4byte 0x00000743
.L080438F8:
	ldr r0, .L08043900  @ 0x00000742
.L080438FA:
	pop {r1}
	bx r1
	.align 2, 0
.L08043900: .4byte 0x00000742

	THUMB_FUNC_END func_080438C0

	THUMB_FUNC_START func_08043904
func_08043904: @ 0x08043904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r5, .L08043AD0  @ Pal_SystemText
	bl func_08043044
	bl func_0804C33C
	movs r4, #0
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl func_08086CE8
	ldr r0, .L08043AD4  @ gUnknown_085ABD68
	ldr r1, .L08043AD8  @ 0x06014800
	bl Decompress
	ldr r0, .L08043ADC  @ gBg2Tm+0x112
	ldr r1, .L08043AE0  @ gUnknown_085ADF40
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, .L08043AE4  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L08043AE8  @ gUnknown_085AC604
	ldr r1, .L08043AEC  @ 0x06016000
	bl Decompress
	ldr r0, .L08043AF0  @ gUnknown_08A1BD00
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r1, .L08043AF4  @ gPal
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r1, #0x42
	movs r2, #2
.L08043968:
	ldrh r0, [r5, #8]
	strh r0, [r1]
	adds r5, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge .L08043968
	bl EnablePalSync
	ldr r0, .L08043AF8  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl func_08043164
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl ForceSyncUnitSpriteSheet
	ldr r0, [r7, #0x3c]
	ldr r1, .L08043AFC  @ gUnknown_0203DA24
	ldrb r1, [r1]
	bl func_080433C0
	str r0, [r7, #0x38]
	adds r6, r7, #0
	adds r6, #0x5c
	adds r5, r7, #0
	adds r5, #0x4a
	movs r1, #0
	add r0, sp, #8
.L080439B0:
	strb r1, [r0]
	subs r0, #1
	add r2, sp, #4
	cmp r0, r2
	bge .L080439B0
	ldr r0, [r7, #0x3c]
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #1
	strb r0, [r1]
	ldr r4, .L08043AFC  @ gUnknown_0203DA24
	ldrb r0, [r4]
	adds r1, r7, #0
	bl func_080437C0
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl func_0804352C
	ldr r1, [r7, #0x34]
	adds r0, r7, #0
	add r2, sp, #4
	bl func_0804CAEC
	str r0, [r7, #0x2c]
	movs r2, #0
	adds r4, #6
	movs r3, #0xff
.L080439EA:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, #1
	cmp r2, #3
	ble .L080439EA
	movs r4, #0
	strb r4, [r6]
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, .L08043B00  @ gDispIo
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r2, #0xf0
	strb r2, [r0]
	adds r0, #4
	movs r1, #0x88
	strb r1, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #4
	strb r1, [r0]
	subs r0, #5
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x32
	movs r0, #0xa0
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	movs r4, #1
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0x35
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r4
	movs r5, #3
	negs r5, r5
	ands r0, r5
	orrs r0, r3
	orrs r0, r2
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	orrs r0, r2
	orrs r0, r6
	strb r0, [r1]
	ldr r0, [r7, #0x2c]
	ldr r2, .L08043B04  @ gUnknown_080D9D5E
	ldr r1, .L08043AFC  @ gUnknown_0203DA24
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl func_0804C49C
	bl func_0804C558
	adds r0, r7, #0
	bl func_080438C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl func_08043100
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08043AD0: .4byte Pal_SystemText
.L08043AD4: .4byte gUnknown_085ABD68
.L08043AD8: .4byte 0x06014800
.L08043ADC: .4byte gBg2Tm+0x112
.L08043AE0: .4byte gUnknown_085ADF40
.L08043AE4: .4byte gUnknown_085ADC48
.L08043AE8: .4byte gUnknown_085AC604
.L08043AEC: .4byte 0x06016000
.L08043AF0: .4byte gUnknown_08A1BD00
.L08043AF4: .4byte gPal
.L08043AF8: .4byte gFont_203DB64
.L08043AFC: .4byte gUnknown_0203DA24
.L08043B00: .4byte gDispIo
.L08043B04: .4byte gUnknown_080D9D5E

	THUMB_FUNC_END func_08043904

	THUMB_FUNC_START func_08043B08
func_08043B08: @ 0x08043B08
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r1, .L08043B68  @ gKeySt
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq .L08043B3E
	ldr r0, [r4]
	cmp r0, r5
	bgt .L08043B32
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne .L08043B3E
.L08043B32:
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge .L08043B3E
	subs r0, r6, #1
	str r0, [r4]
.L08043B3E:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq .L08043B62
	ldr r0, [r4]
	cmp r0, r7
	blt .L08043B56
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne .L08043B62
.L08043B56:
	adds r0, #1
	str r0, [r4]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r4]
.L08043B62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08043B68: .4byte gKeySt

	THUMB_FUNC_END func_08043B08

	THUMB_FUNC_START func_08043B6C
func_08043B6C: @ 0x08043B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x3c]
	ldr r1, .L08043C38  @ gUnknown_085A94A0
	ldr r0, .L08043C3C  @ gUnknown_0203DA24
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0
	mov sl, r1
	movs r7, #1
	strb r7, [r0]
	movs r0, #1
	negs r0, r0
	str r0, [r5, #0x48]
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r3, [r4, #0x34]
	subs r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl func_08043B08
	ldr r0, [r4, #0x3c]
	cmp r6, r0
	beq .L08043BEA
	movs r0, #3
	bl SioPlaySomeIndexedSfx
	adds r0, r5, #0
	adds r0, #0x3a
	adds r1, r0, r6
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	strb r7, [r0]
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r4, #0
	bl func_08043548
	adds r0, r4, #0
	bl func_080438C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl func_08043100
.L08043BEA:
	ldr r0, .L08043C40  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq .L08043C7C
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #1
	beq .L08043C5A
	adds r0, r4, #0
	adds r0, #0x4d
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08043C52
	lsls r0, r1, #4
	add r0, r9
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne .L08043C44
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	movs r0, #0xff
	mov r2, r8
	strb r0, [r2, #3]
	b .L08043CD8
	.align 2, 0
.L08043C38: .4byte gUnknown_085A94A0
.L08043C3C: .4byte gUnknown_0203DA24
.L08043C40: .4byte gKeySt
.L08043C44:
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r0, r4, #0
	bl Proc_Break
	b .L08043C7C
.L08043C52:
	movs r0, #0
	bl SioPlaySomeIndexedSfx
	b .L08043C7C
.L08043C5A:
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	adds r1, #1
	strb r0, [r1]
	mov r0, sl
	str r0, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b .L08043CD8
.L08043C7C:
	ldr r5, .L08043CE8  @ gKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08043C9E
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r1, .L08043CEC  @ gUnknown_0203DA24
	movs r0, #0xff
	strb r0, [r1, #3]
.L08043C9E:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L08043CD8
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08043CD8
	ldr r0, .L08043CF0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08043CCA
	movs r0, #0x6a
	bl m4aSongNumStart
.L08043CCA:
	ldr r1, .L08043CEC  @ gUnknown_0203DA24
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
.L08043CD8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08043CE8: .4byte gKeySt
.L08043CEC: .4byte gUnknown_0203DA24
.L08043CF0: .4byte gPlaySt

	THUMB_FUNC_END func_08043B6C

	THUMB_FUNC_START func_08043CF4
func_08043CF4: @ 0x08043CF4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl Proc_End
	bl nullsub_13
	bl EndBG3Slider
	bl InitUnits
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldr r3, .L08043D38  @ gUnknown_0203DB7C
	ldr r2, [r4, #0x40]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xf]
	mov r2, sp
	bl func_080A693C
	adds r0, r4, #0
	bl func_08092164
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08043D38: .4byte gUnknown_0203DB7C

	THUMB_FUNC_END func_08043CF4

	THUMB_FUNC_START func_08043D3C
func_08043D3C: @ 0x08043D3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08043D58  @ gUnknown_08A178C0
	bl FindProc
	cmp r0, #0
	bne .L08043D50
	adds r0, r4, #0
	bl Proc_Break
.L08043D50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08043D58: .4byte gUnknown_08A178C0

	THUMB_FUNC_END func_08043D3C

	THUMB_FUNC_START func_08043D5C
func_08043D5C: @ 0x08043D5C
	push {lr}
	movs r1, #0
	ldr r2, .L08043D7C  @ gUnknown_0203DA24
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r1, r0
	bge .L08043D86
	adds r3, r2, #6
	adds r2, r0, #0
.L08043D6E:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne .L08043D80
	movs r0, #0
	b .L08043D88
	.align 2, 0
.L08043D7C: .4byte gUnknown_0203DA24
.L08043D80:
	adds r1, #1
	cmp r1, r2
	blt .L08043D6E
.L08043D86:
	movs r0, #1
.L08043D88:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08043D5C

	THUMB_FUNC_START func_08043D8C
func_08043D8C: @ 0x08043D8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x40]
	mov r9, r0
	ldr r1, [r7, #0x2c]
	str r1, [sp, #4]
	ldr r0, .L08043DD0  @ gUnknown_085A93E0
	bl func_08043268
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08043DD8
	ldr r1, .L08043DD4  @ gUnknown_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L08043DD8
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b .L08044270
	.align 2, 0
.L08043DD0: .4byte gUnknown_085A93E0
.L08043DD4: .4byte gUnknown_0203DB7C
.L08043DD8:
	ldr r1, [sp, #4]
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x48
	ldrb r1, [r2]
	ldr r0, [r7, #0x40]
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r3, [sp, #4]
	str r0, [r3, #0x48]
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r2
	str r0, [sp, #8]
	cmp r1, #0
	ble .L08043E36
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq .L08043E2A
	movs r1, #4
	bl func_0804303C
.L08043E2A:
	movs r0, #4
	bl func_0804CC5C
	mov r2, sl
	ldrb r0, [r2]
	b .L08043E70
.L08043E36:
	cmp r1, #0
	bge .L08043E92
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq .L08043E64
	movs r1, #4
	negs r1, r1
	bl func_0804303C
.L08043E64:
	movs r0, #4
	negs r0, r0
	bl func_0804CC5C
	mov r1, sl
	ldrb r0, [r1]
.L08043E70:
	ldr r1, [r7, #0x40]
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl DisplayUiHand
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_0804D24C
	b .L08044270
.L08043E92:
	mov r2, sl
	ldrb r0, [r2]
	ldr r1, [r7, #0x40]
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl DisplayUiHand
	ldr r0, .L08043ED0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08043EB4
	b .L080440C6
.L08043EB4:
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	subs r0, #1
	adds r4, r1, #0
	cmp r0, #7
	bls .L08043EC4
	b .L080440C6
.L08043EC4:
	lsls r0, r0, #2
	ldr r1, .L08043ED4  @ .L08043ED8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08043ED0: .4byte gKeySt
.L08043ED4: .4byte .L08043ED8
.L08043ED8: @ jump table
	.4byte .L08043EF8 @ case 0
	.4byte .L08043F28 @ case 1
	.4byte .L08043F50 @ case 2
	.4byte .L08043F7C @ case 3
	.4byte .L08043FE0 @ case 4
	.4byte .L08043FEE @ case 5
	.4byte .L080440C6 @ case 6
	.4byte .L0804403C @ case 7
.L08043EF8:
	ldr r1, .L08043F20  @ gUnknown_0203DB7C
	mov r3, r9
	lsls r0, r3, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L08043F10
	b .L08044034
.L08043F10:
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	ldr r1, .L08043F24  @ gUnknown_0203DA24
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b .L08043F40
	.align 2, 0
.L08043F20: .4byte gUnknown_0203DB7C
.L08043F24: .4byte gUnknown_0203DA24
.L08043F28:
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	ldr r2, .L08043F48  @ gUnknown_0203DA24
	ldr r1, .L08043F4C  @ gUnknown_0203DB7C
	mov r3, r9
	lsls r0, r3, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xf]
	strb r0, [r2, #3]
.L08043F40:
	adds r0, r7, #0
	bl Proc_Break
	b .L08044270
	.align 2, 0
.L08043F48: .4byte gUnknown_0203DA24
.L08043F4C: .4byte gUnknown_0203DB7C
.L08043F50:
	ldr r1, .L08043F78  @ gUnknown_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L08044034
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b .L08044270
	.align 2, 0
.L08043F78: .4byte gUnknown_0203DB7C
.L08043F7C:
	ldr r0, [r7, #0x38]
	cmp r0, #1
	bgt .L08043F84
	b .L080440C6
.L08043F84:
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r0, r7, #0
	adds r0, #0x53
	mov r3, r9
	strb r3, [r0]
	ldrb r2, [r0]
	mov r1, sl
	ldrb r0, [r1]
	subs r2, r2, r0
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl func_08042FFC
	str r0, [r7, #0x30]
	mov r1, r9
	adds r1, #1
	ldr r0, [r7, #0x38]
	cmp r1, r0
	bge .L08043FC8
	ldr r0, .L08043FC4  @ gKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x80
	b .L08043FD0
	.align 2, 0
.L08043FC4: .4byte gKeySt
.L08043FC8:
	ldr r0, .L08043FDC  @ gKeySt
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x40
.L08043FD0:
	orrs r0, r1
	strh r0, [r2, #6]
	movs r0, #5
	strb r0, [r4]
	b .L080440C6
	.align 2, 0
.L08043FDC: .4byte gKeySt
.L08043FE0:
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r0, r7, #0
	bl func_080436C0
	b .L080440C6
.L08043FEE:
	ldr r1, .L08044030  @ gUnknown_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne .L08044034
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	mov r3, sl
	ldrb r2, [r3]
	mov r0, r9
	subs r2, r0, r2
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl func_08042FFC
	str r0, [r7, #0x30]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b .L080440C6
	.align 2, 0
.L08044030: .4byte gUnknown_0203DB7C
.L08044034:
	movs r0, #0
	bl SioPlaySomeIndexedSfx
	b .L080440C6
.L0804403C:
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	mov r1, r9
	lsls r4, r1, #2
	add r4, r9
	lsls r4, r4, #2
	ldr r0, .L080440F0  @ gUnknown_0203DB7C
	adds r4, r4, r0
	movs r2, #0x53
	adds r2, r2, r7
	mov r8, r2
	ldrb r0, [r2]
	lsls r1, r0, #4
	subs r1, r1, r0
	ldr r6, .L080440F4  @ gUnknown_0203DD50
	adds r1, r1, r6
	adds r0, r4, #0
	bl func_08042DC8
	ldr r5, .L080440F8  @ gUnknown_0203DA24
	adds r0, r5, #6
	mov r3, r8
	ldrb r3, [r3]
	adds r0, r0, r3
	ldrb r1, [r4, #0xf]
	strb r1, [r0]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r5, #0x64
	adds r0, r0, r5
	bl ClearText
	mov r2, r8
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r0, r0, r5
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r2, #5
	lsls r3, r1, #4
	subs r3, r3, r1
	adds r3, r3, r6
	movs r1, #0xa
	str r1, [sp]
	movs r1, #1
	bl func_08014C54
	bl func_08043D5C
	adds r1, r7, #0
	adds r1, #0x5c
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080440BA
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x40]
	cmp r0, #0
	bne .L080440BA
	movs r0, #8
	str r0, [r3, #0x40]
.L080440BA:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
.L080440C6:
	ldr r0, .L080440FC  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804411A
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #5
	bne .L08044100
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r7, #0x30]
	bl Proc_End
	b .L08044270
	.align 2, 0
.L080440F0: .4byte gUnknown_0203DB7C
.L080440F4: .4byte gUnknown_0203DD50
.L080440F8: .4byte gUnknown_0203DA24
.L080440FC: .4byte gKeySt
.L08044100:
	cmp r0, #8
	beq .L0804410E
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b .L0804411A
.L0804410E:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
.L0804411A:
	ldr r0, .L080441C4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L08044156
	adds r0, r7, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08044156
	ldr r0, .L080441C8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08044148
	movs r0, #0x6a
	bl m4aSongNumStart
.L08044148:
	ldr r1, .L080441CC  @ gUnknown_0203DA24
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r7, #0
	movs r1, #9
	bl Proc_Goto
.L08044156:
	ldr r0, .L080441C4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L080441DA
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	beq .L080441D0
	adds r1, r0, #0
	ldr r0, [r7, #0x40]
	subs r0, r0, r1
	cmp r0, #1
	bgt .L080441D0
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq .L0804418C
	movs r1, #4
	bl func_0804303C
.L0804418C:
	movs r0, #4
	bl func_0804CC5C
	mov r2, sl
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r0, #3
	ldr r3, [sp, #8]
	strb r0, [r3]
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_0804D24C
	b .L080441DA
	.align 2, 0
.L080441C4: .4byte gKeySt
.L080441C8: .4byte gPlaySt
.L080441CC: .4byte gUnknown_0203DA24
.L080441D0:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	ble .L080441DA
	subs r0, #1
	str r0, [r7, #0x40]
.L080441DA:
	ldr r0, .L08044254  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L08044264
	ldr r1, [r7, #0x38]
	cmp r1, #6
	ble .L08044258
	mov r0, sl
	ldrb r2, [r0]
	adds r0, r2, #6
	cmp r0, r1
	bge .L08044258
	ldr r0, [r7, #0x40]
	subs r0, r0, r2
	cmp r0, #3
	ble .L08044258
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq .L08044218
	movs r1, #4
	negs r1, r1
	bl func_0804303C
.L08044218:
	movs r0, #4
	negs r0, r0
	bl func_0804CC5C
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xfd
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl func_0804D24C
	b .L08044264
	.align 2, 0
.L08044254: .4byte gKeySt
.L08044258:
	subs r0, r1, #1
	ldr r1, [r7, #0x40]
	cmp r1, r0
	bge .L08044264
	adds r0, r1, #1
	str r0, [r7, #0x40]
.L08044264:
	ldr r0, [r7, #0x40]
	cmp r9, r0
	beq .L08044270
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08044270:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08043D8C

	THUMB_FUNC_START func_08044280
func_08044280: @ 0x08044280
	push {lr}
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	negs r1, r1
	subs r1, #8
	movs r2, #4
	adds r0, #0x38
.L0804428E:
	strh r1, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge .L0804428E
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08044280

	THUMB_FUNC_START func_0804429C
func_0804429C: @ 0x0804429C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r0, .L08044300  @ gUnknown_080D9D61
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne .L080442BC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
.L080442BC:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	negs r0, r0
	cmp r5, r0
	bne .L08044308
	ldr r3, .L08044304  @ gDispIo
	ldrb r2, [r3, #0x10]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0xc]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	b .L0804431C
	.align 2, 0
.L08044300: .4byte gUnknown_080D9D61
.L08044304: .4byte gDispIo
.L08044308:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl func_08044280
.L0804431C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804429C

	THUMB_FUNC_START func_08044324
func_08044324: @ 0x08044324
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r1, .L0804438C  @ gUnknown_080D9D61
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r7, #1
	negs r7, r7
	cmp r5, r7
	bne .L08044344
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
.L08044344:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	negs r0, r0
	cmp r5, r0
	bne .L08044394
	ldr r3, .L08044390  @ gDispIo
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
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	str r7, [r6, #0x48]
	b .L080443A8
	.align 2, 0
.L0804438C: .4byte gUnknown_080D9D61
.L08044390: .4byte gDispIo
.L08044394:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl func_08044280
.L080443A8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08044324

	THUMB_FUNC_START func_080443B0
func_080443B0: @ 0x080443B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl func_0804D80C
	adds r0, r5, #0
	adds r0, #0x48
	ldrb r1, [r0]
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	cmp r0, #2
	ble .L080443D4
	lsls r0, r0, #1
	subs r0, #2
	b .L080443D8
.L080443D4:
	lsls r0, r0, #1
	adds r0, #5
.L080443D8:
	str r0, [r5, #0x58]
	ldr r4, .L08044424  @ gUnknown_0203DAB0
	adds r0, r4, #0
	bl ClearText
	movs r0, #0xa0
	lsls r0, r0, #1
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x26
	bl Text_SetCursor
	ldr r0, .L08044428  @ 0x00000141
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, [r5, #0x58]
	adds r1, #4
	lsls r1, r1, #6
	ldr r0, .L0804442C  @ gBg0Tm+0x1E
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08044424: .4byte gUnknown_0203DAB0
.L08044428: .4byte 0x00000141
.L0804442C: .4byte gBg0Tm+0x1E

	THUMB_FUNC_END func_080443B0

	THUMB_FUNC_START func_08044430
func_08044430: @ 0x08044430
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x18
	movs r0, #0x60
	bl func_0804D834
	ldr r0, .L080444D4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L08044462
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #1
	bne .L08044462
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08044462:
	ldr r0, .L080444D4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x55
	cmp r0, #0
	beq .L08044484
	ldrb r0, [r5]
	cmp r0, #0
	bne .L08044484
	movs r0, #1
	strb r0, [r5]
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08044484:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl DisplayUiHand
	ldr r0, .L080444D4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080444DC
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, .L080444D8  @ gBg0Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
	b .L08044524
	.align 2, 0
.L080444D4: .4byte gKeySt
.L080444D8: .4byte gBg0Tm+0x1E
.L080444DC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08044524
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldrb r0, [r5]
	cmp r0, #0
	bne .L080444FE
	adds r0, r4, #0
	bl func_080435F0
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	b .L08044504
.L080444FE:
	movs r0, #1
	bl SioPlaySomeIndexedSfx
.L08044504:
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, .L0804452C  @ gBg0Tm+0x1E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
.L08044524:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804452C: .4byte gBg0Tm+0x1E

	THUMB_FUNC_END func_08044430

	THUMB_FUNC_START func_08044530
func_08044530: @ 0x08044530
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [r0, #0x40]
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, sp
	bl func_080A693C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08044530

	THUMB_FUNC_START func_08044550
func_08044550: @ 0x08044550
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, .L0804455C  @ gUnknown_080D8740
	adds r0, r0, r1
	bx lr
	.align 2, 0
.L0804455C: .4byte gUnknown_080D8740

	THUMB_FUNC_END func_08044550

	THUMB_FUNC_START func_08044560
func_08044560: @ 0x08044560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov r9, r1
	movs r0, #0
	str r0, [sp]
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08044602
.L0804457A:
	movs r1, #0
	mov r8, r1
	mov r3, r9
	adds r3, #2
	str r3, [sp, #8]
.L08044584:
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl func_08044550
	str r0, [sp, #4]
	movs r7, #0
	mov r6, r8
	ldr r0, .L080445D8  @ 0x00003FFF
	ands r6, r0
	movs r1, #0
	mov ip, r1
.L0804459C:
	movs r4, #0
	mov r3, r9
	ldrh r3, [r3]
	str r3, [sp, #0xc]
	ldr r2, [sp, #4]
	add r2, ip
	adds r0, r7, #0
	movs r5, #3
	ands r0, r5
	lsls r1, r0, #0xe
	orrs r1, r6
	ldr r3, [sp]
	lsls r0, r3, #1
	adds r0, #0x4c
	mov r5, sl
	adds r3, r0, r5
.L080445BC:
	ldr r0, [r2]
	ldrh r0, [r0]
	ldr r5, [sp, #0xc]
	cmp r0, r5
	bne .L080445DC
	strh r1, [r3]
	mov r0, sl
	adds r0, #0x39
	strb r4, [r0]
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	b .L080445F8
	.align 2, 0
.L080445D8: .4byte 0x00003FFF
.L080445DC:
	adds r2, #4
	adds r4, #1
	cmp r4, #2
	ble .L080445BC
	movs r1, #0xc
	add ip, r1
	adds r7, #1
	cmp r7, #2
	ble .L0804459C
	movs r3, #1
	add r8, r3
	mov r5, r8
	cmp r5, #0x50
	ble .L08044584
.L080445F8:
	ldr r0, [sp, #8]
	mov r9, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0804457A
.L08044602:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08044560

	THUMB_FUNC_START func_08044614
func_08044614: @ 0x08044614
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r5, #0
	adds r6, r0, #0
	adds r6, #0x31
	ldr r1, .L080446F0  @ gUnknown_0203DB14
	mov r8, r1
	adds r0, #0x30
	mov sl, r0
.L0804462E:
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	bl ClearText
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	movs r1, #0
	bl Text_SetColor
	movs r7, #0
	lsls r0, r5, #4
	mov r9, r0
	lsls r1, r5, #1
	str r1, [sp, #4]
	adds r0, r5, #1
	str r0, [sp]
.L0804465E:
	mov r1, r9
	subs r0, r1, r5
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, .L080446F4  @ gUnknown_080D9C9E
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	ldr r1, .L080446F8  @ gUnknown_080D8740
	adds r4, r0, r1
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080446B8
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r4, #0x30]
	bl Text_SetCursor
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl Text_DrawString
.L080446B8:
	adds r7, #1
	cmp r7, #0xe
	ble .L0804465E
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	ldr r1, [sp, #4]
	adds r1, #9
	lsls r1, r1, #6
	ldr r2, .L080446FC  @ gBg1Tm
	adds r1, r1, r2
	bl PutText
	ldr r5, [sp]
	cmp r5, #4
	ble .L0804462E
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080446F0: .4byte gUnknown_0203DB14
.L080446F4: .4byte gUnknown_080D9C9E
.L080446F8: .4byte gUnknown_080D8740
.L080446FC: .4byte gBg1Tm

	THUMB_FUNC_END func_08044614

	THUMB_FUNC_START NameSelect_DrawNameText
NameSelect_DrawNameText: @ 0x08044700
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r4, #0x3d
	ldr r5, .L08044748  @ gNameSelectNameBoxText
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08044732
	adds r6, r5, #0
	movs r5, #0
.L08044718:
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_SetCursor
	adds r0, r6, #0
	adds r1, r4, #0
	bl Text_DrawCharacter
	adds r4, r0, #0
	adds r5, #7
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08044718
.L08044732:
	ldr r0, .L08044748  @ gNameSelectNameBoxText
	ldr r1, .L0804474C  @ gBg0Tm+0x158
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08044748: .4byte gNameSelectNameBoxText
.L0804474C: .4byte gBg0Tm+0x158

	THUMB_FUNC_END NameSelect_DrawNameText

	THUMB_FUNC_START func_08044750
func_08044750: @ 0x08044750
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	b .L0804475C
.L08044758:
	adds r2, #1
	adds r1, #1
.L0804475C:
	ldrb r0, [r1]
	cmp r0, #0
	bne .L08044758
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08044750

	THUMB_FUNC_START NameSelect_8044768
NameSelect_8044768: @ 0x08044768
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	bl func_08043044
	bl func_0804C33C
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl func_08086CE8
	ldr r0, .L080447DC  @ gUnknown_085ABD68
	ldr r1, .L080447E0  @ 0x06014800
	bl Decompress
	ldr r0, .L080447E4  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080447E8  @ gUnknown_085ADE68
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080447EC  @ gBg2Tm+0x200
	ldr r1, .L080447F0  @ gUnknown_085AE190
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, .L080447F4  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq .L080447F8
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #7
	b .L08044802
	.align 2, 0
.L080447DC: .4byte gUnknown_085ABD68
.L080447E0: .4byte 0x06014800
.L080447E4: .4byte gUnknown_085ADC48
.L080447E8: .4byte gUnknown_085ADE68
.L080447EC: .4byte gBg2Tm+0x200
.L080447F0: .4byte gUnknown_085AE190
.L080447F4: .4byte gFont_203DB64
.L080447F8:
	ldr r0, .L08044954  @ gUnknown_0203DA24
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #5
.L08044802:
	strb r0, [r1]
	adds r5, r1, #0
	movs r4, #0
	adds r3, r5, #0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, #1
	movs r1, #0x38
	adds r1, r1, r6
	mov r8, r1
	adds r7, r6, #0
	adds r7, #0x30
	movs r1, #0x39
	adds r1, r1, r6
	mov r9, r1
	movs r1, #0x31
	adds r1, r1, r6
	mov sl, r1
	adds r1, r6, #0
	adds r1, #0x32
	str r1, [sp, #0x14]
	cmp r4, r0
	bge .L08044844
	adds r1, #0xb
	movs r2, #0
.L08044834:
	adds r0, r1, r4
	strb r2, [r0]
	adds r4, #1
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, #1
	cmp r4, r0
	blt .L08044834
.L08044844:
	movs r4, #0
	adds r1, r5, #0
	ldrb r3, [r5]
	cmp r4, r3
	bge .L08044860
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x4c
.L08044854:
	strh r2, [r0]
	adds r0, #2
	adds r4, #1
	ldrb r3, [r1]
	cmp r4, r3
	blt .L08044854
.L08044860:
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804486E
	movs r0, #9
	strb r0, [r5]
.L0804486E:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, .L08044958  @ gNameSelectNameBoxText
	movs r1, #8
	bl InitText
	movs r0, #1
	strb r0, [r7]
	movs r4, #0
	movs r0, #6
	strh r0, [r6, #0x34]
	bl func_08044550
	ldrh r1, [r0, #0x30]
	subs r1, #4
	ldrh r2, [r0, #0x32]
	adds r2, #1
	adds r0, r6, #0
	bl func_0804CD90
	str r0, [r6, #0x2c]
	mov r3, r9
	strb r4, [r3]
	ldr r5, .L0804495C  @ gUnknown_0203DB14
	movs r4, #9
.L080448A2:
	adds r0, r5, #0
	movs r1, #0x1a
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L080448A2
	ldr r0, .L08044960  @ gUnknown_0203DAB0
	movs r1, #0xc
	bl InitText
	ldr r0, [r6, #0x2c]
	movs r2, #0xa0
	lsls r2, r2, #3
	movs r1, #3
	bl func_0804C49C
	bl func_0804C508
	ldr r1, .L08044964  @ gUnknown_0203DD24
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	mov r1, sl
	strb r0, [r1]
	adds r0, r6, #0
	bl func_08044614
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	cmp r0, #0
	beq .L0804493C
	movs r4, #0
	bl GetTacticianName
	adds r2, r0, #0
	ldrb r1, [r2]
	cmp r1, #0
	beq .L08044922
	adds r7, r6, #0
	adds r7, #0x3d
	mov r5, r8
	adds r3, r6, #0
	adds r3, #0x33
.L080448FC:
	adds r0, r7, r4
	strb r1, [r0]
	mov r1, sp
	adds r1, r1, r4
	adds r1, #4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r4, #1
	ldrb r0, [r5]
	adds r0, #1
	ldrb r1, [r3]
	cmp r0, r1
	bge .L0804491C
	mov r1, r8
	strb r0, [r1]
.L0804491C:
	ldrb r1, [r2]
	cmp r1, #0
	bne .L080448FC
.L08044922:
	adds r0, r6, #0
	add r1, sp, #4
	bl func_08044560
	adds r0, r6, #0
	bl NameSelect_DrawNameText
	ldr r2, [r6, #0x2c]
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	str r0, [r2, #0x40]
.L0804493C:
	movs r0, #0xf
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
.L08044954: .4byte gUnknown_0203DA24
.L08044958: .4byte gNameSelectNameBoxText
.L0804495C: .4byte gUnknown_0203DB14
.L08044960: .4byte gUnknown_0203DAB0
.L08044964: .4byte gUnknown_0203DD24

	THUMB_FUNC_END NameSelect_8044768

	THUMB_FUNC_START func_08044968
func_08044968: @ 0x08044968
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r9, r1
	movs r0, #0x81
	bl GetUnit
	mov r8, r0
	mov r4, r8
	movs r6, #4
.L08044982:
	adds r0, r4, #0
	bl ClearUnit
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge .L08044982
	movs r6, #0
	mov r7, r8
.L08044994:
	ldr r0, .L080449E4  @ gUnknown_0203E87C
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080449C2
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r4, [r5, #0xc]
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	bne .L080449C2
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	str r4, [r5, #0xc]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl func_08014C38
.L080449C2:
	adds r7, #0x48
	adds r6, #1
	cmp r6, #4
	ble .L08044994
	mov r0, r9
	mov r1, r8
	mov r2, sl
	bl func_080A68DC
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080449E4: .4byte gUnknown_0203E87C

	THUMB_FUNC_END func_08044968

	THUMB_FUNC_START func_080449E8
func_080449E8: @ 0x080449E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r5, r1, #1
	adds r2, #0x36
	adds r2, r2, r5
	ldrh r4, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #6
	ldr r6, .L08044A3C  @ gUnknown_080D8740
	adds r2, r0, r6
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08044A32
	adds r1, r5, #0
	adds r5, r6, #0
.L08044A18:
	adds r0, r2, #0
	adds r0, #0x36
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #6
	adds r2, r0, r5
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08044A18
.L08044A32:
	strh r4, [r7, #0x34]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08044A3C: .4byte gUnknown_080D8740

	THUMB_FUNC_END func_080449E8

	THUMB_FUNC_START func_08044A40
func_08044A40: @ 0x08044A40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x38
	movs r0, #0x3c
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r6]
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bcs .L08044AC4
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	bl func_08042DC8
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r3, r5, #0
	adds r3, #0x4c
	adds r3, r3, r0
	ldrh r0, [r5, #0x34]
	ldr r1, .L08044AAC  @ 0x00003FFF
	ands r1, r0
	ldrb r2, [r4]
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #0xe
	orrs r1, r0
	strh r1, [r3]
	ldrb r0, [r6]
	adds r0, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r0, r2
	bge .L08044AB0
	strb r0, [r6]
	b .L08044AB4
	.align 2, 0
.L08044AAC: .4byte 0x00003FFF
.L08044AB0:
	movs r0, #5
	strh r0, [r5, #0x34]
.L08044AB4:
	adds r0, r5, #0
	bl NameSelect_DrawNameText
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b .L08044ACA
.L08044AC4:
	movs r0, #0
	bl SioPlaySomeIndexedSfx
.L08044ACA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08044A40

	THUMB_FUNC_START func_08044AD4
func_08044AD4: @ 0x08044AD4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08044B20
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r2, r5, #0
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne .L08044AFC
	subs r0, r1, #1
	strb r0, [r4]
.L08044AFC:
	ldrb r0, [r4]
	adds r0, r0, r5
	adds r0, #0x3d
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r2, r0
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x39
	strb r2, [r0]
	adds r0, r5, #0
	bl NameSelect_DrawNameText
	b .L08044B26
.L08044B20:
	movs r0, #0
	bl SioPlaySomeIndexedSfx
.L08044B26:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08044AD4

	THUMB_FUNC_START NameSelect_8044B2C
NameSelect_8044B2C: @ 0x08044B2C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08044B6A
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08044B5C
	ldr r0, .L08044B58  @ gUnknown_0203DA24
	ldrb r1, [r0, #3]
	adds r0, r4, #0
	bl func_08044968
	b .L08044B62
	.align 2, 0
.L08044B58: .4byte gUnknown_0203DA24
.L08044B5C:
	adds r0, r4, #0
	bl SetTacticianName
.L08044B62:
	adds r0, r5, #0
	bl Proc_Break
	b .L08044B70
.L08044B6A:
	movs r0, #0
	bl SioPlaySomeIndexedSfx
.L08044B70:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NameSelect_8044B2C

	THUMB_FUNC_START func_08044B78
func_08044B78: @ 0x08044B78
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r9, r2
	adds r7, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	bls .L08044BA4
	cmp r7, #0
	bne .L08044BA4
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_08044A40
	b .L08044C46
.L08044BA4:
	adds r6, r5, #0
	adds r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq .L08044C3C
	lsrs r2, r0, #1
	lsls r0, r2, #1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r0, r4, r0
	ldrh r1, [r0]
	ldr r3, .L08044C2C  @ 0x00003FFF
	adds r0, r3, #0
	ands r0, r1
	movs r1, #1
	mov r8, r1
	cmp r0, #0
	beq .L08044BCC
	movs r0, #0
	mov r8, r0
.L08044BCC:
	mov r1, r8
	subs r0, r2, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	bl func_08044550
	ldrb r1, [r6]
	lsrs r1, r1, #1
	mov r2, r8
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r2, [r1]
	lsrs r2, r2, #0xe
	lsls r1, r2, #1
	adds r1, r1, r2
	add r1, r9
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08044C30
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	ldr r0, [r4]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	mov r3, r8
	lsls r2, r3, #1
	subs r1, r1, r2
	bl func_08042DC8
	adds r0, r5, #0
	bl NameSelect_DrawNameText
	adds r0, r5, #0
	adds r0, #0x39
	mov r1, r9
	strb r1, [r0]
	movs r0, #1
	b .L08044C48
	.align 2, 0
.L08044C2C: .4byte 0x00003FFF
.L08044C30:
	cmp r7, #0
	bne .L08044C46
	movs r0, #0
	bl SioPlaySomeIndexedSfx
	b .L08044C46
.L08044C3C:
	cmp r7, #0
	bne .L08044C46
	movs r0, #0
	bl SioPlaySomeIndexedSfx
.L08044C46:
	movs r0, #0
.L08044C48:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08044B78

	THUMB_FUNC_START NameSelect_8044C54
NameSelect_8044C54: @ 0x08044C54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, .L08044CD4  @ gKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08044C72
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl func_080449E8
.L08044C72:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L08044C88
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl func_080449E8
.L08044C88:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L08044C9E
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl func_080449E8
.L08044C9E:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08044CB4
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	bl func_080449E8
.L08044CB4:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08044DAA
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #7
	bhi .L08044DAA
	lsls r0, r0, #2
	ldr r1, .L08044CD8  @ .L08044CDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08044CD4: .4byte gKeySt
.L08044CD8: .4byte .L08044CDC
.L08044CDC: @ jump table
	.4byte .L08044CFC @ case 0
	.4byte .L08044D30 @ case 1
	.4byte .L08044D4C @ case 2
	.4byte .L08044D72 @ case 3
	.4byte .L08044D06 @ case 4
	.4byte .L08044D10 @ case 5
	.4byte .L08044D1A @ case 6
	.4byte .L08044D22 @ case 7
.L08044CFC:
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_08044A40
	b .L08044DAA
.L08044D06:
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_08044AD4
	b .L08044DAA
.L08044D10:
	adds r0, r5, #0
	adds r1, r6, #0
	bl NameSelect_8044B2C
	b .L08044DAA
.L08044D1A:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	b .L08044D28
.L08044D22:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
.L08044D28:
	movs r3, #0
	bl func_08044B78
	b .L08044DAA
.L08044D30:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08044D6A
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x39
	strb r0, [r1]
	b .L08044E88
.L08044D4C:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	beq .L08044D6A
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x39
	strb r1, [r0]
	b .L08044E88
.L08044D6A:
	movs r0, #0
	bl SioPlaySomeIndexedSfx
	b .L08044DAA
.L08044D72:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls .L08044DA4
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08044D9A
	movs r0, #3
	strb r0, [r4]
.L08044D9A:
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b .L08044E88
.L08044DA4:
	movs r0, #0
	bl SioPlaySomeIndexedSfx
.L08044DAA:
	ldr r0, .L08044DC4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08044DF2
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r7, [r0]
	adds r4, r0, #0
	b .L08044DDA
	.align 2, 0
.L08044DC4: .4byte gKeySt
.L08044DC8:
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl func_08044B78
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08044DF2
.L08044DDA:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne .L08044DC8
.L08044DF2:
	ldr r4, .L08044E94  @ gKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08044E0A
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_08044AD4
.L08044E0A:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L08044E20
	movs r0, #3
	bl SioPlaySomeIndexedSfx
	movs r0, #5
	strh r0, [r5, #0x34]
.L08044E20:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L08044E9C
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #2
	bne .L08044E54
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08044E54
	adds r0, r2, #1
	strb r0, [r3]
.L08044E54:
	adds r2, r3, #0
	ldrb r0, [r2]
	movs r1, #3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x30]
	ldr r1, .L08044E98  @ 0x00FF00FF
	ands r0, r1
	cmp r0, #3
	bne .L08044E6C
	movs r0, #0
	strb r0, [r2]
.L08044E6C:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08044E88
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl func_080449E8
.L08044E88:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L08044ED0
	.align 2, 0
.L08044E94: .4byte gKeySt
.L08044E98: .4byte 0x00FF00FF
.L08044E9C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08044ED0
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08044EB8
	adds r0, r5, #0
	adds r1, r6, #0
	bl func_08044AD4
	b .L08044ED0
.L08044EB8:
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08044ED0
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
.L08044ED0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END NameSelect_8044C54

	THUMB_FUNC_START NameSelect_8044ED8
NameSelect_8044ED8: @ 0x08044ED8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	add r7, sp, #8
	adds r4, r0, #0
	mov r8, sp
	movs r0, #0x3c
	adds r0, r0, r4
	mov r9, r0
	ldrb r0, [r0]
	adds r0, #4
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r1, sp
	subs r1, r1, r0
	mov sp, r1
	add r6, sp, #8
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	bl func_08044550
	adds r5, r0, #0
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r1, r5, #0
	bl NameSelect_8044C54
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq .L08044F26
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08044F26:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl func_08044550
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x3d
	adds r1, r6, #0
	bl func_08042DC8
	mov r2, r9
	ldrb r0, [r2]
	subs r0, #1
	adds r0, r6, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	bl func_08044750
	lsls r1, r0, #3
	subs r3, r1, r0
	ldr r6, [r4, #0x2c]
	ldrh r0, [r5, #0x30]
	subs r1, r0, #4
	ldrh r0, [r5, #0x32]
	adds r2, r0, #1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	str r0, [sp]
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	bls .L08044F6C
	movs r0, #2
.L08044F6C:
	str r0, [sp, #4]
	adds r0, r6, #0
	bl func_0804CDD0
	mov sp, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END NameSelect_8044ED8

	THUMB_FUNC_START OnNameSelectHBlank
OnNameSelectHBlank: @ 0x08044F84
	push {lr}
	ldr r0, .L08044FAC  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa0
	bhi .L08044FD0
	cmp r0, #0x27
	bhi .L08044FB8
	ldr r1, .L08044FB0  @ 0x04000050
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, .L08044FB4  @ 0x00000F08
	adds r0, r2, #0
	strh r0, [r1]
	b .L08044FD0
	.align 2, 0
.L08044FAC: .4byte 0x04000006
.L08044FB0: .4byte 0x04000050
.L08044FB4: .4byte 0x00000F08
.L08044FB8:
	ldr r1, .L08044FD4  @ 0x04000050
	ldr r2, .L08044FD8  @ 0x00000442
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, .L08044FDC  @ 0x04000052
	ldr r0, .L08044FE0  @ gUnknown_03001810
	ldrb r1, [r0]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
.L08044FD0:
	pop {r0}
	bx r0
	.align 2, 0
.L08044FD4: .4byte 0x04000050
.L08044FD8: .4byte 0x00000442
.L08044FDC: .4byte 0x04000052
.L08044FE0: .4byte gUnknown_03001810

	THUMB_FUNC_END OnNameSelectHBlank

	THUMB_FUNC_START NameSelect_8044FE4
NameSelect_8044FE4: @ 0x08044FE4
	push {lr}
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	ldr r0, .L08044FF8  @ OnNameSelectHBlank
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
.L08044FF8: .4byte OnNameSelectHBlank

	THUMB_FUNC_END NameSelect_8044FE4

	THUMB_FUNC_START NameSelect_8044FFC
NameSelect_8044FFC: @ 0x08044FFC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, .L08045038  @ gUnknown_03001810
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf
	movs r2, #0
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls .L0804502E
	adds r0, r6, #0
	bl Proc_Break
.L0804502E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045038: .4byte gUnknown_03001810

	THUMB_FUNC_END NameSelect_8044FFC

	THUMB_FUNC_START NameSelect_804503C
NameSelect_804503C: @ 0x0804503C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	adds r0, #1
	movs r5, #0
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl func_08044614
	movs r0, #2
	bl EnableBgSync
	adds r4, #0x3a
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NameSelect_804503C

	THUMB_FUNC_START NameSelect_8045068
NameSelect_8045068: @ 0x08045068
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, .L080450A8  @ gUnknown_03001810
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xf
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls .L080450A0
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r6, #0
	bl Proc_Break
.L080450A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080450A8: .4byte gUnknown_03001810

	THUMB_FUNC_END NameSelect_8045068

	THUMB_FUNC_START NameSelect_DrawSomeText
NameSelect_DrawSomeText: @ 0x080450AC
	push {r4, lr}
	adds r0, #0x3b
	movs r1, #1
	strb r1, [r0]
	bl func_0804D80C
	ldr r4, .L080450FC  @ gUnknown_0203DAB0
	adds r0, r4, #0
	bl ClearText
	ldr r0, .L08045100  @ 0x00000141
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x26
	bl Text_SetCursor
	movs r0, #0xa3
	lsls r0, r0, #1
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L08045104  @ gBg0Tm+0x316
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080450FC: .4byte gUnknown_0203DAB0
.L08045100: .4byte 0x00000141
.L08045104: .4byte gBg0Tm+0x316

	THUMB_FUNC_END NameSelect_DrawSomeText

	THUMB_FUNC_START NameSelect_8045108
NameSelect_8045108: @ 0x08045108
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x40
	movs r1, #0x58
	bl func_0804D834
	ldr r0, .L08045198  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L08045136
	adds r1, r5, #0
	adds r1, #0x3b
	ldrb r0, [r1]
	cmp r0, #1
	bne .L08045136
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08045136:
	ldr r0, .L08045198  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x3b
	cmp r0, #0
	beq .L08045158
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08045158
	movs r0, #1
	strb r0, [r4]
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08045158:
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x50
	movs r1, #0x60
	bl DisplayUiHand
	ldr r0, .L08045198  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080451A0
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	ldr r0, .L0804519C  @ gBg0Tm+0x316
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	b .L080451E6
	.align 2, 0
.L08045198: .4byte gKeySt
.L0804519C: .4byte gBg0Tm+0x316
.L080451A0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080451E6
	ldrb r0, [r4]
	cmp r0, #0
	bne .L080451C8
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	ldr r1, .L080451C4  @ gUnknown_0203DD24
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b .L080451CE
	.align 2, 0
.L080451C4: .4byte gUnknown_0203DD24
.L080451C8:
	movs r0, #1
	bl SioPlaySomeIndexedSfx
.L080451CE:
	ldr r0, .L080451EC  @ gBg0Tm+0x316
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
.L080451E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080451EC: .4byte gBg0Tm+0x316

	THUMB_FUNC_END NameSelect_8045108

	THUMB_FUNC_START NameSelect_80451F0
NameSelect_80451F0: @ 0x080451F0
	push {lr}
	bl EndBG3Slider
	bl CheckGameLinkArenaBit
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08045204
	bl nullsub_13
.L08045204:
	pop {r0}
	bx r0

	THUMB_FUNC_END NameSelect_80451F0

	THUMB_FUNC_START func_08045208
func_08045208: @ 0x08045208
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r2, [r1]
	lsls r1, r2, #3
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r2, #0xa
	bl UnpackFaceChibiSprGraphics
	movs r0, #0
	str r0, [r4, #0x3c]
	subs r0, #0x26
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08045208

	THUMB_FUNC_START func_08045234
func_08045234: @ 0x08045234
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x2c]
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne .L08045254
	ldr r0, [r6, #0x3c]
	cmp r0, #0x20
	ble .L0804524E
	adds r0, r6, #0
	bl Proc_Break
.L0804524E:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq .L0804525A
.L08045254:
	ldr r0, [r6, #0x34]
	adds r0, #1
	str r0, [r6, #0x34]
.L0804525A:
	ldr r0, [r6, #0x38]
	subs r0, #1
	str r0, [r6, #0x38]
	cmp r0, #0
	bge .L08045268
	movs r0, #0
	str r0, [r6, #0x38]
.L08045268:
	ldr r4, [r6, #0x38]
	cmp r4, #0
	beq .L08045270
	b .L0804537E
.L08045270:
	ldr r3, [r6, #0x3c]
	cmp r3, #0x20
	bgt .L08045288
	movs r1, #0x50
	negs r1, r1
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r6, #0x30]
.L08045288:
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	subs r2, #0x10
	ldr r3, .L08045330  @ gUnknown_085A96E4
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x48
	ldr r2, [r6, #0x34]
	subs r2, #6
	ldr r3, .L08045334  @ gUnknown_085A96D4
	adds r5, r6, #0
	adds r5, #0x42
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x60
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, .L08045338  @ gUnknown_080D9DE4
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x40
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, .L0804533C  @ gUnknown_080D9E06
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	negs r1, r1
	adds r1, #0x70
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, .L08045340  @ gUnknown_085AAA50
	ldrb r4, [r5]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r6, #0x30]
	negs r0, r0
	adds r4, r0, #0
	adds r4, #0x7c
	ldr r2, [r6, #0x34]
	ldr r3, .L08045344  @ gUnknown_080D9DF2
	ldrb r0, [r5]
	cmp r0, #3
	beq .L08045348
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	b .L0804534A
	.align 2, 0
.L08045330: .4byte gUnknown_085A96E4
.L08045334: .4byte gUnknown_085A96D4
.L08045338: .4byte gUnknown_080D9DE4
.L0804533C: .4byte gUnknown_080D9E06
.L08045340: .4byte gUnknown_085AAA50
.L08045344: .4byte gUnknown_080D9DF2
.L08045348:
	movs r0, #0x40
.L0804534A:
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	ldr r1, [r6, #0x30]
	negs r1, r1
	adds r1, #0xd0
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, .L08045388  @ gUnknown_080D9E0E
	ldrb r4, [r5]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
.L0804537E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08045388: .4byte gUnknown_080D9E0E

	THUMB_FUNC_END func_08045234

	THUMB_FUNC_START func_0804538C
func_0804538C: @ 0x0804538C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	subs r2, #0x10
	ldr r3, .L08045434  @ gUnknown_085A96E4
	adds r7, r5, #0
	adds r7, #0x43
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x48
	ldr r2, [r5, #0x34]
	subs r2, #6
	ldr r3, .L08045438  @ gUnknown_085A96D4
	adds r6, r5, #0
	adds r6, #0x42
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x60
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, .L0804543C  @ gUnknown_080D9DE4
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x40
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, .L08045440  @ gUnknown_080D9E06
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	negs r1, r1
	adds r1, #0x70
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, .L08045444  @ gUnknown_085AAA50
	ldrb r4, [r6]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r5, #0x30]
	negs r0, r0
	adds r4, r0, #0
	adds r4, #0x7c
	ldr r2, [r5, #0x34]
	ldr r3, .L08045448  @ gUnknown_080D9DF2
	ldrb r0, [r6]
	cmp r0, #3
	beq .L0804544C
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	b .L0804544E
	.align 2, 0
.L08045434: .4byte gUnknown_085A96E4
.L08045438: .4byte gUnknown_085A96D4
.L0804543C: .4byte gUnknown_080D9DE4
.L08045440: .4byte gUnknown_080D9E06
.L08045444: .4byte gUnknown_085AAA50
.L08045448: .4byte gUnknown_080D9DF2
.L0804544C:
	movs r0, #0x40
.L0804544E:
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	ldr r1, [r5, #0x30]
	negs r1, r1
	adds r1, #0xd0
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, .L08045490  @ gUnknown_080D9E0E
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08045490: .4byte gUnknown_080D9E0E

	THUMB_FUNC_END func_0804538C

	THUMB_FUNC_START func_08045494
func_08045494: @ 0x08045494
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov r9, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, .L080454E0  @ gUnknown_085A96F4
	mov r1, r8
	bl SpawnProc
	adds r1, r0, #0
	mov r0, r8
	str r0, [r1, #0x2c]
	mov r0, r9
	str r0, [r1, #0x38]
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #3
	strb r5, [r0]
	subs r0, #1
	strb r6, [r0]
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L080454E0: .4byte gUnknown_085A96F4

	THUMB_FUNC_END func_08045494

	THUMB_FUNC_START func_080454E4
func_080454E4: @ 0x080454E4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r0, #0x40
	ldrb r5, [r0]
	ldr r6, .L08045524  @ gBg2Tm
	adds r1, r2, #0
	adds r1, #0x42
	adds r4, r2, #0
	adds r4, #0x41
	ldrb r0, [r4]
	subs r3, r0, #1
	lsls r0, r3, #3
	adds r0, r2, r0
	adds r0, #0x44
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne .L08045534
	ldr r2, .L08045528  @ gUnknown_080D9E1C
	lsls r0, r3, #1
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	adds r0, r0, r6
	ldr r1, .L0804552C  @ gUnknown_085ADE88
	ldr r2, .L08045530  @ 0x00002078
	bl TmApplyTsa_thm
	b .L0804555E
	.align 2, 0
.L08045524: .4byte gBg2Tm
.L08045528: .4byte gUnknown_080D9E1C
.L0804552C: .4byte gUnknown_085ADE88
.L08045530: .4byte 0x00002078
.L08045534:
	movs r2, #0
	ldr r7, .L08045564  @ gUnknown_080D9E1C
	adds r3, r4, #0
	lsls r1, r5, #3
	ldr r5, .L08045568  @ 0x00001034
	adds r4, r5, #0
.L08045540:
	ldrb r0, [r3]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	adds r2, #1
	cmp r2, #0x5f
	ble .L08045540
.L0804555E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08045564: .4byte gUnknown_080D9E1C
.L08045568: .4byte 0x00001034

	THUMB_FUNC_END func_080454E4

	THUMB_FUNC_START func_0804556C
func_0804556C: @ 0x0804556C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r0, #0x40
	ldrb r0, [r0]
	mov r9, r0
	ldr r0, .L080455C0  @ gUnknown_02000C60
	bl SetTextFont
	movs r5, #0
	cmp r5, r9
	bge .L080455FA
	mov sl, r5
	movs r0, #0x98
	mov r8, r0
	movs r7, #0
	movs r6, #0
.L08045596:
	ldr r0, .L080455C4  @ gUnknown_0203DAC5
	adds r4, r6, r0
	adds r0, r4, #0
	bl GetStringTextLen
	adds r1, r0, #0
	movs r0, #0x48
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	cmp r5, #2
	bgt .L080455CC
	adds r1, r7, r1
	ldr r0, .L080455C8  @ gUnknown_0203DB14
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	b .L080455D6
	.align 2, 0
.L080455C0: .4byte gUnknown_02000C60
.L080455C4: .4byte gUnknown_0203DAC5
.L080455C8: .4byte gUnknown_0203DB14
.L080455CC:
	ldr r0, .L0804560C  @ gUnknown_0203DB1C
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
.L080455D6:
	ldr r0, [sp]
	adds r0, #0x48
	add r0, sl
	ldr r3, [r0]
	ldr r0, .L0804560C  @ gUnknown_0203DB1C
	mov r1, r8
	movs r2, #2
	bl func_08042DE8
	movs r0, #8
	add sl, r0
	movs r0, #0x20
	add r8, r0
	adds r7, #0x48
	adds r6, #0xf
	adds r5, #1
	cmp r5, r9
	blt .L08045596
.L080455FA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804560C: .4byte gUnknown_0203DB1C

	THUMB_FUNC_END func_0804556C

	THUMB_FUNC_START func_08045610
func_08045610: @ 0x08045610
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08045630  @ gUnknown_085A9774
	adds r1, r4, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x42
	adds r4, #0x44
	ldrb r0, [r0]
	ldrb r4, [r4]
	cmp r0, r4
	bne .L08045634
	movs r0, #1
	b .L08045636
	.align 2, 0
.L08045630: .4byte gUnknown_085A9774
.L08045634:
	movs r0, #0
.L08045636:
	str r0, [r1, #0x58]
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08045610

	THUMB_FUNC_START func_08045640
func_08045640: @ 0x08045640
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl func_08043044
	bl func_0804C33C
	ldr r0, .L0804579C  @ gUnknown_085ABD68
	ldr r1, .L080457A0  @ 0x06014800
	bl Decompress
	ldr r0, .L080457A4  @ gUnknown_085ADA38
	ldr r1, .L080457A8  @ 0x06016000
	bl Decompress
	ldr r0, .L080457AC  @ gUnknown_085AD0CC
	ldr r1, .L080457B0  @ 0x06016800
	bl Decompress
	ldr r0, .L080457B4  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L080457B8  @ gUnknown_085ADDC8
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080457BC  @ gUnknown_085ACD20
	ldr r1, .L080457C0  @ 0x06000F00
	bl Decompress
	ldr r0, .L080457C4  @ gUnknown_085ADE08
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L080457C8  @ gUnknown_085AF170
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L080457CC  @ gUnknown_085B081C
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L080457D0  @ gUnknown_085B089C
	ldr r4, .L080457D4  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L080457D8  @ gBg3Tm
	movs r2, #0xa0
	lsls r2, r2, #8
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, .L080457DC  @ gUnknown_02000C60
	ldr r1, .L080457E0  @ 0x06012000
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, .L080457E4  @ Pal_SystemText
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, .L080457E8  @ gUnknown_0203DB14
	movs r5, #1
.L080456EC:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge .L080456EC
	ldr r0, .L080457EC  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r2, [r0, #7]
	adds r1, r6, #0
	adds r1, #0x40
	movs r5, #0
	strb r2, [r1]
	ldrb r1, [r0, #7]
	adds r2, r6, #0
	adds r2, #0x41
	strb r1, [r2]
	ldrb r0, [r0, #6]
	adds r1, r6, #0
	adds r1, #0x42
	strb r0, [r1]
	add r0, sp, #4
	strh r5, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldr r2, .L080457F0  @ 0x01000010
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl func_08048884
	adds r0, r6, #0
	bl func_0804556C
	movs r0, #0xb0
	str r0, [r6, #0x64]
	movs r0, #2
	movs r1, #0
	movs r2, #0xb0
	bl SetBgOffset
	ldr r2, .L080457F4  @ gDispIo
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
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r6, #0
	bl func_08045610
	movs r0, #8
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804579C: .4byte gUnknown_085ABD68
.L080457A0: .4byte 0x06014800
.L080457A4: .4byte gUnknown_085ADA38
.L080457A8: .4byte 0x06016000
.L080457AC: .4byte gUnknown_085AD0CC
.L080457B0: .4byte 0x06016800
.L080457B4: .4byte gUnknown_085ADC48
.L080457B8: .4byte gUnknown_085ADDC8
.L080457BC: .4byte gUnknown_085ACD20
.L080457C0: .4byte 0x06000F00
.L080457C4: .4byte gUnknown_085ADE08
.L080457C8: .4byte gUnknown_085AF170
.L080457CC: .4byte gUnknown_085B081C
.L080457D0: .4byte gUnknown_085B089C
.L080457D4: .4byte gBuf
.L080457D8: .4byte gBg3Tm
.L080457DC: .4byte gUnknown_02000C60
.L080457E0: .4byte 0x06012000
.L080457E4: .4byte Pal_SystemText
.L080457E8: .4byte gUnknown_0203DB14
.L080457EC: .4byte gUnknown_085A92E0
.L080457F0: .4byte 0x01000010
.L080457F4: .4byte gDispIo

	THUMB_FUNC_END func_08045640

	THUMB_FUNC_START func_080457F8
func_080457F8: @ 0x080457F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x40
	ldrb r6, [r0]
	ldr r2, [r4, #0x64]
	subs r2, #1
	str r2, [r4, #0x64]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	bl func_0804D6D4
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	cmp r0, #0
	beq .L08045880
	ldr r2, [r4, #0x64]
	asrs r2, r2, #3
	ldr r3, .L08045894  @ gUnknown_080D9E1C
	subs r0, #1
	lsls r0, r0, #1
	lsls r1, r6, #3
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #4
	cmp r2, r0
	bne .L08045880
	adds r0, r4, #0
	bl func_080454E4
	movs r0, #4
	bl EnableBgSync
	ldr r2, .L08045898  @ gUnknown_0203DD90
	ldrb r1, [r5]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, #0x44
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r2, #0x24
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x28
	bl func_08045494
	ldrb r2, [r5]
	subs r2, #1
	lsls r2, r2, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r2
	str r0, [r1]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
.L08045880:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne .L0804588C
	adds r0, r4, #0
	bl Proc_Break
.L0804588C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045894: .4byte gUnknown_080D9E1C
.L08045898: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_080457F8

	THUMB_FUNC_START func_0804589C
func_0804589C: @ 0x0804589C
	push {r4, lr}
	adds r4, r0, #0
	bl func_0804D6D4
	ldr r0, .L080458D8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L080458D2
	ldr r2, .L080458DC  @ gMPlayTable
	ldr r0, .L080458E0  @ gSongTable
	ldr r1, .L080458E4  @ 0x0000040C
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	bl m4aMPlayFadeOut
	adds r0, r4, #0
	bl Proc_Break
.L080458D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080458D8: .4byte gKeySt
.L080458DC: .4byte gMPlayTable
.L080458E0: .4byte gSongTable
.L080458E4: .4byte 0x0000040C

	THUMB_FUNC_END func_0804589C

	THUMB_FUNC_START func_080458E8
func_080458E8: @ 0x080458E8
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq .L080458FC
	movs r0, #0x3a
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	b .L08045906
.L080458FC:
	movs r0, #0x3b
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
.L08045906:
	ldr r0, .L0804591C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08045918
	movs r0, #0x81
	bl m4aSongNumStart
.L08045918:
	pop {r0}
	bx r0
	.align 2, 0
.L0804591C: .4byte gPlaySt

	THUMB_FUNC_END func_080458E8

	THUMB_FUNC_START func_08045920
func_08045920: @ 0x08045920
	push {lr}
	movs r0, #0x3b
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08045920

	THUMB_FUNC_START func_08045930
func_08045930: @ 0x08045930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r1
	mov sl, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r4, r3, #0
	movs r2, #0
	ldr r1, .L08045964  @ gUnknown_0203DC44
.L0804594C:
	ldr r0, [r1]
	lsrs r0, r0, #5
	cmp r0, r4
	bcs .L08045968
	adds r7, r2, #0
	movs r2, #9
	lsls r3, r3, #5
	str r3, [sp, #4]
	cmp r2, r7
	ble .L080459E4
	b .L08045976
	.align 2, 0
.L08045964: .4byte gUnknown_0203DC44
.L08045968:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble .L0804594C
	movs r0, #1
	negs r0, r0
	b .L08045A48
.L08045976:
	ldr r6, .L08045A58  @ gUnknown_0203DC44
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r5, r1, r6
	subs r2, #1
	mov r8, r2
	lsls r4, r2, #2
	add r4, r8
	lsls r4, r4, #2
	adds r4, r4, r6
	ldrb r2, [r4]
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x1e
	ldrb r3, [r5]
	movs r0, #4
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	ldr r3, [r4]
	lsrs r3, r3, #5
	lsls r3, r3, #5
	ldr r0, [r5]
	movs r2, #0x1f
	ands r0, r2
	orrs r0, r3
	str r0, [r5]
	ldrb r0, [r4]
	movs r2, #0xc
	ands r2, r0
	ldrb r3, [r5]
	movs r0, #0xd
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	ldrb r2, [r4]
	movs r3, #0x10
	ands r3, r2
	movs r2, #0x11
	negs r2, r2
	ands r0, r2
	orrs r0, r3
	strb r0, [r5]
	adds r0, r6, #0
	subs r0, #0x10
	adds r0, r1, r0
	adds r6, #4
	adds r1, r1, r6
	bl func_08042DC8
	mov r2, r8
	cmp r2, r7
	bgt .L08045976
.L080459E4:
	ldr r5, .L08045A58  @ gUnknown_0203DC44
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r4, r1, r5
	movs r6, #3
	ldr r2, [sp]
	ands r2, r6
	ldrb r3, [r4]
	movs r0, #4
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [r4]
	mov r3, r9
	ands r3, r6
	lsls r3, r3, #2
	ldrb r2, [r4]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	movs r2, #1
	mov r3, sl
	ands r3, r2
	lsls r3, r3, #4
	movs r2, #0x11
	negs r2, r2
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	ldr r0, .L08045A5C  @ gUnknown_085A92E0
	ldr r0, [r0]
	movs r2, #6
	ldrsb r2, [r0, r2]
	lsls r0, r2, #4
	subs r0, r0, r2
	ldr r2, .L08045A60  @ gUnknown_0203DAC5
	adds r0, r0, r2
	adds r5, #4
	adds r1, r1, r5
	bl func_08042DC8
	adds r0, r7, #0
.L08045A48:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08045A58: .4byte gUnknown_0203DC44
.L08045A5C: .4byte gUnknown_085A92E0
.L08045A60: .4byte gUnknown_0203DAC5

	THUMB_FUNC_END func_08045930

	THUMB_FUNC_START func_08045A64
func_08045A64: @ 0x08045A64
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r1, .L08045AD0  @ gUnknown_0203DA24
	adds r0, r1, #0
	adds r0, #0xec
	ldrb r5, [r0]
	lsls r5, r5, #0x1e
	lsrs r5, r5, #0x1f
	adds r1, #0xa0
	ldrb r6, [r1]
	subs r6, #1
	bl func_08049A60
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, .L08045AD4  @ gUnknown_0203DD90
	ldr r0, .L08045AD8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r0, .L08045ADC  @ gUnknown_0203DC44
	mov r8, r0
	bl func_080A69DC
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	mov r3, r9
	bl func_08045930
	str r0, [r7, #0x58]
	mov r0, r8
	bl func_080A69A0
	ldr r1, [r7, #0x58]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L08045AE0
	adds r0, r1, #0
	adds r1, r7, #0
	bl func_08047654
	b .L08045AE6
	.align 2, 0
.L08045AD0: .4byte gUnknown_0203DA24
.L08045AD4: .4byte gUnknown_0203DD90
.L08045AD8: .4byte gUnknown_085A92E0
.L08045ADC: .4byte gUnknown_0203DC44
.L08045AE0:
	movs r0, #1
	bl FadeBgmOut
.L08045AE6:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08045A64

	THUMB_FUNC_START func_08045AF4
func_08045AF4: @ 0x08045AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, .L08045B78  @ gUnknown_080D9E44
	mov r0, sp
	movs r2, #3
	bl memcpy
	bl InitUnits
	movs r6, #0
	ldr r1, .L08045B7C  @ gUnknown_0203DA24
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge .L08045BCC
	mov r9, r1
.L08045B1C:
	lsls r4, r6, #6
	adds r4, #1
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	mov r0, r9
	adds r0, #6
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r2, r6, #4
	subs r2, r2, r6
	ldr r1, .L08045B80  @ gUnknown_0203DAC5
	adds r2, r2, r1
	adds r1, r5, #0
	bl func_080A693C
	movs r7, #0
	adds r0, r6, #1
	mov sl, r0
	lsls r0, r6, #1
	ldr r1, .L08045B84  @ gUnknown_0203DDB4
	adds r0, r0, r1
	mov r8, r0
.L08045B4C:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	strb r0, [r5, #9]
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	movs r1, #0
	strb r1, [r5, #0x1b]
	ldr r0, .L08045B88  @ gUnknown_0203DB10
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08045B8C
	adds r0, r5, #0
	bl func_080431B4
	b .L08045B92
	.align 2, 0
.L08045B78: .4byte gUnknown_080D9E44
.L08045B7C: .4byte gUnknown_0203DA24
.L08045B80: .4byte gUnknown_0203DAC5
.L08045B84: .4byte gUnknown_0203DDB4
.L08045B88: .4byte gUnknown_0203DB10
.L08045B8C:
	adds r0, r5, #0
	bl func_0804D40C
.L08045B92:
	cmp r7, #0
	bne .L08045BA0
	adds r0, r5, #0
	bl GetUnitChibiFid
	mov r1, r8
	strh r0, [r1]
.L08045BA0:
	strb r4, [r5, #0xb]
	cmp r6, #0
	beq .L08045BB8
	ldr r0, .L08045C04  @ gUnknown_0203DB10
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08045BB8
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
.L08045BB8:
	adds r4, #1
	adds r7, #1
	cmp r7, #4
	ble .L08045B4C
	mov r6, sl
	mov r1, r9
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt .L08045B1C
.L08045BCC:
	ldr r0, .L08045C08  @ gUnknown_0203DD90
	movs r1, #0
	strb r1, [r0]
	ldr r2, .L08045C0C  @ gUnknown_085A92E0
	ldr r0, [r2]
	strb r1, [r0, #6]
	ldr r3, [r2]
	ldr r1, .L08045C10  @ gUnknown_0203DA24
	ldrb r0, [r1, #5]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r2, [r2]
	ldrb r0, [r1, #5]
	adds r0, #2
	strb r0, [r2, #7]
	ldrb r0, [r1, #5]
	adds r0, #2
	adds r1, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08045C04: .4byte gUnknown_0203DB10
.L08045C08: .4byte gUnknown_0203DD90
.L08045C0C: .4byte gUnknown_085A92E0
.L08045C10: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08045AF4

	THUMB_FUNC_START StartSioMain2
StartSioMain2: @ 0x08045C14
	push {lr}
	ldr r0, .L08045C24  @ gUnknown_085AA6BC
	movs r1, #2
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08045C24: .4byte gUnknown_085AA6BC

	THUMB_FUNC_END StartSioMain2

	THUMB_FUNC_START func_08045C28
func_08045C28: @ 0x08045C28
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, .L08045C60  @ gUnknown_085AA6BC
	bl FindProc
	cmp r0, #0
	bne .L08045C5A
	ldr r5, .L08045C64  @ gUnknown_0203DA24
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne .L08045C46
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L08045C46:
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne .L08045C54
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
.L08045C54:
	adds r0, r4, #0
	bl Proc_Break
.L08045C5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08045C60: .4byte gUnknown_085AA6BC
.L08045C64: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08045C28

	THUMB_FUNC_START func_08045C68
func_08045C68: @ 0x08045C68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl SetInitTalkTextFont
	bl Dialogue_ClearLines
	bl ResetTextFont
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl StartTalkExt
	movs r0, #1
	bl Dialogue_SetDefaultTextColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #2
	bl Dialogue_SetCharacterDisplayDelay
	movs r0, #1
	bl SetActiveTalkFace
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08045C68

	THUMB_FUNC_START func_08045CBC
func_08045CBC: @ 0x08045CBC
	push {lr}
	ldr r0, .L08045CD4  @ gUnknown_085A9354
	bl EndEachProc
	ldr r0, .L08045CD8  @ gUnknown_085A937C
	bl EndEachProc
	ldr r0, .L08045CDC  @ gUnknown_085A932C
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08045CD4: .4byte gUnknown_085A9354
.L08045CD8: .4byte gUnknown_085A937C
.L08045CDC: .4byte gUnknown_085A932C

	THUMB_FUNC_END func_08045CBC

	THUMB_FUNC_START func_08045CE0
func_08045CE0: @ 0x08045CE0
	push {lr}
	bl func_0804197C
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08045CE0

	THUMB_FUNC_START func_08045CEC
func_08045CEC: @ 0x08045CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, .L08045D68  @ gUnknown_0203DA24
	mov r9, r0
	movs r0, #0x98
	lsls r0, r0, #2
	mov r8, r0
	movs r0, #0xa1
	add r0, r9
	mov sl, r0
	movs r7, #5
.L08045D0C:
	mov r0, r9
	adds r0, #0x9c
	adds r5, r6, r0
	ldr r0, .L08045D6C  @ gUnknown_085A92E0
	ldr r0, [r0]
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r1, [r0]
	ldrb r0, [r5]
	cmp r0, r1
	beq .L08045D9C
	strb r1, [r5]
	lsls r0, r6, #3
	mov r1, r9
	adds r1, #0xc
	adds r4, r0, r1
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldrb r0, [r5]
	cmp r0, #4
	bhi .L08045D78
	ldr r1, .L08045D70  @ gUnknown_080D9D34
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	bl func_08014C54
	ldr r0, .L08045D74  @ gUnknown_085ADDA8
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
	b .L08045D96
	.align 2, 0
.L08045D68: .4byte gUnknown_0203DA24
.L08045D6C: .4byte gUnknown_085A92E0
.L08045D70: .4byte gUnknown_080D9D34
.L08045D74: .4byte gUnknown_085ADDA8
.L08045D78:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	mov r3, sl
	bl func_08014C54
	lsls r0, r6, #5
	ldr r1, .L08045DBC  @ gUnknown_085ADC48
	adds r0, r0, r1
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
.L08045D96:
	movs r0, #1
	bl EnableBgSync
.L08045D9C:
	movs r0, #0x20
	add r8, r0
	movs r0, #0xf
	add sl, r0
	adds r7, #3
	adds r6, #1
	cmp r6, #3
	ble .L08045D0C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08045DBC: .4byte gUnknown_085ADC48

	THUMB_FUNC_END func_08045CEC

	THUMB_FUNC_START func_08045DC0
func_08045DC0: @ 0x08045DC0
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	bl func_08043044
	bl func_0804C33C
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl func_08086CE8
	ldr r0, .L08045ECC  @ gUnknown_085ABD68
	ldr r1, .L08045ED0  @ 0x06014800
	bl Decompress
	ldr r0, .L08045ED4  @ gUnknown_085ADA38
	ldr r1, .L08045ED8  @ 0x06016000
	bl Decompress
	ldr r0, .L08045EDC  @ gUnknown_085AC604
	ldr r1, .L08045EE0  @ 0x06016800
	bl Decompress
	movs r4, #0x98
	lsls r4, r4, #2
	movs r5, #3
.L08045DFC:
	ldr r0, .L08045EE4  @ gUnknown_085ADDA8
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge .L08045DFC
	ldr r4, .L08045EE8  @ gUnknown_0203DA24
	ldrb r0, [r4, #3]
	add r1, sp, #4
	bl func_080A66F4
	ldr r0, .L08045EEC  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl func_08043164
	movs r5, #0
	adds r4, #0x9c
	movs r2, #0xff
.L08045E30:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble .L08045E30
	bl func_08045CEC
	movs r5, #0
	ldr r2, .L08045EF0  @ gUnknown_03004E86
.L08045E46:
	adds r0, r5, r2
	mov r1, sp
	adds r1, r1, r5
	adds r1, #4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0xe
	ble .L08045E46
	movs r0, #0
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r6, #0
	bl func_0804C2EC
	movs r0, #0x50
	movs r1, #0x20
	adds r2, r6, #0
	bl func_0804D664
	str r0, [r6, #0x2c]
	ldr r0, .L08045EF4  @ gUnknown_085A9864
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	ldr r0, [r6, #0x2c]
	ldr r2, .L08045EF8  @ gUnknown_080D9D5E
	ldr r1, .L08045EE8  @ gUnknown_0203DA24
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl func_0804C49C
	bl func_0804C508
	ldr r0, [r6, #0x30]
	movs r1, #0xe9
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #1
	bl func_08043100
	ldr r2, .L08045EFC  @ gDispIo
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
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08045ECC: .4byte gUnknown_085ABD68
.L08045ED0: .4byte 0x06014800
.L08045ED4: .4byte gUnknown_085ADA38
.L08045ED8: .4byte 0x06016000
.L08045EDC: .4byte gUnknown_085AC604
.L08045EE0: .4byte 0x06016800
.L08045EE4: .4byte gUnknown_085ADDA8
.L08045EE8: .4byte gUnknown_0203DA24
.L08045EEC: .4byte gFont_203DB64
.L08045EF0: .4byte gUnknown_03004E86
.L08045EF4: .4byte gUnknown_085A9864
.L08045EF8: .4byte gUnknown_080D9D5E
.L08045EFC: .4byte gDispIo

	THUMB_FUNC_END func_08045DC0

	THUMB_FUNC_START func_08045F00
func_08045F00: @ 0x08045F00
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, .L08045F38  @ 0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, .L08045F3C  @ gUnknown_085A9354
	movs r1, #0
	bl SpawnProc
	ldr r0, .L08045F40  @ gUnknown_085A937C
	adds r1, r4, #0
	bl SpawnProc
	ldr r0, .L08045F44  @ gUnknown_085A932C
	adds r1, r4, #0
	bl SpawnProc
	movs r1, #1
	negs r1, r1
	mov r0, sp
	bl func_08042568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08045F38: .4byte 0x00002586
.L08045F3C: .4byte gUnknown_085A9354
.L08045F40: .4byte gUnknown_085A937C
.L08045F44: .4byte gUnknown_085A932C

	THUMB_FUNC_END func_08045F00

	THUMB_FUNC_START func_08045F48
func_08045F48: @ 0x08045F48
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0
	ldr r5, [r4, #0x2c]
	ldr r0, .L08045F88  @ gUnknown_0203DD28
	str r1, [r0]
	mov r0, sp
	strb r1, [r0]
	bl func_08045CEC
	ldr r0, .L08045F8C  @ gUnknown_085A932C
	bl FindProc
	cmp r0, #0
	beq .L08045F94
	ldr r0, .L08045F90  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne .L08045F7A
	b .L0804618A
.L08045F7A:
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	bl func_0804C31C
	b .L08045FEE
	.align 2, 0
.L08045F88: .4byte gUnknown_0203DD28
.L08045F8C: .4byte gUnknown_085A932C
.L08045F90: .4byte gKeySt
.L08045F94:
	ldr r0, .L08046000  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08045FBC
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	bl func_0804C31C
	bl func_08045CBC
	bl func_08045CE0
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
.L08045FBC:
	ldr r0, .L08046004  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	str r1, [r5, #0x34]
	movs r1, #0
	adds r7, r0, #0
	adds r2, #0x1a
.L08045FCC:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls .L08045FD6
	adds r6, #1
.L08045FD6:
	adds r1, #1
	cmp r1, #3
	ble .L08045FCC
	adds r5, r7, #0
	ldr r0, [r5]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne .L08046008
.L08045FEE:
	bl func_08045CBC
	bl func_08045CE0
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b .L0804618A
	.align 2, 0
.L08046000: .4byte gKeySt
.L08046004: .4byte gUnknown_085A92E0
.L08046008:
	bl func_080421E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804601E
	ldr r1, [r5]
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bhi .L0804601E
	cmp r6, #0
	beq .L08046046
.L0804601E:
	bl func_08045CBC
	bl func_08045CE0
	adds r0, r4, #0
	bl func_08045F00
	movs r0, #0
	str r0, [r4, #0x30]
	movs r0, #0xe9
	lsls r0, r0, #3
	movs r1, #1
	bl func_08043100
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl func_0804C2EC
	b .L0804618A
.L08046046:
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne .L080460DC
	bl func_0804226C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L080460DC
	ldr r0, [r4, #0x30]
	cmp r0, #2
	beq .L0804606C
	movs r0, #2
	str r0, [r4, #0x30]
	ldr r0, .L080460CC  @ 0x0000074A
	movs r1, #1
	bl func_08043100
.L0804606C:
	ldr r0, .L080460D0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L080460EE
	bl func_0804C31C
	ldr r0, [r7]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r1, #0
	adds r3, r7, #0
	movs r2, #0
.L0804608E:
	ldr r0, [r3]
	adds r0, #0x1a
	adds r0, r0, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	ble .L0804608E
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	bl func_0804213C
	ldr r2, .L080460D4  @ gUnknown_085A92E0
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, .L080460D8  @ gUnknown_0203DA24
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl func_08042AF4
	mov r1, sp
	movs r0, #0x18
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl func_080426F4
	str r0, [r4, #0x34]
	b .L08046150
	.align 2, 0
.L080460CC: .4byte 0x0000074A
.L080460D0: .4byte gKeySt
.L080460D4: .4byte gUnknown_085A92E0
.L080460D8: .4byte gUnknown_0203DA24
.L080460DC:
	ldr r0, [r4, #0x30]
	cmp r0, #1
	beq .L080460EE
	movs r0, #1
	str r0, [r4, #0x30]
	ldr r0, .L08046158  @ 0x00000749
	movs r1, #1
	bl func_08043100
.L080460EE:
	ldr r5, .L0804615C  @ gUnknown_085A92E0
	ldr r1, [r5]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L08046164
	ldrb r0, [r1, #6]
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08046164
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08046164
	bl func_0804C31C
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r1, #0
	adds r3, r5, #0
	movs r2, #0
.L0804612A:
	ldr r0, [r3]
	adds r0, #0x1a
	adds r0, r0, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	ble .L0804612A
	bl func_0804213C
	ldr r2, .L0804615C  @ gUnknown_085A92E0
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, .L08046160  @ gUnknown_0203DA24
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl func_08042AF4
.L08046150:
	adds r0, r4, #0
	bl Proc_Break
	b .L0804618A
	.align 2, 0
.L08046158: .4byte 0x00000749
.L0804615C: .4byte gUnknown_085A92E0
.L08046160: .4byte gUnknown_0203DA24
.L08046164:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne .L0804618A
	ldr r0, .L08046194  @ gUnknown_03004E80
	movs r1, #0x8c
	strb r1, [r0]
	ldr r1, .L08046198  @ gUnknown_085A92E0
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0x16
	bl func_080422B8
.L0804618A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046194: .4byte gUnknown_03004E80
.L08046198: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08045F48

	THUMB_FUNC_START func_0804619C
func_0804619C: @ 0x0804619C
	push {r4, lr}
	adds r4, r0, #0
	bl func_08045CEC
	ldr r1, .L080461F4  @ gUnknown_0203DD28
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r0, .L080461F8  @ gUnknown_0203DA24
	adds r0, #0xa0
	ldr r1, .L080461FC  @ gUnknown_085A92E0
	ldr r2, [r1]
	ldrb r0, [r0]
	ldrb r1, [r2, #7]
	cmp r0, r1
	bne .L080461C4
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r3, r0
	ble .L08046200
.L080461C4:
	bl func_08045CBC
	bl func_08045CE0
	adds r0, r4, #0
	bl func_08045F00
	movs r0, #0
	str r0, [r4, #0x30]
	movs r0, #0xe9
	lsls r0, r0, #3
	movs r1, #1
	bl func_08043100
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl func_0804C2EC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b .L08046220
	.align 2, 0
.L080461F4: .4byte gUnknown_0203DD28
.L080461F8: .4byte gUnknown_0203DA24
.L080461FC: .4byte gUnknown_085A92E0
.L08046200:
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne .L08046228
	ldr r1, [r4, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2, #9]
	ands r0, r1
	cmp r0, r1
	bne .L0804622E
.L08046220:
	adds r0, r4, #0
	bl Proc_Break
	b .L0804622E
.L08046228:
	adds r0, r4, #0
	bl Proc_Break
.L0804622E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804619C

	THUMB_FUNC_START func_08046234
func_08046234: @ 0x08046234
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, .L080462C8  @ 0x00000749
	movs r1, #1
	bl func_08043100
	ldr r0, .L080462CC  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080462B4
	bl GetGameTime
	ldr r4, .L080462D0  @ gUnknown_0203DA24
	adds r5, r4, #0
	adds r5, #0xa0
	ldrb r1, [r5]
	bl __umodsi3
	adds r6, r7, #0
	adds r6, #0x3b
	strb r0, [r6]
	bl RandNextB
	ldrb r2, [r5]
	movs r1, #3
	ands r1, r0
	adds r1, #4
	adds r3, r2, #0
	muls r3, r1, r3
	ldrb r0, [r6]
	adds r3, r3, r0
	adds r0, r7, #0
	adds r0, #0x39
	strb r3, [r0]
	mov r2, sp
	adds r4, #0xec
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r2, #1]
	mov r0, sp
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r0, [r6]
	strb r0, [r1, #3]
	mov r0, sp
	strb r3, [r0, #4]
	adds r0, #6
	bl RandGetSt
	mov r0, sp
	movs r1, #0x10
	bl func_080426F4
	str r0, [r7, #0x34]
.L080462B4:
	adds r0, r7, #0
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080462C8: .4byte 0x00000749
.L080462CC: .4byte gUnknown_085A92E0
.L080462D0: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08046234

	THUMB_FUNC_START func_080462D4
func_080462D4: @ 0x080462D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0x2c]
	ldr r0, .L08046310  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r4, #6
	ldrsb r4, [r2, r4]
	cmp r4, #0
	bne .L08046318
	ldr r1, [r5, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne .L08046398
	ldr r0, .L08046314  @ 0x0000074E
	movs r1, #1
	bl func_08043100
	str r4, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
	b .L08046398
	.align 2, 0
.L08046310: .4byte gUnknown_085A92E0
.L08046314: .4byte 0x0000074E
.L08046318:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	adds r6, r0, #0
	cmp r6, #0
	bne .L08046398
	add r1, sp, #0x10
	mov r0, sp
	movs r2, #0
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08046398
	ldr r4, .L080463A0  @ gUnknown_0203DA24
	mov r0, sp
	adds r4, #0xec
	movs r3, #1
	ldrb r1, [r0]
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #1]
	ands r1, r3
	lsls r1, r1, #2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #2]
	ands r1, r3
	lsls r1, r1, #1
	adds r2, #2
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r5, #0
	adds r1, #0x3b
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #4]
	subs r1, #2
	strb r0, [r1]
	mov r0, sp
	adds r0, #6
	bl RandSetSt
	ldr r0, .L080463A4  @ 0x0000074E
	movs r1, #1
	bl func_08043100
	str r6, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
.L08046398:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080463A0: .4byte gUnknown_0203DA24
.L080463A4: .4byte 0x0000074E

	THUMB_FUNC_END func_080462D4

	THUMB_FUNC_START func_080463A8
func_080463A8: @ 0x080463A8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls .L0804644C
	movs r0, #0
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, .L08046428  @ gUnknown_0203DA24
	adds r1, #0xa0
	ldrb r0, [r4]
	ldrb r1, [r1]
	bl __umodsi3
	strb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r0, .L0804642C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080463FC
	movs r0, #0x7d
	bl m4aSongNumStart
.L080463FC:
	ldrb r0, [r5]
	cmp r0, #0
	bne .L0804644C
	adds r1, r6, #0
	adds r1, #0x3b
	ldrb r2, [r1]
	ldr r0, .L08046430  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r2, r0
	beq .L08046434
	movs r1, #0xea
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #1
	bl func_08043100
	b .L0804643C
	.align 2, 0
.L08046428: .4byte gUnknown_0203DA24
.L0804642C: .4byte gPlaySt
.L08046430: .4byte gUnknown_085A92E0
.L08046434:
	ldr r0, .L08046454  @ 0x0000074F
	movs r1, #1
	bl func_08043100
.L0804643C:
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r1, .L08046458  @ gUnknown_0203DD90
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
.L0804644C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046454: .4byte 0x0000074F
.L08046458: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_080463A8

	THUMB_FUNC_START func_0804645C
func_0804645C: @ 0x0804645C
	push {lr}
	ldr r0, .L08046474  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08046470
	movs r0, #0x7e
	bl m4aSongNumStart
.L08046470:
	pop {r0}
	bx r0
	.align 2, 0
.L08046474: .4byte gPlaySt

	THUMB_FUNC_END func_0804645C

	THUMB_FUNC_START func_08046478
func_08046478: @ 0x08046478
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	strb r4, [r5, #0x1b]
	ldr r0, .L080464A0  @ gUnknown_0203DA24
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L080464A4
	adds r0, r5, #0
	bl func_080431B4
	b .L080464AA
	.align 2, 0
.L080464A0: .4byte gUnknown_0203DA24
.L080464A4:
	adds r0, r5, #0
	bl func_0804D40C
.L080464AA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08046478

	THUMB_FUNC_START func_080464B0
func_080464B0: @ 0x080464B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	ldr r0, .L0804656C  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	adds r0, #1
	mov r8, r0
	ldr r1, .L08046570  @ gUnknown_0203DD28
	movs r0, #0
	str r0, [r1]
	bl InitUnits
	ldr r0, .L08046574  @ gUnknown_0203DA24
	ldrb r0, [r0, #3]
	ldr r4, .L08046578  @ gUnknown_085A9884
	ldr r1, [r4]
	bl func_080A66C0
	movs r6, #0
	ldr r0, .L0804657C  @ gUnknown_0203DDB4
	mov sl, r0
	movs r7, #0x10
.L080464EA:
	mov r1, r8
	adds r4, r1, r6
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	ldr r1, .L08046578  @ gUnknown_085A9884
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl func_08046478
	strb r4, [r5, #0xb]
	cmp r6, #0
	bne .L08046528
	adds r0, r5, #0
	bl GetUnitChibiFid
	ldr r1, .L0804656C  @ gUnknown_085A92E0
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	add r1, sl
	strh r0, [r1]
.L08046528:
	adds r7, #0x24
	adds r6, #1
	cmp r6, #4
	ble .L080464EA
	ldr r2, .L0804656C  @ gUnknown_085A92E0
	mov r3, r9
	adds r3, #0x64
	mov r4, r9
	adds r4, #0x4c
	ldr r0, .L08046574  @ gUnknown_0203DA24
	movs r1, #0
	movs r6, #3
	adds r0, #0x9f
.L08046542:
	strb r1, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge .L08046542
	ldr r2, [r2]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	movs r1, #0
	strb r0, [r2, #0xa]
	strh r1, [r3]
	strh r1, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804656C: .4byte gUnknown_085A92E0
.L08046570: .4byte gUnknown_0203DD28
.L08046574: .4byte gUnknown_0203DA24
.L08046578: .4byte gUnknown_085A9884
.L0804657C: .4byte gUnknown_0203DDB4

	THUMB_FUNC_END func_080464B0

	THUMB_FUNC_START func_08046580
func_08046580: @ 0x08046580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	movs r0, #0
	mov sl, r0
	mov r0, r8
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L080465B0
	ldr r0, .L080466EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080465B0
	movs r0, #0x7c
	bl m4aSongNumStart
.L080465B0:
	mov r1, r8
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble .L080465C6
	movs r0, #0
	strh r0, [r1]
.L080465C6:
	mov r4, r8
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bgt .L08046606
	ldr r2, .L080466F0  @ gUnknown_085A9884
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0x28
	bl func_080426F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #0x58]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	ldr r1, .L080466F4  @ gUnknown_0203DA24
	ldr r0, .L080466F8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x9c
	adds r0, r0, r1
	strb r2, [r0]
.L08046606:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne .L080466DA
	add r6, sp, #0x24
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L08046696
	ldrb r0, [r6]
	lsls r4, r0, #6
	adds r4, #1
	ldr r1, .L080466F4  @ gUnknown_0203DA24
	mov r9, r1
	mov r7, r9
	adds r7, #0x9c
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r4, r0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	mov r0, sp
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl func_08046478
	ldrb r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r0, r4
	strb r0, [r5, #0xb]
	ldrb r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08046678
	adds r0, r5, #0
	bl GetUnitChibiFid
	ldr r2, .L080466FC  @ gUnknown_0203DD90
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r2, #0x24
	adds r1, r1, r2
	strh r0, [r1]
.L08046678:
	mov r0, r9
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L0804668C
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
.L0804668C:
	ldrb r1, [r6]
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08046696:
	movs r4, #0
	ldr r5, .L08046700  @ gUnknown_0203DAC0
.L0804669A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080466BA
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #4
	bhi .L080466BA
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
.L080466BA:
	adds r4, #1
	cmp r4, #3
	ble .L0804669A
	mov r0, sl
	cmp r0, #0
	bne .L080466DA
	ldr r0, .L080466F8  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	mov r0, r8
	bl Proc_Break
.L080466DA:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080466EC: .4byte gPlaySt
.L080466F0: .4byte gUnknown_085A9884
.L080466F4: .4byte gUnknown_0203DA24
.L080466F8: .4byte gUnknown_085A92E0
.L080466FC: .4byte gUnknown_0203DD90
.L08046700: .4byte gUnknown_0203DAC0

	THUMB_FUNC_END func_08046580

	THUMB_FUNC_START func_08046704
func_08046704: @ 0x08046704
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne .L08046724
	ldr r0, .L08046798  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08046724
	movs r0, #0x7c
	bl m4aSongNumStart
.L08046724:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble .L0804673A
	strh r6, [r1]
.L0804673A:
	ldr r0, .L0804679C  @ gUnknown_0203DD28
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r1, r0
	ble .L0804674E
	bl SioLinkError
.L0804674E:
	ldr r0, .L080467A0  @ gUnknown_03004F0C
	movs r1, #0x89
	strb r1, [r0]
	ldr r4, .L080467A4  @ gUnknown_085A92E0
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r6, [r0, #2]
	movs r1, #4
	bl func_080422B8
	ldr r4, [r4]
	ldr r1, [r5, #0x58]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r4, #9]
	ldrb r2, [r0]
	cmp r2, r1
	bne .L08046790
	ldrb r0, [r4, #0xa]
	ands r0, r1
	cmp r0, r2
	bne .L08046790
	ldr r0, .L080467A8  @ gUnknown_085A93A0
	bl EndEachProc
	adds r0, r5, #0
	bl Proc_Break
.L08046790:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08046798: .4byte gPlaySt
.L0804679C: .4byte gUnknown_0203DD28
.L080467A0: .4byte gUnknown_03004F0C
.L080467A4: .4byte gUnknown_085A92E0
.L080467A8: .4byte gUnknown_085A93A0

	THUMB_FUNC_END func_08046704

	THUMB_FUNC_START func_080467AC
func_080467AC: @ 0x080467AC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl func_08043044
	bl func_0804C33C
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl func_08086CE8
	bl func_0804D6B4
	movs r0, #3
	bl EndFaceById
	ldr r4, .L08046828  @ gUnknown_0203DA78
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r5, .L0804682C  @ 0x0000077D
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	movs r0, #0x60
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r5, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L08046830  @ gBg2Tm+0x312
	adds r0, r4, #0
	bl PutText
	ldr r0, .L08046834  @ gUnknown_085A93A0
	adds r1, r6, #0
	bl SpawnProc
	movs r0, #0xf
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08046828: .4byte gUnknown_0203DA78
.L0804682C: .4byte 0x0000077D
.L08046830: .4byte gBg2Tm+0x312
.L08046834: .4byte gUnknown_085A93A0

	THUMB_FUNC_END func_080467AC

	THUMB_FUNC_START func_08046838
func_08046838: @ 0x08046838
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r9, r0
	bl func_08043044
	bl func_0804C33C
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl func_08086CE8
	ldr r4, .L0804696C  @ gUnknown_085AC9DC
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L08046970  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08046974  @ gUnknown_085ADCC8
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08046978  @ gUnknown_085ABD68
	ldr r1, .L0804697C  @ 0x06014800
	bl Decompress
	ldr r0, .L08046980  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl nullsub_14
	ldr r0, .L08046984  @ gUnknown_085AE778
	ldr r4, .L08046988  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L0804698C  @ gBg2Tm+0x142
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, .L08046990  @ gFont_203DB64
	bl SetTextFont
	bl ResetTextFont
	bl func_08043164
	bl func_0804CEB0
	add r0, sp, #4
	bl func_0804766C
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	movs r7, #0xc0
	lsls r7, r7, #1
	ldr r6, .L08046994  @ gUnknown_080D9E50
.L080468D4:
	lsls r4, r5, #3
	ldr r0, .L08046998  @ gUnknown_0203DA30
	mov r8, r0
	add r4, r8
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r6]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0804699C  @ gBg0Tm+0xC
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r5
	adds r0, #4
	ldrb r1, [r0]
	adds r0, r5, #0
	bl func_080476CC
	adds r7, #0xc0
	adds r6, #0x14
	adds r5, #1
	cmp r5, #2
	ble .L080468D4
	ldr r5, .L08046994  @ gUnknown_080D9E50
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, .L080469A0  @ gBg1Tm+0x23C
	adds r0, r0, r4
	movs r1, #0
	bl func_08046E94
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl func_08046E94
	ldr r1, .L080469A4  @ gUnknown_080D9D5E
	mov r0, r8
	subs r0, #0xc
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r0, r9
	movs r2, #0
	bl func_0804C49C
	bl func_0804C508
	ldr r0, .L080469A8  @ 0x0000074B
	movs r1, #1
	bl func_08043100
	movs r0, #0xf
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804696C: .4byte gUnknown_085AC9DC
.L08046970: .4byte 0x06000F00
.L08046974: .4byte gUnknown_085ADCC8
.L08046978: .4byte gUnknown_085ABD68
.L0804697C: .4byte 0x06014800
.L08046980: .4byte gUnknown_085ADC48
.L08046984: .4byte gUnknown_085AE778
.L08046988: .4byte gBuf
.L0804698C: .4byte gBg2Tm+0x142
.L08046990: .4byte gFont_203DB64
.L08046994: .4byte gUnknown_080D9E50
.L08046998: .4byte gUnknown_0203DA30
.L0804699C: .4byte gBg0Tm+0xC
.L080469A0: .4byte gBg1Tm+0x23C
.L080469A4: .4byte gUnknown_080D9D5E
.L080469A8: .4byte 0x0000074B

	THUMB_FUNC_END func_08046838

	THUMB_FUNC_START func_080469AC
func_080469AC: @ 0x080469AC
	push {lr}
	movs r0, #3
	bl func_08042980
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080469AC

	THUMB_FUNC_START func_080469B8
func_080469B8: @ 0x080469B8
	push {lr}
	movs r0, #0
	bl func_08042980
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080469B8

	THUMB_FUNC_START func_080469C4
func_080469C4: @ 0x080469C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x6c
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x54]
	bl func_08043044
	bl func_0804C33C
	ldr r1, [sp, #0x54]
	str r1, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl func_08086CE8
	ldr r0, .L08046AB8  @ gUnknown_085ABD68
	ldr r1, .L08046ABC  @ 0x06014800
	bl Decompress
	ldr r0, .L08046AC0  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl func_0804C2EC
	ldr r4, .L08046AC4  @ gUnknown_0203DD0C
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	ldr r0, .L08046AC8  @ 0x0000074C
	movs r1, #0
	bl func_08043100
	ldr r0, .L08046ACC  @ 0x0000074D
	movs r1, #1
	bl func_08043100
	movs r0, #1
	negs r0, r0
	str r0, [r7, #0x4c]
	movs r2, #2
	mov r9, r2
	mov r3, sp
	adds r3, #0x50
	str r3, [sp, #0x58]
	add r6, sp, #4
	movs r5, #8
	mov r4, sp
	adds r4, #0x52
.L08046A4A:
	movs r0, #0
	strb r0, [r4]
	mov r0, r9
	bl IsSaveBlockValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08046B34
	mov r0, r9
	add r1, sp, #4
	bl LoadSavedChapterState
	add r0, sp, #4
	bl func_08089768
	adds r2, r7, #0
	adds r2, #0x2c
	adds r1, r2, r5
	str r0, [r1]
	ldrb r1, [r6, #0x14]
	movs r0, #0x40
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq .L08046A84
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
.L08046A84:
	mov r0, sp
	adds r0, #0x46
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt .L08046AD0
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne .L08046A9E
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
.L08046A9E:
	ldrb r0, [r6, #0x1b]
	cmp r0, #2
	bne .L08046AAC
	ldrb r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4]
.L08046AAC:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne .L08046AE4
	ldrb r0, [r4]
	movs r1, #0x40
	b .L08046AE0
	.align 2, 0
.L08046AB8: .4byte gUnknown_085ABD68
.L08046ABC: .4byte 0x06014800
.L08046AC0: .4byte gFont_203DB64
.L08046AC4: .4byte gUnknown_0203DD0C
.L08046AC8: .4byte 0x0000074C
.L08046ACC: .4byte 0x0000074D
.L08046AD0:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne .L08046ADC
	ldrb r0, [r4]
	movs r1, #0x40
	b .L08046AE0
.L08046ADC:
	ldrb r0, [r4]
	movs r1, #0x20
.L08046AE0:
	orrs r0, r1
	strb r0, [r4]
.L08046AE4:
	add r0, sp, #4
	bl func_080A52BC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08046B02
	adds r2, r7, #0
	adds r2, #0x38
	adds r1, r2, r5
	mov r3, sl
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r1]
	mov r8, r2
	b .L08046B10
.L08046B02:
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r2, #1
	negs r2, r2
	str r2, [r0]
	mov r8, r1
.L08046B10:
	mov r3, r8
	adds r0, r3, r5
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq .L08046B50
	ldr r2, [sp, #0x54]
	cmp r2, #0
	bne .L08046B2E
	mov r3, r9
	str r3, [r7, #0x50]
	movs r0, #1
	str r0, [sp, #0x54]
	b .L08046B50
.L08046B2E:
	mov r1, r9
	str r1, [r7, #0x4c]
	b .L08046B50
.L08046B34:
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r2, r5
	mov r8, r3
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r3, #1
	negs r3, r3
	str r3, [r0]
	mov r0, r8
	str r3, [r0]
	mov sl, r2
	mov r8, r1
.L08046B50:
	subs r5, #4
	subs r4, #1
	movs r1, #1
	negs r1, r1
	add r9, r1
	mov r2, r9
	cmp r2, #0
	blt .L08046B62
	b .L08046A4A
.L08046B62:
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	cmp r1, r0
	bne .L08046B72
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b .L08046B74
.L08046B72:
	str r1, [r7, #0x48]
.L08046B74:
	movs r0, #0xd0
	lsls r0, r0, #1
	bl func_08089678
	movs r3, #0
	mov r9, r3
	movs r0, #0xa0
	lsls r0, r0, #1
	str r0, [sp, #0x5c]
	mov r1, sl
	str r1, [sp, #0x60]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #0x64]
	ldr r6, [sp, #0x58]
	str r3, [sp, #0x68]
	movs r0, #0x88
	lsls r0, r0, #7
	mov sl, r0
.L08046B9A:
	ldr r0, [sp, #0x68]
	add r0, r8
	ldr r1, [r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne .L08046BB0
	ldrb r1, [r6]
	movs r0, #2
	orrs r0, r1
	strb r0, [r6]
.L08046BB0:
	ldrb r1, [r6]
	movs r0, #1
	orrs r0, r1
	mov r4, r9
	adds r4, #4
	adds r1, r4, #0
	bl func_080895B4
	ldrb r0, [r6]
	mov r5, r9
	adds r5, #7
	adds r1, r5, #0
	bl func_080895B4
	ldr r0, .L08046C58  @ gBg1Tm+0x6
	ldr r1, [sp, #0x64]
	adds r0, r1, r0
	adds r1, r4, #0
	bl func_08089720
	mov r2, sl
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	ldr r3, [sp, #0x60]
	ldm r3!, {r1}
	str r3, [sp, #0x60]
	bl LoadChapterTitleGfx
	ldr r0, .L08046C5C  @ gBg0Tm+0x6
	ldr r1, [sp, #0x5c]
	adds r0, r1, r0
	adds r1, r5, #0
	bl func_080896D8
	ldr r2, [sp, #0x5c]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	str r2, [sp, #0x5c]
	ldr r0, [sp, #0x64]
	adds r0, r0, r3
	str r0, [sp, #0x64]
	adds r6, #1
	ldr r1, [sp, #0x68]
	adds r1, #4
	str r1, [sp, #0x68]
	movs r2, #0x80
	lsls r2, r2, #4
	add sl, r2
	movs r3, #1
	add r9, r3
	mov r0, r9
	cmp r0, #2
	ble .L08046B9A
	ldr r2, .L08046C60  @ gDispIo
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
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0
	bl func_0804C49C
	bl func_0804C508
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x6c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046C58: .4byte gBg1Tm+0x6
.L08046C5C: .4byte gBg0Tm+0x6
.L08046C60: .4byte gDispIo

	THUMB_FUNC_END func_080469C4

	THUMB_FUNC_START func_08046C64
func_08046C64: @ 0x08046C64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, .L08046CEC  @ gKeySt
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq .L08046CB2
	ldr r0, [r4]
	cmp r0, r6
	bgt .L08046C94
	ldrh r3, [r3, #8]
	cmp r2, r3
	bne .L08046CB2
.L08046C94:
	subs r2, r7, #1
	movs r3, #1
	negs r3, r3
.L08046C9A:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge .L08046CA6
	str r2, [r4]
.L08046CA6:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	beq .L08046C9A
.L08046CB2:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq .L08046CE6
	ldr r0, [r4]
	cmp r0, ip
	blt .L08046CCA
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne .L08046CE6
.L08046CCA:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r1, r7, #0
	bl __modsi3
	str r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L08046CCA
.L08046CE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046CEC: .4byte gKeySt

	THUMB_FUNC_END func_08046C64

	THUMB_FUNC_START func_08046CF0
func_08046CF0: @ 0x08046CF0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x48]
	adds r0, #0x48
	ldr r1, [r6, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r6, #0x4c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x38
	movs r4, #3
	str r4, [sp]
	bl func_08046C64
	ldr r1, [r6, #0x48]
	lsls r1, r1, #5
	adds r1, #0x28
	movs r0, #0x1c
	bl DisplayUiHand
	ldr r0, [r6, #0x48]
	cmp r5, r0
	beq .L08046D2A
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08046D2A:
	ldr r4, .L08046D68  @ gKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08046D44
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	adds r0, r6, #0
	bl Proc_Break
.L08046D44:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08046D5E
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
.L08046D5E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08046D68: .4byte gKeySt

	THUMB_FUNC_END func_08046CF0

	THUMB_FUNC_START func_08046D6C
func_08046D6C: @ 0x08046D6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl LoadGame
	ldr r1, .L08046DAC  @ gPlaySt
	ldrb r2, [r1, #0x14]
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	ldrb r2, [r1]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, .L08046DB0  @ gUnknown_0203DA24
	ldr r0, [r4, #0x48]
	strb r0, [r1, #4]
	bl ApplyUnitSpritePalettes
	bl func_080496A4
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08046DAC: .4byte gPlaySt
.L08046DB0: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08046D6C

	THUMB_FUNC_START func_08046DB4
func_08046DB4: @ 0x08046DB4
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08046DCC  @ gUnknown_0203DA24
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	bne .L08046DC8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
.L08046DC8:
	pop {r0}
	bx r0
	.align 2, 0
.L08046DCC: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08046DB4

	THUMB_FUNC_START func_08046DD0
func_08046DD0: @ 0x08046DD0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08046DE8  @ gUnknown_0203DA24
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne .L08046DE4
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
.L08046DE4:
	pop {r0}
	bx r0
	.align 2, 0
.L08046DE8: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08046DD0

	THUMB_FUNC_START func_08046DEC
func_08046DEC: @ 0x08046DEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08046E08  @ gUnknown_08A1829C
	bl FindProc
	cmp r0, #0
	bne .L08046E00
	adds r0, r4, #0
	bl Proc_Break
.L08046E00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08046E08: .4byte gUnknown_08A1829C

	THUMB_FUNC_END func_08046DEC

	THUMB_FUNC_START func_08046E0C
func_08046E0C: @ 0x08046E0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08046E48  @ gUnknown_0203DD24
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08046E40
	bl func_0804309C
	bl nullsub_13
	bl func_0804C4F8
	bl func_0804C590
	bl func_0804C31C
	bl EndBmVSync
	bl StartAtMenu
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
.L08046E40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08046E48: .4byte gUnknown_0203DD24

	THUMB_FUNC_END func_08046E0C

	THUMB_FUNC_START func_08046E4C
func_08046E4C: @ 0x08046E4C
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08046E4C

	THUMB_FUNC_START func_08046E5C
func_08046E5C: @ 0x08046E5C
	adds r3, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r1, .L08046E90  @ 0x00006078
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r3]
	adds r0, #1
	strh r0, [r3, #2]
	adds r0, #1
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x40
	adds r0, #0x1e
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
.L08046E90: .4byte 0x00006078

	THUMB_FUNC_END func_08046E5C

	THUMB_FUNC_START func_08046E94
func_08046E94: @ 0x08046E94
	lsls r1, r1, #0x12
	ldr r2, .L08046EB4  @ 0x60780000
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	strh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0, #2]
	adds r3, r0, #0
	adds r3, #0x40
	adds r2, r1, #2
	strh r2, [r3]
	adds r0, #0x42
	adds r1, #3
	strh r1, [r0]
	bx lr
	.align 2, 0
.L08046EB4: .4byte 0x60780000

	THUMB_FUNC_END func_08046E94

	THUMB_FUNC_START func_08046EB8
func_08046EB8: @ 0x08046EB8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x18
	mov r9, r0
	mov sl, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x34]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, .L08046F5C  @ gUnknown_080D9E9C
	mov r0, sp
	movs r2, #0xa
	bl memcpy
	add r0, sp, #0xc
	mov r8, r0
	ldr r1, .L08046F60  @ gUnknown_080D9EA6
	movs r2, #0xc
	bl memcpy
	mov r0, r9
	movs r1, #4
	movs r2, #0
	mov r3, sl
	bl Text_InsertDrawString
	mov r0, r9
	movs r1, #0x54
	movs r2, #2
	adds r3, r6, #0
	bl func_08042DE8
	ldr r0, .L08046F64  @ 0x0000077F
	bl GetMsg
	adds r3, r0, #0
	mov r0, r9
	movs r1, #0x5d
	movs r2, #0
	bl Text_InsertDrawString
	lsls r4, r4, #1
	mov r1, sp
	adds r0, r1, r4
	ldrh r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	mov r0, r9
	movs r1, #0x80
	movs r2, #2
	bl Text_InsertDrawString
	lsls r5, r5, #1
	add r8, r5
	mov r1, r8
	ldrh r0, [r1]
	bl GetMsg
	adds r3, r0, #0
	mov r0, r9
	movs r1, #0x9a
	movs r2, #0
	bl Text_InsertDrawString
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08046F5C: .4byte gUnknown_080D9E9C
.L08046F60: .4byte gUnknown_080D9EA6
.L08046F64: .4byte 0x0000077F

	THUMB_FUNC_END func_08046EB8

	THUMB_FUNC_START func_08046F68
func_08046F68: @ 0x08046F68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, .L08046FFC  @ gUnknown_0203DC48
	ldr r1, .L08047000  @ gBg1Tm+0x6
	mov sl, r1
	subs r7, r0, #4
	movs r1, #0x22
	add r1, sl
	mov r9, r1
	mov r8, r0
.L08046F86:
	lsls r5, r6, #3
	ldr r0, .L08047004  @ gUnknown_0203DB14
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r7]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #6
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	ldr r3, [r7]
	lsls r3, r3, #0xb
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #1
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	bl func_08046EB8
	lsls r4, r6, #7
	mov r1, sl
	adds r0, r4, r1
	adds r1, r6, #0
	bl func_08046E5C
	mov r0, sl
	adds r0, #6
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	ldrb r1, [r7]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1f
	mov r0, r9
	bl func_08046E94
	adds r7, #0x14
	movs r0, #0x80
	add r9, r0
	movs r1, #0x14
	add r8, r1
	adds r6, #1
	cmp r6, #9
	ble .L08046F86
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08046FFC: .4byte gUnknown_0203DC48
.L08047000: .4byte gBg1Tm+0x6
.L08047004: .4byte gUnknown_0203DB14

	THUMB_FUNC_END func_08046F68

	THUMB_FUNC_START func_08047008
func_08047008: @ 0x08047008
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	bl func_08043044
	bl func_0804C33C
	movs r0, #0
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl func_08086CE8
	ldr r4, .L080471C0  @ gUnknown_085AC9DC
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L080471C4  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L080471C8  @ gUnknown_085ADCC8
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080471CC  @ gUnknown_085ABD68
	ldr r1, .L080471D0  @ 0x06014800
	bl Decompress
	ldr r0, .L080471D4  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, .L080471D8  @ gBg2Tm+0x102
	ldr r1, .L080471DC  @ gUnknown_085AE464
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, .L080471E0  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r1, #0
	movs r0, #0xc8
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #4
	strb r1, [r0]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, .L080471E4  @ gUnknown_0203DB14
	movs r4, #9
.L08047094:
	adds r0, r5, #0
	movs r1, #0x16
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08047094
	ldr r4, .L080471E8  @ gUnknown_0203DD0C
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, .L080471EC  @ 0x00000772
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L080471F0  @ 0x00000773
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x54
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L080471F4  @ 0x00000774
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L080471F8  @ 0x00000775
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x96
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, .L080471FC  @ gBg0Tm+0x14A
	adds r0, r4, #0
	bl PutText
	ldr r0, .L08047200  @ 0x00000744
	movs r1, #1
	bl func_08043100
	ldr r0, .L08047204  @ gUnknown_0203DC44
	bl func_080A69DC
	bl func_08046F68
	ldr r1, .L08047208  @ gDispIo
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x3a
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r6, #1
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	orrs r0, r6
	movs r1, #3
	negs r1, r1
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	ldrh r0, [r7, #0x36]
	adds r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd9
	movs r1, #0x39
	movs r2, #0xa
	movs r3, #5
	bl func_0804D1E0
	adds r0, r7, #0
	movs r1, #5
	movs r2, #0
	bl func_0804C49C
	bl func_0804C558
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl func_0804C2EC
	movs r0, #0xf
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080471C0: .4byte gUnknown_085AC9DC
.L080471C4: .4byte 0x06000F00
.L080471C8: .4byte gUnknown_085ADCC8
.L080471CC: .4byte gUnknown_085ABD68
.L080471D0: .4byte 0x06014800
.L080471D4: .4byte gUnknown_085ADC48
.L080471D8: .4byte gBg2Tm+0x102
.L080471DC: .4byte gUnknown_085AE464
.L080471E0: .4byte gFont_203DB64
.L080471E4: .4byte gUnknown_0203DB14
.L080471E8: .4byte gUnknown_0203DD0C
.L080471EC: .4byte 0x00000772
.L080471F0: .4byte 0x00000773
.L080471F4: .4byte 0x00000774
.L080471F8: .4byte 0x00000775
.L080471FC: .4byte gBg0Tm+0x14A
.L08047200: .4byte 0x00000744
.L08047204: .4byte gUnknown_0203DC44
.L08047208: .4byte gDispIo

	THUMB_FUNC_END func_08047008

	THUMB_FUNC_START func_0804720C
func_0804720C: @ 0x0804720C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x38
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble .L08047228
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	b .L08047236
.L08047228:
	cmp r0, #0
	bge .L08047252
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	adds r0, #1
.L08047236:
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl func_0804D24C
	b .L080472FE
.L08047252:
	ldr r0, .L08047304  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08047298
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #0
	beq .L08047298
	movs r0, #3
	bl SioPlaySomeIndexedSfx
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl func_0804D24C
.L08047298:
	ldr r0, .L08047304  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L080472E4
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	adds r0, #5
	cmp r0, #9
	bgt .L080472E4
	movs r0, #3
	bl SioPlaySomeIndexedSfx
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #0xfd
	strb r0, [r1]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl func_0804D24C
.L080472E4:
	ldr r0, .L08047304  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080472FE
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	adds r0, r4, #0
	bl Proc_Break
.L080472FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08047304: .4byte gKeySt

	THUMB_FUNC_END func_0804720C

	THUMB_FUNC_START func_08047308
func_08047308: @ 0x08047308
	push {lr}
	cmp r0, #6
	ble .L08047312
	movs r0, #5
	b .L0804731E
.L08047312:
	subs r0, #2
	cmp r0, #0
	bge .L0804731A
	movs r0, #0
.L0804731A:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
.L0804731E:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08047308

	THUMB_FUNC_START func_08047324
func_08047324: @ 0x08047324
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl func_08043044
	bl func_0804C33C
	movs r5, #0
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl func_08086CE8
	ldr r4, .L08047520  @ gUnknown_085AC9DC
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L08047524  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08047528  @ gUnknown_085ADCC8
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0804752C  @ gUnknown_085ABD68
	ldr r1, .L08047530  @ 0x06014800
	bl Decompress
	ldr r0, .L08047534  @ gUnknown_085ACEFC
	ldr r1, .L08047538  @ 0x06016000
	bl Decompress
	ldr r0, .L0804753C  @ gUnknown_085ADE08
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08047540  @ gBg2Tm+0x102
	ldr r1, .L08047544  @ gUnknown_085AE464
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r0, .L08047548  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	adds r1, r7, #0
	adds r1, #0x34
	movs r0, #5
	strb r0, [r1]
	movs r1, #0
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r7, #0x3c]
	bl func_08047308
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	str r5, [r7, #0x40]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, .L0804754C  @ gUnknown_0203DB14
	movs r4, #9
.L080473D2:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L080473D2
	ldr r4, .L08047550  @ gUnknown_0203DD0C
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, .L08047554  @ 0x00000772
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L08047558  @ 0x00000773
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x54
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L0804755C  @ 0x00000774
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, .L08047560  @ 0x00000775
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x96
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, .L08047564  @ gBg0Tm+0x14A
	adds r0, r4, #0
	bl PutText
	ldr r0, .L08047568  @ gUnknown_0203DC44
	bl func_080A69DC
	bl func_08046F68
	ldr r1, .L0804756C  @ gDispIo
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x3a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r6, #0xf0
	strb r6, [r0]
	subs r1, #1
	movs r0, #0x88
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r5, #1
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r1, #0x10
	mov r9, r1
	mov r1, r9
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x2f
	mov r2, r8
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x33
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r6, [r0]
	subs r1, #1
	movs r0, #0x38
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x35
	ldrb r0, [r6]
	orrs r0, r5
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r5
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, r9
	orrs r0, r2
	strb r0, [r1]
	bl func_0804C558
	ldr r1, [r7, #0x3c]
	lsls r1, r1, #4
	subs r1, #0x18
	movs r0, #0xe
	adds r2, r7, #0
	bl func_0804D7DC
	str r0, [r7, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047520: .4byte gUnknown_085AC9DC
.L08047524: .4byte 0x06000F00
.L08047528: .4byte gUnknown_085ADCC8
.L0804752C: .4byte gUnknown_085ABD68
.L08047530: .4byte 0x06014800
.L08047534: .4byte gUnknown_085ACEFC
.L08047538: .4byte 0x06016000
.L0804753C: .4byte gUnknown_085ADE08
.L08047540: .4byte gBg2Tm+0x102
.L08047544: .4byte gUnknown_085AE464
.L08047548: .4byte gFont_203DB64
.L0804754C: .4byte gUnknown_0203DB14
.L08047550: .4byte gUnknown_0203DD0C
.L08047554: .4byte 0x00000772
.L08047558: .4byte 0x00000773
.L0804755C: .4byte 0x00000774
.L08047560: .4byte 0x00000775
.L08047564: .4byte gBg0Tm+0x14A
.L08047568: .4byte gUnknown_0203DC44
.L0804756C: .4byte gDispIo

	THUMB_FUNC_END func_08047324

	THUMB_FUNC_START func_08047570
func_08047570: @ 0x08047570
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	mov r8, r0
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	cmp r0, #0x3b
	ble .L08047622
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	cmp r0, #5
	bne .L08047596
	adds r0, r4, #0
	bl Proc_Break
.L08047596:
	adds r5, r4, #0
	adds r5, #0x38
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble .L080475D0
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl func_0804D24C
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
	b .L08047622
.L080475D0:
	adds r6, r4, #0
	adds r6, #0x34
	ldrb r0, [r7]
	ldrb r1, [r6]
	cmp r0, r1
	beq .L0804760C
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	movs r0, #7
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl func_0804D24C
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
.L0804760C:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L08047622
	ldrb r0, [r6]
	ldrb r7, [r7]
	cmp r0, r7
	bne .L08047622
	adds r0, r4, #0
	bl Proc_Break
.L08047622:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08047570

	THUMB_FUNC_START func_0804762C
func_0804762C: @ 0x0804762C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08047650  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804764A
	movs r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
.L0804764A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08047650: .4byte gKeySt

	THUMB_FUNC_END func_0804762C

	THUMB_FUNC_START func_08047654
func_08047654: @ 0x08047654
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08047668  @ gUnknown_085A9D98
	bl SpawnProcLocking
	str r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08047668: .4byte gUnknown_085A9D98

	THUMB_FUNC_END func_08047654

	THUMB_FUNC_START func_0804766C
func_0804766C: @ 0x0804766C
	ldr r1, .L08047688  @ gUnknown_0203DA24
	adds r1, #0xec
	ldrb r2, [r1]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	strb r1, [r0]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #1]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1f
	strb r2, [r0, #2]
	bx lr
	.align 2, 0
.L08047688: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_0804766C

	THUMB_FUNC_START func_0804768C
func_0804768C: @ 0x0804768C
	push {r4, r5, lr}
	ldr r5, .L080476C8  @ gUnknown_0203DA24
	adds r5, #0xec
	movs r4, #1
	ldrb r2, [r0]
	ands r2, r4
	ldrb r3, [r5]
	movs r1, #2
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	ldrb r2, [r0, #1]
	ands r2, r4
	lsls r2, r2, #1
	movs r3, #3
	negs r3, r3
	ands r1, r3
	orrs r1, r2
	ldrb r0, [r0, #2]
	ands r0, r4
	lsls r0, r0, #2
	movs r2, #5
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080476C8: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_0804768C

	THUMB_FUNC_START func_080476CC
func_080476CC: @ 0x080476CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp, #8]
	ldr r1, .L08047770  @ gUnknown_080D9EC0
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [sp]
	str r2, [sp, #4]
	movs r7, #0
	lsls r1, r0, #1
	ldr r2, .L08047774  @ gUnknown_080D9E50
	mov r8, r2
	adds r1, r1, r0
	adds r1, #6
	lsls r1, r1, #5
	mov sl, r1
	adds r2, #4
	lsls r6, r0, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r2, r1
	mov r9, r2
	adds r5, r1, #0
.L08047704:
	ldr r4, .L08047778  @ gUnknown_0203DA88
	adds r4, r6, r4
	adds r0, r4, #0
	bl ClearText
	ldr r1, [sp, #8]
	adds r0, r1, r7
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #0xc
	adds r0, r5, r0
	ldr r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	mov r2, r9
	adds r2, #4
	mov r9, r2
	subs r2, #4
	ldm r2!, {r1}
	add r1, sl
	lsls r1, r1, #1
	ldr r0, .L0804777C  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	adds r6, #8
	adds r5, #4
	adds r7, #1
	cmp r7, #1
	ble .L08047704
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047770: .4byte gUnknown_080D9EC0
.L08047774: .4byte gUnknown_080D9E50
.L08047778: .4byte gUnknown_0203DA88
.L0804777C: .4byte gBg0Tm

	THUMB_FUNC_END func_080476CC

	THUMB_FUNC_START func_08047780
func_08047780: @ 0x08047780
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	bl func_08043044
	bl func_0804C33C
	movs r5, #0
	str r5, [sp]
	mov r0, r8
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl func_08086CE8
	ldr r4, .L080478EC  @ gUnknown_085AC9DC
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L080478F0  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L080478F4  @ gUnknown_085ADCC8
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080478F8  @ gUnknown_085ABD68
	ldr r1, .L080478FC  @ 0x06014800
	bl Decompress
	ldr r0, .L08047900  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl nullsub_14
	ldr r0, .L08047904  @ gUnknown_085AE778
	ldr r4, .L08047908  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L0804790C  @ gBg2Tm+0x142
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, .L08047910  @ gFont_203DB64
	bl SetTextFont
	bl ResetTextFont
	bl func_08043164
	mov r1, r8
	str r5, [r1, #0x30]
	mov r0, r8
	bl func_0804CE8C
	mov r2, r8
	str r0, [r2, #0x2c]
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	add r0, sp, #4
	bl func_0804766C
	mov r3, r8
	ldr r0, [r3, #0x2c]
	ldr r4, [r3, #0x30]
	movs r2, #0x30
	ldrsh r1, [r3, r2]
	ldr r5, .L08047914  @ gUnknown_080D9E50
	mov r3, sp
	adds r3, r3, r4
	adds r3, #4
	lsls r2, r4, #2
	adds r2, r2, r4
	ldrb r3, [r3]
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r3, r5, #4
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl func_0804CEC4
	movs r6, #0
	movs r7, #0xc0
	lsls r7, r7, #1
.L0804785A:
	lsls r4, r6, #3
	ldr r0, .L08047918  @ gUnknown_0203DA30
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r5]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, .L0804791C  @ gBg0Tm+0xC
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r6
	adds r0, #4
	ldrb r1, [r0]
	adds r0, r6, #0
	bl func_080476CC
	adds r7, #0xc0
	adds r5, #0x14
	adds r6, #1
	cmp r6, #2
	ble .L0804785A
	ldr r5, .L08047914  @ gUnknown_080D9E50
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, .L08047920  @ gBg1Tm+0x23C
	adds r0, r0, r4
	movs r1, #0
	bl func_08046E94
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl func_08046E94
	mov r1, r8
	ldr r0, [r1, #0x2c]
	movs r1, #6
	movs r2, #0
	bl func_0804C49C
	bl func_0804C508
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r3, .L08047924  @ 0x00000745
	adds r0, r0, r3
	movs r1, #1
	bl func_08043100
	movs r0, #0xf
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080478EC: .4byte gUnknown_085AC9DC
.L080478F0: .4byte 0x06000F00
.L080478F4: .4byte gUnknown_085ADCC8
.L080478F8: .4byte gUnknown_085ABD68
.L080478FC: .4byte 0x06014800
.L08047900: .4byte gUnknown_085ADC48
.L08047904: .4byte gUnknown_085AE778
.L08047908: .4byte gBuf
.L0804790C: .4byte gBg2Tm+0x142
.L08047910: .4byte gFont_203DB64
.L08047914: .4byte gUnknown_080D9E50
.L08047918: .4byte gUnknown_0203DA30
.L0804791C: .4byte gBg0Tm+0xC
.L08047920: .4byte gBg1Tm+0x23C
.L08047924: .4byte 0x00000745

	THUMB_FUNC_END func_08047780

	THUMB_FUNC_START func_08047928
func_08047928: @ 0x08047928
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r5, .L08047A44  @ gKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08047952
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	ldr r0, .L08047A48  @ gUnknown_0203DB10
	bl func_080A6A04
	adds r0, r6, #0
	bl Proc_Break
.L08047952:
	mov r0, sp
	bl func_0804766C
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L08047970
	ldr r0, [r6, #0x30]
	cmp r0, #0
	beq .L08047970
	subs r0, #1
	str r0, [r6, #0x30]
	movs r4, #1
.L08047970:
	ldr r2, .L08047A44  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq .L08047990
	ldr r0, [r6, #0x30]
	cmp r0, #1
	bgt .L08047990
	adds r0, #1
	str r0, [r6, #0x30]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
.L08047990:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L080479B8
	ldr r0, [r6, #0x30]
	mov r1, sp
	adds r3, r1, r0
	ldrb r1, [r3]
	subs r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl func_080476CC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
.L080479B8:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L080479E0
	ldr r0, [r6, #0x30]
	mov r2, sp
	adds r3, r2, r0
	ldrb r1, [r3]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl func_080476CC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
.L080479E0:
	mov r0, sp
	bl func_0804768C
	cmp r4, #0
	beq .L08047A3A
	movs r0, #3
	bl SioPlaySomeIndexedSfx
	ldr r5, [r6, #0x30]
	cmp r5, #1
	bne .L080479FA
	movs r7, #2
	negs r7, r7
.L080479FA:
	ldr r0, [r6, #0x2c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldr r3, .L08047A4C  @ gUnknown_080D9E50
	mov r2, sp
	adds r4, r2, r5
	lsls r2, r5, #2
	adds r2, r2, r5
	ldrb r4, [r4]
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r2, [r2]
	adds r2, r2, r7
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl func_0804CEC4
	ldr r0, [r6, #0x30]
	ldr r1, .L08047A50  @ 0x00000745
	adds r0, r0, r1
	movs r1, #1
	bl func_08043100
.L08047A3A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047A44: .4byte gKeySt
.L08047A48: .4byte gUnknown_0203DB10
.L08047A4C: .4byte gUnknown_080D9E50
.L08047A50: .4byte 0x00000745

	THUMB_FUNC_END func_08047928

	THUMB_FUNC_START func_08047A54
func_08047A54: @ 0x08047A54
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r2, r0, #0
	adds r3, r1, #0
	mov r0, sp
	ldr r1, .L08047A88  @ gUnknown_080D9EC8
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	cmp r3, #0
	bne .L08047A90
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08047AA4
	ldr r0, .L08047A8C  @ 0x00000735
	b .L08047AB0
	.align 2, 0
.L08047A88: .4byte gUnknown_080D9EC8
.L08047A8C: .4byte 0x00000735
.L08047A90:
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08047AA4
	movs r0, #1
	negs r0, r0
	b .L08047AB0
.L08047AA4:
	ldr r0, [r2, #0x48]
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
.L08047AB0:
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08047A54

	THUMB_FUNC_START CheckSomethingSaveRelated
CheckSomethingSaveRelated: @ 0x08047AB8
	push {r4, lr}
	sub sp, #0x4c
	movs r4, #0
.L08047ABE:
	adds r0, r4, #0
	bl IsSaveBlockValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08047AE2
	adds r0, r4, #0
	mov r1, sp
	bl LoadSavedChapterState
	mov r0, sp
	bl func_080A52BC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08047AE2
	movs r0, #1
	b .L08047AEA
.L08047AE2:
	adds r4, #1
	cmp r4, #2
	ble .L08047ABE
	movs r0, #0
.L08047AEA:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckSomethingSaveRelated

	THUMB_FUNC_START SioMenu_8047AF4
SioMenu_8047AF4: @ 0x08047AF4
	push {lr}
	bl CheckSomethingSaveRelated
	ldr r1, .L08047B20  @ gUnknown_0203DA24
	strb r0, [r1, #0xa]
	ldr r1, .L08047B24  @ gUnknown_0203DD2C
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1e
.L08047B06:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge .L08047B06
	movs r1, #0
	ldr r3, .L08047B28  @ gUnknown_03001808
	ldr r2, .L08047B2C  @ gUnknown_0300180C
	ldr r0, .L08047B30  @ gUnknown_0203DD4C
	str r1, [r0]
	str r1, [r2]
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
.L08047B20: .4byte gUnknown_0203DA24
.L08047B24: .4byte gUnknown_0203DD2C
.L08047B28: .4byte gUnknown_03001808
.L08047B2C: .4byte gUnknown_0300180C
.L08047B30: .4byte gUnknown_0203DD4C

	THUMB_FUNC_END SioMenu_8047AF4

	THUMB_FUNC_START SioMenu_8047B34
SioMenu_8047B34: @ 0x08047B34
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, .L08047BC4  @ gUnknown_0203DB10
	adds r0, r4, #0
	bl func_080A6A40
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl func_0804C33C
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl func_08086CE8
	ldr r0, .L08047BC8  @ gUnknown_085AB358
	ldr r1, .L08047BCC  @ 0x06014800
	bl Decompress
	ldr r0, .L08047BD0  @ gUnknown_085ADBE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, .L08047BD4  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl func_08043164
	str r4, [r6, #0x4c]
	bl func_080A6A68
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	negs r0, r1
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L08047BD8
	movs r1, #0
	movs r0, #3
	b .L08047BDC
	.align 2, 0
.L08047BC4: .4byte gUnknown_0203DB10
.L08047BC8: .4byte gUnknown_085AB358
.L08047BCC: .4byte 0x06014800
.L08047BD0: .4byte gUnknown_085ADBE8
.L08047BD4: .4byte gFont_203DB64
.L08047BD8:
	movs r1, #1
	movs r0, #4
.L08047BDC:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, .L08047C58  @ gUnknown_0203DA24
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	movs r4, #4
	adds r7, r2, #0
	adds r5, r6, #0
	adds r5, #0x3c
.L08047BFC:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, r4
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xb0
	movs r2, #0xa0
	bl func_0804C758
	str r0, [r5]
	subs r5, #4
	subs r4, #1
	cmp r4, #0
	bge .L08047BFC
	ldr r0, [r6, #0x2c]
	movs r1, #0
	movs r2, #0
	bl func_0804C49C
	bl func_0804C508
	ldr r0, .L08047C5C  @ gUnknown_085A9E48
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	movs r0, #0
	str r0, [r6, #0x54]
	movs r0, #0x38
	movs r1, #0
	bl StartBgm
	bl func_080497CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047C58: .4byte gUnknown_0203DA24
.L08047C5C: .4byte gUnknown_085A9E48

	THUMB_FUNC_END SioMenu_8047B34

	THUMB_FUNC_START SioMenu_8047C60
SioMenu_8047C60: @ 0x08047C60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x50
	negs r1, r1
	ldr r5, .L08047CEC  @ gUnknown_080D9EF0
	ldrb r2, [r5]
	ldr r3, [r7, #0x54]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #4
	bl Interpolate
	adds r6, r0, #0
	ldrb r2, [r5, #1]
	ldr r3, [r7, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0xa0
	bl Interpolate
	movs r5, #4
	lsls r6, r6, #0x10
	mov r8, r6
	lsls r6, r0, #0x10
	adds r4, r7, #0
	adds r4, #0x3c
.L08047C9A:
	ldr r0, [r4]
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r6, #0x10
	bl func_0804C7DC
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge .L08047C9A
	ldr r0, [r7, #0x54]
	cmp r0, #0x1f
	ble .L08047CDA
	movs r0, #0
	str r0, [r7, #0x54]
	adds r0, r7, #0
	movs r1, #0
	bl func_08047A54
	movs r1, #0
	bl func_08043100
	adds r0, r7, #0
	movs r1, #1
	bl func_08047A54
	movs r1, #1
	bl func_08043100
	adds r0, r7, #0
	bl Proc_Break
.L08047CDA:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047CEC: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END SioMenu_8047C60

	THUMB_FUNC_START SioMenu_8047CF0
SioMenu_8047CF0: @ 0x08047CF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	lsls r0, r0, #1
	movs r7, #4
	ldr r1, .L08047D84  @ gUnknown_080D9EF0
	movs r2, #0x10
	mov r8, r2
	adds r6, r1, #0
	adds r6, #8
	adds r4, r0, r1
	mov sl, r4
	adds r0, #1
	adds r0, r0, r1
	mov r9, r0
.L08047D18:
	ldrb r2, [r6]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r1, [r4]
	bl Interpolate
	adds r4, r0, #0
	mov r0, r9
	ldrb r1, [r0]
	ldrb r2, [r6, #1]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	lsls r1, r7, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl func_0804C7DC
	subs r6, #2
	subs r7, #1
	cmp r7, #0
	bge .L08047D18
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	ble .L08047D6C
	adds r0, r5, #0
	bl Proc_Break
.L08047D6C:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047D84: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END SioMenu_8047CF0

	THUMB_FUNC_START SioMenu_8047D88
SioMenu_8047D88: @ 0x08047D88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, .L08047E20  @ gUnknown_0203DB10
	adds r0, r4, #0
	bl func_080A6A40
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl func_0804C33C
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl func_08086CE8
	ldr r0, .L08047E24  @ gUnknown_085AB358
	ldr r1, .L08047E28  @ 0x06014800
	bl Decompress
	ldr r0, .L08047E2C  @ gUnknown_085ADBE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, .L08047E30  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl func_08043164
	str r4, [r6, #0x4c]
	bl func_080A6A68
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	negs r0, r1
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L08047E34
	movs r1, #0
	movs r0, #3
	b .L08047E38
	.align 2, 0
.L08047E20: .4byte gUnknown_0203DB10
.L08047E24: .4byte gUnknown_085AB358
.L08047E28: .4byte 0x06014800
.L08047E2C: .4byte gUnknown_085ADBE8
.L08047E30: .4byte gFont_203DB64
.L08047E34:
	movs r1, #1
	movs r0, #4
.L08047E38:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, .L08047EEC  @ gUnknown_0203DA24
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r6, #0x48]
	lsls r1, r1, #1
	movs r5, #4
	mov r9, r2
	ldr r2, .L08047EF0  @ gUnknown_080D9EF0
	adds r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x3c
	adds r1, r1, r2
	mov sl, r1
.L08047E68:
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	mov r1, r9
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sl
	ldrb r1, [r2]
	mov r7, r8
	ldrb r2, [r7]
	bl func_0804C758
	str r0, [r4]
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge .L08047E68
	ldr r0, [r6, #0x2c]
	movs r1, #0
	movs r2, #0
	bl func_0804C49C
	bl func_0804C508
	ldr r0, .L08047EF4  @ gUnknown_085A9E68
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	adds r0, r6, #0
	movs r1, #0
	bl func_08047A54
	movs r1, #0
	bl func_08043100
	adds r0, r6, #0
	movs r1, #1
	bl func_08047A54
	movs r1, #1
	bl func_08043100
	bl func_080497CC
	movs r0, #0x38
	movs r1, #0
	bl StartBgm
	movs r0, #0
	str r0, [r6, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08047EEC: .4byte gUnknown_0203DA24
.L08047EF0: .4byte gUnknown_080D9EF0
.L08047EF4: .4byte gUnknown_085A9E68

	THUMB_FUNC_END SioMenu_8047D88

	THUMB_FUNC_START func_08047EF8
func_08047EF8: @ 0x08047EF8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, [r5, #0x48]
	cmp r0, #1
	bne .L08047F78
	ldr r0, .L08047FF0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L08047F42
	ldr r1, .L08047FF4  @ gUnknown_0203DA24
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls .L08047F2A
	movs r0, #2
	strb r0, [r1, #5]
.L08047F2A:
	ldr r0, [r5, #0x30]
	movs r1, #6
	negs r1, r1
	movs r2, #4
	str r2, [sp]
	movs r2, #0x34
	movs r3, #0x1f
	bl func_0804C7C8
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08047F42:
	ldr r0, .L08047FF0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L08047F78
	ldr r4, .L08047FF4  @ gUnknown_0203DA24
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
	ldrb r0, [r4, #5]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4, #5]
	ldr r0, [r5, #0x30]
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #0
	movs r2, #0x3a
	movs r3, #4
	bl func_0804C7C8
	movs r0, #3
	bl SioPlaySomeIndexedSfx
.L08047F78:
	ldr r1, .L08047FF0  @ gKeySt
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	adds r4, r1, #0
	cmp r0, #0
	beq .L08047FB2
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	cmp r1, r0
	bgt .L08047F96
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne .L08047FB2
.L08047F96:
	subs r2, r6, #1
	adds r1, r5, #0
	adds r1, #0x40
.L08047F9C:
	ldr r0, [r5, #0x48]
	subs r0, #1
	str r0, [r5, #0x48]
	cmp r0, #0
	bge .L08047FA8
	str r2, [r5, #0x48]
.L08047FA8:
	ldr r0, [r5, #0x48]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08047F9C
.L08047FB2:
	ldr r2, [r4]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq .L08047FE6
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	blt .L08047FCC
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne .L08047FE6
.L08047FCC:
	adds r4, r5, #0
	adds r4, #0x40
.L08047FD0:
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r5, #0x48]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08047FD0
.L08047FE6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08047FF0: .4byte gKeySt
.L08047FF4: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08047EF8

	THUMB_FUNC_START SioMenu_8047FF8
SioMenu_8047FF8: @ 0x08047FF8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x48]
	movs r1, #5
	bl func_08047EF8
	ldr r0, [r4, #0x48]
	cmp r5, r0
	beq .L0804805C
	movs r0, #3
	bl SioPlaySomeIndexedSfx
	lsls r0, r5, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r0, r1, r0
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0x48]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x2a
	ldrsh r1, [r3, r0]
	movs r0, #0x2c
	ldrsh r2, [r3, r0]
	adds r0, r3, #0
	bl func_0804CFB8
	adds r0, r4, #0
	movs r1, #0
	bl func_08047A54
	movs r1, #0
	bl func_08043100
	adds r0, r4, #0
	movs r1, #1
	bl func_08047A54
	movs r1, #1
	bl func_08043100
.L0804805C:
	ldr r5, .L080480AC  @ gKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08048080
	movs r0, #0
	str r0, [r4, #0x54]
	movs r0, #2
	bl SioPlaySomeIndexedSfx
	ldr r1, .L080480B0  @ gUnknown_0203DA24
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L08048080:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080480A4
	movs r0, #1
	bl SioPlaySomeIndexedSfx
	movs r0, #2
	bl FadeBgmOut
	ldr r1, .L080480B0  @ gUnknown_0203DA24
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
.L080480A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080480AC: .4byte gKeySt
.L080480B0: .4byte gUnknown_0203DA24

	THUMB_FUNC_END SioMenu_8047FF8

	THUMB_FUNC_START SioMenu_80480B4
SioMenu_80480B4: @ 0x080480B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, .L08048160  @ gUnknown_0203DA24
	ldrb r0, [r4]
	cmp r0, #0xff
	bne .L080480D0
	adds r0, r5, #0
	bl Proc_Break
.L080480D0:
	ldrb r2, [r4]
	ldr r0, [r5, #0x54]
	cmp r0, #0x10
	bgt .L0804813E
	movs r0, #4
	mov r8, r0
	lsls r2, r2, #1
	ldr r1, .L08048164  @ gUnknown_080D9EF0
	movs r4, #0x10
	mov r9, r4
	adds r0, r2, #1
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r6, #0x3c
	adds r7, r1, #0
	adds r7, #8
	adds r2, r2, r1
	mov sl, r2
.L080480F6:
	ldrb r1, [r7]
	ldr r3, [r5, #0x54]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r2, [r4]
	bl Interpolate
	adds r4, r0, #0
	ldrb r1, [r7, #1]
	ldr r0, [sp, #4]
	ldrb r2, [r0]
	ldr r3, [r5, #0x54]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	ldr r0, [r6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl func_0804C7DC
	subs r6, #4
	subs r7, #2
	movs r4, #1
	negs r4, r4
	add r8, r4
	mov r0, r8
	cmp r0, #0
	bge .L080480F6
.L0804813E:
	ldr r0, [r5, #0x54]
	cmp r0, #0x20
	ble .L0804814A
	adds r0, r5, #0
	bl Proc_Break
.L0804814A:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08048160: .4byte gUnknown_0203DA24
.L08048164: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END SioMenu_80480B4

	THUMB_FUNC_START SioMenu_8048168
SioMenu_8048168: @ 0x08048168
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	mov r1, sp
	ldr r0, .L080481BC  @ gUnknown_080D9EFC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	bl EndBG3Slider
	movs r0, #3
	bl EndFaceById
	adds r5, r6, #0
	adds r5, #0x2c
	movs r4, #4
.L0804818A:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge .L0804818A
	ldr r1, .L080481C0  @ gUnknown_0203DA24
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne .L080481C8
	bl EndBmVSync
	bl nullsub_13
	bl ClearGameLinkArenaBit
	ldr r0, .L080481C4  @ gUnknown_0859AA5C
	bl EndEachProc
	adds r0, r6, #0
	bl Proc_End
	b .L080481D8
	.align 2, 0
.L080481BC: .4byte gUnknown_080D9EFC
.L080481C0: .4byte gUnknown_0203DA24
.L080481C4: .4byte gUnknown_0859AA5C
.L080481C8:
	strb r2, [r1, #1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl SpawnProcLocking
.L080481D8:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END SioMenu_8048168

	THUMB_FUNC_START func_080481E0
func_080481E0: @ 0x080481E0
	push {r4, lr}
	adds r4, r0, #0
	bl LoadUiFrameGraphics
	ldr r0, .L08048248  @ gFont_203DB64
	ldr r1, .L0804824C  @ 0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	movs r0, #5
	bl IsSaveBlockValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08048204
	bl func_080A6560
.L08048204:
	ldr r1, .L08048250  @ gUnknown_0203DA24
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	bl SetGameLinkArenaBit
	bl func_080496A4
	bl StartBmVSync
	ldr r1, .L08048254  @ gPlaySt
	ldrb r2, [r1, #0x14]
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	ldrb r2, [r1]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, .L08048258  @ gUnknown_085A9E88
	adds r1, r4, #0
	bl SpawnProcLocking
	ldr r0, .L0804825C  @ gUnknown_0859AA5C
	movs r1, #3
	bl SpawnProc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08048248: .4byte gFont_203DB64
.L0804824C: .4byte 0x06001800
.L08048250: .4byte gUnknown_0203DA24
.L08048254: .4byte gPlaySt
.L08048258: .4byte gUnknown_085A9E88
.L0804825C: .4byte gUnknown_0859AA5C

	THUMB_FUNC_END func_080481E0

	THUMB_FUNC_START StartNameSelect
StartNameSelect: @ 0x08048260
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0804827C  @ gUnknown_085A9614
	bl SpawnProcLocking
	adds r3, r0, #0
	adds r3, #0x33
	movs r2, #0
	movs r1, #7
	strb r1, [r3]
	adds r0, #0x32
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L0804827C: .4byte gUnknown_085A9614

	THUMB_FUNC_END StartNameSelect

	THUMB_FUNC_START func_08048280
func_08048280: @ 0x08048280
	push {r4, lr}
	adds r4, r0, #0
	bl LoadLegacyUiFrameGraphics
	bl ClearGameLinkArenaBit
	ldr r0, .L080482CC  @ gFont_203DB64
	ldr r1, .L080482D0  @ 0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	ldr r1, .L080482D4  @ gUnknown_0203DA24
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	ldr r1, .L080482D8  @ gPlaySt
	adds r1, #0x41
	ldrb r2, [r1]
	subs r0, #0xd
	ands r0, r2
	strb r0, [r1]
	ldr r0, .L080482DC  @ gUnknown_085A9614
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #5
	strb r1, [r2]
	adds r0, #0x32
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080482CC: .4byte gFont_203DB64
.L080482D0: .4byte 0x06001800
.L080482D4: .4byte gUnknown_0203DA24
.L080482D8: .4byte gPlaySt
.L080482DC: .4byte gUnknown_085A9614

	THUMB_FUNC_END func_08048280

	THUMB_FUNC_START func_080482E0
func_080482E0: @ 0x080482E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	ldr r0, .L08048308  @ gUnknown_085A932C
	bl FindProc
	cmp r0, #0
	beq .L08048310
	ldr r0, .L0804830C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080483EC
	adds r0, r5, #0
	movs r1, #4
	b .L080483A8
	.align 2, 0
.L08048308: .4byte gUnknown_085A932C
.L0804830C: .4byte gKeySt
.L08048310:
	ldr r0, .L08048330  @ gUnknown_085A92E0
	ldr r3, [r0]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bgt .L08048328
	adds r1, r3, #0
	adds r1, #0xb
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne .L08048334
.L08048328:
	adds r0, r5, #0
	movs r1, #0
	b .L080483A8
	.align 2, 0
.L08048330: .4byte gUnknown_085A92E0
.L08048334:
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x1a
.L0804833A:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls .L08048344
	adds r4, #1
.L08048344:
	adds r2, #1
	cmp r2, #3
	ble .L0804833A
	bl func_080421E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08048362
	ldr r6, .L08048368  @ gUnknown_085A92E0
	ldr r2, [r6]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi .L08048362
	cmp r4, #0
	beq .L0804836C
.L08048362:
	adds r0, r5, #0
	movs r1, #0
	b .L080483A8
	.align 2, 0
.L08048368: .4byte gUnknown_085A92E0
.L0804836C:
	ldr r0, .L080483B0  @ gUnknown_03004E80
	movs r1, #0x8c
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl func_080422B8
	ldr r0, [r6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L080483B4
	bl func_080A6C1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L080483B4
	mov r1, sp
	movs r0, #1
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl func_080426F4
	adds r0, r5, #0
	movs r1, #3
.L080483A8:
	bl nullsub_15
.L080483AC:
	movs r0, #0
	b .L080483EE
	.align 2, 0
.L080483B0: .4byte gUnknown_03004E80
.L080483B4:
	ldr r4, .L080483E8  @ gUnknown_085A92E0
	ldr r2, [r4]
	ldrb r0, [r2, #9]
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	bne .L080483EC
	strb r1, [r2, #9]
	bl func_08042AF4
	ldr r1, [r4]
	movs r2, #0
	movs r0, #6
	strh r0, [r1, #4]
	strb r2, [r1, #0x1e]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080483AC
	adds r0, r5, #0
	movs r1, #1
	bl nullsub_15
	b .L080483AC
	.align 2, 0
.L080483E8: .4byte gUnknown_085A92E0
.L080483EC:
	movs r0, #1
.L080483EE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080482E0

	THUMB_FUNC_START func_080483F8
func_080483F8: @ 0x080483F8
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08048414  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bls .L0804840E
	adds r0, r1, #0
	movs r1, #0
	bl nullsub_15
.L0804840E:
	pop {r0}
	bx r0
	.align 2, 0
.L08048414: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_080483F8

	THUMB_FUNC_START func_08048418
func_08048418: @ 0x08048418
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetDialoguePromptResult
	cmp r0, #1
	bne .L08048430
	ldr r1, .L0804842C  @ gUnknown_0203DD8C
	movs r0, #0
	b .L08048434
	.align 2, 0
.L0804842C: .4byte gUnknown_0203DD8C
.L08048430:
	ldr r1, .L0804845C  @ gUnknown_0203DD8C
	movs r0, #1
.L08048434:
	str r0, [r1]
	adds r4, r1, #0
	mov r0, sp
	ldr r1, [r4]
	strb r1, [r0]
	movs r1, #4
	bl func_080426F4
	ldr r0, [r4]
	cmp r0, #0
	beq .L08048452
	adds r0, r5, #0
	movs r1, #5
	bl nullsub_15
.L08048452:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804845C: .4byte gUnknown_0203DD8C

	THUMB_FUNC_END func_08048418

	THUMB_FUNC_START func_08048460
func_08048460: @ 0x08048460
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r4, #0
	movs r1, #0
	ldr r0, .L080484A8  @ gUnknown_085A92E0
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
.L08048472:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls .L0804847C
	adds r4, #1
.L0804847C:
	adds r1, #1
	cmp r1, #3
	ble .L08048472
	bl func_080421E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804849A
	ldr r0, .L080484A8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0x3c
	bhi .L0804849A
	cmp r4, #0
	beq .L080484AC
.L0804849A:
	adds r0, r5, #0
	movs r1, #0
	bl nullsub_15
.L080484A2:
	movs r0, #0
	b .L080484D0
	.align 2, 0
.L080484A8: .4byte gUnknown_085A92E0
.L080484AC:
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L080484CE
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq .L080484A2
	adds r0, r5, #0
	movs r1, #5
	bl nullsub_15
	b .L080484A2
.L080484CE:
	movs r0, #1
.L080484D0:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08048460

	THUMB_FUNC_START func_080484D8
func_080484D8: @ 0x080484D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x36
	movs r2, #2
	adds r3, r6, #0
	bl func_08042DE8
	ldr r0, .L0804851C  @ 0x000005AE
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, .L08048520  @ gBg0Tm+0x31E
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804851C: .4byte 0x000005AE
.L08048520: .4byte gBg0Tm+0x31E

	THUMB_FUNC_END func_080484D8

	THUMB_FUNC_START func_08048524
func_08048524: @ 0x08048524
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L0804857C
	ldr r0, .L08048584  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08048548
	movs r0, #0x7d
	bl m4aSongNumStart
.L08048548:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, .L08048588  @ gUnknown_0203DA88
	ldr r1, .L0804858C  @ gUnknown_080D9F18
	ldrb r2, [r5]
	bl func_080484D8
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, .L08048590  @ gBg0Tm+0x3DC
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r4, #0x64
	str r4, [sp]
	ldrb r1, [r5]
	str r1, [sp, #4]
	ldrb r1, [r5]
	subs r4, r4, r1
	str r4, [sp, #8]
	movs r1, #0xe
	bl func_08086B2C
	movs r0, #1
	bl EnableBgSync
.L0804857C:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048584: .4byte gPlaySt
.L08048588: .4byte gUnknown_0203DA88
.L0804858C: .4byte gUnknown_080D9F18
.L08048590: .4byte gBg0Tm+0x3DC

	THUMB_FUNC_END func_08048524

	THUMB_FUNC_START func_08048594
func_08048594: @ 0x08048594
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bcs .L080485EC
	ldr r0, .L080485F4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080485B8
	movs r0, #0x7d
	bl m4aSongNumStart
.L080485B8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, .L080485F8  @ gUnknown_0203DA88
	ldr r1, .L080485FC  @ gUnknown_080D9F20
	ldrb r2, [r5]
	bl func_080484D8
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, .L08048600  @ gBg0Tm+0x3DC
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r4, #0x64
	str r4, [sp]
	ldrb r1, [r5]
	str r1, [sp, #4]
	ldrb r1, [r5]
	subs r4, r4, r1
	str r4, [sp, #8]
	movs r1, #0xe
	bl func_08086B2C
	movs r0, #1
	bl EnableBgSync
.L080485EC:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080485F4: .4byte gPlaySt
.L080485F8: .4byte gUnknown_0203DA88
.L080485FC: .4byte gUnknown_080D9F20
.L08048600: .4byte gBg0Tm+0x3DC

	THUMB_FUNC_END func_08048594

	THUMB_FUNC_START func_08048604
func_08048604: @ 0x08048604
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L08048648  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, .L0804864C  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L08048660
	ldr r1, .L08048650  @ ReadSramFast
	ldr r0, .L08048654  @ 0x0E007400
	ldr r4, .L08048658  @ gUnknown_02000000
	movs r5, #0xc0
	lsls r5, r5, #4
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	ldr r2, .L0804865C  @ func_08048524
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl func_08042CF0
	b .L0804866A
	.align 2, 0
.L08048648: .4byte gFont_203DB64
.L0804864C: .4byte gUnknown_085A92E0
.L08048650: .4byte ReadSramFast
.L08048654: .4byte 0x0E007400
.L08048658: .4byte gUnknown_02000000
.L0804865C: .4byte func_08048524
.L08048660:
	ldr r0, .L08048674  @ gUnknown_02000000
	ldr r1, .L08048678  @ func_08048594
	adds r2, r6, #0
	bl func_08042D70
.L0804866A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08048674: .4byte gUnknown_02000000
.L08048678: .4byte func_08048594

	THUMB_FUNC_END func_08048604

	THUMB_FUNC_START func_0804867C
func_0804867C: @ 0x0804867C
	push {lr}
	bl func_08042D9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804868C
	movs r0, #1
	b .L080486BE
.L0804868C:
	ldr r0, .L080486C4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804869E
	movs r0, #0x7e
	bl m4aSongNumStart
.L0804869E:
	bl InitTalkTextFont
	ldr r0, .L080486C8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080486BC
	ldr r0, .L080486CC  @ gUnknown_02000000
	ldr r1, .L080486D0  @ 0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	bl WriteAndVerifySramFast
.L080486BC:
	movs r0, #0
.L080486BE:
	pop {r1}
	bx r1
	.align 2, 0
.L080486C4: .4byte gPlaySt
.L080486C8: .4byte gUnknown_085A92E0
.L080486CC: .4byte gUnknown_02000000
.L080486D0: .4byte 0x0E007400

	THUMB_FUNC_END func_0804867C

	THUMB_FUNC_START func_080486D4
func_080486D4: @ 0x080486D4
	ldr r0, .L080486E4  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
.L080486E4: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_080486D4

	THUMB_FUNC_START func_080486E8
func_080486E8: @ 0x080486E8
	push {r4, lr}
	ldr r0, .L08048714  @ gUnknown_03004F0C
	movs r2, #0
	movs r1, #0x89
	strb r1, [r0]
	ldr r4, .L08048718  @ gUnknown_085A92E0
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl func_080422B8
	ldr r4, [r4]
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	beq .L0804871C
	movs r0, #1
	b .L08048728
	.align 2, 0
.L08048714: .4byte gUnknown_03004F0C
.L08048718: .4byte gUnknown_085A92E0
.L0804871C:
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	movs r0, #0
.L08048728:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080486E8

	THUMB_FUNC_START func_08048730
func_08048730: @ 0x08048730
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #6
	bl UnpackUiBarPalette
	movs r5, #0
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xb
	movs r2, #0x10
	movs r3, #6
	bl DrawUiFrame2
	ldr r0, .L0804878C  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	ldr r4, .L08048790  @ gUnknown_0203DA88
	ldr r0, .L08048794  @ 0x0000077E
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl func_080484D8
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, .L08048798  @ gBg0Tm+0x3DC
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	str r5, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xd
	bl func_08086B2C
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804878C: .4byte gFont_203DB64
.L08048790: .4byte gUnknown_0203DA88
.L08048794: .4byte 0x0000077E
.L08048798: .4byte gBg0Tm+0x3DC

	THUMB_FUNC_END func_08048730

	THUMB_FUNC_START func_0804879C
func_0804879C: @ 0x0804879C
	ldr r2, .L080487BC  @ gDispIo
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
	bx lr
	.align 2, 0
.L080487BC: .4byte gDispIo

	THUMB_FUNC_END func_0804879C

	THUMB_FUNC_START func_080487C0
func_080487C0: @ 0x080487C0
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	movs r0, #3
	bl EndFaceById
	adds r5, r4, #0
	adds r5, #0x2c
	movs r4, #4
.L080487D0:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge .L080487D0
	bl func_0804C33C
	movs r0, #0
	movs r1, #0
	bl nullsub_16
	ldr r0, .L08048810  @ gUnknown_085A92E0
	ldr r1, [r0]
	movs r0, #3
	strb r0, [r1]
	ldr r0, .L08048814  @ gFont_203DB64
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, .L08048818  @ gUnknown_0203DA88
	movs r1, #0xa
	bl InitTextDb
	movs r0, #1
	bl FadeBgmOut
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048810: .4byte gUnknown_085A92E0
.L08048814: .4byte gFont_203DB64
.L08048818: .4byte gUnknown_0203DA88

	THUMB_FUNC_END func_080487C0

	THUMB_FUNC_START func_0804881C
func_0804881C: @ 0x0804881C
	push {lr}
	bl func_08043044
	bl func_08045CBC
	bl func_08045CE0
	bl func_08041898
	bl func_080A6AA0
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804881C

	THUMB_FUNC_START func_08048838
func_08048838: @ 0x08048838
	push {lr}
	bl InitSaveGeneralGameMetadata
	bl func_080A39B4
	bl func_080A3E28
	bl func_080A3F84
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08048838

	THUMB_FUNC_START func_08048850
func_08048850: @ 0x08048850
	push {lr}
	ldr r0, .L08048860  @ gUnknown_085A9F48
	movs r1, #3
	bl CallEvent
	pop {r0}
	bx r0
	.align 2, 0
.L08048860: .4byte gUnknown_085A9F48

	THUMB_FUNC_END func_08048850

	THUMB_FUNC_START func_08048864
func_08048864: @ 0x08048864
	push {lr}
	sub sp, #4
	ldr r3, .L08048880  @ gUnknown_085A9F98
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08048880: .4byte gUnknown_085A9F98

	THUMB_FUNC_END func_08048864

	THUMB_FUNC_START func_08048884
func_08048884: @ 0x08048884
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, .L080488C8  @ gUnknown_0203DA24
	adds r1, r0, #0
	adds r1, #0xa0
	ldrb r3, [r1]
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080488D0
	movs r6, #0
	cmp r6, r3
	bge .L0804892A
	ldr r4, .L080488CC  @ gUnknown_0203DD9F
	adds r5, r4, #5
	mov r2, r8
.L080488AC:
	adds r1, r6, r4
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r2, #4]
	adds r2, #8
	adds r6, #1
	cmp r6, r3
	blt .L080488AC
	b .L0804892A
	.align 2, 0
.L080488C8: .4byte gUnknown_0203DA24
.L080488CC: .4byte gUnknown_0203DD9F
.L080488D0:
	movs r6, #0
	subs r0, r3, #2
	mov ip, r0
	cmp r6, r3
	bge .L080488F0
	ldr r0, .L080488F4  @ gUnknown_0203DD90
	adds r2, r0, #0
	adds r2, #0x14
	mov r1, r8
.L080488E2:
	strb r6, [r1]
	ldm r2!, {r0}
	str r0, [r1, #4]
	adds r1, #8
	adds r6, #1
	cmp r6, r3
	blt .L080488E2
.L080488F0:
	movs r6, #0
	b .L08048924
	.align 2, 0
.L080488F4: .4byte gUnknown_0203DD90
.L080488F8:
	adds r5, r0, #0
	adds r7, r6, #1
	cmp r0, r6
	blt .L08048922
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
.L08048906:
	ldr r4, [r2, #4]
	ldr r3, [r2, #0xc]
	cmp r4, r3
	bcs .L0804891A
	ldrb r1, [r2]
	ldrb r0, [r2, #8]
	strb r0, [r2]
	strb r1, [r2, #8]
	str r3, [r2, #4]
	str r4, [r2, #0xc]
.L0804891A:
	subs r2, #8
	subs r5, #1
	cmp r5, r6
	bge .L08048906
.L08048922:
	adds r6, r7, #0
.L08048924:
	mov r0, ip
	cmp r6, r0
	ble .L080488F8
.L0804892A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08048884

	THUMB_FUNC_START func_08048934
func_08048934: @ 0x08048934
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, .L08048980  @ gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	adds r4, r2, #1
.L08048948:
	adds r2, r1, #1
	movs r1, #5
.L0804894C:
	strh r3, [r0]
	adds r0, #2
	adds r3, #1
	subs r1, #1
	cmp r1, #0
	bge .L0804894C
	adds r0, #0x34
	adds r1, r2, #0
	cmp r1, #3
	ble .L08048948
	adds r0, r6, #0
	bl ClearText
	lsls r0, r4, #5
	adds r0, #4
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, .L08048984  @ gBg0Tm
	adds r0, r0, r1
	movs r1, #2
	ldr r2, [sp, #0x10]
	bl PutNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08048980: .4byte gBg1Tm
.L08048984: .4byte gBg0Tm

	THUMB_FUNC_END func_08048934

	THUMB_FUNC_START func_08048988
func_08048988: @ 0x08048988
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, .L08048A48  @ gUnknown_085AD80C
	ldr r1, .L08048A4C  @ 0x06002800
	bl Decompress
	ldr r0, .L08048A50  @ gUnknown_085ADC48
	movs r1, #0x40
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	movs r0, #0
	mov r9, r0
	ldr r0, .L08048A54  @ gUnknown_080D9F28
	mov sl, r0
	adds r6, r4, #0
	adds r6, #0x2c
	ldr r7, .L08048A58  @ gUnknown_080D9F98
.L080489C0:
	ldr r0, .L08048A5C  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r9
	add r0, sl
	ldrb r5, [r0]
	adds r0, r5, #0
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08048A24
	ldr r0, .L08048A60  @ gUnknown_0203DD90
	mov r8, r0
	adds r0, #0xa
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r4, r5, #2
	cmp r0, #0
	bne .L080489F8
	lsls r1, r4, #5
	ldr r0, .L08048A64  @ gUnknown_085ADDA8
	movs r2, #0x20
	bl ApplyPaletteExt
.L080489F8:
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #4
	bl InitTextDb
	ldrb r1, [r7]
	ldrb r2, [r7, #1]
	lsls r0, r5, #2
	mov r3, r8
	adds r3, #0x14
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	adds r3, r4, #0
	bl func_08048934
.L08048A24:
	adds r6, #8
	adds r7, #2
	movs r0, #1
	add r9, r0
	mov r0, r9
	cmp r0, #3
	ble .L080489C0
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08048A48: .4byte gUnknown_085AD80C
.L08048A4C: .4byte 0x06002800
.L08048A50: .4byte gUnknown_085ADC48
.L08048A54: .4byte gUnknown_080D9F28
.L08048A58: .4byte gUnknown_080D9F98
.L08048A5C: .4byte gUnknown_085A92E0
.L08048A60: .4byte gUnknown_0203DD90
.L08048A64: .4byte gUnknown_085ADDA8

	THUMB_FUNC_END func_08048988

	THUMB_FUNC_START nullsub_43
nullsub_43: @ 0x08048A68
	bx lr

	THUMB_FUNC_END nullsub_43

	THUMB_FUNC_START func_08048A6C
func_08048A6C: @ 0x08048A6C
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, .L08048A90  @ gUnknown_085AA06C
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08048A90: .4byte gUnknown_085AA06C

	THUMB_FUNC_END func_08048A6C

	THUMB_FUNC_START func_08048A94
func_08048A94: @ 0x08048A94
	push {lr}
	ldr r0, .L08048AA4  @ gUnknown_085AA06C
	bl EndEachProc
	bl ClearBg0Bg1
	pop {r0}
	bx r0
	.align 2, 0
.L08048AA4: .4byte gUnknown_085AA06C

	THUMB_FUNC_END func_08048A94

	THUMB_FUNC_START func_08048AA8
func_08048AA8: @ 0x08048AA8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r1, .L08048AFC  @ gUnknown_080D9F38
	adds r2, r5, #0
	adds r2, #0x32
	ldr r0, .L08048B00  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08048B04
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, #8
	beq .L08048AEA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
.L08048AEA:
	lsls r0, r0, #4
	subs r0, #0x10
	strh r0, [r5, #0x2a]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	strh r0, [r5, #0x2c]
	lsls r2, r2, #1
	b .L08048B2C
	.align 2, 0
.L08048AFC: .4byte gUnknown_080D9F38
.L08048B00: .4byte gUnknown_085A92E0
.L08048B04:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, .L08048B68  @ gUnknown_085AA084
	lsls r0, r2, #3
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	subs r0, #0xc
	strh r0, [r5, #0x2a]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r2, r2, #1
	adds r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	strh r0, [r5, #0x2c]
.L08048B2C:
	ldr r1, .L08048B6C  @ gUnknown_080D9F98
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	movs r4, #0
	strh r0, [r5, #0x2e]
	adds r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x30]
	ldr r0, .L08048B70  @ gUnknown_02000C60
	bl SetTextFont
	ldr r0, .L08048B74  @ gUnknown_02000C78
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r1, #0x18
	ldr r3, [r5, #0x34]
	movs r2, #2
	bl func_08042DE8
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048B68: .4byte gUnknown_085AA084
.L08048B6C: .4byte gUnknown_080D9F98
.L08048B70: .4byte gUnknown_02000C60
.L08048B74: .4byte gUnknown_02000C78

	THUMB_FUNC_END func_08048AA8

	THUMB_FUNC_START func_08048B78
func_08048B78: @ 0x08048B78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	str r0, [sp, #4]
	ldr r3, [r7, #0x3c]
	cmp r3, #0x10
	bhi .L08048C0C
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	mov r2, r8
	bl Interpolate
	mov sl, r0
	ldr r4, .L08048C40  @ gSinLut
	movs r1, #0x80
	adds r1, r1, r4
	mov r9, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L08048C0C:
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08048C64
	ldr r1, [r7, #0x3c]
	cmp r1, #3
	bls .L08048C64
	cmp r1, #0x16
	bhi .L08048C64
	subs r2, r1, #4
	ldr r4, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bne .L08048C48
	ldr r0, .L08048C44  @ gUnknown_085AA0A4
	lsls r1, r2, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r2, [r7, #0x2a]
	adds r0, r0, r2
	strh r0, [r7, #0x2a]
	b .L08048C58
	.align 2, 0
.L08048C40: .4byte gSinLut
.L08048C44: .4byte gUnknown_085AA0A4
.L08048C48:
	ldr r1, .L08048CA8  @ gUnknown_085AA0A4
	lsls r2, r2, #1
	adds r1, r2, r1
	ldrh r0, [r7, #0x2a]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r7, #0x2a]
	adds r1, r2, #0
.L08048C58:
	ldr r0, .L08048CAC  @ gUnknown_085AA0CA
	adds r0, r1, r0
	ldrh r1, [r7, #0x2c]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r7, #0x2c]
.L08048C64:
	movs r4, #0x2a
	ldrsh r0, [r7, r4]
	movs r2, #0x2c
	ldrsh r1, [r7, r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r2, .L08048CB0  @ Sprite_32x16
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r3, [r3]
	lsls r3, r3, #2
	ldr r4, .L08048CB4  @ 0x00009340
	adds r3, r3, r4
	bl PutOamHiRam
	ldr r0, [r7, #0x3c]
	adds r0, #1
	str r0, [r7, #0x3c]
	cmp r0, #0x40
	bls .L08048C98
	movs r0, #0
	str r0, [r7, #0x3c]
	adds r0, r7, #0
	bl Proc_Break
.L08048C98:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08048CA8: .4byte gUnknown_085AA0A4
.L08048CAC: .4byte gUnknown_085AA0CA
.L08048CB0: .4byte Sprite_32x16
.L08048CB4: .4byte 0x00009340

	THUMB_FUNC_END func_08048B78

	THUMB_FUNC_START func_08048CB8
func_08048CB8: @ 0x08048CB8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2a
	ldrsh r1, [r6, r0]
	movs r0, #0x2e
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	movs r4, #0x30
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	movs r0, #0x30
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	adds r1, r0, #0
	ldr r2, .L08048D14  @ Sprite_32x16
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsls r3, r3, #2
	ldr r0, .L08048D18  @ 0x00009340
	adds r3, r3, r0
	adds r0, r5, #0
	bl PutOamHiRam
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	cmp r0, #0x20
	bls .L08048D0C
	adds r0, r6, #0
	bl Proc_Break
.L08048D0C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08048D14: .4byte Sprite_32x16
.L08048D18: .4byte 0x00009340

	THUMB_FUNC_END func_08048CB8

	THUMB_FUNC_START func_08048D1C
func_08048D1C: @ 0x08048D1C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #2
	adds r3, r6, #0
	bl func_08042DE8
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, .L08048D60  @ gBg0Tm
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08048D60: .4byte gBg0Tm

	THUMB_FUNC_END func_08048D1C

	THUMB_FUNC_START func_08048D64
func_08048D64: @ 0x08048D64
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, .L08048DC4  @ gUnknown_080D9F38
	adds r2, r6, #0
	adds r2, #0x32
	ldr r0, .L08048DC8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r2, .L08048DCC  @ gUnknown_080D9F98
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	movs r5, #0
	strh r1, [r6, #0x2a]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r6, #0x2c]
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	movs r3, #0x2c
	ldrsh r2, [r6, r3]
	ldr r3, [r6, #0x38]
	ldr r4, [r6, #0x34]
	subs r3, r3, r4
	bl func_08048D1C
	str r5, [r6, #0x3c]
	ldr r0, [r6, #0x38]
	ldr r1, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08048DC4: .4byte gUnknown_080D9F38
.L08048DC8: .4byte gUnknown_085A92E0
.L08048DCC: .4byte gUnknown_080D9F98

	THUMB_FUNC_END func_08048D64

	THUMB_FUNC_START func_08048DD0
func_08048DD0: @ 0x08048DD0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	ldr r1, [r4, #0x34]
	subs r1, r2, r1
	ldr r3, [r4, #0x3c]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	movs r3, #0x2c
	ldrsh r2, [r4, r3]
	adds r3, r5, #0
	bl func_08048D1C
	ldr r0, [r4, #0x44]
	cmp r0, r5
	beq .L08048E2E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r1, [r0]
	ldr r0, .L08048E60  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L08048E2E
	ldr r0, .L08048E64  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08048E2E
	movs r0, #0x80
	bl m4aSongNumStart
.L08048E2E:
	str r5, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0xa
	bls .L08048E56
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r1, .L08048E68  @ gUnknown_0203DD90
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r1, [r4, #0x38]
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
.L08048E56:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08048E60: .4byte gUnknown_085A92E0
.L08048E64: .4byte gPlaySt
.L08048E68: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_08048DD0

	THUMB_FUNC_START func_08048E6C
func_08048E6C: @ 0x08048E6C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x3c]
	adds r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #0x14
	bls .L08048E80
	adds r0, r1, #0
	bl Proc_Break
.L08048E80:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08048E6C

	THUMB_FUNC_START func_08048E84
func_08048E84: @ 0x08048E84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08048EB0  @ gUnknown_02000C60
	bl SetTextFont
	ldr r1, [r4, #0x54]
	movs r0, #0x50
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	ldr r0, .L08048EB4  @ gUnknown_02000C78
	adds r1, #0x80
	ldr r3, [r4, #0x54]
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08048EB0: .4byte gUnknown_02000C60
.L08048EB4: .4byte gUnknown_02000C78

	THUMB_FUNC_END func_08048E84

	THUMB_FUNC_START func_08048EB8
func_08048EB8: @ 0x08048EB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt .L08048F4A
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r0, r9
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	mov sl, r0
	ldr r4, .L08048FB8  @ gSinLut
	ldr r2, .L08048FBC  @ gSinLut+0x80
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, .L08048FBC  @ gSinLut+0x80
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L08048F4A:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, .L08048FC0  @ Sprite_32x16
	ldr r3, .L08048FC4  @ 0x00009350
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, .L08048FC8  @ 0x00009354
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, .L08048FCC  @ Sprite_16x16
	ldr r3, .L08048FD0  @ 0x00009358
	bl PutOamHiRam
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble .L08048FA6
	movs r0, #0
	strh r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
.L08048FA6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08048FB8: .4byte gSinLut
.L08048FBC: .4byte gSinLut+0x80
.L08048FC0: .4byte Sprite_32x16
.L08048FC4: .4byte 0x00009350
.L08048FC8: .4byte 0x00009354
.L08048FCC: .4byte Sprite_16x16
.L08048FD0: .4byte 0x00009358

	THUMB_FUNC_END func_08048EB8

	THUMB_FUNC_START func_08048FD4
func_08048FD4: @ 0x08048FD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x4c
	str r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt .L0804906A
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	movs r2, #0x10
	bl Interpolate
	mov sl, r0
	ldr r4, .L080490D4  @ gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L0804906A:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, .L080490D8  @ Sprite_32x16
	ldr r3, .L080490DC  @ 0x00009350
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, .L080490E0  @ 0x00009354
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, .L080490E4  @ Sprite_16x16
	ldr r3, .L080490E8  @ 0x00009358
	bl PutOamHiRam
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble .L080490C2
	adds r0, r7, #0
	bl Proc_Break
.L080490C2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080490D4: .4byte gSinLut
.L080490D8: .4byte Sprite_32x16
.L080490DC: .4byte 0x00009350
.L080490E0: .4byte 0x00009354
.L080490E4: .4byte Sprite_16x16
.L080490E8: .4byte 0x00009358

	THUMB_FUNC_END func_08048FD4

	THUMB_FUNC_START func_080490EC
func_080490EC: @ 0x080490EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r9, r3
	movs r0, #0
	mov sl, r0
	ldr r0, .L080491C4  @ Pal_SystemText
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080491C8  @ gUnknown_02000C60
	ldr r1, .L080491CC  @ 0x06016800
	movs r2, #3
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, .L080491D0  @ gUnknown_02000C78
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl DrawSpriteTextBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r1, #0
	mov r8, r1
.L08049142:
	ldr r0, .L080491D4  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldr r1, .L080491D8  @ gUnknown_080D9F38
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080491F0
	ldr r6, .L080491DC  @ gUnknown_0203DD90
	lsls r5, r4, #3
	adds r0, r6, #0
	adds r0, #0x30
	adds r7, r5, r0
	ldr r0, [r7]
	cmp r0, #0
	beq .L080491E8
	ldr r0, .L080491E0  @ gUnknown_085AA0F0
	ldr r1, [sp, #0x34]
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r0, #0x32
	strb r4, [r0]
	adds r0, r5, r6
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x33
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x14
	adds r3, r1, r0
	ldr r1, [r3]
	ldr r0, [r7]
	adds r1, r1, r0
	str r1, [r2, #0x38]
	ldr r0, .L080491E4  @ 0x0000270F
	cmp r1, r0
	bls .L080491A4
	str r0, [r2, #0x38]
.L080491A4:
	ldr r0, [r2, #0x38]
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x40
	mov r1, r9
	strb r1, [r0]
	adds r0, #8
	movs r1, #4
	bl InitTextDb
	movs r0, #1
	add sl, r0
	b .L080491F0
	.align 2, 0
.L080491C4: .4byte Pal_SystemText
.L080491C8: .4byte gUnknown_02000C60
.L080491CC: .4byte 0x06016800
.L080491D0: .4byte gUnknown_02000C78
.L080491D4: .4byte gUnknown_085A92E0
.L080491D8: .4byte gUnknown_080D9F38
.L080491DC: .4byte gUnknown_0203DD90
.L080491E0: .4byte gUnknown_085AA0F0
.L080491E4: .4byte 0x0000270F
.L080491E8:
	mov r0, sp
	movs r1, #4
	bl InitTextDb
.L080491F0:
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #3
	ble .L08049142
	mov r1, sl
	cmp r1, #0
	beq .L08049224
	mov r0, r9
	cmp r0, #0
	beq .L0804921A
	ldr r0, .L08049220  @ gUnknown_085AA130
	ldr r1, [sp, #0x34]
	bl SpawnProcLocking
	ldr r1, [sp, #8]
	str r1, [r0, #0x2c]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x30]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x54]
.L0804921A:
	movs r0, #1
	b .L08049226
	.align 2, 0
.L08049220: .4byte gUnknown_085AA130
.L08049224:
	movs r0, #0
.L08049226:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080490EC

	THUMB_FUNC_START func_08049238
func_08049238: @ 0x08049238
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl func_08048A6C
	ldr r0, .L08049268  @ 0x00000771
	bl GetMsg
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #1
	bl func_080490EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08049260
	bl func_08048A94
.L08049260:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08049268: .4byte 0x00000771

	THUMB_FUNC_END func_08049238

	THUMB_FUNC_START func_0804926C
func_0804926C: @ 0x0804926C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl func_08048A6C
	ldr r0, .L08049294  @ 0x00000771
	bl GetMsg
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #0
	bl func_080490EC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08049294: .4byte 0x00000771

	THUMB_FUNC_END func_0804926C

	THUMB_FUNC_START func_08049298
func_08049298: @ 0x08049298
	push {lr}
	adds r1, r0, #0
	adds r1, #0x1e
	ldr r3, .L080492B4  @ gUnknown_03001840
	movs r2, #4
.L080492A2:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge .L080492A2
	pop {r0}
	bx r0
	.align 2, 0
.L080492B4: .4byte gUnknown_03001840

	THUMB_FUNC_END func_08049298

	THUMB_FUNC_START func_080492B8
func_080492B8: @ 0x080492B8
	push {lr}
	ldr r3, .L080492D4  @ gUnknown_03001840
	adds r1, r0, #0
	adds r1, #0x1e
	movs r2, #4
.L080492C2:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge .L080492C2
	pop {r0}
	bx r0
	.align 2, 0
.L080492D4: .4byte gUnknown_03001840

	THUMB_FUNC_END func_080492B8

	THUMB_FUNC_START func_080492D8
func_080492D8: @ 0x080492D8
	push {lr}
	bl func_08049594
	bl RefreshUnitSprites
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080492D8

	THUMB_FUNC_START func_080492E8
func_080492E8: @ 0x080492E8
	push {lr}
	movs r1, #0
	ldr r3, .L08049304  @ gUnknown_0203DD90
	adds r2, r3, #0
	adds r2, #0xa
.L080492F2:
	cmp r0, #2
	beq .L0804931A
	cmp r0, #2
	bgt .L08049308
	cmp r0, #0
	beq .L08049312
	cmp r0, #1
	beq .L08049316
	b .L08049324
	.align 2, 0
.L08049304: .4byte gUnknown_0203DD90
.L08049308:
	cmp r0, #3
	beq .L0804931E
	cmp r0, #0xff
	beq .L08049322
	b .L08049324
.L08049312:
	movs r1, #2
	b .L08049324
.L08049316:
	movs r1, #3
	b .L08049324
.L0804931A:
	movs r1, #1
	b .L08049324
.L0804931E:
	movs r1, #0
	b .L08049324
.L08049322:
	movs r1, #0xff
.L08049324:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08049334
	cmp r1, #0xff
	beq .L08049334
	adds r0, r1, #0
	b .L080492F2
.L08049334:
	strb r1, [r3, #1]
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080492E8

	THUMB_FUNC_START func_0804933C
func_0804933C: @ 0x0804933C
	ldr r1, .L0804934C  @ gUnknown_03001834
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #3]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
.L0804934C: .4byte gUnknown_03001834

	THUMB_FUNC_END func_0804933C

	THUMB_FUNC_START func_08049350
func_08049350: @ 0x08049350
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	bl func_0804933C
	ldr r1, .L0804938C  @ gUnknown_03001834
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r6, [r1, #2]
	ldr r0, [sp]
	strb r0, [r1, #3]
	ldr r0, .L08049390  @ gUnknown_0203DA24
	ldrb r0, [r0]
	cmp r0, #2
	beq .L08049394
	movs r0, #0
	b .L080493A0
	.align 2, 0
.L0804938C: .4byte gUnknown_03001834
.L08049390: .4byte gUnknown_0203DA24
.L08049394:
	adds r0, r1, #0
	movs r1, #4
	bl func_080426F4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
.L080493A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08049350

	THUMB_FUNC_START func_080493A8
func_080493A8: @ 0x080493A8
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r2, #0
	ldr r4, .L080493C0  @ gUnknown_03001818
.L080493B4:
	adds r1, r2, r4
	ldrb r1, [r1]
	cmp r1, r3
	bne .L080493C4
	adds r0, r2, #0
	b .L080493CA
	.align 2, 0
.L080493C0: .4byte gUnknown_03001818
.L080493C4:
	adds r2, #1
	cmp r2, #0x13
	ble .L080493B4
.L080493CA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080493A8

	THUMB_FUNC_START func_080493D0
func_080493D0: @ 0x080493D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	str r1, [sp, #0x10]
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x34]
	mov r9, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, .L080494C4  @ gUnknown_080D9FA0
	mov r0, sp
	movs r2, #8
	bl memcpy
	add r7, sp, #8
	ldr r1, .L080494C8  @ gUnknown_080D9FA8
	adds r0, r7, #0
	movs r2, #8
	bl memcpy
	adds r0, r4, #0
	bl func_080493A8
	adds r4, r0, #0
	movs r1, #5
	bl Div
	lsls r6, r0, #1
	strb r4, [r5]
	ldr r0, .L080494CC  @ gUnknown_03001818
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	bne .L0804944C
	adds r0, r5, #0
	bl MU_Create
	ldr r1, .L080494D0  @ gUnknown_03001838
	ldr r2, [sp, #0x10]
	lsls r4, r2, #2
	adds r4, r4, r1
	str r0, [r4]
	bl MU_DisableAttractCamera
	ldr r0, [r4]
	mov r3, sp
	adds r1, r3, r6
	bl MU_StartMoveScript
.L0804944C:
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	bl RefreshUnitSprites
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	adds r4, r7, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, r6, #1
	adds r3, r7, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	mov r2, r9
	str r1, [r2]
	ldr r0, [r5, #0xc]
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq .L080494B4
	mov r2, r8
	ldr r0, [r2]
	movs r2, #0
	strb r0, [r5, #0x10]
	mov r1, r9
	ldr r0, [r1]
	strb r0, [r5, #0x11]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, r8
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	movs r1, #0
	ldrsb r1, [r3, r1]
	mov r3, r9
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	ldr r1, .L080494D0  @ gUnknown_03001838
	ldr r4, [sp, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r1
	str r2, [r0]
.L080494B4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080494C4: .4byte gUnknown_080D9FA0
.L080494C8: .4byte gUnknown_080D9FA8
.L080494CC: .4byte gUnknown_03001818
.L080494D0: .4byte gUnknown_03001838

	THUMB_FUNC_END func_080493D0

	THUMB_FUNC_START func_080494D4
func_080494D4: @ 0x080494D4
	push {lr}
	ldr r1, .L080494EC  @ gUnknown_03001818
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x13
.L080494DE:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L080494DE
	pop {r0}
	bx r0
	.align 2, 0
.L080494EC: .4byte gUnknown_03001818

	THUMB_FUNC_END func_080494D4

	THUMB_FUNC_START func_080494F0
func_080494F0: @ 0x080494F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
.L080494FE:
	ldr r0, .L08049580  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, .L08049584  @ gUnknown_080D9F28
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl func_08042194
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov r9, r1
	cmp r0, #0
	beq .L08049568
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, .L08049588  @ gUnknown_080D9F48
	mov sl, r0
.L08049530:
	adds r0, r3, r7
	adds r5, r0, r6
	ldr r0, .L0804958C  @ gUnknown_080D9FB0
	adds r0, r6, r0
	ldrb r0, [r0]
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r3, [sp]
	cmp r0, #0
	beq .L08049562
	ldr r0, .L08049590  @ gUnknown_03001818
	adds r0, r5, r0
	strb r4, [r0]
	lsls r1, r5, #2
	add r1, sl
	ldrh r0, [r1]
	strb r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x11]
.L08049562:
	adds r6, #1
	cmp r6, #4
	ble .L08049530
.L08049568:
	mov r7, r9
	cmp r7, #3
	ble .L080494FE
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08049580: .4byte gUnknown_085A92E0
.L08049584: .4byte gUnknown_080D9F28
.L08049588: .4byte gUnknown_080D9F48
.L0804958C: .4byte gUnknown_080D9FB0
.L08049590: .4byte gUnknown_03001818

	THUMB_FUNC_END func_080494F0

	THUMB_FUNC_START func_08049594
func_08049594: @ 0x08049594
	push {r4, lr}
	ldr r0, .L080495EC  @ gMapUnit
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L080495F0  @ gMapFog
	ldr r0, [r0]
	movs r1, #1
	bl MapFill
	movs r4, #1
.L080495AC:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L080495E0
	ldr r0, [r2]
	cmp r0, #0
	beq .L080495E0
	ldr r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne .L080495E0
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, .L080495EC  @ gMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r0, [r1]
	adds r0, r0, r2
	strb r4, [r0]
.L080495E0:
	adds r4, #1
	cmp r4, #0xc5
	ble .L080495AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080495EC: .4byte gMapUnit
.L080495F0: .4byte gMapFog

	THUMB_FUNC_END func_08049594

	THUMB_FUNC_START func_080495F4
func_080495F4: @ 0x080495F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r2, #0
	ldr r0, .L08049670  @ gUnknown_080D9F28
	mov sl, r0
.L08049606:
	ldr r0, .L08049674  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r2, r0
	add r0, sl
	ldrb r4, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl func_08042194
	lsls r0, r0, #0x18
	ldr r2, [sp]
	adds r1, r2, #1
	mov r9, r1
	cmp r0, #0
	beq .L0804968E
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r2, #2
	ldr r7, .L08049678  @ gUnknown_03001818
.L08049638:
	adds r0, r3, r2
	adds r5, r0, r6
	ldr r0, .L0804967C  @ gUnknown_080D9FB0
	adds r0, r6, r0
	ldrb r0, [r0]
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, [r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #0
	beq .L08049666
	ldr r0, [r1, #0xc]
	ldr r1, .L08049680  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	beq .L08049684
.L08049666:
	adds r1, r5, r7
	movs r0, #0
	strb r0, [r1]
	b .L08049688
	.align 2, 0
.L08049670: .4byte gUnknown_080D9F28
.L08049674: .4byte gUnknown_085A92E0
.L08049678: .4byte gUnknown_03001818
.L0804967C: .4byte gUnknown_080D9FB0
.L08049680: .4byte 0x00010005
.L08049684:
	adds r0, r5, r7
	strb r4, [r0]
.L08049688:
	adds r6, #1
	cmp r6, #4
	ble .L08049638
.L0804968E:
	mov r2, r9
	cmp r2, #3
	ble .L08049606
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080495F4

	THUMB_FUNC_START func_080496A4
func_080496A4: @ 0x080496A4
	push {r4, r5, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, .L08049700  @ gBmSt
	ldr r2, .L08049704  @ 0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldrb r1, [r4, #4]
	movs r0, #0x40
	movs r5, #0
	orrs r0, r1
	strb r0, [r4, #4]
	bl InitTraps
	ldr r4, .L08049708  @ gPlaySt
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r0, #0x3a
	strb r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	movs r0, #0x3a
	bl InitChapterMap
	bl GetGameTime
	str r0, [r4, #4]
	adds r4, #0x48
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08049700: .4byte gBmSt
.L08049704: .4byte 0x01000020
.L08049708: .4byte gPlaySt

	THUMB_FUNC_END func_080496A4

	THUMB_FUNC_START func_0804970C
func_0804970C: @ 0x0804970C
	push {lr}
	bl func_080496A4
	bl func_080494D4
	bl func_080494F0
	ldr r0, .L0804973C  @ gMapFog
	ldr r2, [r0]
	movs r1, #0
	ldr r0, .L08049740  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne .L0804972A
	movs r1, #1
.L0804972A:
	adds r0, r2, #0
	bl MapFill
	bl func_08049594
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
.L0804973C: .4byte gMapFog
.L08049740: .4byte gPlaySt

	THUMB_FUNC_END func_0804970C

	THUMB_FUNC_START func_08049744
func_08049744: @ 0x08049744
	push {r4, lr}
	ldr r0, .L0804977C  @ gUnknown_0203DD90
	movs r1, #0
	movs r2, #3
	adds r0, #0xd
.L0804974E:
	strb r1, [r0]
	subs r0, #1
	subs r2, #1
	cmp r2, #0
	bge .L0804974E
	movs r2, #0
	ldr r4, .L08049780  @ gUnknown_03001818
	ldr r3, .L08049784  @ gUnknown_0203DD9A
.L0804975E:
	adds r0, r2, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq .L08049770
	lsrs r1, r1, #6
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L08049770:
	adds r2, #1
	cmp r2, #0x13
	ble .L0804975E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804977C: .4byte gUnknown_0203DD90
.L08049780: .4byte gUnknown_03001818
.L08049784: .4byte gUnknown_0203DD9A

	THUMB_FUNC_END func_08049744

	THUMB_FUNC_START func_08049788
func_08049788: @ 0x08049788
	push {lr}
	ldr r0, .L08049798  @ gUnknown_085AD9CC
	ldr r1, .L0804979C  @ 0x06013E00
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
.L08049798: .4byte gUnknown_085AD9CC
.L0804979C: .4byte 0x06013E00

	THUMB_FUNC_END func_08049788

	THUMB_FUNC_START func_080497A0
func_080497A0: @ 0x080497A0
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	bl func_080156D4
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
	bl func_08049788
	bl InitSystemTextFont
	ldr r1, .L080497C8  @ gUnknown_0203DD90
	movs r0, #0xff
	strb r0, [r1, #3]
	pop {r0}
	bx r0
	.align 2, 0
.L080497C8: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_080497A0

	THUMB_FUNC_START func_080497CC
func_080497CC: @ 0x080497CC
	push {r4, r5, lr}
	ldr r1, .L08049824  @ gPlaySt
	movs r0, #0x42
	adds r0, r0, r1
	mov ip, r0
	ldrb r0, [r0]
	movs r3, #7
	negs r3, r3
	ands r3, r0
	adds r5, r1, #0
	adds r5, #0x40
	ldrb r2, [r5]
	movs r0, #0x10
	orrs r2, r0
	movs r0, #0x61
	negs r0, r0
	ands r2, r0
	movs r0, #0x40
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r4, r1, #0
	adds r4, #0x41
	ldrb r1, [r4]
	subs r0, #0x81
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #0xa
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x19
	negs r0, r0
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	movs r0, #1
	orrs r2, r0
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08049824: .4byte gPlaySt

	THUMB_FUNC_END func_080497CC

	THUMB_FUNC_START func_08049828
func_08049828: @ 0x08049828
	push {r4, r5, lr}
	movs r0, #0
	bl SetupBackgrounds
	bl func_08043044
	bl func_0804970C
	bl func_08049744
	ldr r4, .L080498D4  @ gUnknown_0203DD90
	movs r5, #0
	strb r5, [r4, #9]
	ldr r0, .L080498D8  @ gUnknown_0203DA24
	strb r5, [r0, #0xb]
	ldr r1, .L080498DC  @ gUnknown_085AA158
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl func_080492E8
	movs r0, #1
	strb r0, [r4, #0xe]
	strb r5, [r4, #2]
	strb r0, [r4, #3]
	movs r1, #0
	movs r0, #3
	adds r4, #0x20
.L08049860:
	str r1, [r4]
	subs r4, #4
	subs r0, #1
	cmp r0, #0
	bge .L08049860
	movs r4, #0
	ldr r0, .L080498E0  @ gUnknown_03001818
	ldrb r0, [r0, #3]
	bl GetUnit
	ldr r2, .L080498E4  @ gUnknown_0300182C
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl SetCursorMapPosition
	ldr r0, .L080498E8  @ gBmSt
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl RefreshUnitSprites
	bl func_08049788
	bl func_0804B38C
	ldr r0, .L080498EC  @ ProcScr_MapTask
	movs r1, #4
	bl SpawnProc
	bl StartBmVSync
	bl func_080497CC
	ldr r2, .L080498F0  @ gPlaySt
	ldrb r1, [r2, #0x14]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080498D4: .4byte gUnknown_0203DD90
.L080498D8: .4byte gUnknown_0203DA24
.L080498DC: .4byte gUnknown_085AA158
.L080498E0: .4byte gUnknown_03001818
.L080498E4: .4byte gUnknown_0300182C
.L080498E8: .4byte gBmSt
.L080498EC: .4byte ProcScr_MapTask
.L080498F0: .4byte gPlaySt

	THUMB_FUNC_END func_08049828

	THUMB_FUNC_START func_080498F4
func_080498F4: @ 0x080498F4
	push {r4, r5, lr}
	ldr r1, .L08049934  @ gUnknown_03001818
	ldr r0, .L08049938  @ gUnknown_0203DD90
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl MU_Create
	ldr r5, .L0804993C  @ gUnknown_03001838
	str r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r2, #1
	lsls r2, r2, #4
	bl MU_SetDisplayPosition
	ldr r0, [r5]
	bl MU_DisableAttractCamera
	ldr r0, [r5]
	movs r1, #3
	bl MU_SetFacing
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08049934: .4byte gUnknown_03001818
.L08049938: .4byte gUnknown_0203DD90
.L0804993C: .4byte gUnknown_03001838

	THUMB_FUNC_END func_080498F4

	THUMB_FUNC_START func_08049940
func_08049940: @ 0x08049940
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08049960  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804995A
	adds r0, r2, #0
	bl Proc_Break
.L0804995A:
	pop {r0}
	bx r0
	.align 2, 0
.L08049960: .4byte gKeySt

	THUMB_FUNC_END func_08049940

	THUMB_FUNC_START func_08049964
func_08049964: @ 0x08049964
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08049978  @ gUnknown_0203DA24
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0804997C
	cmp r0, #2
	beq .L08049990
	b .L080499C0
	.align 2, 0
.L08049978: .4byte gUnknown_0203DA24
.L0804997C:
	ldr r0, .L08049988  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq .L080499A2
	ldr r0, .L0804998C  @ gUnknown_085AA5BC
	b .L080499A4
	.align 2, 0
.L08049988: .4byte gPlaySt
.L0804998C: .4byte gUnknown_085AA5BC
.L08049990:
	ldr r0, .L080499AC  @ gPlaySt
	ldrb r1, [r0, #0xf]
	ldr r0, .L080499B0  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L080499B8
.L080499A2:
	ldr r0, .L080499B4  @ gUnknown_085AA2FC
.L080499A4:
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L080499C0
	.align 2, 0
.L080499AC: .4byte gPlaySt
.L080499B0: .4byte gUnknown_085A92E0
.L080499B4: .4byte gUnknown_085AA2FC
.L080499B8:
	ldr r0, .L080499CC  @ gUnknown_085AA4CC
	adds r1, r4, #0
	bl SpawnProcLocking
.L080499C0:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080499CC: .4byte gUnknown_085AA4CC

	THUMB_FUNC_END func_08049964

	THUMB_FUNC_START func_080499D0
func_080499D0: @ 0x080499D0
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, .L080499E8  @ gUnknown_0203DA24
	ldrb r0, [r2]
	cmp r0, #1
	bne .L080499EC
	ldrb r0, [r2, #0xb]
	cmp r0, #1
	bne .L080499FC
	b .L080499F2
	.align 2, 0
.L080499E8: .4byte gUnknown_0203DA24
.L080499EC:
	ldrb r0, [r2, #0xb]
	cmp r0, #2
	bne .L080499FC
.L080499F2:
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
	b .L08049A56
.L080499FC:
	ldr r0, .L08049A10  @ gUnknown_0203DD90
	ldrb r2, [r0, #1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne .L08049A14
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b .L08049A56
	.align 2, 0
.L08049A10: .4byte gUnknown_0203DD90
.L08049A14:
	ldr r0, .L08049A1C  @ gPlaySt
	strb r2, [r0, #0xf]
	ldr r2, .L08049A20  @ gUnknown_03001818
	b .L08049A26
	.align 2, 0
.L08049A1C: .4byte gPlaySt
.L08049A20: .4byte gUnknown_03001818
.L08049A24:
	adds r1, #1
.L08049A26:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq .L08049A24
	ldr r4, .L08049A5C  @ gUnknown_0203DD90
	strb r1, [r4, #2]
	adds r0, r1, #1
	strb r0, [r4, #3]
	bl LoadObjUiGfx
	movs r0, #0
	adds r4, #0x2c
	movs r1, #3
.L08049A40:
	str r0, [r4, #4]
	strb r0, [r4]
	adds r4, #8
	subs r1, #1
	cmp r1, #0
	bge .L08049A40
	movs r0, #1
	negs r0, r0
	movs r1, #9
	bl DebugInitObj
.L08049A56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08049A5C: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_080499D0

	THUMB_FUNC_START func_08049A60
func_08049A60: @ 0x08049A60
	push {r4, r5, r6, r7, lr}
	movs r5, #4
	ldr r3, .L08049AB8  @ gUnknown_0203DD90
	ldr r0, .L08049ABC  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r2, r3, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r7, [r0]
	ldr r0, .L08049AC0  @ gUnknown_0203DA24
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08049AC8
	movs r4, #0
	adds r5, r3, #0
	adds r5, #0xf
.L08049A8E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08049AAC
	ldr r0, .L08049ABC  @ gUnknown_085A92E0
	ldr r0, [r0]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	beq .L08049AC4
.L08049AAC:
	adds r4, #1
	cmp r4, #3
	ble .L08049A8E
	movs r5, #3
	b .L08049AF8
	.align 2, 0
.L08049AB8: .4byte gUnknown_0203DD90
.L08049ABC: .4byte gUnknown_085A92E0
.L08049AC0: .4byte gUnknown_0203DA24
.L08049AC4:
	adds r0, r4, #0
	b .L08049AFA
.L08049AC8:
	movs r4, #0
	adds r6, r2, #0
.L08049ACC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08049AEE
	ldr r0, .L08049B00  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq .L08049AEE
	ldr r0, [r6]
	cmp r7, r0
	bls .L08049AF0
.L08049AEE:
	subs r5, #1
.L08049AF0:
	adds r6, #4
	adds r4, #1
	cmp r4, #3
	ble .L08049ACC
.L08049AF8:
	adds r0, r5, #0
.L08049AFA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08049B00: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08049A60

	THUMB_FUNC_START func_08049B04
func_08049B04: @ 0x08049B04
	push {lr}
	ldr r0, .L08049B20  @ ProcScr_MapTask
	bl EndEachProc
	bl func_0804B3A0
	bl EndBmVSync
	movs r0, #1
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0
.L08049B20: .4byte ProcScr_MapTask

	THUMB_FUNC_END func_08049B04

	THUMB_FUNC_START func_08049B24
func_08049B24: @ 0x08049B24
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	ldr r1, .L08049B54  @ gUnknown_0203DD90
	ldrb r2, [r1, #2]
	adds r5, r2, #0
	strb r2, [r1, #3]
	movs r0, #0xf0
	ands r0, r3
	adds r7, r1, #0
	cmp r0, #0
	beq .L08049C12
	lsls r4, r2, #2
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq .L08049B5C
	ldr r0, .L08049B58  @ gUnknown_085AA15C
	adds r0, r4, r0
	b .L08049B92
	.align 2, 0
.L08049B54: .4byte gUnknown_0203DD90
.L08049B58: .4byte gUnknown_085AA15C
.L08049B5C:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq .L08049B70
	ldr r1, .L08049B6C  @ gUnknown_085AA15C
	adds r0, r4, #1
	b .L08049B90
	.align 2, 0
.L08049B6C: .4byte gUnknown_085AA15C
.L08049B70:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq .L08049B84
	ldr r1, .L08049B80  @ gUnknown_085AA15C
	adds r0, r4, #2
	b .L08049B90
	.align 2, 0
.L08049B80: .4byte gUnknown_085AA15C
.L08049B84:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq .L08049B94
	ldr r1, .L08049BF0  @ gUnknown_085AA15C
	adds r0, r4, #3
.L08049B90:
	adds r0, r0, r1
.L08049B92:
	ldrb r2, [r0]
.L08049B94:
	subs r5, r2, r5
	ldrb r0, [r7, #3]
	cmp r0, #0
	bne .L08049BA8
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq .L08049BA8
	movs r5, #1
	negs r5, r5
.L08049BA8:
	ldrb r0, [r7, #3]
	cmp r0, #0x13
	bne .L08049BB8
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq .L08049BB8
	movs r5, #1
.L08049BB8:
	ldr r6, .L08049BF4  @ gUnknown_03001818
	mov r0, ip
	lsls r4, r0, #0x18
.L08049BBE:
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08049BDC
	cmp r4, #0
	beq .L08049C10
	lsrs r1, r0, #0x1e
	ldr r0, .L08049BF8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L08049C10
.L08049BDC:
	cmp r5, #0
	bge .L08049BFC
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne .L08049BBE
	movs r2, #0x13
	b .L08049BBE
	.align 2, 0
.L08049BF0: .4byte gUnknown_085AA15C
.L08049BF4: .4byte gUnknown_03001818
.L08049BF8: .4byte gUnknown_085A92E0
.L08049BFC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b .L08049BBE
.L08049C10:
	strb r2, [r7, #2]
.L08049C12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08049B24

	THUMB_FUNC_START func_08049C18
func_08049C18: @ 0x08049C18
	push {r4, r5, r6, r7, lr}
	ldr r6, .L08049C88  @ gUnknown_0203DD90
	ldrb r0, [r6, #2]
	ldrb r1, [r6, #3]
	cmp r0, r1
	beq .L08049C80
	ldr r7, .L08049C8C  @ gUnknown_03001818
	ldrb r0, [r6, #3]
	adds r0, r0, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r6, #2]
	adds r0, r0, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r5, #0
	beq .L08049C4C
	bl MU_EndAll
	adds r0, r5, #0
	bl ShowUnitSprite
.L08049C4C:
	cmp r4, #0
	beq .L08049C80
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L08049C80
	ldrb r0, [r6, #2]
	adds r0, r0, r7
	ldrb r1, [r0]
	lsrs r1, r1, #6
	ldr r0, .L08049C90  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L08049C80
	adds r0, r4, #0
	bl MU_Create
	bl MU_DisableAttractCamera
	adds r0, r4, #0
	bl HideUnitSprite
.L08049C80:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08049C88: .4byte gUnknown_0203DD90
.L08049C8C: .4byte gUnknown_03001818
.L08049C90: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_08049C18

	THUMB_FUNC_START func_08049C94
func_08049C94: @ 0x08049C94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
.L08049C9A:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L08049CC6
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08049CC6
	movs r0, #1
	b .L08049CCE
.L08049CC6:
	adds r5, #1
	cmp r5, #4
	ble .L08049C9A
	movs r0, #0
.L08049CCE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08049C94

	THUMB_FUNC_START func_08049CD4
func_08049CD4: @ 0x08049CD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08049D04  @ gUnknown_0203DD90
	ldrb r2, [r0, #9]
	ldr r0, .L08049D08  @ gUnknown_0203DA24
	adds r0, #0xa0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r2, r0
	blt .L08049CF6
	bl func_08048A94
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
.L08049CF6:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08049D04: .4byte gUnknown_0203DD90
.L08049D08: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_08049CD4

	THUMB_FUNC_START func_08049D0C
func_08049D0C: @ 0x08049D0C
	push {r4, lr}
	adds r4, r0, #0
	bl func_08042238
	cmp r0, #7
	bgt .L08049D1E
	adds r0, r4, #0
	bl Proc_Break
.L08049D1E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08049D0C

	THUMB_FUNC_START func_08049D24
func_08049D24: @ 0x08049D24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, .L08049E0C  @ gUnknown_080D9FB5
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r0, .L08049E10  @ gUnknown_0203DD90
	mov r9, r0
	ldrb r1, [r0, #2]
	mov sl, r1
	bl func_08049C18
	ldr r4, .L08049E14  @ gKeySt
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0
	bl func_08049B24
	ldr r2, .L08049E18  @ gActiveUnitId
	mov r8, r2
	ldr r1, .L08049E1C  @ gUnknown_03001818
	mov r2, r9
	ldrb r0, [r2, #2]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	ldr r7, .L08049E20  @ gActiveUnit
	str r2, [r7]
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08049E42
	mov r0, r8
	ldrb r1, [r0]
	lsrs r1, r1, #6
	ldr r0, .L08049E24  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne .L08049E30
	adds r0, r2, #0
	bl func_08049C94
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne .L08049E30
	ldr r0, .L08049E28  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08049DB2
	movs r0, #0x69
	bl m4aSongNumStart
.L08049DB2:
	bl MU_EndAll
	ldr r0, [r7]
	bl MU_Create
	ldr r4, .L08049E2C  @ gUnknown_03001838
	str r0, [r4]
	bl MU_DisableAttractCamera
	ldr r0, [r4]
	mov r1, sp
	bl MU_StartMoveScript
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r6, #0x2c]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	subs r0, #1
	str r0, [r6, #0x30]
	ldr r0, [r1, #0xc]
	orrs r0, r5
	str r0, [r1, #0xc]
	bl func_080492D8
	mov r1, r9
	ldrb r0, [r1, #2]
	strb r0, [r1, #4]
	movs r0, #0x40
	movs r1, #1
	bl func_08049B24
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl func_08049350
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b .L08049F12
	.align 2, 0
.L08049E0C: .4byte gUnknown_080D9FB5
.L08049E10: .4byte gUnknown_0203DD90
.L08049E14: .4byte gKeySt
.L08049E18: .4byte gActiveUnitId
.L08049E1C: .4byte gUnknown_03001818
.L08049E20: .4byte gActiveUnit
.L08049E24: .4byte gUnknown_085A92E0
.L08049E28: .4byte gPlaySt
.L08049E2C: .4byte gUnknown_03001838
.L08049E30:
	ldr r0, .L08049E70  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08049E42
	movs r0, #0x6c
	bl m4aSongNumStart
.L08049E42:
	ldr r2, .L08049E74  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08049E7C
	ldr r0, .L08049E78  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L08049E7C
	bl MU_EndAll
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b .L08049F12
	.align 2, 0
.L08049E70: .4byte gPlaySt
.L08049E74: .4byte gKeySt
.L08049E78: .4byte gActiveUnit
.L08049E7C:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L08049EAC
	bl func_08048A94
	ldr r0, .L08049EA8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08049F12
	movs r0, #0x68
	bl m4aSongNumStart
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b .L08049F12
	.align 2, 0
.L08049EA8: .4byte gPlaySt
.L08049EAC:
	ldr r0, .L08049F24  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r5, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #4
	bl SetCursorMapPosition
	bl GetGameTime
	subs r0, #1
	ldr r6, .L08049F28  @ gUnknown_03001830
	ldr r1, [r6]
	cmp r0, r1
	bne .L08049EE2
	ldr r0, .L08049F2C  @ gUnknown_0300182C
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
.L08049EE2:
	ldr r0, .L08049F2C  @ gUnknown_0300182C
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r6]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl DisplayCursor
	ldr r0, .L08049F30  @ gUnknown_0203DD90
	ldrb r0, [r0, #2]
	cmp sl, r0
	beq .L08049F12
	ldr r0, .L08049F34  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08049F12
	movs r0, #0x65
	bl m4aSongNumStart
.L08049F12:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08049F24: .4byte gActiveUnit
.L08049F28: .4byte gUnknown_03001830
.L08049F2C: .4byte gUnknown_0300182C
.L08049F30: .4byte gUnknown_0203DD90
.L08049F34: .4byte gPlaySt

	THUMB_FUNC_END func_08049D24

	THUMB_FUNC_START func_08049F38
func_08049F38: @ 0x08049F38
	push {lr}
	bl func_08048A6C
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08049F38

	THUMB_FUNC_START func_08049F44
func_08049F44: @ 0x08049F44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r6, .L0804A020  @ gUnknown_0203DD90
	ldrb r0, [r6, #2]
	str r0, [sp, #4]
	ldr r1, .L0804A024  @ gKeySt
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #1
	bl func_08049B24
	ldr r2, .L0804A028  @ gActiveUnitId
	mov sl, r2
	ldr r0, .L0804A02C  @ gUnknown_03001818
	mov r9, r0
	ldrb r0, [r6, #2]
	add r0, r9
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	ldr r1, .L0804A030  @ gActiveUnit
	str r0, [r1]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	lsls r5, r2, #4
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r4, r1, #4
	adds r0, r2, #0
	bl SetCursorMapPosition
	bl GetGameTime
	subs r0, #1
	ldr r7, .L0804A034  @ gUnknown_03001830
	ldr r1, [r7]
	cmp r0, r1
	bne .L08049FB0
	ldr r0, .L0804A038  @ gUnknown_0300182C
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
.L08049FB0:
	ldr r0, .L0804A038  @ gUnknown_0300182C
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl DisplayCursor
	ldr r2, .L0804A024  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804A040
	ldr r0, .L0804A03C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08049FE6
	movs r0, #0x69
	bl m4aSongNumStart
.L08049FE6:
	ldrb r0, [r6, #2]
	add r0, r9
	ldrb r0, [r0]
	adds r2, r6, #5
	mov r3, r8
	adds r3, #0x34
	mov r1, r8
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl func_080493D0
	ldrb r0, [r6, #5]
	add r0, r9
	ldrb r1, [r0]
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #3
	movs r3, #0
	bl func_08049350
	bl func_08048A94
	mov r0, r8
	movs r1, #7
	bl Proc_Goto
	b .L0804A0F0
	.align 2, 0
.L0804A020: .4byte gUnknown_0203DD90
.L0804A024: .4byte gKeySt
.L0804A028: .4byte gActiveUnitId
.L0804A02C: .4byte gUnknown_03001818
.L0804A030: .4byte gActiveUnit
.L0804A034: .4byte gUnknown_03001830
.L0804A038: .4byte gUnknown_0300182C
.L0804A03C: .4byte gPlaySt
.L0804A040:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804A0A8
	ldr r0, .L0804A0A0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804A05A
	movs r0, #0x6b
	bl m4aSongNumStart
.L0804A05A:
	ldr r0, .L0804A0A4  @ gUnknown_03001838
	ldr r0, [r0]
	bl MU_End
	ldrb r0, [r6, #4]
	add r0, r9
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
	bl func_080492D8
	ldrb r0, [r6, #4]
	strb r0, [r6, #2]
	adds r0, #1
	strb r0, [r6, #3]
	mov r2, sl
	ldrb r1, [r2]
	ldrb r0, [r6, #4]
	add r0, r9
	ldrb r2, [r0]
	movs r0, #2
	movs r3, #0
	bl func_08049350
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b .L0804A0F0
	.align 2, 0
.L0804A0A0: .4byte gPlaySt
.L0804A0A4: .4byte gUnknown_03001838
.L0804A0A8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804A0D4
	ldr r1, .L0804A0D0  @ gActiveUnit
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L0804A0D4
	bl MU_EndAll
	mov r0, r8
	movs r1, #6
	bl Proc_Goto
	b .L0804A0F0
	.align 2, 0
.L0804A0D0: .4byte gActiveUnit
.L0804A0D4:
	ldr r0, .L0804A100  @ gUnknown_0203DD90
	ldr r2, [sp, #4]
	ldrb r0, [r0, #2]
	cmp r2, r0
	beq .L0804A0F0
	ldr r0, .L0804A104  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804A0F0
	movs r0, #0x65
	bl m4aSongNumStart
.L0804A0F0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A100: .4byte gUnknown_0203DD90
.L0804A104: .4byte gPlaySt

	THUMB_FUNC_END func_08049F44

	THUMB_FUNC_START func_0804A108
func_0804A108: @ 0x0804A108
	push {r4, lr}
	adds r4, r0, #0
	bl ResetTextFont
	ldr r2, .L0804A148  @ gUnknown_0203DD90
	movs r0, #0xff
	strb r0, [r2, #6]
	ldr r1, .L0804A14C  @ gUnknown_03001818
	ldrb r0, [r2, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, .L0804A150  @ gActiveUnit
	str r0, [r1]
	bl func_08049298
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, .L0804A154  @ gUnknown_085AADA0
	bl StartMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A148: .4byte gUnknown_0203DD90
.L0804A14C: .4byte gUnknown_03001818
.L0804A150: .4byte gActiveUnit
.L0804A154: .4byte gUnknown_085AADA0

	THUMB_FUNC_END func_0804A108

	THUMB_FUNC_START func_0804A158
func_0804A158: @ 0x0804A158
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne .L0804A1C4
	ldr r0, .L0804A194  @ gUnknown_0203DD90
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne .L0804A1A0
	ldr r0, .L0804A198  @ gActiveUnit
	ldr r0, [r0]
	bl func_080492B8
	adds r0, r5, #0
	bl Proc_End
	ldr r2, .L0804A19C  @ gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	b .L0804A1B6
	.align 2, 0
.L0804A194: .4byte gUnknown_0203DD90
.L0804A198: .4byte gActiveUnit
.L0804A19C: .4byte gDispIo
.L0804A1A0:
	adds r0, r5, #0
	bl Proc_Break
	ldr r2, .L0804A1CC  @ gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
.L0804A1B6:
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
.L0804A1C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A1CC: .4byte gDispIo

	THUMB_FUNC_END func_0804A158

	THUMB_FUNC_START func_0804A1D0
func_0804A1D0: @ 0x0804A1D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, .L0804A208  @ gActiveUnit
	ldr r1, [r0]
	ldr r6, .L0804A20C  @ gUnknown_0203DD90
	ldrb r0, [r6, #7]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	bne .L0804A210
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne .L0804A210
	strb r0, [r6, #6]
	b .L0804A292
	.align 2, 0
.L0804A208: .4byte gActiveUnit
.L0804A20C: .4byte gUnknown_0203DD90
.L0804A210:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #2
	bne .L0804A230
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r1, r0, #0
	cmp r1, #2
	bne .L0804A230
	ldr r0, .L0804A22C  @ gUnknown_0203DD90
	strb r1, [r0, #6]
	b .L0804A292
	.align 2, 0
.L0804A22C: .4byte gUnknown_0203DD90
.L0804A230:
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	cmp r4, #2
	bne .L0804A250
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #3
	bne .L0804A250
	ldr r0, .L0804A24C  @ gUnknown_0203DD90
	strb r4, [r0, #6]
	b .L0804A292
	.align 2, 0
.L0804A24C: .4byte gUnknown_0203DD90
.L0804A250:
	ldr r1, .L0804A270  @ gUnknown_03001818
	ldr r4, .L0804A274  @ gUnknown_0203DD90
	ldrb r0, [r4, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne .L0804A278
	movs r0, #1
	strb r0, [r4, #6]
	b .L0804A292
	.align 2, 0
.L0804A270: .4byte gUnknown_03001818
.L0804A274: .4byte gUnknown_0203DD90
.L0804A278:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble .L0804A288
	movs r0, #2
	strb r0, [r4, #6]
	b .L0804A292
.L0804A288:
	movs r0, #1
	strb r0, [r4, #6]
	movs r0, #4
	bl ApplyIconPalettes
.L0804A292:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804A1D0

	THUMB_FUNC_START func_0804A298
func_0804A298: @ 0x0804A298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	mov sl, r0
	movs r1, #1
	str r1, [sp, #4]
	ldr r4, .L0804A320  @ gUnknown_03001818
	ldr r2, .L0804A324  @ gUnknown_0203DD90
	mov r8, r2
	ldrb r0, [r2, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r9, r0
	mov r1, r8
	ldrb r0, [r1, #5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r4, [r0, r2]
	bl GetGameLogicLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne .L0804A396
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	adds r0, #1
	ldr r1, .L0804A328  @ gMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x17
	beq .L0804A304
	movs r0, #1
	negs r0, r0
	str r0, [sp, #4]
.L0804A304:
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne .L0804A330
	ldr r0, .L0804A32C  @ gActiveUnit
	ldr r0, [r0]
	bl func_080492B8
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	b .L0804A396
	.align 2, 0
.L0804A320: .4byte gUnknown_03001818
.L0804A324: .4byte gUnknown_0203DD90
.L0804A328: .4byte gMapTerrain
.L0804A32C: .4byte gActiveUnit
.L0804A330:
	ldr r7, .L0804A384  @ gActiveUnit
	ldr r0, [r7]
	mov r2, r8
	ldrb r1, [r2, #7]
	bl UnitEquipItemSlot
	ldr r4, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r4, r0
	cmp r4, #0
	bne .L0804A388
	adds r0, r6, #0
	bl StartBattleForecast
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #2
	bne .L0804A35A
	movs r2, #1
	mov sl, r2
.L0804A35A:
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	add r2, sl
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	ldr r0, [sp, #4]
	adds r3, r3, r0
	str r4, [sp]
	mov r0, r9
	adds r1, r5, #0
	bl BattleGenerateSimulation
	bl func_0803738C
	ldr r0, [r7]
	bl func_080492B8
	adds r0, r6, #0
	bl Proc_Break
	b .L0804A396
	.align 2, 0
.L0804A384: .4byte gActiveUnit
.L0804A388:
	ldr r0, [r7]
	bl func_080492B8
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
.L0804A396:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804A298

	THUMB_FUNC_START func_0804A3A8
func_0804A3A8: @ 0x0804A3A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, .L0804A3F4  @ gDispIo
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
	ldr r0, .L0804A3F8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804A400
	ldr r0, .L0804A3FC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804A3E6
	movs r0, #0x6a
	bl m4aSongNumStart
.L0804A3E6:
	bl func_080373B4
	adds r0, r4, #0
	bl Proc_Break
	b .L0804A426
	.align 2, 0
.L0804A3F4: .4byte gDispIo
.L0804A3F8: .4byte gKeySt
.L0804A3FC: .4byte gPlaySt
.L0804A400:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804A426
	ldr r0, .L0804A42C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804A41A
	movs r0, #0x6b
	bl m4aSongNumStart
.L0804A41A:
	bl func_080373B4
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
.L0804A426:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A42C: .4byte gPlaySt

	THUMB_FUNC_END func_0804A3A8

	THUMB_FUNC_START func_0804A430
func_0804A430: @ 0x0804A430
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804A448  @ gUnknown_085AA1AC
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A448: .4byte gUnknown_085AA1AC

	THUMB_FUNC_END func_0804A430

	THUMB_FUNC_START func_0804A44C
func_0804A44C: @ 0x0804A44C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, .L0804A480  @ gUnknown_03001818
	ldr r6, .L0804A484  @ gUnknown_0203DD90
	ldrb r0, [r6, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl ClearBg0Bg1
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne .L0804A4D8
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L0804A48C
	ldr r0, .L0804A488  @ gUnknown_03001838
	ldr r0, [r0, #4]
	bl MU_End
	b .L0804A494
	.align 2, 0
.L0804A480: .4byte gUnknown_03001818
.L0804A484: .4byte gUnknown_0203DD90
.L0804A488: .4byte gUnknown_03001838
.L0804A48C:
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
.L0804A494:
	ldr r0, [r4, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshUnitSprites
	ldr r1, .L0804A4D0  @ gUnknown_0203DD90
	ldrb r0, [r1, #5]
	strb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r2, .L0804A4D4  @ gUnknown_03001818
	ldrb r0, [r1, #5]
	adds r0, r0, r2
	ldrb r2, [r0]
	movs r0, #4
	movs r1, #0
	movs r3, #0
	bl func_08049350
	adds r0, r5, #0
	bl func_08049F38
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b .L0804A50E
	.align 2, 0
.L0804A4D0: .4byte gUnknown_0203DD90
.L0804A4D4: .4byte gUnknown_03001818
.L0804A4D8:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804A502
	adds r0, r4, #0
	bl MU_Create
	ldr r1, .L0804A514  @ gUnknown_03001838
	str r0, [r1, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x34]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x38]
	ldr r0, [r4, #0xc]
	ldr r1, .L0804A518  @ 0xFFFFFDFF
	ands r0, r1
	str r0, [r4, #0xc]
.L0804A502:
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	movs r0, #5
	movs r1, #0
	bl func_08049350
.L0804A50E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A514: .4byte gUnknown_03001838
.L0804A518: .4byte 0xFFFFFDFF

	THUMB_FUNC_END func_0804A44C

	THUMB_FUNC_START func_0804A51C
func_0804A51C: @ 0x0804A51C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, .L0804A598  @ gUnknown_03001818
	mov r8, r0
	ldr r4, .L0804A59C  @ gUnknown_0203DD90
	ldrb r0, [r4, #4]
	add r0, r8
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	add r0, r8
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r5, #0x2c]
	movs r1, #0
	mov r9, r1
	strb r0, [r6, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r6, #0x11]
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
	ldr r0, .L0804A5A0  @ gUnknown_03001838
	mov r8, r0
	ldr r1, [r0]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r2, #6
	movs r3, #5
	bl func_0804C208
	mov r0, r8
	ldr r1, [r0, #4]
	mov r0, r9
	str r0, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r4, #0
	movs r2, #8
	movs r3, #5
	bl func_0804C208
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A598: .4byte gUnknown_03001818
.L0804A59C: .4byte gUnknown_0203DD90
.L0804A5A0: .4byte gUnknown_03001838

	THUMB_FUNC_END func_0804A51C

	THUMB_FUNC_START func_0804A5A4
func_0804A5A4: @ 0x0804A5A4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, .L0804A600  @ gUnknown_03001818
	ldr r4, .L0804A604  @ gUnknown_0203DD90
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r1, .L0804A608  @ gUnknown_080D9FB7
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r6, .L0804A60C  @ gUnknown_03001838
	ldr r0, [r6, #4]
	bl MU_End
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
	ldr r0, .L0804A610  @ gUnknown_03001834
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne .L0804A5F2
	ldr r0, [r6]
	mov r1, sp
	bl MU_StartMoveScript
	movs r0, #7
	strb r0, [r7, #0x10]
.L0804A5F2:
	bl func_080492D8
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A600: .4byte gUnknown_03001818
.L0804A604: .4byte gUnknown_0203DD90
.L0804A608: .4byte gUnknown_080D9FB7
.L0804A60C: .4byte gUnknown_03001838
.L0804A610: .4byte gUnknown_03001834

	THUMB_FUNC_END func_0804A5A4

	THUMB_FUNC_START func_0804A614
func_0804A614: @ 0x0804A614
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	bl MU_IsAnyActive
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0804A682
	ldr r5, .L0804A68C  @ gUnknown_03001818
	ldr r4, .L0804A690  @ gUnknown_0203DD90
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	adds r0, r6, #0
	bl HideUnitSprite
	ldr r1, .L0804A694  @ gAction
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1, #0xd]
	ldr r0, .L0804A698  @ gUnknown_03001834
	ldrb r1, [r0, #3]
	adds r0, r6, #0
	bl UnitEquipItemSlot
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateReal
	ldr r2, .L0804A69C  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r0, .L0804A6A0  @ gUnknown_085AA75C
	adds r1, r7, #0
	bl SpawnProcLocking
	adds r0, r7, #0
	bl Proc_Break
.L0804A682:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A68C: .4byte gUnknown_03001818
.L0804A690: .4byte gUnknown_0203DD90
.L0804A694: .4byte gAction
.L0804A698: .4byte gUnknown_03001834
.L0804A69C: .4byte gBmSt
.L0804A6A0: .4byte gUnknown_085AA75C

	THUMB_FUNC_END func_0804A614

	THUMB_FUNC_START func_0804A6A4
func_0804A6A4: @ 0x0804A6A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r1, .L0804A790  @ gUnknown_03001818
	ldr r0, .L0804A794  @ gUnknown_0203DD90
	mov r8, r0
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r4, [r0]
	mov r2, r8
	ldrb r0, [r2, #5]
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	bl GetUnit
	adds r7, r0, #0
	bl func_08049788
	lsrs r0, r4, #6
	lsls r0, r0, #3
	mov r2, r8
	adds r2, #0x30
	adds r3, r0, r2
	ldr r1, .L0804A798  @ gBattleUnitA
	mov r9, r1
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r3]
	add r0, r8
	adds r0, #0x2c
	movs r3, #0
	strb r4, [r0]
	strb r3, [r6, #9]
	lsrs r0, r5, #6
	lsls r0, r0, #3
	adds r2, r0, r2
	ldr r4, .L0804A79C  @ gBattleUnitB
	adds r1, r4, #0
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r2]
	add r0, r8
	adds r0, #0x2c
	strb r5, [r0]
	strb r3, [r7, #9]
	adds r0, r6, #0
	bl func_0804D40C
	adds r0, r7, #0
	bl func_0804D40C
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r7, #0
	movs r1, #0
	bl SetUnitStatus
	bl MU_EndAll
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	beq .L0804A750
	adds r0, r6, #0
	bl ShowUnitSprite
	ldr r0, [r6, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r6, #0xc]
.L0804A750:
	bl func_080492D8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	bl GetUnitCurrentHp
	mov r1, r9
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne .L0804A7A0
	adds r0, r7, #0
	bl GetUnitCurrentHp
	adds r1, r4, #0
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne .L0804A7A0
	mov r2, r8
	ldrb r0, [r2, #9]
	adds r0, #1
	strb r0, [r2, #9]
	b .L0804A7A6
	.align 2, 0
.L0804A790: .4byte gUnknown_03001818
.L0804A794: .4byte gUnknown_0203DD90
.L0804A798: .4byte gBattleUnitA
.L0804A79C: .4byte gBattleUnitB
.L0804A7A0:
	ldr r1, .L0804A7BC  @ gUnknown_0203DD90
	movs r0, #0
	strb r0, [r1, #9]
.L0804A7A6:
	mov r0, sl
	bl Proc_Break
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A7BC: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804A6A4

	THUMB_FUNC_START func_0804A7C0
func_0804A7C0: @ 0x0804A7C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r1, .L0804A830  @ gUnknown_03001818
	ldr r0, .L0804A834  @ gUnknown_0203DD90
	mov sl, r0
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	mov r2, sl
	ldrb r0, [r2, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r9, r0
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	mov r0, r9
	bl GetUnit
	mov r8, r0
	movs r7, #0
	adds r0, r5, #0
	bl func_080493A8
	str r0, [sp, #0x10]
	mov r0, r9
	bl func_080493A8
	str r0, [sp, #0x14]
	ldr r6, .L0804A838  @ gUnknown_03001838
	str r7, [r6, #4]
	str r7, [r6]
	ldr r0, [r4, #0xc]
	ldr r1, .L0804A83C  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L0804A81E
	ldr r0, [r4]
	cmp r0, #0
	bne .L0804A840
.L0804A81E:
	lsrs r0, r5, #6
	mov r1, sl
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	b .L0804A878
	.align 2, 0
.L0804A830: .4byte gUnknown_03001818
.L0804A834: .4byte gUnknown_0203DD90
.L0804A838: .4byte gUnknown_03001838
.L0804A83C: .4byte 0x00010004
.L0804A840:
	adds r0, r4, #0
	bl MU_Create
	str r0, [r6]
	bl MU_DisableAttractCamera
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	movs r7, #1
	ldr r1, [r6]
	ldr r2, .L0804A8A0  @ gUnknown_080D9F48
	ldr r3, [sp, #0x10]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r5, #0
	ldrsh r2, [r0, r5]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r4, #0
	bl func_0804C208
.L0804A878:
	mov r1, r8
	ldr r0, [r1, #0xc]
	ldr r1, .L0804A8A4  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L0804A88C
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	bne .L0804A8AC
.L0804A88C:
	ldr r0, .L0804A8A8  @ gUnknown_0203DD90
	mov r3, r9
	lsrs r1, r3, #6
	adds r0, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b .L0804A8F0
	.align 2, 0
.L0804A8A0: .4byte gUnknown_080D9F48
.L0804A8A4: .4byte 0x00010004
.L0804A8A8: .4byte gUnknown_0203DD90
.L0804A8AC:
	mov r0, r8
	bl MU_Create
	ldr r4, .L0804A90C  @ gUnknown_03001838
	str r0, [r4, #4]
	bl MU_DisableAttractCamera
	mov r5, r8
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r7, #0
	movs r7, #0
	cmp r0, #0
	bne .L0804A8CE
	movs r7, #1
.L0804A8CE:
	ldr r1, [r4, #4]
	ldr r2, .L0804A910  @ gUnknown_080D9F48
	ldr r3, [sp, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r0, r8
	bl func_0804C208
.L0804A8F0:
	bl func_080492D8
	ldr r0, [sp, #0xc]
	bl Proc_Break
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A90C: .4byte gUnknown_03001838
.L0804A910: .4byte gUnknown_080D9F48

	THUMB_FUNC_END func_0804A7C0

	THUMB_FUNC_START func_0804A914
func_0804A914: @ 0x0804A914
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r3, #0
.L0804A91E:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp]
	bl func_08042194
	lsls r0, r0, #0x18
	ldr r3, [sp]
	adds r1, r3, #1
	mov r8, r1
	cmp r0, #0
	beq .L0804A984
	movs r6, #0
	movs r7, #0
	ldr r0, .L0804A998  @ gUnknown_03001818
	adds r4, r3, r0
	movs r5, #4
.L0804A93E:
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0804A96C
	adds r7, #1
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, .L0804A99C  @ 0x00010004
	ands r0, r1
	ldr r3, [sp]
	cmp r0, #0
	bne .L0804A96C
	adds r0, r2, #0
	bl func_08049C94
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #1
	bne .L0804A96C
	adds r6, #1
.L0804A96C:
	adds r4, #5
	subs r5, #1
	cmp r5, #0
	bge .L0804A93E
	cmp r6, #0
	bne .L0804A984
	cmp r7, #0
	beq .L0804A984
	ldr r0, .L0804A9A0  @ gUnknown_0203DD90
	adds r0, #0xa
	adds r0, r3, r0
	strb r6, [r0]
.L0804A984:
	mov r3, r8
	cmp r3, #3
	ble .L0804A91E
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804A998: .4byte gUnknown_03001818
.L0804A99C: .4byte 0x00010004
.L0804A9A0: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804A914

	THUMB_FUNC_START func_0804A9A4
func_0804A9A4: @ 0x0804A9A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r1, .L0804AA48  @ gUnknown_03001818
	ldr r5, .L0804AA4C  @ gUnknown_0203DD90
	ldrb r0, [r5, #4]
	adds r0, r0, r1
	ldrb r6, [r0]
	ldrb r0, [r5, #5]
	adds r0, r0, r1
	ldrb r7, [r0]
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r1, [r4, #0xc]
	ldr r3, .L0804AA50  @ 0x00010004
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne .L0804A9E0
	movs r0, #2
	negs r0, r0
	ands r1, r0
	str r1, [r4, #0xc]
.L0804A9E0:
	ldr r1, [r2, #0xc]
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne .L0804A9F2
	movs r0, #2
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0xc]
.L0804A9F2:
	lsrs r0, r6, #6
	adds r1, r0, #0
	adds r2, r5, #0
	adds r2, #0xa
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq .L0804AA0E
	lsrs r1, r7, #6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0804AA6A
.L0804AA0E:
	adds r4, r1, #0
	ldr r2, .L0804AA4C  @ gUnknown_0203DD90
	ldr r3, .L0804AA54  @ gUnknown_0203DA24
	adds r3, #0xa0
	ldrb r0, [r3]
	ldrb r1, [r2, #0xe]
	subs r0, r0, r1
	adds r1, r2, #0
	adds r1, #0xf
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r3]
	cmp r0, r3
	bne .L0804AA6A
	adds r1, r5, #0
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0804AA58
	adds r4, r1, #0
	b .L0804AA5A
	.align 2, 0
.L0804AA48: .4byte gUnknown_03001818
.L0804AA4C: .4byte gUnknown_0203DD90
.L0804AA50: .4byte 0x00010004
.L0804AA54: .4byte gUnknown_0203DA24
.L0804AA58:
	lsrs r4, r7, #6
.L0804AA5A:
	strb r4, [r2, #0xf]
	movs r0, #0xff
	bl func_080492E8
	mov r0, r8
	bl Proc_Break
	b .L0804AA78
.L0804AA6A:
	ldr r0, .L0804AA84  @ gPlaySt
	ldrb r0, [r0, #0xf]
	bl func_080492E8
	mov r0, r8
	bl Proc_Break
.L0804AA78:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804AA84: .4byte gPlaySt

	THUMB_FUNC_END func_0804A9A4

	THUMB_FUNC_START func_0804AA88
func_0804AA88: @ 0x0804AA88
	push {lr}
	bl MU_EndAll
	bl MU_EndAll
	bl func_08049594
	bl func_080495F4
	bl RefreshUnitSprites
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804AA88

	THUMB_FUNC_START func_0804AAA4
func_0804AAA4: @ 0x0804AAA4
	push {lr}
	ldr r0, .L0804AAD0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804AACC
	ldr r0, .L0804AAD4  @ gUnknown_03004F0C
	movs r2, #0
	movs r1, #0x84
	strb r1, [r0]
	ldr r1, .L0804AAD8  @ gUnknown_085A92E0
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl func_080422B8
.L0804AACC:
	pop {r0}
	bx r0
	.align 2, 0
.L0804AAD0: .4byte gKeySt
.L0804AAD4: .4byte gUnknown_03004F0C
.L0804AAD8: .4byte gUnknown_085A92E0

	THUMB_FUNC_END func_0804AAA4

	THUMB_FUNC_START func_0804AADC
func_0804AADC: @ 0x0804AADC
	push {lr}
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0804AAF0
	cmp r0, #1
	blt .L0804AAF4
	cmp r0, #7
	bgt .L0804AAF4
	cmp r0, #6
	blt .L0804AAF4
.L0804AAF0:
	movs r0, #1
	b .L0804AAF6
.L0804AAF4:
	movs r0, #0
.L0804AAF6:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804AADC

	THUMB_FUNC_START func_0804AAFC
func_0804AAFC: @ 0x0804AAFC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, .L0804AB24  @ gUnknown_03001834
	ldr r2, .L0804AB28  @ func_0804AADC
	adds r0, r4, #0
	add r1, sp, #4
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L0804ABA4
	ldrb r0, [r4]
	cmp r0, #6
	beq .L0804AB54
	cmp r0, #6
	bgt .L0804AB2C
	cmp r0, #1
	beq .L0804AB32
	b .L0804ABA4
	.align 2, 0
.L0804AB24: .4byte gUnknown_03001834
.L0804AB28: .4byte func_0804AADC
.L0804AB2C:
	cmp r0, #7
	beq .L0804AB8C
	b .L0804ABA4
.L0804AB32:
	ldrb r0, [r4, #1]
	ldr r2, .L0804AB50  @ gUnknown_0203DD94
	adds r3, r5, #0
	adds r3, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	str r1, [sp]
	movs r1, #0
	bl func_080493D0
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L0804ABA4
	.align 2, 0
.L0804AB50: .4byte gUnknown_0203DD94
.L0804AB54:
	bl func_08048A94
	add r0, sp, #4
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldr r1, .L0804AB80  @ gUnknown_0203DAC5
	adds r0, r0, r1
	ldr r1, .L0804AB84  @ gStr_3001850
	bl func_08042DC8
	ldr r0, .L0804AB88  @ gUnknown_085AA1FC
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl Popup_Create
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b .L0804ABA4
	.align 2, 0
.L0804AB80: .4byte gUnknown_0203DAC5
.L0804AB84: .4byte gStr_3001850
.L0804AB88: .4byte gUnknown_085AA1FC
.L0804AB8C:
	bl func_08048A94
	ldr r0, .L0804ABB0  @ gUnknown_085AA21C
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl Popup_Create
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
.L0804ABA4:
	bl func_0804AAA4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804ABB0: .4byte gUnknown_085AA21C

	THUMB_FUNC_END func_0804AAFC

	THUMB_FUNC_START func_0804ABB4
func_0804ABB4: @ 0x0804ABB4
	push {lr}
	ldrb r0, [r0]
	cmp r0, #3
	bgt .L0804ABC4
	cmp r0, #2
	blt .L0804ABC4
	movs r0, #1
	b .L0804ABC6
.L0804ABC4:
	movs r0, #0
.L0804ABC6:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804ABB4

	THUMB_FUNC_START func_0804ABCC
func_0804ABCC: @ 0x0804ABCC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, .L0804ABF0  @ gUnknown_03001834
	ldr r2, .L0804ABF4  @ func_0804ABB4
	adds r0, r4, #0
	add r1, sp, #4
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L0804AC58
	ldrb r0, [r4]
	cmp r0, #2
	beq .L0804ABF8
	cmp r0, #3
	beq .L0804AC3C
	b .L0804AC58
	.align 2, 0
.L0804ABF0: .4byte gUnknown_03001834
.L0804ABF4: .4byte func_0804ABB4
.L0804ABF8:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L0804AC1C
	ldr r0, .L0804AC18  @ gUnknown_03001838
	ldr r0, [r0]
	bl MU_End
	b .L0804AC24
	.align 2, 0
.L0804AC18: .4byte gUnknown_03001838
.L0804AC1C:
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
.L0804AC24:
	ldr r0, [r4, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshUnitSprites
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b .L0804AC58
.L0804AC3C:
	ldrb r0, [r4, #1]
	ldr r2, .L0804AC64  @ gUnknown_0203DD95
	adds r3, r5, #0
	adds r3, #0x34
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl func_080493D0
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
.L0804AC58:
	bl func_0804AAA4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804AC64: .4byte gUnknown_0203DD95

	THUMB_FUNC_END func_0804ABCC

	THUMB_FUNC_START func_0804AC68
func_0804AC68: @ 0x0804AC68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl MU_Create
	ldr r1, .L0804ACA4  @ gUnknown_03001838
	lsls r4, r4, #2
	adds r4, r4, r1
	str r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	mov r1, r8
	str r0, [r1]
	ldr r0, [r5, #0xc]
	ldr r1, .L0804ACA8  @ 0xFFFFFDFF
	ands r0, r1
	str r0, [r5, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804ACA4: .4byte gUnknown_03001838
.L0804ACA8: .4byte 0xFFFFFDFF

	THUMB_FUNC_END func_0804AC68

	THUMB_FUNC_START func_0804ACAC
func_0804ACAC: @ 0x0804ACAC
	push {lr}
	ldrb r0, [r0]
	cmp r0, #5
	bgt .L0804ACBC
	cmp r0, #4
	blt .L0804ACBC
	movs r0, #1
	b .L0804ACBE
.L0804ACBC:
	movs r0, #0
.L0804ACBE:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804ACAC

	THUMB_FUNC_START func_0804ACC4
func_0804ACC4: @ 0x0804ACC4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, .L0804ACE8  @ gUnknown_03001834
	ldr r2, .L0804ACEC  @ func_0804ACAC
	adds r0, r4, #0
	mov r1, sp
	bl func_0804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq .L0804AD8A
	ldrb r0, [r4]
	cmp r0, #4
	beq .L0804ACF0
	cmp r0, #5
	beq .L0804AD34
	b .L0804AD8A
	.align 2, 0
.L0804ACE8: .4byte gUnknown_03001834
.L0804ACEC: .4byte func_0804ACAC
.L0804ACF0:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne .L0804AD14
	ldr r0, .L0804AD10  @ gUnknown_03001838
	ldr r0, [r0, #4]
	bl MU_End
	b .L0804AD1C
	.align 2, 0
.L0804AD10: .4byte gUnknown_03001838
.L0804AD14:
	ldr r0, [r7, #0x34]
	strb r0, [r6, #0x10]
	ldr r0, [r7, #0x38]
	strb r0, [r6, #0x11]
.L0804AD1C:
	ldr r0, [r6, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r6, #0xc]
	bl RefreshUnitSprites
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b .L0804AD8A
.L0804AD34:
	ldr r5, .L0804AD98  @ gUnknown_03001818
	ldr r4, .L0804AD9C  @ gUnknown_0203DD90
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq .L0804AD6C
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r7, #0
	adds r3, #0x30
	adds r0, r6, #0
	movs r1, #0
	bl func_0804AC68
.L0804AD6C:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq .L0804AD84
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r4, #0
	movs r1, #1
	bl func_0804AC68
.L0804AD84:
	adds r0, r7, #0
	bl Proc_Break
.L0804AD8A:
	bl func_0804AAA4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804AD98: .4byte gUnknown_03001818
.L0804AD9C: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804ACC4

	THUMB_FUNC_START func_0804ADA0
func_0804ADA0: @ 0x0804ADA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq .L0804ADEC
.L0804ADB6:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804ADD8
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r8
	bls .L0804ADD8
	adds r7, r4, #0
	adds r0, r7, #0
	bl GetItemMight
	mov r8, r0
.L0804ADD8:
	adds r5, #1
	cmp r5, #4
	bgt .L0804ADEC
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne .L0804ADB6
.L0804ADEC:
	cmp r7, #0
	beq .L0804ADFA
	adds r0, r6, #0
	bl GetUnitPower
	add r0, r8
	b .L0804ADFC
.L0804ADFA:
	movs r0, #0
.L0804ADFC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804ADA0

	THUMB_FUNC_START func_0804AE08
func_0804AE08: @ 0x0804AE08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	adds r5, r7, #0
	adds r0, r7, #5
	cmp r7, r0
	bge .L0804AE52
.L0804AE1E:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, .L0804AE74  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L0804AE4A
	ldr r0, [r4]
	cmp r0, #0
	beq .L0804AE4A
	movs r0, #1
	add r8, r0
	adds r0, r4, #0
	bl func_0804ADA0
	adds r6, r6, r0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r6, r6, r0
.L0804AE4A:
	adds r5, #1
	adds r0, r7, #5
	cmp r5, r0
	blt .L0804AE1E
.L0804AE52:
	ldr r0, .L0804AE78  @ gUnknown_0203DD90
	asrs r1, r7, #6
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r6, r0
	adds r0, r6, #0
	mov r1, r8
	bl Div
	adds r6, r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0804AE74: .4byte 0x00010004
.L0804AE78: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804AE08

	THUMB_FUNC_START func_0804AE7C
func_0804AE7C: @ 0x0804AE7C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, .L0804AEB4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L0804AEBC
	bl func_08048A94
	str r4, [r5, #0x58]
	ldr r0, .L0804AEB8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804AEB0
	movs r0, #0x68
	bl m4aSongNumStart
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
.L0804AEB0:
	movs r0, #1
	b .L0804AEBE
	.align 2, 0
.L0804AEB4: .4byte gKeySt
.L0804AEB8: .4byte gPlaySt
.L0804AEBC:
	movs r0, #0
.L0804AEBE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804AE7C

	THUMB_FUNC_START func_0804AEC4
func_0804AEC4: @ 0x0804AEC4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #1
	negs r6, r6
	movs r1, #0
	bl func_0804AE7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0804AF1C
	movs r4, #0
.L0804AEDC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804AF10
	ldr r5, .L0804AF24  @ gUnknown_0203DD90
	adds r0, r5, #0
	adds r0, #0xa
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0804AF10
	ldr r0, .L0804AF28  @ gPlaySt
	ldrb r0, [r0, #0xf]
	cmp r0, r4
	beq .L0804AF10
	lsls r0, r4, #6
	adds r0, #1
	bl func_0804AE08
	cmp r6, r0
	bls .L0804AF10
	adds r6, r0, #0
	strb r4, [r5, #2]
.L0804AF10:
	adds r4, #1
	cmp r4, #3
	ble .L0804AEDC
	adds r0, r7, #0
	bl Proc_Break
.L0804AF1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804AF24: .4byte gUnknown_0203DD90
.L0804AF28: .4byte gPlaySt

	THUMB_FUNC_END func_0804AEC4

	THUMB_FUNC_START ITEMRANGEDONE_sub_804AF2C
ITEMRANGEDONE_sub_804AF2C: @ 0x0804AF2C
	push {r4, lr}
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	cmp r0, #0
	beq .L0804AF50
	bl GetItemMaxRange
	cmp r0, #1
	beq .L0804AF50
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bgt .L0804AF54
.L0804AF50:
	movs r0, #1
	b .L0804AF56
.L0804AF54:
	movs r0, #2
.L0804AF56:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END ITEMRANGEDONE_sub_804AF2C

	THUMB_FUNC_START func_0804AF5C
func_0804AF5C: @ 0x0804AF5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x1c]
	movs r2, #0
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl func_0804AE7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0804AF88
	b .L0804B176
.L0804AF88:
	ldr r0, .L0804B0C8  @ gAiSt
	adds r0, #0x7d
	movs r1, #0xe
	strb r1, [r0]
	ldr r0, .L0804B0CC  @ gPlaySt
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #6
	ldr r1, [sp, #0x10]
	adds r1, #0x2c
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x10]
	adds r2, #0x30
	str r2, [sp, #0x38]
	cmp r4, r0
	blt .L0804AFB0
	b .L0804B158
.L0804AFB0:
	ldr r0, .L0804B0D0  @ gActiveUnitId
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, .L0804B0D4  @ gActiveUnit
	str r2, [r0]
	ldr r1, [r2, #0xc]
	ldr r0, .L0804B0D8  @ 0x00010004
	ands r1, r0
	ldr r0, [sp, #0x14]
	adds r0, #6
	str r0, [sp, #0x30]
	adds r4, #1
	str r4, [sp, #0x28]
	cmp r1, #0
	beq .L0804AFD6
	b .L0804B14E
.L0804AFD6:
	ldr r0, [r2]
	cmp r0, #0
	bne .L0804AFDE
	b .L0804B14E
.L0804AFDE:
	movs r5, #0
.L0804AFE0:
	ldr r0, .L0804B0D4  @ gActiveUnit
	ldr r2, [r0]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r6, r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x2c]
	cmp r4, #0
	bne .L0804AFFA
	b .L0804B146
.L0804AFFA:
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0804B00A
	b .L0804B146
.L0804B00A:
	mov sl, r5
	movs r2, #0
	mov r8, r2
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble .L0804B01C
	b .L0804B146
.L0804B01C:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq .L0804B02C
	b .L0804B146
.L0804B02C:
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bne .L0804B03A
	movs r0, #2
	mov r8, r0
.L0804B03A:
	adds r0, r6, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble .L0804B04C
	movs r0, #1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
.L0804B04C:
	add r0, sp, #4
	strh r5, [r0, #4]
	ldr r0, .L0804B0DC  @ gUnknown_0203DD90
	ldrb r0, [r0, #2]
	lsls r0, r0, #6
	mov r9, r0
	mov r5, r9
	adds r5, #1
	adds r0, #6
	cmp r5, r0
	bge .L0804B146
	add r6, sp, #4
	ldr r7, .L0804B0E0  @ gUnknown_03001834
	mov r0, r8
	movs r2, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
.L0804B072:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, .L0804B0D8  @ 0x00010004
	ands r1, r0
	cmp r1, #0
	bne .L0804B13C
	ldr r0, [r4]
	cmp r0, #0
	beq .L0804B13C
	strb r5, [r6, #2]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq .L0804B0EC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattle
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bhi .L0804B0EC
	str r0, [sp, #0x18]
	ldr r0, .L0804B0D0  @ gActiveUnitId
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r2, r8
	cmp r2, #3
	bne .L0804B0E4
	movs r0, #3
	adds r1, r4, #0
	bl ITEMRANGEDONE_sub_804AF2C
	b .L0804B0E6
	.align 2, 0
.L0804B0C8: .4byte gAiSt
.L0804B0CC: .4byte gPlaySt
.L0804B0D0: .4byte gActiveUnitId
.L0804B0D4: .4byte gActiveUnit
.L0804B0D8: .4byte 0x00010004
.L0804B0DC: .4byte gUnknown_0203DD90
.L0804B0E0: .4byte gUnknown_03001834
.L0804B0E4:
	movs r0, #1
.L0804B0E6:
	strb r0, [r7, #2]
	mov r0, sl
	strb r0, [r7, #3]
.L0804B0EC:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L0804B13C
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattle
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	cmp r2, r0
	bhi .L0804B13C
	str r0, [sp, #0x18]
	ldr r0, .L0804B130  @ gActiveUnitId
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r0, r8
	cmp r0, #3
	bne .L0804B134
	movs r0, #3
	adds r1, r4, #0
	bl ITEMRANGEDONE_sub_804AF2C
	strb r0, [r7, #2]
	b .L0804B138
	.align 2, 0
.L0804B130: .4byte gActiveUnitId
.L0804B134:
	movs r1, #2
	strb r1, [r7, #2]
.L0804B138:
	mov r2, sl
	strb r2, [r7, #3]
.L0804B13C:
	adds r5, #1
	mov r0, r9
	adds r0, #6
	cmp r5, r0
	blt .L0804B072
.L0804B146:
	ldr r5, [sp, #0x2c]
	cmp r5, #4
	bgt .L0804B14E
	b .L0804AFE0
.L0804B14E:
	ldr r4, [sp, #0x28]
	ldr r0, [sp, #0x30]
	cmp r4, r0
	bge .L0804B158
	b .L0804AFB0
.L0804B158:
	ldr r2, .L0804B188  @ gUnknown_0203DD94
	ldr r1, [sp, #0x38]
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	ldr r3, [sp, #0x34]
	bl func_080493D0
	ldr r0, .L0804B18C  @ gUnknown_03001834
	add r2, sp, #0x20
	ldrb r2, [r2]
	strb r2, [r0, #1]
	ldr r0, [sp, #0x10]
	bl Proc_Break
.L0804B176:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B188: .4byte gUnknown_0203DD94
.L0804B18C: .4byte gUnknown_03001834

	THUMB_FUNC_END func_0804AF5C

	THUMB_FUNC_START func_0804B190
func_0804B190: @ 0x0804B190
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804B1BC  @ gUnknown_03001834
	ldrb r0, [r0, #1]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl StartAiTargetCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B1BC: .4byte gUnknown_03001834

	THUMB_FUNC_END func_0804B190

	THUMB_FUNC_START func_0804B1C0
func_0804B1C0: @ 0x0804B1C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L0804B244  @ gUnknown_03001834
	ldrb r0, [r0, #1]
	ldr r4, .L0804B248  @ gUnknown_0203DD95
	movs r1, #0x34
	adds r1, r1, r6
	mov r8, r1
	movs r1, #0x38
	adds r1, r1, r6
	mov r9, r1
	str r1, [sp]
	movs r1, #1
	adds r2, r4, #0
	mov r3, r8
	bl func_080493D0
	ldr r5, .L0804B24C  @ gUnknown_03001818
	subs r4, #5
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r7, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq .L0804B222
	adds r2, r6, #0
	adds r2, #0x2c
	adds r3, r6, #0
	adds r3, #0x30
	adds r0, r7, #0
	movs r1, #0
	bl func_0804AC68
.L0804B222:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq .L0804B236
	adds r0, r4, #0
	movs r1, #1
	mov r2, r8
	mov r3, r9
	bl func_0804AC68
.L0804B236:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B244: .4byte gUnknown_03001834
.L0804B248: .4byte gUnknown_0203DD95
.L0804B24C: .4byte gUnknown_03001818

	THUMB_FUNC_END func_0804B1C0

	THUMB_FUNC_START func_0804B250
func_0804B250: @ 0x0804B250
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl func_0804AE7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0804B272
	bl MU_IsAnyActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0804B272
	adds r0, r4, #0
	bl Proc_Break
.L0804B272:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804B250

	THUMB_FUNC_START func_0804B278
func_0804B278: @ 0x0804B278
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	bl GetGameTime
	ldr r2, .L0804B374  @ gUnknown_085AA22C
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #4
	asrs r0, r0, #1
	str r0, [sp]
	movs r0, #0
	mov r8, r0
.L0804B29C:
	ldr r1, .L0804B378  @ gUnknown_080D9F28
	ldr r0, .L0804B37C  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	adds r0, r0, r1
	ldrb r0, [r0]
	bl func_08042194
	lsls r0, r0, #0x18
	mov r1, r8
	adds r1, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq .L0804B35A
	movs r7, #0
	mov r0, r8
	lsls r0, r0, #2
	str r0, [sp, #8]
	ldr r1, .L0804B380  @ Sprite_16x8
	mov sl, r1
	movs r0, #0xf
	mov r9, r0
.L0804B2D0:
	ldr r0, .L0804B384  @ gUnknown_03001818
	ldr r1, [sp, #8]
	add r1, r8
	adds r1, r1, r7
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq .L0804B354
	ldr r0, [r6]
	cmp r0, #0
	beq .L0804B354
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804B354
	movs r5, #0x10
	ldrsb r5, [r6, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r6, r4]
	lsls r4, r4, #4
	ldr r1, [sp]
	subs r4, r4, r1
	adds r0, r6, #0
	bl GetUnitDisplayedSpritePalette
	adds r3, r0, #0
	mov r0, r9
	ands r3, r0
	lsls r3, r3, #0xc
	movs r1, #0x9f
	lsls r1, r1, #4
	adds r3, r3, r1
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sl
	bl PutOamHiRam
	movs r5, #0x10
	ldrsb r5, [r6, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r6, r4]
	lsls r4, r4, #4
	ldr r0, [sp]
	subs r4, r4, r0
	adds r4, #8
	adds r0, r6, #0
	bl GetUnitDisplayedSpritePalette
	adds r3, r0, #0
	mov r1, r9
	ands r3, r1
	lsls r3, r3, #0xc
	ldr r0, .L0804B388  @ 0x000009F2
	adds r3, r3, r0
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sl
	bl PutOamHiRam
.L0804B354:
	adds r7, #1
	cmp r7, #4
	ble .L0804B2D0
.L0804B35A:
	ldr r1, [sp, #4]
	mov r8, r1
	cmp r1, #3
	ble .L0804B29C
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B374: .4byte gUnknown_085AA22C
.L0804B378: .4byte gUnknown_080D9F28
.L0804B37C: .4byte gUnknown_085A92E0
.L0804B380: .4byte Sprite_16x8
.L0804B384: .4byte gUnknown_03001818
.L0804B388: .4byte 0x000009F2

	THUMB_FUNC_END func_0804B278

	THUMB_FUNC_START func_0804B38C
func_0804B38C: @ 0x0804B38C
	push {lr}
	ldr r0, .L0804B39C  @ gUnknown_085AA24C
	movs r1, #4
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0804B39C: .4byte gUnknown_085AA24C

	THUMB_FUNC_END func_0804B38C

	THUMB_FUNC_START func_0804B3A0
func_0804B3A0: @ 0x0804B3A0
	push {lr}
	ldr r0, .L0804B3AC  @ gUnknown_085AA24C
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0804B3AC: .4byte gUnknown_085AA24C

	THUMB_FUNC_END func_0804B3A0

	THUMB_FUNC_START func_0804B3B0
func_0804B3B0: @ 0x0804B3B0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	bl SetStatScreenConfig
	ldr r0, .L0804B3CC  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B3CC: .4byte gActiveUnit

	THUMB_FUNC_END func_0804B3B0

	THUMB_FUNC_START func_0804B3D0
func_0804B3D0: @ 0x0804B3D0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0804B3E8  @ gUnknown_0203DD90
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne .L0804B3EC
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b .L0804B3FE
	.align 2, 0
.L0804B3E8: .4byte gUnknown_0203DD90
.L0804B3EC:
	bl MU_EndAll
	ldr r0, .L0804B404  @ gPlaySt
	ldrb r1, [r0, #0xf]
	movs r0, #6
	movs r2, #0
	movs r3, #0
	bl func_08049350
.L0804B3FE:
	pop {r0}
	bx r0
	.align 2, 0
.L0804B404: .4byte gPlaySt

	THUMB_FUNC_END func_0804B3D0

	THUMB_FUNC_START func_0804B408
func_0804B408: @ 0x0804B408
	push {lr}
	ldr r2, .L0804B41C  @ gUnknown_0203DD90
	ldrb r1, [r2, #8]
	cmp r1, #0
	bne .L0804B420
	strb r1, [r2, #9]
	movs r1, #0
	bl Proc_Goto
	b .L0804B432
	.align 2, 0
.L0804B41C: .4byte gUnknown_0203DD90
.L0804B420:
	bl MU_EndAll
	ldr r0, .L0804B438  @ gPlaySt
	ldrb r1, [r0, #0xf]
	movs r0, #7
	movs r2, #0
	movs r3, #0
	bl func_08049350
.L0804B432:
	pop {r0}
	bx r0
	.align 2, 0
.L0804B438: .4byte gPlaySt

	THUMB_FUNC_END func_0804B408

	THUMB_FUNC_START func_0804B43C
func_0804B43C: @ 0x0804B43C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804B454  @ gUnknown_0203DD90
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne .L0804B458
	ldr r1, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Goto
	b .L0804B474
	.align 2, 0
.L0804B454: .4byte gUnknown_0203DD90
.L0804B458:
	bl MU_EndAll
	bl MU_EndAll
	ldr r1, .L0804B47C  @ gUnknown_0203DA24
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl func_080492E8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
.L0804B474:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B47C: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_0804B43C

	THUMB_FUNC_START func_0804B480
func_0804B480: @ 0x0804B480
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, .L0804B494  @ gUnknown_0203DA24
	ldrb r0, [r1]
	cmp r0, #1
	bne .L0804B498
	strb r0, [r1, #0xb]
	b .L0804B4EA
	.align 2, 0
.L0804B494: .4byte gUnknown_0203DA24
.L0804B498:
	ldr r2, .L0804B4FC  @ gUnknown_0203DD90
	adds r4, r1, #0
	adds r4, #0xa0
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, .L0804B500  @ gPlaySt
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r0, [r3, #0xf]
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r6, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne .L0804B504
	movs r1, #0
	ldrb r0, [r4]
	cmp r6, r0
	bge .L0804B4E8
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
.L0804B4D8:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0804B4E2
	adds r6, r1, #0
.L0804B4E2:
	adds r1, #1
	cmp r1, r3
	blt .L0804B4D8
.L0804B4E8:
	strb r6, [r2, #0xf]
.L0804B4EA:
	movs r0, #0xff
	bl func_080492E8
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b .L0804B512
	.align 2, 0
.L0804B4FC: .4byte gUnknown_0203DD90
.L0804B500: .4byte gPlaySt
.L0804B504:
	ldrb r0, [r3, #0xf]
	bl func_080492E8
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
.L0804B512:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804B480

	THUMB_FUNC_START func_0804B518
func_0804B518: @ 0x0804B518
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804B538  @ gUnknown_0203DA24
	ldrb r0, [r1]
	cmp r0, #1
	bne .L0804B53C
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl func_080492E8
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b .L0804B54E
	.align 2, 0
.L0804B538: .4byte gUnknown_0203DA24
.L0804B53C:
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl func_080492E8
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
.L0804B54E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804B518

	THUMB_FUNC_START func_0804B554
func_0804B554: @ 0x0804B554
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, .L0804B5C0  @ gUnknown_0203DD90
	ldr r0, .L0804B5C4  @ gUnknown_0203DA24
	adds r4, r0, #0
	adds r4, #0xa0
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, .L0804B5C8  @ gPlaySt
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r0, [r3, #0xf]
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne .L0804B5CC
	movs r1, #0
	ldrb r0, [r4]
	cmp r5, r0
	bge .L0804B5AC
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
.L0804B59C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0804B5A6
	adds r5, r1, #0
.L0804B5A6:
	adds r1, #1
	cmp r1, r3
	blt .L0804B59C
.L0804B5AC:
	strb r5, [r2, #0xf]
	movs r0, #0xff
	bl func_080492E8
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b .L0804B5DA
	.align 2, 0
.L0804B5C0: .4byte gUnknown_0203DD90
.L0804B5C4: .4byte gUnknown_0203DA24
.L0804B5C8: .4byte gPlaySt
.L0804B5CC:
	ldrb r0, [r3, #0xf]
	bl func_080492E8
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
.L0804B5DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804B554

	THUMB_FUNC_START func_0804B5E0
func_0804B5E0: @ 0x0804B5E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, .L0804B600  @ gUnknown_0203DA24
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl func_080492E8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B600: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_0804B5E0

	THUMB_FUNC_START func_0804B604
func_0804B604: @ 0x0804B604
	movs r3, #0
	str r3, [r0, #0x58]
	ldr r2, .L0804B61C  @ gPlaySt
	ldrb r1, [r2, #0xf]
	lsls r1, r1, #6
	str r1, [r0, #0x5c]
	ldr r0, .L0804B620  @ gUnknown_0203DD90
	adds r0, #0xa
	ldrb r2, [r2, #0xf]
	adds r0, r0, r2
	strb r3, [r0]
	bx lr
	.align 2, 0
.L0804B61C: .4byte gPlaySt
.L0804B620: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804B604

	THUMB_FUNC_START func_0804B624
func_0804B624: @ 0x0804B624
	push {r4, r5, r6, lr}
	adds r5, r0, #0
.L0804B628:
	ldr r1, [r5, #0x58]
	cmp r1, #5
	bne .L0804B638
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L0804B69C
.L0804B638:
	ldr r0, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	ldr r1, .L0804B65C  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L0804B654
	ldr r0, [r6]
	cmp r0, #0
	bne .L0804B660
.L0804B654:
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	b .L0804B628
	.align 2, 0
.L0804B65C: .4byte 0x00010004
.L0804B660:
	bl RefreshUnitSprites
	adds r0, r6, #0
	bl HideUnitSprite
	adds r0, r6, #0
	bl MU_Create
	adds r4, r0, #0
	ldr r1, .L0804B6A4  @ gUnitMoveBuffer
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl MU_StartMoveScript
	adds r0, r4, #0
	bl func_0804BF4C
	str r4, [r5, #0x54]
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	ldr r0, [r6, #0xc]
	ldr r1, .L0804B6A8  @ 0xFFFFFDFF
	ands r0, r1
	movs r1, #5
	orrs r0, r1
	str r0, [r6, #0xc]
.L0804B69C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B6A4: .4byte gUnitMoveBuffer
.L0804B6A8: .4byte 0xFFFFFDFF

	THUMB_FUNC_END func_0804B624

	THUMB_FUNC_START func_0804B6AC
func_0804B6AC: @ 0x0804B6AC
	push {lr}
	ldr r0, [r0, #0x54]
	bl MU_End
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804B6AC

	THUMB_FUNC_START func_0804B6B8
func_0804B6B8: @ 0x0804B6B8
	push {lr}
	bl func_08049594
	bl func_080495F4
	bl RefreshUnitSprites
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804B6B8

	THUMB_FUNC_START func_0804B6CC
func_0804B6CC: @ 0x0804B6CC
	push {lr}
	bl GetDialoguePromptResult
	adds r1, r0, #0
	cmp r1, #1
	bne .L0804B6E4
	ldr r0, .L0804B6E0  @ gUnknown_0203DD90
	strb r1, [r0, #8]
	b .L0804B6EA
	.align 2, 0
.L0804B6E0: .4byte gUnknown_0203DD90
.L0804B6E4:
	ldr r1, .L0804B6F0  @ gUnknown_0203DD90
	movs r0, #0
	strb r0, [r1, #8]
.L0804B6EA:
	pop {r0}
	bx r0
	.align 2, 0
.L0804B6F0: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804B6CC

	THUMB_FUNC_START func_0804B6F4
func_0804B6F4: @ 0x0804B6F4
	push {lr}
	ldr r0, .L0804B704  @ gUnknown_085AA2B4
	movs r1, #1
	bl CallEvent
	pop {r0}
	bx r0
	.align 2, 0
.L0804B704: .4byte gUnknown_085AA2B4

	THUMB_FUNC_END func_0804B6F4

	THUMB_FUNC_START func_0804B708
func_0804B708: @ 0x0804B708
	push {lr}
	ldr r0, .L0804B718  @ gUnknown_085AA2D8
	movs r1, #1
	bl CallEvent
	pop {r0}
	bx r0
	.align 2, 0
.L0804B718: .4byte gUnknown_085AA2D8

	THUMB_FUNC_END func_0804B708

	THUMB_FUNC_START func_0804B71C
func_0804B71C: @ 0x0804B71C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, .L0804B760  @ 0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, .L0804B764  @ 0x00000756
	movs r0, #0x40
	movs r1, #0x38
	bl StartHelpBox
	movs r4, #0
	ldr r6, .L0804B768  @ gUnknown_0203DD9A
.L0804B736:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl func_08042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804B74E
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0804B74E
	str r4, [r5, #0x58]
.L0804B74E:
	adds r4, #1
	cmp r4, #3
	ble .L0804B736
	movs r0, #0
	str r0, [r5, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B760: .4byte 0x06015000
.L0804B764: .4byte 0x00000756
.L0804B768: .4byte gUnknown_0203DD9A

	THUMB_FUNC_END func_0804B71C

	THUMB_FUNC_START func_0804B76C
func_0804B76C: @ 0x0804B76C
	push {r4, lr}
	adds r4, r0, #0
.L0804B770:
	ldr r1, [r4, #0x5c]
	cmp r1, #4
	ble .L0804B782
	bl MoveableHelpBox_OnEnd
	adds r0, r4, #0
	bl Proc_Break
	b .L0804B7DA
.L0804B782:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #6
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, .L0804B7A8  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne .L0804B7A0
	ldr r0, [r2]
	cmp r0, #0
	bne .L0804B7AC
.L0804B7A0:
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	b .L0804B770
	.align 2, 0
.L0804B7A8: .4byte 0x00010004
.L0804B7AC:
	ldr r3, .L0804B7E0  @ gUnknown_0203DD90
	ldr r0, [r4, #0x58]
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	movs r1, #0x1e
	str r1, [r0]
	ldr r1, [r4, #0x58]
	lsls r2, r1, #3
	adds r2, r2, r3
	lsls r1, r1, #6
	ldr r0, [r4, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	adds r2, #0x2c
	strb r0, [r2]
	adds r0, r4, #0
	bl func_0804926C
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
.L0804B7DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B7E0: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804B76C

	THUMB_FUNC_START func_0804B7E4
func_0804B7E4: @ 0x0804B7E4
	push {lr}
	adds r1, r0, #0
	ldr r0, .L0804B7FC  @ gUnknown_0203DA24
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0804B7F8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
.L0804B7F8:
	pop {r0}
	bx r0
	.align 2, 0
.L0804B7FC: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_0804B7E4

	THUMB_FUNC_START BeginLinkArenaBattle
BeginLinkArenaBattle: @ 0x0804B800
	push {lr}
	ldr r0, .L0804B82C  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl RenderMap
	bl func_08055BB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804B830
	movs r0, #1
	bl SetBattleAnimLinkArenaFlag
	bl BeginAnimsOnBattleAnimations
	b .L0804B846
	.align 2, 0
.L0804B82C: .4byte gBg2Tm
.L0804B830:
	bl MU_EndAll
	bl RenderMap
	bl BeginBattleMapAnims
	ldr r2, .L0804B84C  @ gBattleStats
	ldrh r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r2]
.L0804B846:
	pop {r0}
	bx r0
	.align 2, 0
.L0804B84C: .4byte gBattleStats

	THUMB_FUNC_END BeginLinkArenaBattle

	THUMB_FUNC_START func_0804B850
func_0804B850: @ 0x0804B850
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, .L0804B8C0  @ gBattleUnitA
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne .L0804B86C
	ldr r0, .L0804B8C4  @ ProcScr_MoveUnit
	bl FindProc
	adds r4, r0, #0
	bl func_0804BF4C
	str r4, [r7, #0x54]
.L0804B86C:
	ldr r5, .L0804B8C8  @ gBattleUnitB
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne .L0804B8B8
	bl RefreshUnitSprites
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	bl HideUnitSprite
	adds r0, r5, #0
	bl MU_Create
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingDirection
	ldr r1, .L0804B8CC  @ gUnitMoveBuffer
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl MU_StartMoveScript
	adds r0, r4, #0
	bl func_0804BF4C
	str r4, [r7, #0x54]
.L0804B8B8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B8C0: .4byte gBattleUnitA
.L0804B8C4: .4byte ProcScr_MoveUnit
.L0804B8C8: .4byte gBattleUnitB
.L0804B8CC: .4byte gUnitMoveBuffer

	THUMB_FUNC_END func_0804B850

	THUMB_FUNC_START func_0804B8D0
func_0804B8D0: @ 0x0804B8D0
	push {r4, r5, lr}
	ldr r0, .L0804B918  @ gBattleUnitA
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, .L0804B91C  @ gBattleUnitB
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0804B900
	ldr r0, [r4, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
.L0804B900:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0804B912
	ldr r0, [r5, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r5, #0xc]
.L0804B912:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804B918: .4byte gBattleUnitA
.L0804B91C: .4byte gBattleUnitB

	THUMB_FUNC_END func_0804B8D0

	THUMB_FUNC_START func_0804B920
func_0804B920: @ 0x0804B920
	ldr r1, .L0804B928  @ gUnknown_0203DDDC
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0804B928: .4byte gUnknown_0203DDDC

	THUMB_FUNC_END func_0804B920

	THUMB_FUNC_START func_0804B92C
func_0804B92C: @ 0x0804B92C
	ldr r1, .L0804B934  @ gUnknown_0203DDDC
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0804B934: .4byte gUnknown_0203DDDC

	THUMB_FUNC_END func_0804B92C

	THUMB_FUNC_START func_0804B938
func_0804B938: @ 0x0804B938
	push {lr}
	ldr r2, .L0804B960  @ gDispIo
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0
	.align 2, 0
.L0804B960: .4byte gDispIo

	THUMB_FUNC_END func_0804B938

	THUMB_FUNC_START func_0804B964
func_0804B964: @ 0x0804B964
	push {lr}
	ldr r0, .L0804B994  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, .L0804B998  @ gUnknown_02001188
	cmp r1, #0xa0
	bls .L0804B97E
	ldr r0, .L0804B99C  @ gUnknown_02001180
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
.L0804B97E:
	ldr r2, .L0804B9A0  @ 0x04000042
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #8
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
.L0804B994: .4byte 0x04000006
.L0804B998: .4byte gUnknown_02001188
.L0804B99C: .4byte gUnknown_02001180
.L0804B9A0: .4byte 0x04000042

	THUMB_FUNC_END func_0804B964

	THUMB_FUNC_START func_0804B9A4
func_0804B9A4: @ 0x0804B9A4
	ldr r2, .L0804B9B4  @ gUnknown_02001180
	ldr r3, [r2]
	ldr r1, .L0804B9B8  @ gUnknown_02001184
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
.L0804B9B4: .4byte gUnknown_02001180
.L0804B9B8: .4byte gUnknown_02001184

	THUMB_FUNC_END func_0804B9A4

	THUMB_FUNC_START func_0804B9BC
func_0804B9BC: @ 0x0804B9BC
	push {lr}
	ldr r2, .L0804B9E0  @ gDispIo
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
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
.L0804B9E0: .4byte gDispIo

	THUMB_FUNC_END func_0804B9BC

	THUMB_FUNC_START func_0804B9E4
func_0804B9E4: @ 0x0804B9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r7, [sp, #0x34]
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	subs r1, #0x78
	subs r2, #0x50
	subs r3, #0x78
	subs r7, #0x50
	ldr r4, [sp, #0x38]
	subs r4, #0x78
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	subs r4, #0x50
	str r4, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	subs r4, #0x78
	str r4, [sp, #0x40]
	ldr r4, [sp, #0x44]
	subs r4, #0x50
	str r4, [sp, #0x44]
	ldr r4, .L0804BB50  @ gSinLut
	mov r9, r4
	lsls r0, r0, #0x10
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r0
	asrs r4, r4, #0x10
	mov ip, r4
	lsls r0, r4, #1
	add r0, r9
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r0, r1, #0
	muls r0, r5, r0
	mov r8, r0
	mov r4, ip
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, r9
	movs r0, #0
	ldrsh r4, [r4, r0]
	adds r0, r2, #0
	muls r0, r4, r0
	add r0, r8
	str r0, [sp, #8]
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	str r1, [sp, #0xc]
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r7, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov r9, r1
	adds r1, r3, #0
	muls r1, r4, r1
	adds r0, r7, #0
	muls r0, r5, r0
	subs r7, r1, r0
	ldr r2, [sp, #0x38]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x3c]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sl, r1
	ldr r0, [sp, #0x38]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	mov r8, r1
	ldr r2, [sp, #0x40]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x44]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x40]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r4, r1, r0
	ldr r1, [sp, #8]
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	str r0, [sp, #0xc]
	mov r1, r9
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov r9, r0
	asrs r0, r7, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #0x50
	mov r2, sl
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sl, r0
	mov r1, r8
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	mov r8, r0
	ldr r2, [sp, #0x10]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #0x10]
	asrs r0, r4, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r4, r0, #0
	adds r4, #0x50
	str r7, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	mov r3, r9
	bl func_080131F0
	mov r0, r8
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, r9
	adds r2, r7, #0
	mov r3, sl
	bl func_080131F0
	str r4, [sp]
	ldr r0, [sp, #4]
	mov r1, sl
	mov r2, r8
	ldr r3, [sp, #0x10]
	bl func_080131F0
	ldr r1, [sp, #0xc]
	str r1, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, [sp, #8]
	bl func_080131F0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BB50: .4byte gSinLut

	THUMB_FUNC_END func_0804B9E4

	THUMB_FUNC_START func_0804BB54
func_0804BB54: @ 0x0804BB54
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, .L0804BB88  @ gUnknown_02001180
	ldr r0, .L0804BB8C  @ gUnknown_02000F00
	str r0, [r1]
	ldr r5, .L0804BB90  @ gUnknown_02001184
	ldr r2, .L0804BB94  @ 0xFFFFFD80
	adds r1, r0, r2
	str r1, [r5]
	ldr r1, .L0804BB98  @ gUnknown_02001188
	str r0, [r1]
	bl func_080131D0
	ldr r0, [r5]
	bl func_080131D0
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	ldr r0, .L0804BB9C  @ func_0804B964
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BB88: .4byte gUnknown_02001180
.L0804BB8C: .4byte gUnknown_02000F00
.L0804BB90: .4byte gUnknown_02001184
.L0804BB94: .4byte 0xFFFFFD80
.L0804BB98: .4byte gUnknown_02001188
.L0804BB9C: .4byte func_0804B964

	THUMB_FUNC_END func_0804BB54

	THUMB_FUNC_START func_0804BBA0
func_0804BBA0: @ 0x0804BBA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne .L0804BBC8
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
	b .L0804BC2E
.L0804BBC8:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0xc0
	bl Interpolate
	adds r6, r0, #0
	movs r2, #0x88
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, .L0804BC38  @ gUnknown_02001184
	ldr r0, [r4]
	bl func_080131D0
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl func_0804B9E4
	bl func_0804B9A4
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
.L0804BC2E:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BC38: .4byte gUnknown_02001184

	THUMB_FUNC_END func_0804BBA0

	THUMB_FUNC_START func_0804BC3C
func_0804BC3C: @ 0x0804BC3C
	ldr r2, .L0804BC80  @ gDispIo
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
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
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
	bx lr
	.align 2, 0
.L0804BC80: .4byte gDispIo

	THUMB_FUNC_END func_0804BC3C

	THUMB_FUNC_START func_0804BC84
func_0804BC84: @ 0x0804BC84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, .L0804BD24  @ gUnknown_085AA7B4
	bl SpawnProcLocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r0, .L0804BD28  @ gDispIo
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r7, ip
	adds r7, #0x35
	ldrb r1, [r7]
	mov r0, r8
	orrs r1, r0
	orrs r1, r6
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	mov r3, ip
	adds r3, #0x36
	ldrb r2, [r3]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	subs r2, #2
	ands r0, r2
	subs r2, #4
	ands r0, r2
	subs r2, #8
	ands r0, r2
	strb r0, [r3]
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BD24: .4byte gUnknown_085AA7B4
.L0804BD28: .4byte gDispIo

	THUMB_FUNC_END func_0804BC84

	THUMB_FUNC_START func_0804BD2C
func_0804BD2C: @ 0x0804BD2C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl func_0804BC84
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804BD2C

	THUMB_FUNC_START func_0804BD3C
func_0804BD3C: @ 0x0804BD3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne .L0804BD64
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
	b .L0804BDCA
.L0804BD64:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0xa0
	bl Interpolate
	adds r6, r0, #0
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r2, #0
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #5
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, .L0804BDD4  @ gUnknown_02001184
	ldr r0, [r4]
	bl func_080131D0
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl func_0804B9E4
	bl func_0804B9A4
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
.L0804BDCA:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BDD4: .4byte gUnknown_02001184

	THUMB_FUNC_END func_0804BD3C

	THUMB_FUNC_START func_0804BDD8
func_0804BDD8: @ 0x0804BDD8
	ldr r2, .L0804BDF8  @ gDispIo
	movs r0, #0
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
.L0804BDF8: .4byte gDispIo

	THUMB_FUNC_END func_0804BDD8

	THUMB_FUNC_START func_0804BDFC
func_0804BDFC: @ 0x0804BDFC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, .L0804BE80  @ gUnknown_085AA7EC
	bl SpawnProcLocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r3, .L0804BE84  @ gDispIo
	ldrb r1, [r3, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x35
	ldrb r2, [r4]
	movs r0, #1
	orrs r2, r0
	movs r0, #2
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	adds r3, #0x36
	ldrb r1, [r3]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BE80: .4byte gUnknown_085AA7EC
.L0804BE84: .4byte gDispIo

	THUMB_FUNC_END func_0804BDFC

	THUMB_FUNC_START func_0804BE88
func_0804BE88: @ 0x0804BE88
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl func_0804BDFC
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804BE88

	THUMB_FUNC_START func_0804BE98
func_0804BE98: @ 0x0804BE98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804BEB4  @ gUnknown_085AA7B4
	bl FindProc
	cmp r0, #0
	bne .L0804BEAC
	adds r0, r4, #0
	bl Proc_Break
.L0804BEAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BEB4: .4byte gUnknown_085AA7B4

	THUMB_FUNC_END func_0804BE98

	THUMB_FUNC_START func_0804BEB8
func_0804BEB8: @ 0x0804BEB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804BED4  @ gUnknown_085AA7EC
	bl FindProc
	cmp r0, #0
	bne .L0804BECC
	adds r0, r4, #0
	bl Proc_Break
.L0804BECC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BED4: .4byte gUnknown_085AA7EC

	THUMB_FUNC_END func_0804BEB8

	THUMB_FUNC_START func_0804BED8
func_0804BED8: @ 0x0804BED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804BF24  @ gUnknown_085AA824
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, [r4, #0x30]
	ldr r1, [r4, #0x34]
	movs r3, #0xd0
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, .L0804BF28  @ gPal
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #0x14
	adds r3, r4, #0
	bl func_08013928
	ldr r0, .L0804BF2C  @ gUnknown_085AA83C
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BF24: .4byte gUnknown_085AA824
.L0804BF28: .4byte gPal
.L0804BF2C: .4byte gUnknown_085AA83C

	THUMB_FUNC_END func_0804BED8

	THUMB_FUNC_START func_0804BF30
func_0804BF30: @ 0x0804BF30
	ldr r0, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	ldr r2, [r0, #0x34]
	ldrb r1, [r2, #1]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	strh r0, [r3, #0x22]
	bx lr

	THUMB_FUNC_END func_0804BF30

	THUMB_FUNC_START func_0804BF4C
func_0804BF4C: @ 0x0804BF4C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, .L0804BFA4  @ ProcScr_MUDeathFade
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x54]
	adds r0, #0x64
	movs r1, #0x20
	strh r1, [r0]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	adds r0, r4, #0
	movs r1, #0
	bl func_0804BED8
	ldr r1, [r4, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, .L0804BFA8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804BF9E
	movs r0, #0xd6
	bl m4aSongNumStart
.L0804BF9E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BFA4: .4byte ProcScr_MUDeathFade
.L0804BFA8: .4byte gPlaySt

	THUMB_FUNC_END func_0804BF4C

	THUMB_FUNC_START func_0804BFAC
func_0804BFAC: @ 0x0804BFAC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, [r5, #0x30]
	ldr r1, [r5, #0x34]
	movs r3, #0xd0
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, .L0804BFF0  @ gPal
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L0804BFF4  @ gUnknown_085AA824
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x16
	movs r2, #8
	adds r3, r5, #0
	bl func_08013928
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804BFF0: .4byte gPal
.L0804BFF4: .4byte gUnknown_085AA824

	THUMB_FUNC_END func_0804BFAC

	THUMB_FUNC_START func_0804BFF8
func_0804BFF8: @ 0x0804BFF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, .L0804C024  @ gPal
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #8
	adds r3, r4, #0
	bl func_08013928
	ldr r0, .L0804C028  @ ProcScr_MU_89A2CF8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C024: .4byte gPal
.L0804C028: .4byte ProcScr_MU_89A2CF8

	THUMB_FUNC_END func_0804BFF8

	THUMB_FUNC_START func_0804C02C
func_0804C02C: @ 0x0804C02C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804C06C  @ gUnknown_089AE224
	ldr r1, .L0804C070  @ 0x06004400
	bl Decompress
	ldr r0, .L0804C074  @ gUnknown_089AE484
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L0804C064
	ldr r2, [r4, #0x34]
	lsls r2, r2, #3
	movs r0, #0x7f
	movs r1, #2
	bl MU_StartStepSfx
.L0804C064:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C06C: .4byte gUnknown_089AE224
.L0804C070: .4byte 0x06004400
.L0804C074: .4byte gUnknown_089AE484

	THUMB_FUNC_END func_0804C02C

	THUMB_FUNC_START func_0804C078
func_0804C078: @ 0x0804C078
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, .L0804C118  @ gBg2Tm
	ldr r1, [r7, #0x34]
	subs r1, #1
	ldr r2, [r7, #0x38]
	subs r2, #3
	ldr r3, .L0804C11C  @ 0x00003220
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, .L0804C120  @ gUnknown_089AE4A4
	str r4, [sp, #8]
	ldr r6, .L0804C124  @ gUnknown_085AA854
	adds r5, r7, #0
	adds r5, #0x40
	ldrb r4, [r5]
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl func_080146A0
	movs r0, #4
	bl EnableBgSync
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne .L0804C0C4
	adds r0, r7, #0
	bl Proc_Break
.L0804C0C4:
	ldr r2, .L0804C128  @ gDispIo
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0xc
	movs r2, #0xc
	movs r3, #0
	bl SetBlendConfig
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C118: .4byte gBg2Tm
.L0804C11C: .4byte 0x00003220
.L0804C120: .4byte gUnknown_089AE4A4
.L0804C124: .4byte gUnknown_085AA854
.L0804C128: .4byte gDispIo

	THUMB_FUNC_END func_0804C078

	THUMB_FUNC_START func_0804C12C
func_0804C12C: @ 0x0804C12C
	push {lr}
	ldr r0, .L0804C144  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl SetBlendNone
	pop {r0}
	bx r0
	.align 2, 0
.L0804C144: .4byte gBg2Tm

	THUMB_FUNC_END func_0804C12C

	THUMB_FUNC_START func_0804C148
func_0804C148: @ 0x0804C148
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804C174  @ gUnknown_085AA86C
	movs r1, #2
	bl SpawnProc
	ldr r2, [r4, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	adds r4, #0x41
	ldrb r1, [r4]
	adds r0, #0x41
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C174: .4byte gUnknown_085AA86C

	THUMB_FUNC_END func_0804C148

	THUMB_FUNC_START func_0804C178
func_0804C178: @ 0x0804C178
	push {lr}
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl func_0804BFAC
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C178

	THUMB_FUNC_START func_0804C188
func_0804C188: @ 0x0804C188
	push {lr}
	ldr r0, [r0, #0x30]
	bl MU_Hide
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C188

	THUMB_FUNC_START func_0804C194
func_0804C194: @ 0x0804C194
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	lsls r1, r1, #4
	ldr r2, [r4, #0x38]
	lsls r2, r2, #4
	bl MU_SetDisplayPosition
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	strb r0, [r1, #0x10]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C194

	THUMB_FUNC_START func_0804C1B8
func_0804C1B8: @ 0x0804C1B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0804C1CC
	ldr r0, [r4, #0x30]
	bl MU_SetFacing
.L0804C1CC:
	ldr r0, [r4, #0x30]
	bl MU_Show
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C1B8

	THUMB_FUNC_START func_0804C1D8
func_0804C1D8: @ 0x0804C1D8
	push {lr}
	ldr r0, [r0, #0x30]
	bl func_0804BFF8
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C1D8

	THUMB_FUNC_START func_0804C1E4
func_0804C1E4: @ 0x0804C1E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804C204  @ gUnknown_085AA86C
	bl FindProc
	negs r1, r0
	orrs r1, r0
	cmp r1, #0
	blt .L0804C1FC
	adds r0, r4, #0
	bl Proc_Break
.L0804C1FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C204: .4byte gUnknown_085AA86C

	THUMB_FUNC_END func_0804C1E4

	THUMB_FUNC_START func_0804C208
func_0804C208: @ 0x0804C208
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq .L0804C230
	ldr r0, .L0804C22C  @ gUnknown_085AA89C
	bl SpawnProcLocking
	b .L0804C238
	.align 2, 0
.L0804C22C: .4byte gUnknown_085AA89C
.L0804C230:
	ldr r0, .L0804C25C  @ gUnknown_085AA89C
	movs r1, #2
	bl SpawnProc
.L0804C238:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0804C25C: .4byte gUnknown_085AA89C

	THUMB_FUNC_END func_0804C208

	THUMB_FUNC_START func_0804C260
func_0804C260: @ 0x0804C260
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq .L0804C288
	ldr r0, .L0804C284  @ gUnknown_085AA914
	bl SpawnProcLocking
	b .L0804C290
	.align 2, 0
.L0804C284: .4byte gUnknown_085AA914
.L0804C288:
	ldr r0, .L0804C2B4  @ gUnknown_085AA914
	movs r1, #2
	bl SpawnProc
.L0804C290:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0804C2B4: .4byte gUnknown_085AA914

	THUMB_FUNC_END func_0804C260

	THUMB_FUNC_START func_0804C2B8
func_0804C2B8: @ 0x0804C2B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, .L0804C2D8  @ gUnknown_080D9FD6
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C2D8: .4byte gUnknown_080D9FD6

	THUMB_FUNC_END func_0804C2B8

	THUMB_FUNC_START func_0804C2DC
func_0804C2DC: @ 0x0804C2DC
	push {lr}
	ldr r2, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl func_0804C2B8
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C2DC

	THUMB_FUNC_START func_0804C2EC
func_0804C2EC: @ 0x0804C2EC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, .L0804C318  @ gUnknown_085AA954
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C318: .4byte gUnknown_085AA954

	THUMB_FUNC_END func_0804C2EC

	THUMB_FUNC_START func_0804C31C
func_0804C31C: @ 0x0804C31C
	push {r4, lr}
	ldr r4, .L0804C338  @ gUnknown_085AA954
	adds r0, r4, #0
	bl FindProc
	cmp r0, #0
	beq .L0804C330
	adds r0, r4, #0
	bl EndEachProc
.L0804C330:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C338: .4byte gUnknown_085AA954

	THUMB_FUNC_END func_0804C31C

	THUMB_FUNC_START func_0804C33C
func_0804C33C: @ 0x0804C33C
	push {lr}
	sub sp, #0x18
	ldr r1, .L0804C394  @ gUnknown_080D9FE4
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl SetupBackgrounds
	ldr r3, .L0804C398  @ gDispIo
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
	bl ApplySystemGraphics
	ldr r0, .L0804C39C  @ gUnknown_085ADCC8
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
.L0804C394: .4byte gUnknown_080D9FE4
.L0804C398: .4byte gDispIo
.L0804C39C: .4byte gUnknown_085ADCC8

	THUMB_FUNC_END func_0804C33C

	THUMB_FUNC_START nullsub_16
nullsub_16: @ 0x0804C3A0
	bx lr

	THUMB_FUNC_END nullsub_16

	THUMB_FUNC_START nullsub_14
nullsub_14: @ 0x0804C3A4
	bx lr

	THUMB_FUNC_END nullsub_14

	THUMB_FUNC_START nullsub_13
nullsub_13: @ 0x0804C3A8
	bx lr

	THUMB_FUNC_END nullsub_13

	THUMB_FUNC_START func_0804C3AC
func_0804C3AC: @ 0x0804C3AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #5
	mov r8, r2
	cmp r3, #0
	ble .L0804C3E2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r4, r3, #0
.L0804C3C4:
	mov r2, r8
	cmp r2, #0
	bge .L0804C3CC
	adds r2, #3
.L0804C3CC:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	adds r6, r6, r7
	adds r5, r5, r7
	subs r4, #1
	cmp r4, #0
	bne .L0804C3C4
.L0804C3E2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C3AC

	THUMB_FUNC_START func_0804C3EC
func_0804C3EC: @ 0x0804C3EC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r5, [r0, #0x58]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #6
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	lsls r5, r5, #0xb
	ldr r0, .L0804C464  @ gUnknown_085B0DE8
	mov r2, r8
	ldr r1, [r2, #0x5c]
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	bl Decompress
	ldr r0, .L0804C468  @ gUnknown_085AAE0C
	ldr r6, .L0804C46C  @ gBuf
	adds r1, r6, #0
	bl Decompress
	adds r4, r4, r5
	adds r4, r4, r6
	ldr r1, .L0804C470  @ 0x06014000
	adds r0, r4, #0
	movs r2, #0xa
	movs r3, #2
	bl func_0804C3AC
	ldr r0, .L0804C474  @ gBg2Tm
	ldr r1, .L0804C478  @ gUnknown_085B0F2C
	mov r4, r8
	ldr r2, [r4, #0x5c]
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x14
	movs r4, #0x80
	lsls r4, r4, #5
	adds r3, r4, #0
	orrs r2, r3
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C464: .4byte gUnknown_085B0DE8
.L0804C468: .4byte gUnknown_085AAE0C
.L0804C46C: .4byte gBuf
.L0804C470: .4byte 0x06014000
.L0804C474: .4byte gBg2Tm
.L0804C478: .4byte gUnknown_085B0F2C

	THUMB_FUNC_END func_0804C3EC

	THUMB_FUNC_START func_0804C47C
func_0804C47C: @ 0x0804C47C
	push {lr}
	sub sp, #4
	ldr r3, .L0804C498  @ gUnknown_085AA96C
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #8
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L0804C498: .4byte gUnknown_085AA96C

	THUMB_FUNC_END func_0804C47C

	THUMB_FUNC_START func_0804C49C
func_0804C49C: @ 0x0804C49C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, .L0804C4F4  @ gUnknown_085AA980
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r6, #0
	bl SpawnProc
	adds r6, r0, #0
	mov r0, r8
	str r0, [r6, #0x58]
	str r5, [r6, #0x5c]
	cmp r5, #0
	bne .L0804C4CA
	movs r0, #0xb8
	lsls r0, r0, #7
	str r0, [r6, #0x5c]
.L0804C4CA:
	ldr r4, [r6, #0x58]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	str r1, [r6, #0x2c]
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0xb
	str r0, [r6, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C4F4: .4byte gUnknown_085AA980

	THUMB_FUNC_END func_0804C49C

	THUMB_FUNC_START func_0804C4F8
func_0804C4F8: @ 0x0804C4F8
	push {lr}
	ldr r0, .L0804C504  @ gUnknown_085AA980
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0804C504: .4byte gUnknown_085AA980

	THUMB_FUNC_END func_0804C4F8

	THUMB_FUNC_START func_0804C508
func_0804C508: @ 0x0804C508
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r2, .L0804C554  @ gDispIo
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
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C554: .4byte gDispIo

	THUMB_FUNC_END func_0804C508

	THUMB_FUNC_START func_0804C558
func_0804C558: @ 0x0804C558
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C558

	THUMB_FUNC_START func_0804C590
func_0804C590: @ 0x0804C590
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C590

	THUMB_FUNC_START func_0804C5A4
func_0804C5A4: @ 0x0804C5A4
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, .L0804C5E8  @ gUnknown_080DA0DA
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, .L0804C5EC  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804C5DE
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	adds r1, #0x10
	ldr r3, .L0804C5F0  @ gPal
	lsls r0, r1, #0xa
	lsls r2, r1, #5
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r1, .L0804C5F4  @ 0x00000262
	adds r3, r3, r1
	strh r0, [r3]
	bl EnablePalSync
.L0804C5DE:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C5E8: .4byte gUnknown_080DA0DA
.L0804C5EC: .4byte gUnknown_0203DDDC
.L0804C5F0: .4byte gPal
.L0804C5F4: .4byte 0x00000262

	THUMB_FUNC_END func_0804C5A4

	THUMB_FUNC_START func_0804C5F8
func_0804C5F8: @ 0x0804C5F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, .L0804C73C  @ 0x000082C8
	mov r8, r0
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	ldr r3, .L0804C740  @ gUnknown_085AA9A0
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, .L0804C744  @ gUnknown_080DA09C
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldrb r0, [r5]
	cmp r0, #2
	bne .L0804C642
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl func_0804C5A4
.L0804C642:
	adds r2, r7, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r7, #0x2e]
	movs r0, #0x81
	lsls r0, r0, #1
	cmp r1, r0
	bne .L0804C72E
	ldrh r1, [r7, #0x3a]
	ldrh r2, [r7, #0x36]
	adds r0, r1, r2
	strh r0, [r7, #0x36]
	ldrh r2, [r7, #0x3c]
	ldrh r3, [r7, #0x38]
	adds r0, r2, r3
	strh r0, [r7, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble .L0804C676
	subs r0, r1, #1
	strh r0, [r7, #0x3a]
.L0804C676:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble .L0804C682
	subs r0, r2, #1
	strh r0, [r7, #0x3c]
.L0804C682:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne .L0804C6AA
	ldrh r1, [r7, #0x32]
	movs r2, #0x32
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge .L0804C69C
	adds r0, r1, #1
	strh r0, [r7, #0x32]
.L0804C69C:
	ldrh r1, [r7, #0x34]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #0x34
	ble .L0804C6AA
	subs r0, r1, #1
	strh r0, [r7, #0x34]
.L0804C6AA:
	movs r0, #0x2a
	ldrsh r5, [r7, r0]
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	adds r0, #0x4b
	adds r5, r5, r0
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	adds r4, #8
	ldr r6, .L0804C748  @ Sprite_8x16
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0x2a
	ldrsh r5, [r7, r3]
	movs r1, #0x34
	ldrsh r0, [r7, r1]
	adds r0, #0x49
	adds r5, r5, r0
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	adds r4, #8
	ldr r6, .L0804C74C  @ Sprite_8x16_HFlipped
	ldrh r0, [r7, #0x38]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0x2a
	ldrsh r1, [r7, r3]
	adds r1, #0x50
	movs r0, #0x2c
	ldrsh r2, [r7, r0]
	adds r2, #9
	ldr r3, .L0804C750  @ gUnknown_085AA9B4
	ldr r0, .L0804C754  @ gUnknown_0203DA24
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
.L0804C72E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C73C: .4byte 0x000082C8
.L0804C740: .4byte gUnknown_085AA9A0
.L0804C744: .4byte gUnknown_080DA09C
.L0804C748: .4byte Sprite_8x16
.L0804C74C: .4byte Sprite_8x16_HFlipped
.L0804C750: .4byte gUnknown_085AA9B4
.L0804C754: .4byte gUnknown_0203DA24

	THUMB_FUNC_END func_0804C5F8

	THUMB_FUNC_START func_0804C758
func_0804C758: @ 0x0804C758
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r2, r3, #0
	ldr r6, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, .L0804C7C4  @ gUnknown_085AA9C0
	mov r1, r8
	str r2, [sp]
	bl SpawnProc
	mov r8, r0
	movs r3, #0
	movs r1, #0
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #1
	ldr r2, [sp]
	strb r2, [r0]
	mov r0, r8
	strh r1, [r0, #0x32]
	movs r0, #0x34
	mov r2, r8
	strh r0, [r2, #0x34]
	strh r1, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #4
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x3a]
	mov r0, r8
	adds r0, #0x3e
	strb r3, [r0]
	subs r0, #0xe
	strb r3, [r0]
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0804C7C4: .4byte gUnknown_085AA9C0

	THUMB_FUNC_END func_0804C758

	THUMB_FUNC_START func_0804C7C8
func_0804C7C8: @ 0x0804C7C8
	push {r4, lr}
	ldr r4, [sp, #8]
	strh r1, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r3, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804C7C8

	THUMB_FUNC_START func_0804C7DC
func_0804C7DC: @ 0x0804C7DC
	strh r1, [r0, #0x2a]
	strh r2, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END func_0804C7DC

	THUMB_FUNC_START func_0804C7E4
func_0804C7E4: @ 0x0804C7E4
	push {r4, lr}
	sub sp, #0x20
	ldr r4, .L0804C82C  @ gUnknown_085ADDE8
	ldr r1, .L0804C830  @ gUnknown_080DA102
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, .L0804C834  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804C824
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r1, .L0804C838  @ gPal
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0xc7
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
.L0804C824:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C82C: .4byte gUnknown_085ADDE8
.L0804C830: .4byte gUnknown_080DA102
.L0804C834: .4byte gUnknown_0203DDDC
.L0804C838: .4byte gPal

	THUMB_FUNC_END func_0804C7E4

	THUMB_FUNC_START func_0804C83C
func_0804C83C: @ 0x0804C83C
	push {r4, lr}
	sub sp, #0x20
	ldr r4, .L0804C884  @ gUnknown_085ADE48
	ldr r1, .L0804C888  @ gUnknown_080DA0DA
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, .L0804C88C  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804C87C
	bl GetGameTime
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r1, .L0804C890  @ gPal
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePalSync
.L0804C87C:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804C884: .4byte gUnknown_085ADE48
.L0804C888: .4byte gUnknown_080DA0DA
.L0804C88C: .4byte gUnknown_0203DDDC
.L0804C890: .4byte gPal

	THUMB_FUNC_END func_0804C83C

	THUMB_FUNC_START func_0804C894
func_0804C894: @ 0x0804C894
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, .L0804C9E4  @ gUnknown_0203DA24
	ldrb r0, [r0]
	cmp r0, #1
	beq .L0804C8AC
	b .L0804CA08
.L0804C8AC:
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	mov r8, r2
	str r0, [sp, #4]
	cmp r1, #0
	beq .L0804C8C6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
.L0804C8C6:
	ldr r3, .L0804C9E8  @ gUnknown_085AA9D8
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	bge .L0804C92A
	movs r5, #0x20
.L0804C8DE:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r4, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #6
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, .L0804C9EC  @ gUnknown_085AAA50
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq .L0804C920
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, #6
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, .L0804C9F0  @ gUnknown_085AAA5E
	bl PutSprite
.L0804C920:
	adds r5, #0x18
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt .L0804C8DE
.L0804C92A:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	beq .L0804C9DE
	ldr r0, .L0804C9F4  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804C95C
	bl GetGameTime
	ldr r2, .L0804C9F8  @ gPal
	movs r1, #0x3f
	ands r1, r0
	lsrs r1, r1, #2
	lsls r1, r1, #1
	ldr r0, .L0804C9FC  @ gUnknown_08A1BD40
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #0xc7
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
.L0804C95C:
	ldr r0, [r7, #0x40]
	cmp r0, #0xff
	bgt .L0804C966
	adds r0, #0x10
	str r0, [r7, #0x40]
.L0804C966:
	ldr r4, .L0804CA00  @ gSinLut
	movs r2, #0x80
	adds r2, r2, r4
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, .L0804CA04  @ gUnknown_080DA0FA
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl PutSprite
.L0804C9DE:
	bl func_0804C83C
	b .L0804CA96
	.align 2, 0
.L0804C9E4: .4byte gUnknown_0203DA24
.L0804C9E8: .4byte gUnknown_085AA9D8
.L0804C9EC: .4byte gUnknown_085AAA50
.L0804C9F0: .4byte gUnknown_085AAA5E
.L0804C9F4: .4byte gUnknown_0203DDDC
.L0804C9F8: .4byte gPal
.L0804C9FC: .4byte gUnknown_08A1BD40
.L0804CA00: .4byte gSinLut
.L0804CA04: .4byte gUnknown_080DA0FA
.L0804CA08:
	ldr r3, .L0804CA70  @ gUnknown_085AA9D8
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	adds r1, r7, #0
	adds r1, #0x44
	str r1, [sp, #4]
	cmp r6, r0
	bge .L0804CA92
	ldr r2, .L0804CA74  @ gUnknown_085AAA48
	mov sl, r2
	movs r0, #8
	negs r0, r0
	mov r9, r0
	movs r1, #0x30
	mov r8, r1
.L0804CA34:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r5, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r7, #0
	adds r4, #0x3a
	adds r4, r4, r6
	ldrb r0, [r4]
	lsls r0, r0, #2
	add r0, sl
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r2, r8
	bl PutSprite
	ldrb r0, [r4]
	cmp r0, #0
	beq .L0804CA78
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge .L0804CA86
	adds r0, r1, #1
	b .L0804CA84
	.align 2, 0
.L0804CA70: .4byte gUnknown_085AA9D8
.L0804CA74: .4byte gUnknown_085AAA48
.L0804CA78:
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, r9
	ble .L0804CA86
	subs r0, r1, #1
.L0804CA84:
	strh r0, [r5]
.L0804CA86:
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt .L0804CA34
.L0804CA92:
	bl func_0804C7E4
.L0804CA96:
	ldr r0, .L0804CAE4  @ gUnknown_0203DA24
	ldrb r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	mov r8, r1
	cmp r0, #1
	bne .L0804CAAA
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
.L0804CAAA:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq .L0804CABC
	movs r0, #0xc0
	movs r1, #0x10
	bl func_0804C2B8
.L0804CABC:
	ldr r0, [r7, #0x48]
	cmp r0, #0
	blt .L0804CAD4
	adds r2, r0, #0
	adds r2, #8
	ldr r3, .L0804CAE8  @ gUnknown_085AAA0E
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	bl PutSprite
.L0804CAD4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CAE4: .4byte gUnknown_0203DA24
.L0804CAE8: .4byte gUnknown_085AAA0E

	THUMB_FUNC_END func_0804C894

	THUMB_FUNC_START func_0804CAEC
func_0804CAEC: @ 0x0804CAEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, .L0804CB8C  @ gUnknown_085AAA78
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r6, #0
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	str r2, [r4, #0x40]
	subs r0, #2
	str r0, [r4, #0x48]
	movs r3, #0
	adds r5, r4, #0
	adds r5, #0x3a
	ldr r0, .L0804CB90  @ 0x0000FFF8
	mov ip, r0
	adds r2, r4, #0
	adds r2, #0x30
.L0804CB2C:
	adds r0, r5, r3
	mov r7, r8
	adds r1, r7, r3
	ldrb r1, [r1]
	strb r1, [r0]
	mov r0, ip
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble .L0804CB2C
	ldr r2, [r6, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	adds r0, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0xe1
	movs r1, #0x28
	movs r3, #6
	bl func_0804D1E0
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0x28
	subs r1, r1, r0
	ldr r0, [r6, #0x38]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x98
	movs r2, #0x88
	movs r3, #0x27
	bl func_0804CC14
	adds r0, r4, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0804CB8C: .4byte gUnknown_085AAA78
.L0804CB90: .4byte 0x0000FFF8

	THUMB_FUNC_END func_0804CAEC

	THUMB_FUNC_START func_0804CB94
func_0804CB94: @ 0x0804CB94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	b .L0804CBFC
.L0804CBA8:
	mov r1, r8
	lsls r0, r1, #4
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	ldr r0, [r4, #0x38]
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r5, r0
	bge .L0804CBFA
	ldr r0, [r4, #0x34]
	cmp r5, r0
	ble .L0804CBFA
	movs r6, #0
	mov r0, r8
	lsls r0, r0, #2
	mov r9, r0
	movs r7, #0
.L0804CBCC:
	mov r0, r9
	add r0, r8
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq .L0804CBF2
	ldr r1, [r4, #0x2c]
	adds r1, r1, r7
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #3
	bl PutUnitSpriteExt
.L0804CBF2:
	adds r7, #0xe
	adds r6, #1
	cmp r6, #4
	ble .L0804CBCC
.L0804CBFA:
	mov r8, sl
.L0804CBFC:
	ldr r0, [r4, #0x3c]
	cmp r8, r0
	blt .L0804CBA8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804CB94

	THUMB_FUNC_START func_0804CC14
func_0804CC14: @ 0x0804CC14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov sl, r1
	adds r7, r2, #0
	mov r8, r3
	ldr r6, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r4, .L0804CC58  @ gUnknown_085AAA90
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x3c]
	mov r1, r9
	str r1, [r0, #0x2c]
	mov r1, sl
	str r1, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	str r7, [r0, #0x38]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CC58: .4byte gUnknown_085AAA90

	THUMB_FUNC_END func_0804CC14

	THUMB_FUNC_START func_0804CC5C
func_0804CC5C: @ 0x0804CC5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L0804CC74  @ gUnknown_085AAA90
	bl FindProc
	ldr r1, [r0, #0x30]
	adds r1, r1, r4
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CC74: .4byte gUnknown_085AAA90

	THUMB_FUNC_END func_0804CC5C

	THUMB_FUNC_START func_0804CC78
func_0804CC78: @ 0x0804CC78
	push {r4, r5, r6, lr}
	ldr r5, .L0804CCBC  @ gUnknown_085ADE28
	ldr r0, .L0804CCC0  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804CCB6
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, .L0804CCC4  @ gPal
	movs r4, #0xf
	ldr r6, .L0804CCC8  @ 0x00000336
	adds r3, r0, r6
.L0804CC9E:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble .L0804CC9E
	bl EnablePalSync
.L0804CCB6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CCBC: .4byte gUnknown_085ADE28
.L0804CCC0: .4byte gUnknown_0203DDDC
.L0804CCC4: .4byte gPal
.L0804CCC8: .4byte 0x00000336

	THUMB_FUNC_END func_0804CC78

	THUMB_FUNC_START func_0804CCCC
func_0804CCCC: @ 0x0804CCCC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x2c]
	adds r1, r1, r0
	asrs r1, r1, #1
	ldr r2, [r7, #0x38]
	ldr r0, [r7, #0x30]
	adds r2, r2, r0
	asrs r2, r2, #1
	str r1, [r7, #0x2c]
	str r2, [r7, #0x30]
	ldr r3, .L0804CD54  @ gUnknown_085AAAA8
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x40]
	adds r1, #0x60
	ldr r3, .L0804CD58  @ gUnknown_080DA132
	str r4, [sp]
	movs r0, #2
	movs r2, #0x30
	bl PutSprite
	ldr r3, .L0804CD5C  @ gUnknown_085AA9D8
	str r4, [sp]
	movs r0, #2
	movs r1, #0x60
	movs r2, #0x20
	bl PutSprite
	ldr r3, .L0804CD60  @ gUnknown_085AAA50
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r4, #3
	ldr r0, .L0804CD64  @ gUnknown_085AAAB0
	adds r6, r0, #0
	adds r6, #0xc
	movs r5, #0x78
.L0804CD34:
	ldr r0, [r7, #0x44]
	cmp r0, r4
	bne .L0804CD68
	cmp r4, #2
	bgt .L0804CD68
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
	b .L0804CD7A
	.align 2, 0
.L0804CD54: .4byte gUnknown_085AAAA8
.L0804CD58: .4byte gUnknown_080DA132
.L0804CD5C: .4byte gUnknown_085AA9D8
.L0804CD60: .4byte gUnknown_085AAA50
.L0804CD64: .4byte gUnknown_085AAAB0
.L0804CD68:
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
.L0804CD7A:
	adds r6, #4
	adds r5, #0x10
	adds r4, #1
	cmp r4, #4
	ble .L0804CD34
	bl func_0804CC78
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804CCCC

	THUMB_FUNC_START func_0804CD90
func_0804CD90: @ 0x0804CD90
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, .L0804CDCC  @ gUnknown_085AAAC4
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r6, #0
	bl SpawnProc
	str r5, [r0, #0x34]
	str r5, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	movs r1, #1
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0804CDCC: .4byte gUnknown_085AAAC4

	THUMB_FUNC_END func_0804CD90

	THUMB_FUNC_START func_0804CDD0
func_0804CDD0: @ 0x0804CDD0
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [sp, #0x10]
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	str r4, [r0, #0x3c]
	str r3, [r0, #0x40]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804CDD0

	THUMB_FUNC_START func_0804CDE8
func_0804CDE8: @ 0x0804CDE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r7, r0, #2
	ldrh r0, [r5, #0x2c]
	strh r0, [r5, #0x2a]
	ldr r0, .L0804CE58  @ gUnknown_085AAADC
	mov r8, r0
	movs r6, #0x30
	movs r4, #2
.L0804CE0E:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r6, #0
	bl PutSprite
	adds r6, #0x18
	subs r4, #1
	cmp r4, #0
	bge .L0804CE0E
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0x20
	bl DisplayFrozenUiHand
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl DisplayUiHand
	movs r0, #0xc0
	movs r1, #0x10
	bl func_0804C2B8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CE58: .4byte gUnknown_085AAADC

	THUMB_FUNC_END func_0804CDE8

	THUMB_FUNC_START func_0804CE5C
func_0804CE5C: @ 0x0804CE5C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, .L0804CE88  @ gUnknown_085AAADC
	movs r5, #0x30
	movs r4, #2
.L0804CE66:
	ldm r6!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r5, #0
	bl PutSprite
	adds r5, #0x18
	subs r4, #1
	cmp r4, #0
	bge .L0804CE66
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CE88: .4byte gUnknown_085AAADC

	THUMB_FUNC_END func_0804CE5C

	THUMB_FUNC_START func_0804CE8C
func_0804CE8C: @ 0x0804CE8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L0804CEAC  @ gUnknown_085AAAE8
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	movs r1, #0
	strh r1, [r0, #0x2a]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0804CEAC: .4byte gUnknown_085AAAE8

	THUMB_FUNC_END func_0804CE8C

	THUMB_FUNC_START func_0804CEB0
func_0804CEB0: @ 0x0804CEB0
	push {lr}
	ldr r0, .L0804CEC0  @ gUnknown_085AAB00
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L0804CEC0: .4byte gUnknown_085AAB00

	THUMB_FUNC_END func_0804CEB0

	THUMB_FUNC_START func_0804CEC4
func_0804CEC4: @ 0x0804CEC4
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r3, [r0, #0x30]
	bx lr

	THUMB_FUNC_END func_0804CEC4

	THUMB_FUNC_START func_0804CECC
func_0804CECC: @ 0x0804CECC
	push {lr}
	adds r1, r0, #0
	ldr r2, .L0804CEF8  @ gUnknown_085ADE28
	ldr r0, .L0804CEFC  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804CEF2
	ldr r0, .L0804CF00  @ gPal
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
.L0804CEF2:
	pop {r0}
	bx r0
	.align 2, 0
.L0804CEF8: .4byte gUnknown_085ADE28
.L0804CEFC: .4byte gUnknown_0203DDDC
.L0804CF00: .4byte gPal

	THUMB_FUNC_END func_0804CECC

	THUMB_FUNC_START func_0804CF04
func_0804CF04: @ 0x0804CF04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r5, #1
	adds r0, r5, #0
	bl func_0804CECC
	ldr r0, .L0804CFA4  @ gUnknown_080DA1CA
	adds r4, #1
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r1, #0
	ldrsh r6, [r4, r1]
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	lsls r5, r5, #2
	adds r5, r5, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, .L0804CFA8  @ gUnknown_080DA17A
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, .L0804CFAC  @ gUnknown_080DA18E
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, .L0804CFB0  @ gUnknown_080DA1A2
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, .L0804CFB4  @ gUnknown_080DA1B6
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne .L0804CF98
	adds r0, r7, #0
	bl Proc_Break
.L0804CF98:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804CFA4: .4byte gUnknown_080DA1CA
.L0804CFA8: .4byte gUnknown_080DA17A
.L0804CFAC: .4byte gUnknown_080DA18E
.L0804CFB0: .4byte gUnknown_080DA1A2
.L0804CFB4: .4byte gUnknown_080DA1B6

	THUMB_FUNC_END func_0804CF04

	THUMB_FUNC_START func_0804CFB8
func_0804CFB8: @ 0x0804CFB8
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, .L0804CFDC  @ gUnknown_085AAB18
	adds r1, r3, #0
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x2c]
	str r5, [r1, #0x30]
	adds r1, #0x4c
	movs r2, #0
	strh r2, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0804CFDC: .4byte gUnknown_085AAB18

	THUMB_FUNC_END func_0804CFB8

	THUMB_FUNC_START func_0804CFE0
func_0804CFE0: @ 0x0804CFE0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x45
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #7
	ldrb r0, [r0]
	ldr r4, [r6, #0x34]
	muls r0, r4, r0
	lsls r0, r0, #3
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804CFE0

	THUMB_FUNC_START func_0804D01C
func_0804D01C: @ 0x0804D01C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r1, [r7, #0x30]
	str r1, [sp, #0xc]
	adds r1, #8
	mov sl, r1
	ldr r0, [r7, #0x38]
	asrs r2, r0, #3
	str r2, [sp, #0x10]
	movs r1, #7
	ands r0, r1
	movs r1, #8
	subs r0, r1, r0
	str r0, [sp, #0x14]
	movs r3, #0x3e
	ldrsh r1, [r7, r3]
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	movs r0, #0x3c
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0x3d
	adds r1, r1, r7
	mov r9, r1
	ldrb r0, [r0]
	ldrb r2, [r1]
	cmp r0, r2
	bhi .L0804D06C
	b .L0804D1C4
.L0804D06C:
	adds r5, r7, #0
	adds r5, #0x44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x45
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x40
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r3, r5, #0
	str r0, [sp, #0x2c]
	cmp r2, r1
	bge .L0804D09A
	ldrb r0, [r3]
	adds r0, #2
	strb r0, [r3]
.L0804D09A:
	movs r0, #0x3e
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble .L0804D0AE
	ldrb r0, [r4]
	adds r0, #2
	strb r0, [r4]
.L0804D0AE:
	movs r6, #0
	mov r0, ip
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	add r1, sl
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	lsls r2, r2, #3
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	str r3, [sp, #0x20]
.L0804D0C4:
	ldrb r0, [r5]
	cmp r0, #0x30
	bls .L0804D0CE
	movs r0, #0
	strb r0, [r5]
.L0804D0CE:
	lsls r4, r6, #2
	add r4, sp
	adds r4, #4
	ldrb r0, [r5]
	lsrs r0, r0, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4]
	adds r5, #1
	adds r6, #1
	cmp r6, #1
	ble .L0804D0C4
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq .L0804D106
	mov r2, sl
	subs r2, #9
	ldr r3, .L0804D1D4  @ gUnknown_085AAB38
	ldr r0, [sp, #4]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
.L0804D106:
	movs r2, #0x3e
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge .L0804D110
	adds r0, #0xf
.L0804D110:
	asrs r0, r0, #4
	mov r3, r9
	ldrb r3, [r3]
	adds r0, r0, r3
	ldr r1, [sp, #0x28]
	ldrb r1, [r1]
	cmp r0, r1
	bge .L0804D136
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	adds r2, #1
	ldr r3, .L0804D1D8  @ gUnknown_085AAB30
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
.L0804D136:
	movs r6, #0
	ldr r0, [r7, #0x34]
	cmp r6, r0
	bge .L0804D15A
	mov r4, sl
	movs r5, #1
.L0804D142:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, .L0804D1DC  @ gUnknown_085AAB40
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r0, [r7, #0x34]
	cmp r6, r0
	blt .L0804D142
.L0804D15A:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ble .L0804D17C
	ldr r4, [sp, #0x1c]
	movs r5, #0
	adds r6, r2, #0
.L0804D166:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, .L0804D1DC  @ gUnknown_085AAB40
	bl PutSprite
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne .L0804D166
.L0804D17C:
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	adds r2, r3, r0
	ldr r1, [sp, #0x14]
	subs r2, r2, r1
	ldr r4, .L0804D1DC  @ gUnknown_085AAB40
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r3, r4, #0
	bl PutSprite
	movs r5, #2
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	ldr r2, [sp, #0x20]
	adds r3, r4, #0
	bl PutSprite
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r8
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	subs r2, #7
	str r5, [sp]
	movs r0, #2
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r7, #0x3e]
	ldr r2, [sp, #0x2c]
	strh r0, [r2]
.L0804D1C4:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D1D4: .4byte gUnknown_085AAB38
.L0804D1D8: .4byte gUnknown_085AAB30
.L0804D1DC: .4byte gUnknown_085AAB40

	THUMB_FUNC_END func_0804D01C

	THUMB_FUNC_START func_0804D1E0
func_0804D1E0: @ 0x0804D1E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov sl, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r4, .L0804D248  @ gUnknown_085AAB48
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r7, #0
	bl SpawnProc
	adds r1, r0, #0
	mov r2, r9
	str r2, [r1, #0x2c]
	mov r0, sl
	str r0, [r1, #0x30]
	lsls r0, r5, #1
	subs r0, #2
	str r0, [r1, #0x34]
	adds r0, r1, #0
	adds r0, #0x3c
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r6, [r1, #0x3e]
	adds r0, #3
	strh r6, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D248: .4byte gUnknown_085AAB48

	THUMB_FUNC_END func_0804D1E0

	THUMB_FUNC_START func_0804D24C
func_0804D24C: @ 0x0804D24C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, .L0804D2A0  @ gUnknown_085AAB48
	bl FindProc
	adds r6, r0, #0
	cmp r6, #0
	beq .L0804D298
	adds r5, r6, #0
	adds r5, #0x3c
	strb r7, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	ldr r4, [r6, #0x34]
	muls r0, r4, r0
	lsls r0, r0, #3
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
.L0804D298:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D2A0: .4byte gUnknown_085AAB48

	THUMB_FUNC_END func_0804D24C

	THUMB_FUNC_START func_0804D2A4
func_0804D2A4: @ 0x0804D2A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x30
	mov r1, sp
	ldr r0, .L0804D348  @ gUnknown_080DA20C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r6, sp, #0x10
	adds r1, r6, #0
	ldr r0, .L0804D34C  @ gUnknown_080DA21C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r0, sp, #0x20
	mov r8, r0
	mov r1, r8
	ldr r0, .L0804D350  @ gUnknown_080DA22C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L0804D354  @ gUnknown_0859F020
	ldr r1, .L0804D358  @ 0x06014000
	bl Decompress
	ldr r0, .L0804D35C  @ gUnknown_085A06D8
	ldr r1, .L0804D360  @ 0x06002000
	bl Decompress
	ldr r0, .L0804D364  @ gUnknown_085AE7EC
	ldr r1, .L0804D368  @ 0x06002800
	bl Decompress
	ldr r5, .L0804D36C  @ gPlaySt
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	ldr r4, .L0804D370  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r1, .L0804D374  @ 0x06002980
	adds r0, r4, #0
	movs r2, #3
	movs r3, #3
	bl CopyTileGfxForObj
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	adds r6, r6, r0
	ldr r0, [r6]
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	add r8, r0
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, .L0804D378  @ gUnknown_03001860
	ldrb r0, [r5, #0xf]
	str r0, [r1]
	movs r0, #0
	strb r0, [r5, #0xf]
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D348: .4byte gUnknown_080DA20C
.L0804D34C: .4byte gUnknown_080DA21C
.L0804D350: .4byte gUnknown_080DA22C
.L0804D354: .4byte gUnknown_0859F020
.L0804D358: .4byte 0x06014000
.L0804D35C: .4byte gUnknown_085A06D8
.L0804D360: .4byte 0x06002000
.L0804D364: .4byte gUnknown_085AE7EC
.L0804D368: .4byte 0x06002800
.L0804D36C: .4byte gPlaySt
.L0804D370: .4byte gBuf
.L0804D374: .4byte 0x06002980
.L0804D378: .4byte gUnknown_03001860

	THUMB_FUNC_END func_0804D2A4

	THUMB_FUNC_START func_0804D37C
func_0804D37C: @ 0x0804D37C
	push {r4, lr}
	ldr r1, .L0804D3D0  @ gPlaySt
	ldr r0, .L0804D3D4  @ gUnknown_03001860
	ldr r0, [r0]
	strb r0, [r1, #0xf]
	ldr r4, .L0804D3D8  @ gDispIo
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
	bl SetBlendNone
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D3D0: .4byte gPlaySt
.L0804D3D4: .4byte gUnknown_03001860
.L0804D3D8: .4byte gDispIo

	THUMB_FUNC_END func_0804D37C

	THUMB_FUNC_START func_0804D3DC
func_0804D3DC: @ 0x0804D3DC
	push {lr}
	ldr r1, .L0804D3EC  @ gMpi_MapBgm
	movs r0, #0x34
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0
.L0804D3EC: .4byte gMpi_MapBgm

	THUMB_FUNC_END func_0804D3DC

	THUMB_FUNC_START func_0804D3F0
func_0804D3F0: @ 0x0804D3F0
	push {lr}
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, #0
	beq .L0804D408
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
.L0804D408:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804D3F0

	THUMB_FUNC_START func_0804D40C
func_0804D40C: @ 0x0804D40C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
.L0804D412:
	adds r0, r5, #0
	adds r1, r4, #0
	bl func_0804D3F0
	adds r4, #1
	cmp r4, #4
	ble .L0804D412
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804D40C

	THUMB_FUNC_START func_0804D428
func_0804D428: @ 0x0804D428
	push {r4, r5, r6, lr}
	ldr r5, .L0804D46C  @ gUnknown_085ADE08
	ldr r0, .L0804D470  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804D466
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, .L0804D474  @ gPal
	movs r4, #0xf
	ldr r6, .L0804D478  @ 0x00000322
	adds r3, r0, r6
.L0804D44E:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble .L0804D44E
	bl EnablePalSync
.L0804D466:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D46C: .4byte gUnknown_085ADE08
.L0804D470: .4byte gUnknown_0203DDDC
.L0804D474: .4byte gPal
.L0804D478: .4byte 0x00000322

	THUMB_FUNC_END func_0804D428

	THUMB_FUNC_START func_0804D47C
func_0804D47C: @ 0x0804D47C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov r9, r0
	movs r1, #0
	str r1, [sp, #4]
	mov sl, r1
.L0804D494:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	movs r0, #0xf
	mov r4, r9
	ands r0, r4
	lsls r0, r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, .L0804D648  @ gUnknown_085AAA50
	bl PutSprite
	ldr r4, .L0804D64C  @ gSinLut+0x80
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r2, .L0804D650  @ gSinLut
	movs r3, #0
	ldrsh r0, [r2, r3]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r4, .L0804D650  @ gSinLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, .L0804D64C  @ gSinLut+0x80
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [r7, #0x38]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq .L0804D5BE
	adds r3, r7, #0
	adds r3, #0x3c
	cmp r1, r9
	beq .L0804D544
	mov r4, sl
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	bls .L0804D53E
	subs r0, #8
	strh r0, [r1]
.L0804D53E:
	ldr r0, [r7, #0x38]
	cmp r0, r9
	bne .L0804D556
.L0804D544:
	mov r4, sl
	adds r2, r3, r4
	ldrh r1, [r2]
	ldr r0, .L0804D654  @ 0x0000014F
	cmp r1, r0
	bhi .L0804D556
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r2]
.L0804D556:
	ldr r1, .L0804D64C  @ gSinLut+0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	add r3, sl
	mov r8, r3
	ldrh r1, [r3]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r3, .L0804D650  @ gSinLut
	movs r4, #0
	ldrsh r0, [r3, r4]
	negs r0, r0
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r3, .L0804D650  @ gSinLut
	movs r4, #0
	ldrsh r0, [r3, r4]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, .L0804D64C  @ gSinLut+0x80
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
.L0804D5BE:
	ldr r1, [r7, #0x2c]
	subs r1, #0x30
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	ldr r3, .L0804D658  @ gUnknown_085AABB8
	mov r4, r9
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [sp, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	movs r1, #2
	add sl, r1
	movs r2, #1
	add r9, r2
	mov r3, r9
	cmp r3, #3
	bgt .L0804D5F2
	b .L0804D494
.L0804D5F2:
	ldr r2, [r7, #0x34]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	beq .L0804D636
	ldr r1, [r7, #0x2c]
	subs r1, #0x48
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #8
	ldr r3, .L0804D65C  @ gUnknown_080DA25C
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, #0x48
	ldr r2, [r7, #0x34]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #0x12
	ldr r3, .L0804D660  @ gUnknown_080DA26A
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	bl func_0804D428
.L0804D636:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D648: .4byte gUnknown_085AAA50
.L0804D64C: .4byte gSinLut+0x80
.L0804D650: .4byte gSinLut
.L0804D654: .4byte 0x0000014F
.L0804D658: .4byte gUnknown_085AABB8
.L0804D65C: .4byte gUnknown_080DA25C
.L0804D660: .4byte gUnknown_080DA26A

	THUMB_FUNC_END func_0804D47C

	THUMB_FUNC_START func_0804D664
func_0804D664: @ 0x0804D664
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, .L0804D6B0  @ gUnknown_085AABC8
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	adds r1, r0, #0
	str r6, [r1, #0x2c]
	mov r0, r8
	str r0, [r1, #0x30]
	movs r0, #1
	negs r0, r0
	str r0, [r1, #0x34]
	str r0, [r1, #0x38]
	movs r3, #0x80
	lsls r3, r3, #1
	movs r2, #3
	adds r0, r1, #0
	adds r0, #0x42
.L0804D69A:
	strh r3, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge .L0804D69A
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0804D6B0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END func_0804D664

	THUMB_FUNC_START func_0804D6B4
func_0804D6B4: @ 0x0804D6B4
	push {lr}
	ldr r0, .L0804D6C0  @ gUnknown_085AABC8
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L0804D6C0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END func_0804D6B4

	THUMB_FUNC_START func_0804D6C4
func_0804D6C4: @ 0x0804D6C4
	push {lr}
	ldr r0, .L0804D6D0  @ gUnknown_085AABC8
	bl FindProc
	pop {r1}
	bx r1
	.align 2, 0
.L0804D6D0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END func_0804D6C4

	THUMB_FUNC_START func_0804D6D4
func_0804D6D4: @ 0x0804D6D4
	push {r4, r5, lr}
	ldr r5, .L0804D718  @ gUnknown_085ADE08
	ldr r0, .L0804D71C  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804D712
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, .L0804D720  @ gPal
	movs r4, #0xf
	adds r3, r0, #0
	adds r3, #0x42
.L0804D6FA:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble .L0804D6FA
	bl EnablePalSync
.L0804D712:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D718: .4byte gUnknown_085ADE08
.L0804D71C: .4byte gUnknown_0203DDDC
.L0804D720: .4byte gPal

	THUMB_FUNC_END func_0804D6D4

	THUMB_FUNC_START func_0804D724
func_0804D724: @ 0x0804D724
	push {r4, r5, r6, lr}
	ldr r5, .L0804D768  @ gUnknown_085ADE08
	ldr r0, .L0804D76C  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne .L0804D762
	bl GetGameTime
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, .L0804D770  @ gPal
	movs r4, #0xf
	ldr r6, .L0804D774  @ 0x00000262
	adds r3, r0, r6
.L0804D74A:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble .L0804D74A
	bl EnablePalSync
.L0804D762:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D768: .4byte gUnknown_085ADE08
.L0804D76C: .4byte gUnknown_0203DDDC
.L0804D770: .4byte gPal
.L0804D774: .4byte 0x00000262

	THUMB_FUNC_END func_0804D724

	THUMB_FUNC_START func_0804D778
func_0804D778: @ 0x0804D778
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #8
	movs r2, #0xc
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
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804D778

	THUMB_FUNC_START func_0804D7B0
func_0804D7B0: @ 0x0804D7B0
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, [r1, #0x30]
	adds r0, r2, #0
	subs r0, #0x1f
	cmp r0, #0x79
	bhi .L0804D7D2
	ldr r1, [r1, #0x2c]
	ldr r3, .L0804D7D8  @ gUnknown_080DA27E
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl func_0804D724
.L0804D7D2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L0804D7D8: .4byte gUnknown_080DA27E

	THUMB_FUNC_END func_0804D7B0

	THUMB_FUNC_START func_0804D7DC
func_0804D7DC: @ 0x0804D7DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, .L0804D808  @ gUnknown_085AABD8
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0804D808: .4byte gUnknown_085AABD8

	THUMB_FUNC_END func_0804D7DC

	THUMB_FUNC_START func_0804D80C
func_0804D80C: @ 0x0804D80C
	push {lr}
	ldr r0, .L0804D828  @ gUnknown_08A1DD0C
	ldr r1, .L0804D82C  @ 0x06016800
	bl Decompress
	ldr r0, .L0804D830  @ gUnknown_08A1E0D8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L0804D828: .4byte gUnknown_08A1DD0C
.L0804D82C: .4byte 0x06016800
.L0804D830: .4byte gUnknown_08A1E0D8

	THUMB_FUNC_END func_0804D80C

	THUMB_FUNC_START func_0804D834
func_0804D834: @ 0x0804D834
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, .L0804D854  @ gUnknown_080DA2B0
	movs r0, #0x9d
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804D854: .4byte gUnknown_080DA2B0

	THUMB_FUNC_END func_0804D834

	THUMB_FUNC_START func_0804D858
func_0804D858: @ 0x0804D858
	push {r4, r5, lr}
	ldr r5, .L0804D884  @ gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L0804D89A
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble .L0804D888
	movs r0, #2
	b .L0804D89C
	.align 2, 0
.L0804D884: .4byte gActiveUnit
.L0804D888:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0804D89A
	movs r0, #1
	b .L0804D89C
.L0804D89A:
	movs r0, #3
.L0804D89C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804D858

	THUMB_FUNC_START func_0804D8A4
func_0804D8A4: @ 0x0804D8A4
	push {lr}
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq .L0804D8C0
	ldr r0, .L0804D8BC  @ gUnknown_0203DD90
	adds r1, #0x3c
	ldrb r1, [r1]
	strb r1, [r0, #7]
	movs r0, #0x84
	b .L0804D8C2
	.align 2, 0
.L0804D8BC: .4byte gUnknown_0203DD90
.L0804D8C0:
	movs r0, #8
.L0804D8C2:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804D8A4

	THUMB_FUNC_START func_0804D8C8
func_0804D8C8: @ 0x0804D8C8
	ldr r2, .L0804D8D8  @ gUnknown_0203DD90
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r2, #6]
	movs r0, #0x17
	bx lr
	.align 2, 0
.L0804D8D8: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804D8C8

	THUMB_FUNC_START func_0804D8DC
func_0804D8DC: @ 0x0804D8DC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, .L0804D938  @ gActiveUnit
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	adds r1, r6, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	bl GetItemMinRange
	cmp r0, #2
	ble .L0804D90A
	movs r5, #0
.L0804D90A:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r1, [r4, r5]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, .L0804D93C  @ gBg0Tm
	adds r3, r3, r1
	adds r1, r6, #0
	bl PutItemMenuLine
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0804D938: .4byte gActiveUnit
.L0804D93C: .4byte gBg0Tm

	THUMB_FUNC_END func_0804D8DC

	THUMB_FUNC_START func_0804D940
func_0804D940: @ 0x0804D940
	ldr r1, .L0804D94C  @ gUnknown_0203DD90
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #0x1b
	bx lr
	.align 2, 0
.L0804D94C: .4byte gUnknown_0203DD90

	THUMB_FUNC_END func_0804D940

	THUMB_FUNC_START func_0804D950
func_0804D950: @ 0x0804D950
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r1, .L0804D9B8  @ gUnknown_0203DD90
	movs r0, #0
	strb r0, [r1, #6]
	adds r7, r2, #0
	adds r7, #0x2d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x2c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L0804D9BC  @ gBg0Tm
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x2e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x2f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, .L0804D9C0  @ gBg1Tm
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0804D9B8: .4byte gUnknown_0203DD90
.L0804D9BC: .4byte gBg0Tm
.L0804D9C0: .4byte gBg1Tm

	THUMB_FUNC_END func_0804D950

	THUMB_FUNC_START func_0804D9C4
func_0804D9C4: @ 0x0804D9C4
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, .L0804D9F0  @ 0x04000134
	strh r1, [r0]
	ldr r2, .L0804D9F4  @ 0x04000128
	ldr r3, .L0804D9F8  @ 0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, .L0804D9FC  @ 0x0400012A
	strh r1, [r0]
	bx lr
	.align 2, 0
.L0804D9F0: .4byte 0x04000134
.L0804D9F4: .4byte 0x04000128
.L0804D9F8: .4byte 0x00002003
.L0804D9FC: .4byte 0x0400012A

	THUMB_FUNC_END func_0804D9C4

	THUMB_FUNC_START func_0804DA00
func_0804DA00: @ 0x0804DA00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl func_0804DF24
	cmp r0, #0
	beq .L0804DA16
	b .L0804DDDE
.L0804DA16:
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls .L0804DA2A
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b .L0804DDDE
.L0804DA2A:
	adds r1, r7, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq .L0804DA54
	movs r0, #0
	strb r0, [r1]
	ldr r0, .L0804DA50  @ 0x04000128
	ldrh r0, [r0]
	movs r5, #0xfc
	ands r5, r0
	cmp r5, #8
	beq .L0804DA54
	adds r0, r7, #0
	bl func_0804D9C4
	movs r0, #8
	eors r0, r5
	b .L0804DDE0
	.align 2, 0
.L0804DA50: .4byte 0x04000128
.L0804DA54:
	ldrb r0, [r7, #0x18]
	cmp r0, #0xdf
	bls .L0804DAA6
	adds r0, r7, #0
	bl func_0804DF38
	adds r5, r0, #0
	cmp r5, #0
	beq .L0804DA68
	b .L0804DDE0
.L0804DA68:
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0804DA84
	ldrb r0, [r7, #0x18]
	cmp r0, #0xe1
	bls .L0804DA84
	adds r0, r7, #0
	bl func_0804DF24
	cmp r0, #0
	bne .L0804DA84
	b .L0804DDCE
.L0804DA84:
	adds r0, r7, #0
	bl func_0804DF24
	cmp r0, #0
	beq .L0804DA90
	b .L0804DDDE
.L0804DA90:
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	bne .L0804DAA0
	adds r0, r7, #0
	bl func_0804D9C4
	movs r0, #0x71
	b .L0804DDE0
.L0804DAA0:
	subs r0, #1
	strh r0, [r7, #0x16]
	b .L0804DDDE
.L0804DAA6:
	ldrb r0, [r7, #0x18]
	cmp r0, #2
	bne .L0804DAAE
	b .L0804DBE4
.L0804DAAE:
	cmp r0, #2
	bgt .L0804DABC
	cmp r0, #0
	beq .L0804DACA
	cmp r0, #1
	beq .L0804DB86
	b .L0804DD1C
.L0804DABC:
	cmp r0, #0xd0
	bne .L0804DAC2
	b .L0804DC30
.L0804DAC2:
	cmp r0, #0xd1
	bne .L0804DAC8
	b .L0804DCCA
.L0804DAC8:
	b .L0804DD1C
.L0804DACA:
	movs r3, #0xe
	movs r5, #3
	ldr r0, .L0804DB10  @ 0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, .L0804DB14  @ 0x0000FFFF
	ldrb r2, [r7, #0x1e]
	adds r6, r2, #0
	cmp r1, r0
	bne .L0804DAF2
	adds r4, r1, #0
	ldr r1, .L0804DB18  @ 0x04000126
.L0804DAE2:
	asrs r3, r3, #1
	subs r1, #2
	subs r5, #1
	cmp r5, #0
	beq .L0804DAF2
	ldrh r0, [r1]
	cmp r0, r4
	beq .L0804DAE2
.L0804DAF2:
	movs r0, #0xe
	ands r3, r0
	strb r3, [r7, #0x1d]
	movs r5, #3
	ldr r0, .L0804DB10  @ 0x04000120
	ldrh r0, [r0, #6]
	adds r4, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804DB20
	ldr r0, .L0804DB1C  @ 0x00007208
	b .L0804DB46
	.align 2, 0
.L0804DB10: .4byte 0x04000120
.L0804DB14: .4byte 0x0000FFFF
.L0804DB18: .4byte 0x04000126
.L0804DB1C: .4byte 0x00007208
.L0804DB20:
	subs r5, #1
	cmp r5, #0
	beq .L0804DB4C
	lsls r0, r5, #1
	ldr r1, .L0804DB74  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	adds r0, r2, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804DB20
	adds r0, r1, #0
	lsls r0, r5
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
.L0804DB46:
	cmp r4, r0
	beq .L0804DB20
	movs r3, #0
.L0804DB4C:
	adds r0, r3, #0
	ands r0, r6
	strb r0, [r7, #0x1e]
	cmp r3, #0
	bne .L0804DB5C
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
.L0804DB5C:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0804DB78
	ldrb r0, [r7, #0x1d]
	ldrb r2, [r7, #0x1e]
	cmp r0, r2
	beq .L0804DB7E
	adds r0, r7, #0
	bl func_0804DE3C
	b .L0804DB86
	.align 2, 0
.L0804DB74: .4byte 0x04000120
.L0804DB78:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
.L0804DB7E:
	ldrb r1, [r7, #0x1e]
	movs r2, #0xc4
	lsls r2, r2, #7
	b .L0804DC86
.L0804DB86:
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r5, #3
	mov ip, r1
	ldr r3, .L0804DBDC  @ gUnknown_03001864
.L0804DB94:
	lsls r0, r5, #1
	ldr r2, .L0804DBE0  @ 0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r0, r4, #8
	subs r2, r5, #1
	cmp r0, #0x72
	bne .L0804DBBE
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r4, [r0]
	movs r0, #0xff
	ands r4, r0
	movs r0, #1
	lsls r0, r5
	cmp r4, r0
	bne .L0804DBBE
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
.L0804DBBE:
	adds r5, r2, #0
	cmp r5, #0
	bne .L0804DB94
	ldrb r0, [r7, #0x1d]
	mov r1, ip
	ldrb r1, [r1]
	cmp r0, r1
	bne .L0804DB7E
	movs r0, #2
	strb r0, [r7, #0x18]
	mov r2, ip
	ldrb r1, [r2]
	movs r2, #0xc2
	lsls r2, r2, #7
	b .L0804DC86
	.align 2, 0
.L0804DBDC: .4byte gUnknown_03001864
.L0804DBE0: .4byte 0x04000120
.L0804DBE4:
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	mov r4, ip
	movs r6, #1
	ldr r1, .L0804DC28  @ gUnknown_03001864
	mov r9, r1
	ldr r2, .L0804DC2C  @ 0x04000120
	mov r8, r2
.L0804DBF8:
	ldrb r3, [r4]
	adds r0, r3, #0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, #1
	cmp r0, #0
	beq .L0804DC1E
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, r9
	ldrh r0, [r0]
	cmp r1, r0
	beq .L0804DC1E
	adds r0, r6, #0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
.L0804DC1E:
	adds r5, r2, #0
	cmp r5, #0
	bne .L0804DBF8
	b .L0804DD84
	.align 2, 0
.L0804DC28: .4byte gUnknown_03001864
.L0804DC2C: .4byte 0x04000120
.L0804DC30:
	movs r3, #1
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	adds r6, r7, #0
	adds r6, #0x19
	ldr r1, .L0804DC94  @ gUnknown_03001864
	mov r8, r1
.L0804DC42:
	lsls r0, r5, #1
	ldr r2, .L0804DC98  @ 0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	subs r2, r5, #1
	adds r0, r6, r2
	strb r4, [r0]
	mov r0, ip
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq .L0804DC76
	asrs r0, r4, #8
	subs r0, #0x72
	cmp r0, #1
	bls .L0804DC6A
	b .L0804DDD4
.L0804DC6A:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r4, r0
	bne .L0804DC76
	movs r3, #0
.L0804DC76:
	adds r5, r2, #0
	cmp r5, #0
	bne .L0804DC42
	cmp r3, #0
	bne .L0804DC9C
	ldrb r1, [r7, #0x1c]
	movs r2, #0xc6
	lsls r2, r2, #7
.L0804DC86:
	adds r0, r2, #0
	orrs r1, r0
	adds r0, r7, #0
	bl func_0804DDF0
	b .L0804DDE0
	.align 2, 0
.L0804DC94: .4byte gUnknown_03001864
.L0804DC98: .4byte 0x04000120
.L0804DC9C:
	movs r0, #0xd1
	strb r0, [r7, #0x18]
	movs r3, #0x11
	movs r5, #3
	adds r1, r6, #2
.L0804DCA6:
	ldrb r0, [r1]
	adds r3, r3, r0
	subs r1, #1
	subs r5, #1
	cmp r5, #0
	bne .L0804DCA6
	strb r3, [r7, #0x14]
	movs r0, #0xff
	ands r3, r0
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r7, #0
	adds r1, r3, #0
	bl func_0804DDF0
	b .L0804DDE0
.L0804DCCA:
	movs r5, #3
	movs r2, #0x49
	ldrb r1, [r2, r7]
	ldr r2, .L0804DD08  @ 0x04000126
	movs r3, #1
.L0804DCD4:
	ldrh r0, [r2]
	adds r4, r0, #0
	adds r0, r1, #0
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	beq .L0804DCE8
	asrs r0, r4, #8
	cmp r0, #0x73
	bne .L0804DDD4
.L0804DCE8:
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bne .L0804DCD4
	adds r0, r7, #0
	bl MultiBoot
	adds r5, r0, #0
	cmp r5, #0
	bne .L0804DD0C
	movs r0, #0xe0
	strb r0, [r7, #0x18]
	adds r0, #0xb0
	strh r0, [r7, #0x16]
	b .L0804DDDE
	.align 2, 0
.L0804DD08: .4byte 0x04000126
.L0804DD0C:
	adds r0, r7, #0
	bl func_0804D9C4
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b .L0804DDE0
.L0804DD1C:
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	mov r8, ip
	movs r0, #1
	mov r9, r0
.L0804DD2A:
	mov r1, r8
	ldrb r6, [r1]
	adds r0, r6, #0
	asrs r0, r5
	mov r2, r9
	ands r0, r2
	cmp r0, #0
	beq .L0804DD64
	lsls r0, r5, #1
	ldr r1, .L0804DD80  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r2, r4, #8
	ldrb r0, [r7, #0x18]
	lsrs r0, r0, #1
	movs r1, #0x62
	subs r1, r1, r0
	mov r3, r9
	lsls r3, r5
	cmp r2, r1
	bne .L0804DD5E
	movs r0, #0xff
	ands r4, r0
	cmp r4, r3
	beq .L0804DD64
.L0804DD5E:
	eors r6, r3
	mov r2, r8
	strb r6, [r2]
.L0804DD64:
	subs r5, #1
	cmp r5, #0
	bne .L0804DD2A
	ldrb r0, [r7, #0x18]
	cmp r0, #0xc4
	bne .L0804DD84
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	strb r0, [r7, #0x1e]
	strb r5, [r7, #0x18]
	b .L0804DB7E
	.align 2, 0
.L0804DD80: .4byte 0x04000120
.L0804DD84:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne .L0804DD96
	adds r0, r7, #0
	bl func_0804D9C4
	movs r0, #0x50
	b .L0804DDE0
.L0804DD96:
	ldrb r0, [r7, #0x18]
	adds r0, #2
	strb r0, [r7, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne .L0804DDA6
	b .L0804DB7E
.L0804DDA6:
	ldrb r0, [r7, #0x18]
	ldr r1, [r7, #0x28]
	adds r0, r0, r1
	subs r1, r0, #3
	ldrb r2, [r1]
	lsls r2, r2, #8
	subs r0, #4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, #0
	bl func_0804DDF0
	adds r5, r0, #0
	cmp r5, #0
	bne .L0804DDE0
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne .L0804DDDE
.L0804DDCE:
	bl func_0804E03C
	b .L0804DA2A
.L0804DDD4:
	adds r0, r7, #0
	bl func_0804D9C4
	movs r0, #0x60
	b .L0804DDE0
.L0804DDDE:
	movs r0, #0
.L0804DDE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804DA00

	THUMB_FUNC_START func_0804DDF0
func_0804DDF0: @ 0x0804DDF0
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, .L0804DE1C  @ 0x04000128
	ldrh r0, [r3]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne .L0804DE28
	ldr r0, .L0804DE20  @ 0x0400012A
	strh r1, [r0]
	ldr r1, .L0804DE24  @ 0x00002083
	adds r0, r1, #0
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b .L0804DE34
	.align 2, 0
.L0804DE1C: .4byte 0x04000128
.L0804DE20: .4byte 0x0400012A
.L0804DE24: .4byte 0x00002083
.L0804DE28:
	adds r0, r2, #0
	bl func_0804D9C4
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
.L0804DE34:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804DDF0

	THUMB_FUNC_START func_0804DE3C
func_0804DE3C: @ 0x0804DE3C
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq .L0804DE4E
	adds r0, r1, #0
	bl func_0804D9C4
	b .L0804DE5A
.L0804DE4E:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
.L0804DE5A:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804DE3C

	THUMB_FUNC_START func_0804DE60
func_0804DE60: @ 0x0804DE60
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne .L0804DE9A
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq .L0804DE9A
	adds r0, r5, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0804DE9A
	str r6, [r5, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	negs r0, r0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, .L0804DEA4  @ 0x0003FF00
	cmp r1, r0
	bls .L0804DEA8
.L0804DE9A:
	adds r0, r5, #0
	bl func_0804D9C4
	b .L0804DF1C
	.align 2, 0
.L0804DEA4: .4byte 0x0003FF00
.L0804DEA8:
	adds r0, r6, r2
	str r0, [r5, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi .L0804DF08
	lsls r0, r0, #2
	ldr r1, .L0804DEC8  @ .L0804DECC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0804DEC8: .4byte .L0804DECC
.L0804DECC: @ jump table
	.4byte .L0804DEF0 @ case 0
	.4byte .L0804DEF0 @ case 1
	.4byte .L0804DEF0 @ case 2
	.4byte .L0804DEF0 @ case 3
	.4byte .L0804DEFA @ case 4
	.4byte .L0804DF00 @ case 5
	.4byte .L0804DF00 @ case 6
	.4byte .L0804DF00 @ case 7
	.4byte .L0804DF00 @ case 8
.L0804DEF0:
	lsls r4, r3, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b .L0804DF06
.L0804DEFA:
	movs r0, #0x38
	adds r4, r3, #0
	b .L0804DF06
.L0804DF00:
	lsls r4, r3, #3
	asrs r0, r2, #0x18
	subs r0, #1
.L0804DF06:
	orrs r4, r0
.L0804DF08:
	movs r0, #0x3f
	ands r4, r0
	lsls r0, r4, #1
	movs r2, #0x7f
	negs r2, r2
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r5, #0x1c]
	movs r0, #0xd0
	strb r0, [r5, #0x18]
.L0804DF1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0804DE60

	THUMB_FUNC_START func_0804DF24
func_0804DF24: @ 0x0804DF24
	push {lr}
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq .L0804DF30
	movs r0, #0
	b .L0804DF32
.L0804DF30:
	movs r0, #1
.L0804DF32:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804DF24

	THUMB_FUNC_START func_0804DF38
func_0804DF38: @ 0x0804DF38
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq .L0804DF54
	cmp r0, #0xe0
	blt .L0804DF64
	cmp r0, #0xe8
	bgt .L0804DF64
	cmp r0, #0xe7
	blt .L0804DF64
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b .L0804DFC4
.L0804DF54:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b .L0804DFB6
.L0804DF64:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, .L0804DFC0  @ 0x04000126
.L0804DF6C:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq .L0804DF80
	ldr r0, [r3, #4]
	cmp r2, r0
	bne .L0804DF54
.L0804DF80:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne .L0804DF6C
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne .L0804DFAE
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	ldrb r1, [r1]
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3, #4]
	lsls r1, r1, #5
	str r1, [r3]
.L0804DFAE:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
.L0804DFB4:
	ldrh r1, [r3]
.L0804DFB6:
	adds r0, r3, #0
	bl func_0804DDF0
	b .L0804E01C
	.align 2, 0
.L0804DFC0: .4byte 0x04000126
.L0804DFC4:
	lsls r0, r4, #1
	ldr r1, .L0804E00C  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804DFE0
	ldr r0, [r3, #4]
	cmp r2, r0
	bne .L0804E010
.L0804DFE0:
	subs r4, #1
	cmp r4, #0
	bne .L0804DFC4
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq .L0804E01A
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	ldrb r1, [r1]
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3]
	str r1, [r3, #4]
	b .L0804DFB4
	.align 2, 0
.L0804E00C: .4byte 0x04000120
.L0804E010:
	adds r0, r3, #0
	bl func_0804D9C4
	movs r0, #0x71
	b .L0804E01C
.L0804E01A:
	movs r0, #0
.L0804E01C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0804DF38

	THUMB_FUNC_START func_0804E024
func_0804E024: @ 0x0804E024
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq .L0804E036
	movs r1, #0xd
	cmp r2, #8
	beq .L0804E036
	movs r1, #4
.L0804E036:
	subs r0, r0, r1
	bgt .L0804E036
	bx lr

	THUMB_FUNC_END func_0804E024

	THUMB_FUNC_START func_0804E03C
func_0804E03C: @ 0x0804E03C
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, .L0804E070  @ 0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L0804E060
	ldr r5, .L0804E074  @ 0x0000795C
	movs r4, #0x80
.L0804E050:
	adds r2, #1
	cmp r2, r5
	bgt .L0804E060
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne .L0804E050
.L0804E060:
	movs r0, #0x96
	lsls r0, r0, #2
	bl func_0804E024
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804E070: .4byte 0x04000128
.L0804E074: .4byte 0x0000795C

	THUMB_FUNC_END func_0804E03C

.align 2, 0
