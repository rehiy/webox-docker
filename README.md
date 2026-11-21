# Webox Docker

[简体中文](./README-zh.md)

Webox (`web-box`) — 基于 Alpine Linux 的 LNMP 集成容器，内置 MariaDB、Nginx、PHP-FPM、Redis 及常用插件。

## 镜像标签

| 标签 | 组件 | 基础镜像 |
|---|---|---|
| `edge` | nginx + php8.5 + mariadb + redis（随 edge 仓库更新） | `alpine:edge` |
| `latest` | nginx 1.30 + php8.5 + mariadb 11.8 + redis 8.8 | `alpine:3.24` |
| `legal-php7` | nginx 1.20 + php7.4 + mariadb 10.6 + redis 6.2 | — |

## 轻量标签

| 标签 | 组件 |
|---|---|
| `nginx-php8.5` | nginx 1.30 + php8.5 |
| `nginx-php8.4` | nginx 1.30 + php8.4 |
| `nginx-php8.3` | nginx 1.30 + php8.3 |
| `nginx-php8.2` | nginx 1.28 + php8.2 |
| `nginx-php8.1` | nginx 1.24 + php8.1 |
| `nginx-php8.0` | nginx 1.22 + php8.0 |
| `nginx-php7.4` | nginx 1.20 + php7.4 |
| `nginx-php7.3` | nginx 1.18 + php7.3 |
| `nginx-php5.6` | nginx 1.14 + php5.6 |
| `nginx-geoip` | nginx（随 edge 仓库更新）+ GeoIP2 模块 |
| `nginx` | nginx（随 edge 仓库更新）仅网关 |
| `slim` | crond 定时任务 |

## 版本维护

PHP 8.1 及以下标签仅用于历史兼容，PHP 和对应的旧 Alpine 分支均已结束常规维护。PHP 8.2 的官方安全支持于 2026-12-31 结束。当前主线使用 PHP 8.5。

完整的组件版本、镜像发布时间与新增标签建议见 [版本检查](docs/version-audit.md)。表中的组件取自对应 Alpine 仓库；Docker Hub 实际发布状态需单独核对。

## 快速开始

```bash
docker run --name MYBOX -d -p 80:80 -p 443:443 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/mysql:/var/lib/mysql \
    rehiy/webox:latest
```

## 配置

```bash
docker run --name MYBOX -d -p 80:80 -p 443:443 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    -e TZ=Asia/Shanghai \
    rehiy/webox:latest
```

### 环境变量

| 变量 | 说明 |
|---|---|
| `TZ` | 时区，如 `Asia/Shanghai` |

### 配置文件挂载

将配置文件放入 `/MY/config/*`，容器启动时自动复制到 `/etc/`：

| 组件 | 路径 |
|---|---|
| MariaDB | `/MY/config/mysql/conf.d/*` |
| Nginx 虚拟主机 | `/MY/config/nginx/host.d/*` |
| PHP | `/MY/config/php85/conf.d/*` |
| Redis | `/MY/config/redis/redis.conf` |

### 启动脚本

以下目录中的脚本在容器启动时自动执行：

| 路径 | 时机 |
|---|---|
| `/MY/config/rc.local` | 基础启动 |
| `/MY/config/wkit.d/*` | wkit 服务管理 |
| `/MY/config/wkit.d/s3-prewkit` | 前置初始化 |
| `/MY/config/wkit.d/s5-wkit` | wkit 核心 |
| `/MY/config/wkit.d/s6-postwkit` | 后置初始化 |

### 定时任务

| 路径 | 频率 |
|---|---|
| `/MY/config/periodic/5min/*` | 每 5 分钟 |
| `/MY/config/periodic/15min/*` | 每 15 分钟 |
| `/MY/config/periodic/30min/*` | 每 30 分钟 |
| `/MY/config/periodic/hourly/*` | 每小时 |
| `/MY/config/periodic/daily/*` | 每天 |
| `/MY/config/periodic/monthly/*` | 每月 |
| `/MY/config/periodic/weekly/*` | 每周 |

## 服务管理

```bash
docker exec -it MYBOX wkit [start|stop|restart|reload]
```

## 安装 PHP 扩展

```bash
docker exec -it MYBOX apk add php85-pcntl php85-posix php85-maxminddb php85-pecl-imagick
```

## 网站目录

域名 `www.example.org` 对应 `/MY/htdoc/org.example.www/`。

## 安全提示

首次启动后修改 MySQL 密码：

```bash
docker exec -it MYBOX mysqladmin -u root password your_password
```

可能需要执行：

```sql
DROP USER 'mysql'@'localhost';
```

## 本地调试

```bash
sh debug.sh
```

## 更多

参见 <https://github.com/rehiy/webox-docker/issues>
