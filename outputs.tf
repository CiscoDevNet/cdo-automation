output "bastion_instance_id" {
  value = module.bastion.bastion_instance_id
}

output "bastion_private_key" {
  value     = module.bastion.bastion_private_key
  sensitive = true
}

output "bastion_public_ip" {
  value = module.bastion.bastion_ip
}

output "asa_01_mgmt_interface_ip" {
  description = "IP of the management interface of example asa-01"
  value       = module.asav_01_in_cdo.asa_mgmt_interface_ip
}

output "ftd_01_password" {
  description = "The value of the password for the admin user for the FTD ftd-01."
  value       = module.ftdv_01_in_cdo.ftd_password
  sensitive   = true
}

output "ftd_01_mgmt_dns" {
  description = "The management interface DNS for the FTD ftd-01."
  value       = module.ftdv_01_in_cdo.ftd_mgmt_dns
}
