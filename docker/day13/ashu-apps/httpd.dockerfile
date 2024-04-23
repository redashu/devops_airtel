FROM oraclelinux:8.4
RUN yum install httpd -y 
COPY webapps /var/www/html/ 
ENTRYPOINT [ "httpd","-DFOREGROUND" ]