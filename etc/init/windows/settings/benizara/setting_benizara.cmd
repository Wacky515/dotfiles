@echo off
setlocal enabledelayedexpansion
rem Created:     2022/02/10 10:46:03
rem Last Change: 2023/02/17 15:30:59.

set batch_title=Setting Benizara

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

rem 紅皿の関連サービス 停止
echo ^>^> Kill Benizara
taskkill /f /im benizara* > nul 2>&1

rem 既存の *.ini、NICOLA配列_BS.bnz を削除
if exist %appdata%"\ayaki\benizara\benizara.ini" (
    del %appdata%"\ayaki\benizara\benizara.ini"
)
if exist %appdata%"\ayaki\benizara\NICOLA配列_sdc.bnz" (
    del %appdata%"\ayaki\benizara\NICOLA配列_sdc.bnz"
)

rem 実行ファイルと同一ディレクトリにシンボリックリンク 作成
mklink %appdata%"\ayaki\benizara\benizara.ini" ^
    %onedrive%"\仕事\Settings\Benizara\benizara.ini"
mklink %appdata%"\ayaki\benizara\NICOLA配列_sdc.bnz" ^
    %onedrive%"\仕事\Settings\Benizara\NICOLA配列_sdc.bnz"

rem 紅皿の関連サービス 開始
if exist %appdata%"\ayaki\benizara\benizara.exe" (
    start %appdata%"\ayaki\benizara\benizara.exe"
)
if exist %programfiles(x86)%"\ayaki\benizara\benizara.exe" (
    pushd %programfiles(x86)%"\ayaki\benizara"
    start benizara.exe
)

endlocal
popd

rem pause
exit /b 0
