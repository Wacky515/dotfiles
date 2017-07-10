@echo off
set exe="C:\ProgramData\chocolatey\tools\7z.exe"
rem set add=%~n0

for /R %%i in (*) do  (
    echo %%i
rem     echo %~n0%~x0
    rem if /I "%%~xi"==".7z" call :recomp %%i
    if /I "%%~xi"==".zip" call :recomp %%i
    if /I "%%~xi"==".rar" call :recomp %%i
    if /I "%%~xi"==".lzh" call :recomp %%i
rem     if /I "%%~xi"==".lzh"
rem     if not %%i==*\"compress.cmd" call :comp %%i
    if not "%%~ni%%~xi"=="compress.cmd" call :comp %%i
rem     if not %%i===%~n0%~x0 call :comp %%i
rem     (
rem         call :recomp %%i
rem     ) else (
rem         call :comp %%i
rem     )
    )

echo "End"
cd %~p0

goto :EOF

:recomp
echo "Recompress"
echo %1
cd %~p1
%exe% x -o$$temp$$ %1 >> NUL
cd $$temp$$
rem -t7z: 7z‘ŒÉŒ`Ž®
rem -mx=9: Å‘åˆ³ki’´ˆ³kj
rem -m0=lzma2: Å—Dæi0j‚Ìˆ³k•ûŽ® LZMA2
%exe% a -t7z -mx=9 -m0=lzma2 %~p1%~n1.7z * >> NUL
cd ..
rmdir /S /Q $$temp$$
if exist %~p1%~n1.7z if not "%~x1"==".7z" del /F /Q %1

goto :EOF

:comp
echo "Compress"
echo %1
cd %~p1
rem %exe% x -o$$temp$$ %1 >> NUL
rem cd $$temp$$
%exe% a -t7z -mx=9 -m0=lzma2 %~p1%~n1.7z * >> NUL
rem cd ..
rem rmdir /S /Q $$temp$$
if exist %~p1%~n1.7z if not "%~x1"==".7z" del /F /Q %1

goto :EOF