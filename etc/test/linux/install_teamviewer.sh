#!bin/bash
# @(#) Intall TeamViewer

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install TeamViewer"

# Install Teamviewer
ym_echo ">> ${PROCESS^}"
wget http://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer_i386.deb
sudo apt-get -f install
result_echo $? "${PROCESS}"

# apt update
# sudo ./apt_install.sh
# sudo apt update && \
# sudo apt -y upgrade && \
# sudo apt -y dist-upgrade && \
# sudo apt -y autoremove && \
# sudo apt autoclean && \
# echo "Update done $(hostname)" || echo "Error update $(hostname)"
