@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/10/03 10:28:53.

title Setting Cmder here
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