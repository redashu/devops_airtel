## Terraform task 1 

```
1. create ec2 instances with rhel 9 and t2.micro type 
2. make sure you are using security group of default but also add inbound rule to allow port 80,443 as well
3. make sure you are creating a key pair and using that key pair while lanching instance
4. make sure ec2 instance is having EIP 
```


### Terraform task 2 

```
1. create a single variable in terraform and store ec2 details like , ami , size , key_name etc 
2. make sure you have used tfvars concept to pass data / try without tfvars as well 
3. make sure you are getting vm instance id and public ip after apply 
4. make public ip is getting stored in file called public_ip.txt in current location of terraform code 

```

### Terraform task 3 

```
1. create ec2 instance and one security group also a public and private key 
2. in security group allow 22 and 80 port 
3. write a shell script to setup httpd server 
4. use above shell script to install in ec2 using remote provisioner 
5. store public and private ip in a single file 
6. make sure you are using your own private key while creating ec2 the one you created above

```

