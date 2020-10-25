@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2020/10/24 22:47:14

set batch_title=Initialize batch scripts for install
title %batch_title%

set git_path=%userprofile%\dotfiles\etc\init\windows\settings\
set meg_path=%userprofile%\OneDrive\仕事\Settings\
rem set bat_path=%~dp0

rem rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%

echo ^>^> %batch_title%

pushd %git_path%
if errorlevel equ 1 (
    echo ^>^> Git settings folder not found
    goto inst_meg
)

echo ^>^> Search install batch scripts in Git settings folder
for /r %%i in (install_*) do (
    if %%~xi == .cmd (echo ^>^> Catch: %%~nxi)
    if %%~xi == .vbs (echo ^>^> Catch: %%~nxi)
    if %%~xi == .reg (echo ^>^> Catch: %%~nxi
        ) else (
            rem pass
        )
    )

for /r %%j in (install_*) do (
    if %%~xj == .cmd (
        echo ^>^> Automatically execute %%~nxj by batch scripts
        call %%j
        pushd %git_path%
        )
    if %%~xj == .vbs (
        echo ^>^> Automatically execute %%~nxj by batch scripts
        cscript %%j
        pushd %git_path%
        )
    if %%~xj == .reg (
        echo ^>^> Automatically execute %%~nxj by batch scripts
        reg import %%j
        pushd %git_path%
        )
    )
echo ^>^> Done install batch scripts in Git settings folder

:inst_meg
pushd %meg_path%
if errorlevel equ 1 (
    echo ^>^> Mega sync Settings folder not found
    goto end
)
echo ^>^> Search install batch scripts in Mega sync Settings folder
for /r %%k in (install_*) do (
    if %%~xk == .cmd (echo ^>^> Catch: %%~nxk)
    if %%~xk == .vbs (echo ^>^> Catch: %%~nxk)
    if %%~xk == .reg (echo ^>^> Catch: %%~nxk
        ) else (
            rem pass
        )
    )

for /r %%l in (install_*) do (
    if %%~xl == .cmd (
        echo ^>^> Automatically execute %%~nxl by batch scripts
        call %%l
        pushd %meg_path%
        )
    if %%~xl == .vbs (
        echo ^>^> Automatically execute %%~nxl by batch scripts
        cscript %%l
        pushd %meg_path%
        )
    if %%~xl == .reg (
        echo ^>^> Automatically execute %%~nxl by batch scripts
        reg import %%l
        pushd %meg_path%
        )
    )
echo ^>^> Done install batch scripts in Mega sync Settings folder

:end
popd
endlocal

rem pause
exit /b 0
