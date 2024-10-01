## Terraform state file status list 

### How many resource are there in terraform.tfstate

```
terraform state list
aws_instance.ashu_vm1[0]
 humanfirmware@darwin  ~/devops_airtel/terraform/variables   master ±  

```

### we can print details using show 

```
terraform state show 'aws_instance.ashu_vm1[0]'
# aws_instance.ashu_vm1[0]:
resource "aws_instance" "ashu_vm1" {
    ami                                  = "ami-0e53db6fd757e38c7"
    arn                                  = "arn:aws:ec2:ap-south-1:992382386705:instance/i-078b20fbc70553899"
    associate_public_ip_address          = true
    availability_zone                    = "ap-south-1a"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false

```
