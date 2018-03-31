@echo off

for /r %%f in ( * ) do call :sub "%%f"
pause
exit /b

:sub
set fname=%~n1
rem echo %fname%
set fname=%fname:.test=%
rem echo %fname%
ren "%~1" "%fname%%~x1"
goto :EOF
