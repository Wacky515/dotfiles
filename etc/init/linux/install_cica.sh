#!/bin/bash
# @(#) Install Cica font for Ubuntu
# Created:     2018/05/06 18:08:09
# Last Change: 2018/05/07 07:04:57.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

ym_echo ">> Start install Cica font"

sudo apt-get update
cd ~/

sudo apt-get -y install fontforge unar
git clone git@github.com:miiton/Cica.git
wget -O ubuntu-font-family-0.83.zip https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
mkdir ./sourceFonts/
unar ubuntu-font-family-0.83.zip
cp ubuntu-font-family-0.83/UbuntuMono-R.ttf ./sourceFonts/
cp ubuntu-font-family-0.83/UbuntuMono-B.ttf ./sourceFonts/
wget https://osdn.jp/downloads/users/8/8598/rounded-mgenplus-20150602.7z
unar rounded-mgenplus-20150602.7z
cp rounded-mgenplus-20150602/rounded-mgenplus-1m-regular.ttf ./sourceFonts/
cp rounded-mgenplus-20150602/rounded-mgenplus-1m-bold.ttf ./sourceFonts/
wget https://github.com/googlei18n/noto-emoji/raw/master/fonts/NotoEmoji-Regular.ttf -O sourceFonts/NotoEmoji-Regular.ttf
fontforge -lang=py -script cica.py

rm -ri rounded-mgenplus-20150602/
rm -ri rounded-mgenplus-20150602.7zz
rm -ri sourceFonts/
rm -ri ubuntu-font-family-0.83/
rm -ri ubuntu-font-family-0.83.zip
