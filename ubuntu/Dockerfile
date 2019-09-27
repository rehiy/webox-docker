FROM ubuntu:latest

LABEL version="1.0.0"
LABEL maintainer="mail@anrip.com"

ADD assets/ /opt/
RUN chmod +x /opt/bin/*

ENV PATH /opt/bin:$PATH

ENTRYPOINT ["/opt/bin/init.sh", "ssh"]
