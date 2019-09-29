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
docker pull anrip/webox:alpine
```

## start and visit `http://localhost`

```shell
docker run -d -p 80:80 anrip/webox:alpine auto
```

# Simple Usage

```shell
docker run --name webox -d \
    -p 80:80 -p 443:443 \
    -v /var/webox/etc:/srv/app/etc \
    -v /var/webox/htdoc:/srv/htdoc/default \
    -v /var/webox/mysql:/srv/app/var/lib/mysql \
    -v /var/webox/redis:/srv/app/var/lib/redis \
    anrip/webox:alpine
```

## start nginx/mysql/redis/php7 service (auto prepare)

```shell
docker exec -it webox /srv/service start
```

## The following commands are also supported

```shell
docker exec -it webox /srv/service [start|stop|restart|reload]
```

# Module Usage

## enable module

```shell
docker exec -it webox wkit nginx prepare
docker exec -it webox wkit mysql prepare
docker exec -it webox wkit redis prepare
docker exec -it webox wkit php5 prepare
docker exec -it webox wkit php7 prepare
```

## control module

```shell
docker exec -it webox wkit nginx [start|stop|restart|reload]
docker exec -it webox wkit mysql [start|stop|restart|reload]
docker exec -it webox wkit redis [start|stop|restart|reload]
docker exec -it webox wkit php5 [start|stop|restart|reload]
docker exec -it webox wkit php7 [start|stop|restart|reload]
```

## config module

please edit the config files in /var/webox/etc/\*, then reload the service

# Set MySQL password

```shell
docker exec -it webox /srv/app/bin/mysqladmin password a1B2c3E4
```
