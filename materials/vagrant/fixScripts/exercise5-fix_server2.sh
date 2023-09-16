#!/bin/bash
#add fix to exercise5-server2 here
echo "192.168.60.10 server1" >> /etc/hosts
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
apt update
apt install sshpass

ssh-keygen -t rsa -q -N "" -f ~/.ssh/id_rsa
ssh-keyscan -H server1 >> ~/.ssh/known_hosts

#server2 can ssh to server1

sshpass -p vagrant ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@server1
cp ~/.ssh/id_rsa /home/vagrant/.ssh
chmod 0444 /home/vagrant/.ssh/id_rsa

#server1 to connect to server2
scp -B vagrant@server1:~/.ssh/id_rsa.pub  ~/.ssh/tmp
#cp ~/.ssh/authorized_keys /home/vagrant/.ssh
cat ~/.ssh/tmp >> /home/vagrant/.ssh/authorized_keys
rm ~/.ssh/tmp
