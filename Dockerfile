FROM centos:8
ENV container docker

# Install Apache
RUN yum -y install httpd httpd-tools

RUN yum clean all

# Update Apache Configuration
RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf

RUN systemctl enable httpd.service

EXPOSE 8080

CMD ["/usr/sbin/init"]
