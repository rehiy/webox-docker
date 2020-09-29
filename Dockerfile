FROM ubuntu:latest

LABEL version="12.3.4" \
      maintainer="mail@anrip.com"

ADD rootfs/ /
RUN /bin/sh /deploy

ENTRYPOINT /sbin/init

EXPOSE 80 443
