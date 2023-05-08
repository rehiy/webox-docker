FROM alpine:3.15

LABEL version="14.2.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="nginx php7"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
