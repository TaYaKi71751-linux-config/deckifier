#!/bin/bash

sudo bash << EOF
echo "#!/bin/bash" > /etc/profile.d/deck-touchscreen.sh
echo "xinput --map-to-output 'pointer:FTS3528:00 2808:1015' eDP" >> /etc/profile.d/deck-touchscreen.sh
EOF

