	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Target Selection Stuff

	THUMB_FUNC_START InitTargets
InitTargets: @ 0x0804F8A4
	ldr r2, .L0804F8B4  @ gTargetPosition
	movs r3, #0
	strh r0, [r2]
	strh r1, [r2, #2]
	ldr r0, .L0804F8B8  @ gTargetArraySize
	str r3, [r0]
	bx lr
	.align 2, 0
.L0804F8B4: .4byte gTargetPosition
.L0804F8B8: .4byte gTargetArraySize

	THUMB_FUNC_END InitTargets

	THUMB_FUNC_START AddTarget
AddTarget: @ 0x0804F8BC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, .L0804F908  @ gTargetArray
	mov r8, r4
	ldr r6, .L0804F90C  @ gTargetArraySize
	ldr r5, [r6]
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	add r4, r8
	strb r0, [r4]
	ldr r4, [r6]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	add r0, r8
	strb r1, [r0, #1]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r2, [r0, #2]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r3, [r0, #3]
	ldr r0, [r6]
	adds r0, #1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F908: .4byte gTargetArray
.L0804F90C: .4byte gTargetArraySize

	THUMB_FUNC_END AddTarget

	THUMB_FUNC_START LinkTargets
LinkTargets: @ 0x0804F910
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r0, .L0804F950  @ gTargetArraySize
	ldr r1, [r0]
	adds r6, r0, #0
	ldr r4, .L0804F954  @ gTargetArray
	cmp r2, r1
	bge .L0804F93A
	adds r5, r6, #0
	adds r3, r4, #0
	adds r3, #0xc
	adds r1, r4, #0
	subs r1, #0xc
.L0804F92A:
	str r1, [r1, #0x14]
	str r3, [r1, #0x10]
	adds r3, #0xc
	adds r1, #0xc
	adds r2, #1
	ldr r0, [r5]
	cmp r2, r0
	blt .L0804F92A
.L0804F93A:
	ldr r1, [r6]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r4, #8]
	str r4, [r0, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0804F950: .4byte gTargetArraySize
.L0804F954: .4byte gTargetArray

	THUMB_FUNC_END LinkTargets

	THUMB_FUNC_START TargetSelection_GetRealCursorPosition
TargetSelection_GetRealCursorPosition: @ 0x0804F958
	ldr r3, [r0, #0x30]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	str r0, [r1]
	movs r0, #1
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	str r0, [r2]
	bx lr

	THUMB_FUNC_END TargetSelection_GetRealCursorPosition

	THUMB_FUNC_START TargetSelection_Loop
TargetSelection_Loop: @ 0x0804F96C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq .L0804F994
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl TargetSelection_GetRealCursorPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #4
	bl DisplayCursor
	b .L0804FA30
.L0804F994:
	adds r0, r4, #0
	bl TargetSelection_HandleMoveInput
	adds r0, r4, #0
	bl TargetSelection_HandleSelectInput
	adds r5, r0, #0
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq .L0804F9B0
	adds r0, r4, #0
	bl EndTargetSelection
.L0804F9B0:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq .L0804F9CA
	ldr r0, .L0804FA38  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804F9CA
	movs r0, #0x6a
	bl m4aSongNumStart
.L0804F9CA:
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq .L0804F9E4
	ldr r0, .L0804FA38  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804F9E4
	movs r0, #0x6b
	bl m4aSongNumStart
.L0804F9E4:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq .L0804F9F0
	bl ClearBg0Bg1
.L0804F9F0:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq .L0804F9FE
	movs r0, #0
	bl EndFaceById
.L0804F9FE:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne .L0804FA30
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl TargetSelection_GetRealCursorPosition
	ldr r1, [sp]
	asrs r1, r1, #4
	ldr r2, [sp, #4]
	asrs r2, r2, #4
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq .L0804FA30
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #2
	bl DisplayCursor
.L0804FA30:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FA38: .4byte gPlaySt

	THUMB_FUNC_END TargetSelection_Loop

	THUMB_FUNC_START StartTargetSelection
StartTargetSelection: @ 0x0804FA3C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl LockGameLogic
	ldr r0, .L0804FA9C  @ gUnknown_085B655C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x34
	movs r6, #0
	movs r0, #1
	strb r0, [r1]
	str r4, [r5, #0x2c]
	bl GetFirstTargetPointer
	str r0, [r5, #0x30]
	str r6, [r5, #0x38]
	ldr r0, [r5, #0x2c]
	ldr r1, [r0]
	cmp r1, #0
	beq .L0804FA70
	adds r0, r5, #0
	bl _call_via_r1
.L0804FA70:
	ldr r0, [r5, #0x2c]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq .L0804FA7E
	adds r0, r5, #0
	bl _call_via_r1
.L0804FA7E:
	ldr r0, [r5, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq .L0804FA8E
	ldr r1, [r5, #0x30]
	adds r0, r5, #0
	bl _call_via_r2
.L0804FA8E:
	ldr r0, .L0804FAA0  @ gKeySt
	ldr r0, [r0]
	strh r6, [r0, #8]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0804FA9C: .4byte gUnknown_085B655C
.L0804FAA0: .4byte gKeySt

	THUMB_FUNC_END StartTargetSelection

	THUMB_FUNC_START StartTargetSelectionExt
StartTargetSelectionExt: @ 0x0804FAA4
	push {r4, lr}
	adds r4, r1, #0
	bl StartTargetSelection
	adds r1, r0, #0
	str r4, [r1, #0x38]
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END StartTargetSelectionExt

	THUMB_FUNC_START EndTargetSelection
EndTargetSelection: @ 0x0804FAB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq .L0804FACA
	adds r0, r4, #0
	bl _call_via_r1
.L0804FACA:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804FADC
	bl UnlockGameLogic
.L0804FADC:
	adds r0, r4, #0
	bl Proc_End
	ldr r0, [r4, #0x14]
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EndTargetSelection

	THUMB_FUNC_START TargetSelection_HandleMoveInput
TargetSelection_HandleMoveInput: @ 0x0804FAEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	ldr r2, .L0804FB5C  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq .L0804FB08
	ldr r0, [r3, #4]
	cmp r0, #0
	beq .L0804FB08
	str r0, [r4, #0x30]
.L0804FB08:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x90
	ands r0, r1
	cmp r0, #0
	beq .L0804FB1E
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq .L0804FB1E
	str r0, [r4, #0x30]
.L0804FB1E:
	ldr r0, [r4, #0x30]
	cmp r0, r3
	beq .L0804FB56
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq .L0804FB34
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
.L0804FB34:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq .L0804FB44
	ldr r1, [r4, #0x30]
	adds r0, r4, #0
	bl _call_via_r2
.L0804FB44:
	ldr r0, .L0804FB60  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0804FB56
	movs r0, #0x67
	bl m4aSongNumStart
.L0804FB56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0804FB5C: .4byte gKeySt
.L0804FB60: .4byte gPlaySt

	THUMB_FUNC_END TargetSelection_HandleMoveInput

	THUMB_FUNC_START TargetSelection_HandleSelectInput
TargetSelection_HandleSelectInput: @ 0x0804FB64
	push {r4, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, .L0804FB84  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804FB88
	ldr r3, [r2, #0x38]
	cmp r3, #0
	bne .L0804FBA8
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x14]
	b .L0804FBA4
	.align 2, 0
.L0804FB84: .4byte gKeySt
.L0804FB88:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0804FB96
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x18]
	b .L0804FBA4
.L0804FB96:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0804FBB4
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x1c]
.L0804FBA4:
	cmp r3, #0
	beq .L0804FBB4
.L0804FBA8:
	ldr r1, [r2, #0x30]
	adds r0, r2, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
.L0804FBB4:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END TargetSelection_HandleSelectInput

	THUMB_FUNC_START func_0804FBBC
func_0804FBBC: @ 0x0804FBBC
	push {lr}
	ldr r0, .L0804FBD8  @ gUnknown_085B655C
	bl FindProc
	cmp r0, #0
	beq .L0804FBD4
	adds r2, r0, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
.L0804FBD4:
	pop {r0}
	bx r0
	.align 2, 0
.L0804FBD8: .4byte gUnknown_085B655C

	THUMB_FUNC_END func_0804FBBC

	THUMB_FUNC_START func_0804FBDC
func_0804FBDC: @ 0x0804FBDC
	push {lr}
	ldr r0, .L0804FBF8  @ gUnknown_085B655C
	bl FindProc
	cmp r0, #0
	beq .L0804FBF4
	adds r2, r0, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
.L0804FBF4:
	pop {r0}
	bx r0
	.align 2, 0
.L0804FBF8: .4byte gUnknown_085B655C

	THUMB_FUNC_END func_0804FBDC

	THUMB_FUNC_START GetFarthestTargetIndex
GetFarthestTargetIndex: @ 0x0804FBFC
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, .L0804FC34  @ gTargetArray
	ldr r0, .L0804FC38  @ gTargetArraySize
	ldr r0, [r0]
	cmp r7, r0
	bge .L0804FC52
	ldr r1, .L0804FC3C  @ gTargetPosition
	mov ip, r1
	movs r2, #0
	ldrsh r6, [r1, r2]
	adds r4, r0, #0
.L0804FC14:
	movs r0, #0
	ldrsb r0, [r5, r0]
	subs r2, r6, r0
	cmp r2, #0
	bge .L0804FC20
	subs r2, r0, r6
.L0804FC20:
	mov r0, ip
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r0, #1
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	blt .L0804FC40
	adds r0, r2, r1
	b .L0804FC44
	.align 2, 0
.L0804FC34: .4byte gTargetArray
.L0804FC38: .4byte gTargetArraySize
.L0804FC3C: .4byte gTargetPosition
.L0804FC40:
	subs r0, r0, r3
	adds r0, r2, r0
.L0804FC44:
	cmp r7, r0
	bge .L0804FC4A
	adds r7, r0, #0
.L0804FC4A:
	subs r4, #1
	adds r5, #0xc
	cmp r4, #0
	bne .L0804FC14
.L0804FC52:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetFarthestTargetIndex

	THUMB_FUNC_START LinkTargetsOrdered
LinkTargetsOrdered: @ 0x0804FC5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	movs r5, #0
	movs r4, #0
	ldr r0, .L0804FCF0  @ gTargetArraySize
	mov r9, r0
	ldr r1, .L0804FCF4  @ gTargetPosition
	mov r8, r1
	ldr r3, .L0804FCF8  @ gUnknown_085B658C
	mov sl, r3
.L0804FC7A:
	mov r6, r8
	movs r0, #0
	ldrsh r2, [r6, r0]
	lsls r1, r4, #2
	add r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	str r2, [sp]
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #1
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	movs r1, #0
	ldr r3, .L0804FCFC  @ gTargetArray
	mov r6, r9
	ldr r0, [r6]
	adds r4, #1
	cmp r1, r0
	bge .L0804FCD4
	mov ip, r9
.L0804FCA6:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r6, [sp]
	cmp r6, r0
	bne .L0804FCC8
	movs r0, #1
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne .L0804FCC8
	str r5, [r3, #4]
	cmp r5, #0
	beq .L0804FCC0
	str r3, [r5, #8]
.L0804FCC0:
	cmp r7, #0
	bne .L0804FCC6
	adds r7, r3, #0
.L0804FCC6:
	adds r5, r3, #0
.L0804FCC8:
	adds r1, #1
	adds r3, #0xc
	mov r6, ip
	ldr r0, [r6]
	cmp r1, r0
	blt .L0804FCA6
.L0804FCD4:
	cmp r4, #0xc
	ble .L0804FC7A
	str r5, [r7, #4]
	str r7, [r5, #8]
	adds r0, r7, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0804FCF0: .4byte gTargetArraySize
.L0804FCF4: .4byte gTargetPosition
.L0804FCF8: .4byte gUnknown_085B658C
.L0804FCFC: .4byte gTargetArray

	THUMB_FUNC_END LinkTargetsOrdered

	THUMB_FUNC_START GetLinkedTargetList
GetLinkedTargetList: @ 0x0804FD00
	push {lr}
	bl LinkTargets
	ldr r0, .L0804FD0C  @ gTargetArray
	pop {r1}
	bx r1
	.align 2, 0
.L0804FD0C: .4byte gTargetArray

	THUMB_FUNC_END GetLinkedTargetList

	THUMB_FUNC_START GetFirstTargetPointer
GetFirstTargetPointer: @ 0x0804FD10
	push {lr}
	bl GetFarthestTargetIndex
	cmp r0, #2
	bgt .L0804FD20
	bl LinkTargetsOrdered
	b .L0804FD24
.L0804FD20:
	bl GetLinkedTargetList
.L0804FD24:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetFirstTargetPointer

	THUMB_FUNC_START GetTargetListSize
GetTargetListSize: @ 0x0804FD28
	ldr r0, .L0804FD30  @ gTargetArraySize
	ldr r0, [r0]
	bx lr
	.align 2, 0
.L0804FD30: .4byte gTargetArraySize

	THUMB_FUNC_END GetTargetListSize

	THUMB_FUNC_START GetTarget
GetTarget: @ 0x0804FD34
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, .L0804FD44  @ gTargetArray
	adds r0, r0, r1
	bx lr
	.align 2, 0
.L0804FD44: .4byte gTargetArray

	THUMB_FUNC_END GetTarget

.align 2, 0
