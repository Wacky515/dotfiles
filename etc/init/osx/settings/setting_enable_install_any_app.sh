#!/usr/bin/env bash
# @(#) Setting enable install any apps
# Created:     2018/06/22 22:32:18
# Last Change: 2023/03/11 21:34:54.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="setting enable install any apps"

gm_echo ">> ${PROCESS^}"

# "すべてのアプリケーションを許可" を復活
sudo spctl 窶杜aster-disable

result_echo $? "${PROCESS}"
