#!/bin/bash
# @(#) Colored echo
# Created:     2017/01/16 00:00:00
# Last Change: 2018/05/27 17:01:02.

# "echo" 強調（メッセージ用: 黄色）
# "Mac" で化けるので "printf" にした
# TODO: "Linux" で動作確認
function ym_echo {
    # echo -e "\e[33m$*\e[m"
    printf "\e[33m$*\e[m\n"
}

# "echo" 強調（NG用: 赤色 太字 下線）
function rb_echo {
    # echo -e "\e[31;4m$*\e[m"
    printf "\e[31;4m$*\e[m\n"
}

# info: 情報を緑色で出力
info() {
    printf "${GREEN}"
    echo -n "  info  "
    printf "${NORMAL}"
    echo "$1"
}

# error: エラーを赤色で出力
error() {
    printf "${RED}"
    echo -n "  error "
    printf "${NORMAL}"
    echo "$1"
}

# warn: 警報を黄色で出力
warn() {
    printf "${YELLOW}"
    echo -n "  warn  "
    printf "${NORMAL}"
    echo "$1"
}
