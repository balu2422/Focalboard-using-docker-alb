resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  tags = {
    Name = "MyEC2Instance"
  }
}
