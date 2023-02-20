    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START ClearOam_thm
ClearOam_thm: @ 0x080D7498
	bx pc
	nop
	.ARM
	b ClearOam

	THUMB_FUNC_END ClearOam_thm

	THUMB_FUNC_START TmApplyTsa_thm
TmApplyTsa_thm: @ 0x080D74A0
	bx pc
	nop
	.ARM
	b TmApplyTsa

	THUMB_FUNC_END TmApplyTsa_thm

	THUMB_FUNC_START TmFillRect_thm
TmFillRect_thm: @ 0x080D74A8
	bx pc
	nop
	.ARM
	b TmFillRect

	THUMB_FUNC_END TmFillRect_thm

	THUMB_FUNC_START func_08000234_thm
func_08000234_thm: @ 0x080D74B0
	bx pc
	nop
	.ARM
	b func_08000234

	THUMB_FUNC_END func_08000234_thm

	THUMB_FUNC_START TmCopyRect_thm
TmCopyRect_thm: @ 0x080D74B8
	bx pc
	nop
	.ARM
	b TmCopyRect

	THUMB_FUNC_END TmCopyRect_thm

	THUMB_FUNC_START GetChecksum32_thm
GetChecksum32_thm: @ 0x080D74C0
	bx pc
	nop
	.ARM
	b GetChecksum32

	THUMB_FUNC_END GetChecksum32_thm

	.align 2, 0
