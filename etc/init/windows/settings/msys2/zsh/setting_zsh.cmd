@echo off
setlocal enabledelayedexpansion
rem Created:     2018/06/07 10:30:32
rem Last Change: 2020/11/01 10:21:50.

set batch_title=Setting zsh

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

set nssw=C:\cygwin64\etc\nsswitch.conf

echo ^>^> %batch_title%

rem �X�N���v�g������ "Dir" �� "cd"
set bat_path=%~dp0
pushd %bat_path%
if %errorlevel% equ 1 (
    echo ^>^> SETTING FOLDER NOT FOUND
    goto end
)

if exist %nssw% (
    echo ^>^> Backup %nssw%
    rename %nssw% %nssw%".bak" > nul 2>&1
    )

mklink %nssw% %~dp0%nsswitch.conf

:end
endlocal
popd

rem pause
exit /b 0
