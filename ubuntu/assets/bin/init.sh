#!/bin/sh
#

if [ -x /opt/startup ]; then
    /opt/startup init
fi

if [ "$1" != "ssh" ]; then
    /opt/bin/okit basic prepare
    /opt/bin/okit sshd prepare
    exec /usr/sbin/sshd -D
else
    exec "$@"
fi
