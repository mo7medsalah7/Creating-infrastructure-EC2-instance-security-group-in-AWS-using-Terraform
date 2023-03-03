resource "aws_instance" "my-ec2"{
    ami="ami-0f3c9c466bb525749"
    instance_type="t2.micro"
    tags = {
        Name = "mosalah-ec2-instance"
    }
}
