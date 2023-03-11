@echo off
setlocal enabledelayedexpansion
rem Created:     2020/04/15 10:45:50
rem Last Change: 2020/10/24 22:23:59.

set batch_title=Install gtran

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0

rem rem スクリプトがある "Dir" に "cd"
rem set bat_path=%~dp0
rem pushd %bat_path%
pushd %userprofile%

echo ^>^> %batch_title%
rem echo ^>^> Start

echo ^>^> Check installed or not
gtran -v> nul 2>&1
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
    rem link.cmd 実行
    pushd %userprofile%\dotfiles\
    call link.cmd
) else (
    echo ^>^> Already Git clone
)

rem "Chocolatey" インストール済みかチェック
chocolatey -v >> nul
if %errorlevel% equ 0 goto install_go

echo ^>^> Install Chocolatey
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

:install_go
echo ^>^> Check installed Go or not
go version > nul 2>&1
if %errorlevel% equ 0 goto install_gtran
cinst golang -y

:install_gtran
pushd %userprofile%
git clone https://github.com/skanehira/gtran.git
cd gtran
go install

:end
endlocal
popd

rem pause
exit /b 0
