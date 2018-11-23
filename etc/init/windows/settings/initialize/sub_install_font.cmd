@echo off
setlocal
rem Created:     20**/**/** **:**:**
rem Last Change: 2018/11/23 11:36:07.

title Install Initialize font

rem rem スクリプトがある "Dir" に "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%

rem 設定ファイルがある "Dir" に "cd"
set srcdir=%OneDrive%"\仕事\InitApps""
pushd %srcdir%

rem 参考: http://qiita.com/masarusan24/items/d3a5ab7c37e9b6d9a51f
reg import .\Fonts\fontlink.reg

for %%i in (.\Fonts\*.ttf) do (
    echo %%~nxi
    if not exist "%windir%\%%~nxi" (cscript .\setting_font.vbs %%~nxi)
    )

for %%j in (.\Fonts\*.ttc) do (
    if not exist "%windir%\%%~nxj" (cscript .\setting_font.vbs %%~nxj)
    )

for %%k in (.\Fonts\*.otf) do (
    if not exist "%windir%\%%~nxk" (cscript .\setting_font.vbs %%~nxk)
    )

popd
endlocal

rem pause
rem exit /b 0

