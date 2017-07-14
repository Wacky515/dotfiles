@echo off
set exe="C:\ProgramData\chocolatey\tools\7z.exe"

for /R %%i in (*) do  (
    echo %%i
    if /I "%%~xi"==".zip" call :recomp %%i
    if /I "%%~xi"==".rar" call :recomp %%i
    if /I "%%~xi"==".lzh" call :recomp %%i
    if not "%%~ni%%~xi"=="compress.cmd" call :comp %%i
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
rem -t7z: 7z書庫形式
rem -mx=9: 最大圧縮（超圧縮）
rem -m0=lzma2: 最優先（0）の圧縮方式 LZMA2
%exe% a -t7z -mx=9 -m0=lzma2 %~p1%~n1.7z * >> NUL
cd ..
rmdir /S /Q $$temp$$
if exist %~p1%~n1.7z if not "%~x1"==".7z" del /F /Q %1

goto :EOF

:comp
echo "Compress"
echo %1
cd %~p1
%exe% a -t7z -mx=9 -m0=lzma2 %~p1%~n1.7z * >> NUL
if exist %~p1%~n1.7z if not "%~x1"==".7z" del /F /Q %1

goto :EOF
