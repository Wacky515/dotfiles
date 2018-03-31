@echo off

rem "link.cmd" ‚ª‚ ‚é "Dir" ‚É "cd"
cd /d %~dp0

echo "Start set link"

mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig"
rem echo %ERRORLEVEL%
if %ERRORLEVEL% == 0 (
        echo ".gitconfig link success!"
        echo This PC name: %COMPUTERNAME%
        for /f "delims=" %%i in (C:.\xacti_pc.txt) do (
            echo In office PC: %%i
            if /i %%i == %COMPUTERNAME% (
                goto set_proxy
                )
            )
        echo "In normal network"
        goto end_gitconfig) else (
            goto end_gitconfig
            )

    :set_proxy
    echo "In proxy, set proxy"
    rem git config --list
    git config --system http.proxy http://proxy.intra.xacti-co.com:8080
    git config --system https.proxy https://proxy.intra.xacti-co.com:8080

    :end_gitconfig

    mklink %HOMEPATH%"\.gitignore" ".\dotfiles\.gitignore"
    mklink %HOMEPATH%"\.zshrc" ".\dotfiles\.zshrc"

    mklink %HOMEPATH%"\.vimrc" ".\dotfiles\.vimrc"
    mklink %HOMEPATH%"\.gvimrc" ".\dotfiles\.gvimrc"
    mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim"

    echo End set link
    pause

    exit 0
