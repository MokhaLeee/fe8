	.INCLUDE "macro.inc"
	.SYNTAX UNIFIED

	THUMB_FUNC_START StartFaceAuto
StartFaceAuto: @ 0x08005610
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl GetFreeFaceSlot
	cmp r0, #0
	blt .L08005632
	str r4, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl StartFace
	b .L08005634
.L08005632:
	movs r0, #0
.L08005634:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END StartFaceAuto

	THUMB_FUNC_START StartFace
StartFace: @ 0x0800563C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov r9, r2
	mov sl, r3
	ldr r1, .L08005660  @ gFaces
	lsls r0, r6, #2
	adds r5, r0, r1
	ldr r7, [r5]
	cmp r7, #0
	beq .L08005664
	movs r0, #0
	b .L08005720
	.align 2, 0
.L08005660: .4byte gFaces
.L08005664:
	ldr r0, .L080056A4  @ ProcScr_Face
	movs r1, #5
	bl SpawnProc
	adds r4, r0, #0
	str r4, [r5]
	mov r0, r8
	bl GetFaceInfo
	adds r5, r0, #0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq .L080056B4
	str r7, [sp]
	ldr r1, .L080056A8  @ gFaceConfig
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, .L080056AC  @ gPal+0x200
	adds r1, r1, r0
	ldr r2, .L080056B0  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b .L080056C8
	.align 2, 0
