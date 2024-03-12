#!/bin/bash

mkdir -p /etc/systemd/system/getty@tty1.service.d/
sudo bash << EOF
echo "[Service]" > /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "ExecStart=-/sbin/agetty --autologin ${USER} --noclear %I 38400 linux" >> /etc/systemd/system/getty@tty1.service.d/autologin.conf
EOF
