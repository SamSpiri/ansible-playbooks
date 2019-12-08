
resource "azurerm_virtual_machine" "main" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.size # az vm list-sizes --location westeurope -o table

//  delete_os_disk_on_termination = false
//  delete_data_disks_on_termination = false

//  storage_image_reference {
//    publisher             = var.os_publisher
//    offer                 = var.os_offer
//    sku                   = var.os_sku
//    version               = var.os_version
//  }

  storage_os_disk {
    create_option = "Attach"
    name = azurerm_managed_disk.osdisk.name
    managed_disk_type = azurerm_managed_disk.osdisk.storage_account_type
    caching = "ReadWrite"
    managed_disk_id = azurerm_managed_disk.osdisk.id
    os_type = "Linux"
  }
//  os_profile {
//    computer_name         = var.name
//    admin_username        = var.os_admin_username
//    //    admin_password        = "${var.os_admin_password}" // DEPRECATED - password based login is disabled by security matters
//  }
//  os_profile_linux_config {
//    disable_password_authentication = true
//    ssh_keys {
//      path     = "/home/${var.os_admin_username}/.ssh/authorized_keys"
//      key_data = var.provisioner_ssh_key_public
//    }
//  }

  lifecycle {
    prevent_destroy = false
  }

  tags = var.common_tags

  provisioner "local-exec" {
    command = "${path.module}/adduser.sh"
    environment = {
      VM_USER = "spiridonov"
      VM_PUB_KEY = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7TnaH2EzW1e2h0kWENXV1BUHV2z93ozws8WtEtc1SsBMPknnhVeV9Bjcg9OGUwM2vUqLFQnVolVjZTzBHfkkZD5I+UcYtd2F08magVv2htSlNhXXPc8ARbTQbIAencnrpeWWLe46SSzT9pbLhaYt6vT0yT/pJIV0MtsOE9y/Sl+7aZwnYpJQuiM/hbMUYew507+JFmV+LZoaPMqMKD3sxuweVgdPKhckSxLdAT4pcESGapdnJeO5xrcQDPsT4sPqutbaEoaCuJaTgGcZePkwIPmHj0p2VO0AOEqk6CBGWEoyJ8PDGDPggD4o2RQTURHWQPGA/tTbJ3GgrMwUg54gRX3igr9Y0x2CK8TmC96rK6b5Ohw2SsR/35g8bJ3OArIK8XDujR0qvsJfGA2gTlUIxdNOGGiY+mmWuBqvFHAsZ9KbaWfkm1p7raRtQ+L7uszLGY4gyyxlzk5vg5Mtn8mUNZjLT+tmlzf5RVEQDMmd37BSl+FSNYJGpQpgwVgYuwae016uRbrTgqTifoL42loDtw4GlobfO5Ibi3DZzqP0IVmVa3qJ2bUn6UB6SITyFIY+Rc1ITIYGeN1vpqYvDpte6bWYFu+kTEBnpnZhgIyjX7wMt3NmXuzkZBN9xcRSuD3eee9gIG+neHE01PM5HLeL8xN5dgHYg7eaNhqUWc4I73w== spiridonov@opuscapita"
      VM_RG = var.resource_group
      VM_NAME = var.name
    }
    interpreter = ["/bin/bash"]
  }
}

