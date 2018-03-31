@echo off
rem Last Change: 2018/03/31 22:42:57.

rem TODO: �펞�Ǘ��҂Ƃ��Ď��s����

rem  �X�N���v�g������ "Dir" �� "cd"
cd /d %~dp0

set NVIM_PATH=%HOMEPATH%"\AppData\Local\nvim"
echo ^>^> Start set link

rem "NeoVim" �ݒ�
rem TODO: "init.vim"�A"ginit.vim" �V���{���b�N�����N��
rem �\�[�X�̃p�X���ϐ����ł��Ȃ��ׁA"copy"�Ŏb��Ή�
copy init.vim %NVIM_PATH%
if %ERRORLEVEL% == 0 (
    echo init.vim link success!
    )
copy ginit.vim %NVIM_PATH%
if %ERRORLEVEL% == 0 (
    echo ginit.vim link success!
    )

rem if not exist %HOMEPATH%"\.config\nvim" ( rem {{{
    rem     mkdir %HOMEPATH%"\.config\nvim"
    rem     )
rem mklink %HOMEPATH%"\.config\nvim\init.vim" ".\dotfiles\init.vim" > nul 2>&1
rem if %ERRORLEVEL% == 0 (
    rem     echo Set link init.vim
    rem     )
rem mklink %HOMEPATH%"\.config\nvim\ginit.vim" ".\dotfiles\.gvimrc" > nul 2>&1
rem if %ERRORLEVEL% == 0 (
    rem     echo Set link ginit.vim
    rem     )
rem FIXME: �� �����N���̃p�X�������N��̃p�X�ƍ��̂���
rem >>> HERE
rem mklink %HOMEPATH%"\.config\nvim\init.vim" "C:\Users\mm12167\dotfiles\init.vim"
rem mklink %HOMEPATH%"\.config\nvim\ginit.vim" "C:\Users\mm12167\dotfiles\.gvimrc"
rem <<<
rem }}}

mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo .gitconfig link success!
    )

rem :mk_sylink
for %%j in (.*) do (
    if %%j == .bash_history (
    ) else if %%j == .gitconfig (
    ) else if %%j == .zsh_history (
    ) else (
        mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j > nul 2>&1
        if %ERRORLEVEL% == 0 (
            echo %%j link success!
            )
        )
    )

mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo .vim link success!
    )

echo ^>^> End set link

pause
exit /b 0
