FROM alpine:3.15

LABEL version="14.3.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="mysql nginx php7 redis"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
