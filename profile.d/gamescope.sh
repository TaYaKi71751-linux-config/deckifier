#!/bin/bash

export INTEL_DEBUG=norbc

export STEAM_ENABLE_VOLUME_HANDLER=1

export QT_IM_MODULE=steam
export GTK_IM_MODULE=Steam

if [ -f /usr/share/gamescope-session/device-quirks ]; then
  . /usr/share/gamescope-session/device-quirks
elif [ -f /usr/share/gamescope-session-plus/device-quirks ];then
	. /usr/share/gamescope-session-plus/device-quirks
fi
# Define session if not overriden
if [ -z "$STEAMCMD" ] ; then
    STEAMCMD="steam -gamepadui -steamos3 -steampal -steamdeck"
fi

# Use cursor if file exist
if [ -z "$CURSOR_FILE" ] ; then
    CURSOR_FILE="${HOME}/.local/share/Steam/tenfoot/resource/images/cursors/arrow_right.png"
fi
CURSOR=""
if [ -f "$CURSOR_FILE" ] ; then
    CURSOR="--cursor ${CURSOR_FILE}"
fi

# Define session if not overriden
if [ -z "$STEAMCMD" ] ; then
    STEAMCMD="steam -gamepadui -steamos3 -steampal -steamdeck"
fi

if [ -z "$GAMESCOPECMD" ] ; then
    RESOLUTION="-W 2560 -H 1440"
    if [ -n "$SCREEN_WIDTH" ] && [ -n "$SCREEN_HEIGHT" ] ; then
        RESOLUTION="-W $SCREEN_WIDTH -H $SCREEN_HEIGHT"
    fi
    GAMESCOPECMD="/usr/bin/gamescope \
      $CURSOR \
      -e \
      -h 1440 \
      -w 2560 \
      $RESOLUTION \
      --xwayland-count 2 \
      -O DP-1,DP-3,*,eDP-1 \
      --default-touch-mode 4 \
      --hide-cursor-delay 3000 \
      --fade-out-duration 200 \
      --generate-drm-mode cvt \
      --immediate-flips \
      --adaptive-sync \
      -R $socket -T $stats"
else
    # Add socket and stats read
    GAMESCOPECMD+=" -R $socket -T $stats"
fi
