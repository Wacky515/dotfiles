@echo off
setlocal
rem Created:     2016/08/17 **:**:**
rem Last Change: 2019/09/24 15:02:30.

set batch_title=Make dotfiles
title %batch_title%

rem whoami /PRIV | find "SeLoadDriverPrivilege" > NUL
rem
rem rem 管理者権限ならメイン処理
rem if not errorlevel 1 goto main_routine
rem
rem rem 管理者権限でなければ管理者権限で再起動
rem @powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
rem exit

:main_routine
set batch_path=%~dp0
pushd %batch_path%

echo ^>^> Start set link

rem "NeoVim" 設定
set src_init=%homepath%"\dotfiles\nvim\"
if "%processor_architecture%" equ "x86" (
    set dst_init=%homepath%"\AppData\Local\nvim\"
)
if "%processor_architecture%" equ "AMD64" (
    if %computername% == SALADCARBONX1 (
        set dst_init=%homepath%"\AppData\Local\nvim\"
    ) else (
        if exist %xdg_config_home%\* (
            set dst_init=%xdg_config_home%"\nvim\"
        ) else (
            if not exist %homepath%\AppData\Local\nvim\* (
                mkdir %homepath%\AppData\Local\nvim
            )
            set dst_init=%homepath%\AppData\Local\nvim
        )
    )
)

rmdir /s /q %dst_init%
echo %xdg_config_home%
echo %dst_init%
pause
mklink /d %dst_init% %src_init% > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> init.vim、ginit.vim copy success!
) else (
    echo ^>^> init.vim、ginit.vim copy failed:%errorlevel%
)
pause

rem "NyaoVim" 設定
set src_html=%batch_path%"nyaovimrc.html"
set dst_html=%homepath%"\AppData\Roaming\NyaoVim\nyaovimrc.html"

if exist %dst_html% (
    del %dst_html%
)
rem MEMO: "mklink" だと起動しない
rem mklink %dst_html% %src_html%
copy %src_html% %dst_html% > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> nyaovimrc.html link success!
) else (
    echo ^>^> Not install NyaoVim
)

rem "OniVim" 設定
set src_json=%batch_path%"config.tsx"
set dst_json=%homepath%"\AppData\Roaming\Oni\config.tsx"

if exist %dst_json% (
    del %dst_json%
)
mklink %dst_json% %src_json%
if %errorlevel% == 0 (
    echo ^>^> tsconfig.json link success!
)

rem ".gitconfig" 設定
mklink %homepath%"\.gitconfig" ".\dotfiles\.gitconfig" > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> .gitconfig link success!
)
mklink %homepath%"\.gitconfig.os" ".\dotfiles\.gitconfig.windows" > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> .gitconfig.os link success!
)

rem ".vim" 設定
mklink /d %homepath%"\.vim" ".\dotfiles\.vim" > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> .vim link success!
)

for %%j in (.*) do (
    if %%j == .bash_history (
        rem PASS
    ) else if %%j == .gitconfig (
        rem PASS
    ) else if %%j == .zsh_history (
        rem PASS
    ) else if %%j == .gitconfig.windows (
        rem PASS
    ) else if %%j == .gitconfig.linux (
        rem PASS
    ) else if %%j == .nyaovimrc.html (
        rem PASS
    ) else (
        mklink %homepath%"\"%%j ".\dotfiles\"%%j > nul 2>&1
    )
)

echo ^>^> End set link

popd
endlocal

pause
exit /b 0

