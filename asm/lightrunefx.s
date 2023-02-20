	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ The effect that plays when putting down a light rune

	THUMB_FUNC_START func_0802153C
func_0802153C: @ 0x0802153C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L080215D4  @ gUnknown_085A403C
	ldr r1, .L080215D8  @ 0x06002000
	bl Decompress
	ldr r0, .L080215DC  @ gUnknown_085A5760
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L080215E0  @ gUnknown_085A5780
	ldr r4, .L080215E4  @ gBmFrameTmap0
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
.L08021568:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne .L08021568
	ldr r0, .L080215E8  @ gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, .L080215EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0802159A
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
.L0802159A:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080215D4: .4byte gUnknown_085A403C
.L080215D8: .4byte 0x06002000
.L080215DC: .4byte gUnknown_085A5760
.L080215E0: .4byte gUnknown_085A5780
.L080215E4: .4byte gBmFrameTmap0
.L080215E8: .4byte gBg0Tm
.L080215EC: .4byte gPlaySt

	THUMB_FUNC_END func_0802153C

	THUMB_FUNC_START func_080215F0
func_080215F0: @ 0x080215F0
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, .L0802162C  @ gUnknown_080D7B30
	mov r0, sp
	movs r2, #0x34
	bl memcpy
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne .L08021630
	adds r0, r6, #0
	bl Proc_Break
	b .L08021656
	.align 2, 0
.L0802162C: .4byte gUnknown_080D7B30
.L08021630:
	cmp r4, #0x18
	bne .L0802163C
	cmp r5, #9
	bne .L0802163C
	bl RefreshUnitSprites
.L0802163C:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, .L08021660  @ gBmFrameTmap0
	adds r0, r0, r1
	ldr r1, .L08021664  @ gBg0Tm
	movs r2, #8
	movs r3, #9
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
.L08021656:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08021660: .4byte gBmFrameTmap0
.L08021664: .4byte gBg0Tm

	THUMB_FUNC_END func_080215F0

	THUMB_FUNC_START func_08021668
func_08021668: @ 0x08021668
	push {lr}
	bl SetBlendNone
	ldr r0, .L08021680  @ gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L08021680: .4byte gBg0Tm

	THUMB_FUNC_END func_08021668

	THUMB_FUNC_START BeginLightRuneMapAnim
BeginLightRuneMapAnim: @ 0x08021684
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, .L080216C8  @ gUnknown_0859B3B0
	adds r1, r3, #0
	bl SpawnProcLocking
	lsls r0, r4, #4
	ldr r2, .L080216CC  @ gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x18
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	negs r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080216C8: .4byte gUnknown_0859B3B0
.L080216CC: .4byte gBmSt

	THUMB_FUNC_END BeginLightRuneMapAnim

	THUMB_FUNC_START func_080216D0
func_080216D0: @ 0x080216D0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L08021768  @ gUnknown_085A403C
	ldr r1, .L0802176C  @ 0x06002000
	bl Decompress
	ldr r0, .L08021770  @ gUnknown_085A5760
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08021774  @ gUnknown_085A5780
	ldr r4, .L08021778  @ gBmFrameTmap0
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
.L080216FC:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne .L080216FC
	ldr r0, .L0802177C  @ gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, .L08021780  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L0802172E
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
.L0802172E:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08021768: .4byte gUnknown_085A403C
.L0802176C: .4byte 0x06002000
.L08021770: .4byte gUnknown_085A5760
.L08021774: .4byte gUnknown_085A5780
.L08021778: .4byte gBmFrameTmap0
.L0802177C: .4byte gBg0Tm
.L08021780: .4byte gPlaySt

	THUMB_FUNC_END func_080216D0

	THUMB_FUNC_START func_08021784
func_08021784: @ 0x08021784
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, .L080217C0  @ gUnknown_080D7B64
	mov r0, sp
	movs r2, #0x34
	bl memcpy
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne .L080217C4
	adds r0, r6, #0
	bl Proc_Break
	b .L080217EA
	.align 2, 0
