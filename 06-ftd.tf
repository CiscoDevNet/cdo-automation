resource "fmc_access_policies" "fmc_access_policy" {
  name           = "Terraform Access Policy"
  default_action = "block"
}

resource "cdo_ftd_device" "example_ftd_01" {
  access_policy_name = fmc_access_policies.fmc_access_policy.name
  licenses           = ["BASE"]
  name               = "example-ftd-01"
  virtual            = true
  performance_tier   = "FTDv5"
}

resource "random_password" "ftd_01_password" {
  length           = 16
  special          = true
  override_special = "!@"
}

module "terraform_managed_ftdv_01" {
  source              = "./modules/ftdv"
  base_name           = "devnet"
  aws_region          = data.aws_region.current.id
  vpc_id              = module.cdo_provider_example_vpc.vpc_id
  public_subnets      = [module.cdo_provider_example_vpc.public_subnet_id]
  private_subnets     = [module.cdo_provider_example_vpc.private_subnet_id]
  bastion_sg          = module.bastion.bastion_sg
  ftd_hostname        = var.ftd_01_hostname
  ftd_admin_password  = random_password.ftd_01_password.result
  fmc_reg_key         = cdo_ftd_device.example_ftd_01.reg_key
  fmc_nat_id          = cdo_ftd_device.example_ftd_01.nat_id
  fmc_hostname        = data.cdo_cdfmc.current.hostname
  bastion_public_ip   = module.bastion.bastion_ip
  bastion_private_key = module.bastion.bastion_private_key
}

resource "cdo_ftd_device_onboarding" "example_ftd_01" {
  ftd_uid = cdo_ftd_device.example_ftd_01.id
}