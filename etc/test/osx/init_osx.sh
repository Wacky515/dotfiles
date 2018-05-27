#!bin/bash
# @(#) Initialize OS X
# Created:     2018/05/21 16:55:15
# Last Change: 2018/05/27 17:19:33.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="init OSX"
ym_echo ">> ${PROCESS}^"

# Make symbolic link
ym_echo ">> Link setting files"
ym_echo ">> Call symbolic linking script"
sh ~/dotfiles/link.sh
# bash ~/dotfiles/link.sh

cd ~/dotfiles/etc/init/osx

ym_echo ">> Istall Homebrew"
sudo bash ./install_homebrew.sh

ym_echo ">> Init brwe install"
for f in brew_*.sh
do
    sudo bash ./${f}
done

ym_echo ">> Init setting"
for g in setting_*.sh
do
    sudo bash ./${g}
done

cd ~/dotfiles/etc/test/osx

ym_echo ">> Init brew install(Test)"
for f in brew_*.sh
do
    sudo bash ./${f}
done

ym_echo ">> Init setting(Test)"
for g in setting_*.sh
do
    sudo bash ./${g}
done

result_echo $? "${PROCESS}"
