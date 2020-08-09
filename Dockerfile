FROM richarvey/nginx-php-fpm:1.5.0

WORKDIR /var/www/errors
RUN rm -rf *
WORKDIR /var/www/html
RUN rm -rf *

ADD src/. /var/www/html/

COPY /cert/4206349_develop.rili-tech.com.key /etc/nginx/ssl/fullchain.pem
COPY /cert/4206349_develop.rili-tech.com.pem /etc/nginx/ssl/privkey.pem

COPY conf/nginx.conf /etc/nginx/sites-available/default.conf
COPY errors/. /var/www/errors/