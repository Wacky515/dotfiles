#!/bin/bash
source ./function/color_echo.sh
source ./function/result_echo.sh

PROCESS=process_name

ym_echo "${PROCESS^}"
# Code
result_echo $? $PROCESS
