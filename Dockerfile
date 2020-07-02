FROM ubuntu:latest

LABEL version="12.0.0" \
      maintainer="mail@anrip.com"

ADD assets/ /srv/
RUN /bin/sh /srv/deploy

ENTRYPOINT ["/bin/tini", "--", "/srv/init.sh"]

EXPOSE 80 443
