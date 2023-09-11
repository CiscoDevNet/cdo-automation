resource "tls_private_key" "rsa_keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "rsa_keypair" {
  key_name   = "cdo-provider-example-bastion-rsa-keypair"
  public_key = tls_private_key.rsa_keypair.public_key_openssh
}