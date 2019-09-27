#!/bin/sh
#

. /srv/webox/runtime

if [ -n $1 ]; then
    wbx_app_run sshd prepare
    exec /usr/sbin/sshd -D
else
    exec "$@"
fi
