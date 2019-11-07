@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/11/07 10:02:12.

set batch_title=Setting Pacman
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem  スクリプトがある "Dir" に "cd"
pushd %~dp0

rem TODO: Install Pacman

rem :setting_pacman
echo ^>^> Start %batch_title%

if exist C:\tools\msys64\etc\pacman.conf (
    echo ^>^> Backup default file
    rename C:\tools\msys64\etc\pacman.conf pacman.conf.bak
)

mklink C:\tools\msys64\etc\pacman.conf .\pacman.conf

call msys2_shell.cmd ^
    -no-start ^
    -defterm ^
    -mingw64 ^
    -here ^
    %homepath%\dotfiles\etc\init\windows\settings\msys2\install_init_apps.sh
call %homepath%\dotfiles\etc\init\windows\settings\msys2\fish\AFTER_INS_FISH_setting_fish.cmd

rem rem TODO: Install check
rem curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

endlocal
popd

rem pause
exit /b 0
