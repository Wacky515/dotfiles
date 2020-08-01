#!/usr/bin/env bash
# @(#) Install Ricty for PowerLine
# Created:     2018/04/12 06:23:00
# Last Change: 2020/08/01 22:04:27.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="Ricty for PowerLine"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    echo info ">> Install Brew first"
    bash ~/dotfiles/etc/init/osx/settings/install_homebrew.sh
fi

# インストールされている "Ricty" をアンインストール
brew uninstall ricty
# "tap" でリポジトリ 追加
brew tap sanemat/font

brew install --vim-powerline ricty

# 展開ディレクトリは環境に合わせる
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/

# フォントのキャッシュ削除
fc-cache -vf

git clone https://github.com/powerline/fonts.git ~/Downloads/.font
cd ~/Downloads/.font
./install.sh

result_echo $? "${PROCESS_LOWS}"

# シェルの再起動
exec $SHELL -l
