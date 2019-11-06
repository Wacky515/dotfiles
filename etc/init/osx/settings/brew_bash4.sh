#!/usr/bin/env bash
# @(#) Install Bash 4.*
# Created:     2019/11/05 15:38:58
# Last Change: 2019/11/05 16:40:49.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="Bash 4.*"

gm_echo ">> Install ${PROCESS}"

if [ `bash --version | grep '2007'` ] ; then
    if ! has "brew"; then
        echo info ">> Install Brew frst"
        bash ~/dotfiles/etc/init/osx/install_homebrew.sh
    fi
    brew install bash
else
    echo ">> Already Bash 4.*"
fi

result_echo $? "install ${PROCESS}"
