@echo off
setlocal enabledelayedexpansion
rem Created:     2016/08/17 **:**:**
rem Last Change: 2022/02/03 13:18:32.

set batch_title=Make link dotfiles
title %batch_title%

rem �Ǘ��Ҍ����ŋN�����ꂽ���`�F�b�N
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> Start make symbolic link homepath ^<-^> dotfiles

rem "NeoVim" �̃����N�ݒ�
rem "NeoVim" �C���X�g�[���ς݂��`�F�b�N
echo ^>^> Check install NeoVim or not
nvim -v > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Already installed NeoVim, Judge by -v option
    goto link_nvim
) else if exist C:\tools\neovim\Neovim\bin\nvim-qt.exe (
    echo ^>^> Already installed NeoVim, exist nvim-qt.exe
    goto link_nvim
) else (
    echo ^>^> NOT INSTALLED NEOVIM, SKIP MAKE LINK
    goto jdg_nyao
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
    rem MEMO: �V���{���b�N�����N���ꂽ�f�B���N�g���̍폜�� "rmdir"
    rmdir %dst_nvim%
)

mklink /d %dst_nvim% %src_nvim% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> init.vim, ginit.vim for NeoVim link success
) else (
    echo ^>^> FAILED LINK INIT.VIM, GINIT.VIM FOR NEOVIM
    echo ^>^> ERROR CODE: %errorlevel%
)

:jdg_nyao
rem "NyaoVim" �̃����N�ݒ�
rem "NyaoVim" �C���X�g�[���ς݂��`�F�b�N
echo ^>^> Check install NyaoVim or not
if exist %appdata%\NyaoVim\nyaovimrc.html (
    echo ^>^> Already installed NyaoVim
    goto link_nyao
) else (
    echo ^>^> NOT INSTALLED NYAOVIM, SKIP MAKE LINK
    goto jdg_oni
)

:link_nyao
echo ^>^> Make link NyaoVim
set src_html=%bat_path%\nyaovimrc.html
set dst_html=%appdata%\NyaoVim\nyaovimrc.html

if exist %dst_html% (
    echo ^>^> Delete nyaovimrc.html
    del /f /q %dst_html%
)

rem FIXME: "mklink" ���ƋN�����Ȃ�
rem mklink %dst_html% %src_html% > nul 2>&1
copy %src_html% %dst_html% > nul 2>&1
if %errorlevel% equ 0 (
    rem echo ^>^> nyaovimrc.html link success
    echo ^>^> nyaovimrc.html copy success
) else (
    rem echo ^>^> FAILED LINK NYAOVIMRC.HTML
    rem echo ^>^> ERROR CODE: %errorlevel%
    echo ^>^> FAILED COPY NYAOVIMRC.HTML
    echo ^>^> ERROR CODE: %errorlevel%
)

:jdg_oni
rem "OniVim" �̃����N�ݒ�
rem "OniVim" �C���X�g�[���ς݂��`�F�b�N
rem FIXME: ���Y Dir ���݂��Ȃ��Ă��`�F�b�N�ʂ�H
echo ^>^> Check install OniVim or not
if exist %programfiles(x86)%\Oni\Oni.exe (
    echo ^>^> Already installed OniVim
    goto link_oni
) else (
    echo ^>^> NOT INSTALLED ONIVIM, SKIP MAKE LINK
    goto link_git
)

:link_oni
echo ^>^> Make link OniVim
set src_json=%bat_path%\config.js
set dst_json=%appdata%\Oni\config.js

if exist %dst_json% (
    echo ^>^> Delete config.js
    del /f /q %dst_json%
)

mklink %dst_json% %src_json% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> config.js link success
) else (
    echo ^>^> FAILED LINK CONFIG.JS
    echo ^>^> ERROR CODE: %errorlevel%
)

set src_oni=%userprofile%\dotfiles\nvim\
if defined xdg_config_home (
    echo ^>^> Set OniVim link in XDG CONFIG HOME
    set dst_oni=%xdg_config_home%\nvim\
) else (
    echo ^>^> Set OniVim link in Local AppData
    set dst_oni=%localappdata%\nvim\
)

if exist %dst_oni% (
    echo ^>^> Delete nvim directory
    rem MEMO: �V���{���b�N�����N���ꂽ�f�B���N�g���̍폜�� "rmdir"
    rmdir %dst_oni%
)

mklink /d %dst_oni% %src_oni% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> init.vim, ginit.vim for Oni link success
) else (
    echo ^>^> FAILED LINK INIT.VIM, GINIT.VIM FOR ONI
    echo ^>^> ERROR CODE: %errorlevel%
)

:link_git
echo ^>^> Make link .gitconfig
rem ".gitconfig" �̃����N�ݒ�
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

rem ".vim" �̃����N�ݒ�
echo ^>^> Make link .vim
if exist %userprofile%\.vim\ (
    echo ^>^> Delete .vim directory
    rem MEMO: �V���{���b�N�����N���ꂽ�f�B���N�g���̍폜�� "rmdir"
    rmdir %userprofile%\.vim\
)

mklink /d %userprofile%\.vim\ %bat_path%\.vim\ > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> .vim link success
) else (
    echo ^>^> FAILED LINK .VIM
    echo ^>^> ERROR CODE: %errorlevel%
)

rem "config.fish" �̃����N�ݒ�
echo ^>^> Make link config.fish
mklink %userprofile%\.config\fish\config.fish %bat_path%\config.fish > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> config.fish link success
) else (
    echo ^>^> FAILED LINK CONFIG.FISH
    echo ^>^> ERROR CODE: %errorlevel%
)

rem "pip" �̃����N�ݒ�
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
rem "mklink" ���ɃX�L�b�v����h�b�g�t�@�C��
for %%j in (.*) do (
    if %%j == .bash_history (
        rem ������
        rem pass
    ) else if %%j == .gitconfig (
        rem ������
        rem pass
    ) else if %%j == .gitconfig.linux (
        rem ������
        rem pass
    ) else if %%j == .gitconfig.windows (
        rem ������
        rem pass
    ) else if %%j == .zsh_history (
        rem ������
        rem pass
    ) else if %%j == .oyainputconf (
        rem ������
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
