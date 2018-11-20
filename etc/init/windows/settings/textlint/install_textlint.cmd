@echo off
setlocal
rem Created:     2018/10/05 09:54:50
rem Last Change: 2018/11/21 08:12:27.

set batch_title="Install textlint"
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set cmd=npm bin -g

rem  スクリプトがある "Dir" に "cd"
<<<<<<< HEAD
pushd "%~dp0"
=======
pushd %~dp0
>>>>>>> f2797e1122bedb259341e007fbc848627a472e94

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
echo ^>^> %batch_title%
if not exist %homepath%\textlintrc (
    mkdir %homepath%\textlintrc
    cmd npm init -y
    )
pushd %homepath%\textlintrc

cmd /c npm install textlint -global --save-dev
cmd /c npm install textlint-rule-preset-ja-technical-writing --save-dev
cmd /c npm install textlint-rule-preset-ja-spacing -global --save-dev
cmd /c npm install textlint-filter-rule-comments -global --save-dev
cmd /c npm install textlint-filter-rule-whitelist -global --save-dev

cmd /c npm install markdownlint-cli -global --save-dev

endlocal
popd

rem pause
exit /b 0

