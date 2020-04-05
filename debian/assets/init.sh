#!/bin/sh
#

if [ ! -d /var/lib/webox/ready ]; then
    mkdir -p /var/lib/webox/ready
    rm -f /srv/app/etc/version
fi

if [ -x /srv/app/etc/rc.local ]; then
    /srv/app/etc/rc.local
fi

if [ "$1" = "auto" ]; then
    /srv/service start
fi

exec tail -f /dev/null
