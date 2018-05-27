#!/bin/bash
# @(#) Install Ricty for powerline
# Created:     2018/04/12 06:23:00
# Last Change: 2018/05/27 16:50:36.

# source ~/dotfiles/function/result_echo.sh
# source ~/dotfiles/function/color_echo.sh
source ~/dotfiles/function/*.sh

readonly PROCESS="install Ricty for powerline"

ym_echo ">> ${PROCESS^}"
# ym_echo ">> Start install Ricty for powerline"
if [ !has brew ]
    sh ~/dotfiles/etc/init/osx/install_homebrew.sh
fi
# sh ~/dotfiles/etc/init/osx/install_homebrew.sh

# インストールされている "Ricty" をアンインストール
brew uninstall ricty
# "tap" でリポジトリを追加する
brew tap sanemat/font

brew install --vim-powerline ricty

# 展開ディレクトリは環境に合わせる
# cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/

# フォントのキャッシュ削除
fc-cache -vf

result_echo $? "${PROCESS}"

# シェルの再起動
exec $SHELL -l
