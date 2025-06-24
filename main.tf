terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }
}

provider "aws" {
  region = var.region
  profile = var.profile_aws_cli
}

resource "aws_key_pair" "ec2_demo_key_pair" {
  key_name   = var.key_pair_name
  public_key = file(var.key_pair_path)
}

module "networking" {
  source             = "./modules/networking"
  vpc_name           = var.vpc_name
  cidr_block         = var.cidr_block
  availability_zones = var.availability_zones
  public_subnet_ips  = var.public_subnet_ips
  private_subnet_ips = var.private_subnet_ips
  environment        = var.environment
}

module "security" {
  source                 = "./modules/security"
  vpc_id                 = module.networking.vpc_id
  public_sg_name         = var.public_sg_name
  public_sg_description  = var.public_sg_description
  private_sg_name        = var.private_sg_name
  private_sg_description = var.private_sg_description
  app_name               = var.app_name
  private_subnet_ids     = var.private_subnet_ips
}

module "app" {
  source             = "./modules/app"
  key_name           = aws_key_pair.ec2_demo_key_pair.key_name
  ssm_instance_type  = var.ssm_instance_type
  ssm_instance_name  = var.ssm_instance_name
  image_id           = var.os_type == "amazon_linux_2" ? var.amis_amazon_linux_2[var.region] : var.amis_amazon_linux_2023[var.region]
  region             = var.region
  os_type            = var.os_type
  app_name          = var.app_name
  # 
  subnet_ids         = module.networking.public_subnet_ids
  security_group_id  = module.security.app_sg_id
  cluster_name       = var.cluster_name  
}
