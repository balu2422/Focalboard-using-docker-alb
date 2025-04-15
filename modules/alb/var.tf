variable "subnet_ids" {
  description = "The IDs of the subnets"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group"
}

variable "vpc_id" {
  description = "The ID of the VPC"
}
