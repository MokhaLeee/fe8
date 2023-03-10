	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START LoadObjUiGfx
LoadObjUiGfx: @ 0x08015680
	push {r4, lr}
	ldr r0, .L080156AC  @ gUnknown_0859E8E0
	ldr r4, .L080156B0  @ gBuf
	adds r1, r4, #0
	bl Decompress
	ldr r1, .L080156B4  @ 0x06010000
	adds r0, r4, #0
	movs r2, #0x12
	movs r3, #4
	bl CopyTileGfxForObj
	ldr r0, .L080156B8  @ gUnknown_0859ED70
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080156AC: .4byte gUnknown_0859E8E0
.L080156B0: .4byte gBuf
.L080156B4: .4byte 0x06010000
.L080156B8: .4byte gUnknown_0859ED70

	THUMB_FUNC_END LoadObjUiGfx

	THUMB_FUNC_START func_080156BC
func_080156BC: @ 0x080156BC
	push {lr}
	ldr r0, .L080156D0  @ gUnknown_0859ED70
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L080156D0: .4byte gUnknown_0859ED70

	THUMB_FUNC_END func_080156BC

	THUMB_FUNC_START func_080156D4
func_080156D4: @ 0x080156D4
	push {lr}
	bl ResetText
	bl LoadLegacyUiFrameGraphics
	bl InitFaces
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl LoadObjUiGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080156D4

	THUMB_FUNC_START ApplySystemGraphics
ApplySystemGraphics: @ 0x080156F4
	push {lr}
	bl ResetText
	bl LoadUiFrameGraphics
	bl InitFaces
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl LoadObjUiGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END ApplySystemGraphics

	THUMB_FUNC_START HandleCursorMovement
