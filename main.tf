provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "security_groups" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id = module.vpc.public_subnet_id
  security_group_ids = [module.security_groups.ec2_sg_id]
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              docker run -d -p 8080:80 -e OPENPROJECT_SECRET_KEY_BASE=secret -e OPENPROJECT_HTTPS=false openproject/openproject:15
              EOF
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  subnet_ids = [module.vpc.public_subnet_id]
  security_group_ids = [module.security_groups.alb_sg_id]
  target_instance_ids = [module.ec2.instance_id]
}
