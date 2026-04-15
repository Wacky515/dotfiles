@echo off
setlocal enabledelayedexpansion
rem Created:     2016/08/17 **:**:**
rem Last Change: 2026/01/28 13:42:58.

set "bat_title=Make link dotfiles"
title %bat_title%
set "bat_path=%~dp0"

rem 共通関数群
set "func_dir=%bat_path%\etc\init\windows\batch_function"
set "func_path=%func_dir%\batch_function.cmd"

if not exist "%func_path%" (
    echo [ERROR] Common function batch not found: "%func_path%"
    exit /b 9999
) else (
    echo [INFO] Common function batch found: "%func_path%"
)

rem 頻出の call を変数化
set "lmsg=call "%func_path%" logmsg %~nx0"
set "mklk=call "%func_path%" make_link %~nx0"

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
pushd "%bat_path%"

%lmsg% INFO "Start making symbolic link between homepath and dotfiles"

rem "NeoVim" のリンク設定
%lmsg% INFO "Check install NeoVim or not"
nvim -v > nul 2>&1
if %errorlevel% equ 0 (
    %lmsg% INFO "NeoVim is already installed, verified with the -v option"
    goto link_nvim
) else if exist "C:\tools\neovim\Neovim\bin\nvim-qt.exe" (
    %lmsg% INFO "NeoVim is already installed; nvim-qt.exe was found"
    goto link_nvim
) else if exist "C:\ProgramData\chocolatey\bin\nvim-qt.exe" (
    %lmsg% INFO "NeoVim is already installed; nvim-qt.exe was found"
    goto link_nvim
) else (
    %lmsg% ERROR "NEOVIM IS NOT INSTALLED; SKIPPING LINK CREATION"
    goto link_git
)

:link_nvim
%lmsg% INFO "Make link NeoVim"
if defined XDG_CONFIG_HOME (
    %lmsg% INFO "Creating NeoVim link in XDG_CONFIG_HOME"
    set "dst_nvim=%XDG_CONFIG_HOME%\nvim"
) else (
    %lmsg% INFO "Creating NeoVim link in LOCALAPPDATA"
    set "dst_nvim=%LOCALAPPDATA%\nvim"
)
set "src_nvim=%USERPROFILE%\dotfiles\nvim"

%mklk% "%dst_nvim%" "%src_nvim%" /d "NeoVim Config"

:link_git
%lmsg% INFO "Make link .gitconfig"

set "git_dst=%USERPROFILE%\.gitconfig"
set "git_src=%bat_path%\.gitconfig"

set "gitos_dst=%USERPROFILE%\.gitconfig.os"
set "gitos_src=%bat_path%\.gitconfig.windows"

%mklk% "%git_dst%" "%git_src%" "" ".gitconfig global"
%mklk% "%gitos_dst%" "%gitos_src%" "" ".gitconfig.os"

:link_dot_vim
%lmsg% INFO "Make link .vim"

set "vim_dst=%USERPROFILE%\.vim"
set "vim_src=%bat_path%\.vim"

%mklk% "%vim_dst%" "%vim_src%" /d ".vim directory"

:link_conf_fish
%lmsg% INFO "Make link config.fish"

set "fish_dir=%USERPROFILE%\.config\fish"
call "%func_path%" make_dir %~nx0 "%fish_dir%"

set "fish_dst=%fish_dir%\config.fish"
set "fish_src=%bat_path%\config.fish"

%mklk% "%fish_dst%" "%fish_src%" "" "config.fish"

:link_pip
%lmsg% INFO "Make link pip.ini"

set "pip_dir=%APPDATA%\pip"
call "%func_path%" make_dir %~nx0 "%pip_dir%"

set "pip_dst=%pip_dir%\pip.ini"
set "pip_src=%bat_path%\pip.ini"

%mklk% "%pip_dst%" "%pip_src%" "" "pip.ini (Global)"

if defined VIRTUAL_ENV (
    %mklk% "%VIRTUAL_ENV%\pip.ini" "%pip_src%" "" "pip.ini (Virtual)"
)

:lnk_dot
rem "mklink" 時にスキップするファイル
set "skip_list=.bash_history .zsh_history"
set "skip_list=%skip_list% .gitconfig .gitconfig.linux .gitconfig.windows"
set "skip_list=%skip_list% .oyainputconf"

for %%i in (%bat_path%\.*) do (
    echo %skip_list% | findstr /i /c:"%%~nxi" >nul
    if not errorlevel 1 (
        %lmsg% INFO "Skip link for %%i (in skip_list)"
    ) else (
        set "dst=%USERPROFILE%\%%~nxi"
        set "src=%%i"
        %mklk% "!dst!" "!src!" "" "dotfile %%i"
    )
)

:end
%lmsg% INFO "End set link"

popd
endlocal

rem pause
exit /b 0