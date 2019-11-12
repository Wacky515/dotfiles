@echo off
setlocal
rem Created:     2016/08/17 **:**:**
rem Last Change: 2019/11/12 12:23:23.

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
rem "NeoVim" インストール済みかチェック
nvim -v > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Not install NeoVim
    goto instnyao
)

set src_nvim=%homepath%\dotfiles\nvim\
if defined xdg_config_home (
    echo ^>^> Set NeoVim in XDG CONFIG HOME
    rmdir /s /q %xdg_config_home%\nvim\ > nul 2>&1
    rem set dst_nvim=%xdg_config_home%\nvim\
    rem set dst_nvim=nvim\
    set dst_nvim=%xdg_config_home%
    goto instneo
) else (
    echo ^>^> Set NeoVim in Local AppData
    rmdir /s /q %localappdata%\nvim\ > nul 2>&1
    set dst_nvim=%localappdata%\nvim\
    goto instneo
)

:instneo
rem rmdir /s /q %dst_nvim%
mklink /d %dst_nvim% %src_nvim% > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> init.vim、ginit.vim copy success!
) else (
    echo ^>^> init.vim、ginit.vim copy failed: %errorlevel%
)
pause
:instnyao
rem "NyaoVim" 設定
set src_html=%batch_path%\nyaovimrc.html
set dst_html=%homepath%\AppData\Roaming\NyaoVim\nyaovimrc.html

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
set src_json=%batch_path%\config.tsx
set dst_json=%homepath%\AppData\Roaming\Oni\config.tsx

if exist %dst_json% (
    del %dst_json%
)
mklink %dst_json% %src_json% > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> tsconfig.json link success!
) else (
    echo ^>^> Not install OniVim
)

rem ".gitconfig" 設定
mklink %homepath%\.gitconfig .\dotfiles\.gitconfig > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> .gitconfig link success!
)
mklink %homepath%\.gitconfig.os .\dotfiles\.gitconfig.windows > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> .gitconfig.os link success!
)

rem ".vim" 設定
mklink /d %homepath%\.vim .\dotfiles\.vim > nul 2>&1
if %errorlevel% == 0 (
    echo ^>^> .vim link success!
)

rem "mklink" 時にスキップするドットファイル
for %%j in (.*) do (
    if %%j == .bash_history (
        rem PASS
    ) else if %%j == .gitconfig (
        rem PASS
    ) else if %%j == .gitconfig.linux (
        rem PASS
    ) else if %%j == .gitconfig.windows (
        rem PASS
    ) else if %%j == .zsh_history (
        rem PASS
    ) else (
        mklink %homepath%\%%j .\dotfiles\%%j > nul 2>&1
    )
)

echo ^>^> End set link

popd
endlocal

rem pause
exit /b 0
