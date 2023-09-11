data "aws_region" "current" {}

# create ASAv in private subnet
module "terraform-managed-asav-01" {
  source              = "./modules/asav"
  base_name           = "devnet"
  vpc_id              = module.cdo_provider_example_vpc.vpc_id
  public_subnets      = [module.cdo_provider_example_vpc.public_subnet_id]
  private_subnets     = [module.cdo_provider_example_vpc.private_subnet_id]
  asa_hostname        = "example-asa-01"
  bastion_sg          = module.bastion.bastion_sg
  asa_username        = var.asa_01_username
  asa_password        = var.asa_01_password
  enable_password     = var.asa_01_enable_password
  asa_version         = local.asa_version
  asav_instance_size  = local.asav_instance_size
  aws_region          = data.aws_region.current.id
  bastion_public_ip   = module.bastion.bastion_ip
  bastion_private_key = module.bastion.bastion_private_key
}

# onboard ASAv in private subnet using SDC deployed to the same subnet in 03-sdc-aws.tf 
resource "cdo_asa_device" "example-asa-01" {
  name           = var.asa_01_hostname
  username       = var.asa_01_username
  password       = var.asa_01_password
  socket_address = "${module.terraform-managed-asav-01.mgmt_interface_ip}:443"

  connector_type = "SDC"
  connector_name = cdo_sdc.sdc-in-aws.name

  ignore_certificate = true

}