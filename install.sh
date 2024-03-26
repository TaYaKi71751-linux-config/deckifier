#!/bin/bash

sudo pacman -Sy gamescope --noconfirm --overwrite '*'
yay -Sy gamescope-session-git --noconfirm --overwrite '*'
source ./autologin/autologin.sh
source ./profile.d/gamescope.sh
sudo cp wayland-sessions/* /usr/share/wayland-sessions/
#sudo cp bin/* /usr/bin/
source ./sddm-conf/steamos.sh
