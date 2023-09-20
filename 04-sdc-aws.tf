module "sdc_aws" {
  source    = "./modules/cdo/sdc-aws"
  vpc_id    = module.cdo_provider_example_vpc.vpc_id
  subnet_id = module.cdo_provider_example_vpc.private_subnet_id
}