output "asa_mgmt_interface_ip" {
  description = "IP of the management interface of example asa-01"
  value       = module.terraform-managed-asav-01.mgmt_interface_ip
}