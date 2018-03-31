@echo off
rem Last Change: 2018/03/31 22:45:19.

rem TODO: 常時管理者として実行する

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

set NVIM_PATH=%HOMEPATH%"\AppData\Local\nvim"
echo ^>^> Start set link

rem "NeoVim" 設定
rem TODO: "init.vim"、"ginit.vim" シンボリックリンクの
rem ソースのパスが変数化できない為、"copy"で暫定対応
copy init.vim %NVIM_PATH%
if %ERRORLEVEL% == 0 (
    echo init.vim link success!
    )
copy ginit.vim %NVIM_PATH%
if %ERRORLEVEL% == 0 (
    echo ginit.vim link success!
    )

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
