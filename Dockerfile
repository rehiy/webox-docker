FROM alpine:3.14

LABEL version="14.2.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="mysql nginx php7 redis"

ADD initfs /ifs
RUN sh /ifs/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
