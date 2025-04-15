variable "cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  description = "The CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for the second public subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone1" {
  description = "The availability zone for the first public subnet"
  default     = "us-east-1a"
}

variable "availability_zone2" {
  description = "The availability zone for the second public subnet"
  default     = "us-east-1b"
}
