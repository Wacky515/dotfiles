@echo off
setlocal
rem Created:     2019/10/28 09:49:26
rem Last Change: 2019/10/28 09:53:25.

set batch_title=Setting auto IME off
title %batch_title%

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

echo ^>^> %batch_title%

rem スタートアップにショートカット 作成
copy .\vim_auto_ime_off.ahk %userprofile%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

endlocal
popd

rem pause
exit /b 0
