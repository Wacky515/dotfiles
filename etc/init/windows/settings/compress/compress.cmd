@echo off
rem TODO: ショートカットを置いた先で実行する

set exe="C:\ProgramData\chocolatey\tools\7z.exe"

for /r %%i in (*) do (
    rem echo catch %%i
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
        ) else if %%~ni == tags (
            call :ignore "%%i"

        ) else if not %%~ni%%~xi == compress.cmd (
            call :comp "%%i"
        )
    )

echo End
pause
cd %~p0

goto :eof

:recomp
set cmp_name="%~p1%~n1.7z"
set source_name="%~n1%~x1"

echo Convert to 7zip %source_name%

cd %~p1
%exe% x -o$$temp$$ %1 >> nul
cd $$temp$$
%exe% a -t7z -mx=9 -m0=lzma2 -x!*.zip -x!*.lzh -x!*.rar %cmp_name% * >> nul
cd ..
rmdir /s /q $$temp$$
rem if exist %~p1%~n1.7z if not %~x1 == .7z del /f /q %1
if exist %cmp_name% if not %~x1 == .7z del /f /q %1

goto :eof

:comp
set cmp_name="%~p1%~n1.7z"
set source_name="%~n1%~x1"

echo Compress %~n1%~x1
cd %~p1
%exe% a -t7z -mx=9 -m0=lzma2 -x!*.zip -x!*.lzh -x!*.rar %cmp_name% %source_name% >> nul
if exist %cmp_name% if not %~x1 == .7z del /f /q %1

goto :eof

:ignore
echo Skip %~n1%~x1

goto :eof

pause

rem exit /b0
