	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ unit status effects update (poison & such)

	THUMB_FUNC_START func_08035AA4
func_08035AA4: @ 0x08035AA4
	push {r4, r5, r6, lr}
	bl ClearBg0Bg1
	ldr r0, .L08035AF8  @ gUnknown_08A032AC
	ldr r1, .L08035AFC  @ 0x06005000
	bl Decompress
	ldr r0, .L08035B00  @ gUnknown_08A03334
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, .L08035B04  @ gBg0Tm
	ldr r1, .L08035B08  @ gUnknown_08A03354
	movs r2, #0xca
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	adds r6, r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r6, r0
	movs r4, #6
.L08035AD4:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #4
	bl TmCopyRect_thm
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge .L08035AD4
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08035AF8: .4byte gUnknown_08A032AC
.L08035AFC: .4byte 0x06005000
.L08035B00: .4byte gUnknown_08A03334
.L08035B04: .4byte gBg0Tm
.L08035B08: .4byte gUnknown_08A03354

	THUMB_FUNC_END func_08035AA4

	THUMB_FUNC_START func_08035B0C
func_08035B0C: @ 0x08035B0C
	push {r4, lr}
	ldr r1, .L08035B3C  @ gBmSt
	ldr r0, .L08035B40  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r4, [r1, #0xc]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetGameTime
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08035B3C: .4byte gBmSt
.L08035B40: .4byte gActiveUnit

	THUMB_FUNC_END func_08035B0C

	THUMB_FUNC_START func_08035B44
func_08035B44: @ 0x08035B44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	ldr r0, .L08035BE4  @ gActiveUnit
	ldr r0, [r0]
	bl HideUnitSprite
	ldr r3, .L08035BE8  @ gDispIo
	ldrb r2, [r3, #1]
	movs r1, #0x21
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r2, #0x41
	negs r2, r2
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r3, #1]
	movs r0, #0x36
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	ands r1, r0
	adds r3, #0x37
	ldrb r0, [r3]
	movs r2, #0x20
	orrs r0, r2
	movs r2, #2
	negs r2, r2
	ands r1, r2
	movs r6, #3
	negs r6, r6
	ands r1, r6
	movs r5, #5
	negs r5, r5
	ands r1, r5
	movs r4, #8
	orrs r1, r4
	movs r2, #0x10
	orrs r1, r2
	mov r7, ip
	strb r1, [r7]
	movs r1, #1
	orrs r0, r1
	ands r0, r6
	ands r0, r5
	orrs r0, r4
	orrs r0, r2
	strb r0, [r3]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0x4c
	add r8, r0
	movs r0, #0x40
	mov r1, r8
	strh r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08035BE4: .4byte gActiveUnit
.L08035BE8: .4byte gDispIo

	THUMB_FUNC_END func_08035B44

	THUMB_FUNC_START func_08035BEC
func_08035BEC: @ 0x08035BEC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, .L08035C3C  @ gActiveUnit
	ldr r4, [r0]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, .L08035C40  @ gBmSt
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	movs r6, #0xe
	ldrsh r0, [r3, r6]
	subs r2, r2, r0
	movs r3, #0xa0
	lsls r3, r3, #6
	str r4, [sp]
	movs r0, #4
	bl PutBlendWindowUnitSprite
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L08035C32
	adds r0, r5, #0
	bl Proc_Break
.L08035C32:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08035C3C: .4byte gActiveUnit
.L08035C40: .4byte gBmSt

	THUMB_FUNC_END func_08035BEC

	THUMB_FUNC_START func_08035C44
func_08035C44: @ 0x08035C44
	push {lr}
	ldr r0, .L08035C54  @ gActiveUnit
	ldr r0, [r0]
	bl ShowUnitSprite
	pop {r0}
	bx r0
	.align 2, 0
.L08035C54: .4byte gActiveUnit

	THUMB_FUNC_END func_08035C44

	THUMB_FUNC_START func_08035C58
func_08035C58: @ 0x08035C58
	adds r2, r0, #0
	adds r2, #0x4c
	movs r3, #0
	movs r1, #0xf
	strh r1, [r2]
	str r3, [r0, #0x2c]
	movs r1, #1
	str r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END func_08035C58

	THUMB_FUNC_START func_08035C6C
func_08035C6C: @ 0x08035C6C
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	movs r1, #0x10
	str r1, [r0, #0x2c]
	subs r1, #0x11
	str r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END func_08035C6C

	THUMB_FUNC_START func_08035C80
func_08035C80: @ 0x08035C80
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L08035CB0
	adds r0, r4, #0
	bl Proc_Break
.L08035CB0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035C80

	THUMB_FUNC_START func_08035CB8
func_08035CB8: @ 0x08035CB8
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, .L08035CD8  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0x40
	beq .L08035CF4
	cmp r1, #0x40
	bgt .L08035CDC
	cmp r1, #0
	beq .L08035CE2
	b .L08035CF6
	.align 2, 0
.L08035CD8: .4byte gActiveUnit
.L08035CDC:
	cmp r1, #0x80
	beq .L08035CEC
	b .L08035CF6
.L08035CE2:
	ldr r2, .L08035CE8  @ gPal+0x380
	b .L08035CF6
	.align 2, 0
.L08035CE8: .4byte gPal+0x380
.L08035CEC:
	ldr r2, .L08035CF0  @ gPal+0x3A0
	b .L08035CF6
	.align 2, 0
.L08035CF0: .4byte gPal+0x3A0
.L08035CF4:
	ldr r2, .L08035D10  @ gPal+0x3C0
.L08035CF6:
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08035D10: .4byte gPal+0x3C0

	THUMB_FUNC_END func_08035CB8

	THUMB_FUNC_START func_08035D14
func_08035D14: @ 0x08035D14
	push {lr}
	adds r3, r1, #0
	cmp r3, #0x1f
	ble .L08035D1E
	movs r3, #0x1f
.L08035D1E:
	cmp r3, #0
	bge .L08035D24
	movs r3, #0
.L08035D24:
	ldr r0, .L08035D3C  @ gPal
	lsls r1, r3, #0xa
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r2, .L08035D40  @ 0x0000025E
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
.L08035D3C: .4byte gPal
.L08035D40: .4byte 0x0000025E

	THUMB_FUNC_END func_08035D14

	THUMB_FUNC_START func_08035D44
func_08035D44: @ 0x08035D44
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl func_08035D14
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne .L08035D6A
	adds r0, r5, #0
	bl Proc_Break
.L08035D6A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035D44

	THUMB_FUNC_START func_08035D70
func_08035D70: @ 0x08035D70
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl func_08035D14
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L08035D94
	adds r0, r5, #0
	bl Proc_Break
.L08035D94:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035D70

	THUMB_FUNC_START func_08035D9C
func_08035D9C: @ 0x08035D9C
	push {r4, lr}
	bl ClearBg0Bg1
	ldr r4, .L08035DD8  @ gDispIo
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
	adds r2, r4, #0
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r4, #0x37
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08035DD8: .4byte gDispIo

	THUMB_FUNC_END func_08035D9C

	THUMB_FUNC_START StartStatusClearFx
StartStatusClearFx: @ 0x08035DDC
	push {lr}
	adds r2, r1, #0
	ldr r1, .L08035E04  @ gActiveUnit
	str r0, [r1]
	cmp r2, #0
	beq .L08035E10
	ldr r0, .L08035E08  @ gUnknown_0859E2D0
	adds r1, r2, #0
	bl SpawnProcLocking
	ldr r0, .L08035E0C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L08035E18
	movs r0, #0xaa
	bl m4aSongNumStart
	b .L08035E18
	.align 2, 0
.L08035E04: .4byte gActiveUnit
.L08035E08: .4byte gUnknown_0859E2D0
.L08035E0C: .4byte gPlaySt
.L08035E10:
	ldr r0, .L08035E1C  @ gUnknown_0859E2D0
	movs r1, #3
	bl SpawnProcLocking
.L08035E18:
	pop {r0}
	bx r0
	.align 2, 0
.L08035E1C: .4byte gUnknown_0859E2D0

	THUMB_FUNC_END StartStatusClearFx

	THUMB_FUNC_START func_08035E20
func_08035E20: @ 0x08035E20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08035E3C  @ gPlaySt
	ldrb r0, [r0, #0xf]
	bl MakeTerrainHealTargetList
	bl GetTargetListSize
	cmp r0, #0
	bne .L08035E40
	adds r0, r4, #0
	bl Proc_End
	b .L08035E48
	.align 2, 0
.L08035E3C: .4byte gPlaySt
.L08035E40:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
.L08035E48:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035E20

	THUMB_FUNC_START func_08035E50
func_08035E50: @ 0x08035E50
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, .L08035E88  @ gAction
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r5, r0]
	bl GetTargetListSize
	cmp r4, r0
	bne .L08035E8C
	adds r0, r7, #0
	bl Proc_End
	b .L08035ED2
	.align 2, 0
.L08035E88: .4byte gAction
.L08035E8C:
	ldr r0, .L08035EB8  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L08035EC0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, .L08035EBC  @ gMapFog
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne .L08035EC0
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b .L08035ED2
	.align 2, 0
.L08035EB8: .4byte gPlaySt
.L08035EBC: .4byte gMapFog
.L08035EC0:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L08035ED2
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
.L08035ED2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035E50

	THUMB_FUNC_START func_08035ED8
func_08035ED8: @ 0x08035ED8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035ED8

	THUMB_FUNC_START func_08035EFC
func_08035EFC: @ 0x08035EFC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	movs r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge .L08035F28
	adds r0, r4, #0
	adds r1, r6, #0
	bl StartStatusClearFx
	b .L08035F38
.L08035F28:
	adds r0, r4, #0
	bl HideUnitSprite
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl func_08035804
.L08035F38:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035EFC

	THUMB_FUNC_START func_08035F40
func_08035F40: @ 0x08035F40
	push {lr}
	bl MU_EndAll
	ldr r0, .L08035F64  @ gBattleUnitA
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq .L08035F5E
	ldr r0, .L08035F68  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl ShowUnitSprite
.L08035F5E:
	pop {r0}
	bx r0
	.align 2, 0
.L08035F64: .4byte gBattleUnitA
.L08035F68: .4byte gAction

	THUMB_FUNC_END func_08035F40

	THUMB_FUNC_START func_08035F6C
func_08035F6C: @ 0x08035F6C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge .L08035F9A
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl func_080357A8
	b .L08035FA8
.L08035F9A:
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	negs r3, r3
	adds r0, r5, #0
	bl func_080357A8
.L08035FA8:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035F6C

	THUMB_FUNC_START func_08035FB8
func_08035FB8: @ 0x08035FB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08035FDC  @ gPlaySt
	ldrb r0, [r0, #0xf]
	bl MakePoisonDamageTargetList
	movs r0, #4
	bl func_08026414
	bl GetTargetListSize
	cmp r0, #0
	bne .L08035FE0
	adds r0, r4, #0
	bl Proc_End
	b .L08035FE8
	.align 2, 0
.L08035FDC: .4byte gPlaySt
.L08035FE0:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
.L08035FE8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035FB8

	THUMB_FUNC_START func_08035FF0
func_08035FF0: @ 0x08035FF0
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl func_0803584C
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08035FF0

	THUMB_FUNC_START func_0803601C
func_0803601C: @ 0x0803601C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #3
	ldrsb r2, [r4, r2]
	negs r2, r2
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	bl func_080357A8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, .L08036088  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0803606C
	bl CheckForPostActionEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803606C
	bl RunPostActionEvents
.L0803606C:
	ldr r0, .L08036088  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt .L08036080
	bl RefreshUnitSprites
.L08036080:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08036088: .4byte gAction

	THUMB_FUNC_END func_0803601C

	THUMB_FUNC_START func_0803608C
func_0803608C: @ 0x0803608C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x34
	beq .L080360B0
	movs r0, #0x34
	bl GetJInfo
	str r0, [r4, #4]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl MU_EndAll
.L080360B0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0803608C

	THUMB_FUNC_START func_080360B8
func_080360B8: @ 0x080360B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L080360D4  @ gPlaySt
	ldrb r0, [r0, #0xf]
	bl MakeGorgonEggHatchTargetList
	bl GetTargetListSize
	cmp r0, #0
	bne .L080360D8
	adds r0, r4, #0
	bl Proc_End
	b .L080360E0
	.align 2, 0
.L080360D4: .4byte gPlaySt
.L080360D8:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
.L080360E0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080360B8

	THUMB_FUNC_START func_080360E8
func_080360E8: @ 0x080360E8
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSprite
	adds r0, r4, #0
	bl func_0803608C
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl func_080358C0
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080360E8

	THUMB_FUNC_START func_0803611C
func_0803611C: @ 0x0803611C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	bl func_080357A8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, .L08036184  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0803616A
	bl CheckForPostActionEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L0803616A
	bl RunPostActionEvents
.L0803616A:
	ldr r0, .L08036184  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt .L0803617E
	bl RefreshUnitSprites
.L0803617E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08036184: .4byte gAction

	THUMB_FUNC_END func_0803611C

	THUMB_FUNC_START func_08036188
func_08036188: @ 0x08036188
	push {r4, lr}
	adds r4, r0, #0
	bl GetTargetListSize
	cmp r0, #0
	bne .L0803619C
	adds r0, r4, #0
	bl Proc_End
	b .L080361A6
.L0803619C:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x58]
.L080361A6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08036188

	THUMB_FUNC_START func_080361AC
func_080361AC: @ 0x080361AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r7, r0, #0
	ldr r5, .L080361EC  @ gAction
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r0, #0x30
	ldrb r4, [r0]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1c
	str r4, [r6, #0x58]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	subs r0, r4, #1
	cmp r0, #0xc
	bhi .L08036236
	lsls r0, r0, #2
	ldr r1, .L080361F0  @ .L080361F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080361EC: .4byte gAction
.L080361F0: .4byte .L080361F4
.L080361F4: @ jump table
	.4byte .L08036228 @ case 0
	.4byte .L08036228 @ case 1
	.4byte .L08036228 @ case 2
	.4byte .L08036228 @ case 3
	.4byte .L08036236 @ case 4
	.4byte .L08036236 @ case 5
	.4byte .L08036236 @ case 6
	.4byte .L08036236 @ case 7
	.4byte .L08036236 @ case 8
	.4byte .L08036228 @ case 9
	.4byte .L08036228 @ case 10
	.4byte .L08036236 @ case 11
	.4byte .L08036228 @ case 12
.L08036228:
	movs r0, #2
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r6, #0
	bl StartStatusClearFx
.L08036236:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080361AC

	THUMB_FUNC_START func_0803623C
func_0803623C: @ 0x0803623C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	cmp r0, #0xb
	beq .L0803624A
	cmp r0, #0xd
	bne .L08036276
.L0803624A:
	ldr r4, .L08036294  @ gAction
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, .L08036298  @ 0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityMaps
	bl RenderMap
	bl RefreshUnitSprites
	bl MU_EndAll
.L08036276:
	ldr r0, .L08036294  @ gAction
	ldrb r0, [r0, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L08036294: .4byte gAction
.L08036298: .4byte 0xFFFFFBBD

	THUMB_FUNC_END func_0803623C

	THUMB_FUNC_START func_0803629C
func_0803629C: @ 0x0803629C
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END func_0803629C

	THUMB_FUNC_START func_080362A4
func_080362A4: @ 0x080362A4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, .L080362DC  @ gAction
	ldrb r0, [r5, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r4, r0]
	bl GetTargetListSize
	cmp r4, r0
	bne .L080362E0
	adds r0, r7, #0
	bl Proc_End
	b .L0803632E
	.align 2, 0
.L080362DC: .4byte gAction
.L080362E0:
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq .L0803632E
	ldr r0, .L08036314  @ gPlaySt
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq .L0803631C
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, .L08036318  @ gMapFog
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne .L0803631C
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b .L0803632E
	.align 2, 0
.L08036314: .4byte gPlaySt
.L08036318: .4byte gMapFog
.L0803631C:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne .L0803632E
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
.L0803632E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080362A4

	THUMB_FUNC_START func_08036334
func_08036334: @ 0x08036334
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r2, r0, #0
	ldrh r1, [r2, #2]
	movs r0, #0xc0
	lsls r0, r0, #3
	cmp r1, r0
	beq .L0803635E
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
.L0803635E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08036334

	THUMB_FUNC_START func_08036364
func_08036364: @ 0x08036364
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	ldrb r1, [r4, #2]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne .L08036432
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0x64
	beq .L080363BC
	cmp r0, #0x64
	bgt .L0803639E
	cmp r0, #6
	beq .L08036410
	cmp r0, #6
	bgt .L08036398
	cmp r0, #4
	beq .L080363AC
	b .L0803641E
.L08036398:
	cmp r0, #7
	beq .L08036404
	b .L0803641E
.L0803639E:
	cmp r0, #0x66
	beq .L080363E0
	cmp r0, #0x66
	blt .L080363CE
	cmp r0, #0x67
	beq .L080363F2
	b .L0803641E
.L080363AC:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl NewFireTrapEffectGfx
	b .L0803641E
.L080363BC:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #3
	bl StartGasTrapEffectGfxMaybe
	b .L0803641E
.L080363CE:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #2
	bl StartGasTrapEffectGfxMaybe
	b .L0803641E
.L080363E0:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl StartGasTrapEffectGfxMaybe
	b .L0803641E
.L080363F2:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #1
	bl StartGasTrapEffectGfxMaybe
	b .L0803641E
.L08036404:
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl StartLightArrowTrapGfx
	b .L0803641E
.L08036410:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl func_0801F8C8
.L0803641E:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b .L0803646E
.L08036432:
	ldr r5, .L0803645C  @ gAction
	strb r1, [r5, #0xc]
	ldrb r0, [r4, #3]
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl HideUnitSprite
	ldrb r0, [r5, #0x15]
	cmp r0, #5
	bhi .L08036460
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl func_0803584C
	b .L0803646E
	.align 2, 0
.L0803645C: .4byte gAction
.L08036460:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl ExecSelfDamage
.L0803646E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08036364

	THUMB_FUNC_START func_08036474
func_08036474: @ 0x08036474
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #5
	bgt .L080364A6
	adds r2, r0, #0
	negs r2, r2
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #1
	bl func_080357A8
	b .L080364B8
.L080364A6:
	movs r2, #3
	ldrsb r2, [r4, r2]
	negs r2, r2
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	adds r1, r5, #0
	bl func_080357A8
.L080364B8:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt .L080364C6
	bl RefreshUnitSprites
.L080364C6:
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08036474

.align 2, 0
