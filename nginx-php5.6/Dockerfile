FROM alpine:3.8

LABEL version="10.6.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="nginx php5"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