.L080217C0: .4byte gUnknown_080D7B64
.L080217C4:
	cmp r4, #0x18
	bne .L080217D0
	cmp r5, #9
	bne .L080217D0
	bl RefreshUnitSprites
.L080217D0:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, .L080217F4  @ gBmFrameTmap0
	adds r0, r0, r1
	ldr r1, .L080217F8  @ gBg0Tm
	movs r2, #8
	movs r3, #9
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
.L080217EA:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080217F4: .4byte gBmFrameTmap0
.L080217F8: .4byte gBg0Tm

	THUMB_FUNC_END func_08021784

	THUMB_FUNC_START func_080217FC
func_080217FC: @ 0x080217FC
	push {lr}
	bl SetBlendNone
	ldr r0, .L08021814  @ gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L08021814: .4byte gBg0Tm

	THUMB_FUNC_END func_080217FC

	THUMB_FUNC_START func_08021818
func_08021818: @ 0x08021818
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, .L0802185C  @ gUnknown_0859B3D0
	adds r1, r3, #0
	bl SpawnProcLocking
	lsls r0, r4, #4
	ldr r2, .L08021860  @ gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x18
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	negs r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0802185C: .4byte gUnknown_0859B3D0
.L08021860: .4byte gBmSt

	THUMB_FUNC_END func_08021818

	THUMB_FUNC_START func_08021864
func_08021864: @ 0x08021864
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, .L080218FC  @ gUnknown_085A403C
	ldr r1, .L08021900  @ 0x06002000
	bl Decompress
	ldr r0, .L08021904  @ gUnknown_085A5760
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, .L08021908  @ gUnknown_085A5780
	ldr r4, .L0802190C  @ gBmFrameTmap0
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
.L08021890:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne .L08021890
	ldr r0, .L08021910  @ gBg0Tm
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, .L08021914  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt .L080218C2
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
.L080218C2:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080218FC: .4byte gUnknown_085A403C
.L08021900: .4byte 0x06002000
.L08021904: .4byte gUnknown_085A5760
.L08021908: .4byte gUnknown_085A5780
.L0802190C: .4byte gBmFrameTmap0
.L08021910: .4byte gBg0Tm
.L08021914: .4byte gPlaySt

	THUMB_FUNC_END func_08021864

	THUMB_FUNC_START func_08021918
func_08021918: @ 0x08021918
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, .L08021954  @ gUnknown_080D7B98
	mov r0, sp
	movs r2, #0x34
	bl memcpy
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne .L08021958
	adds r0, r6, #0
	bl Proc_Break
	b .L0802197E
	.align 2, 0
.L08021954: .4byte gUnknown_080D7B98
.L08021958:
	cmp r4, #0x18
	bne .L08021964
	cmp r5, #9
	bne .L08021964
	bl RefreshUnitSprites
.L08021964:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, .L08021988  @ gBmFrameTmap0
	adds r0, r0, r1
	ldr r1, .L0802198C  @ gBg0Tm
	movs r2, #8
	movs r3, #9
	bl TmCopyRect_thm
	movs r0, #1
	bl EnableBgSync
.L0802197E:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08021988: .4byte gBmFrameTmap0
.L0802198C: .4byte gBg0Tm

	THUMB_FUNC_END func_08021918

	THUMB_FUNC_START func_08021990
func_08021990: @ 0x08021990
	push {lr}
	bl SetBlendNone
	ldr r0, .L080219A8  @ gBg0Tm
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
.L080219A8: .4byte gBg0Tm

	THUMB_FUNC_END func_08021990

	THUMB_FUNC_START func_080219AC
func_080219AC: @ 0x080219AC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, .L080219F0  @ gUnknown_0859B3F0
	adds r1, r3, #0
	bl SpawnProcLocking
	lsls r0, r4, #4
	ldr r2, .L080219F4  @ gBmSt
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x18
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	negs r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080219F0: .4byte gUnknown_0859B3F0
.L080219F4: .4byte gBmSt

	THUMB_FUNC_END func_080219AC

.align 2, 0 @ align with 0
