
module "network" {
  source               = "./modules/network"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = var.availability_zones 
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source              = "./modules/eks/"
  private_subnet_ids = module.network.private_subnet_ids
  public_subnet_ids  = module.network.public_subnet_ids

}
