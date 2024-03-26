#!/bin/bash

sudo bash << EOF
mkdir -p /etc/sddm.conf.d/
echo "[Autologin]" > /etc/sddm.conf.d/steamos.conf
echo "Relogin=true" >> /etc/sddm.conf.d/steamos.conf
echo "User=${USER}" >> /etc/sddm.conf.d/steamos.conf
echo "Session=gnome-xorg" >> /etc/sddm.conf.d/steamos.conf
systemctl stop sddm
pkill -9 wayland
pkill -9 gamescope
systemctl start sddm
EOF
