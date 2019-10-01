@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/10/01 14:59:15.

title Install initialize App

rem rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0

rem 設定ファイルがある "Dir" に "cd"
rem if %computername% == HBAMB748 (
rem     set ms_path=R:\E2M0\E2M-4\【秘】-E2M4-1\10.個人ファイル\Wakita\仕事\InitApps\
rem ) else if %computername% == HBAMB819 (
rem     set ms_path=R:\E2M0\E2M-4\【秘】-E2M4-1\10.個人ファイル\Wakita\仕事\InitApps\
rem ) else (
    set src_dir=C:%homepath%\OneDrive\仕事\InitApps\
rem )

pushd %src_dir%

set dir_7zip="C:\ProgramData\chocolatey\tools\7z.exe"

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

if "%processor_architecture%" equ "x86" goto x32
if "%processor_architecture%" equ "AMD64" goto x64

:x32
echo ^>^> This OS is 32 bit
pushd %src_dir%\x32
for %%k in (*.7z) do (
        call :unzip %%k
        )
pushd %src_dir%
goto OSver

:x64
echo ^>^> This OS is 64 bit
pushd %src_dir%\x64
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
goto eof

:windows7
echo ^>^> This OS is Windows7
pushd %src_dir%\Windows7
for %%m in (*.7z) do (
        call :unzip %%m
        )
pushd %src_dir%
goto :eof

:windows10
echo ^>^> This OS is Windows10
pushd %src_dir%\Windows10
for %%n in (*.7z) do (
        call :unzip %%n
        )
pushd %src_dir%

rem rem TODO: インストール有無 判定
rem if not exist %homepath%\SlimDrivers-setup.exe (
        rem         %homepath%\SlimDrivers-setup.exe
        rem         )

echo ^>^> Install some apps
pushd %src_dir%\Install
for %%o in (*.7z) do (
        call :inst %%o
        )
goto :eof

:unzip
if not exist %homepath%\%~n1 (
        echo ^>^> Set %~n1 in home dir
        %dir_7zip% x -y -o%homepath%\%~n1 %1
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

:eof
popd
endlocal

rem pause
exit /b 0
