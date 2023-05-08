FROM alpine:3.12

LABEL version="14.1.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="nginx php7"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
