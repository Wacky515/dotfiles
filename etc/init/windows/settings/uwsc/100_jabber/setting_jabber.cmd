@echo off
rem Created:     2018/09/24 13:05:56
rem Last Change: 2018/09/24 13:32:57.

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%


rem 設定ファイルがある "Dir" に "cd"
cd %OneDrive%"\仕事\settings\Jabber"

echo ^>^> Setting Jabber

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

rem "Jabber" 停止
echo ^>^> Kill Jabber
taskkill /f /im CiscoJabber.exe

rem バックアップ 作成
set jbr_path="C:"%HOMEPATH%"\AppData\Roaming\Cisco\Unified Communications\Jabber\CSF\Config"
set backup=%jbr_path%"\old"

if not exist %backup% (
    goto mkbakdir
) else (
    goto backup
)

:mkbakdir
mkdir %backup%

:backup
if exist %jbr_path%"\jabberLocalConfig.xml" (
    move %jbr_path%"\jabberLocalConfig.xml" ^
        %backup%"\jabber_"%tstmp%
    )

rem mkdir %jbr_path%"\Jabber"

rem シンボリックリンク 作成
mklink %jbr_path%"\jabberLocalConfig.xml" "jabberLocalConfig.xml"

pause
exit /b 0
