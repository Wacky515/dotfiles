#!/bin/bash
# @(#) Install gtran
# Created:     2020/04/15 21:20:26
# Last Change: 2020/04/15 21:40:21.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly         APPS="gtran"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

git clone https://github.com/skanehira/gtran.git
cd gtran
go install

result_echo $? "${PROCESS_LOWC}"
