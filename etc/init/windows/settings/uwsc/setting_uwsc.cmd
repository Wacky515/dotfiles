@echo off
setlocal enabledelayedexpansion
rem Created:     2018/**/** **:**:**
rem Last Change: 2020/11/01 10:23:20.

set batch_title=Setting UWSC

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

echo ^>^> %batch_title%

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%
if %errorlevel% equ 1 (
    echo ^>^> SETTING FOLDER NOT FOUND
    goto end
)

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
echo ^>^> Time stamp: %tstmp%

set bat_path=%~dp0
set inidir=%userprofile%\AppData\Roaming\UWSC
set inifile=%inidir%\UWSC.INI
set backup=%inidir%\old\%tstmp%
set srcdir=%bat_path%

rem rem �X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%

rem "UWSC" ��~
echo ^>^> Kill UWSC
taskkill /f /im UWSC.exe > nul 2>&1

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

rem �V���{���b�N�����N �쐬
:mklink
if exist %inifile% (
	del /q %inifile%
	)

echo ^>^> Make symbolic link *.ini
mklink %inifile% %srcdir%\UWSC.INI

:end
endlocal
popd

rem pause
exit /b 0
