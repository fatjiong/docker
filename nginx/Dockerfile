#------------------------------------------------------------
#
#  用途: 胖纸囧开发测试环境
#  构成: nginx+php+php-fpm
#
# @version    1.0
# @author     胖纸囧
# @email      757970599@qq.com
#

#------------------------------------------------------------
# 设置系统
FROM fatjiong/centos7:7.4
MAINTAINER fatjiong 757970599@qq.com

ENV	APP_DIR /app

RUN     yum -y swap -- remove fakesystemd -- install systemd systemd-libs && \
        yum -y install nginx php-cli php-mysql php-pear php-ldap php-mbstring php-soap php-dom php-gd php-xmlrpc php-fpm php-mcrypt && \ 
	yum clean all

ADD  nginx.conf /etc/nginx/nginx.conf
ADD	vhost /etc/nginx/vhost

ADD	php-fpm.conf /etc/php-fpm.d/php-fpm.conf
RUN	sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php.ini

RUN	mkdir -p /app && echo "<?php phpinfo(); ?>" > ${APP_DIR}/info.php

EXPOSE	80 443

ADD	supervisor_nginx.conf /etc/supervisor.conf.d/nginx.conf
ADD	supervisor_php-fpm.conf /etc/supervisor.conf.d/php-fpm.conf

ONBUILD ADD . /app
ONBUILD RUN chown -R nginx:nginx /app