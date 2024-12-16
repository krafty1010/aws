module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.subnet_cidrs
  availability_zones   = var.availability_zones
  region               = var.region
  project              = var.project
}

/*
module "eks" {
  source  = "./modules/eks"
  project = var.project
  #key_name = var.key_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}
*/

module "ec2" {
  count       = var.enable_ec2 ? 1 : 0
  source      = "./modules/ec2"
  project     = var.project
  environment = var.environment
  key_name    = var.key_name

}