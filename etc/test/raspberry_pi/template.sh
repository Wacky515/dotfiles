#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS=process_name

ym_echo "${PROCESS^}"

# Code
result_echo $? $PROCESS
