resource "cdo_sdc" "sdc-in-vsphere" {
  name = "sdc-in-vsphere"
}

data "cdo_tenant" "current" {}

module "vsphere-cdo-sdc" {
  source               = "CiscoDevNet/cdo-sdc/vsphere"
  version              = "1.0.0"
  vsphere_username     = var.vsphere_username
  vsphere_password     = var.vsphere_password
  vsphere_server       = var.vsphere_server
  datacenter           = var.datacenter
  resource_pool        = var.resource_pool
  cdo_tenant_name      = data.cdo_tenant.current.human_readable_name
  datastore            = var.datastore
  network              = var.network
  host                 = var.host
  allow_unverified_ssl = var.allow_unverified_ssl
  ip_address           = var.ip_address
  gateway              = var.gateway
  cdo_user_password    = var.cdo_user_password
  root_user_password   = var.root_user_password
  cdo_bootstrap_data   = cdo_sdc.sdc-in-vsphere.bootstrap_data
}
