#!/bin/bash

sed -i '/history-search-backward/s/^# //g' /etc/inputrc
sed -i '/history-search-forward/s/^# //g' /etc/inputrc

cat > /etc/ansible/ansible.cfg <<EOF
[defaults]
stdout_callback = debug
hash_behaviour = merge
nocows = 1
[inventory]
enable_plugins = host_list, script, yaml, ini, azure_rm
[diff]
always = yes
[ssh_connection]
pipelining = True
EOF


useradd -d /home/$USERNAME -m -s /bin/bash $USERNAME
usermod -aG sudo $USERNAME

mkdir -p /home/$USERNAME/.ssh
cp -pr /tmp/root/.ssh/* /home/$USERNAME/.ssh/
chmod og-rwx -R /home/$USERNAME
chown $USERNAME:$USERNAME -R /home/$USERNAME
ln -s /tmp/root/.bash_history /home/$USERNAME/.bash_history

#cat > /home/spiridonov/.ssh/config <<EOF
#Host *
#    StrictHostKeyChecking no
#    UserKnownHostsFile=/dev/null
#EOF

su -w SSH_AUTH_SOCK - $USERNAME
echo Bye...
