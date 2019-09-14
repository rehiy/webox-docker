#!/bin/sh
#

if [ -x /etc/rc.local ]; then
    /etc/rc.local
fi

if [ -x /srv/startup ]; then
    /srv/startup
fi

while true; do sleep 60; done;
