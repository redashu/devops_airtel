# devops_airtel
### building java code 
```
code-demos git:(master) ✗ ls
Dockerfile          hello.java          hello.py            javacode.dockerfile
➜  code-demos git:(master) ✗ docker build -t ashujdk:v1  -f javacode.dockerfile . 
[+] Building 41.3s (4/8)                                                                            docker:rancher-desktop
 => [internal] load .dockerignore                                                                                     0.0s
 => => transferring context: 2B                                                                                       0.0s
 => [internal] load build definition from javacode.dockerfile                                                         0.0s
 => => transferring dockerfile: 201B                                                                                  0.0s
 => [internal] load metadata for docker.io/library/ope
```

### testing code by creating temp container 

```
  day6 git:(master) docker run -it --rm 04e5fa794aea
Hello World welcome to docker
Hello World welcome to docker
Hello World welcome to docker
^C%                        
```
