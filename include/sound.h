
#pragma once

#include "global.h"

#include "proc.h"

#include "m4a.h"

int GetCurrentBgmSong(void);
bool IsBgmPlaying(void);
void Sound_SetVolume8002274(int volume);
void SetBgmVolume(int volume);
void FadeBgmOut(int speed);
// ??? Sound_FadeOut800237C(???);
// ??? SoundStuff_80023E0(???);
void StartBgmCore(int songId, struct MusicPlayerInfo* mpi);
void StartOrChangeBgm(int songId, int speed, struct MusicPlayerInfo* mpi);
void StartBgm(int songId, struct MusicPlayerInfo* mpi);
void StartBgmExt(int songId, int speed, struct MusicPlayerInfo* mpi);
// ??? func_080024F0(???);
void StartBgmFadeIn(int songId, int b, struct MusicPlayerInfo* mpi);
void OverrideBgm(int songId);
void RestoreBgm(void);
// ??? func_080026BC(???);
void MakeBgmOverridePersist(void);
void StartBgmVolumeChange(int volumeInit, int volumeEnd, int duration, ProcPtr parent);
// ??? func_08002788(???);
// ??? DelaySong_OnLoop(???);
void PlaySongDelayed(int songId, int delay, struct MusicPlayerInfo *player);
void PlaySongCore(int songId, struct MusicPlayerInfo *player);
void Sound_SetDefaultMaxNumChannels(void);
void Sound_SetMaxNumChannels(int maxchn);
void func_080028FC(int songId);
// ??? IsMusicProc2Running(???);
// ??? func_0800296C(???);
// ??? func_080029BC(???);
// ??? func_080029E8(???);
// ??? func_08002A6C(???);
// ??? func_08002A88(???);
void CancelDelaySong(void);
// ??? func_08002AC8(???);

#define PlaySe(id) \
    if (!gPlaySt.configSeDisable) \
        m4aSongNumStart((id))
