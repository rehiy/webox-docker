#!/bin/sh
#

. /opt/share/runtime

if [ "$1" != "sshd" ]; then
    opt_app_run basic prepare
    opt_app_run sshd prepare
    exec /usr/sbin/sshd -D
else
    exec "$@"
fi
