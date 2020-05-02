#!/usr/bin/env bash
# @(#) Install Wake on LAN
# Created:     2019/11/01 11:48:28
# Last Change: 2020/05/02 23:16:38.
# USAGE:
# Keyin "wakeonlan <IP addr>"

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="install Wake on LAN"

gm_echo ">> ${PROCESS^}"

if ! has "brew"; then
    echo info "Install Brew frst"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "wakeonlan"; then
    brew install wakeonlan
else
    echo ">> Already installed Wake on LAN"
fi

result_echo $? "${PROCESS}"
