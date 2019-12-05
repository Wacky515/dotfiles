@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/12/05 10:09:26.
rem MEMO: �_�u���R�[�e�[�V���� ���ȁI�I�I

set batch_title=Auto7zipper
title %batch_title%
rem whoami /PRIV | find "SeLoadDriverPrivilege" > NUL  rem {{{
rem
rem rem �Ǘ��Ҍ����Ȃ烁�C������
rem if not errorlevel 1 goto main_routine
rem
rem rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
rem @powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
rem exit
rem
rem :main_routine
rem }}}

set bat_path=%~dp0
set sev_zip_exe=C:\ProgramData\chocolatey\tools\7z.exe
set test_script=test_substitute_filename.cmd

rem �X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%

rem �q�o�b�`���珢�����ꂽ�Ƃ��̏���
echo ^>^> Check call from child batch or not
if %1 == "" (
    pushd %bat_path%
) else (
    echo ^>^> Execute from child batch
)

echo ^>^> Current path:
pwd

for /r %%f in ( * ) do (
    if /i "%%~xf" == .zip (
        call :recomp "%%f"
    ) else if /i "%%~xf" == .rar (
        call :recomp "%%f"
    ) else if /i "%%~xf" == .lzh (
        call :recomp "%%f"

    rem ���O�t�@�C���͈ȉ��ɋL�q
    ) else if %%~zf leq 500000 (
        call :ignore "%%f"
    ) else if "%%~xf" == .7z (
        call :ignore "%%f"
    ) else if "%%~xf" == .txt (
        call :ignore "%%f"
    ) else if "%%~xf" == .md (
        call :ignore "%%f"
    ) else if "%%~xf" == .lnk (
        call :ignore "%%f"
    ) else if "%%~xf" == .db (
        call :ignore "%%f"
    ) else if "%%~xf" == .id (
        call :ignore "%%f"
    ) else if "%%~xf" == .tmp (
        call :ignore "%%f"
    ) else if "%%~xf" == .env (
        call :ignore "%%f"
    ) else if "%%~xf" == .bak (
        call :ignore "%%f"
    ) else if %%~ni == tags (
        call :ignore "%%f"

    ) else if %%~ni"%%~xf" == compress.cmd (
        call :ignore "%%f"
    ) else if %%~ni"%%~xf" == shortcut_compress.cmd (
        call :ignore "%%f"
    ) else if %%~ni"%%~xf" == %test_script% (
        call :ignore "%%f"
    ) else if %%~ni"%%~xf" == "i" (
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
