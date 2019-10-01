@echo off
setlocal
rem Created:     2018/01/01 00:00:00
rem Last Change: 2019/10/01 14:46:56.

set batch_title=Setting Everything
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

set inidir=C:%homepath%\AppData\Roaming\Everything\
set backup=%inidir%\old\%tstmp%

set srcdir=%homepath%\OneDrive\仕事\Settings\Everything\

rem 設定ファイルがある "Dir" に "cd"
pushd %srcdir%

rem "Everything" 停止
echo ^>^> Kill Everything
taskkill /f /im Everything.exe > nul 2>&1

rem バックアップ 作成
mkdir %backup%

rem :backup
if exist %inidir% (
    move %inidir%\* %backup%
    )

rem シンボリックリンク 作成
echo ^>^> Make symbolic link *.ini
for %%i in (*.ini) do (
    mklink %inidir%\%%i %srcdir%\%%i
)

rem デスクトップショートカット 作成
if not exist %userprofile%\Desktop\Everything.lnk (
    goto cplnk
) else (
    echo ^>^> Already set desktop shortcut
    goto end
)

:cplnk
echo ^>^> Make shortcut in Desktop

if exist C:\Program Files (x86)\Everything\Everything.exe goto evex64
if exist C:\Program Files\Everything\Everything.exe (
    goto eve
) else (
    goto end
)

:evex64
copy .\x86_shortcut\Everything.lnk %userprofile%\Desktop\
goto end

:eve
copy .\shortcut\Everything.lnk %userprofile%\Desktop\
goto end

:end

endlocal
popd

rem pause
exit /b 0
