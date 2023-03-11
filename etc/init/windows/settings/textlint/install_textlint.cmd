@echo off
setlocal enabledelayedexpansion
rem Created:     2018/10/05 09:54:50
rem Last Change: 2021/03/21 14:45:48.

set batch_title=Install textlint

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

set command=npm bin -g

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

echo ^>^> Check installed or not
rem textlint --version > nul 2>&1-version
rem if %errorlevel% equ 0 goto end
if exist %appdata%\npm\node_modules\textlint (
    echo ^>^> Already installed, install rules
    goto inst_rules
    rem echo ^>^> Already installed, skip this script
    rem goto end
)

echo ^>^> Check dependencies
for /f %%i in ('%command%') do set npm_path=%%i
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
rem if not exist %userprofile%\textlintrc ( rem  {{{
rem     echo ^>^> Make working dir
rem     mkdir %userprofile%\textlintrc
rem     )
rem pushd %userprofile%\textlintrc

rem if not exist %userprofile%\textlintrc\package.json (
rem     echo ^>^> Make package.json
rem     cmd /c npm init -y
rem     )
rem }}}

:inst_rules
cmd /c npm update -global npm

rem cmd /c npm install -global textlint -save-dev
cmd /c npm install -global textlint@11.2.3 --save-dev
cmd /c npm install -global textlint-rule-preset-japanese --save-dev
cmd /c npm install -global textlint-rule-preset-ja-technical-writing --save-dev
cmd /c npm install -global textlint-rule-spellcheck-tech-word --save-dev
cmd /c npm install -global textlint-rule-preset-ja-spacing --save-dev
cmd /c npm install -global textlint-filter-rule-comments --save-dev
cmd /c npm install -global textlint-filter-rule-whitelist --save-dev
cmd /c npm install -global markdownlint-cli --save-dev

cmd /c npm install -global @textlint-ja/textlint-rule-no-insert-dropping-sa --save-dev
cmd /c npm install -global textlint-rule-ja-hiragana-fukushi --save-dev
cmd /c npm install -global textlint-rule-ja-hiragana-hojodoushi --save-dev
cmd /c npm install -global textlint-rule-ja-no-redundant-expression --save-dev
cmd /c npm install -global textlint-rule-ja-unnatural-alphabet --save-dev
cmd /c npm install -global textlint-rule-joyo-kanji --save-dev
cmd /c npm install -global textlint-rule-no-renyo-chushi --save-dev
cmd /c npm install -global textlint-rule-one-white-space-between-zenkaku-and-hankaku-eiji --save-dev

rem REF:
rem https://github.com/textlint/textlint/wiki/Collection-of-textlint-rule

:end
endlocal
rem popd

rem pause
exit /b 0
