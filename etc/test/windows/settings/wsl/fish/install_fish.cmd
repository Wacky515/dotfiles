@echo off
setlocal
rem Created:     2019/10/03 12:33:07
rem Last Change: 2019/10/03 12:33:29.

set batch_title=Install fish
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem set command=npm bin -g
rem
rem rem  �X�N���v�g������ "Dir" �� "cd"
rem pushd %~dp0
rem
rem echo ^>^> Check installed or not
rem nyaovim --version >> nul
rem if %errorlevel% equ 0 goto end
rem
rem echo ^>^> Check dependencies
rem for /f %%i in ('%command%') do set npm_path=%%i
rem if exist %npm_path% goto install_nyaovim
rem
rem rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
rem chocolatey -v >> nul
rem if %errorlevel% equ 0 goto install_npm
rem
rem echo ^>^> Install Chocolatey
rem @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
rem
rem :install_npm
rem echo ^>^> Install Node Package Manager
rem cinst -y nodejs.install
rem
rem :install_nyaovim
rem echo ^>^> %batch_title%
rem cmd /c npm install -g nyaovim

:end
endlocal
popd

rem pause
exit /b 0
