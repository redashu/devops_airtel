resource "aws_instance" "ashuvm1" {
    ami =  var.my_ami
    instance_type = var.vm_size
    key_name = "ashu-delvex"
    #count = var.vm_count  # 0 , 1, 2 
    tags = {
      "Name" = "ashu-linux-vm" 
    }
    security_groups = ["launch-wizard-1","launch-wizard-2"]
    provisioner "remote-exec" {
        # write all commands line by line to execute on remoteserver
      inline = [ 
        "sudo yum install httpd -y ",
        "echo hello >/tmp/index.html",
        "sudo cp /tmp/index.html /var/www/html/",
        "sudo systemctl enable --now  httpd"
       ]
       connection {
         type = "ssh"
         user = "ec2-user"
         timeout = "2m"
         host = self.public_ip
         private_key = file("/Users/humanfirmware/Downloads/ashu-delvex.pem")
       }
    }

  
}