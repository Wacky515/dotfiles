@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/15 12:28:51.

tltle Setting Cmder here
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
pushd "C:\tools\cmder"
.\cmder.exe /REGISTER ALL

endlocal
popd

rem pause
exit /b 0

