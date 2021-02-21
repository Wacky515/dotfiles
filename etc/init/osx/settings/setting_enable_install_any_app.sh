#!/usr/bin/env bash
# @(#) Setting enable install any apps
# Created:     2018/06/22 22:32:18
# Last Change: 2020/05/02 23:23:00.

set -ueo pipefail
export LC_ALL=C

## 髢「謨ー
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="setting enable install any apps"

gm_echo ">> ${PROCESS^}"

# "縺吶∋縺ヲ縺ョ繧「繝励Μ繧ア繝シ繧キ繝ァ繝ウ繧定ィア蜿ッ" 繧貞セゥ豢サ
sudo spctl 窶杜aster-disable

result_echo $? "${PROCESS}"
