@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/09/30 12:16:45.

title Install initialize font

rem �ݒ�t�@�C�������� "Dir" �� "cd"
rem if %computername% == HBAMB748 (
rem     set ms_path=R:\E2M0\E2M-4\�y��z-E2M4-1\10.�l�t�@�C��\Wakita\�d��\InitApps\
rem ) else if %computername% == HBAMB819 (
rem     set ms_path=R:\E2M0\E2M-4\�y��z-E2M4-1\10.�l�t�@�C��\Wakita\�d��\InitApps\
rem ) else (
    set src_dir=C:%homepath%\OneDrive\�d��\InitApps\
rem )
pushd %src_dir%

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

