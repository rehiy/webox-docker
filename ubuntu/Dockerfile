FROM ubuntu:latest

LABEL version="1.0.0"
LABEL maintainer="mail@anrip.com"

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'root:root' | chpasswd

ADD assets/ /usr/
RUN chmod +x /usr/bin/*.sh
RUN /usr/bin/setup.sh install

EXPOSE 22/tcp

ENTRYPOINT ["/usr/bin/init.sh", "start"]
