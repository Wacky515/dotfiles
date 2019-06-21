@echo off
setlocal
rem Created:     __DATE__
rem Last Change: 2019/02/28 13:02:03.

rem set batch_title="***"
rem title %batch_title%

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

rem echo ^>^> %batch_title%
echo ^>^> Start

__START__

popd
endlocal

rem pause
exit /b 0

