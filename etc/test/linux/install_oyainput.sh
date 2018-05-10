#!/bin/bash
# @(#) Intall oyainput

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install oyainput"

ym_echo ">> ${PROCESS^}"
mkdir ~/oyainput
git clone https://github.com/inwskatsube/oyainput.git
cd ~/oyainput
make
sudo make install
result_echo $? "${PROCESS}"
# 自動起動させる
