#!/bin/bash
# @(#) Intall guake
# F12$B$G2hLL>eIt$+$i8F=P$9%?!<%_%J%k(B

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install guake"

ym_echo ">> ${PROCESS^}"
sudo apt -y install guake
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/
result_echo $? "${PROCESS}"
