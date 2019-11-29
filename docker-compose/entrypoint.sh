#!/bin/bash



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
