#!/bin/bash
# @(#) Initial install dotfiles
# Created:     2018/05/09 10:15:36
# Last Change: 2018/05/21 16:58:04.

source ~/dotfiles/function/result_echo.sh 2>&1
source ~/dotfiles/function/color_echo.sh 2>&1

readonly PROCESS="make dotfiles"

DOT_DIRECTORY="${HOME}/dotfiles"
GIT_URL="https://github.com/Wacky515/dotfiles.git"

ym_echo ">> ${PROCESS^}" 2>&1 || echo ">> ${PROCESS^}"

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

    # OS毎の設定
    case ${OSTYPE} in
        darwin*)
            # "Mac" 用設定
            sh ~/dotfile/etc/test/osx/init_osx.sh
            ;;

        linux*)
            # "Linux" 用設定
            sh ~/dotfile/etc/test/linux/init_linux.sh
            ;;

else
    echo ">> Aleady exist dotfiles directory"
fi

result_echo $? "${PROCESS}" 2>&1 || echo $? "${PROCESS}"
