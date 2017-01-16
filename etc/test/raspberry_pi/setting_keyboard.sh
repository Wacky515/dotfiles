#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

# ファイル自身の絶対パス 取得
path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

PROCESS="setting keyboard layout"

ym_echo ">> ${PROCESS^}"
sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp ${path}/setting/keyboard \
    /etc/default/
result_echo $? "${PROCESS}"
