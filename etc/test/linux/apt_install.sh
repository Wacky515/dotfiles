# Install Teamviewer
wget http://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer_i386.deb
sudo apt-get -f install

# apt update
sudo sh ./apt_install.sh
# sudo apt update && \
# sudo apt -y upgrade && \
# sudo apt -y dist-upgrade && \
# sudo apt -y autoremove && \
# sudo apt autoclean && \
# echo "Update done $(hostname)" || echo "Error update $(hostname)"
