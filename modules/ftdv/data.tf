data "aws_availability_zones" "available" {}

data "aws_ami" "ftdv" {
  owners      = ["aws-marketplace"]
  most_recent = true

  filter {
    name   = "name"
    values = ["*${var.ftd_version}*"]
  }

  filter {
    name   = "product-code"
    values = ["a8sxy6easi2zumgtyr564z6y7"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "template_file" "ftd_startup_file" {
  template = file("${path.module}/ftd_startup_file.txt")
  vars = {
    ftd_hostname = var.ftd_hostname
  }
}
