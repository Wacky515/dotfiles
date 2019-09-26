#!/bin/bash
# @(#) Install Cica font for Ubuntu
# Created:     2018/05/06 18:08:09
# Last Change: 2019/09/12 12:39:09.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install Cica"

ym_echo ">> ${PROCESS^}"

if [ ! -e ~/.fonts ]; then
    mkdir ~/.fonts
fi

cd ~/Downloads
wget https://github.com/miiton/Cica/releases/download/v5.0.1/Cica_v5.0.1_without_emoji.zipt https://github.com/miiton/Cica/releases/download/v5.0.1/Cica_v5.0.1_without_emoji.zip
unzip Cica_v5.0.1_without_emoji.zip -d Cica_v5.0.1_without_emoji
cd Cica_v5.0.1_without_emoji
sudo mv Cica-*.ttf ~/.fonts/.
sudo fc-cache -fv
cd ~/Downloads
rm -f Cica_v5.0.1_without_emoji.zip
rm -rf Cica_v5.0.1_without_emoji

result_echo $? "${PROCESS}"
