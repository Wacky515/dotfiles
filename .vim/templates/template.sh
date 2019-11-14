#!/usr/bin/env bash
# @(#) ***
# Created:     __DATE__
# Last Change: 2019/11/06 14:59:26.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly         APPS="__START__"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

gm_echo ">> Init update"
if has "apt"; then
    bash ~/dotfiles/etc/init/linux/settings/update_apt.sh

    if ! has ${APPS}; then
        gm_echo ">> ${PROCESS_PROP}"
        sudo apt install ${APPS}
    else
        gm_echo ">> Already installed ${APPS}"
    fi

elif has "yum"; then
    bash ~/dotfiles/etc/init/linux/settings/update_yum.sh

    if ! has ${APPS}; then
        gm_echo ">> ${PROCESS_PROP}"
        :> PASS sudo yum install ${APPS}
    else
        gm_echo ">> Already installed ${APPS}"
    fi
fi

result_echo $? "${PROCESS_LOWC}"
