#------------------------------------------------------------
#
#  用途: 胖纸囧开发测试环境
#  构成: Centos7
#
# @version    1.0
# @author     胖纸囧
# @email      757970599@qq.com
#

#------------------------------------------------------------
# 设置系统
FROM centos:7.4.1708
MAINTAINER fatjiong 757970599@qq.com

#------------------------------------------------------------
# 设置系统变量
ENV TZ "Asia/Shanghai"

#------------------------------------------------------------
# 添加阿里云源
ADD Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo
ADD Centos-7.epel.repo /etc/yum.repos.d/epel.repo

#------------------------------------------------------------
# 升级基础软件
RUN yum update -y

#------------------------------------------------------------
# 安装基本软件
RUN yum -y install net-tools tcl pcre pcre-devel zlib zlib-devel openssl openssl-devel libxml2 libxml2-devel libjpeg libjpeg-devel libpng libpng-devel curl curl-devel freetype freetype-devel libmcrypt libmcrypt-devel cmake gcc-c++ ncurses-devel perl-Data-Dumper autoconf wget libicu libicu-devel libmcrypt libmcrypt-devel vim && \
    yum install -y --enablerepo=epel pwgen python-pip && \
    yum clean all

#------------------------------------------------------------
# 安装supervictl
RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/supervisor.conf.d && \
    mkdir -p /var/log/supervisor

#------------------------------------------------------------
# 暴露端口
EXPOSE 22

# 服务启动
CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisord.conf"]