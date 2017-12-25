#!bin/bash
# @(#) Init Linux

source ~/dotfiles/function/result_echo.sh

# apt update
ym_echo ">> Init update"
sudo bash ./apt_update.sh

ym_echo ">> Init install"
# for f in install_*.sh
# do
#     [[ ${f} = "apt_update.sh" ]] && continue 
#     sudo bash ./${f}
# done
# sudo bash ./install_*.sh
for f in install_*.sh
do
# sudo bash ./install_*.sh
sudo bash ./${f}
done

ym_echo ">> Init setting"
# sudo bash ./setting_*.sh
for g in setting_*.sh
do
# sudo bash ./setting_*.sh
sudo bash ./${g}
done

ym_echo ">> Install & setting each distribution"
# ディストリビューション 判別
declare -a info=($(./get_distribution.sh))

case ${info[0]} in
    ubuntu)
        ym_echo ">> Distribution is Ubuntu"
        #         if [[ ${info[1]} == "x86_64" ]]; then
        #             echo "64bit"
        #         fi
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
# sudo bash ./install_*.sh
sudo bash ./${h}
done

ym_echo ">> Setting"
for i in setting_*.sh
do
# sudo bash ./setting_*.sh
sudo bash ./${i}
done

cd -
ym_echo ">> Final update"
sudo bash ./apt_update.sh
