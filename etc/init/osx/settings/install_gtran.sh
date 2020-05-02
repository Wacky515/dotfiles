#!/usr/bin/env bash
# @(#) Install gtran
# Created:     2020/04/15 21:20:26
# Last Change: 2020/05/02 23:23:26.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="gtran"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

cd ~/
git clone https://github.com/skanehira/gtran.git
cd gtran
go install

result_echo $? "${PROCESS_LOWC}"
