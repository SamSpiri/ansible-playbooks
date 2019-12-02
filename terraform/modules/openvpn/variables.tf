variable "resource_group" {}
variable "location" {}
variable "common_tags" {
  type = map(string)
  default = {
    generator   = "TERRAFORM"
    owner       = "Andariel DevOps"
    openvpn     = "server"
  }
}

# VM
variable "os_admin_username" {}
#variable "path_provisioner_ssh_key_private" {}
#variable "path_provisioner_ssh_key_public" {}
variable "provisioner_ssh_key_public" {}
variable "name" { default = "openvpn" }
variable "size" { default = "Standard_B1s"}
variable "os_publisher" { default = "Canonical"}
variable "os_offer" { default = "UbuntuServer"}
variable "os_sku" { default = "19.04"}
variable "os_version" { default = "latest"}

# Public interface
variable "subnet" {}
variable "vnet" {}
