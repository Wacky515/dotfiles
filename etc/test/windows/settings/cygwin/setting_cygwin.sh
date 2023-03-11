#!/bin/bash
# @(#) Setting "apt-cyg"
# Created:     2018/04/13 09:59:50
# Last Change: 2019/10/08 15:10:57.
# FIXME: 手打ちでは行けるから改行コードがNGっぽい

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

# ym_echo ">> Start "

# "cygwin" ターミナルを開きリポジトリをクローンする
# 公式は transcode-open だが野良も含めて多数の fork あり
# 下記の「参考記事」に紹介されているので好みのリポジトリを選択
cd ~/
git clone https://github.com/transcode-open/apt-cyg.git
cd apt-cyg/

# "Git" の改行コード設定を、"Windows" 環境にあわせ "CRLF" にしている場合
# 改行コード "LF" で "apt-cyg" を再取得
git config core.autocrlf input
rm -f apt-cyg
git reset --hard

# PATH設定
install apt-cyg /usr/local/bin

cd ~/
# 国内の "cygwin" リポジトリを登録
apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/ update

# fish インストール
apt-cyg install fish

# 以後はバージョンアップタイミングで下記実行
# cd apt-cyg/
# git pull
# install apt-cyg /usr/local/bin
