#!/bin/bash
# @(#) Setting keyboard layout.

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting keyboard layout"

# sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp -b ./setting/keyboard  /etc/default/
result_echo $? "${PROCESS}"
