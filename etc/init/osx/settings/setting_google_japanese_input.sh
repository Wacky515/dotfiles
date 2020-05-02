#!/usr/bin/env bash
# @(#) Setting Google Japanese Input
# Created:     2019/04/21 08:57:17
# Last Change: 2020/05/02 23:25:01.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="setting Google Japanese Input"
gm_echo ">> ${PROCESS^}"

readonly GGJDB=~"/Library/Application Support/Google/JapaneseInput"
readonly GGSRC=~"/Library/Application Support/Google"
readonly SYSRC=~"/OneDrive/仕事/Settings/GoogleJapanaeseInput"

zip -m ${GGJDB}/-`date +%Y%m%d`.zip ${GGSRC}
mkdir -m 777 ${GGJDB}

for i in *.db
do
    gm_echo set ${i}
    ln -snfv ${SYSRC} ${i}
done

result_echo $? "${PROCESS}"
