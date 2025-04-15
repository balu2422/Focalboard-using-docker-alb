resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group_id = var.security_group_id
  user_data     = var.user_data

  tags = {
    Name = "MyEC2Instance"
  }
}
