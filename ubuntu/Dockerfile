FROM ubuntu:latest

LABEL version="1.1.0" \
      maintainer="mail@anrip.com"

ADD assets/ /srv/
RUN /bin/sh /srv/webox/build

ENV PATH /srv/webox/bin:$PATH

ENTRYPOINT ["/srv/init.sh"]

EXPOSE 80 443
