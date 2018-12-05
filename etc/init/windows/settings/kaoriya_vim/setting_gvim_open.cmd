@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/12/05 08:55:32.

set batch_title=Setting GVim Open
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem ŠÇ—ŽÒŒ ŒÀ‚È‚çƒƒCƒ“ˆ—
if not errorlevel 1 goto main_routine

rem ŠÇ—ŽÒŒ ŒÀ‚Å‚È‚¯‚ê‚ÎŠÇ—ŽÒŒ ŒÀ‚ÅÄ‹N“®
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set homedir="C:"%homepath%

echo ^>^> %batch_title%

rem OS 64bit”Å‚Æ32bit”Å‚Å•ªŠò
if exist %homedir%"\vim81-kaoriya-win64\" goto vim64
if exist %homedir%"\vim81-kaoriya-win32\" (
    goto vim32
) else (

    echo ^>^> Please set GVim in home directory
    goto eof
)

:vim64
echo ^>^> Set Open by GVim 64bit
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v "Icon" /t REG_SZ /d %homedir%"\vim81-kaoriya-win64\gvim.exe" /f
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%homedir%\vim81-kaoriya-win64\gvim.exe\" \"%%1\"" /f
goto eof

:vim32
echo ^>^> Set Open by GVim 32bit
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v "Icon" /t REG_SZ /d %homedir%"\vim81-kaoriya-win32\gvim.exe" /f
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%homedir%\vim81-kaoriya-win32\gvim.exe\" \"%%1\"" /f
goto eof

:eof
endlocal

rem pause
exit /b 0

