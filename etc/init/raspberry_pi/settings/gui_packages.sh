#!/bin/bash
# @(#) Install packages for GUI

# TODO:

# DONE:
    # "TightVNCServer" �����N�� �ł��Ă��Ȃ�

source ~/dotfiles/function/result_echo.sh

# "Jessie Lite" ���ʏ���
readonly VER=$(dpkg -l | grep xinit)
if [ "$VER" != "" ]
then
    # "Jessie Lite" �ł͂Ȃ����̏���
    ym_echo ">> Install packages for GUI"

    # ���{��� �C���X�g�[��
    ym_echo ">> Install Japanese environment"
    # sudo apt install -y fonts-ipafont && \
    # sudo apt install -y fonts-ipaexfont && \
    sudo apt install -y fonts-vlgothic && \
    sudo apt install -y ibus-mozc
    result_echo $? "install Japanese environment"

    # TightVNCViewer �C���X�g�[��
    ym_echo ">> Install \"TightVNCViewer\""
    sudo apt install -y tightvncserver
    result_echo $? "install TightVNCViewer"

    # "man" �R�}���h���{�ꉻ
    ym_echo ">> Install Japanese \"man\""
    sudo apt install manpages-ja manpages-ja-dev
    result_echo $? "install Japanese \"man\""

    # # �[�� �C���X�g�[��  #{{{
    # sudo apt-get install -y gnome-terminal
#}}}

    # # �p�[�e�B�V�����c�[�� �C���X�g�[��  #{{{
    # sudo apt-get install -y gparted
#}}}

else
    # "Jessie Lite" ���̏���
    rb_echo ">> This is Raspbian Jessie Lite"
    ym_echo "-> Skip Install packages for GUI"
fi
echo ""
