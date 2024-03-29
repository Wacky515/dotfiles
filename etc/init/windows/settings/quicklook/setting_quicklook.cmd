@echo off
setlocal enabledelayedexpansion
rem Created:     2022/01/31 20:24:47
rem Last Change: 2022/02/10 14:26:56.

set batch_title=Setting QickLook

title %batch_title%

rem 管理者権限で起動されたかチェック
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
rem echo ^>^> Start

rem スタートアップにシンボリックリンク 作成
mklink %appdata%"\Microsoft\Windows\Start Menu\Programs\Startup\QuickLook.exe" ^
    %localappdata%"\Programs\QuickLook\QuickLook.exe"

endlocal
popd

rem pause
exit /b 0
