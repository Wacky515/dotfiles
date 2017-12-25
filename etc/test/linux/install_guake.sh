#!/bin/bash
# @(#) Intall guake

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install guake"

ym_echo ">> ${PROCESS^}"
sudo apt -y install guake
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/
result_echo $? "${PROCESS}"
