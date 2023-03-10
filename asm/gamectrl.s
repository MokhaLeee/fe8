	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED
	
	THUMB_FUNC_START func_080097E8
func_080097E8: @ 0x080097E8
	push {lr}
	cmp r0, #0x3e
	bls .L080097F0
	b .L08009948
.L080097F0:
	lsls r0, r0, #2
	ldr r1, .L080097FC  @ .L08009800
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080097FC: .4byte .L08009800
.L08009800: @ jump table
	.4byte .L08009948 @ case 0
	.4byte .L08009948 @ case 1
	.4byte .L080098FC @ case 2
	.4byte .L08009900 @ case 3
	.4byte .L08009904 @ case 4
	.4byte .L08009908 @ case 5
	.4byte .L08009908 @ case 6
	.4byte .L0800990C @ case 7
	.4byte .L08009910 @ case 8
	.4byte .L08009914 @ case 9
	.4byte .L08009918 @ case 10
	.4byte .L0800991C @ case 11
	.4byte .L08009920 @ case 12
	.4byte .L08009924 @ case 13
	.4byte .L08009928 @ case 14
	.4byte .L0800992C @ case 15
	.4byte .L08009930 @ case 16
	.4byte .L08009934 @ case 17
	.4byte .L08009938 @ case 18
	.4byte .L0800993C @ case 19
	.4byte .L08009940 @ case 20
	.4byte .L08009944 @ case 21
	.4byte .L08009944 @ case 22
	.4byte .L08009918 @ case 23
	.4byte .L0800991C @ case 24
	.4byte .L08009920 @ case 25
	.4byte .L08009924 @ case 26
	.4byte .L08009928 @ case 27
	.4byte .L0800992C @ case 28
	.4byte .L08009930 @ case 29
	.4byte .L08009934 @ case 30
	.4byte .L08009938 @ case 31
	.4byte .L0800993C @ case 32
	.4byte .L08009940 @ case 33
	.4byte .L08009944 @ case 34
	.4byte .L08009944 @ case 35
	.4byte .L08009948 @ case 36
	.4byte .L08009948 @ case 37
	.4byte .L08009948 @ case 38
	.4byte .L08009948 @ case 39
	.4byte .L08009948 @ case 40
	.4byte .L08009948 @ case 41
	.4byte .L08009948 @ case 42
	.4byte .L08009948 @ case 43
	.4byte .L08009948 @ case 44
	.4byte .L08009948 @ case 45
	.4byte .L08009948 @ case 46
	.4byte .L08009948 @ case 47
	.4byte .L08009948 @ case 48
	.4byte .L08009948 @ case 49
	.4byte .L08009948 @ case 50
	.4byte .L08009948 @ case 51
	.4byte .L08009948 @ case 52
	.4byte .L08009948 @ case 53
	.4byte .L08009948 @ case 54
	.4byte .L08009948 @ case 55
	.4byte .L08009914 @ case 56
	.4byte .L08009948 @ case 57
	.4byte .L08009948 @ case 58
	.4byte .L08009948 @ case 59
	.4byte .L08009948 @ case 60
	.4byte .L08009920 @ case 61
	.4byte .L08009920 @ case 62
.L080098FC:
	movs r0, #1
	b .L0800994A
.L08009900:
	movs r0, #2
	b .L0800994A
.L08009904:
	movs r0, #3
	b .L0800994A
.L08009908:
	movs r0, #4
	b .L0800994A
.L0800990C:
	movs r0, #5
	b .L0800994A
.L08009910:
	movs r0, #6
	b .L0800994A
.L08009914:
	movs r0, #7
	b .L0800994A
.L08009918:
	movs r0, #8
	b .L0800994A
.L0800991C:
	movs r0, #9
	b .L0800994A
.L08009920:
	movs r0, #0xa
	b .L0800994A
.L08009924:
	movs r0, #0xb
	b .L0800994A
.L08009928:
	movs r0, #0xc
	b .L0800994A
.L0800992C:
	movs r0, #0xd
	b .L0800994A
.L08009930:
	movs r0, #0xe
	b .L0800994A
.L08009934:
	movs r0, #0xf
	b .L0800994A
