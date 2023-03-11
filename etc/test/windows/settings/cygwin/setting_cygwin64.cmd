@echo off
setlocal
rem Created:     2019/10/08 14:38:30
rem Last Change: 2019/10/08 14:40:37.

set batch_title=Setting Cygwin64
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

rem :setting_pacman
echo ^>^> Start %batch_title%

cd C:\cygwin64\bin\
bash --login -i -c "./setting_cygwin.sh"

endlocal
popd

rem pause
exit /b 0