.L080056A4: .4byte ProcScr_Face
.L080056A8: .4byte gFaceConfig
.L080056AC: .4byte gPal+0x200
.L080056B0: .4byte 0x01000008
.L080056B4:
	ldr r0, [r5, #8]
	ldr r2, .L080056F8  @ gFaceConfig
	lsls r1, r6, #3
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
.L080056C8:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x40
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #5
	strb r0, [r1]
	mov r1, r9
	strh r1, [r4, #0x34]
	mov r0, sl
	strh r0, [r4, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq .L080056FC
	str r2, [r4, #0x44]
	str r2, [r4, #0x48]
	b .L08005710
	.align 2, 0
.L080056F8: .4byte gFaceConfig
.L080056FC:
	ldr r0, .L08005730  @ gUnknown_0859124C
	adds r1, r4, #0
	bl SpawnProc
	str r0, [r4, #0x44]
	ldr r0, .L08005734  @ gUnknown_08591264
	adds r1, r4, #0
	bl SpawnProc
	str r0, [r4, #0x48]
.L08005710:
	ldr r1, [sp, #0x24]
	mvns r0, r1
	str r0, [r4, #0x30]
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl SetFaceDisp
	adds r0, r4, #0
.L08005720:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08005730: .4byte gUnknown_0859124C
.L08005734: .4byte gUnknown_08591264

	THUMB_FUNC_END StartFace

	THUMB_FUNC_START EndFace
EndFace: @ 0x08005738
	push {lr}
	ldr r2, .L08005754  @ gFaces
	adds r1, r0, #0
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	str r2, [r1]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
.L08005754: .4byte gFaces

	THUMB_FUNC_END EndFace

	THUMB_FUNC_START EndFaceById
EndFaceById: @ 0x08005758
	push {lr}
	ldr r1, .L0800576C  @ gFaces
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl EndFace
	pop {r0}
	bx r0
	.align 2, 0
.L0800576C: .4byte gFaces

	THUMB_FUNC_END EndFaceById

	THUMB_FUNC_START SetFaceDisp
SetFaceDisp: @ 0x08005770
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq .L08005782
	str r1, [r4, #0x30]
	bl FaceRefreshSprite
	ldr r0, [r4, #0x30]
	b .L08005784
.L08005782:
	movs r0, #0
.L08005784:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END SetFaceDisp

	THUMB_FUNC_START SetFaceDispById
SetFaceDispById: @ 0x0800578C
	push {lr}
	ldr r2, .L080057A0  @ gFaces
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl SetFaceDisp
	pop {r1}
	bx r1
	.align 2, 0
.L080057A0: .4byte gFaces

	THUMB_FUNC_END SetFaceDispById

	THUMB_FUNC_START GetFaceDisp
GetFaceDisp: @ 0x080057A4
	ldr r0, [r0, #0x30]
	bx lr

	THUMB_FUNC_END GetFaceDisp

	THUMB_FUNC_START GetFaceDispById
GetFaceDispById: @ 0x080057A8
	push {lr}
	ldr r1, .L080057BC  @ gFaces
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetFaceDisp
	pop {r1}
	bx r1
	.align 2, 0
.L080057BC: .4byte gFaces

	THUMB_FUNC_END GetFaceDispById

	THUMB_FUNC_START FaceRefreshSprite
FaceRefreshSprite: @ 0x080057C0
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x30]
	ldr r0, .L080057E8  @ 0x00000807
	ands r1, r0
	cmp r1, #3
	beq .L0800580C
	cmp r1, #3
	bls .L080057EC
	cmp r1, #5
	beq .L0800581C
	cmp r1, #5
	bcc .L08005814
	subs r0, #7
	cmp r1, r0
	beq .L08005824
	adds r0, #1
	cmp r1, r0
	beq .L0800582C
	b .L08005830
	.align 2, 0
.L080057E8: .4byte 0x00000807
.L080057EC:
	cmp r1, #1
	beq .L080057FC
	cmp r1, #1
	bhi .L08005804
	ldr r0, .L080057F8  @ Sprite_Face64x80
	b .L0800582E
	.align 2, 0
.L080057F8: .4byte Sprite_Face64x80
.L080057FC:
	ldr r0, .L08005800  @ Sprite_Face64x80_Flipped
	b .L0800582E
	.align 2, 0
.L08005800: .4byte Sprite_Face64x80_Flipped
.L08005804:
	ldr r0, .L08005808  @ Sprite_Face96x80
	b .L0800582E
	.align 2, 0
.L08005808: .4byte Sprite_Face96x80
.L0800580C:
	ldr r0, .L08005810  @ Sprite_Face96x80_Flipped
	b .L0800582E
	.align 2, 0
.L08005810: .4byte Sprite_Face96x80_Flipped
.L08005814:
	ldr r0, .L08005818  @ gUnknown_0859108C
	b .L0800582E
	.align 2, 0
.L08005818: .4byte gUnknown_0859108C
.L0800581C:
	ldr r0, .L08005820  @ gUnknown_085910BE
	b .L0800582E
	.align 2, 0
.L08005820: .4byte gUnknown_085910BE
.L08005824:
	ldr r0, .L08005828  @ gUnknown_085910F0
	b .L0800582E
	.align 2, 0
.L08005828: .4byte gUnknown_085910F0
.L0800582C:
	ldr r0, .L08005848  @ gUnknown_08591122
.L0800582E:
	str r0, [r3, #0x38]
.L08005830:
	ldr r1, [r3, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0x80
	beq .L0800585A
	cmp r1, #0x80
	bhi .L0800584C
	cmp r1, #0x40
	beq .L08005856
	b .L08005866
	.align 2, 0
.L08005848: .4byte gUnknown_08591122
.L0800584C:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq .L08005860
	b .L08005866
.L08005856:
	movs r4, #0
	b .L0800586A
.L0800585A:
	movs r4, #0x80
	lsls r4, r4, #3
	b .L0800586A
.L08005860:
	movs r4, #0xc0
	lsls r4, r4, #4
	b .L0800586A
.L08005866:
	movs r4, #0x80
	lsls r4, r4, #4
.L0800586A:
	ldr r1, .L08005890  @ gFaceConfig
	adds r0, r3, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	lsrs r1, r1, #5
	ldrh r2, [r0, #4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r4
	strh r1, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08005890: .4byte gFaceConfig

	THUMB_FUNC_END FaceRefreshSprite

	THUMB_FUNC_START PutFaceTm
PutFaceTm: @ 0x08005894
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov ip, r2
	ldrb r7, [r1]
	adds r1, #1
	ldrb r6, [r1]
	adds r2, r1, #1
	lsls r3, r3, #0x18
	cmp r3, #0
	bne .L080058DE
	movs r0, #0
	cmp r0, r6
	bge .L08005918
.L080058B2:
	adds r4, r0, #1
	cmp r7, #0
	beq .L080058D6
	lsls r0, r0, #6
	mov r3, r8
	adds r1, r0, r3
	adds r3, r7, #0
.L080058C0:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq .L080058CC
	ldrb r0, [r2]
	add r0, ip
	strh r0, [r1]
.L080058CC:
	adds r2, #1
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne .L080058C0
.L080058D6:
	adds r0, r4, #0
	cmp r0, r6
	blt .L080058B2
	b .L08005918
.L080058DE:
	movs r0, #0
	cmp r0, r6
	bge .L08005918
.L080058E4:
	subs r3, r7, #1
	adds r4, r0, #1
	cmp r3, #0
	blt .L08005912
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r1, #0
	lsls r1, r3, #1
	lsls r0, r0, #6
	add r0, r8
	adds r1, r1, r0
.L080058FA:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq .L08005908
	ldrb r0, [r2]
	add r0, ip
	adds r0, r0, r5
	strh r0, [r1]
.L08005908:
	adds r2, #1
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bge .L080058FA
.L08005912:
	adds r0, r4, #0
	cmp r0, r6
	blt .L080058E4
.L08005918:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END PutFaceTm

	THUMB_FUNC_START UnpackFaceChibiGraphics
UnpackFaceChibiGraphics: @ 0x08005924
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, .L08005958  @ 0x00007EFF
	cmp r4, r0
	ble .L08005960
	adds r0, r4, #0
	bl GetFactionFaceImg
	lsls r1, r5, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	ldr r2, .L0800595C  @ 0x0001FFFF
	ands r1, r2
	adds r1, r1, r3
	movs r2, #0x80
	lsls r2, r2, #2
	bl RegisterDataMove
	adds r0, r4, #0
	adds r1, r6, #0
	bl ApplyFactionFacePal
	b .L08005980
	.align 2, 0
.L08005958: .4byte 0x00007EFF
.L0800595C: .4byte 0x0001FFFF
.L08005960:
	adds r0, r4, #0
	bl GetFaceInfo
	adds r4, r0, #0
	ldr r0, [r4, #4]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, [r4, #8]
	lsls r1, r6, #5
	movs r2, #0x20
	bl ApplyPaletteExt
.L08005980:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END UnpackFaceChibiGraphics

	THUMB_FUNC_START PutFaceChibi
PutFaceChibi: @ 0x08005988
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x14]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r6, #0
	adds r2, r5, #0
	bl UnpackFaceChibiGraphics
	ldr r2, .L080059C4  @ 0x000003FF
	ands r2, r6
	ldr r1, .L080059C8  @ gUnknown_085911C4
	lsls r5, r5, #0xc
	adds r2, r2, r5
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r0, r8
	adds r3, r4, #0
	bl PutFaceTm
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L080059C4: .4byte 0x000003FF
.L080059C8: .4byte gUnknown_085911C4

	THUMB_FUNC_END PutFaceChibi

	THUMB_FUNC_START UnpackFaceChibiSprGraphics
UnpackFaceChibiSprGraphics: @ 0x080059CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, .L08005A5C  @ 0xFFFFFE00
	add sp, r4
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r0, #0x80
	lsls r0, r0, #4
	adds r7, r7, r0
	ldr r0, .L08005A60  @ 0x00007EFF
	cmp r6, r0
	ble .L08005A68
	adds r0, r6, #0
	bl GetFactionFaceImg
	lsls r1, r7, #5
	ldr r5, .L08005A64  @ 0x0001FFFF
	ands r1, r5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetFactionFaceImg
	adds r0, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetFactionFaceImg
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #4
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	adds r0, r6, #0
	bl GetFactionFaceImg
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	ands r1, r5
	adds r1, r1, r4
	movs r2, #0x80
	bl RegisterDataMove
	mov r1, r8
	adds r1, #0x10
	adds r0, r6, #0
	bl ApplyFactionFacePal
	b .L08005AC4
	.align 2, 0
.L08005A5C: .4byte 0xFFFFFE00
.L08005A60: .4byte 0x00007EFF
.L08005A64: .4byte 0x0001FFFF
.L08005A68:
	adds r0, r6, #0
	bl GetFaceInfo
	adds r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, sp
	bl Decompress
	lsls r1, r7, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r1, r1, r4
	mov r0, sp
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x80
	adds r1, r7, #0
	adds r1, #0x20
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x100
	adds r1, r7, #4
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	add r0, sp, #0x180
	adds r1, r7, #0
	adds r1, #0x24
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x20
	bl CpuFastSet
	ldr r0, [r5, #8]
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
.L08005AC4:
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END UnpackFaceChibiSprGraphics

	THUMB_FUNC_START FaceChibiSpr_OnIdle
FaceChibiSpr_OnIdle: @ 0x08005AD4
	push {r4, lr}
	sub sp, #4
	movs r2, #0x34
	ldrsh r1, [r0, r2]
	ldr r3, .L08005B00  @ gDispIo
	ldrh r2, [r3, #0x1c]
	subs r1, r1, r2
	movs r4, #0x36
	ldrsh r2, [r0, r4]
	ldrh r3, [r3, #0x1e]
	subs r2, r2, r3
	ldr r3, [r0, #0x38]
	ldrh r0, [r0, #0x3c]
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08005B00: .4byte gDispIo

	THUMB_FUNC_END FaceChibiSpr_OnIdle

	THUMB_FUNC_START StartFaceChibiStr
StartFaceChibiStr: @ 0x08005B04
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	adds r0, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	ldr r7, [sp, #0x24]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl UnpackFaceChibiSprGraphics
	ldr r0, .L08005B4C  @ gUnknown_085911D8
	adds r1, r7, #0
	bl SpawnProc
	adds r1, r0, #0
	mov r0, r8
	strh r0, [r1, #0x34]
	mov r0, r9
	strh r0, [r1, #0x36]
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r6, r6, r4
	strh r6, [r1, #0x3c]
	cmp r5, #0
	beq .L08005B54
	ldr r0, .L08005B50  @ gUnknown_085911F6
	b .L08005B56
	.align 2, 0
.L08005B4C: .4byte gUnknown_085911D8
.L08005B50: .4byte gUnknown_085911F6
.L08005B54:
	ldr r0, .L08005B64  @ gUnknown_085911E8
.L08005B56:
	str r0, [r1, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08005B64: .4byte gUnknown_085911E8

	THUMB_FUNC_END StartFaceChibiStr

	THUMB_FUNC_START EndFaceChibiSpr
EndFaceChibiSpr: @ 0x08005B68
	push {lr}
	ldr r0, .L08005B74  @ gUnknown_085911D8
	bl EndEachProc
	pop {r0}
	bx r0
	.align 2, 0
.L08005B74: .4byte gUnknown_085911D8

	THUMB_FUNC_END EndFaceChibiSpr

	THUMB_FUNC_START PutFace80x72_Standard
PutFace80x72_Standard: @ 0x08005B78
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldrb r5, [r2, #0x14]
	subs r5, #1
	ldrb r4, [r2, #0x15]
	ldr r1, .L08005BC8  @ gUnknown_085A0838
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	lsls r4, r4, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	adds r2, r4, r6
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08005BC8: .4byte gUnknown_085A0838

	THUMB_FUNC_END PutFace80x72_Standard

	THUMB_FUNC_START PutFace80x72_Raised
PutFace80x72_Raised: @ 0x08005BCC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldrb r5, [r2, #0x14]
	subs r5, #1
	ldrb r4, [r2, #0x15]
	subs r4, #1
	ldr r1, .L08005C20  @ gUnknown_085A08F0
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	lsls r4, r4, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	adds r2, r4, r6
	adds r0, r7, #0
	adds r0, #0x1c
	strh r0, [r2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x40
	adds r0, #0x1d
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08005C20: .4byte gUnknown_085A08F0

	THUMB_FUNC_END PutFace80x72_Raised

	THUMB_FUNC_START IsSmallFid
IsSmallFid: @ 0x08005C24
	push {lr}
	subs r0, #0x10
	cmp r0, #0x16
	bhi .L08005C9C
	lsls r0, r0, #2
	ldr r1, .L08005C38  @ .L08005C3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08005C38: .4byte .L08005C3C
.L08005C3C: @ jump table
	.4byte .L08005C98 @ case 0
	.4byte .L08005C9C @ case 1
	.4byte .L08005C9C @ case 2
	.4byte .L08005C9C @ case 3
	.4byte .L08005C9C @ case 4
	.4byte .L08005C9C @ case 5
	.4byte .L08005C9C @ case 6
	.4byte .L08005C9C @ case 7
	.4byte .L08005C9C @ case 8
	.4byte .L08005C98 @ case 9
	.4byte .L08005C9C @ case 10
	.4byte .L08005C9C @ case 11
	.4byte .L08005C9C @ case 12
	.4byte .L08005C9C @ case 13
	.4byte .L08005C9C @ case 14
	.4byte .L08005C9C @ case 15
	.4byte .L08005C9C @ case 16
	.4byte .L08005C98 @ case 17
	.4byte .L08005C9C @ case 18
	.4byte .L08005C98 @ case 19
	.4byte .L08005C9C @ case 20
	.4byte .L08005C9C @ case 21
	.4byte .L08005C98 @ case 22
.L08005C98:
	movs r0, #1
	b .L08005C9E
.L08005C9C:
	movs r0, #0
.L08005C9E:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsSmallFid

	THUMB_FUNC_START PutFace80x72_Core
PutFace80x72_Core: @ 0x08005CA4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	beq .L08005D54
	adds r0, r5, #0
	bl GetFaceInfo
	adds r4, r0, #0
	ldr r0, [r4, #8]
	lsls r1, r7, #5
	mov r8, r1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r4]
	cmp r0, #0
	beq .L08005D34
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, [r4, #8]
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r5, #0
	bl IsSmallFid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq .L08005D0C
	lsls r1, r7, #0xc
	ldr r0, .L08005D08  @ 0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, r9
	adds r2, r4, #0
	bl PutFace80x72_Raised
	b .L08005D1C
	.align 2, 0
.L08005D08: .4byte 0x000003FF
.L08005D0C:
	lsls r1, r7, #0xc
	ldr r0, .L08005D30  @ 0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, r9
	adds r2, r4, #0
	bl PutFace80x72_Standard
.L08005D1C:
	movs r2, #0
	mov r0, r9
	movs r1, #4
.L08005D22:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #0x40
	subs r1, #1
	cmp r1, #0
	bge .L08005D22
	b .L08005D54
	.align 2, 0
.L08005D30: .4byte 0x000003FF
.L08005D34:
	ldr r0, [r4, #0x10]
	lsls r1, r6, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	lsls r1, r7, #0xc
	ldr r0, .L08005D60  @ 0x000003FF
	ands r0, r6
	adds r1, r1, r0
	mov r0, r9
	movs r2, #0xa
	movs r3, #9
	bl func_08013104
.L08005D54:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08005D60: .4byte 0x000003FF

	THUMB_FUNC_END PutFace80x72_Core

	THUMB_FUNC_START func_08005D64
func_08005D64: @ 0x08005D64
	movs r2, #0
	str r2, [r0, #0x2c]
	movs r1, #0x78
	str r1, [r0, #0x38]
	strh r2, [r0, #0x32]
	bx lr

	THUMB_FUNC_END func_08005D64

	THUMB_FUNC_START func_08005D70
func_08005D70: @ 0x08005D70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	cmp r0, #0
	bge .L08005D90
	adds r0, r4, #0
	bl FaceBlinkProc_GenBlinkInterval
	str r0, [r4, #0x38]
	movs r0, #0
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
.L08005D90:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08005D70

	THUMB_FUNC_START func_08005D98
func_08005D98: @ 0x08005D98
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	lsls r1, r1, #0xc
	subs r0, #2
	ldrh r2, [r0]
	ldr r0, .L08005DCC  @ 0x000003FF
	ands r0, r2
	adds r7, r1, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetFaceInfo
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bhi .L08005E38
	lsls r0, r0, #2
	ldr r1, .L08005DD0  @ .L08005DD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08005DCC: .4byte 0x000003FF
.L08005DD0: .4byte .L08005DD4
.L08005DD4: @ jump table
	.4byte .L08005E00 @ case 0
	.4byte .L08005E8A @ case 1
	.4byte .L08005E8A @ case 2
	.4byte .L08005DFC @ case 3
	.4byte .L08005E8A @ case 4
	.4byte .L08005E8A @ case 5
	.4byte .L08005E00 @ case 6
	.4byte .L08005E8A @ case 7
	.4byte .L08005E8A @ case 8
	.4byte .L08005E04 @ case 9
.L08005DFC:
	movs r6, #0x58
	b .L08005E38
.L08005E00:
	movs r6, #0x18
	b .L08005E38
.L08005E04:
	ldr r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	lsls r1, r1, #0xc
	adds r2, r4, #0
	adds r2, #0x40
	ldrh r3, [r2]
	ldr r2, .L08005E34  @ 0x000003FF
	ands r2, r3
	adds r1, r1, r2
	adds r2, r5, #0
	bl PutFace80x72_Standard
	ldr r0, [r4, #0x3c]
	bl GetBgFromTm
	bl EnableBgSyncById
	adds r0, r4, #0
	bl Proc_Break
	b .L08005E90
	.align 2, 0
.L08005E34: .4byte 0x000003FF
.L08005E38:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetFaceInfo
	adds r5, r0, #0
	ldrb r0, [r5, #0x17]
	lsls r0, r0, #6
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	ldrb r0, [r5, #0x16]
	lsls r0, r0, #1
	adds r1, r1, r0
	mov ip, r1
	mov r0, ip
	subs r0, #2
	adds r2, r7, r6
	strh r2, [r0]
	adds r1, r2, #1
	strh r1, [r0, #2]
	adds r1, r2, #2
	strh r1, [r0, #4]
	adds r1, r2, #3
	strh r1, [r0, #6]
	adds r1, #0x1d
	mov r3, ip
	strh r1, [r3, #0x3e]
	adds r3, #0x40
	adds r1, #1
	strh r1, [r3]
	adds r3, #2
	adds r1, #1
	strh r1, [r3]
	mov r1, ip
	adds r1, #0x44
	adds r2, #0x23
	strh r2, [r1]
	bl GetBgFromTm
	bl EnableBgSyncById
.L08005E8A:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
.L08005E90:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08005D98

	THUMB_FUNC_START PutFace80x72
PutFace80x72: @ 0x08005E98
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x14]
	ldr r0, .L08005EC8  @ gUnknown_08591204
	bl EndEachProc
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutFace80x72_Core
	mov r0, r8
	bl GetFaceInfo
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08005EC8: .4byte gUnknown_08591204

	THUMB_FUNC_END PutFace80x72

	THUMB_FUNC_START EndFacePtr
EndFacePtr: @ 0x08005ECC
	push {lr}
	ldr r0, [r0, #0x54]
	bl EndFace
	pop {r0}
	bx r0

	THUMB_FUNC_END EndFacePtr

	THUMB_FUNC_START EndFaceIn8Frames
EndFaceIn8Frames: @ 0x08005ED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, .L08005EEC  @ gUnknown_08591234
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08005EEC: .4byte gUnknown_08591234

	THUMB_FUNC_END EndFaceIn8Frames

	THUMB_FUNC_START StartFaceFadeIn
StartFaceFadeIn: @ 0x08005EF0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetFaceInfo
	mov r8, r0
	ldr r6, .L08005F34  @ gFaceConfig
	adds r5, r4, #0
	adds r5, #0x40
	ldrb r0, [r5]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	adds r0, #0x10
	bl func_08013A84
	mov r1, r8
	ldr r0, [r1, #8]
	ldrb r1, [r5]
	lsls r1, r1, #3
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	adds r1, #0x10
	movs r2, #0xc
	adds r3, r4, #0
	bl func_08013928
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08005F34: .4byte gFaceConfig

	THUMB_FUNC_END StartFaceFadeIn

	THUMB_FUNC_START StartFaceFadeOut
StartFaceFadeOut: @ 0x08005F38
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetFaceInfo
	ldr r1, .L08005F68  @ gFaceConfig
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r0, #0x10
	movs r1, #0xc
	adds r2, r4, #0
	bl func_080138F0
	adds r0, r4, #0
	bl EndFaceIn8Frames
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
.L08005F68: .4byte gFaceConfig

	THUMB_FUNC_END StartFaceFadeOut

	THUMB_FUNC_START GetFactionFaceImg
GetFactionFaceImg: @ 0x08005F6C
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, .L08005F94  @ gUnknown_080D77BC
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	ldr r5, .L08005F98  @ 0xFFFF8100
	adds r0, r0, r5
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.L08005F94: .4byte gUnknown_080D77BC
.L08005F98: .4byte 0xFFFF8100

	THUMB_FUNC_END GetFactionFaceImg

	THUMB_FUNC_START ApplyFactionFacePal
ApplyFactionFacePal: @ 0x08005F9C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	mov r3, sp
	ldr r2, .L08005FCC  @ gUnknown_080D77DC
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5}
	stm r3!, {r4, r5}
	ldr r6, .L08005FD0  @ 0xFFFF8100
	adds r0, r0, r6
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08005FCC: .4byte gUnknown_080D77DC
.L08005FD0: .4byte 0xFFFF8100

	THUMB_FUNC_END ApplyFactionFacePal

	THUMB_FUNC_START func_08005FD4
func_08005FD4: @ 0x08005FD4
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	movs r1, #0
	strh r1, [r0, #0x32]
	bx lr

	THUMB_FUNC_END func_08005FD4

	THUMB_FUNC_START func_08005FE0
func_08005FE0: @ 0x08005FE0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetFaceDisp
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	bne .L08006034
	ldr r0, [r4, #0x2c]
	bl GetFaceDisp
	movs r1, #8
	ands r1, r0
	movs r3, #0
	cmp r1, #0
	bne .L08006006
	movs r3, #0x18
.L08006006:
	adds r3, #0x10
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, .L0800602C  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, .L08006030  @ 0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl RegisterObjectTileGraphics
	b .L080060A4
	.align 2, 0
.L0800602C: .4byte 0x000003FF
.L08006030: .4byte 0x06010000
.L08006034:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge .L080060A4
	ldr r0, [r4, #0x2c]
	bl GetFaceDisp
	movs r1, #8
	ands r1, r0
	movs r5, #0
	cmp r1, #0
	bne .L08006052
	movs r5, #0x18
.L08006052:
	bl RandNextB
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq .L0800607E
	cmp r0, #1
	ble .L08006084
	cmp r0, #2
	beq .L08006082
	cmp r0, #3
	bne .L08006084
.L0800607E:
	adds r5, #8
	b .L08006084
.L08006082:
	adds r5, #0x10
.L08006084:
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r5, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, .L08006124  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, .L08006128  @ 0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl RegisterObjectTileGraphics
.L080060A4:
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x2c]
	ldrb r2, [r1, #0x14]
	movs r1, #4
	subs r5, r1, r2
	bl GetFaceDisp
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne .L080060BC
	negs r5, r5
.L080060BC:
	lsls r1, r5, #3
	ldr r0, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r5, r1, #0
	subs r5, #0x10
	ldr r1, .L0800612C  @ 0x000001FF
	ands r5, r1
	bl GetFaceDisp
	ands r0, r6
	cmp r0, #0
	beq .L080060DE
	movs r0, #0x80
	lsls r0, r0, #5
	adds r5, r5, r0
.L080060DE:
	ldr r0, [r4, #0x2c]
	bl GetFaceDisp
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	negs r2, r2
	asrs r2, r2, #0x1f
	ands r2, r0
	ldr r4, [r4, #0x2c]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x15]
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	adds r2, r2, r1
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, .L08006130  @ Sprite_32x16
	ldrh r1, [r4, #0x3c]
	adds r1, #0x1c
	str r1, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.L08006124: .4byte 0x000003FF
.L08006128: .4byte 0x06010000
.L0800612C: .4byte 0x000001FF
.L08006130: .4byte Sprite_32x16

	THUMB_FUNC_END func_08005FE0

	THUMB_FUNC_START func_08006134
func_08006134: @ 0x08006134
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0
	mov r9, r0
	cmp r5, #1
	beq .L08006162
	cmp r5, #1
	bgt .L08006154
	cmp r5, #0
	beq .L0800615E
	b .L0800622A
.L08006154:
	cmp r5, #0x80
	beq .L08006166
	cmp r5, #0x81
	beq .L0800616E
	b .L0800622A
.L0800615E:
	movs r5, #0x58
	b .L08006174
.L08006162:
	movs r5, #0x18
	b .L08006174
.L08006166:
	movs r5, #0x58
	movs r1, #1
	mov r9, r1
	b .L08006174
.L0800616E:
	movs r5, #0x18
	movs r3, #1
	mov r9, r3
.L08006174:
	ldr r0, [r7, #0x2c]
	ldr r1, [r0, #0x2c]
	ldrb r2, [r1, #0x16]
	movs r1, #4
	subs r4, r1, r2
	bl GetFaceDisp
	movs r1, #1
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	bne .L0800618E
	negs r4, r4
.L0800618E:
	lsls r1, r4, #3
	ldr r0, [r7, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r4, r1, #0
	subs r4, #0x10
	ldr r1, .L0800620C  @ 0x000001FF
	ands r4, r1
	bl GetFaceDisp
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq .L080061B2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r4, r4, r0
.L080061B2:
	ldr r0, [r7, #0x2c]
	bl GetFaceDisp
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	negs r0, r0
	asrs r6, r0, #0x1f
	ands r6, r1
	ldr r2, [r7, #0x2c]
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	ldr r0, [r2, #0x2c]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	adds r6, r6, r1
	mov r0, r9
	cmp r0, #0
	beq .L08006214
	adds r0, r2, #0
	bl GetFaceDisp
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne .L080061EE
	adds r4, #0x10
.L080061EE:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, .L08006210  @ Sprite_16x16
	ldrh r1, [r1, #0x3c]
	adds r1, r1, r5
	adds r1, #2
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	b .L0800622A
	.align 2, 0
.L0800620C: .4byte 0x000001FF
.L08006210: .4byte Sprite_16x16
.L08006214:
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, .L08006238  @ Sprite_32x16
	ldrh r1, [r2, #0x3c]
	adds r1, r1, r5
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
.L0800622A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
.L08006238: .4byte Sprite_32x16

	THUMB_FUNC_END func_08006134

	THUMB_FUNC_START func_0800623C
func_0800623C: @ 0x0800623C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	ldr r0, [r0, #0x2c]
	ldrb r0, [r0, #0x18]
	movs r4, #0
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl FaceBlinkProc_GenBlinkInterval
	str r0, [r5, #0x38]
	strh r4, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #6
	bne .L08006274
	movs r0, #5
	strh r0, [r5, #0x30]
	ldr r0, .L0800627C  @ 0x7FFFFFFF
	str r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	adds r0, r5, #0
	movs r1, #0x61
	bl Proc_Goto
.L08006274:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L0800627C: .4byte 0x7FFFFFFF

	THUMB_FUNC_END func_0800623C

	THUMB_FUNC_START func_08006280
func_08006280: @ 0x08006280
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq .L0800629C
	adds r1, r5, #0
	adds r0, r4, #0
	bl Proc_Goto
	b .L080062B2
.L0800629C:
	cmp r0, #0
	bge .L080062B2
	adds r0, r4, #0
	bl FaceBlinkProc_GenBlinkInterval
	str r0, [r4, #0x38]
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L080062B2:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08006280

	THUMB_FUNC_START func_080062B8
func_080062B8: @ 0x080062B8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi .L08006310
	lsls r0, r0, #2
	ldr r1, .L080062D0  @ .L080062D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080062D0: .4byte .L080062D4
.L080062D4: @ jump table
	.4byte .L08006304 @ case 0
	.4byte .L08006304 @ case 1
	.4byte .L08006304 @ case 2
	.4byte .L08006300 @ case 3
	.4byte .L08006300 @ case 4
	.4byte .L08006300 @ case 5
	.4byte .L08006304 @ case 6
	.4byte .L08006304 @ case 7
	.4byte .L08006304 @ case 8
	.4byte .L08006310 @ case 9
	.4byte .L08006308 @ case 10
.L08006300:
	movs r5, #0
	b .L08006310
.L08006304:
	movs r5, #1
	b .L08006310
.L08006308:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
.L08006310:
	adds r0, r4, #0
	adds r1, r5, #0
	bl func_08006134
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080062B8

	THUMB_FUNC_START func_08006324
func_08006324: @ 0x08006324
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END func_08006324

	THUMB_FUNC_START func_0800632C
func_0800632C: @ 0x0800632C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt .L08006340
	adds r0, r4, #0
	bl func_080062B8
	b .L08006368
.L08006340:
	adds r0, r4, #0
	movs r1, #0
	bl func_08006134
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne .L08006358
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L08006358:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne .L08006368
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
.L08006368:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800632C

	THUMB_FUNC_START func_08006370
func_08006370: @ 0x08006370
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END func_08006370

	THUMB_FUNC_START func_08006378
func_08006378: @ 0x08006378
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bgt .L0800638C
	adds r0, r4, #0
	bl func_080062B8
	b .L080063B4
.L0800638C:
	adds r0, r4, #0
	movs r1, #1
	bl func_08006134
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne .L080063A4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
.L080063A4:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne .L080063B4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
.L080063B4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_08006378

	THUMB_FUNC_START func_080063BC
func_080063BC: @ 0x080063BC
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END func_080063BC

	THUMB_FUNC_START func_080063C4
func_080063C4: @ 0x080063C4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi .L08006420
	lsls r0, r0, #2
	ldr r1, .L080063DC  @ .L080063E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L080063DC: .4byte .L080063E0
.L080063E0: @ jump table
	.4byte .L08006410 @ case 0
	.4byte .L08006410 @ case 1
	.4byte .L08006410 @ case 2
	.4byte .L0800640C @ case 3
	.4byte .L0800640C @ case 4
	.4byte .L0800640C @ case 5
	.4byte .L08006410 @ case 6
	.4byte .L08006410 @ case 7
	.4byte .L08006410 @ case 8
	.4byte .L08006420 @ case 9
	.4byte .L08006414 @ case 10
.L0800640C:
	movs r5, #0
	b .L08006420
.L08006410:
	movs r5, #1
	b .L08006420
.L08006414:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
	strh r0, [r4, #0x32]
.L08006420:
	adds r1, r5, #0
	adds r1, #0x80
	adds r0, r4, #0
	bl func_08006134
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080063C4

	THUMB_FUNC_START SetFaceBlinkControl
SetFaceBlinkControl: @ 0x08006438
	push {r4, lr}
	adds r2, r0, #0
	cmp r1, #0
	bne .L08006444
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0, #0x18]
.L08006444:
	ldr r4, [r2, #0x48]
	strh r1, [r4, #0x30]
	adds r0, r4, #0
	bl FaceBlinkProc_GenBlinkInterval
	str r0, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetFaceBlinkControl

	THUMB_FUNC_START SetFaceBlinkControlById
SetFaceBlinkControlById: @ 0x08006458
	push {lr}
	ldr r2, .L0800646C  @ gFaces
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl SetFaceBlinkControl
	pop {r0}
	bx r0
	.align 2, 0
.L0800646C: .4byte gFaces

	THUMB_FUNC_END SetFaceBlinkControlById

	THUMB_FUNC_START FaceBlinkProc_GenBlinkInterval
FaceBlinkProc_GenBlinkInterval: @ 0x08006470
	push {r4, lr}
	adds r4, r0, #0
	bl RandNextB
	adds r1, r0, #0
	lsrs r2, r1, #0x10
	ldrh r1, [r4, #0x30]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	bhi .L080064C8
	lsls r0, r1, #2
	ldr r1, .L08006494  @ .L08006498
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
.L08006494: .4byte .L08006498
.L08006498: @ jump table
	.4byte .L080064B6 @ case 0
	.4byte .L080064BC @ case 1
	.4byte .L080064AC @ case 2
	.4byte .L080064C2 @ case 3
	.4byte .L080064C6 @ case 4
.L080064AC:
	asrs r0, r2, #7
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	b .L080064C8
.L080064B6:
	asrs r0, r2, #7
	adds r0, #0x1e
	b .L080064C8
.L080064BC:
	asrs r0, r2, #9
	adds r0, #0x1e
	b .L080064C8
.L080064C2:
	movs r0, #1
	b .L080064C8
.L080064C6:
	ldr r0, .L080064D0  @ 0x7FFFFFFF
.L080064C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
.L080064D0: .4byte 0x7FFFFFFF

	THUMB_FUNC_END FaceBlinkProc_GenBlinkInterval

	THUMB_FUNC_START func_080064D4
func_080064D4: @ 0x080064D4
	ldr r0, [r0, #0x48]
	strh r1, [r0, #0x32]
	bx lr

	THUMB_FUNC_END func_080064D4

	THUMB_FUNC_START func_080064DC
func_080064DC: @ 0x080064DC
	push {lr}
	ldr r2, .L080064F0  @ gFaces
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl func_080064D4
	pop {r0}
	bx r0
	.align 2, 0
.L080064F0: .4byte gFaces

	THUMB_FUNC_END func_080064DC

	THUMB_FUNC_START NewFace2
NewFace2: @ 0x080064F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r9, r1
	mov sl, r2
	str r3, [sp, #4]
	ldr r1, .L08006518  @ gFaces
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r6, [r4]
	cmp r6, #0
	beq .L0800651C
	movs r0, #0
	b .L08006602
	.align 2, 0
.L08006518: .4byte gFaces
.L0800651C:
	ldr r0, .L0800655C  @ gUnknown_0859118C
	movs r1, #5
	bl SpawnProc
	adds r5, r0, #0
	str r5, [r4]
	mov r0, r9
	bl GetFaceInfo
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x28]
	ands r0, r1
	cmp r0, #0
	beq .L0800656C
	str r6, [sp]
	ldr r0, .L08006560  @ gFaceConfig
	lsls r4, r7, #3
	adds r0, r4, r0
	ldrh r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, .L08006564  @ gPal+0x200
	adds r1, r1, r0
	ldr r2, .L08006568  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b .L08006582
	.align 2, 0
.L0800655C: .4byte gUnknown_0859118C
.L08006560: .4byte gFaceConfig
.L08006564: .4byte gPal+0x200
.L08006568: .4byte 0x01000008
.L0800656C:
	mov r2, r8
	ldr r0, [r2, #8]
	ldr r1, .L080065C8  @ gFaceConfig
	lsls r4, r7, #3
	adds r1, r4, r1
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
.L08006582:
	mov r0, r8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strb r7, [r0]
	mov r2, r9
	strh r2, [r5, #0x3e]
	adds r2, r5, #0
	adds r2, #0x41
	movs r0, #5
	strb r0, [r2]
	mov r0, sl
	strh r0, [r5, #0x34]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #0x36]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl FaceRefreshSprite
	movs r1, #0xf0
	lsls r1, r1, #2
	ldr r2, [sp, #0x28]
	ands r1, r2
	cmp r1, #0x80
	beq .L080065DA
	cmp r1, #0x80
	bgt .L080065CC
	cmp r1, #0x40
	beq .L080065D6
	b .L080065E6
	.align 2, 0
.L080065C8: .4byte gFaceConfig
.L080065CC:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq .L080065E0
	b .L080065E6
.L080065D6:
	movs r3, #0
	b .L080065EA
.L080065DA:
	movs r3, #0x80
	lsls r3, r3, #3
	b .L080065EA
.L080065E0:
	movs r3, #0xc0
	lsls r3, r3, #4
	b .L080065EA
.L080065E6:
	movs r3, #0x80
	lsls r3, r3, #4
.L080065EA:
	ldr r0, .L08006614  @ gFaceConfig
	adds r0, r4, r0
	ldr r1, [r0]
	lsrs r1, r1, #5
	ldrh r2, [r0, #4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r3
	strh r1, [r5, #0x3c]
	adds r0, r5, #0
.L08006602:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.L08006614: .4byte gFaceConfig

	THUMB_FUNC_END NewFace2

	THUMB_FUNC_START func_08006618
func_08006618: @ 0x08006618
	ldr r3, .L08006628  @ gFaces
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	strh r1, [r3, #0x34]
	ldr r0, [r0]
	strh r2, [r0, #0x36]
	bx lr
	.align 2, 0
.L08006628: .4byte gFaces

	THUMB_FUNC_END func_08006618

	THUMB_FUNC_START func_0800662C
func_0800662C: @ 0x0800662C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq .L0800663C
	bl func_08097D54
.L0800663C:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq .L08006648
	bl func_08097D54
.L08006648:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_0800662C

	THUMB_FUNC_START func_08006650
func_08006650: @ 0x08006650
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl GetFaceInfo
	str r0, [r4, #0x30]
	ldr r0, [r0]
	ldr r5, .L080066A0  @ gFaceConfig
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r2, .L080066A4  @ 0x06010000
	adds r1, r1, r2
	bl Decompress
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x34]
	strh r0, [r1, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080066A0: .4byte gFaceConfig
.L080066A4: .4byte 0x06010000

	THUMB_FUNC_END func_08006650

	THUMB_FUNC_START func_080066A8
func_080066A8: @ 0x080066A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq .L080066CC
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #0x18]
	strh r0, [r1, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	bl func_08097D68
.L080066CC:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq .L080066D8
	bl func_08097D68
.L080066D8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080066A8

	THUMB_FUNC_START func_080066E0
func_080066E0: @ 0x080066E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, .L080066F8  @ gUnknown_08591304
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
.L080066F8: .4byte gUnknown_08591304

	THUMB_FUNC_END func_080066E0

	THUMB_FUNC_START func_080066FC
func_080066FC: @ 0x080066FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetFaceInfo
	ldr r0, [r0]
	lsls r4, r4, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r4, r1
	adds r1, r4, #0
	bl Decompress
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END func_080066FC

	THUMB_FUNC_START func_0800671C
func_0800671C: @ 0x0800671C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetFaceInfo
	ldr r0, [r0, #8]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	
	THUMB_FUNC_END func_0800671C
