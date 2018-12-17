@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/12/17 16:18:05.
title Output Chocolatey list

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
clist -l

endlocal
popd

rem pause
exit /b 0

