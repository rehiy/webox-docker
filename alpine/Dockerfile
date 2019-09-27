FROM alpine:3.10

LABEL version="1.0.0"
LABEL maintainer="mail@anrip.com"

ADD assets/ /srv/
RUN chmod +x /srv/init.sh

ENV PATH /srv/webox/bin:$PATH

ENTRYPOINT ["/srv/init.sh"]
