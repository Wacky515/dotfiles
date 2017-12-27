#!/bin/bash
# @(#) Intall OneDrive

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install OneDrive"

ym_echo ">> ${PROCESS^}"

cd ~/Downloads
sudo apt -y install libcurl4-openssl-dev libsqlite3-dev gdebi
wget http://downloads.dlang.org/releases/2.x/2.073.2/dmd_2.073.2-0_amd64.deb
sudo gdebi dmd_2.073.2-0_amd64.deb
cd -

cd ~/
# git clone git@github.com:skilion/onedrive.git
git clone https://github.com/skilion/onedrive.git

# 以下からできない
cd onedrive
make
sudo make install

mkdir -p ~/.config/onedrive
cp ./config ~/.config/onedrive/config

systemctl --user enable onedrive
systemctl --user start onedrive

result_echo $? "${PROCESS}"
