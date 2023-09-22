resource "aws_network_interface" "ftd_mgmt" {
  # 1x management interface, 1x diag interface
  count             = 2
  description       = "${var.base_name}-${var.ftd_hostname}-ftdv-${count.index}-mgmt"
  subnet_id         = var.private_subnets[0]
  source_dest_check = false
  security_groups   = [aws_security_group.mgmt_interface_security_group.id]
}

resource "aws_network_interface" "ftd_outside" {
  description       = "${var.base_name}-${var.ftd_hostname}-ftdv-outside"
  subnet_id         = var.public_subnets[0]
  source_dest_check = false
  security_groups   = [aws_security_group.outside_interface_security_group.id]
}

resource "aws_network_interface" "ftd_inside" {
  description       = "${var.base_name}-${var.ftd_hostname}-ftdv-inside"
  subnet_id         = var.private_subnets[0]
  source_dest_check = false
  security_groups   = [aws_security_group.inside_interface_security_group.id]
}
