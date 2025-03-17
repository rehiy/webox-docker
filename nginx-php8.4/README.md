# What is Webox?

Re sail from alpine !

*Webox* (`abbreviation for web-box`) is a customized LNMP server, which includes the following components: MariaDB, Nginx, PHP, Redis. And add some popular plug-ins.

This is a lightweight branch that contains only the following components:

- nginx 1.26.x

- php 8.4.x

# Simple Usage

## The nginx is listening on `docker-ip:80`

```shell
docker run --name MYBOX -d -p 80:80 -p 443:443 \
    -v /MY/htdoc:/var/www/default \
    rehiy/webox:nginx-php8.4
```

## Put your files to host's webroot

If the domain is `www.example.org`, the webroot will be `/MY/htdoc/org.example.www/`.

# Manual Control Services

```shell
docker run --name MYBOX -d -p 80:80 -p 443:443 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    -e 'TZ=Asia/Shanghai' \
    rehiy/webox:nginx-php8.4
```

## ENV Variables

- `TZ`, Set the timezone

## Service management command

```shell
docker exec -it MYBOX wkit [start|stop|restart|reload]
```

## Add some PHP extension modules

```shell
docker exec -it MYBOX apk add \
    php84-pcntl php84-posix php84-saop \
    php84-maxminddb php84-pecl-imagick
```

## Configure the components you need

You can place additional config files in `/MY/config/*`, these files will be copied to `{MYBOX}/etc` and take effect on next restart.

- Configure virtual host

  - /MY/config/nginx/host.d/\*

- Configure php84

  - /MY/config/php84/conf.d/\*

- Scripts in the following locations will be run when `MYBOX` started:

  - /MY/config/rc.local
  - /MY/config/wkit.d/\*
  - /MY/config/wkit.d/s3-prewkit
  - /MY/config/wkit.d/s5-wkit
  - /MY/config/wkit.d/s6-postwkit

- Configure scheduled tasks

  - /MY/config/periodic/15min/xxx
  - /MY/config/periodic/daily/xxx
  - /MY/config/periodic/hourly/xxx
  - /MY/config/periodic/monthly/xxx
  - /MY/config/periodic/weekly/xxx

# More Issues

See <https://github.com/rehiy/webox-docker/issues> for more issues.
