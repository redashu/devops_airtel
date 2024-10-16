output "instanceip" {
    value = aws_instance.ashuvm[0].public_ip
  
}

output "instanceip1" {
    value = aws_instance.ashuvm[1].public_ip
    
  
}