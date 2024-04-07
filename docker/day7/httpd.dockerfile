FROM  --platform=arm64 oraclelinux:8.4  
# single cpu archtecture based support is there 
LABEL name="ashutoshh"
LABEL email="ashutoshh@linux.com"
LABEL ostype="oracelinux"
LABEL cputype="arm64"
ARG pkg=httpd
# scope of pkg variable is only in image build time 
# this variable is not available in container 
ENV APP_LOCATION=/var/www/html/
ENV VIR_HOST_DIR=/etc/httpd/conf.d/
# this variable pkg1 is avaiable in container also 
# we can't replace values of ENV variable during build time 
RUN yum install   ${pkg}  -y 
COPY hello.html ${APP_LOCATION}/index.html
COPY ok.html ${APP_LOCATION}
ADD https://raw.githubusercontent.com/redashu/ashu-cisco-webUI/master/health.html ${APP_LOCATION}
ADD ashu-vhost.conf ${VIR_HOST_DIR}
# copy and add both are same but add can take data from url also 
ENTRYPOINT [ "httpd","-D","FOREGROUND" ]
# since docker can run only one process at default so entrypoint or cmd will be here only ONce
# systemctl command by default not allowd in cmd or entrypoint 
# systemctl call systemd service which is not in dockerfile httpd -DFOREGROUND 
# /usr/sbin/sshd -- systemctl start sshd 