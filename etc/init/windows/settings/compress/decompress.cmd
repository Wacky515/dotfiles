@echo off
setlocal
rem Created:     2018/09/13 11:23:41
rem Last Change: 2019/09/30 10:51:58.

set batch_title=Decompress file(Recursion)
title %batch_title%

rem  スクリプトがある "Dir" に "cd"
pushd %~dp0

echo ^>^> Start %batch_title%

for /r %%i in (*.7z) do "C:\Program Files (x86)\7-Zip\7z.exe" x -o%%~di%%~pi %%i

endlocal
popd

rem pause
exit /b 0
