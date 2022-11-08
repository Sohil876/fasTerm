#
## Config
#

# Apt
sudo apt install xfce4 xfce4-goodies tightvncserver --install-recommends
sudo apt clean && sudo apt autoclean
# Install ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
sudo tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin
sudo chmod +x /usr/local/bin/ngrok

# Configure
# tightvnc
mkdir -p ~/.vnc
chmod go-rwx ~/.vnc
vncpasswd -f <<<"${1}" > ~/.vnc/passwd # For vncpassword and view only password: vncpasswd -f <<<"$full_password"$'\n'"$view_password" >"$HOME/.vnc/passwd"
chmod 600 ~/.vnc/passwd
cat <<'EOF'>> ~/.vnc/xstartup
#!/bin/bash
xrdb ~/.Xresources
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup
# ngrok
sudo ngrok authtoken ${2}

# Start
vncserver -localhost :1 -name vnc
sudo ngrok tcp 5901 --log=stdout > ~/ngrok.log &
