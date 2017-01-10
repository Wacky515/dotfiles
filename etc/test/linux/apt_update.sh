# apt update
sudo apt update && \
sudo apt -y upgrade && \
sudo apt -y dist-upgrade && \
sudo apt -y autoremove && \
sudo apt autoclean && \
echo "Update done $(hostname)" || echo "Error update $(hostname)"
