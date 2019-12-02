resource "azurerm_managed_disk" "osdisk" {
  name                 = "${var.name}-osdisk"
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = "Standard_LRS"
  create_option        = "FromImage"
  disk_size_gb         = "30"
  image_reference_id   = data.azurerm_platform_image.ubuntu.id
  tags                 = var.common_tags
  os_type = "Linux"
}

data "azurerm_platform_image" "ubuntu" {
  publisher   = var.os_publisher
  offer       = var.os_offer
  sku         = var.os_sku
  location    = var.location
}