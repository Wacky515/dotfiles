#!/usr/bin/env bash
# @(#) Install Tweaks
# Created:     2019/11/06 10:07:59
# Last Change: 2019/11/06 10:10:26.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Tweaks"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

ym_echo ">> Init update"
if has "apt"; then
    bash ~/dotfiles/etc/init/linux/settings/update_apt.sh

    if ! has "Tweaks"; then
        sudo apt install gnome-tweaks -y
    else
        gm_echo ">> Already install Tweaks"
    fi

elif has "yum"; then
    bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
fi

result_echo $? "${PROCESS}"

