provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet2_cidr = var.public_subnet2_cidr
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = module.vpc.public_subnet1_id
  security_group_id = module.security_groups.ec2_security_group_id
  user_data = var.user_data
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  subnet_ids = [module.vpc.public_subnet1_id, module.vpc.public_subnet2_id]
  security_group_id = module.security_groups.alb_security_group_id
  target_instance_id = module.ec2.instance_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet1_id" {
  value = module.vpc.public_subnet1_id
}

output "public_subnet2_id" {
  value = module.vpc.public_subnet2_id
}

output "ec2_security_group_id" {
  value = module.security_groups.ec2_security_group_id
}

output "alb_security_group_id" {
  value = module.security_groups.alb_security_group_id
}
