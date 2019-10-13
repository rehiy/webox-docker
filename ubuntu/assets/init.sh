#!/bin/sh
#

if [ -x /srv/bin/rc.webox ]; then
    /srv/bin/rc.webox
fi

if [ "$1" = "auto" ]; then
    /srv/service start
fi

exec tail -f /dev/null
