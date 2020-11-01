@echo off
setlocal enabledelayedexpansion
rem Created:     2016/08/17 **:**:**
rem Last Change: 2020/11/01 10:35:46.

set batch_title=Make dotfiles
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

echo ^>^> Start set links dotfiles to homepath

rem "NeoVim" 設定
rem "NeoVim" インストール済みかチェック
echo ^>^> Check install NeoVim or not
nvim -v > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> NOT INSTALLED NEOVIM, SKIP LINK
    goto ins_nyao
) else (
    echo ^>^> Installed NeoVim
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
        echo ^>^> init.vim、ginit.vim link success!
    ) else (
        echo ^>^> FAILED LINK INIT.VIM、GINIT.VIM, ERROR CODE: %errorlevel%
    )
)

:ins_nyao
rem "NyaoVim" 設定
rem rem "NyaoVim" インストール済みかチェック
rem echo ^>^> Check install NyaoVim or not
rem nyaovim --version > nul 2>&1
rem if not %errorlevel% equ 0 (
rem     echo ^>^> NOT INSTALLED NYAOVIM, SKIP LINK
rem     goto ins_oni
rem ) else (
    rem echo ^>^> Installed NyaoVim
    echo ^>^> Set link NyaoVim
    set src_html=%bat_path%\nyaovimrc.html
    set dst_html=%userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html

    if exist %dst_html% (
        del %dst_html%
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
rem )

:ins_oni
rem "OniVim" 設定
rem rem "OniVim" インストール済みかチェック
rem echo ^>^> Check install OniVim or not
rem oni -h > nul 2>&1
rem if not %errorlevel% equ 0 (
rem     echo ^>^> NOT INSTALLED ONIVIM, SKIP LINK
rem     goto lnk_git
rem ) else (
    rem echo ^>^> Installed OniVim
    echo ^>^> Set link OniVim
    set src_json=%bat_path%\config.tsx
    set dst_json=%userprofile%\AppData\Roaming\Oni\config.tsx

    if exist %dst_json% (
        del %dst_json%
    )

    mklink %dst_json% %src_json% > nul 2>&1
    if %errorlevel% equ 0 (
        echo ^>^> success link tsconfig.json
    ) else (
        echo ^>^> FAILED LINK TSCONFIG.JSON, ERROR CODE: %errorlevel%
    )
rem )

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
mklink /d %userprofile%\.vim %bat_path%\.vim > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success .vim link
) else (
    echo ^>^> FAILED LINK .VIM, ERROR CODE: %errorlevel%
)

rem "config.fish" 設定
mklink %userprofile%\.config\fish\config.fish %bat_path%\config.fish > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success config.fish in dotfiles link
) else (
    echo ^>^> FAILED LINK CONFIG.FISH IN DOTFILES, ERROR CODE: %errorlevel%
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

echo ^>^> End set link

rem popd
endlocal

rem pause
exit /b 0
