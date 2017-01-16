#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS="Setting hostname"

ym_echo "${PROCESS^}"

# デフォルト設定 バックアップ
sudo mv /etc/hostname /etc/hostname.bak
sudo cp /etc/hosts /etc/hosts.bak

read newname
echo "$newname" > /etc/hostname
# sed -e "s/raspberrypi/"$newname"/g" /etc/hosts
sed -i "s/raspberrypi/"$newname"/g" /etc/hosts
result_echo $? $PROCESS
