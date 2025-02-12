module "vpc" {
  source               = "./modules/vpc"
  project              = var.project
  region               = var.region
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.subnet_cidrs
  availability_zones   = var.availability_zones
}

module "eks" {
  count              = var.enable_eks ? 1 : 0
  source             = "./modules/eks"
  project            = var.project
  region             = var.region
  environment        = var.environment
  vpc            = module.vpc.vpc
  private_subnets = module.vpc.private_subnets
  eks_instance_type = var.eks_instance_type
}