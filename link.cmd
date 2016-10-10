echo off
echo Start link

mklink %HOMEPATH%"\.gitconfig" ".\dotfiles\.gitconfig"
    if not %ERRORLEVEL% == "0" (
        echo ".gitconfig link success!"
        echo This PC name: %COMPUTERNAME%
        for /f "delims=" %%i in (office_pc.txt) do (
            echo In office PC: %%i
            if /i %%i == %COMPUTERNAME% (
                goto set_proxy
                )
            )
        echo "In normal network"
        goto normal_netwoek

        )
    )
:set_proxy
echo "In proxy, set proxy"
git config --list
rem git config --system http.proxy http://proxy.intra.xacti-co.com:8080
rem git config --system https.proxy https://proxy.intra.xacti-co.com:8080

:normal_netwoek

mklink %HOMEPATH%"\.gitignore" ".\dotfiles\.gitignore"

mklink %HOMEPATH%"\.vimrc" ".\dotfiles\.vimrc"
mklink %HOMEPATH%"\.gvimrc" ".\dotfiles\.gvimrc"
mklink /D %HOMEPATH%"\.vim" ".\dotfiles\.vim"

echo End link
pause

exit 0
