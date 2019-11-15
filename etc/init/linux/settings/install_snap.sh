#!/usr/bin/env bash
# @(#) Install snap
# Created:     2019/11/05 14:37:42
# Last Change: 2019/11/15 15:13:37.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install snap"

gm_echo ">> Check ${PROCESS} or not"

if ! has "snap"; then
    ym_echo ">> Update software information and ${PROCESS}"
    if has "apt"; then
        bash ~/dotfiles/etc/init/linux/settings/update_apt.sh
        sudo apt install snapd -y
    elif has "yum"; then
        bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
    fi
    result_echo $? "${PROCESS}"
else
    gm_echo ">> Already ${PROCESS}"
fi
