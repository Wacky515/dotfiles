#!/usr/bin/env bash
# @(#) ***
# Created:     __DATE__
# Last Change: 2018/11/15 09:43:32.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install ***"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

__START__

result_echo $? "${PROCESS}"

