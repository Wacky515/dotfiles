@echo off
setlocal
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/11/15 12:43:43.

set batch_title="Setting Google Japanese input"
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
pushd /d %bat_path%

rem ---------------------------------------------------------------------------
rem ここから追記して動作未確認
rem ---------------------------------------------------------------------------

rem 設定ファイルがある "Dir" に "cd"
pushd %OneDrive%"/仕事/settings/GoogleJapaneseInput"

rem ---------------------------------------------------------------------------
rem ここまで追記して動作未確認
rem ---------------------------------------------------------------------------
echo ^>^> %batch_title%

rem 日付取得
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem 時刻取得
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%-%mm%-%dd%_%hh%-%mi%-%ss%
echo ^>^> Time stamp: %tstmp%

rem "Google日本語入力の関連サービス" 停止
echo ^>^> Kill Google Japanese input
taskkill /f /im GoogleIMEJa*

rem バックアップ 作成
set gglin_path="C:"%HOMEPATH%"\AppData\LocalLow\Google"
set backup=%gglin_path%"\old"

if not exist %backup% (
    goto mkbakdir
) else (
    goto backup
)

:mkbakdir
mkdir %backup%

:backup
if exist %gglin_path%"\Google Japanese Input" (
    move %gglin_path%"\Google Japanese Input" ^
        %backup%"\Google Japanese Input_"%tstmp%
    )

mkdir %gglin_path%"\Google Japanese Input"

rem シンボリックリンク 作成
for %%i in (*.db) do (
    rem mklink %gglin_path%"\Google Japanese Input\"%%i "%bat_path%\%%i"
    mklink %gglin_path%"\Google Japanese Input\"%%i "%%i"
)

endlocal
popd

pause
exit /b 0

