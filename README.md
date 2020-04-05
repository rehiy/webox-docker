# Feature

WeBox-docker is a lnmp server based on docker of ubuntu, debian. contains the following modules: nginx, mysql, redis, php5/php7. And some popular plug-ins have been added, such as redis, geoip2, imagick ...

For all module information, see ubuntu/readme.md or debian/readme.md.

# Quikc Start

```shell
docker pull vmlu/webox
```

## start and visit `http://localhost`

```shell
docker run -d -P vmlu/webox auto
```

# Simple Usage

## auto prepare and start nginx/mysql/redis/php7

```shell
docker run --name vmbox -d -P \
    -v /var/vmbox/mysql:/srv/app/var/lib/mysql \
    -v /var/vmbox/redis:/srv/app/var/lib/redis \
    -v /var/vmbox/web:/srv/htdoc/default/web \
    vmlu/webox auto
```

## the following commands are supported

```shell
docker exec -it vmbox /srv/service [start|stop|restart|reload]
```

## put your files to host's webroot path

If the host is `www.anrip.com`, the webroot will be `/var/vmbox/web/com.anrip.www/`

# Manual Control Services

## set `WBX_APPS`, you can start some modules you need

```shell
docker run --name vmbox -d -P \
    -v /var/vmbox/etc:/srv/app/etc \
    -v /var/vmbox/mysql:/srv/app/var/lib/mysql \
    -v /var/vmbox/web:/srv/htdoc/default/web \
    --env 'WBX_APPS=nginx mysql php5' \
    vmlu/webox auto
```

## configure the modules you need

please edit the config files in `/var/vmbox/etc/*`, then reload the service

# Important Notice

## don't forget change mysql password

```shell
docker exec -it vmbox /srv/app/bin/mysqladmin password a1B2c3E4
```

# More Issues

See https://github.com/anrip/webox-docker/issues for more issues
