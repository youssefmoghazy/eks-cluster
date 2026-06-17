
module "network" {
  source               = "./modules/network"
  vpc_cidr             = var.vpc_cidr vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = var.availability_zones 
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source              = "./modules/eks/"
  subnet_ids = concat(
    aws_subnet.private_subnets[*].id,
    aws_subnet.public_subnets[*].id
  )
}
