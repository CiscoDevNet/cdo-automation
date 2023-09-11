module "bastion" {
  source    = "./modules/bastion"
  subnet_id = module.cdo_provider_example_vpc.public_subnet_id
  vpc_id    = module.cdo_provider_example_vpc.vpc_id
}