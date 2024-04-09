FROM maven AS javaBuilder
LABEL name="ashutoshh"
WORKDIR /mycode 
COPY java-springboot .
RUN mvn install 
# above step will compile  , test code and release war file in target folder

FROM tomcat 
LABEL email="ashutoshh@linux.com"
COPY --from=javaBuilder /mycode/target/*.war /usr/local/tomcat/webapps/