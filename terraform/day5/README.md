## Terraform variables 

## replace variable values

```
7859  terraform destroy --auto-approve
 7860  terraform validate
 7861  terraform plan 
 7862  terraform plan  -out myplan.tfstate
 7863  ls
 7864  cat myplan.tfstate
 7865  ls
 7866  cat terraform.tfstate
 7867  terraform plan 
 7868  terraform plan -var "vm_size=t2.small"
 7869  terraform plan -var="vm_size=t2.small"
```

## we can apply variable values during plan and apply 

### reading variables values from file 

```
terraform apply  -var-file=1.tfvars
```

### 1.tfvars

```
vm_size = "t2.small"
my_ami = "ami-0e53db6fd757e38c7"
```