@echo off
setlocal enabledelayedexpansion
rem Created:     2016/08/17 **:**:**
rem Last Change: 2023/03/19 08:51:55.

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

echo ^>^> Start make symbolic link homepath ^<-^> dotfiles

rem "NeoVim" のリンク設定
rem "NeoVim" インストール済みかチェック
echo ^>^> Check install NeoVim or not
nvim -v > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Already installed NeoVim, Judge by -v option
    goto link_nvim
) else if exist C:\tools\neovim\Neovim\bin\nvim-qt.exe (
    echo ^>^> Already installed NeoVim, exist nvim-qt.exe
    goto link_nvim
) else if exist C:\ProgramData\chocolatey\bin\nvim-qt.exe (
    echo ^>^> Already installed NeoVim, exist nvim-qt.exe
    goto link_nvim
) else (
    echo ^>^> NOT INSTALLED NEOVIM, SKIP MAKE LINK
    goto link_git
)

:link_nvim
echo ^>^> Make link NeoVim
set src_nvim=%userprofile%\dotfiles\nvim\
if defined xdg_config_home (
    echo ^>^> Set NeoVim link in XDG CONFIG HOME
    set dst_nvim=%xdg_config_home%\nvim\
) else (
    echo ^>^> Set NeoVim link in Local AppData
    set dst_nvim=%localappdata%\nvim\
)

if exist %dst_nvim% (
    echo ^>^> Delete nvim directory
    rem MEMO: シンボリックリンクされたディレクトリの削除は "rmdir"
    rmdir %dst_nvim%
)

mklink /d %dst_nvim% %src_nvim% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> init.vim, ginit.vim for NeoVim link success
) else (
    echo ^>^> FAILED LINK INIT.VIM, GINIT.VIM FOR NEOVIM
    echo ^>^> ERROR CODE: %errorlevel%
)

:link_git
echo ^>^> Make link .gitconfig
rem ".gitconfig" のリンク設定
mklink %userprofile%\.gitconfig %bat_path%\.gitconfig > nul 2>&1

if %errorlevel% equ 0 (
    echo ^>^> .gitconfig link success
) else (
    echo ^>^> FAILED LINK .GITCONFIG
    echo ^>^> ERROR CODE: %errorlevel%
)

mklink %userprofile%\.gitconfig.os %bat_path%\.gitconfig.windows > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> .gitconfig.os link success
) else (
    echo ^>^> FAILED LINK .GITCONFIG.OS
    echo ^>^> ERROR CODE: %errorlevel%
)

rem ".vim" のリンク設定
echo ^>^> Make link .vim
if exist %userprofile%\.vim\ (
    echo ^>^> Delete .vim directory
    rem MEMO: シンボリックリンクされたディレクトリの削除は "rmdir"
    rmdir %userprofile%\.vim\
)

mklink /d %userprofile%\.vim\ %bat_path%\.vim\ > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> .vim link success
) else (
    echo ^>^> FAILED LINK .VIM
    echo ^>^> ERROR CODE: %errorlevel%
)

rem "config.fish" のリンク設定
echo ^>^> Make link config.fish
mklink %userprofile%\.config\fish\config.fish %bat_path%\config.fish > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> config.fish link success
) else (
    echo ^>^> FAILED LINK CONFIG.FISH
    echo ^>^> ERROR CODE: %errorlevel%
)

rem "pip" のリンク設定
echo ^>^> Make link pip.ini
if not exist %appdata%\pip\ (
    mkdir %appdata%\pip\
)

mklink %appdata%\pip\pip.ini %bat_path%\pip.ini > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> pip.ini link^(Global^) success
) else (
    echo ^>^> FAILED LINK PIP.INI ^(GLOBAL^)
    echo ^>^> ERROR CODE: %errorlevel%
)
mklink %VIRTUAL_ENV%\pip.ini %bat_path%\pip.ini > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> pip.ini link^(Virtual^) success
) else (
    echo ^>^> FAILED LINK PIP.INI ^(VIRTUAL^)
    echo ^>^> ERROR CODE: %errorlevel%
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

pause
exit /b 0
