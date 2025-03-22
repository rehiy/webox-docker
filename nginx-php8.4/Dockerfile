FROM alpine:3.21

LABEL version="15.4.1" \
      maintainer="wang@rehiy.com"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
