#!bin/bash
# @(#) Init Linux
# Created:     2017/12/25 00:00:00
# Last Change: 2019/10/31 11:35:46.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="init Linux"
ym_echo ">> ${PROCESS^}"

# Make symbolic link
bash ~/dotfiles/link.sh

ym_echo ">> Init update"
if type "apt" > /dev/null 2>&1; then
    sudo bash ./apt_update.sh
elif type "yum" > /dev/null 2>&1; then
    sudo bash ./yum_update.sh
fi

ym_echo ">> Setting English directory name"
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

# ディストリビューション、ビット数 判別
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
cd ./${os_bit}

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
# ディストリビューション 判別
# declare -a info=($(~/dotfiles/etc/init/linux/settings/get_distribution.sh))

case ${info[0]} in
    ubuntu)
        ym_echo ">> Distribution is Ubuntu"
        cd ./ubuntu
        ;;
    debian)
        ym_echo ">> Distribution is Debian"
        cd ./debian
        ;;
    *)
        rb_echo ">> Unsupported"
        cd ./unsup
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

result_echo $? "${PROCESS}"
