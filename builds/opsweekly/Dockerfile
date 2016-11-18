FROM alpine:3.4

MAINTAINER Antonino Abbate "ninoabbate@gmail.com"

RUN apk --update add bash apache2 php5 php5-apache2 php5-curl php5-mysqli php5-openssl php5-json mysql-client postfix git

RUN cd /var/www/ \
  && git clone https://github.com/etsy/opsweekly.git opsweekly \
  && mkdir -p /run/apache2 \
  && chgrp www-data /run/apache2 \
  && chmod 775 /run/apache2 \
  && chown apache:apache logs \
  && chmod g+w /var/log/apache2 \
  && addgroup apache wheel

RUN apk del git \
  && rm -rf /var/cache/apk/* \
  && rm -rf /var/www/localhost

RUN postconf "smtputf8_enable = no" \
  && postfix start

ADD   httpd.conf /etc/apache2/httpd.conf
ADD   htpasswd /etc/htpasswd/.htpasswd
ADD   config.php /var/www/opsweekly/phplib/config.php

EXPOSE 80

ENTRYPOINT ["httpd","-D","FOREGROUND"]
