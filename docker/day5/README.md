### Alpine linux -- package manager 

### apk is the package manager

### dockerfile 

```
FROM alpine 
# pulling python image from docker hub 
LABEL name="ashutoshh"
LABEL email="ashutoshh@linux.com"
# image creator info -- optional 
RUN apk add python3 
RUN mkdir  /opt/pycodes/ 
# to run any command whatever required we use RUN 
COPY hello.py  /opt/pycodes/ 
# from docker server copy code to new image while building 
CMD ["python3","/opt/pycodes/hello.py"]
# to set default process while creating container 
# it can be replaced by container created while creating container 
```

### how to build it 

```
[test@docker-server normal_code]$ docker build  -t ashualpine:python3  -f alpine.dockerfile  . 
Sending build context to Docker daemon  4.096kB
Step 1/7 : FROM alpine
 ---> 05455a08881e
Step 2/7 : LABEL name="ashutoshh"
 ---> Running in d9ee219c7554
Removing intermediate container d9ee219c7554
 ---> a3ff8cd5ae5a
Step 3/7 : LABEL email="ashutoshh@linux.com"
 ---> Running in 4d44f1604f03
[test@docker-server normal_code]$ 
[test@docker-server normal_code]$

===>>
[test@docker-server normal_code]$ docker  run -itd --name t1 ashualpine:python3 
d45daa004f1b582e8a5429b982a8e3d69f9983b5d49817c2f097a765ae53e3bd
[test@docker-server normal_code]$ docker  ps
CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS         PORTS     NAMES
d45daa004f1b   ashualpine:python3   "python3 /opt/pycode…"   2 seconds ago   Up 1 second              t1
0a8a28991c6e   alpine               "/bin/sh"                9 days ago      Up 6 minutes             ashuc4

-====>>

[test@docker-server normal_code]$ docker  logs t1 
Hello airtel
Hello docker , we are in progress 
_________________
_________________
_________________
Hello airtel
Hello docker , we are in progress 
```
