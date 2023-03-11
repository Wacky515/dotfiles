@echo off
setlocal enabledelayedexpansion
rem Created:     2022/02/10 09:59:16
rem Last Change: 2022/02/10 10:30:02.

set batch_title=Setting ChgKey

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

rem 実行ファイルと同一ディレクトリにシンボリックリンク 作成
mklink %userprofile%"\ChgKey15\chgkey.ini" %bat_path%"\chgkey.ini"

endlocal
popd

rem pause
exit /b 0
