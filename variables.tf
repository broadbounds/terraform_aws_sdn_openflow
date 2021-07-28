variable "aws_region" {
  description = "The AWS region to create our infrastructure"
  default     = "us-east-2"
}

variable "AZ_1" {
  description = "Availability zone 1"
  default = "use2-az1"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default = "192.168.0.0/16"
}

variable "public_subnet_1_CIDR" {
  description = "Public Subnet AZ 1 CIDR"
  default = "192.168.1.0/24"
}

variable "private_subnet_1_CIDR" {
  description = "Private Subnet AZ 1 CIDR"
  default = "192.168.10.0/24"
}

variable "ec2_type" {
  description = "The type of ec2 instances to create"
  default = "t2.micro"
}

variable "ec2_ami" {
  description = "The ami image to use for ec2 instances (Ubuntu 16.04)"
  default = "ami-0e4edb3648cd12c6b"
}

variable "access_key" {
  type        = string
  default     = ""
}

variable "secret_key" {
  type        = string
  default     = ""
}

variable "cloudmapper_access_key" {
  type        = string
  default     = ""
}

variable "cloudmapper_secret_key" {
  type        = string
  default     = ""
}

variable "aws_account_name" {
  type        = string
  default     = ""
}

variable "aws_account_id" {
  type        = string
  default     = ""
}

variable "public_key_name" {
  type        = string
  default     = "ssh_public_key"
}

variable "private_key_name" {
  type        = string
  default     = "ssh_private_key"
}

variable "inventory_file" {
  type        = string
  default     = "inventory.ini"
}

variable "key_path" {
  type        = string
  default     = "/var/lib/jenkins/.ssh/"
}
