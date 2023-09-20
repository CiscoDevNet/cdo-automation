terraform {
  required_providers {
    cdo = {
      source = "CiscoDevnet/cdo"
    }

    fmc = {
      source  = "CiscoDevNet/fmc"
      version = "1.4.0"
    }
  }
}

data "cdo_cdfmc" "current" {
}

provider "fmc" {
  fmc_host          = data.cdo_cdfmc.current.hostname
  is_cdfmc          = true
  cdo_token         = var.cdo_api_token
  cdfmc_domain_uuid = data.cdo_cdfmc.current.domain_uuid
}
