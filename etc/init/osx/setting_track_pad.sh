#!/bin/bash
# @(#) Setting Track Pad
# Created:     2018/06/02 00:00:00
# Last Change: 2018/06/03 11:22:13.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting Track Pad"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

defaults write -g com.apple.swipescrolldirection -bool false

result_echo $? "${PROCESS}"
