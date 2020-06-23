#!/bin/sh
#

if [ ! -d /var/lib/webox/ready ]; then
    mkdir -p /var/lib/webox/ready
    rm -f /srv/app/etc/version
fi

if [ -d /srv/app/etc/rc.local ]; then
    for rc in /srv/app/etc/rc.local/*; do
        [ -x $rc ] && $rc
    done
fi

if [ -f /srv/app/etc/rc.local ]; then
    rc=/srv/app/etc/rc.local
    [ -x $rc ] && $rc
fi

if [ "$1" = "auto" ]; then
    /srv/service start
fi

exec tail -f /dev/null
