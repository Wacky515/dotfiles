@echo off
setlocal
rem Created:     2020/04/15 10:45:50
rem Last Change: 2020/04/15 11:51:37.

set batch_title=Install gtran
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0

rem rem �X�N���v�g������ "Dir" �� "cd"
rem pushd %bat_path%
pushd %userprofile%

echo ^>^> Check installed or not
gtran -v
if %errorlevel% equ 0 goto end

echo ^>^> Check dependencies

echo ^>^> Check installed Git or not
git --version > nul 2>&1
if %errorlevel% equ 0 goto gclone

echo ^>^> Try install git
cinst -y git
git --version > nul 2>&1

echo ^>^> Field install git automatically
exit /b 1000

if %errorlevel% equ 0 goto gclone

:gclone
echo ^>^> Check Git clone or not
if not exist %userprofile%\dotfiles\.git\ (
    echo ^>^> Git clone not yet, clone first
    if exist %userprofile%\dotfiles\ (
        rmdir /s /q %userprofile%\dotfiles\
    )
    del %userprofile%\.gitignore > nul 2>&1
    git clone --depth 1 https://github.com/Wacky515/dotfiles.git
) else (
    echo ^>^> Already Git clone
)
rem link.cmd ���s
pushd %userprofile%\dotfiles\
call link.cmd

pushd %userprofile%
git clone https://github.com/skanehira/gtran.git
cd gtran
go install

:end
endlocal
popd

rem pause
exit /b 0
