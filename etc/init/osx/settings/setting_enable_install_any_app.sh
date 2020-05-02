#!/usr/bin/env bash
# @(#) Setting enable install any apps
# Created:     2018/06/22 22:32:18
# Last Change: 2020/05/02 23:23:00.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="setting enable install any apps"

gm_echo ">> ${PROCESS^}"

# "すべてのアプリケーションを許可" を復活
sudo spctl –master-disable

result_echo $? "${PROCESS}"
