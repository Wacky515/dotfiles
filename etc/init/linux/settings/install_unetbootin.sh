#!/usr/bin/env bash
# @(#) Install UNetbootin
# Created:     2019/11/28 16:01:00.
# Last Change: 2019/11/28 16:06:31.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install UNetbootin"

gm_echo ">> Check ${PROCESS} or not"

if ! has "unetbootin"; then
    ym_echo ">> Update software information and ${PROCESS}"
    if has "apt"; then
        sudo add-apt-repository ppa:gezakovacs/ppa
        sudo apt update
        sudo apt install unebootin
    elif has "yum"; then
        bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
    fi
    result_echo $? "${PROCESS}"
else
    gm_echo ">> Already ${PROCESS}"
fi
