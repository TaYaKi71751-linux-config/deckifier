#!/bin/bash

__WAYLAND_SESSION_PATHS__="$(find /usr/share/wayland-sessions/ -name '*.desktop')"
while IFS= read -r __WAYLAND_SESSION__
do
	if ( cat $__WAYLAND_SESSION_PATH__ | grep ^Exec | grep gamescope );then
		continue
	else
		export __WAYLAND_SESSION__="$(basename $__WAYLAND_SESSION_PATH__ | cut -d '.' -f1 | tr -d '\n' | tr -d '\r')"
	fi
done < <(printf '%s\n' "$__WAYLAND_SESSION_PATHS__")

sudo bash << EOF
mkdir -p /etc/sddm.conf.d/
echo "[Autologin]" > /etc/sddm.conf.d/steamos.conf
echo "Relogin=true" >> /etc/sddm.conf.d/steamos.conf
echo "User=${USER}" >> /etc/sddm.conf.d/steamos.conf
echo "Session=${__WAYLAND_SESSION__}" >> /etc/sddm.conf.d/steamos.conf
systemctl restart sddm & pkill -9 gamescope & pkill -9 wayland
EOF
