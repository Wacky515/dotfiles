#!/usr/bin/env bash
# @(#) Install snap
# Created:     2019/11/05 14:37:42
# Last Change: 2019/11/05 14:44:11.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install snap"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

ym_echo ">> Init update"
if has "apt"; then
    bash ~/dotfiles/etc/init/linux/settings/update_apt.sh

    if ! has "snap"; then
        sudo apt install snapd -y
    else
        gm_echo ">> Already install snap"
    fi

elif has "yum"; then
    bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
fi

result_echo $? "${PROCESS}"
