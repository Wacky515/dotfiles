#!/usr/bin/env bash
# @(#) Setting Hot Corner
# Created:     2018/06/03 18:07:21
# Last Change: 2018/06/03 18:09:11.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting Hot Corner"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

# 左上 "スクリーンセーバー起動"
# defaults write com.apple.dock wvous-tl-corner -int 5
# defaults write com.apple.dock wvous-tl-modifier -int 0

# 右上 "ディスプレイをスリープ"
# defaults write com.apple.dock wvous-tr-corner -int 10
# defaults write com.apple.dock wvous-tr-modifier -int 0

result_echo $? "${PROCESS}"
