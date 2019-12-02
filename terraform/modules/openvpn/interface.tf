
resource "azurerm_network_interface" "main" {
  name                  = "${var.name}-Nic1"
  location              = var.location
  resource_group_name   = var.resource_group
  network_security_group_id = azurerm_network_security_group.nsg.id

  lifecycle {
    prevent_destroy = false
  }

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public.id
    primary                       = true
  }

  tags = var.common_tags
}

resource "azurerm_public_ip" "public" {
    name                         = "${var.name}-publicIP"
    location                     = var.location
    resource_group_name          = var.resource_group
    allocation_method            = "Static"

    tags = var.common_tags
}

output "ip_address" {
  value  = azurerm_public_ip.public.ip_address
}

data "azurerm_subnet" "public" {
  name                 = var.subnet
  virtual_network_name = var.vnet
  resource_group_name  = var.resource_group
}


