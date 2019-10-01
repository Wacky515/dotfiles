@echo off
setlocal
rem Created:     2018/01/01 00:00:00
rem Last Change: 2019/10/01 14:46:56.

set batch_title=Setting Everything
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%

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
echo ^>^> Time stamp: %tstmp%

set inidir=C:%homepath%\AppData\Roaming\Everything\
set backup=%inidir%\old\%tstmp%

set srcdir=%homepath%\OneDrive\�d��\Settings\Everything\

rem �ݒ�t�@�C�������� "Dir" �� "cd"
pushd %srcdir%

rem "Everything" ��~
echo ^>^> Kill Everything
taskkill /f /im Everything.exe > nul 2>&1

rem �o�b�N�A�b�v �쐬
mkdir %backup%

rem :backup
if exist %inidir% (
    move %inidir%\* %backup%
    )

rem �V���{���b�N�����N �쐬
echo ^>^> Make symbolic link *.ini
for %%i in (*.ini) do (
    mklink %inidir%\%%i %srcdir%\%%i
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

if exist C:\Program Files (x86)\Everything\Everything.exe goto evex64
if exist C:\Program Files\Everything\Everything.exe (
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
