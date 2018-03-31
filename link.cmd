<<<<<<< HEAD
@echo off

rem "link.cmd" がある "Dir" に "cd"
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
=======
@echo off
rem Last Change: 2018/03/27 11:21:49.
rem TODO: "init.vim" のシンボリックリンクソースのパスが変数化できない

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Start set link

mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo .gitconfig link success!
    rem echo This PC name: %COMPUTERNAME%{{{
    rem for /f "delims=" %%i in (C:.\murata_pc.txt) do (
    rem rem for /f "delims=" %%i in (C:.\xacti_pc.txt) do (
    rem     echo In office PC: %%i
    rem     if /i %%i == %COMPUTERNAME% (
    rem         goto set_proxy
    rem         )
    rem     )
    rem echo "In normal network"
    rem     goto mk_sylink
    rem ) else (
    rem     goto mk_sylink
    )

rem :set_proxy
rem echo "In proxy, set proxy"

rem git config --system http.proxy http://m6prxy1:8080
rem git config --system https.proxy https://m6prxy1:8080
rem git config --system http.proxy http://proxy.intra.xacti-co.com:8080 rem {{{
rem git config --system https.proxy https://proxy.intra.xacti-co.com:8080
rem }}}

rem :mk_sylink
for %%j in (.*) do (
    if %%j == .bash_history (
    rem echo ignore1 %%j
    ) else if %%j == .gitconfig (
    rem echo ignore2 %%j
    ) else if %%j == .zsh_history (
    rem echo ignore3 %%j
    ) else (
    mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j > nul 2>&1
    if %ERRORLEVEL% == 0 (
        echo Set link %%j
        )
    )
)
mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim" > nul 2>&1
    if %ERRORLEVEL% == 0 (
        echo Set link .vim
        )

rem "NeoVim" 設定
rem if not exist %HOMEPATH%"\.config\nvim" (
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
rem FIXME: ↑ リンク元のパスがリンク先のパスと合体する
rem >>> HERE
rem mklink %HOMEPATH%"\.config\nvim\init.vim" "C:\Users\mm12167\dotfiles\init.vim"
rem mklink %HOMEPATH%"\.config\nvim\ginit.vim" "C:\Users\mm12167\dotfiles\.gvimrc"
rem <<<

echo ^>^> End set link

pause
exit /b 0
>>>>>>> 72c4cc83ddb65250cf21f808cb6cebf25542a8f7
