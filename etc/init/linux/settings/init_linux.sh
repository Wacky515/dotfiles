#!bin/bash
# @(#) Initialize Linux
# Created:     2017/12/25 **:**:**
# Last Change: 2019/11/18 17:12:20.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="initialize Linux"

ym_echo ">> ${PROCESS^}"

# Make symbolic link
bash ~/dotfiles/link.sh

ym_echo ">> Init update"
if has "apt"; then
    sudo bash ./update_apt.sh
elif has "yum"; then
    sudo bash ./update_yum.sh
fi

# ym_echo ">> Setting English directory name"
sudo bash ./setting_eng_dir_name.sh

ym_echo ">> Init install"
for f in install_*.sh
do
    sudo bash ./${f}
done

ym_echo ">> Init setting"
for g in setting_*.sh
do
    [[ ${g} = "setting_eng_dir_name.sh" ]] && continue
    sudo bash ./${g}
done

# �r�b�g���A�f�B�X�g���r���[�V���� ����
sudo chmod 777 ~/dotfiles/etc/init/linux/settings/get_distribution.sh
declare -a info=($(~/dotfiles/etc/init/linux/settings/get_distribution.sh))
# bits=$(uname -m)
ym_echo ">> Install & setting each bit"
if [[ ${info[1]} == "x86_64" ]]; then
# if [[ ${bits} == "x86_64" || "amd64"]]; then
    echo ">> 64bit"
    os_bit=x64
else
    echo ">> 32bit"
    os_bit=x32
fi
cd ~/dotfiles/etc/init/linux/settings/${os_bit}

ym_echo ">> Install for ${os_bit}"
for l in install_*.sh
do
    sudo bash ./${l}
done

ym_echo ">> Setting for ${os_bit}"
for m in setting_*.sh
do
    sudo bash ./${m}
done

cd -

ym_echo ">> Install & setting each distribution"
# �f�B�X�g���r���[�V���� ����
# declare -a info=($(~/dotfiles/etc/init/linux/settings/get_distribution.sh))

case ${info[0]} in
    ubuntu)
        ym_echo ">> Distribution is Ubuntu"
        cd ~/dotfiles/etc/init/linux/settings/ubuntu
        ;;
    debian)
        ym_echo ">> Distribution is Debian"
        cd ~/dotfiles/etc/init/linux/settings/debian
        ;;
    *)
        rb_echo ">> Unsupported"
        cd ~/dotfiles/etc/init/linux/settings/unsup
        ;;
esac

ym_echo ">> Install for ${info[0]}"
for h in install_*.sh
do
    sudo bash ./${h}
done

ym_echo ">> Setting for ${info[0]}"
for i in setting_*.sh
do
    sudo bash ./${i}
done

cd ./${os_bit}
ym_echo ">> Install for ${info[0]} ${os_bit}"
for j in install_*.sh
do
    sudo bash ./${j}
done

ym_echo ">> Setting for ${info[0]} ${os_bit}"
for k in setting_*.sh
do
    sudo bash ./${k}
done

cd ~/dotfiles/etc/init/linux/settings

ym_echo ">> Final update"
sudo bash ./apt_update.sh

ym_echo ">> Init setting"

# TEST: "Dock" �� "Amazon" �폜
sudo apt remove ubuntu-web-launchers -y

# TEST: "Mozc" ���p�X�y�[�X �ݒ�
/usr/lib/mozc/mozc_tool -mode=config_dialog

result_echo $? "${PROCESS}"
