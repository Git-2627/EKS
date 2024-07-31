  region = "us-east-2"
  name   = "shweta-cluster"
  vpc_cidr = "10.123.0.0/16"
  vpc_name = "EKS-VPC"
  azs      = ["us-east-2a", "us-east-2b"]
  public_subnets = ["10.123.1.0/24", "10.123.2.0/24"]
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"]
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24"]
  instance_types = ["t2.micro"]
  map_public_ip_on_launch = true
  enable_nat_gateway = false

  effect = "Allow"
  type = "Service"
  eks_identifiers = ["eks.amazonaws.com"]
  ng_identifiers = ["ec2.amazonaws.com"]
  actions = ["sts:AssumeRole"] 

  node_group_name = "shweta-ng"
  desired_size = 1
  max_size = 2
  min_size = 1
  max_unavailable = 1




 


