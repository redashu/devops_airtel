# creating resource for ec2 

resource "aws_instance" "ashu_vm1" {
    ami = "ami-0e53db6fd757e38c7"     # ami-0e53db6fd757e38c7
    instance_type = "t2.micro"
    key_name = "ashu-delvex"
    tags = {
      "Name" = "ashu-linux-vm" 
    }
    security_groups = ["launch-wizard-1","launch-wizard-2"]

  
}