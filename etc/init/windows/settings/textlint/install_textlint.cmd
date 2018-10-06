@echo off
rem Created:     2018/10/05 09:54:50
rem Last Change: 2018/05/25 14:42:51.

rem  �X�N���v�g������ "Dir" �� "cd"
cd /d %~dp0

echo ^>^> Start install textlint

rem "Node Package Manager" �C���X�g�[���ς݂��`�F�b�N
npm -v >> nul
if %ERRORLEVEL% EQU 0 goto install_textlint

rem "Chocolatey" �C���X�g�[���ς݂��`�F�b�N
chocolatey -v >> nul
if %errorlevel% equ 0 goto install_npm

echo ^>^> Install Chocolatey
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

:install_npm
echo ^>^> Install Node Package Manager
cinst -y nodejs.install

:install_textlint
npm i textlint -D
npm i -D textlint-rule-preset-ja-technical-writing
npm i -D textlint-rule-preset-ja-spacing

rem pause
exit /b 0
