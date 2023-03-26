#!/usr/bin/env bash
# @(#) Setting Menubar
# Created:     2018/06/03 17:59:45
# Last Change: 2020/05/02 23:25:56.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="setting Menubar"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

# バッテリー残量を％表記に
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 日付と時刻のフォーマット(24時間表示、秒表示あり、日付・曜日を表示)
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

result_echo $? "${PROCESS}"
