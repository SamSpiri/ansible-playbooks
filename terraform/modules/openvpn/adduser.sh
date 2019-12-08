#!/bin/bash -xe

#VM_USER="spiridonov"
#VM_PUB_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7TnaH2EzW1e2h0kWENXV1BUHV2z93ozws8WtEtc1SsBMPknnhVeV9Bjcg9OGUwM2vUqLFQnVolVjZTzBHfkkZD5I+UcYtd2F08magVv2htSlNhXXPc8ARbTQbIAencnrpeWWLe46SSzT9pbLhaYt6vT0yT/pJIV0MtsOE9y/Sl+7aZwnYpJQuiM/hbMUYew507+JFmV+LZoaPMqMKD3sxuweVgdPKhckSxLdAT4pcESGapdnJeO5xrcQDPsT4sPqutbaEoaCuJaTgGcZePkwIPmHj0p2VO0AOEqk6CBGWEoyJ8PDGDPggD4o2RQTURHWQPGA/tTbJ3GgrMwUg54gRX3igr9Y0x2CK8TmC96rK6b5Ohw2SsR/35g8bJ3OArIK8XDujR0qvsJfGA2gTlUIxdNOGGiY+mmWuBqvFHAsZ9KbaWfkm1p7raRtQ+L7uszLGY4gyyxlzk5vg5Mtn8mUNZjLT+tmlzf5RVEQDMmd37BSl+FSNYJGpQpgwVgYuwae016uRbrTgqTifoL42loDtw4GlobfO5Ibi3DZzqP0IVmVa3qJ2bUn6UB6SITyFIY+Rc1ITIYGeN1vpqYvDpte6bWYFu+kTEBnpnZhgIyjX7wMt3NmXuzkZBN9xcRSuD3eee9gIG+neHE01PM5HLeL8xN5dgHYg7eaNhqUWc4I73w== spiridonov@opuscapita"
#VM_RG=RG_Andariel_Infra
#VM_NAME=openvpn

az vm run-command invoke --command-id RunShellScript -g $VM_RG -n $VM_NAME --scripts "\
useradd -m $VM_USER \
&& mkdir /home/$VM_USER/.ssh \
&& echo '$VM_PUB_KEY' > /home/$VM_USER/.ssh/authorized_keys \
&& chown -R $VM_USER:$VM_USER /home/$VM_USER/.ssh \
&& chmod 600 /home/$VM_USER/.ssh/authorized_keys \
&& chmod 700 /home/$VM_USER/.ssh \
&& echo '$VM_USER ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/$VM_USER \
&& chmod 440 /etc/sudoers.d/$VM_USER"

/usr/bin/python -m azure.cli vm run-command invoke --command-id RunShellScript -g oc_shared_bes_prod2 -n openvpn --scripts "useradd -m spiridonov && mkdir /home/spiridonov/.ssh && echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7TnaH2EzW1e2h0kWENXV1BUHV2z93ozws8WtEtc1SsBMPknnhVeV9Bjcg9OGUwM2vUqLFQnVolVjZTzBHfkkZD5I+UcYtd2F08magVv2htSlNhXXPc8ARbTQbIAencnrpeWWLe46SSzT9pbLhaYt6vT0yT/pJIV0MtsOE9y/Sl+7aZwnYpJQuiM/hbMUYew507+JFmV+LZoaPMqMKD3sxuweVgdPKhckSxLdAT4pcESGapdnJeO5xrcQDPsT4sPqutbaEoaCuJaTgGcZePkwIPmHj0p2VO0AOEqk6CBGWEoyJ8PDGDPggD4o2RQTURHWQPGA/tTbJ3GgrMwUg54gRX3igr9Y0x2CK8TmC96rK6b5Ohw2SsR/35g8bJ3OArIK8XDujR0qvsJfGA2gTlUIxdNOGGiY+mmWuBqvFHAsZ9KbaWfkm1p7raRtQ+L7uszLGY4gyyxlzk5vg5Mtn8mUNZjLT+tmlzf5RVEQDMmd37BSl+FSNYJGpQpgwVgYuwae016uRbrTgqTifoL42loDtw4GlobfO5Ibi3DZzqP0IVmVa3qJ2bUn6UB6SITyFIY+Rc1ITIYGeN1vpqYvDpte6bWYFu+kTEBnpnZhgIyjX7wMt3NmXuzkZBN9xcRSuD3eee9gIG+neHE01PM5HLeL8xN5dgHYg7eaNhqUWc4I73w== spiridonov@opuscapita' > /home/spiridonov/.ssh/authorized_keys && chown -R spiridonov:spiridonov /home/spiridonov/.ssh && chmod 600 /home/spiridonov/.ssh/authorized_keys && chmod 700 /home/spiridonov/.ssh && echo 'spiridonov ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/spiridonov && chmod 440 /etc/sudoers.d/spiridonov"