@echo off
setlocal
rem Created:     2016/08/17 00:00:00
rem Last Change: 2018/12/18 11:42:44.

rem DONE: "init.vim"�A"ginit.vim" �V���{���b�N�����N��
    rem �\�[�X�̃p�X���ϐ����ł��Ȃ��ׁA"copy"�Ŏb��Ή�
rem �� "NyaoVim" ���E�E�E
    rem �΍���TEST

rem DONE: �펞�Ǘ��҂Ƃ��Ď��s����
rem DONE: ginit.vim �R�s�[��A)�̎g����������Ă��܂� �G���[�ɂȂ�

set batch_title=Make dotfiles
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem �Ǘ��Ҍ����Ȃ烁�C������
if not errorlevel 1 goto main_routine

rem �Ǘ��Ҍ����łȂ���ΊǗ��Ҍ����ōċN��
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
pushd %~dp0

set NVIM_PATH=%HOMEPATH%"\AppData\Local\nvim"
set dist_init=%homepath%"\AppData\Local\nvim\"
set srce_init=%homepath%"\dotfiles\nvim\"

echo ^>^> Start set link

rem "NeoVim" �ݒ�
if not exist %NVIM_PATH% (
    mklink /d %dist_init% %srce_init% > nul 2>&1
    if %ERRORLEVEL% == 0 (
        echo ^>^> *.nvim copy success!
    )
rem if exist %NVIM_PATH% (  rem {{{
    rem mklink %NVIM_PATH%"\init.nvim" %homepath%"\dotfiles\init.nvim" > nul 2>&1
    rem if %ERRORLEVEL% == 0 (
    rem     echo ^>^> init.vim copy success!
    rem     )
    rem rem mklink %NVIM_PATH%"\ginit.nvim" %homepath%"\dotfiles\ginit.nvim" > nul 2>&1
    rem if %ERRORLEVEL% == 0 (
    rem     echo ^>^> ginit.vim copy success!
    rem     )
    rem )
rem }}}

rem "NyaoVim" �ݒ�
if exist %HOMEPATH%"\AppData\Roaming\NyaoVim" (
    mklink %HOMEPATH%"\AppData\Roaming\NyaoVim\nyaovimrc.html" ".\dotfiles\nyaovimrc.html" > nul 2>&1
    rem copy nyaovimrc.html %HOMEPATH%"\AppData\Roaming\NyaoVim\"
    if %ERRORLEVEL% == 0 (
        echo ^>^> nyaovimrc.html link success!
        )
    )

rem ".gitconfig" �ݒ�
mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> .gitconfig link success!
    )
mklink %HOMEPATH%"\.gitconfig.os" ".\dotfiles\.gitconfig.windows" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> .gitconfig.os link success!
    )

rem :mk_sylink
mklink /d %HOMEPATH%"\.vim" ".\dotfiles\.vim" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> .vim link success!
    )

for %%j in (.*) do (
    if %%j == .bash_history (
        rem echo ignore1 %%j  rem �����ȁI
        ) else if %%j == .gitconfig (
            rem echo ignore2 %%j  rem �����ȁI
        ) else if %%j == .zsh_history (
            rem echo ignore3 %%j  rem �����ȁI
        ) else if %%j == .gitconfig.windows (
            rem echo ignore4 %%j  rem �����ȁI
        ) else if %%j == .gitconfig.linux (
            rem echo ignore5 %%j  rem �����ȁI
        ) else (
            mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j > nul 2>&1
        )
    )

echo ^>^> End set link

popd
endlocal

rem pause
exit /b 0

