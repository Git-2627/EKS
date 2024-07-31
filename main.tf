module "vpc" {
  source             = "./Modules/vpc"
  # region             = var.region
  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  intra_subnets      = var.intra_subnets
  enable_nat_gateway = var.enable_nat_gateway
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

module "iam" {
  source = "./Modules/iam"
  effect = var.effect
  type  = var.type
  ng_identifiers = var.ng_identifiers
  eks_identifiers = var.eks_identifiers 
  actions = var.actions
}

module "eks" {
  source = "./Modules/eks"
  name    = var.name
  role_arn = module.iam.eks_role_arn
  public_subnets = module.vpc.public_subnets
}
module "nodegroup" {
  source = "./Modules/nodegroup"
  node_group_name = var.node_group_name
  instance_types  = var.instance_types
  desired_size    = var.desired_size
  max_size        = var.max_size
  min_size        = var.min_size
  max_unavailable = var.max_unavailable
  cluster_name = module.eks.name
  iam_role = module.iam.ng_role_arn
  public_subnets = module.vpc.public_subnets
}