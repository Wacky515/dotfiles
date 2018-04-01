@echo off
rem Last Change: 2018/04/02 08:56:50.

rem TODO: 常時管理者として実行する
rem TODO: "init.vim"、"ginit.vim" シンボリックリンクの
rem ソースのパスが変数化できない為、"copy"で暫定対応

rem DONE: ginit.vim コピー後、)の使い方が誤っています エラーになる

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

set NVIM_PATH=%HOMEPATH%"\AppData\Local\nvim"
echo ^>^> Start set link

rem "NeoVim" 設定
rem NG: %HOMEPATH%\AppData\Local の nvim をシンボリックリンクにしてはどうか？

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

rem "NyaoVim" 設定
if exist %HOMEPATH%"\AppData\Roaming\NyaoVim" (
    mklink %HOMEPATH%"\AppData\Roaming\NyaoVim\nyaovimrc.html" ".\dotfiles\nyaovimrc.html" > nul 2>&1
    if %ERRORLEVEL% == 0 (
        echo nyaovimrc.html link success!
        )
    )

rem  "dotfiles" 設定
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
    rem echo ignore1 %%j :消すな！
    ) else if %%j == .gitconfig (
    rem echo ignore2 %%j :消すな！
    ) else if %%j == .zsh_history (
    rem echo ignore3 %%j :消すな！
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
