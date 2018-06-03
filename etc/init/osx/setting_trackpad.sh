#!/usr/bin/env bash
# @(#) Setting Trackpad
# Created:     2018/06/02 00:00:00
# Last Change: 2018/06/03 18:14:13.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting Trackpad"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

# タップでクリック
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# スクロール方向をナチュラルと逆方向
defaults write -g com.apple.swipescrolldirection -bool false

result_echo $? "${PROCESS}"
