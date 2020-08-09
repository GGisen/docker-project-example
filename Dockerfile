FROM richarvey/nginx-php-fpm:1.5.0

ENV TP_DB_HOST_NAME=szrl-rili-tech-yun.mysql.rds.aliyuncs.com
ENV TP_DB_HOST_PORT=3306
ENV TP_DB_USER_NAME=user_ipm
ENV TP_DB_PASSWORD=ipm@RL-tech
ENV TP_DB_DATABASE=ipm_db

WORKDIR /var/www/errors
RUN rm -rf *
WORKDIR /var/www/html
RUN rm -rf *

ADD src/. /var/www/html/

COPY /cert/4206349_develop.rili-tech.com.key /root/fullchain.pem
COPY /cert/4206349_develop.rili-tech.com.pem /root/privkey.pem

COPY conf/nginx.conf /etc/nginx/sites-available/default.conf
COPY errors/. /var/www/errors/