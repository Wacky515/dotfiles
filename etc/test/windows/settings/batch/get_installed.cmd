@echo off
setlocal enabledelayedexpansion
rem Created:     2019/10/25 09:14:39
rem Last Change: 2019/10/28 10:35:13.

set batch_title=Get installed
title %batch_title%
rem MEMO: 一部捕捉しきれない

rem スクリプトがある "Dir" に "cd"
set bat_path=%~dp0
pushd %bat_path%

echo ^>^> %batch_title%
rem echo ^>^> Start

rem set dt=%date:~-8,2%%date:~-5,2%

rem "C:\tmp" 存在確認
set tmp_dir=C:\tmp
if not exist "%tmp_dir%\" (
	md c:\tmp\
)

pushd c:\tmp\

rem ソフトウェア一覧情報パス 指定
    rem 64bit用に "Wow6432Node" 追加
echo "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" > registry_path.txt
echo "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" >> registry_path.txt

rem ソフトウェア名をファイルに出力
    rem DisplayNameで開始している行のみ
    rem セキュリティ更新ソフト 無視
for /f  "delims=" %%a in (registry_path.txt) do (
    for /f "tokens=2,*" %%i in ('reg query %%a /s ^| findstr "\<displayname" ^| findstr /v "更新 修正 (kb"') do (
        rem echo %username%,%%j >> %username%_%dt%.txt
        echo %username%,%%j >> %username%_installed.txt
    )
)

rem ソフトウェア名の昇順で並替え
rem sort %username%_%dt%.txt > install_sort_list.txt
sort %username%_installed.txt > install_sort_list.txt

rem 重複データ 削除
rem type nul > %username%_%dt%.txt
type nul > %username%_installed.txt
for /f "delims=" %%i in (install_sort_list.txt) do findstr /x /c:"%%i" %username%_installed.txt >nul || (echo;%%i) >> %username%_installed.txt

rem 不要なファイルの削除
del registry_path.txt
del install_sort_list.txt

echo ---------------------------------------------------------------------------
echo このPCにインストールされているソフトの一覧を取得しました。
echo C:^\tmp^\%username%_installed.txt を jun.wakita@murata.com にメールしてください。
echo 取得できていない場合は脇田まで連絡をお願いいたします。
echo.
echo キーを押すと終了します
echo ---------------------------------------------------------------------------

pause >nul

popd
endlocal

rem pause
exit /b 0
