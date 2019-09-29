# Feature

-   nginx    1.16.x

    -   njs
    -   echo
    -   cache-purge
    -   image-filter

-   mariadb  10.13.x

-   redis    5.0.x

-   php      7.3.x

    -   redis

# Quikc Start

```shell
docker pull vmlu/webox:alpine
```

## start and visit `http://localhost`

```shell
docker run -d -P vmlu/webox:alpine auto
```

# Simple Usage

## auto prepare and start nginx/mysql/redis/php7

```shell
docker run --name vmbox -d \
    -p 80:80 -p 443:443 \
    -v /var/vmbox/etc:/srv/app/etc \
    -v /var/vmbox/htdoc:/srv/htdoc/default \
    -v /var/vmbox/mysql:/srv/app/var/lib/mysql \
    -v /var/vmbox/redis:/srv/app/var/lib/redis \
    vmlu/webox:alpine auto
```

## The following commands are supported

```shell
docker exec -it vmbox /srv/service [start|stop|restart|reload]
```

# Manual Control Services

When `auto` are not used, you can manual control the services

## enable module

```shell
docker exec -it vmbox wkit nginx prepare
docker exec -it vmbox wkit mysql prepare
docker exec -it vmbox wkit redis prepare
docker exec -it vmbox wkit php5 prepare
docker exec -it vmbox wkit php7 prepare
```

## control module

```shell
docker exec -it vmbox wkit nginx [start|stop|restart|reload]
docker exec -it vmbox wkit mysql [start|stop|restart|reload]
docker exec -it vmbox wkit redis [start|stop|restart|reload]
docker exec -it vmbox wkit php5 [start|stop|restart|reload]
docker exec -it vmbox wkit php7 [start|stop|restart|reload]
```

## config module

please edit the config files in /var/vmbox/etc/\*, then reload the service

# Set MySQL password

```shell
docker exec -it vmbox /srv/app/bin/mysqladmin password a1B2c3E4
```
