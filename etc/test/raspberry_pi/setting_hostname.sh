#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

PROCESS="setting hostname"

ym_echo "${PROCESS^}"

# デフォルト設定 バックアップ
# sudo mv /etc/hostname /etc/hostname.bak
sudo cp /etc/hostname /etc/hostname.bak
sudo cp /etc/hosts /etc/hosts.bak

read newname
# sudo echo "$newname" > /etc/hostname
echo "$newname" | sudo tee /etc/hostname
# sed -e "s/raspberrypi/"$newname"/g" /etc/hosts
sudo sed -i "s/raspberrypi/"$newname"/g" /etc/hosts
result_echo $? $PROCESS
