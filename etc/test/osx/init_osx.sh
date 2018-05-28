#!bin/bash
# @(#) Initialize OS X
# Created:     2018/05/21 16:55:15
# Last Change: 2018/05/28 09:53:30.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="init OSX"
gm_echo ">> ${PROCESS^}"

# Make symbolic link
gm_echogc ">> Link setting files"
gm_echogc ">> Call symbolic linking script"
sh ~/dotfiles/link.sh
# bash ~/dotfiles/link.sh

cd ~/dotfiles/etc/init/osx

gm_echogc ">> Istall Homebrew"
sudo bash ./install_homebrew.sh

gm_echogc ">> Init brwe install"
for f in brew_*.sh
do
    sudo bash ./${f}
done

gm_echogc ">> Init setting"
for g in setting_*.sh
do
    sudo bash ./${g}
done

cd ~/dotfiles/etc/test/osx

gm_echogc ">> Init brew install(Test)"
for f in brew_*.sh
do
    sudo bash ./${f}
done

gm_echogc ">> Init setting(Test)"
for g in setting_*.sh
do
    sudo bash ./${g}
done

result_echo $? "${PROCESS}"
