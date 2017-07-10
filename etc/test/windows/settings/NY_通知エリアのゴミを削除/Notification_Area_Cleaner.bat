@echo off
taskkill /im explorer.exe /f
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams /f
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream /f
start "Shell Restarter" /d "%systemroot%" /i /normal explorer.exe