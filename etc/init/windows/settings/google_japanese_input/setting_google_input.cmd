@echo off
setlocal enabledelayedexpansion
rem Created:     201*/**/** **:**:**
rem Last Change: 2019/11/19 17:30:39.

set batch_title=Setting Google Japanese input
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

set deb_dir=%userprofile%\AppData\LocalLow\Google\
set src_dir=%userprofile%\OneDrive\�d��\Settings\GoogleJapaneseInput\
set backup=%deb_dir%\old

rem �X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%

echo ^>^> %batch_title%
echo ^>^> Time stamp: %tstmp%

rem �ݒ�t�@�C�������� "Dir" �� "cd"
pushd %src_dir%

rem "Google���{����͂̊֘A�T�[�r�X" ��~
echo ^>^> Kill Google Japanese input
taskkill /f /im GoogleIMEJa* > nul 2>&1

rem �o�b�N�A�b�v �쐬
if exist %backup% (
    goto bkup
) else (
    goto mkbakdir
)

:mkbakdir
mkdir %backup%

:bkup
if exist %deb_dir%\Google Japanese Input (
    move %deb_dir%\Google Japanese Input ^
        %backup%\Google Japanese Input_%tstmp%
    )

mkdir %deb_dir%\Google Japanese Input

rem �V���{���b�N�����N �쐬
rem echo ^>^> Make symbolic link *.db
for %%i in (*.db) do (
    mklink %deb_dir%\Google Japanese Input\%%i %src_dir%\%%i
)

endlocal
popd

rem pause
exit /b 0
