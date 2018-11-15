@echo off
setlocal
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/11/15 12:43:43.

set batch_title="Setting Google Japanese input"
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd /d %bat_path%

rem ---------------------------------------------------------------------------
rem ��������ǋL���ē��얢�m�F
rem ---------------------------------------------------------------------------

rem �ݒ�t�@�C�������� "Dir" �� "cd"
pushd %OneDrive%"/�d��/settings/GoogleJapaneseInput"

rem ---------------------------------------------------------------------------
rem �����܂ŒǋL���ē��얢�m�F
rem ---------------------------------------------------------------------------
echo ^>^> %batch_title%

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
    rem mklink %gglin_path%"\Google Japanese Input\"%%i "%bat_path%\%%i"
    mklink %gglin_path%"\Google Japanese Input\"%%i "%%i"
)

endlocal
popd

pause
exit /b 0

