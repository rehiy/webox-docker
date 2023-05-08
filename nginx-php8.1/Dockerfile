FROM alpine:3.17

LABEL version="15.2.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="nginx php81"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
