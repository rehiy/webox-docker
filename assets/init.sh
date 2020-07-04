#!/bin/sh
#

if [ ! -f /srv/etc/version ]; then
    cp -au /mnt/backup/* /srv/
fi

if [ -d /srv/etc/rc.local ]; then
    for rc in /srv/etc/rc.local/*; do
        [ -x $rc ] && $rc
    done
fi

if [ -f /srv/etc/rc.local ]; then
    sh /srv/etc/rc.local
fi

if [ "$1" = "auto" ]; then
    /srv/service start
fi

exec tail -f /dev/null
