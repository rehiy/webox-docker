# 什么是 Webox?

让我们从 `AlpineLinux` 重新起航 !

*Webox* 是 `web-box` 的缩写，意为建站盒子。这是一个自定义的 `LNMP` 集成化容器, 内置了以下常用模块 MariaDB、Nginx、PHP、Redis。

- mariadb 10.6.x

- nginx 1.22.x

- php 8.1.x

  - redis

- redis 7.0.x

# 可用分支

- [latest](https://github.com/rehiy/webox-docker/tree/master): nginx + php8.1 + mariadb + redis

- [edge](https://github.com/rehiy/webox-docker/tree/edge): nginx + php8.2 + mariadb + redis

- [edge-php7](https://github.com/rehiy/webox-docker/tree/edge): nginx + php7.4 + mariadb + redis

- [nginx](https://github.com/rehiy/webox-docker/tree/nginx)

- [nginx-geoip](https://github.com/rehiy/webox-docker/tree/nginx-geoip)

- [nginx-php8.2](https://github.com/rehiy/webox-docker/tree/nginx-php8.2)

- [nginx-php, nginx-php8, nginx-php8.1](https://github.com/rehiy/webox-docker/tree/nginx-php8.1)

- [nginx-php8.0](https://github.com/rehiy/webox-docker/tree/nginx-php8.0)

- [nginx-php7, nginx-php7.4](https://github.com/rehiy/webox-docker/tree/nginx-php7.4)

- [nginx-php7.3](https://github.com/rehiy/webox-docker/tree/nginx-php7.3)

- [nginx-php5, nginx-php5.6](https://github.com/rehiy/webox-docker/tree/nginx-php5.6)

# 快速启动

## 网站将监听下列端口 `docker-ip:80`

```shell
docker run --name MYBOX -d -p 80 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/mysql:/var/lib/mysql \
    rehiy/webox
```

## 把网站文件按照规则上传到指定目录

如果网站域名是 `www.example.org`，文件需要上传到目录 `/MY/htdoc/org.example.www/`。

# 设置自启动组件

```shell
docker run --name MYBOX -d -p 80 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    -e 'WBX_APPS=nginx php81' \
    -e 'TZ=Asia/Shanghai' \
    rehiy/webox
```

## 环境变量释义

- `WBX_APPS`, 设置需要启动的服务

- `TZ`, 设置容器时区

## 管理服务

```shell
docker exec -it MYBOX wkit [start|stop|restart|reload]
```

## 增加一些 PHP 扩展

```shell
docker exec -it MYBOX apk add \
    php81-pcntl php81-posix php81-saop \
    php81-maxminddb php81-pecl-imagick
```

## 自定义组件配置

请把配置文件放到目录 `/MY/config/*` ，这些文件将会覆盖容器内的配置目录 `/etc` ，并在重启容器后生效。

- 配置 mariadb

  - /MY/config/mysql/conf.d/\*

- 配置 nginx

  - /MY/config/nginx/host.d/\*

- 配置 php81

  - /MY/config/php81/conf.d/\*

- 配置 redis

  - /MY/config/redis/redis.conf

- 配置自启动脚本

  - /MY/config/rc.local
  - /MY/config/local.d/\*
  - /MY/config/local.d/s3-prewkit
  - /MY/config/local.d/s5-wkit
  - /MY/config/local.d/s6-postwkit

# 重要提示

## 不要忘记修改数据库密码

```shell
docker exec -it MYBOX mysqladmin -u root password abc345
```

你可能还需要执行下列语句，删除危险账号。

```sql
DROP USER 'mysql'@'localhost';
```

# 更多问题

请查阅 <https://github.com/rehiy/webox-docker/issues>
