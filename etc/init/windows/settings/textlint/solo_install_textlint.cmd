@echo off
setlocal
rem Created:     2018/11/22 17:07:29
rem Last Change: 2018/11/22 18:11:46.

set batch_title="Install textlint"
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
call sub_textline.cmd

endlocal
popd

rem pause
exit /b 0

