@echo off
setlocal
rem Created:     2016/08/17 **:**:**
rem Last Change: 2018/12/24 13:49:26.

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
set srce_init=%homepath%"\dotfiles\nvim\"
if "%processor_architecture%" equ "x86" (
        set dist_init=%homepath%"\AppData\Local\nvim\"
        )
if "%processor_architecture%" equ "AMD64" (
    if %computername% == SALADCARBONX1 (
        set dist_init=%homepath%"\AppData\Local\nvim\"
    ) else (
        set dist_init=%xdg_config_home%"\nvim\"
        )
    )

rmdir /s /q %dist_init%
mklink /d %dist_init% %srce_init% > nul 2>&1
if %ERRORLEVEL% == 0 (
    echo ^>^> init.vim、ginit.vim copy success!
    )

rem "NyaoVim" 設定
set dist_html=%homepath%"\AppData\Roaming\NyaoVim\nyaovimrc.html"
set srce_html=%batch_path%"nyaovimrc.html"

if exist %dist_html% (
    del %dist_html%
    )
rem "mklink" だと起動しない
rem mklink %dist_html% %srce_html%
copy %srce_html% %dist_html%
if %ERRORLEVEL% == 0 (
echo ^>^> nyaovimrc.html link success!
)

rem "OniVim" 設定
set dist_json=%homepath%"\AppData\Roaming\Oni\config.tsx"
set srce_json=%batch_path%"config.tsx"
rem set dist_json=%homepath%"\AppData\Roaming\Oni\tsconfig.json"
rem set srce_json=%batch_path%"tsconfig.json"

if exist %dist_json% (
    del %dist_json%
    )
mklink %dist_json% %srce_json%
rem copy %srce_json% %dist_json%
if %ERRORLEVEL% == 0 (
echo ^>^> tsconfig.json link success!
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

