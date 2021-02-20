#!/bin/bash
# Created:     2019/10/02 13:51:56
# Last Change: 2019/11/13 12:38:15.

# TODO: OneDrive �t�H���_�̃_�E�����[�h ������

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install mozc"

ym_echo ">> ${PROCESS^}"

# �T�[�r�X��~ �K�v�H

# �o�b�N�A�b�v
db=(boundary.db \
    cform.db \
    config1.db \
    segment.db \
    user_dictionary.db)
for i in db
do
    mv --suffix=_`date +%Y%m%d` -f ${i} ${i}
done

# �V���{���b�N�����N
for j in db
do
    ln -snfv ~/OneDrive/�d��/Settings/GoogleJanaeseinput/${j} ${j}
done

result_echo $? "${PROCESS}"
=======
#!/bin/bash
# Created:     2019/10/02 13:51:56
# Last Change: 2019/11/13 12:38:15.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="install mozc"

ym_echo ">> ${PROCESS^}"

# �T�[�r�X��~ �K�v�H

# �o�b�N�A�b�v
db=(boundary.db \
    cform.db \
    config1.db \
    segment.db \
    user_dictionary.db)
for i in db
do
    mv --suffix=_`date +%Y%m%d` -f ${i} ${i}
done

# �V���{���b�N�����N
for j in db
do
    ln -snfv ~/OneDrive/�d��/Settings/GoogleJanaeseinput/${j} ${j}
done

result_echo $? "${PROCESS}"
