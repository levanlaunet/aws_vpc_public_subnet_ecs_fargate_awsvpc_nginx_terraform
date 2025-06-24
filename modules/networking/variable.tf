variable "vpc_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_ips" {
  type = list(string)
}

variable "private_subnet_ips" {
  type = list(string)
}
