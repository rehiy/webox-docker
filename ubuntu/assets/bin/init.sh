#!/bin/sh
#

if [ -x /etc/rc.local ]; then
    /etc/rc.local
fi

if [ -x /srv/startup ]; then
    /srv/startup init
fi

mkdir -p /run/sshd
exec /usr/sbin/sshd -D
