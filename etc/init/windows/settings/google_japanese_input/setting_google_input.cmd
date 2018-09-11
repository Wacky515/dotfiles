@echo off
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/09/11 11:58:42.

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
cd /d %bat_path%

rem ---------------------------------------------------------------------------
rem ��������ǋL���ē��얢�m�F
rem ---------------------------------------------------------------------------

rem �ݒ�t�@�C�������� "Dir" �� "cd"
cd %OneDrive%

rem ---------------------------------------------------------------------------
rem �����܂ŒǋL���ē��얢�m�F
rem ---------------------------------------------------------------------------
echo ^>^> Setting Google Japanese input

rem ���t�擾
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem �����擾
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%-%mm%-%dd%_%hh%-%mi%-%ss%
echo ^>^> Time stamp: %tstmp%

rem "Google���{����͂̊֘A�T�[�r�X" ��~
echo ^>^> Kill Google Japanese input
taskkill /f /im GoogleIMEJa*

rem �o�b�N�A�b�v �쐬
set gglin_path="C:"%HOMEPATH%"\AppData\LocalLow\Google"
set backup=%gglin_path%"\old"

if not exist %backup% (
    goto mkbakdir
) else (
    goto backup
)

:mkbakdir
mkdir %backup%

:backup
if exist %gglin_path%"\Google Japanese Input" (
    move %gglin_path%"\Google Japanese Input" ^
        %backup%"\Google Japanese Input_"%tstmp%
    )

mkdir %gglin_path%"\Google Japanese Input"

rem �V���{���b�N�����N �쐬
for %%i in (*.db) do (
    mklink %gglin_path%"\Google Japanese Input\"%%i "%bat_path%\%%i"
)

pause
exit /b 0
