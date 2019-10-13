#!/bin/sh
#

if [ -x /srv/app/etc/rc.webox ]; then
    /srv/app/etc/rc.webox
fi

if [ "$1" = "auto" ]; then
    /srv/service start
fi

exec tail -f /dev/null
