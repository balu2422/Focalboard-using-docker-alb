variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
``modules/ec2/main.tf`
```hcl
resource "aws_instance" "web" {
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
  user_data         = var.user_data

  tags = {
    Name = "MyEC2Instance"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}
