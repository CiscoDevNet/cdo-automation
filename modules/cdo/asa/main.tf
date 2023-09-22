data "aws_region" "current" {}

locals {
    asa_port = 443
}

# create ASAv in private subnet
module "terraform-managed-asav-01" {
  source              = "../../asav"
  base_name           = "devnet"
  vpc_id              = var.vpc_id
  public_subnets      = [var.public_subnet_id]
  private_subnets     = [var.private_subnet_id]
  asa_hostname        = var.asa_hostname
  bastion_sg          = var.bastion_sg
  asa_username        = var.asa_username
  asa_password        = var.asa_password
  enable_password     = var.asa_enable_password
  asa_version         = local.asa_version
  asav_instance_size  = local.asav_instance_size
  aws_region          = data.aws_region.current.id
  bastion_public_ip   = var.bastion_ip
  bastion_private_key = var.bastion_private_key
}

# onboard ASAv in private subnet using SDC deployed to the same subnet in 04-sdc-aws.tf 
resource "cdo_asa_device" "example-asa-01" {
  name           = var.asa_hostname
  username       = var.asa_username
  password       = var.asa_password
  socket_address = "${module.terraform-managed-asav-01.mgmt_interface_ip}:${local.asa_port}"

  connector_type = "SDC"
  connector_name = var.sdc_name

  ignore_certificate = true

}