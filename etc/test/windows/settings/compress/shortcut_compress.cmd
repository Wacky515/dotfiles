@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/15 12:31:18.

title Auto7zipper Shortcut

set localpath=%~dp0
set batchpath=%userprofile%^
\dotfiles\etc\init\windows\settings\compress\compress.cmd

pushd %localpath%
start %batchpath% %localpath%

rem echo Local path: %localpath%
rem echo Batch path: %batchpath%

endlocal
popd

rem pause
rem exit /b0
