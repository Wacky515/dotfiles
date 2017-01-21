#!/bin/bash
# @(#) This script is ~.
# source /home/pi/dotfiles/function/color_echo.sh
# source /home/pi/dotfiles/function/result_echo.sh

# ファイル自身の絶対パス 取得
readonly PATH=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

source /../../../function/color_echo.sh
source /../../../function/result_echo.sh

readonly PROCESS="setting keyboard layout"

sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp ${PATH}/setting/keyboard \
    /etc/default/
result_echo $? "${PROCESS}"
