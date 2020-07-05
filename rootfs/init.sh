#!/bin/sh
#

if [ ! -f /srv/etc/version ]; then
    cp -au /mnt/backup/* /srv/
fi

#####################################################################

if [ -d /srv/etc/init.d ]; then
    for rc in /srv/etc/init.d/*; do
        [ -x $rc ] && $rc start
    done
fi

if [ -x /srv/etc/rc.local ]; then
    /srv/etc/rc.local start
fi

#####################################################################

/srv/service start

exec tail -f /dev/null
