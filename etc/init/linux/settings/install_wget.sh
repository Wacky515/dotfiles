#!/usr/bin/env bash
# @(#) Install wget
# Created:     2019/11/05 11:13:33
# Last Change: 2019/11/05 11:49:58.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install wget"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

ym_echo ">> Init update"
if has "apt"; then
    bash ~/dotfiles/etc/init/linux/settings/update_apt.sh

    if ! has "wget"; then
        sudo apt install wget
    else
        gm_echo ">> Already install wget"
    fi

elif has "yum"; then
    bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
fi

result_echo $? "${PROCESS}"

