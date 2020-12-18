#!/bin/sh
#

if [ ! -x /usr/bin/dos2unix ]; then
    apt install -y dos2unix
fi

find rootfs/ -type f -exec dos2unix {} \;

chmod +x `grep '^#!/bin' -rl rootfs/`

docker build -t test/webox .

# docker run -d --rm test/webox
