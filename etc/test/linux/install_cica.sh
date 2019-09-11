#!/bin/bash
# @(#) Install Cica font for Ubuntu
# Created:     2018/05/06 18:08:09
# Last Change: 2019/09/11 13:45:30.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install Cica"

ym_echo ">> ${PROCESS^}"

# sudo apt update  ## {{{
# cd ~/
#
# sudo apt -y install fontforge unar
# git clone git@github.com:miiton/Cica.git
# wget -O ubuntu-font-family-0.83.zip https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
#
# mkdir ~/sourceFonts/
# unar ubuntu-font-family-0.83.zip
# cp ubuntu-font-family-0.83/UbuntuMono-R.ttf ~/sourceFonts/
# cp ubuntu-font-family-0.83/UbuntuMono-B.ttf ~/sourceFonts/
#
# wget https://osdn.jp/downloads/users/8/8598/rounded-mgenplus-20150602.7z
# unar rounded-mgenplus-20150602.7z
# cp rounded-mgenplus-20150602/rounded-mgenplus-1m-regular.ttf ~/sourceFonts/
# cp rounded-mgenplus-20150602/rounded-mgenplus-1m-bold.ttf ~/sourceFonts/
# wget https://github.com/googlei18n/noto-emoji/raw/master/fonts/NotoEmoji-Regular.ttf -O ~/sourceFonts/NotoEmoji-Regular.ttf
# fontforge -lang=py -script cica.py
#
# rm -r ~/sourceFonts/
# rm -r ~/rounded-mgenplus-20150602/
# rm -r ~/rounded-mgenplus-20150602.7z
# rm -r ~/ubuntu-font-family-0.83/
# rm -r ~/ubuntu-font-family-0.83.zip
# }}}

# 存在しない場合のみ
mkdir ~/.fonts
cd $_
wget https://github.com/miiton/Cica/releases/download/v2.1.0/Cica_v2.1.0.zip
unzip Cica_v2.1.0.zip
mv Cica-*.ttf ~/.fonts/.
sudo fc-cache -fv
rm -f Cica_v2.1.0.zip
rm -lf COPYRIGHT.txt LICENSE.txt

result_echo $? "${PROCESS}"
