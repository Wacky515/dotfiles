@echo off
setlocal enabledelayedexpansion
rem Created:     __DATE__
rem Last Change: 2021/03/11 11:10:51.

rem set batch_title=__START__
rem title %batch_title%

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

rem echo ^>^> %batch_title%
echo ^>^> Start

echo ^>^> Check %batch_title% or not

popd
endlocal

rem pause
exit /b 0
