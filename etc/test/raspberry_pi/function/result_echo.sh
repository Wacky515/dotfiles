#!/bin/bash
source ./color_echo.sh

result_echo(){
    # TODO: 共通関数に切り出し
    if [ "$1" -eq 0 ]
    then
        ym_echo ">> Success install $2"
    else
        rb_echo ">> Fail install $2"
    fi
    echo ""
}

