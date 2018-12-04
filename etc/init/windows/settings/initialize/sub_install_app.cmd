@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/12/04 08:51:00.

title Install initialize App

rem rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
rem pushd %bat_path%

rem 設定ファイルがある "Dir" に "cd"
set srcdir=%OneDrive%"\仕事\InitApps"
pushd %srcdir%

set dir_7zip="C:\ProgramData\chocolatey\tools\7z.exe"

for %%i in (*.7z) do (
        call :unzip %%i
        )

if exist %srcdir%\%computername% (
        echo ^>^> %computername%'s setting
        pushd %srcdir%\%computername%
        for %%j in (*.7z) do (
            call :unzip %%j
            )
        pushd %srcdir%
        )

if "%processor_architecture%" equ "x86" goto x32
if "%processor_architecture%" equ "AMD64" goto x64

:x32
echo ^>^> This OS is 32 bit
pushd %srcdir%"\x32"
for %%k in (*.7z) do (
        call :unzip %%k
        )
pushd %srcdir%
goto OSver

:x64
echo ^>^> This OS is 64 bit
pushd %srcdir%"\x64"
for %%l in (*.7z) do (
        call :unzip %%l
        )
pushd %srcdir%
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
pushd %srcdir%"\Windows7"
for %%m in (*.7z) do (
        call :unzip %%m
        )
pushd %srcdir%
goto :eof

:windows10
echo ^>^> This OS is Windows10
pushd %srcdir%"\Windows10"
for %%n in (*.7z) do (
        call :unzip %%n
        )
pushd %srcdir%

rem rem TODO: インストール有無 判定
rem if not exist %homepath%\SlimDrivers-setup.exe (
        rem         %homepath%\SlimDrivers-setup.exe
        rem         )

echo ^>^> Install some Apps
pushd %srcdir%".\Install"
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

