	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ "Send item to convoy" menus and related functions

	THUMB_FUNC_START func_0801DF94
func_0801DF94: @ 0x0801DF94
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, .L0801DFC0  @ gUnknown_02001F70
	bl GetConvoyItemCount
	strb r0, [r5]
	movs r0, #4
	bl ApplyIconPalettes
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801DFC8
	ldrb r0, [r5]
	cmp r0, #0x63
	bhi .L0801DFC8
	ldr r0, .L0801DFC4  @ MenuInfo_SendToConvoy
	adds r1, r4, #0
	bl StartMenuChild
	b .L0801DFD0
	.align 2, 0
.L0801DFC0: .4byte gUnknown_02001F70
.L0801DFC4: .4byte MenuInfo_SendToConvoy
.L0801DFC8:
	ldr r0, .L0801DFD8  @ MenuInfo_Convoy
	adds r1, r4, #0
	bl StartMenuChild
.L0801DFD0:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0801DFD8: .4byte MenuInfo_Convoy

	THUMB_FUNC_END func_0801DF94

	THUMB_FUNC_START func_0801DFDC
func_0801DFDC: @ 0x0801DFDC
	push {r4, lr}
	adds r4, r0, #0
	bl EndBottomHelpText
	bl EndMenuItemPanel
	ldr r0, .L0801DFF4  @ gBmSt
	ldrh r0, [r0, #0x2e]
	cmp r0, #0
	beq .L0801DFF8
	movs r0, #0
	b .L0801E002
	.align 2, 0
.L0801DFF4: .4byte gBmSt
.L0801DFF8:
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	movs r0, #1
.L0801E002:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0801DFDC

	THUMB_FUNC_START func_0801E008
func_0801E008: @ 0x0801E008
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl func_0809EB58
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0801E008

	THUMB_FUNC_START func_0801E018
func_0801E018: @ 0x0801E018
	push {lr}
	ldr r0, .L0801E028  @ gBmSt
	ldrh r0, [r0, #0x2e]
	bl AddItemToConvoy
	pop {r1}
	bx r1
	.align 2, 0
.L0801E028: .4byte gBmSt

	THUMB_FUNC_END func_0801E018

	THUMB_FUNC_START func_0801E02C
func_0801E02C: @ 0x0801E02C
	push {lr}
	ldr r0, .L0801E040  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r1, .L0801E044  @ gActiveUnit
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
.L0801E040: .4byte gAction
.L0801E044: .4byte gActiveUnit

	THUMB_FUNC_END func_0801E02C

	THUMB_FUNC_START func_0801E048
func_0801E048: @ 0x0801E048
	push {r4, lr}
	adds r4, r0, #0
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801E084
	ldr r0, .L0801E06C  @ gUnknown_02001F70
	ldrb r0, [r0]
	cmp r0, #0x63
	bhi .L0801E074
	ldr r0, .L0801E070  @ gAction
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl func_0801FD80
	b .L0801E08E
	.align 2, 0
.L0801E06C: .4byte gUnknown_02001F70
.L0801E070: .4byte gAction
.L0801E074:
	ldr r0, .L0801E080  @ gAction
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl func_0801FD70
	b .L0801E08E
	.align 2, 0
.L0801E080: .4byte gAction
.L0801E084:
	ldr r0, .L0801E094  @ gAction
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	bl func_0801FD70
.L0801E08E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801E094: .4byte gAction

	THUMB_FUNC_END func_0801E048

	THUMB_FUNC_START HandleNewItemGetFromDrop
HandleNewItemGetFromDrop: @ 0x0801E098
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl UnitAddItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801E128
	ldr r0, .L0801E100  @ gActiveUnit
	str r4, [r0]
	ldr r0, .L0801E104  @ gBmSt
	strh r5, [r0, #0x2c]
	adds r0, r4, #0
	bl GetUnitFid
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #4
	bl StartFace
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xf
	movs r3, #0xa
	bl ForceMenuItemPanel
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0801E10C
	bl GetConvoyItemCount
	cmp r0, #0x63
	bgt .L0801E10C
	ldr r0, .L0801E108  @ 0x00000867
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl StartBottomHelpText
	b .L0801E11A
	.align 2, 0
.L0801E100: .4byte gActiveUnit
.L0801E104: .4byte gBmSt
.L0801E108: .4byte 0x00000867
.L0801E10C:
	ldr r0, .L0801E130  @ 0x00000866
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl StartBottomHelpText
.L0801E11A:
	movs r0, #2
	bl SetDialoguePromptResult
	ldr r0, .L0801E134  @ gUnknown_0859AE38
	adds r1, r6, #0
	bl SpawnProcLocking
.L0801E128:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L0801E130: .4byte 0x00000866
.L0801E134: .4byte gUnknown_0859AE38

	THUMB_FUNC_END HandleNewItemGetFromDrop

	THUMB_FUNC_START SendToConvoyMenu_Draw
SendToConvoyMenu_Draw: @ 0x0801E138
	push {lr}
	bl ItemSelectMenu_TextDraw
	pop {r1}
	bx r1

	THUMB_FUNC_END SendToConvoyMenu_Draw

	THUMB_FUNC_START MenuCommand_DrawExtraItem
MenuCommand_DrawExtraItem: @ 0x0801E144
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, .L0801E180  @ gBmSt
	ldrh r6, [r0, #0x2c]
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	movs r0, #0x2c
	ldrsh r2, [r4, r0]
	lsls r2, r2, #5
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, .L0801E184  @ gBg0Tm
	adds r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutItemMenuLineNoColor
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0801E180: .4byte gBmSt
.L0801E184: .4byte gBg0Tm

	THUMB_FUNC_END MenuCommand_DrawExtraItem

	THUMB_FUNC_START SendToConvoyMenu_NormalEffect
SendToConvoyMenu_NormalEffect: @ 0x0801E188
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, .L0801E1D0  @ gActiveUnit
	ldr r1, [r5]
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl AddItemToConvoy
	ldr r3, .L0801E1D4  @ gAction
	ldr r0, [r5]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r3, #6]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl UnitRemoveItem
	ldr r0, [r5]
	ldr r1, .L0801E1D8  @ gBmSt
	ldrh r1, [r1, #0x2c]
	bl UnitAddItem
	movs r0, #0x37
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0801E1D0: .4byte gActiveUnit
.L0801E1D4: .4byte gAction
.L0801E1D8: .4byte gBmSt

	THUMB_FUNC_END SendToConvoyMenu_NormalEffect

	THUMB_FUNC_START MenuCommand_SendItemToConvoy
MenuCommand_SendItemToConvoy: @ 0x0801E1DC
	push {r4, lr}
	ldr r4, .L0801E1F4  @ gBmSt
	ldrh r0, [r4, #0x2c]
	bl AddItemToConvoy
	ldr r1, .L0801E1F8  @ gAction
	ldrh r0, [r4, #0x2c]
	strh r0, [r1, #6]
	movs r0, #0x37
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0801E1F4: .4byte gBmSt
.L0801E1F8: .4byte gAction

	THUMB_FUNC_END MenuCommand_SendItemToConvoy

	THUMB_FUNC_START SendToConvoyMenu_Selected
SendToConvoyMenu_Selected: @ 0x0801E1FC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, .L0801E244  @ gAction
	ldr r0, .L0801E248  @ gActiveUnit
	ldr r1, [r0]
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #6]
	movs r0, #0
	ldrsb r0, [r4, r0]
	strh r0, [r2, #8]
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadHelpBoxGfx
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, .L0801E24C  @ 0x0000084B
	movs r0, #8
	adds r3, r5, #0
	bl func_0808AA04
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0801E244: .4byte gAction
.L0801E248: .4byte gActiveUnit
.L0801E24C: .4byte 0x0000084B

	THUMB_FUNC_END SendToConvoyMenu_Selected

	THUMB_FUNC_START SendToConvoyMenu_Selected2
SendToConvoyMenu_Selected2: @ 0x0801E250
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, .L0801E288  @ gAction
	ldr r0, .L0801E28C  @ gBmSt
	ldrh r0, [r0, #0x2c]
	strh r0, [r1, #6]
	movs r0, #5
	strh r0, [r1, #8]
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadHelpBoxGfx
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, .L0801E290  @ 0x0000084B
	movs r0, #8
	adds r3, r5, #0
	bl func_0808AA04
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0801E288: .4byte gAction
.L0801E28C: .4byte gBmSt
.L0801E290: .4byte 0x0000084B

	THUMB_FUNC_END SendToConvoyMenu_Selected2

	THUMB_FUNC_START SendToConvoyMenu_Idle
SendToConvoyMenu_Idle: @ 0x0801E294
	push {r4, lr}
	bl GetDialoguePromptResult
	cmp r0, #1
	beq .L0801E2A2
	movs r0, #0
	b .L0801E2C8
.L0801E2A2:
	ldr r0, .L0801E2D0  @ gKeySt
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #8]
	ldr r1, .L0801E2D4  @ gAction
	ldrh r0, [r1, #8]
	cmp r0, #4
	bhi .L0801E2C6
	ldr r4, .L0801E2D8  @ gActiveUnit
	ldr r0, [r4]
	ldrh r1, [r1, #8]
	bl UnitRemoveItem
	ldr r0, [r4]
	ldr r1, .L0801E2DC  @ gBmSt
	ldrh r1, [r1, #0x2c]
	bl UnitAddItem
.L0801E2C6:
	movs r0, #0x37
.L0801E2C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0801E2D0: .4byte gKeySt
.L0801E2D4: .4byte gAction
.L0801E2D8: .4byte gActiveUnit
.L0801E2DC: .4byte gBmSt

	THUMB_FUNC_END SendToConvoyMenu_Idle

.align 2, 0
