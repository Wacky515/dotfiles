@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2020/04/16 15:51:53.

set batch_title=Setting Pacman

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%

rem TODO: Install Pacman

rem :setting_pacman
echo ^>^> %batch_title%
rem echo ^>^> Start

if exist C:\tools\msys64\etc\pacman.conf (
    echo ^>^> Backup pacman.conf
    rename C:\tools\msys64\etc\pacman.conf pacman.conf.bak
)

echo ^>^> Make link pacman.conf
mklink C:\tools\msys64\etc\pacman.conf .\pacman.conf

call msys2_shell.cmd ^
     -no-start ^
     -defterm ^
     -mingw64 ^
     -here ^
     %userprofile%\dotfiles\etc\init\windows\settings\msys2\EXE_FM_CMD_install_init_apps.sh
call %userprofile%\dotfiles\etc\init\windows\settings\msys2\fish\AFTER_INS_FISH_setting_fish.cmd

endlocal
popd

rem pause
exit /b 0
