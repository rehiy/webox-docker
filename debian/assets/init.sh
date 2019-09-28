#!/bin/sh
#

. /srv/webox/runtime

if [ $# -eq 0 ]; then
    wbx_app_run sshd prepare
    exec /usr/sbin/sshd -D
fi
