@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/08/19 18:42:13.

title Install initialize font

rem �ݒ�t�@�C�������� "Dir" �� "cd"
rem set srcdir=%OneDrive%"\�d��\InitApps"
set srcdir=C:%homepath%\Mega\�d��\InitApps
pushd %srcdir%

rem �Q�l: http://qiita.com/masarusan24/items/d3a5ab7c37e9b6d9a51f
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

