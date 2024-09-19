# defining variables for aws region 
variable "aws_region_name" {
  type = string
  default = "ap-south-1"
}

variable "my_ami" {
    type = string
    default = "ami-0e53db6fd757e38c7"
    description = "this is my aws ami from mumbai region"
  
}

variable "vm_size" {
  type = string
  default = "t2.micro"
}

variable "vm_count" {
    type = number
    default = 2
    description = "number as input"
  
}