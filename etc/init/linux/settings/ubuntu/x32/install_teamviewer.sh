#!bin/bash
# @(#) Intall TeamViewer

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install TeamViewer"

# Install Teamviewer
ym_echo ">> ${PROCESS^}"
wget http://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer_i386.deb
sudo apt -y install
result_echo $? "${PROCESS}"
rm teamviewer_i386.deb
