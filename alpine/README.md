# Feature

-   alpine   3.10
-   nginx    1.16.x
-   mariadb  10.13.x
-   php      7.3.x
-   redis    5.0.x

# Install

```shell
docker pull anrip/webox
```

# Usage

```shell
docker run --name webox -d \
    -v /var/webox/www:/srv/htdoc \
    -v /var/webox/etc:/srv/app/etc \
    -v /var/webox/mysql:/srv/app/var/lib/mysql \
    -v /var/webox/redis:/srv/app/var/lib/redis \
    anrip/webox:alpine

docker exec -it webox wkit install
```
