@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2020/11/01 10:12:34.

set batch_title=Install initialize font
title %batch_title%

set src_dir=%userprofile%\OneDrive\仕事\InitApps\
rem set bat_path=%~dp0

rem rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%
pushd %src_dir%
if %errorlevel% equ 1 (
    echo ^>^> INSTALL FONT FOLDER NOT FOUND
    goto end
)

echo ^>^> %batch_title%
echo ^>^> Search fonts setting

reg import .\Fonts\fontlink.reg

for %%i in (.\Fonts\*.ttf) do (
    echo ^>^> Install %%~nxi
    if not exist "%windir%\Fonts\%%~nxi" (cscript .\setting_font.vbs %%~nxi)
    )

for %%j in (.\Fonts\*.ttc) do (
    echo ^>^> Install %%~nxj
    if not exist "%windir%\Fonts\%%~nxj" (cscript .\setting_font.vbs %%~nxj)
    )

for %%k in (.\Fonts\*.otf) do (
    echo ^>^> Install %%~nxk
    if not exist "%windir%\Fonts\%%~nxk" (cscript .\setting_font.vbs %%~nxk)
    )
rem 参考: http://qiita.com/masarusan24/items/d3a5ab7c37e9b6d9a51f

:end
popd
endlocal

rem pause
exit /b 0
