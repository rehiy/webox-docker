FROM ubuntu:18.04

LABEL version="12.3.4" \
      maintainer="mail@anrip.com"

ADD rootfs/ /
RUN /bin/sh /deploy

ENTRYPOINT /usr/local/bin/init

EXPOSE 80 443
