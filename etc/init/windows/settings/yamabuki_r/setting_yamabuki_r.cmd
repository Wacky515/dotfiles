@echo off

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo "Setting Yamabuki R"

rem 設定ファイル コピー
rem copy /y "Cust_NICOLA.yab" %HOMEPATH%"\yamabuki_r1.11.1"
rem copy /y "yamabuki_r.ypr" %HOMEPATH%"\yamabuki_r1.11.1"

copy /y "Cust_NICOLA.yab" %HOMEPATH%"\yamabuki_r1.11.1w"
copy /y "yamabuki_r.ypr" %HOMEPATH%"\yamabuki_r1.11.1ws"

rem スタートアップにショートカット 作成(Windows7/10で当該Dir異なるはずやけど同じやがな・・・)
ver | find "Version 6.1." > nul
if not errorlevel 1 goto win_7

ver | find "Version 10.0." > nul
if not errorlevel 1 goto win_10

:win_7
echo "This PC is Windows7"
copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto end

:win_10
copy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto end

:end
pause