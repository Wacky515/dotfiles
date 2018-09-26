@echo off
rem Created:     2017/07/09 21:50:53
rem Last Change: 2018/09/19 15:16:58.

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Start get system sound setting

reg export "HKEY_CURRENT_USER\AppEvents\Schemes\Apps" ./sounds_setting_%COMPUTERNAME%.reg

rem pause
exit /b 0
