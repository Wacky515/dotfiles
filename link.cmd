@echo off
setlocal enabledelayedexpansion
rem Created:     2016/08/17 **:**:**
rem Last Change: 2021/03/02 15:15:05.

set batch_title=Make link dotfiles
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
pushd %bat_path%

echo ^>^> Start make link dotfiles to homepath

rem "NeoVim" 設定
rem "NeoVim" インストール済みかチェック
echo ^>^> Check install NeoVim or not
nvim -v > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Installed NeoVim
    goto inst_nvim
) else if exist C:\tools\neovim\Neovim\bin\nvim-qt.exe (
    echo ^>^> Installed NeoVim
    goto inst_nvim
) else (
    echo ^>^> NOT INSTALLED NEOVIM, SKIP LINK
    goto jdg_nyao
)

:inst_nvim
echo ^>^> Make link NeoVim
set src_nvim=%userprofile%\dotfiles\nvim\
if defined xdg_config_home (
    echo ^>^> Set NeoVim in XDG CONFIG HOME
    set dst_nvim=%xdg_config_home%\nvim\
) else (
    echo ^>^> Set NeoVim in Local AppData
    set dst_nvim=%localappdata%\nvim\
)

mklink /d %dst_nvim% %src_nvim% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> init.vim, ginit.vim for NeoVim link success!
) else (
    echo ^>^> FAILED LINK INIT.VIM, GINIT.VIM, FOR NEOVIM ERROR CODE: %errorlevel%
)

:jdg_nyao
rem "NyaoVim" 設定
rem "NyaoVim" インストール済みかチェック
echo ^>^> Check install NyaoVim or not
if exist %userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html (
    echo ^>^> Installed NyaoVim
    goto inst_nyao
) else (
    echo ^>^> NOT INSTALLED NYAOVIM, SKIP LINK
    goto jdg_oni
)

:inst_nyao
echo ^>^> Make link NyaoVim
set src_html=%bat_path%\nyaovimrc.html
set dst_html=%userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html

if exist %dst_html% (
    del /f /q %dst_html%
)

rem FIXME: "mklink" だと起動しない
rem mklink %dst_html% %src_html%
copy %src_html% %dst_html% > nul 2>&1
if %errorlevel% equ 0 (
    rem echo ^>^> Success nyaovimrc.html link
    echo ^>^> Success nyaovimrc.html copy
) else (
    rem echo ^>^> FAILED LINK NYAOVIMRC.HTML, ERROR CODE: %errorlevel%
    echo ^>^> FAILED COPY NYAOVIMRC.HTML, ERROR CODE: %errorlevel%
)

:jdg_oni
rem "OniVim" 設定
rem "OniVim" インストール済みかチェック
echo ^>^> Check install OniVim or not
if exist %programfiles(x86)%\Oni\Oni.exe (
    echo ^>^> Installed OniVim
    goto inst_oni
) else (
    echo ^>^> NOT INSTALLED ONIVIM, SKIP LINK
    goto lnk_git
)

:inst_oni
echo ^>^> Make link OniVim
set src_json=%bat_path%\config.js
set dst_json=%userprofile%\AppData\Roaming\Oni\config.js

if exist %dst_json% (
    del /f /q %dst_json%
)

mklink %dst_json% %src_json% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> success link tsconfig.json
) else (
    echo ^>^> FAILED LINK TSCONFIG.JSON, ERROR CODE: %errorlevel%
)

set src_oni=%userprofile%\dotfiles\nvim\
set dst_oni=%localappdata%\nvim\

if exist %dist_oni% (
    del /f /q %dst_oni%
)

mklink /d %dst_oni% %src_oni% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> init.vim, ginit.vim for Oni link success!
) else (
    echo ^>^> FAILED LINK INIT.VIM, GINIT.VIM, FOR ONI ERROR CODE: %errorlevel%
)

:lnk_git
rem ".gitconfig" 設定
mklink %userprofile%\.gitconfig %bat_path%\.gitconfig > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success .gitconfig link
) else (
    echo ^>^> FAILED LINK .GITCONFIG, ERROR CODE: %errorlevel%
)
mklink %userprofile%\.gitconfig.os %bat_path%\.gitconfig.windows > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success .gitconfig.os link
) else (
    echo ^>^> FAILED LINK .GITCONFIG.OS, ERROR CODE: %errorlevel%
)

rem ".vim" 設定
mklink /d %userprofile%\.vim\ %bat_path%\.vim\ > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success .vim link
) else (
    echo ^>^> FAILED LINK .VIM, ERROR CODE: %errorlevel%
)

rem "config.fish" 設定
mklink %userprofile%\.config\fish\config.fish %bat_path%\config.fish > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success config.fish link
) else (
    echo ^>^> FAILED LINK CONFIG.FISH, ERROR CODE: %errorlevel%
)

rem "pip" 設定
if not exist %appdata%\pip\ (
    mkdir %appdata%\pip\
)
mklink %appdata%\pip\pip.ini %bat_path%\pip.ini > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success pip.ini link^(Global^)
) else (
    echo ^>^> FAILED LINK PIP.INI ^(GLOBAL^), ERROR CODE: %errorlevel%
)
mklink %VIRTUAL_ENV%\pip.ini %bat_path%\pip.ini > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success pip.ini link^(Virtual^)
) else (
    echo ^>^> FAILED LINK PIP.INI ^(VIRTUAL^), ERROR CODE: %errorlevel%
)

:lnk_dot
rem "mklink" 時にスキップするドットファイル
for %%j in (.*) do (
    if %%j == .bash_history (
        rem 消すな
        rem pass
    ) else if %%j == .gitconfig (
        rem 消すな
        rem pass
    ) else if %%j == .gitconfig.linux (
        rem 消すな
        rem pass
    ) else if %%j == .gitconfig.windows (
        rem 消すな
        rem pass
    ) else if %%j == .zsh_history (
        rem 消すな
        rem pass
    ) else if %%j == .oyainputconf (
        rem 消すな
        rem pass
    ) else (
        mklink %userprofile%\%%j .\dotfiles\%%j > nul 2>&1
    )
)

:end
echo ^>^> End set link

popd
endlocal

rem pause
exit /b 0
