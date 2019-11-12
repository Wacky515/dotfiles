sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt autoclean && echo "Update done $(hostname)" || echo "Error update $(hostname)"
brew update && brew upgrade && brew cleanup && brew doctor && echo "Brew done $(hostname)" || echo "Error brew $(hostname)"
