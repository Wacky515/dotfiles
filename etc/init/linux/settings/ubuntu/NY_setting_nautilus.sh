#!/bin/bash
# @(#) Setting Nautilus

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting Nautilus"

ym_echo ">> ${PROCESS^}"
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-hidden-files 'true'
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
# TODO
# �ݒ肻�̂��̂̃o�b�N�A�b�v�ƃ��X�g�A
result_echo $? "${PROCESS}"
