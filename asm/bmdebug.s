	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START func_0801BB98
func_0801BB98: @ 0x0801BB98
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl func_080AEC94
	adds r4, r0, #0
	adds r6, r5, #0
	adds r6, #0x3c
	movs r0, #0
	strb r0, [r6]
	bl GetCurrentBgmSong
	movs r1, #0
	cmp r1, r4
	bge .L0801BBCC
	cmp r0, #0
	bne .L0801BBBC
	strb r1, [r6]
	b .L0801BBCC
.L0801BBBC:
	adds r1, #1
	cmp r1, r4
	bge .L0801BBCC
	cmp r0, r1
	bne .L0801BBBC
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
.L0801BBCC:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r1, .L0801BC14  @ gUnknown_08A20E74
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r1, #0xc
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L0801BC18  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0801BC14: .4byte gUnknown_08A20E74
.L0801BC18: .4byte gBg0Tm

	THUMB_FUNC_END func_0801BB98

	THUMB_FUNC_START func_0801BC1C
func_0801BC1C: @ 0x0801BC1C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, .L0801BCC0  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0801BC38
	adds r1, r6, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
.L0801BC38:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	adds r5, r6, #0
	adds r5, #0x3c
	cmp r0, #0
	beq .L0801BC4E
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
.L0801BC4E:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge .L0801BC5C
	movs r0, #0
	strb r0, [r1]
.L0801BC5C:
	ldr r7, .L0801BCC4  @ gUnknown_08A20E74
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	bge .L0801BC72
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
.L0801BC72:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq .L0801BCB8
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L0801BCC8  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
.L0801BCB8:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0801BCC0: .4byte gKeySt
.L0801BCC4: .4byte gUnknown_08A20E74
.L0801BCC8: .4byte gBg0Tm

	THUMB_FUNC_END func_0801BC1C

	THUMB_FUNC_START EndMenuAndClear
EndMenuAndClear: @ 0x0801BCCC
	push {lr}
	bl EndMenu
	movs r0, #0
	bl EndFaceById
	bl ClearBg0Bg1
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_END EndMenuAndClear

	THUMB_FUNC_START DebugMapMenu_DisplayInfoDraw
