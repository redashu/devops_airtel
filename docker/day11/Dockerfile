FROM oraclelinux:8.4 
RUN yum install httpd -y  \
&& mkdir -p /var/www/{subhash,uday}
COPY httpd.conf /etc/httpd/conf/
COPY uday.conf /etc/httpd/conf.d/
ADD subhash.conf /etc/httpd/conf.d/
COPY s.html  /var/www/subhash/index.html 
COPY u.html /var/www/uday/index.html
CMD ["httpd","-DFOREGROUND"]