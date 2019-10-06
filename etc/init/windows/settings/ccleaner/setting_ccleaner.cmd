@echo off
setlocal
rem Created:     2018/01/01 00:00:00
rem Last Change: 2019/10/01 14:44:18.

set batch_title=Setting CCleaner
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

set inidir="C:\Program Files\CCleaner\"
set inifile=%inidir%\ccleaner.ini
set backup=%inidir%\old\%tstmp%
set srcdir=%homepath%\OneDrive\仕事\Settings\CCleaner

rem 設定ファイルがある "Dir" に "cd"
pushd %srcdir%

rem "CCleaner" 停止
echo ^>^> Kill CCleaner
taskkill /f /im CCleaner.exe > nul 2>&1

rem バックアップ 作成
if exist %inifile% (
    goto bkup
) else (
    goto mklink
)

:bkup
echo ^>^> Backup old *.ini
mkdir %backup%
move %inifile% %backup%

rem シンボリックリンク 作成
:mklink
rem echo ^>^> Copy *.ini
rem copy "ccleaner.ini" %inifile%
if exist %inifile% (
    del /q %inifile%
)

echo ^>^> Make symbolic link *.ini
mklink %inifile% %srcdir%"\ccleaner.ini"
rem copy "ccleaner.ini" %inifile%

endlocal
popd

rem pause
exit /b 0
