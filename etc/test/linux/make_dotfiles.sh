#!/bin/bash
# @(#) Initial install dotfiles
# Created:     2018/05/09 10:15:36
# Last Change: 2018/05/28 15:59:38.

# FIXME: OS X: echoの文頭名のファイルが生成されてしまう

# DONE: "type" を "has" に置き換える

set -euo pipefail

# source ~/dotfiles/function/result_echo.sh /dev/null 2>&1
# source ~/dotfiles/function/color_echo.sh /dev/null 2>&1

readonly PROCESS="make dotfiles"

readonly DOT_DIRECTORY="${HOME}/dotfiles"
readonly GIT_URL="https://github.com/Wacky515/dotfiles.git"

# ym_echo ">> ${PROCESS^}" /dev/null 2>&1 || echo ">> ${PROCESS^}"

### 設定
# 色付きのテキストを端末で使用する設定
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

### 関数群
# info: 情報を緑色で出力
info() {
    printf "${GREEN}"
    echo -n "  INFO:     "
    printf "${NORMAL}"
    echo "$1"
}

# warn: 警報を黄色で出力
warn() {
    printf "${YELLOW}"
    echo -n "  WARNING!: "
    printf "${NORMAL}"
    echo "$1"
}

# error: エラーを赤色で出力
error() {
    printf "${RED}"
    echo -n "  ERROR!!:  "
    printf "${NORMAL}"
    echo "$1"
}

# log: ログを通常の色で出力
log() {
    echo "  $1"
}

# "sed" の差異吸収
if sed --version 2>/dev/null | grep -q GNU; then
    alias sedi='sed -i '
else
    alias sedi='sed -i "" '
fi

# パッケージの存在確認
has() {
    type "$1" > /dev/null 2>&1
}

# シンボリックリンクの追加
symlink() {
    [ -e "$2" ] || ln -sf "$1" "$2"
}

### MAIN
dotfiles_logo='
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝

*** WHAT IS INSIDE? ***
1. Download dotfiles from "https://github.com/Wacky515/dotfiles"
2. Symbolic linking dotfiles to home directory
3. Install packages

*** HOW TO INSTALL? ***
See the README for documentation.
Licensed under the MIT license.
'

printf "${BOLD}"
echo   "$dotfiles_logo"
printf "${NORMAL}"

info "*** ATTENTION ***"
info "This script can change your entire setup."
info "I recommend to read first. You can even copy commands one by one."
echo ""
read -p "$(warn 'Start install? [y/N] ')" -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
echo ""

error "Installation failed. Nothing changed."
exit 1
fi
echo ""

info "Start install the dotfiles"
# "dotfiles/.git" がなければ "git clone" かダウンロード
if [ ! -d ${DOT_DIRECTORY}"/.git" ]; then
    if [ -d ${DOT_DIRECTORY} ]; then
        rm -r ${DOT_DIRECTORY}
    fi

    info "Downloading dotfiles..."
    if [ "$(uname)" == "Darwin" ]; then
        if has "brew"; then
            brew update
            brew install git
        else
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            /usr/local \
            /usr/local/var/homebrew \
            /usr/local/var/homebrew/locks \
            /usr/local/lib/pkgonfig \
            /usr/local/lib/share/local \
            /usr/local/lib/share/man
            brew update
            brew install git
        fi
    fi

    if has "git"; then
    # if type "git" > /dev/null 2>&1; then
        warn "Already install git"

    else
        warn "Install Git first"
        if has "apt"; then
        # if type "apt" > /dev/null 2>&1; then
            sudo apt -y install git
        elif has "yum"; then
        # elif type "yum" > /dev/null 2>&1; then
            sudo yum -y install git
        fi
    fi

    info "Git clone..."
    cd ~/
    git clone "${GIT_URL}"

    info "Download dotfiles complete"
else
    info "Aleady exist dotfiles"
fi
echo ""

# OS毎の設定
case ${OSTYPE} in
darwin*)
    # "OS X" 用設定
    info "Check install Bash4.x"
    if [ ! -e /usr/local/bin/bash ]; then
        info "Brew install Bash4.x"

        brew upgrade bash > /dev/null 2>&1
        sudo bash -c "echo /usr/local/bin/bash >> /etc/shells"
        chsh -s /usr/local/bin/bash

        # ↓端末再起動要否は未確認
        # exec $SHELL -l
    else
        info "Installed Bash4.x"
    fi
    echo ""

    info "Call setting OS X"
    bash ~/dotfiles/etc/test/osx/init_osx.sh
    ;;

linux*)
    # "Linux" 用設定
    info "Call setting Linux"
    sh ~/dotfiles/etc/test/linux/init_linux.sh
    ;;
esac

result_echo $? "${PROCESS}" 2>&1 || info $? "${PROCESS}"
