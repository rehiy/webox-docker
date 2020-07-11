FROM alpine:latest

LABEL version="11.3.0" \
      maintainer="mail@anrip.com"

ADD rootfs/ /
RUN /bin/sh /deploy

ENTRYPOINT /sbin/init

EXPOSE 80 443
