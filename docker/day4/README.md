# devops_airtel

### COntainer life cycle 

<img src="lifec.png">

### app containerization 

<img src="appc.png">

## Python scripting into containers 

### hello.py 

```
import time 
while True:
    print("Hello airtel")
    time.sleep(2)
    print("Hello docker , we are in progress ")
    print("_________________")
    print("_________________")
    print("_________________")
```

### Building docker image using -- Dockerfile 

```
FROM python 
# pulling python image from docker hub 
LABEL name="ashutoshh"
LABEL email="ashutoshh@linux.com"
# image creator info -- optional 
RUN mkdir  /opt/pycodes/ 
# to run any command whatever required we use RUN 
COPY hello.py  /opt/pycodes/ 
# from docker server copy code to new image while building 
CMD ["python","/opt/pycodes/hello.py"]
# to set default process while creating container 
# it can be replaced by container created while creating container 
```

### doing image build 

```
test@docker-server my-app-images]$ ls
java-web  nodejs  normal_code  python-web  webapp
[test@docker-server my-app-images]$ cd normal_code/
[test@docker-server normal_code]$ ls
Dockerfile  hello.py
[test@docker-server normal_code]$ docker build  -t  ashupython:codev1  . 
Sending build context to Docker daemon  3.072kB
Step 1/6 : FROM python
latest: Pulling from library/python
71215d55680c: Extracting [=================================================> ]  48.76MB/49.55MB
3cb8f9c23302: Download complete 
5f899db30843: Download complete 
```

### verify image

```
test@docker-server normal_code]$ docker  images
REPOSITORY                         TAG       IMAGE ID       CREATED          SIZE
ashupython                         codev1    34a235d9f59b   14 seconds ago   1.02GB
```

### lets create contaienr 

```
test@docker-server normal_code]$ docker  run -itd --name pyc1  ashupython:codev1  
466fb9a8b28bf981164f10f2e177e03d82027356e89469b388d65f546c955cef
[test@docker-server normal_code]$ docker  ps
CONTAINER ID   IMAGE               COMMAND                  CREATED         STATUS          PORTS     NAMES
466fb9a8b28b   ashupython:codev1   "python /opt/pycodes…"   3 seconds ago   Up 2 seconds              pyc1
27d1d2d0a09b   alpine              "ping fb.com"            6 minutes ago   Up 6 minutes              x3
0158dbd97da4   bbfaaa4ae074        "/bin/bash"              8 minutes ago   Up 8 minutes              x2
dd8ea3683635   alpine              "/bin/sh"                8 minutes ago   Up 8 minutes              x1
0a8a28991c6e   alpine              "/bin/sh"                14 hours ago    Up 27 minutes             ashuc4


[test@docker-server normal_code]$ docker  logs  pyc1
Hello airtel
Hello docker , we are in progress 
_________________
_________________
_________________
Hello airtel

====>>
[test@docker-server normal_code]$ docker  stats pyc1
ONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT     MEM %     NET I/O     BLOCK I/O   PIDS
466fb9a8b28b   pyc1      0.01%     4.289MiB / 3.816GiB   0.11%     710B / 0B   0B / 0B     1

====>>
[test@docker-server normal_code]$ docker  stop pyc1
pyc1
[test@docker-server normal_code]$ docker  ps 
CONTAINER ID   IMAGE          COMMAND         CREATED          STATUS          PORTS     NAMES
27d1d2d0a09b   alpine         "ping fb.com"   7 minutes ago    Up 7 minutes              x3
0158dbd97da4   bbfaaa4ae074   "/bin/bash"     10 minutes ago   Up 10 minutes             x2
dd8ea3683635   alpine         "/bin/sh"       10 minutes ago   Up 10 minutes             x1
0a8a28991c6e   alpine         "/bin/sh"       14 hours ago     Up 29 minutes             ashuc4
[test@docker-server normal_code]$ docker  ps -a
CONTAINER ID   IMAGE               COMMAND                  CREATED              STATUS                       PORTS     NAMES
466fb9a8b28b   ashupython:codev1   "python /opt/pycodes…"   About a minute ago   Exited (137) 7 seconds ago             pyc1
27d1d2d0a09b   alpine              "ping fb.com"            7 minutes ago        Up 7 minutes                           x3
0158dbd97da4   bbfaaa4ae074        "/bin/bash"              10 minutes ago       Up 10 minutes                          x2
dd8ea3683635   alpine              "/bin/sh"                10 minutes ago       Up 10 minutes                          x1
0a8a28991c6e   alpine              "/bin/sh"                14 hours ago         Up 29 minutes                          ashuc4
be87422aa48a   oraclelinux:8.5     "/bin/bash"              2 days ago           Exited (0) 14 hours ago                ashuc3
7ad40a6423bf   oraclelinux:8.5     "/bin/bash"              2 days ago           Exited (0) 2 days ago                  ashuc2
3abb3abddeb5   05455a08881e        "/bin/sh"                5 days ago           Exited (137) 2 days ago                ashuc1
d40207b2baee   05455a08881e        "/bin/sh"                5 days ago           Exited (137) 5 days ago                thirsty_robinson
0afe9f98f5a5   05455a08881e        "/bin/sh"                5 days ago           Exited (0) 5 days ago                  determined_saha
3a950086b087   05455a08881e        "/bin/sh"                6 days ago           Exited (0) 6 days ago                  busy_kepler
[test@docker-server normal_code]$ docker  rm pyc1 
pyc1

```

### using docker exec 

```
[root@docker-server ~]# docker  ps
CONTAINER ID   IMAGE          COMMAND         CREATED          STATUS          PORTS     NAMES
27d1d2d0a09b   alpine         "ping fb.com"   8 minutes ago    Up 8 minutes              x3
0158dbd97da4   bbfaaa4ae074   "/bin/bash"     10 minutes ago   Up 10 minutes             x2
dd8ea3683635   alpine         "/bin/sh"       11 minutes ago   Up 11 minutes             x1
0a8a28991c6e   alpine         "/bin/sh"       14 hours ago     Up 30 minutes             ashuc4
[root@docker-server ~]# 
[root@docker-server ~]# 
[root@docker-server ~]# 
[root@docker-server ~]# docker   exec  -it   x3   date 
Fri Mar 22 04:23:31 UTC 2024
[root@docker-server ~]# 
[root@docker-server ~]# docker   exec  -it   x3  whoami
root
[root@docker-server ~]# docker   exec  -it   x3 sh 
/ # 
/ # 
/ # 
/ # id
uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel),11(floppy),20(dialout),26(tape),27(video)
/ # cat  /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.19.1
PRETTY_NAME="Alpine Linux v3.19"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://gitlab.alpinelinux.org/alpine/aports/-/issues"
/ # uname -r
5.10.210-201.852.amzn2.x86_64
/ # exit
[root@docker-server ~]# 
[root@docker-server ~]# uname -r
5.10.210-201.852.amzn2.x86_64
[root@docker-server ~]# 

```
