#!/bin/sh
#

source /srv/webox/function

if [ -x /srv/startup ]; then
    /srv/startup init
fi

if [ ! "$1" == "ssh" ]; then
    wbx_app_run ssh install
    exec /usr/sbin/sshd -D
else
    exec "${@}"
fi
