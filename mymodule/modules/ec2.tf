resource "aws_instance" "my-ec2" {
  ami           = "ami-0f3c9c466bb525749"
  instance_type = "t2.micro"
  # security_groups        = ["aws_security_group.allow_web_tls.name"]
  vpc_security_group_ids = [aws_security_group.allow_web_tls.id]
  tags = {
    Name = "mosalah-ec2-instance"
  }
}



output "public_ip" {
  description = "VMs Public IP"
  value       = aws_instance.my-ec2.public_ip
}

output "private_ip" {
  description = "VMs Private IP"
  value       = aws_instance.my-ec2.private_ip
}

output "host_id" {
  value = aws_instance.my-ec2.host_id
}

output "ec2_attributes" {
  value = "aws_instance.my-ec2"
}

resource "aws_security_group" "allow_web_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0bf4688f1e5ba0001"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}





