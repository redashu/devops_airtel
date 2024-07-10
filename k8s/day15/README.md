# devops_airtel

### deploy two tier webapp 

<img src="app2.png">

### creating db deployment 

```
kubectl  create  deployment ashudb --image=mysql --port 3306 --dry-run=client -o yaml >db.yaml 

```

### Creating generic secret for storing db root password 

```
kubectl  create secret 
Create a secret with specified type.

 A docker-registry type secret is for accessing a container registry.

 A generic type secret indicate an Opaque secret type.

 A tls type secret holds TLS certificate and its associated key.

Available Commands:
  docker-registry   Create a secret for use with a Docker registry
  generic           Create a secret from a local file, directory, or literal value
  tls               Create a TLS secret

Usage:
  kubectl create secret (docker-registry | generic | tls) [options]

Use "kubectl create secret <command> --help" for more information about a given command.
Use "kubectl options" for a list of global command-line options (applies to all commands).
 ✘ humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl  create secret generic dbroot-cred --from-literal dbpass=Redhat@1
23 --dry-run=client -o yaml 
apiVersion: v1
data:
  dbpass: UmVkaGF0QDEyMw==
kind: Secret
metadata:
  creationTimestamp: null
  name: dbroot-cred

  ====>>
  kubectl create -f rootsecret.yaml 
secret/dbroot-cred created
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl get secret 
NAME          TYPE     DATA   AGE
dbroot-cred   Opaque   1      4s
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  


```

###  creating service for Db deployemnt 

```
kubectl get deploy
NAME     READY   UP-TO-DATE   AVAILABLE   AGE
ashudb   1/1     1            1           103s
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl  expose deployment ashudb --type ClusterIP --port 3306 --name dblb 
 --dry-run=client -o yaml  >dbsvc.yml 
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl create -f dbsvc.yml 
service/dblb created
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl  get svc
NAME   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
dblb   ClusterIP   10.43.211.232   <none>        3306/TCP   3s
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  
```

### creating service of web

```
kubectl  expose deployment ashuweb --type NodePort --port 8080  --name webslb1 --dry-run=client  -o yaml >svcweb.yml
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl create -f svcweb.yml 
service/webslb1 created
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl get svc
NAME      TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
dblb      ClusterIP   10.43.211.232   <none>        3306/TCP         3m35s
webslb1   NodePort    10.43.181.98    <none>        8080:30965/TCP   3s
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  
                                                                                                                                            
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl get po 
NAME                      READY   STATUS    RESTARTS   AGE
ashudb-fc6845f69-wk4k8    1/1     Running   0          6m8s
ashuweb-7fb5c5999-jzsbg   1/1     Running   0          84s
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  kubectl get  svc
NAME      TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
dblb      ClusterIP   10.43.211.232   <none>        3306/TCP         4m21s
webslb1   NodePort    10.43.181.98    <none>        8080:30965/TCP   49s
 humanfirmware@darwin  ~/devops_airtel/k8s/day15   master ±  
```

