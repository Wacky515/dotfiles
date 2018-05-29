#!/bin/bash
# @(#) Setting Finder
# Created:     2018/05/26 00:00:00
# Last Change: 2018/05/29 08:15:04.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting Finder"

gm_echo ">> ${PROCESS^}"

defaults write com.apple.finder AppleShowAllFiles -boolean true
killall Finder

result_echo $? "${PROCESS}"
