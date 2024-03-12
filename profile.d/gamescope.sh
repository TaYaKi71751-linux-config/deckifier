#!/bin/bash

sudo bash << EOF
echo "\#!/bin/bash" > /etc/profile.d/gamescope.sh
echo "gamescope -e steam" > /etc/profile.d/gamescope.sh
EOF
