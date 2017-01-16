#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS=process_name

echo "$PROCESS^"

# Code

result_echo $? $PROCESS
