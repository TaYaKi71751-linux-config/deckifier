#!/bin/bash

sudo pacman -Sy gamescope --noconfirm --overwrite '*'
yay -Sy gamescope-session-git --noconfirm --overwrite '*'
source ./autologin/autologin.sh
sudo cp wayland-sessions/* /usr/share/wayland-sessions/
source ./sddm-conf/steamos.sh
