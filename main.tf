resource "aws_instance" "my-ec2" {
  ami           = "ami-0f3c9c466bb525749"
  instance_type = "t2.micro"
  tags = {
    Name = "mosalah-ec2-instance"
  }
}

resource "aws_eip" "my-eip" {
  vpc = true
}


resource "aws_eip_association" "associate" {
  instance_id   = aws_instance.my-ec2.id
  allocation_id = aws_eip.my-eip.id

}
