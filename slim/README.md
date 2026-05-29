# Webox — slim

仅 crond 定时任务容器，不含 Web 服务。

## 组件

| 组件 | 说明 |
|---|---|
| crond | 定时任务 |

## 快速开始

```bash
docker run --name MYBOX -d \
    -v /MY/config:/var/config \
    -e TZ=Asia/Shanghai \
    rehiy/webox:slim
```

## 环境变量

| 变量 | 说明 |
|---|---|
| `TZ` | 时区 |

### 配置文件

将配置文件放入 `/MY/config/*`，容器启动时复制到 `/etc/`：

| 组件 | 路径 |
|---|---|
| Nginx 虚拟主机 | `/MY/config/nginx/host.d/*` |

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
| `/MY/config/periodic/5min/*` | 每 5 分钟 |
| `/MY/config/periodic/15min/*` | 每 15 分钟 |
| `/MY/config/periodic/30min/*` | 每 30 分钟 |
| `/MY/config/periodic/hourly/*` | 每小时 |
| `/MY/config/periodic/daily/*` | 每天 |
| `/MY/config/periodic/monthly/*` | 每月 |
| `/MY/config/periodic/weekly/*` | 每周 |

## 更多

参见 <https://github.com/rehiy/webox-docker/issues>
