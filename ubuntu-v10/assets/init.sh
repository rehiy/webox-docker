#!/bin/sh
#

if [ -x /srv/app/etc/rc.local ]; then
    /srv/app/etc/rc.local
fi

if [ "$1" = "auto" ]; then
    /srv/service start
fi

exec tail -f /dev/null
