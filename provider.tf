terraform {
  required_providers {
    cdo = {
      source  = "CiscoDevnet/cdo"
      version = "0.6.1"
    }

    fmc = {
      source = "CiscoDevNet/fmc"
      version = "1.4.0"
    }

    # OPTIONAL: comment this out if you do not want to use Terraform to spin up an SDC in vSphere
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }

    # OPTIONAL: comment this out if you do not want to use Terraform to spin up an SDC and ASAv in AWS
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.4.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }

  required_version = ">= 1.3"
}

provider "cdo" {
  base_url  = var.cdo_base_url
  api_token = var.cdo_api_token
}

data "cdo_cdfmc" "current" {
}

provider "fmc" {
  fmc_host = data.cdo_cdfmc.current.hostname
  is_cdfmc = true
  cdo_token = var.cdo_api_token
  cdfmc_domain_uuid = data.cdo_cdfmc.current.domain_uuid
}

# uncomment this out if you do not want to use Terraform to spin up an SDC and ASAv in vSphere
provider "vsphere" {
  user           = var.vsphere_username
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # if you have a self-signed cert
  allow_unverified_ssl = var.allow_unverified_ssl
}

provider "aws" {
  region = var.aws_region
}

provider "tls" {}