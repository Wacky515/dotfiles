@echo off
rem Created:     2018/10/05 09:54:50
rem Last Change: 2018/11/13 08:59:59.

set cmd=npm bin -g

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Check dependencies
for /f %%i in ('%cmd%') do set npm_path=%%i
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
if not exist %homepath%\textlintrc (
    mkdir %homepath%\textlintrc
    cmd npm init -y
    )
cd %homepath%\textlintrc

cmd /c npm install textlint -global --save-dev
cmd /c npm install textlint-rule-preset-ja-technical-writing --save-dev
cmd /c npm install textlint-rule-preset-ja-spacing -global --save-dev
cmd /c npm install textlint-filter-rule-comments -global --save-dev
cmd /c npm install textlint-filter-rule-whitelist -global --save-dev

cmd /c npm install markdownlint-cli -global --save-dev

rem pause
exit /b 0
