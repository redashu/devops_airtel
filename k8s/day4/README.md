# devops_airtel

### deploying springboot webapp docker image as pod 

```
kubectl run ashuweb --image=dockerashu/ashuspring:bmoappv1 --port 8
080 --dry-run=client -o yaml >webspring.yml

 humanfirmware@darwin  ~/devops_airtel/k8s/day4   master  kubectl create -f webspring.yml 
pod/ashuweb created

 humanfirmware@darwin  ~/devops_airtel/k8s/day4   master  kubectl get pods
NAME      READY   STATUS              RESTARTS   AGE
ashuweb   0/1     ContainerCreating   0          11s
```

### accessing pod app

<img src="access.png">

### access web app using kubectl port-forward

```
humanfirmware@darwin  ~/Desktop  kubectl get pods        
NAME      READY   STATUS    RESTARTS   AGE
ashuweb   1/1     Running   0          5m42s
 humanfirmware@darwin  ~/Desktop  
 humanfirmware@darwin  ~/Desktop  
 

 ✘ humanfirmware@darwin  ~/Desktop  kubectl port-forward   ashuweb  1234:8080  
Forwarding from 127.0.0.1:1234 -> 8080
Forwarding from [::1]:1234 -> 8080
Handling connection for 1234
Handling connection for 1234
Handling connection for 1234
```

### replacing docker image default process in kubernetes pod 

<img src="process.png">

### using args and command in pod to replace default process

```
kubectl run ashupod2 --image=alpine  ping localhost --dry-run=client -o yaml 
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: ashupod2
  name: ashupod2
spec:
  containers:
  - args:
    - ping
    - localhost
    image: alpine
    name: ashupod2
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
 humanfirmware@darwin  ~/Desktop  kubectl run ashupod2 --image=alpine  --command ping localhost --dry-run=client -o yaml 
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: ashupod2
  name: ashupod2
spec:
  containers:
  - command:
    - ping
    - localhost
    image: alpine

```

### pod tty 

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: ashupod3
  name: ashupod3
spec:
  containers:
  - image: alpine
    name: ashupod3
    tty: true 
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always

```


