variable "bastion_ip" {
  description = "Specify the IP address of the bastion host."
  type        = string
}

variable "bastion_private_key" {
  description = "Specify the private key to SSH to the bastion host."
  type        = string
  sensitive   = true
}

variable "bastion_sg" {
  description = "Specify the security group used by the bastion host."
  type        = string
}

variable "vpc_id" {
  description = "Specify the VPC to deploy the ASA to."
  type        = string
}

variable "private_subnet_id" {
  description = "Specify the ID of the private subnet to deploy the ASA to."
  type        = string
}

variable "public_subnet_id" {
  description = "Specify the ID of the public subnet to deploy the ASA to."
  type        = string
}

variable "sdc_name" {
  description = "Specify the name of the SDC."
  type        = string
}

variable "asa_hostname" {
  description = "Specify the hostname of your ASAv on AWS."
  type        = string
}
variable "asa_username" {
  description = "Specify the username for your ASAv on AWS."
  type        = string
}

variable "asa_password" {
  description = "Specify the password for your ASAv on AWS."
  type        = string
}

variable "asa_enable_password" {
  description = "Specify the enable password for your ASAv on AWS."
  type        = string
}
