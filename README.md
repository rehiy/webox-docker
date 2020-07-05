# Supported tags

[v12](https://github.com/anrip/webox-docker) -- with php-7.4.x

[v11](https://github.com/anrip/webox-docker/tree/v11.x) -- with php-7.3.x

[v10](https://github.com/anrip/webox-docker/tree/v10.x) -- with php-5.6.x

# What is Webox?

Webox (`abbreviation for web-box`) is a customized lnmp server. It supports running on most linux distributions, such as alpine, CentOS, Debian, and Ubuntu.

`v10` tag contains the following modules: mysql, nginx, nodejs, php, redis. And some popular plug-ins have been added, such as geoip2, imagick ...

- mysql 5.7.x

- nginx 1.19.x

  - image-filter
  - maxminddb(geoip2)
  - njs

- node 14.4.x

- php 5.6.x

  - redis

- redis 6.0.x

# Quikc Start

## the web server is listening on `your-ip:80`

```shell
docker run -d -P vmlu/webox auto
```

# Simple Usage

## auto prepare and start mysql/nginx/php/redis

```shell
docker run --name vmbox -d -P \
    -v /mnt/vmbox/htdoc:/srv/var/www/default \
    -v /mnt/vmbox/mysql:/srv/var/lib/mysql \
    vmlu/webox auto
```

## the following commands are supported

```shell
docker exec -it vmbox /srv/service [start|stop|restart|reload]
```

## put your files to host's webroot path

If the host is `www.anrip.net`, the webroot will be `/mnt/vmbox/htdoc/net.anrip.www/`

# Manual Control Services

## set `WBX_APPS`, you can start some modules you need

```shell
docker run --name vmbox -d -P \
    -v /mnt/vmbox/etc:/srv/etc \
    -v /mnt/vmbox/htdoc:/srv/var/www/default \
    -v /mnt/vmbox/mysql:/srv/var/lib/mysql \
    --env 'WBX_APPS=mysql nginx php' \
    vmlu/webox auto
```

## configure the modules you need

please edit the config files in `/mnt/vmbox/etc/*`, then reload the service

# Important Notice

## don't forget change mysql password

```shell
docker exec -it vmbox /srv/bin/mysqladmin password a1B2c3E4
```

# More Issues

See https://github.com/anrip/webox-docker/issues for more issues
