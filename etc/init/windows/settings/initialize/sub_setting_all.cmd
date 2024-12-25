@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2024/12/25 10:40:05.

set batch_title=Initialize batch scripts for setting
title %batch_title%

set git_path=%userprofile%\dotfiles\etc\init\windows\settings
set meg_path=%OneDrive%\仕事\Settings\
rem set bat_path=%~dp0

rem rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%

echo ^>^> %batch_title%

pushd %git_path%
if %errorlevel% equ 1 (
    ECHO ^>^> GIT SETTINGS FOLDER NOT FOUND
    goto setting_meg
)
echo ^>^> Search setting batch script in Git settings folder
for /r %%i in (setting_*) do (
    if %%~xi == .cmd (echo ^>^> Catch: %%~nxi)
    if %%~xi == .vbs (echo ^>^> Catch: %%~nxi)
    if %%~xi == .reg (echo ^>^> Catch: %%~nxi
        ) else (
            rem pass
        )
    )

for /r %%j in (setting_*) do (
    pushd %git_path%
    if %%~xj == .cmd (
        echo ^>^> Automatically execute %%~nxj by batch script
        cd %%~dpj
        call %%~nxj
        )
    if %%~xj == .vbs (
        echo ^>^> Automatically execute %%~nxj by batch script
        cscript %%j
        )
    if %%~xj == .reg (
        echo ^>^> Automatically execute %%~nxj by batch script
        reg import %%j
        )
    )
echo ^>^> Done setting batch script in Git settings folder

:setting_meg
pushd %meg_path%
if %errorlevel% equ 1 (
    ECHO ^>^> MEGA SYNC SETTINGS FOLDER NOT FOUND
    goto end
)
echo ^>^> Search setting batch in Mega sync Settings folder

for /r %%k in (setting_*) do (
    if %%~xk == .cmd (echo ^>^> Catch: %%~nxk)
    if %%~xk == .vbs (echo ^>^> Catch: %%~nxk)
    if %%~xk == .reg (echo ^>^> Catch: %%~nxk
        ) else (
            rem pass
        )
    )

for /r %%l in (setting_*) do (
    if %%~xl == .cmd (
        echo ^>^> Automatically execute %%~nxl by batch script
        call %%l
        rem pushd %od_path%
        pushd %meg_path%
        )
    if %%~xl == .vbs (
        echo ^>^> Automatically execute %%~nxl by batch script
        cscript %%l
        rem pushd %od_path%
        pushd %meg_path%
        )
    if %%~xl == .reg (
        echo ^>^> Automatically execute %%~nxl by batch script
        reg import %%l
        rem pushd %od_path%
        pushd %meg_path%
        )
    )
echo ^>^> Done setting batch in Mega sync Settings folder

:end
popd
endlocal

rem pause
exit /b 0
