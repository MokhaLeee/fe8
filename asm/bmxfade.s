	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Tile Fading (for tile changes and such)

	THUMB_FUNC_START func_0801DD1C
func_0801DD1C: @ 0x0801DD1C
	push {r4, lr}
	sub sp, #4
	adds r0, #0x4c
	movs r4, #0
	movs r1, #0x10
	strh r1, [r0]
	bl ResetHLayers
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0801DD1C

	THUMB_FUNC_START func_0801DD54
func_0801DD54: @ 0x0801DD54
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrb r0, [r4]
	adds r1, r0, #0
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L0801DD9C
	adds r0, r5, #0
	bl Proc_Break
	bl SetBlendNone
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, .L0801DDA4  @ gBg2Tm
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
.L0801DD9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DDA4: .4byte gBg2Tm

	THUMB_FUNC_END func_0801DD54

	THUMB_FUNC_START Destruct6CBMXFADE
Destruct6CBMXFADE: @ 0x0801DDA8
	push {r4, lr}
	adds r4, r0, #0
	bl ClearUnitsSeenFlag
	adds r4, #0x4e
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq .L0801DDBE
	bl UnlockGameLogic
.L0801DDBE:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END Destruct6CBMXFADE

	THUMB_FUNC_START StartBMXFADE
StartBMXFADE: @ 0x0801DDC4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L0801DDEC  @ gUnknown_0859ADC8
	movs r1, #3
	bl SpawnProc
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq .L0801DDE4
	bl LockGameLogic
.L0801DDE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DDEC: .4byte gUnknown_0859ADC8

	THUMB_FUNC_END StartBMXFADE

	THUMB_FUNC_START StartBlockingBMXFADE
StartBlockingBMXFADE: @ 0x0801DDF0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, .L0801DE14  @ gUnknown_0859ADC8
	bl SpawnProcLocking
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq .L0801DE0E
	bl LockGameLogic
.L0801DE0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L0801DE14: .4byte gUnknown_0859ADC8

	THUMB_FUNC_END StartBlockingBMXFADE

	THUMB_FUNC_START BMXFADEExists
BMXFADEExists: @ 0x0801DE18
	push {lr}
	ldr r0, .L0801DE2C  @ gUnknown_0859ADC8
	bl FindProc
	cmp r0, #0
	beq .L0801DE26
	movs r0, #1
.L0801DE26:
	pop {r1}
	bx r1
	.align 2, 0
.L0801DE2C: .4byte gUnknown_0859ADC8

	THUMB_FUNC_END BMXFADEExists

.align 2, 0 @ align with 0
