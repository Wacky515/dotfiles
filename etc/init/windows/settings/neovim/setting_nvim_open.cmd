@echo off
setlocal
rem Created:     2018/12/20 15:51:47
rem Last Change: 2018/12/24 12:29:38.

set batch_title=Setting NeoVim Open
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem ŠÇ—ŽÒŒ ŒÀ‚È‚çƒƒCƒ“ˆ—
if not errorlevel 1 goto main_routine

rem ŠÇ—ŽÒŒ ŒÀ‚Å‚È‚¯‚ê‚ÎŠÇ—ŽÒŒ ŒÀ‚ÅÄ‹N“®
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set prefix=""
set drive="C:"

echo ^>^> %batch_title%

echo ^>^> Set Open by NeoVim
reg add "HKEY_CLASSES_ROOT\*\shell\NeoVim open" /v "Icon" /t REG_SZ /d C:\tools\neovim\Neovim\bin\nvim-qt.exe /f
reg add "HKEY_CLASSES_ROOT\*\shell\NeoVim open\command" /t REG_SZ /d "\"%drive%\tools\neovim\Neovim\bin\nvim-qt.exe\" \"%%1\"" /f
goto eof

:eof
endlocal

rem pause
exit /b 0

