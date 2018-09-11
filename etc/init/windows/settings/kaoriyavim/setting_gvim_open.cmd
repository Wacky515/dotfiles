@echo off
rem Last Change: 2018/09/11 09:05:53.
rem TODO: ŠÇ—ŽÒ‚Æ‚µ‚ÄŽÀs‚·‚é

set homedir="C:"%HOMEPATH%

rem OS 64bit”Å‚Æ32bit”Å‚Å•ªŠò
if exist ""C:"%HOMEPATH%"\vim81-kaoriya-win64\"" goto vim64
if exist ""C:"%HOMEPATH%"\vim80-kaoriya-win32\"" (
    goto vim32
) else (
    echo ^>^> Please set GVim in home directory
    goto EOF
)

:vim64
echo ^>^> Set Open by GVim 64bit
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v Icon /t REG_SZ /d "\"%homedir%\vim81-kaoriya-win64\gvim.exe\"
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%homedir%\vim81-kaoriya-win64\gvim.exe\" \"%%1\""
goto EOF

:vim32
echo ^>^> Set Open by GVim 32bit
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open" /v Icon /t REG_SZ /d "\"%homedir%\vim81-kaoriya-win32\gvim.exe\"
reg add "HKEY_CLASSES_ROOT\*\shell\GVim open\command" /t REG_SZ /d "\"%homedir%\vim81-kaoriya-win32\gvim.exe\" \"%%1\""
goto EOF

:EOF
pause
exit /b 0
