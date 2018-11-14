@echo off
rem Created:     2018/04/19 09:01:59
rem Last Change: 2018/11/14 12:20:22.

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Start setting cmder-powerline-prompt
cp powerline_prompt.lua %CMDER_ROOT%/config

rem pause
exit /b 0

