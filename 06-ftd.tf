module "ftdv_01_in_cdo" {
  source              = "./modules/cdo/ftd"
  bastion_ip          = module.bastion.bastion_ip
  bastion_private_key = module.bastion.bastion_private_key
  bastion_sg          = module.bastion.bastion_sg
  vpc_id              = module.cdo_provider_example_vpc.vpc_id
  public_subnet_id    = module.cdo_provider_example_vpc.public_subnet_id
  private_subnet_id   = module.cdo_provider_example_vpc.private_subnet_id
  ftd_name            = var.ftd_01_hostname
  cdo_api_token       = var.cdo_api_token
}