#!/bin/bash
# @(#) Intall guake
# "F12" で画面上部から呼出すターミナル

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install guake"

ym_echo ">> ${PROCESS^}"
sudo apt -y install guake
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/
result_echo $? "${PROCESS}"
