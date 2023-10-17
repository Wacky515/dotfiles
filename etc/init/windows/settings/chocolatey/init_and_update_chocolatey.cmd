@echo off
setlocal enabledelayedexpansion
rem Created:     2017/02/17 00:54:41
rem Last Change: 2023/10/18 07:25:37.

set batch_title=Update Chocolatey
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
set dot_path=%userprofile%\dotfiles\
set cho_path=%dot_path%\etc\init\windows\settings\chocolatey\
set odr_path=%onedrive%\仕事\Settings\Chocolatey\

set config_files=packages_%computername%.config

rem rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%

echo ^>^> %batch_title%

rem "dotfiles" に "cd"
if not exist %dot_path% (
    echo ^>^> CLONE DOTFILES FIRST, ABORT THIS SCRIPT!
    goto end
) else (
    pushd %dot_path%
)

rem "Chocolatey" インストール済みかチェック
choco -v > nul 2>&1
if %errorlevel% equ 0 goto update

echo ^>^> Install Chocolatey
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

echo ^>^> Already installed Chocolatey

:update
echo ^>^> Update software condition
if not exist %cho_path% (
    rem TODO: 自動で "git clone" する
    echo ^>^> CLONE CHOCOLATEY DIRECTORY FIRST, ABORT THIS SCRIPT!
    goto end
)
pushd %odr_path%
rem pushd %cho_path%

rem "***_packages_***.config" を読込み、インストール
if exist %config_files% (
    echo ^>^> Setting for this PC
    for %%i in (%config_files%) do (
        choco install -y - no-progress %%i
    )
) else (
    pushd %cho_path%
    choco install -y - no-progress packages.config
)

choco update all -y

rem デスクトップショートカット 作成
pushd %odr_path%
if not exist %userprofile%\Desktop\init_and_update_chocolatey.lnk (
    goto cplnk
) else (
    echo ^>^> Already set desktop shortcut
    goto end
)

:cplnk
echo ^>^> Set desktop shortcut
copy init_and_update_chocolatey.lnk %userprofile%\Desktop\

:end
endlocal
popd

rem pause
exit /b 0
