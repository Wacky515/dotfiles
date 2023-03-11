@echo off
setlocal enabledelayedexpansion
rem Created:     2018/09/13 11:23:41
rem Last Change: 2019/09/30 10:51:58.

set batch_title=Decompress *.7z files (Recursion)
title %batch_title%

set bat_path=%~dp0
set sev_zip_exe=C:\ProgramData\chocolatey\tools\7z.exe

rem スクリプトがある "Dir" に "cd"
pushd %bat_path%

echo ^>^> Start %batch_title%

for /r %%f in ( *.7z ) do %sev_zip_exe% x -o%%~di%%~pi %%f

endlocal
popd

rem pause
exit /b 0
