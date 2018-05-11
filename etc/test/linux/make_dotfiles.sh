#!/bin/bash
# @(#) Initial install dotfiles
# Created:     2018/05/09 10:15:36
# Last Change: 2018/05/10 19:56:39.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="make dotfiles"

DOT_DIRECTORY="${HOME}/dotfiles"
GIT_URL="https://github.com/Wacky515/dotfiles.git"

ym_echo ">> ${PROCESS^}"

# "dotfiles/.git" がなければ "git clone" かダウンロード
if [ ! -d ${DOT_DIRECTORY}"/.git" ]; then
    if [ ! -d ${DOT_DIRECTORY}]; then
        rm -r ${DOT_DIRECTORY}
    fi

    echo ">> Downloading dotfiles..."
    if type "git" > /dev/null 2>&1; then
        echo ">> Git clone"
        cd ~/
        git clone "${GIT_URL}"

    else
        echo ">> Install Git first"
        if type "apt" > /dev/null 2>&1; then
            sudo apt -y install git
        elif type "yum" > /dev/null 2>&1; then
            sudo yum -y install git
        fi

        echo ">> Git clone..."
        cd ~/
        git clone "${GIT_URL}"
    fi

    echo ">> Download dotfiles complete"
    sh ~/dotfile/link.sh
    # TODO: OSXの時
    # ↓ 未作成
    # sh ~/dotfile/etc/test/osx/init_osx.sh
    # それ以外で条件分岐
    sh ~/dotfile/etc/test/linux/init_linux.sh

else
    echo ">> Aleady exist dotfiles directory"
fi

result_echo $? "${PROCESS}"
