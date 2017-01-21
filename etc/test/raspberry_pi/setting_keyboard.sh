#!/bin/bash
# @(#) Setting keyboard layout.

source ~/dotfiles/function/result_echo.sh

# ファイル自身の絶対パス 取得
# readonly PATH=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

readonly PROCESS="setting keyboard layout"

sudo mv /etc/default/keyboard /etc/default/keyboard.bak
# sudo cp ${PATH}/setting/keyboard \
sudo cp ./setting/keyboard  /etc/default/
result_echo $? "${PROCESS}"
