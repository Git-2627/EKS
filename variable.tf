variable "name" {}
variable "region" {}
variable "vpc_cidr" {}
variable "azs" {}
variable "public_subnets" {}


variable "private_subnets" {}
variable "intra_subnets" {}
variable "instance_types" {}



variable "effect" {}
variable "type" {}
variable "eks_identifiers" {}
variable "ng_identifiers" {}
variable "actions" {}

variable "node_group_name" {}
variable "desired_size" {}
variable "max_size" {}
variable "min_size" {}
variable "max_unavailable" {}

variable "vpc_name" {}
variable "map_public_ip_on_launch" {}
variable "enable_nat_gateway" {}

