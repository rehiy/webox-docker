#!/bin/sh
#

if [ $# -eq 0 ]; then
    exec tail -f /dev/null
fi
