#!/bin/bash
# "echo" 強調（メッセージ用: 黄色）
function y_echo {
    echo -e "\e[33m$*\e[m"
}

# "echo" 強調（NG用: 赤色 太字 下線）
function rb_echo {
    echo -e "\e[31;4m$*\e[m"
}

