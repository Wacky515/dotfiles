@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/29 12:10:27.

set batch_title="Setting for Folder options"
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
git clone https://github.com/Wacky515/dotfiles.git

endlocal
popd

rem pause
exit /b 0

