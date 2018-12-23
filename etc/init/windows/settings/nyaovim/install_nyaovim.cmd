@echo off
setlocal
rem Created:     2018/12/19 11:37:29
rem Last Change: 2018/12/19 15:28:47.

set batch_title=Install NyaoVim
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set cmd=npm bin -g

rem  �X�N���v�g������ "Dir" �� "cd"
pushd %~dp0

echo ^>^> Check dependencies
for /f %%i in ('%cmd%') do set npm_path=%%i
if exist %npm_path% goto install_nyaovim

rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
chocolatey -v >> nul
if %errorlevel% equ 0 goto install_npm

echo ^>^> Install Chocolatey
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

:install_npm
echo ^>^> Install Node Package Manager
cinst -y nodejs.install

:install_nyaovim
echo ^>^> %batch_title%
cmd /c npm install -g nyaovim

endlocal
popd

rem pause
exit /b 0