.L08009938:
	movs r0, #0x10
	b .L0800994A
.L0800993C:
	movs r0, #0x11
	b .L0800994A
.L08009940:
	movs r0, #0x12
	b .L0800994A
.L08009944:
	movs r0, #0x13
	b .L0800994A
.L08009948:
	movs r0, #0
.L0800994A:
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080097E8

	THUMB_FUNC_START func_08009950
func_08009950: @ 0x08009950
	push {r4, r5, r6, lr}
	sub sp, #0x4c
	bl GetGlobalCompletionCount
	cmp r0, #0
	beq .L08009960
.L0800995C:
	movs r0, #9
	b .L080099DA
.L08009960:
	movs r5, #0
	movs r4, #0
	mov r6, sp
.L08009966:
	adds r0, r4, #0
	bl IsSaveBlockValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08009992
	adds r0, r4, #0
	mov r1, sp
	bl LoadSavedChapterState
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	cmp r0, #0
	bne .L0800995C
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl func_080097E8
	cmp r5, r0
	bge .L08009992
	adds r5, r0, #0
.L08009992:
	adds r4, #1
	cmp r4, #2
	ble .L08009966
	cmp r5, #0x11
	ble .L080099A0
	movs r0, #8
	b .L080099DA
.L080099A0:
	cmp r5, #0xf
	ble .L080099A8
	movs r0, #7
	b .L080099DA
.L080099A8:
	cmp r5, #0xd
	ble .L080099B0
	movs r0, #6
	b .L080099DA
.L080099B0:
	cmp r5, #0xb
	ble .L080099B8
	movs r0, #5
	b .L080099DA
.L080099B8:
	cmp r5, #9
	ble .L080099C0
	movs r0, #4
	b .L080099DA
.L080099C0:
	cmp r5, #7
	ble .L080099C8
	movs r0, #3
	b .L080099DA
.L080099C8:
	cmp r5, #5
	ble .L080099D0
	movs r0, #2
	b .L080099DA
.L080099D0:
	cmp r5, #3
	bgt .L080099D8
	movs r0, #0
	b .L080099DA
.L080099D8:
	movs r0, #1
.L080099DA:
	add sp, #0x4c
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08009950

	THUMB_FUNC_START func_080099E4
func_080099E4: @ 0x080099E4
	push {r4, lr}
	adds r4, r0, #0
	bl func_08009950
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl Make6C_opinfo
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END func_080099E4

	THUMB_FUNC_START GameControl_HandleSelectRightL
GameControl_HandleSelectRightL: @ 0x08009A00
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08009A20  @ gKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x85
	lsls r0, r0, #2
	cmp r1, r0
	bne .L08009A1A
	adds r0, r2, #0
	movs r1, #0x12
	bl Proc_Goto
.L08009A1A:
	pop {r0}
	bx r0
	.align 2, 0
.L08009A20: .4byte gKeySt

	THUMB_FUNC_END GameControl_HandleSelectRightL

	THUMB_FUNC_START func_08009A24
func_08009A24: @ 0x08009A24
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	bl func_080156D4
	ldr r2, .L08009A54  @ gPlaySt
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r2, #1
	negs r2, r2
	movs r0, #3
	movs r1, #0
	bl StartScreenMenuScrollingBg
	pop {r0}
	bx r0
	.align 2, 0
.L08009A54: .4byte gPlaySt

	THUMB_FUNC_END func_08009A24

	THUMB_FUNC_START GameControl_8009A58
GameControl_8009A58: @ 0x08009A58
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	bx lr

	THUMB_FUNC_END GameControl_8009A58

	THUMB_FUNC_START GameControl_8009A60_Null
GameControl_8009A60_Null: @ 0x08009A60
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END GameControl_8009A60_Null

	THUMB_FUNC_START EndProcIfNotMarkedB
EndProcIfNotMarkedB: @ 0x08009A6C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0xb
	beq .L08009A7E
	adds r0, r1, #0
	bl Proc_End
.L08009A7E:
	pop {r0}
	bx r0

	THUMB_FUNC_END EndProcIfNotMarkedB

	THUMB_FUNC_START func_08009A84
