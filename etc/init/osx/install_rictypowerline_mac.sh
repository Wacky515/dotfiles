#!/bin/sh

brew update

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
