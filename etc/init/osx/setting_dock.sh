#!/bin/bash
# @(#) Setting Dock
# Created:     2018/05/26 00:00:00
# Last Change: 2018/06/03 18:01:18.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting Dock"

gm_echo ">> ${PROCESS^}"

# 通常サイズ
defaults write com.apple.dock tilesize -int 32

# 拡大を有効
defaults write com.apple.dock magnification -bool true

# 拡大時のサイズ (一般的な最大: 128)
defaults write com.apple.dock largesize -int 128

killall Dock
result_echo $? "${PROCESS}"
