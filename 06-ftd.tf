
# resource "cdo_ftd_device" "example-ftd-01" {
  
# }

# module "terraform-managed-ftdv-01" {
#     source = "./modules/ftdv"
#     base_name = "devnet"
#     aws_region = data.aws_region.current.id
#     vpc_id = module.cdo_provider_example_vpc.vpc_id
#     public_subnets      = [module.cdo_provider_example_vpc.public_subnet_id]
#     private_subnets     = [module.cdo_provider_example_vpc.private_subnet_id]
#     bastion_sg = module.bastion.bastion_sg
#     ftd_hostname = "ftdv-01"
    
# }