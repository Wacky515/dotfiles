#!/bin/bash
# @(#) Initial install dotfiles
# Created:     2018/05/09 10:15:36
# Last Change: 2018/05/21 16:58:04.

set -euo pipefail

# source ~/dotfiles/function/result_echo.sh 2>&1
# source ~/dotfiles/function/color_echo.sh 2>&1

#! readonly PROCESS="make dotfiles"

DOT_DIRECTORY="${HOME}/dotfiles"
GIT_URL="https://github.com/Wacky515/dotfiles.git"

# ym_echo ">> ${PROCESS^}" 2>&1 || echo ">> ${PROCESS^}"

# use colors on terminal
tput=$(which tput)
if [ -n "$tput" ]; then
  ncolors=$($tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

### functions
# info: output terminal green
info() { 
  printf "${GREEN}"
  echo -n "  info  "
  printf "${NORMAL}"
  echo "$1"
}

# error: output terminal red
error() {
  printf "${RED}"
  echo -n "  error "
  printf "${NORMAL}"
  echo "$1"
}

# warn: output terminal yellow
warn() {
  printf "${YELLOW}"
  echo -n "  warn  "
  printf "${NORMAL}"
  echo "$1"
}

# log: out put termial normal
log() { 
  echo "  $1" 
}

# fix sed command diff between GNU & BSD
if sed --version 2>/dev/null | grep -q GNU; then
  alias sedi='sed -i '
else
  alias sedi='sed -i "" '
fi

# check package
has() {
  type "$1" > /dev/null 2>&1
}
# create symlink
symlink() {
  [ -e "$2" ] || ln -sf "$1" "$2"
}

### Start install script
dotfiles_logo='
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝

*** WHAT IS INSIDE? ***
1. Download my dotfiles from https://github.com/Wacky515/dotfiles
2. Symlinking dotfiles to home directory
3. Install packages

*** HOW TO INSTALL? ***
See the README for documentation.
Licensed under the MIT license.  
'

printf "${BOLD}"
echo   "$dotfiles_logo"
printf "${NORMAL}"

log "*** ATTENTION ***"
log "This script can change your entire setup."
log "I recommend to read first. You can even copy commands one by one."
echo ""
read -p "$(warn 'Start install? [y/N] ')" -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo ""
  error 'Installation failed. Nothing changed.'
  exit 1
fi

echo ""
info "Start install the dotfiles."
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
