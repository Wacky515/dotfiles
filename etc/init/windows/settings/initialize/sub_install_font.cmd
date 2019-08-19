@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/08/19 18:42:13.

title Install initialize font

rem 設定ファイルがある "Dir" に "cd"
rem set srcdir=%OneDrive%"\仕事\InitApps"
set srcdir=C:%homepath%\Mega\仕事\InitApps
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

