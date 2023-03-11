@echo off
setlocal enabledelayedexpansion
rem Created:     2018/01/01 00:00:00
rem Last Change: 2020/11/01 10:20:01.

set batch_title=Setting Everything
title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0

rem ���t�擾
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

rem �����擾
set time=%time: =0%
set hh=%time:~0,2%
set mi=%time:~3,2%
set ss=%time:~6,2%

set tstmp=%yyyy%-%mm%-%dd%_%hh%-%mi%-%ss%

set ini_dir=%appdata%\Everything\
set src_dir=%userprofile%\OneDrive\�d��\Settings\Everything\
set backup=%ini_dir%\old\%tstmp%

rem �X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%

echo ^>^> %batch_title%
echo ^>^> Time stamp: %tstmp%

rem �ݒ�t�@�C�������� "Dir" �� "cd"
pushd %src_dir%
if %errorlevel% equ 1 (
    echo ^>^> SETTING FOLDER NOT FOUND
    goto end
)

rem "Everything" ��~
echo ^>^> Kill Everything
taskkill /f /im Everything.exe > nul 2>&1

rem �o�b�N�A�b�v �쐬
echo ^>^> Make backup
mkdir %backup%
rem :backup
if exist %ini_dir% (
    move %ini_dir%\* %backup%
    )

rem �V���{���b�N�����N �쐬
echo ^>^> Make symbolic link *.ini
for %%i in (*.ini) do (
    mklink %ini_dir%\%%i %src_dir%\%%i
)

rem �f�X�N�g�b�v�V���[�g�J�b�g �쐬
if not exist %userprofile%\Desktop\Everything.lnk (
    goto cplnk
) else (
    echo ^>^> Already set desktop shortcut
    goto end
)

:cplnk
echo ^>^> Make shortcut in Desktop

if exist %programfiles(x86)%\Everything\Everything.exe goto evex64
if exist %programfiles%\Everything\Everything.exe (
    goto eve
) else (
    goto end
)

:evex64
copy .\x86_shortcut\Everything.lnk %userprofile%\Desktop\
goto end

:eve
copy .\shortcut\Everything.lnk %userprofile%\Desktop\
goto end

:end
endlocal
popd

rem pause
exit /b 0
