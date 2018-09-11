@echo off
rem Created:     2018/07/17 10:19:01
rem Last Change: 2018/07/17 10:23:01.

rem  スクリプトがある "Dir" に "cd"
cd /d %~dp0

echo ^>^> Start setting GENE dictionary

if not exist %homepath%/vimfiles/dict (
    mkdir %homepath/vimfiles/dict
    )
copy GENE.TXT %homepath%/vimfiles/dict/

rem pause
exit /b 0

