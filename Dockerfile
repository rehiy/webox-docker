FROM alpine:latest

LABEL version="12.3.3" \
      maintainer="mail@anrip.com"

ADD rootfs/ /
RUN /bin/sh /deploy

ENTRYPOINT /sbin/init

EXPOSE 80 443
