@echo off
setlocal enabledelayedexpansion
rem Created:     2022/03/05 13:18:34
rem Last Change: 2025/11/15 09:40:17.

set batch_title=Delay startup autohotkey

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
timeout 20 >nul

start "" "%userprofile%\dotfiles\etc\init\windows\settings\autohotkey\autohotkey.ahk"

:end

endlocal
popd

rem pause
exit /b 0
