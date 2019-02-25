@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/01/18 11:22:22.

set batch_title=Setting Pacman
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  �X�N���v�g������ "Dir" �� "cd"
pushd %~dp0

rem �s�v
rem rem TODO: "Pacman" ���݊m�F����
rem pacman -Sl | grep 'pacman ' >> nul
rem if %errorlevel% equ 0 goto setting_pacman

rem TODO: install Pacman

rem :setting_pacman
echo ^>^> %batch_title%
echo ^>^> Start set link

if exist "C:\tools\msys64\etc\pacman.conf" (
        echo ^>^> Backup default file
        rename "C:\tools\msys64\etc\pacman.conf" "pacman.conf.bak"
        )

mklink "C:\tools\msys64\etc\pacman.conf" %~dp0%"pacman.conf"

endlocal
popd

pause
exit /b 0

