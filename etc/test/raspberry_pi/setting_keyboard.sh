#!/bin/bash

# 実行したフォルダに "cd"
cd `dirname $0`

source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

PROCESS="setting keyboard layout"

ym_echo ${PROCESS^}
sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp .setting/keyboard /etc/default/
result_echo $? $PROCESS
