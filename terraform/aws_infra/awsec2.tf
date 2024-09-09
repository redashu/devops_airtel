provider "aws" {
    region = "ap-south-1" # region name 
    #access_key = ""
    #secret_key = ""
  
}

# creating resource for ec2 

resource "aws_instance" "ashu_ec2" {
    ami = "ami-0e53db6fd757e38c7"
    instance_type = "t2.micro"
    key_name = "ashu-delvex"
    tags_all = {
      "Name" = "ashu-linux-vm" 
    }
    

  
}