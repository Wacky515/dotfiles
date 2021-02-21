#!/bin/bash
# @(#) Install Git 2.15.1
# Created:     2018/05/10 18:12:30
# Last Change: 2018/05/10 18:16:30.

# TODO: "Git" の "ver" を変数化
#       今は "2.15.1 " 固定

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install Git 2.15.1"
ym_echo ">> ${PROCESS^}"

DOT_DIRECTORY="${HOME}/dotfiles"
GIT_URL="https://github.com/Wacky515/dotfiles.git"

if type "apt" > /dev/null 2>&1; then
    sudo apt -y remove git
    sudo apt -y install \
        libcurl4-gnutls-dev \
        libexpat1-dev \
        gettext \
        libz-dev \
        libssl-dev \
        autoconf \
        asciidoc \
        xmlto \
        docbook2x \
        make \
        gcc
    wget https://github.com/git/git/archive/v2.15.1.tar.gz
    tar -zxf v2.15.1.tar.gz
    cd git-2.15.1
    make configure
    ./configure --prefix=/usr
    make all doc info
    sudo make install install-doc install-html install-info
    cd ..
    rm -r git-2.15.1
    rm -r v2.15.1.tar.gz

elif type "yum" > /dev/null 2>&1; then
    sudo yum -y remove git
    sudo yum -y install \
        curl-devel \
        expat-devel \
        gettext-devel \
        openssl-devel \
        perl-devel \
        zlib-devel \
        autoconf \
        asciidoc \
        xmlto \
        docbook2X \
        make \
        gcc
    sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
    wget https://github.com/git/git/archive/v2.15.1.tar.gz
    tar -zxf v2.15.1.tar.gz
    cd git-2.15.1
    make configure
    ./configure --prefix=/usr
    make all doc info
    sudo make install install-doc install-html install-info
fi

result_echo $? "${PROCESS}"
