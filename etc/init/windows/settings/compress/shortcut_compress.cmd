@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2018/11/15 12:31:18.

set batch_title=Auto7zipper shortcut
title %batch_title%

set bat_path=%~dp0

rem �X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%

set scr_path=%userprofile%\dotfiles\etc\init\windows\settings\compress\compress.cmd

pushd %bat_path%

echo ^>^> Local path:  %bat_path%
echo ^>^> Script path: %scr_path%

start %scr_path% %bat_path%

endlocal
popd

rem pause
exit /b 0
