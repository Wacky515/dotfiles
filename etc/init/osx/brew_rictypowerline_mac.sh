#!/bin/bash
# @(#) Install Ricty for powerline
# Created:     2018/04/12 06:23:00
# Last Change: 2018/05/03 12:44:48.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

ym_echo ">> Start install Ricty for powerline"
sh ~/dotfiles/etc/init/osx/install_homebrew.sh

# すでにRictyがインストールされている場合
brew uninstall ricty

# Rictyがインストールされていない場合tapでリポジトリを追加する
brew tap sanemat/font

brew install --vim-powerline ricty

# 展開ディレクトリは環境に合わせる
# cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/

# フォントのキャッシュ削除
fc-cache -vf

# シェルの再起動
exec $SHELL -l
