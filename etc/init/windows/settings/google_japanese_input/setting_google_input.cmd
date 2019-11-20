@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/11/19 17:30:39.

set batch_title=Setting Google Japanese input
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

set deb_dir=%userprofile%\AppData\LocalLow\Google\
set src_dir=%userprofile%\OneDrive\仕事\Settings\GoogleJapaneseInput\
set backup=%deb_dir%\old

rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%

echo ^>^> %batch_title%
echo ^>^> Time stamp: %tstmp%

rem 設定ファイルがある "Dir" に "cd"
pushd %src_dir%

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
if exist %deb_dir%\Google Japanese Input (
    move %deb_dir%\Google Japanese Input ^
        %backup%\Google Japanese Input_%tstmp%
    )

mkdir %deb_dir%\Google Japanese Input

rem シンボリックリンク 作成
rem echo ^>^> Make symbolic link *.db
for %%i in (*.db) do (
    mklink %deb_dir%\Google Japanese Input\%%i %src_dir%\%%i
)

endlocal
popd

rem pause
exit /b 0
