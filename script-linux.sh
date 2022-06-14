#!/bin/bash
#
## Config
#

# Git
#git config --global pull.rebase false
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${EMAIL}"

# Apt
#sudo apt update && sudo apt upgrade -y
sudo apt install micro rclone
sudo apt clean && sudo apt autoclean

# Misc
mkdir -p ~/.config/rclone/
echo "${RCLNCNF}" > ~/.config/rclone/rclone.conf
