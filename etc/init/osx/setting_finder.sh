#!/bin/bash
# @(#) Setting Finder
# Created:     2018/05/26 00:00:00
# Last Change: 2018/06/03 18:06:51.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting Finder"

gm_echo ">> ${PROCESS^}"

# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 保存ダイアログを詳細設定で表示
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -boolean true

# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -boolean true

# リストビュー表示をデフォルト
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# タイトルバーにフルパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# QuickLookでテキストを選択
defaults write com.apple.finder QLEnableTextSelection -bool true

killall Finder
result_echo $? "${PROCESS}"
