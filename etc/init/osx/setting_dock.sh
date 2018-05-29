#!/bin/bash
# @(#) Setting Dock
# Created:     2018/05/26 00:00:00
# Last Change: 2018/05/29 08:09:35.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting Dock"

gm_echo ">> ${PROCESS^}"

defaults write com.apple.dock magnification -bool true

result_echo $? "${PROCESS}"
