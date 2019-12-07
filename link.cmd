@echo off
setlocal enabledelayedexpansion
rem Created:     2016/08/17 **:**:**
rem Last Change: 2019/11/20 16:41:57.

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

echo ^>^> Start set link

rem "NeoVim" �ݒ�
rem "NeoVim" �C���X�g�[���ς݂��`�F�b�N
nvim -v > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Not install NeoVim
    goto ins_nyao
)

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
    echo ^>^> init.vim�Aginit.vim link success!
) else (
    echo ^>^> init.vim�Aginit.vim link failed. code: %errorlevel%
)

:ins_nyao
rem "NyaoVim" �ݒ�
rem FIXME: NyaoVim ���N�����邽�߃L��
rem "NyaoVim" �C���X�g�[���ς݂��`�F�b�N
rem nyaovim -v > nul 2>&1
rem if not %errorlevel% equ 0 (
rem     echo ^>^> Not install NyaoVim
rem     goto ins_oni
rem )

set src_html=%bat_path%\nyaovimrc.html
set dst_html=%userprofile%\AppData\Roaming\NyaoVim\nyaovimrc.html

if exist %dst_html% (
    del %dst_html%
)

rem FIXME: "mklink" ���ƋN�����Ȃ�
rem mklink %dst_html% %src_html%
copy %src_html% %dst_html% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> nyaovimrc.html copy success!
    rem echo ^>^> nyaovimrc.html link success!
) else (
    echo ^>^> nyaovimrc.html copy failed. code: %errorlevel%
    rem echo ^>^> nyaovimrc.html link failed. code: %errorlevel%
)

:ins_oni
rem "OniVim" �ݒ�
rem "OniVim" �C���X�g�[���ς݂��`�F�b�N
oni -h > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Not install OniVim
    goto lnk_git
)

set src_json=%bat_path%\config.tsx
set dst_json=%userprofile%\AppData\Roaming\Oni\config.tsx

if exist %dst_json% (
    del %dst_json%
)

mklink %dst_json% %src_json% > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> tsconfig.json link success!
) else (
    echo ^>^> tsconfig.json link failed. code: %errorlevel%
)

:lnk_git
rem ".gitconfig" �ݒ�
mklink %userprofile%\.gitconfig %bat_path%\.gitconfig > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> .gitconfig link success!
) else (
    echo ^>^> .gitconfig link failed. code: %errorlevel%
)
mklink %userprofile%\.gitconfig.os %bat_path%\.gitconfig.windows > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> .gitconfig.os link success!
) else (
    echo ^>^> .gitconfig.os link failed. code: %errorlevel%
)

rem ".vim" �ݒ�
mklink /d %userprofile%\.vim %bat_path%\.vim > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> .vim link success!
) else (
    echo ^>^> .vim link failed. code: %errorlevel%
)

rem "config.fish" �ݒ�
mklink %userprofile%\.config\fish\config.fish %bat_path%\config.fish > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> config.fish link success!
) else (
    echo ^>^> config.fish link failed. code: %errorlevel%
)

:lnk_dot
rem "mklink" ���ɃX�L�b�v����h�b�g�t�@�C��
for %%j in (.*) do (
    if %%j == .bash_history (
        rem PASS(������)
    ) else if %%j == .gitconfig (
        rem PASS(������)
    ) else if %%j == .gitconfig.linux (
        rem PASS(������)
    ) else if %%j == .gitconfig.windows (
        rem PASS(������)
    ) else if %%j == .zsh_history (
        rem PASS(������)
    ) else if %%j == .oyainputconf (
        rem PASS(������)
    ) else (
        mklink %userprofile%\%%j .\dotfiles\%%j > nul 2>&1
    )
)

echo ^>^> End set link

popd
endlocal

rem pause
exit /b 0
