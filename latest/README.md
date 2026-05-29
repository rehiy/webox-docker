# Webox — latest

基于 `alpine:3.23` 的完整 LNMP 容器，包含 MariaDB、Nginx、PHP-FPM、Redis。

## 组件版本

| 组件 | 版本 |
|---|---|
| MariaDB | 11.4.x |
| Nginx | 1.28.x |
| PHP | 8.5.x |
| Redis | 8.4.x |

## 快速开始

```bash
docker run --name MYBOX -d -p 80:80 -p 443:443 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/mysql:/var/lib/mysql \
    rehiy/webox
```

## 配置

```bash
docker run --name MYBOX -d -p 80:80 -p 443:443 \
    -v /MY/htdoc:/var/www/default \
    -v /MY/config:/var/config \
    -e TZ=Asia/Shanghai \
    rehiy/webox
```

### 环境变量

| 变量 | 说明 |
|---|---|
| `TZ` | 时区 |

### 配置文件

将配置文件放入 `/MY/config/*`，容器启动时复制到 `/etc/`：

| 组件 | 路径 |
|---|---|
| MariaDB | `/MY/config/mysql/conf.d/*` |
| Nginx 虚拟主机 | `/MY/config/nginx/host.d/*` |
| PHP | `/MY/config/php85/conf.d/*` |
| Redis | `/MY/config/redis/redis.conf` |

### 启动脚本

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
| `/MY/config/periodic/15min/*` | 每 15 分钟 |
| `/MY/config/periodic/daily/*` | 每天 |
| `/MY/config/periodic/hourly/*` | 每小时 |
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

## 更多

参见 <https://github.com/rehiy/webox-docker/issues>
