#!/bin/sh
#

if [ -x /etc/rc.local ]; then
    exec /etc/rc.local
fi

if [ -x /srv/startup ]; then
    exec /srv/startup
fi

while true; do sleep 60; done;
