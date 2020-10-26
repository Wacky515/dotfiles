@echo off
setlocal enabledelayedexpansion
rem Created:     2020/10/26 09:53:23.
rem Last Change: 2020/04/16 15:16:58.

set batch_title=Setting command prompt
title %batch_title%

set dist_file="%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\コマンド プロンプト.lnk"

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%

rem xcopy "コマンド プロンプト.lnk" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools"
if exist %dist_file% del %dist_file%
cscript setting_cmd.vbs

popd
endlocal

pause
exit /b 0

