#!/bin/bash

cat > /etc/profile.d/gamescope.sh << EOF
#!/bin/bash

gamescope -e steam
EOF
