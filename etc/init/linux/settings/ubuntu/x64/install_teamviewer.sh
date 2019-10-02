#!bin/bash
# @(#) Intall TeamViewer

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install TeamViewer"

# Install Teamviewer
ym_echo ">> ${PROCESS^}"
# wget http://download.teamviewer.com/download/teamviewer_i386.deb
# sudo dpkg -i teamviewer_i386.deb
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer_amd64.deb
sudo apt -y install
result_echo $? "${PROCESS}"
rm teamviewer_amd64.deb

# apt update
# sudo ./apt_install.sh
# sudo apt update &&
# sudo apt autoclean && \
# echo "Update done $(hostname)" || echo "Error update $(hostname)"
