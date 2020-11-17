#!/bin/sh
#

if [ ! -x /usr/bin/dos2unix ]; then
    apt install -y dos2unix
fi

find rootfs/ -type f -exec dos2unix {} \;

docker build -t test/webox .
