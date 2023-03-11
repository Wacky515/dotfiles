@echo off
setlocal enabledelayedexpansion
rem Created:     2018/07/17 10:19:01
rem Last Change: 2020/11/01 10:21:13.

set batch_title=Setting GENE dictionary
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
echo ^>^> %batch_title%

rem rem スクリプトがある "Dir" に "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%
pushd %userprofile%\OneDrive\仕事\Settings\KaoriyaVim\
if %errorlevel% equ 1 (
    echo ^>^> SETTING FOLDER NOT FOUND
    goto end
)

if not exist %userprofile%\vimfiles\dict\ (
    mkdir %userprofile%\vimfiles\dict\
    copy .\GENE.TXT %userprofile%\vimfiles\dict\
)

:end
endlocal
popd

rem pause
exit /b 0
