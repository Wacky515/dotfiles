@echo off
setlocal enabledelayedexpansion
rem Created:     2016/08/17 **:**:**
rem Last Change: 2020/11/02 00:58:31.

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
rem nvim -v > nul 2>&1
rem if not %errorlevel% equ 0 (
rem     echo ^>^> NOT INSTALLED NEOVIM, SKIP LINK
rem     goto ins_nyao
rem ) else (
rem     echo ^>^> Installed NeoVim
rem     set src_nvim=%userprofile%\dotfiles\nvim\
rem     if defined xdg_config_home (
rem         echo ^>^> Set NeoVim in XDG CONFIG HOME
rem         set dst_nvim=%xdg_config_home%\nvim\
rem     ) else (
rem         echo ^>^> Set NeoVim in Local AppData
rem         set dst_nvim=%localappdata%\nvim\
rem     )
rem
rem     mklink /d %dst_nvim% %src_nvim% > nul 2>&1
rem     if %errorlevel% equ 0 (
rem         echo ^>^> init.vim、ginit.vim link success!
rem     ) else (
rem         echo ^>^> FAILED LINK INIT.VIM、GINIT.VIM, ERROR CODE: %errorlevel%
rem     )
rem )

rem :ins_nyao
rem rem "NyaoVim" 設定
rem rem "NyaoVim" インストール済みかチェック
rem echo ^>^> Check install NyaoVim or not
rem if exist %userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html (
rem     echo ^>^> Installed NyaoVim
rem     echo ^>^> Set link NyaoVim
rem     set src_html=%bat_path%\nyaovimrc.html
rem     set dst_html=%userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html
rem
rem     if exist %dst_html% (
rem         del %dst_html%
rem     )
rem
rem     rem FIXME: "mklink" だと起動しない
rem     rem mklink %dst_html% %src_html%
rem     copy %src_html% %dst_html% > nul 2>&1
rem     if %errorlevel% equ 0 (
rem         rem echo ^>^> Success nyaovimrc.html link
rem         echo ^>^> Success nyaovimrc.html copy
rem     ) else (
rem         rem echo ^>^> FAILED LINK NYAOVIMRC.HTML, ERROR CODE: %errorlevel%
rem         echo ^>^> FAILED COPY NYAOVIMRC.HTML, ERROR CODE: %errorlevel%
rem     )
rem ) else (
rem     echo ^>^> NOT INSTALLED NYAOVIM, SKIP LINK
rem     goto ins_oni
rem )
rem
rem :ins_oni
rem rem "OniVim" 設定
rem rem rem "OniVim" インストール済みかチェック
rem rem echo ^>^> Check install OniVim or not
rem rem oni -h > nul 2>&1
rem rem if not %errorlevel% equ 0 (
rem rem     echo ^>^> NOT INSTALLED ONIVIM, SKIP LINK
rem rem     goto lnk_git
rem rem ) else (
rem     rem echo ^>^> Installed OniVim
rem     echo ^>^> Set link OniVim
rem     set src_json=%bat_path%\config.tsx
rem     set dst_json=%userprofile%\AppData\Roaming\Oni\config.tsx
rem
rem     if exist %dst_json% (
rem         del %dst_json%
rem     )
rem
rem     mklink %dst_json% %src_json% > nul 2>&1
rem     if %errorlevel% equ 0 (
rem         echo ^>^> success link tsconfig.json
rem     ) else (
rem         echo ^>^> FAILED LINK TSCONFIG.JSON, ERROR CODE: %errorlevel%
rem     )
rem rem )
rem
rem :lnk_git
rem rem ".gitconfig" 設定
rem mklink %userprofile%\.gitconfig %bat_path%\.gitconfig > nul 2>&1
rem if %errorlevel% equ 0 (
rem     echo ^>^> Success .gitconfig link
rem ) else (
rem     echo ^>^> FAILED LINK .GITCONFIG, ERROR CODE: %errorlevel%
rem )
rem mklink %userprofile%\.gitconfig.os %bat_path%\.gitconfig.windows > nul 2>&1
rem if %errorlevel% equ 0 (
rem     echo ^>^> Success .gitconfig.os link
rem ) else (
rem     echo ^>^> FAILED LINK .GITCONFIG.OS, ERROR CODE: %errorlevel%
rem )
rem
rem rem ".vim" 設定
rem mklink /d %userprofile%\.vim %bat_path%\.vim > nul 2>&1
rem if %errorlevel% equ 0 (
rem     echo ^>^> Success .vim link
rem ) else (
rem     echo ^>^> FAILED LINK .VIM, ERROR CODE: %errorlevel%
rem )
rem
rem rem "config.fish" 設定
rem mklink %userprofile%\.config\fish\config.fish %bat_path%\config.fish > nul 2>&1
rem if %errorlevel% equ 0 (
rem     echo ^>^> Success config.fish in dotfiles link
rem ) else (
rem     echo ^>^> FAILED LINK CONFIG.FISH IN DOTFILES, ERROR CODE: %errorlevel%
rem )
rem
rem :lnk_dot
rem rem "mklink" 時にスキップするドットファイル
rem for %%j in (.*) do (
rem     if %%j == .bash_history (
rem         rem 消すな
rem         rem pass
rem     ) else if %%j == .gitconfig (
rem         rem 消すな
rem         rem pass
rem     ) else if %%j == .gitconfig.linux (
rem         rem 消すな
rem         rem pass
rem     ) else if %%j == .gitconfig.windows (
rem         rem 消すな
rem         rem pass
rem     ) else if %%j == .zsh_history (
rem         rem 消すな
rem         rem pass
rem     ) else if %%j == .oyainputconf (
rem         rem 消すな
rem         rem pass
rem     ) else (
rem         mklink %userprofile%\%%j .\dotfiles\%%j > nul 2>&1
rem     )
rem )

echo ^>^> End set link

popd
endlocal

pause
exit /b 0
