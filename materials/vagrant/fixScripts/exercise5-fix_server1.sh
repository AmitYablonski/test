#!/bin/bash
#add fix to exercise5-server1 here
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
ssh-keygen -t rsa -q -N "" -f ~/.ssh/id_rsa
ssh-keyscan -H server2 >> ~/.ssh/known_hosts
cp ~/.ssh/id_rsa /home/vagrant/.ssh
cp ~/.ssh/id_rsa.pub /home/vagrant/.ssh
chmod 0444 /home/vagrant/.ssh/id_rsa
