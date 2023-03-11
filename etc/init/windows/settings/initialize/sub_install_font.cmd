@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2020/11/01 17:53:32.

set batch_title=Install initialize font
title %batch_title%

set src_dir=%userprofile%\OneDrive\�d��\InitApps\
rem set bat_path=%~dp0

rem rem �X�N���v�g������ "Dir" �� "cd"
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
    if exist "%windir%\Fonts\%%~nxi" (
        echo ^>^> Already installed %%~nxi
    ) else (
        echo ^>^> Install %%~nxi
        cscript .\setting_font.vbs %%~nxi
    )
)

for %%j in (.\Fonts\*.ttc) do (
    if exist "%windir%\Fonts\%%~nxj" (
        echo ^>^> Already installed %%~nxj
    ) else (
        echo ^>^> Install %%~nxj
        cscript .\setting_font.vbs %%~nxi
    )
)

for %%k in (.\Fonts\*.otf) do (
    if exist "%windir%\Fonts\%%~nxk" (
        echo ^>^> Already installed %%~nxk
    ) else (
        echo ^>^> Install %%~nxk
        cscript .\setting_font.vbs %%~nxk
    )
)

rem �Q�l: http://qiita.com/masarusan24/items/d3a5ab7c37e9b6d9a51f

:end
popd
endlocal

rem pause
exit /b 0
