module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = var.vpc_name
  cidr = var.vpc_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch

  azs             = var.azs
  public_subnets  = var.public_subnets
  # private_subnets = local.private_subnets
  intra_subnets   = var.intra_subnets
  
  enable_nat_gateway = var.enable_nat_gateway

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  # private_subnet_tags = {
  #   "kubernetes.io/role/internal-elb" = 1
  # }
}