func_08009A84: @ 0x08009A84
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, .L08009AAC  @ gPal
	ldr r2, .L08009AB0  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, .L08009AB4  @ EndProcIfNotMarkedB
	bl ForEveryProc
	ldr r0, .L08009AB8  @ OnGameLoopMain
	bl SetMainFunc
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
.L08009AAC: .4byte gPal
.L08009AB0: .4byte 0x01000100
.L08009AB4: .4byte EndProcIfNotMarkedB
.L08009AB8: .4byte OnGameLoopMain

	THUMB_FUNC_END func_08009A84

	THUMB_FUNC_START func_08009ABC
func_08009ABC: @ 0x08009ABC
	push {lr}
	movs r0, #0x43
	movs r1, #0
	bl StartBgmCore
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009ABC

	THUMB_FUNC_START func_08009AD8
func_08009AD8: @ 0x08009AD8
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009AD8

	THUMB_FUNC_START func_08009AEC
func_08009AEC: @ 0x08009AEC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #1
	beq .L08009B26
	cmp r2, #1
	bgt .L08009B02
	cmp r2, #0
	beq .L08009B16
	b .L08009B5C
.L08009B02:
	cmp r2, #2
	beq .L08009B0C
	cmp r2, #3
	beq .L08009B54
	b .L08009B5C
.L08009B0C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b .L08009B5C
.L08009B16:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r0, r4, #0
	bl func_08009AD8
	b .L08009B5C
.L08009B26:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq .L08009B3A
	cmp r1, #1
	beq .L08009B44
	b .L08009B4C
.L08009B3A:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b .L08009B4C
.L08009B44:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L08009B4C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b .L08009B5C
.L08009B54:
	adds r0, r4, #0
	movs r1, #0x18
	bl Proc_Goto
.L08009B5C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009AEC

	THUMB_FUNC_START func_08009B64
func_08009B64: @ 0x08009B64
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq .L08009B76
	cmp r1, #1
	beq .L08009B7E
	b .L08009B84
.L08009B76:
	movs r1, #4
	bl Proc_Goto
	b .L08009B84
.L08009B7E:
	movs r1, #1
	bl Proc_Goto
.L08009B84:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009B64

	THUMB_FUNC_START GameControl_MasterSwitch
GameControl_MasterSwitch: @ 0x08009B88
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi .L08009C16
	lsls r0, r0, #2
	ldr r1, .L08009BA0  @ .L08009BA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08009BA0: .4byte .L08009BA4
.L08009BA4: @ jump table
	.4byte .L08009BD8 @ case 0
	.4byte .L08009BDC @ case 1
	.4byte .L08009BDC @ case 2
	.4byte .L08009BDC @ case 3
	.4byte .L08009BE6 @ case 4
	.4byte .L08009BF0 @ case 5
	.4byte .L08009BFA @ case 6
	.4byte .L08009C04 @ case 7
	.4byte .L08009C16 @ case 8
	.4byte .L08009C16 @ case 9
	.4byte .L08009C16 @ case 10
	.4byte .L08009C16 @ case 11
	.4byte .L08009C0E @ case 12
.L08009BD8:
	bl GmDataInit
.L08009BDC:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b .L08009C16
.L08009BE6:
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b .L08009C16
.L08009BF0:
	adds r0, r4, #0
	movs r1, #0x19
	bl Proc_Goto
	b .L08009C16
.L08009BFA:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b .L08009C16
.L08009C04:
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b .L08009C16
.L08009C0E:
	adds r0, r4, #0
	movs r1, #0xf
	bl Proc_Goto
.L08009C16:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END GameControl_MasterSwitch

	THUMB_FUNC_START func_08009C1C
func_08009C1C: @ 0x08009C1C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne .L08009C30
	adds r0, r1, #0
	movs r1, #4
	bl Proc_Goto
.L08009C30:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009C1C

	THUMB_FUNC_START func_08009C34
func_08009C34: @ 0x08009C34
	push {lr}
	movs r1, #4
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009C34

	THUMB_FUNC_START func_08009C40
