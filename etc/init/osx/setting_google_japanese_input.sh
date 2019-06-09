#!bin/bash
# @(#) Setting Google Japanese Input
# Created:     2019/04/21 08:57:17
<<<<<<< HEAD
# Last Change: 2019/04/21 14:26:32.
=======
# Last Change: 2019/06/01 10:18:09.
>>>>>>> 1c037ae4ca2fcb51bd312ee38b2e5eb83cdc86c6

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting Google Japanese Input"
gm_echo ">> ${PROCESS^}"

<<<<<<< HEAD

=======
>>>>>>> 1c037ae4ca2fcb51bd312ee38b2e5eb83cdc86c6
readonly GGJDB=~"/Library/Application Support/Google/JapaneseInput"
readonly GGSRC=~"/Library/Application Support/Google"
readonly SYSRC=~"/OneDrive/仕事/Settings/GoogleJapanaeseInput"

zip -m ${GGJDB}/-`date +%Y%m%d`.zip ${GGSRC}
mkdir ${GGJDB}

for i in *.db
do
    gm_echo set ${i}
    ln -snfv ${SYSRC} ${i}
done

result_echo $? "${PROCESS}"
