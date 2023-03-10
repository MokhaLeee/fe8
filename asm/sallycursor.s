	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Prep Screen!

	THUMB_FUNC_START GetPlayerLeaderPid
GetPlayerLeaderPid: @ 0x08033258
	push {r4, r5, lr}
	ldr r0, .L0803326C  @ gPlaySt
	ldrb r1, [r0, #0x1b]
	cmp r1, #1
	blt .L08033276
	cmp r1, #2
	ble .L08033270
	cmp r1, #3
	beq .L08033274
	b .L08033276
	.align 2, 0
.L0803326C: .4byte gPlaySt
.L08033270:
	movs r5, #1
	b .L08033276
.L08033274:
	movs r5, #0xf
.L08033276:
	ldrb r0, [r0, #0xe]
	cmp r0, #5
	bne .L08033284
	movs r0, #0xf
	b .L080332C4
.L08033280:
	ldrb r0, [r2, #4]
	b .L080332C4
.L08033284:
	bl GetBattleMapKind
	cmp r0, #0
	beq .L080332C2
	adds r0, r5, #0
	bl GetUnitByPid
	cmp r0, #0
	beq .L080332A0
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq .L080332C2
.L080332A0:
	movs r4, #1
.L080332A2:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq .L080332BC
	ldr r2, [r0]
	cmp r2, #0
	beq .L080332BC
	ldr r0, [r0, #0xc]
	ldr r1, .L080332CC  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	beq .L08033280
.L080332BC:
	adds r4, #1
	cmp r4, #0x3f
	ble .L080332A2
.L080332C2:
	adds r0, r5, #0
.L080332C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L080332CC: .4byte 0x0001000C

	THUMB_FUNC_END GetPlayerLeaderPid

	THUMB_FUNC_START func_080332D0
func_080332D0: @ 0x080332D0
	push {r4, r5, lr}
	sub sp, #4
	bl GetChapterAllyUnitDefinitions
	adds r4, r0, #0
	ldr r0, .L08033344  @ gMapRange
	ldr r0, [r0]
	movs r1, #0
	bl MapFill
	ldr r0, .L08033348  @ gMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl MapFill
	bl CountForceDeployedUnits
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq .L08033334
	mov r5, sp
	adds r5, #1
.L08033306:
	adds r0, r4, #0
	mov r1, sp
	adds r2, r5, #0
	movs r3, #0
	bl GenUnitDefinitionFinalPosition
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, .L08033344  @ gMapRange
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	adds r4, #0x14
	ldrb r0, [r4]
	cmp r0, #0
	bne .L08033306
.L08033334:
	movs r0, #0x10
	bl DisplayMoveRangeGraphics
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08033344: .4byte gMapRange
.L08033348: .4byte gMapMovement

	THUMB_FUNC_END func_080332D0

	THUMB_FUNC_START ClosePrepScreenMapMenu
ClosePrepScreenMapMenu: @ 0x0803334C
	push {lr}
	bl EndPrepScreenMenu
	pop {r0}
	bx r0

	THUMB_FUNC_END ClosePrepScreenMapMenu

	THUMB_FUNC_START PrepScreenMapMenu_OnViewMap
PrepScreenMapMenu_OnViewMap: @ 0x08033358
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl Proc_Break
	bl ClosePrepScreenMapMenu
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMapMenu_OnViewMap

	THUMB_FUNC_START PrepScreenMapMenu_OnFormation
PrepScreenMapMenu_OnFormation: @ 0x0803336C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	str r0, [r5, #0x58]
	ldr r4, .L080333A0  @ gBmSt
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl func_0801DB4C
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	movs r2, #0
	bl DisplayCursor
	adds r0, r5, #0
	bl Proc_Break
	bl ClosePrepScreenMapMenu
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080333A0: .4byte gBmSt

	THUMB_FUNC_END PrepScreenMapMenu_OnFormation

	THUMB_FUNC_START PrepScreenMapMenu_OnStartPress
PrepScreenMapMenu_OnStartPress: @ 0x080333A4
	push {r4, lr}
	adds r4, r0, #0
	bl func_08095970
	cmp r0, #0
	beq .L080333BC
	adds r0, r4, #0
	movs r1, #0x37
	bl Proc_Goto
	movs r0, #1
	b .L080333BE
.L080333BC:
	movs r0, #0
.L080333BE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenMapMenu_OnStartPress

	THUMB_FUNC_START PrepScreenMapMenu_OnBPress
PrepScreenMapMenu_OnBPress: @ 0x080333C4
	push {lr}
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenMapMenu_OnBPress

	THUMB_FUNC_START func_080333D4
func_080333D4: @ 0x080333D4
	push {r4, r5, lr}
	bl func_08031688
	adds r5, r0, #0
	cmp r5, #0
	beq .L08033410
	ldr r0, [r5, #0xc]
	movs r1, #9
	negs r1, r1
	ands r0, r1
	str r0, [r5, #0xc]
	ldr r4, .L08033418  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x82
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x84
	ldrb r0, [r0]
	strb r0, [r5, #0x11]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
.L08033410:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08033418: .4byte gPlaySt

	THUMB_FUNC_END func_080333D4

	THUMB_FUNC_START PrepScreenMapMenu_OnOptions
PrepScreenMapMenu_OnOptions: @ 0x0803341C
	push {lr}
	movs r1, #8
	str r1, [r0, #0x58]
	movs r1, #0x39
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMapMenu_OnOptions

	THUMB_FUNC_START func_0803342C
func_0803342C: @ 0x0803342C
	push {lr}
	bl func_08031688
	adds r2, r0, #0
	cmp r2, #0
	beq .L08033452
	ldr r0, [r2, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	negs r0, r0
	strb r0, [r2, #0x11]
	bl RefreshEntityMaps
	bl RefreshUnitSprites
.L08033452:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0803342C

	THUMB_FUNC_START PrepScreenMapMenu_OnSave
PrepScreenMapMenu_OnSave: @ 0x08033458
	push {lr}
	movs r1, #9
	str r1, [r0, #0x58]
	movs r1, #0x3b
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMapMenu_OnSave

	THUMB_FUNC_START PrepScreenMapMenu_OnDebug
PrepScreenMapMenu_OnDebug: @ 0x08033468
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [r4, #0x58]
	bl ClosePrepScreenMapMenu
	ldr r0, .L08033488  @ MenuInfo_Debug
	bl StartMenu
	adds r0, r4, #0
	movs r1, #0x3a
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08033488: .4byte MenuInfo_Debug

	THUMB_FUNC_END PrepScreenMapMenu_OnDebug

	THUMB_FUNC_START func_0803348C
func_0803348C: @ 0x0803348C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, .L080334B8  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x82
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x84
	ldrb r2, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl EnsureCameraOntoPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080334B8: .4byte gPlaySt

	THUMB_FUNC_END func_0803348C

	THUMB_FUNC_START PrepScreenProc_InitMapMenu
PrepScreenProc_InitMapMenu: @ 0x080334BC
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl PrepScreenProc_StartMapMenu
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenProc_InitMapMenu

	THUMB_FUNC_START PrepScreenProc_DimMapImmediate
PrepScreenProc_DimMapImmediate: @ 0x080334CC
	push {lr}
	bl ArchiveCurrentPalettes
	ldr r3, .L080334E4  @ 0xFF00FFF0
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
	pop {r0}
	bx r0
	.align 2, 0
.L080334E4: .4byte 0xFF00FFF0

	THUMB_FUNC_END PrepScreenProc_DimMapImmediate

	THUMB_FUNC_START PrepScreenProc_StartBrightenMap
PrepScreenProc_StartBrightenMap: @ 0x080334E8
	push {lr}
	sub sp, #0x14
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, .L08033510  @ 0xFF00FFF0
	str r1, [sp, #8]
	movs r1, #0x40
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl func_08013800
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
.L08033510: .4byte 0xFF00FFF0

	THUMB_FUNC_END PrepScreenProc_StartBrightenMap

	THUMB_FUNC_START PrepScreenProc_StartDimMap
PrepScreenProc_StartDimMap: @ 0x08033514
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, .L08033544  @ 0xFF00FFF0
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0xc0
	bl func_08013800
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08033544: .4byte 0xFF00FFF0

	THUMB_FUNC_END PrepScreenProc_StartDimMap

	THUMB_FUNC_START func_08033548
func_08033548: @ 0x08033548
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xaa
	movs r1, #0x8c
	movs r2, #2
	adds r3, r4, #0
	bl ShowRIsInfo
	ldr r0, .L0803356C  @ gUnknown_08A199C8
	ldr r1, .L08033570  @ 0x06017000
	bl Decompress
	movs r0, #0
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0803356C: .4byte gUnknown_08A199C8
.L08033570: .4byte 0x06017000

	THUMB_FUNC_END func_08033548

	THUMB_FUNC_START func_08033574
func_08033574: @ 0x08033574
	push {r4, lr}
	sub sp, #4
	ldr r4, .L080335E4  @ Sprite_32x16
	ldr r0, .L080335E8  @ 0x0000238B
	str r0, [sp]
	movs r0, #4
	movs r1, #0x64
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, .L080335EC  @ 0x0000238F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x84
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r3, .L080335F0  @ Sprite_16x16
	ldr r0, .L080335F4  @ 0x00002393
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa4
	movs r2, #0x8c
	bl PutSprite
	ldr r0, .L080335F8  @ 0x00002395
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, .L080335FC  @ 0x00002399
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r3, .L08033600  @ Sprite_8x16
	ldr r0, .L08033604  @ 0x0000239D
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x8c
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080335E4: .4byte Sprite_32x16
.L080335E8: .4byte 0x0000238B
.L080335EC: .4byte 0x0000238F
.L080335F0: .4byte Sprite_16x16
.L080335F4: .4byte 0x00002393
.L080335F8: .4byte 0x00002395
.L080335FC: .4byte 0x00002399
.L08033600: .4byte Sprite_8x16
.L08033604: .4byte 0x0000239D

	THUMB_FUNC_END func_08033574

	THUMB_FUNC_START func_08033608
func_08033608: @ 0x08033608
	push {lr}
	ldr r0, .L0803361C  @ gUnknown_08A1B154
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
.L0803361C: .4byte gUnknown_08A1B154

	THUMB_FUNC_END func_08033608

	THUMB_FUNC_START func_08033620
func_08033620: @ 0x08033620
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08033630  @ gUnknown_0859DBA4
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
.L08033630: .4byte gUnknown_0859DBA4

	THUMB_FUNC_END func_08033620

	THUMB_FUNC_START PrepScreenMapMenu_OnEnd
PrepScreenMapMenu_OnEnd: @ 0x08033634
	push {lr}
	bl HideRIsInfo
	ldr r0, .L08033644  @ gUnknown_0859DBA4
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08033644: .4byte gUnknown_0859DBA4

	THUMB_FUNC_END PrepScreenMapMenu_OnEnd

	THUMB_FUNC_START PrepScreenProc_StartMapMenu
PrepScreenProc_StartMapMenu: @ 0x08033648
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadHelpBoxGfx
	bl ResetText
	bl EndPlayerPhaseSideWindows
	bl HideMoveRangeGraphics
	adds r0, r4, #0
	bl StartPrepScreenMenu
	ldr r1, .L080336C4  @ PrepScreenMapMenu_OnViewMap
	movs r3, #0xb2
	lsls r3, r3, #3
	ldr r0, .L080336C8  @ 0x000005BB
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl SetPrepScreenMenuItem
	bl func_08095970
	movs r2, #0
	cmp r0, #0
	bne .L08033688
	movs r2, #1
.L08033688:
	ldr r1, .L080336CC  @ PrepScreenMapMenu_OnFormation
	ldr r3, .L080336D0  @ 0x00000591
	ldr r0, .L080336D4  @ 0x000005BC
	str r0, [sp]
	movs r0, #2
	bl SetPrepScreenMenuItem
	ldr r1, .L080336D8  @ PrepScreenMapMenu_OnOptions
	ldr r3, .L080336DC  @ 0x00000592
	ldr r0, .L080336E0  @ 0x000005BD
	str r0, [sp]
	movs r0, #8
	movs r2, #0
	bl SetPrepScreenMenuItem
	bl CanPrepScreenSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L080336F0
	ldr r1, .L080336E4  @ PrepScreenMapMenu_OnSave
	ldr r3, .L080336E8  @ 0x00000579
	ldr r0, .L080336EC  @ 0x000005BE
	str r0, [sp]
	movs r0, #9
	movs r2, #0
	bl SetPrepScreenMenuItem
	b .L08033700
	.align 2, 0
.L080336C4: .4byte PrepScreenMapMenu_OnViewMap
.L080336C8: .4byte 0x000005BB
.L080336CC: .4byte PrepScreenMapMenu_OnFormation
.L080336D0: .4byte 0x00000591
.L080336D4: .4byte 0x000005BC
.L080336D8: .4byte PrepScreenMapMenu_OnOptions
.L080336DC: .4byte 0x00000592
.L080336E0: .4byte 0x000005BD
.L080336E4: .4byte PrepScreenMapMenu_OnSave
.L080336E8: .4byte 0x00000579
.L080336EC: .4byte 0x000005BE
.L080336F0:
	ldr r1, .L08033734  @ PrepScreenMapMenu_OnSave
	ldr r3, .L08033738  @ 0x00000579
	ldr r0, .L0803373C  @ 0x000005BE
	str r0, [sp]
	movs r0, #9
	movs r2, #1
	bl SetPrepScreenMenuItem
.L08033700:
	adds r0, r4, #0
	bl func_08033620
	ldr r0, .L08033740  @ PrepScreenMapMenu_OnBPress
	bl SetPrepScreenMenuOnBPress
	ldr r0, .L08033744  @ PrepScreenMapMenu_OnStartPress
	bl SetPrepScreenMenuOnStartPress
	ldr r0, .L08033748  @ PrepScreenMapMenu_OnEnd
	bl SetPrepScreenMenuOnEnd
	movs r0, #0xa
	movs r1, #2
	bl DrawPrepScreenMenuFrameAt
	ldr r0, [r4, #0x58]
	bl SetPrepScreenMenuSelectedItem
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08033734: .4byte PrepScreenMapMenu_OnSave
.L08033738: .4byte 0x00000579
.L0803373C: .4byte 0x000005BE
.L08033740: .4byte PrepScreenMapMenu_OnBPress
.L08033744: .4byte PrepScreenMapMenu_OnStartPress
.L08033748: .4byte PrepScreenMapMenu_OnEnd

	THUMB_FUNC_END PrepScreenProc_StartMapMenu

	THUMB_FUNC_START CanCharacterBePrepMoved
CanCharacterBePrepMoved: @ 0x0803374C
	push {r4, lr}
	adds r4, r0, #0
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L08033766
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	beq .L08033766
	movs r0, #1
	b .L08033768
.L08033766:
	movs r0, #0
.L08033768:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanCharacterBePrepMoved

	THUMB_FUNC_START func_08033770
func_08033770: @ 0x08033770
	adds r1, r0, #0
	adds r1, #0x4a
	movs r2, #0
	strh r2, [r1]
	str r2, [r0, #0x2c]
	str r2, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	ldr r1, .L08033794  @ gMapSize
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
.L08033794: .4byte gMapSize

	THUMB_FUNC_END func_08033770

	THUMB_FUNC_START func_08033798
func_08033798: @ 0x08033798
	movs r1, #0
	str r1, [r0, #0x34]
	movs r1, #2
	str r1, [r0, #0x38]
	ldr r1, .L080337B0  @ gMapSize
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
.L080337B0: .4byte gMapSize

	THUMB_FUNC_END func_08033798

	THUMB_FUNC_START func_080337B4
func_080337B4: @ 0x080337B4
	movs r1, #2
	negs r1, r1
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x38]
	ldr r1, .L080337D0  @ gMapSize
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
.L080337D0: .4byte gMapSize

	THUMB_FUNC_END func_080337B4

	THUMB_FUNC_START func_080337D4
func_080337D4: @ 0x080337D4
	movs r1, #0
	str r1, [r0, #0x34]
	subs r1, #2
	str r1, [r0, #0x38]
	ldr r1, .L080337EC  @ gMapSize
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
.L080337EC: .4byte gMapSize

	THUMB_FUNC_END func_080337D4

	THUMB_FUNC_START func_080337F0
func_080337F0: @ 0x080337F0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, .L08033838  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq .L0803380A
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
.L0803380A:
	adds r0, r3, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, [r3, #0x2c]
	ldr r5, [r3, #0x30]
	cmp r0, #0
	beq .L0803383C
	movs r1, #0xf
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne .L0803383C
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne .L0803383C
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b .L08033864
	.align 2, 0
.L08033838: .4byte gKeySt
.L0803383C:
	ldr r2, [r3, #0x34]
	adds r2, r4, r2
	str r2, [r3, #0x2c]
	ldr r0, [r3, #0x38]
	adds r0, r5, r0
	str r0, [r3, #0x30]
	ldr r1, .L0803386C  @ gBmSt
	strh r2, [r1, #0xc]
	strh r0, [r1, #0xe]
	adds r1, r3, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt .L08033864
	adds r0, r3, #0
	bl Proc_Break
.L08033864:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803386C: .4byte gBmSt

	THUMB_FUNC_END func_080337F0

	THUMB_FUNC_START InitPrepScreenUnitsAndCamera
InitPrepScreenUnitsAndCamera: @ 0x08033870
	push {r4, r5, lr}
	bl LoadUnitPrepScreenPositions
	ldr r4, .L080338B8  @ gPlaySt
	ldrb r1, [r4, #0x14]
	movs r5, #0x10
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne .L08033892
	bl SortPlayerUnitsForPrepScreen
	bl InitPlayerUnitPositionsForPrepScreen
	ldrb r0, [r4, #0x14]
	orrs r0, r5
	strb r0, [r4, #0x14]
.L08033892:
	movs r0, #0
	bl func_08015A40
	ldr r4, .L080338BC  @ gBmSt
	strh r0, [r4, #0xc]
	movs r0, #0
	bl func_08015A6C
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	orrs r0, r5
	strb r0, [r4, #4]
	bl RefreshEntityMaps
	bl RenderMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080338B8: .4byte gPlaySt
.L080338BC: .4byte gBmSt

	THUMB_FUNC_END InitPrepScreenUnitsAndCamera

	THUMB_FUNC_START InitPrepScreenCursorPosition
InitPrepScreenCursorPosition: @ 0x080338C0
	push {r4, r5, lr}
	sub sp, #4
	bl GetPlayerLeaderPid
	bl GetUnitByPid
	adds r4, r0, #0
	cmp r4, #0
	beq .L080338E8
	bl func_08095970
	cmp r0, #0
	beq .L080338E8
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetCursorMapPosition
	b .L0803391A
.L080338E8:
	bl GetChapterAllyUnitDefinitions
	adds r4, r0, #0
	bl CountForceDeployedUnits
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	mov r5, sp
	adds r5, #1
	adds r0, r4, #0
	mov r1, sp
	adds r2, r5, #0
	movs r3, #0
	bl GenUnitDefinitionFinalPosition
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl SetCursorMapPosition
.L0803391A:
	ldr r4, .L0803393C  @ gBmSt
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl func_08015A40
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl func_08015A6C
	strh r0, [r4, #0xe]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0803393C: .4byte gBmSt

	THUMB_FUNC_END InitPrepScreenCursorPosition

	THUMB_FUNC_START func_08033940
func_08033940: @ 0x08033940
	push {r4, lr}
	adds r4, r0, #0
	bl BMXFADEExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0803395E
	ldr r0, [r4, #0x58]
	cmp r0, #2
	bne .L08033958
	bl func_080332D0
.L08033958:
	adds r0, r4, #0
	bl Proc_Break
.L0803395E:
	ldr r1, .L08033974  @ gBmSt
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #0
	bl DisplayCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08033974: .4byte gBmSt

	THUMB_FUNC_END func_08033940

	THUMB_FUNC_START PrepScreenProc_MapIdle
PrepScreenProc_MapIdle: @ 0x08033978
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl HandlePlayerCursorMovement
	bl BMXFADEExists
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803398C
	b .L08033BDC
.L0803398C:
	ldr r0, .L080339C0  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L080339CC
	ldr r1, .L080339C4  @ gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl func_0801DB4C
	ldr r0, .L080339C8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge .L080339B8
	b .L08033BDC
.L080339B8:
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L08033BDC
	.align 2, 0
.L080339C0: .4byte gKeySt
.L080339C4: .4byte gBmSt
.L080339C8: .4byte gPlaySt
.L080339CC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08033A3C
	ldr r4, .L08033A34  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r6, .L08033A38  @ gMapUnit
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq .L08033A3C
	bl GetUnit
	bl CanShowUnitStatScreen
	cmp r0, #0
	beq .L08033A3C
	bl MU_EndAll
	bl EndPlayerPhaseSideWindows
	movs r0, #0x1f
	bl SetStatScreenConfig
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b .L08033BEC
	.align 2, 0
.L08033A34: .4byte gBmSt
.L08033A38: .4byte gMapUnit
.L08033A3C:
	ldr r0, .L08033A68  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08033A74
	bl EndPlayerPhaseSideWindows
	ldr r4, .L08033A6C  @ gPlaySt
	ldr r1, .L08033A70  @ gBmSt
	ldrh r0, [r1, #0x14]
	strb r0, [r4, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	adds r4, #0x41
	ldrb r0, [r4]
	b .L08033B36
	.align 2, 0
.L08033A68: .4byte gKeySt
.L08033A6C: .4byte gPlaySt
.L08033A70: .4byte gBmSt
.L08033A74:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne .L08033A7E
	b .L08033BB4
.L08033A7E:
	ldr r2, .L08033AB0  @ gBmSt
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, .L08033AB4  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl GetUnitSelectionValueThing
	cmp r0, #4
	bls .L08033AA6
	b .L08033BB4
.L08033AA6:
	lsls r0, r0, #2
	ldr r1, .L08033AB8  @ .L08033ABC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08033AB0: .4byte gBmSt
.L08033AB4: .4byte gMapUnit
.L08033AB8: .4byte .L08033ABC
.L08033ABC: @ jump table
	.4byte .L08033AD0 @ case 0
	.4byte .L08033AD0 @ case 1
	.4byte .L08033B48 @ case 2
	.4byte .L08033B90 @ case 3
	.4byte .L08033B70 @ case 4
.L08033AD0:
	bl EndPlayerPhaseSideWindows
	ldr r3, .L08033B1C  @ gPlaySt
	ldr r2, .L08033B20  @ gBmSt
	ldrh r0, [r2, #0x14]
	strb r0, [r3, #0x12]
	ldrh r0, [r2, #0x16]
	strb r0, [r3, #0x13]
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, .L08033B24  @ gMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	bgt .L08033B28
	cmp r0, #6
	blt .L08033B28
	adds r0, r3, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08033B10
	movs r0, #0x6a
	bl m4aSongNumStart
.L08033B10:
	adds r0, r5, #0
	movs r1, #0x3c
	bl Proc_Goto
	b .L08033BEC
	.align 2, 0
.L08033B1C: .4byte gPlaySt
.L08033B20: .4byte gBmSt
.L08033B24: .4byte gMapTerrain
.L08033B28:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, .L08033B44  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
.L08033B36:
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08033BEC
	movs r0, #0x69
	bl m4aSongNumStart
	b .L08033BEC
	.align 2, 0
.L08033B44: .4byte gPlaySt
.L08033B48:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, .L08033B6C  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne .L08033BA4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b .L08033BEC
	.align 2, 0
.L08033B6C: .4byte gActiveUnit
.L08033B70:
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne .L08033B90
	ldr r0, .L08033B8C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08033BEC
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L08033BEC
	.align 2, 0
.L08033B8C: .4byte gPlaySt
.L08033B90:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, .L08033BB0  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
.L08033BA4:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b .L08033BEC
	.align 2, 0
.L08033BB0: .4byte gActiveUnit
.L08033BB4:
	ldr r0, .L08033BD8  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq .L08033BDC
	bl EndPlayerPhaseSideWindows
	adds r0, r5, #0
	bl func_080A87DC
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b .L08033BEC
	.align 2, 0
.L08033BD8: .4byte gKeySt
.L08033BDC:
	ldr r1, .L08033BF4  @ gBmSt
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r3, #0x22
	ldrsh r1, [r1, r3]
	movs r2, #0
	bl DisplayCursor
.L08033BEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08033BF4: .4byte gBmSt

	THUMB_FUNC_END PrepScreenProc_MapIdle

	THUMB_FUNC_START func_08033BF8
func_08033BF8: @ 0x08033BF8
	push {lr}
	ldr r0, .L08033C0C  @ gUnknown_0859DBBC
	bl FindProc
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L08033C0C: .4byte gUnknown_0859DBBC

	THUMB_FUNC_END func_08033BF8

	THUMB_FUNC_START PrepScreen_StartUnitSwap
PrepScreen_StartUnitSwap: @ 0x08033C10
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, .L08033C7C  @ SpriteAnim_Unknown_085A0EA0
	movs r1, #0
	bl StartSpriteAnim
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl SetSpriteAnimId
	str r4, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x4a
	movs r0, #2
	strh r0, [r1]
	ldr r1, .L08033C80  @ gBmSt
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x3c]
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x40]
	ldr r0, .L08033C84  @ 0x00000872
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl StartBottomHelpText
	ldr r0, .L08033C88  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	ldr r0, .L08033C8C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08033C74
	movs r0, #0x69
	bl m4aSongNumStart
.L08033C74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08033C7C: .4byte SpriteAnim_Unknown_085A0EA0
.L08033C80: .4byte gBmSt
.L08033C84: .4byte 0x00000872
.L08033C88: .4byte gActiveUnit
.L08033C8C: .4byte gPlaySt

	THUMB_FUNC_END PrepScreen_StartUnitSwap

	THUMB_FUNC_START PrepScreen_UnitSwapIdle
PrepScreen_UnitSwapIdle: @ 0x08033C90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, .L08033D28  @ gBmSt
	movs r0, #0x16
	ldrsh r1, [r6, r0]
	ldr r0, .L08033D2C  @ gMapRange
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0x14
	ldrsh r2, [r6, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r7, [r0]
	ldr r0, .L08033D30  @ gMapUnit
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitSelectionValueThing
	cmp r0, #4
	bne .L08033CC8
	movs r7, #0
.L08033CC8:
	bl HandlePlayerCursorMovement
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	movs r5, #0xc
	ldrsh r1, [r6, r5]
	subs r5, r0, r1
	ldr r0, [r4, #0x40]
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi .L08033D04
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi .L08033D04
	subs r2, #0xc
	ldr r3, .L08033D34  @ Sprite_16x16
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl PutSprite
.L08033D04:
	ldr r0, .L08033D38  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08033D54
	cmp r7, #0
	beq .L08033D3C
	ldr r0, [r4, #0x54]
	bl EndSpriteAnim
	adds r0, r4, #0
	bl Proc_Break
	bl EndBottomHelpText
	b .L08033DCA
	.align 2, 0
.L08033D28: .4byte gBmSt
.L08033D2C: .4byte gMapRange
.L08033D30: .4byte gMapUnit
.L08033D34: .4byte Sprite_16x16
.L08033D38: .4byte gKeySt
.L08033D3C:
	ldr r0, .L08033D50  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08033DCA
	movs r0, #0x6c
	bl m4aSongNumStart
	b .L08033DCA
	.align 2, 0
.L08033D50: .4byte gPlaySt
.L08033D54:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08033D88
	ldr r0, [r4, #0x54]
	bl EndSpriteAnim
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	bl EndBottomHelpText
	ldr r0, .L08033D84  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08033DCA
	movs r0, #0x6b
	bl m4aSongNumStart
	b .L08033DCA
	.align 2, 0
.L08033D84: .4byte gPlaySt
.L08033D88:
	lsls r0, r7, #0x18
	asrs r3, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4a
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r3, r2
	beq .L08033DAA
	ldr r0, [r4, #0x54]
	movs r1, #0
	cmp r3, #0
	bne .L08033DA6
	movs r1, #1
.L08033DA6:
	bl SetSpriteAnimId
.L08033DAA:
	ldr r0, [r4, #0x54]
	ldr r3, .L08033DD4  @ gBmSt
	movs r2, #0x20
	ldrsh r1, [r3, r2]
	movs r4, #0xc
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	movs r4, #0x22
	ldrsh r2, [r3, r4]
	movs r4, #0xe
	ldrsh r3, [r3, r4]
	subs r2, r2, r3
	bl DisplaySpriteAnim
	asrs r0, r6, #0x18
	strh r0, [r5]
.L08033DCA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08033DD4: .4byte gBmSt

	THUMB_FUNC_END PrepScreen_UnitSwapIdle

	THUMB_FUNC_START func_08033DD8
func_08033DD8: @ 0x08033DD8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, .L08033E04  @ gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08033E04: .4byte gActiveUnit

	THUMB_FUNC_END func_08033DD8

	THUMB_FUNC_START PrepScreen_StartUnitSwapAnim
PrepScreen_StartUnitSwapAnim: @ 0x08033E08
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, .L08033E44  @ gActiveUnit
	ldr r5, [r0]
	ldr r6, .L08033E48  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, .L08033E4C  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne .L08033E50
	movs r0, #0x14
	ldrsh r2, [r6, r0]
	movs r1, #0x16
	ldrsh r3, [r6, r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartUnitSwapAnimation
	b .L08033E70
	.align 2, 0
.L08033E44: .4byte gActiveUnit
.L08033E48: .4byte gBmSt
.L08033E4C: .4byte gMapUnit
.L08033E50:
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartUnitSwapAnimation
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	adds r0, r7, #0
	adds r1, r4, #0
	bl StartUnitSwapAnimation
.L08033E70:
	ldr r0, .L08033E88  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08033E82
	movs r0, #0x61
	bl m4aSongNumStart
.L08033E82:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08033E88: .4byte gPlaySt

	THUMB_FUNC_END PrepScreen_StartUnitSwapAnim

	THUMB_FUNC_START InitMapChangeGraphicsIfFog
InitMapChangeGraphicsIfFog: @ 0x08033E8C
	push {lr}
	ldr r0, .L08033EA0  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L08033E9A
	bl RenderMapForFade
.L08033E9A:
	pop {r0}
	bx r0
	.align 2, 0
.L08033EA0: .4byte gPlaySt

	THUMB_FUNC_END InitMapChangeGraphicsIfFog

	THUMB_FUNC_START DisplayMapChangeIfFog
DisplayMapChangeIfFog: @ 0x08033EA4
	push {lr}
	ldr r0, .L08033EBC  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L08033EB8
	bl RenderMap
	movs r0, #0
	bl StartBMXFADE
.L08033EB8:
	pop {r0}
	bx r0
	.align 2, 0
.L08033EBC: .4byte gPlaySt

	THUMB_FUNC_END DisplayMapChangeIfFog

	THUMB_FUNC_START PrepScreenProc_StartConfigMenu
PrepScreenProc_StartConfigMenu: @ 0x08033EC0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08033ED0  @ gUnknown_08A2ED88
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
.L08033ED0: .4byte gUnknown_08A2ED88

	THUMB_FUNC_END PrepScreenProc_StartConfigMenu

	THUMB_FUNC_START PrepScreenProc_StartShopScreen
PrepScreenProc_StartShopScreen: @ 0x08033ED4
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, .L08033F0C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r1, sp
	ldr r2, .L08033F10  @ gBmSt
	ldrh r0, [r2, #0x14]
	strb r0, [r1, #0x18]
	ldrh r0, [r2, #0x16]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl CheckEventDefinition
	cmp r0, #0
	beq .L08033F2A
	ldr r0, [sp, #0xc]
	cmp r0, #0x16
	beq .L08033F14
	cmp r0, #0x17
	beq .L08033F20
	b .L08033F2A
	.align 2, 0
.L08033F0C: .4byte gPlaySt
.L08033F10: .4byte gBmSt
.L08033F14:
	ldr r1, [sp, #4]
	movs r0, #0
	adds r2, r4, #0
	bl StartArmoryScreen
	b .L08033F2A
.L08033F20:
	ldr r1, [sp, #4]
	movs r0, #0
	adds r2, r4, #0
	bl StartVendorScreen
.L08033F2A:
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenProc_StartShopScreen

	THUMB_FUNC_START func_08033F34
func_08033F34: @ 0x08033F34
	push {r4, r5, lr}
	adds r5, r0, #0
	bl HandlePlayerCursorMovement
	ldr r0, .L08033F90  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq .L08033FA0
	bl MU_EndAll
	ldr r0, .L08033F94  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r2, .L08033F98  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r0, .L08033F9C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08033F84
	movs r0, #0x6b
	bl m4aSongNumStart
.L08033F84:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b .L08034058
	.align 2, 0
.L08033F90: .4byte gKeySt
.L08033F94: .4byte gActiveUnit
.L08033F98: .4byte gBmSt
.L08033F9C: .4byte gPlaySt
.L08033FA0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L08034002
	ldr r2, .L08034060  @ gBmSt
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, .L08034064  @ gMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, .L08034068  @ gActiveUnitMoveOrigin
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne .L08033FD2
	ldr r0, .L0803406C  @ gActiveUnit
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
.L08033FD2:
	cmp r4, #0
	beq .L08034002
	adds r0, r4, #0
	bl GetUnit
	bl CanShowUnitStatScreen
	cmp r0, #0
	beq .L08034002
	bl MU_EndAll
	movs r0, #0x1f
	bl SetStatScreenConfig
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
.L08034002:
	ldr r0, .L08034070  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L08034048
	ldr r0, .L0803406C  @ gActiveUnit
	ldr r0, [r0]
	cmp r0, #0
	beq .L08034048
	ldr r4, .L08034068  @ gActiveUnitMoveOrigin
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetCursorMapPosition
	ldr r0, .L08034074  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08034048
	movs r0, #0x6b
	bl m4aSongNumStart
.L08034048:
	ldr r1, .L08034060  @ gBmSt
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl DisplayCursor
.L08034058:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08034060: .4byte gBmSt
.L08034064: .4byte gMapUnit
.L08034068: .4byte gActiveUnitMoveOrigin
.L0803406C: .4byte gActiveUnit
.L08034070: .4byte gKeySt
.L08034074: .4byte gPlaySt

	THUMB_FUNC_END func_08033F34

	THUMB_FUNC_START PrepScreenProc_Cleanup
PrepScreenProc_Cleanup: @ 0x08034078
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	adds r0, r4, #0
	bl EndAllProcChildren
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenProc_Cleanup

	THUMB_FUNC_START func_08034090
func_08034090: @ 0x08034090
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, .L080340AC  @ gActiveUnit
	ldr r2, [r5]
	cmp r2, #0
	bne .L080340B0
	bl InitBmDisplay
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b .L08034102
	.align 2, 0
.L080340AC: .4byte gActiveUnit
.L080340B0:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, .L08034108  @ gMapUnit
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	bl InitBmDisplay
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
.L08034102:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08034108: .4byte gMapUnit

	THUMB_FUNC_END func_08034090

	THUMB_FUNC_START StartPrepScreenSaveMenu
StartPrepScreenSaveMenu: @ 0x0803410C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, .L08034164  @ gPlaySt
	adds r4, r2, #0
	adds r4, #0x4a
	ldrb r1, [r4]
	movs r5, #0xf
	negs r5, r5
	adds r0, r5, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r2, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne .L08034146
	bl GetBattleMapKind
	subs r0, #1
	cmp r0, #1
	bhi .L08034146
	ldrb r0, [r4]
	adds r1, r5, #0
	ands r1, r0
	movs r0, #8
	orrs r1, r0
	strb r1, [r4]
.L08034146:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl PositionUnitsAccordingToDeployment
	adds r0, r6, #0
	bl Start_savemenu2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08034164: .4byte gPlaySt

	THUMB_FUNC_END StartPrepScreenSaveMenu

	THUMB_FUNC_START func_08034168
func_08034168: @ 0x08034168
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	ldr r2, .L08034190  @ gPlaySt
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
.L08034190: .4byte gPlaySt

	THUMB_FUNC_END func_08034168

	THUMB_FUNC_START func_08034194
func_08034194: @ 0x08034194
	push {lr}
	sub sp, #4
	bl CheckGameLinkArenaBit
	cmp r0, #0
	bne .L080341C8
	ldr r0, .L080341B4  @ gGmData
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq .L080341B8
	bl func_080B9FC0
	b .L080341C8
	.align 2, 0
.L080341B4: .4byte gGmData
.L080341B8:
	movs r2, #0x80
	lsls r2, r2, #1
	str r1, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x18
	bl func_080029E8
.L080341C8:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08034194

	THUMB_FUNC_START PrepScreenProc_LockGame
PrepScreenProc_LockGame: @ 0x080341D0
	push {lr}
	bl LockGameLogic
	bl LockBmDisplay
	ldr r2, .L080341FC  @ gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
.L080341FC: .4byte gDispIo

	THUMB_FUNC_END PrepScreenProc_LockGame

	THUMB_FUNC_START PrepScreenProc_HideEverythingAndUnlockGame
PrepScreenProc_HideEverythingAndUnlockGame: @ 0x08034200
	push {lr}
	bl UnlockGameLogic
	bl UnlockBmDisplay
	bl BlackenScreen
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenProc_HideEverythingAndUnlockGame

	THUMB_FUNC_START ShrinkPlayerUnitList
ShrinkPlayerUnitList: @ 0x08034214
	push {r4, lr}
	ldr r0, .L08034268  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L08034262
	ldr r0, .L0803426C  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne .L08034262
	ldr r0, .L08034270  @ gBuf
	bl InitUnitStack
	movs r4, #1
.L08034236:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L08034258
	ldr r0, [r2]
	cmp r0, #0
	beq .L08034258
	ldr r0, [r2, #0xc]
	ldr r1, .L08034274  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne .L08034258
	adds r0, r2, #0
	bl PushUnit
.L08034258:
	adds r4, #1
	cmp r4, #0x3f
	ble .L08034236
	bl LoadPlayerUnitsFromUnitStack2
.L08034262:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08034268: .4byte gPlaySt
.L0803426C: .4byte gBmSt
.L08034270: .4byte gBuf
.L08034274: .4byte 0x0001000C

	THUMB_FUNC_END ShrinkPlayerUnitList

	THUMB_FUNC_START EndPrepScreen
EndPrepScreen: @ 0x08034278
	push {r4, lr}
	movs r4, #1
.L0803427C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq .L080342BA
	ldr r3, [r2]
	cmp r3, #0
	beq .L080342BA
	ldr r1, [r2, #0xc]
	movs r0, #3
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0xc]
	ldr r0, .L080342B0  @ gUnknown_02010004
	ands r0, r1
	cmp r0, #0
	bne .L080342BA
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq .L080342B4
	ldrb r0, [r3, #4]
	bl func_080A48F0
	b .L080342BA
	.align 2, 0
.L080342B0: .4byte gUnknown_02010004
.L080342B4:
	ldrb r0, [r3, #4]
	bl BWL_IncrementDeployCount
.L080342BA:
	adds r4, #1
	cmp r4, #0x3f
	ble .L0803427C
	bl ShrinkPlayerUnitList
	ldr r0, .L080342F0  @ gUnknown_0859DBBC
	bl EndEachProc
	ldr r3, .L080342F4  @ gBmSt
	ldrb r2, [r3, #4]
	movs r1, #0xef
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #4]
	ldr r2, .L080342F8  @ gPlaySt
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	adds r2, #0x4a
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L080342F0: .4byte gUnknown_0859DBBC
.L080342F4: .4byte gBmSt
.L080342F8: .4byte gPlaySt

	THUMB_FUNC_END EndPrepScreen

	THUMB_FUNC_START func_080342FC
func_080342FC: @ 0x080342FC
	push {lr}
	ldr r0, .L08034310  @ gUnknown_0859DBBC
	bl FindProc
	cmp r0, #0
	beq .L0803430A
	movs r0, #1
.L0803430A:
	pop {r1}
	bx r1
	.align 2, 0
.L08034310: .4byte gUnknown_0859DBBC

	THUMB_FUNC_END func_080342FC

.align 2, 0
