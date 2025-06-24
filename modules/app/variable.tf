
variable "key_name" {
  type = string
  description = "name of the keypair to use for the instance"
  nullable = false
}

variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}

# 

variable "ssm_instance_type" {
  type = string
  default = "t2.micro"
}

variable "ssm_instance_name" {
  type = string
  default = "ssm_ec2_demo_instance"
}

variable "region" {
    type = string
}

variable "os_type" {
  description = "Loại OS của EC2: ubuntu hoặc amazon"
  type        = string
  default     = "ubuntu"
}

# 

variable "cluster_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "app_name" {
  type = string
}