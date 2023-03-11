@echo off
setlocal enabledelayedexpansion
rem Created:     2020/04/15 12:28:24
rem Last Change: 2021/06/29 11:14:02.

set batch_title=Check disk error
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0

rem スクリプトがある "Dir" に "cd"
pushd %bat_path%

chkdsk c: /r
rem "chkdsk": チェックディスクの実行コマンド
rem "c:":     Cドライブをチェック
rem "/r":     完全にチェック

:end
endlocal
popd

pause
exit /b 0
