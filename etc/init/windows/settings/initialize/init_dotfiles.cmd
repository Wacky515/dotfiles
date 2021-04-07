@echo off
setlocal enabledelayedexpansion
rem Created:     2018/05/10 19:22:34
rem Last Change: 2021/04/07 15:53:35.

set batch_title=Initialize dotfiles
title %batch_title%

set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

set time_zero_suppress=%time: =0%
set hh=%time_zero_suppress:~0,2%
set mn=%time_zero_suppress:~3,2%
set ss=%time_zero_suppress:~6,2%

set maketime=%yyyy%-%mm%-%dd%_%hh%-%mn%-%ss%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > nul

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
set bat_path=%~dp0
set conf_file=packages_%computername%.config
set conf_path=%onedrive%\仕事\Settings\Chocolatey\
set conf_dept=%userprofile%\dotfiles\etc\init\windows\settings\chocolatey\
set conf_defa=%conf_path%\packages.config

rem rem スクリプトがある "Dir" に "cd"
rem pushd %bat_path%
rem ホームディレクトリに "cd"
pushd %userprofile%

echo ^>^> %batch_title%
echo.
echo #####    ####  ####### ##### ### ##    #####    ### #
echo  #   #  #    # #  #  #  #  #  #   #     #      #   #
echo  #    # #    #    #     #     #   #     #      #
echo  #    # #    #    #     # ##  #   #     # ##   ##
echo  #    # #    #    #     #  #  #   #     #  #     ##
echo  #    # #    #    #     #     #   #     #         #
echo  #   #  #    #    #     #     #   #     #   # #   #
echo #####    ####    ###   ##    ### ##### ######  ####
echo.
echo *** HOW TO INSTALL? ***
echo.
echo See the README for documentation.
echo Licensed under the MIT license.
echo.
echo *** ATTENTION ***
echo.
echo This script can change your entire setup.
echo I recommend to read first. You can even copy commands one by one.
echo.
echo *** NOTE ***
echo.
echo y:    Standard and Standard error output in display
echo l:    Standard and Standard error output in ~/init_dotfile_DATE_TIME.log.
echo test: Not Chocolatey install from *.config
echo       Not install font
echo n:    Abort
echo.
echo Start install [y/n], install with [l]og, or [t]est?

set /p input=
if defined input set input=%input:"=%
if /i "%input%" == "y" (
    set test=0
    set std_disp=0
    goto redirect
)
if /i "%input%" == "l" (
    set test=0
    set std_disp=1
    goto redirect
)
if /i "%input%" == "t" (
    set test=1
    set std_disp=0
    goto redirect
)
goto end

:redirect
if %std_disp% equ 1 (
    call :chk_choco > %userprofile%\init_dotfile_%maketime%.log 2>&1
    goto end
)

:chk_choco
rem "Chocolatey" インストール済みかチェック
echo ^>^> Check installed Chocolatey or not
chocolatey -v > nul 2>&1
if %errorlevel% equ 0 goto inst_must_apps

echo ^>^> Install Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:inst_must_apps
rem 必須パッケージ "cinst"
echo ^>^> Already installed Chocolatey
echo ^>^> Install must apps

echo ^>^> Check installed 7zip or not
7z.exe > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Install 7zip
    cinst -y -r --no-progress 7zip
) else (
    echo ^>^> Already installed 7zip
)

echo ^>^> Check installed Git or not
git --version > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Install Git
    cinst -y -r --no-progress git
) else (
    echo ^>^> Already installed Git
)

echo ^>^> Check installed MEGA sync or not
megasync --version > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Already installed MEGA sync
    goto chk_inst_git
) else (
    echo ^>^> Install MEGA sync

    ping 172.16.84.100 /n 1 > nul 2>&1
    if %errorlevel% equ 0 goto chk_inst_megasync_in_proxy
    cinst -y -r --no-progress megasync
    goto chk_inst_git

    :chk_inst_megasync_in_proxy
    if not exist %homepath%\OneDeive\仕事\ cinst -y -r --no-progress megasync
    echo ^>^> FIELD INSTALL MEGASYNC AUTOMATICALLY, CONNECT WITHOUT PROXY
    pause
    exit /b 0013

    :inst_megasync
    cinst -y -r --no-progress megasync
)

:chk_inst_git
echo ^>^> Check first init or not
if "%~n0" == "init_dotfiles_crlf" (
    if exist "C:\Program Files\Git\bin\git.exe" goto git_clone
    echo ^>^> Not install Git first init
) else (
    echo ^>^> Not first init
)

echo ^>^> Check installed Git or not 2nd time
REM FIXME: 最初回は判別不可能なご様子、当バッチの再実行必要
git --version > nul 2>&1
if %errorlevel% equ 0 goto git_clone
echo ^>^> Try install git
cinst -y -r --no-progress git

