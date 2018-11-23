@echo off
setlocal
rem Created:     2018/05/10 19:22:34
rem Last Change: 2018/11/23 11:39:32.

title Initialize dotfile

set bat_path=%~dp0
set config_files=packages_%computername%.config

rem 管理者権限で起動されたかチェック
whoami /priv | find "SeLoadDriverPrivilege" > nul

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem スクリプトがある "Dir" に "cd"
pushd %bat_path%

rem "Chocolatey" インストール済みかチェック
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto update

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem 必須パッケージのみ "cinst"
cinst -y git onedrive teamviewer

:update
echo ^>^> Already installed Chocolatey, Update software

rem "***_packages_***.config" を読み込み、インストール
if exist *_%config_files% (
        echo ^>^> Install app for this PC
        for %%i in (*_%config_files%) do (
            rem cinst -y %config_files%
            cinst -y %%i
            )
        ) else (
            echo ^>^> "Setting default parameter"
            cinst -y packages.config
            )

cup all -y

rem ホームディレクトリに "cd"
pushd %homepath%

echo ^>^> Check installed Git or not
if not exist %homepath%\dotfiles\.git (
        echo ^>^> Git clone first
        if exist %homepath%\dotfiles\ (
            rmdir /s %homepath%\dotfiles\
            )
        git clone https://github.com/Wacky515/dotfiles.git
        rem 暫定的に以下の branch に checkout
        rem git checkout ftr_win

        rem link.cmd 実行
        pushd dotfiles
        call link.cmd
        ) else (
            echo ^>^> Already clone Git
            )

rem rem 再度スクリプトがある "Dir" に "cd"
rem pushd %bat_path%

rem 設定ファイルがある "Dir" に "cd"
set srcdir=%OneDrive%"\仕事\InitApps"
pushd %srcdir%

rem git\init\settings と OneDrive\仕事\settings 内の setting_*.cmd 実行
call sub_install_all.cmd
call sub_setting_all.cmd

pause
echo ^>^> Chocolatey update
cup all -y

rem ホームディレクトリに *.7z で圧縮したアプリを展開
rem call sub_install_all.cmd
call sub_install_app.cmd

rem TODO: 以下を復活させる
call sub_install_font.cmd

echo "*** PLEASE RESTART PC ***"

endlocal
popd

pause
exit /b 0

