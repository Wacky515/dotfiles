@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2021/04/07 15:55:12.

set batch_title=Setting GVim Open
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

rem OS 64bit版と32bit版で分岐
if exist %userprofile%\vim82-kaoriya-win64\ goto vim64
if exist %userprofile%\vim82-kaoriya-win32\ goto vim32
echo ^>^> Please set GVim in home directory
goto eof

:vim64
echo ^>^> Set Open by GVim 64bit
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v "Icon" /t REG_SZ /d %userprofile%"\vim82-kaoriya-win64\gvim.exe" /f
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%userprofile%\vim82-kaoriya-win64\gvim.exe\" \"%%1\"" /f
goto eof

:vim32
echo ^>^> Set Open by GVim 32bit
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v "Icon" /t REG_SZ /d %userprofile%"\vim82-kaoriya-win32\gvim.exe" /f
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%userprofile%\vim82-kaoriya-win32\gvim.exe\" \"%%1\"" /f
goto eof

:eof
endlocal

rem pause
exit /b 0
