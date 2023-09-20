data "aws_region" "current" {}

resource "fmc_access_policies" "fmc_access_policy" {
  name           = "${var.ftd_hostname}-Terraform Access Policy"
  default_action = "block"
}

resource "cdo_ftd_device" "example_ftd" {
  access_policy_name = fmc_access_policies.fmc_access_policy.name
  licenses           = ["BASE"]
  name               = var.ftd_name
  virtual            = true
  performance_tier   = "FTDv5"
}

resource "random_password" "ftd_password" {
  length           = 16
  special          = true
  override_special = "!@"
}

module "terraform_managed_ftdv" {
  source              = "../../ftdv"
  base_name           = "devnet"
  aws_region          = data.aws_region.current.id
  vpc_id              = var.vpc_id
  public_subnets      = [var.public_subnet_id]
  private_subnets     = [var.private_subnet_id]
  bastion_sg          = var.bastion_sg
  ftd_hostname        = var.ftd_name
  ftd_admin_password  = random_password.ftd_password.result
  fmc_reg_key         = cdo_ftd_device.example_ftd.reg_key
  fmc_nat_id          = cdo_ftd_device.example_ftd.nat_id
  fmc_hostname        = data.cdo_cdfmc.current.hostname
  bastion_public_ip   = var.bastion_ip
  bastion_private_key = var.bastion_private_key
}

resource "cdo_ftd_device_onboarding" "example_ftd" {
  depends_on = [module.terraform_managed_ftdv]
  ftd_uid    = cdo_ftd_device.example_ftd.id
}