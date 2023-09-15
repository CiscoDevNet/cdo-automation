resource "aws_instance" "ftdv" {
  ami           = data.aws_ami.ftdv.id
  instance_type = var.ftdv_instance_size
  key_name      = aws_key_pair.rsa_keypair.id
  metadata_options {
    http_endpoint = "enabled"
  }
  root_block_device {
    encrypted = true
  }
  network_interface {
    network_interface_id = aws_network_interface.ftd_mgmt[0].id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.ftd_mgmt[1].id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.ftd_outside.id
    device_index         = 2
  }
  network_interface {
    network_interface_id = aws_network_interface.ftd_inside.id
    device_index         = 3
  }
  user_data = data.template_file.ftd_startup_file.rendered
  tags = {
    Name = "${var.base_name}-${var.ftd_hostname}-cisco-ftdv"
  }

  lifecycle {
    ignore_changes = [ami]
  }
}
