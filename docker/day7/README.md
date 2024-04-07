## About Dockerfile 
## building docker image need 2 thing to check

<img src="cpudfile.png">

### Use given httpd.dockerfile to build image and replace pkg variable while building
```
docker build -t ashutest:imgv1 -f httpd.dockerfile --build-arg pkg=ftp  . 
[+] Building 3.0s (5/5) FINISHED                                                                          docker:rancher-desktop
 => [internal] load build definition from httpd.dockerfile                                                                  0.0s
 => => transferring dockerfile: 280B                                                                                        0.0s
 => [internal] load .dockerignore                                                                                           0.0s
 => => transferring context: 2B                                                                                             0.0s
 => [internal] load metadata for docker.io/library/oraclelinux:8.4                                                          0.0s
 => CACHED [1/2] FROM docker.io/library/oraclelinux:8.4                                                                     0.0s
 => CANCELED [2/2] RUN yum install ftp -y                                                           
```

### testing it 

```
 day7 git:(master) ✗ docker run -it --rm  ashutest:imgv1 sh 
/ # env
HOSTNAME=44f899869b85
SHLVL=1
HOME=/root
TERM=xterm
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
/ # 
/ # 
/ # echo $pkg

/ # exit
```

## testing ENV 

```
FROM  --platform=arm64 alpine 
# single cpu archtecture based support is there 
LABEL name="ashutoshh"
LABEL email="ashutoshh@linux.com"
LABEL ostype="oracelinux"
LABEL cputype="arm64"
ARG pkg=httpd
# scope of pkg variable is only in image build time 
# this variable is not available in container 
ENV pkg1=wget
# this variable pkg1 is avaiable in container also 
RUN apk  add  ${pkg1} 

```

### builidng image 

```
docker build -t ashutest:imgv1 -f httpd.dockerfile   .                     
[+] Building 2.9s (6/6) FINISHED                                                                          docker:rancher-desktop
 => [internal] load build definition from httpd.dockerfile                                                                  0.0s
 => => transferring dockerfile: 433B                                                                                        0.0s
 => [internal] load .dockerignore                                                                                           0.0s
 => => transferring context: 2B                                                                                             0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                            0.0s
 => CACHED [1/2] FROM docker.io/library/alpine                                                                              0.0s
 => [2/2] RUN apk  add  wget                                                                                                2.9s
 => exporting to image                                                                                                      0.0s
 => => exporting layers                                                                                                     0.0s
 => => writing image sha256:b60085cf798ecd9fe5e9cd7c906ab03e6f00aeaa46b09c4448f61ce0cac80c85                                0.0s 
 => => naming to docker.io/library/ashutest:imgv1     
```

### creating container for testing it 

```
✗ docker run -it --rm  ashutest:imgv1 sh                 
/ # 
/ # 
/ # env
HOSTNAME=39ead2835227
SHLVL=1
HOME=/root
TERM=xterm
pkg1=wget
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
/ # 
/ # 
/ # 
```
