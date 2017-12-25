#!bin/bash

# apt update
sudo bash ./apt_update.sh

for f in *.sh
do
    [[ ${f} = "apt_update.sh" ]] && continue 
    sudo bash ./${f}
done

sudo bash ./apt_update.sh

# ディストリビューション 判別
declare -a info=($(./get_distribution.sh))

case ${info[0]} in
    ubuntu)
        echo "Ubuntu"
        #         if [[ ${info[1]} == "x86_64" ]]; then
        #             echo "64bit"
        #         fi
        cd ./ubuntu
        sudo bash ./*sh
        ;;
    debian)
        echo "Debian"
        cd ./debian
        sudo bash ./*sh
        ;;
    *)
        echo "unsupported"
        ;;
esac
