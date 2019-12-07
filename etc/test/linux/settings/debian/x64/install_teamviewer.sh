#!bin/bash
# @(#) Intall TeamViewer

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install TeamViewer"

# Install Teamviewer
ym_echo ">> ${PROCESS^}"
sudo bash ../../ubuntu/x32/install_teamviewer.sh
result_echo $? "${PROCESS}"
