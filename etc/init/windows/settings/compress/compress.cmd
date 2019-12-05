@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/12/05 10:09:26.
rem MEMO: ダブルコーテーション 取るな！！！

set batch_title=Auto7zipper
title %batch_title%
rem whoami /PRIV | find "SeLoadDriverPrivilege" > NUL  rem {{{
rem
rem rem 管理者権限ならメイン処理
rem if not errorlevel 1 goto main_routine
rem
rem rem 管理者権限でなければ管理者権限で再起動
rem @powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
rem exit
rem
rem :main_routine
rem }}}

set bat_path=%~dp0
set sev_zip_exe=C:\ProgramData\chocolatey\tools\7z.exe
set test_script=test_substitute_filename.cmd

rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%

rem 子バッチから召喚されたときの処理
echo ^>^> Check call from child batch or not
if %1 == "" (
    pushd %bat_path%
) else (
    echo ^>^> Execute from child batch
)

echo ^>^> Current path:
pwd

for /r %%f in ( * ) do (
    if /i %%~xi == .zip (
        call :recomp "%%f"
    ) else if /i %%~xi == .rar (
        call :recomp "%%f"
    ) else if /i %%~xi == .lzh (
        call :recomp "%%f"

    rem 除外ファイルは以下に記述
    ) else if %%~zi leq 500000 (
        call :ignore "%%f"
    ) else if %%~xi == .7z (
        call :ignore "%%f"
    ) else if %%~xi == .txt (
        call :ignore "%%f"
    ) else if %%~xi == .md (
        call :ignore "%%f"
    ) else if %%~xi == .lnk (
        call :ignore "%%f"
    ) else if %%~xi == .db (
        call :ignore "%%f"
    ) else if %%~xi == .id (
        call :ignore "%%f"
    ) else if %%~xi == .tmp (
        call :ignore "%%f"
    ) else if %%~xi == .env (
        call :ignore "%%f"
    ) else if %%~xi == .bak (
        call :ignore "%%f"
    ) else if %%~ni == tags (
        call :ignore "%%f"

    ) else if %%~ni%%~xi == compress.cmd (
        call :ignore "%%f"
    ) else if %%~ni%%~xi == shortcut_compress.cmd (
        call :ignore "%%f"
    ) else if %%~ni%%~xi == %test_script% (
        call :ignore "%%f"
    ) else if %%~ni%%~xi == "i" (
        call :ignore "%%f"
    ) else (
        call :comp "%%f"
    )
)

echo ^>^> Finish possess
rem pause
exit /b 0

:recomp
set comprs_name=%~n1%~x1.7z
set source_name=%~n1%~x1
pushd %~p1

echo ^>^> Convert %source_name% to %comprs_name%

rem %sev_zip_exe% x %1 >> nul
%sev_zip_exe% x -o$$temp$$ %1 >> nul
pushd $$temp$$

%sev_zip_exe% a -t7z -mx=9 -m0=lzma2 %~p1\"%comprs_name%" * >> nul

pushd ..
rmdir /s /q $$temp$$
if exist "%comprs_name%" if not "%~x1"==".7z" del /f /q %1

goto end
rem REF: < https://sevenzip.osdn.jp/howto/compress-many-files.html >

:comp
set comprs_name=%~n1%~x1.7z
set source_name=%~n1%~x1
pushd %~p1

echo ^>^> Compress %source_name% to %comprs_name%

%sev_zip_exe% a -t7z -mx=9 -m0=lzma2 "%comprs_name%" "%source_name%" >> nul
if exist "%comprs_name%" if not "%~x1"==".7z" del /f /q %1
goto end

:ignore
echo ^>^> Skip %~n1%~x1
goto end

:end
endlocal
popd

rem pause
exit /b 0
