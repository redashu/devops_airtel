# checking current status of vm 

output "ashu_vm1_status" {
    value = aws_instance.ashu_vm1.instance_state
  
}

output "vm_publicIP" {
    value = aws_instance.ashu_vm1.public_ip
  
}