DebugMapMenu_DisplayInfoDraw: @ 0x0801BCE4
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, .L0801BD4C  @ gUnknown_0859AA5C
	bl FindProc
	adds r4, r0, #0
	adds r6, r5, #0
	adds r6, #0x34
	adds r0, r6, #0
	bl ClearText
	ldr r0, [r5, #0x30]
	ldrh r0, [r0, #4]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, .L0801BD50  @ gUnknown_0859AA7C
	adds r4, #0x66
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L0801BD54  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0801BD4C: .4byte gUnknown_0859AA5C
.L0801BD50: .4byte gUnknown_0859AA7C
.L0801BD54: .4byte gBg0Tm

	THUMB_FUNC_END DebugMapMenu_DisplayInfoDraw

	THUMB_FUNC_START DebugMapMenu_DisplayInfoIdle
DebugMapMenu_DisplayInfoIdle: @ 0x0801BD58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L0801BD98  @ gUnknown_0859AA5C
	bl FindProc
	adds r2, r0, #0
	ldr r0, .L0801BD9C  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	cmp r0, #0
	beq .L0801BD90
	adds r2, #0x66
	ldrh r0, [r2]
	movs r1, #1
	eors r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl DebugMapMenu_DisplayInfoDraw
	movs r0, #1
	negs r0, r0
	movs r1, #9
	bl DebugInitObj
.L0801BD90:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0801BD98: .4byte gUnknown_0859AA5C
.L0801BD9C: .4byte gKeySt

	THUMB_FUNC_END DebugMapMenu_DisplayInfoIdle

	THUMB_FUNC_START DebugMapMenu_DisplayInfoEffect
DebugMapMenu_DisplayInfoEffect: @ 0x0801BDA0
	movs r0, #0
	bx lr

	THUMB_FUNC_END DebugMapMenu_DisplayInfoEffect

	THUMB_FUNC_START DebugMenu_WeatherDraw
DebugMenu_WeatherDraw: @ 0x0801BDA4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, .L0801BE1C  @ gUnknown_080D7A6C
	mov r0, sp
	movs r2, #0xe
	bl memcpy
	ldr r0, .L0801BE20  @ gUnknown_0859AA5C
	bl FindProc
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r5, #0x30]
	ldrh r0, [r0, #4]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, [r6, #0x58]
	movs r1, #7
	bl __modsi3
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L0801BE24  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
.L0801BE1C: .4byte gUnknown_080D7A6C
.L0801BE20: .4byte gUnknown_0859AA5C
.L0801BE24: .4byte gBg0Tm

	THUMB_FUNC_END DebugMenu_WeatherDraw

	THUMB_FUNC_START DebugMenu_WeatherIdle
DebugMenu_WeatherIdle: @ 0x0801BE28
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, .L0801BE94  @ gUnknown_0859AA5C
	bl FindProc
	adds r4, r0, #0
	ldr r5, .L0801BE98  @ gKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0801BE4A
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
.L0801BE4A:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0801BE5C
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
.L0801BE5C:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	bge .L0801BE66
	movs r0, #6
	str r0, [r4, #0x58]
.L0801BE66:
	ldr r0, [r4, #0x58]
	cmp r0, #6
	ble .L0801BE70
	movs r0, #0
	str r0, [r4, #0x58]
.L0801BE70:
	adds r0, r6, #0
	adds r1, r7, #0
	bl DebugMenu_WeatherDraw
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq .L0801BEF2
	ldr r0, [r4, #0x58]
	cmp r0, #6
	bhi .L0801BEF2
	lsls r0, r0, #2
	ldr r1, .L0801BE9C  @ .L0801BEA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0801BE94: .4byte gUnknown_0859AA5C
.L0801BE98: .4byte gKeySt
.L0801BE9C: .4byte .L0801BEA0
.L0801BEA0: @ jump table
	.4byte .L0801BEBC @ case 0
	.4byte .L0801BEC4 @ case 1
	.4byte .L0801BECC @ case 2
	.4byte .L0801BED4 @ case 3
	.4byte .L0801BEDC @ case 4
	.4byte .L0801BEE4 @ case 5
	.4byte .L0801BEEC @ case 6
.L0801BEBC:
	movs r0, #0
	bl SetWeather
	b .L0801BEF2
.L0801BEC4:
	movs r0, #6
	bl SetWeather
	b .L0801BEF2
.L0801BECC:
	movs r0, #1
	bl SetWeather
	b .L0801BEF2
.L0801BED4:
	movs r0, #2
	bl SetWeather
	b .L0801BEF2
.L0801BEDC:
	movs r0, #4
	bl SetWeather
	b .L0801BEF2
.L0801BEE4:
	movs r0, #3
	bl SetWeather
	b .L0801BEF2
.L0801BEEC:
	movs r0, #5
	bl SetWeather
.L0801BEF2:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END DebugMenu_WeatherIdle

	THUMB_FUNC_START DebugMenu_WeatherEffect
DebugMenu_WeatherEffect: @ 0x0801BEFC
	movs r0, #0
	bx lr

	THUMB_FUNC_END DebugMenu_WeatherEffect

	THUMB_FUNC_START DebugMenu_ClearDraw
DebugMenu_ClearDraw: @ 0x0801BF00
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r5, #0x30]
	ldrh r0, [r0, #4]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0xd7
	lsls r0, r0, #3
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #2
	bl Text_InsertDrawString
	bl GetGlobalCompletionCount
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L0801BF68  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0801BF68: .4byte gBg0Tm

	THUMB_FUNC_END DebugMenu_ClearDraw

	THUMB_FUNC_START DebugMenu_ClearIdle
DebugMenu_ClearIdle: @ 0x0801BF6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r4, .L0801BFEC  @ gKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq .L0801C008
	bl GetGlobalCompletionCount
	adds r5, r0, #0
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0801BF9A
	cmp r5, #0
	blt .L0801BF9A
	subs r5, #1
.L0801BF9A:
	ldr r0, .L0801BFEC  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0801BFAE
	cmp r5, #0xb
	bgt .L0801BFAE
	adds r5, #1
.L0801BFAE:
	mov r0, sp
	bl LoadGeneralGameMetadata
	add r1, sp, #0x14
	movs r2, #0
	mov r0, sp
	adds r0, #0x1f
.L0801BFBC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge .L0801BFBC
	movs r4, #0
	cmp r4, r5
	bge .L0801BFD8
.L0801BFCA:
	adds r4, #1
	mov r0, sp
	adds r1, r4, #0
	bl GGM_RegisterCompletedPlaythrough
	cmp r4, r5
	blt .L0801BFCA
.L0801BFD8:
	cmp r5, #0
	bne .L0801BFF0
	mov r2, sp
	ldrb r1, [r2, #0xe]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #0xe]
	b .L0801BFFA
	.align 2, 0
.L0801BFEC: .4byte gKeySt
.L0801BFF0:
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #0xe]
.L0801BFFA:
	mov r0, sp
	bl SaveGeneralGameMetadata
	adds r0, r6, #0
	adds r1, r7, #0
	bl DebugMenu_ClearDraw
.L0801C008:
	movs r0, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END DebugMenu_ClearIdle

	THUMB_FUNC_START DebugMenu_ClearEffect
DebugMenu_ClearEffect: @ 0x0801C014
	movs r0, #0x17
	bx lr

	THUMB_FUNC_END DebugMenu_ClearEffect

	THUMB_FUNC_START DebugMenu_ErasedEffect
DebugMenu_ErasedEffect: @ 0x0801C018
	push {lr}
	bl ClearBg0Bg1
	ldr r0, .L0801C02C  @ MenuInfo_DebugClear
	bl StartMenu
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
.L0801C02C: .4byte MenuInfo_DebugClear

	THUMB_FUNC_END DebugMenu_ErasedEffect

	THUMB_FUNC_START DebugClearMenu_ClearFile
DebugClearMenu_ClearFile: @ 0x0801C030
	push {lr}
	bl RegisterCompletedPlaythrough
	ldr r2, .L0801C058  @ gPlaySt
	ldrb r1, [r2, #0x14]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2, #0x14]
	bl CleanupUnitsBeforeChapter
	bl GetLastUsedGameSaveSlot
	bl SaveGame
	movs r0, #0xff
	bl SoftReset
	pop {r1}
	bx r1
	.align 2, 0
.L0801C058: .4byte gPlaySt

	THUMB_FUNC_END DebugClearMenu_ClearFile

	THUMB_FUNC_START DebugMenuInit
DebugMenuInit: @ 0x0801C05C
	push {r4, lr}
	ldr r1, .L0801C084  @ gUnknown_03001780
	ldr r0, .L0801C088  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	strb r0, [r1]
	ldr r4, .L0801C08C  @ gBg0Tm+0xCE
	movs r0, #0
	bl GetChapterInfo
	ldr r1, [r0]
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0801C084: .4byte gUnknown_03001780
.L0801C088: .4byte gPlaySt
.L0801C08C: .4byte gBg0Tm+0xCE

	THUMB_FUNC_END DebugMenuInit

	THUMB_FUNC_START DEBUGONLY_Startup
DEBUGONLY_Startup: @ 0x0801C090
	push {r4, lr}
	ldr r0, .L0801C0E0  @ OnGameLoopMain
	bl SetMainFunc
	ldr r0, .L0801C0E4  @ OnVBlank
	bl SetOnVBlank
	bl InitBmDisplay
	movs r0, #2
	movs r1, #0
	bl DebugInitBg
	ldr r0, .L0801C0E8  @ gUnknown_080D7A7C
	bl func_08008A24
	ldr r0, .L0801C0EC  @ MenuInfo_DebugContinue
	bl StartMenu
	ldr r4, .L0801C0F0  @ gBmSt
	ldrb r2, [r4, #4]
	movs r1, #0x40
	orrs r1, r2
	strb r1, [r4, #4]
	ldr r1, .L0801C0F4  @ 0x0600B000
	movs r2, #1
	negs r2, r2
	bl StartScreenMenuScrollingBg
	ldrb r1, [r4, #4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r4, #4]
	ldr r0, .L0801C0F8  @ gBg2Tm+0x40
	bl PutBuildInfo
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801C0E0: .4byte OnGameLoopMain
.L0801C0E4: .4byte OnVBlank
.L0801C0E8: .4byte gUnknown_080D7A7C
.L0801C0EC: .4byte MenuInfo_DebugContinue
.L0801C0F0: .4byte gBmSt
.L0801C0F4: .4byte 0x0600B000
.L0801C0F8: .4byte gBg2Tm+0x40

	THUMB_FUNC_END DEBUGONLY_Startup

	THUMB_FUNC_START DebugContinueMenuInit
DebugContinueMenuInit: @ 0x0801C0FC
	push {lr}
	sub sp, #0x14
	ldr r0, [r0, #0x48]
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bl EnableBgSync
	add r0, sp, #4
	movs r1, #3
	bl SaveMetadata_Load
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne .L0801C12C
	ldr r2, [sp, #0x10]
	lsrs r0, r2, #0x10
	adds r0, r2, r0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq .L0801C14C
.L0801C12C:
	ldr r0, .L0801C148  @ 0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0x14
	movs r2, #0x20
	movs r3, #0x50
	bl StartFace
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #2
	b .L0801C182
	.align 2, 0
.L0801C148: .4byte 0x00000103
.L0801C14C:
	movs r0, #0xff
	ands r2, r0
	adds r0, r2, #0
	movs r1, #0x64
	bl __umodsi3
	adds r1, r0, #1
	ldr r0, .L0801C194  @ 0x00000103
	str r0, [sp]
	movs r0, #0
	movs r2, #0x20
	movs r3, #0x50
	bl StartFace
	ldr r0, [sp, #0x10]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r0, r0, #8
	movs r1, #0x64
	bl __umodsi3
	adds r1, r0, #1
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
.L0801C182:
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	movs r0, #0
	add sp, #0x14
	pop {r1}
	bx r1
	.align 2, 0
.L0801C194: .4byte 0x00000103

	THUMB_FUNC_END DebugContinueMenuInit

	THUMB_FUNC_START DebugContinueMenuEnd
DebugContinueMenuEnd: @ 0x0801C198
	push {lr}
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	ldr r2, .L0801C1D4  @ gDispIo
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
	ldr r1, .L0801C1D8  @ gPal
	movs r0, #0
	strh r0, [r1]
	bl EnablePalSync
	pop {r1}
	bx r1
	.align 2, 0
.L0801C1D4: .4byte gDispIo
.L0801C1D8: .4byte gPal

	THUMB_FUNC_END DebugContinueMenuEnd

	THUMB_FUNC_START UNUSED_StartupDebugMenu_WorldMapEffect
UNUSED_StartupDebugMenu_WorldMapEffect: @ 0x0801C1DC
	push {lr}
	bl GetGameTime
	bl RandInit
	bl InitUnits
	movs r3, #1
	negs r3, r3
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SaveNewGame
	ldr r0, .L0801C21C  @ 0x0000026A
	bl GetMsg
	bl SetTacticianName
	ldr r1, .L0801C220  @ gPlaySt
	movs r0, #1
	strb r0, [r1, #0xe]
	movs r0, #0
	bl SaveGame
	bl CleanupUnitsBeforeChapter
	bl nullsub_RestartGameAndGoto7
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
.L0801C21C: .4byte 0x0000026A
.L0801C220: .4byte gPlaySt

	THUMB_FUNC_END UNUSED_StartupDebugMenu_WorldMapEffect

	THUMB_FUNC_START UNUSED_StartupDebugMenu_ChapterSelectIdle
UNUSED_StartupDebugMenu_ChapterSelectIdle: @ 0x0801C224
	push {lr}
	adds r3, r1, #0
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, #2
	adds r0, #0x2d
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r2, #0xb
	adds r0, r3, #0
	bl DebugMenuMapIdleCore
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END UNUSED_StartupDebugMenu_ChapterSelectIdle

	THUMB_FUNC_START UNUSED_StartupDebugMenu_ChapterSelectEffect
UNUSED_StartupDebugMenu_ChapterSelectEffect: @ 0x0801C248
	push {r4, lr}
	adds r4, r1, #0
	bl GetGameTime
	bl RandInit
	bl InitUnits
	ldr r0, .L0801C278  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq .L0801C27C
	movs r3, #1
	negs r3, r3
	movs r0, #0
	movs r1, #1
	movs r2, #0
	bl SaveNewGame
	b .L0801C28A
	.align 2, 0
.L0801C278: .4byte gKeySt
.L0801C27C:
	movs r3, #1
	negs r3, r3
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SaveNewGame
.L0801C28A:
	ldr r0, .L0801C2C4  @ 0x0000026A
	bl GetMsg
	bl SetTacticianName
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl func_0801C650
	ldr r1, .L0801C2C8  @ gPlaySt
	strb r0, [r1, #0xe]
	ldr r0, .L0801C2CC  @ gUnknown_03001780
	ldrb r0, [r0]
	strb r0, [r1, #0x1b]
	movs r0, #0
	bl SaveGame
	bl CleanupUnitsBeforeChapter
	bl nullsub_9
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L0801C2C4: .4byte 0x0000026A
.L0801C2C8: .4byte gPlaySt
.L0801C2CC: .4byte gUnknown_03001780

	THUMB_FUNC_END UNUSED_StartupDebugMenu_ChapterSelectEffect

	THUMB_FUNC_START func_0801C2D0
func_0801C2D0: @ 0x0801C2D0
	push {lr}
	ldr r0, .L0801C2E0  @ MenuInfo_DebugChuudan
	bl StartMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L0801C2E0: .4byte MenuInfo_DebugChuudan

	THUMB_FUNC_END func_0801C2D0

	THUMB_FUNC_START func_0801C2E4
func_0801C2E4: @ 0x0801C2E4
	push {lr}
	ldr r0, .L0801C2F4  @ MenuInfo_DebugCharge
	bl StartMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L0801C2F4: .4byte MenuInfo_DebugCharge

	THUMB_FUNC_END func_0801C2E4

	THUMB_FUNC_START func_0801C2F8
func_0801C2F8: @ 0x0801C2F8
	push {lr}
	movs r0, #3
	bl Start_savemenu2
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END func_0801C2F8

	THUMB_FUNC_START DebugChuudanMenu_IsManualSaveAvailable
DebugChuudanMenu_IsManualSaveAvailable: @ 0x0801C308
	movs r0, #2
	bx lr

	THUMB_FUNC_END DebugChuudanMenu_IsManualSaveAvailable

	THUMB_FUNC_START DebugChuudanMenu_ManualSave
DebugChuudanMenu_ManualSave: @ 0x0801C30C
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne .L0801C320
	movs r0, #4
	bl SaveSuspendedGame
	movs r0, #0x17
	b .L0801C322
.L0801C320:
	movs r0, #8
.L0801C322:
	pop {r1}
	bx r1

	THUMB_FUNC_END DebugChuudanMenu_ManualSave

	THUMB_FUNC_START DebugContinueMenu_IsManualContinueAvailable
DebugContinueMenu_IsManualContinueAvailable: @ 0x0801C328
	push {lr}
	movs r0, #4
	bl func_080A5DA8
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq .L0801C33A
	movs r1, #1
.L0801C33A:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END DebugContinueMenu_IsManualContinueAvailable

	THUMB_FUNC_START DebugContinueMenu_ManualContinue
DebugContinueMenu_ManualContinue: @ 0x0801C340
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	beq .L0801C34E
	movs r0, #8
	b .L0801C368
.L0801C34E:
	ldr r0, .L0801C36C  @ ProcScr_BMapMain
	bl FindProc
	cmp r0, #0
	beq .L0801C35C
	bl EndMapMain
.L0801C35C:
	movs r0, #4
	bl LoadSuspendedGame
	bl RestartGameAndGoto8
	movs r0, #0x17
.L0801C368:
	pop {r1}
	bx r1
	.align 2, 0
.L0801C36C: .4byte ProcScr_BMapMain

	THUMB_FUNC_END DebugContinueMenu_ManualContinue

	THUMB_FUNC_START StartupDebugMenu_InitializeFileEffect
StartupDebugMenu_InitializeFileEffect: @ 0x0801C370
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	beq .L0801C37E
	movs r0, #8
	b .L0801C392
.L0801C37E:
	ldr r0, .L0801C398  @ ProcScr_BMapMain
	bl FindProc
	cmp r0, #0
	beq .L0801C38C
	bl EndMapMain
.L0801C38C:
	bl RestartGameAndGoto12
	movs r0, #0x17
.L0801C392:
	pop {r1}
	bx r1
	.align 2, 0
.L0801C398: .4byte ProcScr_BMapMain

	THUMB_FUNC_END StartupDebugMenu_InitializeFileEffect

	THUMB_FUNC_START DebugContinueMenu_IsContinueChapterAvailable
DebugContinueMenu_IsContinueChapterAvailable: @ 0x0801C39C
	push {lr}
	movs r0, #3
	bl func_080A5DA8
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq .L0801C3AE
	movs r1, #1
.L0801C3AE:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END DebugContinueMenu_IsContinueChapterAvailable

	THUMB_FUNC_START DebugContinueMenu_ContinueChapter
DebugContinueMenu_ContinueChapter: @ 0x0801C3B4
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne .L0801C3CC
	movs r0, #3
	bl LoadSuspendedGame
	bl RestartGameAndGoto8
	movs r0, #0x17
	b .L0801C3CE
.L0801C3CC:
	movs r0, #8
.L0801C3CE:
	pop {r1}
	bx r1

	THUMB_FUNC_END DebugContinueMenu_ContinueChapter

	THUMB_FUNC_START DebugMenu_FogDraw
DebugMenu_FogDraw: @ 0x0801C3D4
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl ClearText
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl Text_InsertDrawString
	ldr r2, .L0801C43C  @ gUnknown_0859AA7C
	ldr r0, .L0801C440  @ gPlaySt
	ldrb r1, [r0, #0xd]
	negs r0, r1
	orrs r0, r1
	asrs r0, r0, #0x1f
	movs r1, #4
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L0801C444  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L0801C43C: .4byte gUnknown_0859AA7C
.L0801C440: .4byte gPlaySt
.L0801C444: .4byte gBg0Tm

	THUMB_FUNC_END DebugMenu_FogDraw

	THUMB_FUNC_START DebugMenu_FogIdle
DebugMenu_FogIdle: @ 0x0801C448
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl BMXFADEExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne .L0801C4A6
	ldr r0, .L0801C480  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	cmp r0, #0
	beq .L0801C4A6
	ldr r4, .L0801C484  @ gPlaySt
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne .L0801C498
	bl GetBattleMapKind
	cmp r0, #2
	bne .L0801C488
	movs r0, #3
	bl func_0801E2E0
	b .L0801C49E
	.align 2, 0
.L0801C480: .4byte gKeySt
.L0801C484: .4byte gPlaySt
.L0801C488:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	bl func_0801E2E0
	b .L0801C49E
.L0801C498:
	movs r0, #0
	bl func_0801E2E0
.L0801C49E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl DebugMenu_FogDraw
.L0801C4A6:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END DebugMenu_FogIdle

	THUMB_FUNC_START DebugMenu_FogEffect
DebugMenu_FogEffect: @ 0x0801C4B0
	movs r0, #0
	bx lr

	THUMB_FUNC_END DebugMenu_FogEffect

	THUMB_FUNC_START StartupDebugMenu_ReleaseEntryEffect
StartupDebugMenu_ReleaseEntryEffect: @ 0x0801C4B4
	push {lr}
	bl StartGame
	movs r0, #7
	pop {r1}
	bx r1

	THUMB_FUNC_END StartupDebugMenu_ReleaseEntryEffect

	THUMB_FUNC_START DebugMenu_GNightEffect
DebugMenu_GNightEffect: @ 0x0801C4C0
	push {lr}
	movs r0, #0xc0
	lsls r0, r0, #2
	bl func_08001CB0
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END DebugMenu_GNightEffect

	THUMB_FUNC_START DebugChargeMenu_Draw
DebugChargeMenu_Draw: @ 0x0801C4D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r1, .L0801C508  @ gUnknown_080D7A88
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r4, sp, #4
	ldr r1, .L0801C50C  @ gUnknown_080D7A8C
	adds r0, r4, #0
	movs r2, #6
	bl memcpy
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r4, #0
	cmp r0, #0
	beq .L0801C514
	ldr r0, .L0801C510  @ gPlaySt
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b .L0801C51C
	.align 2, 0
.L0801C508: .4byte gUnknown_080D7A88
.L0801C50C: .4byte gUnknown_080D7A8C
.L0801C510: .4byte gPlaySt
.L0801C514:
	ldr r0, .L0801C580  @ gPlaySt
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
.L0801C51C:
	lsrs r6, r0, #0x1e
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl Text_InsertDrawString
	lsls r0, r6, #1
	adds r0, r7, r0
	ldrh r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #2
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, .L0801C584  @ gBg0Tm
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0801C580: .4byte gPlaySt
.L0801C584: .4byte gBg0Tm

	THUMB_FUNC_END DebugChargeMenu_Draw

	THUMB_FUNC_START DebugChargeMenu_Idle
DebugChargeMenu_Idle: @ 0x0801C588
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r2, .L0801C5B8  @ gKeySt
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq .L0801C62E
	adds r0, r6, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq .L0801C5C0
	ldr r1, .L0801C5BC  @ gPlaySt
	adds r0, r1, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b .L0801C5CA
	.align 2, 0
.L0801C5B8: .4byte gKeySt
.L0801C5BC: .4byte gPlaySt
.L0801C5C0:
	ldr r1, .L0801C610  @ gPlaySt
	adds r0, r1, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
.L0801C5CA:
	lsrs r2, r0, #0x1e
	adds r3, r1, #0
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L0801C5DC
	subs r2, #1
.L0801C5DC:
	movs r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq .L0801C5E6
	adds r2, #1
.L0801C5E6:
	cmp r2, #2
	ble .L0801C5EC
	movs r2, #2
.L0801C5EC:
	cmp r2, #0
	bge .L0801C5F2
	movs r2, #0
.L0801C5F2:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq .L0801C614
	adds r3, #0x43
	movs r0, #3
	ands r2, r0
	lsls r2, r2, #1
	ldrb r1, [r3]
	movs r0, #7
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	b .L0801C626
	.align 2, 0
.L0801C610: .4byte gPlaySt
.L0801C614:
	adds r3, #0x42
	movs r0, #3
	ands r2, r0
	lsls r2, r2, #7
	ldrh r1, [r3]
	ldr r0, .L0801C638  @ 0xFFFFFE7F
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
.L0801C626:
	adds r0, r7, #0
	adds r1, r6, #0
	bl DebugChargeMenu_Draw
.L0801C62E:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L0801C638: .4byte 0xFFFFFE7F

	THUMB_FUNC_END DebugChargeMenu_Idle

	THUMB_FUNC_START func_0801C63C
func_0801C63C: @ 0x0801C63C
	push {lr}
	ldr r0, .L0801C64C  @ gUnknown_0859AA84
	movs r1, #3
	bl SpawnProc
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
.L0801C64C: .4byte gUnknown_0859AA84

	THUMB_FUNC_END func_0801C63C

	THUMB_FUNC_START func_0801C650
func_0801C650: @ 0x0801C650
	ldr r1, .L0801C658  @ gUnknown_0859AA9C
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
.L0801C658: .4byte gUnknown_0859AA9C

	THUMB_FUNC_END func_0801C650

	THUMB_FUNC_START DebugMenuMapIdleCore
DebugMenuMapIdleCore: @ 0x0801C65C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r3, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	mov r1, sp
	ldr r0, .L0801C6A0  @ gUnknown_080D7AB4
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, .L0801C6A4  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq .L0801C6A8
	adds r1, r3, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls .L0801C6C4
	movs r0, #0
	b .L0801C6C2
	.align 2, 0
.L0801C6A0: .4byte gUnknown_080D7AB4
.L0801C6A4: .4byte gKeySt
.L0801C6A8:
	movs r0, #0x20
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x3c
	cmp r0, #0
	beq .L0801C6C4
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge .L0801C6C4
	movs r0, #0x3b
.L0801C6C2:
	strb r0, [r1]
.L0801C6C4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl func_0801C650
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3e
	bls .L0801C6D6
	b .L0801C7F8
.L0801C6D6:
	lsls r0, r2, #2
	ldr r1, .L0801C6E0  @ .L0801C6E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L0801C6E0: .4byte .L0801C6E4
.L0801C6E4: @ jump table
	.4byte .L0801C7E0 @ case 0
	.4byte .L0801C7E0 @ case 1
	.4byte .L0801C7E0 @ case 2
	.4byte .L0801C7E0 @ case 3
	.4byte .L0801C7E0 @ case 4
	.4byte .L0801C7E0 @ case 5
	.4byte .L0801C7E0 @ case 6
	.4byte .L0801C7E0 @ case 7
	.4byte .L0801C7E0 @ case 8
	.4byte .L0801C7E0 @ case 9
	.4byte .L0801C818 @ case 10
	.4byte .L0801C818 @ case 11
	.4byte .L0801C818 @ case 12
	.4byte .L0801C818 @ case 13
	.4byte .L0801C818 @ case 14
	.4byte .L0801C818 @ case 15
	.4byte .L0801C818 @ case 16
	.4byte .L0801C818 @ case 17
	.4byte .L0801C818 @ case 18
	.4byte .L0801C818 @ case 19
	.4byte .L0801C818 @ case 20
	.4byte .L0801C818 @ case 21
	.4byte .L0801C818 @ case 22
	.4byte .L0801C7EC @ case 23
	.4byte .L0801C7EC @ case 24
	.4byte .L0801C7EC @ case 25
	.4byte .L0801C7EC @ case 26
	.4byte .L0801C7EC @ case 27
	.4byte .L0801C7EC @ case 28
	.4byte .L0801C7EC @ case 29
	.4byte .L0801C7EC @ case 30
	.4byte .L0801C7EC @ case 31
	.4byte .L0801C7EC @ case 32
	.4byte .L0801C7EC @ case 33
	.4byte .L0801C7EC @ case 34
	.4byte .L0801C7EC @ case 35
	.4byte .L0801C7F8 @ case 36
	.4byte .L0801C7F8 @ case 37
	.4byte .L0801C7F8 @ case 38
	.4byte .L0801C7F8 @ case 39
	.4byte .L0801C7F8 @ case 40
	.4byte .L0801C7F8 @ case 41
	.4byte .L0801C7F8 @ case 42
	.4byte .L0801C7F8 @ case 43
	.4byte .L0801C7F8 @ case 44
	.4byte .L0801C7F8 @ case 45
	.4byte .L0801C7F8 @ case 46
	.4byte .L0801C7F8 @ case 47
	.4byte .L0801C7F8 @ case 48
	.4byte .L0801C7F8 @ case 49
	.4byte .L0801C7F8 @ case 50
	.4byte .L0801C7F8 @ case 51
	.4byte .L0801C7F8 @ case 52
	.4byte .L0801C7F8 @ case 53
	.4byte .L0801C7F8 @ case 54
	.4byte .L0801C7F8 @ case 55
	.4byte .L0801C7F8 @ case 56
	.4byte .L0801C7F8 @ case 57
	.4byte .L0801C7F8 @ case 58
	.4byte .L0801C7F8 @ case 59
	.4byte .L0801C7F8 @ case 60
	.4byte .L0801C818 @ case 61
	.4byte .L0801C7EC @ case 62
.L0801C7E0:
	ldr r1, .L0801C7E8  @ gUnknown_03001780
	movs r0, #1
	b .L0801C81C
	.align 2, 0
.L0801C7E8: .4byte gUnknown_03001780
.L0801C7EC:
	ldr r1, .L0801C7F4  @ gUnknown_03001780
	movs r0, #3
	b .L0801C81C
	.align 2, 0
.L0801C7F4: .4byte gUnknown_03001780
.L0801C7F8:
	ldr r0, .L0801C810  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq .L0801C818
	ldr r1, .L0801C814  @ gUnknown_03001780
	movs r0, #3
	b .L0801C81C
	.align 2, 0
.L0801C810: .4byte gKeySt
.L0801C814: .4byte gUnknown_03001780
.L0801C818:
	ldr r1, .L0801C888  @ gUnknown_03001780
	movs r0, #2
.L0801C81C:
	strb r0, [r1]
	adds r0, r2, #0
	bl GetChapterInfo
	ldr r0, [r0]
	mov sl, r0
	ldr r0, .L0801C888  @ gUnknown_03001780
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	mov r9, r0
	lsls r5, r4, #5
	adds r5, r5, r7
	lsls r5, r5, #1
	ldr r6, .L0801C88C  @ gBg0Tm
	adds r5, r5, r6
	ldr r0, .L0801C890  @ gUnknown_080D7AC4
	mov r8, r0
	adds r0, r5, #0
	mov r1, r8
	bl DebugPutStr
	adds r4, #1
	lsls r4, r4, #5
	adds r4, r4, r7
	lsls r4, r4, #1
	adds r4, r4, r6
	adds r0, r4, #0
	mov r1, r8
	bl DebugPutStr
	adds r0, r5, #0
	mov r1, sl
	bl DebugPutStr
	adds r0, r4, #0
	mov r1, r9
	bl DebugPutStr
	movs r0, #1
	bl EnableBgSync
	bl EnablePalSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L0801C888: .4byte gUnknown_03001780
.L0801C88C: .4byte gBg0Tm
.L0801C890: .4byte gUnknown_080D7AC4

	THUMB_FUNC_END DebugMenuMapIdleCore

	.align 2, 0 @ Don't pad with nop.