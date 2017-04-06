FROM centos:7.2.1511

# Install Alfresco using unattended installation
RUN yum install -y httpd
ADD httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf
ADD httpd.conf /usr/local/apache2/conf/httpd.conf
ADD server.key /usr/local/apache2/conf/server.key
ADD server.crt /usr/local/apache2/conf/server.crt

ENTRYPOINT /usr/sbin/apachectl && /bin/bash
#ENTRYPOINT /bin/bash
