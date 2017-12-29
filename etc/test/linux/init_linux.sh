#!bin/bash
# @(#) Init Linux

source ~/dotfiles/function/result_echo.sh

# **
bash ~/dotfiles/link.sh

# apt update
ym_echo ">> Init update"
sudo bash ./apt_update.sh

ym_echo ">> Init install"
for f in install_*.sh
do
sudo bash ./${f}
done

ym_echo ">> Init setting"
for g in setting_*.sh
do
sudo bash ./${g}
done

# ディストリビューション、ビット数 判別
declare -a info=($(./get_distribution.sh))
ym_echo ">> Install & setting each bit"
if [[ ${info[1]} == "x86_64" ]]; then
    echo "64bit"
    os_bit=x64
else 
    echo "32bit"
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
# declare -a info=($(./get_distribution.sh))

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
        ;;
esac

ym_echo ">> Install"
for h in install_*.sh
do
sudo bash ./${h}
done

ym_echo ">> Setting"
for i in setting_*.sh
do
sudo bash ./${i}
done

cd ./${os_bit}
ym_echo ">> Install for ${os_bit}"
for j in install_*.sh
do
sudo bash ./${j}
done

ym_echo ">> Setting for ${os_bit}"
for k in setting_*.sh
do
sudo bash ./${k}
done
cd ../..

ym_echo ">> Final update"
sudo bash ./apt_update.sh
