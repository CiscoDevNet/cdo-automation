output "mgmt_intf_dns_name" {
  description = "The DNS name of the management interface in the private subnet."
  value       = aws_network_interface.ftd_mgmt[0].private_dns_name
}