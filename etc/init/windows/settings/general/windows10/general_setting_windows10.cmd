@echo off
setlocal enabledelayedexpansion
rem Created:     2018/10/05 09:54:50
rem Last Change: 2022/03/23 06:13:10.

set batch_title=General setting Windows10

title %batch_title%

rem 管理者権限で起動されたかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" > NUL

rem 管理者権限ならメイン処理
if not errorlevel 1 goto main_routine

rem 管理者権限でなければ管理者権限で再起動
@powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Start-Process %~f0 -Verb Runas"
exit

:main_routine

rem  スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

echo ^>^> OFF Fast startup
rem "高速スタートアップを有効にする" 無効
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f

rem "タスク バーからの People バーを削除する" 有効
echo ^>^> OFF People
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f

echo ^>^> OFF Notifications
rem "アプリやその他の送信者からの通知を取得する" 無効
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f
rem "ロック画面に通知を表示する" 無効
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
rem "ロック画面にリマインダーと VoIP の着信を表示する" 無効
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f
rem "新機能とおすすめを確認するために、更新の後と、サインイン時にときどき、[Windows へようこそ] の情報を表示する" 無効
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f
rem "Windows を使う上でのヒントやお勧めの方法を取得する" 無効
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f

echo ^>^> Setting Strage sensor
rem ストレージセンサ 有効
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "01" /t REG_DWORD /d "0x1" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "2048" /t REG_DWORD /d "0x7" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "4" /t REG_DWORD /d "0x1" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "256" /t REG_DWORD /d "0x1e" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "512" /t REG_DWORD /d "0x0" /f
rem 設定詳述  reg {{{
rem ストレージセンサーの有無
rem   0=無効
rem   1=有効
rem "01"=dword:00000001
rem 実行タイミング
rem   1e=毎月
rem   7=毎週
rem   1=毎日
rem   0=ディスクの空き容量の不足時
rem "2048"=dword:0000001e
rem アプリで使用されていない一時ファイルを削除
rem   0=無効
rem   1=有効
rem "04"=dword:00000001
rem ごみ箱に移動してから次の期間が過ぎたファイルを削除
rem   3c=60日
rem   1e=30日
rem   0e=14日
rem   1=1日
rem   0=許可しない
rem "256"=dword:0000000e
rem  ダウンロードフォルダに保存してから次の期間が過ぎたファイルを削除
rem   3c=60日
rem   1e=30日
rem   0e=14日
rem   1=1日
rem   0=許可しない
rem "512"=dword:0000000e
rem }}}

rem "ウィンドウをスナップしたときに横に配置できるものを表示する" 無効
echo ^>^> OFF Snap assist
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d "0" /f
rem "ウィンドウをスナップするときに、利用可能な領域に合わせて自動的にサイズを変更する" 無効
echo ^>^> OFF Snap fill
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapFill" /t REG_DWORD /d "0" /f
rem "スナップされたウィンドウのサイズを変更するときに、隣接するスナップ ウィンドウのサイズも同時に変更する" 無効
echo ^>^> OFF Joint resize
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "JointResize" /t REG_DWORD /d "0" /f

rem タイムライン 無効
echo ^>^> OFF Time line
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f

rem NOTWORK:
rem echo ^>^> ON Remote desktop
rem rem リモートデスクトップ 有効
rem reg add "HKEY_LOCAL_MACHINESYSTEMCurrentControlSetControlTerminal Server" /v fDenyTSConnections/t REG_DWORD /d "1" /f

echo ^>^> OFF Xbox function
sc config XblAuthManager start=disabled
sc config XblGameSave start=disabled
sc config XboxNetApiSvc start=disabled

@(echo '> NUL
echo off)
NET SESSION > NUL 2>&1
IF %ERRORLEVEL% neq 0 goto RESTART
setlocal enableextensions
set "THIS_PATH=%~f0"
set "PARAM_1=%~1"
PowerShell.exe -Command "iex -Command ((gc \"%THIS_PATH:`=``%\") -join \"`n\")"
exit /b %errorlevel%
:RESTART
powershell -NoProfile -ExecutionPolicy unrestricted -Command "Start-Process %~f0 -Verb runas"
exit
') | sv -Name TempVar
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage

endlocal
popd

rem pause
exit /b 0
