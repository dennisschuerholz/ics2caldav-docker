FROM alpine:3.14
LABEL description="Download ICS calendar(s) and import into CalDAV endpoints"

VOLUME [ "/ics2caldav" ]

# install dependencies
RUN set -xe && \
    apk update && apk upgrade && \
    apk add --no-cache --virtual=run-deps \
        php7-cli \
        php7-curl \
        php7-dom \
        php7-mbstring \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        composer && \
    apk del --progress --purge && \
    rm -rf /var/cache/apk/*

WORKDIR /srv

# install ics2caldav with dependencies
COPY . .
RUN mkdir -p /ics2caldav && \
    composer install --no-dev && \
    chmod +x ics2caldav && \
    ln -s /ics2caldav/config.inc.php ./config/

ENTRYPOINT [ "/srv/ics2caldav" ]
