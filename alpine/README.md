# Feature

-   alpine   3.10
-   nginx    1.16.x
-   mariadb  10.13.x
-   php      7.3.x
-   redis    5.0.x


# Install

```shell
docker pull anrip/webox:alpine

docker run --name webox -d \
    -v /var/webox/www:/srv/htdoc \
    -v /var/webox/etc:/srv/app/etc \
    -v /var/webox/var/mysql:/srv/app/var/lib/mysql \
    -v /var/webox/var/redis:/srv/app/var/lib/redis \
    anrip/webox:alpine
```

# Usage

## enable service

```shell
docker exec -it webox wkit nginx prepare
docker exec -it webox wkit mysql prepare
docker exec -it webox wkit redis prepare
docker exec -it webox wkit php5 prepare
docker exec -it webox wkit php7 prepare
```

## control service

```shell
docker exec -it webox wkit nginx [start|stop|restart|reload]
docker exec -it webox wkit mysql [start|stop|restart|reload]
docker exec -it webox wkit redis [start|stop|restart|reload]
docker exec -it webox wkit php5 [start|stop|restart|reload]
docker exec -it webox wkit php7 [start|stop|restart|reload]
```

## config service

please edit the config files in /var/webox/etc/*, then reload the service
