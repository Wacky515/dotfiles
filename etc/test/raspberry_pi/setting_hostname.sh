#!/bin/bash
# @(#) Setting keyboard layout.

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting hostname"

ym_echo ">> ${PROCESS^}"

# デフォルト設定 バックアップ
sudo cp /etc/hostname /etc/hostname.bak
sudo cp /etc/hosts /etc/hosts.bak

read newname
echo "${newname}" | sudo tee /etc/hostname
sudo sed -i "s/raspberrypi/"${newname}"/g" /etc/hosts
result_echo $? "${PROCESS}"
