FROM centos:8
ENV container docker

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y
# Install Apache
RUN yum -y install httpd httpd-tools

RUN yum clean all

RUN echo "<h1>Test Docker</h1>" > /var/www/html/index.html

RUN systemctl enable httpd.service

EXPOSE 8080

CMD ["/usr/sbin/init"]
