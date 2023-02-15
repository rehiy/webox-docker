# What is Webox?

Re sail from alpine !

*Webox* (`abbreviation for web-box`) is a customized LNMP server, which includes the following components: MariaDB, Nginx, PHP, Redis. And add some popular plug-ins.

- mariadb 10.6.x

- nginx 1.22.x

- php 8.1.x

  - redis

- redis 7.0.x

# Supported Tags

- [edge](https://github.com/rehiy/webox-docker/tree/edge)

- [latest](https://github.com/rehiy/webox-docker/tree/master)

- [nginx-php8, nginx-php8.1](https://github.com/rehiy/webox-docker/tree/nginx-php8.1)

- [nginx-php8.0](https://github.com/rehiy/webox-docker/tree/nginx-php8.0)

- [nginx-php, nginx-php7, nginx-php7.4](https://github.com/rehiy/webox-docker/tree/nginx-php7.4)

- [nginx-php7.3](https://github.com/rehiy/webox-docker/tree/nginx-php7.3)

- [nginx-php5, nginx-php5.6](https://github.com/rehiy/webox-docker/tree/nginx-php5.6)

# Simple Usage

## The nginx is listening on `docker-ip:80`

```shell
docker run --name MYBOX -d -p 80 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/mysql:/var/lib/mysql \
    rehiy/webox
```

## Put your files to host's webroot

If the domain is `www.example.org`, the webroot will be `/MY/htdoc/org.example.www/`.

# Manual Control Services

```shell
docker run --name MYBOX -d -p 80 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    -e 'WBX_APPS=nginx php81' \
    -e 'TZ=Asia/Shanghai' \
    rehiy/webox
```

## ENV Variables

- `WBX_APPS`, Set up automatically started services

- `TZ`, Set the timezone

## Service management command

```shell
docker exec -it MYBOX wkit [start|stop|restart|reload]
```

## Add some PHP extension modules

```shell
docker exec -it MYBOX apk add \
    php81-pcntl php81-posix php81-saop \
    php81-maxminddb php81-pecl-imagick
```

## Configure the components you need

You can place additional config files in `/MY/config/*`, these files will be copied to `{MYBOX}/etc` and take effect on next restart.

- Configure mariadb

  - /MY/config/mysql/conf.d/\*

- Configure virtual host

  - /MY/config/nginx/host.d/\*

- Configure php81

  - /MY/config/php81/conf.d/\*

- Configure redis

  - /MY/config/redis/redis.conf

- Scripts in the following locations will be run when `MYBOX` started:

  - /MY/config/rc.local
  - /MY/config/local.d/\*
  - /MY/config/local.d/s3-prewkit
  - /MY/config/local.d/s5-wkit
  - /MY/config/local.d/s6-postwkit

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
