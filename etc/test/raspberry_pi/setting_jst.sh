#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

readonly PROCESS="setting network time"

ym_echo ">> ${PROCESS^}"

# sudo mv /etc/localtime /etc/localtime.bak
# sudo cp /etc/localtime /etc/localtime.bak
# sudo mv /etc/localtime /etc/localtime~
sudo mv /etc/localtime /etc/localtime.bak
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
result_echo $? "${PROCESS}"
