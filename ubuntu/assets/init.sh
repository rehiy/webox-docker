#!/bin/sh
#

if [ $# -eq 0 ]; then
    tail -f /dev/null
fi

if [ "$1" = "quick"]; then
    /srv/service start
    exec tail -f /dev/null
fi
