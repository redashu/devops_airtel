variable "vm_image" {
  type = string
  default = "ami-0e53db6fd757e38c7"
}

variable "instance_size" {
    type = string
    default = "t2.micro"
  
}

# when we use count in tf --it create a variable index {count.index}