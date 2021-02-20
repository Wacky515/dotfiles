#!/bin/bash
# @(#) Setting for GUI

source ~/dotfiles/function/result_echo.sh

# �t�@�C�����g�̐�΃p�X �擾
# readonly PATH=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

readonly SETTING=./setting

# "Jessie Lite" ���ʏ���
readonly VER=$(dpkg -l | grep xinit)
if [ "$VER" != "" ]
then
    # "Jessie Lite" �ł͂Ȃ����̏���
    ym_echo ">> Setting for GUI"

    # ���z�f�X�N�g�b�v�� �ݒ�
    sudo cp -b ${SETTING}/lxpolkit.desktop \
        /etc/xdg/autostart/lxpolkit.desktop

    # Automatically start up VNC
    sudo cp -b ${SETTING}/vncboot \
        /etc/init.d/vncboot
    sudo update-rc.d -f lightdm remove
    sudo update-rc.d vncboot defaults

    # "config.txt" �ݒ�
    sudo cp -b ${SETTING}/config.txt \
        /boot/config.txt
else
    # "Jessie Lite" ���̏���
    rb_echo ">> This is Raspbian Jessie Lite"
    ym_echo "-> Skip GUI setting"

    # "config.txt" �ݒ�
    sudo cp -b ${SETTING}/config_lite.txt \
        /boot/config.txt
fi
echo ""
