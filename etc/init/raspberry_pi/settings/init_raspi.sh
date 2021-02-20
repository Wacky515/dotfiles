#!/bin/bash
# @(#) Init setting Raspberry Pi

# FIXME:

# TODO:
    # Wi-Fi �����ݒ�

# DONE  :#{{{
    # "source" �̎Q�Ɛ� "/home/pi" �𓮓I�ɂ���
    # -> ���ʂ� "sudo" ���C�����ĉ���
    # TightVNCServerVNC �����N��
    # �C���X�g�[���p�X�N���v�g�̋��ʁEGUI�ELite�t�H���_����
    # "Jessie" �� "Jessie Lite" �̏��� ������
    # �؂�o�����֐� �t�H���_���
    # ���s���� "echo" �֐� �؂�o��
    # �F�t�� "echo" �֐� �؂�o��
    # IP Addr �Œ�i�A�h���X��W�����͂���j
    # Wi-Fi�i����E���Proxy�j SSID Pass �ݒ�
    # ���v���킹
#}}}

source ~/dotfiles/function/result_echo.sh

# �t�@�[���ƃp�b�P�[�W �A�b�v�f�[�g
update_package(){
	# �p�b�P�[�W �A�b�v�f�[�g
    ym_echo ">> Init package update"
    echo ""
	sudo apt update && \
	sudo apt -y upgrade && \
	sudo apt -y dist-upgrade && \

    # "Jessie Lite" �ł͂Ȃ����̏���
    readonly VER=$(dpkg -l | grep xinit)
    if [ "$VER" != "" ]
    then
        # �t�@�[�� �A�b�v�f�[�g
        ym_echo ">> Execute \"rpi-update\""
        sudo rpi-update || \
        rb_echo ">> Fail \"rpi-update\""
    fi

    # �A�b�v�f�[�g �㏈��
    # MEMO: "autoremove" ������ "apt-get" �̂܂�
	sudo apt-get -y autoremove && \

    ym_echo ">> Success init package update" || \
    rb_echo ">> Fail init package update"
    echo ""
}

# �e�p�b�P�[�W �C���X�g�[��
install_package(){
    ym_echo ">> Init install packages"
    echo ""

    # "zsh" �C���X�g�[��
    ym_echo ">> Install \"zsh\""
    sudo apt install -y zsh
    result_echo $? "install \"zsh\""

	# "Vim" �C���X�g�[��
    ym_echo ">> Install \"Vim\""
	sudo apt install -y vim && \
	sudo apt install -y vim-gtk
    result_echo $? "install \"Vim\""

	# ���z�[�� �C���X�g�[��
	# sudo apt install -y byobu

    # "Jessie Lite" �ł͂Ȃ����̏���
    sudo bash ./gui_packages.sh
}

# �Ǝ��ݒ�
setup_dotfiles(){
    ym_echo ">> Init setting"
    echo ""

    # "link.sh" ���{
    bash /home/pi/dotfiles/link.sh

    # ���v "JST" �ɐݒ�
    bash ./setting_jst.sh

    # �L�[�{�[�h�z�� �ύX
    bash ./setting_keyboard.sh

    # Wi-Fi �ݒ�
    bash ./setting_wifi.sh

    # SSH �L����
    bash ./setting_ssh.sh

    # zsh �ݒ�
    bash ./fix_zsh.sh

    # "Jessie Lite" �ł͂Ȃ����̏���
    bash ./gui_setting.sh

    # IP�A�h���X �Œ�
    bash ./fix_ipaddr.sh

    # �p�X���[�h �ύX
    ym_echo ">> Change password for root"
    sudo passwd root

    ym_echo ">> Change password for pi"
    sudo passwd pi
}

# Main routine
readonly START_TIME=`date +%s`

# # ���s�����t�H���_�� "cd"
# cd `dirname $0`

update_package
install_package
setup_dotfiles

readonly END_TIME=`date +%s`

readonly SS=`expr ${END_TIME} - ${START_TIME}`
readonly HH=`expr ${SS} / 3600`
readonly SS=`expr ${SS} % 3600`
readonly MM=`expr ${SS} / 60`
readonly SS=`expr ${SS} % 60`

ym_echo ">> Total time: ${HH}:${MM}:${SS}"

# "Jessie Lite" �ł͂Ȃ����̏���
readonly VER=$(dpkg -l | grep xinit)
if [ "$VER" != "" ]
then
    ym_echo ">> Input password for VNC server"
    sudo /etc/init.d/vncboot start
fi

# �z�X�g�� �ύX�i�K���Ō�Ɏ��{�j
bash ./setting_hostname.sh

ym_echo ">> Please reboot(yes/no)"
while true
do
    read yesno
    if [ "$yesno" = "yes" ]
    then
        sudo shutdown -r now
    else [ "$yesno" = "no" ]
        break
    fi
done
