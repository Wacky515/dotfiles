rem TODO: 32bit��64bit �ŏ����𕪊�
rem MEMO: 64bit �C�j�V���� �ꉞ����
echo off

rem 32bit���̃C���X�g�[���ꗗ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
if %ERRORLEVEL% EQU 0 GOTO :UPDATE
rem TODO: "%ERRORLEVEL%"  -> �ϐ�1�Ɋi�[
echo ERRORLEVEL1: %ERRORLEVEL%
set find1 = %ERRORLEVEL%
echo find1: %find1%

reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
if %ERRORLEVEL% EQU 0 GOTO :UPDATE
rem TODO: "%ERRORLEVEL%"  -> �ϐ�2�Ɋi�[
echo ERRORLEVEL2: %ERRORLEVEL%
set find2 = %ERRORLEVEL%
echo find2: %find2%

rem 64bit���̃C���X�g�[���ꗗ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr "Chocolatey"
if %ERRORLEVEL% EQU 0 GOTO :UPDATE
rem TODO: "%ERRORLEVEL%"  -> �ϐ�3�Ɋi�[
echo ERRORLEVEL3: %ERRORLEVEL%
set find3 = %ERRORLEVEL%
echo find3: %find3%

rem TODO: if �ϐ�1�A2�A3 �̘a > 1 (
rem if /a %find1%+%find2%+%find3% EQU 3
    echo "Install Chocolatey"
    @powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
rem TODO: �K�{�C���X�g�[���\�t�g�񋓃e�L�X�g�i������j��ǂݍ��݁A�C���X�g�[������

    PAUSE
rem ) else (
:UPDATE
    echo "Already installed Chocolatey, Update software"
    cup all -y

    PAUSE
)
