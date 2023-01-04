FROM php:7.2-cli
WORKDIR /ics2caldav
COPY . .
CMD ["php", "ics2caldav.php"]

