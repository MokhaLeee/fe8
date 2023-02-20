	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	.global ArmCodeStart
ArmCodeStart:

.L08000228: .4byte gPal @ pool
.L0800022C: .4byte gUnknown_020222A8 @ pool
.L08000230: .4byte gUnknown_02022288 @ pool

	ARM_FUNC_START func_08000234
func_08000234: @ 0x08000234
	push {r4, r5, r6, r7}
	mov r7, #0x3e0
.L0800023C:
	ldr r0, .L08000230
	add r0, r0, r7, lsr #5
	ldrsb r5, [r0]
	tst r5, r5
	beq .L080002F4
	ldr r4, .L0800022C
	lsr r0, r7, #1
	add r0, r0, r0, lsl #1
	add r0, r0, #0x30
	add r4, r4, r0
	mov r6, #0x1e
.L08000268:
	sub r4, r4, #3
	ldrb r0, [r4]
	add r0, r0, r5
	strb r0, [r4]
	subs r0, r0, #0x20
	bpl .L08000284
	mov r0, #0
.L08000284:
	cmp r0, #0x20
	blo .L08000290
	mov r0, #0x1f
.L08000290:
	ldrb r1, [r4, #1]
	add r1, r1, r5
	strb r1, [r4, #1]
	subs r1, r1, #0x20
	bpl .L080002A8
	mov r1, #0
.L080002A8:
	cmp r1, #0x20
	blo .L080002B4
	mov r1, #0x1f
.L080002B4:
	ldrb r2, [r4, #2]
	add r2, r2, r5
	strb r2, [r4, #2]
	subs r2, r2, #0x20
	bpl .L080002CC
	mov r2, #0
.L080002CC:
	cmp r2, #0x20
	blo .L080002D8
	mov r2, #0x1f
.L080002D8:
	add r0, r0, r1, lsl #5
	add r0, r0, r2, lsl #10
	ldr r1, .L08000228
	add r1, r1, r6
	strh r0, [r1, r7]
	subs r6, r6, #2
	bpl .L08000268
.L080002F4:
	subs r7, r7, #0x20
	bpl .L0800023C
	pop {r4, r5, r6, r7}
	bx lr

	ARM_FUNC_END func_08000234

	ARM_FUNC_START ClearOam
ClearOam: @ 0x08000304
	@ r0 = dest
	@ r1 = count
	lsr r1, r1, #4
	sub r1, r1, #1		@ count = count / 16 - 1
	@ set the y-coordinate of each OBJ to 160, which moves it offscreen
	@ This loop is unrolled to set 16 OBJs each iteration
	mov r2, #160
1:
	str r2, [r0, #8*0]
	str r2, [r0, #8*1]
	str r2, [r0, #8*2]
	str r2, [r0, #8*3]
	str r2, [r0, #8*4]
	str r2, [r0, #8*5]
	str r2, [r0, #8*6]
	str r2, [r0, #8*7]
	str r2, [r0, #8*8]
	str r2, [r0, #8*9]
	str r2, [r0, #8*10]
	str r2, [r0, #8*11]
	str r2, [r0, #8*12]
	str r2, [r0, #8*13]
	str r2, [r0, #8*14]
	str r2, [r0, #8*15]
	add r0, r0, #8*16
	subs r1, r1, #1
	bpl 1b
	bx lr

	ARM_FUNC_END ClearOam

	ARM_FUNC_START GetChecksum32
GetChecksum32: @ 0x08000360
	push {r4, r5, r6, r7}
	sub r1, r1, #2
	mov r2, #0
	mov r3, #0
.L08000370:
	ldrh r4, [r0]
	add r2, r2, r4
	eor r3, r3, r4
	add r0, r0, #2
	subs r1, r1, #2
	bpl .L08000370
	mov r0, #0x10000
	sub r0, r0, #1
	and r2, r2, r0
	lsl r3, r3, #0x10
	mov r0, r2
	add r0, r0, r3
	pop {r4, r5, r6, r7}
	bx lr

	ARM_FUNC_END GetChecksum32

	ARM_FUNC_START TmFillRect
TmFillRect: @ 0x080003A8
	@ r0 = destination
	@ r1 = width
	@ r2 = height
	@ r3 = fillValue
	push {r4, r5, r6, r7}
	mov r4, r0
	sub r6, r2, #0
  1:
	sub r5, r1, #0
  2:
	strh r3, [r4]
	add r4, r4, #2
	subs r5, r5, #1		@ decrement width counter
	bpl 2b
	add r0, r0, #0x40
	mov r4, r0
	subs r6, r6, #1		@ decrement height counter
	bpl 1b
	pop {r4, r5, r6, r7}
	bx lr

	ARM_FUNC_END TmFillRect

	ARM_FUNC_START TmCopyRect
TmCopyRect: @ 0x080003E0
	push {r4, r5, r6, r7}
	tst r2, r2
	beq .L08000434
	bmi .L08000434
	tst r3, r3
	beq .L08000434
	bmi .L08000434
	mov r4, #0x40
	sub r4, r4, r2, lsl #1
	sub r6, r3, #1
.L08000408:
	sub r5, r2, #1
.L0800040C:
	ldrh r7, [r0]
	strh r7, [r1]
	add r0, r0, #2
	add r1, r1, #2
	subs r5, r5, #1
	bpl .L0800040C
	add r0, r0, r4
	add r1, r1, r4
	subs r6, r6, #1
	bpl .L08000408
.L08000434:
	pop {r4, r5, r6, r7}
	bx lr

	ARM_FUNC_END TmCopyRect

	ARM_FUNC_START TmApplyTsa
TmApplyTsa: @ 0x0800043C
	push {r4, r5, r6, r7}
	ldrb r3, [r1]
	ldrb r4, [r1, #1]
	add r1, r1, #2
	lsl r7, r4, #6
	add r0, r0, r7
	mov r6, r4
.L08000458:
	mov r5, r3
.L0800045C:
	ldrh r7, [r1]
	add r7, r7, r2
	strh r7, [r0]
	add r0, r0, #2
	add r1, r1, #2
	subs r5, r5, #1
	bpl .L0800045C
	sub r0, r0, r3, lsl #1
	sub r0, r0, #0x42
	subs r6, r6, #1
	bpl .L08000458
	pop {r4, r5, r6, r7}
	bx lr

	.align 2, 0
.L08000490: .4byte gOamHiPutIt @ pool

	ARM_FUNC_END TmApplyTsa

	ARM_FUNC_START PutOamHi
PutOamHi: @ 0x08000494
	push {r4, r5, r6, r7}
	ldr r7, .L08000490
.L0800049C:
	ldr r5, [r7]
	ldrh r4, [r2]
	tst r4, r4
	beq .L08000528
	bmi .L08000528
	add r2, r2, #2
	add r6, r5, r4, lsl #3
	str r6, [r7]
	mov r7, #0x10000
	sub r7, r7, #1
	and r0, r0, r7
	and r1, r1, r7
	orr r0, r0, r1, lsl #16
.L080004D0:
	ldrh r1, [r2]
	orr r6, r1, r0, lsr #16
	and r6, r6, #0xff00
	add r7, r1, r0, lsr #16
	and r7, r7, #0xff
	orr r6, r6, r7
	strh r6, [r5]
	ldrh r1, [r2, #2]
	orr r6, r1, r0
	and r6, r6, #0xfe00
	add r7, r1, r0
	lsl r7, r7, #0x17
	lsr r7, r7, #0x17
	orr r6, r6, r7
	strh r6, [r5, #2]
	ldrh r1, [r2, #4]
	add r6, r1, r3
	strh r6, [r5, #4]
	add r2, r2, #6
	add r5, r5, #8
	subs r4, r4, #1
	bne .L080004D0
.L08000528:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
.L08000530: .4byte gOamLoPutIt @ pool

	ARM_FUNC_END PutOamHi

	ARM_FUNC_START PutOamLo
PutOamLo: @ 0x08000534
	push {r4, r5, r6, r7}
	ldr r7, .L08000530
	b .L0800049C

bitTable:
	.4byte (1 << 0)
	.4byte (1 << 2)
	.4byte (1 << 4)
	.4byte (1 << 6)
	.4byte (1 << 8)
	.4byte (1 << 10)
	.4byte (1 << 12)
	.4byte (1 << 14)

lt_bitTable: .4byte bitTable @ pool

	ARM_FUNC_END PutOamLo

	ARM_FUNC_START DrawGlyph
DrawGlyph: @ 0x08000564
	push {r4, r5, r6, r7, r8, r9, sl}
	mov r9, #0xf
	mov sl, #0x10000
	sub sl, sl, #1
.L08000574:
	ldr r4, lt_bitTable  @ bitTable
	ldr r5, [r4, r3, lsl #2]
	ldr r4, [r2]
	umull r5, r6, r4, r5
	mov r7, r5
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r5, #8
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1]
	orr r4, r4, r7
	str r4, [r1]
	lsr r7, r5, #0x10
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r5, #0x18
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1, #0x40]
	orr r4, r4, r7
	str r4, [r1, #0x40]
	mov r7, r6
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r6, #8
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1, #0x80]
	orr r4, r4, r7
	str r4, [r1, #0x80]
	add r1, r1, #4
	add r2, r2, #4
	subs r9, r9, #1
	bpl .L08000574
	pop {r4, r5, r6, r7, r8, r9, sl}
	bx lr

	ARM_FUNC_END DrawGlyph

	ARM_FUNC_START func_08000620
func_08000620: @ 0x08000620
	push {r4, r5, r6, r7, r8, r9, sl}
	mov r9, #7
	mov sl, #0x10000
	sub sl, sl, #1
.L08000630:
	ldr r4, lt_bitTable  @ gUnknown_08000540
	ldr r5, [r4, r3, lsl #2]
	ldr r4, [r2]
	umull r5, r6, r4, r5
	mov r7, r5
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r5, #8
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1]
	orr r4, r4, r7
	str r4, [r1]
	lsr r7, r5, #0x10
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r5, #0x18
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1, #0x40]
	orr r4, r4, r7
	str r4, [r1, #0x20]
	mov r7, r6
	and r7, r7, #0xff
	ldr r7, [r0, r7, lsl #1]
	lsr r8, r6, #8
	and r8, r8, #0xff
	ldr r8, [r0, r8, lsl #1]
	and r7, r7, sl
	orr r7, r7, r8, lsl #16
	ldr r4, [r1, #0x80]
	orr r4, r4, r7
	str r4, [r1, #0x40]
	add r1, r1, #4
	add r2, r2, #4
	subs r9, r9, #1
	bpl .L08000630
	pop {r4, r5, r6, r7, r8, r9, sl}
	bx lr
	.align 2, 0
.L080006DC: .4byte gUnknown_0815D488
.L080006E0: .4byte gUnknown_0815A72C

	ARM_FUNC_END func_08000620

	ARM_FUNC_START DecodeString
DecodeString: @ 0x080006E4
	push {r4, r5, r6, r7}
	sub r3, r3, r3
	ldr r5, .L080006E0
	ldr r7, .L080006DC
	ldr r7, [r7]
.L080006F8:
	mov r4, r7
.L080006FC:
	subs r3, r3, #1
	bpl .L08000710
	ldrb r2, [r0]
	add r0, r0, #1
	mov r3, #7
.L08000710:
	tst r2, #1
	beq .L08000720
	ldrh r6, [r4, #2]
	b .L08000724
.L08000720:
	ldrh r6, [r4]
.L08000724:
	add r4, r5, r6, lsl #2
	lsr r2, r2, #1
	ldr r6, [r4]
	tst r6, r6
	bpl .L080006FC
	tst r6, #0xff00
	beq .L08000754
	strb r6, [r1]
	lsr r6, r6, #8
	strb r6, [r1, #1]
	add r1, r1, #2
	b .L080006F8
.L08000754:
	strb r6, [r1]
	tst r6, #0xff
	beq .L08000768
	add r1, r1, #1
	b .L080006F8
.L08000768:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
.L08000770: .4byte gWorkingMoveTable @ pool
.L08000774: .4byte gMapFloodSt @ pool
.L08000778: .4byte gWorkingMap @ pool
.L0800077C: .4byte gMapTerrain @ pool
.L08000780: .4byte gMapUnit @ pool

	ARM_FUNC_END DecodeString

	ARM_FUNC_START MapFloodCoreStep
MapFloodCoreStep: @ 0x08000784
	push {r4, r5, r6, r7, r8, r9, sl}
	ldr r3, .L08000774
	ldr r4, [r3]
	ldrb r5, [r4]
	add r1, r1, r5
	ldrb r6, [r4, #1]
	add r2, r2, r6
	ldr r7, .L0800077C
	ldr r7, [r7]
	ldr r7, [r7, r2, lsl #2]
	ldrb r7, [r7, r1]
	ldr r8, .L08000770
	ldrb sl, [r8, r7]
	ldr r7, .L08000778
	ldr r7, [r7]
	ldr r9, [r7, r6, lsl #2]
	ldrb r9, [r9, r5]
	add sl, sl, r9
	ldr r9, [r7, r2, lsl #2]
	ldrb r9, [r9, r1]
	cmp sl, r9
	bhs .L08000848
	ldrb r4, [r3, #8]
	tst r4, r4
	beq .L08000810
	ldr r7, .L08000780
	ldr r7, [r7]
	ldr r7, [r7, r2, lsl #2]
	ldrb r7, [r7, r1]
	tst r7, r7
	beq .L08000810
	ldrb r4, [r3, #0xa]
	eor r4, r4, r7
	ands r4, r4, #0x80
	bne .L08000848
.L08000810:
	ldrb r4, [r3, #9]
	cmp sl, r4
	bhi .L08000848
	ldr r4, [r3, #4]
	strb r1, [r4]
	strb r2, [r4, #1]
	strb r0, [r4, #2]
	strb sl, [r4, #3]
	add r4, r4, #4
	str r4, [r3, #4]
	ldr r7, .L08000778
	ldr r7, [r7]
	ldr r7, [r7, r2, lsl #2]
	strb sl, [r7, r1]
.L08000848:
	pop {r4, r5, r6, r7, r8, r9, sl}
	bx lr
	.align 2, 0
.L08000850: .4byte gMapFloodSquareBufA @ pool
.L08000854: .4byte gMapFloodSquareBufB @ pool

.L08000858:
	b .L08000994
	b .L080009C8
	b .L08000960
	b .L0800092C
	b .L08000A14
	b .L080008E8

	.4byte .L08000858

	ARM_FUNC_END MapFloodCoreStep

	ARM_FUNC_START MapFloodCore
MapFloodCore: @ 0x08000874
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r5, .L08000774  @ gMapFloodSt
.L08000880:
	eors r4, r4, #1
	beq .L0800089C
	ldr r0, .L08000850  @ gMapFloodSquareBufA
	str r0, [r5]
	ldr r0, .L08000854  @ gMapFloodSquareBufB
	str r0, [r5, #4]
	b .L080008AC
.L0800089C:
	ldr r0, .L08000854  @ gMapFloodSquareBufB
	str r0, [r5]
	ldr r0, .L08000850  @ gMapFloodSquareBufA
	str r0, [r5, #4]
.L080008AC:
	ldr r6, [r5]
	ldrb r6, [r6, #2]
	cmp r6, #4
	beq .L08000A18
.L080008BC:
	ldr r6, [r5]
	ldrb r6, [r6, #2]
	mov r0, pc
	add r0, r0, #8
	add r0, r0, r6, lsl #2
	bx r0
	b .L08000994
	b .L080009C8
	b .L08000960
	b .L0800092C
	b .L08000A14
.L080008E8:
	mov r0, #3
	mov r1, #0
	mvn r2, #0
	bl MapFloodCoreStep
	mov r0, #2
	mov r1, #0
	mov r2, #1
	bl MapFloodCoreStep
	mov r0, #0
	mvn r1, #0
	mov r2, #0
	bl MapFloodCoreStep
	mov r0, #1
	mov r1, #1
	mov r2, #0
	bl MapFloodCoreStep
	b .L080009F8
.L0800092C:
	mov r0, #3
	mov r1, #0
	mvn r2, #0
	bl MapFloodCoreStep
	mov r0, #0
	mvn r1, #0
	mov r2, #0
	bl MapFloodCoreStep
	mov r0, #1
	mov r1, #1
	mov r2, #0
	bl MapFloodCoreStep
	b .L080009F8
.L08000960:
	mov r0, #2
	mov r1, #0
	mov r2, #1
	bl MapFloodCoreStep
	mov r0, #0
	mvn r1, #0
	mov r2, #0
	bl MapFloodCoreStep
	mov r0, #1
	mov r1, #1
	mov r2, #0
	bl MapFloodCoreStep
	b .L080009F8
.L08000994:
	mov r0, #3
	mov r1, #0
	mvn r2, #0
	bl MapFloodCoreStep
	mov r0, #2
	mov r1, #0
	mov r2, #1
	bl MapFloodCoreStep
	mov r0, #0
	mvn r1, #0
	mov r2, #0
	bl MapFloodCoreStep
	b .L080009F8
.L080009C8:
	mov r0, #3
	mov r1, #0
	mvn r2, #0
	bl MapFloodCoreStep
	mov r0, #2
	mov r1, #0
	mov r2, #1
	bl MapFloodCoreStep
	mov r0, #1
	mov r1, #1
	mov r2, #0
	bl MapFloodCoreStep
.L080009F8:
	ldr r6, [r5, #4]
	mov r0, #4
	strb r0, [r6, #2]
	ldr r6, [r5]
	add r6, r6, #4
	str r6, [r5]
	b .L080008BC
.L08000A14:
	b .L08000880
.L08000A18:
	pop {r4, r5, r6, lr}
	bx lr

	.global ArmCodeEnd
ArmCodeEnd:
	ARM_FUNC_END MapFloodCore
