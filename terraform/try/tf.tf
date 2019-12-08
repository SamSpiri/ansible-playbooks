module "openvpn" {
  source = "../modules/openvpn"
  name = "openvpn"
  location = "westeurope"
  resource_group = "oc_shared_bes_prod2"
  os_admin_username = "spiridonov"
  provisioner_ssh_key_public = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7TnaH2EzW1e2h0kWENXV1BUHV2z93ozws8WtEtc1SsBMPknnhVeV9Bjcg9OGUwM2vUqLFQnVolVjZTzBHfkkZD5I+UcYtd2F08magVv2htSlNhXXPc8ARbTQbIAencnrpeWWLe46SSzT9pbLhaYt6vT0yT/pJIV0MtsOE9y/Sl+7aZwnYpJQuiM/hbMUYew507+JFmV+LZoaPMqMKD3sxuweVgdPKhckSxLdAT4pcESGapdnJeO5xrcQDPsT4sPqutbaEoaCuJaTgGcZePkwIPmHj0p2VO0AOEqk6CBGWEoyJ8PDGDPggD4o2RQTURHWQPGA/tTbJ3GgrMwUg54gRX3igr9Y0x2CK8TmC96rK6b5Ohw2SsR/35g8bJ3OArIK8XDujR0qvsJfGA2gTlUIxdNOGGiY+mmWuBqvFHAsZ9KbaWfkm1p7raRtQ+L7uszLGY4gyyxlzk5vg5Mtn8mUNZjLT+tmlzf5RVEQDMmd37BSl+FSNYJGpQpgwVgYuwae016uRbrTgqTifoL42loDtw4GlobfO5Ibi3DZzqP0IVmVa3qJ2bUn6UB6SITyFIY+Rc1ITIYGeN1vpqYvDpte6bWYFu+kTEBnpnZhgIyjX7wMt3NmXuzkZBN9xcRSuD3eee9gIG+neHE01PM5HLeL8xN5dgHYg7eaNhqUWc4I73w== spiridonov@opuscapita"
  subnet = "mgmt"
  vnet = "bespr2-vnet"
}

output "ip_address" {
  value  = module.openvpn.ip_address
}