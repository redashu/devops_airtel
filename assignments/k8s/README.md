# devops_airtel

### Use below given code and build - test -push docker image using compose and docker cli

- take code from this link https://github.com/redashu/java-springboot.git
- use compose to build and test
- push this image to docker hub 

### setup k8s 
- using rancher desktop in local machine 
- using kubeadm in ec2 vm (take 2 vms)

## creating pods with given condition

### pod1 task 
- create a pod with name hellpod1 
- make sure you are using alpine image
- choose some process in image so that container must run forever
- check logs of container and store in a file in your local machine named logs1.txt 

### pod2 task 

 -  1. Create pod named  <yourname>pod1
 -  2. In POd docker image will be busybox 
 -  3. choose ping fb.com as default process
 -  4. check output of default process and store in a file  called logs.txt in client machine 
 -  5. now transfer logs.txt on your pods under /opt/logs.txt 
 -  6. check that pods is scheduled in which minion node and store that name in logs.txt inside pod 
 -  7. make sure previous data in logs.txt must be present 

 ### pod task 3 

 - create a new docker image using some sample webapp 
 - use nginx as based and build image 
 - push this docker image to docker hub  and ECR as private registry 
 - now deploy these image as pod in k8s

### Deployment task 

- create Dockerfile with some sample webapp code 
- build docker image and push it  aws ECR make sure image is private
- now deployment ecr image to local rancher k8s using deployment controller with 3 replica of pod
- create nodeport service and try to access that application

### lets upgrade app
- changes something in your webapp and rebuild , push image to ECR
- now do something so that application can be upgraded to new version

### Create below given things 

- build any webapp based docker image and push it to ECR 
- create a yaml file called common.yaml deploy it using kubectl 
- when you deploy above yaml file it must create below given things 
    *** - It must create a namespace call yourname-ns
    *** - IT must create deployment using above image which you have pushed 
    *** - It must create Nodeport service with 31009 as nodePort 

