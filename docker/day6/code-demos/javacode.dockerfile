FROM openjdk 
LABEL name="ashutoshh"
WORKDIR /mycode 
copy hello.java .  
RUN javac  hello.java 
# above line we are compiling java 
CMD ["java","hello"]