func_08009C40: @ 0x08009C40
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq .L08009C56
	cmp r1, #1
	bne .L08009C56
	movs r1, #0x13
	bl Proc_Goto
.L08009C56:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009C40

	THUMB_FUNC_START func_08009C5C
func_08009C5C: @ 0x08009C5C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne .L08009C72
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b .L08009C98
.L08009C72:
	movs r0, #0
	movs r1, #0
	bl InitPlayConfig
	ldr r4, .L08009CA0  @ gPlaySt
	ldrb r1, [r4, #0x14]
	movs r0, #8
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl ClearGlobalTriggerState
	bl ClearTemporaryFlags
	bl InitUnits
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
.L08009C98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08009CA0: .4byte gPlaySt

	THUMB_FUNC_END func_08009C5C

	THUMB_FUNC_START func_08009CA4
func_08009CA4: @ 0x08009CA4
	push {lr}
	bl func_080A6D38
	bl func_080A41C8
	bl CleanupUnitsBeforeChapter
	ldr r1, .L08009CBC  @ gPlaySt
	movs r0, #0x7f
	strb r0, [r1, #0xe]
	pop {r0}
	bx r0
	.align 2, 0
.L08009CBC: .4byte gPlaySt

	THUMB_FUNC_END func_08009CA4

	THUMB_FUNC_START func_08009CC0
func_08009CC0: @ 0x08009CC0
	push {lr}
	movs r0, #3
	bl ClearSaveBlock
	ldr r0, .L08009CDC  @ gPlaySt
	adds r0, #0x41
	ldrb r2, [r0]
	movs r1, #2
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L08009CDC: .4byte gPlaySt

	THUMB_FUNC_END func_08009CC0

	THUMB_FUNC_START GameControl_PostChapterSwitch
GameControl_PostChapterSwitch: @ 0x08009CE0
	push {r4, lr}
	adds r4, r0, #0
	bl MU_EndAll
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bgt .L08009CFC
	cmp r0, #1
	bge .L08009D14
	cmp r0, #0
	beq .L08009D02
	b .L08009D14
.L08009CFC:
	cmp r0, #3
	beq .L08009D0C
	b .L08009D14
.L08009D02:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b .L08009D14
.L08009D0C:
	adds r0, r4, #0
	movs r1, #0x10
	bl Proc_Goto
.L08009D14:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END GameControl_PostChapterSwitch

	THUMB_FUNC_START func_08009D1C
func_08009D1C: @ 0x08009D1C
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08009D40  @ gPlaySt
	adds r0, #0x4a
	ldrb r0, [r0]
	movs r1, #0xe
	ands r1, r0
	cmp r1, #4
	beq .L08009D32
	cmp r1, #8
	bne .L08009D3A
.L08009D32:
	adds r0, r2, #0
	movs r1, #6
	bl Proc_Goto
.L08009D3A:
	pop {r0}
	bx r0
	.align 2, 0
.L08009D40: .4byte gPlaySt

	THUMB_FUNC_END func_08009D1C

	THUMB_FUNC_START func_08009D44
func_08009D44: @ 0x08009D44
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08009D68  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08009D64
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq .L08009D64
	adds r0, r2, #0
	movs r1, #0x11
	bl Proc_Goto
.L08009D64:
	pop {r0}
	bx r0
	.align 2, 0
.L08009D68: .4byte gPlaySt

	THUMB_FUNC_END func_08009D44

	THUMB_FUNC_START func_08009D6C
func_08009D6C: @ 0x08009D6C
	push {lr}
	adds r2, r0, #0
	ldr r0, .L08009D88  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq .L08009D8C
	adds r0, r2, #0
	movs r1, #0xa
	bl Proc_Goto
	b .L08009D94
	.align 2, 0
.L08009D88: .4byte gPlaySt
.L08009D8C:
	adds r0, r2, #0
	movs r1, #9
	bl Proc_Goto
.L08009D94:
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009D6C

	THUMB_FUNC_START GameControl_ChapterSwitch
GameControl_ChapterSwitch: @ 0x08009D98
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #2
.L08009D9E:
	bl NextRn
	subs r4, #1
	cmp r4, #0
	bge .L08009D9E
	ldr r0, .L08009DD8  @ gGmMonsterRnState
	bl RandGetSt
	movs r0, #3
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08009DC0
	ldr r0, .L08009DDC  @ gPlaySt
	bl RegisterChapterTimeAndTurnCount
.L08009DC0:
	bl ComputeChapterRankings
	ldr r0, .L08009DDC  @ gPlaySt
	adds r1, r5, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	strb r1, [r0, #0xe]
	bl CleanupUnitsBeforeChapter
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08009DD8: .4byte gGmMonsterRnState
.L08009DDC: .4byte gPlaySt

	THUMB_FUNC_END GameControl_ChapterSwitch

	THUMB_FUNC_START GameControl_CallPostChapterSaveMenu
GameControl_CallPostChapterSaveMenu: @ 0x08009DE0
	push {lr}
	adds r1, r0, #0
	ldr r0, .L08009DFC  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x38
	beq .L08009DF6
	adds r0, r1, #0
	bl Start_savemenu2
.L08009DF6:
	pop {r0}
	bx r0
	.align 2, 0
.L08009DFC: .4byte gPlaySt

	THUMB_FUNC_END GameControl_CallPostChapterSaveMenu

	THUMB_FUNC_START func_08009E00
func_08009E00: @ 0x08009E00
	push {lr}
	adds r3, r0, #0
	ldr r2, .L08009E24  @ gPlaySt
	ldrb r1, [r2, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne .L08009E1E
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne .L08009E1E
	adds r0, r3, #0
	bl func_080C541C
.L08009E1E:
	pop {r0}
	bx r0
	.align 2, 0
.L08009E24: .4byte gPlaySt

	THUMB_FUNC_END func_08009E00

	THUMB_FUNC_START func_08009E28
func_08009E28: @ 0x08009E28
	push {lr}
	sub sp, #4
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009E28

	THUMB_FUNC_START func_08009E54
func_08009E54: @ 0x08009E54
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, .L08009E6C  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq .L08009E70
	cmp r0, #3
	beq .L08009E80
	b .L08009E88
	.align 2, 0
.L08009E6C: .4byte gPlaySt
.L08009E70:
	ldr r0, .L08009E7C  @ gUnknown_08A0035C
	movs r1, #1
	bl CallEvent
	b .L08009E88
	.align 2, 0
.L08009E7C: .4byte gUnknown_08A0035C
.L08009E80:
	ldr r0, .L08009E94  @ gUnknown_08A00364
	movs r1, #1
	bl CallEvent
.L08009E88:
	movs r0, #0x84
	bl SetFlag
	pop {r0}
	bx r0
	.align 2, 0
.L08009E94: .4byte gUnknown_08A00364

	THUMB_FUNC_END func_08009E54

	THUMB_FUNC_START CallGameEndingEvent
CallGameEndingEvent: @ 0x08009E98
	push {lr}
	bl StartChapter
	bl BlackenScreen
	ldr r0, .L08009EB0  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq .L08009EB4
	cmp r0, #3
	beq .L08009EC4
	b .L08009ECC
	.align 2, 0
.L08009EB0: .4byte gPlaySt
.L08009EB4:
	ldr r0, .L08009EC0  @ gUnknown_08A0037C
	movs r1, #1
	bl CallEvent
	b .L08009ECC
	.align 2, 0
.L08009EC0: .4byte gUnknown_08A0037C
.L08009EC4:
	ldr r0, .L08009ED8  @ gUnknown_08A0048C
	movs r1, #1
	bl CallEvent
.L08009ECC:
	movs r0, #0x84
	bl SetFlag
	pop {r0}
	bx r0
	.align 2, 0
.L08009ED8: .4byte gUnknown_08A0048C

	THUMB_FUNC_END CallGameEndingEvent

	THUMB_FUNC_START GameControl_RememberChapterId
GameControl_RememberChapterId: @ 0x08009EDC
	ldr r1, .L08009EE8  @ gPlaySt
	ldrb r1, [r1, #0xe]
	adds r0, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
.L08009EE8: .4byte gPlaySt

	THUMB_FUNC_END GameControl_RememberChapterId

	THUMB_FUNC_START GameControl_RestoreChapterId
GameControl_RestoreChapterId: @ 0x08009EEC
	ldr r1, .L08009EF8  @ gPlaySt
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	bx lr
	.align 2, 0
.L08009EF8: .4byte gPlaySt

	THUMB_FUNC_END GameControl_RestoreChapterId

	THUMB_FUNC_START func_08009EFC
func_08009EFC: @ 0x08009EFC
	push {lr}
	bl func_080A4CD8
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08009EFC

	THUMB_FUNC_START StartGame
StartGame: @ 0x08009F08
	push {lr}
	ldr r0, .L08009F34  @ OnGameLoopMain
	bl SetMainFunc
	ldr r0, .L08009F38  @ OnVBlank
	bl SetOnVBlank
	ldr r0, .L08009F3C  @ ProcScr_GameControl
	movs r1, #3
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
.L08009F34: .4byte OnGameLoopMain
.L08009F38: .4byte OnVBlank
.L08009F3C: .4byte ProcScr_GameControl

	THUMB_FUNC_END StartGame

	THUMB_FUNC_START GetGameControl
GetGameControl: @ 0x08009F40
	push {lr}
	ldr r0, .L08009F4C  @ ProcScr_GameControl
	bl FindProc
	pop {r1}
	bx r1
	.align 2, 0
.L08009F4C: .4byte ProcScr_GameControl

	THUMB_FUNC_END GetGameControl

	THUMB_FUNC_START SetNextGameActionId
SetNextGameActionId: @ 0x08009F50
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameControl
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetNextGameActionId

	THUMB_FUNC_START SetNextChapterId
SetNextChapterId: @ 0x08009F64
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameControl
	adds r0, #0x2a
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetNextChapterId

	THUMB_FUNC_START func_08009F78
func_08009F78: @ 0x08009F78
	push {lr}
	bl GetGameControl
	adds r0, #0x2a
	ldrb r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1

	THUMB_FUNC_END func_08009F78

	THUMB_FUNC_START RestartGameAndGoto8
RestartGameAndGoto8: @ 0x08009F8C
	push {r4, lr}
	ldr r4, .L08009FAC  @ ProcScr_GameControl
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08009FAC: .4byte ProcScr_GameControl

	THUMB_FUNC_END RestartGameAndGoto8

	THUMB_FUNC_START RestartGameAndGoto12
RestartGameAndGoto12: @ 0x08009FB0
	push {r4, lr}
	ldr r4, .L08009FD0  @ ProcScr_GameControl
	adds r0, r4, #0
	bl EndEachProc
	adds r0, r4, #0
	movs r1, #3
	bl SpawnProc
	movs r1, #0x12
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08009FD0: .4byte ProcScr_GameControl

	THUMB_FUNC_END RestartGameAndGoto12

	THUMB_FUNC_START nullsub_RestartGameAndGoto7
nullsub_RestartGameAndGoto7: @ 0x08009FD4
	bx lr

	THUMB_FUNC_END nullsub_RestartGameAndGoto7

	THUMB_FUNC_START nullsub_9
nullsub_9: @ 0x08009FD8
	bx lr

	THUMB_FUNC_END nullsub_9

	THUMB_FUNC_START GameControl_EnableSoundEffects
GameControl_EnableSoundEffects: @ 0x08009FDC
	ldr r2, .L08009FF4  @ gPlaySt
	adds r2, #0x41
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
.L08009FF4: .4byte gPlaySt

	THUMB_FUNC_END GameControl_EnableSoundEffects

	THUMB_FUNC_START func_08009FF8
func_08009FF8: @ 0x08009FF8
	push {r4, r5, lr}
	ldr r3, .L0800A044  @ gPlaySt
	adds r2, r3, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #7
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r5, r3, #0
	adds r5, #0x40
	ldrb r0, [r5]
	movs r2, #0x61
	negs r2, r2
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r4, r3, #0
	adds r4, #0x41
	ldrb r1, [r4]
	movs r3, #2
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0xd
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
	ands r2, r3
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0800A044: .4byte gPlaySt
	THUMB_FUNC_END func_08009FF8
