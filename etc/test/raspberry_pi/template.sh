#!/bin/bash
# @(#) ***

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="process_name"

ym_echo ">> ${PROCESS^}"
# Code
result_echo $? ${PROCESS}
