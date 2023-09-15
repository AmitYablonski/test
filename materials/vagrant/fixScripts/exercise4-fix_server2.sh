#!/bin/bash
#add fix to exercise4-server2 here
echo "192.168.60.10 server1" >> /etc/hosts
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
