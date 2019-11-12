#!/bin/bash
# @(#) Intall Atom
# Created:     2019/10/31 16:02:24
# Last Change: 2019/11/05 14:43:58.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Atom"

ym_echo ">> ${PROCESS^}"

if ! has "atom"; then
    if ! has "snap"; then
        bash ~/dotfiles/etc/init/linux/settings/install_snap.sh
    fi
    sudo snap install atom --classic
else
    gm_echo ">> Already install Atom"
fi

result_echo $? "${PROCESS}"
