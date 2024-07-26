### Setting current namespace

```
kubectl config set-context --current --namespace ashu-app
Context "rancher-desktop" modified.
 humanfirmware@darwin  ~  
 humanfirmware@darwin  ~  kubectl  get  all
No resources found in ashu-app namespace.
 humanfirmware@darwin  ~  


```

### deploy Db 

```
ubectl create -f db.yaml                                                                   
deployment.apps/d1 created
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl get deploy
NAME   READY   UP-TO-DATE   AVAILABLE   AGE
d1     0/1     1            0           4s

====>
kubectl get po              
NAME                 READY   STATUS    RESTARTS   AGE
d1-76cf95794-7bwvk   1/1     Running   0          40s

```

### testing db 

```
kubectl get po
NAME                 READY   STATUS    RESTARTS   AGE
d1-76cf95794-7bwvk   1/1     Running   0          71s
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl  exec -it d1-76cf95794-7bwvk  -- bash 
bash-5.1# 
bash-5.1# 
bash-5.1# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.39 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| airteldb           |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> exit;
Bye
bash-5.1# exit
exit
```

## using secrets to store details 

```
ubectl create  secret generic ashu-root-cred  --from-literal myrootpass=Redhat@1234567 --dry-run=client -oyaml
apiVersion: v1
data:
  myrootpass: UmVkaGF0QDEyMzQ1Njc=
kind: Secret
metadata:
  creationTimestamp: null
  name: ashu-root-cred
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl create  secret generic ashu-root-cred  --from-literal myrootpass=Redhat@1234567 --dry-run=client -oyaml >rootsec.yaml
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl create -f rootsec.yaml 
secret/ashu-root-cred created
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl get secrets
NAME             TYPE     DATA   AGE
ashu-root-cred   Opaque   1      4s
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  


```

### storing db name as configmap details 

```
kubectl create configmap   ashu-db-name  --from-literal  dbname=airteldb --dry-run=client -o yaml
apiVersion: v1
data:
  dbname: airteldb
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: ashu-db-name
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl create configmap   ashu-db-name  --from-literal  dbname=airteldb --dry-run=client -o yaml >dbnamecm.yaml 
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl create -f dbnamecm.yaml 
configmap/ashu-db-name created
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl get configmaps 
NAME               DATA   AGE
kube-root-ca.crt   1      23d
ashu-db-name       1      5s
```

### lets store mysql user and password in secret as well

```
kubectl create  secret generic ashu-user-cred  --from-file mysqlusers.txt --dry-run=client -o yaml
apiVersion: v1
data:
  mysqlusers.txt: TVlTUUxfVVNFUj1hc2h1Ck1ZU1FMX1BBU1NXT1JEPUFzaHVAMDk4cXdlcg==
kind: Secret
metadata:
  creationTimestamp: null
  name: ashu-user-cred
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl create  secret generic ashu-user-cred  --from-file mysqlusers.txt --dry-run=client -o yaml >us
ercreds.yml


 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl create -f usercreds.yml 
secret/ashu-user-cred created
 humanfirmware@darwin  ~/devops_airtel/k8s/day18   master  kubectl get secrets 
NAME             TYPE     DATA   AGE
ashu-root-cred   Opaque   1      9m43s
ashu-user-cred   Opaque   1      3s
```
### lets udpate db deployment file to use configmap  and secret 

```
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: d1
  name: d1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: d1
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: d1
    spec:
      containers:
      - image: mysql:8.0
        name: mysql
        ports:
        - containerPort: 3306
        resources: {}
        env: 
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:  # reading data from k8s secret 
            secretKeyRef:
              name: ashu-root-cred # name of secret 
              key: myrootpass # key of secret 
        - name: MYSQL_DATABASE
          valueFrom:
            configMapKeyRef: # reading value from CM 
              name: ashu-db-name # name of CM 
              key: dbname # key of CM 
        envFrom: 
        - secretRef:
           name: ashu-user-cred
        

status: {}

```

