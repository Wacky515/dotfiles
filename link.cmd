@echo off
setlocal
rem Created:     2016/08/17 00:00:00
rem Last Change: 2018/12/19 12:49:50.

rem DONE: "init.vim"、"ginit.vim" シンボリックリンクの
    rem ソースのパスが変数化できない為、"copy"で暫定対応
rem ↑ "NyaoVim" も・・・
    rem 対策版TEST

rem DONE: 常時管理者として実行する
rem DONE: ginit.vim コピー後、)の使い方が誤っています エラーになる

set batch_title=Make dotfiles
title %batch_title%

whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set batch_path=%~dp0
pushd %batch_path%

echo ^>^> Start set link

rem "NeoVim" 設定

set dist_init=%homepath%"\AppData\Local\nvim\"
set srce_init=%homepath%"\dotfiles\nvim\"

rmdir %dist_init%
mklink /d %dist_init% %srce_init% > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> *.nvim copy success!
    )

rem "NyaoVim" 設定
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

rem ".gitconfig" 設定
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
        rem echo ignore1 %%j  rem 消すな！
        ) else if %%j == .gitconfig (
            rem echo ignore2 %%j  rem 消すな！
        ) else if %%j == .zsh_history (
            rem echo ignore3 %%j  rem 消すな！
        ) else if %%j == .gitconfig.windows (
            rem echo ignore4 %%j  rem 消すな！
        ) else if %%j == .gitconfig.linux (
            rem echo ignore5 %%j  rem 消すな！
        ) else if %%j == .nyaovimrc.html (
            rem echo ignore6 %%j  rem 消すな！
        ) else (
            mklink %HOMEPATH%"\"%%j ".\dotfiles\"%%j > nul 2>&1
        )
    )

echo ^>^> End set link

popd
endlocal

rem pause
exit /b 0

