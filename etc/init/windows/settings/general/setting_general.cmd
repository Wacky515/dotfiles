@echo off
setlocal enabledelayedexpansion
rem Created:     2018/03/31 09:53:57
rem Last Change: 2020/10/26 14:42:03.

set batch_title=Setting for Folder options
title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine
rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%

rem "登録されている拡張子は表示しない" 無効
echo ^>^> Show hide file extention
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
rem "保護されたオペレーティング システム ファイルを表示しない" 無効
echo ^>^> Show operating system
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d "1" /f
rem "すべてのフォルダーを表示" 無効
echo ^>^> Hide all folder
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d "0" /f
rem "ステータスバーを表示する" 有効
echo ^>^> Show status bar
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d "1" /f
rem "常にメニューを表示する" 有効
echo ^>^> Always show menus
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t REG_DWORD /d "1" /f
rem "タスク ビュー ボ"タンを表示 無効
echo ^>^> Hide task view
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f
rem "隠しファイル、隠しフォルダー、および隠しドライブを表示しない" 有効
echo ^>^> Hide hidden file, folder and drive
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "2" /f

rem rem "Cortana - 表示しない"
rem echo ^>^> Hide Cortana
rem reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
rem "検索ボックスを表示"
echo ^>^> Show search box
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "2" /f

rem "ファイル システムのファイル フォルダーの検索時にインデックスを使用しない" 有効
echo ^>^> Don't use index
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences" /v "WholeFileSystem" /t REG_DWORD /d "0" /f
rem rem "Windows search" 無効
rem sc config WSearch start= disabled

rem “* - ショートカット" を追加しない
echo ^>^> Don't make shortcut name's suffix
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v link /T REG_Binary /d 00000000 /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v ShortcutNameTemplate /f > nul 2>&1

rem デスクトップ アイコン追加
echo ^>^> Set desktop icons
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f

echo ^>^> OFF UAC
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f

echo ^>^> OFF Offline files
sc config CscService start=disabled

echo ^>^> OFF Disc cache
sc config SysMain start=disabled
sc config UevAgentService start=demand

echo ^>^> OFF Hibernate 
powercfg.exe /hibernate off

rem エクスプローラー 再起動
taskkill /f /im explorer.exe > nul 2>&1
start explorer.exe

ver | find /i "Version 6.1." > nul
if %errorlevel% equ 0 goto windows7

ver | find /i "Version 10.0." > nul
if %errorlevel% equ 0 goto windows10

:windows7
echo ^>^> This OS is Windows7, general setting as Windows7
pushd "windows7"
for %%i in (general_setting_*.cmd) do (
        call %%i
        )
pushd %srcdir%
goto end

:windows10
echo ^>^> This OS is Windows10, general setting as Windows10
pushd "windows10"
for %%j in (general_setting_*.cmd) do (
        call %%j
        )
pushd %srcdir%
goto end

:end
endlocal
popd

rem pause
exit /b 0
