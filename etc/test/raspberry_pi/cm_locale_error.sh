#!/bin/bash
# @(#) Countermeasure locale error

source ~/dotfiles/function/result_echo.sh

readonly PROCESS=setting locale

ym_echo ">> ${PROCESS^}"
export LANG=en_US.UTF-8
export LC_ALL=$LANG
locale-gen --purge $LANG
dpkg-reconfigure -f noninteractive locales && \
    /usr/sbin/update-locale LANG=$LANG LC_ALL=$LANG
result_echo $? ${PROCESS}
