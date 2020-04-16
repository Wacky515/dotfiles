@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2020/04/16 16:01:00.

set batch_title=Install initialize font

title %batch_title%

rem rem スクリプトがある "Dir" に "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%
set src_dir=%userprofile%\OneDrive\仕事\InitApps\
pushd %src_dir%

echo ^>^> %batch_title%
rem echo ^>^> Start

rem 参考: http://qiita.com/masarusan24/items/d3a5ab7c37e9b6d9a51f
reg import .\Fonts\fontlink.reg

for %%i in (.\Fonts\*.ttf) do (
    echo ^>^> Install %%~nxi
    if not exist "%windir%\%%~nxi" (cscript .\setting_font.vbs %%~nxi)
    )

for %%j in (.\Fonts\*.ttc) do (
    echo ^>^> Install %%~nxj
    if not exist "%windir%\%%~nxj" (cscript .\setting_font.vbs %%~nxj)
    )

for %%k in (.\Fonts\*.otf) do (
    echo ^>^> Install %%~nxk
    if not exist "%windir%\%%~nxk" (cscript .\setting_font.vbs %%~nxk)
    )

popd
endlocal

rem pause
rem exit /b 0
