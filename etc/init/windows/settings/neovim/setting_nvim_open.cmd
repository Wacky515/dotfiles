@echo off
setlocal enabledelayedexpansion
rem Created:     2018/12/20 15:51:47
rem Last Change: 2023/03/11 21:46:59.

set batch_title=Setting NeoVim Open

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

set prefix=""
set drive="C:"

rem rem スクリプトがある "Dir" に "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

echo ^>^> Set Open by NeoVim
reg add "HKEY_CLASSES_ROOT\*\shell\NeoVim open" /v ^
    "Icon" /t REG_SZ /d C:\tools\neovim\Neovim\bin\nvim-qt.exe /f
reg add "HKEY_CLASSES_ROOT\*\shell\NeoVim open\command" /t ^
    REG_SZ /d "\"%drive%\tools\neovim\Neovim\bin\nvim-qt.exe\" \"%%1\"" /f
goto eof

:eof
endlocal

rem pause
exit /b 0
