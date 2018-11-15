@echo off
setlocal
rem Created:     2017/07/09 21:50:53
rem Last Change: 2018/11/15 13:56:49.

set batch_title="Get system sound setting"
title %batch_title""

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd /d %bat_path%

echo ^>^> %batch_title%

reg export "HKEY_CURRENT_USER\AppEvents\Schemes\Apps" ./sounds_setting_%COMPUTERNAME%.reg

endlocal
popd

rem pause
exit /b 0

