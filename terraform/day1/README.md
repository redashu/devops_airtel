## Understanding problem of cloud infra creation 

<img src="prob1.png">

### Understanding terraform 

<img src="terraform1.png">

### Basic info about Hashicorp 

<img src="hash1.png">


### Terraform as compiler understanding 

<img src="tf1.png">

## workflow of terraform for aws 

### using access and secret key 

<img src="tf2.png">

### Terraform providers 

<img src="tfpr.png">

### Installing terraform  

[clicK_here](https://developer.hashicorp.com/terraform/install)

### Installing on Mac 

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

===> verifty 
terraform -v
Terraform v1.9.5
on darwin_arm64

```

### Installing on Linux 

```
 wget https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip

 unzip terraform_1.9.5_linux_amd64.zip 
Archive:  terraform_1.9.5_linux_amd64.zip
  inflating: LICENSE.txt             
  inflating: terraform   

[root@ip-172-31-84-50 ~]# ls
LICENSE.txt  terraform  terraform_1.9.5_linux_amd64.zip

===> verify 

[root@ip-172-31-84-50 ~]# terraform -v
Terraform v1.9.5
on linux_amd64

[root@ip-172-31-84-50 ~]# terraform -version 
Terraform v1.9.5
on linux_amd64

[root@ip-172-31-84-50 ~]# terraform --version 
Terraform v1.9.5
on linux_amd64

```






