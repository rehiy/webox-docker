FROM alpine:edge

LABEL version="15.2.0" \
      maintainer="wang@rehiy.com"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]
