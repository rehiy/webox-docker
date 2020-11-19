# Supported tags

[latest](https://github.com/anrip/webox-docker) -- with php-7.4.x

[v12](https://github.com/anrip/webox-docker/tree/v12.x) -- with php-7.4.x

[v11](https://github.com/anrip/webox-docker/tree/v11.x) -- with php-7.3.x

[v10](https://github.com/anrip/webox-docker/tree/v10.x) -- with php-5.6.x

# What is Webox?

Webox (`abbreviation for web-box`) is a customized lnmp server. It supports running on most linux distributions, such as alpine, CentOS, Debian, and Ubuntu.

`v13` tag contains the following modules: mysql, nginx, nodejs, php, redis. And some popular plug-ins have been added, such as geoip2, imagick ...

- mysql 8.0.x

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

# Simple Usage

## the web server is listening on `your-ip:80`

```shell
docker run --name mybox -d -P \
    -v /mnt/mybox:/opt/webox/var \
    vmlu/webox
```

## put your files to host's webroot

If the domain is `www.anrip.net`, the webroot will be `/mnt/mybox/www/default/net.anrip.www/`

# Manual Control Services

## set `WBX_APPS`, you can start some modules you need

```shell
docker run --name mybox -d -P \
    -v /mnt/mybox/etc:/opt/webox/etc \
    -v /mnt/mybox/var:/opt/webox/var \
    --env 'WBX_APPS=nginx php' \
    vmlu/webox
```

## service management command

```shell
docker exec -it mybox wkit [start|stop|restart|reload]
```

## configure the modules you need

please edit the config files in `/mnt/mybox/etc/*`, then reload the service

# Important Notice

## don't forget change mysql password

```shell
docker exec -it mybox /opt/webox/bin/mysqladmin password a1B2c3E4
```

# More Issues

See https://github.com/anrip/webox-docker/issues for more issues
