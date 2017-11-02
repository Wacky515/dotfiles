@echo off

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo Start set link

mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig"
if %ERRORLEVEL% == 0 (
    echo .gitconfig link success!

    echo This PC name: %COMPUTERNAME%
    for /f "delims=" %%i in (C:.\office_pc.txt) do (
        echo In office PC: %%i
        if /i %%i == %COMPUTERNAME% (
            goto set_proxy
            )
        )
    echo "In normal network"
        goto end_gitconfig
    ) else (
        goto end_gitconfig
    )

    :set_proxy
    echo "In proxy, set proxy"
    git config --system http.proxy http://proxy.intra.xacti-co.com:8080
    git config --system https.proxy https://proxy.intra.xacti-co.com:8080

    :end_gitconfig
    rem DONE: "for文" にする
    rem mklink %HOMEPATH%"\.ctags" ".\dotfiles\.ctags"{{{
    rem mklink %HOMEPATH%"\.gitignore" ".\dotfiles\.gitignore"
    rem mklink %HOMEPATH%"\.minttyrc" ".\dotfiles\.minttyrc"
    rem mklink %HOMEPATH%"\.zshrc" ".\dotfiles\.zshrc"

    rem mklink %HOMEPATH%"\.vimrc" ".\dotfiles\.vimrc"
    rem mklink %HOMEPATH%"\.gvimrc" ".\dotfiles\.gvimrc"
    rem }}}

    for %%j in (.*) do (
        if %%j == .bash_history (
        rem echo ignore1 %%j
        ) else if %%j == .gitconfig (
        rem echo ignore2 %%j
        ) else if %%j == .zsh_history (
        rem echo ignore3 %%j
        ) else (
        echo Set link %%j
        mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j
        )
    )

    mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim"
    echo End set link

pause
exit /b 0
