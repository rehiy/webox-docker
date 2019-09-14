#!/bin/sh
#

if [ ! -x /sbin/runit ]; then
    apk add runit
fi

if [ -x /srv/startup ]; then
    /srv/startup
fi

exec runsvdir /etc/service
