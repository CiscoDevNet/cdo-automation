resource "null_resource" "wait_for_ftdv_to_finish_booting" {
  # If an IP changes, these scripts will run again
  triggers = {
    nodes_ips = aws_network_interface.ftd_mgmt[0].private_ip
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = var.bastion_public_ip
    private_key = var.bastion_private_key
  }

  provisioner "file" {
    source      = "${path.module}/wait_for_ftdv.sh"
    destination = "/tmp/wait_for_ftdv.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/wait_for_ftdv.sh",
      "/tmp/wait_for_ftdv.sh ${aws_network_interface.ftd_mgmt[0].private_dns_name}"
    ]
  }
}