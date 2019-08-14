FROM alpine
MAINTAINER l2share

COPY entrypoint.sh /entrypoint.sh

#安装PHP NGINX
RUN apk add php php-fpm \
    php-session php-iconv php-curl php-mbstring php-gd php-exif php-mysqli php-xml php-zip
    
    
#安装主程序
RUN wget -O /tmp/master.zip "https://github.com/qianjigit/dzz2-with-app/archive/master.zip" \
  && unzip /tmp/master.zip -d /tmp \ 
  && mv /tmp/dzz2-with-app-master /web \
  && rm -rf /tmp/* \
  && echo "<?php define('DATA_PATH','/data/');" > /web/config/define.php \
  && chmod -R 777 /web /entrypoint.sh
  
VOLUME /web
EXPOSE 80
CMD /entrypoint.sh
