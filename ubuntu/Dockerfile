FROM ubuntu:latest

LABEL version="1.1.0"
LABEL maintainer="mail@anrip.com"

ADD assets/ /srv/

ENV PATH /srv/webox/bin:$PATH
RUN /bin/sh /srv/webox/build

EXPOSE 80 443

ENTRYPOINT ["/srv/init.sh"]
