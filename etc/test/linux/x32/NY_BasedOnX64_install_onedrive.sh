#!/bin/bash
# @(#) Intall OneDrive

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install OneDrive"

ym_echo ">> ${PROCESS^}"

sudo apt -y install libcurl4-openssl-dev libsqlite3-dev gdebi
wget http://downloads.dlang.org/releases/2.x/2.077.1/dmd_2.077.1-0_i386.deb
sudo gdebi dmd_2.077.1-0_i386.deb

git clone git@github.com:skilion/onedrive.git
cd onedrive
make
sudo make install

mkdir -p ~/.config/onedrive
cp ./config ~/.config/onedrive/config

systemctl --user enable onedrive
systemctl --user start onedrive

result_echo $? "${PROCESS}"
