module "asav_01_in_cdo" {
  source              = "./modules/cdo/asa"
  bastion_ip          = module.bastion.bastion_ip
  bastion_private_key = module.bastion.bastion_private_key
  bastion_sg          = module.bastion.bastion_sg
  vpc_id              = module.cdo_provider_example_vpc.vpc_id
  public_subnet_id    = module.cdo_provider_example_vpc.public_subnet_id
  private_subnet_id   = module.cdo_provider_example_vpc.private_subnet_id
  sdc_name            = module.sdc_aws.sdc_name
  asa_username        = var.asa_01_username
  asa_password        = var.asa_01_password
  asa_enable_password = var.asa_01_enable_password
  asa_hostname        = var.asa_01_hostname
}
