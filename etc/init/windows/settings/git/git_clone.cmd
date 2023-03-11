@echo off
setlocal enabledelayedexpansion
rem Created:     20**/**/** **:**:**
rem Last Change: 2023/03/04 16:23:28.

set batch_title=Setting for Folder options

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

git clone --depth 1 https://github.com/Wacky515/dotfiles.git

endlocal
popd

rem pause
exit /b 0

