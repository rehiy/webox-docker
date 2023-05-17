# What is Webox?

Re sail from alpine !

*Webox* (`abbreviation for web-box`) is a customized LNMP server, which includes the following components: MariaDB, Nginx, PHP, Redis. And add some popular plug-ins.

This is a lightweight branch that contains only the crond.

# Simple Usage

```shell
docker run --name MYBOX -d \
    -v /MY/config:/var/config \
    -e 'TZ=Asia/Shanghai' \
    rehiy/webox:slim
```

## ENV Variables

- `TZ`, Set the timezone

## Configure the components you need

You can place additional config files in `/MY/config/*`, these files will be copied to `{MYBOX}/etc` and take effect on next restart.

- Configure virtual host

  - /MY/config/nginx/host.d/\*

- Scripts in the following locations will be run when `MYBOX` started:

  - /MY/config/rc.local
  - /MY/config/wkit.d/\*
  - /MY/config/wkit.d/s3-prewkit
  - /MY/config/wkit.d/s5-wkit
  - /MY/config/wkit.d/s6-postwkit

- Configure scheduled tasks

  - /MY/config/periodic/5min/xxx
  - /MY/config/periodic/15min/xxx
  - /MY/config/periodic/30min/xxx
  - /MY/config/periodic/daily/xxx
  - /MY/config/periodic/hourly/xxx
  - /MY/config/periodic/monthly/xxx
  - /MY/config/periodic/weekly/xxx

# More Issues

See <https://github.com/rehiy/webox-docker/issues> for more issues.
