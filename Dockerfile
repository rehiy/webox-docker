FROM alpine:3.17

LABEL version="15.1.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="mysql nginx php81 redis"

ADD initfs /ifs
RUN sh /ifs/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
