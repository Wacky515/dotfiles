#!/usr/bin/env bash
# @(#) Install Chrome
# Created:     2019/10/31 16:02:24
# Last Change: 2019/11/15 15:13:45.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Chrome"

gm_echo ">> Check ${PROCESS} or not"

if ! has "google-chrome-stable"; then
    ym_echo ">> Update software information and ${PROCESS}"
    if has "apt"; then
        bash ~/dotfiles/etc/init/linux/settings/update_apt.sh
        sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >>
            \ /etc/apt/sources.list.d/google.list'
        sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub
            \ | sudo apt-key add -
        sudo apt update
        sudo apt install google-chrome-stable
    elif has "yum"; then
        bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
    fi
    result_echo $? "${PROCESS}"
else
    gm_echo ">> Already ${PROCESS}"
fi
