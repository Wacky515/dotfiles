@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2018/11/29 11:59:44.

title Change prompt

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

copy ".\clink.lua" "C:\tools\cmder\vendor\clink.lua"

endlocal
popd

rem pause
exit /b 0

