# Feature

-   nginx    1.16.x

    -   njs
    -   echo
    -   cache-purge
    -   image-filter

-   mariadb  10.13.x

-   redis    5.0.x

-   php      7.3.x

    -   redis
    -   imagick

# Quikc Start

```shell
docker pull vmlu/webox:alpine
```

## start and visit `http://localhost`

```shell
docker run -d -P vmlu/webox:alpine auto
```

# More Information

See <https://github.com/anrip/webox-docker> for more information.
