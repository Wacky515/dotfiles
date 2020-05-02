#!/usr/bin/env bash
# @(#) Setting keyboard
# Created:     2018/06/03 17:53:29
# Last Change: 2018/06/03 17:56:44.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="setting keyboard"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

# フルキーボードアクセス 有効
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# "fu" を標準ファンクションキーとする
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

result_echo $? "${PROCESS}"
