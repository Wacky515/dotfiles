@echo off
rem Created:     2018/04/19 09:01:59
rem Last Change: 2018/04/19 09:03:47.

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Start setting cmder-powerline-prompt
cp powerline_prompt.lua %CMDER_ROOT%/config

rem pause
exit /b 0

