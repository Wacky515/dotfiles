@echo off
title Auto7zipper Shortcut

set localpath=%~dp0
set batchpath=%userprofile%^
\dotfiles\etc\init\windows\settings\compress\compress.cmd

cd %localpath%
start %batchpath% %localpath%

rem echo Local path: %localpath%
rem echo Batch path: %batchpath%

rem pause
rem exit /b0
