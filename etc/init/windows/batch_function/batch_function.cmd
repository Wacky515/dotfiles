@echo off
setlocal enabledelayedexpansion
rem Created:     2026/01/07 08:09:20
rem Last Change: 2026/01/28 13:51:08.

set batch_title=Common batch function
title %batch_title%

set cmd=%~1
if /i "%cmd%"=="logmsg" goto logmsg
if /i "%cmd%"=="make_link" goto make_link
if /i "%cmd%"=="make_dir" goto make_dir
rem if /i "%cmd%"=="check_admin" goto check_admin

:logmsg
rem >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
rem USAGE:
rem Args: %2=LOG_NAME, %3=LEVEL, %4=MESSAGE
rem call :logmsg "LOG_NAME" "LEVEL" "MESSAGE"
rem ------------------------------------

set "_log_name=%~2"
if "%_log_name%" == "" (
    set "log_file=%~dp0..\log.log"
) else (
    set "log_file=%~dp0..\%_log_name%.log"
)

for /f %%a in ('wmic os get localdatetime ^| find "."') do set DTS=%%a
set "LOGDATE=%DTS:~0,4%/%DTS:~4,2%/%DTS:~6,2%"
set "LOGTIME=%DTS:~8,2%:%DTS:~10,2%:%DTS:~12,2%"

>>"%log_file%" echo [%LOGDATE% %LOGTIME%] [%~3] %~4
echo [%LOGDATE% %LOGTIME%] [%~3] %~4

exit /b 0
rem <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

:make_link
rem >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
rem USAGE:
rem Args: %2=LOG_NAME, %3=DESTINATION, %4=SOURCE
rem call :make_link "LOG_NAME" "DESTINATION" "SOURCE" [/d] [dsc]
rem ------------------------------------

set "_log_name=%~2"
set "_dst=%~3"
set "_src=%~4"
set "_opt=%~5"
set "_dsc=%~6"

if not exist "%_src%" (
    call :logmsg "" "%_log_name%" ERROR "Source not found: %_src%"
    exit /b 10
)

if exist "%_dst%" (
    call :logmsg "" "%_log_name%" INFO "Delete existing target: %_dst%"
    if "%_opt%" == "/d" (
        rmdir "%_dst%"
    ) else (
        del "%_dst%"
    )
)
mklink %_opt% "%_dst%" "%_src%"

if %errorlevel% equ 0 (
    if defined _dsc (
        call :logmsg "" "%_log_name%" INFO "%_dsc% link success"
    ) else (
        call :logmsg "" "%_log_name%" INFO "Link created: %_dst% -> %_src%"
    )
    exit /b 0
) else (
    call :logmsg "" "%_log_name%" ERROR "Failed link: %_dst%"
    exit /b 20
)

rem Error codes:
rem 10 - Source not found
rem 20 - Link creation failed

exit /b 0
rem <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

:make_dir
rem >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
rem USAGE:
rem Args: %2=LOG_NAME, %3=DIR_PATH
rem call :make_dir "LOG_NAME" "DIR_PATH"
rem ------------------------------------

set "_log_name=%~2"
set "_dir=%~3"

if not exist "%_dir%" (
    mkdir "%_dir%" 2>nul
    if %errorlevel% equ 0 (
        call :logmsg "" "%_log_name%" INFO "Created directory: %_dir%"
        exit /b 0
    ) else (
        call :logmsg "" "%_log_name%" ERROR "Fail to make directory: %_dir%"
        exit /b 30
    )
) else (
    call :logmsg "" "%_log_name%" INFO "Directory exists: %_dir%"
    exit /b 0
)

rem Error codes:
rem 30 - Make directory failed

exit /b 0
rem <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

rem :check_admin
rem rem >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
rem net session >nul 2>&1
rem if %errorlevel% equ 0 (
rem     rem ä«óùé“å†å¿Ç†ÇË
rem     call :logmsg "" INFO "Administrator privileges detected"
rem ) else (
rem     rem ä«óùé“å†å¿Ç»ÇµÅAçƒãNìÆÇµÇƒå†å¿ïtó^
rem     call :logmsg "" INFO "Relaunching with Administrator privileges"
rem     powershell -NoProfile -ExecutionPolicy Bypass -Command ^
rem     "Start-Process '%~f0' -Verb RunAs"
rem )
rem
rem exit /b 0
rem rem <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
