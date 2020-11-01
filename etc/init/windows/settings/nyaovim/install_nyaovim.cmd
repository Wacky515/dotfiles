@echo off
setlocal enabledelayedexpansion
rem Created:     2018/12/19 11:37:29
rem Last Change: 2020/11/02 00:57:00.

set batch_title=Install NyaoVim

title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

set command=npm bin -g

rem  �X�N���v�g������ "Dir" �� "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

echo ^>^> Check installed or not
rem nyaovim --version > nul 2>&1
rem npm ls -g nyaovim > nul 2>&1
rem if %errorlevel% equ 0 goto end
if exist %userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html (
    echo ^>^> Already installed, skip this script
    goto end
)

echo ^>^> Check dependencies
for /f %%i in ('%command%') do set npm_path=%%i
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

:end
endlocal
popd

pause
exit /b 0
