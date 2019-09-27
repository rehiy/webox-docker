FROM debian:buster-slim

LABEL version="1.0.0"
LABEL maintainer="mail@anrip.com"

ADD assets/ /srv/
RUN chmod +x /srv/init.sh

ENV PATH /srv/webox/bin:$PATH

ENTRYPOINT ["/srv/init.sh"]
