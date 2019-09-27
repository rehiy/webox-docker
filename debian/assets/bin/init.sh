#!/bin/sh
#

. /opt/share/runtime

if [ -x /opt/startup ]; then
    /opt/startup init
fi

if [ "$1" != "sshd" ]; then
    opt_app_run basic prepare
    opt_app_run sshd prepare
    exec /usr/sbin/sshd -D
else
    exec "$@"
fi
