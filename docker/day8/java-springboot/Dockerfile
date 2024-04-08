FROM tomcat 
LABEL name="ashutoshh"
RUN apt-get update -y \
&& apt-get install maven -y  
WORKDIR /myjava-webapp
# create and change both 
ADD  .  .
RUN mvn install \
&& ls target 