FROM alpine:3.10

LABEL version="1.0.0"
LABEL maintainer="mail@anrip.com"

ADD assets/ /opt/
RUN chmod +x /opt/init.sh

ENV PATH /opt/bin:$PATH

ENTRYPOINT ["/opt/init.sh", "sshd"]
