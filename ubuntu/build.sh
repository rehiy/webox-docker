#!/bin/sh
#

[ -x /usr/bin/dos2unix ] || apt install -y dos2unix
find assets/ -type f -exec dos2unix {} \;

docker build -t anrip/webox:ubuntu .
