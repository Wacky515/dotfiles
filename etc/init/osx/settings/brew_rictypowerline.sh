#!/bin/bash
# @(#) Install Ricty for PowerLine
# Created:     2018/04/12 06:23:00
# Last Change: 2019/11/05 15:18:23.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install Ricty for PowerLine"

gm_echo ">> ${PROCESS^}"

if ! has "brew"; then
    echo info ">> Install Brew frst"
    bash ~/dotfiles/etc/init/osx/settings/install_homebrew.sh
fi

# インストールされている "Ricty" をアンインストール
brew uninstall ricty
# "tap" でリポジトリ 追加
brew tap sanemat/font

brew install --vim-powerline ricty

# 展開ディレクトリは環境に合わせる
# cp -f /usr/local/Cellar/ricty/3.2.3/share/fonts/Ricty*.ttf ~/Library/Fonts/
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/

# フォントのキャッシュ削除
fc-cache -vf

git clone https://github.com/powerline/fonts.git ~/.font
cd ~/.font
./install.sh

result_echo $? "${PROCESS}"

# シェルの再起動
exec $SHELL -l
