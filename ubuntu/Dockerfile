FROM ubuntu:latest

LABEL version="1.0.0"
LABEL maintainer="mail@anrip.com"

ADD assets/ /srv/
RUN chmod +x /srv/bin/*

ENV PATH /srv/bin:$PATH

ENTRYPOINT ["/srv/bin/init.sh", "ssh"]
