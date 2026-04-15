@echo off
setlocal enabledelayedexpansion
rem Created:     2017/02/17 00:54:41
rem Last Change: 2026/04/08 07:24:07.

set batch_title="Update Chocolatey"
title %batch_title%
set "bat_path=%~dp0"

rem 共通関数群
set "func_dir=%HOMEPATH%\dotfiles\etc\init\windows\batch_function"
set "func_path=%func_dir%\batch_function.cmd"

if not exist "%func_path%" (
    echo [ERROR] Common function batch not found: "%func_path%"
    exit /b 9999
) else (
    echo [INFO] Common function batch found: "%func_path%"
)

rem 頻出の call を変数化
set "lmsg=call "%func_path%" logmsg %~nx0"

rem 管理者権限で起動されたかチェック
net session >nul 2>&1
if %errorlevel% equ 0 (
    rem 管理者権限あり
    %lmsg% INFO "Administrator privileges detected"
) else (
    rem 管理者権限なし、再起動して権限付与
    %lmsg% INFO "Relaunching with Administrator privileges"
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "Start-Process '%~f0' -Verb RunAs"
    exit /b 0
)

:main_routine
set "dot_path=%userprofile%\dotfiles"
set "cho_path=%dot_path%\etc\init\windows\settings\chocolatey"

rem Proxy環境か確認
ping 172.16.199.254 -n 1 -w 200 >nul 2>&1
if %errorlevel%==0 (
    set "cho_path=C:\Box\000_MyFolder\Settings\Chocolatey"
) else (
    set "cho_path=%OneDrive%\仕事\Settings\Chocolatey"
)

set "config_files=packages_%computername%.config"

rem rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%

%lmsg% INFO %batch_title%

rem "dotfiles" に "cd"
if not exist "%dot_path%" (
    %lmsg% ERROR "CLONE DOTFILES FIRST, ABORT THIS SCRIPT!"
    goto end
) else (
    pushd "%dot_path%"
)

rem "Chocolatey" インストール済みかチェック
choco -v >nul 2>&1
if %errorlevel%==0 goto update

%lmsg% INFO "Install Chocolatey"
powershell -NoProfile -c "iwr chocolatey.org/install.ps1|iex" >nul 2>&1" && ^
set "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco -v >nul 2>&1
if not %errorlevel%==0 (
    %lmsg% ERROR "Chocolatey install failed"
    goto end
)
%lmsg% INFO "Chocolatey installed"

:update
%lmsg% INFO "Update software condition"
if not exist "%cho_path%" (
    rem TODO: 自動で "git clone" する
    %lmsg% ERROR "CLONE CHOCOLATEY DIRECTORY FIRST, ABORT THIS SCRIPT!"
    goto end
)
pushd "%cho_path%"

rem "***_packages_***.config" を読込み、インストール
if exist "%config_files%" (
    %lmsg% INFO "Setting for this PC: %config_files%"
    choco install -y --no-progress "%config_files%"
    if not %errorlevel%==0 (
        %lmsg% ERROR "Install from %config_files% failed"
        goto end
    )
) else (
    %lmsg% INFO "Using default packages.config"
    if exist "packages.config" (
        choco install "packages.config" -y --no-progress
        if not %errorlevel%==0 (
            %lmsg% ERROR "Install from packages.config failed"
        )
    ) else (
        %lmsg% ERROR "packages config file not found"
        goto end
    )
)

rem Chocolatey 本体を先に更新
%lmsg% INFO "Upgrade Chocolatey itself"
choco upgrade chocolatey -y --no-progress
if not %errorlevel%==0 (
    %lmsg% ERROR "Chocolatey self-upgrade failed"
)

rem 更新対象の確認
%lmsg% INFO "Check outdated packages"
choco outdated
if %errorlevel%==2 (
    %lmsg% INFO "No outdated packages"
) else (
    rem インストール済みパッケージをすべて更新
    %lmsg% INFO "Upgrade all installed Chocolatey packages"
    choco upgrade all -y --no-progress
    if not %errorlevel%==0 (
        %lmsg% ERROR "Package upgrade failed"
    ) else (
        %lmsg% INFO "All installed Chocolatey packages upgraded"
    )
)

rem デスクトップショートカット 作成
pushd "%cho_path%"
if not exist "%userprofile%\Desktop\init_and_update_chocolatey.lnk" (
    goto cplnk
) else (
    %lmsg% INFO "Already set desktop shortcut"
    goto end
)

:cplnk
%lmsg% INFO "Set desktop shortcut"
copy /Y "init_and_update_chocolatey.lnk" "%userprofile%\Desktop\" >nul

:end
endlocal
popd

rem pause
exit /b 0
