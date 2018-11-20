@echo off
rem Created:     2016/08/17 00:00:00
rem Last Change: 2018/11/17 09:49:26.

rem TODO: �펞�Ǘ��҂Ƃ��Ď��s����
rem TODO: "init.vim"�A"ginit.vim" �V���{���b�N�����N��
rem �\�[�X�̃p�X���ϐ����ł��Ȃ��ׁA"copy"�Ŏb��Ή�
rem �� "NyaoVim" ���E�E�E

rem DONE: ginit.vim �R�s�[��A)�̎g����������Ă��܂� �G���[�ɂȂ�

rem  �X�N���v�g������ "Dir" �� "cd"
pushd %~dp0

set NVIM_PATH=%HOMEPATH%"\AppData\Local\nvim"
echo ^>^> Start set link

rem "NeoVim" �ݒ�
rem NG: %HOMEPATH%\AppData\Local �� nvim ���V���{���b�N�����N�ɂ��Ă͂ǂ����H

if exist %NVIM_PATH% (
    copy init.vim %NVIM_PATH%
    if %ERRORLEVEL% == 0 (
        echo ^>^> init.vim copy success!
        )
    copy ginit.vim %NVIM_PATH%
    if %ERRORLEVEL% == 0 (
        echo ^>^> ginit.vim copy success!
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
rem     mklink %HOMEPATH%"\AppData\Roaming\NyaoVim\nyaovimrc.html" ".\dotfiles\nyaovimrc.html" > nul 2>&1
    copy nyaovimrc.html %HOMEPATH%"\AppData\Roaming\NyaoVim\"
    if %ERRORLEVEL% == 0 (
        echo ^>^> nyaovimrc.html link success!
        )
    )

rem  ".gitconfig" �ݒ�
mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> .gitconfig link success!
    )
mklink %HOMEPATH%"\.gitconfig.os" ".\dotfiles\.gitconfig.windows" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> .gitconfig.os link success!
    )

rem :mk_sylink
mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> .vim link success!
    )

for %%j in (.*) do (
    if %%j == .bash_history (
        rem echo ignore1 %%j :�����ȁI
    ) else if %%j == .gitconfig (
        rem echo ignore2 %%j :�����ȁI
    ) else if %%j == .zsh_history (
        rem echo ignore3 %%j :�����ȁI
    ) else if %%j == .gitconfig.windows (
        rem echo ignore4 %%j :�����ȁI
    ) else if %%j == .gitconfig.linux (
        rem echo ignore5 %%j :�����ȁI
    ) else (
        mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j
        rem "echo" ���\������Ȃ�
        rem mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j > nul 2>&1
        rem if %ERRORLEVEL% == 0 (
        rem     echo Set link %%j
        rem     )
    )
)

echo ^>^> End set link

popd
rem pause
exit /b 0

