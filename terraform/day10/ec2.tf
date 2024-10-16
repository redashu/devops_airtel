
data "aws_security_group" "name1" {
  id = "sg-03c2cb2d2168832ab"
}

# refering vpc 
data "aws_vpc" "name1" {
    id = "vpc-0b50404076d0a2ed9"
  
}

# creating security group in vpc 
resource "aws_security_group" "allow_http" {
    name = "ashu-web-traffic"
    description = "this group will allow http protocol"
    vpc_id = data.aws_vpc.name1.id
    tags = {
      "Name" = "ashu-sec-group111"
    }
   
}
## egrees rule for above security gropu 
resource "aws_vpc_security_group_egress_rule" "allallow" {
    security_group_id = aws_security_group.allow_http.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
  
}
# ingress rule 
resource "aws_vpc_security_group_ingress_rule" "http_allow" {
    security_group_id = aws_security_group.allow_http.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
    from_port = 80
    to_port = 80 
  
}

resource "aws_instance" "ashuvm" {
    availability_zone = "ap-south-1b"
    vpc_security_group_ids = [data.aws_security_group.name1.id,aws_security_group.allow_http.id]
    instance_type = var.instance_size
    ami = var.vm_image
    count = 2
    key_name = "ashu-delvex"
    tags = {
      "Name" = "ashuvm-bytf-${count.index}"
    }
  
}