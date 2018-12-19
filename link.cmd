@echo off
setlocal
rem Created:     2016/08/17 00:00:00
rem Last Change: 2018/12/19 12:49:50.

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
set batch_path=%~dp0
pushd %batch_path%

echo ^>^> Start set link

rem "NeoVim" �ݒ�

set dist_init=%homepath%"\AppData\Local\nvim\"
set srce_init=%homepath%"\dotfiles\nvim\"

rmdir %dist_init%
mklink /d %dist_init% %srce_init% > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> *.nvim copy success!
    )

rem "NyaoVim" �ݒ�
echo %batch_path%
set dist_html=%homepath%"\AppData\Roaming\NyaoVim\nyaovimrc.html"
set srce_html=%batch_path%".nyaovimrc.html"
set dist_dot_html=%batch_path%"\AppData\Roaming\NyaoVim\"
set srce_dot_html=%batch_path%"\dotfiles\nyaovim\nyaovimrc.html"

rem set dist_html=%homepath%"\AppData\Roaming\NyaoVim\nyaovimrc.html"
rem set srce_html=%homepath%"\dotfiles\.nyaovimrc.html"
rem set dist_dot_html=%homepath%"\AppData\Roaming\NyaoVim\"
rem set srce_dot_html=%homepath%"\dotfiles\nyaovim\nyaovimrc.html"

if exist %dist_html% (
    del %dist_html%
    )
rem copy %srce_dot_html% %dist_dot_html%
mklink %dist_html% %srce_html%
rem copy %srce_html% %dist_html%
if %ERRORLEVEL% == 0 (
echo ^>^> nyaovimrc.html link success!
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
        ) else if %%j == .nyaovimrc.html (
            rem echo ignore6 %%j  rem �����ȁI
        ) else (
            mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j > nul 2>&1
        )
    )

echo ^>^> End set link

popd
endlocal

rem pause
exit /b 0

