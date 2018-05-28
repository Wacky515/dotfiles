#!bin/bash
# @(#) Initialize OS X
# Created:     2018/05/21 16:55:15
# Last Change: 2018/05/28 15:30:50.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="init OSX"

gm_echo ">> ${PROCESS}"
gm_echo ">> ${PROCESS^}"

# Make symbolic link
gm_echo ">> Link setting files"
gm_echo "    >> Call symbolic linking script"
bash ~/dotfiles/link.sh

cd ~/dotfiles/etc/init/osx

gm_echo ">> Install Homebrew"
gm_echo "    >> Call install Homebrew"
sudo bash ./install_homebrew.sh

gm_echo ">> Init brwe install"
for f in brew_*.sh
do
    sudo bash ./${f}
done

gm_echo ">> Init setting"
for g in setting_*.sh
do
    sudo bash ./${g}
done

cd ~/dotfiles/etc/test/osx

gm_echo ">> Init brew install(Test)"
for f in brew_*.sh
do
    sudo bash ./${f}
done

gm_echo ">> Init setting(Test)"
for g in setting_*.sh
do
    sudo bash ./${g}
done

result_echo $? "${PROCESS}"
