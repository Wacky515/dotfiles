#!bin/bash
# @(#) Setting Google Japanese Input
# Created:     2019/04/21 08:57:17
# Last Change: 2019/10/01 09:54:33.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

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
