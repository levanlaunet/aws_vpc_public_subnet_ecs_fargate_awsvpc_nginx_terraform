variable "vpc_id" {
  type = string
}

# 

variable "app_name" {
  type = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

# 

variable "public_sg_name" {
  type = string
  default = "public_security_group"
}

variable "public_sg_description" {
  type = string
  default = "public_security_group_dec"
}

variable "private_sg_name" {
  type = string
  default = "private_security_group"
}

variable "private_sg_description" {
  type = string
  default = "private_security_group_dec"
}

variable "private_subnet_ids" {
  type = list(string)
}


