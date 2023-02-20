#pragma once

#include "global.h"

void SetSramFastFunc(void);
void WriteSramFast(u8 const* src, u8 *dest, u32 size);
extern void(*ReadSramFast)(u8 const* src, u8* dest, u32 size);
extern u32(*VerifySramFast)(u8 const* src, u8* dest, u32 size);
u32 WriteAndVerifySramFast(u8 const* src, u8 *dest, u32 size);
