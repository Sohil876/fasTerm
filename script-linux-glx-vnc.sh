#
## Config
#

# Apt
sudo apt install xfce4 xfce4-goodies libegl1-mesa mesa-utils --install-recommends
sudo apt clean && sudo apt autoclean
# Install ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
sudo tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin
sudo chmod +x /usr/local/bin/ngrok
# Install VirtualGL
#wget https://td.sohil876.workers.dev/0:/virtualgl_3.0.2_amd64.deb
#sudo dpkg -i virtualgl*amd64.deb
# Install Turbovnc
wget https://td.sohil876.workers.dev/0:/turbovnc_3.0.1_amd64.deb
sudo dpkg -i turbovnc*amd64.deb

# Configure
# VirtualGL
#wget https://td.sohil876.workers.dev/0:/autosetup_vgl.exp
#sudo /etc/init.d/lightdm stop
#sudo chmod +x autosetup_vgl.exp
#sudo ./autosetup_vgl.exp
#sudo /etc/init.d/lightdm start
# TurboVNC
mkdir -p ~/.vnc
chmod go-rwx ~/.vnc
/opt/TurboVNC/bin/vncpasswd -f <<<"${1}" > ~/.vnc/passwd # For vncpassword and view only password: vncpasswd -f <<<"$full_password"$'\n'"$view_password" >"$HOME/.vnc/passwd"
chmod 600 ~/.vnc/passwd
cat <<'EOF'>> ~/.vnc/xstartup
#!/bin/bash
xrdb ~/.Xresources
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup
# ngrok
sudo ngrok authtoken ${2}
# Misc
cat <<'EOF'>> ~/.bashrc
export DISPLAY=:1.0
EOF
# Reload shell
source ~/.bashrc

# Start
/opt/TurboVNC/bin/vncserver -localhost :1 -name vnc
sudo ngrok tcp 5901 --log=stdout > ~/ngrok.log &
