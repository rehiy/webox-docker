FROM alpine:edge

LABEL version="15.5.0" \
      maintainer="wang@rehiy.com"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]
