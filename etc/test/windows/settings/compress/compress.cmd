@echo off
set exe="C:\ProgramData\chocolatey\tools\7z.exe"

for /r %%i in (*) do  (
    echo %%i
    if /i "%%~xi"==".zip" call :recomp %%i
    if /i "%%~xi"==".rar" call :recomp %%i
    if /i "%%~xi"==".lzh" call :recomp %%i
    if not "%%~ni%%~xi"=="compress.cmd" call :comp %%i
    )

echo "End"
cd %~p0

goto :eof

:recomp
echo "Recompress"
echo %1
cd %~p1
%exe% x -o$$temp$$ %1 >> NUL
cd $$temp$$
rem -t7z: 7z���Ɍ`��
rem -mx=9: �ő刳�k�i�����k�j
rem -m0=lzma2: �ŗD��i0�j�̈��k���� LZMA2
%exe% a -t7z -mx=9 -m0=lzma2 %~p1%~n1.7z * >> NUL
cd ..
rmdir /s /q $$temp$$
if exist %~p1%~n1.7z if not "%~x1"==".7z" del /F /Q %1

goto :eof

:comp
echo "Compress"
echo %1
cd %~p1
%exe% a -t7z -mx=9 -m0=lzma2 %~p1%~n1.7z * >> NUL
if exist %~p1%~n1.7z if not "%~x1"==".7z" del /F /Q %1

goto :eof
