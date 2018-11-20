@echo off
setlocal
rem Created:     2018/09/24 13:05:56
rem Last Change: 2018/11/17 09:48:24.

set batch_title="Setting Jabber"
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

rem 設定ファイルがある "Dir" に "cd"
pushd %OneDrive%"\仕事\settings\Jabber"

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

endlocal
popd

pause
exit /b 0

