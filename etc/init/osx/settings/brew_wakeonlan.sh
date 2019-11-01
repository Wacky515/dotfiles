#!/usr/bin/env bash
# @(#) Install Wake on LAN
# Created:     2019/11/01 11:48:28
# Last Change: 2019/11/01 12:10:41.

# MEMO:
# Keyin "wakeonlan <IP addr>"
set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Wake on LAN"

gm_echo ">> ${PROCESS^}"

if ! has "brew"; then
    echo info "Install brew frst"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "wakeonlan"; then
    brew install wakeonlan
else
    echo ">> Already installed Wake on LAN"
fi

result_echo $? "${PROCESS}"
