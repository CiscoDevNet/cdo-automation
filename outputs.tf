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
  value       = module.terraform-managed-asav-01.mgmt_interface_ip
}