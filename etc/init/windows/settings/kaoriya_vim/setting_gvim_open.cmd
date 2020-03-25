@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2020/03/25 10:35:59.

set batch_title=Setting GVim Open
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set homedir=%userprofile%

echo ^>^> %batch_title%

rem OS 64bit版と32bit版で分岐
rem if exist %homedir%\vim81-kaoriya-win64\ goto vim64
rem if exist %homedir%\vim81-kaoriya-win32\ goto vim32
if exist %homedir%\vim82-kaoriya-win64\ goto vim64
if exist %homedir%\vim82-kaoriya-win32\ goto vim32
echo ^>^> Please set GVim in home directory
goto eof

:vim64
echo ^>^> Set Open by GVim 64bit
rem reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v "Icon" /t REG_SZ /d %homedir%"\vim81-kaoriya-win64\gvim.exe" /f
rem reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%homedir%\vim81-kaoriya-win64\gvim.exe\" \"%%1\"" /f
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v "Icon" /t REG_SZ /d %homedir%"\vim82-kaoriya-win64\gvim.exe" /f
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%homedir%\vim82-kaoriya-win64\gvim.exe\" \"%%1\"" /f
goto eof

:vim32
echo ^>^> Set Open by GVim 32bit
rem reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v "Icon" /t REG_SZ /d %homedir%"\vim81-kaoriya-win32\gvim.exe" /f
rem reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%homedir%\vim81-kaoriya-win32\gvim.exe\" \"%%1\"" /f
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v "Icon" /t REG_SZ /d %homedir%"\vim82-kaoriya-win32\gvim.exe" /f
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%homedir%\vim82-kaoriya-win32\gvim.exe\" \"%%1\"" /f
goto eof

:eof
endlocal

rem pause
exit /b 0
