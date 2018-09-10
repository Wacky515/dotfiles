@echo off
rem Created:     2018/01/01 00:00:00
rem Last Change: 2018/09/10 15:04:37.

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo ^>^> Setting CCleaner

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

if exist %inifile% (
    goto bkup
) else (
    goto cpini
)

:bkup
echo ^>^> Backup old *.ini
rem FIXME: Syntax error
rem ren %inifile% ccleaner%tstmp%.ini
move %inifile% %backup%

:cpini
echo ^>^> Copy *.ini
copy "ccleaner.ini" %inifile%

pause
exit /b 0
