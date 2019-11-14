#!/usr/bin/env bash
# @(#) Install curl
# Created:     2019/11/05 11:08:19
# Last Change: 2019/11/05 13:38:57.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install curl"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

if ! has "wget"; then
    bash ~/dotfiles/etc/init/linux/settings/install_wget.sh
fi

ym_echo ">> Init update"
if has "apt"; then
    bash ~/dotfiles/etc/init/linux/settings/update_apt.sh

    if ! has "curl"; then
        sudo apt install curl
    else
        gm_echo ">> Already install curl"
    fi

elif has "yum"; then
    bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
fi

result_echo $? "${PROCESS}"
