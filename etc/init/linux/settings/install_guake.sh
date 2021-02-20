#!/bin/bash
# @(#) Intall Guake
# Created:     201*/**/** **:**:**
# Last Change: 2019/10/31 13:49:18.
# "F12" で画面上部から呼出すターミナル

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install Guake"

ym_echo ">> ${PROCESS^}"
sudo apt -y install guake
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/
result_echo $? "${PROCESS}"
