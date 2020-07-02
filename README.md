# Feature

WeBox-docker is a lnmp server based on docker of ubuntu, debian. contains the following modules: nginx, mysql, redis, php. And some popular plug-ins have been added, such as geoip2, imagick ...

- mysql 5.7.x

- nginx 1.19.x

  - image-filter
  - maxminddb(geoip2)
  - njs

- node 14.4.x

- php 7.4.x

  - imagick
  - maxminddb(geoip2)
  - redis

- redis 6.0.x

# Quikc Start

```shell
docker pull vmlu/webox
```

## start and visit `http://localhost`

```shell
docker run -d -P vmlu/webox auto
```

# Simple Usage

## auto prepare and start nginx/mysql/redis/php

```shell
docker run --name vmbox -d -P \
    -v /mnt/vmbox/web:/srv/htdoc/default \
    -v /mnt/vmbox/var:/srv/webox/var \
    vmlu/webox auto
```

## the following commands are supported

```shell
docker exec -it vmbox /srv/service [start|stop|restart|reload]
```

## put your files to host's webroot path

If the host is `www.anrip.net`, the webroot will be `/mnt/vmbox/web/net.anrip.www/`

# Manual Control Services

## set `WBX_APPS`, you can start some modules you need

```shell
docker run --name vmbox -d -P \
    -v /mnt/vmbox/etc:/srv/webox/etc \
    -v /mnt/vmbox/web:/srv/htdoc/default \
    -v /mnt/vmbox/var:/srv/webox/var \
    --env 'WBX_APPS=mysql nginx php' \
    vmlu/webox auto
```

## configure the modules you need

please edit the config files in `/mnt/vmbox/etc/*`, then reload the service

# Important Notice

## don't forget change mysql password

```shell
docker exec -it vmbox /srv/webox/bin/mysqladmin password a1B2c3E4
```

# More Issues

See https://github.com/anrip/webox-docker/issues for more issues
