output "ftd_password" {
  description = "The value of the password for the admin user for the FTD ftd-01."
  value       = random_password.ftd_password.result
  sensitive   = true
}

output "ftd_mgmt_dns" {
  description = "The management interface DNS for the FTD ftd-01."
  value       = module.terraform_managed_ftdv.mgmt_intf_dns_name
}
