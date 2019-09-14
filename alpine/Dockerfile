FROM alpine:3.10

LABEL version="1.0.0"
LABEL maintainer="mail@anrip.com"

ENV APPS ''

ADD assets/ /srv/
RUN chmod +x /srv/bin/*

CMD ["/srv/bin/init.sh", "$APPS"]

ENTRYPOINT ["/srv/bin/init.sh", "backend"]
