@echo off
setlocal enabledelayedexpansion
rem Created:     2016/08/17 **:**:**
rem Last Change: 2020/11/04 17:40:47.

set batch_title=Make dotfiles
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

echo ^>^> Start set links dotfiles to homepath

rem "NeoVim" �ݒ�
rem "NeoVim" �C���X�g�[���ς݂��`�F�b�N
echo ^>^> Check install NeoVim or not
rem nvim -v > nul 2>&1
rem if %errorlevel% equ 0 (
if exist C:\tools\neovim\Neovim\bin\nvim-qt.exe (
    echo ^>^> Installed NeoVim
    set src_nvim=%userprofile%\dotfiles\nvim\
    if defined xdg_config_home (
        echo ^>^> Set NeoVim in XDG CONFIG HOME
        set dst_nvim=%xdg_config_home%\nvim\
    ) else (
        echo ^>^> Set NeoVim in Local AppData
        set dst_nvim=%localappdata%\nvim\
    )

    rem mklink /d %dst_nvim% %src_nvim% > nul 2>&1
    mklink /d %dst_nvim% %src_nvim%
    mklink /d %userprofile%\.vim %bat_path%\.vim > nul 2>&1

    if %errorlevel% equ 0 (
        echo ^>^> init.vim�Aginit.vim link success!
    ) else (
        echo ^>^> FAILED LINK INIT.VIM�AGINIT.VIM, ERROR CODE: %errorlevel%
    )
) else (
    echo ^>^> NOT INSTALLED NEOVIM, SKIP LINK
)

:ins_nyao
rem "NyaoVim" �ݒ�
rem "NyaoVim" �C���X�g�[���ς݂��`�F�b�N
echo ^>^> Check install NyaoVim or not
if exist %userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html (
    echo ^>^> Installed NyaoVim
    echo ^>^> Set link NyaoVim
    set src_html=%bat_path%\nyaovimrc.html
    set dst_html=%userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html

    rem if exist %dst_html% (
    rem     del %dst_html%
    rem )

    rem FIXME: "mklink" ���ƋN�����Ȃ�
    rem mklink %dst_html% %src_html%
    copy %src_html% %dst_html% > nul 2>&1
    if %errorlevel% equ 0 (
        rem echo ^>^> Success nyaovimrc.html link
        echo ^>^> Success nyaovimrc.html copy
    ) else (
        rem echo ^>^> FAILED LINK NYAOVIMRC.HTML, ERROR CODE: %errorlevel%
        echo ^>^> FAILED COPY NYAOVIMRC.HTML, ERROR CODE: %errorlevel%
    )
) else (
    echo ^>^> NOT INSTALLED NYAOVIM, SKIP LINK
)

:ins_oni
rem "OniVim" �ݒ�
rem rem "OniVim" �C���X�g�[���ς݂��`�F�b�N
echo ^>^> Check install OniVim or not
if exist %programfiles(x86)%Oni\Oni.exe (
    echo ^>^> Installed OniVim
    echo ^>^> Set link OniVim
    set src_json=%bat_path%\config.tsx
    set dst_json=%userprofile%\AppData\Roaming\Oni\config.tsx

    if exist %dst_json% (
        del /f /q %dst_json%
    )

    mklink %dst_json% %src_json% > nul 2>&1
    if %errorlevel% equ 0 (
        echo ^>^> success link tsconfig.json
    ) else (
        echo ^>^> FAILED LINK TSCONFIG.JSON, ERROR CODE: %errorlevel%
    )
) else (
    echo ^>^> NOT INSTALLED ONIVIM, SKIP LINK
    goto lnk_git
)

:lnk_git
rem ".gitconfig" �ݒ�
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

rem ".vim" �ݒ�
mklink /d %userprofile%\.vim %bat_path%\.vim > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success .vim link
) else (
    echo ^>^> FAILED LINK .VIM, ERROR CODE: %errorlevel%
)

rem "config.fish" �ݒ�
mklink %userprofile%\.config\fish\config.fish %bat_path%\config.fish > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Success config.fish link
) else (
    echo ^>^> FAILED LINK CONFIG.FISH, ERROR CODE: %errorlevel%
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

echo ^>^> End set link

popd
endlocal

pause
exit /b 0
