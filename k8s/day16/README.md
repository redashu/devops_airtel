# devops_airtel

## Understanding CNI and CoreDns

### analogy of k8s 

<img src="ns1.png">

### creating pod with same name in diff namespace 

```
kubectl get pods
No resources found in ashu-space namespace.
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl  run ashupod1 --image=nginx 
pod/ashupod1 created
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl get pods                    
NAME       READY   STATUS              RESTARTS   AGE
ashupod1   0/1     ContainerCreating   0          2s
 humanfirmware@darwin  ~/devops_airtel/k8s   master  
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl  run ashupod1 --image=nginx -n default 
pod/ashupod1 created
 humanfirmware@darwin  ~/devops_airtel/k8s   master  
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl get pods -n default                    
NAME       READY   STATUS              RESTARTS   AGE
ashupod1   0/1     ContainerCreating   0          6s
```

### checking ip address 

```
kubectl get pods -o wide
NAME       READY   STATUS    RESTARTS   AGE    IP            NODE                   NOMINATED NODE   READINESS GATES
ashupod1   1/1     Running   0          2m4s   10.42.0.180   lima-rancher-desktop   <none>           <none>
 humanfirmware@darwin  ~/devops_airtel/k8s   master  
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl get pods -o wide -n default 
NAME       READY   STATUS    RESTARTS   AGE    IP            NODE                   NOMINATED NODE   READINESS GATES
ashupod1   1/1     Running   0          2m5s   10.42.0.181   lima-rancher-desktop   <none>           <none>
 humanfirmware@darwin  ~/devops_airtel/k8s   master  


```

### understnadign coreDNS domain 

<img src="coredns.png">

### checking pod entry 

```

 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl  exec -it ashupod1  -- bash 
root@ashupod1:/# cat  /etc/resolv.conf 
nameserver 10.43.0.10
search ashu-space.svc.cluster.local svc.cluster.local cluster.local
options ndots:5
root@ashupod1:/# 
```

### connecting pod from differnet namespace 

```
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl  run pod1 --image=alpine --command sleep 1000 -n default 
pod/pod1 created
 humanfirmware@darwin  ~/devops_airtel/k8s   master  
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl  get po -n default 
NAME       READY   STATUS              RESTARTS   AGE
ashupod1   1/1     Running             0          15m
pod1       0/1     ContainerCreating   0          6s
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl exec -it pod1 -- sh -n default 
Error from server (NotFound): pods "pod1" not found
 ✘ humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl -n default exec -it pod1 -- sh  
/ # 
/ # culr 
sh: culr: not found
/ # curl
sh: curl: not found
/ # wget
BusyBox v1.36.1 (2024-06-10 07:11:47 UTC) multi-call binary.

Usage: wget [-cqS] [--spider] [-O FILE] [-o LOGFILE] [--header STR]
        [--post-data STR | --post-file FILE] [-Y on/off]
        [-P DIR] [-U AGENT] [-T SEC] URL...

Retrieve files via HTTP or FTP

        --spider        Only check URL existence: $? is 0 if exists
        --header STR    Add STR (of form 'header: value') to headers
        --post-data STR Send STR using POST method
        --post-file FILE        Send FILE using POST method
        -c              Continue retrieval of aborted transfer
        -q              Quiet
        -P DIR          Save to DIR (default .)
        -S              Show server response
        -T SEC          Network read timeout is SEC seconds
        -O FILE         Save to FILE ('-' for stdout)
        -o LOGFILE      Log messages to FILE
        -U STR          Use STR for User-Agent header
        -Y on/off       Use proxy
/ # wget  http://s1
^C
/ # wget  http://s1.ashu-space.svc.cluster.local
Connecting to s1.ashu-space.svc.cluster.local (10.43.170.223:80)
saving to 'index.html'
index.html           100% |*********************************************************************************|   615  0:00:00 ETA
'index.html' saved
/ # 
```

### coreDns is running in kube-system namespace

```
     RESTARTS         AGE
helm-install-traefik-7qlxj                0/1     Completed   1                84d
helm-install-traefik-crd-lwblc            0/1     Completed   0                84d
svclb-traefik-37f7ecb0-dl956              2/2     Running     18 (7d16h ago)   84d
traefik-f4564c4f4-qpvgb                   1/1     Running     9 (7d16h ago)    84d
coredns-6799fbcd5-7f5dq                   1/1     Running     9 (7d16h ago)    84d
local-path-provisioner-6c86858495-gltq2   1/1     Running     19 (7d16h ago)   84d
metrics-server-54fd9b65b-2zwvl            1/1     Running     19 (7d16h ago)   84d
 humanfirmware@darwin  ~/devops_airtel/k8s   master  kubectl get svc -n kube-system 
NAME                                 TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)                        AGE
kube-dns                             ClusterIP      10.43.0.10      <none>         53/UDP,53/TCP,9153/TCP         84d
metrics-server                       ClusterIP      10.43.248.228   <none>         443/TCP                        84d
prometheus-kube-prometheus-kubelet   ClusterIP      None            <none>         10250/TCP,10255/TCP,4194/TCP   16d
traefik                              LoadBalancer   10.43.211.253   192.168.5.15   80:31631/TCP,443:32605/TCP     84d
 humanfirmware@darwin  ~/devops_airtel/k8s   master  


```