HandleCursorMovement: @ 0x08015714
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov ip, r1
	lsrs r7, r0, #0x14
	movs r0, #0xf
	ands r7, r0
	ldr r3, .L08015814  @ gBmSt
	ldr r4, .L08015818  @ gUnknown_0859A438
	lsls r2, r7, #1
	adds r0, r2, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r3, #0x14]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	adds r0, r4, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldrh r2, [r3, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r6, r1, #0x10
	orrs r6, r0
	ldrb r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	adds r5, r3, #0
	cmp r0, #0
	beq .L08015792
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, .L0801581C  @ gMapMovement
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x14
	ldrsh r1, [r5, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi .L08015792
	asrs r0, r6, #0x10
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bls .L08015792
	movs r1, #0xf0
	ldr r0, .L08015820  @ gKeySt
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	mov r0, ip
	ands r0, r1
	ands r1, r2
	cmp r0, r1
	bne .L08015832
.L08015792:
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt .L080157BC
	ldr r0, .L08015824  @ gMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge .L080157BC
	lsls r0, r7, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r3, [r5, #0x1c]
	adds r0, r0, r3
	strh r0, [r5, #0x1c]
	ldrh r0, [r5, #0x14]
	strh r0, [r5, #0x18]
	strh r6, [r5, #0x14]
.L080157BC:
	asrs r2, r6, #0x10
	adds r1, r2, #0
	cmp r1, #0
	blt .L080157E8
	ldr r0, .L08015824  @ gMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge .L080157E8
	lsls r0, r7, #1
	adds r1, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r1, [r5, #0x1e]
	adds r0, r0, r1
	strh r0, [r5, #0x1e]
	ldrh r0, [r5, #0x16]
	strh r0, [r5, #0x1a]
	strh r2, [r5, #0x16]
.L080157E8:
	ldrb r1, [r5, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L0801582C
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #0x18]
	cmp r1, r0
	beq .L08015832
	ldr r0, .L08015828  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0801580C
	movs r0, #0x65
	bl m4aSongNumStart
.L0801580C:
	ldrb r0, [r5, #4]
	movs r1, #4
	orrs r0, r1
	b .L08015830
	.align 2, 0
.L08015814: .4byte gBmSt
.L08015818: .4byte gUnknown_0859A438
.L0801581C: .4byte gMapMovement
.L08015820: .4byte gKeySt
.L08015824: .4byte gMapSize
.L08015828: .4byte gPlaySt
.L0801582C:
	movs r0, #0xfb
	ands r0, r1
.L08015830:
	strb r0, [r5, #4]
.L08015832:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END HandleCursorMovement

	THUMB_FUNC_START MoveCameraByStepMaybe
MoveCameraByStepMaybe: @ 0x08015838
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, .L08015888  @ gBmSt
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bge .L08015850
	adds r0, r3, r4
	strh r0, [r2, #0x20]
.L08015850:
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	ble .L08015862
	subs r0, r3, r4
	strh r0, [r2, #0x20]
.L08015862:
	ldrh r3, [r2, #0x22]
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r5, #0x1e
	ldrsh r1, [r2, r5]
	cmp r0, r1
	bge .L08015874
	adds r0, r3, r4
	strh r0, [r2, #0x22]
.L08015874:
	ldrh r3, [r2, #0x22]
	movs r5, #0x22
	ldrsh r0, [r2, r5]
	cmp r0, r1
	ble .L08015882
	subs r0, r3, r4
	strh r0, [r2, #0x22]
.L08015882:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08015888: .4byte gBmSt

	THUMB_FUNC_END MoveCameraByStepMaybe

	THUMB_FUNC_START func_0801588C
func_0801588C: @ 0x0801588C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r1, .L080158B4  @ gBmSt
	movs r0, #0x20
	ldrsh r3, [r1, r0]
	movs r2, #0x22
	ldrsh r5, [r1, r2]
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	adds r0, #0x30
	adds r2, r1, #0
	cmp r0, r3
	ble .L080158D0
	adds r0, r3, #0
	subs r0, #0x30
	cmp r0, #0
	bge .L080158B8
	strh r6, [r2, #0xc]
	b .L080158D0
	.align 2, 0
.L080158B4: .4byte gBmSt
.L080158B8:
	movs r6, #1
	ldrh r0, [r2, #0xc]
	subs r0, r0, r4
	strh r0, [r2, #0xc]
	negs r0, r4
	adds r1, r2, #0
	adds r1, #0x36
	strb r0, [r1]
	ldrh r1, [r2, #0xc]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x32]
.L080158D0:
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	adds r0, #0xb0
	cmp r0, r3
	bge .L08015902
	adds r1, r3, #0
	subs r1, #0xb0
	movs r3, #0x28
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble .L080158EC
	ldrh r0, [r2, #0x28]
	strh r0, [r2, #0xc]
	b .L08015902
.L080158EC:
	movs r6, #1
	ldrh r0, [r2, #0xc]
	adds r0, r0, r4
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x36
	strb r4, [r0]
	ldrh r1, [r2, #0xc]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x32]
.L08015902:
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	adds r0, #0x20
	cmp r0, r5
	ble .L08015932
	adds r0, r5, #0
	subs r0, #0x20
	cmp r0, #0
	bge .L0801591A
	movs r0, #0
	strh r0, [r2, #0xe]
	b .L08015932
.L0801591A:
	movs r6, #1
	ldrh r0, [r2, #0xe]
	subs r0, r0, r4
	strh r0, [r2, #0xe]
	negs r0, r4
	adds r1, r2, #0
	adds r1, #0x37
	strb r0, [r1]
	ldrh r1, [r2, #0xe]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
.L08015932:
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	adds r0, #0x70
	cmp r0, r5
	bge .L08015964
	adds r1, r5, #0
	subs r1, #0x70
	movs r3, #0x2a
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble .L0801594E
	ldrh r0, [r2, #0x2a]
	strh r0, [r2, #0xe]
	b .L08015964
.L0801594E:
	movs r6, #1
	ldrh r0, [r2, #0xe]
	adds r0, r0, r4
	strh r0, [r2, #0xe]
	adds r0, r2, #0
	adds r0, #0x37
	strb r4, [r0]
	ldrh r1, [r2, #0xe]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
.L08015964:
	cmp r6, #0
	bne .L080159B2
	adds r3, r2, #0
	ldrh r1, [r3, #0x32]
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq .L0801598E
	adds r4, r3, #0
	adds r4, #0x36
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r3, #0x32]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldrh r1, [r3, #0xc]
	adds r0, r0, r1
	strh r0, [r3, #0xc]
.L0801598E:
	ldrh r1, [r2, #0x34]
	movs r3, #0x34
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq .L080159B2
	adds r3, r2, #0
	adds r3, #0x37
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrh r4, [r2, #0xe]
	adds r0, r0, r4
	strh r0, [r2, #0xe]
.L080159B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801588C

	THUMB_FUNC_START GetSomeAdjustedCameraX
GetSomeAdjustedCameraX: @ 0x080159B8
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, .L080159F8  @ gBmSt
	movs r1, #0xc
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x30
	adds r4, r0, #0
	cmp r1, r3
	ble .L080159D6
	adds r2, r3, #0
	subs r2, #0x30
	cmp r2, #0
	bge .L080159D6
	movs r2, #0
.L080159D6:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	adds r0, #0xb0
	cmp r0, r3
	bge .L080159EE
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0xb0
	cmp r2, r0
	ble .L080159EE
	adds r2, r0, #0
.L080159EE:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080159F8: .4byte gBmSt

	THUMB_FUNC_END GetSomeAdjustedCameraX

	THUMB_FUNC_START GetSomeAdjustedCameraY
GetSomeAdjustedCameraY: @ 0x080159FC
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, .L08015A3C  @ gBmSt
	movs r1, #0xe
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x20
	adds r4, r0, #0
	cmp r1, r3
	ble .L08015A1A
	adds r2, r3, #0
	subs r2, #0x20
	cmp r2, #0
	bge .L08015A1A
	movs r2, #0
.L08015A1A:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	adds r0, #0x70
	cmp r0, r3
	bge .L08015A32
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0x70
	cmp r2, r0
	ble .L08015A32
	adds r2, r0, #0
.L08015A32:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L08015A3C: .4byte gBmSt

	THUMB_FUNC_END GetSomeAdjustedCameraY

	THUMB_FUNC_START func_08015A40
func_08015A40: @ 0x08015A40
	push {lr}
	adds r1, r0, #0
	subs r1, #0x78
	cmp r1, #0
	bge .L08015A4C
	movs r1, #0
.L08015A4C:
	ldr r0, .L08015A68  @ gBmSt
	movs r2, #0x28
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble .L08015A58
	adds r1, r0, #0
.L08015A58:
	movs r2, #0x10
	negs r2, r2
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
.L08015A68: .4byte gBmSt

	THUMB_FUNC_END func_08015A40

	THUMB_FUNC_START func_08015A6C
func_08015A6C: @ 0x08015A6C
	push {lr}
	adds r1, r0, #0
	subs r1, #0x50
	cmp r1, #0
	bge .L08015A78
	movs r1, #0
.L08015A78:
	ldr r0, .L08015A94  @ gBmSt
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble .L08015A84
	adds r1, r0, #0
.L08015A84:
	movs r2, #0x10
	negs r2, r2
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
.L08015A94: .4byte gBmSt

	THUMB_FUNC_END func_08015A6C

	THUMB_FUNC_START DisplayCursor
DisplayCursor: @ 0x08015A98
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov r9, r0
	mov r8, r0
	bl GetGameTime
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	cmp r5, #4
	bhi .L08015B52
	lsls r0, r5, #2
	ldr r1, .L08015AC8  @ .L08015ACC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08015AC8: .4byte .L08015ACC
.L08015ACC: @ jump table
	.4byte .L08015AE0 @ case 0
	.4byte .L08015AE0 @ case 1
	.4byte .L08015AF0 @ case 2
	.4byte .L08015B38 @ case 3
	.4byte .L08015B48 @ case 4
.L08015AE0:
	movs r1, #2
	mov r9, r1
	ldr r1, .L08015AEC  @ gUnknown_0859A4C0
	lsls r0, r4, #2
	adds r0, r0, r1
	b .L08015B4E
	.align 2, 0
.L08015AEC: .4byte gUnknown_0859A4C0
.L08015AF0:
	bl GetGameTime
	subs r0, #1
	ldr r5, .L08015B2C  @ gCursorAnimationClockReference
	ldr r1, [r5]
	cmp r0, r1
	bne .L08015B10
	ldr r0, .L08015B30  @ gPreviousCursorDisplayPosition
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r6, r1
	asrs r6, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r7, r0
	asrs r7, r0, #1
.L08015B10:
	movs r2, #0x24
	mov r9, r2
	ldr r1, .L08015B34  @ gUnknown_0859A4C0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r0, .L08015B30  @ gPreviousCursorDisplayPosition
	strh r6, [r0]
	strh r7, [r0, #2]
	bl GetGameTime
	str r0, [r5]
	b .L08015B52
	.align 2, 0
.L08015B2C: .4byte gCursorAnimationClockReference
.L08015B30: .4byte gPreviousCursorDisplayPosition
.L08015B34: .4byte gUnknown_0859A4C0
.L08015B38:
	movs r0, #2
	mov r9, r0
	ldr r1, .L08015B44  @ gUnknown_0859A4A6
	mov r8, r1
	b .L08015B52
	.align 2, 0
.L08015B44: .4byte gUnknown_0859A4A6
.L08015B48:
	movs r2, #0x24
	mov r9, r2
	ldr r0, .L08015B80  @ gUnknown_0859A4C0
.L08015B4E:
	ldr r0, [r0]
	mov r8, r0
.L08015B52:
	ldr r0, .L08015B84  @ gBmSt
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r6, r6, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	subs r7, r7, r0
	mov r2, r9
	str r2, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08015B80: .4byte gUnknown_0859A4C0
.L08015B84: .4byte gBmSt

	THUMB_FUNC_END DisplayCursor

	THUMB_FUNC_START func_08015B88
func_08015B88: @ 0x08015B88
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameTime
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	movs r2, #2
	ldr r1, .L08015BB8  @ gUnknown_0859A4C0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08015BB8: .4byte gUnknown_0859A4C0

	THUMB_FUNC_END func_08015B88

	THUMB_FUNC_START SetCursorMapPosition
SetCursorMapPosition: @ 0x08015BBC
	ldr r2, .L08015BD0  @ gBmSt
	strh r0, [r2, #0x14]
	strh r1, [r2, #0x16]
	lsls r0, r0, #4
	strh r0, [r2, #0x1c]
	lsls r1, r1, #4
	strh r1, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r1, [r2, #0x22]
	bx lr
	.align 2, 0
.L08015BD0: .4byte gBmSt

	THUMB_FUNC_END SetCursorMapPosition

	THUMB_FUNC_START func_08015BD4
func_08015BD4: @ 0x08015BD4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl __umodsi3
	cmp r4, #0
	beq .L08015BF8
	ldr r1, .L08015BF4  @ gUnknown_0859A53C
	b .L08015BFA
	.align 2, 0
.L08015BF4: .4byte gUnknown_0859A53C
.L08015BF8:
	ldr r1, .L08015C18  @ gUnknown_0859A530
.L08015BFA:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08015C18: .4byte gUnknown_0859A530

	THUMB_FUNC_END func_08015BD4

	THUMB_FUNC_START CameraMovement_OnInit
CameraMovement_OnInit: @ 0x08015C1C
	push {r4, r5, r6, lr}
	mov ip, r0
	movs r5, #1
	movs r1, #0x2c
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r0, [r0, r3]
	subs r1, r2, r0
	cmp r1, #0
	bge .L08015C32
	subs r1, r0, r2
.L08015C32:
	mov r4, ip
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r2, r3, r0
	cmp r2, #0
	bge .L08015C44
	subs r2, r0, r3
.L08015C44:
	cmp r1, r2
	ble .L08015C54
	mov r0, ip
	adds r0, #0x40
	strb r5, [r0]
	mov r3, ip
	strh r1, [r3, #0x38]
	b .L08015C60
.L08015C54:
	mov r1, ip
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	mov r4, ip
	strh r2, [r4, #0x38]
.L08015C60:
	mov r0, ip
	movs r1, #0x38
	ldrsh r3, [r0, r1]
	movs r4, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	ldr r6, .L08015C78  @ gSomeCameraMovementTableMaybe
	cmp r0, #0
	bge .L08015C7C
	strb r3, [r6]
	b .L08015CA2
	.align 2, 0
.L08015C78: .4byte gSomeCameraMovementTableMaybe
.L08015C7C:
	lsls r1, r5, #0x18
	asrs r2, r1, #0x18
	asrs r1, r1, #0x19
	subs r3, r3, r1
	adds r0, r4, r6
	strb r1, [r0]
	cmp r2, #0xf
	bgt .L08015C92
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
.L08015C92:
	adds r4, #1
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	cmp r0, #0
	bge .L08015C7C
	adds r0, r4, r6
	strb r3, [r0]
.L08015CA2:
	mov r2, ip
	str r4, [r2, #0x3c]
	ldrh r0, [r2, #0x38]
	strh r0, [r2, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END CameraMovement_OnInit

	THUMB_FUNC_START CameraMovement_OnLoop
CameraMovement_OnLoop: @ 0x08015CB0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x3c]
	cmp r2, #0
	bne .L08015CD0
	ldr r0, .L08015CCC  @ gBmSt
	ldrh r1, [r0, #0xc]
	strh r1, [r5, #0x2c]
	ldrh r0, [r0, #0xe]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_End
	b .L08015D20
	.align 2, 0
.L08015CCC: .4byte gBmSt
.L08015CD0:
	ldr r0, .L08015D28  @ gSomeCameraMovementTableMaybe
	adds r0, r2, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0x3a]
	subs r0, r0, r1
	strh r0, [r5, #0x3a]
	subs r0, r2, #1
	str r0, [r5, #0x3c]
	ldr r4, .L08015D2C  @ gBmSt
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2c]
	adds r1, r1, r0
	strh r1, [r4, #0xc]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2e]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
.L08015D20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08015D28: .4byte gSomeCameraMovementTableMaybe
.L08015D2C: .4byte gBmSt

	THUMB_FUNC_END CameraMovement_OnLoop

	THUMB_FUNC_START GetCenteredCameraPosition
GetCenteredCameraPosition: @ 0x08015D30
	push {r4, r5, lr}
	adds r4, r2, #0
	subs r0, #7
	str r0, [r4]
	subs r1, #5
	str r1, [r3]
	ldr r0, [r4]
	cmp r0, #0
	bge .L08015D46
	movs r0, #0
	str r0, [r4]
.L08015D46:
	ldr r0, [r3]
	cmp r0, #0
	bge .L08015D50
	movs r0, #0
	str r0, [r3]
.L08015D50:
	ldr r1, [r4]
	adds r1, #8
	ldr r5, .L08015D80  @ gMapSize
	movs r0, #0
	ldrsh r2, [r5, r0]
	subs r0, r2, #1
	cmp r1, r0
	ble .L08015D64
	subs r0, #0xe
	str r0, [r4]
.L08015D64:
	ldr r0, [r3]
	adds r0, #4
	movs r1, #2
	ldrsh r2, [r5, r1]
	subs r1, r2, #1
	cmp r0, r1
	ble .L08015D78
	adds r0, r2, #0
	subs r0, #0xa
	str r0, [r3]
.L08015D78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08015D80: .4byte gMapSize

	THUMB_FUNC_END GetCenteredCameraPosition

	THUMB_FUNC_START CenterCameraOntoPosition
CenterCameraOntoPosition: @ 0x08015D84
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	add r3, sp, #4
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sp
	bl GetCenteredCameraPosition
	ldr r1, [sp]
	lsls r1, r1, #4
	str r1, [sp]
	ldr r0, [sp, #4]
	lsls r2, r0, #4
	str r2, [sp, #4]
	ldr r3, .L08015DC8  @ gBmSt
	movs r4, #0xc
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne .L08015DB8
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r2, r0
	beq .L08015DC4
.L08015DB8:
	ldr r4, .L08015DCC  @ ProcScr_CameraPan
	adds r0, r4, #0
	bl FindProc
	cmp r0, #0
	beq .L08015DD0
.L08015DC4:
	movs r0, #0
	b .L08015E00
	.align 2, 0
.L08015DC8: .4byte gBmSt
.L08015DCC: .4byte ProcScr_CameraPan
.L08015DD0:
	cmp r5, #0
	beq .L08015DDE
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProcLocking
	b .L08015DE6
.L08015DDE:
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
.L08015DE6:
	adds r2, r0, #0
	ldr r1, .L08015E08  @ gBmSt
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldr r0, [sp]
	strh r0, [r2, #0x2c]
	ldr r0, [sp, #4]
	strh r0, [r2, #0x2e]
	strh r6, [r2, #0x34]
	strh r7, [r2, #0x36]
	movs r0, #1
.L08015E00:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08015E08: .4byte gBmSt

	THUMB_FUNC_END CenterCameraOntoPosition

	THUMB_FUNC_START EnsureCameraOntoPosition
EnsureCameraOntoPosition: @ 0x08015E0C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov r9, r2
	lsls r0, r1, #4
	bl GetSomeAdjustedCameraX
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, r9
	lsls r0, r1, #4
	bl GetSomeAdjustedCameraY
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, .L08015E54  @ gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r7, r0
	bne .L08015E42
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r6, r0
	beq .L08015E4E
.L08015E42:
	ldr r4, .L08015E58  @ ProcScr_CameraPan
	adds r0, r4, #0
	bl FindProc
	cmp r0, #0
	beq .L08015E5C
.L08015E4E:
	movs r0, #0
	b .L08015E8C
	.align 2, 0
.L08015E54: .4byte gBmSt
.L08015E58: .4byte ProcScr_CameraPan
.L08015E5C:
	cmp r5, #0
	beq .L08015E6A
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProcLocking
	b .L08015E72
.L08015E6A:
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
.L08015E72:
	adds r2, r0, #0
	ldr r0, .L08015E98  @ gBmSt
	ldrh r1, [r0, #0xc]
	strh r1, [r2, #0x30]
	ldrh r0, [r0, #0xe]
	strh r0, [r2, #0x32]
	strh r7, [r2, #0x2c]
	strh r6, [r2, #0x2e]
	mov r0, r8
	strh r0, [r2, #0x34]
	mov r1, r9
	strh r1, [r2, #0x36]
	movs r0, #1
.L08015E8C:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08015E98: .4byte gBmSt

	THUMB_FUNC_END EnsureCameraOntoPosition

	THUMB_FUNC_START ShouldMoveCameraPosSomething
ShouldMoveCameraPosSomething: @ 0x08015E9C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #4
	bl GetSomeAdjustedCameraX
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #4
	adds r0, r5, #0
	bl GetSomeAdjustedCameraY
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, .L08015ED0  @ gBmSt
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne .L08015ED4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r2, r0
	bne .L08015ED4
	movs r0, #0
	b .L08015ED6
	.align 2, 0
.L08015ED0: .4byte gBmSt
.L08015ED4:
	movs r0, #1
.L08015ED6:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldMoveCameraPosSomething

	THUMB_FUNC_START func_08015EDC
func_08015EDC: @ 0x08015EDC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08015F00  @ gBmSt
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble .L08015EFA
	ldr r4, .L08015F04  @ ProcScr_CameraPan
	adds r0, r4, #0
	bl FindProc
	cmp r0, #0
	beq .L08015F08
.L08015EFA:
	movs r0, #0
	b .L08015F34
	.align 2, 0
.L08015F00: .4byte gBmSt
.L08015F04: .4byte ProcScr_CameraPan
.L08015F08:
	cmp r5, #0
	beq .L08015F16
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProcLocking
	b .L08015F1E
.L08015F16:
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
.L08015F1E:
	adds r2, r0, #0
	ldr r1, .L08015F3C  @ gBmSt
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x2c]
	ldrh r0, [r1, #0x2a]
	strh r0, [r2, #0x2e]
	movs r0, #1
.L08015F34:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08015F3C: .4byte gBmSt

	THUMB_FUNC_END func_08015EDC

	THUMB_FUNC_START func_08015F40
func_08015F40: @ 0x08015F40
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	ldr r4, [r7, #0x34]
	muls r0, r4, r0
	ldr r5, [r7, #0x38]
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	bl DisplayCursor
	ldr r0, [r7, #0x34]
	subs r0, #1
	str r0, [r7, #0x34]
	cmp r0, #0
	bge .L08015F88
	adds r0, r7, #0
	bl Proc_Break
.L08015F88:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08015F40

	THUMB_FUNC_START func_08015F90
func_08015F90: @ 0x08015F90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08015FC0  @ gUnknown_0859A570
	movs r1, #3
	bl SpawnProc
	ldr r2, .L08015FC4  @ gBmSt
	ldrh r1, [r2, #0x14]
	lsls r1, r1, #4
	strh r1, [r0, #0x2c]
	ldrh r1, [r2, #0x16]
	lsls r1, r1, #4
	strh r1, [r0, #0x2e]
	lsls r4, r4, #4
	strh r4, [r0, #0x30]
	lsls r5, r5, #4
	strh r5, [r0, #0x32]
	str r6, [r0, #0x38]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08015FC0: .4byte gUnknown_0859A570
.L08015FC4: .4byte gBmSt

	THUMB_FUNC_END func_08015F90

	THUMB_FUNC_START GetCurrentMapMusicIndex
GetCurrentMapMusicIndex: @ 0x08015FC8
	push {r4, r5, r6, r7, lr}
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r1, #6
	cmp r0, #0
	bne .L08015FDA
	movs r1, #0
.L08015FDA:
	adds r7, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r1, #7
	cmp r0, #0
	bne .L08015FEC
	movs r1, #1
.L08015FEC:
	adds r6, r1, #0
	movs r0, #4
	bl CheckFlag
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	bne .L08016000
	movs r4, #2
	b .L08016002
.L08016000:
	movs r4, #6
.L08016002:
	ldr r5, .L08016014  @ gPlaySt
	ldrb r1, [r5, #0xf]
	cmp r1, #0x40
	beq .L0801602E
	cmp r1, #0x40
	bgt .L08016018
	cmp r1, #0
	beq .L08016040
	b .L080160C4
	.align 2, 0
.L08016014: .4byte gPlaySt
.L08016018:
	cmp r1, #0x80
	bne .L080160C4
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	lsls r1, r6, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b .L080160C4
.L0801602E:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	lsls r1, r4, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b .L080160C4
.L08016040:
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801605E
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b .L080160C4
.L0801605E:
	bl GetBattleMapKind
	cmp r0, #2
	beq .L0801607A
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L080160B0
.L0801607A:
	ldr r1, .L080160A4  @ 0x0001000C
	movs r0, #0x80
	bl func_08024D50
	adds r4, r0, #0
	bl GetBattleMapKind
	cmp r0, #2
	beq .L080160A8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	ble .L080160AC
	b .L080160B0
	.align 2, 0
.L080160A4: .4byte 0x0001000C
.L080160A8:
	cmp r4, #1
	bgt .L080160B0
.L080160AC:
	movs r0, #0x10
	b .L080160C4
.L080160B0:
	ldr r0, .L080160CC  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
.L080160C4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L080160CC: .4byte gPlaySt

	THUMB_FUNC_END GetCurrentMapMusicIndex

	THUMB_FUNC_START UpdatePlayMapMusic
UpdatePlayMapMusic: @ 0x080160D0
	push {lr}
	bl GetCurrentMapMusicIndex
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0

	THUMB_FUNC_END UpdatePlayMapMusic

	THUMB_FUNC_START func_080160E0
func_080160E0: @ 0x080160E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r6, #0x2e
	ldrsh r2, [r5, r6]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	ldr r1, .L08016138  @ gBmSt
	strh r4, [r1, #0xc]
	strh r0, [r1, #0xe]
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt .L0801612E
	adds r0, r5, #0
	bl Proc_End
.L0801612E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08016138: .4byte gBmSt

	THUMB_FUNC_END func_080160E0

	THUMB_FUNC_START func_0801613C
func_0801613C: @ 0x0801613C
	bx lr

	THUMB_FUNC_END func_0801613C

	THUMB_FUNC_START func_08016140
func_08016140: @ 0x08016140
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0
	beq .L0801615C
	ldr r0, .L08016158  @ gUnknown_0859A580
	adds r1, r4, #0
	bl SpawnProcLocking
	b .L08016164
	.align 2, 0
.L08016158: .4byte gUnknown_0859A580
.L0801615C:
	ldr r0, .L08016184  @ gUnknown_0859A580
	movs r1, #3
	bl SpawnProc
.L08016164:
	adds r3, r0, #0
	ldr r1, .L08016188  @ gBmSt
	ldrh r0, [r1, #0xc]
	movs r2, #0
	strh r0, [r3, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r3, #0x32]
	lsls r0, r5, #4
	strh r0, [r3, #0x2c]
	lsls r0, r6, #4
	strh r0, [r3, #0x2e]
	strh r7, [r3, #0x3a]
	str r2, [r3, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08016184: .4byte gUnknown_0859A580
.L08016188: .4byte gBmSt

	THUMB_FUNC_END func_08016140

	.align 2, 0 @ Don't pad with nop.
