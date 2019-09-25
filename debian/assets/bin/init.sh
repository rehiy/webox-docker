#!/bin/sh
#

if [ -x /srv/startup ]; then
    /srv/startup init
fi

if [ "$1" != "ssh" ]; then
    /srv/bin/wkit basic prepare
    /srv/bin/wkit sshd prepare
    exec /usr/sbin/sshd -D
else
    exec "$@"
fi
