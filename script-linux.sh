#!/bin/bash
#
## Config
#

# Git
#git config --global pull.rebase false
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${EMAIL}"

# Apt
sudo apt update
sudo apt install micro rclone
sudo apt clean && sudo apt autoclean

# Misc
mkdir -p ~/.config/rclone/
echo "${RCLNCNF}" > ~/.config/rclone/rclone.conf
cat <<'EOF'>> ~/.bashrc
export PS1='[GH]:${PWD}\n$ '
EOF
cat <<'EOF'>> ~/.bash_profile
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
EOF
# Enabling scrolling in tmux 
# Important note: This setting breaks highlighting and copying text. Use shift+click to maintain this functionality.
# https://github.com/tmux/tmux/issues/145
echo "set -g mouse on" >> ~/.tmux.conf #For tmux version 2.1 and up
# Reload shell
source ~/.bashrc

