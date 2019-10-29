#!/bin/bash
# @(#) Setting Nautilus

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting Nautilus"

ym_echo ">> ${PROCESS^}"
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-hidden-files 'true'
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
# TODO
# $B@_Dj$=$N$b$N$N%P%C%/%"%C%W$H%j%9%H%"(B
result_echo $? "${PROCESS}"
