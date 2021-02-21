@echo off
setlocal enabledelayedexpansion
rem Created:     __DATE__
rem Last Change: 2019/11/29 16:34:01.

rem set batch_title=__START__
rem title %batch_title%

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

rem echo ^>^> %batch_title%
echo ^>^> Start


popd
endlocal

rem pause
exit /b 0
