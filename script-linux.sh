#!/bin/bash
#
## Config
#

#Git
git config --global pull.rebase false
git config --global user.name "Sohil876"
git config --global user.email "${EMAIL}"

# Apt
#sudo apt update && sudo apt upgrade -y
sudo apt install micro
sudo apt clean && sudo apt autoclean

