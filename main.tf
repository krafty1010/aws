module "vpc_module" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.subnet_cidrs
  availability_zones   = var.availability_zones
  region               = var.region
  project              = var.project
}