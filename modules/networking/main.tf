module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name = var.vpc_name
  cidr = var.cidr_block

  azs             = var.availability_zones
  public_subnets  = var.public_subnet_ips
  private_subnets = var.private_subnet_ips

  # nếu dùng assign_public_ip = true ở aws_ecs_service.nginx
  map_public_ip_on_launch = true

  enable_nat_gateway = false
  enable_vpn_gateway = false 
  enable_dns_support   = true
  enable_dns_hostnames = true 

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}
