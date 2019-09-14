#!/bin/sh
#

if [ -x /srv/startup ]; then
    /srv/startup init
fi

if [ ! "$1" == "ssh" ]; then
    /srv/bin/webox ssh install
    exec /usr/sbin/sshd -D
else
    exec "${@}"
fi
