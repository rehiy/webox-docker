FROM alpine:3.12

LABEL version="14.0.0" \
      maintainer="mail@anrip.com"

ADD rootfs /deploy
RUN chmod +x /deploy/deploy && /deploy/deploy

ENTRYPOINT ["/sbin/init"]

EXPOSE 80 443
