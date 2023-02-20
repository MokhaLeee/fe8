#pragma once

#include "global.h"
#include "proc.h"

int GetTextPrintDelay(void);
int IsFirstPlaythrough(void);
void InitPlayConfig(int isDifficult, i8 arg_1);
void ResetBmSt(void);
void StartChapter(ProcPtr parent);
void RestartBattleMap(void);
void ResumeChapterFromSuspend(ProcPtr parent);
void RefreshBMapDisplay_FromBattle(void);
void BMapDispResume_FromBattleDelayed(void);
void InitBmDisplay(void);
ProcPtr StartMapMain(ProcPtr parent);
void EndMapMain(void);
void CleanupUnitsBeforeChapter(void);
void DeclareCompletedChapter(void);
void DeclareCompletedPlaythrough(void);
char const* GetTacticianName(void);
void SetTacticianName(char const* new_name);
