@echo off
rem Last Change: 2018/04/02 08:56:50.

rem TODO: �펞�Ǘ��҂Ƃ��Ď��s����
rem TODO: "init.vim"�A"ginit.vim" �V���{���b�N�����N��
rem �\�[�X�̃p�X���ϐ����ł��Ȃ��ׁA"copy"�Ŏb��Ή�

rem DONE: ginit.vim �R�s�[��A)�̎g����������Ă��܂� �G���[�ɂȂ�

rem  �X�N���v�g������ "Dir" �� "cd"
cd /d %~dp0

set NVIM_PATH=%HOMEPATH%"\AppData\Local\nvim"
echo ^>^> Start set link

rem "NeoVim" �ݒ�
rem NG: %HOMEPATH%\AppData\Local �� nvim ���V���{���b�N�����N�ɂ��Ă͂ǂ����H

if exist %NVIM_PATH% (
    copy init.vim %NVIM_PATH%
    if %ERRORLEVEL% == 0 (
        echo init.vim copy success!
        )
    copy ginit.vim %NVIM_PATH%
    if %ERRORLEVEL% == 0 (
        echo ginit.vim copy success!
        )
    )
rem NG: rem {{{
rem mklink /D %HOMEPATH%"\AppData\Local\nvim" ".\dotfiles\nvim" > nul 2>&1
rem if %ERRORLEVEL% == 0 (
rem     echo nvim link success!
rem )
rem }}}

rem "NyaoVim" �ݒ�
if exist %HOMEPATH%"\AppData\Roaming\NyaoVim" (
    mklink %HOMEPATH%"\AppData\Roaming\NyaoVim\nyaovimrc.html" ".\dotfiles\nyaovimrc.html" > nul 2>&1
    if %ERRORLEVEL% == 0 (
        echo nyaovimrc.html link success!
        )
    )

rem  "dotfiles" �ݒ�
mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo .gitconfig link success!
    )

rem :mk_sylink
mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo .vim link success!
    )

for %%j in (.*) do (
    if %%j == .bash_history (
    rem echo ignore1 %%j :�����ȁI
    ) else if %%j == .gitconfig (
    rem echo ignore2 %%j :�����ȁI
    ) else if %%j == .zsh_history (
    rem echo ignore3 %%j :�����ȁI
    ) else (
    mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j > nul 2>&1
    if %ERRORLEVEL% == 0 (
        echo Set link %%j
        )
    )
)

echo ^>^> End set link

pause
exit /b 0
