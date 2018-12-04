@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/12/04 16:19:27.

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

echo ^>^> %batch_title%
echo ^>^> Start set link

mklink "C:\tools\msys64\etc" "\.pacman.conf"

endlocal
popd

rem pause
exit /b 0

