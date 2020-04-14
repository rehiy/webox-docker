FROM debian:buster-slim

LABEL version="1.2.0" \
      maintainer="mail@anrip.com"

ADD assets/ /srv/
RUN /bin/sh /srv/deploy

ENTRYPOINT ["/bin/tini", "--", "/srv/init.sh"]

EXPOSE 80 443
