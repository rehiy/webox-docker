FROM alpine:3.23

LABEL version="15.5.0" \
      maintainer="wang@rehiy.com"

ADD deploy /tmp/deploy

RUN sh /tmp/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
