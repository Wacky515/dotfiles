@echo off
setlocal enabledelayedexpansion
rem Created:     2018/05/10 19:22:34
rem Last Change: 2024/12/25 13:07:22.
rem FIXME: 長い行を折り返す

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
set conf_dept=%userprofile%\dotfiles\etc\init\windows\settings\chocolatey\

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
choco -v > nul 2>&1
if %errorlevel% equ 0 (
    echo ^>^> Already installed Chocolatey
    goto inst_must_apps

) else (
    echo ^>^> Install Chocolatey
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

:inst_must_apps
rem 必須パッケージ "choco install"
echo ^>^> Install must apps

echo ^>^> Check installed 7zip or not
7z.exe > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Install 7zip
    choco install -y -r --no-progress 7zip
) else (
    echo ^>^> Already installed 7zip
)

echo ^>^> Check installed Git or not
git --version > nul 2>&1
if not %errorlevel% equ 0 (
    echo ^>^> Install Git
    choco install -y -r --no-progress git
) else (
    echo ^>^> Already installed Git
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
REM FIXME: 最初回は判別不可能なご様子、当バッチの再実行必要 < HBAWS077はできた
git --version > nul 2>&1
if %errorlevel% equ 0 goto git_clone
echo ^>^> Try install git
choco install -y -r --no-progress git

echo ^>^> Check installed Git or not 3rd time
REM FIXME: 最初回は判別不可能なご様子、当バッチの再実行必要 < HBAWS077はできた
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
    if %errorlevel% equ 0 (
        echo ^>^> Success Git clone
    ) else (
        echo ^>^> FAILED GIT CLONE, ABORT THIS SCRIPT!
        pause
        exit /b 0020
    )
) else (
    echo ^>^> Already Git clone
)

rem link.cmd 実行
pushd %userprofile%\dotfiles\
call link.cmd

echo ^>^> Check exist "Settings" or not
if exist %OneDrive%\仕事\Settings\Wallpaper\ (
    echo ^>^> Already exist "Settings", Install apps
    goto chk_init_apps
)
echo ^>^> NOT EXIST "Settings", ABORT

rem rem Proxy環境か確認
rem ping 172.16.199.254 /n 1 > nul 2>&1
rem if %errorlevel% equ 0 goto cp_box
rem ping 192.168.50.1 /n 1 > nul 2>&1
rem if %errorlevel% equ 0 goto cp_nas

pause
exit

rem :cp_box
rem echo ^>^> In proxy
rem if not exist C:\Box\000_MyFolder\Settings\ (
rem     echo ^>^> CHECK BOX DRIVE,ABORT
rem     pause
rem     exit
rem )
rem
rem if not exist C:\Box\000_MyFolder\InitApps\ (
rem     echo ^>^> CHECK BOX DRIVE,ABORT
rem     pause
rem     exit
rem )
rem goto install_apps

rem :cp_nas
rem echo ^>^> In home network, connect NAS
rem set nas_settings=\\SaladStationII\share\仕事\Settings
rem set nas_initapps=\\SaladStationII\share\仕事\InitApps
rem set /a result_nas_copy=0
rem set /a con_stg_time=0
rem
rem echo ^>^> Copy "Settings" from NAS
rem net use t: /delete > nul 2>&1
rem
rem :com_settings
rem set /a con_stg_time+=1
rem net use t: %nas_settings% /user:admin
rem echo ^>^> Con times: %con_stg_time%
rem echo ^>^> Com exit code: %errorlevel%
rem if %con_stg_time% geq 3 (
rem     echo ^>^> FAIL INPUT PASSWORD OVER 3 TIMES, ABORT THIS SCRIPT!
rem     goto end
rem )
rem if %errorlevel% neq 0 goto com_settings
rem
rem robocopy /s /e /ns /nc /nfl /ndl /np /njh t: %OneDrive%\仕事\Settings\
rem echo ^>^> Robocopy exit code: %errorlevel%
rem if %errorlevel% leq 1 (
rem     echo ^>^> Success copy "Settings"
rem ) else (
rem     echo ^>^> FAILED COPY "Settings"
rem     set /a result_nas_copy+=1
rem )
rem net use t: /delete > nul 2>&1
rem
rem set /a con_ita_time=0
rem echo ^>^> Copy "InitApps" from NAS
rem net use u: /delete > nul 2>&1
rem
rem :com_initapps
rem set /a con_ita_time+=1
rem net use u: %nas_initapps% /user:admin
rem echo ^>^> Con times: %con_ita_time%
rem echo ^>^> Com exit code: %errorlevel%
rem if %con_ita_time% geq 3 (
rem     echo ^>^> FAIL INPUT PASSWORD OVER 3 TIMES, ABORT THIS SCRIPT!
rem     goto end
rem )
rem if %errorlevel% neq 0 goto com_initapps
rem
rem robocopy /s /e /ns /nc /nfl /ndl /np /njh u: %OneDrive%\仕事\InitApps\
rem echo ^>^> Robocopy exit code: %errorlevel%
rem if %errorlevel% leq 1 (
rem     echo ^>^> Success copy "InitApps"
rem     net use u: /delete > nul 2>&1
rem     goto install_apps
rem ) else (
rem     echo ^>^> FAILED COPY "InitApps"
rem     set /a result_nas_copy+=2
rem     net use u: /delete > nul 2>&1
rem )
rem if %result_nas_copy% neq 0 (
rem     echo ^>^> FAILED COPY FROM NAS, ABORT
rem     pause
rem     exit
rem )
rem goto install_apps

rem Proxy環境か確認
ping 172.16.199.254 /n 1 > nul 2>&1
if %errorlevel% equ 0 (
    set C:\Box\000_MyFolder\Settings\Chocolatey\
goto :chk_init_apps
)

ping 192.168.50.1 /n 1 > nul 2>&1
if %errorlevel% equ 0 (
    set conf_path=%OneDrive%\仕事\Settings\Chocolatey\
)

:chk_init_apps
set conf_defa=%conf_path%\packages.config

echo ^>^> Check exist "InitApps" or not
if exist %OneDrive%\仕事\InitApps\x64\ (
    echo ^>^> Already exist "InitApps", Install apps
    goto install_apps
)
echo ^>^> NOT EXIST "InitApps"

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
        choco install -y -r --no-progress %%i
    )
) else (
    pushd %conf_dept%
    echo ^>^> Setting default parameter
    choco install -y -r --no-progress %conf_defa%

)
echo ^>^> Update Chocolatey
choco update all -y -r --no-progress
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
choco update all -y
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

if exist %OneDrive%\仕事\Settings.zip (
    echo ^>^> Del Settings.zip
    del %OneDrive%\仕事\Settings.zip > nul 2>&1
)

if exist %OneDrive%\仕事\InitApps.zip (
    echo ^>^> Del InitApps.zip
    del %OneDrive%\仕事\InitApps.zip > nul 2>&1
)

call %OneDrive%\仕事\InitApps\Batch\empty.cmd > nul 2>&1

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
