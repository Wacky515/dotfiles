#!/usr/bin/env bash
# @(#) Initialize OS X
# Created:     2018/05/21 16:55:15
# Last Change: 2021/03/02 22:13:10.

set -euo pipefail
export LC_ALL=C

## 関数
if [ -f ~/.bash_function ]; then
    source ~/.bash_function
else
    source ~/dotfiles/.bash_function
fi
# [ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="init OS X"

# ↓テスト用 echo のエラー解消したら消す
set +e

gm_echo ">> ${PROCESS^}"

# Make symbolic link
gm_echo ">> Link setting files"
gm_echo "    >> Call symbolic linking script"
bash ~/dotfiles/link.sh

cd ~/dotfiles/etc/init/osx/setting/

gm_echo ">> Install Homebrew"
gm_echo "    >> Call install Homebrew"
bash ./install_homebrew.sh

gm_echo ">> Init brew install"
for f in brew_*.sh
do
    # sudo bash ./${f}
    bash ./${f}
done

cd ~/dotfiles/etc/test/osx/setting/

gm_echo ">> Init brew install(Test)"
for f in brew_*.sh
do
    # sudo bash ./${f}
    bash ./${f}
done

cd ~/dotfiles/etc/init/osx/setting/

gm_echo ">> Init setting"
for g in setting_*.sh
do
    # sudo bash ./${g}
    bash ./${g}
done

cd ~/dotfiles/etc/test/osx/setting/

gm_echo ">> Init setting(Test)"
for g in setting_*.sh
do
    # sudo bash ./${g}
    bash ./${g}
done

result_echo $? "${PROCESS}"
