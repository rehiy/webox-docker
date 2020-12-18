# What is Webox?

Re sail from alpine !

Webox (`abbreviation for web-box`) is a customized LNMP server, which includes the following modules: MariaDB, Nginx, NodeJS, PHP, Redis. And add some popular plug-ins, such as geoip2, imagick ...

- mariadb 10.4.x

- nginx 1.18.x

  - image-filter

- node 12.18.x

  - npm

- php 7.3.x

  - imagick
  - maxminddb(geoip2)
  - memcache
  - redis

- redis 5.0.x

# Simple Usage

## the web server is listening on `your-ip:80`

```shell
docker run --name mybox -d -P \
    -v /mnt/htdoc:/var/www/default \
    vmlu/webox
```

## put your files to host's webroot

If the domain is `www.anrip.net`, the webroot will be `/mnt/htdoc/net.anrip.www/`

# Manual Control Services

## set `WBX_APPS`, you can start some modules you need

```shell
docker run --name mybox -d -P \
    -v /mnt/etc:/overlay/etc \
    -v /mnt/mysql:/var/lib/mysql \
    -v /mnt/htdoc:/var/www/default \
    --env 'WBX_APPS=nginx php' \
    vmlu/webox
```

## service management command

```shell
docker exec -it mybox wkit [start|stop|restart|reload]
```

## configure the modules you need

please edit the config files in `/mnt/etc/*`, then reload the service

# Important Notice

## show mysql default password

```shell
docker exec -it mybox grep password /var/log/mysql/error.log
```

# More Issues

See https://github.com/anrip/webox-docker/issues for more issues
