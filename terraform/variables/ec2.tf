# creating resource for ec2 

resource "aws_instance" "ashu_vm1" {
    ami = var.my_ami   # ami-0e53db6fd757e38c7
    instance_type = var.vm_size
    key_name = "ashu-delvex"
    #count = var.vm_count  # 0 , 1, 2 
    tags = {
      "Name" = "ashu-linux-vm" 
    }
    security_groups = ["launch-wizard-1","launch-wizard-2"]

  
}