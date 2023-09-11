# CDO
variable "cdo_base_url" {
  description = "The base CDO URL. This is the URL you enter when logging into your CDO account."
  validation {
    condition     = contains(["https://www.defenseorchestrator.com", "https://www.defenseorchestrator.eu", "https://apj.cdo.cisco.com"], var.cdo_base_url)
    error_message = "Specify a valid CDO URL"
  }
  type = string
}

variable "cdo_api_token" {
  description = "The API token used to authenticate with CDO. [See here](https://docs.defenseorchestrator.com/c_api-tokens.html#!t-generatean-api-token.html) to learn how to generate an API token."
  type        = string
  sensitive   = true
}

# AWS
variable "aws_region" {
  description = "The AWS region to deploy the CDO-created resources to."
}

# ASA
variable "asa_01_hostname" {
  description = "Specify the hostname of your ASAv on AWS."
  type        = string
}
variable "asa_01_username" {
  description = "Specify the username for your ASAv on AWS."
  type        = string
}

variable "asa_01_password" {
  description = "Specify the password for your ASAv on AWS."
  type        = string
}

variable "asa_01_enable_password" {
  description = "Specify the enable password for your ASAv on AWS."
  type        = string
}