echo ^>^> Check installed Git or not 3rd time
REM FIXME: 最初回は判別不可能なご様子、当バッチの再実行必要
git --version > nul 2>&1
if %errorlevel% equ 0 goto git_clone
echo ^>^> FAILED INSTALL GIT AUTOMATICALLY, ABORT THIS SCRIPT!
pause
exit /b 0015

:git_clone
pushd %userprofile%
echo ^>^> Installed Git, Check Git clone or not
if not exist %userprofile%\dotfiles\.git\ (
        echo ^>^> Git clone not yet, clone first
        if exist %userprofile%\dotfiles\ (
            rmdir /s /q %userprofile%\dotfiles\
            )
        del /f /q %userprofile%\.gitconfig* > nul 2>&1
        git clone --quiet --depth 1 https://github.com/Wacky515/dotfiles.git
        if %errorlevel% equ 1 (
            echo ^>^> FAILED GIT CLONE, ABORT THIS SCRIPT!
            pause
            exit /b 0020
            ) else (
                echo ^>^> Success Git clone
                )
        ) else (
            echo ^>^> Already Git clone
            )

rem link.cmd 実行
pushd %userprofile%\dotfiles\
call link.cmd

rem Proxy環境か確認
ping 172.16.84.100 /n 1 > nul 2>&1
if %errorlevel% equ 0 goto cp_rd
ping 10.0.1.1 /n 1 > nul 2>&1
if %errorlevel% equ 0 goto cp_nas

echo ^>^> Check exist "Settings" or not
if exist %userprofile%\OneDrive\仕事\Settings\Wallpaper\ (
    echo ^>^> Already exist "Settings", Install apps
    goto chk_init_apps
)
echo ^>^> Not exist "Settings"
goto dl_mega

:chk_init_apps
echo ^>^> Check exist "InitApps" or not
if exist %userprofile%\OneDrive\仕事\InitApps\x64\ (
    echo ^>^> Already exist "InitApps", Install apps
    goto install_apps
)
echo ^>^> Not exist "InitApps"

:cp_rd
rem Rドライブをコピー
echo ^>^> In proxy
if not exist %userprofile%\OneDrive\仕事\Settings\ (
    echo ^>^> Copy "Settngs" from R Drive
    mkdir %userprofile%\OneDrive\仕事\Settings\
    net use v: /delete > nul 2>&1
    net use v: \\M5FSV01\HONSHAB\E2M0\E2M-4\【秘】-E2M4-1\10.個人ファイル\Wakita\仕事\Settings
    robocopy /s /e /np /njh /njs v: %userprofile%\OneDrive\仕事\Settings\
    net use v: /delete > nul 2>&1
)

if not exist %userprofile%\OneDrive\仕事\InitApps\ (
    echo ^>^> Copy "InitApps" from R Drive
    mkdir %userprofile%\OneDrive\仕事\InitApps\
    net use w: /delete > nul 2>&1
    net use w: \\M5FSV01\HONSHAB\E2M0\E2M-4\【秘】-E2M4-1\10.個人ファイル\Wakita\仕事\InitApps
    robocopy /s /e /np /njh /njs w: %userprofile%\OneDrive\仕事\InitApps\
    net use w: /delete > nul 2>&1
)
goto install_apps

:cp_nas
echo ^>^> In home network, connect NAS
set nas_settings=\\SaladStationII\share\仕事\Settings
set nas_initapps=\\SaladStationII\share\仕事\InitApps
set /a result_nas_copy=0
set /a con_stg_time=0

echo ^>^> Copy "Settings" from NAS
net use t: /delete > nul 2>&1

:com_settings
set /a con_stg_time+=1
net use t: %nas_settings% /user:admin
echo ^>^> Con times: %con_stg_time%
echo ^>^> Com exit code: %errorlevel%
if %con_stg_time% geq 3 (
    echo ^>^> FAIL INPUT PASSWORD OVER 3 TIMES, ABORT THIS SCRIPT!
    goto end
)
if %errorlevel% neq 0 goto com_settings

robocopy /s /e /ns /nc /nfl /ndl /np /njh t: %userprofile%\OneDrive\仕事\Settings\
echo ^>^> Robocopy exit code: %errorlevel%
if %errorlevel% leq 1 (
    echo ^>^> Success copy "Settings"
) else (
    echo ^>^> FAILED COPY "SETTINGS"
    set /a result_nas_copy+=1
)
net use t: /delete > nul 2>&1

set /a con_ita_time=0
echo ^>^> Copy "InitApps" from NAS
net use u: /delete > nul 2>&1

:com_initapps
set /a con_ita_time+=1
net use u: %nas_initapps% /user:admin
echo ^>^> Con times: %con_ita_time%
echo ^>^> Com exit code: %errorlevel%
if %con_ita_time% geq 3 (
    echo ^>^> FAIL INPUT PASSWORD OVER 3 TIMES, ABORT THIS SCRIPT!
    goto end
)
if %errorlevel% neq 0 goto com_initapps

