@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/10/01 14:52:09.

set batch_title=Setting Google Japanese input
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

rem 日付取得
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem 時刻取得
set time=%time: =0%
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%-%mm%-%dd%_%hh%-%mi%-%ss%
echo ^>^> Time stamp: %tstmp%

set dbdir=C:%homepath%\AppData\LocalLow\Google\

set backup=%dbdir%\old
set srcdir=%homepath%\OneDrive\仕事\settings\GoogleJapaneseInput\

rem 設定ファイルがある "Dir" に "cd"
pushd %srcdir%

rem "Google日本語入力の関連サービス" 停止
echo ^>^> Kill Google Japanese input
taskkill /f /im GoogleIMEJa* > nul 2>&1

rem バックアップ 作成
if exist %backup% (
    goto bkup
) else (
    goto mkbakdir
)

:mkbakdir
mkdir %backup%

:bkup
if exist %dbdir%"\Google Japanese Input" (
    move %dbdir%"\Google Japanese Input" ^
        %backup%"\Google Japanese Input_"%tstmp%
    )

mkdir %dbdir%"\Google Japanese Input"

rem シンボリックリンク 作成
rem echo ^>^> Make symbolic link *.db
for %%i in (*.db) do (
    mklink %dbdir%"\Google Japanese Input\"%%i %srcdir%"\"%%i
)

endlocal
popd

rem pause
exit /b 0
