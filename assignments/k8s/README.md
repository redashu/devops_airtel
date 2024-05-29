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