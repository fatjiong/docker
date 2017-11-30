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

RUN yum install -y mysql && \
	yum clean all

#ADD my.cnf /etc/my.cnf

EXPOSE	3306

CMD mysqld_safe