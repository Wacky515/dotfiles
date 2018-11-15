@echo off
setlocal
rem Created:     __DATE__
rem Last Change: 2018/11/15 13:44:57.

rem set batch_title="***"
rem title %batch_title%

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd /d %bat_path%

rem echo ^>^> %batch_title%
echo ^>^> Start

__START__

popd
endlocal

rem pause
exit /b 0

