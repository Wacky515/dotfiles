@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2024/12/25 10:40:05.

set batch_title=Setting NeoVim's dein

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

pip3 --version > nul 2>&1
if errorlevel 1 (
    echo ^>^> Install pip3 first
    call %OneDrive%\仕事\Settings\Python3\install_python.cmd
    if errorlevel 1 goto end
)

pip3 install neovim

:end
endlocal
popd

rem pause
exit /b 0
