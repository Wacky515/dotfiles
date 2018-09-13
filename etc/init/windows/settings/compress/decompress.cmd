@echo off
rem Created:     2018/09/13 11:23:41
rem Last Change: 2018/09/13 11:24:59.

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Start Decompress file(Recursion)

for /r %%i in (*.7z) do "C:\Program Files (x86)\7-Zip\7z.exe" x -o%%~di%%~pi %%i

rem pause
exit /b 0

