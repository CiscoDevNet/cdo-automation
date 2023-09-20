# Create AWS VPC to deploy the CDO resources to. Disable this by setting `var.create_resources_in_aws` to false.
module "cdo_provider_example_vpc" {
  source = "./modules/aws_vpc"
}