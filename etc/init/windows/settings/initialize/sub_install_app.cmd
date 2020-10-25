@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2020/10/25 21:46:58.

set batch_title=Install initialize App
title %batch_title%

set dir_7zip="C:\ProgramData\chocolatey\tools\7z.exe"
set src_dir=%userprofile%\OneDrive\仕事\InitApps\
rem set bat_path=%~dp0

rem rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%
pushd %src_dir%

echo ^>^> %batch_title%
echo ^>^> Search %computername%'s setting

for %%i in (*.7z) do (
        call :unzip %%i
        )

if exist %src_dir%\%computername% (
        echo ^>^> %computername%'s setting
        pushd %src_dir%\%computername%
        for %%j in (*.7z) do (
            call :unzip %%j
            )
        pushd %src_dir%
        )

if "%processor_architecture%" equ   "x86" goto x32
if "%processor_architecture%" equ "AMD64" goto x64

:x32
echo ^>^> This OS is 32 bit
pushd %src_dir%\x32
if %errorlevel% equ 1 (
    ECHO ^>^> OS SETTING FOLDER NOT FOUND
    goto OSver
)

for %%k in (*.7z) do (
        call :unzip %%k
        )
pushd %src_dir%
goto OSver

:x64
echo ^>^> This OS is 64 bit
pushd %src_dir%\x64
if %errorlevel% equ 1 (
    echo ^>^> OS SETTING FOLDER NOT FOUND
    goto OSver
)

for %%l in (*.7z) do (
        call :unzip %%l
        )
pushd %src_dir%
goto OSver

:OSver
ver | find /i "Version 6.1." > nul
if %errorlevel% equ 0 goto windows7

ver | find /i "Version 10.0." > nul
if %errorlevel% equ 0 goto windows10

echo ^>^> Invalid OS
goto end

:windows7
echo ^>^> This OS is Windows7
pushd %src_dir%\Windows7
if %errorlevel% equ 1 (
    echo ^>^> WINDOWS7 SETTING FOLDER NOT FOUND
    goto end
)

for %%m in (*.7z) do (
        call :unzip %%m
        )
pushd %src_dir%
goto :end

:windows10
echo ^>^> This OS is Windows10
pushd %src_dir%\Windows10
if %errorlevel% equ 1 (
    echo ^>^> WINDWOS10 SETTING FOLDER NOT FOUND
    goto end
)

for %%n in (*.7z) do (
        call :unzip %%n
        )
pushd %src_dir%

rem rem TODO: インストール有無 判定
rem if not exist %userprofile%\SlimDrivers-setup.exe (
rem     %userprofile%\SlimDrivers-setup.exe
rem )

echo ^>^> Install apps
pushd %src_dir%\Install
if %errorlevel% equ 1 (
    echo ^>^> INSTALL FOLDER NOT FOUND
    goto end
)

for %%o in (*.7z) do (
        call :inst %%o
        )
goto :end

:unzip
if not exist %userprofile%\%~n1 (
        echo ^>^> Set %~n1 in home dir
        %dir_7zip% x -y -o%userprofile%\%~n1 %1
        ) else (
            echo ^>^> SKIP: Already set %~n1
            )
exit /b 0

:inst
echo ^>^> Install %~n1
set garb=%~n1
%dir_7zip% x -y -o%~n1 %1
call %~n1"\"%~n1".exe"
rmdir /s /q %~n1
exit /b 0

:end
popd
endlocal

rem pause
exit /b 0
