#!/usr/bin/env bash
# @(#) ***
# Created:     __DATE__
# Last Change: 2019/11/05 11:48:10.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install ***"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

ym_echo ">> Init update"
if has "apt"; then
    bash ~/dotfiles/etc/init/linux/settings/update_apt.sh

    if ! has "***"; then
        __START__
    else
        gm_echo ">> Already install ***"
    fi

elif has "yum"; then
    bash ~/dotfiles/etc/init/linux/settings/update_yum.sh
fi

result_echo $? "${PROCESS}"
