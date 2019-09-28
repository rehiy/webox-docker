FROM ubuntu:latest

LABEL version="1.0.0"
LABEL maintainer="mail@anrip.com"

ADD ubuntu/assets/ /srv/
RUN /bin/sh /srv/webox/build

ENV PATH /srv/webox/bin:$PATH

ENTRYPOINT ["/srv/init.sh"]
