#!/usr/bin/env bash
# @(#) Install RipGrep
# Created:     2019/11/05 14:34:28
# Last Change: 2019/11/05 14:49:14.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install RipGrep"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

ym_echo ">> Init update"
    if ! has "rg"; then
        if ! has "snap"; then
            bsh ~/dotfiles/etc/init/linux/settings/install_snap.sh
        fi
        sudo snap install ripgrep
    else
        gm_echo ">> Already install RopGrep"
    fi

result_echo $? "${PROCESS}"
