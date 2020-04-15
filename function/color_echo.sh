#!/bin/bash
# @(#) Colored echo
# Created:     2017/01/16 **:**:**
# Last Change: 2020/04/15 21:45:15.

# 以下の31を変えることで、様々な色に変えられる。#  {{{
# echo -e "\033[0;31mテキスト\033[0;39m"
    # 文字色のカラーバリエーション
        # 30 => 黒 : Black
        # 31 => 赤 : Red
        # 32 => 緑 : Green
        # 33 => 黄色 : Yellow
        # 34 => 青 : Blue
        # 35 => マゼンダ : Magenta
        # 36 => シアン : Cyan
        # 37 => 白 : White
    # 文字背景のカラーバリエーション
        # 40 => 黒 : Black
        # 41 => 赤 : Red
        # 42 => 緑 : Green
        # 43 => 黄色 : Yellow
        # 44 => 青 : Blue
        # 45 => マゼンダ : Magenta
        # 46 => シアン : Cyan
        # 47 => 白 : White
    # 以下の太字部分を変えれば、太字や下線も適用可能。
        # echo -e "\033[0;31mテキスト\033[0;39m"
        # 0 => ノーマル : All attributs off
        # 1 => 太字 : Bold on
        # 4 => 下線 : Underscore (on monochrome display adapter only)
        # 5 => 点滅 : Blink on
        # 7 => 色反転 Reverse video on
        # 8 => Concealed on
    # }}}

# "echo" 強調（情報メッセージ用: 緑色）
# "Mac" で化けるので "printf" にした
# TODO: "Linux" で動作確認
function gm_echo {
    printf "\e[32m$*\e[m\n"
}

# "echo" 強調（警告メッセージ用: 黄色）
function ym_echo {
    # echo -e "\e[33m$*\e[m"
    printf "\e[33m$*\e[m\n"
}

# "echo" 強調（異常メッセージ用: 赤色 太字 下線）
function rb_echo {
    # echo -e "\e[31;4m$*\e[m"
    printf "\e[31;4m$*\e[m\n"
}

# 色付きのテキストを端末で使用する設定
tput=$(which tput)
if [ -n "$tput" ]; then
    ncolors=$($tput colors)
fi

if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

# info: 情報を緑色で出力
function info() {
    printf "${GREEN}"
    echo -n "  INFO:     "
    printf "${NORMAL}"
    echo "$1"
}

# warn: 警報を黄色で出力
function warn() {
    printf "${YELLOW}"
    echo -n "  WARNING!: "
    printf "${NORMAL}"
    echo "$1"
}

# error: エラーを赤色で出力
function error() {
    printf "${RED}"
    echo -n "  ERROR!!:  "
    printf "${NORMAL}"
    echo "$1"
}
