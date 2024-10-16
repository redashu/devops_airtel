### using terraform documentations 

### use terraform validate

```
terraform validate
╷
│ Error: Missing required argument
│ 
│   with aws_instance.name1,
│   on ec2.tf line 39, in resource "aws_instance" "name1":
│   39: resource "aws_instance" "name1" {
│ 
│ "ami": one of `ami,launch_template` must be specified

```
