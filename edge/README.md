# What is Webox?

Re sail from alpine !

*Webox* (`abbreviation for web-box`) is a customized LNMP server, which includes the following components: MariaDB, Nginx, PHP, Redis. And add some popular plug-ins.

- mariadb 10.11.x

- nginx 1.24.x

- php 8.3.x

  - redis

- redis 7.0.x

# Simple Usage

## The nginx is listening on `docker-ip:80`

```shell
docker run --name MYBOX -d -p 80:80 -p 443:443 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/mysql:/var/lib/mysql \
    rehiy/webox:edge
```

## Put your files to host's webroot

If the domain is `www.example.org`, the webroot will be `/MY/htdoc/org.example.www/`.

# Manual Control Services

```shell
docker run --name MYBOX -d -p 80:80 -p 443:443 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    -e 'TZ=Asia/Shanghai' \
    rehiy/webox:edge
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
    php83-pcntl php83-posix php83-saop \
    php83-maxminddb php83-pecl-imagick
```

## Configure the components you need

You can place additional config files in `/MY/config/*`, these files will be copied to `{MYBOX}/etc` and take effect on next restart.

- Configure mariadb

  - /MY/config/mysql/conf.d/\*

- Configure virtual host

  - /MY/config/nginx/host.d/\*

- Configure php83

  - /MY/config/php83/conf.d/\*

- Configure redis

  - /MY/config/redis/redis.conf

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

# Important Notice

## Don't forget to change mysql password

```shell
docker exec -it MYBOX mysqladmin -u root password abc345
```

You may also need to execute the following SQL statements.

```sql
DROP USER 'mysql'@'localhost';
```

# More Issues

See <https://github.com/rehiy/webox-docker/issues> for more issues.
