@echo off
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/09/11 11:58:42.

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

rem ---------------------------------------------------------------------------
rem ここから追記して動作未確認
rem ---------------------------------------------------------------------------

rem 設定ファイルがある "Dir" に "cd"
cd %OneDrive%

rem ---------------------------------------------------------------------------
rem ここまで追記して動作未確認
rem ---------------------------------------------------------------------------
echo ^>^> Setting Google Japanese input

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
    mklink %gglin_path%"\Google Japanese Input\"%%i "%bat_path%\%%i"
)

pause
exit /b 0
