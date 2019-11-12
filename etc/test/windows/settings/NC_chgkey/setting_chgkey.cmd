@echo off
setlocal
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/12/04 09:23:20.

set batch_title=Setting CCleaner
title %batch_title%

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

rem ---------------------------------------------------------------------------
rem ここから追記して動作未確認
rem ---------------------------------------------------------------------------

rem 設定ファイルがある "Dir" に "cd"
pushd %OneDrive%

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

set inidir="C:\Program Files\CCleaner\"
set inifile="C:\Program Files\CCleaner\ccleaner.ini"
set backup=%inidir%"\old\"%tstmp%

rem "CCleaner" 停止
echo ^>^> Kill CCleaner
taskkill /f /im CCleaner.exe

rem バックアップ 作成
if exist %inifile% (
    goto bkup
) else (
    goto mklink
)

:bkup
echo ^>^> Backup old *.ini
rem FIXME: Syntax error
rem ren %inifile% ccleaner%tstmp%.ini
move %inifile% %backup%

rem シンボリックリンク 作成
:mklink

rem ---------------------------------------------------------------------------
rem ここから追記して動作未確認
rem ---------------------------------------------------------------------------

rem echo ^>^> Copy *.ini
rem copy "ccleaner.ini" %inifile%
echo ^>^> Make symbolic link *.ini
mklink %inifile% "ccleaner.ini"

rem ---------------------------------------------------------------------------
rem ここまで追記して動作未確認
rem ---------------------------------------------------------------------------

endlocal
popd

pause
exit /b 0

