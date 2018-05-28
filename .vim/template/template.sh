#!/bin/bash
# @(#) ***
# Created:     __DATE__
# Last Change: 2018/05/28 12:44:37.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install ***"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

__START__

result_echo $? "${PROCESS}"
