echo off

rem rem TODO: 32bit��64bit �ŏ����𕪊�
rem rem MEMO: 64bit �C�j�V���� �ꉞ����
rem
rem rem 32bit���̃C���X�g�[���ꗗ
rem reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
rem if %ERRORLEVEL% EQU 0 goto :update
rem rem TODO: "%ERRORLEVEL%"  -> �ϐ�1�Ɋi�[
rem echo ERRORLEVEL1: %ERRORLEVEL%
rem set find1 = %ERRORLEVEL%
rem echo find1: %find1%
rem
rem reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
rem if %ERRORLEVEL% EQU 0 goto :update
rem rem TODO: "%ERRORLEVEL%"  -> �ϐ�2�Ɋi�[
rem echo ERRORLEVEL2: %ERRORLEVEL%
rem set find2 = %ERRORLEVEL%
rem echo find2: %find2%
rem
rem rem 64bit���̃C���X�g�[���ꗗ
rem reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
rem if %ERRORLEVEL% EQU 0 goto :update
rem rem TODO: "%ERRORLEVEL%"  -> �ϐ�3�Ɋi�[
rem echo ERRORLEVEL3: %ERRORLEVEL%
rem set find3 = %ERRORLEVEL%
rem echo find3: %find3%

chocolatey -v
echo %ERRORLEVEL%
if %ERRORLEVEL% EQU 0 goto update


rem TODO: if �ϐ�1�A2�A3 �̘a > 1 (
rem if /a %find1%+%find2%+%find3% EQU 3
echo "Install Chocolatey"
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
rem TODO: �K�{�C���X�g�[���\�t�g�񋓃e�L�X�g�i������j��ǂݍ��݁A�C���X�g�[������
cinst packages.config

rem ) else (

:update
echo "Already installed Chocolatey, Update software"
cup all -y

pause
