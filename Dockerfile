FROM alpine:3.16

LABEL version="15.1.0" \
      maintainer="wang@rehiy.com"

ENV WBX_APPS="nginx php8"

ADD initfs /ifs
RUN sh /ifs/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
