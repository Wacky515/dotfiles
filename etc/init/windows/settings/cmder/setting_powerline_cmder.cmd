@echo off
setlocal enabledelayedexpansion
rem Created:     2018/04/19 09:01:59
rem Last Change: 2024/12/25 10:40:05.

set batch_title=Setting cmder's powerline
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set cmder_root=C:\tools\cmder\

pushd %OneDrive%\仕事\Settings\Cmder
if %errorlevel% equ 1 (
    echo ^>^> SETTING FOLDER NOT FOUND
    goto end
)

if not exist %cmder_root%\config\ (
    echo ^>^> NOT EXIST %cmder_root%
    goto :end
) else (
    echo ^>^> Start setting cmder-powerline-prompt
    copy /y *.lua   %cmder_root%\config\
)

:end
endlocal
popd

:pause
exit /b 0
