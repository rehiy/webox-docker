#!/bin/sh
#

if [ -x /opt/startup ]; then
    /opt/startup init
fi

if [ "$1" != "ssh" ]; then
    /opt/bin/wkit basic prepare
    /opt/bin/wkit sshd prepare
    exec /usr/sbin/sshd -D
else
    exec "$@"
fi
