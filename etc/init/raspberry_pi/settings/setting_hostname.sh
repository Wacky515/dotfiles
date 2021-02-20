#!/bin/bash
# @(#) Setting hostname

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting hostname"

ym_echo ">> ${PROCESS^}"

# デフォルト設定 バックアップ
sudo cp /etc/hostname /etc/hostname~
sudo cp /etc/hosts /etc/hosts~

read newname
echo "${newname}" | sudo tee /etc/hostname
sudo sed -i "s/raspberrypi/"${newname}"/g" /etc/hosts
result_echo $? "${PROCESS}"
