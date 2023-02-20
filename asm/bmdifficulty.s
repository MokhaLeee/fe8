	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Difficulty mode stuff and also tower/ruins stuff
	@ May have been separate files

	THUMB_FUNC_START GetCurrentPromotedLevelBonus
GetCurrentPromotedLevelBonus: @ 0x08037B44
	push {lr}
	ldr r0, .L08037B58  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08037B5C
	movs r0, #9
	b .L08037B5E
	.align 2, 0
.L08037B58: .4byte gPlaySt
.L08037B5C:
	movs r0, #0x13
.L08037B5E:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetCurrentPromotedLevelBonus

	THUMB_FUNC_START CanUnitSeize
CanUnitSeize: @ 0x08037B64
	push {lr}
	adds r3, r0, #0
	ldr r0, .L08037B7C  @ gPlaySt
	ldrb r1, [r0, #0x1b]
	cmp r1, #2
	beq .L08037B86
	cmp r1, #2
	bgt .L08037B80
	cmp r1, #1
	beq .L08037B86
	b .L08037B8C
	.align 2, 0
.L08037B7C: .4byte gPlaySt
.L08037B80:
	cmp r1, #3
	beq .L08037B8A
	b .L08037B8C
.L08037B86:
	movs r2, #1
	b .L08037B8C
.L08037B8A:
	movs r2, #0xf
.L08037B8C:
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	bne .L08037B98
	movs r2, #0xf
.L08037B98:
	movs r1, #0
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	cmp r0, r2
	bne .L08037BA4
	movs r1, #1
.L08037BA4:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END CanUnitSeize

	THUMB_FUNC_START func_08037BAC
func_08037BAC: @ 0x08037BAC
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r0, .L08037C34  @ gUnknown_020038C8
	mov ip, r0
	movs r6, #0
	ldr r0, .L08037C38  @ 0x0000FFFF
	adds r7, r0, #0
.L08037BBA:
	movs r4, #0
	adds r3, r6, #0
.L08037BBE:
	mov r0, ip
	adds r1, r3, r0
	movs r2, #7
.L08037BC4:
	ldrh r0, [r1]
	orrs r0, r7
	strh r0, [r1]
	adds r1, #8
	subs r2, #1
	cmp r2, #0
	bge .L08037BC4
	adds r3, #0x40
	adds r4, #1
	cmp r4, #3
	ble .L08037BBE
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r6, r6, r0
	adds r5, #1
	cmp r5, #1
	ble .L08037BBA
	movs r5, #0
	ldr r0, .L08037C34  @ gUnknown_020038C8
	mov ip, r0
	movs r3, #0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r0, .L08037C38  @ 0x0000FFFF
	adds r6, r0, #0
.L08037BF6:
	mov r0, ip
	adds r2, r3, r0
	movs r4, #7
.L08037BFC:
	adds r1, r2, r7
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	adds r2, #8
	subs r4, #1
	cmp r4, #0
	bge .L08037BFC
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r3, r0
	adds r5, #1
	cmp r5, #1
	ble .L08037BF6
	ldr r0, .L08037C38  @ 0x0000FFFF
	adds r2, r0, #0
	ldr r1, .L08037C3C  @ gUnknown_02003B48
	movs r5, #7
.L08037C20:
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r1, #8
	subs r5, #1
	cmp r5, #0
	bge .L08037C20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08037C34: .4byte gUnknown_020038C8
.L08037C38: .4byte 0x0000FFFF
.L08037C3C: .4byte gUnknown_02003B48

	THUMB_FUNC_END func_08037BAC

	THUMB_FUNC_START func_08037C40
func_08037C40: @ 0x08037C40
	ldr r1, .L08037C90  @ gDungeonState
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	strb r0, [r2]
	movs r0, #0
	strh r3, [r1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	ldrb r2, [r1, #4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, #4]
	ldrh r2, [r1, #6]
	movs r0, #7
	ands r0, r2
	strh r0, [r1, #6]
	ldrb r2, [r1, #8]
	movs r0, #8
	negs r0, r0
	ands r0, r2
	strb r0, [r1, #8]
	ldrh r2, [r1, #8]
	ldr r0, .L08037C94  @ 0xFFFFFC07
	ands r0, r2
	strh r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, .L08037C98  @ 0xFFF003FF
	ands r0, r2
	str r0, [r1, #8]
	ldrb r2, [r1, #0xa]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1, #0xa]
	ldr r0, [r1, #4]
	ldr r2, .L08037C9C  @ 0xFFF80001
	ands r0, r2
	str r0, [r1, #4]
	bx lr
	.align 2, 0
.L08037C90: .4byte gDungeonState
.L08037C94: .4byte 0xFFFFFC07
.L08037C98: .4byte 0xFFF003FF
.L08037C9C: .4byte 0xFFF80001

	THUMB_FUNC_END func_08037C40

	THUMB_FUNC_START func_08037CA0
func_08037CA0: @ 0x08037CA0
	push {r4, lr}
	ldr r4, .L08037CF0  @ gDungeonState
	adds r0, r4, #0
	bl func_08037EB0
	ldr r0, .L08037CF4  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L08037CEA
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08037CD0
	ldr r0, [r4, #8]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	cmp r0, #0xc7
	ble .L08037CD0
	movs r0, #0x6b
	bl SetFlag
.L08037CD0:
	ldr r0, .L08037CF0  @ gDungeonState
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08037CEA
	ldr r0, [r4, #8]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	cmp r0, #0xc7
	ble .L08037CEA
	movs r0, #0x6c
	bl SetFlag
.L08037CEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08037CF0: .4byte gDungeonState
.L08037CF4: .4byte gPlaySt

	THUMB_FUNC_END func_08037CA0

	THUMB_FUNC_START func_08037CF8
func_08037CF8: @ 0x08037CF8
	push {r4, lr}
	bl func_08037CA0
	bl func_08037FCC
	ldr r0, .L08037D50  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L08037D4A
	ldr r1, .L08037D54  @ gDungeonState
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #0xc
	adds r4, r0, r1
	cmp r2, #0
	bne .L08037D32
	ldrb r0, [r4, #0xa]
	lsrs r0, r0, #4
	cmp r0, #2
	ble .L08037D32
	movs r0, #0x6f
	bl SetFlag
.L08037D32:
	ldr r0, .L08037D54  @ gDungeonState
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne .L08037D4A
	ldrb r0, [r4, #0xa]
	lsrs r0, r0, #4
	cmp r0, #2
	ble .L08037D4A
	movs r0, #0x70
	bl SetFlag
.L08037D4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08037D50: .4byte gPlaySt
.L08037D54: .4byte gDungeonState

	THUMB_FUNC_END func_08037CF8

	THUMB_FUNC_START func_08037D58
func_08037D58: @ 0x08037D58
	push {lr}
	bl func_08037CA0
	bl func_08038134
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08037D58

	THUMB_FUNC_START PrepScreenProc_AddPostgameUnits
PrepScreenProc_AddPostgameUnits: @ 0x08037D68
	push {r4, r5, r6, lr}
	sub sp, #0x58
	adds r6, r0, #0
	ldr r1, .L08037D88  @ gUnknown_080D8018
	mov r0, sp
	movs r2, #0x58
	bl memcpy
	ldr r0, .L08037D8C  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08037D94
	b .L08037DD2
	.align 2, 0
.L08037D88: .4byte gUnknown_080D8018
.L08037D8C: .4byte gPlaySt
.L08037D90:
	movs r0, #1
	b .L08037DD4
.L08037D94:
	movs r5, #0
	mov r0, sp
	b .L08037DCC
.L08037D9A:
	lsls r4, r5, #3
	mov r1, sp
	adds r0, r1, r4
	ldrh r0, [r0]
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L08037DC2
	add r0, sp, #4
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r6, #0
	bl PrepScreenProc_TryAddUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L08037D90
.L08037DC2:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #3
	add r0, sp
.L08037DCC:
	ldrh r0, [r0]
	cmp r0, #0
	bne .L08037D9A
.L08037DD2:
	movs r0, #0
.L08037DD4:
	add sp, #0x58
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenProc_AddPostgameUnits

	THUMB_FUNC_START PrepScreenProc_TryAddUnit
PrepScreenProc_TryAddUnit: @ 0x08037DDC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4]
	movs r1, #0
	bl GetUnitByPidAndFaction
	cmp r0, #0
	beq .L08037DF2
	movs r0, #0
	b .L08037E02
.L08037DF2:
	adds r0, r4, #0
	bl CreateUnit
	ldrb r1, [r4]
	adds r0, r5, #0
	bl CreateNewUnitPopup
	movs r0, #1
.L08037E02:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenProc_TryAddUnit

	THUMB_FUNC_START func_08037E08
func_08037E08: @ 0x08037E08
	push {r4, r5, lr}
	ldr r3, .L08037E2C  @ gDungeonState
	adds r1, r3, #0
	ldm r1!, {r2, r4, r5}
	stm r0!, {r2, r4, r5}
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r3, #0xb]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xb]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08037E2C: .4byte gDungeonState

	THUMB_FUNC_END func_08037E08

	THUMB_FUNC_START func_08037E30
func_08037E30: @ 0x08037E30
	push {r4, r5, lr}
	ldr r2, .L08037E48  @ gDungeonState
	adds r1, r2, #0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldrb r0, [r2, #0xb]
	lsrs r0, r0, #4
	adds r2, #0x24
	strb r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08037E48: .4byte gDungeonState

	THUMB_FUNC_END func_08037E30

	THUMB_FUNC_START func_08037E4C
func_08037E4C: @ 0x08037E4C
	push {r4, lr}
	ldr r1, .L08037E60  @ gUnknown_030017AC
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08037E60: .4byte gUnknown_030017AC

	THUMB_FUNC_END func_08037E4C

	THUMB_FUNC_START func_08037E64
func_08037E64: @ 0x08037E64
	push {r4, lr}
	ldr r1, .L08037E78  @ gUnknown_030017AC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08037E78: .4byte gUnknown_030017AC

	THUMB_FUNC_END func_08037E64

	THUMB_FUNC_START func_08037E7C
func_08037E7C: @ 0x08037E7C
	push {r4, lr}
	ldr r0, [r0, #4]
	lsls r0, r0, #0xd
	lsrs r4, r0, #0xe
	bl GetGameTime
	ldr r1, .L08037EA8  @ gPlaySt
	ldr r1, [r1, #4]
	subs r0, r0, r1
	movs r1, #0x3c
	bl Div
	adds r4, r4, r0
	ldr r0, .L08037EAC  @ 0x00034BC0
	cmp r4, r0
	ble .L08037E9E
	adds r4, r0, #0
.L08037E9E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08037EA8: .4byte gPlaySt
.L08037EAC: .4byte 0x00034BC0

	THUMB_FUNC_END func_08037E7C

	THUMB_FUNC_START func_08037EB0
func_08037EB0: @ 0x08037EB0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r4, [r6]
	bl BWL_GetTotalExpGained
	ldr r1, .L08037FAC  @ gPlaySt
	ldr r1, [r1, #0x38]
	lsls r1, r1, #4
	lsrs r1, r1, #0xc
	subs r0, r0, r1
	adds r4, r4, r0
	ldr r0, .L08037FB0  @ 0x0000C350
	cmp r4, r0
	ble .L08037ECE
	adds r4, r0, #0
.L08037ECE:
	strh r4, [r6]
	ldrb r4, [r6, #2]
	movs r5, #1
.L08037ED4:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq .L08037EF2
	ldr r0, [r1]
	cmp r0, #0
	beq .L08037EF2
	ldr r0, [r1, #0xc]
	ldr r1, .L08037FB4  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L08037EF2
	adds r4, #1
.L08037EF2:
	adds r5, #1
	cmp r5, #0x3f
	ble .L08037ED4
	strb r4, [r6, #2]
	ldrb r0, [r6, #3]
	ldrb r1, [r6, #4]
	movs r2, #1
	ands r1, r2
	lsls r4, r1, #8
	orrs r4, r0
	ldr r5, .L08037FAC  @ gPlaySt
	ldrh r0, [r5, #0x10]
	adds r4, r4, r0
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	ble .L08037F16
	adds r4, r0, #0
.L08037F16:
	strb r4, [r6, #3]
	lsrs r1, r4, #8
	ands r1, r2
	ldrb r2, [r6, #4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #4]
	adds r0, r6, #0
	bl func_08037E7C
	ldr r1, .L08037FB8  @ 0x0003FFFF
	ands r1, r0
	lsls r1, r1, #1
	ldr r0, [r6, #4]
	ldr r2, .L08037FBC  @ 0xFFF80001
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #4]
	ldrh r3, [r6, #6]
	lsrs r1, r3, #3
	ldrb r0, [r6, #8]
	movs r2, #7
	ands r0, r2
	lsls r0, r0, #0xd
	adds r7, r5, #0
	adds r7, #0x48
	orrs r0, r1
	ldrh r1, [r7]
	adds r4, r0, r1
	ldr r0, .L08037FB0  @ 0x0000C350
	cmp r4, r0
	ble .L08037F5C
	adds r4, r0, #0
.L08037F5C:
	ldr r1, .L08037FC0  @ 0x00001FFF
	ands r1, r4
	lsls r1, r1, #3
	adds r0, r2, #0
	ands r0, r3
	orrs r0, r1
	strh r0, [r6, #6]
	lsrs r1, r4, #0xd
	ands r1, r2
	ldrb r2, [r6, #8]
	movs r0, #8
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #8]
	ldrb r1, [r5, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L08037FA6
	ldr r2, [r6, #8]
	lsls r0, r2, #0xc
	lsrs r0, r0, #0x16
	ldrh r7, [r7]
	adds r4, r0, r7
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r4, r0
	ble .L08037F98
	adds r4, r0, #0
.L08037F98:
	ldr r1, .L08037FC4  @ 0x000003FF
	ands r1, r4
	lsls r1, r1, #0xa
	ldr r0, .L08037FC8  @ 0xFFF003FF
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #8]
.L08037FA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08037FAC: .4byte gPlaySt
.L08037FB0: .4byte 0x0000C350
.L08037FB4: .4byte 0x0001000C
.L08037FB8: .4byte 0x0003FFFF
.L08037FBC: .4byte 0xFFF80001
.L08037FC0: .4byte 0x00001FFF
.L08037FC4: .4byte 0x000003FF
.L08037FC8: .4byte 0xFFF003FF

	THUMB_FUNC_END func_08037EB0

	THUMB_FUNC_START func_08037FCC
func_08037FCC: @ 0x08037FCC
	push {r4, r5, r6, lr}
	ldr r0, .L08038054  @ gDungeonState
	mov ip, r0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, ip
	adds r1, #0xc
	adds r3, r0, r1
	ldrh r0, [r3, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble .L0803805C
	ldrh r0, [r3]
	mov r1, ip
	ldrh r1, [r1]
	cmp r0, r1
	bcs .L08037FFC
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r3]
.L08037FFC:
	mov r6, ip
	ldrb r0, [r6, #2]
	ldrb r1, [r3, #2]
	cmp r0, r1
	bcs .L08038008
	strb r0, [r3, #2]
.L08038008:
	mov r2, ip
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	movs r4, #1
	ands r0, r4
	lsls r2, r0, #8
	orrs r2, r1
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	ands r0, r4
	lsls r0, r0, #8
	orrs r0, r1
	cmp r2, r0
	bge .L08038036
	strb r2, [r3, #3]
	lsrs r0, r2, #8
	ands r0, r4
	ldrb r2, [r3, #4]
	movs r1, #2
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #4]
.L08038036:
	mov r6, ip
	ldr r0, [r6, #4]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xe
	ldr r2, [r3, #4]
	lsls r0, r2, #0xd
	lsrs r0, r0, #0xe
	cmp r1, r0
	bge .L08038096
	lsls r1, r1, #1
	ldr r0, .L08038058  @ 0xFFF80001
	ands r0, r2
	orrs r0, r1
	b .L08038094
	.align 2, 0
.L08038054: .4byte gDungeonState
.L08038058: .4byte 0xFFF80001
.L0803805C:
	mov r1, ip
	ldrh r0, [r1]
	strh r0, [r3]
	ldrb r0, [r1, #2]
	strb r0, [r3, #2]
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #4]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r0
	strb r0, [r3, #3]
	lsrs r1, r1, #8
	ands r1, r2
	ldrb r2, [r3, #4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #4]
	mov r6, ip
	ldr r2, [r6, #4]
	ldr r0, .L0803811C  @ 0x0007FFFE
	ands r2, r0
	ldr r0, [r3, #4]
	ldr r1, .L08038120  @ 0xFFF80001
	ands r0, r1
	orrs r0, r2
.L08038094:
	str r0, [r3, #4]
.L08038096:
	ldrh r5, [r3, #6]
	lsrs r0, r5, #3
	ldrb r1, [r3, #8]
	movs r4, #7
	ands r1, r4
	lsls r1, r1, #0xd
	orrs r1, r0
	mov r0, ip
	ldrh r2, [r0, #6]
	lsrs r2, r2, #3
	ldrb r0, [r0, #8]
	ands r0, r4
	lsls r0, r0, #0xd
	orrs r0, r2
	adds r2, r1, r0
	ldr r0, .L08038124  @ 0x0000C350
	cmp r2, r0
	ble .L080380BC
	adds r2, r0, #0
.L080380BC:
	ldr r1, .L08038128  @ 0x00001FFF
	ands r1, r2
	lsls r1, r1, #3
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, #6]
	lsrs r1, r2, #0xd
	ands r1, r4
	ldrb r2, [r3, #8]
	movs r0, #8
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	ldrh r2, [r3, #8]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0x63
	bgt .L080380F4
	adds r0, #1
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #3
	ldr r1, .L0803812C  @ 0xFFFFFC07
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #8]
.L080380F4:
	ldr r0, .L08038130  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L08038114
	ldrb r2, [r3, #0xa]
	lsrs r1, r2, #4
	cmp r1, #9
	bgt .L08038114
	adds r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xa]
.L08038114:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0803811C: .4byte 0x0007FFFE
.L08038120: .4byte 0xFFF80001
.L08038124: .4byte 0x0000C350
.L08038128: .4byte 0x00001FFF
.L0803812C: .4byte 0xFFFFFC07
.L08038130: .4byte gPlaySt

	THUMB_FUNC_END func_08037FCC

	THUMB_FUNC_START func_08038134
func_08038134: @ 0x08038134
	push {r4, r5, r6, lr}
	ldr r0, .L080381C8  @ gDungeonState
	mov ip, r0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, ip
	adds r1, #0xc
	adds r3, r0, r1
	ldrh r5, [r3, #6]
	lsrs r0, r5, #3
	ldrb r1, [r3, #8]
	movs r4, #7
	ands r1, r4
	lsls r1, r1, #0xd
	orrs r1, r0
	mov r6, ip
	ldrh r2, [r6, #6]
	lsrs r2, r2, #3
	ldrb r0, [r6, #8]
	ands r0, r4
	lsls r0, r0, #0xd
	orrs r0, r2
	adds r2, r1, r0
	ldr r0, .L080381CC  @ 0x0000C350
	cmp r2, r0
	ble .L08038170
	adds r2, r0, #0
.L08038170:
	ldr r1, .L080381D0  @ 0x00001FFF
	ands r1, r2
	lsls r1, r1, #3
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, #6]
	lsrs r1, r2, #0xd
	ands r1, r4
	ldrb r2, [r3, #8]
	movs r0, #8
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	ldr r0, .L080381D4  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq .L080381C2
	ldr r4, [r3, #8]
	lsls r1, r4, #0xc
	lsrs r1, r1, #0x16
	mov r2, ip
	ldr r0, [r2, #8]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	adds r2, r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble .L080381B4
	adds r2, r0, #0
.L080381B4:
	ldr r1, .L080381D8  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #0xa
	ldr r0, .L080381DC  @ 0xFFF003FF
	ands r0, r4
	orrs r0, r1
	str r0, [r3, #8]
.L080381C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080381C8: .4byte gDungeonState
.L080381CC: .4byte 0x0000C350
.L080381D0: .4byte 0x00001FFF
.L080381D4: .4byte gPlaySt
.L080381D8: .4byte 0x000003FF
.L080381DC: .4byte 0xFFF003FF

	THUMB_FUNC_END func_08038134

	THUMB_FUNC_START func_080381E0
func_080381E0: @ 0x080381E0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L080381F0  @ gUnknown_0859E64C
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L080381F0: .4byte gUnknown_0859E64C

	THUMB_FUNC_END func_080381E0

	THUMB_FUNC_START func_080381F4
func_080381F4: @ 0x080381F4
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08038204  @ gUnknown_0859E6EC
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08038204: .4byte gUnknown_0859E6EC

	THUMB_FUNC_END func_080381F4

	THUMB_FUNC_START PushGlobalTimer
PushGlobalTimer: @ 0x08038208
	push {lr}
	bl GetGameTime
	ldr r1, .L08038218  @ gUnknown_020038C4
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L08038218: .4byte gUnknown_020038C4

	THUMB_FUNC_END PushGlobalTimer

	THUMB_FUNC_START PopGlobalTimer
PopGlobalTimer: @ 0x0803821C
	push {lr}
	ldr r0, .L0803822C  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameTime
	pop {r0}
	bx r0
	.align 2, 0
.L0803822C: .4byte gUnknown_020038C4

	THUMB_FUNC_END PopGlobalTimer

	THUMB_FUNC_START func_08038230
func_08038230: @ 0x08038230
	push {lr}
	movs r0, #0x40
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08038230

	THUMB_FUNC_START func_08038240
func_08038240: @ 0x08038240
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, .L080383F4  @ gUnknown_08A20050
	bl SetupBackgrounds
	ldr r0, .L080383F8  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L080383FC  @ gBg1Tm
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r2, .L08038400  @ gBg2Tm
	mov sl, r2
	mov r0, sl
	movs r1, #0
	bl TmFill
	ldr r4, .L08038404  @ gBg3Tm
	mov r9, r4
	mov r0, r9
	movs r1, #0
	bl TmFill
	ldr r4, .L08038408  @ gDispIo
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r6, #1
	orrs r0, r6
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r5, #2
	orrs r1, r5
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl LoadLegacyUiFrameGraphics
	ldrb r0, [r4, #1]
	orrs r0, r6
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
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
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r4, .L0803840C  @ gUnknown_08A21658
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08038410  @ gUnknown_08A25DCC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl ApplyPaletteExt
	ldr r1, .L08038414  @ gUnknown_08A25ECC
	movs r2, #0x80
	lsls r2, r2, #8
	mov r0, r9
	bl TmApplyTsa_thm
	ldr r4, .L08038418  @ gUnknown_08A26380
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r2, .L0803841C  @ 0x06004C00
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08038420  @ gUnknown_08A268F8
	ldr r4, .L08038424  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r0, .L08038428  @ gUnknown_08A268D8
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, .L0803842C  @ 0x00007260
	mov r0, sl
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r4, .L08038430  @ gUnknown_089A234C
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, .L08038434  @ 0x06004000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, .L08038438  @ gUnknown_089A27B4
	mov r1, r8
	bl Decompress
	ldr r0, .L0803843C  @ gUnknown_089A28E0
	movs r1, #0x40
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r2, #0x88
	lsls r2, r2, #6
	adds r3, r2, #0
	mov r1, r8
	movs r2, #0xa0
	lsls r2, r2, #2
.L080383B2:
	ldrh r4, [r1]
	adds r0, r3, r4
	strh r0, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne .L080383B2
	bl func_08037BAC
	adds r0, r7, #0
	bl func_08038BA4
	movs r0, #0xf
	bl EnableBgSync
	ldr r0, .L08038440  @ gUnknown_0200310C
	bl func_080AB760
	ldr r0, .L08038444  @ gPal
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #8
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080383F4: .4byte gUnknown_08A20050
.L080383F8: .4byte gBg0Tm
.L080383FC: .4byte gBg1Tm
.L08038400: .4byte gBg2Tm
.L08038404: .4byte gBg3Tm
.L08038408: .4byte gDispIo
.L0803840C: .4byte gUnknown_08A21658
.L08038410: .4byte gUnknown_08A25DCC
.L08038414: .4byte gUnknown_08A25ECC
.L08038418: .4byte gUnknown_08A26380
.L0803841C: .4byte 0x06004C00
.L08038420: .4byte gUnknown_08A268F8
.L08038424: .4byte gBuf
.L08038428: .4byte gUnknown_08A268D8
.L0803842C: .4byte 0x00007260
.L08038430: .4byte gUnknown_089A234C
.L08038434: .4byte 0x06004000
.L08038438: .4byte gUnknown_089A27B4
.L0803843C: .4byte gUnknown_089A28E0
.L08038440: .4byte gUnknown_0200310C
.L08038444: .4byte gPal

	THUMB_FUNC_END func_08038240

	THUMB_FUNC_START func_08038448
func_08038448: @ 0x08038448
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	mov r0, sp
	ldr r1, .L08038464  @ gUnknown_080D8070
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	mov r5, sp
	b .L080384A8
	.align 2, 0
.L08038464: .4byte gUnknown_080D8070
.L08038468:
	ldrh r0, [r5]
	bl GetMsg
	adds r4, r0, #0
	bl strlen
	adds r1, r0, #0
	adds r0, r6, #0
	bl InitText
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r6, #0
	adds r1, r4, #0
	bl Text_DrawString
	movs r1, #3
	ldrsb r1, [r5, r1]
	lsls r1, r1, #5
	movs r0, #2
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L080384B8  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
	adds r5, #4
.L080384A8:
	ldrh r0, [r5]
	cmp r0, #0
	bne .L08038468
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080384B8: .4byte gBg0Tm

	THUMB_FUNC_END func_08038448

	THUMB_FUNC_START func_080384BC
func_080384BC: @ 0x080384BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #8]
	movs r4, #0
	cmp r4, r7
	bge .L0803850E
.L080384EE:
	adds r0, r5, #0
	movs r1, #0xa
	bl DivRem
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0xa
	bl Div
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	cmp r4, r7
	blt .L080384EE
.L0803850E:
	movs r0, #0
	mov r8, r0
	subs r4, r7, #1
	cmp r4, #0
	blt .L08038570
	mov r1, r9
	lsls r0, r1, #0x18
	asrs r0, r0, #0x13
	mov r9, r0
	mov r2, sl
	lsls r0, r2, #0x18
	asrs r7, r0, #0x18
.L08038526:
	mov r0, sp
	adds r5, r0, r4
	ldrb r0, [r5]
	cmp r0, #0
	beq .L08038534
	movs r1, #1
	mov r8, r1
.L08038534:
	mov r2, r8
	cmp r2, #0
	bne .L0803853E
	cmp r4, #0
	bne .L08038568
.L0803853E:
	adds r0, r6, #0
	movs r1, #1
	bl InitText
	adds r0, r6, #0
	movs r1, #0
	ldr r2, [sp, #8]
	bl Text_SetParams
	ldrb r1, [r5]
	adds r0, r6, #0
	bl Text_DrawNumber
	subs r1, r7, r4
	add r1, r9
	lsls r1, r1, #1
	ldr r0, .L08038584  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
.L08038568:
	adds r6, #8
	subs r4, #1
	cmp r4, #0
	bge .L08038526
.L08038570:
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08038584: .4byte gBg0Tm

	THUMB_FUNC_END func_080384BC

	THUMB_FUNC_START func_08038588
func_08038588: @ 0x08038588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r9, r4
	movs r4, #0
	cmp r4, r7
	bge .L080385DA
.L080385BA:
	adds r0, r6, #0
	movs r1, #0xa
	bl DivRem
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xa
	bl Div
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r4, #1
	cmp r4, r7
	blt .L080385BA
.L080385DA:
	movs r0, #0
	mov r8, r0
	subs r4, r7, #1
	cmp r4, #0
	blt .L0803864E
	ldr r7, .L08038660  @ 0x0000FFFF
.L080385E6:
	ldrh r0, [r5]
	cmp r0, r7
	beq .L080385F2
	adds r0, r5, #0
	bl ClearText
.L080385F2:
	mov r2, sp
	adds r6, r2, r4
	ldrb r0, [r6]
	cmp r0, #0
	beq .L08038600
	movs r0, #1
	mov r8, r0
.L08038600:
	mov r2, r8
	cmp r2, #0
	bne .L0803860A
	cmp r4, #0
	bne .L08038646
.L0803860A:
	ldrh r0, [r5]
	cmp r0, r7
	bne .L08038618
	adds r0, r5, #0
	movs r1, #1
	bl InitText
.L08038618:
	adds r0, r5, #0
	movs r1, #0
	mov r2, r9
	bl Text_SetParams
	ldrb r1, [r6]
	adds r0, r5, #0
	bl Text_DrawNumber
	mov r0, sl
	lsls r1, r0, #0x18
	asrs r1, r1, #0x13
	ldr r2, [sp, #8]
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L08038664  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
.L08038646:
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L080385E6
.L0803864E:
	adds r0, r5, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08038660: .4byte 0x0000FFFF
.L08038664: .4byte gBg0Tm

	THUMB_FUNC_END func_08038588

	THUMB_FUNC_START func_08038668
func_08038668: @ 0x08038668
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	subs r4, r1, #1
	cmp r4, #0
	blt .L0803868C
	ldr r6, .L08038694  @ 0x0000FFFF
.L08038678:
	ldrh r0, [r5]
	cmp r0, r6
	beq .L08038684
	adds r0, r5, #0
	bl ClearText
.L08038684:
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge .L08038678
.L0803868C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08038694: .4byte 0x0000FFFF

	THUMB_FUNC_END func_08038668

	THUMB_FUNC_START func_08038698
func_08038698: @ 0x08038698
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r0, [sp, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r9, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r4, sp
	adds r4, #0xa
	add r1, sp, #0xc
	mov r8, r1
	add r1, sp, #8
	adds r2, r4, #0
	mov r3, r8
	bl FormatTime
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x18
	movs r1, #0xf9
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	cmp r0, #9
	bhi .L080386FC
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r9
	lsls r4, r2, #0x18
	asrs r0, r4, #0x18
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b .L0803871E
.L080386FC:
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r9
	lsls r4, r2, #0x18
	asrs r0, r4, #0x18
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
.L0803871E:
	movs r2, #1
	bl func_080384BC
	adds r6, r0, #0
	str r4, [sp, #0x14]
	lsls r0, r7, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	ldr r2, [sp, #0x14]
	asrs r2, r2, #0x18
	mov r9, r2
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl func_080384BC
	adds r6, r0, #0
	ldr r1, [sp, #0x10]
	lsls r1, r1, #0x18
	mov r8, r1
	asrs r4, r1, #0x18
	movs r0, #0xfb
	lsls r0, r0, #0x18
	add r0, r8
	lsrs r7, r0, #0x18
	ldr r0, .L080387C8  @ 0x0000020D
	bl GetMsg
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl InitText
	adds r0, r6, #0
	movs r1, #2
	mov r2, sl
	bl Text_SetParams
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawCharacter
	mov r2, r9
	lsls r1, r2, #5
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L080387CC  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
	adds r6, #8
	subs r4, #4
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	mov r1, sp
	ldrh r0, [r1, #0xa]
	mov r5, r8
	cmp r0, #9
	bhi .L080387D0
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r9
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b .L080387EE
	.align 2, 0
.L080387C8: .4byte 0x0000020D
.L080387CC: .4byte gBg0Tm
.L080387D0:
	mov r1, sp
	ldrh r0, [r1, #0xa]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r9
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
.L080387EE:
	movs r2, #1
	bl func_080384BC
	adds r6, r0, #0
	lsls r0, r7, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xa]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	ldr r0, [sp, #0x14]
	asrs r0, r0, #0x18
	mov r8, r0
	str r0, [sp]
	mov r2, sl
	str r2, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl func_080384BC
	adds r6, r0, #0
	asrs r4, r5, #0x18
	movs r1, #0xfe
	lsls r1, r1, #0x18
	adds r0, r5, r1
	lsrs r7, r0, #0x18
	ldr r0, .L08038890  @ 0x0000020D
	bl GetMsg
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl InitText
	adds r0, r6, #0
	movs r1, #2
	mov r2, sl
	bl Text_SetParams
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawCharacter
	mov r2, r8
	lsls r1, r2, #5
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L08038894  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
	adds r6, #8
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	mov r1, sp
	ldrh r0, [r1, #0xc]
	cmp r0, #9
	bhi .L08038898
	lsls r4, r7, #0x18
	asrs r3, r4, #0x18
	mov r2, r8
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b .L080388B6
	.align 2, 0
.L08038890: .4byte 0x0000020D
.L08038894: .4byte gBg0Tm
.L08038898:
	mov r1, sp
	ldrh r0, [r1, #0xc]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r7, #0x18
	asrs r3, r4, #0x18
	mov r2, r8
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
.L080388B6:
	movs r2, #1
	bl func_080384BC
	adds r6, r0, #0
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xc]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	ldr r2, [sp, #0x14]
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl func_080384BC
	adds r6, r0, #0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08038698

	THUMB_FUNC_START func_08038900
func_08038900: @ 0x08038900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [sp, #0x34]
	ldr r4, [sp, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x10]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r4, sp
	adds r4, #0xa
	add r5, sp, #0xc
	add r1, sp, #8
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
	mov r1, sl
	lsls r0, r1, #0x18
	movs r2, #0xf9
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	cmp r0, #9
	bhi .L0803896A
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r0, r8
	lsls r4, r0, #0x18
	asrs r0, r4, #0x18
	str r0, [sp]
	mov r1, r9
	str r1, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b .L0803898C
.L0803896A:
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	lsls r4, r2, #0x18
	asrs r0, r4, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
.L0803898C:
	movs r2, #1
	bl func_08038588
	adds r6, r0, #0
	mov r8, r4
	lsls r0, r7, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl func_08038588
	adds r6, r0, #0
	mov r1, sl
	lsls r4, r1, #0x18
	movs r2, #0xfb
	lsls r2, r2, #0x18
	adds r0, r4, r2
	lsrs r7, r0, #0x18
	ldr r0, .L080389EC  @ 0x0000020D
	bl GetMsg
	adds r5, r0, #0
	ldrh r1, [r6]
	ldr r0, .L080389F0  @ 0x0000FFFF
	cmp r1, r0
	beq .L080389F4
	adds r0, r6, #0
	bl ClearText
	b .L080389FC
	.align 2, 0
.L080389EC: .4byte 0x0000020D
.L080389F0: .4byte 0x0000FFFF
.L080389F4:
	adds r0, r6, #0
	movs r1, #1
	bl InitText
.L080389FC:
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x18
	mov sl, r0
	cmp r0, #0
	beq .L08038A2E
	adds r0, r6, #0
	movs r1, #2
	mov r2, r9
	bl Text_SetParams
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawCharacter
	mov r2, r8
	asrs r1, r2, #0x13
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L08038A54  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
.L08038A2E:
	adds r6, #8
	movs r1, #0xfc
	lsls r1, r1, #0x18
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xa]
	cmp r0, #9
	bhi .L08038A58
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r1, r8
	asrs r0, r1, #0x18
	str r0, [sp]
	mov r2, r9
	str r2, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b .L08038A78
	.align 2, 0
.L08038A54: .4byte gBg0Tm
.L08038A58:
	mov r1, sp
	ldrh r0, [r1, #0xa]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
.L08038A78:
	movs r2, #1
	bl func_08038588
	adds r6, r0, #0
	lsls r0, r7, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xa]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl func_08038588
	adds r6, r0, #0
	movs r1, #0xfe
	lsls r1, r1, #0x18
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	ldr r0, .L08038AD4  @ 0x0000020D
	bl GetMsg
	adds r5, r0, #0
	ldrh r1, [r6]
	ldr r0, .L08038AD8  @ 0x0000FFFF
	cmp r1, r0
	beq .L08038ADC
	adds r0, r6, #0
	bl ClearText
	b .L08038AE4
	.align 2, 0
.L08038AD4: .4byte 0x0000020D
.L08038AD8: .4byte 0x0000FFFF
.L08038ADC:
	adds r0, r6, #0
	movs r1, #1
	bl InitText
.L08038AE4:
	mov r2, sl
	cmp r2, #0
	beq .L08038B12
	adds r0, r6, #0
	movs r1, #2
	mov r2, r9
	bl Text_SetParams
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_DrawCharacter
	mov r0, r8
	asrs r1, r0, #0x13
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L08038B38  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
.L08038B12:
	adds r6, #8
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xc]
	cmp r0, #9
	bhi .L08038B3C
	lsls r4, r7, #0x18
	asrs r3, r4, #0x18
	mov r1, r8
	asrs r0, r1, #0x18
	str r0, [sp]
	mov r2, r9
	str r2, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b .L08038B5C
	.align 2, 0
.L08038B38: .4byte gBg0Tm
.L08038B3C:
	mov r1, sp
	ldrh r0, [r1, #0xc]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r7, #0x18
	asrs r3, r4, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
.L08038B5C:
	movs r2, #1
	bl func_08038588
	adds r6, r0, #0
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xc]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl func_08038588
	adds r6, r0, #0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08038900

	THUMB_FUNC_START func_08038BA4
func_08038BA4: @ 0x08038BA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r6, r0, #0
	ldr r4, .L08038E18  @ gDungeonState
	ldr r5, .L08038E1C  @ 0x04000003
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl CpuSet
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r0, r0, r4
	add r1, sp, #0x14
	mov r9, r1
	adds r2, r5, #0
	bl CpuSet
	bl GetGameTime
	adds r4, r0, #0
	ldr r0, .L08038E20  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameTime
	add r0, sp, #8
	bl func_08037EB0
	adds r0, r4, #0
	bl SetGameTime
	bl ResetTextFont
	ldr r4, .L08038E24  @ gUnknown_020038AC
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r2, .L08038E28  @ 0x06000020
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl InitTextFont
	adds r0, r4, #0
	bl SetTextFont
	bl InitSystemTextFont
	adds r0, r6, #0
	bl StartGreenText
	add r0, sp, #0x20
	bl func_08038448
	ldr r0, .L08038E2C  @ gUnknown_02003B70
	mov r3, r9
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x19
	movs r6, #7
	str r6, [sp]
	movs r4, #2
	mov r8, r4
	str r4, [sp, #4]
	movs r2, #3
	movs r3, #0x1a
	bl func_080384BC
	ldr r7, .L08038E30  @ gUnknown_080D7FD0
	ldrb r2, [r7, #4]
	movs r5, #8
	subs r0, r5, r2
	lsls r0, r0, #3
	ldr r1, .L08038E34  @ gUnknown_020038C8
	mov sl, r1
	add r0, sl
	add r1, sp, #8
	ldrh r3, [r1, #6]
	lsrs r3, r3, #3
	ldrb r1, [r1, #8]
	ands r1, r6
	lsls r1, r1, #0xd
	orrs r1, r3
	movs r3, #0
	ldrsb r3, [r7, r3]
	movs r4, #1
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl func_080384BC
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r1, r9
	ldrh r3, [r1, #6]
	lsrs r3, r3, #3
	ldrb r1, [r1, #8]
	ands r1, r6
	lsls r1, r1, #0xd
	orrs r1, r3
	adds r3, r7, #0
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, r7, #0
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl func_080384BC
	ldrb r2, [r7, #0xc]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x40
	adds r0, r0, r1
	add r1, sp, #8
	ldrh r1, [r1]
	movs r3, #8
	ldrsb r3, [r7, r3]
	movs r4, #9
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r6, r8
	str r6, [sp, #4]
	bl func_080384BC
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xc0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r3, r9
	ldrh r1, [r3]
	adds r3, r7, #0
	adds r3, #0x2c
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, r7, #0
	adds r4, #0x2d
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	str r6, [sp, #4]
	bl func_080384BC
	ldrb r2, [r7, #0x14]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x80
	adds r0, r0, r1
	add r1, sp, #8
	ldrb r1, [r1, #2]
	movs r3, #0x10
	ldrsb r3, [r7, r3]
	adds r4, r7, #0
	adds r4, #0x35
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	str r6, [sp, #4]
	bl func_080384BC
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r6, r9
	ldrb r1, [r6, #2]
	adds r3, r7, #0
	adds r3, #0x34
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl func_080384BC
	ldrb r2, [r7, #0x1c]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0xc0
	adds r0, r0, r1
	add r1, sp, #8
	ldrb r3, [r1, #3]
	ldrb r1, [r1, #4]
	movs r6, #1
	ands r1, r6
	lsls r1, r1, #8
	orrs r1, r3
	movs r3, #0x18
	ldrsb r3, [r7, r3]
	movs r4, #0x19
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl func_080384BC
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r2, [r0]
	subs r5, r5, r2
	lsls r5, r5, #3
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sl
	adds r5, r5, r0
	mov r1, r9
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #4]
	ands r1, r6
	lsls r1, r1, #8
	orrs r1, r0
	adds r0, r7, #0
	adds r0, #0x3c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	bl func_080384BC
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [sp, #0xc]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	adds r2, r7, #0
	adds r2, #0x20
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r7, #0
	adds r3, #0x21
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	bl func_08038698
	movs r0, #0x90
	lsls r0, r0, #2
	add r0, sl
	mov r2, r9
	ldr r1, [r2, #4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	adds r2, r7, #0
	adds r2, #0x44
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r7, #0
	adds r3, #0x45
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	bl func_08038698
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08038E18: .4byte gDungeonState
.L08038E1C: .4byte 0x04000003
.L08038E20: .4byte gUnknown_020038C4
.L08038E24: .4byte gUnknown_020038AC
.L08038E28: .4byte 0x06000020
.L08038E2C: .4byte gUnknown_02003B70
.L08038E30: .4byte gUnknown_080D7FD0
.L08038E34: .4byte gUnknown_020038C8

	THUMB_FUNC_END func_08038BA4

	THUMB_FUNC_START func_08038E38
func_08038E38: @ 0x08038E38
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r0, .L08038E94  @ gDungeonState
	ldr r2, .L08038E98  @ 0x04000003
	add r1, sp, #8
	bl CpuSet
	add r0, sp, #8
	bl func_08037E7C
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, .L08038E9C  @ gPlaySt
	ldr r1, [r1, #4]
	subs r0, r0, r1
	movs r1, #0x3c
	bl __umodsi3
	movs r4, #1
	cmp r0, #0x1d
	bls .L08038E66
	movs r4, #0
.L08038E66:
	ldr r0, .L08038EA0  @ gUnknown_020039C8
	ldr r1, .L08038EA4  @ gUnknown_080D7FD0
	adds r2, r1, #0
	adds r2, #0x20
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, #0x21
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r1, #2
	str r1, [sp]
	str r4, [sp, #4]
	adds r1, r5, #0
	bl func_08038900
	movs r0, #1
	bl EnableBgSync
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08038E94: .4byte gDungeonState
.L08038E98: .4byte 0x04000003
.L08038E9C: .4byte gPlaySt
.L08038EA0: .4byte gUnknown_020039C8
.L08038EA4: .4byte gUnknown_080D7FD0

	THUMB_FUNC_END func_08038E38

	THUMB_FUNC_START func_08038EA8
func_08038EA8: @ 0x08038EA8
	push {r4, lr}
	adds r4, r0, #0
	bl func_08038E38
	ldr r0, .L08038ECC  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq .L08038EC4
	adds r0, r4, #0
	bl Proc_Break
.L08038EC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08038ECC: .4byte gKeySt

	THUMB_FUNC_END func_08038EA8

	THUMB_FUNC_START func_08038ED0
func_08038ED0: @ 0x08038ED0
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08038EEC  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq .L08038EE8
	adds r0, r2, #0
	bl Proc_Break
.L08038EE8:
	pop {r0}
	bx r0
	.align 2, 0
.L08038EEC: .4byte gKeySt

	THUMB_FUNC_END func_08038ED0

	THUMB_FUNC_START func_08038EF0
func_08038EF0: @ 0x08038EF0
	push {lr}
	sub sp, #4
	bl func_080AB77C
	bl EndGreenText
	ldr r0, .L08038F5C  @ gBg0Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08038F60  @ gBg1Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08038F64  @ gBg2Tm
	movs r1, #0
	bl TmFill
	ldr r0, .L08038F68  @ gBg3Tm
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	ldr r2, .L08038F6C  @ gDispIo
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	bl ResetText
	movs r0, #0
	str r0, [sp]
	ldr r1, .L08038F70  @ gPal
	ldr r2, .L08038F74  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08038F5C: .4byte gBg0Tm
.L08038F60: .4byte gBg1Tm
.L08038F64: .4byte gBg2Tm
.L08038F68: .4byte gBg3Tm
.L08038F6C: .4byte gDispIo
.L08038F70: .4byte gPal
.L08038F74: .4byte 0x01000100

	THUMB_FUNC_END func_08038EF0

	THUMB_FUNC_START func_08038F78
func_08038F78: @ 0x08038F78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	bl GetBgChrOffset
	str r0, [sp, #8]
	ldr r0, .L08038FC4  @ 0x01000008
	mov sl, r0
	ldr r7, .L08038FC8  @ 0x06012400
	ldr r6, .L08038FCC  @ 0x06012000
	movs r1, #0
	mov r9, r1
	movs r0, #7
	mov r8, r0
.L08038F9E:
	ldrh r0, [r5]
	ldr r1, .L08038FD0  @ 0x0000FFFF
	cmp r0, r1
	bne .L08038FD4
	mov r0, r9
	str r0, [sp]
	mov r0, sp
	adds r1, r6, #0
	mov r2, sl
	bl CpuFastSet
	mov r1, r9
	str r1, [sp, #4]
	add r0, sp, #4
	adds r1, r7, #0
	mov r2, sl
	bl CpuFastSet
	b .L08038FFA
	.align 2, 0
.L08038FC4: .4byte 0x01000008
.L08038FC8: .4byte 0x06012400
.L08038FCC: .4byte 0x06012000
.L08038FD0: .4byte 0x0000FFFF
.L08038FD4:
	ldrh r4, [r5]
	lsls r4, r4, #6
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	ldr r1, [sp, #8]
	adds r4, r1, r4
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #8
	bl CpuFastSet
.L08038FFA:
	adds r5, #8
	adds r7, #0x20
	adds r6, #0x20
	movs r0, #1
	negs r0, r0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge .L08038F9E
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08038F78

	THUMB_FUNC_START func_0803901C
func_0803901C: @ 0x0803901C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r0, [r0, #0x2c]
	lsls r0, r0, #6
	ldr r1, .L080390B8  @ gUnknown_020038C8
	adds r0, r0, r1
	bl func_08038F78
	ldr r1, .L080390BC  @ gUnknown_02003BE8
	movs r2, #0
	movs r0, #2
	strh r0, [r1]
	ldr r0, .L080390C0  @ gUnknown_02003B88
	str r0, [r1, #4]
	ldr r3, .L080390C4  @ gUnknown_02003BA8
	str r3, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	ldr r2, .L080390C8  @ gUnknown_0859E7C8
	ldr r0, .L080390CC  @ gUnknown_0859E7D4
	movs r4, #6
	mov r8, r4
	mov r4, r8
	strh r4, [r1, #2]
	movs r7, #0
	adds r6, r0, #0
	adds r5, r3, #0
.L0803905A:
	lsls r4, r7, #1
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	str r2, [sp]
	bl DivArm
	ldr r1, .L080390C0  @ gUnknown_02003B88
	adds r4, r4, r1
	strh r0, [r4]
	ldr r0, [r6]
	lsls r0, r0, #4
	str r0, [r5]
	ldr r0, [r6, #4]
	lsls r0, r0, #4
	str r0, [r5, #4]
	adds r6, #8
	adds r5, #8
	ldr r2, [sp]
	adds r2, #2
	adds r7, #1
	cmp r7, r8
	blt .L0803905A
	movs r0, #0
	mov r1, r9
	str r0, [r1, #0x34]
	ldr r0, .L080390D0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080390A8
	movs r0, #0x80
	bl m4aSongNumStart
.L080390A8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L080390B8: .4byte gUnknown_020038C8
.L080390BC: .4byte gUnknown_02003BE8
.L080390C0: .4byte gUnknown_02003B88
.L080390C4: .4byte gUnknown_02003BA8
.L080390C8: .4byte gUnknown_0859E7C8
.L080390CC: .4byte gUnknown_0859E7D4
.L080390D0: .4byte gPlaySt

	THUMB_FUNC_END func_0803901C

	THUMB_FUNC_START func_080390D4
func_080390D4: @ 0x080390D4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r1, r0, #1
	str r1, [r5, #0x34]
	cmp r1, #0x2c
	bgt .L08039130
	ldr r0, .L08039120  @ gUnknown_02003BE8
	lsls r1, r1, #0xc
	add r2, sp, #8
	bl func_0800A950
	ldr r1, [sp, #8]
	asrs r1, r1, #4
	ldr r0, .L08039124  @ gUnknown_080D7FD0
	ldr r3, [r5, #0x2c]
	lsls r3, r3, #3
	adds r3, r3, r0
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r2, [sp, #0xc]
	asrs r2, r2, #4
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r0, .L08039128  @ 0x000001FF
	ands r2, r0
	ldr r3, .L0803912C  @ gUnknown_0859E79C
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b .L080391BA
	.align 2, 0
.L08039120: .4byte gUnknown_02003BE8
.L08039124: .4byte gUnknown_080D7FD0
.L08039128: .4byte 0x000001FF
.L0803912C: .4byte gUnknown_0859E79C
.L08039130:
	ldr r4, [r5, #0x2c]
	cmp r4, #4
	bne .L08039164
	ldr r0, .L0803915C  @ gUnknown_02003B08
	ldr r1, [r5, #0x30]
	ldr r3, .L08039160  @ gUnknown_080D7FD0
	adds r2, r3, #0
	adds r2, #0x44
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x45
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	bl func_08038900
	b .L0803919C
	.align 2, 0
.L0803915C: .4byte gUnknown_02003B08
.L08039160: .4byte gUnknown_080D7FD0
.L08039164:
	lsls r0, r4, #6
	ldr r2, .L080391C4  @ gUnknown_080D7FD0
	lsls r1, r4, #3
	adds r4, r1, r2
	adds r1, r4, #0
	adds r1, #0x28
	ldrb r2, [r1]
	movs r1, #8
	subs r1, r1, r2
	lsls r1, r1, #3
	ldr r3, .L080391C8  @ gUnknown_02003A08
	adds r1, r1, r3
	adds r0, r0, r1
	ldrh r1, [r5, #0x30]
	adds r3, r4, #0
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl func_08038588
.L0803919C:
	ldr r0, .L080391CC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080391AE
	movs r0, #0x76
	bl m4aSongNumStart
.L080391AE:
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
.L080391BA:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080391C4: .4byte gUnknown_080D7FD0
.L080391C8: .4byte gUnknown_02003A08
.L080391CC: .4byte gPlaySt

	THUMB_FUNC_END func_080390D4

	THUMB_FUNC_START func_080391D0
func_080391D0: @ 0x080391D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq .L080391E8
	ldr r0, .L080391E4  @ gUnknown_0859E804
	bl SpawnProcLocking
	b .L080391F0
	.align 2, 0
.L080391E4: .4byte gUnknown_0859E804
.L080391E8:
	ldr r0, .L080391FC  @ gUnknown_0859E804
	movs r1, #3
	bl SpawnProc
.L080391F0:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080391FC: .4byte gUnknown_0859E804

	THUMB_FUNC_END func_080391D0

	THUMB_FUNC_START func_08039200
func_08039200: @ 0x08039200
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, .L08039238  @ gDungeonState
	ldr r2, .L0803923C  @ 0x04000003
	mov r1, sp
	bl CpuSet
	bl GetGameTime
	adds r4, r0, #0
	ldr r0, .L08039240  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameTime
	mov r0, sp
	bl func_08037EB0
	adds r0, r4, #0
	bl SetGameTime
	cmp r5, #4
	bhi .L08039292
	lsls r0, r5, #2
	ldr r1, .L08039244  @ .L08039248
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08039238: .4byte gDungeonState
.L0803923C: .4byte 0x04000003
.L08039240: .4byte gUnknown_020038C4
.L08039244: .4byte .L08039248
.L08039248: @ jump table
	.4byte .L0803925C @ case 0
	.4byte .L0803926E @ case 1
	.4byte .L08039274 @ case 2
	.4byte .L0803927A @ case 3
	.4byte .L0803928A @ case 4
.L0803925C:
	mov r0, sp
	ldrh r2, [r0, #6]
	lsrs r2, r2, #3
	ldrb r0, [r0, #8]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xd
	orrs r0, r2
	b .L08039294
.L0803926E:
	mov r0, sp
	ldrh r0, [r0]
	b .L08039294
.L08039274:
	mov r0, sp
	ldrb r0, [r0, #2]
	b .L08039294
.L0803927A:
	mov r0, sp
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r2
	b .L08039294
.L0803928A:
	ldr r0, [sp, #4]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
	b .L08039294
.L08039292:
	movs r0, #0
.L08039294:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08039200

	THUMB_FUNC_START func_0803929C
func_0803929C: @ 0x0803929C
	push {lr}
	cmp r0, #4
	bhi .L08039358
	lsls r0, r0, #2
	ldr r1, .L080392AC  @ .L080392B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080392AC: .4byte .L080392B0
.L080392B0: @ jump table
	.4byte .L080392C4 @ case 0
	.4byte .L080392E8 @ case 1
	.4byte .L08039300 @ case 2
	.4byte .L08039318 @ case 3
	.4byte .L0803933C @ case 4
.L080392C4:
	ldr r2, .L080392E4  @ gDungeonState
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r2, [r0, #0x12]
	lsrs r2, r2, #3
	ldrb r0, [r0, #0x14]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xd
	orrs r0, r2
	b .L0803935A
	.align 2, 0
.L080392E4: .4byte gDungeonState
.L080392E8:
	ldr r2, .L080392FC  @ gDungeonState
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0xc]
	b .L0803935A
	.align 2, 0
.L080392FC: .4byte gDungeonState
.L08039300:
	ldr r2, .L08039314  @ gDungeonState
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	b .L0803935A
	.align 2, 0
.L08039314: .4byte gDungeonState
.L08039318:
	ldr r2, .L08039338  @ gDungeonState
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #0xf]
	ldrb r0, [r0, #0x10]
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r2
	b .L0803935A
	.align 2, 0
.L08039338: .4byte gDungeonState
.L0803933C:
	ldr r2, .L08039354  @ gDungeonState
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
	b .L0803935A
	.align 2, 0
.L08039354: .4byte gDungeonState
.L08039358:
	movs r0, #0
.L0803935A:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0803929C

	THUMB_FUNC_START func_08039360
func_08039360: @ 0x08039360
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, .L080393AC  @ gDungeonState
	ldr r2, .L080393B0  @ 0x04000003
	adds r0, r4, #0
	mov r1, sp
	bl CpuSet
	bl GetGameTime
	adds r5, r0, #0
	ldr r0, .L080393B4  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameTime
	mov r0, sp
	bl func_08037EB0
	adds r0, r5, #0
	bl SetGameTime
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r4, r0, r4
	cmp r6, #4
	bhi .L08039432
	lsls r0, r6, #2
	ldr r1, .L080393B8  @ .L080393BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080393AC: .4byte gDungeonState
.L080393B0: .4byte 0x04000003
.L080393B4: .4byte gUnknown_020038C4
.L080393B8: .4byte .L080393BC
.L080393BC: @ jump table
	.4byte .L080393DA @ case 0
	.4byte .L080393D0 @ case 1
	.4byte .L080393DE @ case 2
	.4byte .L080393F4 @ case 3
	.4byte .L08039418 @ case 4
.L080393D0:
	mov r0, sp
	ldrh r0, [r0]
	ldrh r4, [r4]
	cmp r0, r4
	bls .L08039432
.L080393DA:
	movs r0, #1
	b .L08039434
.L080393DE:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble .L080393DA
	mov r0, sp
	ldrb r0, [r0, #2]
	ldrb r4, [r4, #2]
	cmp r0, r4
	bcs .L08039432
	b .L080393DA
.L080393F4:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble .L080393DA
	mov r0, sp
	ldrb r3, [r0, #3]
	ldrb r1, [r0, #4]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r3
	ldrb r3, [r4, #3]
	ldrb r0, [r4, #4]
	ands r0, r2
	lsls r0, r0, #8
	orrs r0, r3
	b .L0803942E
.L08039418:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble .L080393DA
	ldr r1, [sp, #4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	ldr r0, [r4, #4]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
.L0803942E:
	cmp r1, r0
	blt .L080393DA
.L08039432:
	movs r0, #0
.L08039434:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08039360

	THUMB_FUNC_START func_0803943C
func_0803943C: @ 0x0803943C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08039478  @ gUnknown_02003B48
	bl func_08038F78
	ldr r1, .L0803947C  @ gUnknown_02003BE8
	movs r2, #0
	movs r0, #2
	strh r0, [r1]
	movs r0, #5
	strh r0, [r1, #2]
	ldr r0, .L08039480  @ gUnknown_0859E82C
	str r0, [r1, #4]
	ldr r0, .L08039484  @ gUnknown_0859E838
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r4, #0x38]
	ldr r0, .L08039488  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08039472
	movs r0, #0x80
	bl m4aSongNumStart
.L08039472:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08039478: .4byte gUnknown_02003B48
.L0803947C: .4byte gUnknown_02003BE8
.L08039480: .4byte gUnknown_0859E82C
.L08039484: .4byte gUnknown_0859E838
.L08039488: .4byte gPlaySt

	THUMB_FUNC_END func_0803943C

	THUMB_FUNC_START func_0803948C
func_0803948C: @ 0x0803948C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080394A4  @ gUnknown_02003B48
	movs r1, #8
	bl func_08038668
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080394A4: .4byte gUnknown_02003B48

	THUMB_FUNC_END func_0803948C

	THUMB_FUNC_START func_080394A8
func_080394A8: @ 0x080394A8
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r1, r0, #1
	str r1, [r4, #0x38]
	cmp r1, #0x1d
	bgt .L080394E8
	ldr r0, .L080394E0  @ gUnknown_02003BE8
	lsls r1, r1, #0xc
	add r4, sp, #0x14
	adds r2, r4, #0
	bl func_0800A950
	ldr r1, [sp, #0x14]
	asrs r1, r1, #4
	ldr r2, [r4, #4]
	lsls r2, r2, #0x13
	lsrs r2, r2, #0x17
	ldr r3, .L080394E4  @ gUnknown_0859E79C
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b .L0803953E
	.align 2, 0
.L080394E0: .4byte gUnknown_02003BE8
.L080394E4: .4byte gUnknown_0859E79C
.L080394E8:
	ldr r2, .L08039548  @ gDungeonState
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	add r1, sp, #8
	adds r0, #0xc
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	add r0, sp, #8
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x19
	cmp r1, #0x63
	bgt .L0803950E
	adds r1, #1
.L0803950E:
	ldr r0, .L0803954C  @ gUnknown_02003B70
	movs r2, #7
	str r2, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x1a
	bl func_08038588
	movs r0, #1
	bl EnableBgSync
	ldr r0, .L08039550  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08039538
	movs r0, #0x76
	bl m4aSongNumStart
.L08039538:
	adds r0, r4, #0
	bl Proc_Break
.L0803953E:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08039548: .4byte gDungeonState
.L0803954C: .4byte gUnknown_02003B70
.L08039550: .4byte gPlaySt

	THUMB_FUNC_END func_080394A8

	THUMB_FUNC_START func_08039554
func_08039554: @ 0x08039554
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl func_0803929C
	str r0, [r4, #0x30]
	movs r0, #0
	bl func_08039200
	ldr r1, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x34]
	movs r0, #2
	str r0, [r4, #0x3c]
	ldr r0, .L08039588  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08039582
	movs r0, #0x74
	bl m4aSongNumStart
.L08039582:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08039588: .4byte gPlaySt

	THUMB_FUNC_END func_08039554

	THUMB_FUNC_START func_0803958C
func_0803958C: @ 0x0803958C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	adds r1, r0, #1
	str r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	subs r0, r0, r1
	cmp r0, #0x64
	ble .L080395A8
	adds r0, r1, #1
	str r0, [r7, #0x30]
.L080395A8:
	ldr r0, .L08039630  @ gUnknown_080D7FD0
	mov r8, r0
	adds r0, #0x28
	ldrb r2, [r0]
	movs r5, #8
	subs r0, r5, r2
	lsls r0, r0, #3
	ldr r6, .L08039634  @ gUnknown_02003A08
	adds r0, r0, r6
	ldrh r1, [r7, #0x30]
	mov r3, r8
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov r4, r8
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl func_08038588
	mov r0, r8
	ldrb r2, [r0, #4]
	subs r5, r5, r2
	lsls r5, r5, #3
	ldr r0, .L08039638  @ 0xFFFFFEC0
	adds r6, r6, r0
	adds r5, r5, r6
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x30]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r6, r8
	movs r3, #0
	ldrsb r3, [r6, r3]
	movs r0, #1
	ldrsb r0, [r6, r0]
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	bl func_08038588
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ble .L08039616
	subs r0, #1
	str r0, [r7, #0x3c]
.L08039616:
	ldr r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	cmp r1, r0
	blt .L08039624
	adds r0, r7, #0
	bl Proc_Break
.L08039624:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08039630: .4byte gUnknown_080D7FD0
.L08039634: .4byte gUnknown_02003A08
.L08039638: .4byte 0xFFFFFEC0

	THUMB_FUNC_END func_0803958C

	THUMB_FUNC_START func_0803963C
func_0803963C: @ 0x0803963C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bgt .L08039654
	movs r0, #0x74
	bl m4aSongNumStop
	adds r0, r4, #0
	bl Proc_Break
	b .L08039658
.L08039654:
	subs r0, #1
	str r0, [r4, #0x3c]
.L08039658:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0803963C

	THUMB_FUNC_START func_08039660
func_08039660: @ 0x08039660
	movs r1, #1
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END func_08039660

	THUMB_FUNC_START func_08039668
func_08039668: @ 0x08039668
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl func_08039360
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803968A
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	bl func_08039200
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl func_080391D0
.L0803968A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08039668

	THUMB_FUNC_START func_08039690
func_08039690: @ 0x08039690
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	adds r0, #1
	str r0, [r1, #0x2c]
	cmp r0, #4
	bgt .L080396A6
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
.L080396A6:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08039690

.align 2, 0
