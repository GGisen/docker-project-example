FROM richarvey/nginx-php-fpm:1.5.0

WORKDIR /var/www/errors
RUN rm -rf *
WORKDIR /var/www/html
RUN rm -rf *

ADD src/. /var/www/html/

COPY /cert/4206349_develop.rili-tech.com.key /root/4206349_develop.rili-tech.com.key
COPY /cert/4206349_develop.rili-tech.com.pem /root/4206349_develop.rili-tech.com.pem

COPY conf/nginx-site.conf /etc/nginx/sites-available/default.conf
COPY conf/nginx-site-ssl.conf /etc/nginx/sites-available/default-ssl.conf
COPY errors/. /var/www/errors/