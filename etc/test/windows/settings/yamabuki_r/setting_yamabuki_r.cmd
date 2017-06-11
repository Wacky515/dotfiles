@echo off

rem "setting_yamabuki_r.cmd" がある "Dir" に "cd"
set bat_path=%~dp0
cd /d %bat_path%

echo "Setting Yamabuki R"

rem 設定ファイル コピー
xcopy /y "Cust_NICOLA.yab" %HOMEPATH%"\yamabuki_r1.11.1"
xcopy /y "yamabuki_r.ypr" %HOMEPATH%"\yamabuki_r1.11.1"

rem スタートアップにショートカット 作成
xcopy "yamabuki_r.lnk" %HOMEPATH%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

pause