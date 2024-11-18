FROM alpine:3.20

LABEL version="15.3.0" \
      maintainer="wang@rehiy.com"

ADD deploy /tmp/deploy
RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
