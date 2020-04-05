# Feature

-   nginx    1.17.x

    -   njs
    -   echo
    -   cache-purge
    -   image-filter
    -   maxmind/geoip2

-   mysql    5.7.x

-   redis    5.0.x

-   php      5.6.x
-   php      7.3.x

    -   redis
    -   imagick
    -   maxmind/geoip2

# Quikc Start

```shell
docker pull vmlu/webox:debian-v10
```

## start and visit `http://localhost`

```shell
docker run -d -P vmlu/webox:debian-v10 auto
```

# More Information

See https://github.com/anrip/webox-docker for more information.