robocopy /s /e /ns /nc /nfl /ndl /np /njh u: %userprofile%\OneDrive\仕事\InitApps\
echo ^>^> Robocopy exit code: %errorlevel%
if %errorlevel% leq 1 (
    echo ^>^> Success copy "InitApps"
    net use u: /delete > nul 2>&1
    goto install_apps
) else (
    echo ^>^> FAILED COPY "INITAPPS"
    set /a result_nas_copy+=2
    net use u: /delete > nul 2>&1
)
if %result_nas_copy% neq 0 (
goto dl_mega
) else (
    goto install_apps
)

:dl_mega
echo ^>^> Not in proxy, download MEGA sync
if exist %userprofile%\OneDrive\仕事\Settings\ (
    rmdir /s %userprofile%\OneDrive\仕事\Settings\
)
echo ^>^> Please download "Settings" folder manually, then any key in
start https://mega.nz/#F!ubhxia6L
pause

"C:\Program Files\7-Zip\7z.exe" x -y -o%userprofile%\OneDrive\仕事\ %userprofile%\OneDrive\仕事\Settings.zip
if exist %userprofile%\OneDrive\仕事\Settings\ (
    echo ^>^> Success set "Settings" manually
) else (
    echo ^>^> FAILED SET "SETTINGS" MANUALLY, ABORT THIS SCRIPT!
    pause
    goto end
)

if exist %userprofile%\OneDrive\仕事\InitApps\ (
    rmdir /s %userprofile%\OneDrive\仕事\InitApps\
)

echo ^>^> Please download "InitApps" folder manually, then any key in
start https://mega.nz/#F!yTATTABQ
pause

"C:\Program Files\7-Zip\7z.exe" x -y -o%userprofile%\OneDrive\仕事\ %userprofile%\OneDrive\仕事\InitApps.zip
if %errorlevel% equ 0 (
    echo ^>^> Success copy "InitApps" manually
) else (
    echo ^>^> FAILED COPY "INITAPPS" MANUALLY, ABORT THIS SCRIPT!
    goto end
)
goto install_apps

:install_apps
rem "*.config" のある "Dir" に "pushd"
pushd %conf_path%

echo ^>^> Install apps by Chocolatey
rem ---------------------------------------------------------------------------
rem Test時 スキップ
rem ---------------------------------------------------------------------------
if %test% equ 1 goto instll_all
rem "*_packages_*.config" を読み込み、インストール
if exist %conf_file% (
    echo ^>^> Install apps for this PC
    for %%i in (%conf_file%) do (
        cinst -y -r --no-progress %%i
    )
) else (
    pushd %conf_dept%
    echo ^>^> Setting default parameter
    cinst -y -r --no-progress %conf_defa%
)
echo ^>^> Update Chocolatey
cup all -y -r --no-progress
rem ---------------------------------------------------------------------------

:install_all
rem 再度スクリプトがある "Dir" に "pushd"
rem MEMO: "init_dotfiles" で実行されている場合があるので絶対パス指定
pushd %userprofile%\dotfiles\etc\init\windows\settings\initialize\

rem "git\init\settings" と "(~|R:*)\仕事\Settings" の "setting_*.cmd" 実行
call sub_install_all.cmd
rem pause

rem ホームディレクトリに *.7z で圧縮したアプリを展開
call sub_install_app.cmd
rem pause

call sub_setting_all.cmd
rem pause

echo ^>^> Chocolatey update
cup all -y
rem pause

rem ---------------------------------------------------------------------------
rem Test時 スキップ
rem ---------------------------------------------------------------------------
if %test% equ 1 goto erase
call sub_install_font.cmd
rem ---------------------------------------------------------------------------

:erase
echo ^>^> Erase temp data
rem if exist %userprofile%\init_dotfiles\ (
rem     echo ^>^> Del init_dotfiles
rem     rmdir /s /q %userprofile%\init_dotfiles > nul 2>&1
rem )

if exist %userprofile%\OneDrive\仕事\Settings.zip (
    echo ^>^> Del Settings.zip
    del %userprofile%\OneDrive\仕事\Settings.zip > nul 2>&1
)

if exist %userprofiley%\OneDrive\仕事\InitApps.zip (
    echo ^>^> Del InitApps.zip
    del %userprofile%\OneDrive\仕事\InitApps.zip > nul 2>&1
)

call %userprofile%\OneDrive\仕事\InitApps\Batch\empty.cmd > nul 2>&1

rem link.cmd 実行
rem pushd %userprofile%\dotfiles\
rem call link.cmd

rem Chocolatey update
call %userprofile%\dotfiles\etc\init\windows\settings\chocolatey\init_and_update_chocolatey.cmd

echo *** CAUTION: AUTOMATICALLY RESTART PC, KEY INPUT AFTER 60sec ***
pause
shutdown.exe -r -t 60
endlocal
popd

exit /b 0

:end
if %std_disp% equ 0 (
    pause
)

endlocal
popd

exit /b 0
