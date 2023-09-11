resource "aws_instance" "bastion" {
  instance_type               = var.bastion_instance_type
  ami                         = data.aws_ami.bastion_host.id
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.rsa_keypair.id
  iam_instance_profile        = aws_iam_instance_profile.lab-iam-profile.id
  tags = {
    Name : "cdo-provider-example-bastion",
    instanceType : "bastion",
    Service : "lab"
  }
}
