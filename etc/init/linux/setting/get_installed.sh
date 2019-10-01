#!/bin/bash
# @(#) Get installed software list

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="get installed software list"

ym_echo ">> ${PROCESS^}"

declare -a info=($(./get_distribution.sh))
cat -n /var/log/apt/history.log | grep Commandline > \
    ./installed/`date "+%Y%m%d_%H%M%S"`_${info[0]}_${info[1]}_`hostname`_`hostname -i`_installed.txt

result_echo $? "${PROCESS}"
