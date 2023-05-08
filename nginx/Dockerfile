FROM alpine:edge

LABEL version="15.2.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="nginx php82"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
