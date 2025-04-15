variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
}

variable "availability_zone1" {
  description = "The availability zone for the first public subnet"
  type        = string
}

variable "availability_zone2" {
  description = "The availability zone for the second public subnet"
  type        = string
}
