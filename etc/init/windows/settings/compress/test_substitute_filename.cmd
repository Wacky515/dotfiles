@echo off
setlocal enabledelayedexpansion
rem Created:     2018/11/13 16:03:58
rem Last Change: 2019/12/05 09:45:42.

set batch_title=Test substitute filename
title %batch_title%

set bat_path=%‾dp0

rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%

for /r %%f in ( * ) do call :sub "%%f"

:sub
set fname=%~n1
rem echo ^>^> %fname%
set fname=%fname:.test=%
rem echo ^>^> %fname%
ren "%~1" "%fname%%~x1"
goto end

:end
endlocal
popd

rem pause
exit /b 0
