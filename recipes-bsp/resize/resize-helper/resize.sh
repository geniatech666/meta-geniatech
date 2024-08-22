#!/bin/sh
### BEGIN INIT INFO
# Provides: resize
# Required-Start:    mountkernfs
# Required-Stop:     mountkernfs
# Default-Start:     S
# Default-Stop:
### END INIT INFO

if [ ! -e /etc/resize-flag ]; then
   sh /etc/resize-helper
   echo "resize-finish" > /etc/resize-flag
fi

: exit 0

