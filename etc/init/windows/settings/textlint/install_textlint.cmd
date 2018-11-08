@echo off
rem Created:     2018/10/05 09:54:50
rem Last Change: 2018/11/08 09:48:07.

set cmd=npm bin -g

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Check dependencies
for /f %%i in ('%cmd%') do set npm_path=%%i
rem echo %npm_path%
if exist %npm_path% goto install_textlint

rem "Chocolatey" インストール済みかチェック
chocolatey -v >> nul
if %errorlevel% equ 0 goto install_npm

echo ^>^> Install Chocolatey
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

:install_npm
echo ^>^> Install Node Package Manager
cinst -y nodejs.install

:install_textlint
echo ^>^> Start install textlint
if not exist %homepath%\textlint (
    mkdir %homepath%\textlint
    cmd npm init -y
    )
cd %homepath%\textlint

npm install textlint --save-dev
npm install textlint-rule-preset-ja-technical-writing --save-dev
npm install textlint-rule-preset-ja-spacing --save-dev

rem pause
exit /b 0
