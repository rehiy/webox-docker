FROM alpine:latest

LABEL version="10.3.0" \
      maintainer="mail@anrip.com"

ADD rootfs/ /
RUN /bin/sh /deploy

ENTRYPOINT ["/sbin/tini", "--", "/init.sh"]

EXPOSE 80 443
