variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "vpc_name" {
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

# 

variable "key_pair_path" {
  type = string
  default = "./keypair/ec2_demo_key.pub"
  description = "Path to the keypair to use"
}

variable "key_pair_name" {
  type = string
  default = "ec2_demo_key_pair"
  description = "Name of the keypair to use"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Type of EC2 instance to create"
}

variable "instance_name" {
  type = string
  default = "ec2_demo_instance"
  description = "Name of the EC2 instance to create"
}

variable "amis" {
  type = map(string)
  default = {
    # 02c7683e4ca3ebf58 : Ubuntu
    # 0435fcf800fb5418d : Amazon Linux 2023 (Free)
    # 01030bb0f9b7640ac : Amazon Linux 2 (Free)
    "ap-southeast-1" = "ami-0435fcf800fb5418d" 
    "ap-northeast-1" = "ami-054400ced365b82a0"
  }
  description = "Map of AMIs to use for each region"
}

variable "amis_ubuntu" {
  type = map(string)
  default = {
    # 02c7683e4ca3ebf58 : Ubuntu
    "ap-southeast-1" = "ami-02c7683e4ca3ebf58" 
    "ap-northeast-1" = "ami-054400ced365b82a0"
  }
  description = "Map of AMIs to use for each region"
}

variable "amis_amazon_linux_2023" {
  type = map(string)
  default = {
    # 0435fcf800fb5418d : Amazon Linux 2023 (Free)
    "ap-southeast-1" = "ami-0435fcf800fb5418d" 
    "ap-northeast-1" = "ami-054400ced365b82a0"
  }
  description = "Map of AMIs to use for each region"
}

variable "amis_amazon_linux_2" {
  type = map(string)
  default = {
    # 01030bb0f9b7640ac : Amazon Linux 2 (Free)
    "ap-southeast-1" = "ami-01030bb0f9b7640ac" 
    "ap-northeast-1" = "ami-054400ced365b82a0"
  }
  description = "Map of AMIs to use for each region"
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

# 

variable "app_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "ssm_instance_type" {
  type = string
  default = "t2.micro"
}

variable "ssm_instance_name" {
  type = string
  default = "ssm_ec2_demo_instance"
}
variable "enable_ssm_endpoints" {
  description = "Whether to create the VPC interface endpoints for SSM"
  type        = bool
  default     = true
}

# 

variable "db_instance_name" {}
variable "db_name" {}
variable "db_engine_version" { default = "17.5" }
variable "db_instance_class" { default = "db.t3.micro" }
variable "db_allocated_storage" { default = 20 }

variable "db_username" {}
variable "db_password" {}

# 

variable "os_type" {
  description = "Loại OS của EC2: ubuntu hoặc amazon"
  type        = string
  default     = "ubuntu"
}

variable "profile_aws_cli" {
  type = string
}

# 

variable "cluster_name" {
  type = string
}