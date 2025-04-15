variable "ami" {
  description = "The AMI ID"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID"
  type        = string
}

variable "user_data" {
  description = "The user data script"
  type        = string
}
