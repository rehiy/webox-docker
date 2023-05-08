FROM alpine:3.16

LABEL version="15.2.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="nginx php8"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
