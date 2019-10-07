@echo off
setlocal
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/09/30 09:48:13.

title Auto7zipper

set exe="C:\ProgramData\chocolatey\tools\7z.exe"
set ibat1=substitute_filename_test.7z_to_.7z.cmd

echo Get path %1
if "%1" EQU "" (
    pushd %~dp0
    set cpath=%~dp0
    ) else (
    pushd %1
    set cpath=%1
    )
echo Current path %cpath%

for /r %%i in (*) do (
    if /i %%~xi == .zip (
            call :recomp "%%i"
        ) else if /i %%~xi == .rar (
            call :recomp "%%i"
        ) else if /i %%~xi == .lzh (
            call :recomp "%%i"

        rem 除外ファイルは以下に記述
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

goto :eof

:recomp
set cmp_name="%~p1%~n1%~x1.7z"
set source_name="%~n1%~x1"

echo Convert to 7zip %source_name%

pushd %~p1
%exe% x -o$$temp$$ %1 >> nul
pushd $$temp$$
%exe% a -t7z -mx=9 -m0=lzma2 -x!*.zip -x!*.lzh -x!*.rar %cmp_name% * >> nul
pushd ..
rmdir /s /q $$temp$$
if exist %cmp_name% if not "%~x1"==".7z" del /f /q %1

goto :eof

:comp
set cmp_name="%~p1%~n1%~x1.7z"
set source_name="%~n1%~x1"

echo Compress %~n1%~x1
pushd %~p1
%exe% a -t7z -mx=9 -m0=lzma2 -x!*.zip -x!*.lzh -x!*.rar %cmp_name% %source_name% >> nul
if exist %cmp_name% if not "%~x1"==".7z" del /f /q %1

goto :eof

:ignore
echo Skip %~n1%~x1

goto :eof

endlocal
popd

rem pause
exit /b0
