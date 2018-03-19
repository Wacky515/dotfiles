@echo off
rem Last Change: 2018/03/18 22:10:27.

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Start set link

mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig" > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo .gitconfig link success!

    echo This PC name: %COMPUTERNAME%
    for /f "delims=" %%i in (C:.\murata_pc.txt) do (
    rem for /f "delims=" %%i in (C:.\xacti_pc.txt) do (
        echo In office PC: %%i
        if /i %%i == %COMPUTERNAME% (
            goto set_proxy
            )
        )
    echo "In normal network"
        goto mk_sylink
    ) else (
        goto mk_sylink
    )

:set_proxy
echo "In proxy, set proxy"

git config --system http.proxy http://m6prxy1:8080
git config --system https.proxy https://m6prxy1:8080
rem git config --system http.proxy http://proxy.intra.xacti-co.com:8080 rem {{{
rem git config --system https.proxy https://proxy.intra.xacti-co.com:8080
rem }}}

:mk_sylink
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
if not exist %HOMEPATH%"\.config\nvim" (
    mkdir %HOMEPATH%"\.config\nvim"
    )
rem mklink %HOMEPATH%"\.config\nvim\init.vim" ".\dotfiles\init.vim" > nul 2>&1
    rem if %ERRORLEVEL% == 0 (
    rem     echo Set link init.vim
    rem     )
rem mklink %HOMEPATH%"\.config\nvim\ginit.vim" ".\dotfiles\.gvimrc" > nul 2>&1
    rem if %ERRORLEVEL% == 0 (
    rem     echo Set link ginit.vim
    rem     )
rem FIXME: ↑ リンク元のパスがリンク先のパスと合体する
mklink %HOMEPATH%"\.config\nvim\init.vim" "C:\Users\mm12167\dotfiles\init.vim"
mklink %HOMEPATH%"\.config\nvim\ginit.vim" "C:\Users\mm12167\dotfiles\.gvimrc"

echo ^>^> End set link

pause
exit /b 0
