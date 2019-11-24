@echo off
setlocal enabledelayedexpansion
rem Created:     2018/01/01 00:00:00
rem Last Change: 2019/11/19 16:57:13.

set batch_title=Setting CCleaner
title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0

rem ���t�擾
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem �����擾
set time=%time: =0%
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%-%mm%-%dd%_%hh%-%mi%-%ss%

set inidir="C:\Program Files\CCleaner\"
set inifile=%inidir%\ccleaner.ini
set backup=%inidir%\old\%tstmp%
set srcdir=%Unrestricted%\OneDrive\�d��\Settings\CCleaner

rem �X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%

echo ^>^> %batch_title%
echo ^>^> Time stamp: %tstmp%

rem �ݒ�t�@�C�������� "Dir" �� "cd"
pushd %srcdir%

rem "CCleaner" ��~
echo ^>^> Kill CCleaner
taskkill /f /im CCleaner.exe > nul 2>&1

rem �o�b�N�A�b�v �쐬
if exist %inifile% (
    goto bkup
) else (
    goto mklink
)

:bkup
echo ^>^> Backup old *.ini
mkdir %backup%
move %inifile% %backup%

:mklink
rem �V���{���b�N�����N �쐬
if exist %inifile% (
    del /q %inifile%
)

echo ^>^> Make symbolic link *.ini
mklink %inifile% %srcdir%"\ccleaner.ini"

endlocal
popd

rem pause
exit /b 0
