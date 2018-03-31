#!/bin/bash
# Last Change: 2018/04/01 00:28:27.

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
