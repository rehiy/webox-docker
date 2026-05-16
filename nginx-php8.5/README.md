# nginx-php8.5

nginx + php8.5 运行环境

## 软件版本

- nginx 1.20+
- php8.5 (fpm)
- wkit (init/system)

## 默认站点

- 根目录 `/var/www/default`
- 配置文件 `/etc/nginx/http.d/default.conf`

## 快速启动

```bash
docker run -d --name nginx-php \
  -p 80:80 -p 443:443 \
  -v /my-code:/var/www/default \
  rehiy/nginx-php8.5
```

## 扩展安装

```bash
# 进入容器
docker exec -it nginx-php sh

# 安装更多 PHP 扩展
apk add php85-xxx

# 重启 php-fpm
wkit php85 restart
```
