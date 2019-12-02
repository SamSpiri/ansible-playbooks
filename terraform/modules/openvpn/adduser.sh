#!/bin/bash -xe
az vm run-command invoke --command-id RunShellScript -g $VM_RG -n $VM_NAME --scripts "\
useradd -m $VM_USER \
&& mkdir /home/$VM_USER/.ssh \
&& echo "$VM_PUB_KEY" > /home/$VM_USER/.ssh/authorized_keys \
&& chown -R $VM_USER:$VM_USER /home/$VM_USER/.ssh \
&& chmod 600 /home/$VM_USER/.ssh/authorized_keys \
&& chmod 700 /home/$VM_USER/.ssh \
&& echo '$VM_USER ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/$VM_USER \
&& chmod 440 /etc/sudoers.d/$VM_USER"