#!/bin/bash

#Bootstrapping basic software. Not all i needed on all nodes but KISS!
sudo apt-get update
sudo apt-get install dkms openssh-server samba nfs-kernel-server nfs-common vsftpd iperf nginx 

#Make sure we can ssh without passwords
ssh-keygen -t rsa
ssh-copy-id root@localhost #and other hosts.

cat > /etc/hosts <<EOL
192.168.200.2 hostA
192.168.200.1 hostB
192.168.201.2 hostC
EOL

echo 1 > /proc/sys/net/ipv4/ip_forward

