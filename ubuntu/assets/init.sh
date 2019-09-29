#!/bin/sh
#

if [ "$1" = "auto"]; then
    /srv/service start
fi

exec tail -f /dev/null
