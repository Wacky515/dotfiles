@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2020/11/02 00:01:40.

set batch_title=Setting Pacman

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

set time_zero_suppress=%time: =0%
set hh=%time_zero_suppress:~0,2%
set mn=%time_zero_suppress:~3,2%
set ss=%time_zero_suppress:~6,2%

set maketime=%yyyy%-%mm%-%dd%_%hh%-%mn%-%ss%

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

rem TODO: Install Pacman

rem :setting_pacman
echo ^>^> %batch_title%
rem echo ^>^> Start

if exist C:\tools\msys64\etc\pacman.conf (
    echo ^>^> Backup pacman.conf
    rename C:\tools\msys64\etc\pacman.conf pacman.conf_%maketime%.bak
)

echo ^>^> Make link pacman.conf
mklink C:\tools\msys64\etc\pacman.conf %userprofile%\dotfiles\etc\init\windows\settings\msys2\pacman.conf

call C:\tools\msys64\msys2_shell.cmd ^
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
