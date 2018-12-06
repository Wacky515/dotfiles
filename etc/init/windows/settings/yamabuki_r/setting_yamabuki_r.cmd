@echo off
setlocal
rem Created:     2017/01/18 00:00:00
rem Last Change: 2018/12/05 09:27:44.

set batch_title=Setting Yamabuki R
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

rem 設定ファイル コピー
copy /y "yamabuki_r.ypr" %HOMEPATH%"\yamabuki_r1.11.1.w"

rem スタートアップにショートカット 作成
    rem Windows7/10で当該Dir異なるはずやけど同じやがな・・・
ver | find "Version 6.1." > nul
if not errorlevel 1 goto win7

ver | find "Version 10.0." > nul
if not errorlevel 1 goto win10

:win7
echo ^>^> "This PC is Windows7"
copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
rem FIXME: ↑ と重複してるけど動作する、意味不明
if errorlevel 1 copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto eof

:win10
echo ^>^> "This PC is Windows10"
copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
rem FIXME: ↑ と重複してるけど動作する、意味不明
if errorlevel 1 copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto eof

:eof

endlocal
popd

rem pause
exit /b 0

