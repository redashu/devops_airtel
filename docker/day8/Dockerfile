FROM oraclelinux:8.4
LABEL name="ashutoshh"
RUN yum install httpd -y 
COPY hello.html /var/www/html/index.html 
CMD ["httpd","-D","FOREGROUND"]
# systemd / systemctl support nhi krta 