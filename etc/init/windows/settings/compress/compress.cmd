@echo off
title Auto7zipper

set exe="C:\ProgramData\chocolatey\tools\7z.exe"
set ibat1=substitute_filename_test.7z_to_.7z.cmd

echo Get path %1
if "%1" EQU "" (
    cd %~dp0
    set cpath=%~dp0
    ) else (
    cd %1
    set cpath=%1
    )
echo Current path %cpath%

for /r %%i in (*) do (
    rem echo catch %%i
    if /i %%~xi == .zip (
            call :recomp "%%i"
        ) else if /i %%~xi == .rar (
            call :recomp "%%i"
        ) else if /i %%~xi == .lzh (
            call :recomp "%%i"

        rem 髯､螟悶ヵ繧｡繧､繝ｫ縺ｯ莉･荳九↓險倩ｿｰ
        ) else if %%~xi == .lnk (
            call :ignore "%%i"
        ) else if %%~xi == .7z (
            call :ignore "%%i"
        ) else if %%~xi == .db (
            call :ignore "%%i"
        ) else if %%~xi == .id (
            call :ignore "%%i"
        ) else if %%~xi == .tmp (
            call :ignore "%%i"
        ) else if %%~xi == .env (
            call :ignore "%%i"
        ) else if %%~xi == .bak (
            call :ignore "%%i"
        ) else if %%~ni == tags (
            call :ignore "%%i"

        ) else if %%~ni%%~xi == %ibat1% (
            call :ignore "%%i"
        ) else if %%~ni%%~xi == shortcut_compress.cmd (
            call :ignore "%%i"
        ) else if not %%~ni%%~xi == compress.cmd (
            call :comp "%%i"
        )
    )

echo End
rem pause
rem ?? ?s?v?H
rem cd %~p0

goto :eof

:recomp
rem set cmp_name="%~p1%~n1.7z"
set cmp_name="%~p1%~n1%~x1.7z"
set source_name="%~n1%~x1"

echo Convert to 7zip %source_name%

cd %~p1
%exe% x -o$$temp$$ %1 >> nul
cd $$temp$$
%exe% a -t7z -mx=9 -m0=lzma2 -x!*.zip -x!*.lzh -x!*.rar %cmp_name% * >> nul
cd ..
rmdir /s /q $$temp$$
rem if exist %~p1%~n1.7z if not "%~x1"==".7z" del /f /q %1
if exist %cmp_name% if not "%~x1"==".7z" del /f /q %1

goto :eof

:comp
rem set cmp_name="%~p1%~n1.7z"
set cmp_name="%~p1%~n1%~x1.7z"
set source_name="%~n1%~x1"

echo Compress %~n1%~x1
cd %~p1
%exe% a -t7z -mx=9 -m0=lzma2 -x!*.zip -x!*.lzh -x!*.rar %cmp_name% %source_name% >> nul
if exist %cmp_name% if not "%~x1"==".7z" del /f /q %1

goto :eof

:ignore
echo Skip %~n1%~x1

goto :eof

rem pause
exit /b0
