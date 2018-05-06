#!bin/bash

# apt update
sudo apt update && \
sudo apt -y upgrade && \
sudo apt -y dist-upgrade && \
sudo apt-get autoremove && \
sudo apt autoclean && \
echo "Update done $(hostname)" || echo "Error update $(hostname)"
